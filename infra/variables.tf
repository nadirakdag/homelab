# ============================================================================
# variables.tf
# ============================================================================

variable "proxmox_api_url" {
  description = "Proxmox API URL"
  type        = string
}

variable "proxmox_api_token_id" {
  description = "Proxmox API token ID"
  type        = string
  sensitive   = true
}

variable "proxmox_api_token_secret" {
  description = "Proxmox API token secret"
  type        = string
  sensitive   = true
}

variable "proxmox_tls_insecure" {
  description = "Skip TLS verification"
  type        = bool
  default     = false
}

variable "proxmox_parallel" {
  description = "Number of parallel operations"
  type        = number
  default     = 4
}

variable "proxmox_timeout" {
  description = "API timeout in seconds"
  type        = number
  default     = 600
}

variable "target_node" {
  description = "Target Proxmox node name"
  type        = string
  default     = "pve"
}

variable "ssh_key" {
  description = "public ssh key for vm and lxc container"
  type = string
  sensitive = true
}

variable "user_password" {
  description = "default password for vm and lxc container"
  type = string
  sensitive = true
}


variable "user" {
  description = "default user for vm"
  type = string
}
