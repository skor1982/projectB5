data "yandex_compute_image" "b5_image" {
  family = var.yandex_vm_family
}

resource "yandex_compute_instance" "b5-vm" {
  name = "vm-${var.yandex_vm_family}"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "data.yandex_compute_image.b5_image.id"
    }
  }

  network_interface {
    subnet_id = var.yandex_vm_vpc_subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

  scheduling_policy {
    preemptible = true
  }

}

