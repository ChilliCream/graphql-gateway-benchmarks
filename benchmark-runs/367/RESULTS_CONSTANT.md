## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| apollo-gateway | — | — | — | — | — | benchmark run failed |
| apollo-router | — | — | — | — | — | benchmark run failed |
| cosmo | — | — | — | — | — | benchmark run failed |
| feddi | — | — | — | — | — | benchmark run failed |
| fusion | — | — | — | — | — | benchmark run failed |
| fusion-nightly | — | — | — | — | — | benchmark run failed |
| fusion-nightly-fed | — | — | — | — | — | benchmark run failed |
| fusion-nightly-net11 | — | — | — | — | — | benchmark run failed |
| grafbase | — | — | — | — | — | benchmark run failed |
| hive-gateway | — | — | — | — | — | benchmark run failed |
| hive-gateway-router-runtime | — | — | — | — | — | benchmark run failed |
| hive-router | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| apollo-gateway | — | — | — | — | — | benchmark run failed |
| apollo-router | — | — | — | — | — | benchmark run failed |
| cosmo | — | — | — | — | — | benchmark run failed |
| feddi | — | — | — | — | — | benchmark run failed |
| fusion | — | — | — | — | — | benchmark run failed |
| fusion-nightly | — | — | — | — | — | benchmark run failed |
| fusion-nightly-fed | — | — | — | — | — | benchmark run failed |
| fusion-nightly-net11 | — | — | — | — | — | benchmark run failed |
| grafbase | — | — | — | — | — | benchmark run failed |
| hive-gateway | — | — | — | — | — | benchmark run failed |
| hive-gateway-router-runtime | — | — | — | — | — | benchmark run failed |
| hive-router | — | — | — | — | — | benchmark run failed |


### Details

No successful benchmark runs available for detailed output.

### Footnotes

- Benchmark hardware: unavailable in metadata.

