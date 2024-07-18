# Terraform IoT Edge Device Registration

This project uses Terraform to manage the identity of an IoT Edge device in Azure. It utilizes the `shell` provider to execute a shell script that interacts with the Azure CLI (`az`).

## Project Structure

- `main.tf`: Terraform configuration file defining the `shell_script` resource to manage the IoT Edge device.
- `modules/terraform-iot-edge-device/scripts/register_iot_edge_device.sh`: Shell script that performs create, read, and delete operations for the IoT Edge device identity.

## Requirements

- [Terraform](https://www.terraform.io/downloads) 1.0 or later
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) 2.0 or later

## Configuration

1. **Variables**: Ensure you define the following variables in a `terraform.tfvars` file or directly in the `main.tf` file:

   - `iot_hub_name`: Name of the IoT hub in Azure.
   - `resource_group_name`: Name of the resource group in Azure.
   - `iot_edge_device_name`: Name of the IoT Edge device.

2. **Shell Script**: The `register_iot_edge_device.sh` script performs the following operations:
   
   - `create`: Creates the IoT Edge device identity in the IoT hub.
   - `read`: Displays the connection string of the device.
   - `delete`: Deletes the IoT Edge device identity from the IoT hub.

## Usage

1. **Initialize Terraform**:

   ```
   terraform init
   ```

2. **Apply the configuration**:

   ```
   terraform apply
   ```

   Terraform will execute the shell script specified in the `shell_script` resource and manage the IoT Edge device identity according to the defined lifecycle command (create, read, or delete).

3. **Optional**: You can apply specific `create`, `read`, or `delete` commands by configuring the `SCRIPT` environment variable in `main.tf`.

## Command Examples

To create an IoT Edge device:

```
terraform apply
```

To delete an IoT Edge device:

```
terraform destroy
```

## Contributing

If you wish to contribute to the project, please fork the repository and submit a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
