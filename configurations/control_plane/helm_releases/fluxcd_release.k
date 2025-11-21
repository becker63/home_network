import kcl_common.schemas.fluxcd_helm_controller.models.v2.helm_toolkit_fluxcd_io_v2_helm_release as fluxcd_release
import manifests

manifests.yaml_stream([
    fluxcd_release.HelmRelease {
        metadata.name = "fluxcd"
        metadata.namespace = "flux-system"
        spec = {
            interval = "10m"
            chart = {
                spec = {
                    chart = "flux2"
                    version = "2.10.0"
                    sourceRef = {
                        kind = "HelmRepository"
                        name = "fluxcd"
                        namespace = "flux-system"
                    }
                }
            }
            install = {
                createNamespace = True
            }
            values = {
                installCRDs = True
            }
        }
    }
])
