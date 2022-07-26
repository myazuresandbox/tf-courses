# Write a logic to create three virtual networks Vnet-A, Vnet-B, and Vnet-C simultaneously. 
# Write the logic in main.tf and variables.tf using count and elements parameters.
# Hint: Name = "vnet-${element(var.name,count.index)}"

# If you run the 'terraform plan' it shows three virtual networks. Run 'terraform apply' to create virtual networks.
# Destroy all the virtual networks created by using the terraform command.

# Ternary Operator
# Modify the main.tf and variables.tf files to create a virtual network named 'myvnet' using ternary operator.
# Define a variable named 'no_of_vnets' in variables.tf, and provide the default value as 2.
# Call the variable in the main.tf file using the ternary operator.
# Hint: Count = "{var.no_of_vnets ==2 ?1 : 0}" name = "var.no​of​vnets==2?1:0"name="{var.name}"

# Launch azure CLI and install terraform using the below commands
# sudo wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip
# sudo unzip terraform_0.11.10_linux_amd64.zip
# sudo mv terraform /usr/local/bin/
# terraform -

#curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

resource "azurerm_resource_group" "rg-user-xyzr" {
  name = "${var.resource_group}"
  location   = "${var.location}"
}

resource "azurerm_virtual_network" "Vnet" {
   name = "vnet-${element(var.name,count.index)}"
   resource_group_name="${var.resource_group}"
   location="${var.location}"
   address_space= "${var.address}" #["10.0.0.0/16"]
   count = "${var.no_of_vnets ==3 ?1  : 0}"
}


resource "azurerm_virtual_network" "Vnet2" {
   name = "vnet--${count.index}-${element(var.name,count.index)}"
   resource_group_name="${var.resource_group}"
   location="${var.location}"
   address_space= "${var.address}" #["10.0.0.0/16"]
   count = "3"
}