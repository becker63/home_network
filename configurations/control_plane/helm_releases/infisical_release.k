import kcl_common.schemas.fluxcd_helm_controller.models.v2.helm_toolkit_fluxcd_io_v2_helm_release as fluxcd_release
import manifests

manifests.yaml_stream([
    fluxcd_release.HelmRelease {
        metadata.name = "infisical-secrets-operator"
        metadata.namespace = "infisical"
        spec = {
            interval = "10m"
            chart = {
                spec = {
                    chart = "secrets-operator"
                    version = "0.1.0"
                    sourceRef = {
                        kind = "HelmRepository"
                        name = "infisical"
                        namespace = "infisical"
                    }
                }
            }
            install = {
                createNamespace = True
            }
        }
    }
])
