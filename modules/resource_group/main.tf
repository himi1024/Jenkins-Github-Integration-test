resource "alicloud_resource_manager_resource_group" "rg" {
  resource_group_name = var.name
  display_name        = var.display_name
}