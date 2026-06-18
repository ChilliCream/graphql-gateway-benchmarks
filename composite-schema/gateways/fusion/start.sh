#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR/eShop.Gateway"
export ASPNETCORE_ENVIRONMENT=Production

# fusion-nightly (preview) bundles its own .NET 11 SDK in the artifact so it runs
# on .NET 11 regardless of what the benchmark machine has installed. Prefer it
# when present; the stable channel has no bundled SDK and uses the system dotnet.
if [[ -x "$SCRIPT_DIR/.dotnet/dotnet" ]]; then
  export DOTNET_ROOT="$SCRIPT_DIR/.dotnet"
  export PATH="$SCRIPT_DIR/.dotnet:$PATH"
fi

exec dotnet run -c Release --no-build --no-restore > "$SCRIPT_DIR/gateway_log.txt" 2>&1
