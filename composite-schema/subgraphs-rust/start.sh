#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/target/release/subgraphs" > "$SCRIPT_DIR/subgraph_log.txt" 2>&1 &
SUBGRAPH_PID=$!

cleanup() {
    kill "$SUBGRAPH_PID" 2>/dev/null || true
}
trap cleanup EXIT

wait
