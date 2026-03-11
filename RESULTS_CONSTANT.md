## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hotchocolate (rust subgraphs) | 4252  | 255585 total, 0 failed |  avg: 12ms, p95: 26ms  | ❌ non-compatible response structure (255485) |
| grafbase                    | 2013  | 121369 total, 0 failed |  avg: 25ms, p95: 44ms  | ✅                                        |
| hive-router                 | 1973  | 118875 total, 0 failed |  avg: 25ms, p95: 43ms  | ✅                                        |
| hotchocolate (.net subgraphs) |  967  | 58431 total, 0 failed  |  avg: 51ms, p95: 73ms  | ✅                                        |
| cosmo                       |  780  | 47116 total, 0 failed  |  avg: 63ms, p95: 93ms  | ✅                                        |
| hive-gateway-router-runtime |  554  | 33634 total, 0 failed  | avg: 89ms, p95: 121ms  | ✅                                        |
| apollo-router               |  409  | 24856 total, 0 failed  | avg: 120ms, p95: 155ms | ✅                                        |
| hive-gateway                |  263  | 16096 total, 0 failed  | avg: 186ms, p95: 266ms | ✅                                        |
| apollo-gateway              |   70  |  4356 total, 0 failed  | avg: 692ms, p95: 811ms | ✅                                        |


<details>
  <summary>Summary for: hotchocolate (rust subgraphs)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  0% — ✓ 0 / ✗ 255485
     ✗ valid response structure
      ↳  99% — ✓ 255435 / ✗ 50

     checks.........................: 66.66% ✓ 510920      ✗ 255535
     data_received..................: 67 MB  1.1 MB/s
     data_sent......................: 298 MB 5.0 MB/s
     http_req_blocked...............: avg=3.88µs  min=1.17µs   med=2.63µs  max=10.03ms  p(90)=3.32µs  p(95)=3.69µs  p(99.9)=28.32µs
     http_req_connecting............: avg=991ns   min=0s       med=0s      max=9.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=11.64ms min=339.79µs med=9.39ms  max=133.71ms p(90)=21.9ms  p(95)=25.72ms p(99.9)=49.34ms
       { expected_response:true }...: avg=11.64ms min=339.79µs med=9.39ms  max=133.71ms p(90)=21.9ms  p(95)=25.72ms p(99.9)=49.34ms
     http_req_failed................: 0.00%  ✓ 0           ✗ 255585
     http_req_receiving.............: avg=43.88µs min=7.98µs   med=21.34µs max=46.59ms  p(90)=26.2µs  p(95)=42.11µs p(99.9)=3.86ms 
     http_req_sending...............: avg=26.72µs min=4.66µs   med=10.15µs max=28.43ms  p(90)=12.11µs p(95)=18.75µs p(99.9)=3.44ms 
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=11.57ms min=308.33µs med=9.34ms  max=133.68ms p(90)=21.8ms  p(95)=25.59ms p(99.9)=48.51ms
     http_reqs......................: 255585 4252.818127/s
     iteration_duration.............: avg=11.73ms min=477.2µs  med=9.47ms  max=133.82ms p(90)=22ms    p(95)=25.81ms p(99.9)=49.64ms
     iterations.....................: 255485 4251.154172/s
     success_rate...................: 0.00%  ✓ 0           ✗ 255485
     vus............................: 50     min=50        max=50  
     vus_max........................: 50     min=50        max=50
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

     checks.........................: 100.00% ✓ 363807      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=8.53µs   min=1.39µs  med=2.85µs  max=18.32ms  p(90)=3.89µs   p(95)=4.43µs   p(99.9)=105.63µs
     http_req_connecting............: avg=5.1µs    min=0s      med=0s      max=18.19ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.5ms   min=2.37ms  med=21.71ms max=424.51ms p(90)=38.19ms  p(95)=43.67ms  p(99.9)=69.47ms 
       { expected_response:true }...: avg=24.5ms   min=2.37ms  med=21.71ms max=424.51ms p(90)=38.19ms  p(95)=43.67ms  p(99.9)=69.47ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 121369
     http_req_receiving.............: avg=123.28µs min=25.64µs med=46.44µs max=77.35ms  p(90)=157.58µs p(95)=366.67µs p(99.9)=11.09ms 
     http_req_sending...............: avg=88.17µs  min=6.01µs  med=11.23µs max=333.28ms p(90)=84.31µs  p(95)=134.1µs  p(99.9)=12.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.29ms  min=2.33ms  med=21.56ms max=412.32ms p(90)=37.79ms  p(95)=43.28ms  p(99.9)=68.18ms 
     http_reqs......................: 121369  2013.204041/s
     iteration_duration.............: avg=24.72ms  min=3.81ms  med=21.91ms max=448.01ms p(90)=38.4ms   p(95)=43.88ms  p(99.9)=70.13ms 
     iterations.....................: 121269  2011.545295/s
     success_rate...................: 100.00% ✓ 121269      ✗ 0     
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

     checks.........................: 100.00% ✓ 356325      ✗ 0     
     data_received..................: 10 GB   173 MB/s
     data_sent......................: 139 MB  2.3 MB/s
     http_req_blocked...............: avg=8.46µs   min=1.2µs   med=2.45µs  max=18.12ms  p(90)=3.57µs   p(95)=4.25µs   p(99.9)=83.2µs 
     http_req_connecting............: avg=5.48µs   min=0s      med=0s      max=17.99ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.04ms  min=2.08ms  med=23.15ms max=431.56ms p(90)=37.4ms   p(95)=42.63ms  p(99.9)=72.52ms
       { expected_response:true }...: avg=25.04ms  min=2.08ms  med=23.15ms max=431.56ms p(90)=37.4ms   p(95)=42.63ms  p(99.9)=72.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118875
     http_req_receiving.............: avg=101.94µs min=24.31µs med=42.58µs max=93.7ms   p(90)=125.34µs p(95)=322.57µs p(99.9)=6.97ms 
     http_req_sending...............: avg=75.56µs  min=5.04µs  med=9.8µs   max=347.33ms p(90)=58.93µs  p(95)=128.15µs p(99.9)=9.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.86ms  min=2.03ms  med=23.01ms max=419.64ms p(90)=37.11ms  p(95)=42.3ms   p(99.9)=71.56ms
     http_reqs......................: 118875  1973.187664/s
     iteration_duration.............: avg=25.24ms  min=3.87ms  med=23.34ms max=457.03ms p(90)=37.58ms  p(95)=42.81ms  p(99.9)=73.03ms
     iterations.....................: 118775  1971.527779/s
     success_rate...................: 100.00% ✓ 118775      ✗ 0     
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

     checks.........................: 100.00% ✓ 174993     ✗ 0    
     data_received..................: 5.1 GB  85 MB/s
     data_sent......................: 68 MB   1.1 MB/s
     http_req_blocked...............: avg=14.3µs  min=1.32µs  med=2.78µs  max=18.53ms  p(90)=3.96µs  p(95)=4.71µs   p(99.9)=128.94µs
     http_req_connecting............: avg=10.81µs min=0s      med=0s      max=18.33ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=51.1ms  min=3.04ms  med=49.48ms max=474.34ms p(90)=66.73ms p(95)=73.43ms  p(99.9)=194.63ms
       { expected_response:true }...: avg=51.1ms  min=3.04ms  med=49.48ms max=474.34ms p(90)=66.73ms p(95)=73.43ms  p(99.9)=194.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58431
     http_req_receiving.............: avg=2.54ms  min=55.6µs  med=1.64ms  max=168.52ms p(90)=5.8ms   p(95)=7.89ms   p(99.9)=35.9ms  
     http_req_sending...............: avg=58.91µs min=5.8µs   med=11.15µs max=246.62ms p(90)=30.75µs p(95)=127.97µs p(99.9)=4.96ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=48.5ms  min=2.96ms  med=46.76ms max=455.06ms p(90)=63.73ms p(95)=70.75ms  p(99.9)=187.08ms
     http_reqs......................: 58431   967.831982/s
     iteration_duration.............: avg=51.43ms min=14.82ms med=49.71ms max=514.84ms p(90)=66.97ms p(95)=73.68ms  p(99.9)=216.66ms
     iterations.....................: 58331   966.175615/s
     success_rate...................: 100.00% ✓ 58331      ✗ 0    
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

     checks.........................: 100.00% ✓ 141048    ✗ 0    
     data_received..................: 4.1 GB  69 MB/s
     data_sent......................: 55 MB   909 kB/s
     http_req_blocked...............: avg=10.88µs  min=1.27µs  med=2.7µs   max=14.35ms  p(90)=3.73µs   p(95)=4.34µs   p(99.9)=504.48µs
     http_req_connecting............: avg=7.66µs   min=0s      med=0s      max=14.31ms  p(90)=0s       p(95)=0s       p(99.9)=482.53µs
     http_req_duration..............: avg=63.43ms  min=2.66ms  med=62.28ms max=489.47ms p(90)=86.39ms  p(95)=93.47ms  p(99.9)=236.77ms
       { expected_response:true }...: avg=63.43ms  min=2.66ms  med=62.28ms max=489.47ms p(90)=86.39ms  p(95)=93.47ms  p(99.9)=236.77ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 47116
     http_req_receiving.............: avg=157.41µs min=28.14µs med=68.91µs max=123.4ms  p(90)=144.78µs p(95)=361.04µs p(99.9)=14.88ms 
     http_req_sending...............: avg=53.23µs  min=5.86µs  med=10.94µs max=169.68ms p(90)=28.74µs  p(95)=129.02µs p(99.9)=7.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=63.22ms  min=2.59ms  med=62.07ms max=479.92ms p(90)=86.17ms  p(95)=93.22ms  p(99.9)=226.72ms
     http_reqs......................: 47116   780.37318/s
     iteration_duration.............: avg=63.81ms  min=6.21ms  med=62.52ms max=537.99ms p(90)=86.63ms  p(95)=93.69ms  p(99.9)=261.81ms
     iterations.....................: 47016   778.7169/s
     success_rate...................: 100.00% ✓ 47016     ✗ 0    
     vus............................: 50      min=50      max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 100602     ✗ 0    
     data_received..................: 3.0 GB  49 MB/s
     data_sent......................: 39 MB   646 kB/s
     http_req_blocked...............: avg=22.22µs min=1.18µs  med=2.73µs  max=22.8ms   p(90)=3.96µs   p(95)=4.67µs   p(99.9)=10.44ms 
     http_req_connecting............: avg=18.83µs min=0s      med=0s      max=22.77ms  p(90)=0s       p(95)=0s       p(99.9)=10.35ms 
     http_req_duration..............: avg=89ms    min=5.12ms  med=85.86ms max=538.8ms  p(90)=109.36ms p(95)=120.64ms p(99.9)=344.84ms
       { expected_response:true }...: avg=89ms    min=5.12ms  med=85.86ms max=538.8ms  p(90)=109.36ms p(95)=120.64ms p(99.9)=344.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33634
     http_req_receiving.............: avg=82.5µs  min=24.99µs med=44.94µs max=19.57ms  p(90)=95.34µs  p(95)=253.03µs p(99.9)=2.39ms  
     http_req_sending...............: avg=92.34µs min=5.41µs  med=11µs    max=430ms    p(90)=30.73µs  p(95)=131.3µs  p(99.9)=5.48ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.82ms min=5.09ms  med=85.74ms max=538.55ms p(90)=109.2ms  p(95)=120.46ms p(99.9)=330.37ms
     http_reqs......................: 33634   554.667577/s
     iteration_duration.............: avg=89.48ms min=14.23ms med=86.12ms max=572.24ms p(90)=109.6ms  p(95)=120.88ms p(99.9)=353.8ms 
     iterations.....................: 33534   553.018449/s
     success_rate...................: 100.00% ✓ 33534      ✗ 0    
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

     checks.........................: 100.00% ✓ 74268      ✗ 0    
     data_received..................: 2.2 GB  36 MB/s
     data_sent......................: 29 MB   477 kB/s
     http_req_blocked...............: avg=29.33µs  min=1.83µs  med=2.95µs   max=18.2ms   p(90)=4.25µs   p(95)=5.02µs   p(99.9)=13.45ms 
     http_req_connecting............: avg=25.76µs  min=0s      med=0s       max=18.03ms  p(90)=0s       p(95)=0s       p(99.9)=13.41ms 
     http_req_duration..............: avg=120.48ms min=5.79ms  med=119.51ms max=575.87ms p(90)=146.68ms p(95)=155.22ms p(99.9)=402.9ms 
       { expected_response:true }...: avg=120.48ms min=5.79ms  med=119.51ms max=575.87ms p(90)=146.68ms p(95)=155.22ms p(99.9)=402.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 24856
     http_req_receiving.............: avg=76.58µs  min=35.21µs med=54.12µs  max=2.1ms    p(90)=103.58µs p(95)=128.49µs p(99.9)=1.22ms  
     http_req_sending...............: avg=70.26µs  min=7.28µs  med=11.6µs   max=376.96ms p(90)=18.46µs  p(95)=34.72µs  p(99.9)=2.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.33ms min=5.67ms  med=119.4ms  max=575.12ms p(90)=146.53ms p(95)=155.09ms p(99.9)=402.15ms
     http_reqs......................: 24856   409.370564/s
     iteration_duration.............: avg=121.24ms min=29.4ms  med=119.79ms max=631.14ms p(90)=146.94ms p(95)=155.52ms p(99.9)=430.97ms
     iterations.....................: 24756   407.723595/s
     success_rate...................: 100.00% ✓ 24756      ✗ 0    
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

     checks.........................: 100.00% ✓ 47988      ✗ 0    
     data_received..................: 1.4 GB  23 MB/s
     data_sent......................: 19 MB   307 kB/s
     http_req_blocked...............: avg=23.58µs  min=1.24µs  med=2.67µs   max=12.43ms  p(90)=4.54µs   p(95)=5.55µs   p(99.9)=8.51ms  
     http_req_connecting............: avg=20.2µs   min=0s      med=0s       max=12.39ms  p(90)=0s       p(95)=0s       p(99.9)=8.48ms  
     http_req_duration..............: avg=186.24ms min=7.29ms  med=179.89ms max=677.54ms p(90)=218.34ms p(95)=266.38ms p(99.9)=513.47ms
       { expected_response:true }...: avg=186.24ms min=7.29ms  med=179.89ms max=677.54ms p(90)=218.34ms p(95)=266.38ms p(99.9)=513.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16096
     http_req_receiving.............: avg=84.27µs  min=27.2µs  med=45.73µs  max=13.87ms  p(90)=107.19µs p(95)=217.07µs p(99.9)=1.9ms   
     http_req_sending...............: avg=94.86µs  min=5.4µs   med=11.15µs  max=384.18ms p(90)=30.99µs  p(95)=135.13µs p(99.9)=4.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.07ms min=7.22ms  med=179.75ms max=676.39ms p(90)=218.15ms p(95)=266.18ms p(99.9)=502.99ms
     http_reqs......................: 16096   263.761048/s
     iteration_duration.............: avg=187.74ms min=28.82ms med=180.23ms max=736.84ms p(90)=218.8ms  p(95)=267.17ms p(99.9)=550.04ms
     iterations.....................: 15996   262.122373/s
     success_rate...................: 100.00% ✓ 15996      ✗ 0    
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

     checks.........................: 100.00% ✓ 12768     ✗ 0   
     data_received..................: 383 MB  6.2 MB/s
     data_sent......................: 5.1 MB  82 kB/s
     http_req_blocked...............: avg=78.44µs  min=1.45µs   med=2.93µs   max=12.5ms   p(90)=4.33µs   p(95)=5.27µs   p(99.9)=11.67ms 
     http_req_connecting............: avg=72.58µs  min=0s       med=0s       max=12.46ms  p(90)=0s       p(95)=0s       p(99.9)=11.36ms 
     http_req_duration..............: avg=692.21ms min=12.07ms  med=698.5ms  max=1.17s    p(90)=781.58ms p(95)=811.45ms p(99.9)=1.08s   
       { expected_response:true }...: avg=692.21ms min=12.07ms  med=698.5ms  max=1.17s    p(90)=781.58ms p(95)=811.45ms p(99.9)=1.08s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 4356
     http_req_receiving.............: avg=63.1µs   min=30.83µs  med=52.42µs  max=12.26ms  p(90)=89.46µs  p(95)=101.28µs p(99.9)=319.52µs
     http_req_sending...............: avg=167.55µs min=6.16µs   med=11.76µs  max=290.32ms p(90)=17.74µs  p(95)=22.61µs  p(99.9)=9.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=691.98ms min=12.02ms  med=698.38ms max=1.17s    p(90)=781.42ms p(95)=810.36ms p(99.9)=1.07s   
     http_reqs......................: 4356    70.373269/s
     iteration_duration.............: avg=709.13ms min=523.66ms med=700.44ms max=1.21s    p(90)=782.69ms p(95)=813.49ms p(99.9)=1.2s    
     iterations.....................: 4256    68.757721/s
     success_rate...................: 100.00% ✓ 4256      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

