output "vm1_id" {
  description = "The IP address of VM1"
  value       = module.vm_instance_1.vm_id
}

output "vm2_id" {
  description = "The ID of VM2"
  value       = module.vm_instance_2.vm_id
}