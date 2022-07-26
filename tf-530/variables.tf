# Use variables to customize the deployment
variable "env" {
  type    = string
  default = "rbpoc"
}


variable "root_id" {
  type    = string
  default = "rb"
}

variable "root_name" {
  type    = string
  default = "RBPLC"
}


variable "client_secret" {
  type    = string
  default = "VUZzXxNdjj"
}


variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
  default     = "southindia"
}

variable "resource_group_name" {
  type        = string
  description = "The resources name to be used."
  default     = "azdb220711"
}

