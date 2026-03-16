#!/usr/bin/env bash
set -Eeuo pipefail

exec env -i \
  RUST_LOG=info \
  PORT=5220 \
  HIVE__SUPERGRAPH__SOURCE=file \
  HIVE__SUPERGRAPH__PATH=./supergraph.graphql \
  ./hive_router > ./gateway_log.txt 2>&1
