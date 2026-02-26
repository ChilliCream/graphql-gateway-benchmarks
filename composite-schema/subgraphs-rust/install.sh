#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Ensure Rust is installed ---
if command -v cargo &>/dev/null; then
  echo "Rust toolchain found: $(rustc --version)"
else
  echo "Rust not found. Installing..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
fi

echo "Building Rust subgraphs..."
cd "$SCRIPT_DIR" && cargo build --release

echo "Subgraphs build complete."
