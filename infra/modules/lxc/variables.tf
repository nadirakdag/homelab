# ============================================================================
# modules/lxc/variables.tf
# ============================================================================

variable "vm_id" {
  description = "Container ID"
  type = number
  default = 100
}

variable "hostname" {
  description = "Container hostname"
  type        = string
}

variable "target_node" {
  description = "Target Proxmox node"
  type        = string
}

variable "ostemplate" {
  description = "OS template location"
  type        = string
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 512
}

variable "swap" {
  description = "Swap in MB"
  type        = number
  default     = 0
}

variable "rootfs_size" {
  description = "Root filesystem size"
  type        = string
  default     = "8G"
}

variable "storage" {
  description = "Storage location"
  type        = string
  default     = "local-lvm"
}

variable "network" {
  description = "Network configuration"
  type = object({
    name   = string
    bridge = string
    ip     = string
    gw     = string
  })
  default = {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
    gw     = ""
  }
}

variable "unprivileged" {
  description = "Create unprivileged container"
  type        = bool
  default     = true
}

variable "start" {
  description = "Start container after creation"
  type        = bool
  default     = true
}

variable "onboot" {
  description = "Start container on boot"
  type        = bool
  default     = true
}

variable "ssh_public_keys" {
  description = "SSH public keys"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Container tags"
  type        = list(string)
  default     = []
}

variable "features" {
  description = "Container features"
  type = object({
    nesting = bool
    fuse    = bool
  })
  default = {
    nesting = false
    fuse    = false
  }
}

variable "password" {
  description = "root user password"
  type = string
  sensitive = true
}