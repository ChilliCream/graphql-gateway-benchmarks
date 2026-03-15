## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities. The benchmarks cover two schema composition approaches:

- **Apollo Federation** — subgraphs are built with Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)
- **Composite Schema** — subgraphs are built with .NET ([HotChocolate](https://github.com/ChilliCream/graphql-platform)) or Rust ([async-graphql](https://github.com/async-graphql/async-graphql) + axum)

Metrics collected include RPS, latency percentiles, CPU usage, and memory (RSS). Each gateway is tested 10 times (120s each) and the median result (by RPS) is used.

This scenario executes a constant load of **50 VUs** over **120s**.


### Comparison

| Gateway                                        | RPS ⬇️ |        Requests        |        Duration        | Notes                                    |
| :--------------------------------------------- | :----: | :--------------------: | :--------------------: | :--------------------------------------- |
| hive-router (v0.0.41)                          | 1709  | 205483 total, 0 failed |  avg: 29ms, p95: 44ms  | ✅                                        |
| grafbase (0.53.2)                              | 1048  | 126132 total, 0 failed |  avg: 47ms, p95: 61ms  | ✅                                        |
| hotchocolate (rust subgraphs)                  |  861  | 103705 total, 21 failed | avg: 58ms, p95: 158ms  | ❌ non-compatible response structure (34) |
| hotchocolate (.net subgraphs)                  |  829  | 99926 total, 78 failed | avg: 60ms, p95: 173ms  | ❌ non-compatible response structure (89) |
| cosmo (0.291.0)                                |  516  | 62151 total, 0 failed  | avg: 96ms, p95: 130ms  | ✅                                        |
| hive-gateway-router-runtime (2.5.6)            |  231  | 28003 total, 0 failed  | avg: 214ms, p95: 267ms | ✅                                        |
| apollo-router (v2.12.0)                        |  214  | 25928 total, 0 failed  | avg: 231ms, p95: 282ms | ✅                                        |
| hive-gateway (2.5.6)                           |  122  | 14843 total, 0 failed  | avg: 405ms, p95: 530ms | ✅                                        |
| apollo-gateway (2.13.2)                        |   70  |  8578 total, 0 failed  | avg: 702ms, p95: 815ms | ✅                                        |


<details>
  <summary>Summary for: hive-router (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 616149      ✗ 0     
     data_received..................: 18 GB   150 MB/s
     data_sent......................: 247 MB  2.1 MB/s
     http_req_blocked...............: avg=4.11µs  min=1.13µs  med=1.7µs   max=19.44ms  p(90)=2.69µs  p(95)=3.21µs   p(99.9)=29.57µs
     http_req_connecting............: avg=2.03µs  min=0s      med=0s      max=19.42ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.05ms min=1.96ms  med=27.97ms max=400.17ms p(90)=39.5ms  p(95)=44.17ms  p(99.9)=71.57ms
       { expected_response:true }...: avg=29.05ms min=1.96ms  med=27.97ms max=400.17ms p(90)=39.5ms  p(95)=44.17ms  p(99.9)=71.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 205483
     http_req_receiving.............: avg=68.15µs min=22.43µs med=34.55µs max=30.43ms  p(90)=71.33µs p(95)=206.93µs p(99.9)=2.24ms 
     http_req_sending...............: avg=41.38µs min=5.03µs  med=7.37µs  max=255.56ms p(90)=18.55µs p(95)=95.15µs  p(99.9)=4.06ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=28.94ms min=1.92ms  med=27.88ms max=392.43ms p(90)=39.37ms p(95)=44.01ms  p(99.9)=70.91ms
     http_reqs......................: 205483  1709.016919/s
     iteration_duration.............: avg=29.2ms  min=2.92ms  med=28.1ms  max=419.06ms p(90)=39.64ms p(95)=44.3ms   p(99.9)=71.75ms
     iterations.....................: 205383  1708.185212/s
     success_rate...................: 100.00% ✓ 205383      ✗ 0     
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

     checks.........................: 100.00% ✓ 378096      ✗ 0     
     data_received..................: 11 GB   92 MB/s
     data_sent......................: 152 MB  1.3 MB/s
     http_req_blocked...............: avg=4.36µs  min=1.21µs  med=1.78µs  max=10.65ms  p(90)=2.86µs  p(95)=3.33µs   p(99.9)=39.23µs
     http_req_connecting............: avg=2.13µs  min=0s      med=0s      max=10.62ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=47.41ms min=2.49ms  med=46.81ms max=447.39ms p(90)=56.71ms p(95)=61.46ms  p(99.9)=88.84ms
       { expected_response:true }...: avg=47.41ms min=2.49ms  med=46.81ms max=447.39ms p(90)=56.71ms p(95)=61.46ms  p(99.9)=88.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126132
     http_req_receiving.............: avg=64.12µs min=25.67µs med=43.07µs max=127.4ms  p(90)=71.91µs p(95)=110.17µs p(99.9)=1.53ms 
     http_req_sending...............: avg=31.57µs min=5.24µs  med=8µs     max=225.31ms p(90)=13.61µs p(95)=63.94µs  p(99.9)=2.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=47.31ms min=2.44ms  med=46.72ms max=427.17ms p(90)=56.61ms p(95)=61.34ms  p(99.9)=88.16ms
     http_reqs......................: 126132  1048.227505/s
     iteration_duration.............: avg=47.6ms  min=8.9ms   med=46.96ms max=484.88ms p(90)=56.86ms p(95)=61.61ms  p(99.9)=89.41ms
     iterations.....................: 126032  1047.396449/s
     success_rate...................: 100.00% ✓ 126032      ✗ 0     
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
✗ response code was 200
      ↳  99% — ✓ 103584 / ✗ 21
     ✗ no graphql errors
      ↳  99% — ✓ 103572 / ✗ 33
     ✗ valid response structure
      ↳  99% — ✓ 103604 / ✗ 1

     checks.........................: 99.98% ✓ 310760     ✗ 55    
     data_received..................: 9.1 GB 75 MB/s
     data_sent......................: 125 MB 1.0 MB/s
     http_req_blocked...............: avg=7.5µs   min=1.18µs  med=1.83µs  max=18.54ms  p(90)=2.79µs   p(95)=3.23µs   p(99.9)=48.01µs 
     http_req_connecting............: avg=5.25µs  min=0s      med=0s      max=18.51ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=57.71ms min=3.44ms  med=40.06ms max=560.37ms p(90)=123.77ms p(95)=158.18ms p(99.9)=371.87ms
       { expected_response:true }...: avg=57.7ms  min=3.44ms  med=40.05ms max=560.37ms p(90)=123.76ms p(95)=158.15ms p(99.9)=371.87ms
     http_req_failed................: 0.02%  ✓ 21         ✗ 103684
     http_req_receiving.............: avg=1.58ms  min=14.64µs med=86.18µs max=239.14ms p(90)=2.2ms    p(95)=6.3ms    p(99.9)=112.14ms
     http_req_sending...............: avg=30.98µs min=5.31µs  med=7.94µs  max=294.36ms p(90)=12.4µs   p(95)=31.79µs  p(99.9)=1.69ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=56.09ms min=3.36ms  med=38.8ms  max=560.29ms p(90)=120.4ms  p(95)=154.25ms p(99.9)=364.77ms
     http_reqs......................: 103705 861.127834/s
     iteration_duration.............: avg=57.9ms  min=4.21ms  med=40.22ms max=560.55ms p(90)=123.97ms p(95)=158.36ms p(99.9)=373.02ms
     iterations.....................: 103605 860.297471/s
     success_rate...................: 99.96% ✓ 103571     ✗ 34    
     vus............................: 50     min=50       max=50  
     vus_max........................: 50     min=50       max=50
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
      ↳  99% — ✓ 99748 / ✗ 78
     ✗ no graphql errors
      ↳  99% — ✓ 99742 / ✗ 84
     ✗ valid response structure
      ↳  99% — ✓ 99821 / ✗ 5

     checks.........................: 99.94% ✓ 299311     ✗ 167  
     data_received..................: 8.7 GB 73 MB/s
     data_sent......................: 120 MB 997 kB/s
     http_req_blocked...............: avg=8.72µs  min=1.19µs med=1.89µs  max=18.83ms  p(90)=3.05µs   p(95)=3.59µs   p(99.9)=43.43µs 
     http_req_connecting............: avg=6.4µs   min=0s     med=0s      max=18.78ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=59.88ms min=2.88ms med=38.44ms max=761.4ms  p(90)=134.74ms p(95)=173.06ms p(99.9)=445.06ms
       { expected_response:true }...: avg=59.87ms min=2.88ms med=38.42ms max=761.4ms  p(90)=134.75ms p(95)=173.06ms p(99.9)=443.06ms
     http_req_failed................: 0.07%  ✓ 78         ✗ 99848
     http_req_receiving.............: avg=1.58ms  min=13.6µs med=89.68µs max=311.62ms p(90)=1.97ms   p(95)=5.21ms   p(99.9)=112.52ms
     http_req_sending...............: avg=25.53µs min=5.43µs med=8.28µs  max=74.68ms  p(90)=14.32µs  p(95)=30.57µs  p(99.9)=1.61ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=58.28ms min=2.82ms med=37.14ms max=759.17ms p(90)=131.47ms p(95)=169.46ms p(99.9)=439.79ms
     http_reqs......................: 99926  829.712316/s
     iteration_duration.............: avg=60.1ms  min=3.36ms med=38.63ms max=761.56ms p(90)=134.93ms p(95)=173.33ms p(99.9)=446.4ms 
     iterations.....................: 99826  828.881989/s
     success_rate...................: 99.91% ✓ 99737      ✗ 89   
     vus............................: 50     min=50       max=50 
     vus_max........................: 50     min=50       max=50
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

     checks.........................: 100.00% ✓ 186153     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   620 kB/s
     http_req_blocked...............: avg=10.97µs min=1.26µs med=1.89µs  max=18.22ms  p(90)=2.89µs   p(95)=3.28µs   p(99.9)=88.14µs 
     http_req_connecting............: avg=8.67µs  min=0s     med=0s      max=18.08ms  p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.39ms min=2.66ms med=95.35ms max=458.41ms p(90)=121.48ms p(95)=129.58ms p(99.9)=191.66ms
       { expected_response:true }...: avg=96.39ms min=2.66ms med=95.35ms max=458.41ms p(90)=121.48ms p(95)=129.58ms p(99.9)=191.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62151
     http_req_receiving.............: avg=58.27µs min=25.1µs med=47.93µs max=88.1ms   p(90)=71.18µs  p(95)=83.13µs  p(99.9)=687.11µs
     http_req_sending...............: avg=25.46µs min=5.7µs  med=8.4µs   max=153.89ms p(90)=12.05µs  p(95)=14.51µs  p(99.9)=966.05µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.31ms min=2.6ms  med=95.28ms max=438.66ms p(90)=121.4ms  p(95)=129.5ms  p(99.9)=189.59ms
     http_reqs......................: 62151   516.339496/s
     iteration_duration.............: avg=96.71ms min=6.43ms med=95.52ms max=492.49ms p(90)=121.64ms p(95)=129.74ms p(99.9)=198.2ms 
     iterations.....................: 62051   515.508714/s
     success_rate...................: 100.00% ✓ 62051      ✗ 0    
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

     checks.........................: 100.00% ✓ 83709      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=23.68µs  min=1.26µs  med=1.96µs   max=17.3ms   p(90)=2.89µs   p(95)=3.26µs   p(99.9)=11.83ms 
     http_req_connecting............: avg=21.3µs   min=0s      med=0s       max=17.26ms  p(90)=0s       p(95)=0s       p(99.9)=11.81ms 
     http_req_duration..............: avg=214.21ms min=5.15ms  med=211.16ms max=516.17ms p(90)=249.38ms p(95)=267.23ms p(99.9)=351.31ms
       { expected_response:true }...: avg=214.21ms min=5.15ms  med=211.16ms max=516.17ms p(90)=249.38ms p(95)=267.23ms p(99.9)=351.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28003
     http_req_receiving.............: avg=49.16µs  min=24.53µs med=40.15µs  max=27.93ms  p(90)=66.7µs   p(95)=75.78µs  p(99.9)=590.3µs 
     http_req_sending...............: avg=25.66µs  min=5.74µs  med=8.29µs   max=150.86ms p(90)=11.49µs  p(95)=13.57µs  p(99.9)=1.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.13ms min=5.09ms  med=211.1ms  max=513.19ms p(90)=249.3ms  p(95)=267.07ms p(99.9)=351.27ms
     http_reqs......................: 28003   231.967834/s
     iteration_duration.............: avg=215.14ms min=15.59ms med=211.46ms max=535.12ms p(90)=249.62ms p(95)=267.59ms p(99.9)=360.16ms
     iterations.....................: 27903   231.139466/s
     success_rate...................: 100.00% ✓ 27903      ✗ 0    
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

     checks.........................: 100.00% ✓ 77484      ✗ 0    
     data_received..................: 2.3 GB  19 MB/s
     data_sent......................: 31 MB   258 kB/s
     http_req_blocked...............: avg=18.61µs  min=1.3µs   med=2.02µs   max=15.42ms  p(90)=3.11µs   p(95)=3.58µs   p(99.9)=8.51ms  
     http_req_connecting............: avg=16.23µs  min=0s      med=0s       max=15.36ms  p(90)=0s       p(95)=0s       p(99.9)=8.49ms  
     http_req_duration..............: avg=231.44ms min=6.63ms  med=232.51ms max=501.05ms p(90)=270.18ms p(95)=281.71ms p(99.9)=357.87ms
       { expected_response:true }...: avg=231.44ms min=6.63ms  med=232.51ms max=501.05ms p(90)=270.18ms p(95)=281.71ms p(99.9)=357.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 25928
     http_req_receiving.............: avg=50.81µs  min=24.31µs med=43.71µs  max=1.07ms   p(90)=73.65µs  p(95)=85.41µs  p(99.9)=441.83µs
     http_req_sending...............: avg=36.41µs  min=5.72µs  med=8.97µs   max=186.94ms p(90)=13.8µs   p(95)=16.23µs  p(99.9)=6.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=231.35ms min=6.59ms  med=232.44ms max=497.63ms p(90)=270.12ms p(95)=281.59ms p(99.9)=355.83ms
     http_reqs......................: 25928   214.517357/s
     iteration_duration.............: avg=232.49ms min=15.26ms med=232.77ms max=514.99ms p(90)=270.41ms p(95)=281.9ms  p(99.9)=364.12ms
     iterations.....................: 25828   213.689999/s
     success_rate...................: 100.00% ✓ 25828      ✗ 0    
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

     checks.........................: 100.00% ✓ 44229      ✗ 0    
     data_received..................: 1.3 GB  11 MB/s
     data_sent......................: 18 MB   147 kB/s
     http_req_blocked...............: avg=22.72µs  min=1.24µs   med=2.4µs    max=11.38ms  p(90)=3.46µs   p(95)=3.97µs   p(99.9)=7.99ms  
     http_req_connecting............: avg=19.98µs  min=0s       med=0s       max=11.34ms  p(90)=0s       p(95)=0s       p(99.9)=7.97ms  
     http_req_duration..............: avg=404.73ms min=7.1ms    med=397.49ms max=739.03ms p(90)=492.21ms p(95)=530.09ms p(99.9)=653.71ms
       { expected_response:true }...: avg=404.73ms min=7.1ms    med=397.49ms max=739.03ms p(90)=492.21ms p(95)=530.09ms p(99.9)=653.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 14843
     http_req_receiving.............: avg=58.39µs  min=26.59µs  med=50.45µs  max=4.05ms   p(90)=80.56µs  p(95)=91.59µs  p(99.9)=873.28µs
     http_req_sending...............: avg=45.54µs  min=6.05µs   med=9.98µs   max=196.76ms p(90)=14.91µs  p(95)=17.12µs  p(99.9)=1.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=404.63ms min=7.05ms   med=397.39ms max=738.97ms p(90)=492.1ms  p(95)=530.03ms p(99.9)=653.65ms
     http_reqs......................: 14843   122.422958/s
     iteration_duration.............: avg=407.62ms min=231.64ms med=398.1ms  max=739.19ms p(90)=492.88ms p(95)=530.55ms p(99.9)=657.67ms
     iterations.....................: 14743   121.598172/s
     success_rate...................: 100.00% ✓ 14743      ✗ 0    
     vus............................: 35      min=35       max=50 
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
     data_sent......................: 10 MB   85 kB/s
     http_req_blocked...............: avg=37.4µs   min=1.44µs   med=2.09µs   max=11.03ms  p(90)=3.37µs   p(95)=3.79µs   p(99.9)=9.24ms  
     http_req_connecting............: avg=34.78µs  min=0s       med=0s       max=10.99ms  p(90)=0s       p(95)=0s       p(99.9)=9.22ms  
     http_req_duration..............: avg=702ms    min=11.76ms  med=707.7ms  max=1.12s    p(90)=779.44ms p(95)=814.74ms p(99.9)=957.99ms
       { expected_response:true }...: avg=702ms    min=11.76ms  med=707.7ms  max=1.12s    p(90)=779.44ms p(95)=814.74ms p(99.9)=957.99ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 8578
     http_req_receiving.............: avg=52.29µs  min=30.48µs  med=42.61µs  max=5.61ms   p(90)=78.05µs  p(95)=90.4µs   p(99.9)=228.7µs 
     http_req_sending...............: avg=60.21µs  min=6.45µs   med=8.97µs   max=112.64ms p(90)=15.27µs  p(95)=17.54µs  p(99.9)=3.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=701.89ms min=11.71ms  med=707.6ms  max=1.12s    p(90)=779.38ms p(95)=814.69ms p(99.9)=957.94ms
     http_reqs......................: 8578    70.388696/s
     iteration_duration.............: avg=710.39ms min=385.83ms med=708.79ms max=1.12s    p(90)=779.83ms p(95)=815.2ms  p(99.9)=962.18ms
     iterations.....................: 8478    69.568124/s
     success_rate...................: 100.00% ✓ 8478      ✗ 0   
     vus............................: 50      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

