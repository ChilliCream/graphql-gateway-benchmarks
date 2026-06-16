#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR/eShop.Gateway"
export ASPNETCORE_ENVIRONMENT=Production
exec dotnet run -c Release --no-build --no-restore > "$SCRIPT_DIR/gateway_log.txt" 2>&1
