variable "name" {
  type= list
  default = ["A","B","C"]
}
variable "location" {
default     = "southindia"
}
variable "resource_group" {
default = "rg-tf-39888"
}
variable "address" {
default = ["10.0.0.0/16"]
}

variable "no_of_vnets" {
default = 2
}