output "this_network_interface_names" {
  description = "The names of the network interfaces"
  value       = "${coalescelist(azurerm_network_interface.this.*.name, azurerm_network_interface.this_public.*.name)}"
}

output "this_network_interface_ids" {
  description = "The IDs of the network interfaces"
  value       = "${coalescelist(azurerm_network_interface.this.*.id, azurerm_network_interface.this_public.*.id)}"
}

output "this_network_interface_private_ip_addresses" {
  description = "The first private IP addresses of the network interfaces"
  value       = "${coalescelist(azurerm_network_interface.this.*.private_ip_address, azurerm_network_interface.this_public.*.private_ip_address)}"
}

output "this_network_interface_mac_addresses" {
  description = "The media access control (MAC) addresses of the network interfaces."
  value       = "${coalescelist(azurerm_network_interface.this.*.mac_address, azurerm_network_interface.this_public.*.mac_address)}"
}

output "this_network_interface_public_ip_addresses" {
  description = "Public IP addresses of the network interfaces"
  value       = "${element(concat(azurerm_public_ip.this.*.ip_address, list("")), 0)}"
}
