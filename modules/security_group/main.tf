resource "alicloud_security_group" "this" {
  security_group_name = var.name
  vpc_id              = var.vpc_id
}