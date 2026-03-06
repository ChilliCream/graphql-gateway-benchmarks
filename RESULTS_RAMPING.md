## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router                 | 2203  | 137130 total, 0 failed | avg: 102ms, p95: 251ms | ✅                                        |
| grafbase                    | 1959  | 123477 total, 0 failed | avg: 113ms, p95: 279ms | ✅                                        |
| hotchocolate (rust subgraphs) | 1049  | 66968 total, 0 failed  | avg: 209ms, p95: 492ms | ✅                                        |
| hotchocolate (.net subgraphs) |  991  | 62799 total, 0 failed  | avg: 223ms, p95: 515ms | ✅                                        |
| cosmo                       |  789  | 50070 total, 0 failed  | avg: 280ms, p95: 633ms | ✅                                        |
| hive-gateway-router-runtime |  548  | 36194 total, 0 failed  | avg: 389ms, p95: 824ms | ❌ non-compatible response structure (7)  |
| apollo-router               |  431  | 28764 total, 0 failed  | avg: 490ms, p95: 1135ms | ❌ non-compatible response structure (14) |
| hive-gateway                |  256  | 17622 total, 0 failed  | avg: 794ms, p95: 1713ms | ✅                                        |
| apollo-gateway              |  101  |  7534 total, 0 failed  | avg: 1597ms, p95: 3106ms | ✅                                        |


<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 408390      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=275.36µs min=1.17µs med=2.27µs  max=292.63ms p(90)=3.5µs    p(95)=4.24µs   p(99.9)=106.03ms
     http_req_connecting............: avg=272.11µs min=0s     med=0s      max=292.59ms p(90)=0s       p(95)=0s       p(99.9)=105.95ms
     http_req_duration..............: avg=101.62ms min=1.41ms med=90.02ms max=399.49ms p(90)=208.49ms p(95)=251.38ms p(99.9)=353.66ms
       { expected_response:true }...: avg=101.62ms min=1.41ms med=90.02ms max=399.49ms p(90)=208.49ms p(95)=251.38ms p(99.9)=353.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137130
     http_req_receiving.............: avg=402.35µs min=21.4µs med=40.09µs max=120.18ms p(90)=210.39µs p(95)=373.39µs p(99.9)=60.34ms 
     http_req_sending...............: avg=291.01µs min=5.05µs med=9.57µs  max=135.4ms  p(90)=29.18µs  p(95)=123.12µs p(99.9)=54.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.93ms min=1.37ms med=89.32ms max=383.08ms p(90)=206.55ms p(95)=249.78ms p(99.9)=352.43ms
     http_reqs......................: 137130  2203.968164/s
     iteration_duration.............: avg=102.87ms min=1.54ms med=91.32ms max=637.8ms  p(90)=210.28ms p(95)=253.29ms p(99.9)=363.63ms
     iterations.....................: 136130  2187.896056/s
     success_rate...................: 100.00% ✓ 136130      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 367431      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=446.47µs min=1.36µs  med=2.89µs   max=335.82ms p(90)=4.29µs   p(95)=5.12µs   p(99.9)=160.5ms 
     http_req_connecting............: avg=442.59µs min=0s      med=0s       max=335.76ms p(90)=0s       p(95)=0s       p(99.9)=159.64ms
     http_req_duration..............: avg=112.73ms min=2.32ms  med=102.81ms max=415.39ms p(90)=230.17ms p(95)=279.29ms p(99.9)=377.4ms 
       { expected_response:true }...: avg=112.73ms min=2.32ms  med=102.81ms max=415.39ms p(90)=230.17ms p(95)=279.29ms p(99.9)=377.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 123477
     http_req_receiving.............: avg=523.49µs min=25.52µs med=47.36µs  max=125.4ms  p(90)=155.01µs p(95)=429.73µs p(99.9)=72.61ms 
     http_req_sending...............: avg=385.13µs min=5.56µs  med=11.59µs  max=136.58ms p(90)=25.66µs  p(95)=137.3µs  p(99.9)=65.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.82ms min=2.27ms  med=101.9ms  max=413.64ms p(90)=227.93ms p(95)=277.43ms p(99.9)=375.2ms 
     http_reqs......................: 123477  1959.702758/s
     iteration_duration.............: avg=114.37ms min=2.5ms   med=104.18ms max=724.31ms p(90)=232.36ms p(95)=281.93ms p(99.9)=405.52ms
     iterations.....................: 122477  1943.831764/s
     success_rate...................: 100.00% ✓ 122477      ✗ 0     
     vus............................: 61      min=0         max=497 
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

     checks.........................: 100.00% ✓ 197904      ✗ 0    
     data_received..................: 5.9 GB  92 MB/s
     data_sent......................: 78 MB   1.2 MB/s
     http_req_blocked...............: avg=157.17µs min=1.22µs  med=2.82µs   max=189.04ms p(90)=4.24µs   p(95)=7.53µs   p(99.9)=58.23ms 
     http_req_connecting............: avg=152.94µs min=0s      med=0s       max=188.86ms p(90)=0s       p(95)=0s       p(99.9)=58.15ms 
     http_req_duration..............: avg=209.11ms min=3.45ms  med=185.87ms max=865.94ms p(90)=437.48ms p(95)=491.97ms p(99.9)=662.83ms
       { expected_response:true }...: avg=209.11ms min=3.45ms  med=185.87ms max=865.94ms p(90)=437.48ms p(95)=491.97ms p(99.9)=662.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 66968
     http_req_receiving.............: avg=12.98ms  min=53.66µs med=2.72ms   max=284.45ms p(90)=39.18ms  p(95)=52.06ms  p(99.9)=125.97ms
     http_req_sending...............: avg=233.78µs min=5.41µs  med=10.97µs  max=122.5ms  p(90)=30.45µs  p(95)=131.18µs p(99.9)=47.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.89ms min=3.36ms  med=173.27ms max=803.46ms p(90)=412.18ms p(95)=464.1ms  p(99.9)=639.97ms
     http_reqs......................: 66968   1049.641444/s
     iteration_duration.............: avg=212.76ms min=3.57ms  med=190.09ms max=866.13ms p(90)=439.31ms p(95)=493.7ms  p(99.9)=669.04ms
     iterations.....................: 65968   1033.967668/s
     success_rate...................: 100.00% ✓ 65968       ✗ 0    
     vus............................: 52      min=0         max=499
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 185397     ✗ 0    
     data_received..................: 5.5 GB  87 MB/s
     data_sent......................: 73 MB   1.2 MB/s
     http_req_blocked...............: avg=176.26µs min=1.28µs med=2.87µs   max=167.26ms p(90)=4.56µs   p(95)=7.79µs   p(99.9)=66.83ms 
     http_req_connecting............: avg=171µs    min=0s     med=0s       max=167.2ms  p(90)=0s       p(95)=0s       p(99.9)=64.75ms 
     http_req_duration..............: avg=223.04ms min=2.79ms med=202.95ms max=861.45ms p(90)=461.43ms p(95)=514.91ms p(99.9)=708.4ms 
       { expected_response:true }...: avg=223.04ms min=2.79ms med=202.95ms max=861.45ms p(90)=461.43ms p(95)=514.91ms p(99.9)=708.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 62799
     http_req_receiving.............: avg=15.06ms  min=53.9µs med=4.09ms   max=197.85ms p(90)=43.59ms  p(95)=57.74ms  p(99.9)=140.81ms
     http_req_sending...............: avg=252.97µs min=5.58µs med=11.31µs  max=112.71ms p(90)=30.51µs  p(95)=134.72µs p(99.9)=50.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.72ms min=2.7ms  med=186.81ms max=799.66ms p(90)=430.38ms p(95)=486.49ms p(99.9)=694.26ms
     http_reqs......................: 62799   991.880159/s
     iteration_duration.............: avg=227.16ms min=3ms    med=207.75ms max=861.65ms p(90)=463.67ms p(95)=516.73ms p(99.9)=715.54ms
     iterations.....................: 61799   976.085637/s
     success_rate...................: 100.00% ✓ 61799      ✗ 0    
     vus............................: 76      min=0        max=494
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

     checks.........................: 100.00% ✓ 147210     ✗ 0    
     data_received..................: 4.4 GB  69 MB/s
     data_sent......................: 58 MB   920 kB/s
     http_req_blocked...............: avg=63.03µs  min=1.3µs   med=2.65µs   max=121.24ms p(90)=3.83µs   p(95)=4.88µs   p(99.9)=15.28ms 
     http_req_connecting............: avg=59.19µs  min=0s      med=0s       max=121.1ms  p(90)=0s       p(95)=0s       p(99.9)=15.13ms 
     http_req_duration..............: avg=280.46ms min=2.48ms  med=260.3ms  max=1.2s     p(90)=563.81ms p(95)=632.95ms p(99.9)=935.23ms
       { expected_response:true }...: avg=280.46ms min=2.48ms  med=260.3ms  max=1.2s     p(90)=563.81ms p(95)=632.95ms p(99.9)=935.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50070
     http_req_receiving.............: avg=455.52µs min=27.48µs med=63.12µs  max=148.27ms p(90)=153.21µs p(95)=392.81µs p(99.9)=76.4ms  
     http_req_sending...............: avg=101.99µs min=5.59µs  med=10.59µs  max=89.24ms  p(90)=19.85µs  p(95)=116.03µs p(99.9)=18.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=279.9ms  min=2.36ms  med=259.86ms max=1.2s     p(90)=563.15ms p(95)=631.33ms p(99.9)=935.15ms
     http_reqs......................: 50070   789.093681/s
     iteration_duration.............: avg=286.53ms min=2.61ms  med=266.49ms max=1.2s     p(90)=566.53ms p(95)=635.35ms p(99.9)=936.23ms
     iterations.....................: 49070   773.333871/s
     success_rate...................: 100.00% ✓ 49070      ✗ 0    
     vus............................: 82      min=0        max=499
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
      ↳  99% — ✓ 35187 / ✗ 7

     checks.........................: 99.99% ✓ 105575     ✗ 7    
     data_received..................: 3.2 GB 48 MB/s
     data_sent......................: 42 MB  640 kB/s
     http_req_blocked...............: avg=95.97µs  min=1.2µs   med=2.56µs   max=169.81ms p(90)=4.02µs   p(95)=5.46µs   p(99.9)=28.95ms
     http_req_connecting............: avg=91.89µs  min=0s      med=0s       max=169.59ms p(90)=0s       p(95)=0s       p(99.9)=27.98ms
     http_req_duration..............: avg=388.72ms min=5.12ms  med=371.2ms  max=1.53s    p(90)=746.19ms p(95)=823.89ms p(99.9)=1.2s   
       { expected_response:true }...: avg=388.72ms min=5.12ms  med=371.2ms  max=1.53s    p(90)=746.19ms p(95)=823.89ms p(99.9)=1.2s   
     http_req_failed................: 0.00%  ✓ 0          ✗ 36194
     http_req_receiving.............: avg=151µs    min=24.99µs med=43.21µs  max=141.78ms p(90)=82.3µs   p(95)=118.64µs p(99.9)=20.47ms
     http_req_sending...............: avg=162.4µs  min=5.43µs  med=10.58µs  max=126.41ms p(90)=20.92µs  p(95)=61.06µs  p(99.9)=34.22ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=388.4ms  min=5.06ms  med=370.85ms max=1.53s    p(90)=745.77ms p(95)=823.31ms p(99.9)=1.19s  
     http_reqs......................: 36194  548.813207/s
     iteration_duration.............: avg=400.1ms  min=5.43ms  med=383.8ms  max=1.54s    p(90)=750.01ms p(95)=826.58ms p(99.9)=1.2s   
     iterations.....................: 35194  533.650108/s
     success_rate...................: 99.98% ✓ 35187      ✗ 7    
     vus............................: 60     min=0        max=498
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
      ↳  99% — ✓ 27750 / ✗ 14
     ✓ valid response structure

     checks.........................: 99.98% ✓ 83278      ✗ 14   
     data_received..................: 2.5 GB 38 MB/s
     data_sent......................: 34 MB  504 kB/s
     http_req_blocked...............: avg=62.54µs  min=1.64µs  med=2.8µs    max=121.1ms  p(90)=4.6µs   p(95)=6.26µs   p(99.9)=15.53ms
     http_req_connecting............: avg=56.55µs  min=0s      med=0s       max=121.03ms p(90)=0s      p(95)=0s       p(99.9)=14.92ms
     http_req_duration..............: avg=490.19ms min=5.68ms  med=458.5ms  max=1.75s    p(90)=1s      p(95)=1.13s    p(99.9)=1.52s  
       { expected_response:true }...: avg=490.19ms min=5.68ms  med=458.5ms  max=1.75s    p(90)=1s      p(95)=1.13s    p(99.9)=1.52s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 28764
     http_req_receiving.............: avg=96.94µs  min=29.84µs med=51.67µs  max=69.99ms  p(90)=92.17µs p(95)=122.89µs p(99.9)=6.15ms 
     http_req_sending...............: avg=89.97µs  min=6.82µs  med=11.03µs  max=96.37ms  p(90)=20.74µs p(95)=53.25µs  p(99.9)=15.55ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=490ms    min=5.63ms  med=458.4ms  max=1.75s    p(90)=1s      p(95)=1.13s    p(99.9)=1.52s  
     http_reqs......................: 28764  431.975067/s
     iteration_duration.............: avg=508.13ms min=5.94ms  med=479.46ms max=1.75s    p(90)=1.01s   p(95)=1.13s    p(99.9)=1.52s  
     iterations.....................: 27764  416.95716/s
     success_rate...................: 99.94% ✓ 27750      ✗ 14   
     vus............................: 92     min=0        max=500
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

     checks.........................: 100.00% ✓ 49866      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   302 kB/s
     http_req_blocked...............: avg=52.14µs  min=1.29µs  med=2.64µs   max=68.72ms  p(90)=4.43µs  p(95)=6.35µs   p(99.9)=11.72ms
     http_req_connecting............: avg=47.15µs  min=0s      med=0s       max=68.66ms  p(90)=0s      p(95)=0s       p(99.9)=10.73ms
     http_req_duration..............: avg=793.62ms min=6.99ms  med=769.25ms max=6.11s    p(90)=1.59s   p(95)=1.71s    p(99.9)=5.02s  
       { expected_response:true }...: avg=793.62ms min=6.99ms  med=769.25ms max=6.11s    p(90)=1.59s   p(95)=1.71s    p(99.9)=5.02s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17622
     http_req_receiving.............: avg=102.25µs min=25.55µs med=43.72µs  max=122.74ms p(90)=83.53µs p(95)=107.09µs p(99.9)=7.44ms 
     http_req_sending...............: avg=142.83µs min=5.57µs  med=10.71µs  max=112.38ms p(90)=25.18µs p(95)=51.47µs  p(99.9)=25.5ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=793.38ms min=6.94ms  med=768.94ms max=6.11s    p(90)=1.59s   p(95)=1.71s    p(99.9)=5.02s  
     http_reqs......................: 17622   256.818513/s
     iteration_duration.............: avg=841.45ms min=7.31ms  med=806.7ms  max=6.12s    p(90)=1.6s    p(95)=1.73s    p(99.9)=5.09s  
     iterations.....................: 16622   242.244769/s
     success_rate...................: 100.00% ✓ 16622      ✗ 0    
     vus............................: 100     min=0        max=500
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

     checks.........................: 100.00% ✓ 19602      ✗ 0    
     data_received..................: 662 MB  9.0 MB/s
     data_sent......................: 9.2 MB  124 kB/s
     http_req_blocked...............: avg=30.79µs min=1.32µs  med=3.41µs  max=29.5ms  p(90)=5.5µs   p(95)=10.41µs  p(99.9)=3.38ms  
     http_req_connecting............: avg=24.83µs min=0s      med=0s      max=29.43ms p(90)=0s      p(95)=0s       p(99.9)=3.3ms   
     http_req_duration..............: avg=1.59s   min=12.13ms med=1.59s   max=21.63s  p(90)=2.69s   p(95)=3.1s     p(99.9)=20.42s  
       { expected_response:true }...: avg=1.59s   min=12.13ms med=1.59s   max=21.63s  p(90)=2.69s   p(95)=3.1s     p(99.9)=20.42s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7534 
     http_req_receiving.............: avg=68.17µs min=28.39µs med=56.83µs max=5.17ms  p(90)=95.9µs  p(95)=110.79µs p(99.9)=460.02µs
     http_req_sending...............: avg=36.09µs min=5.74µs  med=13.13µs max=16.81ms p(90)=23.28µs p(95)=43.78µs  p(99.9)=5.43ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.59s   min=12.07ms med=1.59s   max=21.63s  p(90)=2.69s   p(95)=3.1s     p(99.9)=20.42s  
     http_reqs......................: 7534    101.996038/s
     iteration_duration.............: avg=1.83s   min=13.24ms med=1.79s   max=21.64s  p(90)=2.77s   p(95)=3.24s    p(99.9)=20.81s  
     iterations.....................: 6534    88.457939/s
     success_rate...................: 100.00% ✓ 6534       ✗ 0    
     vus............................: 74      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

