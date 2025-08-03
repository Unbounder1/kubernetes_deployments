# Exec command
kubectl exec -it <podname> -n minecraft -- rcon-cli

# Port Forward
sudo iptables -t nat -A PREROUTING -p udp --dport 32000 -j REDIRECT --to-port 32000
sudo iptables -t nat -A PREROUTING -p tcp --dport 32000 -j REDIRECT --to-port 32000