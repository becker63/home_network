package main

import (
	"context"
	"encoding/json"
	"fmt"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"time"

	"github.com/invopop/jsonschema"

	argov1 "github.com/argoproj/argo-cd/v2/pkg/apis/application/v1alpha1"
	frpv1 "github.com/fatedier/frp/pkg/config/v1"
)

type SchemaTarget struct {
	Dir             string            // Directory to output schema to
	Filename        string            // Schema filename
	Example         interface{}       // Go struct to reflect into JSON Schema
	PatchProperties map[string]string // Map of "Schema.Property" -> patch type (e.g., "array<any>")
}

func generateSchema(filepath string, example interface{}, patch map[string]string) error {
	schema := jsonschema.Reflect(example)

	rawBytes, err := json.Marshal(schema)
	if err != nil {
		return fmt.Errorf("marshal schema: %w", err)
	}

	var normalized map[string]interface{}
	if err := json.Unmarshal(rawBytes, &normalized); err != nil {
		return fmt.Errorf("unmarshal deduplication: %w", err)
	}

	// Support both $defs (JSON Schema 2020-12) and definitions (older drafts)
	defsKey := "$defs"
	if _, ok := normalized["definitions"]; ok {
		defsKey = "definitions"
	}

	defs, ok := normalized[defsKey].(map[string]interface{})
	if !ok {
		return fmt.Errorf("could not find definitions under %q", defsKey)
	}

	// 🔧 Apply patches using Schema.Property format
	for patchPath, patchType := range patch {
		parts := strings.Split(patchPath, ".")
		if len(parts) != 2 {
			fmt.Fprintf(os.Stderr, "⚠️ Invalid patch key format (use Schema.Property): %q\n", patchPath)
			continue
		}
		schemaName := parts[0]
		propName := parts[1]

		targetSchema, ok := defs[schemaName].(map[string]interface{})
		if !ok {
			fmt.Fprintf(os.Stderr, "⚠️ Schema %q not found\n", schemaName)
			continue
		}

		props, ok := targetSchema["properties"].(map[string]interface{})
		if !ok {
			fmt.Fprintf(os.Stderr, "⚠️ Schema %q has no properties\n", schemaName)
			continue
		}

		switch patchType {
		case "any":
			props[propName] = map[string]interface{}{}
		case "array<any>":
			props[propName] = map[string]interface{}{
				"type":  "array",
				"items": map[string]interface{}{},
			}
		case "object<any>":
			props[propName] = map[string]interface{}{
				"type":                 "object",
				"additionalProperties": map[string]interface{}{},
			}
		default:
			fmt.Fprintf(os.Stderr, "⚠️ Unknown patch type: %s for %s\n", patchType, patchPath)
		}
	}

	file, err := os.Create(filepath)
	if err != nil {
		return fmt.Errorf("create file: %w", err)
	}
	defer file.Close()

	encoder := json.NewEncoder(file)
	encoder.SetIndent("", "  ")
	if err := encoder.Encode(normalized); err != nil {
		return fmt.Errorf("write schema: %w", err)
	}
	return nil
}

func runCommand(name string, args []string, dir string) error {
	fmt.Printf("🚀 Running: %s %v in %s\n", name, args, dir)
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	cmd := exec.CommandContext(ctx, name, args...)
	cmd.Dir = dir
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	if err := cmd.Run(); err != nil {
		return fmt.Errorf("command %s %v failed: %w", name, args, err)
	}
	return nil
}

func runKCLModInit(dir string) error {
	return runCommand("kcl", []string{"mod", "init"}, dir)
}

func runKCLImport(schemaFile, dir string) error {
	return runCommand("kcl", []string{"import", "-m", "jsonschema", schemaFile, "--force"}, dir)
}

func removeMainK(dir string) error {
	mainK := filepath.Join(dir, "main.k")
	if err := os.Remove(mainK); err != nil && !os.IsNotExist(err) {
		return fmt.Errorf("remove main.k: %w", err)
	}
	return nil
}

func ensureDir(dir string) error {
	return os.MkdirAll(dir, 0755)
}

func handleSchema(target SchemaTarget) error {
	fmt.Printf("📦 Starting %s...\n", target.Dir)

	fmt.Println("🔧 ensureDir")
	if err := ensureDir(target.Dir); err != nil {
		return err
	}

	fmt.Println("🔧 runKCLModInit")
	if err := runKCLModInit(target.Dir); err != nil {
		return err
	}

	fmt.Println("🔧 removeMainK")
	if err := removeMainK(target.Dir); err != nil {
		return err
	}

	fmt.Println("🧬 generateSchema")
	schemaPath := filepath.Join(target.Dir, target.Filename)
	if err := generateSchema(schemaPath, target.Example, target.PatchProperties); err != nil {
		return err
	}

	fmt.Println("📥 runKCLImport")
	if err := runKCLImport(target.Filename, target.Dir); err != nil {
		return err
	}

	fmt.Printf("✅ Done with %s\n", target.Dir)
	return nil
}

func main() {
	targets := []SchemaTarget{
		{
			Dir:      "frp_schema/frpc",
			Filename: "frpcschema.json",
			Example:  &frpv1.ClientConfig{},
			PatchProperties: map[string]string{
				"ClientConfig.proxies":  "array<any>",
				"ClientConfig.visitors": "array<any>",
			},
		},
		{
			Dir:      "frp_schema/frps",
			Filename: "frpsschema.json",
			Example:  &frpv1.ServerConfig{},
		},
		{
			Dir:      "frp_schema/frpc/tcp_proxy",
			Filename: "tcp_proxy.schema.json",
			Example:  &frpv1.TCPProxyConfig{},
		},
		{
			Dir:      "argo-cmp",
			Filename: "cmpschema.json",
			Example:  &argov1.ConfigManagementPlugin{},
		},
	}

	for _, target := range targets {
		if err := handleSchema(target); err != nil {
			fmt.Fprintf(os.Stderr, "❌ Error generating %s: %v\n", target.Dir, err)
		}
	}
}
