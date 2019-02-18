# NIC parameters

variable "count" {
  description = "Number of nics"
  type        = "string"
  default     = 1
}

variable "name" {
  description = "The name of the network interface. Changing this forces a new resource to be created."
  type        = "string"
}

variable "resource_group_name" {
  description = "The name of resource group in which resources will be created"
  type        = "string"
}

variable "enable_ip_forwarding" {
  description = "Enable IP forwarding for NIC"
  type        = "string"
  default     = false
}

variable "enable_accelerated_networking" {
  description = "Enables Azure Accelerated Networking using SR-IOV."
  type        = "string"
  default     = false
}

variable "network_security_group_id" {
  description = "The ID of the Network Security Group to associate with the network interface."
  type        = "string"
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to the resource."
  type        = "map"
  default     = {}
}

# IP-configuration parameters

variable "private_ip_address_allocation" {
  description = "Defines how a private IP address is assigned. Options are Static or Dynamic."
  type        = "string"
  default     = "Dynamic"
}

variable "private_ip_address" {
  description = "Static IP Address."
  type        = "string"
  default     = ""
}

variable "subnet_id" {
  description = "Reference to a subnet in which this NIC has been created."
  type        = "string"
}

# Public IP parameters

variable "assign_public_ip" {
  description = "Allocates and attaches public ip to NIC"
  type        = "string"
  default     = false
}

variable "public_ip_allocation_method" {
  description = "Defines the allocation method for this public IP address. Possible values are Static or Dynamic*."
  type        = "string"
  default     = "Dynamic"
}
