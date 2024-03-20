provider "helm" {
  kubernetes {
    config_path = var.kube_config_path
  }
}

resource "helm_release" "example" {
  name       = var.release_name
  namespace  = var.namespace
  repository = var.chart_repository
  chart      = var.chart_name
  version    = var.chart_version

  set {
    name  = "service.type"
    value = "ClusterIP"
  }
}

resource "helm_release" "elasticsearch" {
  name       = "elasticsearch"
  namespace  = var.namespace
  repository = "https://helm.elastic.co"
  chart      = "elasticsearch"
  version    = "7.10.0"

  set {
    name  = "volumeClaimTemplate.resources.requests.storage"
    value = "20Gi"
  }

  set {
    name  = "replicas"
    value = "3"
  }
}