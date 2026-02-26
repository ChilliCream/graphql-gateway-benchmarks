## Overview for: `ramping-vus`

This scenario runs 4 subgraphs and a GraphQL gateway with Federation spec, and runs a heavy query. It's a stress test that ramps up virtual users over time to find performance limits. It measures things like memory usage, CPU usage, average RPS. It also includes a summary of the entire execution, and metrics information about HTTP execution times.

This scenario was ramping up to 500 VUs over 60s


### Comparison

| Gateway | RPS | Requests | Duration | Notes |
| :-- | :--: | :--: | :--: | :-- |
