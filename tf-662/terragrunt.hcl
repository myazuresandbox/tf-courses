remote_state {
  backend = "azurerm"
  config = {
    key = "inframodule/terraform.tfstate"
    resource_group_name = "RemoveTerraform"
    storage_account_name = "tsushistatetf"
    container_name = "tfstate"
  }
}