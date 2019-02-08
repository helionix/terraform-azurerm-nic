# terraform-azurerm-vnet

## Create a virtual network in Azure

This terraform module creates virtual network with subnets in Azure

## Usage

```hcl
module "vnet" {
    source = "github.com/helionix/terraform-azurerm-vnet"
    resource_group_name = "my-rg"
    address_space = "10.0.0.0/16"
    subnets = {
      "default" = "10.0.1.0/24"
    }

    tags = {
      environment = "myenv"
    }
}

```


## License

[MIT](LICENSE)