output "primarykey" {
  value     = azurerm_storage_account.tf_task_st_container.primary_access_key
  sensitive = true
}

output "host" {
  value     = azurerm_storage_account.tf_task_st_container.primary_blob_host
  sensitive = true
}
