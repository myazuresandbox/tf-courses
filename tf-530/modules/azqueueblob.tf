resource "azurerm_storage_account" "sre_storageacct" {
  name                     = "srestacct220711"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "sre_stcontainer" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.sre_storageacct.name
  container_access_type = "private"
}
resource "azurerm_storage_queue" "sre_storageq" {
  name                 = "srestqueue220711"
  storage_account_name = azurerm_storage_account.sre_storageacct.name
}

data "azurerm_storage_blob" "sre_storageblob" {
  name                   = "srestblob220711"
  storage_account_name   = azurerm_storage_account.sre_storageacct.name
  storage_container_name = azurerm_storage_container.sre_stcontainer.name
}