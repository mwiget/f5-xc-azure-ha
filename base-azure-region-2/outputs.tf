output workload2a_pip {
  value = azurerm_linux_virtual_machine.workload2a.public_ip_address
}
output workload2a_private_ip {
  value = azurerm_linux_virtual_machine.workload2a.private_ip_address
}

output workload2b_pip {
  value = azurerm_linux_virtual_machine.workload2b.public_ip_address
}
output workload2b_private_ip {
  value = azurerm_linux_virtual_machine.workload2b.private_ip_address
}
output workload2c_pip {
  value = azurerm_linux_virtual_machine.workload2c.public_ip_address
}
output workload2c_private_ip {
  value = azurerm_linux_virtual_machine.workload2c.private_ip_address
}
