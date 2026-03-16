#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_GATEWAY_DIR="$SCRIPT_DIR/../hotchocolate/eShop.Gateway"
SOURCE_CSPROJ="$SOURCE_GATEWAY_DIR/eShop.Gateway.csproj"
OUTPUT_DIR="$SCRIPT_DIR/publish-aot"

REQUIRED_DOTNET_MAJOR=10

# --- Ensure .NET SDK is installed ---
if command -v dotnet &>/dev/null; then
  INSTALLED_MAJOR=$(dotnet --version | cut -d. -f1)
  if [[ "$INSTALLED_MAJOR" -ge "$REQUIRED_DOTNET_MAJOR" ]]; then
    echo ".NET SDK already installed: $(dotnet --version)"
  else
    echo ".NET SDK $INSTALLED_MAJOR found but need $REQUIRED_DOTNET_MAJOR+. Installing..."
    curl -sSL https://dot.net/v1/dotnet-install.sh | bash -s -- --channel "$REQUIRED_DOTNET_MAJOR.0"
    export PATH="$HOME/.dotnet:$PATH"
  fi
else
  echo ".NET SDK not found. Installing .NET $REQUIRED_DOTNET_MAJOR..."
  curl -sSL https://dot.net/v1/dotnet-install.sh | bash -s -- --channel "$REQUIRED_DOTNET_MAJOR.0"
  export PATH="$HOME/.dotnet:$PATH"
fi

if [[ ! -f "$SOURCE_CSPROJ" ]]; then
  echo "ERROR: source gateway project not found: $SOURCE_CSPROJ"
  exit 1
fi

# --- Fetch latest HotChocolate preview version from NuGet ---
echo "Fetching latest HotChocolate preview version from NuGet..."
LATEST_PREVIEW=$(curl -s "https://api.nuget.org/v3-flatcontainer/hotchocolate.aspnetcore/index.json" \
  | python3 -c "import json,sys; vs=json.load(sys.stdin)['versions']; previews=[v for v in vs if '-' in v]; print(previews[-1] if previews else '')")

if [[ -z "$LATEST_PREVIEW" ]]; then
  echo "ERROR: Could not determine latest HotChocolate preview version"
  exit 1
fi

echo "Latest HotChocolate preview version: $LATEST_PREVIEW"

# --- Update HotChocolate package versions in source gateway .csproj ---
echo "Updating HotChocolate* package references to $LATEST_PREVIEW..."
for csproj in "$SOURCE_GATEWAY_DIR"/*.csproj; do
  if [[ -f "$csproj" ]] && grep -q 'Include="HotChocolate' "$csproj"; then
    sed -i.bak -E 's/(Include="HotChocolate[^"]*" Version=")[^"]+(")/\1'"$LATEST_PREVIEW"'\2/g' "$csproj"
    rm -f "$csproj.bak"
    echo "  Updated: $(basename "$csproj")"
  fi
done

# --- Build AOT publish artifact ---
echo "Publishing HotChocolate AOT gateway..."
rm -rf "$OUTPUT_DIR"

dotnet publish "$SOURCE_CSPROJ" \
  -c Release \
  -r linux-x64 \
  --self-contained true \
  -p:PublishAot=true \
  -p:InvariantGlobalization=true \
  -o "$OUTPUT_DIR" \
  --nologo -v quiet

if [[ ! -x "$OUTPUT_DIR/eShop.Gateway" ]]; then
  echo "ERROR: expected AOT binary at $OUTPUT_DIR/eShop.Gateway"
  exit 1
fi

# Ensure runtime file-based schema is available at startup path.
if [[ -f "$SOURCE_GATEWAY_DIR/gateway.far" ]]; then
  cp "$SOURCE_GATEWAY_DIR/gateway.far" "$OUTPUT_DIR/gateway.far"
fi

echo "${LATEST_PREVIEW}-aot" > "$SCRIPT_DIR/version.txt"
echo "HotChocolate AOT gateway build complete (version: $LATEST_PREVIEW)."
