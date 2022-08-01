resource "random_pet" "rg-name" {
  prefix    = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  name      = random_pet.rg-name.id
  location  = var.resource_group_location
}

# Generate random text for a unique storage account name
resource "random_id" "randomId" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.rg.name
  }

  byte_length = 8
}
# Create storage account for log collection
resource "azurerm_storage_account" "mystorageaccount" {
  name                     = "log${random_id.randomId.hex}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "mystcontainer" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.mystorageaccount.name
  container_access_type = "private"
}

resource "azurerm_storage_queue" "sre_storageq" {
  name                 = "stq${random_id.randomId.hex}"
  storage_account_name = azurerm_storage_account.mystorageaccount.name
}

data "azurerm_storage_blob" "sre_storageblob" {
  name                   = "stb${random_id.randomId.hex}"
  storage_account_name   = azurerm_storage_account.mystorageaccount.name
  storage_container_name = azurerm_storage_container.mystcontainer.name
}


# Create (and display) an SSH key
resource "tls_private_key" "myssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}