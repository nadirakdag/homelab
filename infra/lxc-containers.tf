
# Example LXC Container
module "lxc_containers" {
  source   = "./modules/lxc"
  for_each = local.lxc_containers

  vm_id       = each.value.ct_id
  hostname    = each.value.hostname
  target_node = var.target_node
  ostemplate  = each.value.ostemplate
  password    = each.value.password

  cores  = each.value.cores
  memory = each.value.memory
  swap   = each.value.swap

  rootfs_size = each.value.rootfs_size
  storage     = "local-lvm"

  network = {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = each.value.ip
    gw     = each.value.gw
    dns    = each.value.dns
  }

  unprivileged = true
  start        = true
  onboot       = true

  ssh_public_keys = each.value.ssh_key

  tags = each.value.tags
}
