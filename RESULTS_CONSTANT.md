## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 10 times (120s each) and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **120s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| cosmo                       | 3466  | 417238 total, 0 failed |  avg: 14ms, p95: 29ms  | ✅                                        |
| hive-router                 | 1960  | 235827 total, 0 failed |  avg: 25ms, p95: 41ms  | ✅                                        |
| grafbase                    | 1792  | 215751 total, 0 failed |  avg: 28ms, p95: 42ms  | ✅                                        |
| hotchocolate (rust subgraphs) |  804  | 96950 total, 0 failed  | avg: 62ms, p95: 164ms  | ✅                                        |
| hotchocolate (.net subgraphs) |  767  | 92464 total, 0 failed  | avg: 65ms, p95: 179ms  | ✅                                        |
| hive-gateway-router-runtime |  353  | 42662 total, 0 failed  | avg: 141ms, p95: 181ms | ✅                                        |
| apollo-router               |  299  | 36211 total, 0 failed  | avg: 166ms, p95: 216ms | ✅                                        |
| hive-gateway                |  173  | 20982 total, 0 failed  | avg: 286ms, p95: 400ms | ✅                                        |
| apollo-gateway              |   71  |  8720 total, 0 failed  | avg: 690ms, p95: 795ms | ✅                                        |


<details>
  <summary>Summary for: cosmo</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1251414     ✗ 0     
     data_received..................: 37 GB   304 MB/s
     data_sent......................: 486 MB  4.0 MB/s
     http_req_blocked...............: avg=3.19µs  min=1.09µs   med=1.47µs  max=18.57ms  p(90)=2.12µs  p(95)=2.5µs    p(99.9)=22.82µs
     http_req_connecting............: avg=1.43µs  min=0s       med=0s      max=18.51ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=14.26ms min=361.64µs med=12.14ms max=386.58ms p(90)=25.06ms p(95)=28.94ms  p(99.9)=45.93ms
       { expected_response:true }...: avg=14.26ms min=361.64µs med=12.14ms max=386.58ms p(90)=25.06ms p(95)=28.94ms  p(99.9)=45.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 417238
     http_req_receiving.............: avg=78.22µs min=21.24µs  med=28.53µs max=34.96ms  p(90)=65.46µs p(95)=188.34µs p(99.9)=7.74ms 
     http_req_sending...............: avg=43.63µs min=4.56µs   med=5.81µs  max=356.51ms p(90)=11.09µs p(95)=84.47µs  p(99.9)=6.86ms 
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=14.14ms min=332.46µs med=12.04ms max=386.49ms p(90)=24.91ms p(95)=28.73ms  p(99.9)=44.44ms
     http_reqs......................: 417238  3466.814343/s
     iteration_duration.............: avg=14.37ms min=445.75µs med=12.25ms max=411.17ms p(90)=25.17ms p(95)=29.05ms  p(99.9)=46.06ms
     iterations.....................: 417138  3465.983447/s
     success_rate...................: 100.00% ✓ 417138      ✗ 0     
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

     checks.........................: 100.00% ✓ 707181      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.16µs  min=1.12µs  med=1.64µs  max=12.2ms   p(90)=2.45µs  p(95)=2.96µs  p(99.9)=26.3µs 
     http_req_connecting............: avg=1.19µs  min=0s      med=0s      max=12.16ms  p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.31ms min=2.1ms   med=23.91ms max=410.74ms p(90)=35.73ms p(95)=40.58ms p(99.9)=66.65ms
       { expected_response:true }...: avg=25.31ms min=2.1ms   med=23.91ms max=410.74ms p(90)=35.73ms p(95)=40.58ms p(99.9)=66.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 235827
     http_req_receiving.............: avg=69.47µs min=23.28µs med=33.64µs max=43.3ms   p(90)=71.52µs p(95)=207.2µs p(99.9)=2.83ms 
     http_req_sending...............: avg=44.37µs min=5.15µs  med=7.16µs  max=323.83ms p(90)=19.74µs p(95)=93.12µs p(99.9)=5.52ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.19ms min=2.06ms  med=23.82ms max=384.29ms p(90)=35.57ms p(95)=40.42ms p(99.9)=66.09ms
     http_reqs......................: 235827  1960.932706/s
     iteration_duration.............: avg=25.44ms min=4.29ms  med=24.04ms max=450.35ms p(90)=35.85ms p(95)=40.7ms  p(99.9)=66.78ms
     iterations.....................: 235727  1960.101193/s
     success_rate...................: 100.00% ✓ 235727      ✗ 0     
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

     checks.........................: 100.00% ✓ 646953     ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 251 MB  2.1 MB/s
     http_req_blocked...............: avg=3.47µs  min=1.17µs  med=1.63µs  max=11.89ms  p(90)=2.4µs   p(95)=2.89µs   p(99.9)=30.01µs
     http_req_connecting............: avg=1.49µs  min=0s      med=0s      max=11.85ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=27.68ms min=2.51ms  med=26.34ms max=425.64ms p(90)=36.86ms p(95)=41.89ms  p(99.9)=68.31ms
       { expected_response:true }...: avg=27.68ms min=2.51ms  med=26.34ms max=425.64ms p(90)=36.86ms p(95)=41.89ms  p(99.9)=68.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 215751
     http_req_receiving.............: avg=67.34µs min=23.71µs med=34.44µs max=52.93ms  p(90)=72.1µs  p(95)=200.01µs p(99.9)=2.45ms 
     http_req_sending...............: avg=35.98µs min=5.06µs  med=7.11µs  max=144.18ms p(90)=19.14µs p(95)=89.88µs  p(99.9)=3.43ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=27.58ms min=2.47ms  med=26.27ms max=406.83ms p(90)=36.72ms p(95)=41.74ms  p(99.9)=67.71ms
     http_reqs......................: 215751  1792.65272/s
     iteration_duration.............: avg=27.82ms min=5.27ms  med=26.47ms max=469.54ms p(90)=36.98ms p(95)=42.01ms  p(99.9)=68.49ms
     iterations.....................: 215651  1791.82183/s
     success_rate...................: 100.00% ✓ 215651     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 290550     ✗ 0    
     data_received..................: 8.5 GB  71 MB/s
     data_sent......................: 113 MB  938 kB/s
     http_req_blocked...............: avg=8.25µs  min=1.17µs  med=1.72µs  max=19.52ms  p(90)=2.64µs   p(95)=3.08µs   p(99.9)=33.82µs 
     http_req_connecting............: avg=6.04µs  min=0s      med=0s      max=19.49ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=61.75ms min=3.51ms  med=44.3ms  max=570.01ms p(90)=131.03ms p(95)=164.28ms p(99.9)=353.52ms
       { expected_response:true }...: avg=61.75ms min=3.51ms  med=44.3ms  max=570.01ms p(90)=131.03ms p(95)=164.28ms p(99.9)=353.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 96950
     http_req_receiving.............: avg=1.8ms   min=48.84µs med=85.07µs max=236.98ms p(90)=2.45ms   p(95)=7.65ms   p(99.9)=105.06ms
     http_req_sending...............: avg=27.6µs  min=5.02µs  med=7.35µs  max=282.67ms p(90)=11.28µs  p(95)=25.58µs  p(99.9)=1.77ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=59.92ms min=3.44ms  med=42.76ms max=569.57ms p(90)=127.53ms p(95)=160.62ms p(99.9)=348.73ms
     http_reqs......................: 96950   804.92903/s
     iteration_duration.............: avg=61.95ms min=4ms     med=44.49ms max=570.15ms p(90)=131.23ms p(95)=164.5ms  p(99.9)=354.66ms
     iterations.....................: 96850   804.098778/s
     success_rate...................: 100.00% ✓ 96850      ✗ 0    
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

     checks.........................: 100.00% ✓ 277092     ✗ 0    
     data_received..................: 8.1 GB  67 MB/s
     data_sent......................: 108 MB  895 kB/s
     http_req_blocked...............: avg=5.63µs  min=1.15µs  med=1.78µs  max=13.44ms  p(90)=2.88µs   p(95)=3.45µs   p(99.9)=37.47µs 
     http_req_connecting............: avg=3.43µs  min=0s      med=0s      max=13.4ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=64.74ms min=3.06ms  med=45.18ms max=582.35ms p(90)=140.87ms p(95)=178.99ms p(99.9)=392.36ms
       { expected_response:true }...: avg=64.74ms min=3.06ms  med=45.18ms max=582.35ms p(90)=140.87ms p(95)=178.99ms p(99.9)=392.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 92464
     http_req_receiving.............: avg=1.73ms  min=50.75µs med=91.05µs max=419.96ms p(90)=2.23ms   p(95)=5.82ms   p(99.9)=118.51ms
     http_req_sending...............: avg=34.14µs min=5.2µs   med=7.71µs  max=181.5ms  p(90)=12.93µs  p(95)=27.1µs   p(99.9)=4.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=62.97ms min=2.99ms  med=43.64ms max=578.34ms p(90)=137.4ms  p(95)=175.19ms p(99.9)=388.18ms
     http_reqs......................: 92464   767.848408/s
     iteration_duration.............: avg=64.96ms min=3.24ms  med=45.39ms max=582.49ms p(90)=141.07ms p(95)=179.22ms p(99.9)=394.03ms
     iterations.....................: 92364   767.017978/s
     success_rate...................: 100.00% ✓ 92364      ✗ 0    
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

     checks.........................: 100.00% ✓ 127686     ✗ 0    
     data_received..................: 3.7 GB  31 MB/s
     data_sent......................: 50 MB   412 kB/s
     http_req_blocked...............: avg=14.97µs  min=1.13µs  med=1.55µs   max=18.05ms  p(90)=2.58µs   p(95)=3.33µs   p(99.9)=5.15ms  
     http_req_connecting............: avg=12.94µs  min=0s      med=0s       max=17.82ms  p(90)=0s       p(95)=0s       p(99.9)=5.06ms  
     http_req_duration..............: avg=140.54ms min=5.18ms  med=136.45ms max=570.24ms p(90)=156.68ms p(95)=181ms    p(99.9)=304.36ms
       { expected_response:true }...: avg=140.54ms min=5.18ms  med=136.45ms max=570.24ms p(90)=156.68ms p(95)=181ms    p(99.9)=304.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 42662
     http_req_receiving.............: avg=55.15µs  min=24.44µs med=31.69µs  max=11.5ms   p(90)=71.25µs  p(95)=110.16µs p(99.9)=1.11ms  
     http_req_sending...............: avg=45.97µs  min=5.04µs  med=6.63µs   max=190.28ms p(90)=14.62µs  p(95)=81.61µs  p(99.9)=1.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=140.44ms min=5.14ms  med=136.38ms max=569.08ms p(90)=156.56ms p(95)=180.87ms p(99.9)=297.37ms
     http_reqs......................: 42662   353.475142/s
     iteration_duration.............: avg=141.02ms min=17.46ms med=136.59ms max=594.67ms p(90)=156.86ms p(95)=181.21ms p(99.9)=317.82ms
     iterations.....................: 42562   352.646594/s
     success_rate...................: 100.00% ✓ 42562      ✗ 0    
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

     checks.........................: 100.00% ✓ 108333     ✗ 0    
     data_received..................: 3.2 GB  26 MB/s
     data_sent......................: 42 MB   349 kB/s
     http_req_blocked...............: avg=17.42µs  min=1.2µs   med=1.76µs   max=16.22ms  p(90)=2.81µs   p(95)=3.26µs   p(99.9)=8.96ms  
     http_req_connecting............: avg=15.22µs  min=0s      med=0s       max=16.18ms  p(90)=0s       p(95)=0s       p(99.9)=8.92ms  
     http_req_duration..............: avg=165.66ms min=6.72ms  med=164.93ms max=467.79ms p(90)=203.5ms  p(95)=215.6ms  p(99.9)=293.82ms
       { expected_response:true }...: avg=165.66ms min=6.72ms  med=164.93ms max=467.79ms p(90)=203.5ms  p(95)=215.6ms  p(99.9)=293.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 36211
     http_req_receiving.............: avg=51.81µs  min=24.17µs med=42.02µs  max=116.84ms p(90)=68.57µs  p(95)=79.43µs  p(99.9)=532.35µs
     http_req_sending...............: avg=30.51µs  min=5.5µs   med=7.71µs   max=138.99ms p(90)=12.51µs  p(95)=15.06µs  p(99.9)=4.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=165.58ms min=6.68ms  med=164.86ms max=462.62ms p(90)=203.41ms p(95)=215.46ms p(99.9)=291.17ms
     http_reqs......................: 36211   299.622918/s
     iteration_duration.............: avg=166.26ms min=17.1ms  med=165.15ms max=488.7ms  p(90)=203.66ms p(95)=215.76ms p(99.9)=295.72ms
     iterations.....................: 36111   298.795481/s
     success_rate...................: 100.00% ✓ 36111      ✗ 0    
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

     checks.........................: 100.00% ✓ 62646      ✗ 0    
     data_received..................: 1.8 GB  15 MB/s
     data_sent......................: 24 MB   202 kB/s
     http_req_blocked...............: avg=26.11µs  min=1.15µs  med=1.63µs   max=17.67ms  p(90)=3.02µs   p(95)=3.65µs   p(99.9)=11.83ms 
     http_req_connecting............: avg=23.5µs   min=0s      med=0s       max=17.63ms  p(90)=0s       p(95)=0s       p(99.9)=11.05ms 
     http_req_duration..............: avg=285.94ms min=7.02ms  med=277.38ms max=563.83ms p(90)=326.19ms p(95)=399.86ms p(99.9)=493.88ms
       { expected_response:true }...: avg=285.94ms min=7.02ms  med=277.38ms max=563.83ms p(90)=326.19ms p(95)=399.86ms p(99.9)=493.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 20982
     http_req_receiving.............: avg=59.72µs  min=23.77µs med=33.39µs  max=7.94ms   p(90)=82.85µs  p(95)=137.84µs p(99.9)=1.21ms  
     http_req_sending...............: avg=63.32µs  min=5.26µs  med=7.05µs   max=128.13ms p(90)=16.25µs  p(95)=87.79µs  p(99.9)=7.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=285.81ms min=6.96ms  med=277.28ms max=556.22ms p(90)=326.08ms p(95)=399.7ms  p(99.9)=493.62ms
     http_reqs......................: 20982   173.384384/s
     iteration_duration.............: avg=287.46ms min=76ms    med=277.67ms max=582.98ms p(90)=326.62ms p(95)=400.55ms p(99.9)=513.94ms
     iterations.....................: 20882   172.558036/s
     success_rate...................: 100.00% ✓ 20882      ✗ 0    
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

     checks.........................: 100.00% ✓ 25860     ✗ 0   
     data_received..................: 766 MB  6.3 MB/s
     data_sent......................: 10 MB   83 kB/s
     http_req_blocked...............: avg=63.36µs  min=1.39µs   med=2.11µs   max=18.33ms  p(90)=3.43µs   p(95)=3.93µs   p(99.9)=16.42ms 
     http_req_connecting............: avg=60.41µs  min=0s       med=0s       max=18.2ms   p(90)=0s       p(95)=0s       p(99.9)=16.4ms  
     http_req_duration..............: avg=690.34ms min=11.66ms  med=695.82ms max=960.89ms p(90)=759.88ms p(95)=795.24ms p(99.9)=927.87ms
       { expected_response:true }...: avg=690.34ms min=11.66ms  med=695.82ms max=960.89ms p(90)=759.88ms p(95)=795.24ms p(99.9)=927.87ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 8720
     http_req_receiving.............: avg=62.51µs  min=29.46µs  med=43.06µs  max=91.98ms  p(90)=77µs     p(95)=89.14µs  p(99.9)=247.38µs
     http_req_sending...............: avg=57.62µs  min=6.16µs   med=8.76µs   max=123.39ms p(90)=14.54µs  p(95)=16.72µs  p(99.9)=3.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=690.22ms min=11.61ms  med=695.74ms max=960.84ms p(90)=759.8ms  p(95)=795.11ms p(99.9)=927.8ms 
     http_reqs......................: 8720    71.552771/s
     iteration_duration.............: avg=698.45ms min=487.11ms med=696.44ms max=961.03ms p(90)=760.44ms p(95)=796.25ms p(99.9)=928ms   
     iterations.....................: 8620    70.732212/s
     success_rate...................: 100.00% ✓ 8620      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

