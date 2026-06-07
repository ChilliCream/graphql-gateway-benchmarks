#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

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

# --- Fetch latest stable HotChocolate version from NuGet ---
echo "Fetching latest stable HotChocolate version from NuGet..."
LATEST_STABLE=$(curl -s "https://api.nuget.org/v3-flatcontainer/hotchocolate.aspnetcore/index.json" \
  | python3 -c "import json,sys; vs=json.load(sys.stdin)['versions']; stable=[v for v in vs if '-' not in v]; print(max(stable, key=lambda v: [int(p) for p in v.split('.')]) if stable else '')")

if [[ -z "$LATEST_STABLE" ]]; then
  echo "ERROR: Could not determine latest stable HotChocolate version"
  exit 1
fi

echo "Latest stable HotChocolate version: $LATEST_STABLE"

# --- Update HotChocolate package versions in gateway .csproj ---
echo "Updating HotChocolate* package references to $LATEST_STABLE..."
for csproj in "$SCRIPT_DIR"/*/*.csproj; do
  if [ -f "$csproj" ] && grep -q 'Include="HotChocolate' "$csproj"; then
    sed -i.bak -E 's/(Include="HotChocolate[^"]*" Version=")[^"]+(")/\1'"$LATEST_STABLE"'\2/g' "$csproj"
    rm -f "$csproj.bak"
    echo "  Updated: $(basename "$(dirname "$csproj")")/$(basename "$csproj")"
  fi
done

# --- Build ---
echo "Building HotChocolate gateway..."
cd "$SCRIPT_DIR/eShop.Gateway" && dotnet build -c Release --nologo -v quiet

echo "$LATEST_STABLE" > "$SCRIPT_DIR/version.txt"
echo "HotChocolate gateway build complete (version: $LATEST_STABLE)."
