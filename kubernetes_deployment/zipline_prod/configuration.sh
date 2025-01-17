kubectl create ns zipline
kubectl apply -f core_secret.yml -n zipline
kubectl apply -f postgres_volume.yml -n zipline
kubectl apply -f zipline_volume.yml -n zipline
kubectl apply -f postgres_zipline.yml -n zipline
kubectl apply -f zipline_zipline.yml