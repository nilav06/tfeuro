#Creating azure network 
resource "azurerm_virtual_network" "azure-network" {
    resource_group_name =data.azurerm_resource_group.nn_rsg.name
location = data.azurerm_resource_group.nn_rsg.location
name="my-network"
address_space = ["10.0.0.0/16"]
  
}
#Creating subnet
resource "azurerm_subnet" "my-network" {
    name = "my-subnet"
#virtual_network_name =azurerm_virtual_network.azure-network .my-network.name
resource_group_name = data.azurerm_resource_group.nn_rsg.name
virtual_network_name = azurerm_virtual_network.azure-network.name
address_prefixes = [ "10.0.1.0/24" ]
}
# Creating network inerfaces from subnet
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = data.azurerm_resource_group.nn_rsg.location
  resource_group_name = data.azurerm_resource_group.nn_rsg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.my-network.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.nn-publicip1.id
  }
  }

  # Creating a public ip 
  resource "azurerm_public_ip" "nn-publicip1" {
    name = "my-publicip1"
    resource_group_name = data.azurerm_resource_group.nn_rsg.name
    location = data.azurerm_resource_group.nn_rsg.location
    allocation_method = "Static"    
  }