# Cloudflare DDNS

https://github.com/hotio/docker-cloudflare-ddns

Use the following command to generate the secret with the required fields for the deployment.

kubectl create secret generic cloudflare-ddns \
  --from-literal=api-token="insert api-token here" \
  --from-literal=zones="raspbernetes.com" \
  --from-literal=hosts="ingress.raspbernetes.com" \
  --from-literal=record-types="A;A;AAAA" \
  --namespace network --dry-run -o yaml > .secrets/k8s-secret-cloudflare-ddns.yaml
