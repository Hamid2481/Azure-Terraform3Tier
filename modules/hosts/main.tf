provider "azurerm" {
  features {}
}

resource "azurerm_virtual_machine_scale_set" "web_vmss" {
  name                = "TeamC-web-vmss"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  upgrade_policy_mode = "Manual"
  virtual_machine_profile {
    storage_profile {
      image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2019-Datacenter"
        version   = "latest"
      }
    }
    hardware_profile {
      vm_size = "Standard_DS1_v2"
    }
    os_profile {
      computer_name_prefix = "web-vmss"
      admin_username       = "adminuser"
      admin_password       = "P@ssw0rd1234!"
    }
    network_profile {
      network_interface {
        network_interface_id = azurerm_network_interface.nic.id
      }
    }
  }
}
