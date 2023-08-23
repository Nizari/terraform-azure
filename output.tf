output "resource_group_id" {
  value = azurerm_resource_group.nizari.id
}

output "namespaceA_id" {
  value = azurerm_servicebus_namespace.namespaceA.id
}
output "namespaceB_id" {
  value = azurerm_servicebus_namespace.namespaceB.id
}
output "namespaceC_id" {
  value = azurerm_servicebus_namespace.namespaceC.id
}
output "team1_id" {
  value = azurerm_monitor_action_group.team1.id
}
output "team2_id" {
  value = azurerm_monitor_action_group.team2.id
}
output "team3_id" {
  value = azurerm_monitor_action_group.team3.id
}
