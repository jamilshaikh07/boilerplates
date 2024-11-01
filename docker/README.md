# Docker Configurations

This directory contains configurations and examples for Docker containerization.

## Directories

- `ansiblesemaphore`: ansbile semaphore docker compose file
- `grafana`: grafana docker compose file
- `homepage`: homepage 
- `nginxproxymanager`: nginxproxymanager docker compose file
- `pihole`: pihole docker compose file
- `portainer`: portainer docker compose file
- `prometheus`: prometheus docker compose file
- `teleport`: teleport docker compose file
- `uptimekuma`: uptimekuma docker compose file


## Usage

```bash
docker compose up <directory> -d
```
### OR

```bash
cd <directory>
docker compose up -d
```