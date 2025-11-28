
# Example VM
module "virtual_machines" {
  source   = "./modules/vm"
  for_each = local.virtual_machines

  vm_id       = each.value.vm_id
  name        = each.value.name
  target_node = var.target_node
  clone       = each.value.clone

  cores   = each.value.cores
  sockets = each.value.sockets
  memory  = each.value.memory

  disk_size = each.value.disk_size
  storage   = "local-lvm"

  network_bridge = "vmbr0"
  network_model  = "virtio"

  ci_user     = each.value.ci_user
  ci_password = each.value.ci_password
  ci_ssh_key  = each.value.ssh_key
  ipconfig0   = each.value.ipconfig0

  agent  = 1
  onboot = true

  tags = each.value.tags
}
