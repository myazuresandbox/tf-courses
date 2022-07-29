resource "azurerm_resource_group" "rg-tf-662" {
  name     = var.resource_group
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  address_space       = var.address
  resource_group_name = azurerm_resource_group.rg-tf-662.name
  location            = azurerm_resource_group.rg-tf-662.location
}

#az storage account keys list --account-name sttf661hdv
resource "azurerm_storage_account" "storageaccount" {
  name                     = "sttf661hdv"
  resource_group_name      = azurerm_resource_group.rg-tf-662.name
  location                 = azurerm_resource_group.rg-tf-662.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "storagecontainer" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.storageaccount.name
  container_access_type = "private"
}


# Option3: terraform { backend { key  = "terraform.tfstate" } }
# ARM_ACCESS_KEY=$(az keyvault secret show --name tstate-key --vault-name billBooth --query value -o tsv)
#

#Option 2: You can also pass the access_key from a file terraform init --backend-config=file_contalning_the_access_key.conf
# [
#   {
#     "creationTime": "2022-07-26T17:08:14.054527+00:00",
#     "keyName": "key1",
#     "permissions": "FULL",
#     "value": "MnyPpsAsEw8PpytOUQyt+tvK1MCKNBUXQfCmof/Z85RY6NXIN6D+mMo9MotSvvX9lQ+9zaxyzEyI+AStF7W7sg=="
#   },
#   {
#     "creationTime": "2022-07-26T17:08:14.054527+00:00",
#     "keyName": "key2",
#     "permissions": "FULL",
#     "value": "FJZuGw4HrvhTpOv6XOSclmN1LiBwG1zPmmKZbnzdSXMgTCwCLDFqjVlf0gIU0UrFGxfudgfEKpC8+AStNMR5pQ=="
#   }
# ]