variable "kube_config_path" {
  description = "Kubernetes config file path"
}

variable "release_name" {
  description = "Name of the Helm release"
}

variable "namespace" {
  description = "Kubernetes namespace where the Helm chart will be deployed"
}

variable "chart_repository" {
  description = "Helm chart repository URL"
}

variable "chart_name" {
  description = "Helm chart name"
}

variable "chart_version" {
  description = "Helm chart version"
}
