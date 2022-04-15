output "internal_ip_address_vm-1" {
  value = yandex_compute_instance.b537-vm.network_interface.0.ip_address
}

output "external_ip_address_vm-1" {
  value = yandex_compute_instance.b537-vm.network_interface.0.nat_ip_address
}

output "access_key" {
  value = "${yandex_iam_service_account_static_access_key.prjb5-sa-static-key.access_key}"
}

output "secret_key" {
  value = "${yandex_iam_service_account_static_access_key.prjb5-sa-static-key.secret_key}"
}
