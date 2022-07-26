
resource "azurerm_storage_account""storageacct" {
name = "${var.name}"
resource_group_name = "${var.rg}"
location = "${var.loc}"
account_replication_type = "${var.account_replication}"
account_tier = "${var.account_tier}"
}