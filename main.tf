resource "azurerm_resource_group" "rg" {
  name      = local.default_resource_group_name
  location  = local.default_location

  tags = {
    environment = "Rohit Test Environment"
  }  
}

resource "azurerm_storage_account" "sa" {
  name                     = local.default_storage_acoount_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = local.default_location
  account_tier             = local.default_account_tier
  account_replication_type = local.default_account_replication_type

  tags = {
    environment = "Rohit Test Environment"
  }  
}

resource "azurerm_storage_container" "sc" {
  name                  = local.default_storage_container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "null_resource" "example1" { }


output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
    value = azurerm_storage_account.sa.name
}

output "storage_container_name" {
    value = azurerm_storage_container.sc.name
}