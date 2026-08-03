#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "$SCRIPT_DIR/eShop.Gateway"
export ASPNETCORE_ENVIRONMENT=Production

# install.sh bundles the SDK this build was made for into the artifact, so the
# gateway runs on its intended runtime regardless of what the benchmark machine
# has installed. A missing bundle means a broken artifact: falling back to the
# system dotnet would silently benchmark a different runtime, so fail instead.
if [[ ! -x "$SCRIPT_DIR/.dotnet/dotnet" ]]; then
  echo "ERROR: no bundled .NET SDK at $SCRIPT_DIR/.dotnet/dotnet - run install.sh in $SCRIPT_DIR first" >&2
  exit 1
fi

export DOTNET_ROOT="$SCRIPT_DIR/.dotnet"
export PATH="$SCRIPT_DIR/.dotnet:$PATH"

exec dotnet run -c Release --no-build --no-restore > "$SCRIPT_DIR/gateway_log.txt" 2>&1
