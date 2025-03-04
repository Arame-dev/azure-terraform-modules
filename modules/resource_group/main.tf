locals {
  rg_name = lower(replace("rg-${var.environment}-${var.project}-${var.location}", " ", "-"))
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}