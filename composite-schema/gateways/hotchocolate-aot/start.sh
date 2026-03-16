#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PUBLISH_DIR="$SCRIPT_DIR/publish-aot"
BINARY="$PUBLISH_DIR/eShop.Gateway"

if [[ ! -x "$BINARY" ]]; then
  echo "Error: AOT gateway binary not found or not executable: $BINARY"
  exit 1
fi

cd "$PUBLISH_DIR"
export ASPNETCORE_ENVIRONMENT=Production
export ASPNETCORE_URLS="http://0.0.0.0:5220"
export ASPNETCORE_HTTP_PORTS="5220"
exec ./eShop.Gateway > "$SCRIPT_DIR/gateway_log.txt" 2>&1
