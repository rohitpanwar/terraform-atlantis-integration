variable "first_name" {
  type = string
  nullable = false
}

variable "last_name" {
  type = string
  nullable = false
}

variable "resource_group_prefix" {
  type = string
  nullable = false
}

locals {
  default_resource_group_name = lower("${var.resource_group_prefix}-${var.first_name}-${var.last_name}")
  default_app_name = lower("${var.resource_group_prefix}-${var.first_name}-${var.last_name}-svc-acct")
  default_storage_acoount_name = lower("tfstate${var.first_name}${var.last_name}")
  default_storage_container_name = "tfstate"
  default_location = "eastus"
  default_account_tier = "Standard"
  default_account_replication_type = "LRS"
  default_container_registry_name = "containerRegistry${var.first_name}${var.last_name}"
  default_vault_name = "vault${var.first_name}${var.last_name}"
}