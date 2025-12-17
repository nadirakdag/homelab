# ============================================================================
# main.tf
# ============================================================================

# Main configuration file is now clean!
# All LXC containers are defined in lxc-containers.tf
# All VMs are defined in virtual-machines.tf


locals {
  lxc_containers = {
  }
  virtual_machines = {
    kube-ctlr-01 = {
      vm_id       = 200
      name        = "kube-ctlr-01"
      clone       = "ubuntu-24.04-template"
      cores       = 4
      sockets     = 1
      memory      = 8192
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.170/24,gw=192.168.2.254"
      tags        = ["k8s", "container-host", "vm"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    kube-node-01 = {
      vm_id       = 300
      name        = "kube-node-01"
      clone       = "ubuntu-24.04-template"
      cores       = 8
      sockets     = 1
      memory      = 16384
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.180/24,gw=192.168.2.254"
      tags        = ["k8s", "container-host", "vm"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    kube-node-02 = {
      vm_id       = 301
      name        = "kube-node-02"
      clone       = "ubuntu-24.04-template"
      cores       = 8
      sockets     = 1
      memory      = 16384
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.181/24,gw=192.168.2.254"
      tags        = ["k8s", "container-host", "vm"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    kube-node-03 = {
      vm_id       = 302
      name        = "kube-node-03"
      clone       = "ubuntu-24.04-template"
      cores       = 8
      sockets     = 1
      memory      = 16384
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.182/24,gw=192.168.2.254"
      tags        = ["k8s", "container-host", "vm"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
  }
}
