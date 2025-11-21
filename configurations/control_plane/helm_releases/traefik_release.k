import kcl_common.schemas.fluxcd_helm_controller.models.v2.helm_toolkit_fluxcd_io_v2_helm_release as fluxcd_release
import manifests

manifests.yaml_stream([
    fluxcd_release.HelmRelease {
        metadata.name = "traefik"
        metadata.namespace = "traefik"
        spec = {
            interval = "10m"
            chart = {
                spec = {
                    chart = "traefik"
                    version = "21.2.0"
                    sourceRef = {
                        kind = "HelmRepository"
                        name = "traefik"
                        namespace = "traefik"
                    }
                }
            }
            install = {
                createNamespace = True
            }
        }
    }
])
