## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 10 times (120s each) and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **120s**.


### Comparison

| Gateway                                        | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :--------------------------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router (v0.0.41)                          | 1713  | 206113 total, 0 failed |  avg: 29ms, p95: 44ms  | ✅                                        |
| grafbase (0.53.2)                              | 1101  | 132539 total, 0 failed |  avg: 45ms, p95: 61ms  | ✅                                        |
| hotchocolate (rust subgraphs)                  |  770  | 92856 total, 0 failed  | avg: 64ms, p95: 173ms  | ✅                                        |
| hotchocolate (.net subgraphs)                  |  759  | 91516 total, 0 failed  | avg: 65ms, p95: 182ms  | ✅                                        |
| cosmo (0.291.0)                                |  494  | 59557 total, 0 failed  | avg: 101ms, p95: 136ms | ✅                                        |
| hive-gateway-router-runtime (2.5.6)            |  228  | 27632 total, 0 failed  | avg: 217ms, p95: 275ms | ✅                                        |
| apollo-router (v2.12.0)                        |  213  | 25831 total, 0 failed  | avg: 232ms, p95: 282ms | ✅                                        |
| hive-gateway (2.5.6)                           |  123  | 15004 total, 0 failed  | avg: 400ms, p95: 542ms | ✅                                        |
| apollo-gateway (2.13.2)                        |   70  |  8578 total, 0 failed  | avg: 702ms, p95: 822ms | ✅                                        |


<details>
  <summary>Summary for: hive-router (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 618039      ✗ 0     
     data_received..................: 18 GB   150 MB/s
     data_sent......................: 248 MB  2.1 MB/s
     http_req_blocked...............: avg=4.8µs   min=1.2µs   med=1.8µs   max=17.89ms  p(90)=2.79µs  p(95)=3.32µs   p(99.9)=32.32µs
     http_req_connecting............: avg=2.59µs  min=0s      med=0s      max=17.84ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=28.96ms min=2.08ms  med=27.83ms max=405.41ms p(90)=39.38ms p(95)=44.1ms   p(99.9)=71.51ms
       { expected_response:true }...: avg=28.96ms min=2.08ms  med=27.83ms max=405.41ms p(90)=39.38ms p(95)=44.1ms   p(99.9)=71.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 206113
     http_req_receiving.............: avg=69.53µs min=20.65µs med=34.83µs max=87.18ms  p(90)=72.37µs p(95)=217.26µs p(99.9)=2.06ms 
     http_req_sending...............: avg=41.83µs min=5.13µs  med=7.61µs  max=227.33ms p(90)=20.38µs p(95)=96.64µs  p(99.9)=3.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=28.85ms min=2.05ms  med=27.73ms max=390.08ms p(90)=39.25ms p(95)=43.93ms  p(99.9)=70.78ms
     http_reqs......................: 206113  1713.89185/s
     iteration_duration.............: avg=29.11ms min=2.9ms   med=27.97ms max=431.45ms p(90)=39.51ms p(95)=44.23ms  p(99.9)=71.76ms
     iterations.....................: 206013  1713.060319/s
     success_rate...................: 100.00% ✓ 206013      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 397317      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 159 MB  1.3 MB/s
     http_req_blocked...............: avg=5.57µs  min=862ns   med=1.65µs  max=18.33ms  p(90)=2.62µs  p(95)=3.06µs   p(99.9)=38.53µs
     http_req_connecting............: avg=3.51µs  min=0s      med=0s      max=18.11ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=45.12ms min=2.43ms  med=44.41ms max=420.02ms p(90)=55.73ms p(95)=60.63ms  p(99.9)=89.98ms
       { expected_response:true }...: avg=45.12ms min=2.43ms  med=44.41ms max=420.02ms p(90)=55.73ms p(95)=60.63ms  p(99.9)=89.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132539
     http_req_receiving.............: avg=59.71µs min=22.04µs med=37.95µs max=148.27ms p(90)=66.5µs  p(95)=108.87µs p(99.9)=1.7ms  
     http_req_sending...............: avg=33.08µs min=4.07µs  med=7.02µs  max=190.45ms p(90)=12.11µs p(95)=71.55µs  p(99.9)=2.05ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45.03ms min=2.36ms  med=44.34ms max=404.85ms p(90)=55.63ms p(95)=60.51ms  p(99.9)=88.95ms
     http_reqs......................: 132539  1101.490625/s
     iteration_duration.............: avg=45.3ms  min=9.39ms  med=44.56ms max=430.04ms p(90)=55.87ms p(95)=60.77ms  p(99.9)=90.55ms
     iterations.....................: 132439  1100.659556/s
     success_rate...................: 100.00% ✓ 132439      ✗ 0     
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

     checks.........................: 100.00% ✓ 278268     ✗ 0    
     data_received..................: 8.1 GB  68 MB/s
     data_sent......................: 112 MB  926 kB/s
     http_req_blocked...............: avg=4.98µs  min=1.11µs  med=1.83µs  max=10.21ms  p(90)=2.83µs   p(95)=3.31µs   p(99.9)=39.39µs 
     http_req_connecting............: avg=2.79µs  min=0s      med=0s      max=10.18ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=64.47ms min=3.73ms  med=46.28ms max=580.73ms p(90)=136.79ms p(95)=172.55ms p(99.9)=367.72ms
       { expected_response:true }...: avg=64.47ms min=3.73ms  med=46.28ms max=580.73ms p(90)=136.79ms p(95)=172.55ms p(99.9)=367.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 92856
     http_req_receiving.............: avg=1.97ms  min=49.44µs med=92.44µs max=271.62ms p(90)=3ms      p(95)=9.72ms   p(99.9)=112.63ms
     http_req_sending...............: avg=27.01µs min=4.98µs  med=7.85µs  max=104.93ms p(90)=12.44µs  p(95)=28.73µs  p(99.9)=1.91ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=62.46ms min=3.66ms  med=44.53ms max=580.67ms p(90)=132.83ms p(95)=168.3ms  p(99.9)=365.64ms
     http_reqs......................: 92856   770.790645/s
     iteration_duration.............: avg=64.69ms min=3.95ms  med=46.47ms max=580.83ms p(90)=136.98ms p(95)=172.85ms p(99.9)=371.94ms
     iterations.....................: 92756   769.960552/s
     success_rate...................: 100.00% ✓ 92756      ✗ 0    
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

     checks.........................: 100.00% ✓ 274248     ✗ 0    
     data_received..................: 8.0 GB  67 MB/s
     data_sent......................: 110 MB  913 kB/s
     http_req_blocked...............: avg=7.16µs  min=1.19µs  med=1.8µs   max=18.43ms  p(90)=2.9µs    p(95)=3.43µs   p(99.9)=52.28µs 
     http_req_connecting............: avg=4.87µs  min=0s      med=0s      max=18.39ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=65.42ms min=3.03ms  med=45.36ms max=756.04ms p(90)=142.5ms  p(95)=181.65ms p(99.9)=438.26ms
       { expected_response:true }...: avg=65.42ms min=3.03ms  med=45.36ms max=756.04ms p(90)=142.5ms  p(95)=181.65ms p(99.9)=438.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 91516
     http_req_receiving.............: avg=1.72ms  min=49.79µs med=91.33µs max=395.5ms  p(90)=2.32ms   p(95)=5.99ms   p(99.9)=125.32ms
     http_req_sending...............: avg=41.26µs min=5.31µs  med=8.03µs  max=370.01ms p(90)=14.04µs  p(95)=28.35µs  p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=63.66ms min=2.96ms  med=43.84ms max=744.57ms p(90)=138.84ms p(95)=178.09ms p(99.9)=429.53ms
     http_reqs......................: 91516   759.925663/s
     iteration_duration.............: avg=65.65ms min=3.28ms  med=45.57ms max=756.26ms p(90)=142.76ms p(95)=181.84ms p(99.9)=443.56ms
     iterations.....................: 91416   759.095288/s
     success_rate...................: 100.00% ✓ 91416      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 178371     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 72 MB   594 kB/s
     http_req_blocked...............: avg=10.96µs  min=1.21µs  med=1.85µs  max=17.64ms  p(90)=2.92µs   p(95)=3.45µs   p(99.9)=101.56µs
     http_req_connecting............: avg=8.7µs    min=0s      med=0s      max=17.63ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=100.59ms min=2.88ms  med=99.42ms max=447.8ms  p(90)=127.15ms p(95)=135.94ms p(99.9)=202.53ms
       { expected_response:true }...: avg=100.59ms min=2.88ms  med=99.42ms max=447.8ms  p(90)=127.15ms p(95)=135.94ms p(99.9)=202.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59557
     http_req_receiving.............: avg=59.13µs  min=24.43µs med=48.91µs max=24.42ms  p(90)=77.28µs  p(95)=90.8µs   p(99.9)=692.31µs
     http_req_sending...............: avg=29.92µs  min=5.47µs  med=8.22µs  max=202.53ms p(90)=12.77µs  p(95)=18.24µs  p(99.9)=2.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.5ms  min=2.81ms  med=99.34ms max=443.23ms p(90)=127.06ms p(95)=135.84ms p(99.9)=193.41ms
     http_reqs......................: 59557   494.630575/s
     iteration_duration.............: avg=100.92ms min=11.38ms med=99.6ms  max=465.32ms p(90)=127.34ms p(95)=136.1ms  p(99.9)=215.42ms
     iterations.....................: 59457   493.800058/s
     success_rate...................: 100.00% ✓ 59457      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 82596      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   275 kB/s
     http_req_blocked...............: avg=11.37µs  min=1.31µs  med=1.84µs   max=10.16ms  p(90)=2.59µs   p(95)=2.94µs   p(99.9)=4.49ms  
     http_req_connecting............: avg=9.24µs   min=0s      med=0s       max=10.12ms  p(90)=0s       p(95)=0s       p(99.9)=4.45ms  
     http_req_duration..............: avg=217.11ms min=5.17ms  med=213.22ms max=524.11ms p(90)=258.27ms p(95)=275.48ms p(99.9)=356.25ms
       { expected_response:true }...: avg=217.11ms min=5.17ms  med=213.22ms max=524.11ms p(90)=258.27ms p(95)=275.48ms p(99.9)=356.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27632
     http_req_receiving.............: avg=49.04µs  min=27.15µs med=38.05µs  max=90.35ms  p(90)=62.33µs  p(95)=70.76µs  p(99.9)=546.76µs
     http_req_sending...............: avg=31.03µs  min=5.71µs  med=7.88µs   max=240.23ms p(90)=10.52µs  p(95)=12.21µs  p(99.9)=754.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=217.03ms min=5.13ms  med=213.17ms max=523.31ms p(90)=258.22ms p(95)=275.42ms p(99.9)=354.4ms 
     http_reqs......................: 27632   228.853077/s
     iteration_duration.............: avg=218.06ms min=26.64ms med=213.51ms max=539.26ms p(90)=258.48ms p(95)=275.84ms p(99.9)=358.92ms
     iterations.....................: 27532   228.024859/s
     success_rate...................: 100.00% ✓ 27532      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 77193      ✗ 0    
     data_received..................: 2.3 GB  19 MB/s
     data_sent......................: 31 MB   257 kB/s
     http_req_blocked...............: avg=26.33µs  min=1.34µs  med=2.25µs   max=20.36ms  p(90)=3.37µs   p(95)=3.82µs   p(99.9)=12.44ms 
     http_req_connecting............: avg=23.39µs  min=0s      med=0s       max=20.15ms  p(90)=0s       p(95)=0s       p(99.9)=11.86ms 
     http_req_duration..............: avg=232.23ms min=6.65ms  med=233.32ms max=529.73ms p(90)=271.49ms p(95)=282.35ms p(99.9)=378.21ms
       { expected_response:true }...: avg=232.23ms min=6.65ms  med=233.32ms max=529.73ms p(90)=271.49ms p(95)=282.35ms p(99.9)=378.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 25831
     http_req_receiving.............: avg=54.18µs  min=26.9µs  med=46.59µs  max=4.07ms   p(90)=77.69µs  p(95)=89.97µs  p(99.9)=462.68µs
     http_req_sending...............: avg=54.95µs  min=6.25µs  med=9.93µs   max=255.71ms p(90)=14.81µs  p(95)=17.38µs  p(99.9)=879.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=232.13ms min=6.6ms   med=233.24ms max=529.3ms  p(90)=271.42ms p(95)=282.22ms p(99.9)=377.6ms 
     http_reqs......................: 25831   213.72235/s
     iteration_duration.............: avg=233.31ms min=41.13ms med=233.6ms  max=587.77ms p(90)=271.71ms p(95)=282.6ms  p(99.9)=392.02ms
     iterations.....................: 25731   212.894963/s
     success_rate...................: 100.00% ✓ 25731      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 44712      ✗ 0    
     data_received..................: 1.3 GB  11 MB/s
     data_sent......................: 18 MB   149 kB/s
     http_req_blocked...............: avg=20.4µs   min=1.34µs   med=2.16µs   max=9.45ms   p(90)=3.15µs   p(95)=3.54µs   p(99.9)=7.34ms  
     http_req_connecting............: avg=17.86µs  min=0s       med=0s       max=9.41ms   p(90)=0s       p(95)=0s       p(99.9)=7.32ms  
     http_req_duration..............: avg=400.35ms min=7ms      med=395.04ms max=744.28ms p(90)=508.84ms p(95)=542.47ms p(99.9)=693.56ms
       { expected_response:true }...: avg=400.35ms min=7ms      med=395.04ms max=744.28ms p(90)=508.84ms p(95)=542.47ms p(99.9)=693.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 15004
     http_req_receiving.............: avg=56.73µs  min=26.57µs  med=45.15µs  max=13.03ms  p(90)=74.33µs  p(95)=85.03µs  p(99.9)=1.08ms  
     http_req_sending...............: avg=45.69µs  min=6.06µs   med=9.24µs   max=145.53ms p(90)=13.81µs  p(95)=15.87µs  p(99.9)=1.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=400.25ms min=6.93ms   med=394.96ms max=744.23ms p(90)=508.74ms p(95)=542.4ms  p(99.9)=693.52ms
     http_reqs......................: 15004   123.832009/s
     iteration_duration.............: avg=403.18ms min=121.72ms med=395.93ms max=744.44ms p(90)=509.54ms p(95)=542.92ms p(99.9)=694.01ms
     iterations.....................: 14904   123.006683/s
     success_rate...................: 100.00% ✓ 14904      ✗ 0    
     vus............................: 26      min=26       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 25434     ✗ 0   
     data_received..................: 753 MB  6.2 MB/s
     data_sent......................: 10 MB   84 kB/s
     http_req_blocked...............: avg=32.25µs  min=1.47µs  med=2.08µs   max=10.16ms  p(90)=3.24µs   p(95)=3.64µs   p(99.9)=8.31ms  
     http_req_connecting............: avg=29.78µs  min=0s      med=0s       max=10.12ms  p(90)=0s       p(95)=0s       p(99.9)=8.29ms  
     http_req_duration..............: avg=702.11ms min=11.84ms med=706.73ms max=977.2ms  p(90)=781.7ms  p(95)=822.07ms p(99.9)=951.96ms
       { expected_response:true }...: avg=702.11ms min=11.84ms med=706.73ms max=977.2ms  p(90)=781.7ms  p(95)=822.07ms p(99.9)=951.96ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 8578
     http_req_receiving.............: avg=55.42µs  min=29.65µs med=40.38µs  max=43.94ms  p(90)=71.86µs  p(95)=83.94µs  p(99.9)=240.07µs
     http_req_sending...............: avg=67.37µs  min=6.4µs   med=8.7µs    max=144.89ms p(90)=14.29µs  p(95)=16.25µs  p(99.9)=3.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=701.98ms min=11.81ms med=706.67ms max=977.14ms p(90)=781.61ms p(95)=821.97ms p(99.9)=951.89ms
     http_reqs......................: 8578    70.353849/s
     iteration_duration.............: avg=710.5ms  min=405.3ms med=707.45ms max=977.38ms p(90)=782.83ms p(95)=822.92ms p(99.9)=952.22ms
     iterations.....................: 8478    69.533683/s
     success_rate...................: 100.00% ✓ 8478      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

