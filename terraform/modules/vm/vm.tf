resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_nic_name}"              # Variable für den NIC Namen
  location            = "${var.location}"                 # Variable für Location
  resource_group_name = "${var.resource_group_name}"      # Variable für Resource Group

  ip_configuration {
    name                          = "internal"
    subnet_id                     = "${var.subnet_id}"    # Variable für Subnetz ID
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${var.public_ip_id}" # Variable für Public IP
  }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${var.vm_name}"                   # Variable für VM Namen
  location            = "${var.location}"                  # Variable für Location
  resource_group_name = "${var.resource_group_name}"       # Variable für Resource Group
  size                = "Standard_DS2_v2"
  admin_username      = "${var.admin_username}"            # Variable für Admin Username
  network_interface_ids = ["${azurerm_network_interface.vm_nic.id}"] # NIC ID referenzieren

  admin_ssh_key {
    username   = "${var.admin_username}"                   # Admin Username aus Variable
    public_key = file("${var.admin_ssh_key}")              # SSH Key aus Variable
  }

  os_disk {
    caching             = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
