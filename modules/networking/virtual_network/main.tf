#-
#  VIRTUAL NETWORK module
#-

#- Data Retrieval

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

#- DDoS Plan - Default false

resource "azurerm_network_ddos_protection_plan" "ddos" {
  count               = var.create_ddos ? 1 : 0
  name                = var.ddos_plan_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = coalesce(var.ddos_location, data.azurerm_resource_group.rg.location)
  tags                = var.tags

  depends_on = [data.azurerm_resource_group.rg]
}

#- VNET

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = coalesce(var.vnet_location, data.azurerm_resource_group.rg.location)
  resource_group_name = data.azurerm_resource_group.rg.name

  address_space = var.address_space
  dns_servers   = var.dns_servers

  dynamic "ddos_protection_plan" {
    for_each = var.create_ddos == true ? [{}] : []

    content {
      id     = azurerm_network_ddos_protection_plan.ddos[0].id
      enable = true
    }
  }

  tags = var.tags

  depends_on = [data.azurerm_resource_group.rg]
}
