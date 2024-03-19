variable "application_gateway_name" {
  description = "Name of the Application Gateway"
  type        = string
}

variable "location" {
  description = "Location of the Application Gateway"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

#variable "aks_subnet_id" {
#  description = "Subnet ID for the AKS Cluster"
#  type        = string
#}

variable "application_gateway_size" {
  description = "Capacity of the Application Gateway"
  type        = number
}

variable "application_gateway_sku" {
  description = "SKU for the Application Gateway"
  type        = string
}

variable "default_subnet_id" {
  description = "Subnet ID for the Default Subnet"
  type        = string
}