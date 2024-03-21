# Configure the Azure Provider
provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

# Create a Resource Group
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = "gordion-rg"
  location            = "North Europe"
}

# Create a Virtual Network
module "vnet" {
  source                 = "./modules/vnet"
  resource_group_name    = module.resource_group.resource_group_name
  location               = module.resource_group.resource_group_location
  vnet_name              = var.vnet_name
  vnet_address_space     = var.vnet_address_space
}

# Create Subnets
module "subnets" {
  source                = "./modules/subnets"
  resource_group_name   = module.resource_group.resource_group_name
  location              = "North Europe"
  vnet_name             = module.vnet.vnet_name
  default_subnet_name   = var.default_subnet_name
  default_subnet_prefix = var.default_subnet_prefix
  aks_subnet_name       = var.aks_subnet_name
  aks_subnet_prefix     = var.aks_subnet_prefix
}

# Create AKS Cluster
module "aks_cluster" {
  source               = "./modules/aks_cluster"
  resource_group_name  = module.resource_group.resource_group_name
  location             = module.resource_group.resource_group_location
  aks_cluster_name     = var.aks_cluster_name
  aks_cluster_version  = var.aks_cluster_version
  aks_subnet_id        = module.subnets.aks_subnet_id
  appgw_id             = module.app_gateway.appgw_id
}

# Create Application Gateway
module "app_gateway" {
  source                    = "./modules/app_gateway"
  resource_group_name       = module.resource_group.resource_group_name
  location                  = module.resource_group.resource_group_location
  default_subnet_id         = module.subnets.default_subnet_id
  application_gateway_name  = var.application_gateway_name
  application_gateway_size  = var.application_gateway_size
  application_gateway_sku   = var.application_gateway_sku
}

