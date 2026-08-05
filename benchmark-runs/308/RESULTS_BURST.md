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
| hive-router | v0.0.84 | 2,818 | 2,966 | 2,783 | 2.1% |  |
| fusion-nightly-net11 | 16.6.0-p.15 | 2,477 | 2,593 | 2,459 | 1.8% |  |
| fusion-nightly | 16.6.0-p.15 | 2,467 | 2,552 | 2,435 | 1.5% |  |
| fusion | 16.5.1 | 2,447 | 2,549 | 2,430 | 1.6% |  |
| fusion-nightly-fed | 16.6.0-p.15 | 2,307 | 2,379 | 2,281 | 1.4% |  |
| cosmo | 0.334.0 | 1,238 | 1,271 | 1,230 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 588 | 574 | 0.9% |  |
| hive-gateway | 2.10.8 | 261 | 264 | 259 | 0.5% |  |
| apollo-gateway | 2.14.3 | 234 | 240 | 234 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (6830 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (543108 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.15 | 2,393 | 2,466 | 2,365 | 1.3% |  |
| fusion-nightly | 16.6.0-p.15 | 2,293 | 2,390 | 2,271 | 1.8% |  |
| fusion | 16.5.1 | 2,285 | 2,355 | 2,248 | 1.6% |  |
| hive-router | v0.0.84 | 2,198 | 2,368 | 2,182 | 2.8% |  |
| fusion-nightly-fed | 16.6.0-p.15 | 2,152 | 2,242 | 2,136 | 1.7% |  |
| cosmo | 0.334.0 | 1,115 | 1,164 | 1,107 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 540 | 553 | 537 | 1.0% |  |
| hive-gateway | 2.10.8 | 248 | 255 | 246 | 1.1% |  |
| apollo-gateway | 2.14.3 | 236 | 240 | 235 | 0.6% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (38450 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (364308 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 518172      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=25.6µs   min=812ns   med=2.5µs   max=98.58ms  p(90)=4.31µs   p(95)=5.5µs    p(99.9)=2.48ms  
     http_req_connecting............: avg=21.56µs  min=0s      med=0s      max=61.26ms  p(90)=0s       p(95)=0s       p(99.9)=2.35ms  
     http_req_duration..............: avg=81.74ms  min=1.34ms  med=73.86ms max=373.61ms p(90)=159.39ms p(95)=176.8ms  p(99.9)=240.09ms
       { expected_response:true }...: avg=81.74ms  min=1.34ms  med=73.86ms max=373.61ms p(90)=159.39ms p(95)=176.8ms  p(99.9)=240.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173724
     http_req_receiving.............: avg=209.08µs min=25.42µs med=52.21µs max=235.27ms p(90)=166.67µs p(95)=364.71µs p(99.9)=27.97ms 
     http_req_sending...............: avg=79.57µs  min=4.65µs  med=9.85µs  max=160.22ms p(90)=19.79µs  p(95)=127.21µs p(99.9)=12.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.46ms  min=1.28ms  med=73.65ms max=268.03ms p(90)=158.96ms p(95)=176.15ms p(99.9)=237.79ms
     http_reqs......................: 173724  2818.292873/s
     iteration_duration.............: avg=82.53ms  min=2.19ms  med=74.79ms max=387.83ms p(90)=159.89ms p(95)=177.35ms p(99.9)=242.47ms
     iterations.....................: 172724  2802.070055/s
     success_rate...................: 100.00% ✓ 172724      ✗ 0     
     vus............................: 86      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459828      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=14.05µs  min=882ns   med=2.06µs   max=52.81ms  p(90)=3.41µs   p(95)=4.42µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=11.24µs  min=0s      med=0s       max=52.76ms  p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=92.18ms  min=1.84ms  med=87.88ms  max=330.04ms p(90)=175.29ms p(95)=190.37ms p(99.9)=256.55ms
       { expected_response:true }...: avg=92.18ms  min=1.84ms  med=87.88ms  max=330.04ms p(90)=175.29ms p(95)=190.37ms p(99.9)=256.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154276
     http_req_receiving.............: avg=764.78µs min=51.87µs med=127.86µs max=314.44ms p(90)=1.52ms   p(95)=2.42ms   p(99.9)=27.69ms 
     http_req_sending...............: avg=58.35µs  min=4.43µs  med=8.78µs   max=112.04ms p(90)=17.24µs  p(95)=102.26µs p(99.9)=7.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.36ms  min=1.78ms  med=86.98ms  max=329.88ms p(90)=174.38ms p(95)=189.3ms  p(99.9)=255.65ms
     http_reqs......................: 154276  2477.753667/s
     iteration_duration.............: avg=93.02ms  min=3.45ms  med=88.83ms  max=345.12ms p(90)=175.7ms  p(95)=190.74ms p(99.9)=257.53ms
     iterations.....................: 153276  2461.693142/s
     success_rate...................: 100.00% ✓ 153276      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458085      ✗ 0     
     data_received..................: 14 GB   216 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=18.86µs min=1.08µs  med=2.63µs  max=84.49ms  p(90)=4.15µs   p(95)=5.21µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=15.45µs min=0s      med=0s      max=84.41ms  p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=92.55ms min=1.91ms  med=81.78ms max=1.3s     p(90)=175.92ms p(95)=205.44ms p(99.9)=630.09ms
       { expected_response:true }...: avg=92.55ms min=1.91ms  med=81.78ms max=1.3s     p(90)=175.92ms p(95)=205.44ms p(99.9)=630.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153695
     http_req_receiving.............: avg=1.57ms  min=52.88µs med=101µs   max=850.92ms p(90)=1.77ms   p(95)=4.82ms   p(99.9)=110.75ms
     http_req_sending...............: avg=67.48µs min=4.65µs  med=9.47µs  max=138.57ms p(90)=16.95µs  p(95)=114.21µs p(99.9)=9.13ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.91ms min=1.83ms  med=80.64ms max=1.3s     p(90)=173.87ms p(95)=202.13ms p(99.9)=607.05ms
     http_reqs......................: 153695  2467.730333/s
     iteration_duration.............: avg=93.41ms min=3.4ms   med=82.77ms max=1.3s     p(90)=176.57ms p(95)=206.14ms p(99.9)=630.94ms
     iterations.....................: 152695  2451.674311/s
     success_rate...................: 100.00% ✓ 152695      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 454500      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 183 MB  2.9 MB/s
     http_req_blocked...............: avg=16.73µs min=881ns   med=2.14µs  max=61.61ms  p(90)=3.58µs   p(95)=4.68µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=13.64µs min=0s      med=0s      max=52.92ms  p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=93.33ms min=1.99ms  med=79.65ms max=1.92s    p(90)=176.11ms p(95)=208.78ms p(99.9)=852.07ms
       { expected_response:true }...: avg=93.33ms min=1.99ms  med=79.65ms max=1.92s    p(90)=176.11ms p(95)=208.78ms p(99.9)=852.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152500
     http_req_receiving.............: avg=1.69ms  min=51.42µs med=96.87µs max=808.01ms p(90)=1.72ms   p(95)=5.08ms   p(99.9)=133.42ms
     http_req_sending...............: avg=59.55µs min=4.52µs  med=8.86µs  max=93.17ms  p(90)=17.01µs  p(95)=98.58µs  p(99.9)=8.4ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.57ms min=1.91ms  med=78.53ms max=1.92s    p(90)=173.94ms p(95)=204.34ms p(99.9)=829.11ms
     http_reqs......................: 152500  2447.463007/s
     iteration_duration.............: avg=94.21ms min=3.37ms  med=80.58ms max=1.92s    p(90)=176.68ms p(95)=209.74ms p(99.9)=856.63ms
     iterations.....................: 151500  2431.414069/s
     success_rate...................: 100.00% ✓ 151500      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 426582      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=13.21µs  min=1.03µs  med=2.56µs   max=53.18ms  p(90)=4.04µs   p(95)=5.04µs   p(99.9)=1.08ms  
     http_req_connecting............: avg=9.99µs   min=0s      med=0s       max=51.67ms  p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=99.36ms  min=1.62ms  med=87.82ms  max=1.48s    p(90)=188.39ms p(95)=219.78ms p(99.9)=624.26ms
       { expected_response:true }...: avg=99.36ms  min=1.62ms  med=87.82ms  max=1.48s    p(90)=188.39ms p(95)=219.78ms p(99.9)=624.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143194
     http_req_receiving.............: avg=1.36ms   min=52.23µs med=104.62µs max=568.24ms p(90)=1.77ms   p(95)=4.54ms   p(99.9)=98.4ms  
     http_req_sending...............: avg=56.02µs  min=4.39µs  med=9.55µs   max=150.72ms p(90)=17.35µs  p(95)=105.71µs p(99.9)=7.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.95ms  min=1.53ms  med=86.62ms  max=1.48s    p(90)=186.37ms p(95)=216.73ms p(99.9)=620.13ms
     http_reqs......................: 143194  2307.890673/s
     iteration_duration.............: avg=100.32ms min=2.83ms  med=88.84ms  max=1.48s    p(90)=189.04ms p(95)=220.46ms p(99.9)=625.05ms
     iterations.....................: 142194  2291.773443/s
     success_rate...................: 100.00% ✓ 142194      ✗ 0     
     vus............................: 59      min=0         max=498 
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

     checks.........................: 100.00% ✓ 229233      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=41.69µs  min=1.14µs  med=2.7µs    max=100.68ms p(90)=4.38µs   p(95)=5.3µs    p(99.9)=501.17µs
     http_req_connecting............: avg=36.75µs  min=0s      med=0s       max=93.83ms  p(90)=0s       p(95)=0s       p(99.9)=389.68µs
     http_req_duration..............: avg=184.2ms  min=1.98ms  med=185.86ms max=470.47ms p(90)=340.84ms p(95)=364.1ms  p(99.9)=433.62ms
       { expected_response:true }...: avg=184.2ms  min=1.98ms  med=185.86ms max=470.47ms p(90)=340.84ms p(95)=364.1ms  p(99.9)=433.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77411
     http_req_receiving.............: avg=76.56µs  min=29.02µs med=63.2µs   max=56.08ms  p(90)=100.38µs p(95)=115.22µs p(99.9)=1.01ms  
     http_req_sending...............: avg=39.98µs  min=5.25µs  med=11.4µs   max=87.47ms  p(90)=18.25µs  p(95)=22.23µs  p(99.9)=4.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.08ms min=1.89ms  med=185.74ms max=470.35ms p(90)=340.74ms p(95)=363.98ms p(99.9)=433.53ms
     http_reqs......................: 77411   1238.484765/s
     iteration_duration.............: avg=186.88ms min=4.05ms  med=188.99ms max=470.68ms p(90)=341.61ms p(95)=364.77ms p(99.9)=434.11ms
     iterations.....................: 76411   1222.485944/s
     success_rate...................: 100.00% ✓ 76411       ✗ 0    
     vus............................: 80      min=0         max=492
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

     checks.........................: 100.00% ✓ 108045     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 44 MB   692 kB/s
     http_req_blocked...............: avg=8.07µs   min=1.07µs  med=2.87µs   max=3.85ms   p(90)=4.64µs   p(95)=5.69µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=4.27µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=387.23ms min=3.49ms  med=360.06ms max=1.77s    p(90)=757.72ms p(95)=822.69ms p(99.9)=1.25s   
       { expected_response:true }...: avg=387.23ms min=3.49ms  med=360.06ms max=1.77s    p(90)=757.72ms p(95)=822.69ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 37015
     http_req_receiving.............: avg=84.01µs  min=29.27µs med=68.55µs  max=133.15ms p(90)=107.96µs p(95)=122.87µs p(99.9)=983.03µs
     http_req_sending...............: avg=30.17µs  min=5.07µs  med=13.51µs  max=119.23ms p(90)=21.3µs   p(95)=24.21µs  p(99.9)=2.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.11ms min=3.43ms  med=359.98ms max=1.77s    p(90)=757.61ms p(95)=822.57ms p(99.9)=1.25s   
     http_reqs......................: 37015   576.56854/s
     iteration_duration.............: avg=398.22ms min=17.46ms med=373.88ms max=1.78s    p(90)=760.82ms p(95)=826.24ms p(99.9)=1.26s   
     iterations.....................: 36015   560.991921/s
     success_rate...................: 100.00% ✓ 36015      ✗ 0    
     vus............................: 65      min=0        max=496
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

     checks.........................: 100.00% ✓ 49473      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   314 kB/s
     http_req_blocked...............: avg=15.02µs  min=1.14µs  med=3.24µs   max=19.2ms  p(90)=4.99µs  p(95)=6.35µs   p(99.9)=2.37ms
     http_req_connecting............: avg=10.22µs  min=0s      med=0s       max=19.12ms p(90)=0s      p(95)=0s       p(99.9)=2.35ms
     http_req_duration..............: avg=813.62ms min=5.48ms  med=722.83ms max=18.18s  p(90)=1.43s   p(95)=1.59s    p(99.9)=16.78s
       { expected_response:true }...: avg=813.62ms min=5.48ms  med=722.83ms max=18.18s  p(90)=1.43s   p(95)=1.59s    p(99.9)=16.78s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17491
     http_req_receiving.............: avg=104.96µs min=34.11µs med=94.59µs  max=66.52ms p(90)=130.9µs p(95)=146.24µs p(99.9)=1.25ms
     http_req_sending...............: avg=27.59µs  min=5.78µs  med=18.1µs   max=14.82ms p(90)=23.58µs p(95)=27.32µs  p(99.9)=2.45ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=813.48ms min=5.4ms   med=722.29ms max=18.18s  p(90)=1.43s   p(95)=1.59s    p(99.9)=16.78s
     http_reqs......................: 17491   261.164978/s
     iteration_duration.............: avg=863.02ms min=37.95ms med=782.5ms  max=18.18s  p(90)=1.45s   p(95)=1.6s     p(99.9)=16.79s
     iterations.....................: 16491   246.233586/s
     success_rate...................: 100.00% ✓ 16491      ✗ 0    
     vus............................: 46      min=0        max=500
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

     checks.........................: 100.00% ✓ 48540      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   287 kB/s
     http_req_blocked...............: avg=15.78µs  min=1.03µs  med=3.18µs   max=19.02ms p(90)=4.81µs   p(95)=6.2µs    p(99.9)=2.28ms  
     http_req_connecting............: avg=11µs     min=0s      med=0s       max=18.95ms p(90)=0s       p(95)=0s       p(99.9)=2.25ms  
     http_req_duration..............: avg=412.1ms  min=7.46ms  med=482.07ms max=1.25s   p(90)=716.76ms p(95)=779.68ms p(99.9)=1.08s   
       { expected_response:true }...: avg=412.1ms  min=7.46ms  med=482.07ms max=1.25s   p(90)=716.76ms p(95)=779.68ms p(99.9)=1.08s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 17180
     http_req_receiving.............: avg=97.32µs  min=31.16µs med=87.18µs  max=76.64ms p(90)=125.22µs p(95)=140.19µs p(99.9)=827.21µs
     http_req_sending...............: avg=26.04µs  min=5.47µs  med=16.7µs   max=11.58ms p(90)=21.79µs  p(95)=26.02µs  p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=411.98ms min=7.32ms  med=481.92ms max=1.25s   p(90)=716.66ms p(95)=779.56ms p(99.9)=1.08s   
     http_reqs......................: 17180   234.947245/s
     iteration_duration.............: avg=437.57ms min=8.32ms  med=498.94ms max=1.25s   p(90)=727.41ms p(95)=783.88ms p(99.9)=1.09s   
     iterations.....................: 16180   221.271619/s
     success_rate...................: 100.00% ✓ 16180      ✗ 0    
     vus............................: 55      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441144      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=14.4µs   min=892ns   med=2.21µs   max=41.25ms  p(90)=3.97µs   p(95)=5.11µs   p(99.9)=1.04ms  
     http_req_connecting............: avg=11.26µs  min=0s      med=0s       max=41.18ms  p(90)=0s       p(95)=0s       p(99.9)=976.89µs
     http_req_duration..............: avg=96.07ms  min=1.51ms  med=91.13ms  max=425.46ms p(90)=184.24ms p(95)=200.71ms p(99.9)=257.24ms
       { expected_response:true }...: avg=96.07ms  min=1.51ms  med=91.13ms  max=425.46ms p(90)=184.24ms p(95)=200.71ms p(99.9)=257.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148048
     http_req_receiving.............: avg=818.95µs min=54.37µs med=123.81µs max=182.95ms p(90)=1.67ms   p(95)=2.68ms   p(99.9)=29.34ms 
     http_req_sending...............: avg=66.07µs  min=4.42µs  med=9.45µs   max=223.42ms p(90)=20.98µs  p(95)=108.13µs p(99.9)=8.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.19ms  min=1.43ms  med=90.26ms  max=425.33ms p(90)=183.22ms p(95)=199.55ms p(99.9)=255.97ms
     http_reqs......................: 148048  2393.61271/s
     iteration_duration.............: avg=96.97ms  min=3.31ms  med=92.1ms   max=425.69ms p(90)=184.7ms  p(95)=201.13ms p(99.9)=258.15ms
     iterations.....................: 147048  2377.444894/s
     success_rate...................: 100.00% ✓ 147048      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 422982      ✗ 0     
     data_received..................: 12 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=23.35µs  min=1.09µs  med=2.92µs   max=96.43ms  p(90)=4.66µs   p(95)=5.85µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=19.45µs  min=0s      med=0s       max=83.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=100.2ms  min=1.43ms  med=86.62ms  max=1.62s    p(90)=191.41ms p(95)=223.08ms p(99.9)=703.11ms
       { expected_response:true }...: avg=100.2ms  min=1.43ms  med=86.62ms  max=1.62s    p(90)=191.41ms p(95)=223.08ms p(99.9)=703.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141994
     http_req_receiving.............: avg=1.76ms   min=53.65µs med=111.96µs max=1.54s    p(90)=1.83ms   p(95)=4.87ms   p(99.9)=129.76ms
     http_req_sending...............: avg=75.23µs  min=4.77µs  med=10.71µs  max=184.87ms p(90)=20.57µs  p(95)=122.03µs p(99.9)=10.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.36ms  min=1.35ms  med=85ms     max=1.62s    p(90)=189.21ms p(95)=218.74ms p(99.9)=675.65ms
     http_reqs......................: 141994  2293.396953/s
     iteration_duration.............: avg=101.19ms min=2.8ms   med=88.01ms  max=1.62s    p(90)=192.02ms p(95)=223.79ms p(99.9)=703.86ms
     iterations.....................: 140994  2277.245588/s
     success_rate...................: 100.00% ✓ 140994      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 421767      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=19.5µs   min=892ns   med=2.85µs   max=102.69ms p(90)=4.61µs   p(95)=5.73µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=15.62µs  min=0s      med=0s       max=102.55ms p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=100.51ms min=1.54ms  med=87.98ms  max=1.56s    p(90)=184.12ms p(95)=214.03ms p(99.9)=873.04ms
       { expected_response:true }...: avg=100.51ms min=1.54ms  med=87.98ms  max=1.56s    p(90)=184.12ms p(95)=214.03ms p(99.9)=873.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141589
     http_req_receiving.............: avg=1.54ms   min=54.87µs med=110.26µs max=824.67ms p(90)=1.71ms   p(95)=4.41ms   p(99.9)=97.08ms 
     http_req_sending...............: avg=68.28µs  min=4.96µs  med=10.65µs  max=102.96ms p(90)=20.07µs  p(95)=117.81µs p(99.9)=9.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.9ms   min=1.45ms  med=86.73ms  max=1.55s    p(90)=182.26ms p(95)=211.35ms p(99.9)=828.85ms
     http_reqs......................: 141589  2285.954794/s
     iteration_duration.............: avg=101.51ms min=2.9ms   med=89.14ms  max=1.56s    p(90)=184.85ms p(95)=214.83ms p(99.9)=874ms   
     iterations.....................: 140589  2269.809792/s
     success_rate...................: 100.00% ✓ 140589      ✗ 0     
     vus............................: 54      min=0         max=499 
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

     checks.........................: 100.00% ✓ 406047      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=9.93µs   min=882ns   med=2.34µs   max=42.89ms  p(90)=4.04µs   p(95)=5.23µs   p(99.9)=469.38µs
     http_req_connecting............: avg=6.88µs   min=0s      med=0s       max=42.83ms  p(90)=0s       p(95)=0s       p(99.9)=415.92µs
     http_req_duration..............: avg=104.36ms min=1.54ms  med=100.46ms max=311.83ms p(90)=201.61ms p(95)=217.76ms p(99.9)=259.27ms
       { expected_response:true }...: avg=104.36ms min=1.54ms  med=100.46ms max=311.83ms p(90)=201.61ms p(95)=217.76ms p(99.9)=259.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136349
     http_req_receiving.............: avg=94.31µs  min=27.46µs med=54.51µs  max=86.87ms  p(90)=101.52µs p(95)=255.07µs p(99.9)=5.06ms  
     http_req_sending...............: avg=51.67µs  min=4.8µs   med=9.99µs   max=178.53ms p(90)=17.59µs  p(95)=94.95µs  p(99.9)=6.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.21ms min=1.49ms  med=100.32ms max=311.16ms p(90)=201.46ms p(95)=217.63ms p(99.9)=258.7ms 
     http_reqs......................: 136349  2198.259366/s
     iteration_duration.............: avg=105.37ms min=3.26ms  med=101.59ms max=325.53ms p(90)=202.09ms p(95)=218.17ms p(99.9)=261.04ms
     iterations.....................: 135349  2182.137067/s
     success_rate...................: 100.00% ✓ 135349      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 398691      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=18.5µs   min=1µs     med=3.01µs   max=60.26ms  p(90)=4.89µs   p(95)=6.11µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=14.52µs  min=0s      med=0s       max=60.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=106.32ms min=1.79ms  med=92.66ms  max=1.38s    p(90)=204.57ms p(95)=238.53ms p(99.9)=748.67ms
       { expected_response:true }...: avg=106.32ms min=1.79ms  med=92.66ms  max=1.38s    p(90)=204.57ms p(95)=238.53ms p(99.9)=748.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133897
     http_req_receiving.............: avg=1.65ms   min=54.18µs med=116.63µs max=749.98ms p(90)=2.04ms   p(95)=5.24ms   p(99.9)=91.29ms 
     http_req_sending...............: avg=71.18µs  min=4.63µs  med=11.21µs  max=199.46ms p(90)=21.29µs  p(95)=121.55µs p(99.9)=8.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.59ms min=1.68ms  med=91.34ms  max=1.38s    p(90)=202.18ms p(95)=234.48ms p(99.9)=716.88ms
     http_reqs......................: 133897  2152.754309/s
     iteration_duration.............: avg=107.39ms min=3.27ms  med=93.85ms  max=1.38s    p(90)=205.25ms p(95)=239.52ms p(99.9)=749.15ms
     iterations.....................: 132897  2136.67662/s
     success_rate...................: 100.00% ✓ 132897      ✗ 0     
     vus............................: 66      min=0         max=496 
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

     checks.........................: 100.00% ✓ 206874      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.2µs    min=1.22µs  med=3.06µs   max=10.12ms  p(90)=4.93µs   p(95)=5.96µs   p(99.9)=509.32µs
     http_req_connecting............: avg=2.43µs   min=0s      med=0s       max=9.98ms   p(90)=0s       p(95)=0s       p(99.9)=437.93µs
     http_req_duration..............: avg=204.02ms min=2.05ms  med=204.53ms max=544.54ms p(90)=379.1ms  p(95)=405.45ms p(99.9)=484.24ms
       { expected_response:true }...: avg=204.02ms min=2.05ms  med=204.53ms max=544.54ms p(90)=379.1ms  p(95)=405.45ms p(99.9)=484.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69958
     http_req_receiving.............: avg=85.37µs  min=28.06µs med=70.06µs  max=118.4ms  p(90)=113.29µs p(95)=128.98µs p(99.9)=998.26µs
     http_req_sending...............: avg=33.24µs  min=5.42µs  med=12.75µs  max=184.34ms p(90)=20.2µs   p(95)=23.98µs  p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.91ms min=1.98ms  med=204.41ms max=544.48ms p(90)=378.98ms p(95)=405.3ms  p(99.9)=484.18ms
     http_reqs......................: 69958   1115.551175/s
     iteration_duration.............: avg=207.23ms min=4.48ms  med=207.93ms max=544.68ms p(90)=379.92ms p(95)=406.1ms  p(99.9)=484.94ms
     iterations.....................: 68958   1099.605162/s
     success_rate...................: 100.00% ✓ 68958       ✗ 0    
     vus............................: 90      min=0         max=499
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

     checks.........................: 100.00% ✓ 102009     ✗ 0    
     data_received..................: 3.1 GB  47 MB/s
     data_sent......................: 42 MB   649 kB/s
     http_req_blocked...............: avg=9.08µs   min=902ns  med=3.03µs   max=8.46ms   p(90)=4.84µs   p(95)=5.89µs   p(99.9)=1.65ms
     http_req_connecting............: avg=5.06µs   min=0s     med=0s       max=8.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.62ms
     http_req_duration..............: avg=409.87ms min=3.81ms med=381.47ms max=1.71s    p(90)=807.56ms p(95)=874.9ms  p(99.9)=1.31s 
       { expected_response:true }...: avg=409.87ms min=3.81ms med=381.47ms max=1.71s    p(90)=807.56ms p(95)=874.9ms  p(99.9)=1.31s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35003
     http_req_receiving.............: avg=83.77µs  min=29.4µs med=73.66µs  max=5.51ms   p(90)=114.37µs p(95)=129.67µs p(99.9)=1.13ms
     http_req_sending...............: avg=31.04µs  min=5.27µs med=14.08µs  max=173.85ms p(90)=21.59µs  p(95)=24.47µs  p(99.9)=2.32ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=409.75ms min=3.73ms med=381.39ms max=1.71s    p(90)=807.46ms p(95)=874.79ms p(99.9)=1.31s 
     http_reqs......................: 35003   540.649488/s
     iteration_duration.............: avg=422.16ms min=6.76ms med=395.59ms max=1.71s    p(90)=810.35ms p(95)=877.88ms p(99.9)=1.32s 
     iterations.....................: 34003   525.203684/s
     success_rate...................: 100.00% ✓ 34003      ✗ 0    
     vus............................: 90      min=0        max=500
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

     checks.........................: 100.00% ✓ 47670      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   298 kB/s
     http_req_blocked...............: avg=15.22µs  min=1.58µs  med=4µs      max=9.12ms  p(90)=5.88µs   p(95)=7.49µs   p(99.9)=2.19ms
     http_req_connecting............: avg=9.42µs   min=0s      med=0s       max=9.05ms  p(90)=0s       p(95)=0s       p(99.9)=2.15ms
     http_req_duration..............: avg=861.18ms min=6.09ms  med=783.1ms  max=4.61s   p(90)=1.72s    p(95)=1.94s    p(99.9)=3.68s 
       { expected_response:true }...: avg=861.18ms min=6.09ms  med=783.1ms  max=4.61s   p(90)=1.72s    p(95)=1.94s    p(99.9)=3.68s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16890
     http_req_receiving.............: avg=101.96µs min=39.81µs med=96.27µs  max=4.46ms  p(90)=135.13µs p(95)=151.44µs p(99.9)=1.14ms
     http_req_sending...............: avg=33.54µs  min=6.99µs  med=19.48µs  max=46.15ms p(90)=25.4µs   p(95)=30.79µs  p(99.9)=2.66ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=861.05ms min=6ms     med=783ms    max=4.61s   p(90)=1.72s    p(95)=1.94s    p(99.9)=3.68s 
     http_reqs......................: 16890   248.542375/s
     iteration_duration.............: avg=915.38ms min=36.2ms  med=848.64ms max=4.62s   p(90)=1.73s    p(95)=1.96s    p(99.9)=3.73s 
     iterations.....................: 15890   233.827018/s
     success_rate...................: 100.00% ✓ 15890      ✗ 0    
     vus............................: 39      min=0        max=500
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

     checks.........................: 100.00% ✓ 45639      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=14.68µs  min=1.29µs  med=3.69µs   max=6.79ms   p(90)=5.58µs   p(95)=7.38µs   p(99.9)=2.11ms
     http_req_connecting............: avg=9.13µs   min=0s      med=0s       max=6.73ms   p(90)=0s       p(95)=0s       p(99.9)=2.09ms
     http_req_duration..............: avg=894.82ms min=7.53ms  med=827.38ms max=3.1s     p(90)=1.83s    p(95)=1.92s    p(99.9)=2.67s 
       { expected_response:true }...: avg=894.82ms min=7.53ms  med=827.38ms max=3.1s     p(90)=1.83s    p(95)=1.92s    p(99.9)=2.67s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16213
     http_req_receiving.............: avg=110.15µs min=37.9µs  med=93.15µs  max=146.45ms p(90)=132.78µs p(95)=149.56µs p(99.9)=1.1ms 
     http_req_sending...............: avg=46.95µs  min=6.08µs  med=18.41µs  max=132.88ms p(90)=24.22µs  p(95)=29.44µs  p(99.9)=3.55ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=894.66ms min=7.42ms  med=827.21ms max=3.1s     p(90)=1.83s    p(95)=1.92s    p(99.9)=2.67s 
     http_reqs......................: 16213   236.531749/s
     iteration_duration.............: avg=953.7ms  min=33.49ms med=889.32ms max=3.1s     p(90)=1.84s    p(95)=1.94s    p(99.9)=2.69s 
     iterations.....................: 15213   221.942731/s
     success_rate...................: 100.00% ✓ 15213      ✗ 0    
     vus............................: 83      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

