## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router                 | 2118  | 131615 total, 0 failed | avg: 106ms, p95: 258ms | ✅                                        |
| grafbase                    | 1959  | 123302 total, 0 failed | avg: 113ms, p95: 278ms | ✅                                        |
| hotchocolate (rust subgraphs) |  971  | 62236 total, 0 failed  | avg: 225ms, p95: 539ms | ✅                                        |
| hotchocolate (.net subgraphs) |  921  | 58618 total, 0 failed  | avg: 239ms, p95: 575ms | ✅                                        |
| cosmo                       |  787  | 49908 total, 0 failed  | avg: 281ms, p95: 630ms | ✅                                        |
| hive-gateway-router-runtime |  544  | 36016 total, 0 failed  | avg: 391ms, p95: 842ms | ❌ non-compatible response structure (5)  |
| apollo-router               |  433  | 28835 total, 0 failed  | avg: 489ms, p95: 1155ms | ❌ non-compatible response structure (17) |
| hive-gateway                |  250  | 17151 total, 0 failed  | avg: 814ms, p95: 1725ms | ✅                                        |
| apollo-gateway              |  105  |  7734 total, 0 failed  | avg: 1557ms, p95: 3014ms | ✅                                        |


<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 391845      ✗ 0     
     data_received..................: 12 GB   186 MB/s
     data_sent......................: 153 MB  2.5 MB/s
     http_req_blocked...............: avg=335.72µs min=1.16µs  med=2.37µs  max=313.89ms p(90)=3.59µs   p(95)=4.27µs   p(99.9)=130.75ms
     http_req_connecting............: avg=331.56µs min=0s      med=0s      max=295.96ms p(90)=0s       p(95)=0s       p(99.9)=130.66ms
     http_req_duration..............: avg=105.81ms min=1.48ms  med=95.06ms max=389.08ms p(90)=216.87ms p(95)=258.31ms p(99.9)=347.05ms
       { expected_response:true }...: avg=105.81ms min=1.48ms  med=95.06ms max=389.08ms p(90)=216.87ms p(95)=258.31ms p(99.9)=347.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131615
     http_req_receiving.............: avg=446.43µs min=22.12µs med=40.47µs max=149.19ms p(90)=166.26µs p(95)=363.59µs p(99.9)=65.23ms 
     http_req_sending...............: avg=334.05µs min=4.96µs  med=9.67µs  max=136.63ms p(90)=24.09µs  p(95)=118.5µs  p(99.9)=60.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.03ms min=1.43ms  med=94.35ms max=376.63ms p(90)=215.16ms p(95)=256.67ms p(99.9)=344.03ms
     http_reqs......................: 131615  2118.333808/s
     iteration_duration.............: avg=107.22ms min=1.7ms   med=96.3ms  max=635.52ms p(90)=218.72ms p(95)=260.17ms p(99.9)=362.07ms
     iterations.....................: 130615  2102.238881/s
     success_rate...................: 100.00% ✓ 130615      ✗ 0     
     vus............................: 66      min=0         max=496 
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

     checks.........................: 100.00% ✓ 366906      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=468.13µs min=1.38µs  med=2.96µs   max=353.6ms  p(90)=4.21µs   p(95)=4.97µs   p(99.9)=162.69ms
     http_req_connecting............: avg=462.98µs min=0s      med=0s       max=353.52ms p(90)=0s       p(95)=0s       p(99.9)=162.13ms
     http_req_duration..............: avg=112.91ms min=2.13ms  med=102.61ms max=421.39ms p(90)=233.12ms p(95)=277.87ms p(99.9)=357.73ms
       { expected_response:true }...: avg=112.91ms min=2.13ms  med=102.61ms max=421.39ms p(90)=233.12ms p(95)=277.87ms p(99.9)=357.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 123302
     http_req_receiving.............: avg=532.28µs min=25.35µs med=49.52µs  max=147.19ms p(90)=158.76µs p(95)=429.9µs  p(99.9)=72.05ms 
     http_req_sending...............: avg=421.36µs min=5.65µs  med=11.74µs  max=133.15ms p(90)=29.64µs  p(95)=137.83µs p(99.9)=73.43ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.95ms min=2.08ms  med=101.48ms max=386.79ms p(90)=231.2ms  p(95)=275.97ms p(99.9)=353.82ms
     http_reqs......................: 123302  1959.757982/s
     iteration_duration.............: avg=114.55ms min=2.25ms  med=104.04ms max=718.82ms p(90)=235.36ms p(95)=280.36ms p(99.9)=396.17ms
     iterations.....................: 122302  1943.864014/s
     success_rate...................: 100.00% ✓ 122302      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 183708     ✗ 0    
     data_received..................: 5.5 GB  85 MB/s
     data_sent......................: 73 MB   1.1 MB/s
     http_req_blocked...............: avg=177.93µs min=1.2µs   med=2.92µs   max=219.85ms p(90)=4.6µs    p(95)=7.91µs   p(99.9)=63.33ms 
     http_req_connecting............: avg=171.77µs min=0s      med=0s       max=212.75ms p(90)=0s       p(95)=0s       p(99.9)=63.22ms 
     http_req_duration..............: avg=225.11ms min=3.61ms  med=196.63ms max=852.31ms p(90)=476.41ms p(95)=538.7ms  p(99.9)=722.27ms
       { expected_response:true }...: avg=225.11ms min=3.61ms  med=196.63ms max=852.31ms p(90)=476.41ms p(95)=538.7ms  p(99.9)=722.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62236
     http_req_receiving.............: avg=14.45ms  min=54.87µs med=3.4ms    max=308.21ms p(90)=42.96ms  p(95)=58.34ms  p(99.9)=155.63ms
     http_req_sending...............: avg=263.93µs min=5.77µs  med=11.31µs  max=132.16ms p(90)=30.63µs  p(95)=132.96µs p(99.9)=53.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.4ms  min=3.52ms  med=182.44ms max=800.09ms p(90)=445.08ms p(95)=507.71ms p(99.9)=693.53ms
     http_reqs......................: 62236   971.087272/s
     iteration_duration.............: avg=229.3ms  min=3.79ms  med=201.8ms  max=859.63ms p(90)=478.93ms p(95)=541.19ms p(99.9)=729.77ms
     iterations.....................: 61236   955.483967/s
     success_rate...................: 100.00% ✓ 61236      ✗ 0    
     vus............................: 68      min=0        max=497
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

     checks.........................: 100.00% ✓ 172854     ✗ 0    
     data_received..................: 5.1 GB  81 MB/s
     data_sent......................: 68 MB   1.1 MB/s
     http_req_blocked...............: avg=160.26µs min=1.29µs  med=2.84µs   max=209.99ms p(90)=4.77µs   p(95)=8.12µs   p(99.9)=56.29ms 
     http_req_connecting............: avg=155.58µs min=0s      med=0s       max=209.85ms p(90)=0s       p(95)=0s       p(99.9)=56.13ms 
     http_req_duration..............: avg=239.13ms min=3.02ms  med=206.52ms max=1.03s    p(90)=507.49ms p(95)=574.74ms p(99.9)=824.99ms
       { expected_response:true }...: avg=239.13ms min=3.02ms  med=206.52ms max=1.03s    p(90)=507.49ms p(95)=574.74ms p(99.9)=824.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58618
     http_req_receiving.............: avg=16.87ms  min=55.63µs med=6.27ms   max=245.62ms p(90)=47.62ms  p(95)=62.75ms  p(99.9)=153.82ms
     http_req_sending...............: avg=271.04µs min=5.97µs  med=11.32µs  max=130.19ms p(90)=32.21µs  p(95)=138.93µs p(99.9)=54.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=221.98ms min=2.93ms  med=190.44ms max=1.03s    p(90)=474.02ms p(95)=536.1ms  p(99.9)=785.52ms
     http_reqs......................: 58618   921.513792/s
     iteration_duration.............: avg=243.79ms min=3.34ms  med=211.86ms max=1.03s    p(90)=510.15ms p(95)=576.87ms p(99.9)=827.6ms 
     iterations.....................: 57618   905.793129/s
     success_rate...................: 100.00% ✓ 57618      ✗ 0    
     vus............................: 90      min=0        max=497
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

     checks.........................: 100.00% ✓ 146724     ✗ 0    
     data_received..................: 4.4 GB  69 MB/s
     data_sent......................: 58 MB   918 kB/s
     http_req_blocked...............: avg=60.02µs  min=1.29µs  med=2.68µs   max=83.97ms  p(90)=3.89µs   p(95)=4.9µs    p(99.9)=15.17ms 
     http_req_connecting............: avg=55.86µs  min=0s      med=0s       max=83.89ms  p(90)=0s       p(95)=0s       p(99.9)=14.98ms 
     http_req_duration..............: avg=281.3ms  min=2.6ms   med=268.73ms max=1.06s    p(90)=561.05ms p(95)=629.86ms p(99.9)=885.05ms
       { expected_response:true }...: avg=281.3ms  min=2.6ms   med=268.73ms max=1.06s    p(90)=561.05ms p(95)=629.86ms p(99.9)=885.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49908
     http_req_receiving.............: avg=404.63µs min=28.83µs med=61.99µs  max=110.26ms p(90)=148.09µs p(95)=397.05µs p(99.9)=59.55ms 
     http_req_sending...............: avg=98.95µs  min=5.79µs  med=10.81µs  max=90.33ms  p(90)=20.06µs  p(95)=116.8µs  p(99.9)=21.22ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=280.79ms min=2.48ms  med=268.17ms max=1.06s    p(90)=560.39ms p(95)=629.26ms p(99.9)=884.96ms
     http_reqs......................: 49908   787.223717/s
     iteration_duration.............: avg=287.4ms  min=2.76ms  med=275.4ms  max=1.06s    p(90)=563.54ms p(95)=631.75ms p(99.9)=888.2ms 
     iterations.....................: 48908   771.450219/s
     success_rate...................: 100.00% ✓ 48908      ✗ 0    
     vus............................: 81      min=0        max=496
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
      ↳  99% — ✓ 35011 / ✗ 5

     checks.........................: 99.99% ✓ 105043     ✗ 5    
     data_received..................: 3.2 GB 48 MB/s
     data_sent......................: 42 MB  636 kB/s
     http_req_blocked...............: avg=82.55µs  min=1.26µs  med=2.62µs   max=140.51ms p(90)=4µs      p(95)=5.28µs   p(99.9)=24.2ms 
     http_req_connecting............: avg=78.38µs  min=0s      med=0s       max=140.43ms p(90)=0s       p(95)=0s       p(99.9)=24.14ms
     http_req_duration..............: avg=390.62ms min=5.22ms  med=364.08ms max=1.51s    p(90)=748.94ms p(95)=841.97ms p(99.9)=1.27s  
       { expected_response:true }...: avg=390.62ms min=5.22ms  med=364.08ms max=1.51s    p(90)=748.94ms p(95)=841.97ms p(99.9)=1.27s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 36016
     http_req_receiving.............: avg=144.4µs  min=24.89µs med=42.71µs  max=94.22ms  p(90)=80.2µs   p(95)=111.43µs p(99.9)=24.83ms
     http_req_sending...............: avg=162.88µs min=5.32µs  med=10.33µs  max=112.25ms p(90)=19.73µs  p(95)=52.61µs  p(99.9)=32.66ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=390.31ms min=5.18ms  med=363.75ms max=1.48s    p(90)=748.29ms p(95)=840.53ms p(99.9)=1.27s  
     http_reqs......................: 36016  544.956747/s
     iteration_duration.............: avg=402.11ms min=5.7ms   med=373.94ms max=1.65s    p(90)=753.14ms p(95)=846.03ms p(99.9)=1.28s  
     iterations.....................: 35016  529.825784/s
     success_rate...................: 99.98% ✓ 35011      ✗ 5    
     vus............................: 67     min=0        max=496
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
      ↳  99% — ✓ 27818 / ✗ 17
     ✓ valid response structure

     checks.........................: 99.97% ✓ 83488      ✗ 17   
     data_received..................: 2.5 GB 38 MB/s
     data_sent......................: 34 MB  506 kB/s
     http_req_blocked...............: avg=42.47µs  min=1.79µs  med=2.87µs   max=91.53ms p(90)=4.57µs  p(95)=6.03µs   p(99.9)=11.01ms
     http_req_connecting............: avg=38.2µs   min=0s      med=0s       max=91.48ms p(90)=0s      p(95)=0s       p(99.9)=10.9ms 
     http_req_duration..............: avg=489.01ms min=5.65ms  med=447.68ms max=1.69s   p(90)=1.02s   p(95)=1.15s    p(99.9)=1.57s  
       { expected_response:true }...: avg=489.01ms min=5.65ms  med=447.68ms max=1.69s   p(90)=1.02s   p(95)=1.15s    p(99.9)=1.57s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 28835
     http_req_receiving.............: avg=83.67µs  min=30.27µs med=51.19µs  max=28.77ms p(90)=88.98µs p(95)=116.26µs p(99.9)=3.16ms 
     http_req_sending...............: avg=72.49µs  min=6.74µs  med=11.33µs  max=73.69ms p(90)=20.66µs p(95)=50.33µs  p(99.9)=11.52ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=488.85ms min=5.6ms   med=447.56ms max=1.69s   p(90)=1.02s   p(95)=1.15s    p(99.9)=1.57s  
     http_reqs......................: 28835  433.386993/s
     iteration_duration.............: avg=506.82ms min=6.06ms  med=469.73ms max=1.69s   p(90)=1.03s   p(95)=1.16s    p(99.9)=1.57s  
     iterations.....................: 27835  418.357099/s
     success_rate...................: 99.93% ✓ 27818      ✗ 17   
     vus............................: 89     min=0        max=500
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

     checks.........................: 100.00% ✓ 48453      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=58.55µs  min=1.29µs  med=2.92µs   max=86.38ms p(90)=4.86µs  p(95)=6.99µs   p(99.9)=16.27ms
     http_req_connecting............: avg=53.72µs  min=0s      med=0s       max=86.32ms p(90)=0s      p(95)=0s       p(99.9)=16.2ms 
     http_req_duration..............: avg=814.17ms min=6.94ms  med=770.7ms  max=6.44s   p(90)=1.6s    p(95)=1.72s    p(99.9)=5.83s  
       { expected_response:true }...: avg=814.17ms min=6.94ms  med=770.7ms  max=6.44s   p(90)=1.6s    p(95)=1.72s    p(99.9)=5.83s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17151
     http_req_receiving.............: avg=101.47µs min=26.18µs med=44.79µs  max=56.52ms p(90)=84.21µs p(95)=108.55µs p(99.9)=8.94ms 
     http_req_sending...............: avg=113.82µs min=5.69µs  med=11.1µs   max=55.19ms p(90)=25.48µs p(95)=55.21µs  p(99.9)=20.19ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=813.95ms min=6.89ms  med=770.25ms max=6.44s   p(90)=1.6s    p(95)=1.72s    p(99.9)=5.83s  
     http_reqs......................: 17151   250.179281/s
     iteration_duration.............: avg=864.66ms min=7.11ms  med=820.44ms max=6.45s   p(90)=1.61s   p(95)=1.73s    p(99.9)=5.9s   
     iterations.....................: 16151   235.592418/s
     success_rate...................: 100.00% ✓ 16151      ✗ 0    
     vus............................: 95      min=0        max=500
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

     checks.........................: 100.00% ✓ 20202      ✗ 0    
     data_received..................: 679 MB  9.2 MB/s
     data_sent......................: 9.4 MB  129 kB/s
     http_req_blocked...............: avg=22.92µs min=1.35µs  med=3.01µs  max=27.64ms p(90)=4.93µs  p(95)=8.25µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=17.58µs min=0s      med=0s      max=27.57ms p(90)=0s      p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=1.55s   min=11.98ms med=1.52s   max=21.05s  p(90)=2.64s   p(95)=3.01s    p(99.9)=19.52s  
       { expected_response:true }...: avg=1.55s   min=11.98ms med=1.52s   max=21.05s  p(90)=2.64s   p(95)=3.01s    p(99.9)=19.52s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7734 
     http_req_receiving.............: avg=63.71µs min=29.13µs med=51.38µs max=3.49ms  p(90)=89.9µs  p(95)=105.92µs p(99.9)=810.27µs
     http_req_sending...............: avg=30.31µs min=5.88µs  med=11.92µs max=11.1ms  p(90)=22.05µs p(95)=40.42µs  p(99.9)=4.42ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.55s   min=11.94ms med=1.52s   max=21.05s  p(90)=2.64s   p(95)=3.01s    p(99.9)=19.52s  
     http_reqs......................: 7734    105.282878/s
     iteration_duration.............: avg=1.78s   min=12.1ms  med=1.77s   max=21.07s  p(90)=2.72s   p(95)=3.07s    p(99.9)=19.7s   
     iterations.....................: 6734    91.669886/s
     success_rate...................: 100.00% ✓ 6734       ✗ 0    
     vus............................: 104     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

