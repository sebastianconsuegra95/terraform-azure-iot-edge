output "iot_edge_connection_string" {
  value = shell_script.register_iot_edge_device.output["connectionString"]
}
