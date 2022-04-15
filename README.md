# projectB5
Модуль B5

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.73.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.73.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_yandex_vm_1"></a> [yandex\_vm\_1](#module\_yandex\_vm\_1) | ./modules/yandex_cloud_vm | n/a |
| <a name="module_yandex_vm_2"></a> [yandex\_vm\_2](#module\_yandex\_vm\_2) | ./modules/yandex_cloud_vm | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_vpc_network.b5-network](https://registry.terraform.io/providers/yandex-cloud/yandex/0.73.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.b5-subnet1](https://registry.terraform.io/providers/yandex-cloud/yandex/0.73.0/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.b5-subnet2](https://registry.terraform.io/providers/yandex-cloud/yandex/0.73.0/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | Default cloud ID in yandex cloud | `string` | `""` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | Default folder ID in yandex cloud | `string` | `""` | no |
| <a name="input_token"></a> [token](#input\_token) | Default token in yandex cloud | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_address_vm-1"></a> [external\_ip\_address\_vm-1](#output\_external\_ip\_address\_vm-1) | n/a |
| <a name="output_external_ip_address_vm-2"></a> [external\_ip\_address\_vm-2](#output\_external\_ip\_address\_vm-2) | n/a |
| <a name="output_internal_ip_address_vm-1"></a> [internal\_ip\_address\_vm-1](#output\_internal\_ip\_address\_vm-1) | n/a |
| <a name="output_internal_ip_address_vm-2"></a> [internal\_ip\_address\_vm-2](#output\_internal\_ip\_address\_vm-2) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
