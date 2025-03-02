kubectl create secret generic tunnel-credentials -n blog-prod \
<<<<<<< HEAD
--from-file=credentials.json=/home/rdong/.cloudflared/[ID].json

cloudflared tunnel route dns blog-prod www.ryan-dong.com
