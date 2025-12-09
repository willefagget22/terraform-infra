
# Resource Groups
resource "azurerm_resource_group" "lab-dev" {
  name     = "rglabdev"
  location = var.location

  tags = var.tagsrg
}
resource "azurerm_resource_group" "lab-tst" {
  name     = "rglabtst"
  location = var.location

  tags = var.tagsrg
}

resource "azurerm_resource_group" "lab-prd" {
  name     = "rglabprd"
  location = var.location

  tags = var.tagsrg
}




# ------------------------------------------------------------------------------


# Storage Accounts
resource "azurerm_storage_account" "lab-dev" {
  name                     = "storageaccountlabdev" 
  resource_group_name      = azurerm_resource_group.lab-dev.name
  location                 = var.location
  account_tier             = "Standard" 
  account_replication_type = "LRS"      

  tags = var.tags 
}

resource "azurerm_storage_account" "lab-tst" {
  name                     = "storageaccountlabtst" 
  resource_group_name      = azurerm_resource_group.lab-tst.name
  location                 = var.location
  account_tier             = "Standard" 
  account_replication_type = "LRS"      

 tags = var.tags 
}
resource "azurerm_storage_account" "lab-prd" {
  name                     = "storageaccountlabprd" 
  resource_group_name      = azurerm_resource_group.lab-prd.name
  location                 = var.location
  account_tier             = "Standard" 
  account_replication_type = "LRS"      

  tags = var.tags
}



# ------------------------------------------------------------------------------


# virutal maski i dev rg
# den ska finnas i swweden central
# den ska ha LRS ( du kommer se vad det är)
# Den sha vara Ubuntu Linux 20.04
# SKU får du bestämma själv, kolla på vilka som finnas

#------------------------------------------------------------------------------
# Create Virtual Machine 


resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.lab-dev.name 
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.lab-dev.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.lab-dev.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "lab-dev" {
  name                  = "${var.prefix}-vm"
  location              = var.location
  resource_group_name   = azurerm_resource_group.lab-dev.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_DS1_v2"
  tags = var.tags



  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "OSdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "WilleJ"
    admin_username = "Wille"
    admin_password = "Wille12345!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  } 
}

# ------------------------------------------------------------------------------


resource "azurerm_public_ip" "publicip" {
  name                = "MinPublikaIP"
  resource_group_name = azurerm_resource_group.lab-dev.name
  location            = var.location
  allocation_method   = "Static"

  tags = var.tags
}



