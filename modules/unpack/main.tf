#-
#  UNPACK module to handle yaml manifests
#-

# Management Groups?

# Subscriptions

locals {

  # Gather names of all subscription manifests
  manifests = fileset(path.root, "manifests/{subscriptions,management_groups}/*.{yaml,yml}")

  # Get the stub name of all manifests mapped to the full path
  stubs = { for mani in local.manifests : basename(replace(mani, "/\\..*$/", "")) => mani }

  # Map the sub name (manifest file name) to the yaml decoded entire object
  yaml_decodings = { for key, value in local.stubs : key => yamldecode(file("${path.root}/${value}")) }

  # RG Object
  resource_groups = flatten([
    for key, manifest in local.yaml_decodings : [
      for name, rg in try(manifest.resource_groups, {}) : {
        rg_key            = name
        subscription_id   = manifest.subscription_id
        subscription_name = manifest.subscription_name
        name              = name
        location          = rg.location
        tags              = try(rg.tags, {})
      }
    ]
  ])

  # Vnet Object
  virtual_networks = flatten([
    for key, manifest in local.yaml_decodings : [
      for name, vnet in try(manifest.virtual_networks, {}) : {
        vnet_key           = name
        vnet_name          = name
        subscription_id    = manifest.subscription_id
        subscription_name  = manifest.subscription_name
        resource_group_key = vnet.resource_group_key
        address_space      = vnet.address_space

        vnet_location  = try(vnet.vnet_location, null)
        dns_servers    = try(vnet.dns_servers, null)
        create_ddos    = try(vnet.create_ddos, false)
        ddos_plan_name = try(vnet.ddos_plan_name, null)
        ddos_location  = try(vnet.ddos_location, null)
        tags           = try(vnet.tags, {})
      }
    ]
  ])
}
