terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.73.0"
    }
  }
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "skor1982.sf.bucket"
    region     = "ru-central1-a"
    key        = "prjb5/lemp.tfstate"
    access_key = ""
    secret_key = ""

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = "ru-central1-a"
}

resource "yandex_vpc_network" "b5-network" {
  name = "B5_network"
}

resource "yandex_vpc_subnet" "b5-subnet1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.b5-network.id
  v4_cidr_blocks = ["192.168.30.0/24"]
}

resource "yandex_vpc_subnet" "b5-subnet2" {
  name           = "subnet1"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.b5-network.id
  v4_cidr_blocks = ["192.168.40.0/24"]
}

module "yandex_vm_1" {
  source                  = "./modules/yandex_cloud_vm"
  yandex_vm_family        = "lemp"
  yandex_vm_vpc_subnet_id = yandex_vpc_subnet.b5-subnet1.id
}

module "yandex_vm_2" {
  source                  = "./modules/yandex_cloud_vm"
  yandex_vm_family        = "lamp"
  yandex_vm_vpc_subnet_id = yandex_vpc_subnet.b5-subnet2.id
}
