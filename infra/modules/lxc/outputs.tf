# ============================================================================
# modules/lxc/outputs.tf
# ============================================================================

output "container_id" {
  description = "Container ID"
  value       = proxmox_lxc.container.id
}

output "hostname" {
  description = "Container hostname"
  value       = proxmox_lxc.container.hostname
}

