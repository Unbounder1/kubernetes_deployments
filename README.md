# Kubernetes Deployments

This repository contains Kubernetes manifests for deploying a web server, file server, and related services. It includes configurations for scaling, networking, and persistent storage.

## TODO

REFRESH SECRETS

-> switch from tailscale to openvpn tunnel
-> create subnet for metallb svc advertising


## Features
- **File Server**: NFS-based persistent storage.
- **Web Server**: Nginx-based deployment with tailscale ingress.
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

# Setting up the cluster

`sudo kubeadm init \
  --image-repository=registry.k8s.io \
  --pod-network-cidr=10.244.0.0/16 \
  --service-cidr=10.96.0.0/12 \
  --control-plane-endpoint=192.168.1.17 \
  --apiserver-advertise-address=192.168.1.17`

`crictl ps -a` -> get rid of remaining headless processes and stuff so that it doesnt cause api-server to go down during resetup

## Set up Calico

```
helm upgrade calico projectcalico/tigera-operator --values ./configs/calico-values.yaml --namespace tigera-operator --install
kubectl create ns tigera-operator```

## Set up Metallb

`kubectl apply -f dev-deploy/metallb/metallb-native.yaml && kubectl apply -f dev-deploy/metallb/calico-pool.yaml`

## Set up NFS provisioner

`
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=100.96.41.21 \
    --set nfs.path=/mnt/nfs
`

(nfs data in /etc/exports)

## Tailscale

```
helm upgrade   --install   tailscale-operator   tailscale/tailscale-operator   --namespace=tailscale   --create-namespace   --set-string oauth.clientId=".env"   --set-string oauth.clientSecret=".env"   --wait
```

## Set up Jenkins


```
kubectl create ns jenkins
kubectl apply -f active-deployments/jenkins/jenkins-sa.yaml
kubectl apply -f active-deployments/jenkins/pv-jenkins.yaml
helm install jenkins -n jenkins -f configs/jenkins-values.yaml jenkinsci/jenkins

kubectl apply -f active-deployments/jenkins/ingress.yaml

kubectl apply -f active-deployments/blog-dev/k8s-cli.yaml
kubectl create token jenkins-robot -n jenkins  --duration=8760h
```

TAILSCALE:
kubectl edit felixconfiguration default
iptablesMarkMask: 0xff00ff00

## Calico BGP

```bash


```