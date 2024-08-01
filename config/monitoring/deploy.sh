#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
if ! helm repo list | grep -q 'https://prometheus-community.github.io/helm-charts'; then
    helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
fi

kubectl apply -f namespace.yaml

helm upgrade --install kind-prometheus prometheus-community/kube-prometheus-stack \
      --namespace monitoring \
      --set prometheus.service.nodePort=30000 \
      --set prometheus.service.type=NodePort \
      --set grafana.service.nodePort=31000 \
      --set grafana.service.type=NodePort \
      --set alertmanager.service.nodePort=32000 \
      --set alertmanager.service.type=NodePort \
      --set prometheus-node-exporter.service.nodePort=32001 \
      --set prometheus-node-exporter.service.type=NodePort \
      -f config.yaml

