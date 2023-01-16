# terraform-aws-template

[![Lint Status](https://github.com/tothenew/terraform-aws-template/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-template/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-template)](https://github.com/tothenew/terraform-aws-template/blob/master/LICENSE)

This is a template to use for baseline. The default actions will provide updates for section bitween Requirements and Outputs.

The following content needed to be created and managed:
 - Introduction
     - Explaination of module
       - Terraform Modules: 
               - # This Terraform modules are just for references feel free to use any other configurations
               - List of resources created by terraform modules:
                 1. VPC and Subnet with all the configuration
                 2. EKS cluster with all nodes configuration
                 3. AWS managed prometheous workspace
                 4. Required IAM Role/Policy and EC2 instance with node exporter confgiured using user data 
       - k8s Modules:
               - cAdvisor for pod level metrics
               - Grafana with 2 dashborad one for Pod level another for Node level metrics
               - 
     - Intended users
 - Resource created and managed by this module
 - Example Usages

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.36 |

## Providers

Provider Used are:
1. kubernetes provider
2. aws provider


## Modules

No modules.

## Resources

Terraform resources like:
  1. kubernetes_ingress_v1
  2. kubernetes_daemonset_v1
  3. kubernetes_service_v1

## Inputs

Changes in variable.tf:
  1. Change in cluster-name
  2. Change in Vpc-name
  3. Change in region

## Outputs

Expected Outputs are:
  1. Daemon_set is created in monitoring namespace
  2. NODE-PORT service is created in monitoring namespace
  3. Ingres Rule is created in monitoring namespace 
  4. An ALB{application load balancer is created with ingress rules} ##NOTE: THIS STEP IS DEPENDENT ON INGRESS CONTROLLER IN EKS IF INGRESS CONTROLLER IN NOT SETUP IN YOUR EKS FOLLOW{ Ref: https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html } 
  5. You can go to ALB dns-name to check if node level metrics are available on DNS name
  6. If last step is verified you can mention your DNS-name in prometheous server to pull metrics
    {
      scrape_configs:
        - job_name: node
          scrape_interval: 15s
          scrape_timeout: 10s
          metrics_path: /metrics
          scheme: http
          static_configs:
        - targets:
          - k8s-monitori-***.elb.amazonaws.com 
    }
    Add this configuration to your prometheous server { /etc/prometheous/prometheous.yml}



## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-template/blob/main/LICENSE) for full details.
