kubectl create secret generic tunnel-credentials -n blog-prod \
--from-file=credentials.json=/home/rdong/.cloudflared/1da14471-2c7a-4d3c-96d1-8cec130da504.json