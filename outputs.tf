output "iot_edge_connection_string" {
  description = "Edge Device Connection String"
  value       = shell_script.register_iot_edge_device.output["connectionString"]
}
