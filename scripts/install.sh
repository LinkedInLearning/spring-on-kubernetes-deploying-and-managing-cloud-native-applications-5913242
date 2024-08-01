#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

echo "Installing kind"
../config/kind/deploy.sh
echo "Waiting for state stabalization"
sleep 5
echo "Installing ingress"
../config/ingress/deploy.sh
echo "Waiting for state stabalization"
sleep 5
echo "Installing monitoring"
../config/monitoring/deploy.sh
echo "Waiting for state stabalization"
sleep 5
echo "Installing postgres"
../config/postgres/deploy.sh
sleep 60

./populate-db.sh

