resource "alicloud_oss_bucket" "this" {
  bucket          = var.bucket_name
  resource_group_id = var.resource_group_id
}

resource "alicloud_oss_bucket_acl" "this" {
  bucket = alicloud_oss_bucket.this.bucket
  acl    = var.acl
}

resource "alicloud_oss_bucket_object" "this" {
  bucket   = alicloud_oss_bucket.this.bucket
  key      = var.object_key
  source   = var.source_file
}
