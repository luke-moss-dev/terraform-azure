#- Virtual Network Configs
#- Will support up to 5 subscriptons at this time
#- z.LOCALS.tf for mapping

#- Sub1
module "sub1_virtual_network" {
  source = "./modules/networking/virtual_network"
  providers = {
    azurerm = azurerm.sub1
  }

  for_each = {
    for vnet in module.unpack.virtual_networks : vnet.vnet_key => vnet if vnet.subscription_name == local.sub1
  }

  vnet_name            = each.value.vnet_name
  resource_group_name = each.value.resource_group_key
  address_space = each.value.address_space

  vnet_location = try(each.value.vnet_location, null)
  dns_servers = try(each.value.dns_servers, null)
  create_ddos = try(each.value.create_ddos, false)
  ddos_plan_name = try(each.value.ddos_plan_name, null)
  ddos_location = try(each.value.ddos_location, null)
  tags            = try(each.value.tags, {})

  depends_on = [ module.sub1_resource_group ]
}

#- Sub2
module "sub2_virtual_network" {
  source = "./modules/networking/virtual_network"
  providers = {
    azurerm = azurerm.sub2
  }

  for_each = {
    for vnet in module.unpack.virtual_networks : vnet.vnet_key => vnet if vnet.subscription_name == local.sub2
  }

  vnet_name            = each.value.vnet_name
  resource_group_name = each.value.resource_group_key
  address_space = each.value.address_space

  vnet_location = try(each.value.vnet_location, null)
  dns_servers = try(each.value.dns_servers, null)
  create_ddos = try(each.value.create_ddos, false)
  ddos_plan_name = try(each.value.ddos_plan_name, null)
  ddos_location = try(each.value.ddos_location, null)
  tags            = try(each.value.tags, {})

  depends_on = [ module.sub2_resource_group ]
}

#- Sub3
module "sub3_virtual_network" {
  source = "./modules/networking/virtual_network"
  providers = {
    azurerm = azurerm.sub3
  }

  for_each = {
    for vnet in module.unpack.virtual_networks : vnet.vnet_key => vnet if vnet.subscription_name == local.sub3
  }

  vnet_name            = each.value.vnet_name
  resource_group_name = each.value.resource_group_key
  address_space = each.value.address_space

  vnet_location = try(each.value.vnet_location, null)
  dns_servers = try(each.value.dns_servers, null)
  create_ddos = try(each.value.create_ddos, false)
  ddos_plan_name = try(each.value.ddos_plan_name, null)
  ddos_location = try(each.value.ddos_location, null)
  tags            = try(each.value.tags, {})

  depends_on = [ module.sub3_resource_group ]
}

#- Sub4
module "sub4_virtual_network" {
  source = "./modules/networking/virtual_network"
  providers = {
    azurerm = azurerm.sub4
  }

  for_each = {
    for vnet in module.unpack.virtual_networks : vnet.vnet_key => vnet if vnet.subscription_name == local.sub4
  }

  vnet_name            = each.value.vnet_name
  resource_group_name = each.value.resource_group_key
  address_space = each.value.address_space

  vnet_location = try(each.value.vnet_location, null)
  dns_servers = try(each.value.dns_servers, null)
  create_ddos = try(each.value.create_ddos, false)
  ddos_plan_name = try(each.value.ddos_plan_name, null)
  ddos_location = try(each.value.ddos_location, null)
  tags            = try(each.value.tags, {})

  depends_on = [ module.sub4_resource_group ]
}

#- Sub5
module "sub5_virtual_network" {
  source = "./modules/networking/virtual_network"
  providers = {
    azurerm = azurerm.sub5
  }

  for_each = {
    for vnet in module.unpack.virtual_networks : vnet.vnet_key => vnet if vnet.subscription_name == local.sub5
  }

  vnet_name            = each.value.vnet_name
  resource_group_name = each.value.resource_group_key
  address_space = each.value.address_space

  vnet_location = try(each.value.vnet_location, null)
  dns_servers = try(each.value.dns_servers, null)
  create_ddos = try(each.value.create_ddos, false)
  ddos_plan_name = try(each.value.ddos_plan_name, null)
  ddos_location = try(each.value.ddos_location, null)
  tags            = try(each.value.tags, {})

  depends_on = [ module.sub5_resource_group ]
}
