## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 10 times (120s each) and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **120s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| cosmo                       | 3082  | 194739 total, 0 failed | avg: 72ms, p95: 191ms  | ✅                                        |
| hive-router                 | 2626  | 163222 total, 0 failed | avg: 86ms, p95: 209ms  | ✅                                        |
| grafbase                    | 2377  | 151892 total, 0 failed | avg: 92ms, p95: 226ms  | ✅                                        |
| hotchocolate (.net subgraphs) |  919  | 58311 total, 0 failed  | avg: 241ms, p95: 755ms | ✅                                        |
| hotchocolate (rust subgraphs) |  895  | 57408 total, 0 failed  | avg: 245ms, p95: 729ms | ✅                                        |
| hive-gateway-router-runtime |  596  | 39342 total, 0 failed  | avg: 358ms, p95: 788ms | ❌ non-compatible response structure (5)  |
| apollo-router               |  457  | 30532 total, 0 failed  | avg: 462ms, p95: 1062ms | ❌ non-compatible response structure (26) |
| hive-gateway                |  271  | 18558 total, 0 failed  | avg: 755ms, p95: 1658ms | ✅                                        |
| apollo-gateway              |  105  |  7809 total, 0 failed  | avg: 1543ms, p95: 2993ms | ✅                                        |


<details>
  <summary>Summary for: cosmo</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 581217      ✗ 0     
     data_received..................: 17 GB   271 MB/s
     data_sent......................: 227 MB  3.6 MB/s
     http_req_blocked...............: avg=208.83µs min=1.1µs    med=1.6µs   max=247.24ms p(90)=2.46µs   p(95)=2.99µs   p(99.9)=90.99ms 
     http_req_connecting............: avg=206.52µs min=0s       med=0s      max=247.21ms p(90)=0s       p(95)=0s       p(99.9)=90.94ms 
     http_req_duration..............: avg=71.55ms  min=347.2µs  med=62.11ms max=282.83ms p(90)=157.54ms p(95)=191.35ms p(99.9)=248.61ms
       { expected_response:true }...: avg=71.55ms  min=347.2µs  med=62.11ms max=282.83ms p(90)=157.54ms p(95)=191.35ms p(99.9)=248.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194739
     http_req_receiving.............: avg=344.43µs min=20.85µs  med=31.06µs max=107.46ms p(90)=202.88µs p(95)=298.63µs p(99.9)=50.59ms 
     http_req_sending...............: avg=187.95µs min=4.48µs   med=6.46µs  max=97.85ms  p(90)=17.59µs  p(95)=94.59µs  p(99.9)=39.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=71.01ms  min=313.14µs med=61.58ms max=268.3ms  p(90)=156.22ms p(95)=190.32ms p(99.9)=247.5ms 
     http_reqs......................: 194739  3082.982021/s
     iteration_duration.............: avg=72.25ms  min=433.04µs med=62.68ms max=486.58ms p(90)=158.71ms p(95)=192.33ms p(99.9)=257.27ms
     iterations.....................: 193739  3067.150667/s
     success_rate...................: 100.00% ✓ 193739      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 486666      ✗ 0     
     data_received..................: 14 GB   230 MB/s
     data_sent......................: 190 MB  3.1 MB/s
     http_req_blocked...............: avg=112.22µs min=1.12µs  med=1.61µs  max=142.6ms  p(90)=2.49µs   p(95)=3.1µs    p(99.9)=50.37ms 
     http_req_connecting............: avg=109.69µs min=0s      med=0s      max=142.53ms p(90)=0s       p(95)=0s       p(99.9)=50.15ms 
     http_req_duration..............: avg=85.53ms  min=1.54ms  med=77.01ms max=350.75ms p(90)=174.12ms p(95)=208.87ms p(99.9)=298.73ms
       { expected_response:true }...: avg=85.53ms  min=1.54ms  med=77.01ms max=350.75ms p(90)=174.12ms p(95)=208.87ms p(99.9)=298.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163222
     http_req_receiving.............: avg=251.49µs min=20.56µs med=30.73µs max=100.96ms p(90)=176.81µs p(95)=293.86µs p(99.9)=41.68ms 
     http_req_sending...............: avg=159.95µs min=4.67µs  med=6.67µs  max=103.85ms p(90)=22.66µs  p(95)=96.06µs  p(99.9)=36.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.12ms  min=1.49ms  med=76.71ms max=350.71ms p(90)=173.15ms p(95)=207.8ms  p(99.9)=296.52ms
     http_reqs......................: 163222  2626.013841/s
     iteration_duration.............: avg=86.31ms  min=1.66ms  med=77.68ms max=418.27ms p(90)=175.05ms p(95)=209.68ms p(99.9)=299.6ms 
     iterations.....................: 162222  2609.925239/s
     success_rate...................: 100.00% ✓ 162222      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 452676      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.8 MB/s
     http_req_blocked...............: avg=129.32µs min=1.15µs  med=1.69µs  max=170.29ms p(90)=2.82µs   p(95)=3.67µs   p(99.9)=55.24ms 
     http_req_connecting............: avg=126.6µs  min=0s      med=0s      max=170.23ms p(90)=0s       p(95)=0s       p(99.9)=55.19ms 
     http_req_duration..............: avg=91.92ms  min=2.55ms  med=82.11ms max=411.57ms p(90)=185.68ms p(95)=226.42ms p(99.9)=325.87ms
       { expected_response:true }...: avg=91.92ms  min=2.55ms  med=82.11ms max=411.57ms p(90)=185.68ms p(95)=226.42ms p(99.9)=325.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151892
     http_req_receiving.............: avg=264.5µs  min=24.66µs med=33.82µs max=93.69ms  p(90)=187µs    p(95)=312.18µs p(99.9)=44.39ms 
     http_req_sending...............: avg=165.94µs min=4.98µs  med=7.04µs  max=98.21ms  p(90)=28.91µs  p(95)=102.37µs p(99.9)=36.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.49ms  min=2.47ms  med=81.77ms max=379ms    p(90)=184.85ms p(95)=225.51ms p(99.9)=324.99ms
     http_reqs......................: 151892  2377.512468/s
     iteration_duration.............: avg=92.8ms   min=2.69ms  med=82.85ms max=411.68ms p(90)=186.83ms p(95)=227.29ms p(99.9)=327.9ms 
     iterations.....................: 150892  2361.859817/s
     success_rate...................: 100.00% ✓ 150892      ✗ 0     
     vus............................: 55      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 171933     ✗ 0    
     data_received..................: 5.1 GB  81 MB/s
     data_sent......................: 68 MB   1.1 MB/s
     http_req_blocked...............: avg=45.49µs  min=1.17µs  med=1.99µs   max=101.63ms p(90)=3.44µs   p(95)=4.59µs   p(99.9)=10.67ms 
     http_req_connecting............: avg=42.63µs  min=0s      med=0s       max=101.56ms p(90)=0s       p(95)=0s       p(99.9)=10.62ms 
     http_req_duration..............: avg=240.81ms min=2.87ms  med=142.71ms max=3.35s    p(90)=576.02ms p(95)=755.48ms p(99.9)=2.31s   
       { expected_response:true }...: avg=240.81ms min=2.87ms  med=142.71ms max=3.35s    p(90)=576.02ms p(95)=755.48ms p(99.9)=2.31s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 58311
     http_req_receiving.............: avg=13.39ms  min=49.05µs med=86.43µs  max=1.49s    p(90)=8.78ms   p(95)=61.21ms  p(99.9)=843.18ms
     http_req_sending...............: avg=86.41µs  min=5.05µs  med=7.94µs   max=83.89ms  p(90)=15.48µs  p(95)=51.99µs  p(99.9)=17.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=227.33ms min=2.8ms   med=137.9ms  max=3.07s    p(90)=542.18ms p(95)=700.08ms p(99.9)=2.24s   
     http_reqs......................: 58311   919.238641/s
     iteration_duration.............: avg=245.23ms min=3.14ms  med=147.85ms max=3.35s    p(90)=579.66ms p(95)=760.54ms p(99.9)=2.31s   
     iterations.....................: 57311   903.474228/s
     success_rate...................: 100.00% ✓ 57311      ✗ 0    
     vus............................: 82      min=0        max=498
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 169224     ✗ 0    
     data_received..................: 5.0 GB  79 MB/s
     data_sent......................: 67 MB   1.0 MB/s
     http_req_blocked...............: avg=30.26µs  min=1.15µs  med=2.06µs   max=106.49ms p(90)=3.44µs   p(95)=4.45µs   p(99.9)=6.96ms  
     http_req_connecting............: avg=27.38µs  min=0s      med=0s       max=106.43ms p(90)=0s       p(95)=0s       p(99.9)=6.83ms  
     http_req_duration..............: avg=244.74ms min=3.51ms  med=172.72ms max=2.24s    p(90)=566.49ms p(95)=728.8ms  p(99.9)=1.36s   
       { expected_response:true }...: avg=244.74ms min=3.51ms  med=172.72ms max=2.24s    p(90)=566.49ms p(95)=728.8ms  p(99.9)=1.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 57408
     http_req_receiving.............: avg=7.69ms   min=50.19µs med=88.63µs  max=1s       p(90)=4.74ms   p(95)=33.1ms   p(99.9)=473.48ms
     http_req_sending...............: avg=60.75µs  min=5.38µs  med=8.09µs   max=83.97ms  p(90)=14.95µs  p(95)=37.99µs  p(99.9)=10.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=236.98ms min=3.44ms  med=170.83ms max=2.01s    p(90)=542.9ms  p(95)=691.79ms p(99.9)=1.31s   
     http_reqs......................: 57408   895.752709/s
     iteration_duration.............: avg=249.26ms min=3.75ms  med=177.14ms max=2.24s    p(90)=572.48ms p(95)=732.12ms p(99.9)=1.36s   
     iterations.....................: 56408   880.149435/s
     success_rate...................: 100.00% ✓ 56408      ✗ 0    
     vus............................: 66      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✗ valid response structure
      ↳  99% — ✓ 38337 / ✗ 5

     checks.........................: 99.99% ✓ 115021     ✗ 5    
     data_received..................: 3.5 GB 52 MB/s
     data_sent......................: 46 MB  696 kB/s
     http_req_blocked...............: avg=37.54µs  min=1.18µs  med=1.64µs   max=98.33ms p(90)=2.74µs   p(95)=3.65µs   p(99.9)=8.4ms  
     http_req_connecting............: avg=34.76µs  min=0s      med=0s       max=93.2ms  p(90)=0s       p(95)=0s       p(99.9)=8.35ms 
     http_req_duration..............: avg=357.75ms min=5.07ms  med=336.49ms max=1.33s   p(90)=707.08ms p(95)=788.37ms p(99.9)=1.15s  
       { expected_response:true }...: avg=357.75ms min=5.07ms  med=336.49ms max=1.33s   p(90)=707.08ms p(95)=788.37ms p(99.9)=1.15s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 39342
     http_req_receiving.............: avg=79.26µs  min=23.15µs med=31.55µs  max=85.3ms  p(90)=61.81µs  p(95)=87.6µs   p(99.9)=8.86ms 
     http_req_sending...............: avg=78.71µs  min=5.13µs  med=6.82µs   max=85.37ms p(90)=14.05µs  p(95)=44.73µs  p(99.9)=14.48ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=357.59ms min=5.03ms  med=336.42ms max=1.33s   p(90)=706.91ms p(95)=787.88ms p(99.9)=1.15s  
     http_reqs......................: 39342  596.301432/s
     iteration_duration.............: avg=367.18ms min=5.4ms   med=344.52ms max=1.34s   p(90)=710.56ms p(95)=791.02ms p(99.9)=1.15s  
     iterations.....................: 38342  581.144566/s
     success_rate...................: 99.98% ✓ 38337      ✗ 5    
     vus............................: 61     min=0        max=497
     vus_max........................: 500    min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  99% — ✓ 29506 / ✗ 26
     ✓ valid response structure

     checks.........................: 99.97% ✓ 88570      ✗ 26   
     data_received..................: 2.7 GB 40 MB/s
     data_sent......................: 36 MB  534 kB/s
     http_req_blocked...............: avg=14.95µs  min=1.21µs  med=1.85µs   max=59.89ms p(90)=3.08µs   p(95)=3.94µs  p(99.9)=1.01ms  
     http_req_connecting............: avg=12.03µs  min=0s      med=0s       max=59.84ms p(90)=0s       p(95)=0s      p(99.9)=982.88µs
     http_req_duration..............: avg=461.83ms min=5.99ms  med=430.89ms max=1.73s   p(90)=938.13ms p(95)=1.06s   p(99.9)=1.49s   
       { expected_response:true }...: avg=461.83ms min=5.99ms  med=430.89ms max=1.73s   p(90)=938.13ms p(95)=1.06s   p(99.9)=1.49s   
     http_req_failed................: 0.00%  ✓ 0          ✗ 30532
     http_req_receiving.............: avg=54.43µs  min=24.03µs med=37.16µs  max=29.14ms p(90)=64.85µs  p(95)=80.19µs p(99.9)=912.56µs
     http_req_sending...............: avg=35.24µs  min=5.44µs  med=7.67µs   max=28.87ms p(90)=13.28µs  p(95)=29.6µs  p(99.9)=6.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=461.74ms min=5.95ms  med=430.75ms max=1.73s   p(90)=938.04ms p(95)=1.06s   p(99.9)=1.49s   
     http_reqs......................: 30532  457.278778/s
     iteration_duration.............: avg=477.51ms min=6.28ms  med=450.32ms max=1.73s   p(90)=943.97ms p(95)=1.06s   p(99.9)=1.5s    
     iterations.....................: 29532  442.301745/s
     success_rate...................: 99.91% ✓ 29506      ✗ 26   
     vus............................: 100    min=0        max=500
     vus_max........................: 500    min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 52674      ✗ 0    
     data_received..................: 1.6 GB  24 MB/s
     data_sent......................: 22 MB   319 kB/s
     http_req_blocked...............: avg=31.68µs  min=1.17µs  med=1.67µs   max=72.81ms p(90)=3µs     p(95)=4.16µs  p(99.9)=7.53ms 
     http_req_connecting............: avg=28.64µs  min=0s      med=0s       max=72.7ms  p(90)=0s      p(95)=0s      p(99.9)=7.5ms  
     http_req_duration..............: avg=754.67ms min=6.76ms  med=716.99ms max=5.45s   p(90)=1.5s    p(95)=1.65s   p(99.9)=4.5s   
       { expected_response:true }...: avg=754.67ms min=6.76ms  med=716.99ms max=5.45s   p(90)=1.5s    p(95)=1.65s   p(99.9)=4.5s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 18558
     http_req_receiving.............: avg=79.39µs  min=22.57µs med=31.82µs  max=52.06ms p(90)=64.37µs p(95)=92.36µs p(99.9)=10.13ms
     http_req_sending...............: avg=70.98µs  min=5.18µs  med=6.87µs   max=39.06ms p(90)=16.36µs p(95)=46.38µs p(99.9)=11.68ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=754.52ms min=6.7ms   med=716.86ms max=5.45s   p(90)=1.5s    p(95)=1.65s   p(99.9)=4.5s   
     http_reqs......................: 18558   271.43928/s
     iteration_duration.............: avg=797.51ms min=7.08ms  med=761.33ms max=5.46s   p(90)=1.51s   p(95)=1.66s   p(99.9)=4.54s  
     iterations.....................: 17558   256.812743/s
     success_rate...................: 100.00% ✓ 17558      ✗ 0    
     vus............................: 83      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 20427      ✗ 0    
     data_received..................: 686 MB  9.3 MB/s
     data_sent......................: 9.5 MB  129 kB/s
     http_req_blocked...............: avg=17.46µs min=1.32µs  med=2.51µs  max=22.37ms  p(90)=4.19µs  p(95)=7.97µs  p(99.9)=559.81µs
     http_req_connecting............: avg=12.65µs min=0s      med=0s      max=22.31ms  p(90)=0s      p(95)=0s      p(99.9)=519.57µs
     http_req_duration..............: avg=1.54s   min=12.06ms med=1.5s    max=21.04s   p(90)=2.57s   p(95)=2.99s   p(99.9)=19.51s  
       { expected_response:true }...: avg=1.54s   min=12.06ms med=1.5s    max=21.04s   p(90)=2.57s   p(95)=2.99s   p(99.9)=19.51s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7809 
     http_req_receiving.............: avg=57.42µs min=27.4µs  med=47.63µs max=818.26µs p(90)=82.4µs  p(95)=95.78µs p(99.9)=474.5µs 
     http_req_sending...............: avg=26.22µs min=6µs     med=9.93µs  max=6.79ms   p(90)=18.43µs p(95)=41.12µs p(99.9)=5.08ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=1.54s   min=12.01ms med=1.5s    max=21.04s   p(90)=2.57s   p(95)=2.99s   p(99.9)=19.51s  
     http_reqs......................: 7809    105.800838/s
     iteration_duration.............: avg=1.76s   min=12.8ms  med=1.74s   max=21.05s   p(90)=2.62s   p(95)=3.03s   p(99.9)=19.75s  
     iterations.....................: 6809    92.252261/s
     success_rate...................: 100.00% ✓ 6809       ✗ 0    
     vus............................: 79      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

