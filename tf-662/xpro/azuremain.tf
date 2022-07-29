resource "azurerm_storage_account" "storageacct" {
  name                     = "storageacct21"
  resource_group_name      = var.rg
  location                 = var.loc
  account_replication_type = "LRS"
  account_tier             = "Standard"
}