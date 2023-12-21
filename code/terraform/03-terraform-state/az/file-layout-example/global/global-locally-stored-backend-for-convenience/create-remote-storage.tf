terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_string" "resource_code" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_resource_group" "tfstate" {
  name     = "tfstate"
  location = "uksouth"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "tfstate${random_string.resource_code.result}"
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "azurerm_storage_management_policy" "versioning" {
  storage_account_id = azurerm_storage_account.tfstate.id

  rule {
    name    = "rule1"
    enabled = true
    filters {
      blob_types   = ["blockBlob"]
    }
    actions {
     base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = 100
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 30
      }
    }
  }
}

resource "azurerm_storage_encryption_scope" "encryptioning" {
  name               = "microsoftmanaged"
  storage_account_id = azurerm_storage_account.tfstate.id
  source             = "Microsoft.Storage"
}
output "storage_account_name" {
  value = azurerm_storage_account.tfstate.name
}