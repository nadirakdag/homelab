# ============================================================================
# main.tf
# ============================================================================

# Main configuration file is now clean!
# All LXC containers are defined in lxc-containers.tf
# All VMs are defined in virtual-machines.tf


locals {
  lxc_containers = {
    nginx-proxy-manager = {
      ct_id       = 1000
      hostname    = "nginx-proxy-manager"
      ostemplate  = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
      cores       = 2
      memory      = 2048
      swap        = 0
      rootfs_size = "8G"
      ip          = "192.168.2.100"
      gw          = "192.168.2.254"
      tags        = ["nginx", "proxy", "lxc"]
      ssh_key     = var.ssh_key
      password    = var.user_password
    }
    pulse = {
      ct_id       = 1001
      hostname    = "pulse"
      ostemplate  = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
      cores       = 1
      memory      = 1024
      swap        = 0
      rootfs_size = "4G"
      ip          = "192.168.2.101"
      gw          = "192.168.2.254"
      tags        = ["pulse", "monitoring", "lxc"]
      ssh_key     = var.ssh_key
      password    = var.user_password
    }
    netbird = {
      ct_id       = 1002
      hostname    = "netbird"
      ostemplate  = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
      cores       = 1
      memory      = 512
      swap        = 0
      rootfs_size = "8G"
      ip          = "192.168.2.102"
      gw          = "192.168.2.254"
      tags        = ["netbird", "network", "lxc"]
      ssh_key     = var.ssh_key
      password    = var.user_password
    }
    gatus = {
      ct_id       = 1003
      hostname    = "gatus"
      ostemplate  = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
      cores       = 1
      memory      = 1024
      swap        = 0
      rootfs_size = "4G"
      ip          = "192.168.2.103"
      gw          = "192.168.2.254"
      tags        = ["gatus", "monitoring", "lxc"]
      ssh_key     = var.ssh_key
      password    = var.user_password
    }
    myspeed = {
      ct_id       = 1004
      hostname    = "gatus"
      ostemplate  = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
      cores       = 1
      memory      = 1024
      swap        = 0
      rootfs_size = "4G"
      ip          = "192.168.2.104"
      gw          = "192.168.2.254"
      tags        = ["myspeed", "monitoring", "lxc"]
      ssh_key     = var.ssh_key
      password    = var.user_password
    }
    it-tools = {
      ct_id       = 1005
      hostname    = "it-tools"
      ostemplate  = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
      cores       = 1
      memory      = 1024
      swap        = 0
      rootfs_size = "1G"
      ip          = "192.168.2.105"
      gw          = "192.168.2.254"
      tags        = ["it-tools", "tools", "lxc"]
      ssh_key     = var.ssh_key
      password    = var.user_password
    }
    immich = {
      ct_id       = 1006
      hostname    = "immich"
      ostemplate  = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
      cores       = 4
      memory      = 4096
      swap        = 0
      rootfs_size = "32G"
      ip          = "192.168.2.106"
      gw          = "192.168.2.254"
      tags        = ["immich", "tools", "lxc"]
      ssh_key     = var.ssh_key
      password    = var.user_password
    }
  }
  virtual_machines = {
    docker01 = {
      vm_id       = 100
      name        = "docker-host-01"
      clone       = "ubuntu-24.04"
      cores       = 4
      sockets     = 1
      memory      = 8192
      disk_size   = "100G"
      ipconfig0   = "ip=192.168.2.150/24,gw=192.168.2.254"
      tags        = ["docker", "container-host"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    elk = {
      vm_id       = 101
      name        = "elk"
      clone       = "ubuntu-24.04"
      cores       = 4
      sockets     = 1
      memory      = 16384
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.151/24,gw=192.168.2.254"
      tags        = ["virtualmetric", "elasticsearch", "test"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    dev-linux-director = {
      vm_id       = 101
      name        = "dev-linux-director"
      clone       = "ubuntu-24.04"
      cores       = 2
      sockets     = 1
      memory      = 2048
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.152/24,gw=192.168.2.254"
      tags        = ["virtualmetric", "test"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    eu-linux-director = {
      vm_id       = 101
      name        = "eu-linux-director"
      clone       = "ubuntu-24.04"
      cores       = 2
      sockets     = 1
      memory      = 2048
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.153/24,gw=192.168.2.254"
      tags        = ["virtualmetric", "test"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
    us-linux-director = {
      vm_id       = 101
      name        = "us-linux-director"
      clone       = "ubuntu-24.04"
      cores       = 2
      sockets     = 1
      memory      = 2048
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.154/24,gw=192.168.2.254"
      tags        = ["virtualmetric", "test"]
      ci_user     = "nadir"
      ci_user     = var.user
      ci_password = var.user_password
    }
    aus-linux-director = {
      vm_id       = 101
      name        = "aus-linux-director"
      clone       = "ubuntu-24.04"
      cores       = 2
      sockets     = 1
      memory      = 2048
      disk_size   = "128G"
      ipconfig0   = "ip=192.168.2.155/24,gw=192.168.2.254"
      tags        = ["virtualmetric", "test"]
      ci_user     = var.user
      ssh_key     = var.ssh_key
      ci_password = var.user_password
    }
  }
}
