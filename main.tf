# Configure the Azure Provider
# whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
provider "azurerm" {
  version = "=2.40.0"
  features {}
}

/*
# Provider block defines which provider they require
terraform {
  backend "azurerm" {}
}
*/

# Create a resource group
resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
}

/*

# App Service Plan
resource "azurerm_app_service_plan" "frontend" {
  name                = var.app_service_plan_name_frontend
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = "Windows"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# App Service
resource "azurerm_app_service" "frontend" {
  name                = var.app_service_name_frontend
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  app_service_plan_id = azurerm_app_service_plan.frontend.id

  site_config {
    websockets_enabled = true
  }

  app_settings = {
    #"APPINSIGHTS_INSTRUMENTATIONKEY"      = "${azurerm_application_insights.this.instrumentation_key}"
    "APPINSIGHTS_PORTALINFO"              = "ASP.NET"
    "APPINSIGHTS_PROFILERFEATURE_VERSION" = "1.0.0"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"  = "35"
  }
}

# App Service Plan
resource "azurerm_app_service_plan" "backend" {
  name                = var.app_service_plan_name_backend
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = "Windows"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# App Service
resource "azurerm_app_service" "backend" {
  name                = var.app_service_name_backend
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  app_service_plan_id = azurerm_app_service_plan.backend.id

  site_config {
    websockets_enabled = true
  }

  app_settings = {
    #"APPINSIGHTS_INSTRUMENTATIONKEY"      = "${azurerm_application_insights.this.instrumentation_key}"
    "APPINSIGHTS_PORTALINFO"              = "ASP.NET"
    "APPINSIGHTS_PROFILERFEATURE_VERSION" = "1.0.0"
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS"  = "35"
  }
}

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

/*
# Application Insights

resource "azurerm_application_insights" "this" {
  name                = var.application_insights_name
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  application_type    = "web"
}

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
*/