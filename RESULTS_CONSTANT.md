## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router                 | 2015  | 121394 total, 0 failed |  avg: 25ms, p95: 42ms  | ✅                                        |
| grafbase                    | 2010  | 121199 total, 0 failed |  avg: 25ms, p95: 45ms  | ✅                                        |
| hotchocolate (rust)         |  909  | 54931 total, 0 failed  |  avg: 54ms, p95: 76ms  | ✅                                        |
| hotchocolate                |  815  | 49204 total, 0 failed  |  avg: 61ms, p95: 85ms  | ✅                                        |
| cosmo                       |  744  | 44977 total, 0 failed  |  avg: 66ms, p95: 96ms  | ✅                                        |
| hive-gateway-router-runtime |  540  | 32795 total, 0 failed  | avg: 91ms, p95: 124ms  | ✅                                        |
| apollo-router               |  393  | 23908 total, 0 failed  | avg: 125ms, p95: 163ms | ❌ non-compatible response structure (1)  |
| hive-gateway                |  267  | 16356 total, 0 failed  | avg: 183ms, p95: 264ms | ✅                                        |
| apollo-gateway              |   70  |  4373 total, 0 failed  | avg: 688ms, p95: 812ms | ✅                                        |


<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 363882      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=7.46µs  min=1.16µs  med=2.36µs  max=17.41ms  p(90)=3.37µs   p(95)=3.95µs   p(99.9)=67.5µs 
     http_req_connecting............: avg=4.61µs  min=0s      med=0s      max=16.33ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.51ms min=1.85ms  med=22.59ms max=414.11ms p(90)=36.7ms   p(95)=41.86ms  p(99.9)=72.8ms 
       { expected_response:true }...: avg=24.51ms min=1.85ms  med=22.59ms max=414.11ms p(90)=36.7ms   p(95)=41.86ms  p(99.9)=72.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 121394
     http_req_receiving.............: avg=98.52µs min=22.36µs med=40.93µs max=118.77ms p(90)=116.56µs p(95)=308.18µs p(99.9)=7ms    
     http_req_sending...............: avg=70.86µs min=4.85µs  med=9.44µs  max=211.14ms p(90)=44.98µs  p(95)=122.89µs p(99.9)=9.05ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.34ms min=1.82ms  med=22.45ms max=400.75ms p(90)=36.47ms  p(95)=41.58ms  p(99.9)=71.24ms
     http_reqs......................: 121394  2015.522931/s
     iteration_duration.............: avg=24.72ms min=3.19ms  med=22.78ms max=441.89ms p(90)=36.89ms  p(95)=42.05ms  p(99.9)=73.44ms
     iterations.....................: 121294  2013.862615/s
     success_rate...................: 100.00% ✓ 121294      ✗ 0     
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

     checks.........................: 100.00% ✓ 363297      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=8.56µs   min=1.28µs  med=2.87µs  max=18.07ms  p(90)=3.95µs   p(95)=4.46µs   p(99.9)=47.93µs
     http_req_connecting............: avg=5.17µs   min=0s      med=0s      max=17.92ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.53ms  min=2.34ms  med=21.47ms max=434.4ms  p(90)=39.06ms  p(95)=44.96ms  p(99.9)=73.05ms
       { expected_response:true }...: avg=24.53ms  min=2.34ms  med=21.47ms max=434.4ms  p(90)=39.06ms  p(95)=44.96ms  p(99.9)=73.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 121199
     http_req_receiving.............: avg=128.51µs min=24.04µs med=45.47µs max=120ms    p(90)=166.26µs p(95)=385.23µs p(99.9)=13.86ms
     http_req_sending...............: avg=89.98µs  min=5.23µs  med=11.16µs max=293.08ms p(90)=86.47µs  p(95)=139.16µs p(99.9)=12.04ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.32ms  min=2.3ms   med=21.33ms max=419.82ms p(90)=38.62ms  p(95)=44.57ms  p(99.9)=70.88ms
     http_reqs......................: 121199  2010.455753/s
     iteration_duration.............: avg=24.76ms  min=3.78ms  med=21.67ms max=454.86ms p(90)=39.28ms  p(95)=45.17ms  p(99.9)=73.71ms
     iterations.....................: 121099  2008.796947/s
     success_rate...................: 100.00% ✓ 121099      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 164493     ✗ 0    
     data_received..................: 4.8 GB  80 MB/s
     data_sent......................: 64 MB   1.1 MB/s
     http_req_blocked...............: avg=15.22µs min=1.23µs  med=2.72µs  max=23.37ms  p(90)=3.84µs  p(95)=4.57µs   p(99.9)=139.12µs
     http_req_connecting............: avg=11.91µs min=0s      med=0s      max=23.31ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=54.39ms min=3.55ms  med=53.44ms max=485.45ms p(90)=70.39ms p(95)=76.47ms  p(99.9)=221.02ms
       { expected_response:true }...: avg=54.39ms min=3.55ms  med=53.44ms max=485.45ms p(90)=70.39ms p(95)=76.47ms  p(99.9)=221.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54931
     http_req_receiving.............: avg=5.75ms  min=58.28µs med=5.27ms  max=229.22ms p(90)=11.24ms p(95)=13.83ms  p(99.9)=36.44ms 
     http_req_sending...............: avg=67.38µs min=5.67µs  med=11.07µs max=230.42ms p(90)=29.34µs p(95)=127.65µs p(99.9)=6.69ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=48.57ms min=3.47ms  med=47.32ms max=484.62ms p(90)=64.51ms p(95)=70.69ms  p(99.9)=195.77ms
     http_reqs......................: 54931   909.122497/s
     iteration_duration.............: avg=54.72ms min=12.28ms med=53.67ms max=523.19ms p(90)=70.6ms  p(95)=76.69ms  p(99.9)=239.78ms
     iterations.....................: 54831   907.467471/s
     success_rate...................: 100.00% ✓ 54831      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 147312     ✗ 0    
     data_received..................: 4.3 GB  72 MB/s
     data_sent......................: 57 MB   950 kB/s
     http_req_blocked...............: avg=12.98µs min=1.28µs  med=3.01µs  max=16.56ms  p(90)=4.59µs  p(95)=5.54µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=9.31µs  min=0s      med=0s      max=16.53ms  p(90)=0s      p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=60.73ms min=2.74ms  med=59.54ms max=488.27ms p(90)=78.44ms p(95)=84.98ms  p(99.9)=240.82ms
       { expected_response:true }...: avg=60.73ms min=2.74ms  med=59.54ms max=488.27ms p(90)=78.44ms p(95)=84.98ms  p(99.9)=240.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49204
     http_req_receiving.............: avg=7.11ms  min=53.81µs med=6.6ms   max=322.47ms p(90)=13.68ms p(95)=16.87ms  p(99.9)=40.11ms 
     http_req_sending...............: avg=76.51µs min=6.06µs  med=11.8µs  max=283.15ms p(90)=31.27µs p(95)=132.23µs p(99.9)=9.26ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=53.54ms min=2.65ms  med=51.98ms max=477.62ms p(90)=71.08ms p(95)=78.37ms  p(99.9)=205.1ms 
     http_reqs......................: 49204   815.462927/s
     iteration_duration.............: avg=61.09ms min=8.96ms  med=59.78ms max=527.78ms p(90)=78.65ms p(95)=85.2ms   p(99.9)=269.28ms
     iterations.....................: 49104   813.805617/s
     success_rate...................: 100.00% ✓ 49104      ✗ 0    
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

     checks.........................: 100.00% ✓ 134631     ✗ 0    
     data_received..................: 3.9 GB  65 MB/s
     data_sent......................: 52 MB   868 kB/s
     http_req_blocked...............: avg=16.59µs  min=989ns   med=2.88µs  max=17.73ms  p(90)=4.23µs   p(95)=5.01µs   p(99.9)=6.03ms  
     http_req_connecting............: avg=13.15µs  min=0s      med=0s      max=17.5ms   p(90)=0s       p(95)=0s       p(99.9)=5.95ms  
     http_req_duration..............: avg=66.46ms  min=2.65ms  med=65.71ms max=470.32ms p(90)=89.03ms  p(95)=95.58ms  p(99.9)=252.43ms
       { expected_response:true }...: avg=66.46ms  min=2.65ms  med=65.71ms max=470.32ms p(90)=89.03ms  p(95)=95.58ms  p(99.9)=252.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44977
     http_req_receiving.............: avg=126.62µs min=27.56µs med=56.41µs max=38.44ms  p(90)=112.53µs p(95)=310.26µs p(99.9)=13.21ms 
     http_req_sending...............: avg=44.04µs  min=4.48µs  med=10.87µs max=262.65ms p(90)=20.72µs  p(95)=127.83µs p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=66.29ms  min=2.57ms  med=65.55ms max=469.64ms p(90)=88.84ms  p(95)=95.35ms  p(99.9)=246.17ms
     http_reqs......................: 44977   744.838507/s
     iteration_duration.............: avg=66.86ms  min=5.9ms   med=65.98ms max=500.37ms p(90)=89.27ms  p(95)=95.87ms  p(99.9)=274.79ms
     iterations.....................: 44877   743.182464/s
     success_rate...................: 100.00% ✓ 44877      ✗ 0    
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

     checks.........................: 100.00% ✓ 98085      ✗ 0    
     data_received..................: 2.9 GB  47 MB/s
     data_sent......................: 38 MB   629 kB/s
     http_req_blocked...............: avg=25.65µs min=1.24µs  med=2.84µs  max=19.72ms  p(90)=4.13µs   p(95)=4.9µs    p(99.9)=13.33ms 
     http_req_connecting............: avg=21.79µs min=0s      med=0s      max=19.56ms  p(90)=0s       p(95)=0s       p(99.9)=12.98ms 
     http_req_duration..............: avg=91.27ms min=5.22ms  med=88.47ms max=514.89ms p(90)=112.19ms p(95)=123.61ms p(99.9)=308.03ms
       { expected_response:true }...: avg=91.27ms min=5.22ms  med=88.47ms max=514.89ms p(90)=112.19ms p(95)=123.61ms p(99.9)=308.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32795
     http_req_receiving.............: avg=81.89µs min=25.84µs med=46.78µs max=55.07ms  p(90)=95.69µs  p(95)=228.44µs p(99.9)=1.61ms  
     http_req_sending...............: avg=67.56µs min=5.32µs  med=10.97µs max=252.31ms p(90)=30.39µs  p(95)=129.81µs p(99.9)=5.14ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.12ms min=5.18ms  med=88.33ms max=509.72ms p(90)=112.04ms p(95)=123.46ms p(99.9)=299.8ms 
     http_reqs......................: 32795   540.158389/s
     iteration_duration.............: avg=91.79ms min=12.41ms med=88.71ms max=542.16ms p(90)=112.47ms p(95)=123.85ms p(99.9)=327.99ms
     iterations.....................: 32695   538.511314/s
     success_rate...................: 100.00% ✓ 32695      ✗ 0    
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
     ✗ no graphql errors
      ↳  99% — ✓ 23807 / ✗ 1
     ✓ valid response structure

     checks.........................: 99.99% ✓ 71423      ✗ 1    
     data_received..................: 2.1 GB 35 MB/s
     data_sent......................: 28 MB  459 kB/s
     http_req_blocked...............: avg=30.89µs  min=1.81µs  med=3.05µs   max=18.26ms  p(90)=4.56µs   p(95)=5.3µs    p(99.9)=13.09ms 
     http_req_connecting............: avg=27.22µs  min=0s      med=0s       max=18.11ms  p(90)=0s       p(95)=0s       p(99.9)=13.07ms 
     http_req_duration..............: avg=125.32ms min=5.76ms  med=124.52ms max=575.34ms p(90)=153.51ms p(95)=162.63ms p(99.9)=410.83ms
       { expected_response:true }...: avg=125.32ms min=5.76ms  med=124.52ms max=575.34ms p(90)=153.51ms p(95)=162.63ms p(99.9)=410.83ms
     http_req_failed................: 0.00%  ✓ 0          ✗ 23908
     http_req_receiving.............: avg=74.86µs  min=38.05µs med=55.1µs   max=1.99ms   p(90)=101.75µs p(95)=125.46µs p(99.9)=1.05ms  
     http_req_sending...............: avg=71.68µs  min=6.99µs  med=11.91µs  max=390.1ms  p(90)=19.78µs  p(95)=33.01µs  p(99.9)=3.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.17ms min=5.71ms  med=124.42ms max=574.96ms p(90)=153.4ms  p(95)=162.48ms p(99.9)=408.18ms
     http_reqs......................: 23908  393.561734/s
     iteration_duration.............: avg=126.13ms min=32.16ms med=124.83ms max=640.96ms p(90)=153.79ms p(95)=162.95ms p(99.9)=430.66ms
     iterations.....................: 23808  391.915583/s
     success_rate...................: 99.99% ✓ 23807      ✗ 1    
     vus............................: 50     min=50       max=50 
     vus_max........................: 50     min=50       max=50
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

     checks.........................: 100.00% ✓ 48768      ✗ 0    
     data_received..................: 1.4 GB  24 MB/s
     data_sent......................: 19 MB   312 kB/s
     http_req_blocked...............: avg=27.97µs  min=1.23µs med=2.74µs   max=15.03ms  p(90)=4.35µs   p(95)=5.36µs   p(99.9)=9.87ms  
     http_req_connecting............: avg=24.53µs  min=0s     med=0s       max=15ms     p(90)=0s       p(95)=0s       p(99.9)=9.81ms  
     http_req_duration..............: avg=183.21ms min=7.13ms med=175.93ms max=708.35ms p(90)=212.93ms p(95)=264.15ms p(99.9)=555.74ms
       { expected_response:true }...: avg=183.21ms min=7.13ms med=175.93ms max=708.35ms p(90)=212.93ms p(95)=264.15ms p(99.9)=555.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16356
     http_req_receiving.............: avg=105.81µs min=27µs   med=44.81µs  max=290.76ms p(90)=102.12µs p(95)=164.06µs p(99.9)=3.69ms  
     http_req_sending...............: avg=106.06µs min=5.4µs  med=10.93µs  max=365.3ms  p(90)=25.79µs  p(95)=120.83µs p(99.9)=10.29ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183ms    min=7.08ms med=175.79ms max=697.84ms p(90)=212.6ms  p(95)=263.82ms p(99.9)=546.45ms
     http_reqs......................: 16356   267.993997/s
     iteration_duration.............: avg=184.7ms  min=28.9ms med=176.25ms max=764.41ms p(90)=213.36ms p(95)=264.64ms p(99.9)=625.11ms
     iterations.....................: 16256   266.355491/s
     success_rate...................: 100.00% ✓ 16256      ✗ 0    
     vus............................: 25      min=25       max=50 
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

     checks.........................: 100.00% ✓ 12819     ✗ 0   
     data_received..................: 384 MB  6.2 MB/s
     data_sent......................: 5.1 MB  83 kB/s
     http_req_blocked...............: avg=130.12µs min=1.46µs   med=2.95µs   max=22.55ms  p(90)=4.3µs    p(95)=5.29µs   p(99.9)=20.81ms 
     http_req_connecting............: avg=120.83µs min=0s       med=0s       max=22.44ms  p(90)=0s       p(95)=0s       p(99.9)=20.43ms 
     http_req_duration..............: avg=687.72ms min=11.82ms  med=697.88ms max=964.75ms p(90)=774.64ms p(95)=812.11ms p(99.9)=946.79ms
       { expected_response:true }...: avg=687.72ms min=11.82ms  med=697.88ms max=964.75ms p(90)=774.64ms p(95)=812.11ms p(99.9)=946.79ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 4373
     http_req_receiving.............: avg=60.7µs   min=30.38µs  med=51.96µs  max=4.05ms   p(90)=89.25µs  p(95)=103.16µs p(99.9)=263.86µs
     http_req_sending...............: avg=104.82µs min=5.96µs   med=11.96µs  max=113.39ms p(90)=17.09µs  p(95)=23µs     p(99.9)=11.37ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=687.55ms min=11.78ms  med=697.8ms  max=964.67ms p(90)=774.5ms  p(95)=811.59ms p(99.9)=946.73ms
     http_reqs......................: 4373    70.94325/s
     iteration_duration.............: avg=703.92ms min=380.28ms med=699.08ms max=964.97ms p(90)=775.8ms  p(95)=813.19ms p(99.9)=953.01ms
     iterations.....................: 4273    69.320948/s
     success_rate...................: 100.00% ✓ 4273      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

