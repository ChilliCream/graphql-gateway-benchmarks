## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform))

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router                 | 2195  | 136691 total, 0 failed | avg: 102ms, p95: 253ms | ✅                                        |
| grafbase                    | 1897  | 119207 total, 0 failed | avg: 117ms, p95: 279ms | ✅                                        |
| hotchocolate                |  926  | 58848 total, 0 failed  | avg: 238ms, p95: 573ms | ✅                                        |
| cosmo                       |  783  | 49679 total, 0 failed  | avg: 283ms, p95: 636ms | ✅                                        |
| apollo-router               |  416  | 27774 total, 0 failed  | avg: 507ms, p95: 1167ms | ❌ non-compatible response structure (16) |
| hive-gateway-router-runtime |  306  | 20350 total, 0 failed  | avg: 650ms, p95: 1184ms | ❌ non-compatible response structure (7)  |
| hive-gateway                |  166  | 11392 total, 0 failed  | avg: 939ms, p95: 1547ms | ✅                                        |
| apollo-gateway              |  103  |  7644 total, 0 failed  | avg: 1577ms, p95: 3000ms | ✅                                        |


<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 407073      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 159 MB  2.6 MB/s
     http_req_blocked...............: avg=232.22µs min=1.16µs  med=2.3µs   max=246.77ms p(90)=3.51µs   p(95)=4.27µs   p(99.9)=94.91ms 
     http_req_connecting............: avg=228.72µs min=0s      med=0s      max=246.7ms  p(90)=0s       p(95)=0s       p(99.9)=94.83ms 
     http_req_duration..............: avg=102.02ms min=1.59ms  med=90.56ms max=411.22ms p(90)=211.12ms p(95)=252.91ms p(99.9)=357.77ms
       { expected_response:true }...: avg=102.02ms min=1.59ms  med=90.56ms max=411.22ms p(90)=211.12ms p(95)=252.91ms p(99.9)=357.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136691
     http_req_receiving.............: avg=369.04µs min=21.92µs med=40.09µs max=128.84ms p(90)=176.2µs  p(95)=362.59µs p(99.9)=56.24ms 
     http_req_sending...............: avg=265.26µs min=5.05µs  med=9.56µs  max=113.7ms  p(90)=29.66µs  p(95)=119.88µs p(99.9)=49.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.39ms min=1.54ms  med=90.06ms max=407.58ms p(90)=209.66ms p(95)=251.67ms p(99.9)=355.79ms
     http_reqs......................: 136691  2195.767687/s
     iteration_duration.............: avg=103.22ms min=1.72ms  med=91.65ms max=626.19ms p(90)=212.58ms p(95)=254.21ms p(99.9)=363.31ms
     iterations.....................: 135691  2179.703955/s
     success_rate...................: 100.00% ✓ 135691      ✗ 0     
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

     checks.........................: 100.00% ✓ 354621      ✗ 0     
     data_received..................: 11 GB   167 MB/s
     data_sent......................: 139 MB  2.2 MB/s
     http_req_blocked...............: avg=512.66µs min=1.34µs  med=2.92µs   max=335.82ms p(90)=4.08µs   p(95)=4.73µs   p(99.9)=183.9ms 
     http_req_connecting............: avg=508.96µs min=0s      med=0s       max=335.78ms p(90)=0s       p(95)=0s       p(99.9)=183.83ms
     http_req_duration..............: avg=116.73ms min=2.11ms  med=107.36ms max=402.73ms p(90)=235.51ms p(95)=279.19ms p(99.9)=356.15ms
       { expected_response:true }...: avg=116.73ms min=2.11ms  med=107.36ms max=402.73ms p(90)=235.51ms p(95)=279.19ms p(99.9)=356.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119207
     http_req_receiving.............: avg=547.36µs min=26.26µs med=47.14µs  max=148.49ms p(90)=91.9µs   p(95)=399.67µs p(99.9)=73.99ms 
     http_req_sending...............: avg=473.6µs  min=5.51µs  med=11.62µs  max=132.77ms p(90)=20.94µs  p(95)=129.14µs p(99.9)=74.39ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.71ms min=2.06ms  med=106.29ms max=370.03ms p(90)=233.1ms  p(95)=277.45ms p(99.9)=352.08ms
     http_reqs......................: 119207  1897.759801/s
     iteration_duration.............: avg=118.52ms min=2.23ms  med=108.9ms  max=760.16ms p(90)=237.75ms p(95)=281.93ms p(99.9)=425.64ms
     iterations.....................: 118207  1881.839932/s
     success_rate...................: 100.00% ✓ 118207      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 173544     ✗ 0    
     data_received..................: 5.2 GB  81 MB/s
     data_sent......................: 69 MB   1.1 MB/s
     http_req_blocked...............: avg=170.91µs min=1.18µs  med=2.89µs   max=187.53ms p(90)=4.59µs   p(95)=7.65µs   p(99.9)=59.26ms 
     http_req_connecting............: avg=166.14µs min=0s      med=0s       max=187.45ms p(90)=0s       p(95)=0s       p(99.9)=58.83ms 
     http_req_duration..............: avg=238.24ms min=2.87ms  med=201.08ms max=1.07s    p(90)=509.97ms p(95)=573.26ms p(99.9)=949.69ms
       { expected_response:true }...: avg=238.24ms min=2.87ms  med=201.08ms max=1.07s    p(90)=509.97ms p(95)=573.26ms p(99.9)=949.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58848
     http_req_receiving.............: avg=16.21ms  min=52.89µs med=5.11ms   max=268.42ms p(90)=46.69ms  p(95)=62.42ms  p(99.9)=141.6ms 
     http_req_sending...............: avg=281.21µs min=5.57µs  med=11.33µs  max=157.1ms  p(90)=30.14µs  p(95)=133.05µs p(99.9)=56.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=221.74ms min=2.76ms  med=184.2ms  max=1.03s    p(90)=477.74ms p(95)=543.89ms p(99.9)=896.43ms
     http_reqs......................: 58848   926.943857/s
     iteration_duration.............: avg=242.89ms min=3.1ms   med=207.12ms max=1.07s    p(90)=512.68ms p(95)=575.62ms p(99.9)=951.25ms
     iterations.....................: 57848   911.192365/s
     success_rate...................: 100.00% ✓ 57848      ✗ 0    
     vus............................: 84      min=0        max=500
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

     checks.........................: 100.00% ✓ 146037     ✗ 0    
     data_received..................: 4.4 GB  69 MB/s
     data_sent......................: 58 MB   913 kB/s
     http_req_blocked...............: avg=48.6µs   min=1.31µs med=2.73µs   max=93.14ms  p(90)=3.99µs   p(95)=5.08µs   p(99.9)=12.7ms  
     http_req_connecting............: avg=44.03µs  min=0s     med=0s       max=93.07ms  p(90)=0s       p(95)=0s       p(99.9)=12.41ms 
     http_req_duration..............: avg=282.62ms min=2.32ms med=266.78ms max=1.03s    p(90)=564.51ms p(95)=635.93ms p(99.9)=881.1ms 
       { expected_response:true }...: avg=282.62ms min=2.32ms med=266.78ms max=1.03s    p(90)=564.51ms p(95)=635.93ms p(99.9)=881.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 49679
     http_req_receiving.............: avg=470.24µs min=29.4µs med=62.08µs  max=217.89ms p(90)=141.41µs p(95)=397.32µs p(99.9)=63.75ms 
     http_req_sending...............: avg=77.46µs  min=5.76µs med=10.81µs  max=55.46ms  p(90)=19.23µs  p(95)=54.49µs  p(99.9)=13.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=282.07ms min=2.25ms med=266.26ms max=1.03s    p(90)=564ms    p(95)=634.6ms  p(99.9)=880.41ms
     http_reqs......................: 49679   783.060967/s
     iteration_duration.............: avg=288.75ms min=2.45ms med=273.96ms max=1.07s    p(90)=567.37ms p(95)=638.29ms p(99.9)=883.18ms
     iterations.....................: 48679   767.298553/s
     success_rate...................: 100.00% ✓ 48679      ✗ 0    
     vus............................: 83      min=0        max=499
     vus_max........................: 500     min=500      max=500
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
      ↳  99% — ✓ 26758 / ✗ 16
     ✓ valid response structure

     checks.........................: 99.98% ✓ 80306      ✗ 16   
     data_received..................: 2.4 GB 37 MB/s
     data_sent......................: 32 MB  486 kB/s
     http_req_blocked...............: avg=49.5µs   min=1.76µs  med=2.88µs   max=82.66ms p(90)=4.75µs  p(95)=6.6µs   p(99.9)=13.39ms
     http_req_connecting............: avg=44.99µs  min=0s      med=0s       max=82.49ms p(90)=0s      p(95)=0s      p(99.9)=13.34ms
     http_req_duration..............: avg=507.3ms  min=5.92ms  med=473.22ms max=1.92s   p(90)=1.02s   p(95)=1.16s   p(99.9)=1.67s  
       { expected_response:true }...: avg=507.3ms  min=5.92ms  med=473.22ms max=1.92s   p(90)=1.02s   p(95)=1.16s   p(99.9)=1.67s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 27774
     http_req_receiving.............: avg=94.12µs  min=32.25µs med=53.04µs  max=50.96ms p(90)=95.44µs p(95)=122.2µs p(99.9)=5ms    
     http_req_sending...............: avg=72.02µs  min=6.76µs  med=11.42µs  max=79.42ms p(90)=21.04µs p(95)=48.21µs p(99.9)=12.81ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=507.13ms min=5.87ms  med=473.05ms max=1.92s   p(90)=1.02s   p(95)=1.16s   p(99.9)=1.67s  
     http_reqs......................: 27774  416.064109/s
     iteration_duration.............: avg=526.52ms min=6.25ms  med=493.7ms  max=1.92s   p(90)=1.03s   p(95)=1.17s   p(99.9)=1.67s  
     iterations.....................: 26774  401.083764/s
     success_rate...................: 99.94% ✓ 26758      ✗ 16   
     vus............................: 99     min=0        max=500
     vus_max........................: 500    min=500      max=500
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
      ↳  99% — ✓ 19343 / ✗ 7

     checks.........................: 99.98% ✓ 58043      ✗ 7    
     data_received..................: 1.8 GB 27 MB/s
     data_sent......................: 24 MB  360 kB/s
     http_req_blocked...............: avg=60.61µs  min=1.15µs  med=2.29µs   max=171.97ms p(90)=3.86µs  p(95)=5.14µs   p(99.9)=17.81ms
     http_req_connecting............: avg=56.27µs  min=0s      med=0s       max=171.9ms  p(90)=0s      p(95)=0s       p(99.9)=17.74ms
     http_req_duration..............: avg=649.61ms min=5.32ms  med=642.79ms max=14.65s   p(90)=1.08s   p(95)=1.18s    p(99.9)=12.33s 
       { expected_response:true }...: avg=649.61ms min=5.32ms  med=642.79ms max=14.65s   p(90)=1.08s   p(95)=1.18s    p(99.9)=12.33s 
     http_req_failed................: 0.00%  ✓ 0          ✗ 20350
     http_req_receiving.............: avg=210.22µs min=23.38µs med=40.45µs  max=112.3ms  p(90)=82.63µs p(95)=348.56µs p(99.9)=41.39ms
     http_req_sending...............: avg=193.2µs  min=5.23µs  med=9.3µs    max=128.65ms p(90)=23.94µs p(95)=97.71µs  p(99.9)=41.73ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=649.2ms  min=5.24ms  med=642.23ms max=14.65s   p(90)=1.08s   p(95)=1.18s    p(99.9)=12.33s 
     http_reqs......................: 20350  306.037643/s
     iteration_duration.............: avg=683.29ms min=5.51ms  med=671.14ms max=14.66s   p(90)=1.09s   p(95)=1.19s    p(99.9)=12.58s 
     iterations.....................: 19350  290.998938/s
     success_rate...................: 99.96% ✓ 19343      ✗ 7    
     vus............................: 87     min=0        max=500
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

     checks.........................: 100.00% ✓ 31176      ✗ 0    
     data_received..................: 1.0 GB  15 MB/s
     data_sent......................: 14 MB   200 kB/s
     http_req_blocked...............: avg=15.97µs  min=1.19µs  med=2.39µs   max=20.19ms p(90)=3.71µs  p(95)=4.97µs   p(99.9)=2.79ms 
     http_req_connecting............: avg=12.23µs  min=0s      med=0s       max=20.15ms p(90)=0s      p(95)=0s       p(99.9)=2.74ms 
     http_req_duration..............: avg=938.7ms  min=6.85ms  med=866.61ms max=27.67s  p(90)=1.43s   p(95)=1.54s    p(99.9)=24.47s 
       { expected_response:true }...: avg=938.7ms  min=6.85ms  med=866.61ms max=27.67s  p(90)=1.43s   p(95)=1.54s    p(99.9)=24.47s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 11392
     http_req_receiving.............: avg=111.68µs min=21.16µs med=40.39µs  max=73.16ms p(90)=76.88µs p(95)=108.82µs p(99.9)=12.53ms
     http_req_sending...............: avg=139.07µs min=5.27µs  med=9.38µs   max=91.01ms p(90)=21.64µs p(95)=55.99µs  p(99.9)=28.27ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=938.45ms min=6.8ms   med=866.23ms max=27.67s  p(90)=1.43s   p(95)=1.54s    p(99.9)=24.47s 
     http_reqs......................: 11392   166.626376/s
     iteration_duration.............: avg=1.02s    min=7.02ms  med=973.46ms max=27.68s  p(90)=1.44s   p(95)=1.56s    p(99.9)=24.63s 
     iterations.....................: 10392   151.999763/s
     success_rate...................: 100.00% ✓ 10392      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 19932      ✗ 0    
     data_received..................: 671 MB  9.1 MB/s
     data_sent......................: 9.3 MB  126 kB/s
     http_req_blocked...............: avg=25.1µs  min=1.42µs  med=3.19µs  max=17.26ms p(90)=5.19µs  p(95)=9.01µs   p(99.9)=4.51ms  
     http_req_connecting............: avg=19.53µs min=0s      med=0s      max=17.17ms p(90)=0s      p(95)=0s       p(99.9)=4.44ms  
     http_req_duration..............: avg=1.57s   min=11.94ms med=1.54s   max=21.45s  p(90)=2.65s   p(95)=2.99s    p(99.9)=20.22s  
       { expected_response:true }...: avg=1.57s   min=11.94ms med=1.54s   max=21.45s  p(90)=2.65s   p(95)=2.99s    p(99.9)=20.22s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7644 
     http_req_receiving.............: avg=66.92µs min=28.72µs med=53.9µs  max=9.41ms  p(90)=93.71µs p(95)=110.33µs p(99.9)=575.93µs
     http_req_sending...............: avg=35.35µs min=6.33µs  med=12.64µs max=12.12ms p(90)=22.39µs p(95)=41.85µs  p(99.9)=5.7ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.57s   min=11.89ms med=1.54s   max=21.45s  p(90)=2.65s   p(95)=2.99s    p(99.9)=20.22s  
     http_reqs......................: 7644    103.627894/s
     iteration_duration.............: avg=1.81s   min=13.22ms med=1.71s   max=21.46s  p(90)=2.68s   p(95)=3.08s    p(99.9)=20.36s  
     iterations.....................: 6644    90.071131/s
     success_rate...................: 100.00% ✓ 6644       ✗ 0    
     vus............................: 125     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

