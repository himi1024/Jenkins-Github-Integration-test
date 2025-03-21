variable "http_api_name" {
  description = "HTTP API name"
}

variable "protocol" {
  description = "protocol type"
  default     = "HTTP"
}

variable "base_path" {
  description = "base path of the api gateway"
  default     = "/"
}

variable "description" {
  description = "api gateway description"
  default     = "api gateway description"
}

variable "resource_group_id" {
  description = "resource group id"
}

variable "gateway_name" {
  description = "gateway name"
}

variable "gateway_spec" {
  description = "spec of gateway"
  default     = "apigw.small.x1"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "vswitch_id" {
  description = "vswitch ID"
}

variable "type"{
  description = "Protocol type"
}