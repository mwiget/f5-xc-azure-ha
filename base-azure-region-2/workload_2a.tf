# Create public IPs
resource "azurerm_public_ip" "workload2a" {
  name                = "workload_2a_pip"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azureRegion2
  zones               = [1]
  allocation_method   = "Static"
  sku                 = "Standard"
}

# Create NIC
resource "azurerm_network_interface" "workload2a" {
  name                = "workload-nic-2a"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azureRegion2

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.workload-peer.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.workload2a.id
  }
}
# Create virtual machine
resource "azurerm_linux_virtual_machine" "workload2a" {
  name                = "workload-2a"
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azureRegion2
  zone                = 1
  size                = "Standard_DS1_v2"

  network_interface_ids = [azurerm_network_interface.workload2a.id]

  os_disk {
    name                 = "workload2a"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  computer_name                   = "workload2a"
  admin_username                  = "azureuser"
  disable_password_authentication = true

  custom_data = "${filebase64("./custom_data.sh")}"
  admin_ssh_key {
    username   = "azureuser"
    public_key = var.ssh_public_key
  }
}
