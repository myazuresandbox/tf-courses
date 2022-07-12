# tf-course-530

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
