variable "yandex_vm_family" {
  description = "Family of VM image"
  type        = string
  default     = "lemp"
}

variable "yandex_vm_vpc_subnet_id" {
  description = "VM network subnet ID"
  type        = string
}

