#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

REQUIRED_JAVA_MAJOR=25

# --- Ensure Java 25+ is available ---
install_java() {
  echo "Installing Eclipse Temurin JDK $REQUIRED_JAVA_MAJOR..."
  local jdk_dir="$SCRIPT_DIR/jdk"
  mkdir -p "$jdk_dir"

  local arch
  arch="$(uname -m)"
  case "$arch" in
    x86_64|amd64) arch="x64" ;;
    aarch64|arm64) arch="aarch64" ;;
    *) echo "Unsupported architecture: $arch"; exit 1 ;;
  esac

  local os
  os="$(uname -s | tr '[:upper:]' '[:lower:]')"
  case "$os" in
    darwin) os="mac" ;;
    linux)  os="linux" ;;
    *) echo "Unsupported OS: $os"; exit 1 ;;
  esac

  local url="https://api.adoptium.net/v3/binary/latest/${REQUIRED_JAVA_MAJOR}/ga/${os}/${arch}/jdk/hotspot/normal/eclipse"
  echo "Downloading JDK from: $url"
  curl -fsSL -o "$jdk_dir/jdk.tar.gz" "$url"
  tar -xzf "$jdk_dir/jdk.tar.gz" -C "$jdk_dir" --strip-components=1
  rm -f "$jdk_dir/jdk.tar.gz"
  echo "JDK installed to: $jdk_dir"
}

JAVA_CMD=""
if [[ -d "$SCRIPT_DIR/jdk/bin" ]]; then
  JAVA_CMD="$SCRIPT_DIR/jdk/bin/java"
elif command -v java &>/dev/null; then
  JAVA_CMD="java"
fi

if [[ -n "$JAVA_CMD" ]]; then
  INSTALLED_MAJOR=$("$JAVA_CMD" -version 2>&1 | head -1 | sed -E 's/.*"([0-9]+).*/\1/')
  if [[ "$INSTALLED_MAJOR" -ge "$REQUIRED_JAVA_MAJOR" ]]; then
    echo "Java already available: $("$JAVA_CMD" -version 2>&1 | head -1)"
  else
    echo "Java $INSTALLED_MAJOR found but need $REQUIRED_JAVA_MAJOR+."
    install_java
  fi
else
  echo "Java not found."
  install_java
fi

# --- Download feddi-gateway distribution ---
if [[ -d "$SCRIPT_DIR/feddi-gateway/bin" ]]; then
  echo "feddi-gateway distribution already present, skipping download."
else
  echo "Downloading feddi-gateway distribution..."
  curl -fsSL -o "$SCRIPT_DIR/feddi-gateway.zip" "https://feddi.dev/releases/latest/gateway"
  echo "Extracting feddi-gateway..."
  unzip -q "$SCRIPT_DIR/feddi-gateway.zip" -d "$SCRIPT_DIR"
  rm -f "$SCRIPT_DIR/feddi-gateway.zip"
  chmod +x "$SCRIPT_DIR/feddi-gateway/bin/feddi-gateway"
  echo "feddi-gateway distribution ready."
fi

# --- Build subgraphs.zip for admin upload ---
echo "Building subgraphs configuration archive..."
(cd "$SCRIPT_DIR/subgraphs" && zip -q -r "$SCRIPT_DIR/subgraphs.zip" .)

# --- Fetch feddi-gateway version ---
FEDDI_VERSION="unknown"
if [[ -f "$SCRIPT_DIR/feddi-gateway/lib/feddi-gateway-app.jar" ]]; then
  FEDDI_VERSION=$(basename "$SCRIPT_DIR/feddi-gateway/lib/feddi-gateway-app.jar" .jar | sed 's/feddi-gateway-app-*//')
fi
# Try to extract version from any jar file name
for jar in "$SCRIPT_DIR"/feddi-gateway/lib/feddi-gateway-app*.jar; do
  if [[ -f "$jar" ]]; then
    FEDDI_VERSION=$(basename "$jar" .jar | sed 's/feddi-gateway-app-//')
    break
  fi
done
echo "$FEDDI_VERSION" > "$SCRIPT_DIR/version.txt"

echo "feddi-gateway install complete (version: $FEDDI_VERSION)."
