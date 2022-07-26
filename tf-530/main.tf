# Configure Terraform to set the required AzureRM provider
# version and features{} block.

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.2"
    }
  }
}


provider "azurerm" {
  features {}
}

data "azurerm_client_config" "core" {}


resource "azurerm_resource_group" "sre_handson" {
  name = var.resource_group_name
  location   = var.location
}

module "dbmodule" {
  source  = "./modules"
  location            = azurerm_resource_group.sre_handson.location
  resource_group_name = azurerm_resource_group.sre_handson.name
}
