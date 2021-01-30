# App Service Plan
/*resource "azurerm_app_service_plan" "frontend" {
  name                = var.app_service_plan_name_frontend
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
  kind                = "Windows"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

# Web App Service
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

# Web App Service
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
*/