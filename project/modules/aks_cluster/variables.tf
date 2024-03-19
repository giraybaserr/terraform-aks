variable "aks_cluster_name" {
  description = "Name of the AKS Cluster"
  type        = string
}

variable "location" {
  description = "Location of the AKS Cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "aks_cluster_version" {
  description = "Kubernetes version for the AKS Cluster"
  type        = string
}

variable "aks_subnet_id" {
  description = "Subnet ID for the AKS Cluster"
  type        = string
}