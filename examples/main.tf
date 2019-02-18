variable "subnet_name" {
  default = "default"
}

resource "azurerm_resource_group" "rg" {
  location = "EastUS"
  name = "my-rg"
}

module "vnet" {
  source = "github.com/helionix/terraform-azurerm-vnet"
  
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space = "10.0.0.0/16"
  
  subnets = {
    "default" = "10.0.1.0/24"
  }

  tags = {
    environment = "myenv"
  }
}

module "nic" {
  source = "github.com/helionix/terraform-azurerm-nic"

  resource_group_name = "${azurerm_resource_group.rg.name}"
  name = "my-nic"
  subnet_id = "${element(module.vnet.vnet_subnets_ids, index(module.vnet.vnet_subnets_names, var.subnet_name))}"

  tags = {
    environment = "myenv"
  }
}