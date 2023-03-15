variable "env" {
  type = string
  description = "Ambiente de criação do cluster"

  validation {
    condition = length(var.env) < 4
    error_message = "O tamanho do nome do ambiente deve ter 3 letras"
  }
}

variable "project_name" {
  type = string
  description = "Prefixo usado em cada projeto"
}

variable "node_pool_name" {
  type = string
  description = "Nome do nó usado pelos agents do K8s"
}

variable "client_id" {
  type = string
  description = "RBAC Client ID gerado"
}

variable "client_secret" {
  type = string
  description = "RBAC Secret gerado"
}

variable "k8s_node_vm_size" {
  type = string
  description = "Tamanho dos nos usados no cluster k8s"
}

variable "k8s_node_count" {
  type = number
  description = "Quantidade de nos usados no cluster k8s"
}

variable "k8s_node_os_disk_size" {
  type = number
  description = "Tamanho dos discos dos nos usados no cluster k8s"
}

variable "enable_prometheus" {
  type = bool
  description = "Habilitar o deploy to prometheus"
  default = false
}

variable "enable_grafana" {
  type = bool
  description = "Habilitar o deploy to grafana"
  default = false
}