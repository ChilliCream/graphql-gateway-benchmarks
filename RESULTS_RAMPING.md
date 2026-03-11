## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 3 times and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **60s**.


### Comparison

| Gateway                     | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :-------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hotchocolate (rust subgraphs) | 4198  | 255940 total, 0 failed | avg: 54ms, p95: 135ms  | ❌ non-compatible response structure (254940) |
| hive-router                 | 2171  | 135111 total, 0 failed | avg: 103ms, p95: 255ms | ✅                                        |
| grafbase                    | 2015  | 126622 total, 0 failed | avg: 110ms, p95: 269ms | ✅                                        |
| hotchocolate (.net subgraphs) |  915  | 58289 total, 0 failed  | avg: 240ms, p95: 646ms | ✅                                        |
| cosmo                       |  790  | 50087 total, 0 failed  | avg: 280ms, p95: 637ms | ✅                                        |
| hive-gateway-router-runtime |  549  | 36153 total, 0 failed  | avg: 389ms, p95: 831ms | ✅                                        |
| apollo-router               |  436  | 29019 total, 0 failed  | avg: 486ms, p95: 1122ms | ❌ non-compatible response structure (11) |
| hive-gateway                |  238  | 16622 total, 0 failed  | avg: 837ms, p95: 1826ms | ✅                                        |
| apollo-gateway              |  104  |  7629 total, 0 failed  | avg: 1570ms, p95: 3111ms | ✅                                        |


<details>
  <summary>Summary for: hotchocolate (rust subgraphs)</summary>

  **K6 Output**


```
✓ response code was 200
     ✗ no graphql errors
      ↳  0% — ✓ 0 / ✗ 254940
     ✗ valid response structure
      ↳  99% — ✓ 254440 / ✗ 500

     checks.........................: 66.60% ✓ 509380      ✗ 255440
     data_received..................: 67 MB  1.1 MB/s
     data_sent......................: 298 MB 4.9 MB/s
     http_req_blocked...............: avg=123.8µs  min=1.19µs   med=2.77µs  max=261.52ms p(90)=3.71µs   p(95)=4.23µs   p(99.9)=55.78ms 
     http_req_connecting............: avg=120.38µs min=0s       med=0s      max=261.46ms p(90)=0s       p(95)=0s       p(99.9)=55.7ms  
     http_req_duration..............: avg=54.46ms  min=298.02µs med=49.16ms max=300.77ms p(90)=102.41ms p(95)=135.49ms p(99.9)=252.41ms
       { expected_response:true }...: avg=54.46ms  min=298.02µs med=49.16ms max=300.77ms p(90)=102.41ms p(95)=135.49ms p(99.9)=252.41ms
     http_req_failed................: 0.00%  ✓ 0           ✗ 255940
     http_req_receiving.............: avg=229.27µs min=10.67µs  med=23.88µs max=98.73ms  p(90)=32.12µs  p(95)=46.68µs  p(99.9)=34.42ms 
     http_req_sending...............: avg=97.86µs  min=4.66µs   med=10.72µs max=91.4ms   p(90)=13.68µs  p(95)=19.41µs  p(99.9)=21.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=54.13ms  min=264.02µs med=48.83ms max=269.1ms  p(90)=101.74ms p(95)=134.24ms p(99.9)=251.76ms
     http_reqs......................: 255940 4198.785396/s
     iteration_duration.............: avg=54.89ms  min=444.54µs med=49.54ms max=368.1ms  p(90)=102.83ms p(95)=136.92ms p(99.9)=253.54ms
     iterations.....................: 254940 4182.380045/s
     success_rate...................: 0.00%  ✓ 0           ✗ 254940
     vus............................: 59     min=0         max=498 
     vus_max........................: 500    min=500       max=500
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

     checks.........................: 100.00% ✓ 402333      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=276.67µs min=1.15µs  med=2.37µs  max=264.74ms p(90)=3.62µs   p(95)=4.3µs    p(99.9)=106.37ms
     http_req_connecting............: avg=273.5µs  min=0s      med=0s      max=264.68ms p(90)=0s       p(95)=0s       p(99.9)=106.32ms
     http_req_duration..............: avg=103.14ms min=1.45ms  med=92.52ms max=404.77ms p(90)=213.31ms p(95)=254.68ms p(99.9)=347.21ms
       { expected_response:true }...: avg=103.14ms min=1.45ms  med=92.52ms max=404.77ms p(90)=213.31ms p(95)=254.68ms p(99.9)=347.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135111
     http_req_receiving.............: avg=403.21µs min=21.99µs med=41.28µs max=124.63ms p(90)=205.41µs p(95)=378.35µs p(99.9)=59.4ms  
     http_req_sending...............: avg=293.8µs  min=5.03µs  med=9.81µs  max=116.76ms p(90)=29.74µs  p(95)=123.58µs p(99.9)=54.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.45ms min=1.4ms   med=91.89ms max=371.05ms p(90)=211.61ms p(95)=253.22ms p(99.9)=345.21ms
     http_reqs......................: 135111  2171.479398/s
     iteration_duration.............: avg=104.43ms min=1.61ms  med=93.74ms max=654.08ms p(90)=214.89ms p(95)=256.26ms p(99.9)=357.51ms
     iterations.....................: 134111  2155.40758/s
     success_rate...................: 100.00% ✓ 134111      ✗ 0     
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

     checks.........................: 100.00% ✓ 376866      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 148 MB  2.3 MB/s
     http_req_blocked...............: avg=435.05µs min=1.3µs   med=2.82µs   max=500.84ms p(90)=4.13µs   p(95)=4.82µs   p(99.9)=156.03ms
     http_req_connecting............: avg=429.41µs min=0s      med=0s       max=500.75ms p(90)=0s       p(95)=0s       p(99.9)=155.68ms
     http_req_duration..............: avg=109.94ms min=2.3ms   med=100.25ms max=419.82ms p(90)=223.81ms p(95)=269.49ms p(99.9)=364.17ms
       { expected_response:true }...: avg=109.94ms min=2.3ms   med=100.25ms max=419.82ms p(90)=223.81ms p(95)=269.49ms p(99.9)=364.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126622
     http_req_receiving.............: avg=502.11µs min=23.82µs med=46.74µs  max=130.07ms p(90)=101.61µs p(95)=405.73µs p(99.9)=69.24ms 
     http_req_sending...............: avg=372.52µs min=5.45µs  med=11.49µs  max=117.04ms p(90)=21.72µs  p(95)=130.17µs p(99.9)=64.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.07ms min=2.24ms  med=99.31ms  max=393.84ms p(90)=222.09ms p(95)=267.3ms  p(99.9)=361.5ms 
     http_reqs......................: 126622  2015.275988/s
     iteration_duration.............: avg=111.52ms min=2.47ms  med=101.65ms max=814.7ms  p(90)=225.81ms p(95)=272.31ms p(99.9)=392.39ms
     iterations.....................: 125622  1999.360302/s
     success_rate...................: 100.00% ✓ 125622      ✗ 0     
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

     checks.........................: 100.00% ✓ 171867     ✗ 0    
     data_received..................: 5.1 GB  80 MB/s
     data_sent......................: 68 MB   1.1 MB/s
     http_req_blocked...............: avg=225.32µs min=1.32µs  med=2.97µs   max=343.77ms p(90)=4.72µs   p(95)=7.93µs   p(99.9)=79.15ms 
     http_req_connecting............: avg=219.67µs min=0s      med=0s       max=343.71ms p(90)=0s       p(95)=0s       p(99.9)=77.89ms 
     http_req_duration..............: avg=240.47ms min=3.08ms  med=186.4ms  max=1.14s    p(90)=548.43ms p(95)=646.06ms p(99.9)=1.05s   
       { expected_response:true }...: avg=240.47ms min=3.08ms  med=186.4ms  max=1.14s    p(90)=548.43ms p(95)=646.06ms p(99.9)=1.05s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 58289
     http_req_receiving.............: avg=8.72ms   min=54.95µs med=142.69µs max=420.09ms p(90)=26.73ms  p(95)=43.06ms  p(99.9)=295.97ms
     http_req_sending...............: avg=281.21µs min=5.55µs  med=11.16µs  max=220.96ms p(90)=30.29µs  p(95)=134.56µs p(99.9)=59.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=231.47ms min=3.01ms  med=179.39ms max=1.14s    p(90)=530.85ms p(95)=620.15ms p(99.9)=999.27ms
     http_reqs......................: 58289   915.369987/s
     iteration_duration.............: avg=245.28ms min=3.39ms  med=191.11ms max=1.32s    p(90)=553.99ms p(95)=649.47ms p(99.9)=1.06s   
     iterations.....................: 57289   899.665995/s
     success_rate...................: 100.00% ✓ 57289      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 147261     ✗ 0    
     data_received..................: 4.4 GB  69 MB/s
     data_sent......................: 58 MB   922 kB/s
     http_req_blocked...............: avg=64.16µs  min=1.33µs  med=2.7µs    max=98.93ms  p(90)=3.89µs   p(95)=4.73µs   p(99.9)=19.32ms 
     http_req_connecting............: avg=60.22µs  min=0s      med=0s       max=98.88ms  p(90)=0s       p(95)=0s       p(99.9)=19.16ms 
     http_req_duration..............: avg=280.23ms min=2.54ms  med=261.39ms max=1.29s    p(90)=560.62ms p(95)=637.08ms p(99.9)=989.59ms
       { expected_response:true }...: avg=280.23ms min=2.54ms  med=261.39ms max=1.29s    p(90)=560.62ms p(95)=637.08ms p(99.9)=989.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50087
     http_req_receiving.............: avg=528.63µs min=28.01µs med=61.32µs  max=131.82ms p(90)=168.08µs p(95)=420.04µs p(99.9)=75.89ms 
     http_req_sending...............: avg=96.49µs  min=5.32µs  med=10.51µs  max=67.17ms  p(90)=20.09µs  p(95)=119.02µs p(99.9)=17.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=279.61ms min=2.47ms  med=260.61ms max=1.29s    p(90)=559.88ms p(95)=636.37ms p(99.9)=988.1ms 
     http_reqs......................: 50087   790.538336/s
     iteration_duration.............: avg=286.31ms min=2.72ms  med=269.35ms max=1.29s    p(90)=563.95ms p(95)=639.16ms p(99.9)=990.27ms
     iterations.....................: 49087   774.755032/s
     success_rate...................: 100.00% ✓ 49087      ✗ 0    
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
     ✓ valid response structure

     checks.........................: 100.00% ✓ 105459     ✗ 0    
     data_received..................: 3.2 GB  48 MB/s
     data_sent......................: 42 MB   641 kB/s
     http_req_blocked...............: avg=79.67µs  min=1.25µs  med=2.7µs    max=136.18ms p(90)=4.03µs   p(95)=5.14µs   p(99.9)=18.4ms 
     http_req_connecting............: avg=74.56µs  min=0s      med=0s       max=136.11ms p(90)=0s       p(95)=0s       p(99.9)=18.31ms
     http_req_duration..............: avg=389.22ms min=5.11ms  med=373.14ms max=1.71s    p(90)=749.75ms p(95)=831.26ms p(99.9)=1.38s  
       { expected_response:true }...: avg=389.22ms min=5.11ms  med=373.14ms max=1.71s    p(90)=749.75ms p(95)=831.26ms p(99.9)=1.38s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 36153
     http_req_receiving.............: avg=145.56µs min=25.28µs med=42.66µs  max=101.25ms p(90)=75.33µs  p(95)=107.15µs p(99.9)=22.94ms
     http_req_sending...............: avg=145.17µs min=5.31µs  med=10.51µs  max=112.27ms p(90)=19.62µs  p(95)=65.92µs  p(99.9)=29.95ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=388.93ms min=5.07ms  med=372.82ms max=1.71s    p(90)=749.32ms p(95)=830.4ms  p(99.9)=1.38s  
     http_reqs......................: 36153   549.14775/s
     iteration_duration.............: avg=400.64ms min=5.33ms  med=386.9ms  max=1.86s    p(90)=753.75ms p(95)=836.79ms p(99.9)=1.39s  
     iterations.....................: 35153   533.958202/s
     success_rate...................: 100.00% ✓ 35153      ✗ 0    
     vus............................: 54      min=0        max=499
     vus_max........................: 500     min=500      max=500
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
      ↳  99% — ✓ 28008 / ✗ 11
     ✓ valid response structure

     checks.........................: 99.98% ✓ 84046      ✗ 11   
     data_received..................: 2.5 GB 38 MB/s
     data_sent......................: 34 MB  510 kB/s
     http_req_blocked...............: avg=57.09µs  min=1.78µs med=3.02µs   max=101.58ms p(90)=4.54µs   p(95)=5.75µs   p(99.9)=14.71ms
     http_req_connecting............: avg=52.67µs  min=0s     med=0s       max=101.54ms p(90)=0s       p(95)=0s       p(99.9)=14.64ms
     http_req_duration..............: avg=485.76ms min=5.69ms med=453.74ms max=2s       p(90)=989.89ms p(95)=1.12s    p(99.9)=1.5s   
       { expected_response:true }...: avg=485.76ms min=5.69ms med=453.74ms max=2s       p(90)=989.89ms p(95)=1.12s    p(99.9)=1.5s   
     http_req_failed................: 0.00%  ✓ 0          ✗ 29019
     http_req_receiving.............: avg=108.77µs min=32µs   med=50.99µs  max=79.22ms  p(90)=89.36µs  p(95)=126.39µs p(99.9)=7.36ms 
     http_req_sending...............: avg=80.49µs  min=6.96µs med=11.32µs  max=80.79ms  p(90)=20.87µs  p(95)=66.8µs   p(99.9)=13.89ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=485.57ms min=5.65ms med=453.59ms max=2s       p(90)=989.52ms p(95)=1.12s    p(99.9)=1.5s   
     http_reqs......................: 29019  436.442102/s
     iteration_duration.............: avg=503.4ms  min=6.03ms med=475.16ms max=2.01s    p(90)=997.59ms p(95)=1.12s    p(99.9)=1.51s  
     iterations.....................: 28019  421.402228/s
     success_rate...................: 99.96% ✓ 28008      ✗ 11   
     vus............................: 87     min=0        max=497
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

     checks.........................: 100.00% ✓ 46866      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 20 MB   281 kB/s
     http_req_blocked...............: avg=52.78µs  min=1.29µs  med=2.85µs   max=41.44ms  p(90)=5.27µs  p(95)=7.78µs   p(99.9)=12.53ms
     http_req_connecting............: avg=47.3µs   min=0s      med=0s       max=41.37ms  p(90)=0s      p(95)=0s       p(99.9)=12.46ms
     http_req_duration..............: avg=836.63ms min=7.13ms  med=793.94ms max=7.1s     p(90)=1.67s   p(95)=1.82s    p(99.9)=6s     
       { expected_response:true }...: avg=836.63ms min=7.13ms  med=793.94ms max=7.1s     p(90)=1.67s   p(95)=1.82s    p(99.9)=6s     
     http_req_failed................: 0.00%   ✓ 0          ✗ 16622
     http_req_receiving.............: avg=119.85µs min=27.19µs med=46.29µs  max=80.73ms  p(90)=96.75µs p(95)=124.66µs p(99.9)=14ms   
     http_req_sending...............: avg=138µs    min=5.76µs  med=11.29µs  max=109.13ms p(90)=29.7µs  p(95)=59.05µs  p(99.9)=22.06ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=836.37ms min=7.08ms  med=793.5ms  max=7.1s     p(90)=1.67s   p(95)=1.82s    p(99.9)=6s     
     http_reqs......................: 16622   238.373573/s
     iteration_duration.............: avg=890.18ms min=8.3ms   med=849.27ms max=7.11s    p(90)=1.68s   p(95)=1.83s    p(99.9)=6.05s  
     iterations.....................: 15622   224.032725/s
     success_rate...................: 100.00% ✓ 15622      ✗ 0    
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

     checks.........................: 100.00% ✓ 19887      ✗ 0    
     data_received..................: 670 MB  9.2 MB/s
     data_sent......................: 9.3 MB  128 kB/s
     http_req_blocked...............: avg=26.9µs  min=1.42µs  med=3.17µs  max=18.87ms  p(90)=4.91µs  p(95)=9.31µs  p(99.9)=3.99ms  
     http_req_connecting............: avg=21.46µs min=0s      med=0s      max=18.8ms   p(90)=0s      p(95)=0s      p(99.9)=3.94ms  
     http_req_duration..............: avg=1.57s   min=11.57ms med=1.51s   max=21.97s   p(90)=2.76s   p(95)=3.11s   p(99.9)=19.88s  
       { expected_response:true }...: avg=1.57s   min=11.57ms med=1.51s   max=21.97s   p(90)=2.76s   p(95)=3.11s   p(99.9)=19.88s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7629 
     http_req_receiving.............: avg=60.32µs min=27.68µs med=52.35µs max=717.04µs p(90)=85.12µs p(95)=97.51µs p(99.9)=445.68µs
     http_req_sending...............: avg=32.35µs min=5.89µs  med=12.4µs  max=22.13ms  p(90)=20.68µs p(95)=39.93µs p(99.9)=3.98ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=1.57s   min=11.53ms med=1.51s   max=21.97s   p(90)=2.76s   p(95)=3.11s   p(99.9)=19.88s  
     http_reqs......................: 7629    104.786957/s
     iteration_duration.............: avg=1.8s    min=12.52ms med=1.75s   max=21.98s   p(90)=2.81s   p(95)=3.16s   p(99.9)=19.98s  
     iterations.....................: 6629    91.05161/s
     success_rate...................: 100.00% ✓ 6629       ✗ 0    
     vus............................: 70      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

