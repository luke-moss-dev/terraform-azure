#- Resource Group Configs
#- Will support up to 5 subscriptons at this time
#- z.LOCALS.tf for mapping

#- Sub1
module "sub1_resource_group" {
  source = "./modules/base/resource_group"
  providers = {
    azurerm = azurerm.sub1
  }

  for_each = {
    #for rg in try(module.unpack.resource_groups, []) : rg.rg_key => rg 
    for rg in module.unpack.resource_groups : rg.rg_key => rg if rg.subscription_name == local.sub1
  }

  name            = each.value.name
  location        = each.value.location
  tags            = try(each.value.tags, {})
}

#- Sub2
module "sub2_resource_group" {
  source = "./modules/base/resource_group"
  providers = {
    azurerm = azurerm.sub2
  }

  for_each = {
    for rg in module.unpack.resource_groups : rg.rg_key => rg if rg.subscription_name == local.sub2
  }

  name            = each.value.name
  location        = each.value.location
  tags            = try(each.value.tags, {})
}

#- Sub3
module "sub3_resource_group" {
  source = "./modules/base/resource_group"
  providers = {
    azurerm = azurerm.sub3
  }

  for_each = {
    for rg in module.unpack.resource_groups : rg.rg_key => rg if rg.subscription_name == local.sub3
  }

  name            = each.value.name
  location        = each.value.location
  tags            = try(each.value.tags, {})
}

#- Sub4
module "sub4_resource_group" {
  source = "./modules/base/resource_group"
  providers = {
    azurerm = azurerm.sub4
  }

  for_each = {
    for rg in module.unpack.resource_groups : rg.rg_key => rg if rg.subscription_name == local.sub4
  }

  name            = each.value.name
  location        = each.value.location
  tags            = try(each.value.tags, {})
}

#- Sub5
module "sub5_resource_group" {
  source = "./modules/base/resource_group"
  providers = {
    azurerm = azurerm.sub5
  }

  for_each = {
    for rg in module.unpack.resource_groups : rg.rg_key => rg if rg.subscription_name == local.sub5
  }

  name            = each.value.name
  location        = each.value.location
  tags            = try(each.value.tags, {})
}
