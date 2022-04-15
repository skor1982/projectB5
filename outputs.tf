output "internal_ip_address_vm-1" {
  description = "Внутренний IP адрес 1 виртуальной машины"
  value       = module.yandex_vm_1.vm_internal_ip_address
}

output "external_ip_address_vm-1" {
  description = "Внешний IP адрес 1 виртуальной машины"
  value       = module.yandex_vm_1.vm_external_ip_address
}

output "internal_ip_address_vm-2" {
  description = "Внутренний IP адрес 2 виртуальной машины"
  value       = module.yandex_vm_2.vm_internal_ip_address
}

output "external_ip_address_vm-2" {
  description = "Внешний IP адрес 2 виртуальной машины"
  value       = module.yandex_vm_2.vm_external_ip_address
}


