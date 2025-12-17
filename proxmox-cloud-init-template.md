
## 1. Install tools on host
```
apt install -y libguestfs-tools
```

## 2. Download latest Ubuntu 24.04 cloud image
```
wget https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.img
```


## 3. Customize image (packages inside the template)
```
virt-customize -a ubuntu-24.04-server-cloudimg-amd64.img \
    --install qemu-guest-agent,ncat,net-tools,bash-completion
```

## 4. Convert to qcow2
```
mv ubuntu-24.04-server-cloudimg-amd64.img ubuntu-24.04-server-cloudimg-amd64.qcow2
```

## 5. Resize image
```
qemu-img resize ubuntu-24.04-server-cloudimg-amd64.qcow2 32G
```

## 6. Create VM shell
``` 
qm create 9000 \
  --name ubuntu-24.04-template \
  --memory 2048 \
  --cores 2 \
  --ostype l26 
```

## Networking settings
```
qm set 9000 --net0 virtio,bridge=vmbr0,firewall=1
```

## Import disk to VM 
```
qm importdisk 9000 ubuntu-24.04-server-cloudimg-amd64.qcow2 local-lvm
```

## Attach imported disk
```
qm set 9000 \
  --scsihw virtio-scsi-single \
  --scsi0 local-lvm:vm-9000-disk-0,iothread=1,cache=none,ssd=1,discard=on
```

## CPU passthrough
```
qm set 9000 --cpu host
```

## Boot settings
```
qm set 9000 --boot c --bootdisk scsi0
```

## Add cloud-init drive
```
qm set 9000 --ide2 local-lvm:cloudinit,size=4M
```

## Enable QEMU guest agent
```
qm set 9000 --agent enabled=1
```

## Convert VM to template
```
qm template 9000
```