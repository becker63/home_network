import kcl_common.schemas.fluxcd_helm_controller.models.v2.helm_toolkit_fluxcd_io_v2_helm_release as fluxcd_release 
import manifests 

manifests.yaml_stream([
fluxcd_release.HelmRelease {
  metadata.name = "crossplane"
  metadata.namespace = "crossplane-system"

  spec = {
    interval = "10m"
    chart = {
      spec = {
        chart = "crossplane"
        version = "1.17.3"
        sourceRef = {
          kind = "HelmRepository"
          name = "crossplane"
          namespace = "crossplane-system"
        }
      }
    }
    install = {
      createNamespace = True
    }
  }
}
])