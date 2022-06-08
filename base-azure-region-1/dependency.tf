output resourceGroup {
  value = azurerm_resource_group.rg.name
}
output hubVnetName {
    value = azurerm_virtual_network.f5-xc-hub.name
}
