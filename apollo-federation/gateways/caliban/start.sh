#!/usr/bin/env bash
set -Eeuo pipefail

exec ./.jdk/bin/java -XX:+UseParallelGC -jar caliban.jar > ./gateway_log.txt 2>&1
