resource "azurerm_resource_group" "rg-user-xyzr" {
  name = "${var.resource_group}"
  location   = "${var.location}"
}
resource "azurerm_virtual_network" "vnet" {
name = "${var.name}"
address_space = "${var.address}"
resource_group_name = "${var.resource_group}"
location = "${var.location}"
}