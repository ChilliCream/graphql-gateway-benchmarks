#!/usr/bin/env bash
set -Eeuo pipefail

# https://github.com/VirtusLab/scala-cli/releases
SCALA_CLI_VERSION="1.17.1"

case "$(uname -s)" in
Darwin) os=mac; jdk_strip=3; scala_cli_os=apple-darwin ;;
*) os=linux; jdk_strip=1; scala_cli_os=pc-linux ;;
esac
case "$(uname -m)" in
arm64 | aarch64) jdk_arch=aarch64; scala_cli_arch=aarch64 ;;
*) jdk_arch=x64; scala_cli_arch=x86_64 ;;
esac

# The JDK is bundled so that the prebuilt artifact runs without a system Java.
if [[ ! -x ./.jdk/bin/java ]]; then
    rm -rf ./.jdk
    mkdir -p ./.jdk
    curl -fsSL "https://api.adoptium.net/v3/binary/latest/25/ga/$os/$jdk_arch/jdk/hotspot/normal/eclipse" |
        tar -xz -C ./.jdk --strip-components="$jdk_strip"
fi

if [[ ! -x ./scala-cli ]]; then
    curl -fsSL "https://github.com/VirtusLab/scala-cli/releases/download/v$SCALA_CLI_VERSION/scala-cli-$scala_cli_arch-$scala_cli_os.gz" |
        gunzip > ./scala-cli
    chmod +x ./scala-cli
fi

./scala-cli --power package --server=false --java-home "$PWD/.jdk" --assembly Main.scala -o caliban.jar -f
sed -n 's|^//> using dep com.github.ghostdogpr::caliban-gateway:||p' Main.scala > version.txt
