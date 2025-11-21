import kcl_common.schemas.digitalocean.models.v1alpha1.custom_digitalocean_crossplane_io_v1alpha1_image as imageExport
import kcl_common.schemas.digitalocean.models.v1alpha1.droplet_digitalocean_crossplane_io_v1alpha1_droplet as drop
import configurations.control_plane.digitalocean_config.vars as globalvars
import k8s.apimachinery.pkg.apis.meta.v1
import manifests
import kcl_common.helpers.kclrun as helpers

_ocds = option("params").ocds
image_resource: imageExport.Image = _ocds[globalvars.steps.droplet]?.Resource
image_raw = image_resource?.status?.atProvider?.slug
maybe_imageName = image_raw if helpers.is_defined(image_raw) else None

_out_droplet: [drop.Droplet | any] = []

if maybe_imageName:
    _droplet = drop.Droplet {
        metadata = v1.ObjectMeta {
            name = "nixos-frps-droplet"
        }
        spec = {
            forProvider = {
                name = "nixos-frps-droplet"
                region = globalvars.shared.region
                size = "s-1vcpu-1gb"
                imageRef = {
                    name = maybe_imageName
                }
                monitoring = True
                ipv6 = False
                tags = ["crossplane", "nixos", "frps", "custom"]
            }
            providerConfigRef = {
                name = "default"
            }
        }
    }

    _out_droplet = [_droplet]

manifests.yaml_stream(_out_droplet)
