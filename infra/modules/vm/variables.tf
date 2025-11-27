# ============================================================================
# modules/vm/variables.tf
# ============================================================================

variable "vm_id" {
  description = "VM ID"
  type = number
  default = 100
}

variable "name" {
  description = "VM name"
  type        = string
}

variable "target_node" {
  description = "Target Proxmox node"
  type        = string
}

variable "clone" {
  description = "Template to clone from"
  type        = string
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "sockets" {
  description = "Number of CPU sockets"
  type        = number
  default     = 1
}

variable "memory" {
  description = "Memory in MB"
  type        = number
  default     = 2048
}

variable "disk_size" {
  description = "Disk size"
  type        = string
  default     = "20G"
}

variable "storage" {
  description = "Storage location"
  type        = string
  default     = "local-lvm"
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "network_model" {
  description = "Network model"
  type        = string
  default     = "virtio"
}

variable "ipconfig0" {
  description = "IP configuration"
  type        = string
  default     = "ip=dhcp"
}

variable "agent" {
  description = "Enable QEMU guest agent"
  type        = number
  default     = 0
}

variable "onboot" {
  description = "Start VM on boot"
  type        = bool
  default     = true
}

variable "tags" {
  description = "VM tags"
  type        = list(string)
  default     = []
}

variable "ci_user" {
  description = "VM Cloud-Init User"
  type = string
  default = "stark"
}

variable "ci_password" {
  description = "VM Cloud-Init User Password"
  type = string
  sensitive = true
}

variable "ci_ssh_key" {
  description = "VM Cloud-Init User SSH Public Key"
  type = string
  sensitive = true
}