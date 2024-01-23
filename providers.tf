terraform {
  required_version = "1.7.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = var.host
    client_certificate     = var.client_certificate
    client_key             = var.client_key
    cluster_ca_certificate = var.cluster_ca_certificate
  }
}
