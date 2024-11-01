
# Ansible Playbooks

This directory contains Ansible playbooks for automating tasks and configurations in your environment.

## Directories
- `deployment` : Directory contains apps deployment playbooks 
- `installation` : Directory contains apps installation playbooks
- `maintainance` : Directory contains playbooks used during server-node maintainence
- `update` : apt-get update playbook

## Files
- `add_vm_proxmox.yaml`: This playbook is used to add virtual machines in Proxmox.
- `add_vm_proxmox.yaml`: This playbook is used to add virtual machines in Proxmox.

## Usage
To run the playbook, execute the following command:
```bash
ansible-playbook <name of the playbook>

Eg:

ansible-playbook add_vm_proxmox.yaml
```

