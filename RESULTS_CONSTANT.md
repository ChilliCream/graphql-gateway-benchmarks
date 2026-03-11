## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router                 | 2011  | 121148 total, 0 failed |  avg: 25ms, p95: 42ms  | ✅                                        |
| grafbase                    | 1875  | 113096 total, 0 failed |  avg: 26ms, p95: 48ms  | ✅                                        |
| hotchocolate (rust subgraphs) |  928  | 56099 total, 0 failed  | avg: 53ms, p95: 147ms  | ✅                                        |
| hotchocolate (.net subgraphs) |  855  | 51639 total, 0 failed  | avg: 58ms, p95: 167ms  | ✅                                        |
| cosmo                       |  760  | 45922 total, 0 failed  |  avg: 65ms, p95: 95ms  | ✅                                        |
| hive-gateway-router-runtime |  532  | 32324 total, 0 failed  | avg: 93ms, p95: 128ms  | ❌ non-compatible response structure (1)  |
| apollo-router               |  386  | 23509 total, 0 failed  | avg: 128ms, p95: 166ms | ✅                                        |
| hive-gateway                |  269  | 16420 total, 0 failed  | avg: 183ms, p95: 255ms | ✅                                        |
| apollo-gateway              |   71  |  4422 total, 0 failed  | avg: 682ms, p95: 802ms | ✅                                        |


<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 363144      ✗ 0     
     data_received..................: 11 GB   176 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=7.06µs  min=1.22µs med=2.42µs  max=18.78ms  p(90)=3.44µs   p(95)=4.05µs   p(99.9)=60.95µs
     http_req_connecting............: avg=4.03µs  min=0s     med=0s      max=18.64ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.56ms min=1.91ms med=22.69ms max=413.48ms p(90)=36.68ms  p(95)=41.7ms   p(99.9)=72.08ms
       { expected_response:true }...: avg=24.56ms min=1.91ms med=22.69ms max=413.48ms p(90)=36.68ms  p(95)=41.7ms   p(99.9)=72.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 121148
     http_req_receiving.............: avg=99.78µs min=24µs   med=41.45µs max=40.53ms  p(90)=118.65µs p(95)=306.91µs p(99.9)=8.24ms 
     http_req_sending...............: avg=68.97µs min=5.03µs med=9.62µs  max=182.64ms p(90)=58.43µs  p(95)=124.93µs p(99.9)=8.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.4ms  min=1.87ms med=22.55ms max=411.75ms p(90)=36.42ms  p(95)=41.43ms  p(99.9)=70.95ms
     http_reqs......................: 121148  2011.261396/s
     iteration_duration.............: avg=24.77ms min=3.69ms med=22.87ms max=442.08ms p(90)=36.86ms  p(95)=41.88ms  p(99.9)=72.58ms
     iterations.....................: 121048  2009.601228/s
     success_rate...................: 100.00% ✓ 121048      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 338988      ✗ 0     
     data_received..................: 9.9 GB  165 MB/s
     data_sent......................: 132 MB  2.2 MB/s
     http_req_blocked...............: avg=9.7µs    min=1.31µs  med=2.98µs  max=19.59ms  p(90)=4.39µs   p(95)=5.22µs   p(99.9)=115.73µs
     http_req_connecting............: avg=6.05µs   min=0s      med=0s      max=19.43ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=26.29ms  min=2.61ms  med=23.29ms max=466.01ms p(90)=41.88ms  p(95)=47.74ms  p(99.9)=77.99ms 
       { expected_response:true }...: avg=26.29ms  min=2.61ms  med=23.29ms max=466.01ms p(90)=41.88ms  p(95)=47.74ms  p(99.9)=77.99ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 113096
     http_req_receiving.............: avg=137.75µs min=25.83µs med=50.11µs max=38.19ms  p(90)=183.75µs p(95)=412.55µs p(99.9)=12.15ms 
     http_req_sending...............: avg=100µs    min=6.05µs  med=11.98µs max=318.83ms p(90)=90.39µs  p(95)=151.24µs p(99.9)=14.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=26.05ms  min=2.55ms  med=23.12ms max=462.2ms  p(90)=41.45ms  p(95)=47.31ms  p(99.9)=76ms    
     http_reqs......................: 113096  1875.110095/s
     iteration_duration.............: avg=26.53ms  min=4.33ms  med=23.5ms  max=492.51ms p(90)=42.12ms  p(95)=47.96ms  p(99.9)=78.5ms  
     iterations.....................: 112996  1873.452114/s
     success_rate...................: 100.00% ✓ 112996      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 167997     ✗ 0    
     data_received..................: 4.9 GB  81 MB/s
     data_sent......................: 65 MB   1.1 MB/s
     http_req_blocked...............: avg=15.22µs min=1.26µs  med=2.8µs   max=19.75ms  p(90)=3.77µs   p(95)=4.31µs   p(99.9)=121.12µs
     http_req_connecting............: avg=11.71µs min=0s      med=0s      max=19.62ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=53.25ms min=3.27ms  med=36.86ms max=481.9ms  p(90)=113.74ms p(95)=147.25ms p(99.9)=335.79ms
       { expected_response:true }...: avg=53.25ms min=3.27ms  med=36.86ms max=481.9ms  p(90)=113.74ms p(95)=147.25ms p(99.9)=335.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 56099
     http_req_receiving.............: avg=1.62ms  min=51.51µs med=102.4µs max=376.53ms p(90)=2.33ms   p(95)=6.87ms   p(99.9)=107.36ms
     http_req_sending...............: avg=57.29µs min=5.61µs  med=11.17µs max=320.9ms  p(90)=18.68µs  p(95)=125.07µs p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=51.57ms min=3.18ms  med=35.58ms max=468.11ms p(90)=110.28ms p(95)=143.39ms p(99.9)=328.35ms
     http_reqs......................: 56099   928.68208/s
     iteration_duration.............: avg=53.57ms min=3.74ms  med=37.14ms max=515.8ms  p(90)=114.06ms p(95)=147.65ms p(99.9)=343.46ms
     iterations.....................: 55999   927.026645/s
     success_rate...................: 100.00% ✓ 55999      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 154617     ✗ 0    
     data_received..................: 4.5 GB  75 MB/s
     data_sent......................: 60 MB   997 kB/s
     http_req_blocked...............: avg=17.45µs min=1.38µs  med=2.97µs   max=21.22ms  p(90)=4.15µs   p(95)=4.84µs   p(99.9)=136.6µs 
     http_req_connecting............: avg=13.62µs min=0s      med=0s       max=21.2ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=57.86ms min=2.64ms  med=38.11ms  max=610.44ms p(90)=127.75ms p(95)=166.93ms p(99.9)=424.25ms
       { expected_response:true }...: avg=57.86ms min=2.64ms  med=38.11ms  max=610.44ms p(90)=127.75ms p(95)=166.93ms p(99.9)=424.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51639
     http_req_receiving.............: avg=1.71ms  min=53.77µs med=109.97µs max=277.16ms p(90)=2.41ms   p(95)=6.67ms   p(99.9)=118.54ms
     http_req_sending...............: avg=68.89µs min=5.35µs  med=11.5µs   max=394.41ms p(90)=19.99µs  p(95)=124.39µs p(99.9)=3.47ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=56.07ms min=2.55ms  med=36.63ms  max=610.33ms p(90)=124.23ms p(95)=162.35ms p(99.9)=420.46ms
     http_reqs......................: 51639   855.630469/s
     iteration_duration.............: avg=58.21ms min=3ms     med=38.41ms  max=610.66ms p(90)=128.12ms p(95)=167.37ms p(99.9)=428.13ms
     iterations.....................: 51539   853.973523/s
     success_rate...................: 100.00% ✓ 51539      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 137466     ✗ 0    
     data_received..................: 4.0 GB  67 MB/s
     data_sent......................: 54 MB   886 kB/s
     http_req_blocked...............: avg=8.82µs   min=1.34µs  med=2.67µs  max=10.15ms  p(90)=3.77µs   p(95)=4.47µs   p(99.9)=773.86µs
     http_req_connecting............: avg=5.58µs   min=0s      med=0s      max=10.12ms  p(90)=0s       p(95)=0s       p(99.9)=740.69µs
     http_req_duration..............: avg=65.1ms   min=2.64ms  med=64.21ms max=490.68ms p(90)=87.96ms  p(95)=94.94ms  p(99.9)=253.35ms
       { expected_response:true }...: avg=65.1ms   min=2.64ms  med=64.21ms max=490.68ms p(90)=87.96ms  p(95)=94.94ms  p(99.9)=253.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45922
     http_req_receiving.............: avg=147.53µs min=28.78µs med=70.45µs max=36.85ms  p(90)=149.34µs p(95)=358.74µs p(99.9)=13.36ms 
     http_req_sending...............: avg=76.17µs  min=5.52µs  med=10.82µs max=414.13ms p(90)=28.67µs  p(95)=126.91µs p(99.9)=6.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=64.88ms  min=2.55ms  med=64.02ms max=478.47ms p(90)=87.74ms  p(95)=94.72ms  p(99.9)=239.33ms
     http_reqs......................: 45922   760.616392/s
     iteration_duration.............: avg=65.48ms  min=4.8ms   med=64.45ms max=530.88ms p(90)=88.18ms  p(95)=95.17ms  p(99.9)=272.75ms
     iterations.....................: 45822   758.96007/s
     success_rate...................: 100.00% ✓ 45822      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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
      ↳  99% — ✓ 32223 / ✗ 1

     checks.........................: 99.99% ✓ 96671      ✗ 1    
     data_received..................: 2.8 GB 47 MB/s
     data_sent......................: 38 MB  620 kB/s
     http_req_blocked...............: avg=22.22µs min=1.23µs  med=2.87µs  max=22.32ms  p(90)=4.26µs   p(95)=5.13µs   p(99.9)=9.33ms  
     http_req_connecting............: avg=18.26µs min=0s      med=0s      max=22.18ms  p(90)=0s       p(95)=0s       p(99.9)=8.98ms  
     http_req_duration..............: avg=92.67ms min=5.42ms  med=90.06ms max=545.45ms p(90)=112.97ms p(95)=128.41ms p(99.9)=324.55ms
       { expected_response:true }...: avg=92.67ms min=5.42ms  med=90.06ms max=545.45ms p(90)=112.97ms p(95)=128.41ms p(99.9)=324.55ms
     http_req_failed................: 0.00%  ✓ 0          ✗ 32324
     http_req_receiving.............: avg=86.82µs min=26.12µs med=48.02µs max=16.71ms  p(90)=98.86µs  p(95)=262.62µs p(99.9)=2.15ms  
     http_req_sending...............: avg=76.2µs  min=5.55µs  med=11.38µs max=218.88ms p(90)=32.44µs  p(95)=135.59µs p(99.9)=5.17ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.51ms min=5.38ms  med=89.94ms max=543.52ms p(90)=112.83ms p(95)=128.29ms p(99.9)=314.41ms
     http_reqs......................: 32324  532.416469/s
     iteration_duration.............: avg=93.17ms min=16.25ms med=90.33ms max=569.44ms p(90)=113.23ms p(95)=128.72ms p(99.9)=330.47ms
     iterations.....................: 32224  530.769345/s
     success_rate...................: 99.99% ✓ 32223      ✗ 1    
     vus............................: 50     min=50       max=50 
     vus_max........................: 50     min=50       max=50
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
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 70227      ✗ 0    
     data_received..................: 2.1 GB  34 MB/s
     data_sent......................: 27 MB   450 kB/s
     http_req_blocked...............: avg=32.24µs  min=1.9µs   med=3.12µs   max=19.15ms  p(90)=4.78µs   p(95)=5.45µs   p(99.9)=13.89ms 
     http_req_connecting............: avg=28.45µs  min=0s      med=0s       max=19ms     p(90)=0s       p(95)=0s       p(99.9)=13.87ms 
     http_req_duration..............: avg=127.5ms  min=6.15ms  med=126.98ms max=586.63ms p(90)=156.14ms p(95)=165.57ms p(99.9)=409.96ms
       { expected_response:true }...: avg=127.5ms  min=6.15ms  med=126.98ms max=586.63ms p(90)=156.14ms p(95)=165.57ms p(99.9)=409.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 23509
     http_req_receiving.............: avg=75.36µs  min=36.23µs med=56.59µs  max=5.65ms   p(90)=101.14µs p(95)=124.96µs p(99.9)=1.23ms  
     http_req_sending...............: avg=75.3µs   min=8.28µs  med=12.08µs  max=283.85ms p(90)=19.97µs  p(95)=32.66µs  p(99.9)=3.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=127.35ms min=6.08ms  med=126.88ms max=582.79ms p(90)=156.01ms p(95)=165.44ms p(99.9)=398.36ms
     http_reqs......................: 23509   386.645304/s
     iteration_duration.............: avg=128.29ms min=26.22ms med=127.32ms max=629.64ms p(90)=156.4ms  p(95)=165.83ms p(99.9)=425.85ms
     iterations.....................: 23409   385.000635/s
     success_rate...................: 100.00% ✓ 23409      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 48960      ✗ 0    
     data_received..................: 1.4 GB  24 MB/s
     data_sent......................: 19 MB   314 kB/s
     http_req_blocked...............: avg=23.89µs  min=1.24µs  med=2.79µs   max=12.61ms  p(90)=4.51µs   p(95)=5.66µs   p(99.9)=8.84ms  
     http_req_connecting............: avg=19.82µs  min=0s      med=0s       max=12.56ms  p(90)=0s       p(95)=0s       p(99.9)=8.43ms  
     http_req_duration..............: avg=182.58ms min=6.9ms   med=176.41ms max=674.14ms p(90)=218.41ms p(95)=255.34ms p(99.9)=528.88ms
       { expected_response:true }...: avg=182.58ms min=6.9ms   med=176.41ms max=674.14ms p(90)=218.41ms p(95)=255.34ms p(99.9)=528.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16420
     http_req_receiving.............: avg=91.06µs  min=25.41µs med=45.43µs  max=149.77ms p(90)=101.91µs p(95)=210.45µs p(99.9)=1.99ms  
     http_req_sending...............: avg=153.35µs min=5.54µs  med=11.24µs  max=484.37ms p(90)=32.4µs   p(95)=130.24µs p(99.9)=5.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.33ms min=6.86ms  med=176.27ms max=666.53ms p(90)=218.18ms p(95)=254.98ms p(99.9)=509.2ms 
     http_reqs......................: 16420   269.53682/s
     iteration_duration.............: avg=183.95ms min=33.12ms med=176.82ms max=708.19ms p(90)=218.88ms p(95)=255.68ms p(99.9)=578.8ms 
     iterations.....................: 16320   267.895304/s
     success_rate...................: 100.00% ✓ 16320      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 12966     ✗ 0   
     data_received..................: 388 MB  6.3 MB/s
     data_sent......................: 5.2 MB  83 kB/s
     http_req_blocked...............: avg=131.51µs min=1.44µs   med=2.92µs   max=22.43ms  p(90)=4.44µs   p(95)=5.26µs   p(99.9)=20.55ms 
     http_req_connecting............: avg=124.91µs min=0s       med=0s       max=22.39ms  p(90)=0s       p(95)=0s       p(99.9)=20.47ms 
     http_req_duration..............: avg=682.03ms min=12.12ms  med=695.12ms max=965.61ms p(90)=772.98ms p(95)=801.62ms p(99.9)=920.17ms
       { expected_response:true }...: avg=682.03ms min=12.12ms  med=695.12ms max=965.61ms p(90)=772.98ms p(95)=801.62ms p(99.9)=920.17ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 4422
     http_req_receiving.............: avg=60.7µs   min=30.46µs  med=51.42µs  max=843.2µs  p(90)=92.04µs  p(95)=106.67µs p(99.9)=270.79µs
     http_req_sending...............: avg=115.08µs min=6.36µs   med=11.94µs  max=80.66ms  p(90)=18.87µs  p(95)=22.88µs  p(99.9)=37.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=681.85ms min=12.07ms  med=695.01ms max=965.28ms p(90)=772.86ms p(95)=801.36ms p(99.9)=919.92ms
     http_reqs......................: 4422    71.46389/s
     iteration_duration.............: avg=697.89ms min=427.74ms med=697.38ms max=986.18ms p(90)=775.07ms p(95)=804.27ms p(99.9)=933.17ms
     iterations.....................: 4322    69.847791/s
     success_rate...................: 100.00% ✓ 4322      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

