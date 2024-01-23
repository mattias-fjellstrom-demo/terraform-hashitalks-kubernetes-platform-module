variable "host" {
  type        = string
  sensitive   = true
  description = "Kubernetes host"
}

variable "client_certificate" {
  type        = string
  sensitive   = true
  description = "Kubernetes cluster client certificate"
}

variable "client_key" {
  type        = string
  sensitive   = true
  description = "Kubernetes cluster client key"
}

variable "cluster_ca_certificate" {
  type        = string
  sensitive   = true
  description = "Kubernetes cluster CA certificate"
}
