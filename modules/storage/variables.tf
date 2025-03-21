variable "bucket_name" {
  description = "OSS bucket name"
}

variable "resource_group_id" {
  description = "resource group ID"
}

variable "acl" {
  description = "bucket access control list"
  default     = "public-read-write"
}

variable "object_key" {
  description = "OSS object key"
}

variable "source_file" {
  description = "source file path"
}