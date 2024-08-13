resource "azurerm_application_gateway" "this" {
  name                = "teamc-app-gateway"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard_V2"
  tier                = "Standard_v2"

  gateway_ip_configuration {
    name      = "gateway-ip-config"
    subnet_id = azurerm_subnet.this.id
  }
}
