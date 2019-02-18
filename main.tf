data "azurerm_resource_group" "this" {
  name = "${var.resource_group_name}"
}

resource "azurerm_public_ip" "this" {
  count = "${var.assign_public_ip ? var.count : 0 }"

  resource_group_name = "${data.azurerm_resource_group.this.name}"
  location            = "${data.azurerm_resource_group.this.location}"

  name              = "${var.name}-${count.index}"
  allocation_method = "${var.public_ip_allocation_method}"

  tags = "${var.tags}"
}

resource "azurerm_network_interface" "this" {
  count = "${ var.assign_public_ip ? 0 : var.count }"

  resource_group_name = "${data.azurerm_resource_group.this.name}"
  location            = "${data.azurerm_resource_group.this.location}"

  name                          = "${var.name}-${count.index}"
  enable_ip_forwarding          = "${var.enable_ip_forwarding}"
  enable_accelerated_networking = "${var.enable_accelerated_networking}"
  network_security_group_id     = "${var.network_security_group_id}"

  ip_configuration {
    name                           = "${var.name}-${count.index}"
    private_ip_address_allocation  = "${var.private_ip_address_allocation}"
    subnet_id                      = "${var.subnet_id}"
    private_ip_address             = "${var.private_ip_address}"
    application_security_group_ids = "${var.application_security_group_ids}"
  }

  tags = "${var.tags}"
}

resource "azurerm_network_interface" "this_public" {
  count = "${ var.assign_public_ip ? var.count : 0 }"

  resource_group_name = "${data.azurerm_resource_group.this.name}"
  location            = "${data.azurerm_resource_group.this.location}"

  name                          = "${var.name}-${count.index}"
  enable_ip_forwarding          = "${var.enable_ip_forwarding}"
  enable_accelerated_networking = "${var.enable_accelerated_networking}"
  network_security_group_id     = "${var.network_security_group_id}"

  ip_configuration {
    name                           = "${var.name}-${count.index}"
    private_ip_address_allocation  = "${var.private_ip_address_allocation}"
    subnet_id                      = "${var.subnet_id}"
    private_ip_address             = "${var.private_ip_address}"
    public_ip_address_id           = "${azurerm_public_ip.this.id}"
  }

  tags = "${var.tags}"
}
