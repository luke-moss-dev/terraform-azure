#-
#  Variable Inputs
#-

#-- General Module Inputs

variable "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space that is used the virtual network. You can supply more than one address space."
  type        = list(string)
}


#- Optional
variable "vnet_location" {
  description = "The location for virtual network.  Will default to resource group location if not supplied."
  type        = string
  default     = null
}

variable "dns_servers" {
  description = "List of IP addresses of DNS servers. Will default to Azure supplied DNS."
  type        = list(string)
  default     = null
}

variable "create_ddos" {
  description = "Create a DDoS plan? - Default false"
  type        = bool
  default     = false
}

variable "ddos_plan_name" {
  description = "The name of the DDoS Protection Plan. Required if creating DDoS Plan."
  type        = string
  default     = null
}

variable "ddos_location" {
  description = "The location for the DDoS Protection Plan. Required if creating DDoS Plan."
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags for all resources."
  type        = map(string)
  default     = {}
}