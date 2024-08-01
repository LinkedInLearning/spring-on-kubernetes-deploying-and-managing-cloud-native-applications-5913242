#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! helm repo list | grep -q 'https://cloudnative-pg.github.io/charts'; then
    helm repo add cloudnative-pg https://cloudnative-pg.github.io/charts
fi

helm upgrade --install cloudnative-pg cloudnative-pg/cloudnative-pg
echo "Waiting for operator to stabalize"
sleep 30
kubectl apply -f config.yaml