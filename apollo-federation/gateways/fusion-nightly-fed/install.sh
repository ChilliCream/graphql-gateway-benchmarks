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
#                          10 = bundled latest GA .NET 10 SDK, targets net10.0 (default)
#                          11 = bundled latest .NET 11 preview SDK, targets net11.0
#                               with runtime-async opted in
#
# Both targets bundle their own SDK inside the gateway directory, so the runtime
# is a property of the prebuilt artifact rather than of the machine running it.
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
# The benchmark machine runs the *prebuilt* artifact and never executes this
# script, so the artifact itself must carry the runtime it is meant to be
# measured on — otherwise whatever SDK happens to be installed on the machine
# would silently decide the result. Every target therefore installs its own SDK
# *inside* the gateway directory, where it travels with the artifact:
#   10 = latest GA .NET 10 SDK,      gateway targets net10.0
#   11 = latest .NET 11 preview SDK, gateway targets net11.0 + runtime-async
#
# Generated here (all gitignored):
#   - $SCRIPT_DIR/.dotnet            bundled SDK (start.sh requires it at launch)
#   - $SCRIPT_DIR/global.json        pins the bundled SDK (overrides the repo-root
#                                    global.json, which pins .NET 10 / latestMinor)
#   - eShop.Gateway/bench.props      net11 only: retargets the gateway to net11.0
#                                    and opts into runtime-async (imported by the
#                                    csproj only when present)
BUNDLED_DOTNET_DIR="$SCRIPT_DIR/.dotnet"
GATEWAY_GLOBAL_JSON="$SCRIPT_DIR/global.json"
BENCH_PROPS="$SCRIPT_DIR/eShop.Gateway/bench.props"

if [[ "$DOTNET_TARGET" == "11" ]]; then
  # .NET 11 has no GA release yet, so the preview quality band is the only source.
  DOTNET_INSTALL_ARGS=(--channel 11.0 --quality preview)
  ALLOW_PRERELEASE=true
else
  # No --quality: dotnet-install.sh then resolves the latest GA patch of the band.
  DOTNET_INSTALL_ARGS=(--channel 10.0)
  ALLOW_PRERELEASE=false
fi

# --- Install the target SDK, bundled into the gateway dir --------------------
# Clear the previous target's generated inputs up front, before anything that can
# fail: a download that dies half way then leaves a neutral tree instead of one
# whose global.json pins an SDK that is no longer installed and whose bench.props
# still retargets to the other framework. Both are (re)written below on success.
# CI uses fresh checkouts; local runs may reuse the tree.
echo "Installing the .NET $DOTNET_TARGET SDK into $BUNDLED_DOTNET_DIR ..."
rm -rf "$BUNDLED_DOTNET_DIR"
rm -f "$GATEWAY_GLOBAL_JSON" "$BENCH_PROPS"
curl -sSL https://dot.net/v1/dotnet-install.sh \
  | bash -s -- "${DOTNET_INSTALL_ARGS[@]}" --install-dir "$BUNDLED_DOTNET_DIR"

export DOTNET_ROOT="$BUNDLED_DOTNET_DIR"
export PATH="$BUNDLED_DOTNET_DIR:$PATH"
DOTNET="$BUNDLED_DOTNET_DIR/dotnet"

# --list-sdks ignores global.json and (with multi-level lookup off) only lists
# SDKs in the bundled dir, so this is the version we actually installed.
SDK_VERSION="$("$DOTNET" --list-sdks | awk '{print $1}' | sort -V | tail -n1)"
SDK_MAJOR="${SDK_VERSION%%.*}"
if [[ "$SDK_MAJOR" != "$DOTNET_TARGET" ]]; then
  echo "ERROR: target .NET $DOTNET_TARGET requires a .NET $DOTNET_TARGET SDK but installed '${SDK_VERSION:-none}'"
  exit 1
fi
echo "Bundled .NET SDK: $SDK_VERSION"

# Pin the bundled SDK so the selected runtime is used at build *and* run time.
# The repo-root global.json pins .NET 10 with rollForward=latestMinor, which
# would otherwise steer SDK resolution here — a nearer global.json takes
# precedence.
cat > "$GATEWAY_GLOBAL_JSON" <<EOF
{
  "sdk": {
    "version": "$SDK_VERSION",
    "rollForward": "latestMinor",
    "allowPrerelease": $ALLOW_PRERELEASE
  }
}
EOF

if [[ "$DOTNET_TARGET" == "11" ]]; then
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
# `dotnet build` never removes another target framework's output, so a reused
# tree that was last built for a different BENCH_GATEWAY_DOTNET would keep that
# stale TFM directory around. The benchmark machine derives the runtime the
# artifact expects from the TFM directory under bin/Release, so leave exactly one.
GATEWAY_BIN_DIR="$SCRIPT_DIR/eShop.Gateway/bin/Release"
if [[ -d "$GATEWAY_BIN_DIR" ]]; then
  find "$GATEWAY_BIN_DIR" -mindepth 1 -maxdepth 1 -type d -name 'net*' \
    ! -name "net${DOTNET_TARGET}.0" -exec rm -rf {} +
fi

echo "Building Fusion gateway ($CHANNEL channel, .NET $DOTNET_TARGET)..."
cd "$SCRIPT_DIR/eShop.Gateway" && "$DOTNET" build -c Release --nologo -v quiet

echo "$SELECTED_VERSION" > "$SCRIPT_DIR/version.txt"
echo "Fusion gateway build complete (channel: $CHANNEL, dotnet: $DOTNET_TARGET, version: $SELECTED_VERSION)."
