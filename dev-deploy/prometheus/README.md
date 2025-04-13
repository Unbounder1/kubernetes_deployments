helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

```
kubectl create ns prometheus

helm upgrade prometheus prometheus-community/prometheus -n prometheus --values dev-deploy/prometheus/prometheus-values.yaml --install

helm repo add grafana https://grafana.github.io/helm-charts 
helm repo update

helm upgrade grafana grafana/grafana -n prometheus --install --values dev-deploy/prometheus/grafana-values.yaml

kubectl apply -f dev-deploy/prometheus/kube-values```

kubectl edit pvc  storage-prometheus-alertmanager-0  -n prometheus
spec.storageClassName: nfs-client