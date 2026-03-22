## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,686 | 2,768 | 2,614 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.0 | 1,660 | 1,660 | 1,649 | 0.5% | non-compatible response (3560821 across 7/9 runs) |
| cosmo | 0.291.0 | 1,193 | 1,193 | 1,193 | 0.0% | non-compatible response (34 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 479 | 488 | 476 | 0.9% |  |
| hive-gateway | 2.5.6 | 243 | 246 | 241 | 0.7% |  |
| apollo-gateway | 2.13.2 | 209 | 215 | 204 | 1.6% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (28824 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (484591 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,260 | 2,338 | 2,223 | 1.7% |  |
| hotchocolate | 16.0.0-rc.1.0 | 1,573 | 1,574 | 1,537 | 1.2% | non-compatible response (2478301 across 5/9 runs) |
| cosmo | 0.291.0 | 1,106 | 1,106 | 1,101 | 0.3% | non-compatible response (14 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 448 | 456 | 443 | 1.1% |  |
| hive-gateway | 2.5.6 | 233 | 234 | 229 | 0.8% |  |
| apollo-gateway | 2.13.2 | 204 | 207 | 203 | 0.6% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (29057 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (264324 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 494784      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=29.52µs  min=1.02µs  med=2.48µs  max=62.95ms  p(90)=4.04µs   p(95)=5.2µs    p(99.9)=5.83ms  
     http_req_connecting............: avg=26.06µs  min=0s      med=0s      max=62.88ms  p(90)=0s       p(95)=0s       p(99.9)=4.73ms  
     http_req_duration..............: avg=85.62ms  min=1.51ms  med=80.31ms max=283.38ms p(90)=165.72ms p(95)=183.07ms p(99.9)=245.47ms
       { expected_response:true }...: avg=85.62ms  min=1.51ms  med=80.31ms max=283.38ms p(90)=165.72ms p(95)=183.07ms p(99.9)=245.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165929
     http_req_receiving.............: avg=394.75µs min=28.04µs med=56.23µs max=131.61ms p(90)=247.72µs p(95)=426.49µs p(99.9)=36.36ms 
     http_req_sending...............: avg=88.15µs  min=5.24µs  med=10.27µs max=152.28ms p(90)=19.41µs  p(95)=133.29µs p(99.9)=13.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.13ms  min=1.44ms  med=79.99ms max=276.37ms p(90)=164.89ms p(95)=181.79ms p(99.9)=242.15ms
     http_reqs......................: 165929  2686.237677/s
     iteration_duration.............: avg=86.43ms  min=2.28ms  med=81.25ms max=329.63ms p(90)=166.27ms p(95)=183.63ms p(99.9)=246.84ms
     iterations.....................: 164928  2670.032409/s
     success_rate...................: 100.00% ✓ 164928      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 311556      ✗ 0     
     data_received..................: 9.2 GB  146 MB/s
     data_sent......................: 126 MB  2.0 MB/s
     http_req_blocked...............: avg=22.42µs  min=982ns   med=2.47µs   max=242.91ms p(90)=3.76µs   p(95)=4.51µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=19.29µs  min=0s      med=0s       max=241.39ms p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=129.59ms min=2.64ms  med=63.07ms  max=3.08s    p(90)=337.56ms p(95)=476.45ms p(99.9)=1.46s   
       { expected_response:true }...: avg=129.59ms min=2.64ms  med=63.07ms  max=3.08s    p(90)=337.56ms p(95)=476.45ms p(99.9)=1.46s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 104852
     http_req_receiving.............: avg=7.28ms   min=51.75µs med=112.96µs max=949.12ms p(90)=2.88ms   p(95)=11.82ms  p(99.9)=467.52ms
     http_req_sending...............: avg=55.27µs  min=5.28µs  med=9.82µs   max=138.27ms p(90)=15.89µs  p(95)=21.79µs  p(99.9)=6.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.26ms min=2.56ms  med=61.56ms  max=3.08s    p(90)=311.74ms p(95)=435.18ms p(99.9)=1.44s   
     http_reqs......................: 104852  1660.943223/s
     iteration_duration.............: avg=131.12ms min=3.75ms  med=64.43ms  max=3.08s    p(90)=339.6ms  p(95)=478.69ms p(99.9)=1.47s   
     iterations.....................: 103852  1645.102388/s
     success_rate...................: 100.00% ✓ 103852      ✗ 0     
     vus............................: 83      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 220923      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.43µs   min=1.08µs  med=2.66µs   max=21.78ms  p(90)=4.25µs   p(95)=5.18µs   p(99.9)=443.6µs 
     http_req_connecting............: avg=3.09µs   min=0s      med=0s       max=21.68ms  p(90)=0s       p(95)=0s       p(99.9)=388.47µs
     http_req_duration..............: avg=191.1ms  min=2.08ms  med=190.64ms max=578.25ms p(90)=352.98ms p(95)=378.24ms p(99.9)=501.25ms
       { expected_response:true }...: avg=191.1ms  min=2.08ms  med=190.64ms max=578.25ms p(90)=352.98ms p(95)=378.24ms p(99.9)=501.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74641
     http_req_receiving.............: avg=78.27µs  min=30.33µs med=61.94µs  max=22.72ms  p(90)=98.06µs  p(95)=113.52µs p(99.9)=1.86ms  
     http_req_sending...............: avg=32.78µs  min=5.31µs  med=11.22µs  max=83.88ms  p(90)=17.9µs   p(95)=21.64µs  p(99.9)=4.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.99ms min=2.02ms  med=190.54ms max=578.16ms p(90)=352.83ms p(95)=378.14ms p(99.9)=500.78ms
     http_reqs......................: 74641   1193.962952/s
     iteration_duration.............: avg=193.94ms min=5.43ms  med=193.65ms max=578.47ms p(90)=353.89ms p(95)=378.86ms p(99.9)=503.02ms
     iterations.....................: 73641   1177.966879/s
     success_rate...................: 100.00% ✓ 73641       ✗ 0    
     vus............................: 83      min=0         max=495
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90558      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 38 MB   577 kB/s
     http_req_blocked...............: avg=10.14µs  min=1.2µs   med=2.95µs   max=18.01ms  p(90)=4.67µs   p(95)=5.76µs   p(99.9)=1.77ms 
     http_req_connecting............: avg=6.14µs   min=0s      med=0s       max=17.95ms  p(90)=0s       p(95)=0s       p(99.9)=1.75ms 
     http_req_duration..............: avg=460.03ms min=4.21ms  med=428.84ms max=1.95s    p(90)=910.49ms p(95)=990.48ms p(99.9)=1.48s  
       { expected_response:true }...: avg=460.03ms min=4.21ms  med=428.84ms max=1.95s    p(90)=910.49ms p(95)=990.48ms p(99.9)=1.48s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31186
     http_req_receiving.............: avg=94.51µs  min=32µs    med=77.11µs  max=148.16ms p(90)=112.39µs p(95)=126.3µs  p(99.9)=890.1µs
     http_req_sending...............: avg=30.35µs  min=6.02µs  med=13.41µs  max=72.72ms  p(90)=20.61µs  p(95)=24.06µs  p(99.9)=2.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=459.91ms min=4.15ms  med=428.65ms max=1.95s    p(90)=910.39ms p(95)=990.32ms p(99.9)=1.48s  
     http_reqs......................: 31186   479.806603/s
     iteration_duration.............: avg=475.49ms min=20.98ms med=445.64ms max=1.95s    p(90)=915.26ms p(95)=993.75ms p(99.9)=1.49s  
     iterations.....................: 30186   464.421282/s
     success_rate...................: 100.00% ✓ 30186      ✗ 0    
     vus............................: 61      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46176      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   295 kB/s
     http_req_blocked...............: avg=15.1µs   min=1.31µs  med=3.72µs   max=4.32ms   p(90)=5.62µs   p(95)=7.22µs   p(99.9)=2.45ms
     http_req_connecting............: avg=9.82µs   min=0s      med=0s       max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=2.42ms
     http_req_duration..............: avg=818.74ms min=5.67ms  med=716.59ms max=19.33s   p(90)=1.42s    p(95)=1.61s    p(99.9)=17.4s 
       { expected_response:true }...: avg=818.74ms min=5.67ms  med=716.59ms max=19.33s   p(90)=1.42s    p(95)=1.61s    p(99.9)=17.4s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16392
     http_req_receiving.............: avg=120.15µs min=40.19µs med=98.15µs  max=152.25ms p(90)=138.49µs p(95)=152.39µs p(99.9)=1.25ms
     http_req_sending...............: avg=39.27µs  min=6.85µs  med=18.12µs  max=71.66ms  p(90)=24.69µs  p(95)=29.33µs  p(99.9)=4.15ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=818.58ms min=5.58ms  med=716.47ms max=19.33s   p(90)=1.42s    p(95)=1.61s    p(99.9)=17.4s 
     http_reqs......................: 16392   243.302905/s
     iteration_duration.............: avg=872.01ms min=34.62ms med=791.54ms max=19.33s   p(90)=1.43s    p(95)=1.62s    p(99.9)=17.43s
     iterations.....................: 15392   228.460121/s
     success_rate...................: 100.00% ✓ 15392      ✗ 0    
     vus............................: 86      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 40689      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   257 kB/s
     http_req_blocked...............: avg=14.02µs  min=1.29µs  med=3.53µs   max=5.25ms  p(90)=5.27µs   p(95)=7.26µs   p(99.9)=1.89ms
     http_req_connecting............: avg=8.78µs   min=0s      med=0s       max=5.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms
     http_req_duration..............: avg=500.09ms min=8.41ms  med=584.44ms max=1.45s   p(90)=828.41ms p(95)=898.59ms p(99.9)=1.26s 
       { expected_response:true }...: avg=500.09ms min=8.41ms  med=584.44ms max=1.45s   p(90)=828.41ms p(95)=898.59ms p(99.9)=1.26s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14563
     http_req_receiving.............: avg=103.95µs min=39µs    med=93.82µs  max=20.2ms  p(90)=133.9µs  p(95)=147.63µs p(99.9)=1.22ms
     http_req_sending...............: avg=31.25µs  min=6.3µs   med=17.28µs  max=25.75ms p(90)=23.2µs   p(95)=28.56µs  p(99.9)=3.67ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=499.96ms min=8.28ms  med=584.33ms max=1.44s   p(90)=828.31ms p(95)=898.45ms p(99.9)=1.26s 
     http_reqs......................: 14563   209.300744/s
     iteration_duration.............: avg=536.82ms min=28.05ms med=618.98ms max=1.45s   p(90)=836.43ms p(95)=913.09ms p(99.9)=1.27s 
     iterations.....................: 13563   194.928654/s
     success_rate...................: 100.00% ✓ 13563      ✗ 0    
     vus............................: 120     min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 417342      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=25.46µs  min=1.09µs  med=3.05µs  max=63.31ms  p(90)=4.9µs    p(95)=6.2µs    p(99.9)=3.26ms  
     http_req_connecting............: avg=21.48µs  min=0s      med=0s      max=63.23ms  p(90)=0s       p(95)=0s       p(99.9)=3.17ms  
     http_req_duration..............: avg=101.44ms min=1.59ms  med=95.46ms max=280.11ms p(90)=196.19ms p(95)=211.99ms p(99.9)=256.52ms
       { expected_response:true }...: avg=101.44ms min=1.59ms  med=95.46ms max=280.11ms p(90)=196.19ms p(95)=211.99ms p(99.9)=256.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140114
     http_req_receiving.............: avg=254.53µs min=28.61µs med=63.06µs max=160.9ms  p(90)=193.4µs  p(95)=440.12µs p(99.9)=24.61ms 
     http_req_sending...............: avg=84.53µs  min=5.38µs  med=11.99µs max=44.77ms  p(90)=23.18µs  p(95)=145.82µs p(99.9)=12.43ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.1ms  min=1.54ms  med=95.17ms max=280.03ms p(90)=195.72ms p(95)=211.42ms p(99.9)=253.91ms
     http_reqs......................: 140114  2260.191432/s
     iteration_duration.............: avg=102.5ms  min=3.39ms  med=96.67ms max=405.7ms  p(90)=196.79ms p(95)=212.59ms p(99.9)=258.56ms
     iterations.....................: 139114  2244.060343/s
     success_rate...................: 100.00% ✓ 139114      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 292620      ✗ 0    
     data_received..................: 8.6 GB  138 MB/s
     data_sent......................: 118 MB  1.9 MB/s
     http_req_blocked...............: avg=15.55µs  min=1µs     med=2.6µs   max=61.29ms  p(90)=4.13µs   p(95)=5.07µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=12.14µs  min=0s      med=0s      max=61.1ms   p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=144.85ms min=2.01ms  med=79.71ms max=2.41s    p(90)=355.77ms p(95)=496.93ms p(99.9)=1.37s   
       { expected_response:true }...: avg=144.85ms min=2.01ms  med=79.71ms max=2.41s    p(90)=355.77ms p(95)=496.93ms p(99.9)=1.37s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 98540
     http_req_receiving.............: avg=7.21ms   min=53.07µs med=112.8µs max=1.22s    p(90)=3.04ms   p(95)=12.55ms  p(99.9)=496.22ms
     http_req_sending...............: avg=56.12µs  min=5.32µs  med=10.55µs max=110.92ms p(90)=18.23µs  p(95)=26.14µs  p(99.9)=8.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=137.58ms min=1.91ms  med=78ms    max=2.26s    p(90)=335.82ms p(95)=463.4ms  p(99.9)=1.24s   
     http_reqs......................: 98540   1573.107168/s
     iteration_duration.............: avg=146.61ms min=3.22ms  med=81.52ms max=2.41s    p(90)=357.89ms p(95)=499.55ms p(99.9)=1.37s   
     iterations.....................: 97540   1557.14302/s
     success_rate...................: 100.00% ✓ 97540       ✗ 0    
     vus............................: 88      min=0         max=500
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 204723      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=10.54µs  min=1.08µs  med=2.73µs   max=30.51ms  p(90)=4.48µs   p(95)=5.47µs   p(99.9)=593.85µs
     http_req_connecting............: avg=7.05µs   min=0s      med=0s       max=30.45ms  p(90)=0s       p(95)=0s       p(99.9)=514.29µs
     http_req_duration..............: avg=206.12ms min=2.06ms  med=205.99ms max=611.32ms p(90)=383.96ms p(95)=412.05ms p(99.9)=512.24ms
       { expected_response:true }...: avg=206.12ms min=2.06ms  med=205.99ms max=611.32ms p(90)=383.96ms p(95)=412.05ms p(99.9)=512.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69241
     http_req_receiving.............: avg=88.85µs  min=29.65µs med=66.29µs  max=112.54ms p(90)=105.85µs p(95)=123.85µs p(99.9)=1.85ms  
     http_req_sending...............: avg=56.24µs  min=5.36µs  med=11.62µs  max=187.61ms p(90)=19.01µs  p(95)=23.38µs  p(99.9)=6.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.97ms min=1.99ms  med=205.86ms max=611.22ms p(90)=383.82ms p(95)=411.95ms p(99.9)=512.11ms
     http_reqs......................: 69241   1106.870535/s
     iteration_duration.............: avg=209.4ms  min=5.28ms  med=209.74ms max=611.46ms p(90)=384.94ms p(95)=412.87ms p(99.9)=512.66ms
     iterations.....................: 68241   1090.884767/s
     success_rate...................: 100.00% ✓ 68241       ✗ 0    
     vus............................: 84      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84843      ✗ 0    
     data_received..................: 2.6 GB  39 MB/s
     data_sent......................: 35 MB   539 kB/s
     http_req_blocked...............: avg=10.3µs   min=1.26µs  med=3.2µs    max=33.8ms   p(90)=4.89µs   p(95)=5.85µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=6.08µs   min=0s      med=0s       max=33.75ms  p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=490.25ms min=4.3ms   med=452.99ms max=1.92s    p(90)=969.57ms p(95)=1.04s    p(99.9)=1.54s   
       { expected_response:true }...: avg=490.25ms min=4.3ms   med=452.99ms max=1.92s    p(90)=969.57ms p(95)=1.04s    p(99.9)=1.54s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 29281
     http_req_receiving.............: avg=99.15µs  min=32.34µs med=82.49µs  max=142.49ms p(90)=118.02µs p(95)=132.29µs p(99.9)=876.12µs
     http_req_sending...............: avg=32.74µs  min=5.78µs  med=14.58µs  max=60.33ms  p(90)=21.27µs  p(95)=24.47µs  p(99.9)=3.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=490.12ms min=4.24ms  med=452.92ms max=1.92s    p(90)=969.48ms p(95)=1.04s    p(99.9)=1.54s   
     http_reqs......................: 29281   448.224419/s
     iteration_duration.............: avg=507.78ms min=12.92ms med=475.72ms max=1.92s    p(90)=975.46ms p(95)=1.04s    p(99.9)=1.55s   
     iterations.....................: 28281   432.916731/s
     success_rate...................: 100.00% ✓ 28281      ✗ 0    
     vus............................: 74      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 44430      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   283 kB/s
     http_req_blocked...............: avg=16.63µs  min=1.24µs  med=3.73µs   max=24.59ms p(90)=5.56µs   p(95)=7.07µs  p(99.9)=2.64ms
     http_req_connecting............: avg=11.27µs  min=0s      med=0s       max=24.5ms  p(90)=0s       p(95)=0s      p(99.9)=2.62ms
     http_req_duration..............: avg=904.04ms min=6.03ms  med=830.48ms max=4.3s    p(90)=1.8s     p(95)=1.99s   p(99.9)=3.6s  
       { expected_response:true }...: avg=904.04ms min=6.03ms  med=830.48ms max=4.3s    p(90)=1.8s     p(95)=1.99s   p(99.9)=3.6s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15810
     http_req_receiving.............: avg=112.84µs min=38.23µs med=98.5µs   max=55.14ms p(90)=136.47µs p(95)=149.3µs p(99.9)=1.38ms
     http_req_sending...............: avg=27.41µs  min=6.31µs  med=18.37µs  max=9.48ms  p(90)=24.43µs  p(95)=28.96µs p(99.9)=2.43ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=903.9ms  min=5.94ms  med=830.37ms max=4.3s    p(90)=1.8s     p(95)=1.99s   p(99.9)=3.6s  
     http_reqs......................: 15810   233.490442/s
     iteration_duration.............: avg=965.07ms min=63.28ms med=909.26ms max=4.3s    p(90)=1.82s    p(95)=2s      p(99.9)=3.68s 
     iterations.....................: 14810   218.721914/s
     success_rate...................: 100.00% ✓ 14810      ✗ 0    
     vus............................: 103     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 39762      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=14.83µs  min=1.15µs  med=3.53µs   max=3.39ms  p(90)=5.27µs   p(95)=6.94µs   p(99.9)=2.23ms
     http_req_connecting............: avg=9.28µs   min=0s      med=0s       max=3.36ms  p(90)=0s       p(95)=0s       p(99.9)=2.17ms
     http_req_duration..............: avg=1s       min=8.55ms  med=917.97ms max=3.93s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.22s 
       { expected_response:true }...: avg=1s       min=8.55ms  med=917.97ms max=3.93s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.22s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14254
     http_req_receiving.............: avg=103.01µs min=34.8µs  med=94.4µs   max=12.31ms p(90)=135.52µs p(95)=148.36µs p(99.9)=1.01ms
     http_req_sending...............: avg=28.49µs  min=5.9µs   med=17.39µs  max=8.14ms  p(90)=23.06µs  p(95)=27.74µs  p(99.9)=3.58ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=8.45ms  med=917.85ms max=3.93s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.22s 
     http_reqs......................: 14254   204.814805/s
     iteration_duration.............: avg=1.07s    min=21.93ms med=1s       max=3.94s   p(90)=2.06s    p(95)=2.18s    p(99.9)=3.26s 
     iterations.....................: 13254   190.44587/s
     success_rate...................: 100.00% ✓ 13254      ✗ 0    
     vus............................: 100     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

