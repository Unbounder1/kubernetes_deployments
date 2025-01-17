kubectl create ns zipline-public
kubectl apply -f core_secret.yml -n zipline-public
kubectl apply -f postgres_volume.yml -n zipline-public
kubectl apply -f zipline_volume.yml -n zipline-public
kubectl apply -f postgres_zipline.yml -n zipline-public
kubectl apply -f zipline_zipline.yml