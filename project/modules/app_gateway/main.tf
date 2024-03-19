resource "azurerm_public_ip" "main" {
  name                = "${var.application_gateway_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_application_gateway" "main" {
  name                = var.application_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = var.application_gateway_sku
    tier     = "Standard_v2"
    capacity = var.application_gateway_size
  }

gateway_ip_configuration {
  name      = "${var.application_gateway_name}-ip-config"
  subnet_id = var.default_subnet_id
}

  frontend_ip_configuration {
    name                 = "${var.application_gateway_name}-frontend-ip"
    public_ip_address_id = azurerm_public_ip.main.id
  }

  frontend_port {
    name = "${var.application_gateway_name}-frontend-port"
    port = 80
  }

  backend_address_pool {
    name = "${var.application_gateway_name}-backend-pool"
  }

  backend_http_settings {
    name                  = "${var.application_gateway_name}-http-settings"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "${var.application_gateway_name}-listener"
    frontend_ip_configuration_name = "${var.application_gateway_name}-frontend-ip"
    frontend_port_name             = "${var.application_gateway_name}-frontend-port"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${var.application_gateway_name}-routing-rule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.application_gateway_name}-listener"
    backend_address_pool_name  = "${var.application_gateway_name}-backend-pool"
    backend_http_settings_name = "${var.application_gateway_name}-http-settings"
    priority                   = 100 
  }

}