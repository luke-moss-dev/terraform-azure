#-
#  Variable Inputs
#-

output "manifests" {
  value = local.manifests
}

output "stubs" {
  value = local.stubs
}

output "yaml_decodings" {
  value = local.yaml_decodings
}

output "resource_groups" {
  value = local.resource_groups
}

output "virtual_networks" {
  value = local.virtual_networks
}