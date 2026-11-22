#!/usr/bin/env bash
set -euo pipefail

kubeconfig_file="${KUBECONFIG:-/workspaces/homelab/kubeconfig}"

for _ in {1..60}; do
  if [[ -s "$kubeconfig_file" ]]; then
    sed -i 's#https://127\.0\.0\.1:6443#https://k3s:6443#g' "$kubeconfig_file"

    if kubectl get --raw='/readyz?verbose' >/dev/null 2>&1; then
      printf 'k3s is ready; kubeconfig updated at %s\n' "$kubeconfig_file"
      exit 0
    fi
  fi

  sleep 2
done

printf 'Timed out waiting for k3s; check the k3s container logs.\n' >&2
exit 1
