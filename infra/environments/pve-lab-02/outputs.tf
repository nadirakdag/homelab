# ============================================================================
# outputs.tf
# ============================================================================

output "lxc_containers" {
  description = "LXC container details"
  value = {
    for key, container in module.lxc_containers : key => {
      id       = container.container_id
      hostname = container.hostname
    }
  }
}

output "virtual_machines" {
  description = "Virtual machine details"
  value = {
   for key, vm in module.virtual_machines : key => {
      id   = vm.vm_id
      name = vm.vm_name
    }
  }
}