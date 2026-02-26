#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

exec "$SCRIPT_DIR/target/release/subgraphs" > "$SCRIPT_DIR/subgraph_log.txt" 2>&1
