terraform {
  cloud {

    organization = "memememe"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

  subscription_id = "2213e8b1-dbc7-4d54-8aff-b5e315df5e5b"
  tenant_id       = "84f1e4ea-8554-43e1-8709-f0b8589ea118"     # only needed for SPN
  client_id       = "9b281e9a-2b52-43bf-b6cd-fb85f8d311f8"     # only needed for SPN
  client_secret   = "J_d8Q~U2-bvWZ99LHkfB4xZ45CIK6Jg038zEjaBm" # only needed for SPN
}

resource "azurerm_resource_group" "rg" {
  name     = "813-1364f5e5-hands-on-with-terraform-on-azure"
  location = "westus"
}

module "securestorage" {
  source               = "app.terraform.io/memememe/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "securestorage24312"
}