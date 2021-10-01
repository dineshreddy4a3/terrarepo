provider "azurerm" {
  features {}
  version         = "=2.46.0"
  subscription_id = "6bfcdbee-efe9-44b6-afc4-83b9beef5b5c"
  client_id       = "1583b3f3-1d7d-462e-9b67-f05f6dde236f"
  client_secret   = "YbK7Q~henJLzGr9KupP7K6Fv3Ngd_CusAPqxf"
  tenant_id       = "6eca0ef4-2527-48f1-bc00-90a138a9a3f8"
}

terraform {
  backend "azurerm" {
    storage_account_name = "teststorageaccount454"
    container_name       = "container1"
    key                  = "terraform.tfstate"
    access_key = "+YrLy7omiRg/027zqk1pZV09Vv7x4Idag9VUJJuxHxSOiRNpDedQJ31SQwgYfB5F14ypFH66iv1tFgNIvDv7TA=="
  }
}
resource "azurerm_resource_group" "example" {
  name     = "despiprg"
  location = "West Europe"
}

resource "azurerm_public_ip" "example" {
  name                          = "Pub100"
  resource_group_name = azurerm_resource_group.example.name
  location                      = azurerm_resource_group.example.location
  allocation_method      = "Static"
    tags = {
    environment = "Production"
  }
}

resource "azurerm_managed_disk" "example" {
 name                         = "disk10000"
 location                      = azurerm_resource_group.example.location
 resource_group_name = azurerm_resource_group.example.name
storage_account_type   = "Standard_LRS"
create_option               = "Empty"
disk_size_gb                 = "2"
}