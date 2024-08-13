resource "azurerm_subnet" "this" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.1.0/24"]
  location             = var.location
}

