provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "tfstate880224537"
    container_name       = "tfstate"
    key                  = "test.terraform.tfstate"
    access_key           = ""
  }
}
module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = "${var.resource_group_name}"
  location             = "${var.location}"
}
module "network" {
  source               = "../../modules/network"
  address_space        = "${var.address_space}"
  location             = "${var.location}"
  virtual_network_name = "${var.virtual_network_name}"
  application_type     = "${var.application_type}"
  resource_type        = "NET"
  resource_group       = "${module.resource_group.resource_group_name}"
  address_prefix_test  = "${var.address_prefix_test}"
}

module "nsg-test" {
  source           = "../../modules/networksecuritygroup"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "NSG"
  resource_group   = "${module.resource_group.resource_group_name}"
  subnet_id        = "${module.network.subnet_id_test}"
  address_prefix_test = "${var.address_prefix_test}"
}
module "appservice" {
  source           = "../../modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "AppService"
  resource_group   = "${module.resource_group.resource_group_name}"
}
module "publicip" {
  source           = "../../modules/publicip"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "publicip"
  resource_group   = "${module.resource_group.resource_group_name}"
}

module "vm" {
  source               = "../../modules/vm"                # Pfad zum VM-Modul
  location             = "${var.location}"                 # Referenziere die Location
  resource_group_name  = "${module.resource_group.resource_group_name}"  # Resource Group vom resource_group Modul
  vm_name              = "${var.vm_name}"                  # Name der VM
  vm_nic_name          = "${var.vm_nic_name}"              # Name der NIC
  subnet_id            = "${module.network.subnet_id_test}"  # Referenziere das Subnetz aus dem Network-Modul
  public_ip_id         = "${module.publicip.public_ip_id}"  # Referenziere die Public IP aus dem publicip Modul
  admin_username       = "${var.admin_username}"           # SSH Admin-Username
  admin_ssh_key        = "${var.admin_ssh_key}"            # SSH Key
}
