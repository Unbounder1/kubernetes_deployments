
kubectl apply --server-side --force-conflicts -f https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.25/releases/cnpg-1.25.0.yaml

\/ if unable to reach webhook
```
kubectl patch validatingwebhookconfiguration cnpg-validating-webhook-configuration -p '{"webhooks": [{"name": "vcluster.cnpg.io","failurePolicy": "Ignore"}]}'
kubectl patch mutatingwebhookconfiguration cnpg-mutating-webhook-configuration -p '{"webhooks": [{"name": "mcluster.cnpg.io","failurePolicy": "Ignore"}]}'
```


MUST FORCE CONFLICTS
-> Serverside to avoid maximum character limit

	•	Traditional apply (client-side):
The client reads the resource, merges changes locally, and then sends the updated resource back to the server. Conflicts can occur, and it’s less reliable with multiple controllers or users managing the same resource.
	•	Server-side apply:
The client sends the desired state directly to the Kubernetes API server. The server handles the merge, conflict detection, and ownership tracking more effectively.


kubectl apply -f ./active-deployments/blog-prod/

kubectl apply -f ./active-deployments/blog-prod/ --server-side