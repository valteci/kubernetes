#!/usr/bin/env bash
set -euo pipefail

NS="${1:-lab}"

# volta contexto pra default (pra evitar ficar apontando pra um ns que vai sumir)
kubectl config set-context --current --namespace=default >/dev/null || true

# deleta o namespace
kubectl delete namespace "$NS" --wait=true

echo "OK: namespace '$NS' removido."
