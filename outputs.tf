output "iot_edge_connection_string" {
  description = "Edge Device Connection String"
  value       = shell_script.register_iot_edge_device.output["connectionString"]
}

output "iot_edge_device_name" {
  description = "Name of IoT Edge Device"
  value       = var.iot_edge_device_name
}

output "resource_group_name" {
  description = "Name of resoruce group"
  value       = var.resource_group_name
}

output "iot_hub_name" {
  description = "Name of IoT Hub instance"
  value       = var.iot_hub_name
}