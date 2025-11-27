# ============================================================================
# modules/vm/outputs.tf
# ============================================================================

output "vm_id" {
  description = "VM ID"
  value       = proxmox_vm_qemu.vm.id
}

output "vm_name" {
  description = "VM name"
  value       = proxmox_vm_qemu.vm.name
}