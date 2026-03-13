#!/usr/bin/env bash
set -euo pipefail

# Verify CPU affinity of benchmark processes.
# Usage: verify-pinning.sh <gateway-pid> <subgraph-pid>

if ! command -v taskset &>/dev/null; then
  echo "Pinning verification: skipped (no taskset)"
  exit 0
fi

echo "=== CPU Affinity Verification ==="

# Check affinity of a process and its first child (the taskset'd process)
check_affinity() {
  local label="$1"
  local pid="$2"
  # The captured PID is the outer subshell; the actual pinned process is a child
  local child
  child=$(pgrep -P "$pid" 2>/dev/null | head -1)
  local check_pid="${child:-$pid}"
  echo "  ${label} (PID $check_pid): $(taskset -cp "$check_pid" 2>/dev/null | awk -F': ' '{print $2}')"
}

GATEWAY_PID="${1:-}"
SUBGRAPH_PID="${2:-}"

if [[ -n "$GATEWAY_PID" ]]; then
  check_affinity "Gateway" "$GATEWAY_PID"
fi

if [[ -n "$SUBGRAPH_PID" ]]; then
  check_affinity "Subgraph" "$SUBGRAPH_PID"
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
