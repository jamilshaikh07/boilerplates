# Terraform Configurations

This directory contains Terraform configurations for managing infrastructure.

## Directories

- `cloudflare` : terraform code cloudflare
- `helm` : terraform code for helm installation in k8s cluster
- `kubectl` : terraform code for kubectl installation in nodes
- `kubernetes` : terraform code for creating kubernetes manifests
- `proxmox` : terraform code of proxmox server

### proxmox 

- Make sure to update your `credentials.auto.tfvars` with your credentials before running `terraform init` and `terraform apply`.
