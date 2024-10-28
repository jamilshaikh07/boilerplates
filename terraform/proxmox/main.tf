module "vm_instance_1" {
  source    = "./modules/proxmox-vm"
  vm_name   = "test-vm1"
  memory    = 1024
  cores     = 1
  ipconfig0 = "ip=10.10.0.91/24,gw=10.10.0.1"
  clone     = "ubuntu-2204"
  tags      = "newvm"
}