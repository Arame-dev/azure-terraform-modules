variable "subscription_id" {
  description = "Azure Subscription"
  type        = string
  sensitive   = true
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "prod_resource_group" {
  source     = "./modules/resource_group"
  environment = "prod"
  project     = "demostorage125"
  location    = "West Europe"
}


resource "azurerm_storage_account" "demostorage125" {
  name                     = "demostorage125"
  resource_group_name      = module.prod_resource_group.rg_name
  location                 = module.prod_resource_group.rg_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}