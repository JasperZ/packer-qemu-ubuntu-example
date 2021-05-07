# Packer example how to create an ubuntu image with qemu
This example shows how to create an ubuntu image with qemu.

## Defaults
```
username: packer
password: packer
```

## System configuration
System configuration can be done in the [ansible-playbook.yaml](ansible-playbook.yaml) file or by adding another 
`provisioner` into the `build` section in [qemu-ubuntu.pkr.hcl](qemu-ubuntu.pkr.hcl).

## Build image
```
packer build qemu-ubuntu.pkr.hcl
```