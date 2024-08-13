resource "azurerm_firewall" "this" {
  name                = "teamc-firewall"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "AZFW_Hub"
  tier                = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.this.id
    public_ip_address_id = azurerm_public_ip.this.id
  }
}
