#!/usr/bin/env bash
set -Eeuo pipefail

# =============================================================================
# install.sh — Build the feddi Gateway (https://feddi.dev / feddi-dev/feddi-gateway)
#
# feddi is a JVM-native GraphQL composite-schema federation gateway built on
# GraphQL Java. There is no published prebuilt OSS binary, so this script builds
# the distribution from source, pinned to a specific commit for reproducibility:
#
#   1. Bundle a JDK 25 into ./.jdk (feddi requires Java 25+). Bundling — rather
#      than relying on a system JDK — keeps the runtime reproducible and lets the
#      built artifact travel for prebuilt-gateway runs (start.sh prefers ./.jdk).
#   2. Clone feddi-gateway at the pinned commit into ./source.
#   3. Build the distribution ZIP (./gradlew :app:feddiGatewayDistZip) and extract
#      it to ./dist (./dist/feddi-gateway/bin/feddi-gateway + app.jar).
#   4. Assemble ./subgraphs.zip from ./subgraph-config (uploaded by start.sh).
#
# The script is idempotent: an already-present valid JDK / clone / build is reused.
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

FEDDI_REPO="https://github.com/feddi-dev/feddi-gateway.git"
FEDDI_REF="77271dc84a06a9521051f761a14d419e83d6eb2a"  # pinned for reproducibility

JDK_DIR="$SCRIPT_DIR/.jdk"
SOURCE_DIR="$SCRIPT_DIR/source"
DIST_DIR="$SCRIPT_DIR/dist"

# --- 1. Ensure a bundled JDK 25 ----------------------------------------------

jdk_java_home() {
  # Temurin tarballs extract to <java_home> on Linux and <home>/Contents/Home on macOS.
  if [[ -x "$JDK_DIR/bin/java" ]]; then
    echo "$JDK_DIR"
  elif [[ -x "$JDK_DIR/Contents/Home/bin/java" ]]; then
    echo "$JDK_DIR/Contents/Home"
  fi
}

jdk_is_25() {
  local jh="$1"
  [[ -n "$jh" && -x "$jh/bin/java" ]] || return 1
  local major
  major="$("$jh/bin/java" -version 2>&1 | head -1 | sed -E 's/.*version "([0-9]+).*/\1/')"
  [[ "$major" == "25" ]]
}

JAVA_HOME_LOCAL="$(jdk_java_home || true)"
if jdk_is_25 "$JAVA_HOME_LOCAL"; then
  echo "Bundled JDK already present: $("$JAVA_HOME_LOCAL/bin/java" -version 2>&1 | head -1)"
else
  case "$(uname -s)" in
    Linux)  JDK_OS="linux" ;;
    Darwin) JDK_OS="mac" ;;
    *) echo "ERROR: unsupported OS for JDK download: $(uname -s)"; exit 1 ;;
  esac
  case "$(uname -m)" in
    x86_64|amd64)  JDK_ARCH="x64" ;;
    arm64|aarch64) JDK_ARCH="aarch64" ;;
    *) echo "ERROR: unsupported arch for JDK download: $(uname -m)"; exit 1 ;;
  esac

  JDK_URL="https://api.adoptium.net/v3/binary/latest/25/ga/${JDK_OS}/${JDK_ARCH}/jdk/hotspot/normal/eclipse"
  echo "Downloading Temurin JDK 25 ($JDK_OS/$JDK_ARCH) ..."
  rm -rf "$JDK_DIR"
  mkdir -p "$JDK_DIR"
  TMP_TGZ="$SCRIPT_DIR/.jdk.tar.gz"
  curl -fSL "$JDK_URL" -o "$TMP_TGZ"
  tar -xzf "$TMP_TGZ" -C "$JDK_DIR" --strip-components=1
  rm -f "$TMP_TGZ"

  JAVA_HOME_LOCAL="$(jdk_java_home || true)"
  if ! jdk_is_25 "$JAVA_HOME_LOCAL"; then
    echo "ERROR: bundled JDK is not a usable Java 25 (got: ${JAVA_HOME_LOCAL:-none})"
    exit 1
  fi
  echo "Bundled JDK: $("$JAVA_HOME_LOCAL/bin/java" -version 2>&1 | head -1)"
fi

export JAVA_HOME="$JAVA_HOME_LOCAL"
export PATH="$JAVA_HOME/bin:$PATH"

# --- 2. Clone feddi-gateway at the pinned commit -----------------------------

if [[ -d "$SOURCE_DIR/.git" ]] && \
   [[ "$(git -C "$SOURCE_DIR" rev-parse HEAD 2>/dev/null || true)" == "$FEDDI_REF" ]]; then
  echo "feddi-gateway source already at $FEDDI_REF"
else
  echo "Fetching feddi-gateway at $FEDDI_REF ..."
  rm -rf "$SOURCE_DIR"
  git init -q "$SOURCE_DIR"
  git -C "$SOURCE_DIR" remote add origin "$FEDDI_REPO"
  git -C "$SOURCE_DIR" fetch -q --depth 1 origin "$FEDDI_REF"
  git -C "$SOURCE_DIR" checkout -q FETCH_HEAD
fi

# --- 3. Build + extract the distribution -------------------------------------

echo "Building feddi Gateway distribution (Gradle) ..."
( cd "$SOURCE_DIR/gateway" && ./gradlew :app:feddiGatewayDistZip --no-daemon --console=plain )

DIST_ZIP="$SOURCE_DIR/gateway/app/build/distributions/feddi-gateway.zip"
if [[ ! -f "$DIST_ZIP" ]]; then
  echo "ERROR: expected distribution ZIP not found at $DIST_ZIP"
  exit 1
fi

echo "Extracting distribution to $DIST_DIR ..."
rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"
unzip -q "$DIST_ZIP" -d "$DIST_DIR"

if [[ ! -x "$DIST_DIR/feddi-gateway/bin/feddi-gateway" ]] || [[ ! -f "$DIST_DIR/feddi-gateway/app.jar" ]]; then
  echo "ERROR: extracted distribution is incomplete in $DIST_DIR"
  exit 1
fi

# --- 4. Refresh subgraph SDLs from the canonical .NET source schemas ---------
#
# feddi composes from subgraph-config/<name>/schema.graphqls. Rather than keep
# hand-maintained copies (which silently drift from the subgraphs the benchmark
# actually runs), copy the canonical HotChocolate exports straight in. Since
# HotChocolate 16.3+ emits @key(fields:…) on entities natively, the raw export
# composes in feddi as-is — no directive trimming needed. Each subgraph's
# config.yaml (the feddi-specific subgraph URL) stays source-controlled; only the
# .graphqls SDL is generated here.

SUBGRAPHS_NET="$SCRIPT_DIR/../../subgraphs-net"
SUBGRAPH_MAP=(
  "accounts:eShop.Accounts"
  "inventory:eShop.Inventory"
  "products:eShop.Products"
  "reviews:eShop.Reviews"
)
echo "Refreshing subgraph SDLs from $SUBGRAPHS_NET ..."
for entry in "${SUBGRAPH_MAP[@]}"; do
  name="${entry%%:*}"
  proj="${entry##*:}"
  src="$SUBGRAPHS_NET/$proj/schema.graphql"
  dst="$SCRIPT_DIR/subgraph-config/$name/schema.graphqls"
  if [[ ! -f "$src" ]]; then
    echo "ERROR: canonical subgraph schema not found: $src"
    exit 1
  fi
  cp "$src" "$dst"
  echo "  $proj/schema.graphql -> subgraph-config/$name/schema.graphqls"
done

# --- 5. Assemble the subgraph-definition ZIP (uploaded by start.sh) ----------

echo "Assembling subgraphs.zip from subgraph-config/ ..."
rm -f "$SCRIPT_DIR/subgraphs.zip"
( cd "$SCRIPT_DIR/subgraph-config" && zip -qr "$SCRIPT_DIR/subgraphs.zip" . )

# --- 6. Record version -------------------------------------------------------

echo "$FEDDI_REF" | cut -c1-12 > "$SCRIPT_DIR/version.txt"
echo "feddi Gateway build complete (commit: $(cat "$SCRIPT_DIR/version.txt"))."
