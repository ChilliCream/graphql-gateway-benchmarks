## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform))

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS).

This scenario executes a constant load of **50 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router                 | 1993  | 120091 total, 0 failed |  avg: 25ms, p95: 42ms  | ✅                                        |
| grafbase                    | 1922  | 115944 total, 0 failed |  avg: 26ms, p95: 47ms  | ✅                                        |
| hotchocolate                |  829  | 50077 total, 0 failed  |  avg: 60ms, p95: 84ms  | ✅                                        |
| cosmo                       |  778  | 47003 total, 0 failed  |  avg: 64ms, p95: 93ms  | ✅                                        |
| apollo-router               |  411  | 24994 total, 0 failed  | avg: 120ms, p95: 156ms | ✅                                        |
| hive-gateway-router-runtime |  330  | 20032 total, 0 failed  | avg: 150ms, p95: 181ms | ✅                                        |
| hive-gateway                |  165  | 10154 total, 0 failed  | avg: 296ms, p95: 369ms | ✅                                        |
| apollo-gateway              |   70  |  4341 total, 0 failed  | avg: 695ms, p95: 822ms | ✅                                        |


<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 359973      ✗ 0     
     data_received..................: 11 GB   175 MB/s
     data_sent......................: 140 MB  2.3 MB/s
     http_req_blocked...............: avg=16.33µs  min=1.2µs   med=2.46µs  max=72.48ms  p(90)=3.53µs   p(95)=4.16µs   p(99.9)=81.97µs
     http_req_connecting............: avg=13.37µs  min=0s      med=0s      max=72.47ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.78ms  min=1.82ms  med=22.83ms max=361.9ms  p(90)=37.03ms  p(95)=42.25ms  p(99.9)=79.68ms
       { expected_response:true }...: avg=24.78ms  min=1.82ms  med=22.83ms max=361.9ms  p(90)=37.03ms  p(95)=42.25ms  p(99.9)=79.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 120091
     http_req_receiving.............: avg=102.55µs min=23.14µs med=42.76µs max=35.08ms  p(90)=119.72µs p(95)=318.49µs p(99.9)=7.52ms 
     http_req_sending...............: avg=102.22µs min=5.18µs  med=9.84µs  max=201.01ms p(90)=45.47µs  p(95)=126.14µs p(99.9)=11.11ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.57ms  min=1.78ms  med=22.7ms  max=239.01ms p(90)=36.74ms  p(95)=41.96ms  p(99.9)=74.89ms
     http_reqs......................: 120091  1993.802981/s
     iteration_duration.............: avg=24.99ms  min=3.65ms  med=23.01ms max=445.21ms p(90)=37.22ms  p(95)=42.43ms  p(99.9)=80.31ms
     iterations.....................: 119991  1992.142738/s
     success_rate...................: 100.00% ✓ 119991      ✗ 0     
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

     checks.........................: 100.00% ✓ 347532      ✗ 0     
     data_received..................: 10 GB   169 MB/s
     data_sent......................: 135 MB  2.2 MB/s
     http_req_blocked...............: avg=9.29µs   min=1.24µs  med=2.99µs  max=17.56ms  p(90)=4.26µs   p(95)=4.97µs   p(99.9)=115.81µs
     http_req_connecting............: avg=5.7µs    min=0s      med=0s      max=17.35ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.65ms  min=2.45ms  med=22.57ms max=454.19ms p(90)=40.9ms   p(95)=46.81ms  p(99.9)=76.68ms 
       { expected_response:true }...: avg=25.65ms  min=2.45ms  med=22.57ms max=454.19ms p(90)=40.9ms   p(95)=46.81ms  p(99.9)=76.68ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 115944
     http_req_receiving.............: avg=138.82µs min=28.59µs med=49.1µs  max=155.38ms p(90)=175.37µs p(95)=405.4µs  p(99.9)=13.87ms 
     http_req_sending...............: avg=94.97µs  min=5.23µs  med=11.53µs max=199.52ms p(90)=93.93µs  p(95)=147.55µs p(99.9)=13.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=25.41ms  min=2.4ms   med=22.41ms max=433.96ms p(90)=40.45ms  p(95)=46.38ms  p(99.9)=74.34ms 
     http_reqs......................: 115944  1922.672881/s
     iteration_duration.............: avg=25.88ms  min=4.15ms  med=22.78ms max=479.18ms p(90)=41.12ms  p(95)=47.03ms  p(99.9)=77.06ms 
     iterations.....................: 115844  1921.014604/s
     success_rate...................: 100.00% ✓ 115844      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 149931     ✗ 0    
     data_received..................: 4.4 GB  73 MB/s
     data_sent......................: 58 MB   966 kB/s
     http_req_blocked...............: avg=17.43µs min=1.4µs   med=2.91µs  max=20.96ms  p(90)=4.13µs  p(95)=4.85µs   p(99.9)=284.47µs
     http_req_connecting............: avg=13.67µs min=0s      med=0s      max=20.81ms  p(90)=0s      p(95)=0s       p(99.9)=152.72µs
     http_req_duration..............: avg=59.67ms min=2.7ms   med=58.42ms max=472.99ms p(90)=76.99ms p(95)=83.93ms  p(99.9)=226.91ms
       { expected_response:true }...: avg=59.67ms min=2.7ms   med=58.42ms max=472.99ms p(90)=76.99ms p(95)=83.93ms  p(99.9)=226.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50077
     http_req_receiving.............: avg=6.91ms  min=57.65µs med=6.43ms  max=216.78ms p(90)=13.15ms p(95)=15.98ms  p(99.9)=38.52ms 
     http_req_sending...............: avg=58.69µs min=5.99µs  med=11.5µs  max=265.06ms p(90)=29.14µs p(95)=129.66µs p(99.9)=4.81ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=52.7ms  min=2.57ms  med=51.18ms max=472.31ms p(90)=69.8ms  p(95)=76.96ms  p(99.9)=203.54ms
     http_reqs......................: 50077   829.509244/s
     iteration_duration.............: avg=60.04ms min=9.15ms  med=58.65ms max=547.18ms p(90)=77.22ms p(95)=84.14ms  p(99.9)=253.06ms
     iterations.....................: 49977   827.852777/s
     success_rate...................: 100.00% ✓ 49977      ✗ 0    
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

     checks.........................: 100.00% ✓ 140709     ✗ 0    
     data_received..................: 4.1 GB  68 MB/s
     data_sent......................: 55 MB   907 kB/s
     http_req_blocked...............: avg=9.1µs    min=1.27µs  med=2.66µs  max=10.86ms  p(90)=3.63µs   p(95)=4.19µs   p(99.9)=1.04ms  
     http_req_connecting............: avg=5.93µs   min=0s      med=0s      max=10.81ms  p(90)=0s       p(95)=0s       p(99.9)=986.92µs
     http_req_duration..............: avg=63.61ms  min=2.57ms  med=62.58ms max=485.68ms p(90)=86.01ms  p(95)=92.9ms   p(99.9)=264.9ms 
       { expected_response:true }...: avg=63.61ms  min=2.57ms  med=62.58ms max=485.68ms p(90)=86.01ms  p(95)=92.9ms   p(99.9)=264.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 47003
     http_req_receiving.............: avg=147.94µs min=28.67µs med=70.24µs max=41.91ms  p(90)=139.69µs p(95)=348.12µs p(99.9)=14.02ms 
     http_req_sending...............: avg=56.8µs   min=5.57µs  med=10.92µs max=219.96ms p(90)=27.41µs  p(95)=122.55µs p(99.9)=2.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=63.4ms   min=2.49ms  med=62.4ms  max=484.55ms p(90)=85.83ms  p(95)=92.68ms  p(99.9)=260.62ms
     http_reqs......................: 47003   778.670172/s
     iteration_duration.............: avg=63.96ms  min=3.5ms   med=62.82ms max=507.12ms p(90)=86.24ms  p(95)=93.14ms  p(99.9)=270.4ms 
     iterations.....................: 46903   777.013533/s
     success_rate...................: 100.00% ✓ 46903      ✗ 0    
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

     checks.........................: 100.00% ✓ 74682      ✗ 0    
     data_received..................: 2.2 GB  36 MB/s
     data_sent......................: 29 MB   480 kB/s
     http_req_blocked...............: avg=24.58µs  min=1.8µs   med=2.87µs   max=17.37ms  p(90)=4.15µs   p(95)=4.82µs   p(99.9)=9.43ms  
     http_req_connecting............: avg=21.15µs  min=0s      med=0s       max=17.34ms  p(90)=0s       p(95)=0s       p(99.9)=9.4ms   
     http_req_duration..............: avg=119.8ms  min=5.61ms  med=118.78ms max=552.77ms p(90)=147.84ms p(95)=156.09ms p(99.9)=384.52ms
       { expected_response:true }...: avg=119.8ms  min=5.61ms  med=118.78ms max=552.77ms p(90)=147.84ms p(95)=156.09ms p(99.9)=384.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 24994
     http_req_receiving.............: avg=69.72µs  min=35.56µs med=52.61µs  max=2.73ms   p(90)=94.74µs  p(95)=113.24µs p(99.9)=998.34µs
     http_req_sending...............: avg=43.82µs  min=6.94µs  med=11.29µs  max=287.12ms p(90)=17.9µs   p(95)=30.12µs  p(99.9)=1.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.69ms min=5.57ms  med=118.68ms max=551.43ms p(90)=147.71ms p(95)=155.99ms p(99.9)=377.9ms 
     http_reqs......................: 24994   411.893383/s
     iteration_duration.............: avg=120.55ms min=25.8ms  med=119.08ms max=621.41ms p(90)=148.07ms p(95)=156.43ms p(99.9)=424.33ms
     iterations.....................: 24894   410.245414/s
     success_rate...................: 100.00% ✓ 24894      ✗ 0    
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

     checks.........................: 100.00% ✓ 59796      ✗ 0    
     data_received..................: 1.8 GB  29 MB/s
     data_sent......................: 23 MB   385 kB/s
     http_req_blocked...............: avg=27.73µs  min=1.22µs  med=2.32µs   max=15.81ms  p(90)=3.67µs   p(95)=4.91µs   p(99.9)=11.05ms 
     http_req_connecting............: avg=24.65µs  min=0s      med=0s       max=15.77ms  p(90)=0s       p(95)=0s       p(99.9)=10.99ms 
     http_req_duration..............: avg=149.64ms min=5.25ms  med=147.31ms max=562.86ms p(90)=162.61ms p(95)=181.06ms p(99.9)=425.51ms
       { expected_response:true }...: avg=149.64ms min=5.25ms  med=147.31ms max=562.86ms p(90)=162.61ms p(95)=181.06ms p(99.9)=425.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 20032
     http_req_receiving.............: avg=84.31µs  min=25.03µs med=42.75µs  max=14.4ms   p(90)=105.62µs p(95)=311.92µs p(99.9)=2.42ms  
     http_req_sending...............: avg=101.23µs min=5.18µs  med=9.67µs   max=410.38ms p(90)=32.62µs  p(95)=133.32µs p(99.9)=4.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=149.46ms min=5.19ms  med=147.21ms max=562.31ms p(90)=162.47ms p(95)=180.85ms p(99.9)=396.72ms
     http_reqs......................: 20032   330.099257/s
     iteration_duration.............: avg=150.59ms min=17.07ms med=147.53ms max=586.28ms p(90)=162.89ms p(95)=181.55ms p(99.9)=445.51ms
     iterations.....................: 19932   328.451397/s
     success_rate...................: 100.00% ✓ 19932      ✗ 0    
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

     checks.........................: 100.00% ✓ 30162      ✗ 0    
     data_received..................: 892 MB  15 MB/s
     data_sent......................: 12 MB   193 kB/s
     http_req_blocked...............: avg=30.54µs  min=1.18µs  med=2.48µs   max=11.35ms  p(90)=3.99µs   p(95)=5.39µs   p(99.9)=8.86ms  
     http_req_connecting............: avg=27.44µs  min=0s      med=0s       max=11.31ms  p(90)=0s       p(95)=0s       p(99.9)=8.84ms  
     http_req_duration..............: avg=296.1ms  min=7.23ms  med=290.39ms max=713.54ms p(90)=352.79ms p(95)=368.84ms p(99.9)=645.76ms
       { expected_response:true }...: avg=296.1ms  min=7.23ms  med=290.39ms max=713.54ms p(90)=352.79ms p(95)=368.84ms p(99.9)=645.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 10154
     http_req_receiving.............: avg=119.9µs  min=25.45µs med=44.88µs  max=281.47ms p(90)=116.14µs p(95)=330.95µs p(99.9)=5.28ms  
     http_req_sending...............: avg=112.32µs min=5.2µs   med=10.52µs  max=303.27ms p(90)=36.01µs  p(95)=136.59µs p(99.9)=9.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=295.87ms min=7.16ms  med=290.26ms max=704.09ms p(90)=352.62ms p(95)=368.38ms p(99.9)=631.11ms
     http_reqs......................: 10154   165.922489/s
     iteration_duration.............: avg=299.3ms  min=48.39ms med=290.8ms  max=745.61ms p(90)=353.18ms p(95)=369.6ms  p(99.9)=672.88ms
     iterations.....................: 10054   164.288429/s
     success_rate...................: 100.00% ✓ 10054      ✗ 0    
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

     checks.........................: 100.00% ✓ 12723     ✗ 0   
     data_received..................: 381 MB  6.2 MB/s
     data_sent......................: 5.1 MB  82 kB/s
     http_req_blocked...............: avg=74.38µs  min=1.48µs   med=3.04µs   max=12.11ms  p(90)=4.9µs    p(95)=5.53µs   p(99.9)=11.07ms 
     http_req_connecting............: avg=70.72µs  min=0s       med=0s       max=12.08ms  p(90)=0s       p(95)=0s       p(99.9)=11.04ms 
     http_req_duration..............: avg=695.03ms min=12.19ms  med=707.54ms max=988.09ms p(90)=786.71ms p(95)=822.37ms p(99.9)=957.01ms
       { expected_response:true }...: avg=695.03ms min=12.19ms  med=707.54ms max=988.09ms p(90)=786.71ms p(95)=822.37ms p(99.9)=957.01ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 4341
     http_req_receiving.............: avg=65.37µs  min=31.85µs  med=54.84µs  max=961.08µs p(90)=100.65µs p(95)=115.58µs p(99.9)=293.37µs
     http_req_sending...............: avg=122.62µs min=6.39µs   med=12.19µs  max=99.98ms  p(90)=20.56µs  p(95)=23.09µs  p(99.9)=33.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=694.84ms min=12.1ms   med=707.43ms max=987.93ms p(90)=786.57ms p(95)=821.96ms p(99.9)=956.93ms
     http_reqs......................: 4341    70.111897/s
     iteration_duration.............: avg=711.5ms  min=397.71ms med=708.59ms max=1.01s    p(90)=788.03ms p(95)=824.32ms p(99.9)=969.89ms
     iterations.....................: 4241    68.496787/s
     success_rate...................: 100.00% ✓ 4241      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

