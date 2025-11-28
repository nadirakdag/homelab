# Homelab Automation with Terraform

This project automates the complete lifecycle of **LXC containers** and **virtual machines** in a Proxmox-based homelab environment using **Terraform** for infrastructure provisioning.

---

## ✨ Features

- 🐧 **LXC Container Management** - Deploy and manage lightweight Linux containers
- 🖥️ **Virtual Machine Support** - Create VMs from templates with cloud-init Linux
- 📦 **Modular Architecture** - Reusable Terraform modules
- 🔄 **Multi-Resource Deployment** - Use `for_each` to deploy multiple resources from a single configuration
- 🏢 **Multi-Environment Support** - Separate configurations for multiple Proxmox servers/environments
- 🏷️ **Tag-Based Organization** - Organize resources with custom tags
- 🔐 **SSH Key Integration** - Automatic SSH key injection for Linux systems
- 🌐 **Flexible Networking** - Support for DHCP and static IP configurations

---

## 🚀 Quick Start

### Prerequisites

1. **Proxmox VE** server (tested with 7.x and 8.x)
2. **Terraform** >= 1.0
5. **SSH Key** for authentication

### Step 1: Create Ubuntu Cloud-Init Template

Before deploying infrastructure, create your Ubuntu cloud-init VM template in Proxmox:

👉 Follow: **[Ubuntu 24.04 Cloud-Init Template Guide](proxmox-cloud-init-template.md)**

### Step 2: Configure Environment

```bash
cd environments/pve-lab-01

# Edit Proxmox connection details
nano terraform.tfvars
```

**terraform.tfvars:**
```hcl
proxmox_api_url          = "https://192.168.1.10:8006/api2/json"
proxmox_api_token_id     = "terraform@pam!terraform-token"
proxmox_api_token_secret = "your-secret-token-here"
proxmox_tls_insecure     = true
target_node              = "pve-lab-01"
ssh_key                  = "" # Set your ssh public key for lxc containers and virtual machines 
user_password            = "" # Set your user password for lxc containers and virtual machines 
user                     = "" # Set your cloud-init user name for virtual machines
```

### Step 3: Define Your Infrastructure

**Edit LXC containers** (`lxc-containers.tf`):
```hcl
locals {
  lxc_containers = {
    nginx = {
      hostname    = "nginx-proxy"
      ostemplate  = "local:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
      cores       = 2
      memory      = 2048
      swap        = 512
      rootfs_size = "8G"
      ip          = "192.168.1.100/24"
      tags        = ["nginx", "proxy", "production"]
    }
  }
}
```

**Edit VMs** (`virtual-machines.tf`):
```hcl
locals {
  virtual_machines = {
    docker-host = {
      name                = "docker-host-01"
      clone               = "ubuntu-24.04-template"
      os_type             = "cloud-init"
      cores               = 4
      memory              = 8192
      disk_size           = "100G"
      ipconfig0           = "ip=192.168.1.20/24,gw=192.168.1.1"
      agent               = 1
      tags                = ["docker", "production"]
    }
  }
}
```

### Step 4: Deploy Infrastructure

```bash
cd environments/pve-lab-01

# Initialize Terraform
terraform init

# Preview changes
terraform plan

# Apply infrastructure
terraform apply

# Ansible runs automatically if run_ansible=true
```

---

## 🧰 Common Operations

### Deploy Specific Resources

```bash
# Deploy only LXC containers
terraform apply -target=module.lxc_containers

# Deploy only VMs
terraform apply -target=module.virtual_machines

# Deploy specific container
terraform apply -target=module.lxc_containers["nginx"]

# Deploy specific VM
terraform apply -target=module.virtual_machines["docker-host"]
```

### Destroy Resources

```bash
# Destroy all LXC containers only (keep VMs)
terraform destroy -target=module.lxc_containers

# Destroy specific resource
terraform destroy -target=module.lxc_containers["nginx"]
terraform destroy -target=module.virtual_machines["docker-host"]

# Destroy entire environment
terraform destroy
```
---


## 📚 Additional Resources

- [Proxmox Documentation](https://pve.proxmox.com/wiki/Main_Page)
- [Terraform Proxmox Provider](https://github.com/Telmate/terraform-provider-proxmox)
- [Cloud-Init Documentation](https://cloudinit.readthedocs.io/)
