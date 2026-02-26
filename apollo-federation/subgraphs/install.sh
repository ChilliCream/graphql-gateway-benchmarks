#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Ensure Rust toolchain is installed ---
if ! command -v cargo &>/dev/null; then
  echo "Rust not found. Installing via rustup..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  source "$HOME/.cargo/env"
else
  echo "Rust already installed: $(rustc --version)"
fi

# --- Build ---
echo "Building subgraphs..."
cd "$SCRIPT_DIR" && cargo build --release

echo "Subgraphs build complete."
