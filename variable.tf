# Login Credentials
variable "access_key" {}
variable "secret_key" {}

# Cloud Region
variable "region" {
    default = "cn-hongkong"
}

variable "resource_group" {
  default = "himi-rg"
}

variable "vpc" {
  type = object({
    name      = string
    cidr      = string
    vswitches = list(object({
      name      = string
      cidr_block = string
    }))
  })

  default = {
    name  = "himi-vpc"
    cidr  = "172.16.0.0/16"
    vswitches = [
      { name = "himi-vsw-1", cidr_block = "172.16.0.0/24" },
      { name = "himi-vsw-2", cidr_block = "172.16.1.0/24" }
    ]
  }
}

variable "security_group" {
  type = object({
    name = string
  })
  default = {
    name = "himi-test-sg"
  }
}

variable "api_gateway" {
    type = object({
        api_name = string
        gateway_name = string
        type = string
    })
    default = {
        api_name = "himi-http-api"
        gateway_name = "himi-api-gateway"
        type = "Http" # Rest or Http
    }
}

variable "oss" {
    type = object({
      name = string
      object_key = string
      source_file = string
    })
    default = {
        name = "himi-bucket-test-1235",
        object_key = "main.tf"
        source_file = "main.tf"
    }
}