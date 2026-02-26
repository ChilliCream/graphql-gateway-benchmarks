## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router                 | 1962  | 118192 total, 0 failed |  avg: 25ms, p95: 42ms  | ✅                                        |
| grafbase                    | 1933  | 116581 total, 0 failed |  avg: 26ms, p95: 46ms  | ✅                                        |
| hotchocolate (rust subgraphs) |  939  | 56730 total, 0 failed  |  avg: 53ms, p95: 74ms  | ✅                                        |
| hotchocolate (.net subgraphs) |  870  | 52529 total, 0 failed  |  avg: 57ms, p95: 79ms  | ✅                                        |
| cosmo                       |  738  | 44574 total, 0 failed  |  avg: 67ms, p95: 98ms  | ✅                                        |
| hive-gateway-router-runtime |  539  | 32733 total, 0 failed  | avg: 91ms, p95: 124ms  | ✅                                        |
| apollo-router               |  392  | 23835 total, 0 failed  | avg: 126ms, p95: 162ms | ❌ non-compatible response structure (1)  |
| hive-gateway                |  270  | 16473 total, 0 failed  | avg: 182ms, p95: 269ms | ✅                                        |
| apollo-gateway              |   69  |  4294 total, 0 failed  | avg: 704ms, p95: 829ms | ✅                                        |


<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 354276      ✗ 0     
     data_received..................: 10 GB   172 MB/s
     data_sent......................: 138 MB  2.3 MB/s
     http_req_blocked...............: avg=10.35µs  min=1.22µs  med=2.43µs  max=26.57ms  p(90)=3.54µs   p(95)=4.21µs   p(99.9)=55.87µs
     http_req_connecting............: avg=7.41µs   min=0s      med=0s      max=26.43ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.17ms  min=1.86ms  med=23.35ms max=427.46ms p(90)=37.36ms  p(95)=42.49ms  p(99.9)=74.53ms
       { expected_response:true }...: avg=25.17ms  min=1.86ms  med=23.35ms max=427.46ms p(90)=37.36ms  p(95)=42.49ms  p(99.9)=74.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118192
     http_req_receiving.............: avg=101.77µs min=23.52µs med=42.27µs max=95.54ms  p(90)=124.37µs p(95)=320.83µs p(99.9)=7.07ms 
     http_req_sending...............: avg=85.66µs  min=5.17µs  med=9.85µs  max=145.06ms p(90)=54.71µs  p(95)=126.25µs p(99.9)=9.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.99ms  min=1.83ms  med=23.21ms max=311.29ms p(90)=37.11ms  p(95)=42.22ms  p(99.9)=73.73ms
     http_reqs......................: 118192  1962.24239/s
     iteration_duration.............: avg=25.39ms  min=4.4ms   med=23.54ms max=469.57ms p(90)=37.54ms  p(95)=42.67ms  p(99.9)=75.37ms
     iterations.....................: 118092  1960.582174/s
     success_rate...................: 100.00% ✓ 118092      ✗ 0     
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

     checks.........................: 100.00% ✓ 349443      ✗ 0     
     data_received..................: 10 GB   170 MB/s
     data_sent......................: 136 MB  2.3 MB/s
     http_req_blocked...............: avg=9.03µs   min=1.21µs  med=2.97µs  max=17.77ms  p(90)=4.19µs   p(95)=4.82µs   p(99.9)=108.66µs
     http_req_connecting............: avg=5.47µs   min=0s      med=0s      max=17.63ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.5ms   min=2.51ms  med=22.44ms max=416.93ms p(90)=40.57ms  p(95)=46.49ms  p(99.9)=75.23ms 
       { expected_response:true }...: avg=25.5ms   min=2.51ms  med=22.44ms max=416.93ms p(90)=40.57ms  p(95)=46.49ms  p(99.9)=75.23ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 116581
     http_req_receiving.............: avg=135.09µs min=27.76µs med=48.41µs max=42.91ms  p(90)=172.09µs p(95)=397.42µs p(99.9)=13.52ms 
     http_req_sending...............: avg=92.56µs  min=5.69µs  med=11.76µs max=311.73ms p(90)=80.1µs   p(95)=144.35µs p(99.9)=12.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=25.27ms  min=2.44ms  med=22.29ms max=416.48ms p(90)=40.15ms  p(95)=46.09ms  p(99.9)=73.06ms 
     http_reqs......................: 116581  1933.370811/s
     iteration_duration.............: avg=25.74ms  min=3.82ms  med=22.65ms max=457.17ms p(90)=40.79ms  p(95)=46.71ms  p(99.9)=75.97ms 
     iterations.....................: 116481  1931.712418/s
     success_rate...................: 100.00% ✓ 116481      ✗ 0     
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

     checks.........................: 100.00% ✓ 169890     ✗ 0    
     data_received..................: 5.0 GB  82 MB/s
     data_sent......................: 66 MB   1.1 MB/s
     http_req_blocked...............: avg=12.86µs min=1.34µs  med=2.73µs  max=17.4ms   p(90)=3.75µs  p(95)=4.37µs   p(99.9)=109.25µs
     http_req_connecting............: avg=9.48µs  min=0s      med=0s      max=17.35ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=52.66ms min=3.3ms   med=51.7ms  max=476.99ms p(90)=68.28ms p(95)=73.85ms  p(99.9)=199.07ms
       { expected_response:true }...: avg=52.66ms min=3.3ms   med=51.7ms  max=476.99ms p(90)=68.28ms p(95)=73.85ms  p(99.9)=199.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 56730
     http_req_receiving.............: avg=5.39ms  min=50.87µs med=4.93ms  max=231.02ms p(90)=10.72ms p(95)=13.05ms  p(99.9)=34.81ms 
     http_req_sending...............: avg=70.03µs min=5.56µs  med=10.9µs  max=231.81ms p(90)=28.14µs p(95)=123.37µs p(99.9)=7.78ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=47.19ms min=3.22ms  med=45.9ms  max=455.82ms p(90)=62.68ms p(95)=68.55ms  p(99.9)=195.65ms
     http_reqs......................: 56730   939.141204/s
     iteration_duration.............: avg=52.98ms min=11.45ms med=51.92ms max=504.84ms p(90)=68.49ms p(95)=74.07ms  p(99.9)=220.08ms
     iterations.....................: 56630   937.485747/s
     success_rate...................: 100.00% ✓ 56630      ✗ 0    
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

     checks.........................: 100.00% ✓ 157287     ✗ 0    
     data_received..................: 4.6 GB  76 MB/s
     data_sent......................: 61 MB   1.0 MB/s
     http_req_blocked...............: avg=18.82µs min=1.43µs  med=2.93µs  max=24.71ms  p(90)=4.11µs  p(95)=4.79µs   p(99.9)=206.64µs
     http_req_connecting............: avg=14.79µs min=0s      med=0s      max=24.64ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=56.86ms min=2.74ms  med=55.75ms max=504.53ms p(90)=72.99ms p(95)=79.4ms   p(99.9)=259.37ms
       { expected_response:true }...: avg=56.86ms min=2.74ms  med=55.75ms max=504.53ms p(90)=72.99ms p(95)=79.4ms   p(99.9)=259.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52529
     http_req_receiving.............: avg=6.44ms  min=51.91µs med=6.02ms  max=131.46ms p(90)=12.5ms  p(95)=15.13ms  p(99.9)=35.85ms 
     http_req_sending...............: avg=64.98µs min=5.71µs  med=11.51µs max=241.99ms p(90)=29.89µs p(95)=130.95µs p(99.9)=5.38ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=50.35ms min=2.63ms  med=48.75ms max=503.8ms  p(90)=66.33ms p(95)=73.12ms  p(99.9)=251.39ms
     http_reqs......................: 52529   870.508273/s
     iteration_duration.............: avg=57.21ms min=10.3ms  med=55.98ms max=542.53ms p(90)=73.21ms p(95)=79.63ms  p(99.9)=264.16ms
     iterations.....................: 52429   868.851078/s
     success_rate...................: 100.00% ✓ 52429      ✗ 0    
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

     checks.........................: 100.00% ✓ 133422     ✗ 0    
     data_received..................: 3.9 GB  65 MB/s
     data_sent......................: 52 MB   860 kB/s
     http_req_blocked...............: avg=16.33µs  min=1.29µs  med=2.86µs  max=24.15ms  p(90)=4.05µs   p(95)=4.77µs   p(99.9)=5.37ms  
     http_req_connecting............: avg=12.88µs  min=0s      med=0s      max=24.12ms  p(90)=0s       p(95)=0s       p(99.9)=5.35ms  
     http_req_duration..............: avg=67.07ms  min=2.67ms  med=66.13ms max=512.26ms p(90)=90.88ms  p(95)=98.29ms  p(99.9)=276.88ms
       { expected_response:true }...: avg=67.07ms  min=2.67ms  med=66.13ms max=512.26ms p(90)=90.88ms  p(95)=98.29ms  p(99.9)=276.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44574
     http_req_receiving.............: avg=162.11µs min=29.27µs med=79.51µs max=198.58ms p(90)=157.75µs p(95)=375µs    p(99.9)=14.56ms 
     http_req_sending...............: avg=56.18µs  min=5.46µs  med=11.28µs max=313.1ms  p(90)=29.61µs  p(95)=130.73µs p(99.9)=6.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=66.85ms  min=2.59ms  med=65.94ms max=491.3ms  p(90)=90.64ms  p(95)=98.03ms  p(99.9)=268.3ms 
     http_reqs......................: 44574   738.115525/s
     iteration_duration.............: avg=67.46ms  min=5.43ms  med=66.39ms max=568.28ms p(90)=91.12ms  p(95)=98.54ms  p(99.9)=294.8ms 
     iterations.....................: 44474   736.459592/s
     success_rate...................: 100.00% ✓ 44474      ✗ 0    
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

     checks.........................: 100.00% ✓ 97899      ✗ 0    
     data_received..................: 2.9 GB  47 MB/s
     data_sent......................: 38 MB   628 kB/s
     http_req_blocked...............: avg=13.26µs min=1.21µs  med=2.79µs  max=12.4ms   p(90)=4.11µs   p(95)=5.01µs   p(99.9)=3.86ms  
     http_req_connecting............: avg=9.81µs  min=0s      med=0s      max=12.37ms  p(90)=0s       p(95)=0s       p(99.9)=3.83ms  
     http_req_duration..............: avg=91.43ms min=5.31ms  med=88.68ms max=564.3ms  p(90)=113.22ms p(95)=124.34ms p(99.9)=368.44ms
       { expected_response:true }...: avg=91.43ms min=5.31ms  med=88.68ms max=564.3ms  p(90)=113.22ms p(95)=124.34ms p(99.9)=368.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32733
     http_req_receiving.............: avg=87.68µs min=25.19µs med=46.83µs max=29.31ms  p(90)=101.28µs p(95)=279.9µs  p(99.9)=2.28ms  
     http_req_sending...............: avg=78.97µs min=5.12µs  med=10.88µs max=436.53ms p(90)=32.05µs  p(95)=134.86µs p(99.9)=4.55ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.26ms min=5.24ms  med=88.54ms max=553.56ms p(90)=113.07ms p(95)=124.17ms p(99.9)=357.74ms
     http_reqs......................: 32733   539.346848/s
     iteration_duration.............: avg=91.97ms min=19.59ms med=88.94ms max=622.46ms p(90)=113.45ms p(95)=124.67ms p(99.9)=391.74ms
     iterations.....................: 32633   537.699132/s
     success_rate...................: 100.00% ✓ 32633      ✗ 0    
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
      ↳  99% — ✓ 23734 / ✗ 1
     ✓ valid response structure

     checks.........................: 99.99% ✓ 71204      ✗ 1    
     data_received..................: 2.1 GB 34 MB/s
     data_sent......................: 28 MB  457 kB/s
     http_req_blocked...............: avg=28.47µs  min=1.96µs  med=3.06µs   max=18.69ms  p(90)=4.48µs   p(95)=5.24µs   p(99.9)=11.23ms 
     http_req_connecting............: avg=24.77µs  min=0s      med=0s       max=18.64ms  p(90)=0s       p(95)=0s       p(99.9)=11.19ms 
     http_req_duration..............: avg=125.7ms  min=5.95ms  med=124.89ms max=589.37ms p(90)=153.79ms p(95)=162.06ms p(99.9)=406.81ms
       { expected_response:true }...: avg=125.7ms  min=5.95ms  med=124.89ms max=589.37ms p(90)=153.79ms p(95)=162.06ms p(99.9)=406.81ms
     http_req_failed................: 0.00%  ✓ 0          ✗ 23835
     http_req_receiving.............: avg=76.72µs  min=31.01µs med=54.57µs  max=93.92ms  p(90)=99.62µs  p(95)=119.12µs p(99.9)=1.01ms  
     http_req_sending...............: avg=64.02µs  min=8.61µs  med=12µs     max=274.87ms p(90)=19.67µs  p(95)=31.6µs   p(99.9)=2.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.56ms min=5.9ms   med=124.79ms max=587.18ms p(90)=153.66ms p(95)=161.87ms p(99.9)=401.55ms
     http_reqs......................: 23835  392.190497/s
     iteration_duration.............: avg=126.49ms min=23.29ms med=125.22ms max=635.58ms p(90)=154.06ms p(95)=162.36ms p(99.9)=430.85ms
     iterations.....................: 23735  390.545058/s
     success_rate...................: 99.99% ✓ 23734      ✗ 1    
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

     checks.........................: 100.00% ✓ 49119      ✗ 0    
     data_received..................: 1.4 GB  24 MB/s
     data_sent......................: 19 MB   315 kB/s
     http_req_blocked...............: avg=46.09µs  min=1.19µs  med=2.76µs   max=21.55ms  p(90)=4.54µs   p(95)=5.51µs   p(99.9)=15.84ms 
     http_req_connecting............: avg=42.53µs  min=0s      med=0s       max=21.52ms  p(90)=0s       p(95)=0s       p(99.9)=15.81ms 
     http_req_duration..............: avg=181.9ms  min=7.02ms  med=176.38ms max=630.39ms p(90)=220.22ms p(95)=268.63ms p(99.9)=493.91ms
       { expected_response:true }...: avg=181.9ms  min=7.02ms  med=176.38ms max=630.39ms p(90)=220.22ms p(95)=268.63ms p(99.9)=493.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16473
     http_req_receiving.............: avg=83.47µs  min=25.86µs med=45.76µs  max=6.62ms   p(90)=107.46µs p(95)=199.82µs p(99.9)=2.16ms  
     http_req_sending...............: avg=120.95µs min=5.35µs  med=11.01µs  max=229.29ms p(90)=30.72µs  p(95)=127.55µs p(99.9)=6.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.69ms min=6.96ms  med=176.26ms max=626.17ms p(90)=220.01ms p(95)=268.26ms p(99.9)=487.99ms
     http_reqs......................: 16473   270.397603/s
     iteration_duration.............: avg=183.36ms min=37.84ms med=176.78ms max=689.07ms p(90)=220.83ms p(95)=269.12ms p(99.9)=575.51ms
     iterations.....................: 16373   268.756144/s
     success_rate...................: 100.00% ✓ 16373      ✗ 0    
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

     checks.........................: 100.00% ✓ 12582     ✗ 0   
     data_received..................: 377 MB  6.1 MB/s
     data_sent......................: 5.0 MB  81 kB/s
     http_req_blocked...............: avg=81.86µs  min=1.47µs   med=2.98µs   max=13.26ms  p(90)=4.85µs   p(95)=5.59µs   p(99.9)=12.04ms 
     http_req_connecting............: avg=78.17µs  min=0s       med=0s       max=13.21ms  p(90)=0s       p(95)=0s       p(99.9)=12ms    
     http_req_duration..............: avg=703.66ms min=12.13ms  med=714.19ms max=1.01s    p(90)=790.34ms p(95)=829.49ms p(99.9)=981.17ms
       { expected_response:true }...: avg=703.66ms min=12.13ms  med=714.19ms max=1.01s    p(90)=790.34ms p(95)=829.49ms p(99.9)=981.17ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 4294
     http_req_receiving.............: avg=65.9µs   min=32.4µs   med=55.95µs  max=398.29µs p(90)=100.09µs p(95)=114.08µs p(99.9)=320.85µs
     http_req_sending...............: avg=131.2µs  min=6.34µs   med=12.22µs  max=139.93ms p(90)=20.91µs  p(95)=25.12µs  p(99.9)=40.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=703.47ms min=12.07ms  med=714.01ms max=1.01s    p(90)=790.06ms p(95)=829.4ms  p(99.9)=981.04ms
     http_reqs......................: 4294    69.254621/s
     iteration_duration.............: avg=720.49ms min=424.05ms med=715.2ms  max=1.01s    p(90)=792.54ms p(95)=830.5ms  p(99.9)=986.81ms
     iterations.....................: 4194    67.641798/s
     success_rate...................: 100.00% ✓ 4194      ✗ 0   
     vus............................: 8       min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

