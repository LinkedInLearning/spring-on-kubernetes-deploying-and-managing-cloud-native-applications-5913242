#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if ! helm repo list | grep -q 'https://cloudnative-pg.github.io/charts'; then
    helm repo add cloudnative-pg https://cloudnative-pg.github.io/charts
fi

helm upgrade --install cloudnative-pg cloudnative-pg/cloudnative-pg
echo "Waiting for operator in finish up"
sleep 10
kubectl apply -f config.yaml

