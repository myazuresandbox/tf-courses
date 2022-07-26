resource "azurerm_redis_cache" "sre_redis_cache" {
  name                = format("rd-xe22-%s", random_string.resource_group_name.result)
  location            = var.location
  resource_group_name = var.resource_group_name
  capacity            = 1
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"

#   redis_configuration {
#   aof_backup_enabled              = true
#   aof_storage_connection_string_0 = "DefaultEndpointsProtocol=https;BlobEndpoint=${azurerm_storage_account.sre_storageacct.primary_blob_endpoint};AccountName=${azurerm_storage_account.sre_storageacct.name};AccountKey=${azurerm_storage_account.sre_storageacct.primary_access_key}"
#   aof_storage_connection_string_1 = "DefaultEndpointsProtocol=https;BlobEndpoint=${azurerm_storage_account.sre_storageacct.primary_blob_endpoint};AccountName=${azurerm_storage_account.sre_storageacct.name};AccountKey=${azurerm_storage_account.sre_storageacct.secondary_access_key}"
#   maxmemory_reserved = 10
#   maxmemory_delta    = 2
#   maxmemory_policy   = "allkeys-lru"
# }
}


# resource "azurerm_resource_group" "redisgeek" {
#   name     = format("redisgeek-%s", random_string.resource_group_name.result)
#   location = var.location
#   tags     = merge(var.tags, { owner = "Sreekanth" })
# }

# resource "azurerm_redis_enterprise_cluster" "redisgeek" {
#   name                = format("redisgeek-%s", random_string.redis_enterprise_name.result)
#   resource_group_name = azurerm_resource_group.redisgeek.name
#   location            = var.location
#   zones               = [1, 2, 3]
#   sku_name            = var.acre_sku
#   tags                = merge(var.tags, { owner = "Sreekanth" })
# }

# resource "azurerm_redis_enterprise_database" "redisgeek" {
#   name                = "default"
#   resource_group_name = azurerm_resource_group.redisgeek.name
#   cluster_id          = azurerm_redis_enterprise_cluster.redisgeek.id
#   clustering_policy   = var.azure_redis_enterprise_database_clustering_policy
# }
