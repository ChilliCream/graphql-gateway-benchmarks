## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router                 | 2177  | 135330 total, 0 failed | avg: 103ms, p95: 256ms | ✅                                        |
| grafbase                    | 1978  | 124392 total, 0 failed | avg: 112ms, p95: 277ms | ✅                                        |
| hotchocolate (rust subgraphs) |  986  | 63090 total, 0 failed  | avg: 222ms, p95: 515ms | ✅                                        |
| hotchocolate (.net subgraphs) |  978  | 61897 total, 0 failed  | avg: 226ms, p95: 538ms | ✅                                        |
| cosmo                       |  794  | 50358 total, 0 failed  | avg: 279ms, p95: 627ms | ✅                                        |
| hive-gateway-router-runtime |  530  | 35158 total, 0 failed  | avg: 400ms, p95: 841ms | ❌ non-compatible response structure (2)  |
| apollo-router               |  433  | 28856 total, 0 failed  | avg: 489ms, p95: 1131ms | ❌ non-compatible response structure (16) |
| hive-gateway                |  259  | 17768 total, 0 failed  | avg: 787ms, p95: 1708ms | ✅                                        |
| apollo-gateway              |  104  |  7663 total, 0 failed  | avg: 1570ms, p95: 3062ms | ✅                                        |


<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 402990      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=264.99µs min=1.23µs  med=2.39µs  max=267.35ms p(90)=3.65µs   p(95)=4.48µs   p(99.9)=104.41ms
     http_req_connecting............: avg=261.73µs min=0s      med=0s      max=267.3ms  p(90)=0s       p(95)=0s       p(99.9)=104.31ms
     http_req_duration..............: avg=103ms    min=1.55ms  med=92.06ms max=496.03ms p(90)=211.6ms  p(95)=255.87ms p(99.9)=363.41ms
       { expected_response:true }...: avg=103ms    min=1.55ms  med=92.06ms max=496.03ms p(90)=211.6ms  p(95)=255.87ms p(99.9)=363.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135330
     http_req_receiving.............: avg=400.05µs min=21.46µs med=40.54µs max=200.51ms p(90)=193.27µs p(95)=375.87µs p(99.9)=60.14ms 
     http_req_sending...............: avg=285.68µs min=4.98µs  med=9.56µs  max=121.36ms p(90)=28.93µs  p(95)=122.61µs p(99.9)=53.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.32ms min=1.51ms  med=91.51ms max=394.39ms p(90)=209.72ms p(95)=254.24ms p(99.9)=360.21ms
     http_reqs......................: 135330  2177.703447/s
     iteration_duration.............: avg=104.27ms min=1.72ms  med=93.2ms  max=591.59ms p(90)=213.41ms p(95)=257.72ms p(99.9)=374.64ms
     iterations.....................: 134330  2161.611646/s
     success_rate...................: 100.00% ✓ 134330      ✗ 0     
     vus............................: 67      min=0         max=496 
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

     checks.........................: 100.00% ✓ 370176      ✗ 0     
     data_received..................: 11 GB   174 MB/s
     data_sent......................: 145 MB  2.3 MB/s
     http_req_blocked...............: avg=442.58µs min=1.29µs  med=2.99µs   max=347.61ms p(90)=4.39µs   p(95)=5.11µs   p(99.9)=157.84ms
     http_req_connecting............: avg=438.08µs min=0s      med=0s       max=346.43ms p(90)=0s       p(95)=0s       p(99.9)=157.76ms
     http_req_duration..............: avg=111.93ms min=2.25ms  med=102.73ms max=401.51ms p(90)=231.88ms p(95)=277.48ms p(99.9)=364.13ms
       { expected_response:true }...: avg=111.93ms min=2.25ms  med=102.73ms max=401.51ms p(90)=231.88ms p(95)=277.48ms p(99.9)=364.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 124392
     http_req_receiving.............: avg=513.57µs min=25.51µs med=47.11µs  max=135.12ms p(90)=113.65µs p(95)=423.47µs p(99.9)=69.69ms 
     http_req_sending...............: avg=398.92µs min=5.19µs  med=11.56µs  max=150.28ms p(90)=24.88µs  p(95)=135.36µs p(99.9)=68.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.02ms min=2.21ms  med=101.81ms max=396.17ms p(90)=229.84ms p(95)=275.18ms p(99.9)=360.73ms
     http_reqs......................: 124392  1978.427805/s
     iteration_duration.............: avg=113.54ms min=2.35ms  med=104.17ms max=834.72ms p(90)=234.21ms p(95)=279.79ms p(99.9)=390.98ms
     iterations.....................: 123392  1962.523022/s
     success_rate...................: 100.00% ✓ 123392      ✗ 0     
     vus............................: 54      min=0         max=498 
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

     checks.........................: 100.00% ✓ 186270     ✗ 0    
     data_received..................: 5.5 GB  87 MB/s
     data_sent......................: 74 MB   1.2 MB/s
     http_req_blocked...............: avg=140.65µs min=1.24µs  med=2.81µs   max=204.76ms p(90)=4.33µs   p(95)=6.36µs   p(99.9)=49.24ms 
     http_req_connecting............: avg=136.63µs min=0s      med=0s       max=204.68ms p(90)=0s       p(95)=0s       p(99.9)=49.19ms 
     http_req_duration..............: avg=222.07ms min=3.49ms  med=198.69ms max=855.12ms p(90)=456.25ms p(95)=514.65ms p(99.9)=728.36ms
       { expected_response:true }...: avg=222.07ms min=3.49ms  med=198.69ms max=855.12ms p(90)=456.25ms p(95)=514.65ms p(99.9)=728.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63090
     http_req_receiving.............: avg=14.26ms  min=52.08µs med=4.63ms   max=225.72ms p(90)=41.11ms  p(95)=54.01ms  p(99.9)=135.54ms
     http_req_sending...............: avg=214.99µs min=5.71µs  med=11µs     max=125.15ms p(90)=28.87µs  p(95)=130.65µs p(99.9)=41.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.59ms min=3.38ms  med=184.86ms max=796.57ms p(90)=428.31ms p(95)=485.78ms p(99.9)=712.34ms
     http_reqs......................: 63090   986.741489/s
     iteration_duration.............: avg=226.1ms  min=3.65ms  med=203.82ms max=855.32ms p(90)=458.57ms p(95)=516.67ms p(99.9)=735.33ms
     iterations.....................: 62090   971.101269/s
     success_rate...................: 100.00% ✓ 62090      ✗ 0    
     vus............................: 58      min=0        max=498
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

     checks.........................: 100.00% ✓ 182691     ✗ 0    
     data_received..................: 5.4 GB  86 MB/s
     data_sent......................: 72 MB   1.1 MB/s
     http_req_blocked...............: avg=148.14µs min=1.22µs med=2.82µs   max=145.72ms p(90)=4.41µs   p(95)=7.29µs   p(99.9)=51.24ms 
     http_req_connecting............: avg=143.97µs min=0s     med=0s       max=145.63ms p(90)=0s       p(95)=0s       p(99.9)=51.16ms 
     http_req_duration..............: avg=226.33ms min=2.81ms med=202.91ms max=866.54ms p(90)=471.08ms p(95)=537.65ms p(99.9)=778.87ms
       { expected_response:true }...: avg=226.33ms min=2.81ms med=202.91ms max=866.54ms p(90)=471.08ms p(95)=537.65ms p(99.9)=778.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61897
     http_req_receiving.............: avg=14.76ms  min=52.7µs med=5.8ms    max=221.26ms p(90)=41.95ms  p(95)=55.44ms  p(99.9)=131.63ms
     http_req_sending...............: avg=250.12µs min=5.76µs med=11.19µs  max=128.99ms p(90)=29.91µs  p(95)=132.99µs p(99.9)=49.39ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.32ms min=2.73ms med=185.24ms max=847.01ms p(90)=443.38ms p(95)=512.41ms p(99.9)=748.32ms
     http_reqs......................: 61897   978.239728/s
     iteration_duration.............: avg=230.54ms min=3.02ms med=208.04ms max=915.59ms p(90)=473.39ms p(95)=539.5ms  p(99.9)=781.15ms
     iterations.....................: 60897   962.435412/s
     success_rate...................: 100.00% ✓ 60897      ✗ 0    
     vus............................: 74      min=0        max=494
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

     checks.........................: 100.00% ✓ 148074     ✗ 0    
     data_received..................: 4.4 GB  70 MB/s
     data_sent......................: 59 MB   926 kB/s
     http_req_blocked...............: avg=66.8µs   min=1.27µs  med=2.64µs   max=108.14ms p(90)=3.87µs   p(95)=4.95µs   p(99.9)=17.29ms 
     http_req_connecting............: avg=63.18µs  min=0s      med=0s       max=108.05ms p(90)=0s       p(95)=0s       p(99.9)=17.24ms 
     http_req_duration..............: avg=278.79ms min=2.66ms  med=262.16ms max=1.03s    p(90)=554.1ms  p(95)=626.57ms p(99.9)=904.06ms
       { expected_response:true }...: avg=278.79ms min=2.66ms  med=262.16ms max=1.03s    p(90)=554.1ms  p(95)=626.57ms p(99.9)=904.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50358
     http_req_receiving.............: avg=566.47µs min=28.94µs med=60.45µs  max=177.83ms p(90)=173.18µs p(95)=412.35µs p(99.9)=82.84ms 
     http_req_sending...............: avg=96.38µs  min=5.81µs  med=10.74µs  max=84.96ms  p(90)=21.62µs  p(95)=122.24µs p(99.9)=17.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=278.12ms min=2.6ms   med=261.24ms max=1.03s    p(90)=553.08ms p(95)=625.45ms p(99.9)=902.18ms
     http_reqs......................: 50358   794.226575/s
     iteration_duration.............: avg=284.8ms  min=2.84ms  med=268.67ms max=1.04s    p(90)=557.25ms p(95)=629.13ms p(99.9)=907.21ms
     iterations.....................: 49358   778.454968/s
     success_rate...................: 100.00% ✓ 49358      ✗ 0    
     vus............................: 79      min=0        max=495
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
      ↳  99% — ✓ 34156 / ✗ 2

     checks.........................: 99.99% ✓ 102472     ✗ 2    
     data_received..................: 3.1 GB 47 MB/s
     data_sent......................: 41 MB  620 kB/s
     http_req_blocked...............: avg=105.14µs min=1.28µs  med=2.9µs    max=188.09ms p(90)=4.52µs   p(95)=5.92µs   p(99.9)=33.62ms
     http_req_connecting............: avg=100.97µs min=0s      med=0s       max=188.05ms p(90)=0s       p(95)=0s       p(99.9)=33.55ms
     http_req_duration..............: avg=400.27ms min=5.2ms   med=386.48ms max=1.58s    p(90)=763.56ms p(95)=841.36ms p(99.9)=1.37s  
       { expected_response:true }...: avg=400.27ms min=5.2ms   med=386.48ms max=1.58s    p(90)=763.56ms p(95)=841.36ms p(99.9)=1.37s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 35158
     http_req_receiving.............: avg=128.31µs min=26.16µs med=45.44µs  max=87.07ms  p(90)=84.32µs  p(95)=112.94µs p(99.9)=20.24ms
     http_req_sending...............: avg=168.62µs min=5.51µs  med=11.05µs  max=102.14ms p(90)=21.41µs  p(95)=53.79µs  p(99.9)=35.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=399.97ms min=5.16ms  med=386.2ms  max=1.58s    p(90)=763.14ms p(95)=840.72ms p(99.9)=1.37s  
     http_reqs......................: 35158  530.989001/s
     iteration_duration.............: avg=412.36ms min=5.42ms  med=400.44ms max=1.59s    p(90)=768.12ms p(95)=846.74ms p(99.9)=1.38s  
     iterations.....................: 34158  515.886066/s
     success_rate...................: 99.99% ✓ 34156      ✗ 2    
     vus............................: 72     min=0        max=495
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
      ↳  99% — ✓ 27840 / ✗ 16
     ✗ valid response structure
      ↳  99% — ✓ 27854 / ✗ 2

     checks.........................: 99.97% ✓ 83550      ✗ 18   
     data_received..................: 2.5 GB 38 MB/s
     data_sent......................: 34 MB  507 kB/s
     http_req_blocked...............: avg=53.28µs  min=1.83µs  med=2.86µs   max=122.94ms p(90)=4.38µs  p(95)=5.77µs   p(99.9)=13.91ms
     http_req_connecting............: avg=49.02µs  min=0s      med=0s       max=122.88ms p(90)=0s      p(95)=0s       p(99.9)=13.84ms
     http_req_duration..............: avg=488.72ms min=5.79ms  med=447.59ms max=1.72s    p(90)=1.01s   p(95)=1.13s    p(99.9)=1.54s  
       { expected_response:true }...: avg=488.72ms min=5.79ms  med=447.59ms max=1.72s    p(90)=1.01s   p(95)=1.13s    p(99.9)=1.54s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 28856
     http_req_receiving.............: avg=85.82µs  min=30.06µs med=50.79µs  max=50.01ms  p(90)=86.7µs  p(95)=109.31µs p(99.9)=3.12ms 
     http_req_sending...............: avg=73.92µs  min=6.89µs  med=11.25µs  max=71.11ms  p(90)=19.83µs p(95)=40.2µs   p(99.9)=12.04ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=488.56ms min=5.74ms  med=447.45ms max=1.72s    p(90)=1s      p(95)=1.13s    p(99.9)=1.54s  
     http_reqs......................: 28856  433.756622/s
     iteration_duration.............: avg=506.54ms min=6.13ms  med=470.92ms max=1.72s    p(90)=1.01s   p(95)=1.13s    p(99.9)=1.54s  
     iterations.....................: 27856  418.724857/s
     success_rate...................: 99.94% ✓ 27840      ✗ 16   
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

     checks.........................: 100.00% ✓ 50304      ✗ 0    
     data_received..................: 1.6 GB  23 MB/s
     data_sent......................: 21 MB   305 kB/s
     http_req_blocked...............: avg=62.94µs  min=1.3µs   med=2.78µs   max=67.72ms p(90)=4.51µs  p(95)=6.76µs   p(99.9)=16.97ms
     http_req_connecting............: avg=58.4µs   min=0s      med=0s       max=67.67ms p(90)=0s      p(95)=0s       p(99.9)=16.92ms
     http_req_duration..............: avg=786.74ms min=6.81ms  med=733.94ms max=5.91s   p(90)=1.55s   p(95)=1.7s     p(99.9)=5.07s  
       { expected_response:true }...: avg=786.74ms min=6.81ms  med=733.94ms max=5.91s   p(90)=1.55s   p(95)=1.7s     p(99.9)=5.07s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17768
     http_req_receiving.............: avg=111.8µs  min=26.07µs med=43.76µs  max=58.05ms p(90)=85.88µs p(95)=136.9µs  p(99.9)=12.98ms
     http_req_sending...............: avg=136.16µs min=5.35µs  med=10.8µs   max=84.67ms p(90)=30.04µs p(95)=114.39µs p(99.9)=25.87ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=786.49ms min=6.76ms  med=733.12ms max=5.91s   p(90)=1.55s   p(95)=1.7s     p(99.9)=5.07s  
     http_reqs......................: 17768   259.766304/s
     iteration_duration.............: avg=833.77ms min=7.21ms  med=820.8ms  max=5.92s   p(90)=1.58s   p(95)=1.72s    p(99.9)=5.12s  
     iterations.....................: 16768   245.146409/s
     success_rate...................: 100.00% ✓ 16768      ✗ 0    
     vus............................: 84      min=0        max=500
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

     checks.........................: 100.00% ✓ 19989      ✗ 0    
     data_received..................: 673 MB  9.1 MB/s
     data_sent......................: 9.4 MB  127 kB/s
     http_req_blocked...............: avg=23.41µs min=1.4µs   med=3.28µs  max=12.7ms  p(90)=5.03µs  p(95)=10.75µs  p(99.9)=2.54ms  
     http_req_connecting............: avg=17.71µs min=0s      med=0s      max=12.63ms p(90)=0s      p(95)=0s       p(99.9)=2.49ms  
     http_req_duration..............: avg=1.56s   min=11.95ms med=1.56s   max=20.91s  p(90)=2.64s   p(95)=3.06s    p(99.9)=19.87s  
       { expected_response:true }...: avg=1.56s   min=11.95ms med=1.56s   max=20.91s  p(90)=2.64s   p(95)=3.06s    p(99.9)=19.87s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7663 
     http_req_receiving.............: avg=65.13µs min=30.2µs  med=53.25µs max=8.05ms  p(90)=87.61µs p(95)=101.22µs p(99.9)=926.36µs
     http_req_sending...............: avg=32.38µs min=6.16µs  med=12.46µs max=11.53ms p(90)=20.85µs p(95)=41.88µs  p(99.9)=6.28ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.56s   min=11.88ms med=1.56s   max=20.91s  p(90)=2.64s   p(95)=3.06s    p(99.9)=19.87s  
     http_reqs......................: 7663    104.130534/s
     iteration_duration.............: avg=1.8s    min=12.28ms med=1.75s   max=20.92s  p(90)=2.72s   p(95)=3.11s    p(99.9)=20.06s  
     iterations.....................: 6663    90.541792/s
     success_rate...................: 100.00% ✓ 6663       ✗ 0    
     vus............................: 117     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

