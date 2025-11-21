import kcl_common.schemas.custom.go.frp_schema.frps as Server
import manifests
import kcl_common.helpers.emit_only_k8s as emiter

serverconfig = Server.ServerConfig {
    version: "v0.62.1"
    auth: Server.AuthServerConfig {
        token: "OVERWRITEME!"
    }
    bindAddr: "0.0.0.0"
    bindPort: 7000
    log: Server.LogConfig {
        level: "info"
        maxDays: 7
    }
    transport: Server.ServerTransportConfig {
        heartbeatTimeout: 60
    }
    detailedErrorsToClient: True
}

manifests.yaml_stream(emiter.not_k8s([serverconfig]))
