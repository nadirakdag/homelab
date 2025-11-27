# Homelab Automation

This project automates the creation of **LXC containers** and **virtual machines** in a Proxmox-based homelab environment using Terraform.

---

## 🚀 Ubuntu 24.04 Cloud-Init Template (Proxmox)

Before deploying infrastructure, create your Ubuntu cloud-init VM template:

👉 Follow: **[Ubuntu 24.04 Cloud-Init Template Guide](proxmox-cloud-init-template.md)**

---

## 🏗️ Deploy Infrastructure

All Terraform files are located in the `infra/` directory.

### 1. Navigate to the Infrastructure Folder

```bash
cd infra
```

### 2. Configure Your Resources

* Edit **LXC containers configuration**:
  `infra/lxc-containers.tf`

* Edit **Virtual machines configuration**:
  `infra/virtual-machines.tf`

Update these files to match your node names, storage pools, networking, and resource requirements.

---

## 🧰 Terraform Workflow

### Initialize Terraform

```bash
terraform init
```

### Preview Planned Changes

```bash
terraform plan
```

### Apply Infrastructure Changes

```bash
terraform apply --auto-approve
```

This will automatically create all defined LXC containers and VMs in Proxmox.

---

## 📌 Notes

* Ensure your Proxmox API token and credentials are properly configured in your Terraform variables or environment.
* Make sure the cloud-init template is created before running `terraform apply`.
* Tested with Proxmox 8.x and Ubuntu 24.04 images.
