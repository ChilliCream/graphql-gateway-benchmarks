## Overview for: `constant-vus-over-time`

This scenario runs 4 subgraphs and a GraphQL gateway with Federation spec, and runs a heavy query. It's being executed with a constant amount of VUs over a fixed amount of time. It measures things like memory usage, CPU usage, average RPS. It also includes a summary of the entire execution, and metrics information about HTTP execution times.

This scenario was running 50 VUs over 60s


### Comparison

| Gateway | RPS | Requests | Duration | Notes |
| :-- | :--: | :--: | :--: | :-- |
