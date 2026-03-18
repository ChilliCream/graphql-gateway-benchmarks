# GraphQL Gateway Benchmarks

Performance benchmarks comparing GraphQL gateway implementations across federation and composite schema approaches.

**Latest Results:** [Constant Load](./RESULTS_CONSTANT.md) | [Constant Load with Latency](./RESULTS_CONSTANT_LATENCY.md) | [Burst Load](./RESULTS_BURST.md)

## Test categories

Each benchmark runs a gateway against 4 subgraphs (`Accounts`, `Inventory`, `Products`, `Reviews`) and executes a heavy nested query. There are three test categories, each designed to measure different aspects of gateway performance:

- **Constant Load** (`constant`) — 50 VUs for 120s. Simulates stable, sustained traffic against a gateway without any artificial latency on the subgraphs. Measures raw gateway throughput and how well it handles a steady request rate.

- **Constant Load with Latency** (`constant-latency`) — 50 VUs for 120s, .NET subgraphs only. Simulates more realistic requests by adding a 4ms delay per subgraph HTTP request, accounting for the database or service calls that would normally happen inside a subgraph. Shows how gateways perform when subgraph response times are non-trivial.

- **Burst** (`burst`) — 60s total, single burst from 50 to 500 VUs. Simulates a short, intense spike of traffic to see how gateways handle sudden load increases and recover afterward.

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

### [Composite Schema](https://graphql.github.io/composite-schemas-spec/)
- [HotChocolate](./composite-schema/gateways/hotchocolate) (.NET)

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
./k6/benchmark.sh composite-schema/gateways/hotchocolate

# composite-schema + Rust subgraphs
./k6/benchmark.sh composite-schema/gateways/hotchocolate subgraphs-rust

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
