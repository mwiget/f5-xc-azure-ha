output workload1a_pip {
  value = azurerm_linux_virtual_machine.workload1a.public_ip_address
}
output workload1a_private_ip {
  value = azurerm_linux_virtual_machine.workload1a.private_ip_address
}

output workload1b_pip {
  value = azurerm_linux_virtual_machine.workload1b.public_ip_address
}
output workload1b_private_ip {
  value = azurerm_linux_virtual_machine.workload1b.private_ip_address
}
output workload1c_pip {
  value = azurerm_linux_virtual_machine.workload1c.public_ip_address
}
output workload1c_private_ip {
  value = azurerm_linux_virtual_machine.workload1c.private_ip_address
}
