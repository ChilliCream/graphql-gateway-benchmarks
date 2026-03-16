#!/usr/bin/env bash
set -Eeuo pipefail

exec ./grafbase-gateway --config ./grafbase.toml --schema "./supergraph.graphql" --listen-address 127.0.0.1:5220 --log fatal > ./gateway_log.txt 2>&1
