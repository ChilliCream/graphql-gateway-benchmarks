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
| hive-router | v0.0.84 | 2,811 | 2,942 | 2,768 | 2.1% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,634 | 2,737 | 2,573 | 1.8% |  |
| fusion-nightly | 16.7.0-p.1 | 2,492 | 2,572 | 2,467 | 1.5% |  |
| fusion | 16.6.2 | 2,443 | 2,551 | 2,429 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,410 | 2,491 | 2,396 | 1.3% |  |
| cosmo | 0.334.0 | 1,232 | 1,271 | 1,225 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 588 | 573 | 0.9% |  |
| hive-gateway | 2.10.8 | 254 | 261 | 248 | 1.6% |  |
| apollo-gateway | 2.14.3 | 227 | 234 | 227 | 1.2% | 2 failed requests across 1/9 runs |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (7917 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (525513 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,492 | 2,581 | 2,475 | 1.5% |  |
| hive-router | v0.0.84 | 2,387 | 2,507 | 2,366 | 2.1% |  |
| fusion | 16.6.2 | 2,377 | 2,465 | 2,369 | 1.4% |  |
| fusion-nightly | 16.7.0-p.1 | 2,328 | 2,423 | 2,309 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,231 | 2,312 | 2,216 | 1.4% |  |
| cosmo | 0.334.0 | 1,125 | 1,167 | 1,114 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 527 | 542 | 524 | 1.2% |  |
| hive-gateway | 2.10.8 | 236 | 244 | 235 | 1.3% |  |
| apollo-gateway | 2.14.3 | 233 | 239 | 232 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (20445 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (326932 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 517032      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 208 MB  3.4 MB/s
     http_req_blocked...............: avg=16.99µs  min=901ns   med=2.12µs  max=55.42ms  p(90)=3.72µs   p(95)=4.91µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=13.87µs  min=0s      med=0s      max=55.36ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=82ms     min=1.38ms  med=78.29ms max=327.1ms  p(90)=156.04ms p(95)=167.96ms p(99.9)=207.99ms
       { expected_response:true }...: avg=82ms     min=1.38ms  med=78.29ms max=327.1ms  p(90)=156.04ms p(95)=167.96ms p(99.9)=207.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173344
     http_req_receiving.............: avg=148.89µs min=25.62µs med=50.07µs max=147.39ms p(90)=130.01µs p(95)=327.2µs  p(99.9)=19.64ms 
     http_req_sending...............: avg=65.62µs  min=4.6µs   med=9.11µs  max=165.42ms p(90)=18.85µs  p(95)=113.4µs  p(99.9)=8.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.78ms  min=1.33ms  med=78.11ms max=326.47ms p(90)=155.65ms p(95)=167.57ms p(99.9)=207.02ms
     http_reqs......................: 173344  2811.651998/s
     iteration_duration.............: avg=82.71ms  min=2ms     med=79.08ms max=336.44ms p(90)=156.42ms p(95)=168.34ms p(99.9)=209.07ms
     iterations.....................: 172344  2795.431927/s
     success_rate...................: 100.00% ✓ 172344      ✗ 0     
     vus............................: 87      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 487929      ✗ 0     
     data_received..................: 14 GB   231 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=14.21µs min=872ns   med=2.03µs   max=60.9ms   p(90)=3.33µs   p(95)=4.28µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=11.56µs min=0s      med=0s       max=60.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=86.9ms  min=1.83ms  med=83.02ms  max=360.82ms p(90)=165.81ms p(95)=180.51ms p(99.9)=236.23ms
       { expected_response:true }...: avg=86.9ms  min=1.83ms  med=83.02ms  max=360.82ms p(90)=165.81ms p(95)=180.51ms p(99.9)=236.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163643
     http_req_receiving.............: avg=593µs   min=51.56µs med=103.48µs max=207.18ms p(90)=1.14ms   p(95)=1.98ms   p(99.9)=23.16ms 
     http_req_sending...............: avg=58.66µs min=4.47µs  med=8.68µs   max=161.29ms p(90)=16.7µs   p(95)=104.08µs p(99.9)=7.55ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.25ms min=1.76ms  med=82.33ms  max=360.72ms p(90)=165ms    p(95)=179.77ms p(99.9)=235.3ms 
     http_reqs......................: 163643  2634.038861/s
     iteration_duration.............: avg=87.66ms min=3.61ms  med=83.91ms  max=360.96ms p(90)=166.24ms p(95)=180.88ms p(99.9)=237.4ms 
     iterations.....................: 162643  2617.94261/s
     success_rate...................: 100.00% ✓ 162643      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462342      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=14.52µs min=841ns   med=1.99µs  max=51.03ms  p(90)=3.2µs    p(95)=4.12µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=11.52µs min=0s      med=0s      max=50.85ms  p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=91.72ms min=1.93ms  med=77.67ms max=1.57s    p(90)=174.66ms p(95)=199.27ms p(99.9)=663.29ms
       { expected_response:true }...: avg=91.72ms min=1.93ms  med=77.67ms max=1.57s    p(90)=174.66ms p(95)=199.27ms p(99.9)=663.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155114
     http_req_receiving.............: avg=1.49ms  min=50.57µs med=97.94µs max=817.99ms p(90)=1.82ms   p(95)=4.94ms   p(99.9)=84.97ms 
     http_req_sending...............: avg=58.9µs  min=4.47µs  med=8.47µs  max=209.58ms p(90)=14.72µs  p(95)=95.94µs  p(99.9)=7.45ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.17ms min=1.85ms  med=76.23ms max=1.57s    p(90)=172.8ms  p(95)=195.78ms p(99.9)=644.63ms
     http_reqs......................: 155114  2492.145371/s
     iteration_duration.............: avg=92.55ms min=3.52ms  med=78.64ms max=1.57s    p(90)=175.14ms p(95)=199.88ms p(99.9)=664.66ms
     iterations.....................: 154114  2476.078831/s
     success_rate...................: 100.00% ✓ 154114      ✗ 0     
     vus............................: 67      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453570      ✗ 0     
     data_received..................: 13 GB   214 MB/s
     data_sent......................: 183 MB  2.9 MB/s
     http_req_blocked...............: avg=19.17µs min=882ns   med=2.53µs   max=76.81ms  p(90)=4.05µs   p(95)=5.13µs   p(99.9)=2.21ms  
     http_req_connecting............: avg=15.85µs min=0s      med=0s       max=73.33ms  p(90)=0s       p(95)=0s       p(99.9)=2.16ms  
     http_req_duration..............: avg=93.47ms min=1.96ms  med=81.81ms  max=1.19s    p(90)=180.54ms p(95)=205.67ms p(99.9)=637.23ms
       { expected_response:true }...: avg=93.47ms min=1.96ms  med=81.81ms  max=1.19s    p(90)=180.54ms p(95)=205.67ms p(99.9)=637.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152190
     http_req_receiving.............: avg=1.39ms  min=52.73µs med=102.12µs max=623.65ms p(90)=1.7ms    p(95)=4.64ms   p(99.9)=102.91ms
     http_req_sending...............: avg=69.11µs min=4.55µs  med=9.57µs   max=107.33ms p(90)=17.9µs   p(95)=110.94µs p(99.9)=9.59ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92ms    min=1.88ms  med=80.69ms  max=1.19s    p(90)=178.47ms p(95)=202.59ms p(99.9)=598.43ms
     http_reqs......................: 152190  2443.065276/s
     iteration_duration.............: avg=94.35ms min=3.48ms  med=82.77ms  max=1.19s    p(90)=181.16ms p(95)=206.36ms p(99.9)=639.34ms
     iterations.....................: 151190  2427.012544/s
     success_rate...................: 100.00% ✓ 151190      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 445830      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=18.46µs min=1.02µs  med=2.66µs  max=86.18ms  p(90)=4.31µs   p(95)=5.45µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=14.96µs min=0s      med=0s      max=86.13ms  p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=95.13ms min=1.65ms  med=84.14ms max=1.57s    p(90)=177.41ms p(95)=207.56ms p(99.9)=957.37ms
       { expected_response:true }...: avg=95.13ms min=1.65ms  med=84.14ms max=1.57s    p(90)=177.41ms p(95)=207.56ms p(99.9)=957.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149610
     http_req_receiving.............: avg=1.51ms  min=52.33µs med=100.7µs max=936.42ms p(90)=1.51ms   p(95)=3.95ms   p(99.9)=137.07ms
     http_req_sending...............: avg=65.33µs min=4.73µs  med=9.85µs  max=117.13ms p(90)=18.74µs  p(95)=111.9µs  p(99.9)=8.94ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.55ms min=1.57ms  med=83.07ms max=1.46s    p(90)=175.55ms p(95)=204.78ms p(99.9)=919.65ms
     http_reqs......................: 149610  2410.530912/s
     iteration_duration.............: avg=96.02ms min=2.54ms  med=85.13ms max=1.57s    p(90)=178.03ms p(95)=208.16ms p(99.9)=958.31ms
     iterations.....................: 148610  2394.418814/s
     success_rate...................: 100.00% ✓ 148610      ✗ 0     
     vus............................: 59      min=0         max=497 
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

     checks.........................: 100.00% ✓ 228072      ✗ 0    
     data_received..................: 6.8 GB  108 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=5.37µs   min=952ns   med=2.14µs   max=17.22ms  p(90)=3.8µs    p(95)=4.73µs   p(99.9)=457.14µs
     http_req_connecting............: avg=2.56µs   min=0s      med=0s       max=17.02ms  p(90)=0s       p(95)=0s       p(99.9)=407.7µs 
     http_req_duration..............: avg=185.24ms min=1.95ms  med=186.11ms max=465.82ms p(90)=343.23ms p(95)=366.72ms p(99.9)=430.64ms
       { expected_response:true }...: avg=185.24ms min=1.95ms  med=186.11ms max=465.82ms p(90)=343.23ms p(95)=366.72ms p(99.9)=430.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77024
     http_req_receiving.............: avg=69.89µs  min=26.09µs med=58.62µs  max=35.02ms  p(90)=95.48µs  p(95)=109.19µs p(99.9)=917.28µs
     http_req_sending...............: avg=27.26µs  min=4.72µs  med=9.81µs   max=141.39ms p(90)=16.75µs  p(95)=20.54µs  p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.14ms min=1.9ms   med=186ms    max=465.75ms p(90)=343.12ms p(95)=366.64ms p(99.9)=430.58ms
     http_reqs......................: 77024   1232.28788/s
     iteration_duration.............: avg=187.91ms min=2.85ms  med=188.98ms max=465.98ms p(90)=344.02ms p(95)=367.43ms p(99.9)=430.88ms
     iterations.....................: 76024   1216.289128/s
     success_rate...................: 100.00% ✓ 76024       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 107955     ✗ 0    
     data_received..................: 3.2 GB  51 MB/s
     data_sent......................: 44 MB   692 kB/s
     http_req_blocked...............: avg=7.9µs    min=952ns   med=2.71µs   max=4.18ms   p(90)=4.52µs   p(95)=5.5µs    p(99.9)=1.34ms  
     http_req_connecting............: avg=4.24µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=387.76ms min=3.52ms  med=361.89ms max=1.62s    p(90)=759.3ms  p(95)=823.9ms  p(99.9)=1.21s   
       { expected_response:true }...: avg=387.76ms min=3.52ms  med=361.89ms max=1.62s    p(90)=759.3ms  p(95)=823.9ms  p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36985
     http_req_receiving.............: avg=87.29µs  min=27.97µs med=70.12µs  max=212.6ms  p(90)=109.32µs p(95)=123.76µs p(99.9)=965.82µs
     http_req_sending...............: avg=27.28µs  min=4.98µs  med=12.81µs  max=125.29ms p(90)=20.45µs  p(95)=23.43µs  p(99.9)=2.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.65ms min=3.45ms  med=361.8ms  max=1.62s    p(90)=759.24ms p(95)=823.78ms p(99.9)=1.21s   
     http_reqs......................: 36985   576.060529/s
     iteration_duration.............: avg=398.8ms  min=22.05ms med=374.3ms  max=1.63s    p(90)=762.42ms p(95)=826.76ms p(99.9)=1.21s   
     iterations.....................: 35985   560.485011/s
     success_rate...................: 100.00% ✓ 35985      ✗ 0    
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

     checks.........................: 100.00% ✓ 48498      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=11.27µs  min=1.1µs   med=3.24µs   max=16.66ms  p(90)=4.9µs    p(95)=6.23µs   p(99.9)=1.23ms
     http_req_connecting............: avg=6.59µs   min=0s      med=0s       max=16.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms 
     http_req_duration..............: avg=830.91ms min=5.62ms  med=747.29ms max=18.76s   p(90)=1.46s    p(95)=1.63s    p(99.9)=16.96s
       { expected_response:true }...: avg=830.91ms min=5.62ms  med=747.29ms max=18.76s   p(90)=1.46s    p(95)=1.63s    p(99.9)=16.96s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17166
     http_req_receiving.............: avg=105.13µs min=31.4µs  med=90.4µs   max=58.83ms  p(90)=126.74µs p(95)=141.42µs p(99.9)=1.44ms
     http_req_sending...............: avg=44.01µs  min=5.48µs  med=17.25µs  max=116.43ms p(90)=22.47µs  p(95)=26.53µs  p(99.9)=3.15ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=830.76ms min=5.54ms  med=747.15ms max=18.76s   p(90)=1.46s    p(95)=1.63s    p(99.9)=16.96s
     http_reqs......................: 17166   254.958911/s
     iteration_duration.............: avg=882.34ms min=28.59ms med=801.33ms max=18.77s   p(90)=1.48s    p(95)=1.64s    p(99.9)=16.99s
     iterations.....................: 16166   240.106359/s
     success_rate...................: 100.00% ✓ 16166      ✗ 0    
     vus............................: 75      min=0        max=498
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

     checks.........................: 100.00% ✓ 46947      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 20 MB   279 kB/s
     http_req_blocked...............: avg=10.54µs  min=1.15µs med=3.37µs   max=2.34ms  p(90)=4.97µs   p(95)=6.38µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=5.56µs   min=0s     med=0s       max=2.28ms  p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=382.07ms min=7.5ms  med=422.22ms max=1.15s   p(90)=663.67ms p(95)=693.46ms p(99.9)=987.16ms
       { expected_response:true }...: avg=382.07ms min=7.5ms  med=422.22ms max=1.15s   p(90)=663.67ms p(95)=693.46ms p(99.9)=987.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16649
     http_req_receiving.............: avg=90.09µs  min=32.7µs med=83.66µs  max=2.98ms  p(90)=123.08µs p(95)=138.38µs p(99.9)=844.01µs
     http_req_sending...............: avg=29.91µs  min=5.58µs med=17.25µs  max=26.44ms p(90)=22.3µs   p(95)=26.8µs   p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=381.95ms min=7.42ms med=422.12ms max=1.15s   p(90)=663.53ms p(95)=693.36ms p(99.9)=987.02ms
     http_reqs......................: 16649   227.476072/s
     iteration_duration.............: avg=406.44ms min=11.4ms med=442.63ms max=1.16s   p(90)=667.44ms p(95)=697.86ms p(99.9)=994.67ms
     iterations.....................: 15649   213.813024/s
     success_rate...................: 100.00% ✓ 15649      ✗ 0    
     vus............................: 59      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459399      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=17.23µs min=911ns   med=2.26µs   max=59.34ms  p(90)=3.99µs   p(95)=5.17µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=14.2µs  min=0s      med=0s       max=59.27ms  p(90)=0s       p(95)=0s       p(99.9)=1.78ms  
     http_req_duration..............: avg=92.25ms min=1.48ms  med=87.64ms  max=378.93ms p(90)=177.54ms p(95)=192.95ms p(99.9)=251.48ms
       { expected_response:true }...: avg=92.25ms min=1.48ms  med=87.64ms  max=378.93ms p(90)=177.54ms p(95)=192.95ms p(99.9)=251.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154133
     http_req_receiving.............: avg=645.3µs min=51.47µs med=105.22µs max=142.2ms  p(90)=1.21ms   p(95)=2.18ms   p(99.9)=27.87ms 
     http_req_sending...............: avg=62.34µs min=4.79µs  med=9.4µs    max=115.35ms p(90)=20.41µs  p(95)=112.44µs p(99.9)=8.42ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.55ms min=1.39ms  med=86.97ms  max=369.87ms p(90)=176.69ms p(95)=192.04ms p(99.9)=249.94ms
     http_reqs......................: 154133  2492.433532/s
     iteration_duration.............: avg=93.11ms min=3.31ms  med=88.56ms  max=379.13ms p(90)=177.99ms p(95)=193.42ms p(99.9)=252.65ms
     iterations.....................: 153133  2476.262864/s
     success_rate...................: 100.00% ✓ 153133      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 439887      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=24.23µs  min=1.07µs  med=3.17µs  max=75.79ms  p(90)=5.19µs   p(95)=6.52µs   p(99.9)=2.48ms  
     http_req_connecting............: avg=20.13µs  min=0s      med=0s      max=75.71ms  p(90)=0s       p(95)=0s       p(99.9)=2.38ms  
     http_req_duration..............: avg=96.32ms  min=1.54ms  med=90.34ms max=348.11ms p(90)=186.95ms p(95)=205.27ms p(99.9)=265.4ms 
       { expected_response:true }...: avg=96.32ms  min=1.54ms  med=90.34ms max=348.11ms p(90)=186.95ms p(95)=205.27ms p(99.9)=265.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147629
     http_req_receiving.............: avg=155.33µs min=26.23µs med=57.93µs max=48.64ms  p(90)=161.75µs p(95)=389.57µs p(99.9)=16.88ms 
     http_req_sending...............: avg=79.66µs  min=5.22µs  med=12.08µs max=281.38ms p(90)=23.5µs   p(95)=139.92µs p(99.9)=10.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.08ms  min=1.46ms  med=90.1ms  max=347.44ms p(90)=186.64ms p(95)=204.84ms p(99.9)=264.02ms
     http_reqs......................: 147629  2387.474758/s
     iteration_duration.............: avg=97.26ms  min=3.68ms  med=91.39ms max=357.69ms p(90)=187.54ms p(95)=205.94ms p(99.9)=266.3ms 
     iterations.....................: 146629  2371.302632/s
     success_rate...................: 100.00% ✓ 146629      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438579      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=19.31µs min=902ns   med=2.28µs   max=89.46ms  p(90)=4.06µs   p(95)=5.27µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=15.96µs min=0s      med=0s       max=89.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=96.64ms min=1.54ms  med=85.29ms  max=1.37s    p(90)=181.66ms p(95)=207.41ms p(99.9)=779.38ms
       { expected_response:true }...: avg=96.64ms min=1.54ms  med=85.29ms  max=1.37s    p(90)=181.66ms p(95)=207.41ms p(99.9)=779.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147193
     http_req_receiving.............: avg=1.47ms  min=54.11µs med=105.06µs max=907.08ms p(90)=1.67ms   p(95)=4.35ms   p(99.9)=113.44ms
     http_req_sending...............: avg=67.42µs min=4.8µs   med=9.71µs   max=154.96ms p(90)=20.42µs  p(95)=107.22µs p(99.9)=9.71ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.1ms  min=1.45ms  med=83.98ms  max=1.37s    p(90)=179.72ms p(95)=204.79ms p(99.9)=742.75ms
     http_reqs......................: 147193  2377.14797/s
     iteration_duration.............: avg=97.56ms min=3.09ms  med=86.41ms  max=1.37s    p(90)=182.24ms p(95)=208.08ms p(99.9)=782.11ms
     iterations.....................: 146193  2360.998099/s
     success_rate...................: 100.00% ✓ 146193      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429429      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=18.87µs min=1.04µs  med=2.8µs    max=57.98ms  p(90)=4.45µs   p(95)=5.61µs   p(99.9)=2.04ms  
     http_req_connecting............: avg=15µs    min=0s      med=0s       max=57.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=98.75ms min=1.52ms  med=85.75ms  max=1.84s    p(90)=184.87ms p(95)=210.93ms p(99.9)=1s      
       { expected_response:true }...: avg=98.75ms min=1.52ms  med=85.75ms  max=1.84s    p(90)=184.87ms p(95)=210.93ms p(99.9)=1s      
     http_req_failed................: 0.00%   ✓ 0           ✗ 144143
     http_req_receiving.............: avg=1.41ms  min=54.13µs med=111.97µs max=1.05s    p(90)=1.75ms   p(95)=4.41ms   p(99.9)=83.4ms  
     http_req_sending...............: avg=72.24µs min=4.9µs   med=10.36µs  max=190.96ms p(90)=19.68µs  p(95)=120.72µs p(99.9)=9.74ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.27ms min=1.45ms  med=84.48ms  max=1.84s    p(90)=182.88ms p(95)=208.57ms p(99.9)=996.62ms
     http_reqs......................: 144143  2328.057176/s
     iteration_duration.............: avg=99.7ms  min=2.93ms  med=86.8ms   max=1.84s    p(90)=185.48ms p(95)=211.57ms p(99.9)=1.01s   
     iterations.....................: 143143  2311.906151/s
     success_rate...................: 100.00% ✓ 143143      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413394      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=22.64µs  min=882ns  med=2.45µs   max=242.48ms p(90)=4.43µs   p(95)=5.62µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=19.45µs  min=0s     med=0s       max=242.44ms p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=102.49ms min=1.73ms med=88.54ms  max=1.88s    p(90)=195.89ms p(95)=221.5ms  p(99.9)=662.68ms
       { expected_response:true }...: avg=102.49ms min=1.73ms med=88.54ms  max=1.88s    p(90)=195.89ms p(95)=221.5ms  p(99.9)=662.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138798
     http_req_receiving.............: avg=1.22ms   min=53.5µs med=108.19µs max=617.82ms p(90)=1.59ms   p(95)=3.87ms   p(99.9)=85.4ms  
     http_req_sending...............: avg=60.11µs  min=4.65µs med=9.96µs   max=67.97ms  p(90)=20.89µs  p(95)=103.06µs p(99.9)=8.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.21ms min=1.66ms med=87.42ms  max=1.88s    p(90)=194.19ms p(95)=219.37ms p(99.9)=641.76ms
     http_reqs......................: 138798  2231.443084/s
     iteration_duration.............: avg=103.52ms min=3.26ms med=89.76ms  max=1.88s    p(90)=196.47ms p(95)=222.14ms p(99.9)=664.65ms
     iterations.....................: 137798  2215.366173/s
     success_rate...................: 100.00% ✓ 137798      ✗ 0     
     vus............................: 65      min=0         max=496 
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

     checks.........................: 100.00% ✓ 208443      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=5.63µs   min=952ns   med=2.41µs   max=11.61ms  p(90)=4.12µs   p(95)=5.05µs   p(99.9)=421.62µs
     http_req_connecting............: avg=2.54µs   min=0s      med=0s       max=11.46ms  p(90)=0s       p(95)=0s       p(99.9)=361.81µs
     http_req_duration..............: avg=202.55ms min=2ms     med=204.09ms max=549.6ms  p(90)=374.63ms p(95)=401.08ms p(99.9)=481.84ms
       { expected_response:true }...: avg=202.55ms min=2ms     med=204.09ms max=549.6ms  p(90)=374.63ms p(95)=401.08ms p(99.9)=481.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70481
     http_req_receiving.............: avg=75.98µs  min=29.64µs med=63.99µs  max=26.05ms  p(90)=105.48µs p(95)=120.79µs p(99.9)=828.25µs
     http_req_sending...............: avg=26.89µs  min=4.85µs  med=11.39µs  max=204.04ms p(90)=18.84µs  p(95)=22.29µs  p(99.9)=2.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.44ms min=1.89ms  med=203.99ms max=549.54ms p(90)=374.56ms p(95)=401ms    p(99.9)=481.78ms
     http_reqs......................: 70481   1125.709563/s
     iteration_duration.............: avg=205.7ms  min=4.1ms   med=207.3ms  max=549.78ms p(90)=375.47ms p(95)=401.8ms  p(99.9)=482.41ms
     iterations.....................: 69481   1109.737747/s
     success_rate...................: 100.00% ✓ 69481       ✗ 0    
     vus............................: 86      min=0         max=497
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

     checks.........................: 100.00% ✓ 99189      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   633 kB/s
     http_req_blocked...............: avg=7.78µs   min=1.19µs  med=3.29µs   max=13.95ms p(90)=5.04µs   p(95)=6.15µs   p(99.9)=689.68µs
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=13.88ms p(90)=0s       p(95)=0s       p(99.9)=649.4µs 
     http_req_duration..............: avg=421.23ms min=3.59ms  med=390.28ms max=2.01s   p(90)=835.16ms p(95)=904.71ms p(99.9)=1.34s   
       { expected_response:true }...: avg=421.23ms min=3.59ms  med=390.28ms max=2.01s   p(90)=835.16ms p(95)=904.71ms p(99.9)=1.34s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34063
     http_req_receiving.............: avg=87.41µs  min=30.94µs med=74.78µs  max=64.14ms p(90)=113.67µs p(95)=128.04µs p(99.9)=1.13ms  
     http_req_sending...............: avg=24.46µs  min=5.61µs  med=14.44µs  max=27.74ms p(90)=21.52µs  p(95)=24.6µs   p(99.9)=2.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=421.12ms min=3.52ms  med=390.13ms max=2.01s   p(90)=835.07ms p(95)=904.6ms  p(99.9)=1.34s   
     http_reqs......................: 34063   527.332298/s
     iteration_duration.............: avg=434.19ms min=15.34ms med=405.32ms max=2.01s   p(90)=838.89ms p(95)=907.61ms p(99.9)=1.35s   
     iterations.....................: 33063   511.85121/s
     success_rate...................: 100.00% ✓ 33063      ✗ 0    
     vus............................: 84      min=0        max=498
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

     checks.........................: 100.00% ✓ 45252      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   284 kB/s
     http_req_blocked...............: avg=17.3µs   min=1.69µs  med=3.8µs    max=20.81ms p(90)=5.57µs   p(95)=7.39µs   p(99.9)=2.37ms
     http_req_connecting............: avg=11.6µs   min=0s      med=0s       max=20.59ms p(90)=0s       p(95)=0s       p(99.9)=2.34ms
     http_req_duration..............: avg=906.49ms min=6.2ms   med=810.75ms max=4.87s   p(90)=1.79s    p(95)=2.07s    p(99.9)=4.38s 
       { expected_response:true }...: avg=906.49ms min=6.2ms   med=810.75ms max=4.87s   p(90)=1.79s    p(95)=2.07s    p(99.9)=4.38s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16084
     http_req_receiving.............: avg=101.31µs min=36.06µs med=91.73µs  max=32.98ms p(90)=129.16µs p(95)=145.21µs p(99.9)=1.21ms
     http_req_sending...............: avg=31.54µs  min=6.36µs  med=18.27µs  max=17.89ms p(90)=24.08µs  p(95)=28.97µs  p(99.9)=4.04ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=906.35ms min=6.09ms  med=810.64ms max=4.87s   p(90)=1.79s    p(95)=2.07s    p(99.9)=4.38s 
     http_reqs......................: 16084   236.191167/s
     iteration_duration.............: avg=966.56ms min=44.12ms med=900ms    max=4.88s   p(90)=1.82s    p(95)=2.08s    p(99.9)=4.39s 
     iterations.....................: 15084   221.506314/s
     success_rate...................: 100.00% ✓ 15084      ✗ 0    
     vus............................: 47      min=0        max=500
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

     checks.........................: 100.00% ✓ 45204      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=15.29µs  min=1.34µs med=3.61µs   max=13.97ms p(90)=5.35µs   p(95)=6.88µs   p(99.9)=2.26ms
     http_req_connecting............: avg=9.88µs   min=0s     med=0s       max=13.9ms  p(90)=0s       p(95)=0s       p(99.9)=2.23ms
     http_req_duration..............: avg=904.05ms min=7.83ms med=843.55ms max=3.21s   p(90)=1.83s    p(95)=1.98s    p(99.9)=2.81s 
       { expected_response:true }...: avg=904.05ms min=7.83ms med=843.55ms max=3.21s   p(90)=1.83s    p(95)=1.98s    p(99.9)=2.81s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16068
     http_req_receiving.............: avg=102.48µs min=34.5µs med=89.21µs  max=69.9ms  p(90)=129.63µs p(95)=146.51µs p(99.9)=1.28ms
     http_req_sending...............: avg=33.18µs  min=6.23µs med=17.57µs  max=63.74ms p(90)=23.36µs  p(95)=28.73µs  p(99.9)=3.27ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=903.91ms min=7.67ms med=843.44ms max=3.21s   p(90)=1.83s    p(95)=1.98s    p(99.9)=2.81s 
     http_reqs......................: 16068   233.525513/s
     iteration_duration.............: avg=964.01ms min=23.9ms med=906.95ms max=3.21s   p(90)=1.85s    p(95)=1.99s    p(99.9)=2.84s 
     iterations.....................: 15068   218.991936/s
     success_rate...................: 100.00% ✓ 15068      ✗ 0    
     vus............................: 97      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

