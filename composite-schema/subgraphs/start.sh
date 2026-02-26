#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export ASPNETCORE_ENVIRONMENT=Production

PIDS=()

cleanup() {
  for pid in "${PIDS[@]}"; do
    kill "$pid" 2>/dev/null || true
  done
}
trap cleanup EXIT

cd "$SCRIPT_DIR/eShop.Accounts" && dotnet run -c Release --no-build --no-restore > "$SCRIPT_DIR/accounts_log.txt" 2>&1 &
PIDS+=($!)

cd "$SCRIPT_DIR/eShop.Inventory" && dotnet run -c Release --no-build --no-restore > "$SCRIPT_DIR/inventory_log.txt" 2>&1 &
PIDS+=($!)

cd "$SCRIPT_DIR/eShop.Products" && dotnet run -c Release --no-build --no-restore > "$SCRIPT_DIR/products_log.txt" 2>&1 &
PIDS+=($!)

cd "$SCRIPT_DIR/eShop.Reviews" && dotnet run -c Release --no-build --no-restore > "$SCRIPT_DIR/reviews_log.txt" 2>&1 &
PIDS+=($!)

wait
