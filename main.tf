terraform {
  required_version = ">= 1.7.10"
  required_providers {
    shell = {
      source  = "scottwinkler/shell"
      version = "1.7.10"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.112.0"
    }
  }
}

resource "shell_script" "register_iot_edge_device" {
  lifecycle_commands {
    create = "$SCRIPT create"
    read   = "$SCRIPT read"
    delete = "$SCRIPT delete"
  }

  environment = {
    IOT_HUB_NAME         = var.iot_hub_name
    RESOURCE_GROUP       = var.resource_group_name
    IOT_EDGE_DEVICE_NAME = var.iot_edge_device_name
    SCRIPT               = "./scripts/register_iot_edge_device.sh"
  }
}

resource "shell_script" "set_iot_edge_modules" {
  count = var.modules_content_file != null ? 1 : 0
  lifecycle_commands {
    create = "$SCRIPT create"
    read   = "$SCRIPT read"
    delete = "$SCRIPT delete"
  }

  environment = {
    IOT_HUB_NAME         = var.iot_hub_name
    RESOURCE_GROUP       = var.resource_group_name
    IOT_EDGE_DEVICE_NAME = var.iot_edge_device_name
    MODULES_CONTENT_FILE = var.modules_content_file
    SCRIPT               = "./scripts/set_iot_edge_modules.sh"
  }
  triggers = {
    when_value_changed= shell_script.register_iot_edge_device.output["connectionString"]
  }
}
