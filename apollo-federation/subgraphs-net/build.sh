#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

REQUIRED_DOTNET_MAJOR=10
CSPROJ_FILES=()
while IFS= read -r csproj; do
  [[ -n "$csproj" ]] && CSPROJ_FILES+=("$csproj")
done < <(find "$SCRIPT_DIR" -mindepth 2 -maxdepth 2 -type f -name '*.csproj' | sort)

if [[ ${#CSPROJ_FILES[@]} -eq 0 ]]; then
  echo "ERROR: no .csproj files found under $SCRIPT_DIR"
  exit 1
fi

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

# --- Fetch latest HotChocolate preview version from NuGet ---
echo "Fetching latest HotChocolate preview version from NuGet..."
LATEST_PREVIEW=$(curl -s "https://api.nuget.org/v3-flatcontainer/hotchocolate.aspnetcore/index.json" \
  | python3 -c "import json,sys; vs=json.load(sys.stdin)['versions']; previews=[v for v in vs if '-' in v]; print(previews[-1] if previews else '')")

if [[ -z "$LATEST_PREVIEW" ]]; then
  echo "ERROR: Could not determine latest HotChocolate preview version"
  exit 1
fi

echo "Latest HotChocolate preview version: $LATEST_PREVIEW"

# --- Update HotChocolate package versions in subgraph .csproj files ---
echo "Updating HotChocolate* package references to $LATEST_PREVIEW..."
for csproj in "${CSPROJ_FILES[@]}"; do
  if grep -q 'Include="HotChocolate' "$csproj"; then
    sed -i.bak -E 's/(Include="HotChocolate[^"]*" Version=")[^"]+(")/\1'"$LATEST_PREVIEW"'\2/g' "$csproj"
    rm -f "$csproj.bak"
    echo "  Updated: $(basename "$(dirname "$csproj")")/$(basename "$csproj")"
  fi
done

# --- Build all subgraph projects ---
echo "Building subgraphs..."
for csproj in "${CSPROJ_FILES[@]}"; do
  project_name="$(basename "$(dirname "$csproj")")"
  echo "  Building $project_name..."
  dotnet build "$csproj" -c Release --nologo -v quiet
done

echo "Subgraphs build complete (version: $LATEST_PREVIEW)."
