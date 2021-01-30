# General
variable "resource_group_name" {
    description = "The name of the resource group"
    default = "tempo_poc_rg"
}

variable "location" {    
    description = "The Azure region in which all resources should be created"
    default = "East US"
}

# App Service
variable "app_service_plan_name_frontend" {    
    description = "The name of the app service plan for the backend"
    default = "tempo_poc_frontend_app_service_plan"
}

variable "app_service_name_frontend" {    
    description = "The name of the app service for the backend"
    default = "tempo-poc-frontend-webapp-service"
}

# App Service
variable "app_service_plan_name_backend" {    
    description = "The name of the app service plan for the backend"
    default = "tempo_poc_backend_app_service_plan"
}

variable "app_service_name_backend" {    
    description = "The name of the app service for the backend"
    default = "tempo-poc-backend-webapp-service"
}

# Application Insights
variable "application_insights_name" {
    default = "homeapplicationinsights01"
    description = "The name of the application insights resource"
}

variable "db_server_fqdn" {
    default = "tempofqdn"
    description = "Full qualified domain name of the database sever. The server where to create the database. In the form xxxx.database.windows.net"
}

variable "db_server" {
    default = "temposerver"
    description = "The name of the database to be created."
}

variable "db_name" {
    default = "tempodb"
    description = "The name of the database to be created."
}

variable "sql_admin_username" {
    default = "tempoadmin"
    description = "The administrator username of the SQL Server to use for launching the seed script."
}

variable "sql_admin_password" {
    default = "tempopassword@1"
    description = "The administrator password of the SQL Server to use for launching the seed script."
}

variable "tags" {
  description = "The tags to associate with the database."
  type        = "map"

  default = {
    provisioner = "terraform"
  }
}

variable "service_objective_name" {
  description = "The performance level for the database. For the list of acceptable values, see https://docs.microsoft.com/en-gb/azure/sql-database/sql-database-service-tiers. Default is Basic."
  default     = "Basic"
}

variable log_file {
  description = "Log file name to create with the seeding results."
  default     = "db-init.log"
}

variable "collation" {
  description = "The collation for the database. Default is SQL_Latin1_General_CP1_CI_AS"
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "db_edition" {
  description = "The edition of the database to be created."
  default     = "Basic"
}

# service variables
variable "VirtualNetwork" {
  default = "tempo-poc-vnet"
}
