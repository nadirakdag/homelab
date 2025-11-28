# ============================================================================
# modules/lxc/main.tf
# ============================================================================

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc05"
    }
  }
}


resource "proxmox_lxc" "container" {
  vmid        = var.vm_id
  hostname    = var.hostname
  target_node = var.target_node
  ostemplate  = var.ostemplate
  password    = var.password

  cores  = var.cores
  memory = var.memory
  swap   = var.swap

  rootfs {
    storage = var.storage
    size    = var.rootfs_size
  }

  network {
    name   = var.network.name
    bridge = var.network.bridge
    ip     = var.network.ip
    gw     = var.network.gw
  }

  nameserver   = var.network.dns
  unprivileged = var.unprivileged
  start        = var.start
  onboot       = var.onboot

  ssh_public_keys = var.ssh_public_keys

  tags = join(";", var.tags)

  features {
    nesting = var.features.nesting
    fuse    = var.features.fuse
  }
}
