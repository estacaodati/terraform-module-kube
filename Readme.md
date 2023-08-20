## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.16.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.16.0 |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.default](https://registry.terraform.io/providers/hashicorp/azurerm/3.16.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.16.0/docs/resources/resource_group) | resource |
| [helm_release.chart_grafana](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.chart_prometheus](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.ns_monitoracao](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | RBAC Client ID gerado | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | RBAC Secret gerado | `string` | n/a | yes |
| <a name="input_enable_grafana"></a> [enable\_grafana](#input\_enable\_grafana) | Habilitar o deploy to grafana | `bool` | `false` | no |
| <a name="input_enable_prometheus"></a> [enable\_prometheus](#input\_enable\_prometheus) | Habilitar o deploy to prometheus | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | Ambiente de criação do cluster | `string` | n/a | yes |
| <a name="input_k8s_node_count"></a> [k8s\_node\_count](#input\_k8s\_node\_count) | Quantidade de nos usados no cluster k8s | `number` | n/a | yes |
| <a name="input_k8s_node_os_disk_size"></a> [k8s\_node\_os\_disk\_size](#input\_k8s\_node\_os\_disk\_size) | Tamanho dos discos dos nos usados no cluster k8s | `number` | n/a | yes |
| <a name="input_k8s_node_vm_size"></a> [k8s\_node\_vm\_size](#input\_k8s\_node\_vm\_size) | Tamanho dos nos usados no cluster k8s | `string` | n/a | yes |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | Nome do nó usado pelos agents do K8s | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Prefixo usado em cada projeto | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_k8s_client_certificate"></a> [k8s\_client\_certificate](#output\_k8s\_client\_certificate) | n/a |
| <a name="output_k8s_client_key"></a> [k8s\_client\_key](#output\_k8s\_client\_key) | n/a |
| <a name="output_k8s_cluster_ca_certificate"></a> [k8s\_cluster\_ca\_certificate](#output\_k8s\_cluster\_ca\_certificate) | n/a |
| <a name="output_k8s_host"></a> [k8s\_host](#output\_k8s\_host) | n/a |
| <a name="output_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#output\_kubernetes\_cluster\_name) | n/a |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | n/a |
