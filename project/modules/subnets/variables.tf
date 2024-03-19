variable "default_subnet_name" {
  description = "Name of the default subnet"
  type        = string
}

variable "default_subnet_prefix" {
  description = "Address prefix of the default subnet"
  type        = string
}

variable "aks_subnet_name" {
  description = "Name of the AKS subnet"
  type        = string
}

variable "aks_subnet_prefix" {
  description = "Address prefix of the AKS subnet"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "location" {
  description = "Location of the Subnet"
  type        = string
}