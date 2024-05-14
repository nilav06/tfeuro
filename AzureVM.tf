resource "azurerm_linux_virtual_machine" "linux-vm" {
name="my-linux1"
resource_group_name = data.azurerm_resource_group.nn_rsg.name
location = data.azurerm_resource_group.nn_rsg.location


admin_username ="adminuser"
admin_password = "Eurofins@123"
disable_password_authentication = false
network_interface_ids =[azurerm_network_interface.example.id]
size = "standard_f2"
os_disk {
  caching = "ReadWrite"
  storage_account_type = "Standard_LRS"
}
 source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
}
}