variable "resource_group_name" {
  description = "Name of resoruce group"
  type        = string
}

variable "iot_hub_name" {
  description = "Name of IoT Hub instance"
  type        = string
}

variable "iot_edge_device_name" {
  description = "Name of IoT Edge Device"
  type        = string
}

variable "modules_content_file" {
  description = "File of Module Content"
  type        = string
  default     = null
}
