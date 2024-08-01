#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

echo "Installing kind"
./kind/deploy.sh
echo "Waiting for state stabalization"
sleep 5
echo "Installing ingress"
./ingress/deploy.sh
echo "Waiting for state stabalization"
sleep 5
echo "Installing monitoring"
./monitoring/deploy.sh
echo "Waiting for state stabalization"
sleep 5
echo "Installing postgres"
./postgres/deploy.sh
sleep 10

