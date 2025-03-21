provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

module "resource_group" {
  source       = "./modules/resource_group"
  name         = var.resource_group
  display_name = var.resource_group
}

module "network" {
  source            = "./modules/network"
  vpc_name          = var.vpc.name
  vpc_cidr          = var.vpc.cidr
  resource_group_id = module.resource_group.id
  vswitches         = var.vpc.vswitches
}

module "security_group" {
  source   = "./modules/security_group"
  name     = var.security_group.name
  vpc_id   = module.network.vpc_id
}

module "api_gateway" {
  source            = "./modules/api_gateway"
  http_api_name     = var.api_gateway.api_name
  resource_group_id = module.resource_group.id
  gateway_name      = var.api_gateway.gateway_name
  vpc_id            = module.network.vpc_id
  vswitch_id        = module.network.vswitch_ids[0] 
  type = var.api_gateway.type
}

module "storage" {
  source            = "./modules/storage"
  bucket_name       = var.oss.name
  resource_group_id = module.resource_group.id
  object_key        = var.oss.object_key
  source_file       = var.oss.source_file
}

output "resource_group_id" {
  value = module.resource_group.id
}