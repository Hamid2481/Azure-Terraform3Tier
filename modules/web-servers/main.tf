resource "azurerm_virtual_machine_scale_set" "this" {
  name                = "teamc-web-servers"
  location            = var.location
  resource_group_name = var.resource_group_name
  upgrade_policy_mode = "Manual"

  sku {
    name     = "Standard_D1_v2"
    tier     = "Standard"
    capacity = 2
  }

  os_profile {
    computer_name_prefix = "webserver"
    admin_username       = "adminuser"
    admin_password       = "P@ssw0rd1234!"
  }

  network_profile {
    name    = "networkprofile"
    primary = true

    ip_configuration {
      name                                   = "ipconfig"
      subnet_id                              = azurerm_subnet.this.id
      load_balancer_backend_address_pools_ids = [azurerm_load_balancer_backend_address_pool.this.id]
    }
  }
}
