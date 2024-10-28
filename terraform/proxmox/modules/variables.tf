variable "target_node" {
  type        = string
  description = "The target Proxmox node where the VM will be created"
  default     = "" // The target Proxmox node where the VM will be created
}

variable "vm_name" {
  type        = string
  description = "The name of the VM"
}

variable "onboot" {
  type    = bool
  default = false
}

variable "clone" { // The VM to clone
  type = string
}

variable "boot_order" { // The boot order of the VM
  type    = string
  default = "order=scsi0;ide0"
}

variable "full_clone" { // The full clone of the VM
  type    = bool
  default = true
}

variable "agent" { // The agent of the VM
  type    = number
  default = 0
}

variable "cores" { // The number of cores of the VM
  type    = number
  default = 1
}

variable "sockets" { // The number of sockets of the VM
  type    = number
  default = 1
}

variable "cpu" {
  type    = string
  default = "x86-64-v2-AES" // The CPU of the VM
}

variable "memory" {
  type    = number
  default = 1024 // The memory of the VM
}

variable "balloon" {
  type    = number
  default = 0 // enable/disable balloon memory of the VM
}

variable "scsihw" {
  type    = string
  default = "virtio-scsi-single" // The SCSI hardware of the VM
}

variable "network_bridge" {
  type    = string
  default = "vmbr0" // The network bridge of the VM
}

variable "network_model" {
  type    = string
  default = "virtio" // The network model of the VM
}

variable "firewall" {
  type    = bool
  default = true // enable/disable firewall of the VM
}

variable "storage" {
  type    = string
  default = "" // The storage where the disk will be created
}

variable "disk_size" {
  type    = string
  default = "" // The size of the disk
}

variable "disk_cache" {
  type    = string
  default = "writeback" // The cache of the disk
}

variable "discard" {
  type    = bool
  default = false
}

variable "iothread" {
  type    = bool
  default = true
}

variable "emulatessd" {
  type    = bool
  default = true
}

variable "cloudinit_storage" {
  type    = string
  default = "" // The storage where the cloud-init disk will be created
}

variable "os_type" {
  type    = string
  default = "cloud-init" // The OS type of the VM
}

variable "ipconfig0" {
  type = string // The IP configuration of the VM
}

variable "ciuser" {
  type = string
  default = "" // The cloud-init user
}

variable "cipassword" {
  type = string
  default = "" // The cloud-init password
}

variable "sshkeys" {
  type      = string
  sensitive = true
  default = "" // The SSH keys of the VM
}

variable "tags" {
}