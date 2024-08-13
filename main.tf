# Provider Configuration
provider "azurerm" {
  features {}
}

# VNet Module
module "vnet" {
  source              = "./modules/vnet"
  name                = "teamc-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# VNet Subnets Module
module "vnet_subnets" {
  source              = "./modules/vnet-subnets"
  vnet_name           = module.vnet.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Firewalls Module
module "firewalls" {
  source              = "./modules/firewalls"
  vnet_name           = module.vnet.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Domain Module
module "domain" {
  source              = "./modules/domain"
  zone_name           = "teamc-domain"
  resource_group_name = var.resource_group_name
}

# Front-End Gateway Module
module "front_end_gateway" {
  source              = "./modules/front-end-gateway"
  vnet_name           = module.vnet.name
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Load Balancer Module
module "load_balancer" {
  source              = "./modules/load-balancer"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# Web Servers Module
module "web_servers" {
  source              = "./modules/web-servers"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# Variables Definition
variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where resources should be created."
  type        = string
}

# Outputs
output "vnet_id" {
  value = module.vnet.vnet_id
}

output "subnet_ids" {
  value = module.vnet_subnets.subnet_ids
}

output "firewall_id" {
  value = module.firewalls.firewall_id
}

output "domain_zone_id" {
  value = module.domain.zone_id
}

output "front_end_gateway_id" {
  value = module.front_end_gateway.gateway_id
}

output "load_balancer_id" {
  value = module.load_balancer.load_balancer_id
}

output "web_servers_id" {
  value = module.web_servers.scale_set_id
}
