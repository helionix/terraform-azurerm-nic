# terraform-azurerm-nic

## Create a network interface in Azure

This terraform module creates network interface in Azure

## Usage

```hcl
module "nic" {
    source = "github.com/helionix/terraform-azurerm-nic"
    
    resource_group_name = "my-rg"
    name = "my-nic"
    subnet_id = "${var.my_subnet_id}"

    tags = {
      environment = "myenv"
    }
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| assign\_public\_ip | Allocates and attaches public ip to NIC | string | `"false"` | no |
| count | Number of nics | string | `"1"` | no |
| enable\_accelerated\_networking | Enables Azure Accelerated Networking using SR-IOV. | string | `"false"` | no |
| enable\_ip\_forwarding | Enable IP forwarding for NIC | string | `"false"` | no |
| name | The name of the network interface. Changing this forces a new resource to be created. | string | n/a | yes |
| network\_security\_group\_id | The ID of the Network Security Group to associate with the network interface. | string | `""` | no |
| private\_ip\_address | Static IP Address. | string | `""` | no |
| private\_ip\_address\_allocation | Defines how a private IP address is assigned. Options are Static or Dynamic. | string | `"Dynamic"` | no |
| public\_ip\_allocation\_method | Defines the allocation method for this public IP address. Possible values are Static or Dynamic*. | string | `"Dynamic"` | no |
| resource\_group\_name | The name of resource group in which resources will be created | string | n/a | yes |
| subnet\_id | Reference to a subnet in which this NIC has been created. | string | n/a | yes |
| tags | A mapping of tags to assign to the resource. | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_network\_interface\_ids | The IDs of the network interfaces |
| this\_network\_interface\_mac\_addresses | The media access control (MAC) addresses of the network interfaces. |
| this\_network\_interface\_names | The names of the network interfaces |
| this\_network\_interface\_private\_ip\_addresses | The first private IP addresses of the network interfaces |
| this\_network\_interface\_public\_ip\_addresses | Public IP addresses of the network interfaces |


## License

[MIT](LICENSE)