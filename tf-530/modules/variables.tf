variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
  default     = "uksouth"
}

variable "resource_group_name" {
  type        = string
  description = "The resources name to be used."
  default     = "azdatabase"
}


variable "acre_sku" {
  type    = string
  default = "Enterprise_E10-2"
}

variable "azure_redis_enterprise_database_clustering_policy" {
  type    = string
  default = "EnterpriseCluster"
}

variable "cloud_name" {
  description = "The Azure cloud environment to use. Available values at https://www.terraform.io/docs/providers/azurerm/#environment"
  default     = "public"
  type        = string
}

variable "tags" {
  description = "Key/value tags to assign to all resources."
  default     = {}
  type        = map(string)
}