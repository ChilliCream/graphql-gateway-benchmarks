## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 3,014 | 3,176 | 2,934 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,113 | 2,164 | 2,100 | 1.0% |  |
| grafbase | 0.53.3 | 2,071 | 2,113 | 2,024 | 1.6% |  |
| cosmo | 0.307.0 | 1,287 | 1,294 | 1,272 | 0.8% | non-compatible response (8 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 535 | 546 | 524 | 1.2% |  |
| apollo-router | v2.13.1 | 432 | 441 | 428 | 1.0% |  |
| hive-gateway | 2.5.25 | 251 | 255 | 249 | 0.9% |  |
| apollo-gateway | 2.13.3 | 247 | 248 | 245 | 0.4% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,380 | 2,511 | 2,336 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,932 | 1,983 | 1,916 | 1.1% |  |
| grafbase | 0.53.3 | 1,559 | 1,574 | 1,541 | 0.7% |  |
| cosmo | 0.307.0 | 1,177 | 1,199 | 1,169 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 522 | 536 | 517 | 1.1% |  |
| hive-gateway | 2.5.25 | 244 | 249 | 242 | 0.9% |  |
| apollo-gateway | 2.13.3 | 233 | 236 | 232 | 0.6% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1086894     ✗ 0     
     data_received..................: 32 GB   264 MB/s
     data_sent......................: 436 MB  3.6 MB/s
     http_req_blocked...............: avg=3.18µs   min=1.04µs  med=2.35µs  max=25.88ms  p(90)=3.59µs   p(95)=4.24µs   p(99.9)=34.46µs
     http_req_connecting............: avg=275ns    min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.31ms  min=1.64ms  med=15.35ms max=323.46ms p(90)=24.14ms  p(95)=28.07ms  p(99.9)=52.19ms
       { expected_response:true }...: avg=16.31ms  min=1.64ms  med=15.35ms max=323.46ms p(90)=24.14ms  p(95)=28.07ms  p(99.9)=52.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 362398
     http_req_receiving.............: avg=147.74µs min=28.39µs med=51.52µs max=49.85ms  p(90)=105.66µs p(95)=292.94µs p(99.9)=14.94ms
     http_req_sending...............: avg=60.87µs  min=5.09µs  med=9.56µs  max=152.7ms  p(90)=16.84µs  p(95)=125.22µs p(99.9)=9.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.11ms  min=1.59ms  med=15.19ms max=322.82ms p(90)=23.83ms  p(95)=27.6ms   p(99.9)=50.42ms
     http_reqs......................: 362398  3014.94211/s
     iteration_duration.............: avg=16.55ms  min=2.2ms   med=15.56ms max=338.79ms p(90)=24.36ms  p(95)=28.33ms  p(99.9)=53.68ms
     iterations.....................: 362298  3014.110168/s
     success_rate...................: 100.00% ✓ 362298      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 762369      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=2.75µs   min=992ns   med=2.24µs   max=2.68ms   p(90)=3.36µs   p(95)=3.93µs   p(99.9)=35.4µs  
     http_req_connecting............: avg=182ns    min=0s      med=0s       max=2.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.37ms  min=2.41ms  med=14.77ms  max=322.75ms p(90)=52.61ms  p(95)=71ms     p(99.9)=169.74ms
       { expected_response:true }...: avg=23.37ms  min=2.41ms  med=14.77ms  max=322.75ms p(90)=52.61ms  p(95)=71ms     p(99.9)=169.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 254223
     http_req_receiving.............: avg=685.92µs min=52.74µs med=108.28µs max=272.46ms p(90)=972.06µs p(95)=1.52ms   p(99.9)=61.85ms 
     http_req_sending...............: avg=44.92µs  min=5.25µs  med=9.46µs   max=184.54ms p(90)=15.55µs  p(95)=108.42µs p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.63ms  min=2.31ms  med=14.23ms  max=322.54ms p(90)=51.13ms  p(95)=69.47ms  p(99.9)=166.83ms
     http_reqs......................: 254223  2113.565631/s
     iteration_duration.............: avg=23.6ms   min=3.13ms  med=14.98ms  max=344.89ms p(90)=52.86ms  p(95)=71.23ms  p(99.9)=170.79ms
     iterations.....................: 254123  2112.734248/s
     success_rate...................: 100.00% ✓ 254123      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 747114      ✗ 0     
     data_received..................: 22 GB   182 MB/s
     data_sent......................: 299 MB  2.5 MB/s
     http_req_blocked...............: avg=3.37µs   min=1µs     med=2.39µs  max=14.27ms  p(90)=3.83µs   p(95)=4.57µs   p(99.9)=41.57µs
     http_req_connecting............: avg=398ns    min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.85ms  min=1.85ms  med=23.6ms  max=336.56ms p(90)=28.57ms  p(95)=30.72ms  p(99.9)=52.89ms
       { expected_response:true }...: avg=23.85ms  min=1.85ms  med=23.6ms  max=336.56ms p(90)=28.57ms  p(95)=30.72ms  p(99.9)=52.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 249138
     http_req_receiving.............: avg=127.15µs min=29.78µs med=58.09µs max=213.38ms p(90)=100.69µs p(95)=202.39µs p(99.9)=9.49ms 
     http_req_sending...............: avg=43.24µs  min=5.25µs  med=10.14µs max=75.08ms  p(90)=17.37µs  p(95)=116.68µs p(99.9)=2.76ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.68ms  min=1.8ms   med=23.49ms max=122.96ms p(90)=28.4ms   p(95)=30.49ms  p(99.9)=51.04ms
     http_reqs......................: 249138  2071.856598/s
     iteration_duration.............: avg=24.08ms  min=3.26ms  med=23.81ms max=380.23ms p(90)=28.79ms  p(95)=30.96ms  p(99.9)=53.57ms
     iterations.....................: 249038  2071.024988/s
     success_rate...................: 100.00% ✓ 249038      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 464205      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=2.93µs  min=1.02µs  med=2.26µs  max=4.39ms   p(90)=3.49µs  p(95)=4.07µs   p(99.9)=33.31µs
     http_req_connecting............: avg=349ns   min=0s      med=0s      max=2.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.54ms min=2.04ms  med=37.98ms max=305.97ms p(90)=54.5ms  p(95)=59.4ms   p(99.9)=82.96ms
       { expected_response:true }...: avg=38.54ms min=2.04ms  med=37.98ms max=305.97ms p(90)=54.5ms  p(95)=59.4ms   p(99.9)=82.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154835
     http_req_receiving.............: avg=76.4µs  min=27.57µs med=59.79µs max=141.77ms p(90)=94.64µs p(95)=112.02µs p(99.9)=1.49ms 
     http_req_sending...............: avg=26.94µs min=5.37µs  med=10.4µs  max=233.42ms p(90)=15.58µs p(95)=19.52µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.43ms min=1.99ms  med=37.89ms max=305.48ms p(90)=54.39ms p(95)=59.29ms  p(99.9)=82.57ms
     http_reqs......................: 154835  1287.343785/s
     iteration_duration.............: avg=38.77ms min=3.96ms  med=38.18ms max=347.88ms p(90)=54.7ms  p(95)=59.6ms   p(99.9)=83.63ms
     iterations.....................: 154735  1286.512355/s
     success_rate...................: 100.00% ✓ 154735      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 193242     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   643 kB/s
     http_req_blocked...............: avg=5.13µs  min=1.1µs   med=3.01µs  max=4.71ms   p(90)=4.55µs   p(95)=5.15µs   p(99.9)=49.94µs 
     http_req_connecting............: avg=1.83µs  min=0s      med=0s      max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.7ms  min=4.17ms  med=90.38ms max=258.15ms p(90)=113.54ms p(95)=125.28ms p(99.9)=217.86ms
       { expected_response:true }...: avg=92.7ms  min=4.17ms  med=90.38ms max=258.15ms p(90)=113.54ms p(95)=125.28ms p(99.9)=217.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64514
     http_req_receiving.............: avg=88.34µs min=32.15µs med=78.54µs max=40.38ms  p(90)=113.14µs p(95)=126.06µs p(99.9)=967.63µs
     http_req_sending...............: avg=20.98µs min=5.63µs  med=14.09µs max=48.83ms  p(90)=20.93µs  p(95)=23.2µs   p(99.9)=679.41µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.59ms min=4.06ms  med=90.28ms max=258.07ms p(90)=113.41ms p(95)=125.18ms p(99.9)=217.77ms
     http_reqs......................: 64514   535.20054/s
     iteration_duration.............: avg=93.15ms min=20.56ms med=90.63ms max=395.73ms p(90)=113.87ms p(95)=125.78ms p(99.9)=221.64ms
     iterations.....................: 64414   534.370951/s
     success_rate...................: 100.00% ✓ 64414      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 156219     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   519 kB/s
     http_req_blocked...............: avg=5.56µs   min=1.22µs  med=3.39µs   max=4.77ms   p(90)=4.78µs   p(95)=5.35µs   p(99.9)=158.56µs
     http_req_connecting............: avg=1.97µs   min=0s      med=0s       max=4.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.77ms min=5.45ms  med=114.42ms max=338.87ms p(90)=138.77ms p(95)=145.79ms p(99.9)=179.72ms
       { expected_response:true }...: avg=114.77ms min=5.45ms  med=114.42ms max=338.87ms p(90)=138.77ms p(95)=145.79ms p(99.9)=179.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52173
     http_req_receiving.............: avg=92.18µs  min=31.98µs med=84.7µs   max=81.64ms  p(90)=116.17µs p(95)=128.3µs  p(99.9)=871.14µs
     http_req_sending...............: avg=32.27µs  min=6.07µs  med=16.54µs  max=190.56ms p(90)=21.71µs  p(95)=23.45µs  p(99.9)=635.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.64ms min=5.33ms  med=114.3ms  max=335.12ms p(90)=138.64ms p(95)=145.66ms p(99.9)=179.57ms
     http_reqs......................: 52173   432.253924/s
     iteration_duration.............: avg=115.25ms min=16.48ms med=114.7ms  max=360.13ms p(90)=139.04ms p(95)=146.08ms p(99.9)=183.03ms
     iterations.....................: 52073   431.425422/s
     success_rate...................: 100.00% ✓ 52073      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90945     ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   302 kB/s
     http_req_blocked...............: avg=6.88µs   min=1.23µs  med=3.49µs   max=4.05ms   p(90)=4.93µs   p(95)=5.56µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=3.19µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=197.12ms min=6.08ms  med=214.69ms max=692.28ms p(90)=289.23ms p(95)=382.92ms p(99.9)=591.7ms 
       { expected_response:true }...: avg=197.12ms min=6.08ms  med=214.69ms max=692.28ms p(90)=289.23ms p(95)=382.92ms p(99.9)=591.7ms 
     http_req_failed................: 0.00%   ✓ 0         ✗ 30415
     http_req_receiving.............: avg=102.69µs min=32.01µs med=95.01µs  max=88.06ms  p(90)=127.82µs p(95)=140.88µs p(99.9)=548.43µs
     http_req_sending...............: avg=30.08µs  min=5.92µs  med=17.71µs  max=95.36ms  p(90)=22.81µs  p(95)=24.67µs  p(99.9)=530.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.99ms min=5.96ms  med=214.48ms max=692.12ms p(90)=289.09ms p(95)=382.8ms  p(99.9)=591.58ms
     http_reqs......................: 30415   251.34947/s
     iteration_duration.............: avg=198.04ms min=38.11ms med=215.95ms max=692.58ms p(90)=289.83ms p(95)=383.73ms p(99.9)=592.01ms
     iterations.....................: 30315   250.52307/s
     success_rate...................: 100.00% ✓ 30315     ✗ 0    
     vus............................: 5       min=5       max=50 
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89760      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   298 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.24µs  med=3.24µs   max=3.85ms   p(90)=4.51µs   p(95)=5.01µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.3µs    min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=199.69ms min=8.39ms  med=193.53ms max=419.89ms p(90)=218.36ms p(95)=224.95ms p(99.9)=288.54ms
       { expected_response:true }...: avg=199.69ms min=8.39ms  med=193.53ms max=419.89ms p(90)=218.36ms p(95)=224.95ms p(99.9)=288.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30020
     http_req_receiving.............: avg=105.03µs min=35.83µs med=88.8µs   max=196.47ms p(90)=121.49µs p(95)=134.57µs p(99.9)=650.78µs
     http_req_sending...............: avg=31.36µs  min=6µs     med=16.49µs  max=166.96ms p(90)=21.36µs  p(95)=23.08µs  p(99.9)=577.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.55ms min=8.25ms  med=193.42ms max=419.74ms p(90)=218.25ms p(95)=224.8ms  p(99.9)=287.92ms
     http_reqs......................: 30020   247.976736/s
     iteration_duration.............: avg=200.65ms min=49.7ms  med=193.79ms max=431.5ms  p(90)=218.62ms p(95)=225.25ms p(99.9)=294.28ms
     iterations.....................: 29920   247.150698/s
     success_rate...................: 100.00% ✓ 29920      ✗ 0    
     vus............................: 31      min=31       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 858261      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.23µs   min=1µs     med=2.37µs  max=16.86ms  p(90)=3.84µs   p(95)=4.64µs   p(99.9)=36.19µs
     http_req_connecting............: avg=340ns    min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.73ms  min=1.72ms  med=20.26ms max=331.05ms p(90)=28.71ms  p(95)=31.81ms  p(99.9)=54.12ms
       { expected_response:true }...: avg=20.73ms  min=1.72ms  med=20.26ms max=331.05ms p(90)=28.71ms  p(95)=31.81ms  p(99.9)=54.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286187
     http_req_receiving.............: avg=118.55µs min=28.01µs med=56.13µs max=221.97ms p(90)=106.11µs p(95)=266.57µs p(99.9)=8.93ms 
     http_req_sending...............: avg=53.52µs  min=5.12µs  med=10.12µs max=46ms     p(90)=18.75µs  p(95)=127.14µs p(99.9)=5.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.55ms  min=1.65ms  med=20.12ms max=330.57ms p(90)=28.51ms  p(95)=31.52ms  p(99.9)=53.1ms 
     http_reqs......................: 286187  2380.419421/s
     iteration_duration.............: avg=20.96ms  min=2.95ms  med=20.47ms max=339.55ms p(90)=28.94ms  p(95)=32.05ms  p(99.9)=54.95ms
     iterations.....................: 286087  2379.587651/s
     success_rate...................: 100.00% ✓ 286087      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 696771      ✗ 0     
     data_received..................: 20 GB   169 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=3.44µs   min=1.02µs  med=2.55µs   max=4.63ms   p(90)=3.94µs  p(95)=4.65µs   p(99.9)=37.23µs 
     http_req_connecting............: avg=482ns    min=0s      med=0s       max=3.89ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.58ms  min=1.93ms  med=17.4ms   max=559.88ms p(90)=54.27ms p(95)=71.76ms  p(99.9)=196.35ms
       { expected_response:true }...: avg=25.58ms  min=1.93ms  med=17.4ms   max=559.88ms p(90)=54.27ms p(95)=71.76ms  p(99.9)=196.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232357
     http_req_receiving.............: avg=710.22µs min=52.94µs med=111.34µs max=209.78ms p(90)=1.13ms  p(95)=1.82ms   p(99.9)=59.18ms 
     http_req_sending...............: avg=44µs     min=5.33µs  med=10.3µs   max=126.43ms p(90)=18.26µs p(95)=110.36µs p(99.9)=2.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.83ms  min=1.77ms  med=16.84ms  max=559.13ms p(90)=52.87ms p(95)=70.14ms  p(99.9)=193.08ms
     http_reqs......................: 232357  1932.268104/s
     iteration_duration.............: avg=25.82ms  min=2.64ms  med=17.62ms  max=560.12ms p(90)=54.51ms p(95)=72ms     p(99.9)=200.4ms 
     iterations.....................: 232257  1931.43651/s
     success_rate...................: 100.00% ✓ 232257      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 562599      ✗ 0     
     data_received..................: 16 GB   137 MB/s
     data_sent......................: 225 MB  1.9 MB/s
     http_req_blocked...............: avg=3.56µs   min=972ns   med=2.35µs  max=12.01ms  p(90)=4.67µs   p(95)=5.82µs   p(99.9)=46.41µs
     http_req_connecting............: avg=544ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.72ms  min=2.26ms  med=30.78ms max=308.84ms p(90)=42.2ms   p(95)=46.89ms  p(99.9)=86.52ms
       { expected_response:true }...: avg=31.72ms  min=2.26ms  med=30.78ms max=308.84ms p(90)=42.2ms   p(95)=46.89ms  p(99.9)=86.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 187633
     http_req_receiving.............: avg=128.98µs min=31.28µs med=61.22µs max=237.08ms p(90)=133.72µs p(95)=275.92µs p(99.9)=5.91ms 
     http_req_sending...............: avg=45.27µs  min=5.45µs  med=10.48µs max=96.75ms  p(90)=24.51µs  p(95)=134.28µs p(99.9)=3.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.54ms  min=2.15ms  med=30.65ms max=219.9ms  p(90)=42.01ms  p(95)=46.66ms  p(99.9)=85.48ms
     http_reqs......................: 187633  1559.663272/s
     iteration_duration.............: avg=31.98ms  min=3.83ms  med=31.02ms max=350.41ms p(90)=42.45ms  p(95)=47.13ms  p(99.9)=87.49ms
     iterations.....................: 187533  1558.832041/s
     success_rate...................: 100.00% ✓ 187533      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 424755      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.28µs  min=1.03µs  med=2.64µs  max=2.29ms   p(90)=4.12µs   p(95)=4.79µs   p(99.9)=40.22µs
     http_req_connecting............: avg=303ns   min=0s      med=0s      max=2.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.11ms min=2.21ms  med=41.55ms max=317.62ms p(90)=59.25ms  p(95)=64.7ms   p(99.9)=90.22ms
       { expected_response:true }...: avg=42.11ms min=2.21ms  med=41.55ms max=317.62ms p(90)=59.25ms  p(95)=64.7ms   p(99.9)=90.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141685
     http_req_receiving.............: avg=88.3µs  min=29.22µs med=67.52µs max=99.62ms  p(90)=105.79µs p(95)=124.43µs p(99.9)=1.88ms 
     http_req_sending...............: avg=27.06µs min=5.39µs  med=11.57µs max=95.43ms  p(90)=17.99µs  p(95)=21.95µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42ms    min=2.1ms   med=41.44ms max=317.47ms p(90)=59.14ms  p(95)=64.58ms  p(99.9)=89.9ms 
     http_reqs......................: 141685  1177.875113/s
     iteration_duration.............: avg=42.36ms min=4.3ms   med=41.77ms max=336.56ms p(90)=59.46ms  p(95)=64.93ms  p(99.9)=90.93ms
     iterations.....................: 141585  1177.043779/s
     success_rate...................: 100.00% ✓ 141585      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 188838     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   628 kB/s
     http_req_blocked...............: avg=5.11µs  min=1.07µs  med=3.24µs  max=3.89ms   p(90)=4.79µs   p(95)=5.42µs   p(99.9)=67.13µs 
     http_req_connecting............: avg=1.58µs  min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.92ms min=4.42ms  med=93.8ms  max=361.21ms p(90)=119.53ms p(95)=133.02ms p(99.9)=226.05ms
       { expected_response:true }...: avg=94.92ms min=4.42ms  med=93.8ms  max=361.21ms p(90)=119.53ms p(95)=133.02ms p(99.9)=226.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63046
     http_req_receiving.............: avg=93.64µs min=31.14µs med=83.53µs max=134.55ms p(90)=117.02µs p(95)=130.22µs p(99.9)=953.98µs
     http_req_sending...............: avg=24.76µs min=5.3µs   med=15.21µs max=81.44ms  p(90)=21.7µs   p(95)=23.83µs  p(99.9)=755.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.81ms min=4.29ms  med=93.68ms max=360.22ms p(90)=119.4ms  p(95)=132.86ms p(99.9)=225.61ms
     http_reqs......................: 63046   522.676654/s
     iteration_duration.............: avg=95.33ms min=16.28ms med=94.06ms max=378.97ms p(90)=119.82ms p(95)=133.32ms p(99.9)=229.75ms
     iterations.....................: 62946   521.847614/s
     success_rate...................: 100.00% ✓ 62946      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 88419      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=5.18µs   min=1.22µs  med=3.53µs   max=2.22ms   p(90)=4.95µs   p(95)=5.54µs   p(99.9)=637.67µs
     http_req_connecting............: avg=1.42µs   min=0s      med=0s       max=2.06ms   p(90)=0s       p(95)=0s       p(99.9)=613.05µs
     http_req_duration..............: avg=202.75ms min=6.33ms  med=185.88ms max=607.34ms p(90)=241.92ms p(95)=400.06ms p(99.9)=526.74ms
       { expected_response:true }...: avg=202.75ms min=6.33ms  med=185.88ms max=607.34ms p(90)=241.92ms p(95)=400.06ms p(99.9)=526.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29573
     http_req_receiving.............: avg=102.04µs min=35.95µs med=97.17µs  max=16.48ms  p(90)=128.5µs  p(95)=141.59µs p(99.9)=802.24µs
     http_req_sending...............: avg=29.5µs   min=6.3µs   med=18.15µs  max=121.26ms p(90)=22.92µs  p(95)=24.61µs  p(99.9)=613.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.62ms min=6.2ms   med=185.76ms max=606.43ms p(90)=241.81ms p(95)=399.85ms p(99.9)=526.35ms
     http_reqs......................: 29573   244.422878/s
     iteration_duration.............: avg=203.71ms min=49.45ms med=186.23ms max=607.73ms p(90)=242.51ms p(95)=400.83ms p(99.9)=526.94ms
     iterations.....................: 29473   243.596371/s
     success_rate...................: 100.00% ✓ 29473      ✗ 0    
     vus............................: 7       min=7        max=50 
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

     checks.........................: 100.00% ✓ 84672      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=7.34µs   min=1.28µs  med=3.44µs   max=4.1ms    p(90)=4.79µs   p(95)=5.33µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=3.71µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=211.69ms min=8.71ms  med=213.83ms max=447.5ms  p(90)=227.69ms p(95)=236.34ms p(99.9)=312.41ms
       { expected_response:true }...: avg=211.69ms min=8.71ms  med=213.83ms max=447.5ms  p(90)=227.69ms p(95)=236.34ms p(99.9)=312.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28324
     http_req_receiving.............: avg=104.7µs  min=34.92µs med=94.31µs  max=127.54ms p(90)=125.71µs p(95)=138.79µs p(99.9)=570.11µs
     http_req_sending...............: avg=28.06µs  min=6.32µs  med=17.68µs  max=118.19ms p(90)=22.39µs  p(95)=24.16µs  p(99.9)=496.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.55ms min=8.55ms  med=213.72ms max=447.21ms p(90)=227.57ms p(95)=236.19ms p(99.9)=312ms   
     http_reqs......................: 28324   233.876755/s
     iteration_duration.............: avg=212.72ms min=46.24ms med=214.25ms max=460.5ms  p(90)=227.99ms p(95)=236.7ms  p(99.9)=329.76ms
     iterations.....................: 28224   233.051036/s
     success_rate...................: 100.00% ✓ 28224      ✗ 0    
     vus............................: 39      min=39       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

