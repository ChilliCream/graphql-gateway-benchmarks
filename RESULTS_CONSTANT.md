## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 10 times (120s each) and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **120s**.


### Comparison

| Gateway                                        | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :--------------------------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-gateway (2.5.6)                           |    0  |   0 total, 0 failed    |   avg: 0ms, p95: 0ms   | ✅                                        |
| hive-gateway-router-runtime (2.5.6)            |    0  |   0 total, 0 failed    |   avg: 0ms, p95: 0ms   | ✅                                        |
| grafbase (0.53.2)                              |    0  |   0 total, 0 failed    |   avg: 0ms, p95: 0ms   | ✅                                        |
| hive-router (v0.0.41)                          |    0  |   0 total, 0 failed    |   avg: 0ms, p95: 0ms   | ✅                                        |
| cosmo (0.291.0)                                |    0  |   0 total, 0 failed    |   avg: 0ms, p95: 0ms   | ✅                                        |
| hotchocolate (rust subgraphs)                  |    0  |   0 total, 0 failed    |   avg: 0ms, p95: 0ms   | ✅                                        |
| hotchocolate (.net subgraphs)                  |    0  |   0 total, 0 failed    |   avg: 0ms, p95: 0ms   | ✅                                        |
| apollo-gateway (2.13.2)                        |    0  |   0 total, 0 failed    |   avg: 0ms, p95: 0ms   | ✅                                        |
| apollo-router (v2.12.0)                        |    0  |   0 total, 0 failed    |   avg: 0ms, p95: 0ms   | ✅                                        |


<details>
  <summary>Summary for: hive-gateway (2.5.6)</summary>

  **K6 Output**


```
data_received...: 0 B 0 B/s
     data_sent.......: 0 B 0 B/s
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (2.5.6)</summary>

  **K6 Output**


```
data_received...: 0 B 0 B/s
     data_sent.......: 0 B 0 B/s
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (0.53.2)</summary>

  **K6 Output**


```
data_received...: 0 B 0 B/s
     data_sent.......: 0 B 0 B/s
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (v0.0.41)</summary>

  **K6 Output**


```
data_received...: 0 B 0 B/s
     data_sent.......: 0 B 0 B/s
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (0.291.0)</summary>

  **K6 Output**


```
data_received...: 0 B 0 B/s
     data_sent.......: 0 B 0 B/s
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs)</summary>

  **K6 Output**


```
data_received...: 0 B 0 B/s
     data_sent.......: 0 B 0 B/s
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs)</summary>

  **K6 Output**


```
data_received...: 0 B 0 B/s
     data_sent.......: 0 B 0 B/s
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (2.13.2)</summary>

  **K6 Output**


```
data_received...: 0 B 0 B/s
     data_sent.......: 0 B 0 B/s
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (v2.12.0)</summary>

  **K6 Output**


```
data_received...: 0 B 0 B/s
     data_sent.......: 0 B 0 B/s
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

