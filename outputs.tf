output "internal_ip_address_vm-1" {
  value = yandex_compute_instance.b537-vm.network_interface.0.ip_address
}

output "external_ip_address_vm-1" {
  value = yandex_compute_instance.b537-vm.network_interface.0.nat_ip_address
}

