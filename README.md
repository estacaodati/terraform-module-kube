# terraform-module-kube

Repositório lançado para ensinar a criação de modulos e o versionamento utilizando tags. Este repositório faz parte de uma playlist lançada no canal 🚂 [@estacaodati](https://www.youtube.com/@estacaodati)


#### Se você deseja saber mais por onde começar, este é o primeiro vídeo da série:

[![Jornada Kubernetes](https://img.youtube.com/vi/a0QOsQivywY/0.jpg)](https://www.youtube.com/watch?v=a0QOsQivywY "Playlist Jornada Kubernetes")


### Exemplo de como usar este modulo

```Terraform
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.112.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
}

module "aks_lab" {
  source                = "git::https://github.com/estacaodati/terraform-module-kube"
  env                   = "dev"
  project_name          = "trilha-aks"
  node_pool_name        = "default"
  client_id             = ""
  client_secret         = ""
  k8s_node_vm_size      = "Standard_B2s"
  k8s_node_count        = 1
  k8s_node_os_disk_size = 30
  enable_prometheus     = false
  enable_grafana        = false
  region                = "canadacentral"
}
```