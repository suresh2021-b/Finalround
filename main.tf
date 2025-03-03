provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "rg" {
  name = "my_rg"
location = "eastus"
}

resource "azurerm_virtual_network" "vnet" {
  name = "my-vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  address_space = ["10.0.0.0/16"]

}

resource "azurerm_subnet" "subnet" {
  name                 = "my-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
