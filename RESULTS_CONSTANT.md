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
| hive-router | v0.0.83 | 3,148 | 3,369 | 3,064 | 3.3% |  |
| fusion-nightly | 16.5.1-p.1 | 2,574 | 2,696 | 2,556 | 1.9% |  |
| fusion-nightly-net11 | 16.5.1-p.1 | 2,558 | 2,658 | 2,551 | 1.4% |  |
| fusion | 16.5.0 | 2,522 | 2,597 | 2,466 | 1.8% |  |
| grafbase | 0.53.5 | 2,215 | 2,324 | 2,199 | 1.9% |  |
| cosmo | 0.331.1 | 1,318 | 1,350 | 1,316 | 1.0% |  |
| hive-gateway-router-runtime | 2.10.4 | 612 | 628 | 607 | 1.1% |  |
| apollo-router | v2.16.0 | 487 | 505 | 484 | 1.4% |  |
| apollo-gateway | 2.14.2 | 285 | 289 | 284 | 0.5% |  |
| hive-gateway | 2.10.4 | 274 | 281 | 272 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1123 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,539 | 2,740 | 2,520 | 3.0% |  |
| fusion-nightly | 16.5.1-p.1 | 2,419 | 2,522 | 2,405 | 1.7% |  |
| fusion-nightly-net11 | 16.5.1-p.1 | 2,383 | 2,497 | 2,368 | 1.9% |  |
| fusion | 16.5.0 | 2,335 | 2,442 | 2,328 | 1.7% |  |
| fusion-nightly-fed | 16.5.1-p.1 | 2,190 | 2,294 | 2,185 | 1.7% |  |
| grafbase | 0.53.5 | 1,635 | 1,694 | 1,632 | 1.4% |  |
| cosmo | 0.331.1 | 1,229 | 1,278 | 1,221 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.4 | 594 | 613 | 592 | 1.2% |  |
| apollo-router | v2.16.0 | 451 | 470 | 448 | 1.7% |  |
| apollo-gateway | 2.14.2 | 264 | 268 | 262 | 0.7% |  |
| hive-gateway | 2.10.4 | 259 | 267 | 258 | 1.3% |  |
| feddi | 5ff8b6165878 | 18 | 18 | 17 | 1.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1134729     ✗ 0     
     data_received..................: 33 GB   276 MB/s
     data_sent......................: 455 MB  3.8 MB/s
     http_req_blocked...............: avg=3µs     min=922ns   med=2.31µs  max=16.51ms  p(90)=3.67µs  p(95)=4.29µs   p(99.9)=34.2µs 
     http_req_connecting............: avg=252ns   min=0s      med=0s      max=4ms      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.64ms min=1.42ms  med=14.93ms max=298.26ms p(90)=22.9ms  p(95)=26.22ms  p(99.9)=47.1ms 
       { expected_response:true }...: avg=15.64ms min=1.42ms  med=14.93ms max=298.26ms p(90)=22.9ms  p(95)=26.22ms  p(99.9)=47.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 378343
     http_req_receiving.............: avg=95.74µs min=24.59µs med=46.79µs max=87.81ms  p(90)=88.35µs p(95)=175.18µs p(99.9)=7.77ms 
     http_req_sending...............: avg=51.44µs min=4.62µs  med=8.87µs  max=123.53ms p(90)=15.69µs p(95)=102.41µs p(99.9)=6.92ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.49ms min=1.34ms  med=14.81ms max=288.37ms p(90)=22.71ms p(95)=25.92ms  p(99.9)=45.59ms
     http_reqs......................: 378343  3148.31862/s
     iteration_duration.............: avg=15.85ms min=1.93ms  med=15.12ms max=307.74ms p(90)=23.1ms  p(95)=26.45ms  p(99.9)=47.89ms
     iterations.....................: 378243  3147.486486/s
     success_rate...................: 100.00% ✓ 378243      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 928467      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=3.03µs   min=891ns   med=1.85µs  max=74.8ms   p(90)=2.96µs  p(95)=3.5µs   p(99.9)=29.03µs 
     http_req_connecting............: avg=316ns    min=0s      med=0s      max=3.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.17ms  min=1.98ms  med=16.45ms max=286.62ms p(90)=31.1ms  p(95)=37.81ms p(99.9)=124.27ms
       { expected_response:true }...: avg=19.17ms  min=1.98ms  med=16.45ms max=286.62ms p(90)=31.1ms  p(95)=37.81ms p(99.9)=124.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309589
     http_req_receiving.............: avg=561.06µs min=51.06µs med=89.95µs max=138.56ms p(90)=1.05ms  p(95)=1.87ms  p(99.9)=25.44ms 
     http_req_sending...............: avg=40.12µs  min=4.6µs   med=8.01µs  max=115.11ms p(90)=13.68µs p(95)=74.63µs p(99.9)=3.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.57ms  min=1.89ms  med=15.92ms max=286.25ms p(90)=30.17ms p(95)=36.7ms  p(99.9)=122.64ms
     http_reqs......................: 309589  2574.526607/s
     iteration_duration.............: avg=19.37ms  min=3.22ms  med=16.64ms max=314ms    p(90)=31.32ms p(95)=38.04ms p(99.9)=125.71ms
     iterations.....................: 309489  2573.695012/s
     success_rate...................: 100.00% ✓ 309489      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 922464      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=2.34µs   min=861ns   med=1.84µs  max=9.18ms   p(90)=2.97µs  p(95)=3.51µs  p(99.9)=26.03µs
     http_req_connecting............: avg=125ns    min=0s      med=0s      max=1.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.29ms  min=1.9ms   med=18.46ms max=298.56ms p(90)=27.78ms p(95)=31.26ms p(99.9)=51.69ms
       { expected_response:true }...: avg=19.29ms  min=1.9ms   med=18.46ms max=298.56ms p(90)=27.78ms p(95)=31.26ms p(99.9)=51.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307588
     http_req_receiving.............: avg=690.74µs min=50.68µs med=119.1µs max=58.35ms  p(90)=1.7ms   p(95)=2.48ms  p(99.9)=19.02ms
     http_req_sending...............: avg=40.45µs  min=4.07µs  med=7.9µs   max=227.79ms p(90)=13.72µs p(95)=64.75µs p(99.9)=3.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.56ms  min=1.83ms  med=17.73ms max=298.36ms p(90)=26.91ms p(95)=30.34ms p(99.9)=49.69ms
     http_reqs......................: 307588  2558.24625/s
     iteration_duration.............: avg=19.5ms   min=3.26ms  med=18.66ms max=330.49ms p(90)=27.99ms p(95)=31.49ms p(99.9)=52.06ms
     iterations.....................: 307488  2557.414538/s
     success_rate...................: 100.00% ✓ 307488      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 909609      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 365 MB  3.0 MB/s
     http_req_blocked...............: avg=3.14µs   min=1.03µs  med=2.3µs   max=17.17ms  p(90)=3.57µs  p(95)=4.14µs  p(99.9)=32.52µs 
     http_req_connecting............: avg=277ns    min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.57ms  min=2.1ms   med=16.83ms max=308.38ms p(90)=31.81ms p(95)=38.41ms p(99.9)=126.97ms
       { expected_response:true }...: avg=19.57ms  min=2.1ms   med=16.83ms max=308.38ms p(90)=31.81ms p(95)=38.41ms p(99.9)=126.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 303303
     http_req_receiving.............: avg=572.29µs min=49.21µs med=91.29µs max=172.85ms p(90)=1.08ms  p(95)=1.96ms  p(99.9)=25.43ms 
     http_req_sending...............: avg=44.21µs  min=4.64µs  med=8.69µs  max=159.13ms p(90)=14.79µs p(95)=81.85µs p(99.9)=4.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.95ms  min=1.96ms  med=16.3ms  max=308.3ms  p(90)=30.86ms p(95)=37.3ms  p(99.9)=124.43ms
     http_reqs......................: 303303  2522.032018/s
     iteration_duration.............: avg=19.78ms  min=2.96ms  med=17.02ms max=308.58ms p(90)=32.02ms p(95)=38.65ms p(99.9)=127.79ms
     iterations.....................: 303203  2521.200495/s
     success_rate...................: 100.00% ✓ 303203      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 798825      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 320 MB  2.7 MB/s
     http_req_blocked...............: avg=3.14µs  min=911ns   med=2.19µs  max=20.19ms  p(90)=3.75µs  p(95)=4.53µs   p(99.9)=37.55µs
     http_req_connecting............: avg=309ns   min=0s      med=0s      max=3.31ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.31ms min=1.71ms  med=22.06ms max=289.23ms p(90)=26.52ms p(95)=28.33ms  p(99.9)=48.12ms
       { expected_response:true }...: avg=22.31ms min=1.71ms  med=22.06ms max=289.23ms p(90)=26.52ms p(95)=28.33ms  p(99.9)=48.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266375
     http_req_receiving.............: avg=88.05µs min=27.68µs med=53.55µs max=84.78ms  p(90)=92.43µs p(95)=118.85µs p(99.9)=6ms    
     http_req_sending...............: avg=35.91µs min=4.59µs  med=9.49µs  max=77.11ms  p(90)=16.82µs p(95)=26.66µs  p(99.9)=1.92ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.18ms min=1.62ms  med=21.96ms max=288.72ms p(90)=26.4ms  p(95)=28.16ms  p(99.9)=47.01ms
     http_reqs......................: 266375  2215.664144/s
     iteration_duration.............: avg=22.52ms min=4.5ms   med=22.25ms max=304.16ms p(90)=26.72ms p(95)=28.55ms  p(99.9)=48.59ms
     iterations.....................: 266275  2214.832361/s
     success_rate...................: 100.00% ✓ 266275      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 475581      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=4.54µs  min=1.01µs  med=2.44µs  max=8.7ms    p(90)=3.88µs  p(95)=4.53µs   p(99.9)=33.64µs
     http_req_connecting............: avg=1.76µs  min=0s      med=0s      max=8.67ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.61ms min=1.97ms  med=37.21ms max=301.1ms  p(90)=52.73ms p(95)=57.48ms  p(99.9)=79.76ms
       { expected_response:true }...: avg=37.61ms min=1.97ms  med=37.21ms max=301.1ms  p(90)=52.73ms p(95)=57.48ms  p(99.9)=79.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158627
     http_req_receiving.............: avg=75.26µs min=27.66µs med=61.21µs max=218.75ms p(90)=95.64µs p(95)=111.21µs p(99.9)=1.01ms 
     http_req_sending...............: avg=26.95µs min=5µs     med=10.54µs max=223.76ms p(90)=16.31µs p(95)=20.44µs  p(99.9)=1.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.51ms min=1.91ms  med=37.12ms max=299.39ms p(90)=52.63ms p(95)=57.37ms  p(99.9)=79.35ms
     http_reqs......................: 158627  1318.906307/s
     iteration_duration.............: avg=37.84ms min=3.32ms  med=37.42ms max=317.13ms p(90)=52.94ms p(95)=57.68ms  p(99.9)=80.14ms
     iterations.....................: 158527  1318.074856/s
     success_rate...................: 100.00% ✓ 158527      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 221031     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   736 kB/s
     http_req_blocked...............: avg=4.6µs   min=1.13µs  med=3.04µs  max=4.06ms   p(90)=4.56µs  p(95)=5.2µs    p(99.9)=44.51µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=4.01ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.09ms min=3.69ms  med=79.36ms max=322.62ms p(90)=99.69ms p(95)=109.33ms p(99.9)=189.85ms
       { expected_response:true }...: avg=81.09ms min=3.69ms  med=79.36ms max=322.62ms p(90)=99.69ms p(95)=109.33ms p(99.9)=189.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73777
     http_req_receiving.............: avg=83.8µs  min=29.72µs med=71.84µs max=157.93ms p(90)=107.6µs p(95)=120.58µs p(99.9)=650.56µs
     http_req_sending...............: avg=21.98µs min=5.46µs  med=13.93µs max=61.4ms   p(90)=20.79µs p(95)=23.08µs  p(99.9)=602.16µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.99ms min=3.58ms  med=79.26ms max=322.38ms p(90)=99.58ms p(95)=109.2ms  p(99.9)=189.49ms
     http_reqs......................: 73777   612.360299/s
     iteration_duration.............: avg=81.44ms min=20.28ms med=79.6ms  max=335.37ms p(90)=99.93ms p(95)=109.59ms p(99.9)=191.29ms
     iterations.....................: 73677   611.530284/s
     success_rate...................: 100.00% ✓ 73677      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 176052     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   585 kB/s
     http_req_blocked...............: avg=4.52µs   min=1.06µs  med=2.78µs   max=4.06ms   p(90)=4.2µs    p(95)=4.73µs   p(99.9)=55.64µs 
     http_req_connecting............: avg=1.53µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.83ms min=4.53ms  med=101.58ms max=336.04ms p(90)=122.87ms p(95)=129.24ms p(99.9)=159.47ms
       { expected_response:true }...: avg=101.83ms min=4.53ms  med=101.58ms max=336.04ms p(90)=122.87ms p(95)=129.24ms p(99.9)=159.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58784
     http_req_receiving.............: avg=82.41µs  min=30.15µs med=76.46µs  max=78.62ms  p(90)=108.2µs  p(95)=120.86µs p(99.9)=560.88µs
     http_req_sending...............: avg=23.44µs  min=5.03µs  med=14.89µs  max=108.8ms  p(90)=20.3µs   p(95)=22.13µs  p(99.9)=571.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.73ms min=4.42ms  med=101.48ms max=335.41ms p(90)=122.77ms p(95)=129.13ms p(99.9)=158.53ms
     http_reqs......................: 58784   487.516804/s
     iteration_duration.............: avg=102.26ms min=13.16ms med=101.85ms max=342.47ms p(90)=123.13ms p(95)=129.5ms  p(99.9)=161.41ms
     iterations.....................: 58684   486.687468/s
     success_rate...................: 100.00% ✓ 58684      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103362     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   343 kB/s
     http_req_blocked...............: avg=5.72µs   min=1.14µs  med=3.06µs   max=3.39ms   p(90)=4.35µs   p(95)=4.83µs   p(99.9)=1.09ms  
     http_req_connecting............: avg=2.48µs   min=0s      med=0s       max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=173.45ms min=7.29ms  med=181.59ms max=362.52ms p(90)=225.96ms p(95)=229.97ms p(99.9)=298.79ms
       { expected_response:true }...: avg=173.45ms min=7.29ms  med=181.59ms max=362.52ms p(90)=225.96ms p(95)=229.97ms p(99.9)=298.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34554
     http_req_receiving.............: avg=86.52µs  min=29.81µs med=84.8µs   max=6.05ms   p(90)=114.74µs p(95)=126.21µs p(99.9)=526.9µs 
     http_req_sending...............: avg=27.47µs  min=5.41µs  med=16.6µs   max=92.62ms  p(90)=20.67µs  p(95)=22.37µs  p(99.9)=560.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.33ms min=7.19ms  med=181.44ms max=361.91ms p(90)=225.85ms p(95)=229.86ms p(99.9)=298.69ms
     http_reqs......................: 34554   285.832955/s
     iteration_duration.............: avg=174.2ms  min=22.35ms med=184.13ms max=372.24ms p(90)=226.25ms p(95)=230.23ms p(99.9)=299.88ms
     iterations.....................: 34454   285.005749/s
     success_rate...................: 100.00% ✓ 34454      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99018      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=6.4µs    min=1.15µs  med=3.42µs   max=4.05ms   p(90)=4.8µs    p(95)=5.39µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=181.06ms min=5.59ms  med=165.87ms max=634.7ms  p(90)=211.19ms p(95)=252.02ms p(99.9)=551.81ms
       { expected_response:true }...: avg=181.06ms min=5.59ms  med=165.87ms max=634.7ms  p(90)=211.19ms p(95)=252.02ms p(99.9)=551.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33106
     http_req_receiving.............: avg=89.53µs  min=32.29µs med=84.19µs  max=14.05ms  p(90)=114.3µs  p(95)=125.38µs p(99.9)=689.15µs
     http_req_sending...............: avg=26.29µs  min=5.9µs   med=17.21µs  max=111.87ms p(90)=22.21µs  p(95)=24.04µs  p(99.9)=576.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.94ms min=5.46ms  med=165.74ms max=634.59ms p(90)=211.08ms p(95)=251.94ms p(99.9)=551.69ms
     http_reqs......................: 33106   274.086802/s
     iteration_duration.............: avg=181.87ms min=29.88ms med=166.2ms  max=634.99ms p(90)=211.54ms p(95)=253.48ms p(99.9)=552.08ms
     iterations.....................: 33006   273.258895/s
     success_rate...................: 100.00% ✓ 33006      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 915486      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 367 MB  3.1 MB/s
     http_req_blocked...............: avg=3.63µs   min=1.08µs  med=2.75µs  max=15.62ms  p(90)=4.44µs  p(95)=5.27µs   p(99.9)=41.12µs
     http_req_connecting............: avg=311ns    min=0s      med=0s      max=3.62ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.42ms  min=1.69ms  med=19.1ms  max=295.54ms p(90)=26.92ms p(95)=29.58ms  p(99.9)=50.4ms 
       { expected_response:true }...: avg=19.42ms  min=1.69ms  med=19.1ms  max=295.54ms p(90)=26.92ms p(95)=29.58ms  p(99.9)=50.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 305262
     http_req_receiving.............: avg=100.69µs min=27.15µs med=53.46µs max=186.14ms p(90)=97.88µs p(95)=157.84µs p(99.9)=8.76ms 
     http_req_sending...............: avg=45.25µs  min=4.99µs  med=10.82µs max=33.02ms  p(90)=19.29µs p(95)=104.07µs p(99.9)=3.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.28ms  min=1.6ms   med=18.98ms max=294.81ms p(90)=26.75ms p(95)=29.34ms  p(99.9)=49.39ms
     http_reqs......................: 305262  2539.160179/s
     iteration_duration.............: avg=19.65ms  min=3.38ms  med=19.31ms max=306.52ms p(90)=27.14ms p(95)=29.81ms  p(99.9)=50.94ms
     iterations.....................: 305162  2538.328382/s
     success_rate...................: 100.00% ✓ 305162      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 872157      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=3.32µs   min=882ns   med=1.96µs  max=16.08ms  p(90)=3.46µs  p(95)=4.18µs  p(99.9)=30.63µs 
     http_req_connecting............: avg=779ns    min=0s      med=0s      max=8.28ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.41ms  min=1.57ms  med=17.19ms max=360.65ms p(90)=33.3ms  p(95)=40.85ms p(99.9)=145.03ms
       { expected_response:true }...: avg=20.41ms  min=1.57ms  med=17.19ms max=360.65ms p(90)=33.3ms  p(95)=40.85ms p(99.9)=145.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290819
     http_req_receiving.............: avg=566.64µs min=50.18µs med=91.14µs max=157.49ms p(90)=1.08ms  p(95)=1.88ms  p(99.9)=27.63ms 
     http_req_sending...............: avg=40.49µs  min=4.56µs  med=8.29µs  max=194.46ms p(90)=16.3µs  p(95)=63.47µs p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.81ms  min=1.51ms  med=16.67ms max=360.57ms p(90)=32.35ms p(95)=39.73ms p(99.9)=142.84ms
     http_reqs......................: 290819  2419.279502/s
     iteration_duration.............: avg=20.62ms  min=2.63ms  med=17.39ms max=360.83ms p(90)=33.52ms p(95)=41.07ms p(99.9)=145.78ms
     iterations.....................: 290719  2418.447617/s
     success_rate...................: 100.00% ✓ 290719      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 859221      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.15µs   min=931ns   med=2.39µs   max=12.85ms  p(90)=3.99µs  p(95)=4.69µs  p(99.9)=33.16µs
     http_req_connecting............: avg=325ns    min=0s      med=0s       max=4.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.71ms  min=1.51ms  med=19.85ms  max=299.63ms p(90)=30.05ms p(95)=33.77ms p(99.9)=55.03ms
       { expected_response:true }...: avg=20.71ms  min=1.51ms  med=19.85ms  max=299.63ms p(90)=30.05ms p(95)=33.77ms p(99.9)=55.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286507
     http_req_receiving.............: avg=801.66µs min=52.91µs med=135.49µs max=202.98ms p(90)=1.98ms  p(95)=2.92ms  p(99.9)=20.42ms
     http_req_sending...............: avg=42.34µs  min=4.62µs  med=9.22µs   max=124.84ms p(90)=17.86µs p(95)=87.66µs p(99.9)=3.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.87ms  min=1.42ms  med=18.99ms  max=284.5ms  p(90)=29.08ms p(95)=32.72ms p(99.9)=52.95ms
     http_reqs......................: 286507  2383.579997/s
     iteration_duration.............: avg=20.93ms  min=2.91ms  med=20.06ms  max=311.44ms p(90)=30.27ms p(95)=34ms    p(99.9)=55.5ms 
     iterations.....................: 286407  2382.748053/s
     success_rate...................: 100.00% ✓ 286407      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 842061      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=2.7µs    min=901ns   med=2.01µs  max=10.05ms  p(90)=3.32µs  p(95)=3.95µs  p(99.9)=28.32µs 
     http_req_connecting............: avg=298ns    min=0s      med=0s      max=3.34ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.15ms  min=1.63ms  med=17.61ms max=343.98ms p(90)=34.62ms p(95)=42.64ms p(99.9)=156.71ms
       { expected_response:true }...: avg=21.15ms  min=1.63ms  med=17.61ms max=343.98ms p(90)=34.62ms p(95)=42.64ms p(99.9)=156.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280787
     http_req_receiving.............: avg=610.37µs min=51.37µs med=97.03µs max=189.83ms p(90)=1.13ms  p(95)=1.92ms  p(99.9)=29.27ms 
     http_req_sending...............: avg=40.2µs   min=4.74µs  med=8.66µs  max=151.56ms p(90)=15.96µs p(95)=70.09µs p(99.9)=2.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.5ms   min=1.49ms  med=17.05ms max=343.08ms p(90)=33.59ms p(95)=41.38ms p(99.9)=153.44ms
     http_reqs......................: 280787  2335.929538/s
     iteration_duration.............: avg=21.36ms  min=2.62ms  med=17.81ms max=344.13ms p(90)=34.84ms p(95)=42.88ms p(99.9)=159.29ms
     iterations.....................: 280687  2335.097616/s
     success_rate...................: 100.00% ✓ 280687      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 790131      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 317 MB  2.6 MB/s
     http_req_blocked...............: avg=3.16µs  min=902ns  med=2.17µs   max=18.27ms  p(90)=3.95µs  p(95)=4.73µs  p(99.9)=31.01µs 
     http_req_connecting............: avg=364ns   min=0s     med=0s       max=3.72ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.55ms min=1.93ms med=18.89ms  max=493.22ms p(90)=36.28ms p(95)=45.08ms p(99.9)=161.48ms
       { expected_response:true }...: avg=22.55ms min=1.93ms med=18.89ms  max=493.22ms p(90)=36.28ms p(95)=45.08ms p(99.9)=161.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263477
     http_req_receiving.............: avg=576.5µs min=51.3µs med=100.62µs max=181.16ms p(90)=1.1ms   p(95)=1.85ms  p(99.9)=28.61ms 
     http_req_sending...............: avg=40.11µs min=4.63µs med=9.19µs   max=49.07ms  p(90)=19.45µs p(95)=64.59µs p(99.9)=2.63ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.93ms min=1.86ms med=18.36ms  max=493.13ms p(90)=35.31ms p(95)=43.87ms p(99.9)=160.32ms
     http_reqs......................: 263477  2190.841092/s
     iteration_duration.............: avg=22.77ms min=3.27ms med=19.1ms   max=493.42ms p(90)=36.52ms p(95)=45.32ms p(99.9)=162.59ms
     iterations.....................: 263377  2190.009581/s
     success_rate...................: 100.00% ✓ 263377      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 589806      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 236 MB  2.0 MB/s
     http_req_blocked...............: avg=4.24µs   min=1.07µs  med=3.07µs  max=12.13ms  p(90)=5.37µs   p(95)=6.47µs   p(99.9)=49.73µs
     http_req_connecting............: avg=475ns    min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.25ms  min=2.21ms  med=29.69ms max=332.6ms  p(90)=40.15ms  p(95)=43.69ms  p(99.9)=65.08ms
       { expected_response:true }...: avg=30.25ms  min=2.21ms  med=29.69ms max=332.6ms  p(90)=40.15ms  p(95)=43.69ms  p(99.9)=65.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196702
     http_req_receiving.............: avg=102.33µs min=29.46µs med=60.87µs max=69.86ms  p(90)=133.51µs p(95)=227.75µs p(99.9)=3.94ms 
     http_req_sending...............: avg=44.95µs  min=4.78µs  med=11.26µs max=161.94ms p(90)=25.62µs  p(95)=120.81µs p(99.9)=3.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.1ms   min=2.15ms  med=29.55ms max=332.53ms p(90)=39.99ms  p(95)=43.49ms  p(99.9)=64.09ms
     http_reqs......................: 196702  1635.346629/s
     iteration_duration.............: avg=30.5ms   min=6.63ms  med=29.92ms max=346.28ms p(90)=40.38ms  p(95)=43.93ms  p(99.9)=65.54ms
     iterations.....................: 196602  1634.515246/s
     success_rate...................: 100.00% ✓ 196602      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443244      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.54µs  min=1.01µs  med=2.64µs  max=4ms      p(90)=4.31µs   p(95)=5µs      p(99.9)=35.96µs 
     http_req_connecting............: avg=604ns   min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.36ms min=2.16ms  med=39.99ms max=305.35ms p(90)=55.96ms  p(95)=60.85ms  p(99.9)=83.39ms 
       { expected_response:true }...: avg=40.36ms min=2.16ms  med=39.99ms max=305.35ms p(90)=55.96ms  p(95)=60.85ms  p(99.9)=83.39ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147848
     http_req_receiving.............: avg=77.46µs min=26.33µs med=64.5µs  max=114.79ms p(90)=103.74µs p(95)=120.49µs p(99.9)=861.36µs
     http_req_sending...............: avg=25.48µs min=4.96µs  med=12.5µs  max=68.71ms  p(90)=20.02µs  p(95)=23.62µs  p(99.9)=969.4µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.25ms min=2.08ms  med=39.89ms max=305.2ms  p(90)=55.86ms  p(95)=60.73ms  p(99.9)=83.19ms 
     http_reqs......................: 147848  1229.019331/s
     iteration_duration.............: avg=40.6ms  min=4.02ms  med=40.21ms max=316.21ms p(90)=56.17ms  p(95)=61.06ms  p(99.9)=83.76ms 
     iterations.....................: 147748  1228.188059/s
     success_rate...................: 100.00% ✓ 147748      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214578     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   714 kB/s
     http_req_blocked...............: avg=5.03µs   min=1.05µs  med=3.43µs  max=4.26ms   p(90)=5.05µs   p(95)=5.75µs   p(99.9)=49.41µs 
     http_req_connecting............: avg=1.31µs   min=0s      med=0s      max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.51ms  min=3.83ms  med=81.68ms max=344.82ms p(90)=101.54ms p(95)=111.2ms  p(99.9)=191.11ms
       { expected_response:true }...: avg=83.51ms  min=3.83ms  med=81.68ms max=344.82ms p(90)=101.54ms p(95)=111.2ms  p(99.9)=191.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71626
     http_req_receiving.............: avg=134.57µs min=29.78µs med=78.39µs max=235.99ms p(90)=115.06µs p(95)=129.42µs p(99.9)=909.64µs
     http_req_sending...............: avg=21.91µs  min=5.3µs   med=15.22µs max=44.8ms   p(90)=22.03µs  p(95)=24.37µs  p(99.9)=643.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.35ms  min=3.7ms   med=81.56ms max=324.34ms p(90)=101.38ms p(95)=111ms    p(99.9)=189.36ms
     http_reqs......................: 71626   594.356106/s
     iteration_duration.............: avg=83.89ms  min=14.52ms med=81.93ms max=351.29ms p(90)=101.81ms p(95)=111.52ms p(99.9)=194ms   
     iterations.....................: 71526   593.526301/s
     success_rate...................: 100.00% ✓ 71526      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 163134     ✗ 0    
     data_received..................: 4.8 GB  40 MB/s
     data_sent......................: 65 MB   542 kB/s
     http_req_blocked...............: avg=5.79µs   min=1.33µs  med=3.79µs   max=4.19ms   p(90)=5.36µs   p(95)=6.01µs   p(99.9)=75.54µs 
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=109.88ms min=4.84ms  med=107.84ms max=328.34ms p(90)=145.03ms p(95)=155.61ms p(99.9)=200.08ms
       { expected_response:true }...: avg=109.88ms min=4.84ms  med=107.84ms max=328.34ms p(90)=145.03ms p(95)=155.61ms p(99.9)=200.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54478
     http_req_receiving.............: avg=91.67µs  min=31.56µs med=85.86µs  max=72.01ms  p(90)=118.2µs  p(95)=131.33µs p(99.9)=598.51µs
     http_req_sending...............: avg=24.88µs  min=6.08µs  med=17.53µs  max=98.97ms  p(90)=23.11µs  p(95)=25.18µs  p(99.9)=578.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.76ms min=4.77ms  med=107.72ms max=327.99ms p(90)=144.91ms p(95)=155.49ms p(99.9)=199.65ms
     http_reqs......................: 54478   451.575418/s
     iteration_duration.............: avg=110.36ms min=26.91ms med=108.16ms max=338.18ms p(90)=145.33ms p(95)=155.92ms p(99.9)=201.42ms
     iterations.....................: 54378   450.746505/s
     success_rate...................: 100.00% ✓ 54378      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95712      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   318 kB/s
     http_req_blocked...............: avg=5.01µs   min=1.23µs  med=3.56µs   max=1.94ms   p(90)=4.96µs   p(95)=5.53µs   p(99.9)=617.78µs
     http_req_connecting............: avg=1.22µs   min=0s      med=0s       max=1.89ms   p(90)=0s       p(95)=0s       p(99.9)=596.75µs
     http_req_duration..............: avg=187.3ms  min=7.86ms  med=185.53ms max=347.23ms p(90)=199.44ms p(95)=203.42ms p(99.9)=269.15ms
       { expected_response:true }...: avg=187.3ms  min=7.86ms  med=185.53ms max=347.23ms p(90)=199.44ms p(95)=203.42ms p(99.9)=269.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32004
     http_req_receiving.............: avg=93.55µs  min=33.16µs med=90.24µs  max=8.6ms    p(90)=120.95µs p(95)=132.67µs p(99.9)=551.78µs
     http_req_sending...............: avg=24.59µs  min=5.02µs  med=17.79µs  max=48.55ms  p(90)=22.55µs  p(95)=24.43µs  p(99.9)=463.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.18ms min=7.73ms  med=185.41ms max=346.85ms p(90)=199.32ms p(95)=203.3ms  p(99.9)=269.08ms
     http_reqs......................: 32004   264.555188/s
     iteration_duration.............: avg=188.16ms min=73.71ms med=185.91ms max=360.55ms p(90)=199.72ms p(95)=203.72ms p(99.9)=271.08ms
     iterations.....................: 31904   263.728557/s
     success_rate...................: 100.00% ✓ 31904      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93777      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=6.49µs   min=1.09µs  med=3.19µs   max=4.08ms   p(90)=4.53µs   p(95)=5.06µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=3.07µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=191.23ms min=5.83ms  med=176.05ms max=630.74ms p(90)=221.44ms p(95)=268.93ms p(99.9)=565.59ms
       { expected_response:true }...: avg=191.23ms min=5.83ms  med=176.05ms max=630.74ms p(90)=221.44ms p(95)=268.93ms p(99.9)=565.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31359
     http_req_receiving.............: avg=91.07µs  min=30.39µs med=87.66µs  max=21.11ms  p(90)=117.39µs p(95)=128.69µs p(99.9)=583.48µs
     http_req_sending...............: avg=21.11µs  min=5.48µs  med=17.28µs  max=18.71ms  p(90)=21.41µs  p(95)=23.07µs  p(99.9)=496.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.12ms min=5.7ms   med=175.94ms max=630.64ms p(90)=221.33ms p(95)=268.82ms p(99.9)=565.45ms
     http_reqs......................: 31359   259.010826/s
     iteration_duration.............: avg=192.08ms min=35.71ms med=176.39ms max=630.96ms p(90)=221.87ms p(95)=270.81ms p(99.9)=565.84ms
     iterations.....................: 31259   258.184872/s
     success_rate...................: 100.00% ✓ 31259      ✗ 0    
     vus............................: 8       min=8        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 6612      ✗ 0   
     data_received..................: 221 MB  1.7 MB/s
     data_sent......................: 2.8 MB  22 kB/s
     http_req_blocked...............: avg=51.99µs  min=1.43µs  med=3.55µs  max=4.17ms   p(90)=5.17µs   p(95)=6.02µs   p(99.9)=3.75ms  
     http_req_connecting............: avg=47.23µs  min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=3.73ms  
     http_req_duration..............: avg=2.62s    min=31.23ms med=2.73s   max=5.06s    p(90)=3.46s    p(95)=3.69s    p(99.9)=5.01s   
       { expected_response:true }...: avg=2.62s    min=31.23ms med=2.73s   max=5.06s    p(90)=3.46s    p(95)=3.69s    p(99.9)=5.01s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2304
     http_req_receiving.............: avg=96.2µs   min=34.96µs med=91.61µs max=650.83µs p(90)=133.58µs p(95)=151.35µs p(99.9)=305.58µs
     http_req_sending...............: avg=127.62µs min=5.84µs  med=18.31µs max=62.87ms  p(90)=23.88µs  p(95)=29.45µs  p(99.9)=23.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.62s    min=31.1ms  med=2.73s   max=5.06s    p(90)=3.46s    p(95)=3.69s    p(99.9)=5.01s   
     http_reqs......................: 2304    18.27024/s
     iteration_duration.............: avg=2.74s    min=304.8ms med=2.76s   max=5.06s    p(90)=3.49s    p(95)=3.7s     p(99.9)=5.02s   
     iterations.....................: 2204    17.477261/s
     success_rate...................: 100.00% ✓ 2204      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

