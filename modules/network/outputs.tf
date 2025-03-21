output "vpc_id" {
  value = alicloud_vpc.this.id
}

output "vswitch_ids" {
  value = [for vs in alicloud_vswitch.this : vs.id]
}