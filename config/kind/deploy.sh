#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"
kind create cluster --config config.yaml