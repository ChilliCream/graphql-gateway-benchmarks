## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hotchocolate (rust subgraphs) | 4283  | 257381 total, 0 failed |  avg: 12ms, p95: 26ms  | ❌ non-compatible response structure (257281) |
| hive-router                 | 2034  | 122555 total, 0 failed |  avg: 24ms, p95: 43ms  | ✅                                        |
| grafbase                    | 2001  | 120679 total, 0 failed |  avg: 25ms, p95: 45ms  | ✅                                        |
| hotchocolate (.net subgraphs) |  954  | 57601 total, 0 failed  |  avg: 52ms, p95: 75ms  | ✅                                        |
| cosmo                       |  776  | 46861 total, 0 failed  |  avg: 64ms, p95: 93ms  | ✅                                        |
| hive-gateway-router-runtime |  531  | 32295 total, 0 failed  | avg: 93ms, p95: 127ms  | ✅                                        |
| apollo-router               |  378  | 23021 total, 0 failed  | avg: 130ms, p95: 169ms | ✅                                        |
| hive-gateway                |  256  | 15670 total, 0 failed  | avg: 192ms, p95: 274ms | ✅                                        |
| apollo-gateway              |   71  |  4425 total, 0 failed  | avg: 680ms, p95: 805ms | ✅                                        |


<details>
  <summary>Summary for: hotchocolate (rust subgraphs)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  0% — ✓ 0 / ✗ 257281
     ✗ valid response structure
      ↳  99% — ✓ 257231 / ✗ 50

     checks.........................: 66.66% ✓ 514512      ✗ 257331
     data_received..................: 67 MB  1.1 MB/s
     data_sent......................: 300 MB 5.0 MB/s
     http_req_blocked...............: avg=3.98µs  min=1.2µs    med=2.63µs  max=13.21ms  p(90)=3.32µs  p(95)=3.68µs  p(99.9)=29.13µs
     http_req_connecting............: avg=1.09µs  min=0s       med=0s      max=13.15ms  p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=11.55ms min=277.68µs med=9.28ms  max=152.94ms p(90)=22.06ms p(95)=25.99ms p(99.9)=53.49ms
       { expected_response:true }...: avg=11.55ms min=277.68µs med=9.28ms  max=152.94ms p(90)=22.06ms p(95)=25.99ms p(99.9)=53.49ms
     http_req_failed................: 0.00%  ✓ 0           ✗ 257381
     http_req_receiving.............: avg=45.8µs  min=10.36µs  med=21.31µs max=58ms     p(90)=25.61µs p(95)=40.86µs p(99.9)=4.28ms 
     http_req_sending...............: avg=25.96µs min=4.52µs   med=9.81µs  max=41.63ms  p(90)=11.79µs p(95)=17.87µs p(99.9)=3.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=11.48ms min=244.7µs  med=9.23ms  max=152.9ms  p(90)=21.95ms p(95)=25.86ms p(99.9)=52.84ms
     http_reqs......................: 257381 4283.42125/s
     iteration_duration.............: avg=11.65ms min=371.2µs  med=9.37ms  max=153.04ms p(90)=22.15ms p(95)=26.09ms p(99.9)=53.72ms
     iterations.....................: 257281 4281.757016/s
     success_rate...................: 0.00%  ✓ 0           ✗ 257281
     vus............................: 50     min=50        max=50  
     vus_max........................: 50     min=50        max=50
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

     checks.........................: 100.00% ✓ 367365      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 143 MB  2.4 MB/s
     http_req_blocked...............: avg=10.08µs  min=1.16µs  med=2.36µs  max=26.42ms  p(90)=3.51µs   p(95)=4.16µs   p(99.9)=72.17µs
     http_req_connecting............: avg=7.14µs   min=0s      med=0s      max=26.39ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.28ms  min=1.95ms  med=22.27ms max=421.75ms p(90)=37.63ms  p(95)=42.66ms  p(99.9)=76.41ms
       { expected_response:true }...: avg=24.28ms  min=1.95ms  med=22.27ms max=421.75ms p(90)=37.63ms  p(95)=42.66ms  p(99.9)=76.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 122555
     http_req_receiving.............: avg=110.26µs min=24.91µs med=43.23µs max=87.42ms  p(90)=141.12µs p(95)=327µs    p(99.9)=9.43ms 
     http_req_sending...............: avg=97.18µs  min=5.2µs   med=10.03µs max=183.04ms p(90)=63.18µs  p(95)=130.51µs p(99.9)=10.36ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.07ms  min=1.91ms  med=22.13ms max=267.92ms p(90)=37.35ms  p(95)=42.34ms  p(99.9)=75.06ms
     http_reqs......................: 122555  2034.47228/s
     iteration_duration.............: avg=24.48ms  min=3.02ms  med=22.46ms max=449.71ms p(90)=37.82ms  p(95)=42.85ms  p(99.9)=77.36ms
     iterations.....................: 122455  2032.812232/s
     success_rate...................: 100.00% ✓ 122455      ✗ 0     
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

     checks.........................: 100.00% ✓ 361737      ✗ 0     
     data_received..................: 11 GB   176 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=8.46µs   min=1.27µs  med=2.88µs  max=17.72ms  p(90)=4µs     p(95)=4.54µs   p(99.9)=52.31µs
     http_req_connecting............: avg=5.04µs   min=0s      med=0s      max=17.58ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.64ms  min=2.49ms  med=21.69ms max=434.46ms p(90)=38.93ms p(95)=44.56ms  p(99.9)=73.29ms
       { expected_response:true }...: avg=24.64ms  min=2.49ms  med=21.69ms max=434.46ms p(90)=38.93ms p(95)=44.56ms  p(99.9)=73.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 120679
     http_req_receiving.............: avg=126.06µs min=24.34µs med=46.17µs max=39.17ms  p(90)=164.4µs p(95)=372.72µs p(99.9)=12.03ms
     http_req_sending...............: avg=82.11µs  min=5.5µs   med=11.22µs max=167.35ms p(90)=83.68µs p(95)=136.63µs p(99.9)=10.6ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.43ms  min=2.43ms  med=21.55ms max=432.68ms p(90)=38.49ms p(95)=44.2ms   p(99.9)=72.01ms
     http_reqs......................: 120679  2001.15742/s
     iteration_duration.............: avg=24.86ms  min=4.15ms  med=21.9ms  max=460.02ms p(90)=39.14ms p(95)=44.77ms  p(99.9)=74.39ms
     iterations.....................: 120579  1999.499172/s
     success_rate...................: 100.00% ✓ 120579      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 172503     ✗ 0    
     data_received..................: 5.0 GB  84 MB/s
     data_sent......................: 67 MB   1.1 MB/s
     http_req_blocked...............: avg=14.21µs min=1.42µs  med=2.95µs  max=20.49ms  p(90)=4.27µs  p(95)=5.11µs   p(99.9)=134.29µs
     http_req_connecting............: avg=10.44µs min=0s      med=0s      max=20.33ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=51.85ms min=3.07ms  med=50.4ms  max=479.61ms p(90)=68.34ms p(95)=74.57ms  p(99.9)=206.02ms
       { expected_response:true }...: avg=51.85ms min=3.07ms  med=50.4ms  max=479.61ms p(90)=68.34ms p(95)=74.57ms  p(99.9)=206.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 57601
     http_req_receiving.............: avg=2.62ms  min=57.3µs  med=1.71ms  max=47.58ms  p(90)=6.04ms  p(95)=8.2ms    p(99.9)=29.54ms 
     http_req_sending...............: avg=65.91µs min=6.35µs  med=11.65µs max=326.8ms  p(90)=31.7µs  p(95)=134.47µs p(99.9)=5.04ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=49.15ms min=2.99ms  med=47.58ms max=478.86ms p(90)=65.37ms p(95)=71.81ms  p(99.9)=192.12ms
     http_reqs......................: 57601   954.089612/s
     iteration_duration.............: avg=52.16ms min=10.36ms med=50.63ms max=512.44ms p(90)=68.57ms p(95)=74.8ms   p(99.9)=221.08ms
     iterations.....................: 57501   952.433235/s
     success_rate...................: 100.00% ✓ 57501      ✗ 0    
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

     checks.........................: 100.00% ✓ 140283     ✗ 0    
     data_received..................: 4.1 GB  68 MB/s
     data_sent......................: 55 MB   904 kB/s
     http_req_blocked...............: avg=15.49µs  min=1.28µs  med=2.71µs  max=18.99ms  p(90)=3.73µs   p(95)=4.32µs   p(99.9)=3.87ms  
     http_req_connecting............: avg=12.01µs  min=0s      med=0s      max=18.86ms  p(90)=0s       p(95)=0s       p(99.9)=3.61ms  
     http_req_duration..............: avg=63.78ms  min=2.64ms  med=62.9ms  max=478.06ms p(90)=86.21ms  p(95)=93.12ms  p(99.9)=236.51ms
       { expected_response:true }...: avg=63.78ms  min=2.64ms  med=62.9ms  max=478.06ms p(90)=86.21ms  p(95)=93.12ms  p(99.9)=236.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46861
     http_req_receiving.............: avg=147.09µs min=30.33µs med=72.27µs max=36.17ms  p(90)=144.79µs p(95)=351.35µs p(99.9)=12.8ms  
     http_req_sending...............: avg=47.94µs  min=5.7µs   med=10.94µs max=255.87ms p(90)=27.94µs  p(95)=124.25µs p(99.9)=2.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=63.59ms  min=2.56ms  med=62.71ms max=475.74ms p(90)=85.98ms  p(95)=92.84ms  p(99.9)=228.86ms
     http_reqs......................: 46861   776.190562/s
     iteration_duration.............: avg=64.16ms  min=4.54ms  med=63.15ms max=511.89ms p(90)=86.45ms  p(95)=93.37ms  p(99.9)=274.57ms
     iterations.....................: 46761   774.534194/s
     success_rate...................: 100.00% ✓ 46761      ✗ 0    
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

     checks.........................: 100.00% ✓ 96585      ✗ 0    
     data_received..................: 2.8 GB  47 MB/s
     data_sent......................: 38 MB   620 kB/s
     http_req_blocked...............: avg=21.15µs min=1.18µs  med=2.67µs  max=22.62ms  p(90)=4.27µs   p(95)=5.37µs   p(99.9)=7.58ms  
     http_req_connecting............: avg=17.25µs min=0s      med=0s      max=22.42ms  p(90)=0s       p(95)=0s       p(99.9)=6ms     
     http_req_duration..............: avg=92.74ms min=5.29ms  med=89.82ms max=578.96ms p(90)=113.7ms  p(95)=126.67ms p(99.9)=387.97ms
       { expected_response:true }...: avg=92.74ms min=5.29ms  med=89.82ms max=578.96ms p(90)=113.7ms  p(95)=126.67ms p(99.9)=387.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32295
     http_req_receiving.............: avg=86.64µs min=26.37µs med=46.89µs max=18.57ms  p(90)=105.57µs p(95)=277.85µs p(99.9)=2.18ms  
     http_req_sending...............: avg=81.84µs min=5.37µs  med=11.1µs  max=466.4ms  p(90)=32.26µs  p(95)=135.59µs p(99.9)=5.06ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.57ms min=5.23ms  med=89.69ms max=578.39ms p(90)=113.56ms p(95)=126.51ms p(99.9)=369.22ms
     http_reqs......................: 32295   531.870295/s
     iteration_duration.............: avg=93.25ms min=17.87ms med=90.09ms max=625.28ms p(90)=113.92ms p(95)=126.91ms p(99.9)=396.92ms
     iterations.....................: 32195   530.223382/s
     success_rate...................: 100.00% ✓ 32195      ✗ 0    
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

     checks.........................: 100.00% ✓ 68763      ✗ 0    
     data_received..................: 2.0 GB  33 MB/s
     data_sent......................: 27 MB   441 kB/s
     http_req_blocked...............: avg=14.63µs  min=1.83µs med=3.04µs   max=9.79ms   p(90)=4.83µs   p(95)=5.66µs   p(99.9)=5.66ms  
     http_req_connecting............: avg=11.01µs  min=0s     med=0s       max=9.75ms   p(90)=0s       p(95)=0s       p(99.9)=5.63ms  
     http_req_duration..............: avg=130.2ms  min=5.73ms med=129.48ms max=592.29ms p(90)=159.24ms p(95)=168.85ms p(99.9)=431.86ms
       { expected_response:true }...: avg=130.2ms  min=5.73ms med=129.48ms max=592.29ms p(90)=159.24ms p(95)=168.85ms p(99.9)=431.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 23021
     http_req_receiving.............: avg=74.99µs  min=37.7µs med=56.6µs   max=4.49ms   p(90)=102.34µs p(95)=123.01µs p(99.9)=1.06ms  
     http_req_sending...............: avg=71.16µs  min=7.18µs med=12.12µs  max=333.69ms p(90)=20.67µs  p(95)=30.92µs  p(99.9)=1.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.05ms min=5.65ms med=129.36ms max=590.62ms p(90)=159.13ms p(95)=168.73ms p(99.9)=424.42ms
     http_reqs......................: 23021   378.925171/s
     iteration_duration.............: avg=131.03ms min=31.6ms med=129.82ms max=649.34ms p(90)=159.53ms p(95)=169.19ms p(99.9)=447.17ms
     iterations.....................: 22921   377.279173/s
     success_rate...................: 100.00% ✓ 22921      ✗ 0    
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

     checks.........................: 100.00% ✓ 46710      ✗ 0    
     data_received..................: 1.4 GB  23 MB/s
     data_sent......................: 18 MB   299 kB/s
     http_req_blocked...............: avg=24.44µs  min=1.27µs  med=2.89µs   max=12.52ms  p(90)=4.75µs   p(95)=5.89µs   p(99.9)=8.66ms  
     http_req_connecting............: avg=20.77µs  min=0s      med=0s       max=12.45ms  p(90)=0s       p(95)=0s       p(99.9)=8.6ms   
     http_req_duration..............: avg=191.56ms min=7.42ms  med=184.56ms max=645.18ms p(90)=224.93ms p(95)=273.53ms p(99.9)=485.75ms
       { expected_response:true }...: avg=191.56ms min=7.42ms  med=184.56ms max=645.18ms p(90)=224.93ms p(95)=273.53ms p(99.9)=485.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 15670
     http_req_receiving.............: avg=98.4µs   min=26.64µs med=50.19µs  max=190.83ms p(90)=118.09µs p(95)=165.86µs p(99.9)=1.74ms  
     http_req_sending...............: avg=72.7µs   min=5.49µs  med=11.24µs  max=423.87ms p(90)=27.52µs  p(95)=121.2µs  p(99.9)=4.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.39ms min=7.35ms  med=184.41ms max=629.29ms p(90)=224.8ms  p(95)=273.42ms p(99.9)=473.88ms
     http_reqs......................: 15670   256.391827/s
     iteration_duration.............: avg=193.02ms min=50.41ms med=184.91ms max=688.23ms p(90)=225.48ms p(95)=274.03ms p(99.9)=537.1ms 
     iterations.....................: 15570   254.755631/s
     success_rate...................: 100.00% ✓ 15570      ✗ 0    
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

     checks.........................: 100.00% ✓ 12975     ✗ 0   
     data_received..................: 389 MB  6.3 MB/s
     data_sent......................: 5.2 MB  84 kB/s
     http_req_blocked...............: avg=68.98µs  min=1.41µs   med=2.87µs   max=11.72ms  p(90)=4.2µs    p(95)=5.12µs   p(99.9)=10.66ms 
     http_req_connecting............: avg=65.55µs  min=0s       med=0s       max=11.69ms  p(90)=0s       p(95)=0s       p(99.9)=10.64ms 
     http_req_duration..............: avg=679.87ms min=11.79ms  med=689.94ms max=1.34s    p(90)=754.69ms p(95)=804.53ms p(99.9)=955.66ms
       { expected_response:true }...: avg=679.87ms min=11.79ms  med=689.94ms max=1.34s    p(90)=754.69ms p(95)=804.53ms p(99.9)=955.66ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 4425
     http_req_receiving.............: avg=71.54µs  min=29.81µs  med=49.54µs  max=68.97ms  p(90)=84.95µs  p(95)=95.58µs  p(99.9)=248.86µs
     http_req_sending...............: avg=119.54µs min=6.08µs   med=11.61µs  max=115.78ms p(90)=17.44µs  p(95)=22.91µs  p(99.9)=33.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=679.68ms min=11.74ms  med=689.84ms max=1.34s    p(90)=754.43ms p(95)=802.8ms  p(99.9)=946.71ms
     http_reqs......................: 4425    71.729349/s
     iteration_duration.............: avg=695.83ms min=381.39ms med=690.87ms max=1.36s    p(90)=756.77ms p(95)=809.08ms p(99.9)=972.38ms
     iterations.....................: 4325    70.108347/s
     success_rate...................: 100.00% ✓ 4325      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

