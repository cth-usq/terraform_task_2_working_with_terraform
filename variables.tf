variable "resource_group_name" {
  type    = string
  default = "tf_task_st_container-resources"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "storage_account_name" {
  type    = string
  default = "tftaskstcontainer"
}

variable "container_name" {
  type    = string
  default = "tf-task-st-container"
}

variable "blob_name" {
  type    = string
  default = "tf-task-st-container-blob"
}
