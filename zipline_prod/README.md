# Zipline Kubernetes Deployment
*Using minikube, kubectl, docker driver*

## TODO
- create dependencies for yml volumes and postgres server

## Usage
To start the cluster make sure to mount /mnt/public-share and /mnt/zp-postgres
```bash
minikube start --driver=docker --mount --mount-string /mnt:/mnt
./configuration.sh
```

For testing purposes:

`/etc/systemd/system/socat-minikube.service`
```
[Unit]
Description=Socat Service to Forward Port 32000 to Minikube
After=network.target

[Service]
ExecStart=/usr/bin/socat TCP-LISTEN:32000,fork TCP:192.168.49.2:32000
Restart=always
User=root

[Install]
WantedBy=multi-user.target
```
