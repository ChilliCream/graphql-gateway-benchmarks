## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hotchocolate (rust subgraphs) | 4115  | 251141 total, 0 failed | avg: 56ms, p95: 137ms  | ❌ non-compatible response structure (250141) |
| hive-router                 | 2174  | 135405 total, 0 failed | avg: 103ms, p95: 256ms | ✅                                        |
| grafbase                    | 1960  | 123489 total, 0 failed | avg: 113ms, p95: 279ms | ✅                                        |
| hotchocolate (.net subgraphs) |  943  | 60162 total, 0 failed  | avg: 233ms, p95: 588ms | ✅                                        |
| cosmo                       |  777  | 49364 total, 0 failed  | avg: 284ms, p95: 639ms | ✅                                        |
| hive-gateway-router-runtime |  540  | 35751 total, 0 failed  | avg: 394ms, p95: 844ms | ❌ non-compatible response structure (3)  |
| apollo-router               |  431  | 28735 total, 0 failed  | avg: 491ms, p95: 1113ms | ❌ non-compatible response structure (28) |
| hive-gateway                |  258  | 17676 total, 0 failed  | avg: 791ms, p95: 1715ms | ✅                                        |
| apollo-gateway              |  103  |  7635 total, 0 failed  | avg: 1575ms, p95: 3062ms | ✅                                        |


<details>
  <summary>Summary for: hotchocolate (rust subgraphs)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  0% — ✓ 0 / ✗ 250141
     ✗ valid response structure
      ↳  99% — ✓ 249641 / ✗ 500

     checks.........................: 66.60% ✓ 499782      ✗ 250641
     data_received..................: 66 MB  1.1 MB/s
     data_sent......................: 293 MB 4.8 MB/s
     http_req_blocked...............: avg=129.88µs min=1.15µs   med=2.84µs  max=250.49ms p(90)=3.81µs   p(95)=4.27µs   p(99.9)=59.5ms  
     http_req_connecting............: avg=126.46µs min=0s       med=0s      max=250.42ms p(90)=0s       p(95)=0s       p(99.9)=59.44ms 
     http_req_duration..............: avg=55.5ms   min=327.68µs med=50.31ms max=286.24ms p(90)=103.59ms p(95)=136.85ms p(99.9)=244.35ms
       { expected_response:true }...: avg=55.5ms   min=327.68µs med=50.31ms max=286.24ms p(90)=103.59ms p(95)=136.85ms p(99.9)=244.35ms
     http_req_failed................: 0.00%  ✓ 0           ✗ 251141
     http_req_receiving.............: avg=243.3µs  min=10.25µs  med=24.37µs max=99.49ms  p(90)=32.6µs   p(95)=46.47µs  p(99.9)=36.39ms 
     http_req_sending...............: avg=100.56µs min=4.61µs   med=11.08µs max=90.53ms  p(90)=13.77µs  p(95)=19.55µs  p(99.9)=21.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=55.15ms  min=293.77µs med=49.99ms max=265.4ms  p(90)=102.94ms p(95)=135.61ms p(99.9)=243.43ms
     http_reqs......................: 251141 4115.715478/s
     iteration_duration.............: avg=55.94ms  min=432.21µs med=50.7ms  max=378.79ms p(90)=104.01ms p(95)=138.36ms p(99.9)=246.32ms
     iterations.....................: 250141 4099.327411/s
     success_rate...................: 0.00%  ✓ 0           ✗ 250141
     vus............................: 63     min=0         max=497 
     vus_max........................: 500    min=500       max=500
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

     checks.........................: 100.00% ✓ 403215      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=275.8µs  min=1.16µs  med=2.3µs   max=287.08ms p(90)=3.54µs   p(95)=4.35µs   p(99.9)=106.27ms
     http_req_connecting............: avg=272.69µs min=0s      med=0s      max=287.02ms p(90)=0s       p(95)=0s       p(99.9)=106.16ms
     http_req_duration..............: avg=102.95ms min=1.8ms   med=92.27ms max=434.03ms p(90)=212.27ms p(95)=255.58ms p(99.9)=353.89ms
       { expected_response:true }...: avg=102.95ms min=1.8ms   med=92.27ms max=434.03ms p(90)=212.27ms p(95)=255.58ms p(99.9)=353.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135405
     http_req_receiving.............: avg=405.71µs min=21.97µs med=40.49µs max=112.37ms p(90)=208.78µs p(95)=375.07µs p(99.9)=62.52ms 
     http_req_sending...............: avg=290.76µs min=4.92µs  med=9.46µs  max=156.6ms  p(90)=31.07µs  p(95)=122.84µs p(99.9)=53.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.26ms min=1.75ms  med=91.65ms max=400.83ms p(90)=210.47ms p(95)=254.16ms p(99.9)=352.29ms
     http_reqs......................: 135405  2174.232742/s
     iteration_duration.............: avg=104.21ms min=1.93ms  med=93.47ms max=589.7ms  p(90)=214.2ms  p(95)=257.2ms  p(99.9)=363.8ms 
     iterations.....................: 134405  2158.175486/s
     success_rate...................: 100.00% ✓ 134405      ✗ 0     
     vus............................: 72      min=0         max=494 
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

     checks.........................: 100.00% ✓ 367467      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=450.76µs min=1.24µs  med=2.88µs   max=351.78ms p(90)=4.29µs   p(95)=5.14µs   p(99.9)=163.67ms
     http_req_connecting............: avg=446.8µs  min=0s      med=0s       max=351.71ms p(90)=0s       p(95)=0s       p(99.9)=163.55ms
     http_req_duration..............: avg=112.71ms min=2.28ms  med=101.77ms max=411.85ms p(90)=232.62ms p(95)=279.23ms p(99.9)=364.75ms
       { expected_response:true }...: avg=112.71ms min=2.28ms  med=101.77ms max=411.85ms p(90)=232.62ms p(95)=279.23ms p(99.9)=364.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 123489
     http_req_receiving.............: avg=528.2µs  min=25.45µs med=47.31µs  max=162.25ms p(90)=114.68µs p(95)=431.1µs  p(99.9)=77.15ms 
     http_req_sending...............: avg=408.26µs min=5.38µs  med=11.59µs  max=136.19ms p(90)=27.76µs  p(95)=137.46µs p(99.9)=70.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.78ms min=2.23ms  med=100.84ms max=380.77ms p(90)=230.53ms p(95)=277.4ms  p(99.9)=360.9ms 
     http_reqs......................: 123489  1960.043575/s
     iteration_duration.............: avg=114.36ms min=2.47ms  med=103.15ms max=786.53ms p(90)=234.83ms p(95)=281.23ms p(99.9)=397.93ms
     iterations.....................: 122489  1944.171363/s
     success_rate...................: 100.00% ✓ 122489      ✗ 0     
     vus............................: 60      min=0         max=498 
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

     checks.........................: 100.00% ✓ 177486     ✗ 0    
     data_received..................: 5.3 GB  83 MB/s
     data_sent......................: 70 MB   1.1 MB/s
     http_req_blocked...............: avg=170.49µs min=1.21µs  med=2.73µs   max=209.36ms p(90)=4.15µs   p(95)=6.34µs   p(99.9)=57.35ms 
     http_req_connecting............: avg=166.54µs min=0s      med=0s       max=209.29ms p(90)=0s       p(95)=0s       p(99.9)=57.21ms 
     http_req_duration..............: avg=233.06ms min=3.17ms  med=195.29ms max=1.1s     p(90)=501.69ms p(95)=588.13ms p(99.9)=933.56ms
       { expected_response:true }...: avg=233.06ms min=3.17ms  med=195.29ms max=1.1s     p(90)=501.69ms p(95)=588.13ms p(99.9)=933.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60162
     http_req_receiving.............: avg=8.65ms   min=54.27µs med=157.47µs max=223.41ms p(90)=28.68ms  p(95)=43.72ms  p(99.9)=145.78ms
     http_req_sending...............: avg=235.58µs min=5.54µs  med=11.12µs  max=159.24ms p(90)=28.7µs   p(95)=129.1µs  p(99.9)=46.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=224.17ms min=3.09ms  med=187.11ms max=1.04s    p(90)=480.05ms p(95)=569.01ms p(99.9)=913.07ms
     http_reqs......................: 60162   943.865411/s
     iteration_duration.............: avg=237.49ms min=3.3ms   med=201.45ms max=1.1s     p(90)=505.3ms  p(95)=591.08ms p(99.9)=936.3ms 
     iterations.....................: 59162   928.176681/s
     success_rate...................: 100.00% ✓ 59162      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 145092     ✗ 0    
     data_received..................: 4.3 GB  68 MB/s
     data_sent......................: 58 MB   906 kB/s
     http_req_blocked...............: avg=80.52µs  min=1.22µs  med=2.76µs   max=198.56ms p(90)=4.12µs   p(95)=5.51µs   p(99.9)=20.47ms 
     http_req_connecting............: avg=75.93µs  min=0s      med=0s       max=198.47ms p(90)=0s       p(95)=0s       p(99.9)=20.34ms 
     http_req_duration..............: avg=284.41ms min=2.73ms  med=266.93ms max=1.35s    p(90)=567.6ms  p(95)=638.79ms p(99.9)=1.04s   
       { expected_response:true }...: avg=284.41ms min=2.73ms  med=266.93ms max=1.35s    p(90)=567.6ms  p(95)=638.79ms p(99.9)=1.04s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 49364
     http_req_receiving.............: avg=1.26ms   min=29.35µs med=66.16µs  max=317.81ms p(90)=204.8µs  p(95)=442.15µs p(99.9)=242.63ms
     http_req_sending...............: avg=116.3µs  min=5.88µs  med=11.02µs  max=111.11ms p(90)=25.91µs  p(95)=123.84µs p(99.9)=26.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=283.04ms min=2.66ms  med=266.31ms max=1.35s    p(90)=563.58ms p(95)=633.72ms p(99.9)=1.04s   
     http_reqs......................: 49364   777.101111/s
     iteration_duration.............: avg=290.69ms min=2.92ms  med=274.48ms max=1.35s    p(90)=570.7ms  p(95)=641.87ms p(99.9)=1.05s   
     iterations.....................: 48364   761.358847/s
     success_rate...................: 100.00% ✓ 48364      ✗ 0    
     vus............................: 85      min=0        max=499
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
      ↳  99% — ✓ 34748 / ✗ 3

     checks.........................: 99.99% ✓ 104250     ✗ 3    
     data_received..................: 3.1 GB 48 MB/s
     data_sent......................: 42 MB  631 kB/s
     http_req_blocked...............: avg=85.73µs  min=1.2µs   med=2.68µs   max=108.06ms p(90)=4.2µs    p(95)=5.68µs   p(99.9)=23.03ms
     http_req_connecting............: avg=81.06µs  min=0s      med=0s       max=107.98ms p(90)=0s       p(95)=0s       p(99.9)=22.12ms
     http_req_duration..............: avg=393.57ms min=5.15ms  med=371.95ms max=1.66s    p(90)=754.29ms p(95)=844.46ms p(99.9)=1.37s  
       { expected_response:true }...: avg=393.57ms min=5.15ms  med=371.95ms max=1.66s    p(90)=754.29ms p(95)=844.46ms p(99.9)=1.37s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 35751
     http_req_receiving.............: avg=144.4µs  min=26.04µs med=44.17µs  max=101.16ms p(90)=85.3µs   p(95)=121.73µs p(99.9)=24.07ms
     http_req_sending...............: avg=142.16µs min=5.46µs  med=10.64µs  max=87.92ms  p(90)=21.45µs  p(95)=63.62µs  p(99.9)=28.47ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=393.28ms min=5.11ms  med=371.75ms max=1.66s    p(90)=754.02ms p(95)=843.98ms p(99.9)=1.37s  
     http_reqs......................: 35751  540.832275/s
     iteration_duration.............: avg=405.22ms min=5.6ms   med=383.39ms max=1.71s    p(90)=757.96ms p(95)=848.06ms p(99.9)=1.37s  
     iterations.....................: 34751  525.704523/s
     success_rate...................: 99.99% ✓ 34748      ✗ 3    
     vus............................: 67     min=0        max=496
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
      ↳  99% — ✓ 27707 / ✗ 28
     ✗ valid response structure
      ↳  99% — ✓ 27734 / ✗ 1

     checks.........................: 99.96% ✓ 83176      ✗ 29   
     data_received..................: 2.5 GB 38 MB/s
     data_sent......................: 34 MB  504 kB/s
     http_req_blocked...............: avg=77.59µs  min=1.74µs  med=2.85µs   max=128.77ms p(90)=4.58µs   p(95)=6.16µs  p(99.9)=21.96ms
     http_req_connecting............: avg=73.26µs  min=0s      med=0s       max=128.72ms p(90)=0s       p(95)=0s      p(99.9)=21.89ms
     http_req_duration..............: avg=490.64ms min=5.68ms  med=442.34ms max=2.72s    p(90)=997.9ms  p(95)=1.11s   p(99.9)=1.87s  
       { expected_response:true }...: avg=490.64ms min=5.68ms  med=442.34ms max=2.72s    p(90)=997.9ms  p(95)=1.11s   p(99.9)=1.87s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 28735
     http_req_receiving.............: avg=112.03µs min=32.88µs med=52.49µs  max=109.79ms p(90)=95.15µs  p(95)=140.1µs p(99.9)=7.55ms 
     http_req_sending...............: avg=122.43µs min=6.95µs  med=11.35µs  max=77.66ms  p(90)=22.71µs  p(95)=115.8µs p(99.9)=29.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=490.41ms min=5.63ms  med=442.2ms  max=2.72s    p(90)=997.47ms p(95)=1.11s   p(99.9)=1.87s  
     http_reqs......................: 28735  431.364757/s
     iteration_duration.............: avg=508.66ms min=5.79ms  med=464.02ms max=2.72s    p(90)=1s       p(95)=1.11s   p(99.9)=1.87s  
     iterations.....................: 27735  416.352933/s
     success_rate...................: 99.89% ✓ 27707      ✗ 28   
     vus............................: 90     min=0        max=500
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

     checks.........................: 100.00% ✓ 50028      ✗ 0    
     data_received..................: 1.6 GB  23 MB/s
     data_sent......................: 21 MB   304 kB/s
     http_req_blocked...............: avg=70.12µs  min=1.24µs  med=2.68µs   max=114.61ms p(90)=4.5µs   p(95)=6.43µs   p(99.9)=20.6ms 
     http_req_connecting............: avg=64.48µs  min=0s      med=0s       max=101.09ms p(90)=0s      p(95)=0s       p(99.9)=20.54ms
     http_req_duration..............: avg=790.78ms min=6.93ms  med=731.77ms max=5.88s    p(90)=1.59s   p(95)=1.71s    p(99.9)=4.85s  
       { expected_response:true }...: avg=790.78ms min=6.93ms  med=731.77ms max=5.88s    p(90)=1.59s   p(95)=1.71s    p(99.9)=4.85s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17676
     http_req_receiving.............: avg=117.99µs min=26.15µs med=44.33µs  max=83.64ms  p(90)=88.13µs p(95)=122.24µs p(99.9)=14.16ms
     http_req_sending...............: avg=148.26µs min=5.53µs  med=10.92µs  max=108.14ms p(90)=25.71µs p(95)=70.49µs  p(99.9)=24.25ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=790.52ms min=6.88ms  med=731.7ms  max=5.87s    p(90)=1.59s   p(95)=1.71s    p(99.9)=4.85s  
     http_reqs......................: 17676   258.433239/s
     iteration_duration.............: avg=838.35ms min=7.13ms  med=791.55ms max=5.98s    p(90)=1.62s   p(95)=1.72s    p(99.9)=4.86s  
     iterations.....................: 16676   243.812666/s
     success_rate...................: 100.00% ✓ 16676      ✗ 0    
     vus............................: 86      min=0        max=500
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

     checks.........................: 100.00% ✓ 19905      ✗ 0    
     data_received..................: 671 MB  9.1 MB/s
     data_sent......................: 9.3 MB  127 kB/s
     http_req_blocked...............: avg=25.16µs min=1.41µs  med=3.56µs  max=20.41ms p(90)=5.72µs  p(95)=9.21µs   p(99.9)=1.09ms  
     http_req_connecting............: avg=19.14µs min=0s      med=0s      max=20.34ms p(90)=0s      p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=1.57s   min=11.88ms med=1.56s   max=21.31s  p(90)=2.79s   p(95)=3.06s    p(99.9)=20.06s  
       { expected_response:true }...: avg=1.57s   min=11.88ms med=1.56s   max=21.31s  p(90)=2.79s   p(95)=3.06s    p(99.9)=20.06s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7635 
     http_req_receiving.............: avg=73.3µs  min=29.49µs med=61.69µs max=4.02ms  p(90)=99.61µs p(95)=117.23µs p(99.9)=937.56µs
     http_req_sending...............: avg=28.86µs min=5.95µs  med=13.85µs max=11.38ms p(90)=24.63µs p(95)=45.13µs  p(99.9)=4.54ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.57s   min=11.83ms med=1.56s   max=21.31s  p(90)=2.79s   p(95)=3.06s    p(99.9)=20.06s  
     http_reqs......................: 7635    103.746717/s
     iteration_duration.............: avg=1.81s   min=12.81ms med=1.77s   max=21.33s  p(90)=2.84s   p(95)=3.14s    p(99.9)=20.11s  
     iterations.....................: 6635    90.158411/s
     success_rate...................: 100.00% ✓ 6635       ✗ 0    
     vus............................: 116     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

