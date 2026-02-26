#!/usr/bin/env bash
set -Eeuo pipefail

FORK_ARGS=""
if [[ -n "${FORK:-}" ]]; then
  FORK_ARGS="--fork $FORK"
fi

NODE_ENV=production npx hive-gateway supergraph supergraph.graphql --jit $FORK_ARGS > ./gateway_log.txt 2>&1
