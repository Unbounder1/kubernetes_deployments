
# Kubernetes Deployment for Web and File Servers

This repository contains Kubernetes manifests to deploy a web server, a file server, and other related services. The deployment includes configurations for scaling, networking, and persistent storage.

## Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Deployment Details](#deployment-details)
- [Services](#services)
  - [File Server](#file-server)
  - [Web Server](#web-server)
- [Configuration](#configuration)
- [Scaling](#scaling)
- [Monitoring](#monitoring)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This project deploys a web server and a file server on a Kubernetes cluster. It provides a scalable and reliable setup for hosting web applications and serving files.

## Prerequisites

Before you begin, ensure you have the following:

- A running Kubernetes cluster (Minikube, GKE, EKS, etc.)
- `kubectl` command-line tool installed and configured
- Persistent storage provisioner (if using persistent volumes)

## Setup Instructions

1. **Clone the Repository:**

    ```bash
    git clone https://github.com/yourusername/kubernetes-deployments.git
    cd kubernetes-deployments
    ```

2. **Create Namespaces:**

    ```bash
    kubectl apply -f namespaces.yaml
    ```

3. **Deploy File Server:**

    ```bash
    kubectl apply -f file-server/
    ```

4. **Deploy Web Server:**

    ```bash
    kubectl apply -f web-server/
    ```

5. **Check the Status of Pods:**

    ```bash
    kubectl get pods --namespace=your-namespace
    ```

## Deployment Details

### Namespaces

Namespaces are used to organize resources. The `namespaces.yaml` file defines separate namespaces for different environments.

### Persistent Volumes

Persistent volumes and claims are defined for storing file server data. Ensure your Kubernetes cluster has a provisioner for persistent storage.

### Services

#### File Server

The file server is based on NFS and provides a persistent storage solution.

- **Deployment:** `file-server/file-server-deployment.yaml`
- **Service:** `file-server/file-server-service.yaml`
- **Persistent Volume:** `file-server/file-server-pv.yaml`
- **Persistent Volume Claim:** `file-server/file-server-pvc.yaml`

#### Web Server

The web server is based on Nginx and serves web content.

- **Deployment:** `web-server/web-server-deployment.yaml`
- **Service:** `web-server/web-server-service.yaml`
- **Ingress:** `web-server/web-server-ingress.yaml` (optional, for ingress controller)

## Configuration

Configuration files are located in their respective directories. You can modify these files to suit your environment and requirements.

- **Config Maps:** Used to configure environment-specific settings.
- **Secrets:** Used to store sensitive information such as passwords and API keys.

## Scaling

The deployments are configured with horizontal pod autoscalers to handle scaling based on load.

- **Horizontal Pod Autoscaler:** `web-server/web-server-hpa.yaml`

## Monitoring

Prometheus and Grafana can be used to monitor the deployments. Sample configuration files are provided.

- **Prometheus:** `monitoring/prometheus.yaml`
- **Grafana:** `monitoring/grafana.yaml`

## Contributing

Contributions are welcome! Please submit a pull request or open an issue to discuss any changes.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.






Minikube reboot systemctl service
```yml
[Unit]
Description=Minikube
After=network.target

[Service]
ExecStart=/home/linuxbrew/.linuxbrew/bin/minikube start
ExecStop=/home/linuxbrew/.linuxbrew/bin/minikube stop
Restart=always
User=rdong
Environment="HOME=/home/rdong"

[Install]
WantedBy=multi-user.target
```