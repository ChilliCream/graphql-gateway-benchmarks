#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Set JAVA_HOME to the bundled JDK if present ---
if [[ -d "$SCRIPT_DIR/jdk" ]]; then
  export FEDDI_GATEWAY_JAVA_HOME="$SCRIPT_DIR/jdk"
fi

# --- Copy gateway config to working directory ---
cp "$SCRIPT_DIR/feddi-gateway.yml" "$SCRIPT_DIR/feddi-gateway/feddi-gateway.yml"

# --- Start the feddi gateway ---
cd "$SCRIPT_DIR/feddi-gateway"
./bin/feddi-gateway > "$SCRIPT_DIR/gateway_log.txt" 2>&1 &
GATEWAY_PID=$!

cleanup() {
  kill "$GATEWAY_PID" 2>/dev/null || true
}
trap cleanup EXIT

# --- Wait for admin endpoint ---
echo "Waiting for feddi-gateway to start..."
ADMIN_URL="http://localhost:9090/actuator/health"
TIMEOUT=60
ELAPSED=0
while true; do
  if curl -s -o /dev/null --max-time 2 "$ADMIN_URL" 2>/dev/null; then
    echo "feddi-gateway is up (took ${ELAPSED}s)."
    break
  fi

  if ! kill -0 "$GATEWAY_PID" 2>/dev/null; then
    echo "Error: feddi-gateway exited during startup."
    cat "$SCRIPT_DIR/gateway_log.txt" 2>/dev/null || true
    exit 1
  fi

  if [[ $ELAPSED -ge $TIMEOUT ]]; then
    echo "Error: feddi-gateway did not start within ${TIMEOUT}s."
    cat "$SCRIPT_DIR/gateway_log.txt" 2>/dev/null || true
    exit 1
  fi

  sleep 0.5
  ELAPSED=$((ELAPSED + 1))
done

# --- Upload subgraph configuration ---
echo "Uploading subgraph schemas to feddi-gateway..."
UPLOAD_RESPONSE=$(curl -s -w "\n%{http_code}" -X POST "http://localhost:9091/admin/upload" \
  -F "file=@$SCRIPT_DIR/subgraphs.zip")
HTTP_CODE=$(echo "$UPLOAD_RESPONSE" | tail -1)

if [[ "$HTTP_CODE" -ge 200 && "$HTTP_CODE" -lt 300 ]]; then
  echo "Subgraph schemas uploaded successfully (HTTP $HTTP_CODE)."
else
  echo "Error: subgraph schema upload failed (HTTP $HTTP_CODE)."
  echo "$UPLOAD_RESPONSE" | head -n -1
  exit 1
fi

# Keep running — wait for the gateway process
wait "$GATEWAY_PID"
