# Kubernetes Deployments

This repository contains Kubernetes manifests for deploying a web server, file server, and related services. It includes configurations for scaling, networking, and persistent storage.

## Features
- **File Server**: NFS-based persistent storage.
- **Web Server**: Nginx-based deployment with optional ingress.
- **Monitoring**: Includes Prometheus and Grafana configurations.
- **Scaling**: Horizontal Pod Autoscalers configured.

## Usage
1. Clone the repo:
   ```bash
   git clone https://github.com/Unbounder1/kubernetes_deployments.git
   cd kubernetes_deployments
2.	Apply manifests:
    ```bash
    kubectl apply -f file-server/
    kubectl apply -f web-server/
    ```