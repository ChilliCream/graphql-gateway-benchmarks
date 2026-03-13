#!/usr/bin/env bash
set -euo pipefail

# Verify CPU affinity of benchmark processes.
# Usage: verify-pinning.sh <gateway-pid> <subgraph-pid>

if ! command -v taskset &>/dev/null; then
  echo "Pinning verification: skipped (no taskset)"
  exit 0
fi

echo "=== CPU Affinity Verification ==="

GATEWAY_PID="${1:-}"
SUBGRAPH_PID="${2:-}"

if [[ -n "$GATEWAY_PID" ]]; then
  echo "  Gateway (PID $GATEWAY_PID): $(taskset -cp "$GATEWAY_PID" 2>/dev/null | awk -F': ' '{print $2}')"
fi

if [[ -n "$SUBGRAPH_PID" ]]; then
  echo "  Subgraph (PID $SUBGRAPH_PID): $(taskset -cp "$SUBGRAPH_PID" 2>/dev/null | awk -F': ' '{print $2}')"
fi

# Check for stray processes on benchmark cores
echo "  Checking for stray processes on benchmark cores..."
STRAY=$(ps -eo pid,psr,comm --sort=-psr 2>/dev/null | awk '$2 >= 1 && $2 <= 7 {print}' | grep -v -E '^\s*PID|migration|watchdog|ksoftirq|kworker|rcu_' | head -5)
if [[ -n "$STRAY" ]]; then
  echo "  ⚠️  Found processes on benchmark cores:"
  echo "$STRAY" | sed 's/^/    /'
else
  echo "  ✅ No stray userspace processes on benchmark cores"
fi
