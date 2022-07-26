output "primary_access_key" {
  value = "${azurerm_redis_cache.sre_redis_cache.primary_access_key}"
  sensitive = true
}

# output "dbmodule" {
# value = "${azurerm_redis_cache.sre_mysql.primary_access_key}"
# sensitive = true
# }

# output "hostname" {
#   value = module.dbmodule.azurerm_redis_cache.sre_mysql.hostname
# }