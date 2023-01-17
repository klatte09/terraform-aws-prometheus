resource "kubernetes_service_v1" "node-exporter" {
  metadata {
    name      = "node-exporter"
    namespace = "monitoring"
  }
  spec {
    selector = {
      name = "node-exporter"
    }
    port {
      name        = "http"
      port        = 80
      target_port = 9100
      node_port   = 30001
    }
    type = "NodePort"
  }
}





