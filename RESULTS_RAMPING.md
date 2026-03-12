## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| grafbase                    | 2021  | 127035 total, 0 failed | avg: 110ms, p95: 270ms | ✅                                        |
| hotchocolate (rust subgraphs) |  940  | 60035 total, 0 failed  | avg: 234ms, p95: 749ms | ✅                                        |
| hotchocolate (.net subgraphs) |  910  | 57793 total, 0 failed  | avg: 243ms, p95: 785ms | ✅                                        |
| cosmo                       |  813  | 51546 total, 0 failed  | avg: 272ms, p95: 614ms | ✅                                        |
| hive-gateway-router-runtime |  547  | 36078 total, 0 failed  | avg: 390ms, p95: 839ms | ❌ non-compatible response structure (1)  |
| apollo-router               |  444  | 29584 total, 0 failed  | avg: 476ms, p95: 1080ms | ❌ non-compatible response structure (17) |
| hive-gateway                |  250  | 17218 total, 0 failed  | avg: 811ms, p95: 1788ms | ✅                                        |
| apollo-gateway              |  108  |  7906 total, 0 failed  | avg: 1526ms, p95: 2905ms | ✅                                        |


<details>
  <summary>Summary for: grafbase</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 378105      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 148 MB  2.4 MB/s
     http_req_blocked...............: avg=423.03µs min=1.36µs  med=2.89µs   max=349.01ms p(90)=4.18µs   p(95)=4.89µs   p(99.9)=154.04ms
     http_req_connecting............: avg=416.46µs min=0s      med=0s       max=348.94ms p(90)=0s       p(95)=0s       p(99.9)=153.79ms
     http_req_duration..............: avg=109.58ms min=2.14ms  med=99.01ms  max=433.12ms p(90)=226.04ms p(95)=270.44ms p(99.9)=356.68ms
       { expected_response:true }...: avg=109.58ms min=2.14ms  med=99.01ms  max=433.12ms p(90)=226.04ms p(95)=270.44ms p(99.9)=356.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127035
     http_req_receiving.............: avg=488.05µs min=25.44µs med=46.09µs  max=127.72ms p(90)=98.95µs  p(95)=407.25µs p(99.9)=66.86ms 
     http_req_sending...............: avg=356.36µs min=5.69µs  med=11.28µs  max=274.9ms  p(90)=21.44µs  p(95)=130.55µs p(99.9)=61.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.74ms min=2.09ms  med=98.09ms  max=394.91ms p(90)=224.21ms p(95)=268.85ms p(99.9)=351.6ms 
     http_reqs......................: 127035  2021.455493/s
     iteration_duration.............: avg=111.14ms min=2.32ms  med=100.46ms max=692.15ms p(90)=228.33ms p(95)=273.15ms p(99.9)=390.47ms
     iterations.....................: 126035  2005.542906/s
     success_rate...................: 100.00% ✓ 126035      ✗ 0     
     vus............................: 54      min=0         max=499 
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

     checks.........................: 100.00% ✓ 177105     ✗ 0    
     data_received..................: 5.3 GB  82 MB/s
     data_sent......................: 70 MB   1.1 MB/s
     http_req_blocked...............: avg=139.59µs min=1.23µs  med=3.02µs   max=180.53ms p(90)=4.49µs   p(95)=8.05µs   p(99.9)=50.43ms 
     http_req_connecting............: avg=135.15µs min=0s      med=0s       max=180.33ms p(90)=0s       p(95)=0s       p(99.9)=49.77ms 
     http_req_duration..............: avg=233.68ms min=3.36ms  med=137.72ms max=2.99s    p(90)=564.58ms p(95)=749.44ms p(99.9)=1.92s   
       { expected_response:true }...: avg=233.68ms min=3.36ms  med=137.72ms max=2.99s    p(90)=564.58ms p(95)=749.44ms p(99.9)=1.92s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 60035
     http_req_receiving.............: avg=12.85ms  min=51.61µs med=99.24µs  max=1.61s    p(90)=6.57ms   p(95)=67.82ms  p(99.9)=988.44ms
     http_req_sending...............: avg=196.54µs min=5.89µs  med=11.31µs  max=146.03ms p(90)=21.16µs  p(95)=129.12µs p(99.9)=41ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=220.63ms min=3.26ms  med=133.93ms max=2.55s    p(90)=530.91ms p(95)=685.86ms p(99.9)=1.86s   
     http_reqs......................: 60035   940.092006/s
     iteration_duration.............: avg=238.1ms  min=3.51ms  med=142.53ms max=2.99s    p(90)=569.92ms p(95)=755.52ms p(99.9)=1.93s   
     iterations.....................: 59035   924.432941/s
     success_rate...................: 100.00% ✓ 59035      ✗ 0    
     vus............................: 55      min=0        max=499
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

     checks.........................: 100.00% ✓ 170379     ✗ 0    
     data_received..................: 5.1 GB  80 MB/s
     data_sent......................: 67 MB   1.1 MB/s
     http_req_blocked...............: avg=143.84µs min=1.38µs  med=3.09µs   max=190.77ms p(90)=4.69µs   p(95)=7.3µs    p(99.9)=52.43ms 
     http_req_connecting............: avg=139.38µs min=0s      med=0s       max=190.56ms p(90)=0s       p(95)=0s       p(99.9)=52.31ms 
     http_req_duration..............: avg=242.8ms  min=2.78ms  med=149.55ms max=2.52s    p(90)=593.34ms p(95)=784.75ms p(99.9)=1.89s   
       { expected_response:true }...: avg=242.8ms  min=2.78ms  med=149.55ms max=2.52s    p(90)=593.34ms p(95)=784.75ms p(99.9)=1.89s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 57793
     http_req_receiving.............: avg=11.78ms  min=54.77µs med=102.54µs max=921.11ms p(90)=8.79ms   p(95)=64.06ms  p(99.9)=780.92ms
     http_req_sending...............: avg=206.41µs min=5.78µs  med=11.79µs  max=152.67ms p(90)=26.28µs  p(95)=130.92µs p(99.9)=43.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=230.81ms min=2.69ms  med=145.5ms  max=2.52s    p(90)=558.87ms p(95)=726.84ms p(99.9)=1.87s   
     http_reqs......................: 57793   910.493729/s
     iteration_duration.............: avg=247.56ms min=2.97ms  med=154.89ms max=2.52s    p(90)=599.38ms p(95)=790.48ms p(99.9)=1.89s   
     iterations.....................: 56793   894.739334/s
     success_rate...................: 100.00% ✓ 56793      ✗ 0    
     vus............................: 83      min=0        max=498
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

     checks.........................: 100.00% ✓ 151638     ✗ 0    
     data_received..................: 4.5 GB  71 MB/s
     data_sent......................: 60 MB   948 kB/s
     http_req_blocked...............: avg=68.2µs   min=1.08µs  med=2.68µs   max=124.83ms p(90)=4.03µs   p(95)=5.07µs   p(99.9)=18.42ms 
     http_req_connecting............: avg=64.53µs  min=0s      med=0s       max=124.78ms p(90)=0s       p(95)=0s       p(99.9)=18.3ms  
     http_req_duration..............: avg=272.27ms min=2.23ms  med=258.16ms max=1.04s    p(90)=545.56ms p(95)=614.02ms p(99.9)=873.45ms
       { expected_response:true }...: avg=272.27ms min=2.23ms  med=258.16ms max=1.04s    p(90)=545.56ms p(95)=614.02ms p(99.9)=873.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51546
     http_req_receiving.............: avg=596.3µs  min=27.78µs med=59.19µs  max=161.93ms p(90)=163.76µs p(95)=440.16µs p(99.9)=83.49ms 
     http_req_sending...............: avg=110.03µs min=4.42µs  med=10.75µs  max=98.6ms   p(90)=23.05µs  p(95)=129.66µs p(99.9)=19.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=271.56ms min=2.15ms  med=257.39ms max=1.04s    p(90)=544.3ms  p(95)=612.84ms p(99.9)=871.49ms
     http_reqs......................: 51546   813.132693/s
     iteration_duration.............: avg=278.02ms min=2.38ms  med=264.98ms max=1.04s    p(90)=547.79ms p(95)=616.16ms p(99.9)=875.04ms
     iterations.....................: 50546   797.357799/s
     success_rate...................: 100.00% ✓ 50546      ✗ 0    
     vus............................: 78      min=0        max=493
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
      ↳  99% — ✓ 35077 / ✗ 1

     checks.........................: 99.99% ✓ 105233     ✗ 1    
     data_received..................: 3.2 GB 48 MB/s
     data_sent......................: 42 MB  639 kB/s
     http_req_blocked...............: avg=95.42µs  min=1.21µs  med=2.7µs    max=120.95ms p(90)=3.98µs   p(95)=5.07µs   p(99.9)=24.61ms
     http_req_connecting............: avg=91.55µs  min=0s      med=0s       max=120.8ms  p(90)=0s       p(95)=0s       p(99.9)=24.53ms
     http_req_duration..............: avg=389.98ms min=5.13ms  med=368.93ms max=1.43s    p(90)=753.98ms p(95)=838.5ms  p(99.9)=1.14s  
       { expected_response:true }...: avg=389.98ms min=5.13ms  med=368.93ms max=1.43s    p(90)=753.98ms p(95)=838.5ms  p(99.9)=1.14s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 36078
     http_req_receiving.............: avg=152.43µs min=26.51µs med=43.4µs   max=139.75ms p(90)=79.82µs  p(95)=134.92µs p(99.9)=20.87ms
     http_req_sending...............: avg=172.77µs min=5.48µs  med=10.73µs  max=212.9ms  p(90)=21.9µs   p(95)=121.77µs p(99.9)=32.48ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=389.66ms min=5.09ms  med=368.59ms max=1.39s    p(90)=753.47ms p(95)=837.96ms p(99.9)=1.14s  
     http_reqs......................: 36078  547.652039/s
     iteration_duration.............: avg=401.45ms min=5.37ms  med=382.95ms max=1.6s     p(90)=759.27ms p(95)=843.78ms p(99.9)=1.14s  
     iterations.....................: 35078  532.472371/s
     success_rate...................: 99.99% ✓ 35077      ✗ 1    
     vus............................: 56     min=0        max=499
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
      ↳  99% — ✓ 28567 / ✗ 17
     ✓ valid response structure

     checks.........................: 99.98% ✓ 85735      ✗ 17   
     data_received..................: 2.6 GB 39 MB/s
     data_sent......................: 35 MB  519 kB/s
     http_req_blocked...............: avg=40.81µs  min=1.76µs med=2.79µs   max=72.43ms p(90)=4.23µs   p(95)=5.46µs   p(99.9)=9ms    
     http_req_connecting............: avg=36.76µs  min=0s     med=0s       max=72.38ms p(90)=0s       p(95)=0s       p(99.9)=8.92ms 
     http_req_duration..............: avg=476.37ms min=5.64ms med=430.69ms max=1.98s   p(90)=961.58ms p(95)=1.08s    p(99.9)=1.64s  
       { expected_response:true }...: avg=476.37ms min=5.64ms med=430.69ms max=1.98s   p(90)=961.58ms p(95)=1.08s    p(99.9)=1.64s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 29584
     http_req_receiving.............: avg=86.25µs  min=30.6µs med=49.58µs  max=66.15ms p(90)=84.21µs  p(95)=109.48µs p(99.9)=4.42ms 
     http_req_sending...............: avg=65.99µs  min=6.86µs med=10.96µs  max=94.78ms p(90)=19.05µs  p(95)=43.22µs  p(99.9)=11.48ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=476.22ms min=5.59ms med=430.6ms  max=1.98s   p(90)=961.34ms p(95)=1.08s    p(99.9)=1.64s  
     http_reqs......................: 29584  444.376728/s
     iteration_duration.............: avg=493.27ms min=6.06ms med=449.26ms max=1.98s   p(90)=968.96ms p(95)=1.08s    p(99.9)=1.65s  
     iterations.....................: 28584  429.355881/s
     success_rate...................: 99.94% ✓ 28567      ✗ 17   
     vus............................: 88     min=0        max=500
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

     checks.........................: 100.00% ✓ 48654      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=63.58µs  min=1.25µs  med=2.73µs   max=85.72ms p(90)=4.83µs  p(95)=6.9µs    p(99.9)=19.31ms
     http_req_connecting............: avg=58.98µs  min=0s      med=0s       max=85.57ms p(90)=0s      p(95)=0s       p(99.9)=19.26ms
     http_req_duration..............: avg=811.32ms min=6.94ms  med=756.83ms max=6.39s   p(90)=1.57s   p(95)=1.78s    p(99.9)=5.15s  
       { expected_response:true }...: avg=811.32ms min=6.94ms  med=756.83ms max=6.39s   p(90)=1.57s   p(95)=1.78s    p(99.9)=5.15s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17218
     http_req_receiving.............: avg=121.76µs min=25.94µs med=45.46µs  max=61.88ms p(90)=93.82µs p(95)=128.28µs p(99.9)=15.85ms
     http_req_sending...............: avg=132.85µs min=5.54µs  med=10.92µs  max=87.12ms p(90)=29.02µs p(95)=62.23µs  p(99.9)=26.2ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=811.06ms min=6.87ms  med=756.39ms max=6.39s   p(90)=1.57s   p(95)=1.78s    p(99.9)=5.15s  
     http_reqs......................: 17218   250.390216/s
     iteration_duration.............: avg=861.43ms min=7.93ms  med=835.83ms max=6.4s    p(90)=1.59s   p(95)=1.8s     p(99.9)=5.17s  
     iterations.....................: 16218   235.847864/s
     success_rate...................: 100.00% ✓ 16218      ✗ 0    
     vus............................: 102     min=0        max=500
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

     checks.........................: 100.00% ✓ 20718      ✗ 0    
     data_received..................: 694 MB  9.5 MB/s
     data_sent......................: 9.7 MB  132 kB/s
     http_req_blocked...............: avg=22.26µs min=1.41µs  med=3.03µs  max=17.4ms  p(90)=4.8µs   p(95)=8.38µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=17.03µs min=0s      med=0s      max=17.33ms p(90)=0s      p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=1.52s   min=11.61ms med=1.48s   max=21.29s  p(90)=2.62s   p(95)=2.9s     p(99.9)=19.73s  
       { expected_response:true }...: avg=1.52s   min=11.61ms med=1.48s   max=21.29s  p(90)=2.62s   p(95)=2.9s     p(99.9)=19.73s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7906 
     http_req_receiving.............: avg=61.49µs min=28.02µs med=50.31µs max=4.48ms  p(90)=85.55µs p(95)=100.43µs p(99.9)=470.38µs
     http_req_sending...............: avg=33µs    min=6.07µs  med=11.83µs max=20.13ms p(90)=20.41µs p(95)=37.77µs  p(99.9)=6.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.52s   min=11.56ms med=1.48s   max=21.29s  p(90)=2.62s   p(95)=2.9s     p(99.9)=19.73s  
     http_reqs......................: 7906    108.360828/s
     iteration_duration.............: avg=1.74s   min=11.76ms med=1.72s   max=21.3s   p(90)=2.68s   p(95)=2.93s    p(99.9)=19.82s  
     iterations.....................: 6906    94.654677/s
     success_rate...................: 100.00% ✓ 6906       ✗ 0    
     vus............................: 81      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

