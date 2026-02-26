#!/usr/bin/env bash
set -Eeuo pipefail

# =============================================================================
# benchmark.sh — Full benchmark orchestrator
#
# Usage:
#   ./k6/benchmark.sh <gateway-path> [constant|ramping]
#
# Examples:
#   ./k6/benchmark.sh composite-schema/gateways/hotchocolate
#   ./k6/benchmark.sh apollo-federation/gateways/cosmo ramping
#
# Environment variables:
#   WARMUP_SECONDS   Warmup duration before measurement (default: 15)
#   MEASURE_SECONDS  Benchmark measurement duration (default: 60)
#   BENCH_VUS        Virtual users (passed through to k6.js)
# =============================================================================

# ---- Args -------------------------------------------------------------------

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <gateway-path> [constant|ramping]"
  echo "  e.g. $0 composite-schema/gateways/hotchocolate"
  exit 1
fi

GATEWAY_REL="$1"
LOAD_MODE="${2:-constant}"

if [[ "$LOAD_MODE" != "constant" && "$LOAD_MODE" != "ramping" ]]; then
  echo "Error: mode must be 'constant' or 'ramping', got '$LOAD_MODE'"
  exit 1
fi

WARMUP_SECONDS="${WARMUP_SECONDS:-15}"
MEASURE_SECONDS="${MEASURE_SECONDS:-60}"

# ---- Paths ------------------------------------------------------------------

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GATEWAY_DIR="$REPO_ROOT/$GATEWAY_REL"
# Subgraphs dir: same top-level category, under "subgraphs"
CATEGORY="$(echo "$GATEWAY_REL" | cut -d/ -f1)"
SUBGRAPHS_DIR="$REPO_ROOT/$CATEGORY/subgraphs"

for dir in "$GATEWAY_DIR" "$SUBGRAPHS_DIR"; do
  if [[ ! -d "$dir" ]]; then
    echo "Error: directory not found: $dir"
    exit 1
  fi
done

for script in "$GATEWAY_DIR/start.sh" "$GATEWAY_DIR/install.sh" \
              "$SUBGRAPHS_DIR/start.sh" "$SUBGRAPHS_DIR/install.sh"; do
  if [[ ! -f "$script" ]]; then
    echo "Error: required script not found: $script"
    exit 1
  fi
done

# ---- Defensive k6 install ---------------------------------------------------

if ! command -v k6 &>/dev/null; then
  echo "k6 not found. Installing..."
  case "$(uname -s)" in
    Darwin)
      brew install k6
      ;;
    Linux)
      sudo gpg -k
      sudo gpg --no-default-keyring --keyring /usr/share/keyrings/k6-archive-keyring.gpg \
        --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C5AD17C747E3415A3642D57D77C6C491D6AC1D69
      echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" \
        | sudo tee /etc/apt/sources.list.d/k6.list
      sudo apt-get update
      sudo apt-get install -y k6
      ;;
    *)
      echo "Error: unsupported OS for automatic k6 install. Install k6 manually."
      exit 1
      ;;
  esac
fi

# ---- Cleanup trap ------------------------------------------------------------

SUBGRAPH_PID=""
GATEWAY_PID=""
MONITOR_PID=""

cleanup() {
  echo ""
  echo "Cleaning up..."
  for pid in "$MONITOR_PID" "$GATEWAY_PID" "$SUBGRAPH_PID"; do
    [[ -n "$pid" ]] && kill "$pid" 2>/dev/null || true
  done
  sleep 1
  for pid in "$GATEWAY_PID" "$SUBGRAPH_PID"; do
    [[ -n "$pid" ]] && kill -9 "$pid" 2>/dev/null || true
  done
  echo "Done."
}
trap cleanup EXIT INT TERM

# ---- Read settings.json -----------------------------------------------------

SETTINGS_FILE="$GATEWAY_DIR/settings.json"
if [[ ! -f "$SETTINGS_FILE" ]]; then
  echo "Error: $SETTINGS_FILE not found"
  exit 1
fi

read -r GRAPHQL_URL HEALTH_URL < <(
  python3 -c "
import json, sys
d = json.load(sys.stdin)
print(d.get('graphql', ''), d.get('health', ''))
" < "$SETTINGS_FILE"
)

if [[ -z "$GRAPHQL_URL" ]]; then
  echo "Error: 'graphql' URL not found in $SETTINGS_FILE"
  exit 1
fi

# If no explicit health URL, fall back to polling the graphql endpoint itself
if [[ -z "$HEALTH_URL" ]]; then
  HEALTH_URL="$GRAPHQL_URL"
  echo "No 'health' URL in settings.json, will poll: $HEALTH_URL"
fi

# ---- Profiles & CPU pinning -------------------------------------------------

PROFILES_FILE="$REPO_ROOT/profiles.json"
USE_PINNING=false
K6_CPUSET=""
GATEWAY_CPUSET=""
SUBGRAPH_CPUSET=""

if [[ -f "$PROFILES_FILE" ]]; then
  # Detect core count
  case "$(uname -s)" in
    Darwin) CORES=$(sysctl -n hw.logicalcpu) ;;
    Linux)  CORES=$(nproc) ;;
    *)      CORES=0 ;;
  esac

  # Find nearest profile key (8 or 16)
  if [[ $CORES -ge 16 ]]; then
    PROFILE_KEY="16"
  else
    PROFILE_KEY="8"
  fi

  # Extract CPU sets
  read -r K6_CPUSET GATEWAY_CPUSET SUBGRAPH_CPUSET < <(
    python3 -c "
import json, sys
d = json.load(sys.stdin)
p = d.get('$PROFILE_KEY', {}).get('$LOAD_MODE', {})
print(p.get('k6', ''), p.get('gateway', ''), p.get('subgraphs', ''))
" < "$PROFILES_FILE"
  )

  # Check if taskset is available (Linux only)
  if command -v taskset &>/dev/null; then
    USE_PINNING=true
    echo "CPU pinning enabled (profile=$PROFILE_KEY, mode=$LOAD_MODE)"
    echo "  k6:        cores $K6_CPUSET"
    echo "  gateway:   cores $GATEWAY_CPUSET"
    echo "  subgraphs: cores $SUBGRAPH_CPUSET"
  else
    echo "Note: taskset not available — CPU pinning disabled"
  fi
fi

maybe_taskset() {
  local cpuset="$1"; shift
  if [[ "$USE_PINNING" == true && -n "$cpuset" ]]; then
    taskset -c "$cpuset" "$@"
  else
    "$@"
  fi
}

# ---- Install dependencies ---------------------------------------------------

echo ""
echo "=== Installing subgraph dependencies ==="
bash "$SUBGRAPHS_DIR/install.sh"

echo ""
echo "=== Installing gateway dependencies ==="
bash "$GATEWAY_DIR/install.sh"

# ---- Start subgraphs --------------------------------------------------------

echo ""
echo "=== Starting subgraphs ==="
maybe_taskset "$SUBGRAPH_CPUSET" bash "$SUBGRAPHS_DIR/start.sh" &
SUBGRAPH_PID=$!
echo "Subgraphs PID: $SUBGRAPH_PID"

# Brief pause to let subgraphs initialize
sleep 3

# ---- Start gateway -----------------------------------------------------------

echo ""
echo "=== Starting gateway ==="
maybe_taskset "$GATEWAY_CPUSET" bash "$GATEWAY_DIR/start.sh" &
GATEWAY_PID=$!
echo "Gateway PID: $GATEWAY_PID"

# ---- Wait for gateway health -------------------------------------------------

echo "Waiting for gateway to become healthy at $HEALTH_URL ..."
TIMEOUT=60
ELAPSED=0
while [[ $ELAPSED -lt $TIMEOUT ]]; do
  if curl -s -o /dev/null -w '' --max-time 2 "$HEALTH_URL" 2>/dev/null; then
    echo "Gateway is healthy! (took ${ELAPSED}s)"
    break
  fi
  sleep 0.5
  ELAPSED=$((ELAPSED + 1))
done

if [[ $ELAPSED -ge $TIMEOUT ]]; then
  echo "Error: gateway did not become healthy within ${TIMEOUT}s"
  exit 1
fi

# ---- Create output directory -------------------------------------------------

OUTPUT_DIR="$GATEWAY_DIR"
GATEWAY_NAME="$(basename "$GATEWAY_REL")"
TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
RESULT_DIR="$OUTPUT_DIR/results/${TIMESTAMP}"
mkdir -p "$RESULT_DIR"

# Write metadata for report generation
python3 -c "
import json, sys
json.dump({
    'gateway': sys.argv[1],
    'gateway_path': sys.argv[2],
    'category': sys.argv[3],
    'mode': sys.argv[4],
    'timestamp': sys.argv[5]
}, open(sys.argv[6], 'w'), indent=2)
" "$GATEWAY_NAME" "$GATEWAY_REL" "$CATEGORY" "$LOAD_MODE" "$TIMESTAMP" "$RESULT_DIR/metadata.json"

echo ""
echo "Results will be saved to: $RESULT_DIR"

# ---- Warmup ------------------------------------------------------------------

echo ""
echo "=== Warmup (${WARMUP_SECONDS}s) ==="
maybe_taskset "$K6_CPUSET" k6 run \
  -e MODE=constant \
  -e "BENCH_OVER_TIME=${WARMUP_SECONDS}s" \
  -e "GATEWAY_ENDPOINT=$GRAPHQL_URL" \
  "$REPO_ROOT/k6/k6.js" >/dev/null 2>&1 || true

# ---- Start monitor -----------------------------------------------------------

K6_API_ADDR="127.0.0.1:6565"

echo ""
echo "=== Starting monitor ==="
bash "$REPO_ROOT/k6/monitor.sh" \
  -p "$GATEWAY_PID" \
  -k "$K6_API_ADDR" \
  -o "$RESULT_DIR/data.csv" \
  -i 0.2 &
MONITOR_PID=$!

# ---- Run benchmark -----------------------------------------------------------

echo ""
echo "=== Benchmark (mode=$LOAD_MODE, duration=${MEASURE_SECONDS}s) ==="
echo ""

K6_ENV_ARGS=(
  -e "MODE=$LOAD_MODE"
  -e "BENCH_OVER_TIME=${MEASURE_SECONDS}s"
  -e "GATEWAY_ENDPOINT=$GRAPHQL_URL"
  -e "SUMMARY_PATH=$RESULT_DIR"
)

if [[ -n "${BENCH_VUS:-}" ]]; then
  K6_ENV_ARGS+=(-e "BENCH_VUS=$BENCH_VUS")
fi

maybe_taskset "$K6_CPUSET" k6 run \
  --address "$K6_API_ADDR" \
  "${K6_ENV_ARGS[@]}" \
  "$REPO_ROOT/k6/k6.js"

# ---- Summary -----------------------------------------------------------------

echo ""
echo "=== Benchmark complete ==="
echo ""
echo "Artifacts:"
echo "  Monitor CSV:  $RESULT_DIR/data.csv"
echo "  k6 summary:   $RESULT_DIR/k6_summary.json"
echo "  k6 text:      $RESULT_DIR/k6_summary.txt"
echo ""
echo "Gateway: $GATEWAY_NAME | Mode: $LOAD_MODE | Duration: ${MEASURE_SECONDS}s"
