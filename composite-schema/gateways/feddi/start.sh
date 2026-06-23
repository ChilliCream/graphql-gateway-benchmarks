#!/usr/bin/env bash
set -Eeuo pipefail

# =============================================================================
# start.sh — Launch the feddi Gateway and activate the federated schema.
#
# Unlike gateways that embed a pre-composed supergraph, feddi composes at runtime
# from a subgraph-definition ZIP pushed to its admin endpoint. So startup is:
#   1. Launch bin/feddi-gateway (binds :5220 GraphQL, :9091 admin, :9090 health).
#      Before the upload it answers /graphql with HTTP 503 (not initialized).
#   2. POST subgraphs.zip to the admin endpoint; feddi composes the supergraph.
#   3. Verify a real federated query returns data before handing off.
#   4. Stay attached to the gateway process (so the harness can manage its
#      lifecycle and account CPU/RSS against it).
#
# The upload + composition complete within ~1s of the port binding — long before
# the harness's discarded warmup run ends — so all measured runs hit a fully
# composed gateway. If composition fails, the gateway is killed so the harness
# fails loudly instead of benchmarking an uninitialized gateway.
# =============================================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

DIST_BIN="$SCRIPT_DIR/dist/feddi-gateway/bin/feddi-gateway"
SUBGRAPHS_ZIP="$SCRIPT_DIR/subgraphs.zip"
GRAPHQL_URL="http://localhost:5220/graphql"
ADMIN_URL="http://127.0.0.1:9091/admin/upload"

if [[ ! -x "$DIST_BIN" ]]; then
  echo "ERROR: feddi Gateway not built — run install.sh first (missing $DIST_BIN)"
  exit 1
fi
if [[ ! -f "$SUBGRAPHS_ZIP" ]]; then
  echo "ERROR: subgraphs.zip not found — run install.sh first (missing $SUBGRAPHS_ZIP)"
  exit 1
fi

# Prefer the JDK 25 bundled by install.sh; the launcher requires Java 25+.
if [[ -x "$SCRIPT_DIR/.jdk/bin/java" ]]; then
  export FEDDI_GATEWAY_JAVA_HOME="$SCRIPT_DIR/.jdk"
elif [[ -x "$SCRIPT_DIR/.jdk/Contents/Home/bin/java" ]]; then
  export FEDDI_GATEWAY_JAVA_HOME="$SCRIPT_DIR/.jdk/Contents/Home"
fi

# Subgraph HTTP connection pool sizing.
#
# feddi's default subgraph client uses Spring WebClient over the shared
# reactor-netty connection pool (default: 500 connections/host, 1000 pending-
# acquire queue). The benchmark's deeply nested query fans out into many
# concurrent per-entity subgraph requests, which exhausts that default pool
# ("Pending acquire queue has reached its maximum size of 1000") and turns into
# request errors rather than a throughput measurement. Raising the pool ceiling
# removes that artificial bottleneck so the benchmark measures feddi's execution
# engine — comparable to the connection settings the other gateways ship with
# (e.g. fusion's MaxConnectionsPerServer=256). reactor-netty derives the pending-
# acquire queue as 2x maxConnections, so this also lifts the queue ceiling.
export JAVA_OPTS="${JAVA_OPTS:-} -Dreactor.netty.pool.maxConnections=${FEDDI_SUBGRAPH_MAX_CONNECTIONS:-4096} -Dreactor.netty.pool.acquireTimeout=60000"

# Launch the gateway. CWD is the gateway dir, so feddi reads feddi-gateway.yml
# from here and writes its rolling log under ./logs. The launcher exec()s java,
# so $GATEWAY_PID is the JVM itself (correct for the harness's metrics/cleanup).
"$DIST_BIN" > "$SCRIPT_DIR/gateway_log.txt" 2>&1 &
GATEWAY_PID=$!

cleanup() {
  kill "$GATEWAY_PID" 2>/dev/null || true
}
trap cleanup EXIT INT TERM

# --- Upload the subgraph definitions; retry until the admin server is up. -----
# The admin server reads the raw request body as the ZIP, so send it as
# application/octet-stream (the gateway's tested upload path).
echo "Uploading subgraph definitions to $ADMIN_URL ..."
UPLOAD_DEADLINE=$((SECONDS + 60))
UPLOAD_OK=false
while (( SECONDS < UPLOAD_DEADLINE )); do
  if ! kill -0 "$GATEWAY_PID" 2>/dev/null; then
    echo "ERROR: gateway process exited before subgraph upload"
    exit 1
  fi
  RESP="$(curl -s --max-time 5 -X POST \
            -H 'Content-Type: application/octet-stream' \
            --data-binary @"$SUBGRAPHS_ZIP" "$ADMIN_URL" 2>/dev/null || true)"
  if [[ "$RESP" == *'"success":true'* ]]; then
    echo "Subgraph upload accepted: $RESP"
    UPLOAD_OK=true
    break
  fi
  if [[ "$RESP" == *'"success":false'* ]]; then
    # Admin server is up and rejected the definition (e.g. composition error).
    echo "ERROR: feddi Gateway rejected the subgraph definitions: $RESP"
    exit 1
  fi
  sleep 0.25
done

if [[ "$UPLOAD_OK" != true ]]; then
  echo "ERROR: subgraph upload did not succeed within the timeout"
  exit 1
fi

# --- Verify the composed schema actually serves a federated query. -----------
echo "Verifying composed schema serves queries ..."
VERIFY_DEADLINE=$((SECONDS + 30))
VERIFY_OK=false
while (( SECONDS < VERIFY_DEADLINE )); do
  if ! kill -0 "$GATEWAY_PID" 2>/dev/null; then
    echo "ERROR: gateway process exited before becoming queryable"
    exit 1
  fi
  RESP="$(curl -s --max-time 5 -X POST \
            -H 'Content-Type: application/json' \
            --data '{"query":"{ topProducts { upc } }"}' "$GRAPHQL_URL" 2>/dev/null || true)"
  if [[ "$RESP" == *'"data"'* && "$RESP" != *'"errors"'* ]]; then
    echo "Composed schema is serving queries."
    VERIFY_OK=true
    break
  fi
  sleep 0.25
done

if [[ "$VERIFY_OK" != true ]]; then
  echo "ERROR: composed schema did not serve a valid query in time (last response: ${RESP:-none})"
  exit 1
fi

echo "feddi Gateway ready."

# Stay attached to the JVM so the harness controls its lifecycle.
wait "$GATEWAY_PID"
