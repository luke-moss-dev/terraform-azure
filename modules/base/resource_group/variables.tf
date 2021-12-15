#-
#  Variable Inputs
#-

#-- General Module Inputs

variable "location" {
  description = "The Azure Region where the Resource Group should exist."
  type        = string
}

variable "name" {
  description = "The Name which should be used for this Resource Group."
  type        = string
}

#-- Optional Module Inputs

variable "tags" {
  description = "A mapping of tags which should be assigned to the Resource Group."
  type        = map(string)
  default     = {}
}