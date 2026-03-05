## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| grafbase                    | 2019  | 121800 total, 0 failed |  avg: 24ms, p95: 44ms  | ✅                                        |
| hive-router                 | 1968  | 118616 total, 0 failed |  avg: 25ms, p95: 43ms  | ✅                                        |
| hotchocolate (rust subgraphs) |  917  | 55425 total, 0 failed  |  avg: 54ms, p95: 76ms  | ✅                                        |
| hotchocolate (.net subgraphs) |  882  | 53261 total, 0 failed  |  avg: 56ms, p95: 80ms  | ✅                                        |
| cosmo                       |  755  | 45647 total, 0 failed  |  avg: 66ms, p95: 96ms  | ✅                                        |
| hive-gateway-router-runtime |  538  | 32646 total, 0 failed  | avg: 92ms, p95: 126ms  | ✅                                        |
| apollo-router               |  394  | 23986 total, 0 failed  | avg: 125ms, p95: 161ms | ✅                                        |
| hive-gateway                |  278  | 17034 total, 0 failed  | avg: 176ms, p95: 257ms | ✅                                        |
| apollo-gateway              |   70  |  4363 total, 0 failed  | avg: 689ms, p95: 805ms | ✅                                        |


<details>
  <summary>Summary for: grafbase</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 365100      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 142 MB  2.4 MB/s
     http_req_blocked...............: avg=7.86µs   min=1.29µs med=2.83µs  max=18.74ms  p(90)=3.88µs   p(95)=4.4µs    p(99.9)=103.88µs
     http_req_connecting............: avg=4.41µs   min=0s     med=0s      max=18.61ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.41ms  min=2.43ms med=21.51ms max=427.56ms p(90)=38.59ms  p(95)=43.98ms  p(99.9)=71.21ms 
       { expected_response:true }...: avg=24.41ms  min=2.43ms med=21.51ms max=427.56ms p(90)=38.59ms  p(95)=43.98ms  p(99.9)=71.21ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 121800
     http_req_receiving.............: avg=121.87µs min=24.6µs med=45.58µs max=86.99ms  p(90)=154.15µs p(95)=365.48µs p(99.9)=11.22ms 
     http_req_sending...............: avg=87.96µs  min=5.45µs med=11.26µs max=199.6ms  p(90)=78.58µs  p(95)=133.46µs p(99.9)=11.87ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.2ms   min=2.38ms med=21.35ms max=415.89ms p(90)=38.21ms  p(95)=43.65ms  p(99.9)=69.57ms 
     http_reqs......................: 121800  2019.238834/s
     iteration_duration.............: avg=24.63ms  min=3.86ms med=21.71ms max=444.95ms p(90)=38.8ms   p(95)=44.19ms  p(99.9)=72.14ms 
     iterations.....................: 121700  2017.581002/s
     success_rate...................: 100.00% ✓ 121700      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 355548      ✗ 0     
     data_received..................: 10 GB   173 MB/s
     data_sent......................: 138 MB  2.3 MB/s
     http_req_blocked...............: avg=13.21µs  min=1.27µs  med=2.49µs  max=39.14ms  p(90)=3.63µs  p(95)=4.26µs   p(99.9)=74.85µs
     http_req_connecting............: avg=10.19µs  min=0s      med=0s      max=38.89ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.09ms  min=1.85ms  med=23.19ms max=410.32ms p(90)=37.55ms p(95)=42.52ms  p(99.9)=80.97ms
       { expected_response:true }...: avg=25.09ms  min=1.85ms  med=23.19ms max=410.32ms p(90)=37.55ms p(95)=42.52ms  p(99.9)=80.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118616
     http_req_receiving.............: avg=105.35µs min=24.26µs med=43.06µs max=38.98ms  p(90)=119.5µs p(95)=322.37µs p(99.9)=8.01ms 
     http_req_sending...............: avg=93.28µs  min=5.21µs  med=9.93µs  max=173.57ms p(90)=46.14µs p(95)=128.44µs p(99.9)=10.33ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.89ms  min=1.81ms  med=23.04ms max=260ms    p(90)=37.28ms p(95)=42.23ms  p(99.9)=77.41ms
     http_reqs......................: 118616  1968.532461/s
     iteration_duration.............: avg=25.31ms  min=3.64ms  med=23.38ms max=458.29ms p(90)=37.73ms p(95)=42.7ms   p(99.9)=81.78ms
     iterations.....................: 118516  1966.872877/s
     success_rate...................: 100.00% ✓ 118516      ✗ 0     
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

     checks.........................: 100.00% ✓ 165975     ✗ 0    
     data_received..................: 4.9 GB  80 MB/s
     data_sent......................: 65 MB   1.1 MB/s
     http_req_blocked...............: avg=15.25µs min=1.3µs   med=2.68µs  max=25.79ms  p(90)=3.85µs  p(95)=4.66µs   p(99.9)=118.5µs 
     http_req_connecting............: avg=11.97µs min=0s      med=0s      max=25.75ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=53.89ms min=3.31ms  med=52.97ms max=496.79ms p(90)=69.72ms p(95)=75.5ms   p(99.9)=222.43ms
       { expected_response:true }...: avg=53.89ms min=3.31ms  med=52.97ms max=496.79ms p(90)=69.72ms p(95)=75.5ms   p(99.9)=222.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 55425
     http_req_receiving.............: avg=5.59ms  min=52.91µs med=5.15ms  max=121.68ms p(90)=11.16ms p(95)=13.48ms  p(99.9)=37.83ms 
     http_req_sending...............: avg=61.25µs min=5.61µs  med=11µs    max=321.88ms p(90)=28.76µs p(95)=126.73µs p(99.9)=6.27ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=48.23ms min=3.22ms  med=46.94ms max=483.43ms p(90)=64.08ms p(95)=69.85ms  p(99.9)=209.42ms
     http_reqs......................: 55425   917.29393/s
     iteration_duration.............: avg=54.23ms min=9.46ms  med=53.19ms max=588.17ms p(90)=69.94ms p(95)=75.71ms  p(99.9)=256.08ms
     iterations.....................: 55325   915.638911/s
     success_rate...................: 100.00% ✓ 55325      ✗ 0    
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

     checks.........................: 100.00% ✓ 159483     ✗ 0    
     data_received..................: 4.7 GB  77 MB/s
     data_sent......................: 62 MB   1.0 MB/s
     http_req_blocked...............: avg=15.54µs min=1.05µs  med=2.49µs  max=20.27ms  p(90)=3.72µs  p(95)=4.67µs   p(99.9)=203.11µs
     http_req_connecting............: avg=12.26µs min=0s      med=0s      max=20.12ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=56.1ms  min=2.7ms   med=54.77ms max=458.39ms p(90)=72.91ms p(95)=80.04ms  p(99.9)=214.82ms
       { expected_response:true }...: avg=56.1ms  min=2.7ms   med=54.77ms max=458.39ms p(90)=72.91ms p(95)=80.04ms  p(99.9)=214.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53261
     http_req_receiving.............: avg=6.29ms  min=58.62µs med=5.87ms  max=138.25ms p(90)=12.38ms p(95)=15.05ms  p(99.9)=37.28ms 
     http_req_sending...............: avg=74.56µs min=4.43µs  med=10.89µs max=351.39ms p(90)=26.08µs p(95)=133.04µs p(99.9)=6.38ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=49.73ms min=2.6ms   med=48.03ms max=446.07ms p(90)=66.57ms p(95)=73.82ms  p(99.9)=176.87ms
     http_reqs......................: 53261   882.57103/s
     iteration_duration.............: avg=56.43ms min=7.87ms  med=54.99ms max=483.77ms p(90)=73.14ms p(95)=80.27ms  p(99.9)=229.43ms
     iterations.....................: 53161   880.913962/s
     success_rate...................: 100.00% ✓ 53161      ✗ 0    
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

     checks.........................: 100.00% ✓ 136641     ✗ 0    
     data_received..................: 4.0 GB  66 MB/s
     data_sent......................: 53 MB   881 kB/s
     http_req_blocked...............: avg=8.94µs   min=1.39µs  med=2.66µs  max=10.41ms  p(90)=3.73µs   p(95)=4.42µs   p(99.9)=854.97µs
     http_req_connecting............: avg=5.73µs   min=0s      med=0s      max=10.37ms  p(90)=0s       p(95)=0s       p(99.9)=825.91µs
     http_req_duration..............: avg=65.5ms   min=2.7ms   med=64.46ms max=502.06ms p(90)=88.26ms  p(95)=95.68ms  p(99.9)=269.69ms
       { expected_response:true }...: avg=65.5ms   min=2.7ms   med=64.46ms max=502.06ms p(90)=88.26ms  p(95)=95.68ms  p(99.9)=269.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45647
     http_req_receiving.............: avg=131.58µs min=30.23µs med=66.88µs max=30.42ms  p(90)=138.67µs p(95)=336.36µs p(99.9)=10.6ms  
     http_req_sending...............: avg=48.29µs  min=6.18µs  med=10.92µs max=282.84ms p(90)=27µs     p(95)=125.38µs p(99.9)=2.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=65.32ms  min=2.61ms  med=64.31ms max=500.56ms p(90)=88.04ms  p(95)=95.45ms  p(99.9)=266.47ms
     http_reqs......................: 45647   755.87082/s
     iteration_duration.............: avg=65.87ms  min=4.81ms  med=64.72ms max=545.1ms  p(90)=88.48ms  p(95)=95.92ms  p(99.9)=282.64ms
     iterations.....................: 45547   754.214915/s
     success_rate...................: 100.00% ✓ 45547      ✗ 0    
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
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97638      ✗ 0    
     data_received..................: 2.9 GB  47 MB/s
     data_sent......................: 38 MB   627 kB/s
     http_req_blocked...............: avg=21.24µs min=1.23µs  med=2.79µs  max=22.14ms  p(90)=4.01µs   p(95)=4.68µs   p(99.9)=8.29ms  
     http_req_connecting............: avg=17.43µs min=0s      med=0s      max=21.94ms  p(90)=0s       p(95)=0s       p(99.9)=7.87ms  
     http_req_duration..............: avg=91.68ms min=5.28ms  med=88.74ms max=536.92ms p(90)=110.29ms p(95)=125.94ms p(99.9)=357.15ms
       { expected_response:true }...: avg=91.68ms min=5.28ms  med=88.74ms max=536.92ms p(90)=110.29ms p(95)=125.94ms p(99.9)=357.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32646
     http_req_receiving.............: avg=83.32µs min=25.57µs med=46.22µs max=60.77ms  p(90)=92.39µs  p(95)=203.08µs p(99.9)=2.31ms  
     http_req_sending...............: avg=84.64µs min=5.41µs  med=11µs    max=429.74ms p(90)=29.08µs  p(95)=127µs    p(99.9)=3.49ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.51ms min=5.24ms  med=88.63ms max=515.72ms p(90)=110.09ms p(95)=125.77ms p(99.9)=336.78ms
     http_reqs......................: 32646   538.093504/s
     iteration_duration.............: avg=92.2ms  min=18.02ms med=88.99ms max=606.42ms p(90)=110.54ms p(95)=126.36ms p(99.9)=379.18ms
     iterations.....................: 32546   536.445236/s
     success_rate...................: 100.00% ✓ 32546      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 71658      ✗ 0    
     data_received..................: 2.1 GB  35 MB/s
     data_sent......................: 28 MB   460 kB/s
     http_req_blocked...............: avg=21.22µs  min=1.8µs   med=2.9µs    max=15.31ms  p(90)=4.39µs   p(95)=5.15µs   p(99.9)=8.89ms  
     http_req_connecting............: avg=17.79µs  min=0s      med=0s       max=15.26ms  p(90)=0s       p(95)=0s       p(99.9)=8.86ms  
     http_req_duration..............: avg=124.95ms min=5.6ms   med=124.37ms max=556.05ms p(90)=152.41ms p(95)=161.11ms p(99.9)=381.12ms
       { expected_response:true }...: avg=124.95ms min=5.6ms   med=124.37ms max=556.05ms p(90)=152.41ms p(95)=161.11ms p(99.9)=381.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 23986
     http_req_receiving.............: avg=78.36µs  min=35.06µs med=51.25µs  max=285.08ms p(90)=88.2µs   p(95)=101.44µs p(99.9)=872.95µs
     http_req_sending...............: avg=90.54µs  min=7.01µs  med=10.92µs  max=363.94ms p(90)=17.92µs  p(95)=22.86µs  p(99.9)=7.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.78ms min=5.55ms  med=124.28ms max=530.24ms p(90)=152.3ms  p(95)=161ms    p(99.9)=376.81ms
     http_reqs......................: 23986   394.837385/s
     iteration_duration.............: avg=125.74ms min=32.33ms med=124.68ms max=614.02ms p(90)=152.65ms p(95)=161.37ms p(99.9)=408.4ms 
     iterations.....................: 23886   393.191269/s
     success_rate...................: 100.00% ✓ 23886      ✗ 0    
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

     checks.........................: 100.00% ✓ 50802      ✗ 0    
     data_received..................: 1.5 GB  25 MB/s
     data_sent......................: 20 MB   325 kB/s
     http_req_blocked...............: avg=22.56µs  min=1.25µs  med=2.66µs   max=12.65ms  p(90)=4.4µs    p(95)=5.37µs   p(99.9)=8.45ms  
     http_req_connecting............: avg=19.19µs  min=0s      med=0s       max=12.62ms  p(90)=0s       p(95)=0s       p(99.9)=8.42ms  
     http_req_duration..............: avg=176.13ms min=6.93ms  med=169.31ms max=611.45ms p(90)=210.35ms p(95)=256.8ms  p(99.9)=471.64ms
       { expected_response:true }...: avg=176.13ms min=6.93ms  med=169.31ms max=611.45ms p(90)=210.35ms p(95)=256.8ms  p(99.9)=471.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17034
     http_req_receiving.............: avg=78.69µs  min=23.86µs med=43.66µs  max=9.08ms   p(90)=99.98µs  p(95)=154.53µs p(99.9)=2.1ms   
     http_req_sending...............: avg=108.47µs min=5.45µs  med=11.07µs  max=442.34ms p(90)=25.3µs   p(95)=112.22µs p(99.9)=4.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.94ms min=6.89ms  med=169.19ms max=610.76ms p(90)=210.11ms p(95)=256.65ms p(99.9)=451.68ms
     http_reqs......................: 17034   278.874015/s
     iteration_duration.............: avg=177.42ms min=22.72ms med=169.65ms max=647.31ms p(90)=210.86ms p(95)=257.16ms p(99.9)=523.24ms
     iterations.....................: 16934   277.236854/s
     success_rate...................: 100.00% ✓ 16934      ✗ 0    
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

     checks.........................: 100.00% ✓ 12789     ✗ 0   
     data_received..................: 383 MB  6.2 MB/s
     data_sent......................: 5.1 MB  83 kB/s
     http_req_blocked...............: avg=78.89µs  min=1.47µs   med=2.89µs   max=12.79ms  p(90)=4.35µs   p(95)=5.24µs   p(99.9)=11.74ms 
     http_req_connecting............: avg=75.39µs  min=0s       med=0s       max=12.76ms  p(90)=0s       p(95)=0s       p(99.9)=11.71ms 
     http_req_duration..............: avg=689.42ms min=11.86ms  med=703.89ms max=962.54ms p(90)=765.24ms p(95)=805.37ms p(99.9)=950.82ms
       { expected_response:true }...: avg=689.42ms min=11.86ms  med=703.89ms max=962.54ms p(90)=765.24ms p(95)=805.37ms p(99.9)=950.82ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 4363
     http_req_receiving.............: avg=67.72µs  min=30.75µs  med=52.07µs  max=32.84ms  p(90)=91.11µs  p(95)=105.75µs p(99.9)=298.15µs
     http_req_sending...............: avg=122.38µs min=6.35µs   med=11.58µs  max=132.47ms p(90)=17.34µs  p(95)=22.88µs  p(99.9)=34.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=689.23ms min=11.81ms  med=703.77ms max=962.39ms p(90)=764.68ms p(95)=805.3ms  p(99.9)=950.71ms
     http_reqs......................: 4363    70.786699/s
     iteration_duration.............: avg=705.68ms min=348.86ms med=704.99ms max=970.04ms p(90)=767.37ms p(95)=807.3ms  p(99.9)=958.01ms
     iterations.....................: 4263    69.164267/s
     success_rate...................: 100.00% ✓ 4263      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

