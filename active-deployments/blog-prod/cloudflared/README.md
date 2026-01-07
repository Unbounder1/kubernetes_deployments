kubectl create secret generic tunnel-credentials -n blog-prod \
--from-file=credentials.json=/home/rdong/.cloudflared/[ID].json

cloudflared tunnel route dns blog-prod www.ryan-dong.com


kubectl exec -it blog-prod-database-1 -n cnpg-system -- psql -U postgres -c "
ALTER ROLE bloguser WITH SUPERUSER;
"