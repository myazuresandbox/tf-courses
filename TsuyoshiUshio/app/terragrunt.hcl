terraform {
  #source = "git@github.com:TsuyoshiUshio/infrastructure-module.git//app?ref=v0.0.3"
}
remote_state {
  backend = "azurerm"
  config = {
    key = "inframodule/terraform.tfstate"
    resource_group_name = "RemoveTerraform"
    storage_account_name = "tsushistatetf"
    container_name = "tfstate"
  }
}
inputs = {
  location = "westus"
  resource_group_name = "moduleResourceGroup1-10"
}