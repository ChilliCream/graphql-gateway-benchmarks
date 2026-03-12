## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| grafbase                    | 1946  | 117391 total, 0 failed |  avg: 25ms, p95: 46ms  | ✅                                        |
| hotchocolate (rust subgraphs) |  932  | 56304 total, 0 failed  | avg: 53ms, p95: 142ms  | ✅                                        |
| hotchocolate (.net subgraphs) |  861  | 52028 total, 0 failed  | avg: 57ms, p95: 160ms  | ✅                                        |
| cosmo                       |  771  | 46598 total, 0 failed  |  avg: 64ms, p95: 93ms  | ✅                                        |
| hive-gateway-router-runtime |  526  | 31987 total, 0 failed  | avg: 94ms, p95: 129ms  | ✅                                        |
| apollo-router               |  359  | 21882 total, 0 failed  | avg: 137ms, p95: 179ms | ✅                                        |
| hive-gateway                |  274  | 16723 total, 0 failed  | avg: 179ms, p95: 254ms | ✅                                        |
| apollo-gateway              |   71  |  4408 total, 0 failed  | avg: 685ms, p95: 797ms | ✅                                        |


<details>
  <summary>Summary for: grafbase</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 351873      ✗ 0     
     data_received..................: 10 GB   171 MB/s
     data_sent......................: 137 MB  2.3 MB/s
     http_req_blocked...............: avg=9.22µs   min=1.27µs  med=2.96µs  max=18.76ms  p(90)=4.2µs    p(95)=4.86µs   p(99.9)=108.85µs
     http_req_connecting............: avg=5.69µs   min=0s      med=0s      max=18.6ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.33ms  min=2.44ms  med=22.33ms max=444.1ms  p(90)=40.25ms  p(95)=46.02ms  p(99.9)=74.79ms 
       { expected_response:true }...: avg=25.33ms  min=2.44ms  med=22.33ms max=444.1ms  p(90)=40.25ms  p(95)=46.02ms  p(99.9)=74.79ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 117391
     http_req_receiving.............: avg=132.66µs min=25.21µs med=47.66µs max=56.96ms  p(90)=170.83µs p(95)=384.04µs p(99.9)=13.29ms 
     http_req_sending...............: avg=89.98µs  min=5.56µs  med=11.55µs max=387.67ms p(90)=89.38µs  p(95)=141.36µs p(99.9)=11.95ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=25.11ms  min=2.39ms  med=22.18ms max=420.57ms p(90)=39.86ms  p(95)=45.6ms   p(99.9)=73.17ms 
     http_reqs......................: 117391  1946.656021/s
     iteration_duration.............: avg=25.56ms  min=4.03ms  med=22.54ms max=477.96ms p(90)=40.47ms  p(95)=46.23ms  p(99.9)=75.81ms 
     iterations.....................: 117291  1944.997754/s
     success_rate...................: 100.00% ✓ 117291      ✗ 0     
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

     checks.........................: 100.00% ✓ 168612     ✗ 0    
     data_received..................: 4.9 GB  82 MB/s
     data_sent......................: 66 MB   1.1 MB/s
     http_req_blocked...............: avg=14.76µs min=1.29µs  med=2.72µs  max=19.28ms  p(90)=3.7µs    p(95)=4.19µs   p(99.9)=121.47µs
     http_req_connecting............: avg=11.49µs min=0s      med=0s      max=19.24ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=53.05ms min=3.2ms   med=37.9ms  max=533.16ms p(90)=112.11ms p(95)=141.92ms p(99.9)=336.02ms
       { expected_response:true }...: avg=53.05ms min=3.2ms   med=37.9ms  max=533.16ms p(90)=112.11ms p(95)=141.92ms p(99.9)=336.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 56304
     http_req_receiving.............: avg=1.57ms  min=52.93µs med=102.6µs max=234.05ms p(90)=2.39ms   p(95)=7.11ms   p(99.9)=94.71ms 
     http_req_sending...............: avg=58.21µs min=6.05µs  med=11.21µs max=185.47ms p(90)=17.97µs  p(95)=121.86µs p(99.9)=4.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=51.41ms min=3.13ms  med=36.48ms max=533.04ms p(90)=108.9ms  p(95)=138.53ms p(99.9)=326.11ms
     http_reqs......................: 56304   932.381578/s
     iteration_duration.............: avg=53.36ms min=3.56ms  med=38.18ms max=533.34ms p(90)=112.47ms p(95)=142.28ms p(99.9)=338.5ms 
     iterations.....................: 56204   930.725601/s
     success_rate...................: 100.00% ✓ 56204      ✗ 0    
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

     checks.........................: 100.00% ✓ 155784     ✗ 0    
     data_received..................: 4.6 GB  76 MB/s
     data_sent......................: 61 MB   1.0 MB/s
     http_req_blocked...............: avg=16.65µs min=1.49µs  med=2.88µs   max=19.61ms  p(90)=3.94µs   p(95)=4.53µs   p(99.9)=205.56µs
     http_req_connecting............: avg=13.16µs min=0s      med=0s       max=19.49ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=57.42ms min=2.59ms  med=39.14ms  max=744.98ms p(90)=124.71ms p(95)=159.78ms p(99.9)=397.69ms
       { expected_response:true }...: avg=57.42ms min=2.59ms  med=39.14ms  max=744.98ms p(90)=124.71ms p(95)=159.78ms p(99.9)=397.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52028
     http_req_receiving.............: avg=1.69ms  min=55.38µs med=106.14µs max=272.45ms p(90)=2.25ms   p(95)=5.92ms   p(99.9)=110.49ms
     http_req_sending...............: avg=54.52µs min=6.04µs  med=11.35µs  max=338.08ms p(90)=18.82µs  p(95)=123.02µs p(99.9)=3.82ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=55.66ms min=2.52ms  med=37.8ms   max=744.77ms p(90)=120.78ms p(95)=155.61ms p(99.9)=393.25ms
     http_reqs......................: 52028   861.638479/s
     iteration_duration.............: avg=57.77ms min=2.85ms  med=39.42ms  max=745.17ms p(90)=125.04ms p(95)=160.21ms p(99.9)=405.15ms
     iterations.....................: 51928   859.982374/s
     success_rate...................: 100.00% ✓ 51928      ✗ 0    
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

     checks.........................: 100.00% ✓ 139494     ✗ 0    
     data_received..................: 4.1 GB  68 MB/s
     data_sent......................: 54 MB   899 kB/s
     http_req_blocked...............: avg=14.8µs   min=1.27µs  med=2.72µs  max=22.6ms   p(90)=3.72µs   p(95)=4.3µs    p(99.9)=4.22ms  
     http_req_connecting............: avg=11.45µs  min=0s      med=0s      max=22.55ms  p(90)=0s       p(95)=0s       p(99.9)=4.19ms  
     http_req_duration..............: avg=64.14ms  min=2.66ms  med=63.3ms  max=480.58ms p(90)=86.45ms  p(95)=93.03ms  p(99.9)=252.73ms
       { expected_response:true }...: avg=64.14ms  min=2.66ms  med=63.3ms  max=480.58ms p(90)=86.45ms  p(95)=93.03ms  p(99.9)=252.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46598
     http_req_receiving.............: avg=156.37µs min=26.73µs med=68.28µs max=143.89ms p(90)=139.89µs p(95)=341.75µs p(99.9)=14.7ms  
     http_req_sending...............: avg=53.68µs  min=5.66µs  med=10.84µs max=295.67ms p(90)=27.26µs  p(95)=122.58µs p(99.9)=5.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=63.93ms  min=2.57ms  med=63.11ms max=464.14ms p(90)=86.25ms  p(95)=92.84ms  p(99.9)=237.45ms
     http_reqs......................: 46598   771.85497/s
     iteration_duration.............: avg=64.52ms  min=5.59ms  med=63.54ms max=530.9ms  p(90)=86.68ms  p(95)=93.25ms  p(99.9)=267.81ms
     iterations.....................: 46498   770.198558/s
     success_rate...................: 100.00% ✓ 46498      ✗ 0    
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

     checks.........................: 100.00% ✓ 95661      ✗ 0    
     data_received..................: 2.8 GB  46 MB/s
     data_sent......................: 37 MB   614 kB/s
     http_req_blocked...............: avg=16.98µs min=1.26µs  med=2.87µs  max=17.69ms  p(90)=4.34µs   p(95)=5.33µs   p(99.9)=5.9ms   
     http_req_connecting............: avg=13.43µs min=0s      med=0s      max=17.65ms  p(90)=0s       p(95)=0s       p(99.9)=5.86ms  
     http_req_duration..............: avg=93.56ms min=5.41ms  med=90.37ms max=602.41ms p(90)=115.61ms p(95)=129.16ms p(99.9)=390.27ms
       { expected_response:true }...: avg=93.56ms min=5.41ms  med=90.37ms max=602.41ms p(90)=115.61ms p(95)=129.16ms p(99.9)=390.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31987
     http_req_receiving.............: avg=98.81µs min=27.5µs  med=49.12µs max=267.28ms p(90)=103.86µs p(95)=259.87µs p(99.9)=2.92ms  
     http_req_sending...............: avg=84.33µs min=5.73µs  med=11.55µs max=364.89ms p(90)=32.02µs  p(95)=135.53µs p(99.9)=9.59ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.38ms min=5.36ms  med=90.21ms max=581.92ms p(90)=115.43ms p(95)=128.93ms p(99.9)=379.24ms
     http_reqs......................: 31987   526.968872/s
     iteration_duration.............: avg=94.11ms min=16.37ms med=90.64ms max=641.7ms  p(90)=115.87ms p(95)=129.51ms p(99.9)=406.79ms
     iterations.....................: 31887   525.321425/s
     success_rate...................: 100.00% ✓ 31887      ✗ 0    
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

     checks.........................: 100.00% ✓ 65346      ✗ 0    
     data_received..................: 1.9 GB  32 MB/s
     data_sent......................: 26 MB   419 kB/s
     http_req_blocked...............: avg=15.73µs  min=1.97µs  med=3.41µs   max=10.14ms  p(90)=5.18µs   p(95)=5.96µs   p(99.9)=5.74ms  
     http_req_connecting............: avg=11.7µs   min=0s      med=0s       max=10.09ms  p(90)=0s       p(95)=0s       p(99.9)=5.72ms  
     http_req_duration..............: avg=136.91ms min=6.17ms  med=135.84ms max=599.43ms p(90)=168.56ms p(95)=178.86ms p(99.9)=438.29ms
       { expected_response:true }...: avg=136.91ms min=6.17ms  med=135.84ms max=599.43ms p(90)=168.56ms p(95)=178.86ms p(99.9)=438.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 21882
     http_req_receiving.............: avg=95.67µs  min=39.58µs med=61.28µs  max=303.68ms p(90)=110.55µs p(95)=136.28µs p(99.9)=1.15ms  
     http_req_sending...............: avg=92.98µs  min=8.92µs  med=13.16µs  max=272.42ms p(90)=21.6µs   p(95)=34µs     p(99.9)=11.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=136.72ms min=6.1ms   med=135.71ms max=588.81ms p(90)=168.4ms  p(95)=178.58ms p(99.9)=420.29ms
     http_reqs......................: 21882   359.942553/s
     iteration_duration.............: avg=137.82ms min=24.87ms med=136.19ms max=639.39ms p(90)=168.87ms p(95)=179.17ms p(99.9)=479.09ms
     iterations.....................: 21782   358.297627/s
     success_rate...................: 100.00% ✓ 21782      ✗ 0    
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

     checks.........................: 100.00% ✓ 49869      ✗ 0    
     data_received..................: 1.5 GB  24 MB/s
     data_sent......................: 20 MB   319 kB/s
     http_req_blocked...............: avg=46µs     min=1.23µs  med=2.68µs   max=19.99ms  p(90)=4.34µs   p(95)=5.34µs   p(99.9)=16.6ms  
     http_req_connecting............: avg=42.34µs  min=0s      med=0s       max=19.95ms  p(90)=0s       p(95)=0s       p(99.9)=16.57ms 
     http_req_duration..............: avg=179.24ms min=7.27ms  med=173.24ms max=685.78ms p(90)=213.64ms p(95)=254.27ms p(99.9)=503.72ms
       { expected_response:true }...: avg=179.24ms min=7.27ms  med=173.24ms max=685.78ms p(90)=213.64ms p(95)=254.27ms p(99.9)=503.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16723
     http_req_receiving.............: avg=79.68µs  min=26µs    med=44.47µs  max=10.46ms  p(90)=101.57µs p(95)=180.47µs p(99.9)=2ms     
     http_req_sending...............: avg=84.26µs  min=5.26µs  med=10.97µs  max=233.41ms p(90)=28.39µs  p(95)=126.16µs p(99.9)=3.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.08ms min=7.22ms  med=173.1ms  max=681.97ms p(90)=213.38ms p(95)=253.96ms p(99.9)=503.43ms
     http_reqs......................: 16723   274.046473/s
     iteration_duration.............: avg=180.68ms min=39.43ms med=173.57ms max=751.91ms p(90)=214.08ms p(95)=255.09ms p(99.9)=562.56ms
     iterations.....................: 16623   272.407733/s
     success_rate...................: 100.00% ✓ 16623      ✗ 0    
     vus............................: 34      min=34       max=50 
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

     checks.........................: 100.00% ✓ 12924     ✗ 0   
     data_received..................: 387 MB  6.3 MB/s
     data_sent......................: 5.1 MB  83 kB/s
     http_req_blocked...............: avg=139.02µs min=1.41µs   med=2.8µs    max=20.39ms  p(90)=4.06µs   p(95)=4.84µs   p(99.9)=19.7ms  
     http_req_connecting............: avg=134.94µs min=0s       med=0s       max=20.35ms  p(90)=0s       p(95)=0s       p(99.9)=19.62ms 
     http_req_duration..............: avg=684.66ms min=11.87ms  med=700.61ms max=963.62ms p(90)=759.18ms p(95)=797.07ms p(99.9)=947.9ms 
       { expected_response:true }...: avg=684.66ms min=11.87ms  med=700.61ms max=963.62ms p(90)=759.18ms p(95)=797.07ms p(99.9)=947.9ms 
     http_req_failed................: 0.00%   ✓ 0         ✗ 4408
     http_req_receiving.............: avg=79.47µs  min=29.72µs  med=49.48µs  max=97.02ms  p(90)=86.03µs  p(95)=98.57µs  p(99.9)=304.79µs
     http_req_sending...............: avg=83.69µs  min=5.99µs   med=11.56µs  max=138.04ms p(90)=17.11µs  p(95)=21.2µs   p(99.9)=5.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=684.49ms min=11.83ms  med=700.53ms max=963.56ms p(90)=759.1ms  p(95)=796.85ms p(99.9)=947.68ms
     http_reqs......................: 4408    71.288/s
     iteration_duration.............: avg=700.77ms min=449.47ms med=701.65ms max=970.2ms  p(90)=759.67ms p(95)=797.97ms p(99.9)=963.83ms
     iterations.....................: 4308    69.670758/s
     success_rate...................: 100.00% ✓ 4308      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

