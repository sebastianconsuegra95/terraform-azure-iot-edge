terraform {
  required_providers {
    shell = {
      source  = "scottwinkler/shell"
      version = "1.7.10"
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
    SCRIPT               = "./modules/terraform-iot-edge-device/scripts/register_iot_edge_device.sh"
  }
}
