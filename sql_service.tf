/*
locals {
  db_server = "${split(".", var.db_server_fqdn)}"
}

resource "azurerm_sql_server" "main" {
    name                         = var.db_server
    resource_group_name          = azurerm_resource_group.this.name
    location                     = azurerm_resource_group.this.location
    version                      = "12.0"
    administrator_login          = var.sql_admin_username
    administrator_login_password = var.sql_admin_password
}

resource "azurerm_sql_firewall_rule" "main" {
  name                = "AlllowAzureServices"
  resource_group_name = azurerm_resource_group.this.name
  server_name         = azurerm_sql_server.main.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}

resource "azurerm_sql_database" "db" {
  name                             = var.db_name
  resource_group_name              = azurerm_resource_group.this.name
  location                         = azurerm_resource_group.this.location  
  server_name                      = azurerm_sql_server.main.name
  edition                          = "Standard"
  requested_service_objective_name = "S0"

  depends_on = [
    azurerm_sql_server.main
  ]
}
*/