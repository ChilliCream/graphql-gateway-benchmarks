## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 10 times (120s each) and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **120s**.


### Comparison

| Gateway                                        | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :--------------------------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router (v0.0.41)                          | 1506  | 93819 total, 0 failed  | avg: 149ms, p95: 306ms | ✅                                        |
| hotchocolate (rust subgraphs)                  |  918  | 58621 total, 0 failed  | avg: 240ms, p95: 715ms | ✅                                        |
| hotchocolate (.net subgraphs)                  |  903  | 57276 total, 0 failed  | avg: 246ms, p95: 820ms | ✅                                        |
| cosmo (0.291.0)                                |  881  | 55635 total, 0 failed  | avg: 252ms, p95: 497ms | ✅                                        |
| grafbase (0.53.2)                              |  779  | 49117 total, 0 failed  | avg: 286ms, p95: 630ms | ✅                                        |
| hive-gateway-router-runtime (2.5.6)            |  325  | 21561 total, 0 failed  | avg: 654ms, p95: 1448ms | ✅                                        |
| apollo-router (v2.12.0)                        |  291  | 19528 total, 0 failed  | avg: 721ms, p95: 1729ms | ❌ non-compatible response structure (68) |
| hive-gateway (2.5.6)                           |  180  | 12456 total, 0 failed  | avg: 1090ms, p95: 2198ms | ✅                                        |
| apollo-gateway (2.13.2)                        |  106  |  7841 total, 0 failed  | avg: 1542ms, p95: 2869ms | ✅                                        |


<details>
  <summary>Summary for: hive-router (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 278457      ✗ 0    
     data_received..................: 8.2 GB  132 MB/s
     data_sent......................: 113 MB  1.8 MB/s
     http_req_blocked...............: avg=54.85µs  min=1.23µs  med=1.88µs   max=91.97ms  p(90)=3.07µs   p(95)=3.99µs   p(99.9)=18.69ms 
     http_req_connecting............: avg=52.14µs  min=0s      med=0s       max=91.91ms  p(90)=0s       p(95)=0s       p(99.9)=18.65ms 
     http_req_duration..............: avg=149.18ms min=1.9ms   med=143.16ms max=445.41ms p(90)=282.45ms p(95)=305.69ms p(99.9)=397.67ms
       { expected_response:true }...: avg=149.18ms min=1.9ms   med=143.16ms max=445.41ms p(90)=282.45ms p(95)=305.69ms p(99.9)=397.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 93819
     http_req_receiving.............: avg=126.86µs min=22.18µs med=35.12µs  max=72.25ms  p(90)=74.48µs  p(95)=290.53µs p(99.9)=24.03ms 
     http_req_sending...............: avg=92.7µs   min=5.33µs  med=7.91µs   max=69.77ms  p(90)=19.77µs  p(95)=99.25µs  p(99.9)=19.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=148.96ms min=1.86ms  med=142.92ms max=427.38ms p(90)=282.22ms p(95)=305.28ms p(99.9)=395.25ms
     http_reqs......................: 93819   1506.556434/s
     iteration_duration.............: avg=151.01ms min=2.02ms  med=145.18ms max=445.6ms  p(90)=283.16ms p(95)=306.33ms p(99.9)=398.91ms
     iterations.....................: 92819   1490.498317/s
     success_rate...................: 100.00% ✓ 92819       ✗ 0    
     vus............................: 73      min=0         max=494
     vus_max........................: 500     min=500       max=500
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
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 172863     ✗ 0    
     data_received..................: 5.1 GB  81 MB/s
     data_sent......................: 71 MB   1.1 MB/s
     http_req_blocked...............: avg=31.96µs  min=1.18µs  med=1.95µs   max=132.55ms p(90)=3.27µs   p(95)=4.22µs   p(99.9)=5.62ms  
     http_req_connecting............: avg=28.91µs  min=0s      med=0s       max=132.47ms p(90)=0s       p(95)=0s       p(99.9)=5.49ms  
     http_req_duration..............: avg=239.7ms  min=3.36ms  med=168.67ms max=2.87s    p(90)=542.26ms p(95)=714.89ms p(99.9)=1.85s   
       { expected_response:true }...: avg=239.7ms  min=3.36ms  med=168.67ms max=2.87s    p(90)=542.26ms p(95)=714.89ms p(99.9)=1.85s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 58621
     http_req_receiving.............: avg=6.37ms   min=48.65µs med=82.92µs  max=666.31ms p(90)=3.66ms   p(95)=22.74ms  p(99.9)=338.03ms
     http_req_sending...............: avg=60.9µs   min=5.37µs  med=8.06µs   max=61.85ms  p(90)=13.76µs  p(95)=34.98µs  p(99.9)=10.32ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=233.27ms min=3.3ms   med=167.1ms  max=2.85s    p(90)=526.06ms p(95)=682.99ms p(99.9)=1.83s   
     http_reqs......................: 58621   918.117736/s
     iteration_duration.............: avg=244.05ms min=3.57ms  med=172.31ms max=2.87s    p(90)=545.99ms p(95)=720.77ms p(99.9)=1.85s   
     iterations.....................: 57621   902.45581/s
     success_rate...................: 100.00% ✓ 57621      ✗ 0    
     vus............................: 53      min=0        max=499
     vus_max........................: 500     min=500      max=500
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
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 168828     ✗ 0    
     data_received..................: 5.0 GB  79 MB/s
     data_sent......................: 69 MB   1.1 MB/s
     http_req_blocked...............: avg=54.49µs  min=1.19µs  med=1.93µs   max=125.1ms  p(90)=3.19µs   p(95)=4.18µs   p(99.9)=15.65ms 
     http_req_connecting............: avg=51.75µs  min=0s      med=0s       max=125.01ms p(90)=0s       p(95)=0s       p(99.9)=15.59ms 
     http_req_duration..............: avg=245.6ms  min=2.78ms  med=146.58ms max=2.7s     p(90)=626.03ms p(95)=820.33ms p(99.9)=1.82s   
       { expected_response:true }...: avg=245.6ms  min=2.78ms  med=146.58ms max=2.7s     p(90)=626.03ms p(95)=820.33ms p(99.9)=1.82s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 57276
     http_req_receiving.............: avg=14.88ms  min=49.81µs med=88.42µs  max=1.48s    p(90)=9.77ms   p(95)=72.72ms  p(99.9)=838.49ms
     http_req_sending...............: avg=88.94µs  min=5.35µs  med=8.12µs   max=82.42ms  p(90)=15.39µs  p(95)=84.33µs  p(99.9)=18.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=230.63ms min=2.72ms  med=141.38ms max=2.46s    p(90)=578.68ms p(95)=754.02ms p(99.9)=1.78s   
     http_reqs......................: 57276   903.543795/s
     iteration_duration.............: avg=250.19ms min=2.92ms  med=151.66ms max=2.7s     p(90)=631.05ms p(95)=826.47ms p(99.9)=1.83s   
     iterations.....................: 56276   887.768534/s
     success_rate...................: 100.00% ✓ 56276      ✗ 0    
     vus............................: 81      min=0        max=494
     vus_max........................: 500     min=500      max=500
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
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 163905     ✗ 0    
     data_received..................: 4.9 GB  77 MB/s
     data_sent......................: 67 MB   1.1 MB/s
     http_req_blocked...............: avg=11.65µs  min=1.24µs  med=1.84µs   max=28.14ms  p(90)=2.99µs   p(95)=3.79µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=9.04µs   min=0s      med=0s       max=28.03ms  p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=252.28ms min=2.54ms  med=250.43ms max=586.33ms p(90)=468.97ms p(95)=497.32ms p(99.9)=558.15ms
       { expected_response:true }...: avg=252.28ms min=2.54ms  med=250.43ms max=586.33ms p(90)=468.97ms p(95)=497.32ms p(99.9)=558.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 55635
     http_req_receiving.............: avg=58.63µs  min=22.45µs med=43.51µs  max=24.2ms   p(90)=65.12µs  p(95)=79.82µs  p(99.9)=1.29ms  
     http_req_sending...............: avg=33.58µs  min=5.41µs  med=7.96µs   max=26.4ms   p(90)=12.56µs  p(95)=24.72µs  p(99.9)=6.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=252.18ms min=2.5ms   med=250.28ms max=586.26ms p(90)=468.9ms  p(95)=497.21ms p(99.9)=558.1ms 
     http_reqs......................: 55635   881.863106/s
     iteration_duration.............: avg=257.05ms min=2.73ms  med=255.92ms max=586.51ms p(90)=470.17ms p(95)=498.22ms p(99.9)=558.87ms
     iterations.....................: 54635   866.012237/s
     success_rate...................: 100.00% ✓ 54635      ✗ 0    
     vus............................: 67      min=0        max=496
     vus_max........................: 500     min=500      max=500
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
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 144351     ✗ 0    
     data_received..................: 4.3 GB  69 MB/s
     data_sent......................: 59 MB   937 kB/s
     http_req_blocked...............: avg=11.91µs  min=1.25µs  med=1.96µs   max=21.8ms   p(90)=3.28µs   p(95)=4.25µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=8.94µs   min=0s      med=0s       max=21.75ms  p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=285.99ms min=2.47ms  med=273.29ms max=878.92ms p(90)=562.96ms p(95)=630.02ms p(99.9)=829.46ms
       { expected_response:true }...: avg=285.99ms min=2.47ms  med=273.29ms max=878.92ms p(90)=562.96ms p(95)=630.02ms p(99.9)=829.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49117
     http_req_receiving.............: avg=56.32µs  min=23.54µs med=40.39µs  max=20.97ms  p(90)=66.85µs  p(95)=83.67µs  p(99.9)=1.5ms   
     http_req_sending...............: avg=31.03µs  min=5.51µs  med=8.31µs   max=13.7ms   p(90)=13.63µs  p(95)=22.26µs  p(99.9)=5.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=285.9ms  min=2.42ms  med=273.16ms max=878.87ms p(90)=562.9ms  p(95)=629.89ms p(99.9)=829.41ms
     http_reqs......................: 49117   779.989089/s
     iteration_duration.............: avg=292.11ms min=2.66ms  med=279.09ms max=879.05ms p(90)=566.74ms p(95)=631.48ms p(99.9)=830.1ms 
     iterations.....................: 48117   764.108863/s
     success_rate...................: 100.00% ✓ 48117      ✗ 0    
     vus............................: 62      min=0        max=497
     vus_max........................: 500     min=500      max=500
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
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 61683      ✗ 0    
     data_received..................: 1.9 GB  29 MB/s
     data_sent......................: 26 MB   393 kB/s
     http_req_blocked...............: avg=11.9µs   min=1.3µs   med=2.07µs   max=12.8ms  p(90)=3.44µs  p(95)=4.92µs  p(99.9)=822.86µs
     http_req_connecting............: avg=8.47µs   min=0s      med=0s       max=12.75ms p(90)=0s      p(95)=0s      p(99.9)=766.41µs
     http_req_duration..............: avg=654.2ms  min=5.14ms  med=619.61ms max=2.8s    p(90)=1.31s   p(95)=1.44s   p(99.9)=2.18s   
       { expected_response:true }...: avg=654.2ms  min=5.14ms  med=619.61ms max=2.8s    p(90)=1.31s   p(95)=1.44s   p(99.9)=2.18s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 21561
     http_req_receiving.............: avg=54.58µs  min=26.25µs med=42.65µs  max=5.31ms  p(90)=71.47µs p(95)=84.25µs p(99.9)=1.12ms  
     http_req_sending...............: avg=25.22µs  min=5.79µs  med=8.72µs   max=9.29ms  p(90)=14.39µs p(95)=27.09µs p(99.9)=5.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=654.12ms min=5.1ms   med=619.56ms max=2.8s    p(90)=1.31s   p(95)=1.44s   p(99.9)=2.18s   
     http_reqs......................: 21561   325.959165/s
     iteration_duration.............: avg=686.05ms min=5.3ms   med=657.86ms max=2.8s    p(90)=1.32s   p(95)=1.45s   p(99.9)=2.19s   
     iterations.....................: 20561   310.841166/s
     success_rate...................: 100.00% ✓ 20561      ✗ 0    
     vus............................: 78      min=0        max=499
     vus_max........................: 500     min=500      max=500
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
✓ response code was 200
     ✗ no graphql errors
      ↳  99% — ✓ 18460 / ✗ 68
     ✗ valid response structure
      ↳  99% — ✓ 18527 / ✗ 1

     checks.........................: 99.87% ✓ 55515      ✗ 69   
     data_received..................: 1.7 GB 26 MB/s
     data_sent......................: 24 MB  353 kB/s
     http_req_blocked...............: avg=15.06µs  min=1.31µs  med=2.05µs   max=21.09ms p(90)=3.62µs  p(95)=5µs     p(99.9)=1.21ms 
     http_req_connecting............: avg=11.51µs  min=0s      med=0s       max=20.97ms p(90)=0s      p(95)=0s      p(99.9)=1.17ms 
     http_req_duration..............: avg=720.99ms min=6.11ms  med=661.04ms max=6.66s   p(90)=1.48s   p(95)=1.72s   p(99.9)=5.21s  
       { expected_response:true }...: avg=720.99ms min=6.11ms  med=661.04ms max=6.66s   p(90)=1.48s   p(95)=1.72s   p(99.9)=5.21s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 19528
     http_req_receiving.............: avg=52.66µs  min=24.22µs med=41.19µs  max=14.63ms p(90)=70.91µs p(95)=85.24µs p(99.9)=658.5µs
     http_req_sending...............: avg=30.48µs  min=5.62µs  med=8.82µs   max=18.67ms p(90)=16.4µs  p(95)=30.79µs p(99.9)=6.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=720.91ms min=6.07ms  med=660.99ms max=6.66s   p(90)=1.48s   p(95)=1.72s   p(99.9)=5.21s  
     http_reqs......................: 19528  291.899748/s
     iteration_duration.............: avg=759.88ms min=6.43ms  med=703.94ms max=6.66s   p(90)=1.51s   p(95)=1.74s   p(99.9)=5.23s  
     iterations.....................: 18528  276.951993/s
     success_rate...................: 99.63% ✓ 18460      ✗ 68   
     vus............................: 61     min=0        max=498
     vus_max........................: 500    min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 34368      ✗ 0    
     data_received..................: 1.1 GB  16 MB/s
     data_sent......................: 15 MB   221 kB/s
     http_req_blocked...............: avg=12.85µs min=1.39µs  med=2.41µs  max=6.9ms  p(90)=3.94µs  p(95)=5.69µs  p(99.9)=612.96µs
     http_req_connecting............: avg=8.66µs  min=0s      med=0s      max=6.85ms p(90)=0s      p(95)=0s      p(99.9)=567.59µs
     http_req_duration..............: avg=1.09s   min=7.1ms   med=1.08s   max=11.13s p(90)=2s      p(95)=2.19s   p(99.9)=9.96s   
       { expected_response:true }...: avg=1.09s   min=7.1ms   med=1.08s   max=11.13s p(90)=2s      p(95)=2.19s   p(99.9)=9.96s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 12456
     http_req_receiving.............: avg=60.2µs  min=27.11µs med=47.39µs max=7.61ms p(90)=78.07µs p(95)=92.21µs p(99.9)=1.66ms  
     http_req_sending...............: avg=25.66µs min=6.29µs  med=10.04µs max=9.87ms p(90)=17.04µs p(95)=35.12µs p(99.9)=5.33ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s     p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=1.08s   min=7.06ms  med=1.08s   max=11.13s p(90)=2s      p(95)=2.19s   p(99.9)=9.96s   
     http_reqs......................: 12456   180.27845/s
     iteration_duration.............: avg=1.18s   min=7.26ms  med=1.19s   max=11.14s p(90)=2.03s   p(95)=2.22s   p(99.9)=10.12s  
     iterations.....................: 11456   165.805228/s
     success_rate...................: 100.00% ✓ 11456      ✗ 0    
     vus............................: 76      min=0        max=500
     vus_max........................: 500     min=500      max=500
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
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 20523      ✗ 0    
     data_received..................: 689 MB  9.3 MB/s
     data_sent......................: 9.8 MB  133 kB/s
     http_req_blocked...............: avg=16.66µs min=1.33µs  med=2.21µs  max=17.2ms   p(90)=3.87µs  p(95)=6.13µs  p(99.9)=500.76µs
     http_req_connecting............: avg=11.19µs min=0s      med=0s      max=17.15ms  p(90)=0s      p(95)=0s      p(99.9)=451.2µs 
     http_req_duration..............: avg=1.54s   min=12.01ms med=1.52s   max=21.16s   p(90)=2.65s   p(95)=2.86s   p(99.9)=19.74s  
       { expected_response:true }...: avg=1.54s   min=12.01ms med=1.52s   max=21.16s   p(90)=2.65s   p(95)=2.86s   p(99.9)=19.74s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7841 
     http_req_receiving.............: avg=53.85µs min=28µs    med=43.27µs max=871.92µs p(90)=77.64µs p(95)=92.02µs p(99.9)=605.31µs
     http_req_sending...............: avg=26.19µs min=5.96µs  med=9.07µs  max=21.92ms  p(90)=17.44µs p(95)=38.91µs p(99.9)=4.63ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=1.54s   min=11.97ms med=1.52s   max=21.16s   p(90)=2.65s   p(95)=2.86s   p(99.9)=19.74s  
     http_reqs......................: 7841    106.125751/s
     iteration_duration.............: avg=1.76s   min=12.23ms med=1.74s   max=21.16s   p(90)=2.68s   p(95)=2.94s   p(99.9)=19.96s  
     iterations.....................: 6841    92.591029/s
     success_rate...................: 100.00% ✓ 6841       ✗ 0    
     vus............................: 83      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

