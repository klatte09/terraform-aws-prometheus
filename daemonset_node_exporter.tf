resource "kubernetes_daemon_set_v1" "node-exporter" {
  metadata {
    name      = "node-exporter"
    namespace = "monitoring"
  }

  spec {
    selector {
      match_labels = {
        name = "node-exporter"
      }
    }

    template {
      metadata {
        labels = {
          name = "node-exporter"
        }
      }

      spec {
        container {
          name  = "node-exporter"
          image = "quay.io/prometheus/node-exporter:v1.1.0"

          args = [
            "--path.procfs=/host/proc",
            "--path.sysfs=/host/sys",
          ]

          port {
            name          = "metrics"
            container_port = 9100
          }

          volume_mount {
            name      = "proc"
            mount_path = "/host/proc"
            read_only  = true
          }

          volume_mount {
            name      = "sys"
            mount_path = "/host/sys"
            read_only  = true
          }
        }

        volume {
          name = "proc"
          host_path {
            path = "/proc"
          }
        }

        volume {
          name = "sys"
          host_path {
            path = "/sys"
          }
        }
      }
    }
  }
}
