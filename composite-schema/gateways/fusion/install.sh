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

# --- Resolve the HotChocolate version channel ---
# stable  = latest non-prerelease (default)
# preview = newest prerelease by SemVer precedence (the latest nightly/preview)
CHANNEL="${BENCH_GATEWAY_CHANNEL:-stable}"
case "$CHANNEL" in
  stable|preview) ;;
  *)
    echo "ERROR: unknown BENCH_GATEWAY_CHANNEL='$CHANNEL' (expected 'stable' or 'preview')"
    exit 1
    ;;
esac

echo "Fetching latest $CHANNEL HotChocolate version from NuGet..."
SELECTED_VERSION=$(curl -s "https://api.nuget.org/v3-flatcontainer/hotchocolate.aspnetcore/index.json" \
  | CHANNEL="$CHANNEL" python3 -c '
import json, os, sys

channel = os.environ["CHANNEL"]
versions = json.load(sys.stdin).get("versions", [])


def parse_core(core):
    nums = []
    for part in core.split("."):
        if not part.isdigit():
            return None
        nums.append(int(part))
    return tuple(nums)


def prerelease_key(pre):
    # SemVer 2.0 precedence: numeric identifiers compare numerically and rank
    # below alphanumeric identifiers; a shorter identifier set ranks lower when
    # all preceding identifiers are equal.
    key = []
    for ident in pre.split("."):
        if ident.isdigit():
            key.append((0, int(ident), ""))
        else:
            key.append((1, 0, ident))
    return tuple(key)


candidates = []
for raw in versions:
    core, sep, pre = raw.partition("-")
    core_tuple = parse_core(core)
    if core_tuple is None:
        continue
    is_pre = bool(sep)
    if channel == "stable" and is_pre:
        continue
    if channel == "preview" and not is_pre:
        continue
    sort_key = (core_tuple, prerelease_key(pre) if is_pre else ())
    candidates.append((sort_key, raw))

if not candidates:
    sys.exit(0)

candidates.sort(key=lambda item: item[0])
print(candidates[-1][1])
')

if [[ -z "$SELECTED_VERSION" ]]; then
  echo "ERROR: Could not determine latest $CHANNEL HotChocolate version"
  exit 1
fi

echo "Latest $CHANNEL HotChocolate version: $SELECTED_VERSION"

# --- Update HotChocolate package versions in gateway .csproj ---
echo "Updating HotChocolate* package references to $SELECTED_VERSION..."
for csproj in "$SCRIPT_DIR"/*/*.csproj; do
  if [ -f "$csproj" ] && grep -q 'Include="HotChocolate' "$csproj"; then
    sed -i.bak -E 's/(Include="HotChocolate[^"]*" Version=")[^"]+(")/\1'"$SELECTED_VERSION"'\2/g' "$csproj"
    rm -f "$csproj.bak"
    echo "  Updated: $(basename "$(dirname "$csproj")")/$(basename "$csproj")"
  fi
done

# --- Build ---
echo "Building Fusion gateway ($CHANNEL channel)..."
cd "$SCRIPT_DIR/eShop.Gateway" && dotnet build -c Release --nologo -v quiet

echo "$SELECTED_VERSION" > "$SCRIPT_DIR/version.txt"
echo "Fusion gateway build complete (channel: $CHANNEL, version: $SELECTED_VERSION)."
