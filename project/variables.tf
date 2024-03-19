# Resource Group Variables
variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "gordion-rg"
}

variable "resource_group_location" {
  description = "Location of the Resource Group"
  type        = string
  default     = "North Europe"
}

# Virtual Network Variables
variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "gordion-vnet"
}

variable "vnet_address_space" {
  description = "Address space of the Virtual Network"
  type        = string
  default     = "10.0.0.0/16"
}

# Subnet Variables
variable "default_subnet_name" {
  description = "Name of the default subnet"
  type        = string
  default     = "default-sn"
}

variable "default_subnet_prefix" {
  description = "Address prefix of the default subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "aks_subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
  default     = "aks-sn"
}

variable "aks_subnet_prefix" {
  description = "Address prefix of the AKS subnet"
  type        = string
  default     = "10.0.3.0/24"
}

# AKS Cluster Variables
variable "aks_cluster_name" {
  description = "Name of the AKS Cluster"
  type        = string
  default     = "gordion-aks-cluster"
}

variable "aks_cluster_version" {
  description = "Kubernetes version for the AKS Cluster"
  type        = string
  default     = "1.28.3"
}

# Application Gateway Variables
variable "application_gateway_name" {
  description = "Name of the Application Gateway"
  type        = string
  default     = "gordion-app-gw"
}

variable "application_gateway_size" {
  description = "Capacity of the Application Gateway"
  type        = number
  default     = 2
}

variable "application_gateway_sku" {
  description = "SKU for the Application Gateway"
  type        = string
  default     = "Standard_v2"
}