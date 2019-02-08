output "this_network_interface_names" {
  description = ""
  value       = "${coalescelist(azurerm_network_interface.this.*.name, azurerm_network_interface.this_public.*.name)}"
}

output "this_network_interface_id" {
  description = "The ID of the network interface"
  value       = "${coalescelist(azurerm_network_interface.this.*.id, azurerm_network_interface.this_public.*.id)}"
}

output "this_network_interface_private_ip_address" {
  description = "The first private IP address of the network interface"
  value       = "${coalescelist(azurerm_network_interface.this.*.private_ip_address, azurerm_network_interface.this_public.*.private_ip_address)}"
}

output "this_network_interface_mac_address" {
  description = "The media access control (MAC) address of the network interface."
  value       = "${coalescelist(azurerm_network_interface.this.*.mac_address, azurerm_network_interface.this_public.*.mac_address)}"
}

output "this_network_interface_public_ip_address" {
  description = "Public IP address of the network interface"
  value       = "${element(concat(azurerm_public_ip.this.*.ip_address, list("")), 0)}"
}
