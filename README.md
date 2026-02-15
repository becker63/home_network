# home-network (control plane development repo)

Experimental infrastructure control plane built with KCL, Crossplane, FluxCD, and Python-based schema + testing automation.

This repository represents the development iteration that preceded the static-control-plane project. It contains the full Python automation layer, CRD ingestion pipeline, test harnesses, and reproducible dev environment used to build the control plane architecture.

---

## What It Does

- Implements a Crossplane pipeline-mode composition for provisioning:
  - Custom NixOS DigitalOcean image
  - Droplet creation
  - DNS domain + records
- Deploys FluxCD, Crossplane, Traefik, cert-manager, and Infisical via HelmRelease resources.
- Generates KCL schemas dynamically from upstream CRDs.
- Generates typed Python models from CRDs using Cloudcoil.
- Executes KCL files programmatically via the KCL API.
- Validates FRP client/server configs using native `frpc verify` and `frps verify`.
- Runs structural pytest tests across KCL modules.
- Synthesizes rendered YAML artifacts automatically.
- Provides a fully reproducible Nix flake development environment.

This repo combines infrastructure definition, schema generation, and test automation into a single reproducible workflow.

---

## Architecture Overview

```
                ┌──────────────────────────┐
                │      Nix Dev Shell       │
                │ (Python + Go + KCL + CI) │
                └────────────┬─────────────┘
                             │
         ┌───────────────────┼────────────────────┐
         ▼                   ▼                    ▼
  CRD Fetch + Import   Cloudcoil Model Gen   KCL Schema Gen
         │                   │                    │
         └──────────────┬────┴─────┬─────────────┘
                        ▼          ▼
                    KCL Compositions
                        │
                        ▼
                  Rendered YAML
                        │
                        ▼
                   pytest Harness
                        │
                        ▼
                FRP Native Validation
```

Flow:

1. Fetch upstream CRDs.
2. Import CRDs into KCL schemas.
3. Generate typed Python models from CRDs.
4. Execute KCL programmatically via API.
5. Validate structure + semantics via pytest.
6. Optionally apply via Flux to cluster.

---

## Crossplane Composition (DigitalOcean)

Implements a full pipeline-mode composition:

- `image.k` → creates custom DigitalOcean image.
- `droplet.k` → waits for image readiness, provisions Droplet.
- `vps_dns.k` → waits for Droplet IP, provisions domain + A records.

Each function:

- Reads observed composed resources (OCDS).
- Emits new resources conditionally.
- Avoids external scripting during reconciliation.

Demonstrates dependency-aware infrastructure generation inside Crossplane.

---

## Python Automation Layer

This repository contains a significant Python automation surface:

### CRD Ingestion Pipeline

- `fetch_crds.py` downloads upstream CRDs.
- `kcl import -m crd` generates KCL schemas.
- `cloudcoil_model_gen.py` generates typed Python models.
- Custom transformation rules patch ObjectMeta types.
- Parallel model generation using ProcessPoolExecutor.

### KCL Execution Engine

- Wraps `kcl_lib` API.
- Maintains singleton execution context.
- Supports programmatic execution + overrides.
- Exposes structured YAML/JSON results.

### Testing Framework

- Custom pytest test factory for KCL file discovery.
- Named file grouping for multi-file tests.
- Structural validation of rendered manifests.
- Partial resource matching via Cloudcoil models.
- Native FRP config validation via subprocess.
- Optional KUTTL-based cluster tests.

Infrastructure code is treated as executable and testable.

---

## Reproducible Development Environment

Built using Nix flakes:

- uv2nix-based Python environment
- Pinned Kubernetes tooling
- Kind cluster bootstrap
- Flux CLI
- Crossplane CLI
- KCL toolchain
- Pre-commit secret scanning
- Buck-like automation via Justfile

Running:

```bash
nix develop
```

Provides a fully configured cluster-aware development shell.

---

## Tech Stack

- Kubernetes
- Crossplane (pipeline mode)
- DigitalOcean Provider (Upjet)
- KCL
- FluxCD
- Traefik
- cert-manager
- Infisical
- FRP (frpc / frps)
- Python 3.13
- pytest
- Cloudcoil
- Nix flakes
- uv2nix
- Kind
- KUTTL
- Go (schema generation)

---

## Why This Is Interesting

This project demonstrates:

- Crossplane pipeline-mode composition with dependency-aware resource emission.
- Programmatic execution of KCL via its Python API.
- Automated CRD ingestion → schema generation → typed model generation.
- Structural infrastructure testing with partial resource matching.
- Native validation of generated external system configurations (FRP).
- Fully reproducible dev environment across Python, Go, Kubernetes, and KCL.

It is a development lab for control plane automation, not just a collection of YAML files.

---

## Development

Enter the dev shell:

```bash
nix develop
```

Run tests:

```bash
pytest
```

Regenerate CRDs:

```bash
fetch_crds
```

All tooling is pinned and reproducible.
