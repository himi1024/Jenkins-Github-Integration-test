data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "this" {
  vpc_name       = var.vpc_name
  cidr_block     = var.vpc_cidr
  resource_group_id = var.resource_group_id
}

resource "alicloud_vswitch" "this" {
  count          = length(var.vswitches)
  vpc_id         = alicloud_vpc.this.id
  cidr_block     = var.vswitches[count.index].cidr_block
  vswitch_name   = var.vswitches[count.index].name
  zone_id        = data.alicloud_zones.default.zones[count.index].id
}