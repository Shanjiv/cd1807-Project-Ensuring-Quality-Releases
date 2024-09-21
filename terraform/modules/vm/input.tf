
variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_nic_name" {
  description = "The name of the NIC for the VM"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the VM"
  type        = string
}

variable "public_ip_id" {
  description = "The ID of the public IP to associate with the VM"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "admin_ssh_key" {
  description = "The path to the public SSH key for the VM"
  type        = string
}
