#- main.tf is largely going to be a placeholder.  See z.<module_name>.tf  files for further on individual module calls

#- Call a module to unpack manifests

module "unpack" {
  source = "./modules/unpack"
}

