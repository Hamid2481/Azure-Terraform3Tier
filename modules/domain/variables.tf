variable "zone_name" {
  description = "The name of the DNS zone."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

# Remove the location variable if it's not used
# variable "location" {
#   description = "The Azure region where resources should be created."
#   type        = string
# }
