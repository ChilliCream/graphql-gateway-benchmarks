## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| grafbase                    | 1992  | 120124 total, 0 failed |  avg: 25ms, p95: 45ms  | ✅                                        |
| hive-router                 | 1934  | 116560 total, 0 failed |  avg: 26ms, p95: 43ms  | ✅                                        |
| hotchocolate (rust subgraphs) |  948  | 57290 total, 0 failed  |  avg: 52ms, p95: 73ms  | ✅                                        |
| hotchocolate (.net subgraphs) |  904  | 54610 total, 0 failed  |  avg: 55ms, p95: 78ms  | ✅                                        |
| cosmo                       |  715  | 43209 total, 0 failed  | avg: 69ms, p95: 101ms  | ✅                                        |
| hive-gateway-router-runtime |  503  | 30606 total, 0 failed  | avg: 98ms, p95: 132ms  | ✅                                        |
| apollo-router               |  417  | 25333 total, 0 failed  | avg: 118ms, p95: 153ms | ✅                                        |
| hive-gateway                |  252  | 15388 total, 0 failed  | avg: 195ms, p95: 280ms | ✅                                        |
| apollo-gateway              |   69  |  4305 total, 0 failed  | avg: 699ms, p95: 810ms | ✅                                        |


<details>
  <summary>Summary for: grafbase</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 360072      ✗ 0     
     data_received..................: 11 GB   175 MB/s
     data_sent......................: 140 MB  2.3 MB/s
     http_req_blocked...............: avg=5.69µs  min=1.46µs  med=2.97µs  max=9.46ms   p(90)=4.11µs   p(95)=4.68µs   p(99.9)=72.48µs
     http_req_connecting............: avg=2.11µs  min=0s      med=0s      max=9.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.75ms min=2.46ms  med=21.79ms max=421.14ms p(90)=39.27ms  p(95)=44.84ms  p(99.9)=73.1ms 
       { expected_response:true }...: avg=24.75ms min=2.46ms  med=21.79ms max=421.14ms p(90)=39.27ms  p(95)=44.84ms  p(99.9)=73.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 120124
     http_req_receiving.............: avg=129µs   min=24.86µs med=46.74µs max=46.67ms  p(90)=168.37µs p(95)=382.7µs  p(99.9)=11.89ms
     http_req_sending...............: avg=91.63µs min=6.4µs   med=11.38µs max=275.35ms p(90)=86.84µs  p(95)=139.29µs p(99.9)=12.73ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.53ms min=2.4ms   med=21.63ms max=419.8ms  p(90)=38.82ms  p(95)=44.49ms  p(99.9)=70.13ms
     http_reqs......................: 120124  1992.138631/s
     iteration_duration.............: avg=24.98ms min=4.17ms  med=21.99ms max=443.83ms p(90)=39.48ms  p(95)=45.05ms  p(99.9)=73.69ms
     iterations.....................: 120024  1990.480229/s
     success_rate...................: 100.00% ✓ 120024      ✗ 0     
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

     checks.........................: 100.00% ✓ 349380      ✗ 0     
     data_received..................: 10 GB   170 MB/s
     data_sent......................: 136 MB  2.3 MB/s
     http_req_blocked...............: avg=16.22µs  min=1.16µs med=2.42µs  max=57.39ms  p(90)=3.57µs   p(95)=4.27µs   p(99.9)=52.49µs
     http_req_connecting............: avg=13.26µs  min=0s     med=0s      max=57.26ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.53ms  min=1.87ms med=23.64ms max=398.62ms p(90)=38.2ms   p(95)=43.4ms   p(99.9)=81.72ms
       { expected_response:true }...: avg=25.53ms  min=1.87ms med=23.64ms max=398.62ms p(90)=38.2ms   p(95)=43.4ms   p(99.9)=81.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 116560
     http_req_receiving.............: avg=106.64µs min=25.3µs med=44.05µs max=37.92ms  p(90)=127.85µs p(95)=332.66µs p(99.9)=7.4ms  
     http_req_sending...............: avg=88.19µs  min=5.31µs med=10.17µs max=193.46ms p(90)=54.15µs  p(95)=130.23µs p(99.9)=9.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=25.33ms  min=1.83ms med=23.49ms max=293.51ms p(90)=37.94ms  p(95)=43.14ms  p(99.9)=79.94ms
     http_reqs......................: 116560  1934.646473/s
     iteration_duration.............: avg=25.75ms  min=3.54ms med=23.83ms max=459.14ms p(90)=38.39ms  p(95)=43.58ms  p(99.9)=84.57ms
     iterations.....................: 116460  1932.986687/s
     success_rate...................: 100.00% ✓ 116460      ✗ 0     
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

     checks.........................: 100.00% ✓ 171570     ✗ 0    
     data_received..................: 5.0 GB  83 MB/s
     data_sent......................: 67 MB   1.1 MB/s
     http_req_blocked...............: avg=13.19µs min=1.31µs  med=2.8µs   max=19.81ms  p(90)=3.98µs  p(95)=4.71µs  p(99.9)=125.25µs
     http_req_connecting............: avg=9.42µs  min=0s      med=0s      max=19.67ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=52.14ms min=3.23ms  med=51.21ms max=479.43ms p(90)=67.46ms p(95)=73.01ms p(99.9)=208.82ms
       { expected_response:true }...: avg=52.14ms min=3.23ms  med=51.21ms max=479.43ms p(90)=67.46ms p(95)=73.01ms p(99.9)=208.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 57290
     http_req_receiving.............: avg=5.46ms  min=54.62µs med=5.05ms  max=169.26ms p(90)=10.82ms p(95)=13.27ms p(99.9)=38.99ms 
     http_req_sending...............: avg=68.05µs min=5.98µs  med=11.48µs max=250.68ms p(90)=30.6µs  p(95)=132.5µs p(99.9)=5.85ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=46.61ms min=3.15ms  med=45.25ms max=478.57ms p(90)=61.79ms p(95)=67.77ms p(99.9)=200.49ms
     http_reqs......................: 57290   948.487453/s
     iteration_duration.............: avg=52.45ms min=13.07ms med=51.44ms max=509.53ms p(90)=67.68ms p(95)=73.23ms p(99.9)=224.01ms
     iterations.....................: 57190   946.831864/s
     success_rate...................: 100.00% ✓ 57190      ✗ 0    
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

     checks.........................: 100.00% ✓ 163530     ✗ 0    
     data_received..................: 4.8 GB  79 MB/s
     data_sent......................: 64 MB   1.1 MB/s
     http_req_blocked...............: avg=18.45µs min=1.24µs  med=2.75µs  max=23.92ms  p(90)=3.88µs  p(95)=4.63µs  p(99.9)=179.52µs
     http_req_connecting............: avg=14.72µs min=0s      med=0s      max=23.49ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=54.68ms min=2.55ms  med=53.12ms max=531.4ms  p(90)=70.76ms p(95)=78.26ms p(99.9)=237.3ms 
       { expected_response:true }...: avg=54.68ms min=2.55ms  med=53.12ms max=531.4ms  p(90)=70.76ms p(95)=78.26ms p(99.9)=237.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 54610
     http_req_receiving.............: avg=5.93ms  min=52.25µs med=5.56ms  max=53.48ms  p(90)=11.7ms  p(95)=14.25ms p(99.9)=35.63ms 
     http_req_sending...............: avg=67.54µs min=5.63µs  med=11.12µs max=282.66ms p(90)=29.91µs p(95)=128.4µs p(99.9)=5.31ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=48.67ms min=2.47ms  med=46.77ms max=527.06ms p(90)=64.86ms p(95)=72.51ms p(99.9)=224.69ms
     http_reqs......................: 54610   904.108752/s
     iteration_duration.............: avg=55.03ms min=8.95ms  med=53.34ms max=610.54ms p(90)=70.99ms p(95)=78.48ms p(99.9)=276.44ms
     iterations.....................: 54510   902.453179/s
     success_rate...................: 100.00% ✓ 54510      ✗ 0    
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

     checks.........................: 100.00% ✓ 129327     ✗ 0    
     data_received..................: 3.8 GB  63 MB/s
     data_sent......................: 50 MB   833 kB/s
     http_req_blocked...............: avg=9.19µs   min=1.35µs  med=2.71µs  max=10.49ms  p(90)=4.05µs   p(95)=5.09µs   p(99.9)=1.18ms  
     http_req_connecting............: avg=5.88µs   min=0s      med=0s      max=10.45ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=69.2ms   min=2.68ms  med=68.32ms max=507.2ms  p(90)=93.51ms  p(95)=100.78ms p(99.9)=267.36ms
       { expected_response:true }...: avg=69.2ms   min=2.68ms  med=68.32ms max=507.2ms  p(90)=93.51ms  p(95)=100.78ms p(99.9)=267.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 43209
     http_req_receiving.............: avg=172.62µs min=33.57µs med=79.71µs max=83.26ms  p(90)=159.26µs p(95)=384.64µs p(99.9)=15.53ms 
     http_req_sending...............: avg=62.61µs  min=5.89µs  med=11.38µs max=224.72ms p(90)=28.42µs  p(95)=134.2µs  p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=68.96ms  min=2.62ms  med=68.1ms  max=506.19ms p(90)=93.31ms  p(95)=100.52ms p(99.9)=248.14ms
     http_reqs......................: 43209   715.401323/s
     iteration_duration.............: avg=69.61ms  min=5.04ms  med=68.59ms max=534.33ms p(90)=93.74ms  p(95)=101.03ms p(99.9)=292.84ms
     iterations.....................: 43109   713.745647/s
     success_rate...................: 100.00% ✓ 43109      ✗ 0    
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

     checks.........................: 100.00% ✓ 91518      ✗ 0    
     data_received..................: 2.7 GB  44 MB/s
     data_sent......................: 36 MB   587 kB/s
     http_req_blocked...............: avg=26.68µs min=1.17µs  med=2.88µs  max=19.08ms  p(90)=4.73µs   p(95)=5.91µs   p(99.9)=13.18ms 
     http_req_connecting............: avg=22.97µs min=0s      med=0s      max=19.04ms  p(90)=0s       p(95)=0s       p(99.9)=12.93ms 
     http_req_duration..............: avg=97.76ms min=5.73ms  med=94.54ms max=536.11ms p(90)=119.32ms p(95)=132.17ms p(99.9)=339.23ms
       { expected_response:true }...: avg=97.76ms min=5.73ms  med=94.54ms max=536.11ms p(90)=119.32ms p(95)=132.17ms p(99.9)=339.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30606
     http_req_receiving.............: avg=93.42µs min=25.42µs med=48.47µs max=126.67ms p(90)=111.61µs p(95)=255.09µs p(99.9)=2.02ms  
     http_req_sending...............: avg=76.41µs min=5.43µs  med=11.44µs max=233.25ms p(90)=32.65µs  p(95)=136.23µs p(99.9)=6.46ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.59ms min=5.66ms  med=94.41ms max=530.6ms  p(90)=119.14ms p(95)=132ms    p(99.9)=318.7ms 
     http_reqs......................: 30606   503.517788/s
     iteration_duration.............: avg=98.36ms min=19.33ms med=94.81ms max=596.94ms p(90)=119.6ms  p(95)=132.4ms  p(99.9)=376.43ms
     iterations.....................: 30506   501.872628/s
     success_rate...................: 100.00% ✓ 30506      ✗ 0    
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

     checks.........................: 100.00% ✓ 75699      ✗ 0    
     data_received..................: 2.2 GB  37 MB/s
     data_sent......................: 30 MB   486 kB/s
     http_req_blocked...............: avg=25.9µs   min=1.87µs  med=2.83µs   max=20.42ms  p(90)=4.16µs   p(95)=4.85µs   p(99.9)=11.35ms 
     http_req_connecting............: avg=22.52µs  min=0s      med=0s       max=20.39ms  p(90)=0s       p(95)=0s       p(99.9)=11.18ms 
     http_req_duration..............: avg=118.24ms min=5.67ms  med=117.42ms max=563.09ms p(90)=144.48ms p(95)=152.83ms p(99.9)=381.05ms
       { expected_response:true }...: avg=118.24ms min=5.67ms  med=117.42ms max=563.09ms p(90)=144.48ms p(95)=152.83ms p(99.9)=381.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 25333
     http_req_receiving.............: avg=79.82µs  min=34µs    med=51.66µs  max=269.97ms p(90)=94.87µs  p(95)=114.67µs p(99.9)=1ms     
     http_req_sending...............: avg=75.84µs  min=7.09µs  med=11.3µs   max=311.17ms p(90)=18.14µs  p(95)=30.66µs  p(99.9)=5.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.08ms min=5.61ms  med=117.33ms max=546.12ms p(90)=144.37ms p(95)=152.73ms p(99.9)=375.33ms
     http_reqs......................: 25333   417.303564/s
     iteration_duration.............: avg=118.94ms min=25.75ms med=117.74ms max=592.51ms p(90)=144.73ms p(95)=153.16ms p(99.9)=399.54ms
     iterations.....................: 25233   415.656291/s
     success_rate...................: 100.00% ✓ 25233      ✗ 0    
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

     checks.........................: 100.00% ✓ 45864      ✗ 0    
     data_received..................: 1.4 GB  22 MB/s
     data_sent......................: 18 MB   294 kB/s
     http_req_blocked...............: avg=23.76µs  min=1.23µs  med=2.84µs   max=11.64ms  p(90)=4.83µs   p(95)=5.89µs   p(99.9)=8.4ms   
     http_req_connecting............: avg=20.16µs  min=0s      med=0s       max=11.61ms  p(90)=0s       p(95)=0s       p(99.9)=8.37ms  
     http_req_duration..............: avg=194.99ms min=7.19ms  med=190.32ms max=626.84ms p(90)=236.65ms p(95)=279.68ms p(99.9)=488.18ms
       { expected_response:true }...: avg=194.99ms min=7.19ms  med=190.32ms max=626.84ms p(90)=236.65ms p(95)=279.68ms p(99.9)=488.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 15388
     http_req_receiving.............: avg=102.65µs min=27.15µs med=47.52µs  max=250.42ms p(90)=107.69µs p(95)=176.26µs p(99.9)=2.14ms  
     http_req_sending...............: avg=94.13µs  min=5.44µs  med=11.28µs  max=344.4ms  p(90)=28.33µs  p(95)=127.16µs p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.79ms min=7.14ms  med=190.21ms max=614.68ms p(90)=236.48ms p(95)=279.44ms p(99.9)=482.07ms
     http_reqs......................: 15388   252.153518/s
     iteration_duration.............: avg=196.52ms min=36.77ms med=190.76ms max=662.22ms p(90)=237.22ms p(95)=280.37ms p(99.9)=519.6ms 
     iterations.....................: 15288   250.51488/s
     success_rate...................: 100.00% ✓ 15288      ✗ 0    
     vus............................: 15      min=15       max=50 
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

     checks.........................: 100.00% ✓ 12615     ✗ 0   
     data_received..................: 378 MB  6.1 MB/s
     data_sent......................: 5.0 MB  81 kB/s
     http_req_blocked...............: avg=130.14µs min=1.4µs    med=3µs      max=21.4ms   p(90)=4.56µs   p(95)=5.33µs   p(99.9)=19.49ms 
     http_req_connecting............: avg=125.31µs min=0s       med=0s       max=21.26ms  p(90)=0s       p(95)=0s       p(99.9)=19.36ms 
     http_req_duration..............: avg=699.25ms min=11.91ms  med=713.29ms max=1.08s    p(90)=778.43ms p(95)=809.83ms p(99.9)=1.01s   
       { expected_response:true }...: avg=699.25ms min=11.91ms  med=713.29ms max=1.08s    p(90)=778.43ms p(95)=809.83ms p(99.9)=1.01s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 4305
     http_req_receiving.............: avg=63.11µs  min=30.21µs  med=54.47µs  max=749.34µs p(90)=93.96µs  p(95)=109.47µs p(99.9)=291.25µs
     http_req_sending...............: avg=101.83µs min=6.39µs   med=12.39µs  max=202.74ms p(90)=19.2µs   p(95)=22.75µs  p(99.9)=6.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=699.09ms min=11.85ms  med=713.23ms max=1.08s    p(90)=778.33ms p(95)=809.7ms  p(99.9)=1.01s   
     http_reqs......................: 4305    69.633586/s
     iteration_duration.............: avg=716.38ms min=477.53ms med=714.34ms max=1.11s    p(90)=780.18ms p(95)=812.77ms p(99.9)=1.1s    
     iterations.....................: 4205    68.016082/s
     success_rate...................: 100.00% ✓ 4205      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

