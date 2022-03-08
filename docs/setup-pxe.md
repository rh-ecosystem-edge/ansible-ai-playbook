# Ansible role PXE-SETUP   

This role is desgin to install basic service for PXE booting.  
Installing the following services  
- HTTP server
- TFTP server
- DHCP server


### **Requirements** 
---
-  Ansible >= 2.9


### **How To Use**
---
create a playbook and vars to your needs:
```yaml
# playbook.yaml
---
- hosts: localhost
  roles:
    - setup-pxe
  vars:
    TFTP_DIR: "/home/user/tftpboot"
```
finally run the playbook
```shell
ansible-playbook -i localhost, playbook.yaml
```

### **Vars and Defaults**

DHCP server is not installed by default.  to add `DHCP` service and configurations add the following block:
```yaml
  DHCP:
    SUBNET:   192.168.1.0
    NETMASK:  255.255.255.0
    RANGE:    "192.168.1.1 192.168.1.10"
    DNS:      "8.8.8.8,4.2.2.2"
    GATEWAY:  192.168.1.254
    NTP:      time.google.com
```

Select the default architecture
```yaml
### ARCH
# available option arm, x86
ARCH: "arm"
```

change services directories 
```yaml
### TFTP SERVER
TFTP_DIR: "/var/lib/tftpboot"

### HTTP SERVER
HTTP_DIR: "/var/www/html/pxe"
```

