#  resource "azurerm_resource_group" "name" {
#   name =  "hellors"
#   location = "Central US"
#  }
# #Using existing resource group
data "azurerm_resource_group" "nn_rsg" {
  name = "azuremanual-resourcegrp"
}