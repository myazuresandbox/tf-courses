variable "name" {
description = "name of the vnet"
default = "vnet-tf-662"
}

variable "resource_group" {
description = "name of the resource group"
default = "rg-tf-662"
}
variable "location" {
description ="name of the location"
default     = "southindia"
}

# variable "staccountkey" {
# description ="storage account key"
# #default     = "MnyPpsAsEw8PpytOUQyt+tvK1MCKNBUXQfCmof/Z85RY6NXIN6D+mMo9MotSvvX9lQ+9zaxyzEyI+AStF7W7sg=="
# }
variable "address" {
type =list
description = "specify the address"
default = ["10.70.0.0/16"]
}
