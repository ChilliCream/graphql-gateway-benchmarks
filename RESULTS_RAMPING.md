## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router                 | 2076  | 129386 total, 0 failed | avg: 108ms, p95: 269ms | ✅                                        |
| grafbase                    | 2034  | 127936 total, 0 failed | avg: 109ms, p95: 265ms | ✅                                        |
| hotchocolate (rust subgraphs) | 1016  | 64893 total, 0 failed  | avg: 216ms, p95: 503ms | ✅                                        |
| hotchocolate (.net subgraphs) |  983  | 62248 total, 0 failed  | avg: 225ms, p95: 527ms | ✅                                        |
| cosmo                       |  788  | 50049 total, 0 failed  | avg: 281ms, p95: 631ms | ✅                                        |
| hive-gateway-router-runtime |  539  | 35670 total, 0 failed  | avg: 394ms, p95: 859ms | ❌ non-compatible response structure (2)  |
| apollo-router               |  395  | 26533 total, 0 failed  | avg: 531ms, p95: 1204ms | ❌ non-compatible response structure (12) |
| hive-gateway                |  229  | 16174 total, 0 failed  | avg: 859ms, p95: 1853ms | ✅                                        |
| apollo-gateway              |  102  |  7510 total, 0 failed  | avg: 1590ms, p95: 2931ms | ✅                                        |


<details>
  <summary>Summary for: hive-router</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 385158      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 151 MB  2.4 MB/s
     http_req_blocked...............: avg=249.1µs  min=1.21µs  med=2.44µs  max=228.54ms p(90)=3.84µs   p(95)=4.69µs   p(99.9)=98.11ms 
     http_req_connecting............: avg=244.48µs min=0s      med=0s      max=228.34ms p(90)=0s       p(95)=0s       p(99.9)=96.97ms 
     http_req_duration..............: avg=107.78ms min=1.76ms  med=95.26ms max=477.59ms p(90)=224.69ms p(95)=268.66ms p(99.9)=368.34ms
       { expected_response:true }...: avg=107.78ms min=1.76ms  med=95.26ms max=477.59ms p(90)=224.69ms p(95)=268.66ms p(99.9)=368.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129386
     http_req_receiving.............: avg=394.5µs  min=24.15µs med=41.52µs max=118.99ms p(90)=196.31µs p(95)=394.75µs p(99.9)=60.31ms 
     http_req_sending...............: avg=298.93µs min=5.31µs  med=9.84µs  max=123.31ms p(90)=30.16µs  p(95)=129.02µs p(99.9)=56.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.09ms min=1.7ms   med=94.74ms max=448.53ms p(90)=222.98ms p(95)=266.83ms p(99.9)=367.4ms 
     http_reqs......................: 129386  2076.823908/s
     iteration_duration.............: avg=109.11ms min=1.9ms   med=96.34ms max=602.45ms p(90)=226.32ms p(95)=270.32ms p(99.9)=378.86ms
     iterations.....................: 128386  2060.772528/s
     success_rate...................: 100.00% ✓ 128386      ✗ 0     
     vus............................: 74      min=0         max=494 
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

     checks.........................: 100.00% ✓ 380808      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 149 MB  2.4 MB/s
     http_req_blocked...............: avg=424.46µs min=1.38µs  med=2.89µs  max=310.78ms p(90)=4.15µs   p(95)=4.81µs   p(99.9)=157.25ms
     http_req_connecting............: avg=420.03µs min=0s      med=0s      max=310.72ms p(90)=0s       p(95)=0s       p(99.9)=157.21ms
     http_req_duration..............: avg=108.8ms  min=2.14ms  med=98.41ms max=449.45ms p(90)=222.78ms p(95)=265.31ms p(99.9)=348.19ms
       { expected_response:true }...: avg=108.8ms  min=2.14ms  med=98.41ms max=449.45ms p(90)=222.78ms p(95)=265.31ms p(99.9)=348.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127936
     http_req_receiving.............: avg=512.52µs min=23.89µs med=45.37µs max=117.5ms  p(90)=97.85µs  p(95)=402.64µs p(99.9)=71.7ms  
     http_req_sending...............: avg=372.66µs min=5.55µs  med=11.15µs max=126.98ms p(90)=21.2µs   p(95)=129.31µs p(99.9)=64.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.91ms min=2.1ms   med=97.39ms max=369.78ms p(90)=220.81ms p(95)=263.73ms p(99.9)=344.27ms
     http_reqs......................: 127936  2034.004699/s
     iteration_duration.............: avg=110.34ms min=2.23ms  med=99.85ms max=682.53ms p(90)=224.68ms p(95)=267.3ms  p(99.9)=387.9ms 
     iterations.....................: 126936  2018.106088/s
     success_rate...................: 100.00% ✓ 126936      ✗ 0     
     vus............................: 55      min=0         max=498 
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

     checks.........................: 100.00% ✓ 191679      ✗ 0    
     data_received..................: 5.7 GB  89 MB/s
     data_sent......................: 76 MB   1.2 MB/s
     http_req_blocked...............: avg=138.34µs min=1.3µs   med=2.96µs   max=172.4ms  p(90)=4.44µs   p(95)=7.69µs   p(99.9)=50.66ms 
     http_req_connecting............: avg=132.5µs  min=0s      med=0s       max=172.32ms p(90)=0s       p(95)=0s       p(99.9)=50.31ms 
     http_req_duration..............: avg=215.85ms min=3.47ms  med=192.39ms max=814.97ms p(90)=447.46ms p(95)=503.32ms p(99.9)=671.91ms
       { expected_response:true }...: avg=215.85ms min=3.47ms  med=192.39ms max=814.97ms p(90)=447.46ms p(95)=503.32ms p(99.9)=671.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 64893
     http_req_receiving.............: avg=13.85ms  min=52.36µs med=3.71ms   max=194.3ms  p(90)=41.25ms  p(95)=54.8ms   p(99.9)=140.59ms
     http_req_sending...............: avg=209.92µs min=5.57µs  med=11.15µs  max=148.1ms  p(90)=27.93µs  p(95)=129.1µs  p(99.9)=43.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.78ms min=3.38ms  med=178.75ms max=792.45ms p(90)=421.12ms p(95)=475.4ms  p(99.9)=650.38ms
     http_reqs......................: 64893   1016.334139/s
     iteration_duration.............: avg=219.69ms min=3.64ms  med=196.75ms max=815.14ms p(90)=449.74ms p(95)=504.9ms  p(99.9)=677.88ms
     iterations.....................: 63893   1000.672447/s
     success_rate...................: 100.00% ✓ 63893       ✗ 0    
     vus............................: 53      min=0         max=499
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

     checks.........................: 100.00% ✓ 183744     ✗ 0    
     data_received..................: 5.5 GB  86 MB/s
     data_sent......................: 73 MB   1.1 MB/s
     http_req_blocked...............: avg=145.2µs  min=1.16µs  med=2.78µs   max=201.21ms p(90)=4.18µs   p(95)=6.89µs   p(99.9)=53.17ms 
     http_req_connecting............: avg=140.98µs min=0s      med=0s       max=201.17ms p(90)=0s       p(95)=0s       p(99.9)=52.46ms 
     http_req_duration..............: avg=225.14ms min=2.76ms  med=199.22ms max=1.02s    p(90)=470.37ms p(95)=527.03ms p(99.9)=823.97ms
       { expected_response:true }...: avg=225.14ms min=2.76ms  med=199.22ms max=1.02s    p(90)=470.37ms p(95)=527.03ms p(99.9)=823.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62248
     http_req_receiving.............: avg=14.9ms   min=52.14µs med=3.5ms    max=259.71ms p(90)=43.89ms  p(95)=58.66ms  p(99.9)=147.89ms
     http_req_sending...............: avg=251.73µs min=5.15µs  med=10.78µs  max=120.89ms p(90)=28.54µs  p(95)=128.97µs p(99.9)=50.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.98ms min=2.68ms  med=184.64ms max=991.93ms p(90)=440.97ms p(95)=496.49ms p(99.9)=766.06ms
     http_reqs......................: 62248   983.355193/s
     iteration_duration.............: avg=229.29ms min=3.04ms  med=204.38ms max=1.02s    p(90)=472.9ms  p(95)=529.31ms p(99.9)=825.22ms
     iterations.....................: 61248   967.557815/s
     success_rate...................: 100.00% ✓ 61248      ✗ 0    
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

     checks.........................: 100.00% ✓ 147147     ✗ 0    
     data_received..................: 4.4 GB  69 MB/s
     data_sent......................: 58 MB   920 kB/s
     http_req_blocked...............: avg=59.33µs  min=1.2µs  med=2.66µs   max=99.61ms  p(90)=3.89µs   p(95)=4.99µs   p(99.9)=15.06ms 
     http_req_connecting............: avg=55.57µs  min=0s     med=0s       max=99.53ms  p(90)=0s       p(95)=0s       p(99.9)=15ms    
     http_req_duration..............: avg=280.52ms min=2.64ms med=266.1ms  max=1.21s    p(90)=559.42ms p(95)=630.67ms p(99.9)=910.2ms 
       { expected_response:true }...: avg=280.52ms min=2.64ms med=266.1ms  max=1.21s    p(90)=559.42ms p(95)=630.67ms p(99.9)=910.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 50049
     http_req_receiving.............: avg=790.95µs min=27.9µs med=60.75µs  max=244.09ms p(90)=157.04µs p(95)=415.25µs p(99.9)=138.61ms
     http_req_sending...............: avg=95.64µs  min=6.07µs med=10.8µs   max=100.61ms p(90)=20.98µs  p(95)=119.79µs p(99.9)=16.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=279.63ms min=2.56ms med=265.29ms max=1.21s    p(90)=558ms    p(95)=628.78ms p(99.9)=910.09ms
     http_reqs......................: 50049   788.683713/s
     iteration_duration.............: avg=286.59ms min=2.86ms med=272.79ms max=1.21s    p(90)=562.29ms p(95)=633.2ms  p(99.9)=912.71ms
     iterations.....................: 49049   772.925482/s
     success_rate...................: 100.00% ✓ 49049      ✗ 0    
     vus............................: 81      min=0        max=498
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
      ↳  99% — ✓ 34668 / ✗ 2

     checks.........................: 99.99% ✓ 104008     ✗ 2    
     data_received..................: 3.1 GB 47 MB/s
     data_sent......................: 42 MB  630 kB/s
     http_req_blocked...............: avg=78.9µs   min=1.25µs  med=2.77µs   max=125.48ms p(90)=4.2µs    p(95)=5.41µs   p(99.9)=23.28ms
     http_req_connecting............: avg=74.31µs  min=0s      med=0s       max=125.41ms p(90)=0s       p(95)=0s       p(99.9)=23.01ms
     http_req_duration..............: avg=394.47ms min=5.17ms  med=371.84ms max=1.52s    p(90)=780.55ms p(95)=859.35ms p(99.9)=1.25s  
       { expected_response:true }...: avg=394.47ms min=5.17ms  med=371.84ms max=1.52s    p(90)=780.55ms p(95)=859.35ms p(99.9)=1.25s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 35670
     http_req_receiving.............: avg=144.56µs min=24.32µs med=43.44µs  max=119.2ms  p(90)=79.62µs  p(95)=113.82µs p(99.9)=25.18ms
     http_req_sending...............: avg=162.27µs min=5.46µs  med=10.7µs   max=96.15ms  p(90)=21.51µs  p(95)=79.51µs  p(99.9)=33.63ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=394.17ms min=5.13ms  med=371.59ms max=1.52s    p(90)=780.1ms  p(95)=858.93ms p(99.9)=1.25s  
     http_reqs......................: 35670  539.875454/s
     iteration_duration.............: avg=406.18ms min=5.49ms  med=387.85ms max=1.57s    p(90)=785.87ms p(95)=861.46ms p(99.9)=1.25s  
     iterations.....................: 34670  524.740174/s
     success_rate...................: 99.99% ✓ 34668      ✗ 2    
     vus............................: 64     min=0        max=497
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
      ↳  99% — ✓ 25521 / ✗ 12
     ✓ valid response structure

     checks.........................: 99.98% ✓ 76587      ✗ 12   
     data_received..................: 2.3 GB 35 MB/s
     data_sent......................: 31 MB  462 kB/s
     http_req_blocked...............: avg=36.77µs  min=1.75µs  med=3.15µs   max=97.62ms p(90)=5.22µs  p(95)=6.55µs   p(99.9)=5.38ms 
     http_req_connecting............: avg=32.23µs  min=0s      med=0s       max=97.42ms p(90)=0s      p(95)=0s       p(99.9)=5.33ms 
     http_req_duration..............: avg=531.47ms min=6.05ms  med=493.63ms max=1.88s   p(90)=1.07s   p(95)=1.2s     p(99.9)=1.63s  
       { expected_response:true }...: avg=531.47ms min=6.05ms  med=493.63ms max=1.88s   p(90)=1.07s   p(95)=1.2s     p(99.9)=1.63s  
     http_req_failed................: 0.00%  ✓ 0          ✗ 26533
     http_req_receiving.............: avg=85.01µs  min=34.29µs med=55.73µs  max=40.2ms  p(90)=94.59µs p(95)=113.99µs p(99.9)=1.52ms 
     http_req_sending...............: avg=60.61µs  min=6.41µs  med=11.42µs  max=45.58ms p(90)=20.89µs p(95)=36µs     p(99.9)=11.11ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=531.32ms min=5.98ms  med=493.56ms max=1.88s   p(90)=1.07s   p(95)=1.2s     p(99.9)=1.63s  
     http_reqs......................: 26533  395.166615/s
     iteration_duration.............: avg=552.5ms  min=6.59ms  med=518.19ms max=1.88s   p(90)=1.08s   p(95)=1.2s     p(99.9)=1.63s  
     iterations.....................: 25533  380.273214/s
     success_rate...................: 99.95% ✓ 25521      ✗ 12   
     vus............................: 71     min=0        max=495
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

     checks.........................: 100.00% ✓ 45522      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   270 kB/s
     http_req_blocked...............: avg=69.18µs  min=1.24µs  med=2.98µs   max=132.13ms p(90)=5.7µs    p(95)=8.39µs   p(99.9)=15.55ms
     http_req_connecting............: avg=63.89µs  min=0s      med=0s       max=131.97ms p(90)=0s       p(95)=0s       p(99.9)=15.48ms
     http_req_duration..............: avg=858.68ms min=7.33ms  med=840.74ms max=7.29s    p(90)=1.63s    p(95)=1.85s    p(99.9)=6.04s  
       { expected_response:true }...: avg=858.68ms min=7.33ms  med=840.74ms max=7.29s    p(90)=1.63s    p(95)=1.85s    p(99.9)=6.04s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16174
     http_req_receiving.............: avg=125.52µs min=27.91µs med=50.32µs  max=85.83ms  p(90)=108.01µs p(95)=147.22µs p(99.9)=12.77ms
     http_req_sending...............: avg=147.63µs min=5.93µs  med=11.62µs  max=118.18ms p(90)=32.16µs  p(95)=66.28µs  p(99.9)=22.47ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=858.41ms min=7.26ms  med=840.43ms max=7.29s    p(90)=1.63s    p(95)=1.85s    p(99.9)=6.04s  
     http_reqs......................: 16174   229.319195/s
     iteration_duration.............: avg=915.25ms min=8.05ms  med=908.94ms max=7.3s     p(90)=1.64s    p(95)=1.86s    p(99.9)=6.08s  
     iterations.....................: 15174   215.140934/s
     success_rate...................: 100.00% ✓ 15174      ✗ 0    
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

     checks.........................: 100.00% ✓ 19530      ✗ 0    
     data_received..................: 660 MB  9.0 MB/s
     data_sent......................: 9.2 MB  125 kB/s
     http_req_blocked...............: avg=27.15µs min=1.4µs   med=3.29µs  max=15.67ms  p(90)=5.2µs   p(95)=10.96µs  p(99.9)=5.2ms   
     http_req_connecting............: avg=21.52µs min=0s      med=0s      max=15.6ms   p(90)=0s      p(95)=0s       p(99.9)=5.13ms  
     http_req_duration..............: avg=1.59s   min=11.86ms med=1.57s   max=21.76s   p(90)=2.66s   p(95)=2.93s    p(99.9)=20.32s  
       { expected_response:true }...: avg=1.59s   min=11.86ms med=1.57s   max=21.76s   p(90)=2.66s   p(95)=2.93s    p(99.9)=20.32s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7510 
     http_req_receiving.............: avg=64.18µs min=28.74µs med=54.24µs max=945.84µs p(90)=90.92µs p(95)=104.43µs p(99.9)=487.31µs
     http_req_sending...............: avg=34.06µs min=6.08µs  med=12.71µs max=15.81ms  p(90)=21.94µs p(95)=41.46µs  p(99.9)=6.63ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.59s   min=11.79ms med=1.57s   max=21.76s   p(90)=2.66s   p(95)=2.93s    p(99.9)=20.32s  
     http_reqs......................: 7510    102.192927/s
     iteration_duration.............: avg=1.83s   min=12.7ms  med=1.81s   max=21.77s   p(90)=2.73s   p(95)=2.97s    p(99.9)=20.53s  
     iterations.....................: 6510    88.585347/s
     success_rate...................: 100.00% ✓ 6510       ✗ 0    
     vus............................: 106     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

