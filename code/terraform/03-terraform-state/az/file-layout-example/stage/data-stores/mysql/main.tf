# for proper use, the below would be uncommented
# to have the right backend for the layout
terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "tfstate81ek4"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "tfuprunningresourcegroup" {
  name     = "example-resources"
  location = "uksouth"
}

resource "azurerm_mysql_server" "tfuprunningmysql" {
  name                = "tfrunning-mysqlserver"
  location            = azurerm_resource_group.tfuprunningresourcegroup.location
  resource_group_name = azurerm_resource_group.tfuprunningresourcegroup.name

  administrator_login          = "mysqladminun"
  administrator_login_password = "H@Sh1CoR3!"

  sku_name   = "B_Gen5_2"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  infrastructure_encryption_enabled = false
  public_network_access_enabled     = true
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}