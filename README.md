# GraphQL Gateway Benchmarks

Performance benchmarks comparing GraphQL gateway implementations across Apollo Federation and GraphQL Federation.

**Latest Results:** [Real-World](./RESULTS_CONSTANT_LATENCY.md) | [Burst](./RESULTS_BURST.md) | [Synthetic](./RESULTS_CONSTANT.md)

## Test categories

Each benchmark runs a gateway against 4 subgraphs (`Accounts`, `Inventory`, `Products`, `Reviews`) and executes a heavy nested query. There are three test categories, each designed to measure different aspects of gateway performance:

- **Real-World** (`constant-latency`) — Shows how a gateway performs in real-world scenarios where downstream services make database calls and perform other I/O-bound work. Every downstream call adds 4 ms of latency, and the test runs with 50 concurrent VUs for 120 seconds.

- **Burst** (`burst`) — Shows how a gateway responds to rapidly increasing traffic. The benchmark holds a base load of 50 VUs for 10 seconds, ramps to 500 VUs over 40 seconds, and then ramps back to 50 VUs over 10 seconds.

- **Synthetic** (`constant`) — An artificial lab experiment that measures a gateway's theoretical throughput when downstream services make no database calls, perform no other I/O-bound work, and add no latency. This isolates gateway overhead from downstream latency. The test runs with 50 concurrent VUs for 120 seconds.

## Benchmark setup

Subgraph variants:
- `subgraphs-rust` = Rust (`async-graphql` + `axum`)
- `subgraphs-net` = .NET (`HotChocolate`)

Both benchmark families support both subgraph variants:
- `apollo-federation/*` gateways can run with Rust or .NET subgraphs
- `composite-schema/*` gateways can run with Rust or .NET subgraphs

## Gateways

### Apollo Federation
- [Apollo Gateway](./apollo-federation/gateways/apollo-gateway) (Node.js)
- [Apollo Router](./apollo-federation/gateways/apollo-router) (Rust)
- [Cosmo](./apollo-federation/gateways/cosmo) (Go)
- [Grafbase](./apollo-federation/gateways/grafbase) (Rust)
- [Hive Gateway](./apollo-federation/gateways/hive-gateway) (Node.js)
- [Hive Gateway Router Runtime](./apollo-federation/gateways/hive-gateway-router-runtime) (Node.js)
- [Hive Router](./apollo-federation/gateways/hive-router) (Rust)

### [GraphQL Federation](https://graphql.github.io/composite-schemas-spec/)
- [Fusion](./composite-schema/gateways/fusion) (.NET) — benchmarked as latest stable (`fusion`, built and run on the .NET 10 SDK), plus, when a HotChocolate preview newer than the latest stable exists, the latest preview on two runtimes: `fusion-nightly` (built and run on the .NET 10 SDK) and `fusion-nightly-net11` (built and run on the latest .NET 11 preview SDK bundled into its prebuilt artifact, with runtime-async). Running the same preview packages on both runtimes isolates framework effects from library changes.
- [feddi](./composite-schema/gateways/feddi) (JVM) — built from source and bundled with a JDK 25 ([feddi-dev/feddi-gateway](https://github.com/feddi-dev/feddi-gateway)). See its [README](./composite-schema/gateways/feddi/README.md) for setup and a known heavy-query planner limitation.

## Running benchmarks locally

### Prerequisites

- **k6**
- **jq** - required by the monitor script
- **python3** - used for JSON parsing
- **curl** - used for health checks
- **bash**, **taskset** (optional, Linux only for pinning)
- Gateway dependencies are handled by each gateway's `install.sh`

### Run

```bash
./k6/benchmark.sh <gateway-path> [subgraphs-dir] [constant|constant-latency|burst|ramping]
```

Examples:

```bash
# composite-schema + .NET subgraphs (default)
./k6/benchmark.sh composite-schema/gateways/fusion

# composite-schema + Rust subgraphs
./k6/benchmark.sh composite-schema/gateways/fusion subgraphs-rust

# apollo-federation + .NET subgraphs
./k6/benchmark.sh apollo-federation/gateways/apollo-router subgraphs-net

# burst mode
./k6/benchmark.sh apollo-federation/gateways/cosmo burst

# constant-latency mode (.NET subgraphs with simulated 4ms IO delay)
./k6/benchmark.sh apollo-federation/gateways/grafbase subgraphs-net constant-latency
```

### What happens

1. Resolves subgraph directory (`subgraphs-rust` / `subgraphs-net`)
2. Builds subgraphs (`subgraphs/build.sh`) unless `USE_PREBUILT_SUBGRAPHS=1`
3. Installs/builds gateway (`gateway/install.sh`) unless `USE_PREBUILT_GATEWAY=1`
4. Starts subgraphs and gateway (optionally CPU-pinned)
5. Executes one full-duration warmup run (discarded)
6. Executes measured runs (`BENCH_RUNS`, default `9`)
7. Captures monitor + k6 summaries for each run
8. Prints run statistics (median/mean/CV and CPU usage medians)

### Configuration

Environment variables:

| Variable | Default | Description |
|---|---|---|
| `MEASURE_SECONDS` | `120` (constant) / `60` (burst) | Benchmark measurement duration |
| `BENCH_RUNS` | `9` | Measured runs (plus one warmup run) |
| `BENCH_VUS` | `50` constant / `500` burst | VU target passed to `k6/k6.js` |
| `BENCH_DISPLAY_NAME` | _(auto)_ | Override report display name |
| `BENCH_GATEWAY_NAME` | _(auto)_ | Override gateway identity in result metadata (used to split stable vs preview rows) |
| `BENCH_GATEWAY_CHANNEL` | `stable` | HotChocolate package channel for `fusion`'s `install.sh` (`stable` = latest stable packages; `preview` = latest preview/nightly packages) |
| `BENCH_GATEWAY_DOTNET` | `10` | .NET runtime/target for `fusion`'s `install.sh` (`10` = system .NET 10 SDK, targets net10.0; `11` = bundled .NET 11 preview SDK, targets net11.0 with runtime-async) |
| `BENCH_SUBGRAPH_TECH` | _(auto)_ | Explicit subgraph tech label (`rust` / `.net`) |
| `USE_PREBUILT_SUBGRAPHS` | `0` | Skip `build.sh` and expect prebuilt subgraph artifact |
| `USE_PREBUILT_GATEWAY` | `0` | Skip `install.sh` and expect prebuilt gateway artifact |

### CPU pinning

On Linux with `taskset`, `profiles.json` is used to pin:
- `system`
- `k6`
- `gateway`
- `subgraphs`

Profile selection is based on logical core count (8 or 16 profile).

### Output

Each run produces a timestamped results directory:

```text
<gateway-dir>/results/<timestamp>/
  data.csv          # monitor time series
  metadata.json     # gateway/subgraph/machine metadata
  memory.json       # idle/peak/end RSS + avg core usage (k6/subgraphs)
  k6_summary.json   # full k6 metrics (machine-readable)
  k6_summary.txt    # k6 summary (human-readable)
```

## GitHub Actions workflow

Workflow: [benchmark.yml](./.github/workflows/benchmark.yml)

- Triggers:
  - `workflow_dispatch`
  - scheduled daily at `21:00 UTC`
- Dynamic matrix:
  - Builds gateway matrix from selected input
  - Expands each gateway into `rust` + `.net` subgraph variants
- Build stages on `ubuntu-latest`:
  - `build-subgraphs` (prebuilt artifacts)
  - `build-gateways` (prebuilt artifacts)
- Benchmark stages on dedicated benchmark runner:
  - `benchmark-constant-latency` (.NET subgraphs only, 4ms simulated IO delay)
  - `benchmark-constant` (runs after constant-latency completes)
  - `benchmark-burst` (runs after constant completes)
- Result generation:
  - `generate-results-constant-latency`
  - `generate-results-constant`
  - `generate-results-burst`
  - final `benchmark-summary` job publishes all result docs in the run summary
- Result documents are committed back to the branch by the generator jobs

## Acknowledgments

This benchmark repository is based on the work by [The Guild](https://the-guild.dev/) on [graphql-gateways-benchmark](https://github.com/graphql-hive/graphql-gateways-benchmark).
