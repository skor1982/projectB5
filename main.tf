terraform {
	required_providers {
		yandex = {
			source = "yandex-cloud/yandex"
		}
	}
}

provider "yandex" {
	token     = ""
	cloud_id  = ""
	folder_id = ""
	zone      = "ru-central1-a"
}

data "yandex_compute_image" "b537_image" {
	family = "lemp"
}

resource "yandex_compute_instance" "b537-vm" {
	name = "vm-1"
	
	resources {
		cores  = 2
		memory = 2
		core_fraction = 20
	}

	boot_disk {
		initialize_params {
			image_id = "data.yandex_compute_image.b537_image.id"
		}
	}

	network_interface {
		subnet_id = "$(yandex_vpc_subnet.b537-subnet1.id)"
		nat       = true
	}

	metadata = {
		ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
	}

	scheduling_policy = {
		preemptible = true
	}

}

resource "yandex_vpc_network" "b537" {
	name = "B537_network"
}

resource "yandex_vpc_subnet" "b537-subnet1" {
	name       = "subnet1"
	zone       = "ru-central1-a"
	network_id = "${yandex_vpc_network.b537.id}"
}
