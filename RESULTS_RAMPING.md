## Overview for: `ramping-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 10 times (120s each) and the median result (by RPS) is used.

This scenario is a stress test that ramps up to **500 VUs** over **120s**.


### Comparison

| Gateway                                        | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :--------------------------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router (v0.0.41)                          | 1497  | 93273 total, 0 failed  | avg: 150ms, p95: 307ms | ✅                                        |
| hotchocolate (.net subgraphs)                  |  974  | 61801 total, 45 failed | avg: 227ms, p95: 718ms | ❌ non-compatible response structure (47) |
| hotchocolate (rust subgraphs)                  |  958  | 61195 total, 121 failed | avg: 229ms, p95: 541ms | ❌ non-compatible response structure (153) |
| cosmo (0.291.0)                                |  866  | 54741 total, 0 failed  | avg: 256ms, p95: 507ms | ❌ non-compatible response structure (1)  |
| grafbase (0.53.2)                              |  795  | 50069 total, 0 failed  | avg: 281ms, p95: 615ms | ✅                                        |
| hive-gateway-router-runtime (2.5.6)            |  339  | 22339 total, 0 failed  | avg: 632ms, p95: 1391ms | ✅                                        |
| apollo-router (v2.12.0)                        |  295  | 19766 total, 0 failed  | avg: 713ms, p95: 1627ms | ❌ non-compatible response structure (59) |
| hive-gateway (2.5.6)                           |  185  | 12716 total, 0 failed  | avg: 1070ms, p95: 2199ms | ✅                                        |
| apollo-gateway (2.13.2)                        |  108  |  7989 total, 0 failed  | avg: 1524ms, p95: 2980ms | ✅                                        |


<details>
  <summary>Summary for: hive-router (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 276819      ✗ 0    
     data_received..................: 8.2 GB  131 MB/s
     data_sent......................: 112 MB  1.8 MB/s
     http_req_blocked...............: avg=51.62µs  min=1.18µs  med=1.93µs   max=91.12ms  p(90)=3.13µs   p(95)=4.07µs   p(99.9)=16.99ms 
     http_req_connecting............: avg=48.92µs  min=0s      med=0s       max=90.98ms  p(90)=0s       p(95)=0s       p(99.9)=16.93ms 
     http_req_duration..............: avg=150.05ms min=1.89ms  med=144.56ms max=444.56ms p(90)=286.52ms p(95)=307.36ms p(99.9)=400.79ms
       { expected_response:true }...: avg=150.05ms min=1.89ms  med=144.56ms max=444.56ms p(90)=286.52ms p(95)=307.36ms p(99.9)=400.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 93273
     http_req_receiving.............: avg=120.47µs min=21.74µs med=34.77µs  max=90.96ms  p(90)=73.78µs  p(95)=288.2µs  p(99.9)=20.18ms 
     http_req_sending...............: avg=97.99µs  min=5.32µs  med=7.88µs   max=82.89ms  p(90)=19.63µs  p(95)=98.29µs  p(99.9)=22.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=149.84ms min=1.85ms  med=144.33ms max=418.35ms p(90)=286.31ms p(95)=307.04ms p(99.9)=398.23ms
     http_reqs......................: 93273   1497.722786/s
     iteration_duration.............: avg=151.89ms min=1.98ms  med=146.69ms max=467.32ms p(90)=287.16ms p(95)=307.96ms p(99.9)=402ms   
     iterations.....................: 92273   1481.665376/s
     success_rate...................: 100.00% ✓ 92273       ✗ 0    
     vus............................: 74      min=0         max=494
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
✗ response code was 200
      ↳  99% — ✓ 60756 / ✗ 45
     ✗ no graphql errors
      ↳  99% — ✓ 60754 / ✗ 47
     ✓ valid response structure

     checks.........................: 99.94% ✓ 182311     ✗ 92   
     data_received..................: 5.4 GB 85 MB/s
     data_sent......................: 74 MB  1.2 MB/s
     http_req_blocked...............: avg=71.08µs  min=1.2µs   med=2.06µs   max=228.19ms p(90)=3.48µs   p(95)=4.52µs   p(99.9)=18.1ms 
     http_req_connecting............: avg=66.56µs  min=0s      med=0s       max=228.04ms p(90)=0s       p(95)=0s       p(99.9)=17.98ms
     http_req_duration..............: avg=227.19ms min=2.85ms  med=141.36ms max=3.18s    p(90)=538.39ms p(95)=717.8ms  p(99.9)=1.92s  
       { expected_response:true }...: avg=227.34ms min=2.85ms  med=141.57ms max=3.18s    p(90)=538.46ms p(95)=717.9ms  p(99.9)=1.92s  
     http_req_failed................: 0.07%  ✓ 45         ✗ 61756
     http_req_receiving.............: avg=14.04ms  min=13.18µs med=88.04µs  max=2.12s    p(90)=9.66ms   p(95)=75.82ms  p(99.9)=1.05s  
     http_req_sending...............: avg=121.8µs  min=5.54µs  med=8.41µs   max=129.88ms p(90)=17.94µs  p(95)=98.45µs  p(99.9)=27.37ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=213.02ms min=2.78ms  med=137.6ms  max=3.13s    p(90)=503.36ms p(95)=660.12ms p(99.9)=1.73s  
     http_reqs......................: 61801  974.245294/s
     iteration_duration.............: avg=231.19ms min=2.98ms  med=145.85ms max=3.18s    p(90)=542.33ms p(95)=722.21ms p(99.9)=1.93s  
     iterations.....................: 60801  958.481062/s
     success_rate...................: 99.92% ✓ 60754      ✗ 47   
     vus............................: 81     min=0        max=495
     vus_max........................: 500    min=500      max=500
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
✗ response code was 200
      ↳  99% — ✓ 60074 / ✗ 121
     ✗ no graphql errors
      ↳  99% — ✓ 60048 / ✗ 147
     ✗ valid response structure
      ↳  99% — ✓ 60188 / ✗ 7

     checks.........................: 99.84% ✓ 180310     ✗ 275  
     data_received..................: 5.3 GB 84 MB/s
     data_sent......................: 74 MB  1.2 MB/s
     http_req_blocked...............: avg=38µs     min=1.15µs  med=2.07µs   max=150.06ms p(90)=3.41µs   p(95)=4.34µs   p(99.9)=8.4ms   
     http_req_connecting............: avg=34.67µs  min=0s      med=0s       max=149.91ms p(90)=0s       p(95)=0s       p(99.9)=7.81ms  
     http_req_duration..............: avg=229.2ms  min=3.36ms  med=197.93ms max=1.7s     p(90)=453.95ms p(95)=541.4ms  p(99.9)=1.15s   
       { expected_response:true }...: avg=229.27ms min=3.36ms  med=198.04ms max=1.7s     p(90)=453.87ms p(95)=541.33ms p(99.9)=1.15s   
     http_req_failed................: 0.19%  ✓ 121        ✗ 61074
     http_req_receiving.............: avg=3.64ms   min=13.13µs med=84.03µs  max=590.25ms p(90)=1.37ms   p(95)=5.38ms   p(99.9)=327.73ms
     http_req_sending...............: avg=66.13µs  min=5.45µs  med=8.36µs   max=59.36ms  p(90)=15.85µs  p(95)=81.23µs  p(99.9)=11.95ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=225.49ms min=3.3ms   med=196.57ms max=1.7s     p(90)=447.38ms p(95)=527.89ms p(99.9)=1.11s   
     http_reqs......................: 61195  958.240163/s
     iteration_duration.............: avg=233.2ms  min=3.57ms  med=202.77ms max=1.7s     p(90)=456.09ms p(95)=543.35ms p(99.9)=1.15s   
     iterations.....................: 60195  942.581364/s
     success_rate...................: 99.74% ✓ 60042      ✗ 153  
     vus............................: 55     min=0        max=499
     vus_max........................: 500    min=500      max=500
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
     ✗ no graphql errors
      ↳  99% — ✓ 53740 / ✗ 1
     ✓ valid response structure

     checks.........................: 99.99% ✓ 161222     ✗ 1    
     data_received..................: 4.8 GB 76 MB/s
     data_sent......................: 66 MB  1.0 MB/s
     http_req_blocked...............: avg=12.93µs  min=1.25µs  med=1.86µs   max=39.42ms  p(90)=3.05µs   p(95)=3.91µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=10.04µs  min=0s      med=0s       max=39.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=256.34ms min=2.62ms  med=255.07ms max=610.51ms p(90)=475.56ms p(95)=506.61ms p(99.9)=569.24ms
       { expected_response:true }...: avg=256.34ms min=2.62ms  med=255.07ms max=610.51ms p(90)=475.56ms p(95)=506.61ms p(99.9)=569.24ms
     http_req_failed................: 0.00%  ✓ 0          ✗ 54741
     http_req_receiving.............: avg=59.15µs  min=16.46µs med=43.14µs  max=9.58ms   p(90)=66.82µs  p(95)=84.29µs  p(99.9)=1.52ms  
     http_req_sending...............: avg=33.68µs  min=5.53µs  med=7.97µs   max=26.95ms  p(90)=12.98µs  p(95)=27.27µs  p(99.9)=6.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=256.25ms min=2.57ms  med=254.93ms max=610.46ms p(90)=475.49ms p(95)=506.5ms  p(99.9)=569.19ms
     http_reqs......................: 54741  866.327583/s
     iteration_duration.............: avg=261.27ms min=2.87ms  med=260.3ms  max=610.73ms p(90)=476.93ms p(95)=507.34ms p(99.9)=569.46ms
     iterations.....................: 53741  850.501646/s
     success_rate...................: 99.99% ✓ 53740      ✗ 1    
     vus............................: 71     min=0        max=495
     vus_max........................: 500    min=500      max=500
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

     checks.........................: 100.00% ✓ 147207     ✗ 0    
     data_received..................: 4.4 GB  70 MB/s
     data_sent......................: 60 MB   957 kB/s
     http_req_blocked...............: avg=10.35µs  min=1.2µs   med=1.84µs   max=36.55ms  p(90)=2.97µs   p(95)=3.81µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=7.72µs   min=0s      med=0s       max=36.51ms  p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=280.54ms min=2.42ms  med=270.38ms max=868.82ms p(90)=551.96ms p(95)=614.51ms p(99.9)=809.49ms
       { expected_response:true }...: avg=280.54ms min=2.42ms  med=270.38ms max=868.82ms p(90)=551.96ms p(95)=614.51ms p(99.9)=809.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50069
     http_req_receiving.............: avg=53.55µs  min=23.84µs med=38.97µs  max=20.15ms  p(90)=60.37µs  p(95)=73.34µs  p(99.9)=1.47ms  
     http_req_sending...............: avg=33.02µs  min=5.37µs  med=7.99µs   max=27.53ms  p(90)=12.17µs  p(95)=21.16µs  p(99.9)=6.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=280.46ms min=2.38ms  med=270.26ms max=868.78ms p(90)=551.85ms p(95)=614.45ms p(99.9)=809.44ms
     http_reqs......................: 50069   795.851621/s
     iteration_duration.............: avg=286.42ms min=2.62ms  med=275.97ms max=868.94ms p(90)=554.33ms p(95)=615.96ms p(99.9)=810.02ms
     iterations.....................: 49069   779.956524/s
     success_rate...................: 100.00% ✓ 49069      ✗ 0    
     vus............................: 58      min=0        max=498
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 64017      ✗ 0    
     data_received..................: 2.0 GB  30 MB/s
     data_sent......................: 27 MB   409 kB/s
     http_req_blocked...............: avg=12.69µs  min=1.32µs  med=2.01µs   max=15.34ms p(90)=3.39µs  p(95)=4.49µs  p(99.9)=1.01ms  
     http_req_connecting............: avg=9.39µs   min=0s      med=0s       max=15.29ms p(90)=0s      p(95)=0s      p(99.9)=962.41µs
     http_req_duration..............: avg=631.72ms min=5.15ms  med=596.45ms max=2.54s   p(90)=1.26s   p(95)=1.39s   p(99.9)=2.02s   
       { expected_response:true }...: avg=631.72ms min=5.15ms  med=596.45ms max=2.54s   p(90)=1.26s   p(95)=1.39s   p(99.9)=2.02s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 22339
     http_req_receiving.............: avg=55.12µs  min=26.66µs med=41.84µs  max=11.42ms p(90)=70.68µs p(95)=82.98µs p(99.9)=1.19ms  
     http_req_sending...............: avg=22.72µs  min=5.68µs  med=8.43µs   max=9.81ms  p(90)=14.4µs  p(95)=25.97µs p(99.9)=4.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=631.64ms min=5.11ms  med=596.41ms max=2.54s   p(90)=1.26s   p(95)=1.39s   p(99.9)=2.02s   
     http_reqs......................: 22339   339.085177/s
     iteration_duration.............: avg=661.36ms min=5.35ms  med=633.58ms max=2.55s   p(90)=1.27s   p(95)=1.39s   p(99.9)=2.04s   
     iterations.....................: 21339   323.90611/s
     success_rate...................: 100.00% ✓ 21339      ✗ 0    
     vus............................: 58      min=0        max=498
     vus_max........................: 500     min=500      max=500
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
     ✗ no graphql errors
      ↳  99% — ✓ 18707 / ✗ 59
     ✗ valid response structure
      ↳  99% — ✓ 18765 / ✗ 1

     checks.........................: 99.89% ✓ 56238      ✗ 60   
     data_received..................: 1.7 GB 26 MB/s
     data_sent......................: 24 MB  356 kB/s
     http_req_blocked...............: avg=20.2µs   min=1.26µs  med=2.01µs   max=44.9ms  p(90)=3.65µs  p(95)=5.14µs  p(99.9)=2.49ms  
     http_req_connecting............: avg=16.64µs  min=0s      med=0s       max=44.85ms p(90)=0s      p(95)=0s      p(99.9)=2.43ms  
     http_req_duration..............: avg=713.39ms min=6.19ms  med=641.2ms  max=9.62s   p(90)=1.37s   p(95)=1.62s   p(99.9)=7.62s   
       { expected_response:true }...: avg=713.39ms min=6.19ms  med=641.2ms  max=9.62s   p(90)=1.37s   p(95)=1.62s   p(99.9)=7.62s   
     http_req_failed................: 0.00%  ✓ 0          ✗ 19766
     http_req_receiving.............: avg=59.55µs  min=25.11µs med=41.92µs  max=27.6ms  p(90)=76.41µs p(95)=94.92µs p(99.9)=978.28µs
     http_req_sending...............: avg=39.1µs   min=5.85µs  med=8.93µs   max=41.17ms p(90)=17.16µs p(95)=37.76µs p(99.9)=6.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=713.29ms min=6.16ms  med=641.15ms max=9.62s   p(90)=1.37s   p(95)=1.62s   p(99.9)=7.62s   
     http_reqs......................: 19766  295.00493/s
     iteration_duration.............: avg=751.39ms min=6.55ms  med=684.11ms max=9.62s   p(90)=1.39s   p(95)=1.64s   p(99.9)=7.64s   
     iterations.....................: 18766  280.080062/s
     success_rate...................: 99.68% ✓ 18707      ✗ 59   
     vus............................: 63     min=0        max=497
     vus_max........................: 500    min=500      max=500
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

     checks.........................: 100.00% ✓ 35148      ✗ 0    
     data_received..................: 1.1 GB  16 MB/s
     data_sent......................: 16 MB   227 kB/s
     http_req_blocked...............: avg=13.64µs min=1.36µs  med=2.35µs  max=7.44ms  p(90)=3.9µs   p(95)=5.63µs  p(99.9)=829.84µs
     http_req_connecting............: avg=9.54µs  min=0s      med=0s      max=7.4ms   p(90)=0s      p(95)=0s      p(99.9)=784.83µs
     http_req_duration..............: avg=1.07s   min=6.9ms   med=1.03s   max=10.61s  p(90)=2.01s   p(95)=2.19s   p(99.9)=9.41s   
       { expected_response:true }...: avg=1.07s   min=6.9ms   med=1.03s   max=10.61s  p(90)=2.01s   p(95)=2.19s   p(99.9)=9.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 12716
     http_req_receiving.............: avg=58.13µs min=26.23µs med=46.71µs max=8.05ms  p(90)=77.96µs p(95)=91.7µs  p(99.9)=1.06ms  
     http_req_sending...............: avg=27.42µs min=6.07µs  med=9.76µs  max=10.96ms p(90)=17.29µs p(95)=32.63µs p(99.9)=5.7ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=1.07s   min=6.86ms  med=1.03s   max=10.61s  p(90)=2.01s   p(95)=2.19s   p(99.9)=9.41s   
     http_reqs......................: 12716   185.423952/s
     iteration_duration.............: avg=1.16s   min=7.19ms  med=1.15s   max=10.62s  p(90)=2.03s   p(95)=2.22s   p(99.9)=9.46s   
     iterations.....................: 11716   170.842012/s
     success_rate...................: 100.00% ✓ 11716      ✗ 0    
     vus............................: 98      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 20967      ✗ 0    
     data_received..................: 702 MB  9.5 MB/s
     data_sent......................: 10 MB   136 kB/s
     http_req_blocked...............: avg=15.13µs min=1.31µs  med=2.08µs  max=7.87ms  p(90)=3.64µs  p(95)=5.92µs  p(99.9)=567.4µs 
     http_req_connecting............: avg=10.92µs min=0s      med=0s      max=7.83ms  p(90)=0s      p(95)=0s      p(99.9)=506.75µs
     http_req_duration..............: avg=1.52s   min=11.92ms med=1.5s    max=20.65s  p(90)=2.68s   p(95)=2.98s   p(99.9)=19.42s  
       { expected_response:true }...: avg=1.52s   min=11.92ms med=1.5s    max=20.65s  p(90)=2.68s   p(95)=2.98s   p(99.9)=19.42s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 7989 
     http_req_receiving.............: avg=54.9µs  min=27.42µs med=41.51µs max=12.04ms p(90)=73.47µs p(95)=86.76µs p(99.9)=633.55µs
     http_req_sending...............: avg=24.97µs min=6.03µs  med=8.8µs   max=9.38ms  p(90)=16.83µs p(95)=35.36µs p(99.9)=5.34ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=1.52s   min=11.86ms med=1.5s    max=20.65s  p(90)=2.68s   p(95)=2.98s   p(99.9)=19.42s  
     http_reqs......................: 7989    108.450608/s
     iteration_duration.............: avg=1.74s   min=12.19ms med=1.71s   max=20.66s  p(90)=2.76s   p(95)=3.03s   p(99.9)=19.74s  
     iterations.....................: 6989    94.875616/s
     success_rate...................: 100.00% ✓ 6989       ✗ 0    
     vus............................: 116     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

