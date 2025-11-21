emit = option(key="emit_non_kubernetes", type='bool', default="False", required=False)

# Emit the object if emit_non_kubernetes flag is true, else emit nothing, this helps us be more explicit about non kubernetes resources.
not_k8s = lambda cfg: [any] -> [any] {
    [cfg] if emit else []
}
