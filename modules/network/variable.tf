variable "vpc_name" {
  description = "vpc name"
}

variable "vpc_cidr" {
  description = "vpc cidr"
  default     = "172.16.0.0/16"
}

variable "vswitches" {
  description = "switches list"
  type = list(object({
    name       = string
    cidr_block = string
  }))
}

variable "resource_group_id" {
  description = "resource group id"
}