terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  #  backend "s3" {
  #    endpoint   = "storage.yandexcloud.net"
  #    bucket     = "prjb5-bucket"
  #    region     = "ru-central1-a"
  #    key        = "prjb5/lemp.tfstate"
  #    access_key = ""
  #    secret_key = ""
  #
  #    skip_region_validation      = true
  #    skip_credentials_validation = true
  #  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
}

data "yandex_compute_image" "b537_image" {
  family = "lemp"
}

resource "yandex_compute_instance" "b537-vm" {
  name = "vm-1"

  resources {
    cores         = 2
    memory        = 2
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

  scheduling_policy {
    preemptible = true
  }

}

resource "yandex_vpc_network" "b537" {
  name = "B537_network"
}

resource "yandex_vpc_subnet" "b537-subnet1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.b537.id
  v4_cidr_blocks = ["192.168.30.0/24"]
}

resource "yandex_iam_service_account" "prjb5-sa" {
  folder_id = var.folder_id
  name      = "prjb5-sa"
}

resource "yandex_resourcemanager_folder_iam_member" "prjb5-sa-editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.prjb5-sa.id}"
}

resource "yandex_iam_service_account_static_access_key" "prjb5-sa-static-key" {
  service_account_id = yandex_iam_service_account.prjb5-sa.id
  description        = "static access key for projectB5"
}

resource "yandex_storage_bucket" "for_terraform" {
  access_key = yandex_iam_service_account_static_access_key.prjb5-sa-static-key.access_key
  secret_key = yandex_iam_service_account_static_access_key.prjb5-sa-static-key.secret_key
  bucket     = "prjb5-bucket"
}

