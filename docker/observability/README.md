# Monitoring Stack with Grafana, Prometheus, Node Exporter, and Image Renderer

This project sets up a monitoring stack using **Grafana**, **Prometheus**, **Node Exporter**, and **Grafana Image Renderer**. These services run in Docker containers and are connected through a custom network named `observability`.

## Prerequisites

- Docker and Docker Compose should be installed on your system.
- Create the `observability` Docker network before running the services:

```bash
docker network create observability
```