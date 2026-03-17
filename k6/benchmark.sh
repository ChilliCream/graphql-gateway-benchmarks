#!/usr/bin/env bash
set -Eeuo pipefail

# =============================================================================
# benchmark.sh — Full benchmark orchestrator
#
# Usage:
#   ./k6/benchmark.sh <gateway-path> [subgraphs-dir] [constant|burst|ramping]
#
# Examples:
#   ./k6/benchmark.sh composite-schema/gateways/hotchocolate
#   ./k6/benchmark.sh composite-schema/gateways/hotchocolate subgraphs-rust
#   ./k6/benchmark.sh composite-schema/gateways/hotchocolate subgraphs-rust burst
#   ./k6/benchmark.sh apollo-federation/gateways/cosmo burst
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
  echo "Usage: $0 <gateway-path> [subgraphs-dir] [constant|burst|ramping]"
  echo "  e.g. $0 composite-schema/gateways/hotchocolate"
  echo "  e.g. $0 composite-schema/gateways/hotchocolate subgraphs-rust"
  exit 1
fi

GATEWAY_REL="$1"
SUBGRAPHS_OVERRIDE=""
LOAD_MODE="constant"
LOAD_MODE_LABEL="constant"

# Parse remaining args: auto-detect mode vs subgraphs override
for arg in "${@:2}"; do
  case "$arg" in
    constant)
      LOAD_MODE="constant"
      LOAD_MODE_LABEL="constant"
      ;;
    burst|ramping)
      # Keep "ramping" internal for existing profiles.json + k6 mode compatibility.
      LOAD_MODE="ramping"
      LOAD_MODE_LABEL="burst"
      ;;
    *)
      SUBGRAPHS_OVERRIDE="$arg"
      ;;
  esac
done

MEASURE_SECONDS="${MEASURE_SECONDS:-120}"
BENCH_RUNS="${BENCH_RUNS:-10}"

# ---- Machine info ------------------------------------------------------------

UNAME_S="$(uname -s)"
MACHINE_HOSTNAME="$(hostname)"
MACHINE_OS="$(uname -sr)"
MACHINE_CPU="unknown"
MACHINE_CORES="unknown"
MACHINE_RAM="unknown"

if [[ "$UNAME_S" == "Linux" ]]; then
  MACHINE_CPU="$(grep -m1 'model name' /proc/cpuinfo | cut -d: -f2 | xargs)"
  MACHINE_CORES="$(nproc --all) logical ($(grep -c '^processor' /proc/cpuinfo) CPUs)"
  MACHINE_RAM="$(awk '/MemTotal/ {printf "%.0f GB", $2/1024/1024}' /proc/meminfo)"
elif [[ "$UNAME_S" == "Darwin" ]]; then
  MACHINE_CPU="$(sysctl -n machdep.cpu.brand_string)"
  MACHINE_CORES="$(sysctl -n hw.logicalcpu) logical"
  MACHINE_RAM="$(( $(sysctl -n hw.memsize) / 1024/1024/1024 )) GB"
fi

echo ""
echo "=== Machine Info ==="
echo "  Hostname: $MACHINE_HOSTNAME"
echo "  OS:       $MACHINE_OS"
echo "  CPU:      $MACHINE_CPU"
echo "  Cores:    $MACHINE_CORES"
echo "  RAM:      $MACHINE_RAM"

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
              "$SUBGRAPHS_DIR/start.sh" "$SUBGRAPHS_DIR/build.sh"; do
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

CAN_SUDO=false
if command -v sudo &>/dev/null && sudo -n true &>/dev/null; then
  CAN_SUDO=true
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
GATEWAY_METRIC_PID=""
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
    echo "CPU pinning enabled (profile=$PROFILE_KEY, mode=$LOAD_MODE_LABEL)"
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

  # Resolve Node bin as perfrunner to avoid permission/path drift between
  # github-runner and perfrunner homes.
  if id perfrunner &>/dev/null; then
    node_bin="$(sudo -n -u perfrunner -- bash -lc '
      latest=""
      for d in "$HOME"/.nvm/versions/node/*/bin; do
        [[ -x "$d/node" ]] || continue
        latest="$d"
      done
      printf "%s" "$latest"
    ' 2>/dev/null || true)"
  fi

  # Fallback for local/non-sudo environments.
  if [[ -z "$node_bin" ]]; then
    for node_dir in /home/perfrunner/.nvm/versions/node/*; do
      [[ -d "$node_dir" ]] || continue
      node_bin="$node_dir/bin"
    done
  fi

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
          BENCH_SUBGRAPH_TECH="${BENCH_SUBGRAPH_TECH:-}" \
          BENCH_SUBGRAPH_VARIANT="${BENCH_SUBGRAPH_VARIANT:-}" \
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

extract_port_from_url() {
  python3 -c "
import sys
from urllib.parse import urlparse
u = urlparse(sys.argv[1])
print(u.port or '')
" "$1" 2>/dev/null || true
}

resolve_listener_pid_by_port() {
  local port="$1"
  local pid=""
  local candidate=""
  local owner=""

  [[ -z "$port" ]] && return 1

  run_lookup_cmd() {
    if [[ "$CAN_SUDO" == true ]]; then
      sudo -n "$@" 2>/dev/null || "$@" 2>/dev/null || true
    else
      "$@" 2>/dev/null || true
    fi
  }

  # Prefer lsof when available because it directly reports LISTEN sockets.
  if command -v lsof &>/dev/null; then
    while IFS= read -r candidate; do
      [[ -z "$candidate" ]] && continue
      owner="$(ps -o user= -p "$candidate" 2>/dev/null | xargs || true)"
      if [[ -z "$pid" ]]; then
        pid="$candidate"
      fi
      if [[ "$owner" == "perfrunner" ]]; then
        pid="$candidate"
        break
      fi
    done < <(run_lookup_cmd lsof -nP -iTCP:"$port" -sTCP:LISTEN -t | sort -u)
  fi

  # Fallback: parse PID from ss output.
  if [[ -z "$pid" ]] && command -v ss &>/dev/null; then
    pid="$(run_lookup_cmd ss -ltnp "sport = :$port" | sed -n 's/.*pid=\([0-9]\+\).*/\1/p' | head -n1)"
  fi

  # Last resort.
  if [[ -z "$pid" ]] && command -v fuser &>/dev/null; then
    pid="$(run_lookup_cmd fuser -n tcp "$port" | awk '{print $1}')"
  fi

  [[ -n "$pid" ]] || return 1
  echo "$pid"
}

# ---- Install dependencies ---------------------------------------------------

echo ""
echo "=== Preparing subgraphs ==="
if [[ "${USE_PREBUILT_SUBGRAPHS:-0}" == "1" ]]; then
  if [[ "$SUBGRAPHS_DIR" == *"subgraphs-rust"* ]] && [[ ! -x "$SUBGRAPHS_DIR/target/release/subgraphs" ]]; then
    echo "Error: expected prebuilt Rust subgraph binary at $SUBGRAPHS_DIR/target/release/subgraphs"
    exit 1
  fi

  if [[ "$SUBGRAPHS_DIR" == *"subgraphs-net"* ]] && ! run_as_perfrunner bash -lc 'command -v dotnet >/dev/null'; then
    echo "Error: expected dotnet runtime in prebuilt mode, but it is not available to perfrunner"
    exit 1
  fi

  echo "Using prebuilt subgraphs artifact, skipping subgraph build.sh"
else
  (cd "$SUBGRAPHS_DIR" && run_as_perfrunner bash build.sh)
fi

echo ""
echo "=== Preparing gateway dependencies ==="
if [[ "${USE_PREBUILT_GATEWAY:-0}" == "1" ]]; then
  if [[ ! -f "$GATEWAY_DIR/.prebuilt-gateway-ready" ]]; then
    echo "Error: expected prebuilt gateway marker at $GATEWAY_DIR/.prebuilt-gateway-ready"
    exit 1
  fi

  if [[ -f "$GATEWAY_DIR/package.json" ]] && ! run_as_perfrunner bash -lc 'command -v node >/dev/null && command -v npm >/dev/null && command -v npx >/dev/null'; then
    echo "Error: expected node/npm/npx runtime in prebuilt gateway mode, but it is not available to perfrunner"
    exit 1
  fi

  if [[ "$GATEWAY_DIR" == *"/composite-schema/gateways/hotchocolate" ]] && ! run_as_perfrunner bash -lc 'command -v dotnet >/dev/null'; then
    echo "Error: expected dotnet runtime in prebuilt gateway mode, but it is not available to perfrunner"
    exit 1
  fi

  echo "Using prebuilt gateway artifact, skipping gateway install.sh"
else
  (cd "$GATEWAY_DIR" && run_as_perfrunner bash install.sh)
fi

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

# Determine the real gateway process for memory/cpu accounting.
GRAPHQL_PORT="$(extract_port_from_url "$GRAPHQL_URL")"
RESOLVED_GATEWAY_PID="$(resolve_listener_pid_by_port "$GRAPHQL_PORT" || true)"
if [[ -n "$RESOLVED_GATEWAY_PID" ]]; then
  GATEWAY_METRIC_PID="$RESOLVED_GATEWAY_PID"
  echo "Gateway metric root PID: $GATEWAY_METRIC_PID (listener on port ${GRAPHQL_PORT:-unknown})"
else
  GATEWAY_METRIC_PID="$GATEWAY_PID"
  echo "Note: could not resolve gateway listener PID; using launcher PID for metrics: $GATEWAY_METRIC_PID"
fi

# ---- Verify CPU pinning ------------------------------------------------------

if [[ "$USE_PINNING" == true ]]; then
  bash "$REPO_ROOT/k6/verify-pinning.sh" "$GATEWAY_METRIC_PID" "$SUBGRAPH_PID"
fi

# ---- Helper: gateway RSS (KB) ------------------------------------------------

gateway_rss_kb() {
  local root_pid="${GATEWAY_METRIC_PID:-$GATEWAY_PID}"
  local pids=()
  local live_pids=()
  local pid

  pid_exists() {
    local candidate_pid="$1"
    ps -o pid= -p "$candidate_pid" 2>/dev/null | grep -q '[0-9]'
  }

  pids+=("$root_pid")
  while IFS= read -r pid; do
    [[ -n "$pid" ]] && pids+=("$pid")
  done < <(list_descendant_pids "$root_pid")

  for pid in "${pids[@]}"; do
    if [[ -n "$pid" ]] && pid_exists "$pid"; then
      live_pids+=("$pid")
    fi
  done

  # If the root PID rotated (for example launcher/parent exited), refresh from
  # listener port and retry once so idle/end snapshots stay meaningful.
  if [[ ${#live_pids[@]} -eq 0 && -n "${GRAPHQL_PORT:-}" ]]; then
    local refreshed_root
    refreshed_root="$(resolve_listener_pid_by_port "$GRAPHQL_PORT" || true)"
    if [[ -n "$refreshed_root" ]]; then
      GATEWAY_METRIC_PID="$refreshed_root"
      root_pid="$refreshed_root"
      pids=("$root_pid")
      live_pids=()

      while IFS= read -r pid; do
        [[ -n "$pid" ]] && pids+=("$pid")
      done < <(list_descendant_pids "$root_pid")

      for pid in "${pids[@]}"; do
        if [[ -n "$pid" ]] && pid_exists "$pid"; then
          live_pids+=("$pid")
        fi
      done
    fi
  fi

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
SUBGRAPH_VARIANT="$(basename "$SUBGRAPHS_DIR")"
if [[ -n "${BENCH_SUBGRAPH_TECH:-}" ]]; then
  SUBGRAPH_TECH="$BENCH_SUBGRAPH_TECH"
elif [[ "$SUBGRAPH_VARIANT" == "subgraphs-rust" ]]; then
  SUBGRAPH_TECH="rust"
elif [[ "$SUBGRAPH_VARIANT" == "subgraphs-net" ]]; then
  SUBGRAPH_TECH=".net"
else
  SUBGRAPH_TECH="$SUBGRAPH_VARIANT"
fi
export BENCH_SUBGRAPH_TECH="$SUBGRAPH_TECH"
export BENCH_SUBGRAPH_VARIANT="$SUBGRAPH_VARIANT"
if [[ -n "${BENCH_DISPLAY_NAME:-}" ]]; then
  DISPLAY_NAME="$BENCH_DISPLAY_NAME"
else
  DISPLAY_NAME="$GATEWAY_NAME ($SUBGRAPH_TECH subgraphs)"
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
    'version': sys.argv[10],
    'subgraphs': sys.argv[11],
    'subgraph_tech': sys.argv[12],
    'machine_hostname': sys.argv[13],
    'machine_os': sys.argv[14],
    'machine_cpu': sys.argv[15],
    'machine_cores': sys.argv[16],
    'machine_ram': sys.argv[17]
}, open(sys.argv[8], 'w'), indent=2)
" "$GATEWAY_NAME" "$GATEWAY_REL" "$CATEGORY" "$LOAD_MODE" "$TIMESTAMP" "$RUN" "$BENCH_RUNS" "$RESULT_DIR/metadata.json" "$DISPLAY_NAME" "$GATEWAY_VERSION" "$SUBGRAPH_VARIANT" "$SUBGRAPH_TECH" "$MACHINE_HOSTNAME" "$MACHINE_OS" "$MACHINE_CPU" "$MACHINE_CORES" "$MACHINE_RAM"

  echo "Results for run $RUN: $RESULT_DIR"

  # ---- Start monitor ---------------------------------------------------------

  echo ""
  echo "=== Starting monitor ==="
  maybe_taskset "$SYSTEM_CPUSET" bash "$REPO_ROOT/k6/monitor.sh" \
    -p "$GATEWAY_METRIC_PID" \
    -k "$K6_API_ADDR" \
    -K "$K6_CPUSET" \
    -S "$SUBGRAPH_CPUSET" \
    -o "$RESULT_DIR/data.csv" \
    -i 0.2 &
  MONITOR_PID=$!

  # ---- Run benchmark ---------------------------------------------------------

  echo ""
  echo "=== Benchmark run $RUN (mode=$LOAD_MODE_LABEL, duration=${MEASURE_SECONDS}s) ==="
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
  PEAK_RSS_KB=$(awk -F, 'NR>1 && $NF+0 > max {max=$NF+0} END {print max+0}' "$RESULT_DIR/data.csv")
  AVG_K6_CORE_CPU=$(awk -F, 'NR>1{sum+=$7;n++} END{if(n) printf "%.2f", sum/n; else print "0.00"}' "$RESULT_DIR/data.csv")
  AVG_SUBGRAPH_CORE_CPU=$(awk -F, 'NR>1{sum+=$8;n++} END{if(n) printf "%.2f", sum/n; else print "0.00"}' "$RESULT_DIR/data.csv")

  # Persist memory stats for report generation
  python3 -c "
import json, sys
json.dump({
    'idle_rss_kb': int(sys.argv[1]),
    'peak_rss_kb': int(sys.argv[2]),
    'end_rss_kb': int(sys.argv[3]),
    'avg_k6_core_cpu_pct': float(sys.argv[4]),
    'avg_subgraph_core_cpu_pct': float(sys.argv[5])
}, open(sys.argv[6], 'w'), indent=2)
" "$IDLE_RSS_KB" "$PEAK_RSS_KB" "$END_RSS_KB" "$AVG_K6_CORE_CPU" "$AVG_SUBGRAPH_CORE_CPU" "$RESULT_DIR/memory.json"

  echo ""
  echo "=== Run $RUN complete ==="
  echo "  Monitor CSV:  $RESULT_DIR/data.csv"
  echo "  k6 summary:   $RESULT_DIR/k6_summary.json"
  echo "  k6 text:      $RESULT_DIR/k6_summary.txt"
  echo "  Memory:       idle=$((IDLE_RSS_KB / 1024))MB  peak=$((PEAK_RSS_KB / 1024))MB  end=$((END_RSS_KB / 1024))MB"
  echo "  k6 core usage: ${AVG_K6_CORE_CPU}%"
  echo "  subgraph core usage: ${AVG_SUBGRAPH_CORE_CPU}%"

done

# ---- Summary -----------------------------------------------------------------

echo ""
echo "======================================================================="
echo "All $BENCH_RUNS measured runs complete (plus 1 warmup, discarded)."
echo "Gateway: $GATEWAY_NAME | Mode: $LOAD_MODE_LABEL | Duration: ${MEASURE_SECONDS}s"
echo "Results: $RESULTS_BASE/"
echo "======================================================================="

# ---- Run statistics ----------------------------------------------------------

if [[ "$BENCH_RUNS" -gt 1 ]]; then
  echo ""
  echo "=== Run Statistics ==="

  # Collect RPS from all k6_summary.json files
  RPS_VALUES=()
  K6_CORE_VALUES=()
  SUBGRAPH_CORE_VALUES=()
  for result_dir in "$RESULTS_BASE"/*/; do
    if [[ -f "$result_dir/k6_summary.json" ]]; then
      RPS=$(python3 -c "
import json, sys
d = json.load(open(sys.argv[1]))
print(d.get('metrics',{}).get('http_reqs',{}).get('values',{}).get('rate',0))
" "$result_dir/k6_summary.json")
      RPS_VALUES+=("$RPS")
    fi
    if [[ -f "$result_dir/memory.json" ]]; then
      read -r K6_CORE SUBGRAPH_CORE < <(python3 -c "
import json, sys
d = json.load(open(sys.argv[1]))
print(d.get('avg_k6_core_cpu_pct', 0), d.get('avg_subgraph_core_cpu_pct', 0))
" "$result_dir/memory.json")
      K6_CORE_VALUES+=("$K6_CORE")
      SUBGRAPH_CORE_VALUES+=("$SUBGRAPH_CORE")
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

  if [[ ${#K6_CORE_VALUES[@]} -gt 0 && ${#SUBGRAPH_CORE_VALUES[@]} -gt 0 ]]; then
    K6_CORE_VALUES_CSV="$(IFS=,; echo "${K6_CORE_VALUES[*]}")"
    SUBGRAPH_CORE_VALUES_CSV="$(IFS=,; echo "${SUBGRAPH_CORE_VALUES[*]}")"

    python3 -c "
import sys, statistics
def parse_csv(s):
    return [float(x) for x in s.split(',') if x]

k6_vals = parse_csv(sys.argv[1])
sub_vals = parse_csv(sys.argv[2])

k6_med = statistics.median(k6_vals) if k6_vals else 0.0
sub_med = statistics.median(sub_vals) if sub_vals else 0.0

print(f'  k6 core usage: {k6_med:.2f}%')
print(f'  subgraph core usage: {sub_med:.2f}%')
" "$K6_CORE_VALUES_CSV" "$SUBGRAPH_CORE_VALUES_CSV"
  fi
fi
