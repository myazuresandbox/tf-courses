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

variable "address" {
type =list
description = "specify the address"
default = ["10.0.0.0/16"]
}
