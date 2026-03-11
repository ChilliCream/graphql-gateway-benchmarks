## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router                 | 2132  | 132531 total, 0 failed | avg: 105ms, p95: 263ms | ✅                                        |
| grafbase                    | 2032  | 127715 total, 0 failed | avg: 109ms, p95: 265ms | ✅                                        |
| hotchocolate (rust subgraphs) |  956  | 61156 total, 0 failed  | avg: 230ms, p95: 742ms | ✅                                        |
| hotchocolate (.net subgraphs) |  921  | 58423 total, 0 failed  | avg: 240ms, p95: 776ms | ✅                                        |
| cosmo                       |  787  | 50033 total, 0 failed  | avg: 281ms, p95: 630ms | ✅                                        |
| hive-gateway-router-runtime |  548  | 36194 total, 0 failed  | avg: 389ms, p95: 841ms | ❌ non-compatible response structure (3)  |
| apollo-router               |  416  | 27782 total, 0 failed  | avg: 507ms, p95: 1179ms | ❌ non-compatible response structure (21) |
| hive-gateway                |  234  | 16504 total, 0 failed  | avg: 843ms, p95: 1793ms | ✅                                        |
| apollo-gateway              |  105  |  7655 total, 0 failed  | avg: 1573ms, p95: 3010ms | ✅                                        |


<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 394593      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=289.91µs min=1.18µs  med=2.5µs   max=270.58ms p(90)=3.8µs    p(95)=4.53µs   p(99.9)=112.49ms
     http_req_connecting............: avg=286.48µs min=0s      med=0s      max=270.44ms p(90)=0s       p(95)=0s       p(99.9)=112.43ms
     http_req_duration..............: avg=105.16ms min=1.56ms  med=92.15ms max=431.09ms p(90)=217.95ms p(95)=262.65ms p(99.9)=367.96ms
       { expected_response:true }...: avg=105.16ms min=1.56ms  med=92.15ms max=431.09ms p(90)=217.95ms p(95)=262.65ms p(99.9)=367.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 132531
     http_req_receiving.............: avg=410.66µs min=22.93µs med=42.3µs  max=126.92ms p(90)=214.23µs p(95)=386.62µs p(99.9)=63.21ms 
     http_req_sending...............: avg=301.16µs min=5.12µs  med=10.03µs max=125.13ms p(90)=30.41µs  p(95)=126.49µs p(99.9)=55.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.45ms min=1.52ms  med=91.48ms max=404.03ms p(90)=216.08ms p(95)=261.26ms p(99.9)=366.33ms
     http_reqs......................: 132531  2132.551149/s
     iteration_duration.............: avg=106.49ms min=1.7ms   med=93.33ms max=658.69ms p(90)=219.86ms p(95)=264.46ms p(99.9)=379.91ms
     iterations.....................: 131531  2116.460188/s
     success_rate...................: 100.00% ✓ 131531      ✗ 0     
     vus............................: 69      min=0         max=495 
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

     checks.........................: 100.00% ✓ 380145      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 149 MB  2.4 MB/s
     http_req_blocked...............: avg=429.02µs min=1.32µs  med=2.86µs   max=315.24ms p(90)=4.06µs   p(95)=4.68µs   p(99.9)=161.14ms
     http_req_connecting............: avg=425.03µs min=0s      med=0s       max=315.19ms p(90)=0s       p(95)=0s       p(99.9)=161.07ms
     http_req_duration..............: avg=109ms    min=2.21ms  med=98.97ms  max=448.5ms  p(90)=222.14ms p(95)=265.09ms p(99.9)=343.22ms
       { expected_response:true }...: avg=109ms    min=2.21ms  med=98.97ms  max=448.5ms  p(90)=222.14ms p(95)=265.09ms p(99.9)=343.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127715
     http_req_receiving.............: avg=504µs    min=23.96µs med=46.78µs  max=121.16ms p(90)=110.27µs p(95)=403.26µs p(99.9)=68.13ms 
     http_req_sending...............: avg=376.94µs min=5.58µs  med=11.33µs  max=285.77ms p(90)=21.71µs  p(95)=128.67µs p(99.9)=61.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.12ms min=2.16ms  med=98.04ms  max=362.69ms p(90)=220.3ms  p(95)=263.22ms p(99.9)=339.38ms
     http_reqs......................: 127715  2032.414481/s
     iteration_duration.............: avg=110.54ms min=2.32ms  med=100.43ms max=722.48ms p(90)=224.15ms p(95)=267.53ms p(99.9)=381.08ms
     iterations.....................: 126715  2016.50081/s
     success_rate...................: 100.00% ✓ 126715      ✗ 0     
     vus............................: 54      min=0         max=499 
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

     checks.........................: 100.00% ✓ 180468     ✗ 0    
     data_received..................: 5.4 GB  84 MB/s
     data_sent......................: 71 MB   1.1 MB/s
     http_req_blocked...............: avg=125.84µs min=1.32µs  med=2.79µs   max=194.92ms p(90)=4.17µs   p(95)=6.86µs   p(99.9)=44.15ms 
     http_req_connecting............: avg=121.75µs min=0s      med=0s       max=194.84ms p(90)=0s       p(95)=0s       p(99.9)=44.09ms 
     http_req_duration..............: avg=229.51ms min=3.45ms  med=141.8ms  max=3.55s    p(90)=556.27ms p(95)=742.21ms p(99.9)=2.02s   
       { expected_response:true }...: avg=229.51ms min=3.45ms  med=141.8ms  max=3.55s    p(90)=556.27ms p(95)=742.21ms p(99.9)=2.02s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 61156
     http_req_receiving.............: avg=11.51ms  min=55.01µs med=97.45µs  max=1.27s    p(90)=4.49ms   p(95)=47.76ms  p(99.9)=956.93ms
     http_req_sending...............: avg=186.6µs  min=5.51µs  med=11.13µs  max=116.89ms p(90)=20.34µs  p(95)=125.26µs p(99.9)=42.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=217.81ms min=3.36ms  med=138.28ms max=3.3s     p(90)=526.98ms p(95)=682.4ms  p(99.9)=1.92s   
     http_reqs......................: 61156   956.448538/s
     iteration_duration.............: avg=233.77ms min=3.68ms  med=146.57ms max=3.56s    p(90)=560.87ms p(95)=747.36ms p(99.9)=2.06s   
     iterations.....................: 60156   940.80905/s
     success_rate...................: 100.00% ✓ 60156      ✗ 0    
     vus............................: 59      min=0        max=498
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

     checks.........................: 100.00% ✓ 172269     ✗ 0    
     data_received..................: 5.1 GB  81 MB/s
     data_sent......................: 68 MB   1.1 MB/s
     http_req_blocked...............: avg=167.76µs min=1.33µs  med=2.9µs    max=251.56ms p(90)=4.47µs   p(95)=8.23µs   p(99.9)=54.98ms 
     http_req_connecting............: avg=161.76µs min=0s      med=0s       max=251.47ms p(90)=0s       p(95)=0s       p(99.9)=53.62ms 
     http_req_duration..............: avg=240.35ms min=2.77ms  med=145.72ms max=2.52s    p(90)=597.27ms p(95)=776.34ms p(99.9)=1.72s   
       { expected_response:true }...: avg=240.35ms min=2.77ms  med=145.72ms max=2.52s    p(90)=597.27ms p(95)=776.34ms p(99.9)=1.72s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 58423
     http_req_receiving.............: avg=13.56ms  min=52.91µs med=99.9µs   max=1.2s     p(90)=7.87ms   p(95)=70.89ms  p(99.9)=917.49ms
     http_req_sending...............: avg=231.19µs min=5.59µs  med=11.36µs  max=125ms    p(90)=23.08µs  p(95)=127.82µs p(99.9)=50.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=226.55ms min=2.68ms  med=141.16ms max=2.49s    p(90)=557.12ms p(95)=712.58ms p(99.9)=1.61s   
     http_reqs......................: 58423   921.952209/s
     iteration_duration.............: avg=245.05ms min=3.08ms  med=151.18ms max=2.52s    p(90)=603.35ms p(95)=781.77ms p(99.9)=1.72s   
     iterations.....................: 57423   906.171572/s
     success_rate...................: 100.00% ✓ 57423      ✗ 0    
     vus............................: 79      min=0        max=493
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

     checks.........................: 100.00% ✓ 147099     ✗ 0    
     data_received..................: 4.4 GB  69 MB/s
     data_sent......................: 58 MB   918 kB/s
     http_req_blocked...............: avg=52.5µs   min=1.44µs  med=2.85µs   max=85.47ms  p(90)=4.13µs   p(95)=5.08µs   p(99.9)=15.5ms  
     http_req_connecting............: avg=47.66µs  min=0s      med=0s       max=85.39ms  p(90)=0s       p(95)=0s       p(99.9)=14.9ms  
     http_req_duration..............: avg=280.51ms min=2.5ms   med=264.27ms max=995.39ms p(90)=561.17ms p(95)=630.32ms p(99.9)=854.27ms
       { expected_response:true }...: avg=280.51ms min=2.5ms   med=264.27ms max=995.39ms p(90)=561.17ms p(95)=630.32ms p(99.9)=854.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50033
     http_req_receiving.............: avg=658.96µs min=29.01µs med=64.89µs  max=164.38ms p(90)=150.32µs p(95)=399.3µs  p(99.9)=112.35ms
     http_req_sending...............: avg=88.22µs  min=5.44µs  med=10.95µs  max=78.01ms  p(90)=19.23µs  p(95)=77.93µs  p(99.9)=15.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=279.77ms min=2.41ms  med=263.5ms  max=995.32ms p(90)=560.64ms p(95)=629.53ms p(99.9)=853.65ms
     http_reqs......................: 50033   787.382333/s
     iteration_duration.............: avg=286.57ms min=2.69ms  med=270.98ms max=995.57ms p(90)=564ms    p(95)=632.68ms p(99.9)=856.35ms
     iterations.....................: 49033   771.645073/s
     success_rate...................: 100.00% ✓ 49033      ✗ 0    
     vus............................: 88      min=0        max=497
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
      ↳  99% — ✓ 35191 / ✗ 3

     checks.........................: 99.99% ✓ 105579     ✗ 3    
     data_received..................: 3.2 GB 48 MB/s
     data_sent......................: 42 MB  640 kB/s
     http_req_blocked...............: avg=91.37µs  min=1.22µs  med=2.76µs   max=174.22ms p(90)=4.07µs   p(95)=5.04µs   p(99.9)=26.69ms
     http_req_connecting............: avg=87.47µs  min=0s      med=0s       max=174.06ms p(90)=0s       p(95)=0s       p(99.9)=26.64ms
     http_req_duration..............: avg=388.76ms min=5.16ms  med=369.42ms max=1.64s    p(90)=747.46ms p(95)=841.06ms p(99.9)=1.31s  
       { expected_response:true }...: avg=388.76ms min=5.16ms  med=369.42ms max=1.64s    p(90)=747.46ms p(95)=841.06ms p(99.9)=1.31s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 36194
     http_req_receiving.............: avg=152.4µs  min=25.98µs med=43.78µs  max=105.96ms p(90)=79.23µs  p(95)=134.06µs p(99.9)=26.78ms
     http_req_sending...............: avg=176.98µs min=5.52µs  med=10.79µs  max=130.35ms p(90)=20.99µs  p(95)=120.73µs p(99.9)=35.89ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=388.43ms min=5.12ms  med=369ms    max=1.64s    p(90)=746.94ms p(95)=840.16ms p(99.9)=1.31s  
     http_reqs......................: 36194  548.564575/s
     iteration_duration.............: avg=400.14ms min=5.69ms  med=382.36ms max=1.65s    p(90)=751.9ms  p(95)=844.8ms  p(99.9)=1.32s  
     iterations.....................: 35194  533.408346/s
     success_rate...................: 99.99% ✓ 35191      ✗ 3    
     vus............................: 63     min=0        max=497
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
      ↳  99% — ✓ 26761 / ✗ 21
     ✓ valid response structure

     checks.........................: 99.97% ✓ 80325      ✗ 21   
     data_received..................: 2.4 GB 37 MB/s
     data_sent......................: 32 MB  487 kB/s
     http_req_blocked...............: avg=76.34µs  min=1.73µs  med=3µs      max=127.74ms p(90)=4.65µs  p(95)=5.92µs   p(99.9)=20.69ms
     http_req_connecting............: avg=71.88µs  min=0s      med=0s       max=127.69ms p(90)=0s      p(95)=0s       p(99.9)=20.58ms
     http_req_duration..............: avg=507.38ms min=5.79ms  med=466.06ms max=1.77s    p(90)=1.04s   p(95)=1.17s    p(99.9)=1.65s  
       { expected_response:true }...: avg=507.38ms min=5.79ms  med=466.06ms max=1.77s    p(90)=1.04s   p(95)=1.17s    p(99.9)=1.65s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 27782
     http_req_receiving.............: avg=121.62µs min=31.72µs med=53.3µs   max=82.13ms  p(90)=96.31µs p(95)=154.92µs p(99.9)=14.74ms
     http_req_sending...............: avg=111.64µs min=6.88µs  med=11.43µs  max=98.78ms  p(90)=21.92µs p(95)=122.06µs p(99.9)=26.7ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=507.14ms min=5.74ms  med=465.95ms max=1.77s    p(90)=1.04s   p(95)=1.17s    p(99.9)=1.65s  
     http_reqs......................: 27782  416.48259/s
     iteration_duration.............: avg=526.64ms min=6.03ms  med=488.31ms max=1.78s    p(90)=1.05s   p(95)=1.18s    p(99.9)=1.65s  
     iterations.....................: 26782  401.491495/s
     success_rate...................: 99.92% ✓ 26761      ✗ 21   
     vus............................: 96     min=0        max=500
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

     checks.........................: 100.00% ✓ 46512      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=67.95µs  min=1.32µs  med=2.9µs    max=75.24ms p(90)=5.22µs  p(95)=7.44µs   p(99.9)=18.64ms
     http_req_connecting............: avg=61.31µs  min=0s      med=0s       max=75.2ms  p(90)=0s      p(95)=0s       p(99.9)=18.02ms
     http_req_duration..............: avg=843.38ms min=7.89ms  med=826.04ms max=7.39s   p(90)=1.61s   p(95)=1.79s    p(99.9)=6.11s  
       { expected_response:true }...: avg=843.38ms min=7.89ms  med=826.04ms max=7.39s   p(90)=1.61s   p(95)=1.79s    p(99.9)=6.11s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16504
     http_req_receiving.............: avg=117.51µs min=26.91µs med=46.17µs  max=43.13ms p(90)=96.97µs p(95)=124.92µs p(99.9)=17.76ms
     http_req_sending...............: avg=116.83µs min=5.98µs  med=11.38µs  max=50.7ms  p(90)=29.65µs p(95)=58.65µs  p(99.9)=21.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=843.15ms min=7.79ms  med=825.95ms max=7.38s   p(90)=1.61s   p(95)=1.79s    p(99.9)=6.11s  
     http_reqs......................: 16504   234.883303/s
     iteration_duration.............: avg=897.75ms min=8.11ms  med=862.08ms max=7.4s    p(90)=1.63s   p(95)=1.8s     p(99.9)=6.21s  
     iterations.....................: 15504   220.651402/s
     success_rate...................: 100.00% ✓ 15504      ✗ 0    
     vus............................: 82      min=0        max=500
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

     checks.........................: 100.00% ✓ 19965      ✗ 0    
     data_received..................: 672 MB  9.2 MB/s
     data_sent......................: 9.3 MB  128 kB/s
     http_req_blocked...............: avg=23.28µs min=1.35µs  med=3.09µs  max=21.48ms p(90)=4.97µs  p(95)=10.05µs  p(99.9)=843.3µs 
     http_req_connecting............: avg=17.9µs  min=0s      med=0s      max=21.43ms p(90)=0s      p(95)=0s       p(99.9)=797.29µs
     http_req_duration..............: avg=1.57s   min=11.68ms med=1.51s   max=21.54s  p(90)=2.67s   p(95)=3s       p(99.9)=20.19s  
       { expected_response:true }...: avg=1.57s   min=11.68ms med=1.51s   max=21.54s  p(90)=2.67s   p(95)=3s       p(99.9)=20.19s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7655 
     http_req_receiving.............: avg=64.32µs min=28.22µs med=51.84µs max=13.95ms p(90)=87.18µs p(95)=101.35µs p(99.9)=734.09µs
     http_req_sending...............: avg=31.67µs min=5.55µs  med=12.05µs max=12.64ms p(90)=20.49µs p(95)=39.73µs  p(99.9)=5.3ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.57s   min=11.62ms med=1.51s   max=21.54s  p(90)=2.67s   p(95)=3s       p(99.9)=20.19s  
     http_reqs......................: 7655    105.055107/s
     iteration_duration.............: avg=1.8s    min=12.45ms med=1.75s   max=21.55s  p(90)=2.72s   p(95)=3.05s    p(99.9)=20.41s  
     iterations.....................: 6655    91.331383/s
     success_rate...................: 100.00% ✓ 6655       ✗ 0    
     vus............................: 82      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

