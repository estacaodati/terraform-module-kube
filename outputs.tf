output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.default.name
}

output "k8s_client_certificate" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.client_certificate
}

output "k8s_client_key" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.client_key
}

output "k8s_cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate
}

output "k8s_host" {
  value = azurerm_kubernetes_cluster.default.kube_config.0.host
}
