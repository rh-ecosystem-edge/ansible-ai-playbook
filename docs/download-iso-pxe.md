# Ansible role Downlaod ISO to PXE

This role is for Asissted install day2 deployments.
Giving an exsisting cluster, add's worker node via API

This Role will transform the cluster to Day2 and will download and extract ISO into HTTP, TFTP folders.
Generate `grub.cfg` accordingly 

> note: After transfomation the UI will no longer shows the current cluster

### **Requirements** 
---
-  Ansible >= 2.9
-  HTTP service
-  TFTP service

### **Mandatory Values**
---
```yaml
### Assisted installer URL
URL: http://< Address >:< PORT>
### Cluster installed clusters UUID
CLUSTER_ID: < CLUSTER UUID >

### architecture deployment type
### allowed values arm, x86
### default arm
ARCH: "arm"
```

### **How To Use**

create a playbook and vars to your needs:
```yaml
# playbook.yaml
---
- hosts: localhost
  roles:
    - iso-to-pxe
  vars:
    ARCH: arm
    URL: "http://192.168.166.1:8080"
    UUID: "97038389-85bc-486a-a7f4-6e01567a73d4"
```
finally run the playbook
```shell
ansible-playbook -i localhost, playbook.yaml
```

### **Tags**
---
Downlaod only
```shell
ansible-playbook -i localhost, playbook.yaml --tags download
### Default downlaod location
### /tmp/download-iso-pxe/discovery_image.iso
```

Extract files
```shell
ansible-playbook -i localhost, playbook.yaml --tags extract
### this will look for the iso in a default location and name
### set you own locatio
### Name of the downlaoded ISO
# ISO_NAME: "discovery_image.iso"
### Work dir
# WORKDIR: "/tmp/download-iso-pxe"
```


### **Vars and Defaults**

---

```yaml

# ARCH
ARCH: arm

# Name of the downlaoded ISO
ISO_NAME: "discovery_image.iso"

# Work dir
WORKDIR: "/tmp/download-iso-pxe"

### TFTP SERVER
TFTP_DIR: "/var/lib/tftpboot"

### HTTP SERVER
HTTP_DIR: "/var/www/html/pxe"

### Mount Point for boot images
MNT_EFIBOOT: "/mnt/efiboot"

### GRUB HTTP SERVER URL
### optional set the url for downloading the kernel files
### default to ansible host IP address.
# HTTP_URL: ""
```

