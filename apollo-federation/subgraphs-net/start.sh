#!/usr/bin/env bash
set -Eeuo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export ASPNETCORE_ENVIRONMENT=Production

PIDS=()
mapfile -t CSPROJ_FILES < <(find "$SCRIPT_DIR" -mindepth 2 -maxdepth 2 -type f -name '*.csproj' | sort)

if [[ ${#CSPROJ_FILES[@]} -eq 0 ]]; then
  echo "Error: no .csproj files found under $SCRIPT_DIR"
  exit 1
fi

cleanup() {
  for pid in "${PIDS[@]}"; do
    kill "$pid" 2>/dev/null || true
  done
}
trap cleanup EXIT

for csproj in "${CSPROJ_FILES[@]}"; do
  project_dir="$(dirname "$csproj")"
  project_name="$(basename "$project_dir")"
  log_file="${project_name,,}"
  log_file="${log_file//./_}_log.txt"

  (
    cd "$project_dir"
    dotnet run -c Release --no-build --no-restore > "$SCRIPT_DIR/$log_file" 2>&1
  ) &
  PIDS+=($!)
done

wait
