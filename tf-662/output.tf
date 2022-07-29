output "storageacctname" {
  value = azurerm_storage_account.storageaccount.name
}

output "storageacctcontainer" {
  value = azurerm_storage_container.storagecontainer.name
}

output "access_key" {
  value     = azurerm_storage_account.storageaccount.primary_access_key
  sensitive = true
}