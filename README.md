# Ansible Assisted Installer Playbooks

This Playbook is for Transforming cluster into Day2 and setting up PXE services and files.
giving `Assisted installer` URL and cluster UUID.


> ❗ _Red Hat does not provide commercial support for the content of this repo.
Any assistance is purely on a best-effort basis, as resource permits._

```bash
#############################################################################
DISCLAIMER: THE CONTENT OF THIS REPO IS EXPERIMENTAL AND PROVIDED **"AS-IS"**

THE CONTENT IS PROVIDED AS REFERENCE WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#############################################################################
```


> note: After transfomation the UI will no longer shows the current cluster

### **Requirements**
---
-  Ansible >= 2.9



### **How to Use**
---
set the variable in the `playbook.yaml`
```yaml
    ARCH: arm
    URL: http://<URL>:<PORT>
    CLUSTER_ID: "< CLUSTER UUID >" 
```

next run the installation
```shell
ansible-playbook -i <host>, playbook.yaml 
```

you can check add optional configurations which listed in the role Documentation 

- [setup-pxe doc](./docs/download-iso-pxe.md)
- [iso-to-pxe](./docs/setup-pxe.md)


