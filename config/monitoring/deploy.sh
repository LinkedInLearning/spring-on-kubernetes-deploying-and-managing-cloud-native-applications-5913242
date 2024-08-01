#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
if ! helm repo list | grep -q 'https://prometheus-community.github.io/helm-charts'; then
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
fi

helm upgrade --install kind-prometheus prometheus-community/kube-prometheus-stack \
      --namespace monitoring --create-namespace \
      -f config.yaml