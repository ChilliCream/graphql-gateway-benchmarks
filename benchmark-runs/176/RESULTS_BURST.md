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
| hive-router | v0.0.49 | 2,777 | 2,867 | 2,682 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,024 | 2,079 | 2,006 | 1.3% |  |
| cosmo | 0.307.0 | 1,193 | 1,216 | 1,188 | 1.3% | non-compatible response (20 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 487 | 496 | 480 | 1.1% |  |
| hive-gateway | 2.5.25 | 230 | 233 | 226 | 1.0% |  |
| apollo-gateway | 2.13.3 | 202 | 207 | 198 | 1.3% | 1 failed requests across 1/9 runs |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (12158 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (450768 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,201 | 2,312 | 2,150 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,839 | 1,887 | 1,812 | 1.4% |  |
| cosmo | 0.307.0 | 1,131 | 1,140 | 1,116 | 1.1% | non-compatible response (11 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 467 | 478 | 463 | 1.1% |  |
| hive-gateway | 2.5.25 | 229 | 231 | 226 | 0.8% |  |
| apollo-gateway | 2.13.3 | 208 | 211 | 205 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (12790 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (291962 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 512985      ✗ 0     
     data_received..................: 15 GB   244 MB/s
     data_sent......................: 207 MB  3.3 MB/s
     http_req_blocked...............: avg=33.79µs  min=1.01µs med=2.27µs  max=78.93ms  p(90)=3.82µs   p(95)=4.93µs   p(99.9)=7.79ms  
     http_req_connecting............: avg=30.64µs  min=0s     med=0s      max=78.84ms  p(90)=0s       p(95)=0s       p(99.9)=7.47ms  
     http_req_duration..............: avg=82.51ms  min=1.57ms med=77.1ms  max=340.43ms p(90)=158.16ms p(95)=179.06ms p(99.9)=247.71ms
       { expected_response:true }...: avg=82.51ms  min=1.57ms med=77.1ms  max=340.43ms p(90)=158.16ms p(95)=179.06ms p(99.9)=247.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 171995
     http_req_receiving.............: avg=445.32µs min=29.2µs med=55.61µs max=187.05ms p(90)=244.17µs p(95)=428.52µs p(99.9)=56.79ms 
     http_req_sending...............: avg=93.65µs  min=5.43µs med=9.95µs  max=82.06ms  p(90)=18.9µs   p(95)=136.71µs p(99.9)=14.95ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.98ms  min=1.51ms med=76.86ms max=288.73ms p(90)=157.04ms p(95)=176.84ms p(99.9)=240.87ms
     http_reqs......................: 171995  2777.492543/s
     iteration_duration.............: avg=83.37ms  min=2.17ms med=77.96ms max=384.25ms p(90)=158.85ms p(95)=180.02ms p(99.9)=250.17ms
     iterations.....................: 170995  2761.343861/s
     success_rate...................: 100.00% ✓ 170995      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 377754      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 152 MB  2.4 MB/s
     http_req_blocked...............: avg=15.99µs  min=1.04µs  med=2.53µs   max=111.59ms p(90)=3.94µs   p(95)=4.85µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=12.84µs  min=0s      med=0s       max=111.54ms p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=112.16ms min=2.35ms  med=103.26ms max=700.89ms p(90)=220.96ms p(95)=252.49ms p(99.9)=432.94ms
       { expected_response:true }...: avg=112.16ms min=2.35ms  med=103.26ms max=700.89ms p(90)=220.96ms p(95)=252.49ms p(99.9)=432.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126918
     http_req_receiving.............: avg=1.68ms   min=52.93µs med=117.39µs max=420.09ms p(90)=1.31ms   p(95)=4.61ms   p(99.9)=121.95ms
     http_req_sending...............: avg=65.31µs  min=5.54µs  med=10.17µs  max=103.8ms  p(90)=17.86µs  p(95)=124.64µs p(99.9)=8.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.41ms min=2.26ms  med=102.27ms max=700.5ms  p(90)=217.67ms p(95)=246.28ms p(99.9)=418.11ms
     http_reqs......................: 126918  2024.82351/s
     iteration_duration.............: avg=113.31ms min=3.28ms  med=104.58ms max=701.06ms p(90)=221.61ms p(95)=253.36ms p(99.9)=433.42ms
     iterations.....................: 125918  2008.869717/s
     success_rate...................: 100.00% ✓ 125918      ✗ 0     
     vus............................: 90      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 220878      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=8.46µs   min=1.16µs  med=2.62µs   max=19.66ms  p(90)=4.32µs   p(95)=5.29µs   p(99.9)=661.48µs
     http_req_connecting............: avg=4.99µs   min=0s      med=0s       max=19.58ms  p(90)=0s       p(95)=0s       p(99.9)=569.33µs
     http_req_duration..............: avg=191.13ms min=2.09ms  med=193.92ms max=583.06ms p(90)=352.91ms p(95)=378.26ms p(99.9)=468.74ms
       { expected_response:true }...: avg=191.13ms min=2.09ms  med=193.92ms max=583.06ms p(90)=352.91ms p(95)=378.26ms p(99.9)=468.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74626
     http_req_receiving.............: avg=82.38µs  min=29.96µs med=62.75µs  max=66.65ms  p(90)=98.91µs  p(95)=114.99µs p(99.9)=2.06ms  
     http_req_sending...............: avg=35.75µs  min=5.45µs  med=11.2µs   max=180.2ms  p(90)=17.66µs  p(95)=21.71µs  p(99.9)=3.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.01ms min=2.03ms  med=193.8ms  max=582.98ms p(90)=352.78ms p(95)=378.15ms p(99.9)=468.66ms
     http_reqs......................: 74626   1193.047643/s
     iteration_duration.............: avg=193.97ms min=4.14ms  med=196.88ms max=583.25ms p(90)=353.78ms p(95)=378.95ms p(99.9)=469.57ms
     iterations.....................: 73626   1177.060619/s
     success_rate...................: 100.00% ✓ 73626       ✗ 0    
     vus............................: 83      min=0         max=494
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 92022      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   585 kB/s
     http_req_blocked...............: avg=10.63µs  min=1.17µs  med=3.12µs   max=25.27ms  p(90)=4.92µs   p(95)=5.99µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=6.45µs   min=0s      med=0s       max=25.21ms  p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=453.4ms  min=4.05ms  med=424.73ms max=1.9s     p(90)=898.78ms p(95)=976.5ms  p(99.9)=1.4s    
       { expected_response:true }...: avg=453.4ms  min=4.05ms  med=424.73ms max=1.9s     p(90)=898.78ms p(95)=976.5ms  p(99.9)=1.4s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 31674
     http_req_receiving.............: avg=89.76µs  min=33.41µs med=78.63µs  max=51.42ms  p(90)=116.1µs  p(95)=129.58µs p(99.9)=884.39µs
     http_req_sending...............: avg=30.91µs  min=5.96µs  med=14.18µs  max=100.01ms p(90)=21.67µs  p(95)=25.28µs  p(99.9)=2.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=453.28ms min=3.98ms  med=424.63ms max=1.9s     p(90)=898.68ms p(95)=976.39ms p(99.9)=1.4s    
     http_reqs......................: 31674   487.404561/s
     iteration_duration.............: avg=468.41ms min=23.32ms med=442.74ms max=1.9s     p(90)=903.13ms p(95)=979.84ms p(99.9)=1.41s   
     iterations.....................: 30674   472.016402/s
     success_rate...................: 100.00% ✓ 30674      ✗ 0    
     vus............................: 57      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 44238     ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   278 kB/s
     http_req_blocked...............: avg=13.05µs  min=1.21µs  med=3.71µs   max=13.27ms p(90)=5.61µs   p(95)=7.34µs  p(99.9)=1.39ms
     http_req_connecting............: avg=7.44µs   min=0s      med=0s       max=13.21ms p(90)=0s       p(95)=0s      p(99.9)=1.34ms
     http_req_duration..............: avg=906.84ms min=6.09ms  med=798.85ms max=18.74s  p(90)=1.54s    p(95)=1.7s    p(99.9)=17.37s
       { expected_response:true }...: avg=906.84ms min=6.09ms  med=798.85ms max=18.74s  p(90)=1.54s    p(95)=1.7s    p(99.9)=17.37s
     http_req_failed................: 0.00%   ✓ 0         ✗ 15746
     http_req_receiving.............: avg=109.84µs min=36.81µs med=99.67µs  max=27.49ms p(90)=139.44µs p(95)=152.5µs p(99.9)=1.45ms
     http_req_sending...............: avg=35.53µs  min=6.39µs  med=18.14µs  max=82.31ms p(90)=24.53µs  p(95)=29.5µs  p(99.9)=3.23ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=906.69ms min=5.99ms  med=798.73ms max=18.74s  p(90)=1.54s    p(95)=1.7s    p(99.9)=17.37s
     http_reqs......................: 15746   230.59294/s
     iteration_duration.............: avg=968.37ms min=47.87ms med=861.35ms max=18.74s  p(90)=1.55s    p(95)=1.71s   p(99.9)=17.38s
     iterations.....................: 14746   215.9484/s
     success_rate...................: 100.00% ✓ 14746     ✗ 0    
     vus............................: 65      min=0       max=499
     vus_max........................: 500     min=500     max=500
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

     checks.........................: 100.00% ✓ 42123      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=16.93µs  min=1.28µs  med=3.54µs   max=20.21ms p(90)=5.24µs   p(95)=6.69µs   p(99.9)=2.84ms  
     http_req_connecting............: avg=11.42µs  min=0s      med=0s       max=20.14ms p(90)=0s       p(95)=0s       p(99.9)=2.76ms  
     http_req_duration..............: avg=426.74ms min=8.43ms  med=426.49ms max=1.36s   p(90)=780.91ms p(95)=831.36ms p(99.9)=1.15s   
       { expected_response:true }...: avg=426.74ms min=8.43ms  med=426.49ms max=1.36s   p(90)=780.91ms p(95)=831.36ms p(99.9)=1.15s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15041
     http_req_receiving.............: avg=104.09µs min=38.14µs med=92.67µs  max=46.98ms p(90)=132.56µs p(95)=144.46µs p(99.9)=893.78µs
     http_req_sending...............: avg=30.67µs  min=6.16µs  med=16.98µs  max=29.66ms p(90)=22.89µs  p(95)=27.64µs  p(99.9)=2.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=426.6ms  min=8.34ms  med=426.37ms max=1.35s   p(90)=780.79ms p(95)=831.24ms p(99.9)=1.15s   
     http_reqs......................: 15041   202.23519/s
     iteration_duration.............: avg=456.96ms min=8.93ms  med=458.19ms max=1.36s   p(90)=785.52ms p(95)=836.94ms p(99.9)=1.16s   
     iterations.....................: 14041   188.789595/s
     success_rate...................: 100.00% ✓ 14041      ✗ 0    
     vus............................: 69      min=0        max=495
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 406704      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=38.7µs   min=1.1µs   med=2.99µs  max=143.5ms  p(90)=4.82µs   p(95)=6.09µs   p(99.9)=6.21ms  
     http_req_connecting............: avg=34.61µs  min=0s      med=0s      max=143.33ms p(90)=0s       p(95)=0s       p(99.9)=5.57ms  
     http_req_duration..............: avg=104.11ms min=1.63ms  med=98.17ms max=307.41ms p(90)=200.85ms p(95)=217.7ms  p(99.9)=269.06ms
       { expected_response:true }...: avg=104.11ms min=1.63ms  med=98.17ms max=307.41ms p(90)=200.85ms p(95)=217.7ms  p(99.9)=269.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136568
     http_req_receiving.............: avg=235.18µs min=30.19µs med=65.1µs  max=47.8ms   p(90)=203.11µs p(95)=446.26µs p(99.9)=25.24ms 
     http_req_sending...............: avg=93.96µs  min=5.43µs  med=11.99µs max=155.84ms p(90)=22.84µs  p(95)=147.51µs p(99.9)=12.95ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.78ms min=1.58ms  med=97.89ms max=302.35ms p(90)=200.38ms p(95)=216.92ms p(99.9)=267.69ms
     http_reqs......................: 136568  2201.960291/s
     iteration_duration.............: avg=105.2ms  min=4.72ms  med=99.43ms max=368.81ms p(90)=201.39ms p(95)=218.25ms p(99.9)=271.48ms
     iterations.....................: 135568  2185.836746/s
     success_rate...................: 100.00% ✓ 135568      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 340722      ✗ 0     
     data_received..................: 10 GB   161 MB/s
     data_sent......................: 138 MB  2.2 MB/s
     http_req_blocked...............: avg=15.72µs  min=982ns   med=2.83µs   max=75.42ms  p(90)=4.54µs   p(95)=5.65µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=12.1µs   min=0s      med=0s       max=75.32ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=124.3ms  min=1.79ms  med=110.83ms max=1.11s    p(90)=241.61ms p(95)=279.41ms p(99.9)=681.62ms
       { expected_response:true }...: avg=124.3ms  min=1.79ms  med=110.83ms max=1.11s    p(90)=241.61ms p(95)=279.41ms p(99.9)=681.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 114574
     http_req_receiving.............: avg=1.85ms   min=52.93µs med=121.71µs max=817.74ms p(90)=1.73ms   p(95)=4.76ms   p(99.9)=145.34ms
     http_req_sending...............: avg=64.41µs  min=5.35µs  med=11.08µs  max=98.5ms   p(90)=20.28µs  p(95)=125.66µs p(99.9)=9.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.38ms min=1.68ms  med=109.62ms max=1.11s    p(90)=239.04ms p(95)=274.45ms p(99.9)=669.32ms
     http_reqs......................: 114574  1839.566542/s
     iteration_duration.............: avg=125.69ms min=3.28ms  med=112.49ms max=1.11s    p(90)=242.43ms p(95)=280.28ms p(99.9)=683.25ms
     iterations.....................: 113574  1823.510835/s
     success_rate...................: 100.00% ✓ 113574      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 209292      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=6.55µs   min=1.07µs  med=2.64µs   max=20.72ms  p(90)=4.29µs   p(95)=5.2µs    p(99.9)=518.76µs
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=20.67ms  p(90)=0s       p(95)=0s       p(99.9)=459.5µs 
     http_req_duration..............: avg=201.71ms min=2.09ms  med=201.14ms max=642.29ms p(90)=374.86ms p(95)=401.81ms p(99.9)=481.94ms
       { expected_response:true }...: avg=201.71ms min=2.09ms  med=201.14ms max=642.29ms p(90)=374.86ms p(95)=401.81ms p(99.9)=481.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70764
     http_req_receiving.............: avg=80.27µs  min=30.84µs med=64.7µs   max=68.24ms  p(90)=100.19µs p(95)=115.23µs p(99.9)=1.41ms  
     http_req_sending...............: avg=34.18µs  min=5.64µs  med=11.68µs  max=240.6ms  p(90)=18.12µs  p(95)=21.74µs  p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.6ms  min=2.01ms  med=201.03ms max=641.54ms p(90)=374.75ms p(95)=401.64ms p(99.9)=481.89ms
     http_reqs......................: 70764   1131.186796/s
     iteration_duration.............: avg=204.86ms min=4.25ms  med=204.6ms  max=642.53ms p(90)=375.73ms p(95)=402.53ms p(99.9)=483.44ms
     iterations.....................: 69764   1115.201453/s
     success_rate...................: 100.00% ✓ 69764       ✗ 0    
     vus............................: 85      min=0         max=497
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 88749      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   562 kB/s
     http_req_blocked...............: avg=8.91µs   min=1.21µs  med=3.25µs   max=9.53ms  p(90)=5.06µs   p(95)=6.05µs   p(99.9)=1ms     
     http_req_connecting............: avg=4.6µs    min=0s      med=0s       max=9.48ms  p(90)=0s       p(95)=0s       p(99.9)=917.39µs
     http_req_duration..............: avg=469.91ms min=4.19ms  med=433.61ms max=1.88s   p(90)=921.13ms p(95)=1s       p(99.9)=1.49s   
       { expected_response:true }...: avg=469.91ms min=4.19ms  med=433.61ms max=1.88s   p(90)=921.13ms p(95)=1s       p(99.9)=1.49s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30583
     http_req_receiving.............: avg=103.37µs min=30.29µs med=81.54µs  max=110.1ms p(90)=118.41µs p(95)=131.96µs p(99.9)=1.13ms  
     http_req_sending...............: avg=26.32µs  min=5.51µs  med=14.57µs  max=39.09ms p(90)=21.8µs   p(95)=25.1µs   p(99.9)=1.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=469.78ms min=4.12ms  med=433.5ms  max=1.88s   p(90)=921.02ms p(95)=1s       p(99.9)=1.49s   
     http_reqs......................: 30583   467.89828/s
     iteration_duration.............: avg=486ms    min=34.17ms med=453.22ms max=1.88s   p(90)=926.01ms p(95)=1.01s    p(99.9)=1.5s    
     iterations.....................: 29583   452.598987/s
     success_rate...................: 100.00% ✓ 29583      ✗ 0    
     vus............................: 70      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 43926      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=15.03µs  min=1.25µs  med=3.65µs   max=3.74ms  p(90)=5.51µs   p(95)=7.07µs   p(99.9)=2.44ms
     http_req_connecting............: avg=9.7µs    min=0s      med=0s       max=3.71ms  p(90)=0s       p(95)=0s       p(99.9)=2.4ms 
     http_req_duration..............: avg=932ms    min=6.27ms  med=865.24ms max=5.39s   p(90)=1.85s    p(95)=2.03s    p(99.9)=4.72s 
       { expected_response:true }...: avg=932ms    min=6.27ms  med=865.24ms max=5.39s   p(90)=1.85s    p(95)=2.03s    p(99.9)=4.72s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15642
     http_req_receiving.............: avg=113.83µs min=33.57µs med=99.23µs  max=96.16ms p(90)=139.32µs p(95)=151.25µs p(99.9)=1.43ms
     http_req_sending...............: avg=30.91µs  min=6.45µs  med=18.34µs  max=46.27ms p(90)=24.49µs  p(95)=29.67µs  p(99.9)=2.53ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=931.86ms min=6.18ms  med=865.15ms max=5.39s   p(90)=1.85s    p(95)=2.03s    p(99.9)=4.72s 
     http_reqs......................: 15642   229.638965/s
     iteration_duration.............: avg=995.66ms min=53.15ms med=930.7ms  max=5.4s    p(90)=1.87s    p(95)=2.04s    p(99.9)=4.75s 
     iterations.....................: 14642   214.958044/s
     success_rate...................: 100.00% ✓ 14642      ✗ 0    
     vus............................: 60      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40713      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   250 kB/s
     http_req_blocked...............: avg=18.18µs  min=1.3µs   med=3.68µs   max=16.65ms  p(90)=5.49µs   p(95)=7.12µs   p(99.9)=2.92ms  
     http_req_connecting............: avg=12.63µs  min=0s      med=0s       max=16.59ms  p(90)=0s       p(95)=0s       p(99.9)=2.9ms   
     http_req_duration..............: avg=1s       min=8.56ms  med=908.45ms max=4.2s     p(90)=2.03s    p(95)=2.16s    p(99.9)=3.66s   
       { expected_response:true }...: avg=1s       min=8.56ms  med=908.45ms max=4.2s     p(90)=2.03s    p(95)=2.16s    p(99.9)=3.66s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14571
     http_req_receiving.............: avg=321.43µs min=33.85µs med=98.7µs   max=200.39ms p(90)=139.61µs p(95)=151.92µs p(99.9)=104.67ms
     http_req_sending...............: avg=30.66µs  min=6.42µs  med=18.14µs  max=34.12ms  p(90)=24.12µs  p(95)=29.74µs  p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=999.69ms min=8.46ms  med=908.33ms max=4.2s     p(90)=2.03s    p(95)=2.16s    p(99.9)=3.66s   
     http_reqs......................: 14571   208.489423/s
     iteration_duration.............: avg=1.07s    min=11.49ms med=1s       max=4.21s    p(90)=2.06s    p(95)=2.17s    p(99.9)=3.68s   
     iterations.....................: 13571   194.180905/s
     success_rate...................: 100.00% ✓ 13571      ✗ 0    
     vus............................: 21      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

