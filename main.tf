resource "azurerm_resource_group" "tf_task_st_container" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "tf_task_st_container" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tf_task_st_container.name
  location                 = azurerm_resource_group.tf_task_st_container.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tf_task_st_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.tf_task_st_container.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "tf_task_st_container" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.tf_task_st_container.name
  storage_container_name = azurerm_storage_container.tf_task_st_container.name
  type                   = "Block"
  source                 = data.archive_file.tf_task_st_container.output_path
}

data "archive_file" "tf_task_st_container" {
  type        = "zip"
  output_path = "${path.module}/files.zip"

  source {
    content  = "placeholder"
    filename = "placeholder.txt"
  }
}
