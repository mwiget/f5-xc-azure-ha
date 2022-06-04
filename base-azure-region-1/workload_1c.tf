# Create public IPs
resource "azurerm_public_ip" "workload1c" {
  name                = "workload_1c_pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azureRegion1
  zones               = [3]
  allocation_method   = "Dynamic"
}

# Create NIC
resource "azurerm_network_interface" "workload1c" {
  name                = "workload-nic-1c"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azureRegion1

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.workload-peer.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.workload1c.id
  }
}
# Create virtual machine
resource "azurerm_linux_virtual_machine" "workload1c" {
  name                = "workload-1c"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azureRegion1
  zone                = 3
  size                = "Standard_DS1_v2"

  network_interface_ids = [azurerm_network_interface.workload1c.id]

  os_disk {
    name                 = "workload1c"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "workload1c"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  custom_data = "${filebase64("./custom_data.sh")}"
  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_public_key
  }
}
