# ============================================================================
# main.tf
# ============================================================================

# Main configuration file is now clean!
# All LXC containers are defined in lxc-containers.tf
# All VMs are defined in virtual-machines.tf


locals {
  lxc_containers = {
    netbird = {
      ct_id       = 1002
      hostname    = "netbird"
      ostemplate  = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
      cores       = 1
      memory      = 512
      swap        = 0
      rootfs_size = "8G"
      ip          = "192.168.2.102/24"
      gw          = "192.168.2.254"
      dns         = "192.168.2.1"
      tags        = ["netbird", "network", "lxc"]
      ssh_key     = var.ssh_key
      password    = var.user_password
    }
  }
  virtual_machines = {
    docker-host-01 = {
      vm_id       = 100
      name        = "docker-host-01"
      clone       = "ubuntu-24.04"
      cores       = 4
      sockets     = 1
      memory      = 8192
      disk_size   = "100G"
      ipconfig0   = "ip=192.168.2.150/24,gw=192.168.2.254"
      tags        = ["docker", "container-host", "vm"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    elk-docker = {
      vm_id       = 101
      name        = "elk-docker"
      clone       = "ubuntu-24.04"
      cores       = 4
      sockets     = 1
      memory      = 16384
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.151/24,gw=192.168.2.254"
      tags        = ["virtualmetric", "elasticsearch", "test", "vm", "container-host"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    dev-linux-director = {
      vm_id       = 102
      name        = "dev-linux-director"
      clone       = "ubuntu-24.04"
      cores       = 2
      sockets     = 1
      memory      = 4096
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.152/24,gw=192.168.2.254"
      tags        = ["virtualmetric", "test", "vm"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    eu-linux-director = {
      vm_id       = 103
      name        = "eu-linux-director"
      clone       = "ubuntu-24.04"
      cores       = 2
      sockets     = 1
      memory      = 4096
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.153/24,gw=192.168.2.254"
      tags        = ["virtualmetric", "test", "vm"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    us-linux-director = {
      vm_id       = 104
      name        = "us-linux-director"
      clone       = "ubuntu-24.04"
      cores       = 2
      sockets     = 1
      memory      = 4096
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.154/24,gw=192.168.2.254"
      tags        = ["virtualmetric", "test", "vm"]
      ci_user     = "nadir"
      ci_user     = var.user
      ci_password = var.user_password
      ssh_key     = var.ssh_key
    }
    aus-linux-director = {
      vm_id       = 105
      name        = "aus-linux-director"
      clone       = "ubuntu-24.04"
      cores       = 2
      sockets     = 1
      memory      = 4096
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.155/24,gw=192.168.2.254"
      tags        = ["virtualmetric", "test", "vm"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    immich = {
      vm_id       = 106
      name        = "immich"
      clone       = "ubuntu-24.04"
      cores       = 4
      sockets     = 1
      memory      = 8192
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.156/24,gw=192.168.2.254"
      tags        = ["docker", "container-host", "vm"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
  }
}
