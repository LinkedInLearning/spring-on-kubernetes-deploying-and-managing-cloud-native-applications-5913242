#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

# Add helm repo if it doesn't already exist
if ! helm repo list | grep -q 'https://cloudnative-pg.github.io/charts'; then
    helm repo add cnpg https://cloudnative-pg.github.io/charts
fi

#Installing the CloudNativePG Operator
helm upgrade --install cnpg \
--namespace cnpg-system \
--create-namespace \
cnpg/cloudnative-pg

kubectl apply -f instance.yaml