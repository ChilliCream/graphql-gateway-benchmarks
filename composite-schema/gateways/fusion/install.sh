#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# The Fusion gateway is benchmarked along two independent axes:
#
#   BENCH_GATEWAY_CHANNEL  which HotChocolate NuGet packages to build against
#                          stable  = latest non-prerelease (default)
#                          preview = newest prerelease (the latest nightly)
#
#   BENCH_GATEWAY_DOTNET   which .NET runtime / target framework to build and run on
#                          10 = system .NET 10 SDK, targets net10.0 (default)
#                          11 = bundled .NET 11 preview SDK, targets net11.0 with
#                               runtime-async opted in
#
# The two axes are orthogonal, which is what lets the matrix run the preview
# packages on BOTH runtimes to isolate framework effects (e.g. runtime-async):
#   fusion               = stable  packages on .NET 10
#   fusion-nightly       = preview packages on .NET 10
#   fusion-nightly-net11 = preview packages on .NET 11

# --- Resolve the HotChocolate package channel --------------------------------
CHANNEL="${BENCH_GATEWAY_CHANNEL:-stable}"
case "$CHANNEL" in
  stable|preview) ;;
  *)
    echo "ERROR: unknown BENCH_GATEWAY_CHANNEL='$CHANNEL' (expected 'stable' or 'preview')"
    exit 1
    ;;
esac

# --- Resolve the .NET runtime / target framework -----------------------------
DOTNET_TARGET="${BENCH_GATEWAY_DOTNET:-10}"
case "$DOTNET_TARGET" in
  10|11) ;;
  *)
    echo "ERROR: unknown BENCH_GATEWAY_DOTNET='$DOTNET_TARGET' (expected '10' or '11')"
    exit 1
    ;;
esac

# --- Target-specific build inputs --------------------------------------------
# The .NET 11 target (fusion-nightly-net11) must compile AND run on .NET 11.
# Because the benchmark machine runs the *prebuilt* artifact (install.sh is
# skipped there), the .NET 11 preview SDK is installed *inside* the gateway
# directory so it travels with the artifact, and the gateway is retargeted to
# net11.0:
#   - $SCRIPT_DIR/.dotnet            bundled .NET 11 preview SDK (start.sh prefers it)
#   - $SCRIPT_DIR/global.json        pins the bundled SDK (overrides the repo-root
#                                    global.json, which pins .NET 10 / latestMinor)
#   - eShop.Gateway/bench.props      retargets the gateway to net11.0 and opts
#                                    into runtime-async (imported by the csproj
#                                    only when present)
BUNDLED_DOTNET_DIR="$SCRIPT_DIR/.dotnet"
GATEWAY_GLOBAL_JSON="$SCRIPT_DIR/global.json"
BENCH_PROPS="$SCRIPT_DIR/eShop.Gateway/bench.props"

if [[ "$DOTNET_TARGET" == "11" ]]; then
  # --- Install the latest .NET 11 preview SDK, bundled into the gateway dir ---
  echo "Installing the latest .NET 11 preview SDK into $BUNDLED_DOTNET_DIR ..."
  rm -rf "$BUNDLED_DOTNET_DIR"
  curl -sSL https://dot.net/v1/dotnet-install.sh \
    | bash -s -- --channel 11.0 --quality preview --install-dir "$BUNDLED_DOTNET_DIR"

  export DOTNET_ROOT="$BUNDLED_DOTNET_DIR"
  export PATH="$BUNDLED_DOTNET_DIR:$PATH"
  DOTNET="$BUNDLED_DOTNET_DIR/dotnet"

  # --list-sdks ignores global.json and (with multi-level lookup off) only lists
  # SDKs in the bundled dir, so this is the version we actually installed.
  SDK_VERSION="$("$DOTNET" --list-sdks | awk '{print $1}' | sort -V | tail -n1)"
  SDK_MAJOR="${SDK_VERSION%%.*}"
  if [[ "$SDK_MAJOR" != "11" ]]; then
    echo "ERROR: the net11 target requires a .NET 11 SDK but installed '$SDK_VERSION'"
    exit 1
  fi
  echo "Bundled .NET SDK: $SDK_VERSION"

  # Pin the bundled SDK so .NET 11 is selected at build *and* run time. The
  # repo-root global.json pins .NET 10 with rollForward=latestMinor, which would
  # otherwise force SDK 10 here — a nearer global.json takes precedence.
  cat > "$GATEWAY_GLOBAL_JSON" <<EOF
{
  "sdk": {
    "version": "$SDK_VERSION",
    "rollForward": "latestMinor",
    "allowPrerelease": true
  }
}
EOF

  # Retarget the gateway to net11.0 and opt into .NET 11 runtime-async (imported
  # by eShop.Gateway.csproj when present).
  #
  # runtime-async replaces compiler-generated async state machines with the
  # runtime-provided async feature. Since .NET 11 Preview 3 the feature switch
  # alone is enough — the [RequiresPreviewFeatures] gate was removed, so
  # <EnablePreviewFeatures> is intentionally NOT set (we always install the
  # latest preview SDK, so the modern opt-in always applies).
  #
  # Scope: this flag only affects async methods compiled in THIS project
  # (eShop.Gateway). The .NET 11 BCL is already built with runtime-async
  # (Preview 4+), but the prebuilt HotChocolate packages are not — to exercise
  # runtime-async through HotChocolate's execution pipeline, the HotChocolate
  # packages themselves must be compiled with runtime-async=on upstream; this
  # benchmark then picks them up automatically via the preview channel.
  cat > "$BENCH_PROPS" <<'EOF'
<Project>
  <PropertyGroup>
    <TargetFramework>net11.0</TargetFramework>
    <TargetFrameworks>net11.0</TargetFrameworks>
    <Features>$(Features);runtime-async=on</Features>
  </PropertyGroup>
</Project>
EOF
else
  # --- .NET 10: build and run on the system .NET 10 SDK ---
  # Remove any .NET 11 retargeting left over from an earlier net11 build in this
  # working tree (CI uses fresh checkouts; local runs may reuse the tree).
  rm -rf "$BUNDLED_DOTNET_DIR"
  rm -f "$GATEWAY_GLOBAL_JSON" "$BENCH_PROPS"

  REQUIRED_DOTNET_MAJOR=10
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
  DOTNET="dotnet"
fi

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
echo "Building Fusion gateway ($CHANNEL channel, .NET $DOTNET_TARGET)..."
cd "$SCRIPT_DIR/eShop.Gateway" && "$DOTNET" build -c Release --nologo -v quiet

echo "$SELECTED_VERSION" > "$SCRIPT_DIR/version.txt"
echo "Fusion gateway build complete (channel: $CHANNEL, dotnet: $DOTNET_TARGET, version: $SELECTED_VERSION)."
