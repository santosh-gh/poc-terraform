# Public IP
/*
resource "azurerm_public_ip" "agw" {
  name                = "tempo-hub-agw1-pip1"
  resource_group_name              = azurerm_resource_group.this.name
  location                         = azurerm_resource_group.this.location 
  allocation_method   = "Static"
  sku                 = "Standard"
  #tags                = data.azurerm_resource_group.rg.tags
}
*/