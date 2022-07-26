provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.96.0"
    }
  }
  backend   "azurerm" {
  storage_account_name = "sttf661hdv"
  container_name = "vhds"
  key = "terraform.tfstate.change"
  resource_group_name = "rg-tf-39888"
  access_key = "KO8ZI069trZWev/xDkIsR51vm3z5c7177yI/wf7z4CFAPWjGo9l9QFB85MdTS8CbiNv6yegYBRH2+ASt9E+frw=="#"terraform.tfstate"
  } 
  
}
