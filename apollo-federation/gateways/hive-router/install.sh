#!/usr/bin/env bash
set -Eeuo pipefail

VERSION="v0.0.43"
curl -o- https://raw.githubusercontent.com/graphql-hive/router/main/install.sh | sh -s "$VERSION"
echo "$VERSION" > version.txt
