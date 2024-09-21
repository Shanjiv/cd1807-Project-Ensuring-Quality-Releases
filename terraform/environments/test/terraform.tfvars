# Azure subscription vars
subscription_id = ""
client_id       = ""
client_secret   = ""
tenant_id       = ""

# Resource Group/Location
location            = "West Europe" 
resource_group_name = "Azuredevops"
application_type    = "myApplication"

# Network
virtual_network_name = "myVNet"              
address_space        = ["10.5.0.0/16"]
address_prefix_test  = "10.5.1.0/24"         

# VM
vm_name            = "myLinuxVM"
vm_nic_name        = "myLinuxVMNic"
subnet_id          = "subnet-12345"          
public_ip_id       = "publicip-12345"         
admin_username     = "adminuser"
admin_ssh_key      = "~/.ssh/id_rsa.pub"      
