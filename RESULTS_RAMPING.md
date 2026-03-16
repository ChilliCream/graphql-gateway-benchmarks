## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario is a stress test that ramps up to **500 VUs** over **120s**.


### Comparison

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-gateway | 2.5.6 | 1,489 | 1,489 | 1,489 | 0.0% |  |
| cosmo | 0.291.0 | 1,478 | 1,478 | 1,447 | 1.5% |  |
| hotchocolate (rust subgraphs) | 16.0.0-p.11.45 | 1,361 | 1,361 | 1,360 | 0.1% |  |
| hotchocolate (.net subgraphs) | 16.0.0-p.11.45 | 1,358 | 1,358 | 1,341 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.6 | 502 | 502 | 499 | 0.4% |  |
| apollo-router | v2.12.0 | 381 | 381 | 370 | 2.0% | non-compatible response (69 across 2/2 runs) |
| apollo-gateway | 2.13.2 | 206 | 206 | 206 | 0.0% |  |


<details>
  <summary>Summary for: hive-gateway (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 272919      ✗ 0    
     data_received..................: 8.1 GB  131 MB/s
     data_sent......................: 111 MB  1.8 MB/s
     http_req_blocked...............: avg=5.05µs   min=1.18µs  med=2.3µs    max=26.5ms   p(90)=3.51µs   p(95)=4.2µs    p(99.9)=205.45µs
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=26.45ms  p(90)=0s       p(95)=0s       p(99.9)=147.38µs
     http_req_duration..............: avg=152.23ms min=1.45ms  med=148.33ms max=381.59ms p(90)=298.42ms p(95)=317.86ms p(99.9)=355.71ms
       { expected_response:true }...: avg=152.23ms min=1.45ms  med=148.33ms max=381.59ms p(90)=298.42ms p(95)=317.86ms p(99.9)=355.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 91973
     http_req_receiving.............: avg=70.64µs  min=28.33µs med=52.44µs  max=27.17ms  p(90)=79.35µs  p(95)=91.48µs  p(99.9)=2.63ms  
     http_req_sending...............: avg=28.64µs  min=5.29µs  med=9.88µs   max=18.81ms  p(90)=14.24µs  p(95)=17.13µs  p(99.9)=3.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=152.13ms min=1.4ms   med=148.19ms max=381.53ms p(90)=298.29ms p(95)=317.76ms p(99.9)=355.65ms
     http_reqs......................: 91973   1489.215457/s
     iteration_duration.............: avg=154.12ms min=1.58ms  med=150.61ms max=381.79ms p(90)=299.12ms p(95)=318.33ms p(99.9)=355.93ms
     iterations.....................: 90973   1473.023581/s
     success_rate...................: 100.00% ✓ 90973       ✗ 0    
     vus............................: 92      min=0         max=500
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 270723      ✗ 0    
     data_received..................: 8.0 GB  130 MB/s
     data_sent......................: 110 MB  1.8 MB/s
     http_req_blocked...............: avg=4.49µs   min=1.12µs  med=2.07µs   max=13.14ms  p(90)=3.18µs   p(95)=3.87µs   p(99.9)=200.73µs
     http_req_connecting............: avg=1.9µs    min=0s      med=0s       max=13.09ms  p(90)=0s       p(95)=0s       p(99.9)=145.66µs
     http_req_duration..............: avg=153.44ms min=1.5ms   med=149.09ms max=391.64ms p(90)=301.97ms p(95)=321.52ms p(99.9)=362.26ms
       { expected_response:true }...: avg=153.44ms min=1.5ms   med=149.09ms max=391.64ms p(90)=301.97ms p(95)=321.52ms p(99.9)=362.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 91242
     http_req_receiving.............: avg=68.93µs  min=29.19µs med=51.51µs  max=21.7ms   p(90)=76.79µs  p(95)=89.08µs  p(99.9)=2.54ms  
     http_req_sending...............: avg=26.44µs  min=5.32µs  med=9.58µs   max=22.8ms   p(90)=13.74µs  p(95)=16.82µs  p(99.9)=3.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=153.35ms min=1.44ms  med=148.98ms max=391.57ms p(90)=301.87ms p(95)=321.45ms p(99.9)=362.19ms
     http_reqs......................: 91242   1478.07103/s
     iteration_duration.............: avg=155.35ms min=1.64ms  med=151.35ms max=391.81ms p(90)=302.56ms p(95)=322ms    p(99.9)=362.69ms
     iterations.....................: 90241   1461.855372/s
     success_rate...................: 100.00% ✓ 90241       ✗ 0    
     vus............................: 91      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.45)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 255078      ✗ 0    
     data_received..................: 7.5 GB  119 MB/s
     data_sent......................: 103 MB  1.6 MB/s
     http_req_blocked...............: avg=7.73µs   min=1.09µs  med=2.36µs  max=32.02ms  p(90)=3.66µs   p(95)=4.47µs   p(99.9)=297.41µs
     http_req_connecting............: avg=4.75µs   min=0s      med=0s      max=31.96ms  p(90)=0s       p(95)=0s       p(99.9)=233.89µs
     http_req_duration..............: avg=163.01ms min=2.72ms  med=70.56ms max=3.7s     p(90)=423.04ms p(95)=605.94ms p(99.9)=2.44s   
       { expected_response:true }...: avg=163.01ms min=2.72ms  med=70.56ms max=3.7s     p(90)=423.04ms p(95)=605.94ms p(99.9)=2.44s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 86026
     http_req_receiving.............: avg=2.28ms   min=53.92µs med=110.4µs max=737.13ms p(90)=2.04ms   p(95)=4.98ms   p(99.9)=186.74ms
     http_req_sending...............: avg=36.34µs  min=5.38µs  med=9.74µs  max=30.63ms  p(90)=15.24µs  p(95)=20.23µs  p(99.9)=5.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=160.69ms min=2.63ms  med=69.27ms max=3.7s     p(90)=416.82ms p(95)=599.14ms p(99.9)=2.44s   
     http_reqs......................: 86026   1361.766088/s
     iteration_duration.............: avg=165.16ms min=2.97ms  med=72.85ms max=3.7s     p(90)=426.18ms p(95)=609.6ms  p(99.9)=2.45s   
     iterations.....................: 85026   1345.936384/s
     success_rate...................: 100.00% ✓ 85026       ✗ 0    
     vus............................: 67      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.45)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 251733      ✗ 0    
     data_received..................: 7.4 GB  119 MB/s
     data_sent......................: 102 MB  1.6 MB/s
     http_req_blocked...............: avg=11.01µs  min=1.01µs  med=2.48µs  max=119.23ms p(90)=4.16µs   p(95)=5.2µs    p(99.9)=434.29µs
     http_req_connecting............: avg=7.71µs   min=0s      med=0s      max=119.17ms p(90)=0s       p(95)=0s       p(99.9)=382.05µs
     http_req_duration..............: avg=165.17ms min=1.89ms  med=84.93ms max=3.19s    p(90)=427.44ms p(95)=567.99ms p(99.9)=1.83s   
       { expected_response:true }...: avg=165.17ms min=1.89ms  med=84.93ms max=3.19s    p(90)=427.44ms p(95)=567.99ms p(99.9)=1.83s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 84911
     http_req_receiving.............: avg=2.28ms   min=52.48µs med=107.9µs max=528.06ms p(90)=1.94ms   p(95)=5.05ms   p(99.9)=250.32ms
     http_req_sending...............: avg=46.99µs  min=5.16µs  med=10.34µs max=63.13ms  p(90)=18.04µs  p(95)=25.76µs  p(99.9)=6.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=162.83ms min=1.79ms  med=83.17ms max=3.19s    p(90)=421.54ms p(95)=561.52ms p(99.9)=1.81s   
     http_reqs......................: 84911   1358.911318/s
     iteration_duration.............: avg=167.41ms min=2.3ms   med=87.75ms max=3.19s    p(90)=430.32ms p(95)=570.22ms p(99.9)=1.84s   
     iterations.....................: 83911   1342.907369/s
     success_rate...................: 100.00% ✓ 83911       ✗ 0    
     vus............................: 81      min=0         max=493
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 94701      ✗ 0    
     data_received..................: 2.9 GB  44 MB/s
     data_sent......................: 39 MB   604 kB/s
     http_req_blocked...............: avg=7.88µs   min=1.17µs  med=3.32µs   max=12.71ms p(90)=5.04µs   p(95)=6.08µs   p(99.9)=246.19µs
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=12.59ms p(90)=0s       p(95)=0s       p(99.9)=179.31µs
     http_req_duration..............: avg=432.79ms min=4.1ms   med=408.02ms max=1.74s   p(90)=865.06ms p(95)=952.81ms p(99.9)=1.35s   
       { expected_response:true }...: avg=432.79ms min=4.1ms   med=408.02ms max=1.74s   p(90)=865.06ms p(95)=952.81ms p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32567
     http_req_receiving.............: avg=85.37µs  min=32.97µs med=78.35µs  max=9.45ms  p(90)=112.07µs p(95)=124.62µs p(99.9)=790.97µs
     http_req_sending...............: avg=23.41µs  min=5.83µs  med=14.13µs  max=7.49ms  p(90)=20.81µs  p(95)=24.42µs  p(99.9)=2.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=432.68ms min=4.04ms  med=407.91ms max=1.74s   p(90)=864.91ms p(95)=952.71ms p(99.9)=1.35s   
     http_reqs......................: 32567   502.464874/s
     iteration_duration.............: avg=446.68ms min=4.4ms   med=425.35ms max=1.75s   p(90)=869.34ms p(95)=956.2ms  p(99.9)=1.36s   
     iterations.....................: 31567   487.036223/s
     success_rate...................: 100.00% ✓ 31567      ✗ 0    
     vus............................: 98      min=0        max=500
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
      ↳  99% — ✓ 24140 / ✗ 46
     ✗ valid response structure
      ↳  99% — ✓ 24185 / ✗ 1

     checks.........................: 99.93% ✓ 72512      ✗ 47   
     data_received..................: 2.2 GB 34 MB/s
     data_sent......................: 30 MB  461 kB/s
     http_req_blocked...............: avg=9.36µs   min=1.26µs  med=3.25µs   max=24.58ms p(90)=4.84µs   p(95)=5.79µs  p(99.9)=255.2µs 
     http_req_connecting............: avg=4.92µs   min=0s      med=0s       max=24.51ms p(90)=0s       p(95)=0s      p(99.9)=185.75µs
     http_req_duration..............: avg=528.21ms min=5.32ms  med=452.25ms max=20.65s  p(90)=932.66ms p(95)=1.05s   p(99.9)=15.48s  
       { expected_response:true }...: avg=528.21ms min=5.32ms  med=452.25ms max=20.65s  p(90)=932.66ms p(95)=1.05s   p(99.9)=15.48s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 25187
     http_req_receiving.............: avg=82.82µs  min=31.71µs med=76µs     max=3.82ms  p(90)=111.45µs p(95)=125.3µs p(99.9)=820.33µs
     http_req_sending...............: avg=23.43µs  min=5.28µs  med=14.07µs  max=8.36ms  p(90)=20.63µs  p(95)=23.85µs p(99.9)=2.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=528.1ms  min=5.23ms  med=452.17ms max=20.65s  p(90)=932.56ms p(95)=1.05s   p(99.9)=15.48s  
     http_reqs......................: 25187  381.845404/s
     iteration_duration.............: avg=550.17ms min=5.58ms  med=470.65ms max=20.65s  p(90)=941.35ms p(95)=1.06s   p(99.9)=15.52s  
     iterations.....................: 24186  366.669827/s
     success_rate...................: 99.80% ✓ 24140      ✗ 46   
     vus............................: 59     min=0        max=498
     vus_max........................: 500    min=500      max=500
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

     checks.........................: 100.00% ✓ 39795      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   251 kB/s
     http_req_blocked...............: avg=10.84µs  min=1.19µs  med=3.09µs   max=27.72ms p(90)=4.78µs   p(95)=6.24µs   p(99.9)=237.38µs
     http_req_connecting............: avg=6.06µs   min=0s      med=0s       max=27.65ms p(90)=0s       p(95)=0s       p(99.9)=172.03µs
     http_req_duration..............: avg=976.49ms min=8.28ms  med=886.35ms max=6.26s   p(90)=1.97s    p(95)=2.19s    p(99.9)=5.28s   
       { expected_response:true }...: avg=976.49ms min=8.28ms  med=886.35ms max=6.26s   p(90)=1.97s    p(95)=2.19s    p(99.9)=5.28s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14265
     http_req_receiving.............: avg=85.01µs  min=31.55µs med=77.71µs  max=1.69ms  p(90)=118.44µs p(95)=133.58µs p(99.9)=886.83µs
     http_req_sending...............: avg=22.7µs   min=5.67µs  med=13.86µs  max=8.1ms   p(90)=20.46µs  p(95)=25.2µs   p(99.9)=2.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=976.38ms min=8.18ms  med=886.23ms max=6.26s   p(90)=1.97s    p(95)=2.19s    p(99.9)=5.28s   
     http_reqs......................: 14265   206.564006/s
     iteration_duration.............: avg=1.04s    min=8.69ms  med=979.49ms max=6.27s   p(90)=1.99s    p(95)=2.21s    p(99.9)=5.3s    
     iterations.....................: 13265   192.083529/s
     success_rate...................: 100.00% ✓ 13265      ✗ 0    
     vus............................: 69      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

