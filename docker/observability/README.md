
# Monitoring Stack with Grafana, Prometheus, Node Exporter, and Image Renderer

This project sets up a monitoring stack using **Grafana**, **Prometheus**, **Node Exporter**, and **Grafana Image Renderer**. These services run in Docker containers and are connected through a custom network named `observability`.

## Prerequisites

- Docker and Docker Compose should be installed on your system.
- Create the `observability` Docker network before running the services:

```bash
docker network create observability
```

## How to Use

1. **Clone the Repository**:  
   Clone this repository to your local machine.

2. **Setup Configuration Files**:  
   - Add your **SMTP credentials** in the `grafana` service configuration (for email notifications).
   - Update the `prometheus.yml` file for Prometheus configuration.

3. **Start the Services**:  
   Run the following command to start the stack:

```bash
docker-compose up -d
```

4. **Access the Services**:
   - **Grafana**: [http://localhost:3000](http://localhost:3000)
   - **Prometheus**: [http://localhost:9090](http://localhost:9090)
   - **Node Exporter**: [http://localhost:9100](http://localhost:9100)

5. **Grafana Login**:
   - Default credentials: `admin` / `admin` (you'll be prompted to change this on first login).

6. **Stop the Services**:  
   To stop the stack, run:

```bash
docker-compose down
```

## Volumes

- **Prometheus Data**: Data from Prometheus is stored persistently in the `prometheus_data` volume.

## Customizations

- **Grafana SMTP Configuration**:
  - Set the following environment variables in the `docker-compose.yml` file under the `grafana` service:
    - `GF_SMTP_USER`
    - `GF_SMTP_PASSWORD`
    - `GF_SMTP_FROM_ADDRESS`

- **Prometheus Configuration**:
  - Update `prometheus.yml` to scrape additional targets or adjust retention policies.

## Network

The `observability` Docker network must be created before running the stack. It allows all services to communicate internally.

```bash
docker network create observability
```

## Notes

- The `node-exporter` service monitors the host system's metrics.
- The `grafana-image-renderer` service allows Grafana to render visual reports and alerts.

## Troubleshooting

- Ensure the `observability` network exists before running the stack.
- Check logs for any service by running:

```bash
docker logs <container_name>
```
