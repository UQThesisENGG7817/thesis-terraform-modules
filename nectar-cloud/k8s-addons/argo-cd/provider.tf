provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
    client_key             = base64decode(var.client_key)
    client_certificate     = base64decode(var.client_certificate)
  }
}

terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.11.0"
    }
  }
}