import kcl_common.schemas.fluxcd_source_controller.models.v1.source_toolkit_fluxcd_io_v1_git_repository as fluxcd
import kcl_common.schemas.fluxcd_kustomize_controller.models.v1 as kustomize
import k8s.apimachinery.pkg.apis.meta.v1 as meta
import manifests

# GitRepository: watches the full repo
fluxrepo = fluxcd.GitRepository {
    metadata = meta.ObjectMeta {
        name = "home-network"
        namespace = "flux-system"
    }
    spec = {
        url = "https://github.com/becker63/home-network"
        interval = "1m"
        ref = {
            branch = "main"
        }
    }
}

# Kustomization: only applies manifests from ./synth_yaml
fluxkust = kustomize.Kustomization {
    metadata = meta.ObjectMeta {
        name = "apply-synth"
        namespace = "flux-system"
    }
    spec = {
        interval = "1m"
        sourceRef = {
            kind = "GitRepository"
            name = "home-network"
        }
        path = "./synth_yaml"
        prune = True
        targetNamespace = "default"
    }
}

manifests.yaml_stream([fluxrepo, fluxkust])
