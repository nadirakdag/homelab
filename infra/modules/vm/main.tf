# ============================================================================
# modules/vm/main.tf
# ============================================================================

terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc05"
    }
  }
}

resource "proxmox_vm_qemu" "vm" {
  vmid        = var.vm_id
  name        = var.name
  target_node = var.target_node
  clone       = var.clone
  full_clone  = true
  os_type     = "cloud-init"
  tags        = join(";", var.tags)


  //cloud-init variables
  ciuser     = var.ci_user
  cipassword = var.ci_password
  sshkeys    = var.ci_ssh_key
  ciupgrade  = true
  ipconfig0  = var.ipconfig0
  skip_ipv6  = true

  memory = var.memory

  agent  = var.agent
  onboot = var.onboot

  cpu {
    cores   = var.cores
    sockets = var.sockets
    type    = "host"
  }

  //disk settings
  scsihw = "virtio-scsi-single"
  disks {
    ide {
      ide0 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size      = var.disk_size
          storage   = var.storage
          replicate = true
        }
      }
    }
  }

  network {
    id     = 0
    bridge = var.network_bridge
    model  = var.network_model
  }
}
