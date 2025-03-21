resource "alicloud_apig_http_api" "this" {
  http_api_name    = var.http_api_name
  protocols        = [var.protocol]
  base_path        = var.base_path
  description      = var.description
  type             = "Http"
  resource_group_id = var.resource_group_id
}

resource "alicloud_apig_gateway" "this" {
  gateway_name = var.gateway_name
  spec         = var.gateway_spec
  vpc {
    vpc_id = var.vpc_id
  }
  vswitch {
    vswitch_id = var.vswitch_id
  }

  zone_config {
    select_option = "Auto"
  }

  network_access_config {
    type = "Internet"
  }

  log_config {
    sls {
      enable = "false"
    }
  }
  resource_group_id = var.resource_group_id
  payment_type      = "PayAsYouGo"
}

resource "alicloud_apig_environment" "default" {
  description       = "test"
  environment_name  = "himi-apig-environment"
  gateway_id        = alicloud_apig_gateway.this.id
  resource_group_id = var.resource_group_id
}