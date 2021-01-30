# Create virtual network

resource "azurerm_virtual_network" "tfvnet" {
  name                = var.VirtualNetwork
  resource_group_name  = azurerm_resource_group.this.name
  location             = azurerm_resource_group.this.location
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "tfwafnet" {
  name                 = "tempo-waf-net"
  virtual_network_name = azurerm_virtual_network.tfvnet.name
  resource_group_name  = azurerm_resource_group.this.name
  address_prefix       = "10.1.0.0/24"
}
