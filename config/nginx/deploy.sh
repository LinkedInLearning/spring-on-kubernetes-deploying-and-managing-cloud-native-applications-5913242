#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

# Add helm repo if it doesn't already exist
if ! helm repo list | grep -q 'https://kubernetes.github.io/ingress-nginx'; then
    helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
    helm repo update
fi

helm upgrade --install --create-namespace --namespace networking --wait \
    --version 4.11.1 \
    nginx-ingress ingress-nginx/ingress-nginx \
    --values values.yaml \