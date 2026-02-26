#!/usr/bin/env bash
set -Eeuo pipefail

# Samples CPU, RSS, and k6 metrics for an entire process tree.
# Usage: ./monitor.sh [-g <pgid> | -p <pid>] [-o data.csv] [-i 1] [-k k6_api_addr]
#   -g PGID        Process group id to monitor
#   -p PID         Leader process id to monitor
#   -o OUTPUT      CSV file (default: data.csv)
#   -i INTERVAL    Seconds between samples (default: 1)
#   -k K6_API      k6 REST API address (e.g., 127.0.0.1:6565)

PGID=""
LEADER_PID=""
OUTPUT_FILE="data.csv"
INTERVAL="1"
K6_API=""

while getopts ":g:p:o:i:k:" opt; do
  case "$opt" in
    g) PGID="$OPTARG" ;;
    p) LEADER_PID="$OPTARG" ;;
    o) OUTPUT_FILE="$OPTARG" ;;
    i) INTERVAL="$OPTARG" ;;
    k) K6_API="$OPTARG" ;;
    *) echo "Usage: $0 [-g <pgid> | -p <pid>] [-o output.csv] [-i interval] [-k k6_api]"; exit 1 ;;
  esac
done

if [[ -z "$PGID" && -z "$LEADER_PID" ]]; then
  echo "Error: Either -g <pgid> or -p <pid> is required."
  echo "Usage: $0 [-g <pgid> | -p <pid>] [-o output.csv] [-i interval]"
  exit 1
fi

if [[ -n "$PGID" ]]; then
    echo "Monitoring PGID $PGID. Writing to $OUTPUT_FILE. Ctrl+C to stop."
else
    echo "Monitoring PID tree $LEADER_PID. Writing to $OUTPUT_FILE. Ctrl+C to stop."
fi

echo "Seconds,VUs,RPS,P95_ms,Req_success_rate,Total_CPU,Total_RSS_KB" > "$OUTPUT_FILE"

get_target_pids() {
  local pids=""
  if [[ -n "$PGID" ]]; then
    pids=$(pgrep -g "$PGID" || true)
  elif [[ -n "$LEADER_PID" ]]; then
    pids=$(pgrep -P "$LEADER_PID" || true)
    pids="$LEADER_PID $pids"
  fi
  echo "$pids" | tr '\n' ' '
}

get_k6_metrics() {
    if [[ -z "$K6_API" ]]; then
        printf "0,0.00,0.00,0.00\n"
        return
    fi

    local metrics_json
    metrics_json=$(curl -fsS "http://$K6_API/v1/metrics" 2>/dev/null || echo "{}")

    local result
    result=$(echo "$metrics_json" | jq -r '
        ((.data // []) | map({key: .id, value: .}) | from_entries) as $metrics |
        ($metrics.vus.attributes.sample.value // 0) as $vus |
        ($metrics.http_reqs.attributes.sample.rate // 0) as $rps |
        ($metrics.http_req_duration.attributes.sample."p(95)" // 0) as $p95 |
        ($metrics.success_rate.attributes.sample.rate // 1) as $req_success_rate |
        "\($vus),\($rps),\($p95),\($req_success_rate)"
    ' || printf "0,0.00,0.00,0.00\n")

    if [[ -z "$result" ]]; then
        printf "0,0.00,0.00,0.00\n"
        return
    fi
    echo "$result"
}

sum_cpu_rss() {
  local pids="$1"
  if [[ -z "$pids" ]]; then
    printf "0.00,0\n"
    return
  fi
  local ps_args=()
  for pid in $pids; do
    ps_args+=(-p "$pid")
  done
  ps "${ps_args[@]}" -o %cpu,rss 2>/dev/null | awk '
    NR > 1 { cpu+=$1; rss+=$2 } END { printf("%.2f,%d\n", cpu, rss) }
  ' || printf "0.00,0\n"
}

START_TIME=$(date +%s)
while true; do
  PIDS="$(get_target_pids)"
  if [[ -z "$PIDS" ]]; then
    if [[ -n "$PGID" ]]; then
        echo "Process group $PGID is empty. Stopping monitoring."
    else
        echo "Process tree for $LEADER_PID is empty. Stopping monitoring."
    fi
    break
  fi

  k6_metrics="$(get_k6_metrics)"
  IFS=',' read -r VUS RPS P95_MS REQ_SUCCESS_RATE <<< "$k6_metrics"

  CPU_RSS="$(sum_cpu_rss "$PIDS")"
  CPU="$(echo "$CPU_RSS" | cut -d, -f1)"
  RSS_KB="$(echo "$CPU_RSS" | cut -d, -f2)"

  if [[ $VUS -gt 0 ]]; then
      NOW=$(date +%s)
      ELAPSED=$((NOW - START_TIME))
      echo "$ELAPSED,$VUS,$RPS,$P95_MS,$REQ_SUCCESS_RATE,$CPU,$RSS_KB" >> "$OUTPUT_FILE"
  fi

  sleep "$INTERVAL"
done
