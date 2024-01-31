// NOTE: THESE TESTS ARE GENERATED BY TERRAFORM CLOUD AI

variables {
  kube_config = {
    host                   = "myhost"
    client_certificate     = "aGVsbG8gd29ybGQK"
    client_key             = "aGVsbG8gd29ybGQK"
    cluster_ca_certificate = "aGVsbG8gd29ybGQK"
  }
}

run "variables" {
  command = plan
  assert {
    condition     = var.kube_config.host != ""
    error_message = "host should not be empty"
  }

  assert {
    condition     = var.kube_config.client_certificate != ""
    error_message = "client certificate should not be empty"
  }

  assert {
    condition     = var.kube_config.client_key != ""
    error_message = "client key should not be empty"
  }

  assert {
    condition     = var.kube_config.cluster_ca_certificate != ""
    error_message = "cluster CA certificate should not be empty"
  }
}

run "helm_release_argocd" {
  command = plan

  assert {
    condition     = helm_release.argocd.name == "argo"
    error_message = "incorrect helm release name"
  }

  assert {
    condition     = helm_release.argocd.repository == "https://argoproj.github.io/argo-helm"
    error_message = "incorrect helm repository"
  }

  assert {
    condition     = helm_release.argocd.chart == "argo-cd"
    error_message = "incorrect helm chart"
  }

  assert {
    condition     = helm_release.argocd.namespace == "argocd"
    error_message = "incorrect namespace"
  }

  assert {
    condition     = helm_release.argocd.create_namespace == true
    error_message = "namespace should be created"
  }
}