#!/usr/bin/env bash
set -Eeuo pipefail

# https://github.com/apollographql/router/releases
VERSION="v2.13.1"
curl -sSL "https://router.apollo.dev/download/nix/${VERSION}" | sh
echo "$VERSION" > version.txt
