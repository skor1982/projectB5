output "vm_internal_ip_address" {
  value = yandex_compute_instance.b5-vm.network_interface.0.ip_address
}

output "vm_external_ip_address" {
  value = yandex_compute_instance.b5-vm.network_interface.0.nat_ip_address
}

