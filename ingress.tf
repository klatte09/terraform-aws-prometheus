resource "kubernetes_ingress_v1" "node-exporter" {
  metadata {
    name = "node-exporter"
    namespace = "monitoring"
    annotations = {
        "kubernetes.io/ingress.class" = "alb"
        "alb.ingress.kubernetes.io/scheme" = "internet-facing"
    }
  }

  spec {
    rule {
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "node-exporter"
              port { 
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
















# resource "kubernetes_ingress_v1" "node-exporter" {
#   wait_for_load_balancer = true

#   metadata {
#     name      = "node-exporter"
#     namespace = "monitoring"
#   }



#   spec {
#     rule {
#       http {
#         path {
#           backend {
#             service {
#               name = "node-exporter"
#               port {
#                 number = 9100
#               }
#             }
#           }

#           path = "/node"
#         } 

    # backend {
    #   service {
    #     name = "node-exporter"         
    #     port {
    #       number = 9100
    #     }
    #   }
    # }
#       }
# }
# }

# }
