terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.16.0"
    }
  }
}

provider "azurerm" {
  features {
  }
}

provider "kubernetes" {
  host = azurerm_kubernetes_cluster.default.kube_config.0.host

  client_certificate     = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
}

provider "helm" {
  kubernetes {
    host     =  azurerm_kubernetes_cluster.default.kube_config.0.host

    client_certificate     = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.client_certificate)
    client_key             = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.client_key)
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.default.kube_config.0.cluster_ca_certificate)
  }
}

resource "azurerm_resource_group" "rg" {
  name     =  "k8s-${var.env}-${var.project_name}"
  location = var.region
}

resource "kubernetes_namespace" "ns_monitoracao" {
  count      = var.enable_grafana || var.enable_prometheus ? 1 : 0
  metadata {
    name = "monitoracao"
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "k8s-${var.env}-${var.project_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "k8s-${var.env}-${var.project_name}"

  default_node_pool {
    name            = var.node_pool_name
    node_count      = var.k8s_node_count
    vm_size         = var.k8s_node_vm_size
    os_disk_size_gb = var.k8s_node_os_disk_size
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control_enabled = true

  tags = {
    Ambiente = var.env
  }
}

resource "helm_release" "chart_grafana" {
  count      = var.enable_grafana ? 1 : 0
  name       = "grafana"
  chart      = "grafana"
  namespace  = "monitoracao"
  version     = "6.50.2"

  repository = "https://grafana.github.io/helm-charts"
}

resource "helm_release" "chart_prometheus" {
  count      = var.enable_prometheus ? 1 : 0
  name       = "prometheus"
  chart      = "prometheus"
  namespace  = "monitoracao"
  version    = "19.3.1"

  repository = "https://prometheus-community.github.io/helm-charts"
}
