provider "azurerm" { 
  features {}
}

resource "azurerm_resource_group" "test1-rg" {
    name = var.rg_Name
    location = var.location
    tags = {
      "Env" = "Dev"
    }
  
}

resource "azurerm_virtual_network" "dev-vnet1" {
  name = var.vnet1
  location = azurerm_resource_group.test1-rg.location
  resource_group_name = azurerm_resource_group.test1-rg.name
  address_space = var.address_space
}

resource "azurerm_subnet" "dev-subnet1" {
  name = var.subnet1
  resource_group_name = azurerm_resource_group.test1-rg.name
  virtual_network_name = azurerm_virtual_network.dev-vnet1.name
  address_prefixes = var.address_prefix
  service_endpoints = ["Microsoft.Storage"]
}

resource "azurerm_storage_account" "stg1" {
  name = var.stg_Name
  location = azurerm_resource_group.test1-rg.location
  access_tier = var.access_tier
  account_kind = var.acc_kind
  account_tier = var.acc_tier
  account_replication_type = "LRS"
  resource_group_name = azurerm_resource_group.test1-rg.name
  

  network_rules {
    virtual_network_subnet_ids = [azurerm_subnet.dev-subnet1.id]
    default_action = "Deny"
  }
}

output "vnet_id" {
  value = azurerm_virtual_network.dev-vnet1.id
  
}

output "subnet_id" {
  value = azurerm_subnet.dev-subnet1.id
  
}
output "stgAcc_id" {
  value = azurerm_storage_account.stg1.id
}
