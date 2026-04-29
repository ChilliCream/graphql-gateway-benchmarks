## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 1,583 | 1,607 | 1,570 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,458 | 1,475 | 1,446 | 0.6% |  |
| cosmo | 0.307.0 | 1,130 | 1,148 | 1,121 | 0.9% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.3 | 1,130 | 1,147 | 1,118 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 493 | 506 | 490 | 1.2% |  |
| apollo-router | v2.13.1 | 397 | 406 | 394 | 1.0% |  |
| hive-gateway | 2.5.25 | 241 | 245 | 238 | 1.0% |  |
| apollo-gateway | 2.13.3 | 232 | 233 | 230 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579111      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.56µs  min=992ns   med=2.54µs  max=4.64ms   p(90)=4.39µs   p(95)=5.38µs   p(99.9)=39.61µs
     http_req_connecting............: avg=546ns   min=0s      med=0s      max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.83ms min=14.16ms med=30.55ms max=321.34ms p(90)=36.69ms  p(95)=38.7ms   p(99.9)=56.85ms
       { expected_response:true }...: avg=30.83ms min=14.16ms med=30.55ms max=321.34ms p(90)=36.69ms  p(95)=38.7ms   p(99.9)=56.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193137
     http_req_receiving.............: avg=87.56µs min=27.07µs med=54.72µs max=139.93ms p(90)=105.88µs p(95)=155.53µs p(99.9)=2.48ms 
     http_req_sending...............: avg=37.34µs min=5.12µs  med=10µs    max=295.44ms p(90)=20.4µs   p(95)=47.82µs  p(99.9)=1.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.7ms  min=14.09ms med=30.44ms max=321.19ms p(90)=36.56ms  p(95)=38.56ms  p(99.9)=55.38ms
     http_reqs......................: 193137  1583.216301/s
     iteration_duration.............: avg=31.07ms min=14.34ms med=30.77ms max=345.89ms p(90)=36.91ms  p(95)=38.92ms  p(99.9)=57.24ms
     iterations.....................: 193037  1582.396564/s
     success_rate...................: 100.00% ✓ 193037      ✗ 0     
     vus............................: 13      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 533541      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.02µs  med=2.42µs   max=4.47ms   p(90)=4.15µs  p(95)=5.05µs   p(99.9)=31.82µs
     http_req_connecting............: avg=567ns   min=0s      med=0s       max=4.42ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.47ms min=14.28ms med=32.35ms  max=486.5ms  p(90)=40.99ms p(95)=44.57ms  p(99.9)=85.49ms
       { expected_response:true }...: avg=33.47ms min=14.28ms med=32.35ms  max=486.5ms  p(90)=40.99ms p(95)=44.57ms  p(99.9)=85.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177947
     http_req_receiving.............: avg=759.7µs min=51.75µs med=116.93µs max=38.08ms  p(90)=2.18ms  p(95)=3.27ms   p(99.9)=17.34ms
     http_req_sending...............: avg=37.5µs  min=5.03µs  med=9.7µs    max=247.25ms p(90)=20.47µs p(95)=108.88µs p(99.9)=2.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.68ms min=14.19ms med=31.58ms  max=486.4ms  p(90)=39.95ms p(95)=43.44ms  p(99.9)=83.78ms
     http_reqs......................: 177947  1458.158834/s
     iteration_duration.............: avg=33.72ms min=14.46ms med=32.58ms  max=486.69ms p(90)=41.22ms p(95)=44.8ms   p(99.9)=86.77ms
     iterations.....................: 177847  1457.3394/s
     success_rate...................: 100.00% ✓ 177847      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413742      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=4.02µs  min=1.13µs  med=2.63µs  max=30.83ms  p(90)=4.27µs   p(95)=5.03µs   p(99.9)=37.46µs
     http_req_connecting............: avg=803ns   min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.26ms min=19.08ms med=42.67ms max=341.14ms p(90)=52.63ms  p(95)=55.79ms  p(99.9)=73.32ms
       { expected_response:true }...: avg=43.26ms min=19.08ms med=42.67ms max=341.14ms p(90)=52.63ms  p(95)=55.79ms  p(99.9)=73.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138014
     http_req_receiving.............: avg=89.08µs min=29.17µs med=65.76µs max=139.01ms p(90)=109.99µs p(95)=135.71µs p(99.9)=1.96ms 
     http_req_sending...............: avg=28.52µs min=5.3µs   med=11.11µs max=238.44ms p(90)=18.77µs  p(95)=23.71µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.14ms min=18.98ms med=42.56ms max=340.48ms p(90)=52.51ms  p(95)=55.66ms  p(99.9)=72.59ms
     http_reqs......................: 138014  1130.965433/s
     iteration_duration.............: avg=43.5ms  min=20.28ms med=42.89ms max=362.74ms p(90)=52.84ms  p(95)=56ms     p(99.9)=73.67ms
     iterations.....................: 137914  1130.145976/s
     success_rate...................: 100.00% ✓ 137914      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413598      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.9µs   min=1.02µs  med=2.52µs  max=4.07ms   p(90)=4.96µs   p(95)=6.12µs   p(99.9)=44.09µs
     http_req_connecting............: avg=753ns   min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.23ms min=15.39ms med=42.72ms max=344.73ms p(90)=52.48ms  p(95)=55.7ms   p(99.9)=77.81ms
       { expected_response:true }...: avg=43.23ms min=15.39ms med=42.72ms max=344.73ms p(90)=52.48ms  p(95)=55.7ms   p(99.9)=77.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137966
     http_req_receiving.............: avg=97.44µs min=29.5µs  med=62.55µs max=30.13ms  p(90)=132.23µs p(95)=193.52µs p(99.9)=2.99ms 
     http_req_sending...............: avg=41.29µs min=5.3µs   med=10.57µs max=178.56ms p(90)=24.59µs  p(95)=104.17µs p(99.9)=2.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.09ms min=15.25ms med=42.59ms max=344.27ms p(90)=52.34ms  p(95)=55.54ms  p(99.9)=77.31ms
     http_reqs......................: 137966  1130.777591/s
     iteration_duration.............: avg=43.51ms min=17.56ms med=42.97ms max=360.62ms p(90)=52.71ms  p(95)=55.94ms  p(99.9)=78.46ms
     iterations.....................: 137866  1129.957985/s
     success_rate...................: 100.00% ✓ 137866      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 180747     ✗ 0    
     data_received..................: 5.3 GB  43 MB/s
     data_sent......................: 73 MB   592 kB/s
     http_req_blocked...............: avg=5.2µs   min=1.26µs  med=3.18µs  max=4.17ms   p(90)=4.75µs   p(95)=5.38µs   p(99.9)=64.2µs  
     http_req_connecting............: avg=1.74µs  min=0s      med=0s      max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.22ms min=22.19ms med=96.67ms max=380.66ms p(90)=120.48ms p(95)=131.11ms p(99.9)=225.96ms
       { expected_response:true }...: avg=99.22ms min=22.19ms med=96.67ms max=380.66ms p(90)=120.48ms p(95)=131.11ms p(99.9)=225.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60349
     http_req_receiving.............: avg=87.47µs min=33.02µs med=79.45µs max=37.35ms  p(90)=114.45µs p(95)=127.46µs p(99.9)=827.41µs
     http_req_sending...............: avg=22.58µs min=5.9µs   med=14.34µs max=79.88ms  p(90)=21.12µs  p(95)=23.52µs  p(99.9)=621.62µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.11ms min=22.09ms med=96.56ms max=380ms    p(90)=120.37ms p(95)=130.98ms p(99.9)=225.85ms
     http_reqs......................: 60349   493.104113/s
     iteration_duration.............: avg=99.59ms min=26.76ms med=96.93ms max=389.51ms p(90)=120.74ms p(95)=131.43ms p(99.9)=227.94ms
     iterations.....................: 60249   492.287026/s
     success_rate...................: 100.00% ✓ 60249      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 145737     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 58 MB   477 kB/s
     http_req_blocked...............: avg=5.93µs   min=1.21µs  med=3.62µs   max=3.95ms   p(90)=5.2µs    p(95)=5.84µs   p(99.9)=219.64µs
     http_req_connecting............: avg=2.04µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=93.25µs 
     http_req_duration..............: avg=123.04ms min=21.38ms med=121.18ms max=374.15ms p(90)=152.99ms p(95)=163.21ms p(99.9)=210.5ms 
       { expected_response:true }...: avg=123.04ms min=21.38ms med=121.18ms max=374.15ms p(90)=152.99ms p(95)=163.21ms p(99.9)=210.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48679
     http_req_receiving.............: avg=94.68µs  min=32.38µs med=86.69µs  max=86.35ms  p(90)=119.77µs p(95)=133.26µs p(99.9)=820.14µs
     http_req_sending...............: avg=33.04µs  min=6.1µs   med=17.08µs  max=196.27ms p(90)=22.84µs  p(95)=25.01µs  p(99.9)=732.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.91ms min=21.27ms med=121.06ms max=373.55ms p(90)=152.87ms p(95)=163.09ms p(99.9)=209.75ms
     http_reqs......................: 48679   397.473498/s
     iteration_duration.............: avg=123.54ms min=44.53ms med=121.49ms max=407.9ms  p(90)=153.32ms p(95)=163.53ms p(99.9)=214.1ms 
     iterations.....................: 48579   396.656979/s
     success_rate...................: 100.00% ✓ 48579      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88263      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.4µs    min=1.17µs  med=3.72µs   max=4.08ms   p(90)=5.25µs   p(95)=5.89µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.47µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=203.11ms min=18.95ms med=182.41ms max=681.8ms  p(90)=283.75ms p(95)=382.73ms p(99.9)=592.7ms 
       { expected_response:true }...: avg=203.11ms min=18.95ms med=182.41ms max=681.8ms  p(90)=283.75ms p(95)=382.73ms p(99.9)=592.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29521
     http_req_receiving.............: avg=188.3µs  min=34.91µs med=96.29µs  max=185.59ms p(90)=129.1µs  p(95)=143.12µs p(99.9)=1.49ms  
     http_req_sending...............: avg=21.63µs  min=6.32µs  med=18.15µs  max=6.26ms   p(90)=23.33µs  p(95)=25.14µs  p(99.9)=528.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.9ms  min=18.78ms med=182.27ms max=681.68ms p(90)=283.42ms p(95)=382.59ms p(99.9)=592.61ms
     http_reqs......................: 29521   241.493464/s
     iteration_duration.............: avg=204.04ms min=34.06ms med=182.92ms max=681.97ms p(90)=284.45ms p(95)=383.55ms p(99.9)=593.03ms
     iterations.....................: 29421   240.675424/s
     success_rate...................: 100.00% ✓ 29421      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85359      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.22µs   min=1.18µs  med=3.38µs   max=4.29ms   p(90)=4.76µs   p(95)=5.35µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.67µs   min=0s      med=0s       max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=210.03ms min=22.3ms  med=218.16ms max=427.89ms p(90)=240.75ms p(95)=247.34ms p(99.9)=314.58ms
       { expected_response:true }...: avg=210.03ms min=22.3ms  med=218.16ms max=427.89ms p(90)=240.75ms p(95)=247.34ms p(99.9)=314.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28553
     http_req_receiving.............: avg=102.61µs min=31.99µs med=90.58µs  max=150.21ms p(90)=123.56µs p(95)=136.31µs p(99.9)=662.18µs
     http_req_sending...............: avg=56.83µs  min=6.49µs  med=17.29µs  max=164.87ms p(90)=22.54µs  p(95)=24.65µs  p(99.9)=804.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.87ms min=22.12ms med=218.03ms max=427.1ms  p(90)=240.62ms p(95)=247.21ms p(99.9)=313.66ms
     http_reqs......................: 28553   232.344834/s
     iteration_duration.............: avg=210.98ms min=43.15ms med=218.44ms max=450.2ms  p(90)=241.05ms p(95)=247.69ms p(99.9)=321.69ms
     iterations.....................: 28453   231.531102/s
     success_rate...................: 100.00% ✓ 28453      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

