# GraphQL Gateway Benchmarks

Performance benchmarks comparing GraphQL gateway implementations across federation and composite schema approaches.

**Latest Results:** [Constant Load](./RESULTS_CONSTANT.md) | [Ramping Load](./RESULTS_RAMPING.md)

## Setup

Each benchmark runs a gateway against 4 subgraphs (Accounts, Inventory, Products, Reviews) and executes a heavy nested query. The subgraph implementation differs per schema approach:

### Apollo Federation

Subgraphs are built with Rust using [async-graphql](https://github.com/async-graphql/async-graphql) + [axum](https://github.com/tokio-rs/axum).

**Gateways:**

- [Apollo Gateway](./apollo-federation/gateways/apollo-gateway) (Node.js)
- [Apollo Router](./apollo-federation/gateways/apollo-router) (Rust)
- [Cosmo](./apollo-federation/gateways/cosmo) (Go)
- [Grafbase](./apollo-federation/gateways/grafbase) (Rust)
- [Hive Gateway](./apollo-federation/gateways/hive-gateway) (Node.js)
- [Hive Gateway Router Runtime](./apollo-federation/gateways/hive-gateway-router-runtime) (Node.js)
- [Hive Router](./apollo-federation/gateways/hive-router) (Rust)

### [Composite Schema](https://graphql.github.io/composite-schemas-spec/)

Subgraphs are built with .NET using [HotChocolate](https://github.com/ChilliCream/graphql-platform).

**Gateways:**

- [HotChocolate](./composite-schema/gateways/hotchocolate) (.NET)

## Running benchmarks locally

### Prerequisites

- **k6** - auto-installed if missing (via Homebrew on macOS, apt on Linux)
- **jq** - required by the monitor script
- **python3** - used for JSON parsing
- **curl** - used for health checks
- Gateway-specific dependencies are installed automatically by each gateway's `install.sh`

### Run a benchmark

```bash
./k6/benchmark.sh <gateway-path> [subgraphs-dir] [constant|ramping]
```

Examples:

```bash
# HotChocolate gateway, constant load (default), .NET subgraphs
./k6/benchmark.sh composite-schema/gateways/hotchocolate

# HotChocolate gateway with Rust subgraphs
./k6/benchmark.sh composite-schema/gateways/hotchocolate subgraphs-rust

# Cosmo gateway, ramping load
./k6/benchmark.sh apollo-federation/gateways/cosmo ramping
```

### What happens

1. Installs dependencies for the subgraphs and gateway (`install.sh`)
2. Starts subgraphs in the background
3. Starts the gateway and waits for it to become healthy
4. Runs a warmup phase (15s by default)
5. Starts a CPU/memory monitor, then runs the k6 benchmark (60s by default)
6. Saves results and cleans up all processes

### Configuration

Environment variables:

| Variable | Default | Description |
|---|---|---|
| `WARMUP_SECONDS` | `15` | Warmup duration before measurement |
| `MEASURE_SECONDS` | `60` | Benchmark measurement duration |
| `BENCH_VUS` | `50` (constant) / `500` (ramping) | Number of virtual users |
| `BENCH_RUNS` | `3` | Iterations per benchmark (median selected for results) |

### CPU pinning

On Linux with `taskset` available, the script reads `profiles.json` to pin k6, the gateway, and subgraphs to specific CPU cores. Profiles are defined for 8-core and 16-core machines. On macOS, CPU pinning is skipped.

### Output

Each run produces a timestamped results directory:

```text
<gateway-dir>/results/<timestamp>/
  data.csv          # time-series: CPU, RSS, VUs, RPS, P95, success rate
  k6_summary.json   # full k6 metrics (machine-readable)
  k6_summary.txt    # k6 summary (human-readable)
```

## Acknowledgments

This benchmark repository is based on the work by [The Guild](https://the-guild.dev/) on [graphql-gateways-benchmark](https://github.com/graphql-hive/graphql-gateways-benchmark).
