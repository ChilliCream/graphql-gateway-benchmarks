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
| hive-router | v0.0.84 | 2,907 | 3,067 | 2,896 | 2.1% |  |
| fusion | 16.6.0 | 2,565 | 2,666 | 2,517 | 1.8% |  |
| fusion-nightly | 16.6.1-p.1 | 2,519 | 2,622 | 2,506 | 1.5% |  |
| fusion-nightly-net11 | 16.6.1-p.1 | 2,510 | 2,644 | 2,482 | 2.2% |  |
| fusion-nightly-fed | 16.6.1-p.1 | 2,399 | 2,480 | 2,380 | 1.4% |  |
| cosmo | 0.334.0 | 1,197 | 1,233 | 1,186 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 565 | 574 | 561 | 0.7% |  |
| hive-gateway | 2.10.8 | 249 | 252 | 247 | 0.7% |  |
| apollo-gateway | 2.14.3 | 233 | 240 | 232 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (12414 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (551909 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.1-p.1 | 2,461 | 2,566 | 2,453 | 1.6% |  |
| fusion-nightly | 16.6.1-p.1 | 2,398 | 2,486 | 2,395 | 1.3% |  |
| hive-router | v0.0.84 | 2,370 | 2,488 | 2,341 | 2.1% |  |
| fusion | 16.6.0 | 2,300 | 2,383 | 2,275 | 1.6% |  |
| fusion-nightly-fed | 16.6.1-p.1 | 2,152 | 2,241 | 2,137 | 1.7% |  |
| cosmo | 0.334.0 | 1,170 | 1,213 | 1,162 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 530 | 543 | 525 | 1.0% |  |
| hive-gateway | 2.10.8 | 245 | 249 | 244 | 0.6% |  |
| apollo-gateway | 2.14.3 | 236 | 240 | 234 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (46976 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (616452 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 535044      ✗ 0     
     data_received..................: 16 GB   255 MB/s
     data_sent......................: 215 MB  3.5 MB/s
     http_req_blocked...............: avg=17.44µs  min=852ns   med=2.11µs  max=57.62ms  p(90)=3.6µs    p(95)=4.75µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=14.44µs  min=0s      med=0s      max=57.56ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=79.24ms  min=1.44ms  med=74.59ms max=327.69ms p(90)=152.47ms p(95)=166.51ms p(99.9)=221.73ms
       { expected_response:true }...: avg=79.24ms  min=1.44ms  med=74.59ms max=327.69ms p(90)=152.47ms p(95)=166.51ms p(99.9)=221.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179348
     http_req_receiving.............: avg=157.73µs min=25.79µs med=49.54µs max=61.34ms  p(90)=134.44µs p(95)=326.05µs p(99.9)=22.02ms 
     http_req_sending...............: avg=68.91µs  min=4.63µs  med=9.18µs  max=141.58ms p(90)=17.91µs  p(95)=111.61µs p(99.9)=9.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.02ms  min=1.39ms  med=74.41ms max=327.52ms p(90)=152.13ms p(95)=166.15ms p(99.9)=219.61ms
     http_reqs......................: 179348  2907.378085/s
     iteration_duration.............: avg=79.92ms  min=2.08ms  med=75.37ms max=346.35ms p(90)=152.87ms p(95)=166.99ms p(99.9)=222.19ms
     iterations.....................: 178348  2891.167266/s
     success_rate...................: 100.00% ✓ 178348      ✗ 0     
     vus............................: 87      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 476853      ✗ 0     
     data_received..................: 14 GB   225 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=30.31µs min=1.04µs  med=2.58µs  max=80.61ms  p(90)=4.18µs   p(95)=5.35µs   p(99.9)=6.87ms  
     http_req_connecting............: avg=26.79µs min=0s      med=0s      max=78.5ms   p(90)=0s       p(95)=0s       p(99.9)=6.62ms  
     http_req_duration..............: avg=88.89ms min=1.97ms  med=74.91ms max=1.78s    p(90)=171.98ms p(95)=201.51ms p(99.9)=660.11ms
       { expected_response:true }...: avg=88.89ms min=1.97ms  med=74.91ms max=1.78s    p(90)=171.98ms p(95)=201.51ms p(99.9)=660.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159951
     http_req_receiving.............: avg=1.46ms  min=52.43µs med=98.12µs max=698.91ms p(90)=1.39ms   p(95)=4.06ms   p(99.9)=120.61ms
     http_req_sending...............: avg=81.25µs min=4.54µs  med=9.64µs  max=138.36ms p(90)=18.19µs  p(95)=118.66µs p(99.9)=13.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.34ms min=1.89ms  med=73.77ms max=1.78s    p(90)=169.9ms  p(95)=198.32ms p(99.9)=629.76ms
     http_reqs......................: 159951  2565.409835/s
     iteration_duration.............: avg=89.72ms min=3.37ms  med=75.86ms max=1.78s    p(90)=172.53ms p(95)=202.26ms p(99.9)=661.09ms
     iterations.....................: 158951  2549.371112/s
     success_rate...................: 100.00% ✓ 158951      ✗ 0     
     vus............................: 73      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 468600      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 189 MB  3.0 MB/s
     http_req_blocked...............: avg=17.65µs min=892ns   med=2.14µs  max=65.36ms  p(90)=3.53µs   p(95)=4.62µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=14.9µs  min=0s      med=0s      max=65.32ms  p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=90.43ms min=1.98ms  med=80.11ms max=1.57s    p(90)=172.53ms p(95)=201.03ms p(99.9)=640.42ms
       { expected_response:true }...: avg=90.43ms min=1.98ms  med=80.11ms max=1.57s    p(90)=172.53ms p(95)=201.03ms p(99.9)=640.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157200
     http_req_receiving.............: avg=1.45ms  min=50.21µs med=95.85µs max=595.66ms p(90)=1.62ms   p(95)=4.42ms   p(99.9)=122.52ms
     http_req_sending...............: avg=64.69µs min=4.83µs  med=8.9µs   max=217.85ms p(90)=16.76µs  p(95)=104.29µs p(99.9)=9.52ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.91ms min=1.86ms  med=79ms    max=1.57s    p(90)=170.15ms p(95)=197.04ms p(99.9)=609.73ms
     http_reqs......................: 157200  2519.302643/s
     iteration_duration.............: avg=91.3ms  min=3.29ms  med=81.19ms max=1.57s    p(90)=173.11ms p(95)=201.64ms p(99.9)=641.68ms
     iterations.....................: 156200  2503.276544/s
     success_rate...................: 100.00% ✓ 156200      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 465261      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=17.25µs  min=881ns   med=2.27µs   max=79.23ms  p(90)=3.81µs   p(95)=4.83µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=14.03µs  min=0s      med=0s       max=79.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=91.09ms  min=1.86ms  med=86.23ms  max=316.71ms p(90)=174.04ms p(95)=190.4ms  p(99.9)=245.13ms
       { expected_response:true }...: avg=91.09ms  min=1.86ms  med=86.23ms  max=316.71ms p(90)=174.04ms p(95)=190.4ms  p(99.9)=245.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156087
     http_req_receiving.............: avg=642.91µs min=51.59µs med=105.95µs max=192.46ms p(90)=1.2ms    p(95)=2.15ms   p(99.9)=25.6ms  
     http_req_sending...............: avg=60.96µs  min=4.3µs   med=8.89µs   max=146.55ms p(90)=16.82µs  p(95)=109.28µs p(99.9)=8.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.39ms  min=1.79ms  med=85.44ms  max=310.21ms p(90)=173.22ms p(95)=189.51ms p(99.9)=244.11ms
     http_reqs......................: 156087  2510.121002/s
     iteration_duration.............: avg=91.93ms  min=3.79ms  med=87.2ms   max=325.28ms p(90)=174.51ms p(95)=190.9ms  p(99.9)=246.06ms
     iterations.....................: 155087  2494.039451/s
     success_rate...................: 100.00% ✓ 155087      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443451      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=12.42µs min=862ns   med=2.06µs  max=55.14ms  p(90)=3.41µs   p(95)=4.42µs   p(99.9)=1.19ms  
     http_req_connecting............: avg=9.61µs  min=0s      med=0s      max=41.9ms   p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=95.67ms min=1.62ms  med=82.28ms max=1.79s    p(90)=179.69ms p(95)=207.79ms p(99.9)=730.69ms
       { expected_response:true }...: avg=95.67ms min=1.62ms  med=82.28ms max=1.79s    p(90)=179.69ms p(95)=207.79ms p(99.9)=730.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148817
     http_req_receiving.............: avg=1.68ms  min=52.66µs med=98.04µs max=1.2s     p(90)=1.52ms   p(95)=3.76ms   p(99.9)=318.41ms
     http_req_sending...............: avg=57.04µs min=4.55µs  med=8.8µs   max=138.12ms p(90)=16.27µs  p(95)=96.59µs  p(99.9)=7.76ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.92ms min=1.56ms  med=81.43ms max=1.79s    p(90)=177.97ms p(95)=204.22ms p(99.9)=687.3ms 
     http_reqs......................: 148817  2399.419137/s
     iteration_duration.............: avg=96.55ms min=2.77ms  med=83.14ms max=1.79s    p(90)=180.23ms p(95)=208.55ms p(99.9)=731.32ms
     iterations.....................: 147817  2383.29585/s
     success_rate...................: 100.00% ✓ 147817      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 221433      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.76µs   min=1.02µs  med=2.45µs   max=9.64ms   p(90)=4.08µs   p(95)=4.94µs   p(99.9)=482.24µs
     http_req_connecting............: avg=2.67µs   min=0s      med=0s       max=9.58ms   p(90)=0s       p(95)=0s       p(99.9)=406.96µs
     http_req_duration..............: avg=190.74ms min=1.86ms  med=191.46ms max=515.6ms  p(90)=354.73ms p(95)=380.82ms p(99.9)=457.24ms
       { expected_response:true }...: avg=190.74ms min=1.86ms  med=191.46ms max=515.6ms  p(90)=354.73ms p(95)=380.82ms p(99.9)=457.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74811
     http_req_receiving.............: avg=73.38µs  min=27.24µs med=58.81µs  max=215.41ms p(90)=95.4µs   p(95)=110.26µs p(99.9)=921.71µs
     http_req_sending...............: avg=26.49µs  min=4.93µs  med=10.61µs  max=73.97ms  p(90)=16.87µs  p(95)=20.41µs  p(99.9)=3.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.64ms min=1.79ms  med=191.36ms max=515.5ms  p(90)=354.62ms p(95)=380.72ms p(99.9)=457.16ms
     http_reqs......................: 74811   1197.616475/s
     iteration_duration.............: avg=193.57ms min=4.35ms  med=194.6ms  max=515.8ms  p(90)=355.57ms p(95)=381.4ms  p(99.9)=457.68ms
     iterations.....................: 73811   1181.607914/s
     success_rate...................: 100.00% ✓ 73811       ✗ 0    
     vus............................: 78      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 106053     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   679 kB/s
     http_req_blocked...............: avg=8.32µs   min=1.23µs  med=2.98µs   max=3.83ms   p(90)=4.65µs   p(95)=5.61µs   p(99.9)=1.42ms
     http_req_connecting............: avg=4.36µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms 
     http_req_duration..............: avg=394.38ms min=3.54ms  med=368.79ms max=1.63s    p(90)=775.01ms p(95)=842.41ms p(99.9)=1.24s 
       { expected_response:true }...: avg=394.38ms min=3.54ms  med=368.79ms max=1.63s    p(90)=775.01ms p(95)=842.41ms p(99.9)=1.24s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36351
     http_req_receiving.............: avg=85.4µs   min=29.43µs med=68.27µs  max=177.23ms p(90)=106.03µs p(95)=120.2µs  p(99.9)=1.15ms
     http_req_sending...............: avg=26.88µs  min=5.56µs  med=13.53µs  max=55.24ms  p(90)=20.72µs  p(95)=23.9µs   p(99.9)=2.45ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=394.26ms min=3.48ms  med=368.67ms max=1.63s    p(90)=774.93ms p(95)=842.32ms p(99.9)=1.24s 
     http_reqs......................: 36351   565.872402/s
     iteration_duration.............: avg=405.77ms min=12.07ms med=382.75ms max=1.63s    p(90)=778.18ms p(95)=844.68ms p(99.9)=1.25s 
     iterations.....................: 35351   550.305501/s
     success_rate...................: 100.00% ✓ 35351      ✗ 0    
     vus............................: 69      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47388      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=14.96µs  min=912ns   med=3.6µs    max=15.01ms p(90)=5.36µs   p(95)=6.86µs   p(99.9)=2.19ms
     http_req_connecting............: avg=9.74µs   min=0s      med=0s       max=14.94ms p(90)=0s       p(95)=0s       p(99.9)=2.17ms
     http_req_duration..............: avg=847.75ms min=5.53ms  med=729.66ms max=17.8s   p(90)=1.47s    p(95)=1.63s    p(99.9)=17.31s
       { expected_response:true }...: avg=847.75ms min=5.53ms  med=729.66ms max=17.8s   p(90)=1.47s    p(95)=1.63s    p(99.9)=17.31s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16796
     http_req_receiving.............: avg=100.14µs min=36µs    med=91.29µs  max=32.73ms p(90)=129.06µs p(95)=145.48µs p(99.9)=1.13ms
     http_req_sending...............: avg=36.26µs  min=6.05µs  med=17.96µs  max=61.76ms p(90)=23.36µs  p(95)=27.58µs  p(99.9)=3.51ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=847.62ms min=5.4ms   med=729.57ms max=17.8s   p(90)=1.47s    p(95)=1.63s    p(99.9)=17.31s
     http_reqs......................: 16796   249.62311/s
     iteration_duration.............: avg=901.51ms min=44.99ms med=790.55ms max=17.8s   p(90)=1.49s    p(95)=1.64s    p(99.9)=17.31s
     iterations.....................: 15796   234.761053/s
     success_rate...................: 100.00% ✓ 15796      ✗ 0    
     vus............................: 70      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48171      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   285 kB/s
     http_req_blocked...............: avg=13.86µs  min=1.31µs  med=3.54µs   max=4.37ms  p(90)=5.21µs   p(95)=6.57µs   p(99.9)=2.24ms
     http_req_connecting............: avg=8.61µs   min=0s      med=0s       max=4ms     p(90)=0s       p(95)=0s       p(99.9)=2.16ms
     http_req_duration..............: avg=402.33ms min=7.59ms  med=448.92ms max=1.15s   p(90)=691.72ms p(95)=739.17ms p(99.9)=1.03s 
       { expected_response:true }...: avg=402.33ms min=7.59ms  med=448.92ms max=1.15s   p(90)=691.72ms p(95)=739.17ms p(99.9)=1.03s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17057
     http_req_receiving.............: avg=93.52µs  min=32.51µs med=84.59µs  max=38.34ms p(90)=124.04µs p(95)=138.59µs p(99.9)=1.07ms
     http_req_sending...............: avg=37.87µs  min=5.8µs   med=17.39µs  max=70.13ms p(90)=22.89µs  p(95)=27.37µs  p(99.9)=3.46ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=402.2ms  min=7.47ms  med=448.85ms max=1.15s   p(90)=691.54ms p(95)=739.04ms p(99.9)=1.03s 
     http_reqs......................: 17057   233.039309/s
     iteration_duration.............: avg=427.38ms min=12.71ms med=469.05ms max=1.16s   p(90)=697.19ms p(95)=742.34ms p(99.9)=1.04s 
     iterations.....................: 16057   219.376923/s
     success_rate...................: 100.00% ✓ 16057      ✗ 0    
     vus............................: 55      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453519      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 183 MB  3.0 MB/s
     http_req_blocked...............: avg=20.27µs  min=921ns   med=2.47µs   max=66.84ms  p(90)=4.4µs    p(95)=5.56µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=16.78µs  min=0s      med=0s       max=66.65ms  p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=93.43ms  min=1.46ms  med=88.23ms  max=327.07ms p(90)=178.58ms p(95)=195.09ms p(99.9)=252.4ms 
       { expected_response:true }...: avg=93.43ms  min=1.46ms  med=88.23ms  max=327.07ms p(90)=178.58ms p(95)=195.09ms p(99.9)=252.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 152173
     http_req_receiving.............: avg=638.52µs min=51.89µs med=106.65µs max=81.65ms  p(90)=1.25ms   p(95)=2.23ms   p(99.9)=27.28ms 
     http_req_sending...............: avg=69.59µs  min=5µs     med=10.05µs  max=185.92ms p(90)=21.92µs  p(95)=118.75µs p(99.9)=9.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.72ms  min=1.4ms   med=87.56ms  max=326.54ms p(90)=177.69ms p(95)=194.21ms p(99.9)=250.85ms
     http_reqs......................: 152173  2461.040563/s
     iteration_duration.............: avg=94.31ms  min=3.22ms  med=89.25ms  max=381.62ms p(90)=179.04ms p(95)=195.53ms p(99.9)=254.15ms
     iterations.....................: 151173  2444.867913/s
     success_rate...................: 100.00% ✓ 151173      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 442530      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=22.85µs min=1.06µs  med=2.97µs   max=72.9ms   p(90)=4.86µs   p(95)=6.11µs   p(99.9)=2.14ms  
     http_req_connecting............: avg=19.07µs min=0s      med=0s       max=64.69ms  p(90)=0s       p(95)=0s       p(99.9)=2.08ms  
     http_req_duration..............: avg=95.77ms min=1.58ms  med=80.18ms  max=1.4s     p(90)=185.48ms p(95)=215.11ms p(99.9)=944.83ms
       { expected_response:true }...: avg=95.77ms min=1.58ms  med=80.18ms  max=1.4s     p(90)=185.48ms p(95)=215.11ms p(99.9)=944.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148510
     http_req_receiving.............: avg=1.34ms  min=53.11µs med=105.59µs max=974.39ms p(90)=1.5ms    p(95)=4.1ms    p(99.9)=72.68ms 
     http_req_sending...............: avg=78.26µs min=5.08µs  med=10.86µs  max=289.68ms p(90)=21.16µs  p(95)=126.87µs p(99.9)=10.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.35ms min=1.45ms  med=78.93ms  max=1.37s    p(90)=183.45ms p(95)=211.57ms p(99.9)=917.29ms
     http_reqs......................: 148510  2398.588299/s
     iteration_duration.............: avg=96.7ms  min=2.9ms   med=81.12ms  max=1.4s     p(90)=186.14ms p(95)=215.91ms p(99.9)=946.09ms
     iterations.....................: 147510  2382.437277/s
     success_rate...................: 100.00% ✓ 147510      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 437307      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=22.11µs  min=1.04µs  med=3.11µs  max=58.47ms  p(90)=5.13µs   p(95)=6.49µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=18.21µs  min=0s      med=0s      max=58.33ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=96.88ms  min=1.57ms  med=91.75ms max=321ms    p(90)=187.03ms p(95)=204.16ms p(99.9)=263.1ms 
       { expected_response:true }...: avg=96.88ms  min=1.57ms  med=91.75ms max=321ms    p(90)=187.03ms p(95)=204.16ms p(99.9)=263.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 146769
     http_req_receiving.............: avg=172.89µs min=26.66µs med=58.89µs max=85.19ms  p(90)=170.27µs p(95)=398.33µs p(99.9)=20.28ms 
     http_req_sending...............: avg=76.89µs  min=4.58µs  med=12µs    max=161.52ms p(90)=23.6µs   p(95)=140.05µs p(99.9)=10.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.63ms  min=1.48ms  med=91.51ms max=320.46ms p(90)=186.66ms p(95)=203.66ms p(99.9)=262.18ms
     http_reqs......................: 146769  2370.970933/s
     iteration_duration.............: avg=97.82ms  min=3.82ms  med=92.8ms  max=359.32ms p(90)=187.57ms p(95)=204.66ms p(99.9)=264.61ms
     iterations.....................: 145769  2354.816494/s
     success_rate...................: 100.00% ✓ 145769      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 424311      ✗ 0     
     data_received..................: 13 GB   202 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=24.07µs  min=1.11µs  med=3µs      max=63.09ms  p(90)=4.8µs    p(95)=6.01µs   p(99.9)=5.13ms 
     http_req_connecting............: avg=20.22µs  min=0s      med=0s       max=62.97ms  p(90)=0s       p(95)=0s       p(99.9)=5.04ms 
     http_req_duration..............: avg=99.87ms  min=1.49ms  med=82.58ms  max=2.36s    p(90)=191.46ms p(95)=227.71ms p(99.9)=1.03s  
       { expected_response:true }...: avg=99.87ms  min=1.49ms  med=82.58ms  max=2.36s    p(90)=191.46ms p(95)=227.71ms p(99.9)=1.03s  
     http_req_failed................: 0.00%   ✓ 0           ✗ 142437
     http_req_receiving.............: avg=1.8ms    min=54.95µs med=114.06µs max=1.53s    p(90)=2.02ms   p(95)=5.73ms   p(99.9)=87.77ms
     http_req_sending...............: avg=76.91µs  min=5.17µs  med=11.14µs  max=148.94ms p(90)=20.95µs  p(95)=124.02µs p(99.9)=10.41ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=97.99ms  min=1.41ms  med=81.36ms  max=2.36s    p(90)=188.7ms  p(95)=222.45ms p(99.9)=1.01s  
     http_reqs......................: 142437  2300.990016/s
     iteration_duration.............: avg=100.89ms min=2.89ms  med=83.62ms  max=2.36s    p(90)=192.27ms p(95)=228.64ms p(99.9)=1.04s  
     iterations.....................: 141437  2284.835575/s
     success_rate...................: 100.00% ✓ 141437      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 398577      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=15.78µs  min=942ns   med=2.93µs   max=85.23ms  p(90)=4.79µs   p(95)=6µs      p(99.9)=1.25ms  
     http_req_connecting............: avg=12.05µs  min=0s      med=0s       max=85.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=106.35ms min=1.76ms  med=92.45ms  max=1.7s     p(90)=202.8ms  p(95)=237.38ms p(99.9)=728.58ms
       { expected_response:true }...: avg=106.35ms min=1.76ms  med=92.45ms  max=1.7s     p(90)=202.8ms  p(95)=237.38ms p(99.9)=728.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133859
     http_req_receiving.............: avg=1.6ms    min=53.64µs med=116.69µs max=662.74ms p(90)=1.78ms   p(95)=4.66ms   p(99.9)=111.96ms
     http_req_sending...............: avg=69.93µs  min=4.39µs  med=11.12µs  max=176.6ms  p(90)=21.52µs  p(95)=116.66µs p(99.9)=9.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.68ms min=1.67ms  med=91.36ms  max=1.7s     p(90)=200.84ms p(95)=234.62ms p(99.9)=703.61ms
     http_reqs......................: 133859  2152.390773/s
     iteration_duration.............: avg=107.43ms min=3.08ms  med=93.57ms  max=1.7s     p(90)=203.53ms p(95)=238.56ms p(99.9)=728.89ms
     iterations.....................: 132859  2136.311236/s
     success_rate...................: 100.00% ✓ 132859      ✗ 0     
     vus............................: 68      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 216855      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.01µs   min=1.02µs  med=2.48µs   max=16.34ms  p(90)=4.38µs   p(95)=5.36µs   p(99.9)=496.77µs
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=16.28ms  p(90)=0s       p(95)=0s       p(99.9)=439.07µs
     http_req_duration..............: avg=194.71ms min=1.96ms  med=195.09ms max=518.82ms p(90)=360.35ms p(95)=385.49ms p(99.9)=469ms   
       { expected_response:true }...: avg=194.71ms min=1.96ms  med=195.09ms max=518.82ms p(90)=360.35ms p(95)=385.49ms p(99.9)=469ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 73285
     http_req_receiving.............: avg=74.57µs  min=26.86µs med=62.29µs  max=35.07ms  p(90)=102.87µs p(95)=117.78µs p(99.9)=1.04ms  
     http_req_sending...............: avg=33.93µs  min=4.92µs  med=11.44µs  max=184.88ms p(90)=19.58µs  p(95)=23.1µs   p(99.9)=3.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.6ms  min=1.85ms  med=194.97ms max=518.76ms p(90)=360.28ms p(95)=385.34ms p(99.9)=468.94ms
     http_reqs......................: 73285   1170.177585/s
     iteration_duration.............: avg=197.64ms min=4.63ms  med=198.17ms max=518.97ms p(90)=361.18ms p(95)=386.13ms p(99.9)=469.3ms 
     iterations.....................: 72285   1154.210094/s
     success_rate...................: 100.00% ✓ 72285       ✗ 0    
     vus............................: 86      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99828      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   637 kB/s
     http_req_blocked...............: avg=8.28µs   min=1.21µs  med=3.17µs   max=13.85ms  p(90)=4.93µs   p(95)=6µs      p(99.9)=836.53µs
     http_req_connecting............: avg=3.97µs   min=0s      med=0s       max=13.75ms  p(90)=0s       p(95)=0s       p(99.9)=786.73µs
     http_req_duration..............: avg=418.69ms min=3.75ms  med=384.25ms max=1.63s    p(90)=822.03ms p(95)=896.72ms p(99.9)=1.38s   
       { expected_response:true }...: avg=418.69ms min=3.75ms  med=384.25ms max=1.63s    p(90)=822.03ms p(95)=896.72ms p(99.9)=1.38s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34276
     http_req_receiving.............: avg=93.44µs  min=29.08µs med=74.88µs  max=127.32ms p(90)=113.63µs p(95)=128.13µs p(99.9)=1.36ms  
     http_req_sending...............: avg=32.68µs  min=5.43µs  med=14.68µs  max=91.77ms  p(90)=21.77µs  p(95)=24.79µs  p(99.9)=2.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=418.56ms min=3.66ms  med=384.12ms max=1.63s    p(90)=821.94ms p(95)=896.62ms p(99.9)=1.38s   
     http_reqs......................: 34276   530.171948/s
     iteration_duration.............: avg=431.5ms  min=17.53ms med=400.13ms max=1.63s    p(90)=826.4ms  p(95)=899.97ms p(99.9)=1.39s   
     iterations.....................: 33276   514.704217/s
     success_rate...................: 100.00% ✓ 33276      ✗ 0    
     vus............................: 84      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46824      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=14.39µs  min=1.07µs  med=3.32µs   max=13.31ms p(90)=5.12µs   p(95)=6.88µs   p(99.9)=2.12ms
     http_req_connecting............: avg=9.39µs   min=0s      med=0s       max=13.23ms p(90)=0s       p(95)=0s       p(99.9)=2.1ms 
     http_req_duration..............: avg=875.99ms min=5.84ms  med=787.75ms max=4.77s   p(90)=1.74s    p(95)=1.99s    p(99.9)=4.09s 
       { expected_response:true }...: avg=875.99ms min=5.84ms  med=787.75ms max=4.77s   p(90)=1.74s    p(95)=1.99s    p(99.9)=4.09s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16608
     http_req_receiving.............: avg=105.32µs min=31.15µs med=94.79µs  max=22.41ms p(90)=132.98µs p(95)=147.76µs p(99.9)=1.36ms
     http_req_sending...............: avg=37.3µs   min=5.82µs  med=17.86µs  max=88.73ms p(90)=23.56µs  p(95)=28.62µs  p(99.9)=3.72ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=875.85ms min=5.7ms   med=787.64ms max=4.77s   p(90)=1.74s    p(95)=1.99s    p(99.9)=4.09s 
     http_reqs......................: 16608   245.263024/s
     iteration_duration.............: avg=932.15ms min=19.62ms med=858.34ms max=4.77s   p(90)=1.78s    p(95)=2.01s    p(99.9)=4.11s 
     iterations.....................: 15608   230.49526/s
     success_rate...................: 100.00% ✓ 15608      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45822      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   283 kB/s
     http_req_blocked...............: avg=11.89µs  min=1.42µs  med=3.8µs    max=2.45ms  p(90)=5.71µs   p(95)=7.33µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=6.18µs   min=0s      med=0s       max=2.42ms  p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=891.99ms min=7.91ms  med=815.59ms max=3.15s   p(90)=1.83s    p(95)=1.94s    p(99.9)=2.71s   
       { expected_response:true }...: avg=891.99ms min=7.91ms  med=815.59ms max=3.15s   p(90)=1.83s    p(95)=1.94s    p(99.9)=2.71s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16274
     http_req_receiving.............: avg=104.25µs min=36.62µs med=95.32µs  max=24.03ms p(90)=135.63µs p(95)=151.59µs p(99.9)=840.73µs
     http_req_sending...............: avg=29.16µs  min=6.32µs  med=18.78µs  max=10.06ms p(90)=24.89µs  p(95)=29.87µs  p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=891.85ms min=7.76ms  med=815.45ms max=3.15s   p(90)=1.83s    p(95)=1.94s    p(99.9)=2.71s   
     http_reqs......................: 16274   236.004384/s
     iteration_duration.............: avg=950.34ms min=28.54ms med=875.48ms max=3.15s   p(90)=1.86s    p(95)=1.94s    p(99.9)=2.73s   
     iterations.....................: 15274   221.502455/s
     success_rate...................: 100.00% ✓ 15274      ✗ 0    
     vus............................: 47      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

