#!/usr/bin/env bash
set -euo pipefail

NS="${1:-lab}"

# cria namespace se não existir
kubectl get namespace "$NS" >/dev/null 2>&1 || kubectl create namespace "$NS"

# aplica limites/cotas
kubectl apply -f k8s/lab/limitrange.yaml
kubectl apply -f k8s/lab/quota.yaml

# setar namespace atual só pra ESTE contexto
kubectl config set-context --current --namespace="$NS" >/dev/null


echo "OK: namespace '$NS' pronto."
kubectl -n "$NS" describe limitrange lab-limits | sed -n '1,60p'
echo "<====================================>"
kubectl -n "$NS" describe quota lab-quota | sed -n '1,80p'
