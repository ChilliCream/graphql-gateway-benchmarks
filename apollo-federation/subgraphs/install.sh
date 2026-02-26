#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Building subgraphs..."
cd "$SCRIPT_DIR" && cargo build --release

echo "Subgraphs build complete."
