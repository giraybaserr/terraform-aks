resource "azurerm_kubernetes_cluster" "main" {
  name                = var.aks_cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = "${var.aks_cluster_name}-dns"
  kubernetes_version  = var.aks_cluster_version

  default_node_pool {
    name           = "default"
    node_count     = 2
    vm_size        = "Standard_D2_v2"
    os_disk_size_gb = 80
    vnet_subnet_id = var.aks_subnet_id
    enable_node_public_ip = false
  }

  identity {
    type = "SystemAssigned"
  }

  #private_cluster_enabled = true

  network_profile {
    network_plugin     = "azure"
    dns_service_ip     = "10.0.4.10"
    service_cidr       = "10.0.4.0/24"
    load_balancer_sku  = "standard"
  }

}

resource "null_resource" "enable_agic" {
  depends_on = [azurerm_kubernetes_cluster.main]

  provisioner "local-exec" {
    command = "az aks enable-addons --addons ingress-appgw --name ${var.aks_cluster_name} --resource-group ${var.resource_group_name} --appgw-id ${var.appgw_id}"
  }
}
