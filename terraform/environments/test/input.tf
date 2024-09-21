# Azure GUIDS
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

# Resource Group/Location
variable "location" {}
variable "resource_group_name" {}
variable "application_type" {}

# Network
variable "virtual_network_name" {}
variable "address_prefix_test" {}
variable "address_space" {}

# VM (Fehlende Variablen hinzufügen)
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_nic_name" {
  description = "The name of the network interface for the VM"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet for the VM"
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP for the VM"
  type        = string
}

variable "admin_ssh_key" {
  description = "The path to the public SSH key for the VM"
  type        = string
}
