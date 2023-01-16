terraform {
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.example_cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.example_cluster.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}

data "aws_eks_cluster" "example_cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "example_cluster" {
  name = var.cluster_name
}

data "aws_vpc" "example_vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}"]
  }
}



