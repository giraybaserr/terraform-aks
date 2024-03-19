output "aks_subnet_id" {
  value = azurerm_subnet.aks.id
}

output "default_subnet_id" {
  value = azurerm_subnet.default.id
}
