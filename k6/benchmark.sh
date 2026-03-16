#!/usr/bin/env bash
set -Eeuo pipefail

# =============================================================================
# benchmark.sh — Full benchmark orchestrator
#
# Usage:
#   ./k6/benchmark.sh <gateway-path> [subgraphs-dir] [constant|ramping]
#
# Examples:
#   ./k6/benchmark.sh composite-schema/gateways/hotchocolate
#   ./k6/benchmark.sh composite-schema/gateways/hotchocolate subgraphs-rust
#   ./k6/benchmark.sh composite-schema/gateways/hotchocolate subgraphs-rust ramping
#   ./k6/benchmark.sh apollo-federation/gateways/cosmo ramping
#
# Environment variables:
#   MEASURE_SECONDS  Benchmark measurement duration (default: 120)
#   BENCH_VUS        Virtual users (passed through to k6.js)
#   BENCH_RUNS       Number of measured iterations per benchmark (default: 10, median used)
#
# Methodology:
#   11 runs total: 1 full-duration warmup (discarded) + 10 measured runs.
#   The median of the 10 measured runs is the primary result.
# =============================================================================

# ---- Args -------------------------------------------------------------------

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <gateway-path> [subgraphs-dir] [constant|ramping]"
  echo "  e.g. $0 composite-schema/gateways/hotchocolate"
  echo "  e.g. $0 composite-schema/gateways/hotchocolate subgraphs-rust"
  exit 1
fi

GATEWAY_REL="$1"
SUBGRAPHS_OVERRIDE=""
LOAD_MODE="constant"

# Parse remaining args: auto-detect mode vs subgraphs override
for arg in "${@:2}"; do
  if [[ "$arg" == "constant" || "$arg" == "ramping" ]]; then
    LOAD_MODE="$arg"
  else
    SUBGRAPHS_OVERRIDE="$arg"
  fi
done

MEASURE_SECONDS="${MEASURE_SECONDS:-120}"
BENCH_RUNS="${BENCH_RUNS:-10}"

# ---- Machine info ------------------------------------------------------------

echo ""
echo "=== Machine Info ==="
echo "  Hostname: $(hostname)"
echo "  OS:       $(uname -sr)"
if [[ "$(uname -s)" == "Linux" ]]; then
  echo "  CPU:      $(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs)"
  echo "  Cores:    $(nproc --all) logical ($(grep -c '^processor' /proc/cpuinfo) CPUs)"
  echo "  RAM:      $(awk '/MemTotal/ {printf "%.0f GB", $2/1024/1024}' /proc/meminfo)"
elif [[ "$(uname -s)" == "Darwin" ]]; then
  echo "  CPU:      $(sysctl -n machdep.cpu.brand_string)"
  echo "  Cores:    $(sysctl -n hw.logicalcpu) logical"
  echo "  RAM:      $(( $(sysctl -n hw.memsize) / 1024/1024/1024 )) GB"
fi

# ---- Paths ------------------------------------------------------------------

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GATEWAY_DIR="$REPO_ROOT/$GATEWAY_REL"
# Subgraphs dir: same top-level category, under the default runtime variant
# (or override).
# - apollo-federation defaults to Rust subgraphs in subgraphs-rust
# - composite-schema defaults to .NET subgraphs in subgraphs-net
CATEGORY="$(echo "$GATEWAY_REL" | cut -d/ -f1)"
if [[ -n "$SUBGRAPHS_OVERRIDE" ]]; then
  SUBGRAPHS_DIR="$REPO_ROOT/$CATEGORY/$SUBGRAPHS_OVERRIDE"
elif [[ "$CATEGORY" == "apollo-federation" ]]; then
  SUBGRAPHS_DIR="$REPO_ROOT/$CATEGORY/subgraphs-rust"
elif [[ "$CATEGORY" == "composite-schema" ]]; then
  SUBGRAPHS_DIR="$REPO_ROOT/$CATEGORY/subgraphs-net"
else
  SUBGRAPHS_DIR="$REPO_ROOT/$CATEGORY/subgraphs"
fi

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

# ---- Check required tools ----------------------------------------------------

if ! command -v k6 &>/dev/null; then
  echo "Error: k6 not found. Run setup-perfrunner.sh on this machine first."
  exit 1
fi

# ---- Execution context --------------------------------------------------------

echo ""
echo "=== Execution Context ==="
echo "  Orchestrator user: $(id -un) (uid=$(id -u))"
if id perfrunner &>/dev/null; then
  echo "  Workload user:     perfrunner (via sudo -u perfrunner)"
else
  echo "  Workload user:     current user (perfrunner not found)"
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
SYSTEM_CPUSET=""
K6_CPUSET=""
GATEWAY_CPUSET=""
SUBGRAPH_CPUSET=""

if [[ -f "$PROFILES_FILE" ]]; then
  # Detect core count
  case "$(uname -s)" in
    Darwin) CORES=$(sysctl -n hw.logicalcpu) ;;
    Linux)  CORES=$(nproc --all) ;;
    *)      CORES=0 ;;
  esac

  echo "Detected $CORES logical cores"

  # Find nearest profile key (8 or 16)
  if [[ $CORES -ge 16 ]]; then
    PROFILE_KEY="16"
  else
    PROFILE_KEY="8"
  fi

  # Extract CPU sets
  read -r SYSTEM_CPUSET K6_CPUSET GATEWAY_CPUSET SUBGRAPH_CPUSET < <(
    python3 -c "
import json, sys
d = json.load(sys.stdin)
p = d.get('$PROFILE_KEY', {}).get('$LOAD_MODE', {})
print(p.get('system', ''), p.get('k6', ''), p.get('gateway', ''), p.get('subgraphs', ''))
" < "$PROFILES_FILE"
  )

  # Check if taskset is available (Linux only)
  if command -v taskset &>/dev/null; then
    USE_PINNING=true
    echo "CPU pinning enabled (profile=$PROFILE_KEY, mode=$LOAD_MODE)"
    echo "  system:    cores $SYSTEM_CPUSET"
    echo "  k6:        cores $K6_CPUSET"
    echo "  gateway:   cores $GATEWAY_CPUSET"
    echo "  subgraphs: cores $SUBGRAPH_CPUSET"
  else
    echo "Note: taskset not available — CPU pinning disabled"
  fi
fi

# ---- CPU frequency stabilization ---------------------------------------------
# Disable frequency boost and set governor to "performance" for consistent results.

if [[ "$(uname -s)" == "Linux" ]]; then
  if [[ -f /sys/devices/system/cpu/cpufreq/boost ]]; then
    echo 0 | sudo -n tee /sys/devices/system/cpu/cpufreq/boost > /dev/null 2>&1 \
      && echo "CPU frequency boost: disabled" \
      || echo "CPU frequency boost: could not disable (no sudo)"
  fi
  if ls /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor &>/dev/null; then
    echo performance | sudo -n tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor > /dev/null 2>&1 \
      && echo "CPU governor: set to performance" \
      || echo "CPU governor: could not set (no sudo)"
  fi
fi

# ---- System process isolation ------------------------------------------------

if [[ "$USE_PINNING" == true && -n "$SYSTEM_CPUSET" ]]; then
  bash "$REPO_ROOT/k6/isolate-system-cpus.sh" "$SYSTEM_CPUSET"
  # Move benchmark process back to root cgroup so child processes can use all cores
  if [[ -d /sys/fs/cgroup/system_tasks ]]; then
    echo $$ | sudo tee /sys/fs/cgroup/cgroup.procs > /dev/null 2>&1 || true
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

# ---- Compute FORK for JS gateways -------------------------------------------
# JS gateways (Node.js) are single-threaded by default. Export FORK so they
# spawn the right number of cluster workers to match the assigned gateway cores.

count_cores() {
  python3 -c "
import sys
total = 0
for part in sys.argv[1].split(','):
    if '-' in part:
        lo, hi = part.split('-')
        total += int(hi) - int(lo) + 1
    else:
        total += 1
print(total)
" "$1"
}

if [[ -n "$GATEWAY_CPUSET" ]]; then
  export FORK="$(count_cores "$GATEWAY_CPUSET")"
  echo "FORK=$FORK (JS gateway worker count)"
fi

# ---- Helper: run as perfrunner -----------------------------------------------
# Gateways, subgraphs, and their install scripts run as the unprivileged
# 'perfrunner' user. This ensures third-party gateway binaries cannot access
# root or system resources. Cleanup: 'sudo pkill -u perfrunner'.

PERFRUNNER_PATH=""

refresh_perfrunner_path() {
  local node_dir
  local node_bin=""

  PERFRUNNER_PATH="/home/perfrunner/.cargo/bin:/home/perfrunner/.dotnet:${PATH}"

  # Prefer the newest nvm-managed Node bin if available, but don't fail if nvm
  # is missing or no Node version has been installed for perfrunner yet.
  for node_dir in /home/perfrunner/.nvm/versions/node/*; do
    [[ -d "$node_dir" ]] || continue
    node_bin="$node_dir/bin"
  done

  if [[ -n "$node_bin" ]]; then
    PERFRUNNER_PATH="$node_bin:$PERFRUNNER_PATH"
  fi
}

refresh_perfrunner_path

run_as_perfrunner() {
  if id perfrunner &>/dev/null; then
    refresh_perfrunner_path
    sudo -u perfrunner -- \
      env HOME="/home/perfrunner" \
          PATH="$PERFRUNNER_PATH" \
          FORK="${FORK:-}" \
      "$@"
  else
    "$@"
  fi
}

# Combine taskset + perfrunner: run a command as perfrunner with CPU pinning
run_pinned_as_perfrunner() {
  local cpuset="$1"; shift
  if [[ "$USE_PINNING" == true && -n "$cpuset" ]]; then
    run_as_perfrunner taskset -c "$cpuset" "$@"
  else
    run_as_perfrunner "$@"
  fi
}

list_descendant_pids() {
  local root_pid="$1"
  local queue=("$root_pid")
  local child
  local current

  while [[ ${#queue[@]} -gt 0 ]]; do
    current="${queue[0]}"
    queue=("${queue[@]:1}")
    while IFS= read -r child; do
      [[ -z "$child" ]] && continue
      echo "$child"
      queue+=("$child")
    done < <(pgrep -P "$current" 2>/dev/null || true)
  done
}

verify_launcher_tree_has_user() {
  local launcher_pid="$1"
  local expected_user="$2"
  local label="$3"
  local timeout_seconds="${4:-10}"
  local deadline=$((SECONDS + timeout_seconds))
  local pid
  local actual_user

  while (( SECONDS < deadline )); do
    if ! kill -0 "$launcher_pid" 2>/dev/null; then
      echo "Note: $label launcher exited before isolation could be verified (pid=$launcher_pid)"
      return 2
    fi

    while IFS= read -r pid; do
      [[ -z "$pid" ]] && continue
      actual_user="$(ps -o user= -p "$pid" 2>/dev/null | xargs || true)"
      if [[ "$actual_user" == "$expected_user" ]]; then
        return 0
      fi
    done < <(list_descendant_pids "$launcher_pid")

    sleep 0.2
  done

  echo "Note: could not verify '$expected_user' ownership for $label within ${timeout_seconds}s (launcher pid=$launcher_pid)"
  return 2
}

# Print gateway/subgraph logs when startup fails to make CI failures diagnosable.
print_startup_logs() {
  local gateway_log="$GATEWAY_DIR/gateway_log.txt"
  local log
  local found_subgraph_logs=false

  echo ""
  echo "=== Gateway startup log ==="
  if [[ -f "$gateway_log" ]]; then
    tail -n 200 "$gateway_log" || true
  else
    echo "No gateway log found at: $gateway_log"
  fi

  echo ""
  echo "=== Subgraph startup logs ==="
  shopt -s nullglob
  for log in "$SUBGRAPHS_DIR"/*log.txt; do
    found_subgraph_logs=true
    echo "--- $(basename "$log") ---"
    tail -n 120 "$log" || true
  done
  shopt -u nullglob

  if [[ "$found_subgraph_logs" == false ]]; then
    echo "No subgraph logs found in: $SUBGRAPHS_DIR"
  fi
}

# ---- Install dependencies ---------------------------------------------------

echo ""
echo "=== Installing subgraph dependencies ==="
(cd "$SUBGRAPHS_DIR" && run_as_perfrunner bash install.sh)

echo ""
echo "=== Installing gateway dependencies ==="
(cd "$GATEWAY_DIR" && run_as_perfrunner bash install.sh)

# ---- Start subgraphs --------------------------------------------------------

echo ""
echo "=== Starting subgraphs ==="
(cd "$SUBGRAPHS_DIR" && run_pinned_as_perfrunner "$SUBGRAPH_CPUSET" bash start.sh) &
SUBGRAPH_PID=$!
echo "Subgraphs PID: $SUBGRAPH_PID"

# Brief pause to let subgraphs initialize
sleep 3

# ---- Start gateway -----------------------------------------------------------

echo ""
echo "=== Starting gateway ==="
(cd "$GATEWAY_DIR" && run_pinned_as_perfrunner "$GATEWAY_CPUSET" bash start.sh) &
GATEWAY_PID=$!
echo "Gateway PID: $GATEWAY_PID"

if id perfrunner &>/dev/null; then
  SUBGRAPH_ISO_VERIFIED=false
  GATEWAY_ISO_VERIFIED=false

  verify_launcher_tree_has_user "$SUBGRAPH_PID" "perfrunner" "subgraphs" && SUBGRAPH_ISO_VERIFIED=true || true
  verify_launcher_tree_has_user "$GATEWAY_PID" "perfrunner" "gateway" && GATEWAY_ISO_VERIFIED=true || true

  if [[ "$SUBGRAPH_ISO_VERIFIED" == true && "$GATEWAY_ISO_VERIFIED" == true ]]; then
    echo "Privilege isolation: gateway/subgraphs running as perfrunner"
  else
    echo "Privilege isolation: verification incomplete (continuing with startup checks)"
  fi
fi

# ---- Wait for gateway health -------------------------------------------------

echo "Waiting for gateway to become healthy at $HEALTH_URL ..."
TIMEOUT_SECONDS=60
START_TS="$(date +%s)"
while true; do
  if curl -s -o /dev/null -w '' --max-time 2 "$HEALTH_URL" 2>/dev/null; then
    ELAPSED=$(( $(date +%s) - START_TS ))
    echo "Gateway is healthy! (took ${ELAPSED}s)"
    break
  fi

  if ! kill -0 "$GATEWAY_PID" 2>/dev/null; then
    echo "Error: gateway process exited before becoming healthy"
    print_startup_logs
    exit 1
  fi

  if ! kill -0 "$SUBGRAPH_PID" 2>/dev/null; then
    echo "Error: subgraphs process exited before gateway became healthy"
    print_startup_logs
    exit 1
  fi

  ELAPSED=$(( $(date +%s) - START_TS ))
  if [[ $ELAPSED -ge $TIMEOUT_SECONDS ]]; then
    echo "Error: gateway did not become healthy within ${TIMEOUT_SECONDS}s"
    print_startup_logs
    exit 1
  fi

  sleep 0.5
done

# ---- Verify CPU pinning ------------------------------------------------------

if [[ "$USE_PINNING" == true ]]; then
  bash "$REPO_ROOT/k6/verify-pinning.sh" "$GATEWAY_PID" "$SUBGRAPH_PID"
fi

# ---- Helper: gateway RSS (KB) ------------------------------------------------

gateway_rss_kb() {
  local pids=()
  local live_pids=()
  local pid
  pids+=("$GATEWAY_PID")
  while IFS= read -r pid; do
    [[ -n "$pid" ]] && pids+=("$pid")
  done < <(pgrep -P "$GATEWAY_PID" 2>/dev/null || true)

  for pid in "${pids[@]}"; do
    if [[ -n "$pid" ]] && kill -0 "$pid" 2>/dev/null; then
      live_pids+=("$pid")
    fi
  done

  if [[ ${#live_pids[@]} -eq 0 ]]; then
    echo 0
    return 0
  fi

  local ps_args=()
  for pid in "${live_pids[@]}"; do
    ps_args+=(-p "$pid")
  done

  local rss
  rss=$(ps "${ps_args[@]}" -o rss= 2>/dev/null | awk '{sum+=$1} END {print sum+0}' || true)
  echo "${rss:-0}"
}

# ---- Run iterations ----------------------------------------------------------

GATEWAY_NAME="$(basename "$GATEWAY_REL")"
if [[ -n "${BENCH_DISPLAY_NAME:-}" ]]; then
  DISPLAY_NAME="$BENCH_DISPLAY_NAME"
elif [[ -n "$SUBGRAPHS_OVERRIDE" ]]; then
  SUBGRAPH_LABEL="${SUBGRAPHS_OVERRIDE#subgraphs-}"
  DISPLAY_NAME="$GATEWAY_NAME ($SUBGRAPH_LABEL subgraphs)"
else
  DISPLAY_NAME="$GATEWAY_NAME"
fi
K6_API_ADDR="127.0.0.1:6565"
RESULTS_BASE="$GATEWAY_DIR/results"

# Read gateway version if available
GATEWAY_VERSION=""
if [[ -f "$GATEWAY_DIR/version.txt" ]]; then
  GATEWAY_VERSION="$(cat "$GATEWAY_DIR/version.txt" | tr -d '[:space:]')"
  echo "Gateway version: $GATEWAY_VERSION"
fi

# ---- Capture idle memory -----------------------------------------------------

IDLE_RSS_KB=$(gateway_rss_kb)
echo "Gateway idle RSS: $((IDLE_RSS_KB / 1024)) MB"

# ---- Warmup run (full duration, discarded) ---------------------------------

echo ""
echo "######################################################################"
echo "# Started  ${MEASURE_SECONDS}s warmup                                               #"

K6_WARMUP_ARGS=(
  -e "MODE=$LOAD_MODE"
  -e "BENCH_OVER_TIME=${MEASURE_SECONDS}s"
  -e "GATEWAY_ENDPOINT=$GRAPHQL_URL"
)
if [[ -n "${BENCH_VUS:-}" ]]; then
  K6_WARMUP_ARGS+=(-e "BENCH_VUS=$BENCH_VUS")
fi

maybe_taskset "$K6_CPUSET" k6 run \
  "${K6_WARMUP_ARGS[@]}" \
  "$REPO_ROOT/k6/k6.js" >/dev/null 2>&1 || true

echo "# Complete ${MEASURE_SECONDS}s warmup                                               #"
echo "######################################################################"

# ---- Measured runs -----------------------------------------------------------

for RUN in $(seq 1 "$BENCH_RUNS"); do
  echo ""
  echo "######################################################################"
  echo "# Started run $RUN of $BENCH_RUNS                                                #"
  echo "######################################################################"

  # ---- Create output directory -----------------------------------------------

  TIMESTAMP="$(date +%Y%m%d_%H%M%S)"
  RESULT_DIR="$RESULTS_BASE/${TIMESTAMP}"
  mkdir -p "$RESULT_DIR"

  # Write metadata for report generation
  python3 -c "
import json, sys
json.dump({
    'gateway': sys.argv[1],
    'gateway_path': sys.argv[2],
    'category': sys.argv[3],
    'mode': sys.argv[4],
    'timestamp': sys.argv[5],
    'run': int(sys.argv[6]),
    'total_runs': int(sys.argv[7]),
    'display_name': sys.argv[9],
    'version': sys.argv[10]
}, open(sys.argv[8], 'w'), indent=2)
" "$GATEWAY_NAME" "$GATEWAY_REL" "$CATEGORY" "$LOAD_MODE" "$TIMESTAMP" "$RUN" "$BENCH_RUNS" "$RESULT_DIR/metadata.json" "$DISPLAY_NAME" "$GATEWAY_VERSION"

  echo "Results for run $RUN: $RESULT_DIR"

  # ---- Start monitor ---------------------------------------------------------

  echo ""
  echo "=== Starting monitor ==="
  bash "$REPO_ROOT/k6/monitor.sh" \
    -p "$GATEWAY_PID" \
    -k "$K6_API_ADDR" \
    -o "$RESULT_DIR/data.csv" \
    -i 0.2 &
  MONITOR_PID=$!

  # ---- Run benchmark ---------------------------------------------------------

  echo ""
  echo "=== Benchmark run $RUN (mode=$LOAD_MODE, duration=${MEASURE_SECONDS}s) ==="
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

  # ---- Stop monitor for this run ---------------------------------------------

  kill "$MONITOR_PID" 2>/dev/null || true
  MONITOR_PID=""

  # ---- Memory stats for this run ----------------------------------------------

  END_RSS_KB=$(gateway_rss_kb)
  PEAK_RSS_KB=$(awk -F, 'NR>1 && $7+0 > max {max=$7+0} END {print max+0}' "$RESULT_DIR/data.csv")

  # Persist memory stats for report generation
  python3 -c "
import json, sys
json.dump({
    'idle_rss_kb': int(sys.argv[1]),
    'peak_rss_kb': int(sys.argv[2]),
    'end_rss_kb': int(sys.argv[3])
}, open(sys.argv[4], 'w'), indent=2)
" "$IDLE_RSS_KB" "$PEAK_RSS_KB" "$END_RSS_KB" "$RESULT_DIR/memory.json"

  echo ""
  echo "=== Run $RUN complete ==="
  echo "  Monitor CSV:  $RESULT_DIR/data.csv"
  echo "  k6 summary:   $RESULT_DIR/k6_summary.json"
  echo "  k6 text:      $RESULT_DIR/k6_summary.txt"
  echo "  Memory:       idle=$((IDLE_RSS_KB / 1024))MB  peak=$((PEAK_RSS_KB / 1024))MB  end=$((END_RSS_KB / 1024))MB"

done

# ---- Summary -----------------------------------------------------------------

echo ""
echo "======================================================================="
echo "All $BENCH_RUNS measured runs complete (plus 1 warmup, discarded)."
echo "Gateway: $GATEWAY_NAME | Mode: $LOAD_MODE | Duration: ${MEASURE_SECONDS}s"
echo "Results: $RESULTS_BASE/"
echo "======================================================================="

# ---- Run statistics ----------------------------------------------------------

if [[ "$BENCH_RUNS" -gt 1 ]]; then
  echo ""
  echo "=== Run Statistics ==="

  # Collect RPS from all k6_summary.json files
  RPS_VALUES=()
  for result_dir in "$RESULTS_BASE"/*/; do
    if [[ -f "$result_dir/k6_summary.json" ]]; then
      RPS=$(python3 -c "
import json, sys
d = json.load(open(sys.argv[1]))
print(d.get('metrics',{}).get('http_reqs',{}).get('values',{}).get('rate',0))
" "$result_dir/k6_summary.json")
      RPS_VALUES+=("$RPS")
    fi
  done

  if [[ ${#RPS_VALUES[@]} -gt 0 ]]; then
    python3 -c "
import sys, statistics
vals = [float(x) for x in sys.argv[1:]]
vals.sort()
n = len(vals)
median = vals[n//2] if n % 2 == 1 else (vals[n//2-1] + vals[n//2]) / 2
mean = statistics.mean(vals)
stdev = statistics.stdev(vals) if n > 1 else 0
cv = (stdev / mean * 100) if mean > 0 else 0
print(f'  Runs:   {n}')
print(f'  RPS:    {\" → \".join(f\"{v:.0f}\" for v in vals)}')
print(f'  Median: {median:.0f} req/s')
print(f'  Mean:   {mean:.0f} req/s')
print(f'  Stddev: {stdev:.1f}')
print(f'  CV:     {cv:.2f}%')
if cv > 3:
    print(f'  ⚠️  CV > 3% — results may be unreliable')
" "${RPS_VALUES[@]}"
  fi
fi
