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
| hive-router | v0.0.84 | 2,701 | 2,876 | 2,678 | 2.4% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,629 | 2,715 | 2,588 | 1.8% |  |
| fusion-nightly | 16.7.0-p.1 | 2,548 | 2,653 | 2,535 | 1.6% |  |
| fusion | 16.6.2 | 2,493 | 2,591 | 2,471 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,310 | 2,387 | 2,292 | 1.4% |  |
| cosmo | 0.334.0 | 1,182 | 1,222 | 1,173 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 574 | 588 | 573 | 1.0% |  |
| hive-gateway | 2.10.8 | 253 | 259 | 251 | 1.1% |  |
| apollo-gateway | 2.14.3 | 230 | 237 | 228 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (7295 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (543545 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.2 | 2,409 | 2,502 | 2,398 | 1.5% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,391 | 2,484 | 2,373 | 1.5% |  |
| hive-router | v0.0.84 | 2,346 | 2,484 | 2,303 | 2.4% |  |
| fusion-nightly | 16.7.0-p.1 | 2,320 | 2,423 | 2,304 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,230 | 2,316 | 2,226 | 1.3% |  |
| cosmo | 0.334.0 | 1,117 | 1,167 | 1,111 | 1.8% |  |
| hive-gateway-router-runtime | 2.10.8 | 534 | 547 | 533 | 0.9% |  |
| hive-gateway | 2.10.8 | 243 | 249 | 240 | 1.1% |  |
| apollo-gateway | 2.14.3 | 230 | 236 | 228 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (26132 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (319304 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 496686    ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=11.05µs  min=892ns   med=2.06µs  max=41.42ms  p(90)=3.54µs   p(95)=4.65µs   p(99.9)=810.86µs
     http_req_connecting............: avg=8.28µs   min=0s      med=0s      max=41.24ms  p(90)=0s       p(95)=0s       p(99.9)=706.75µs
     http_req_duration..............: avg=85.36ms  min=1.44ms  med=77.76ms max=281.69ms p(90)=171.34ms p(95)=183.43ms p(99.9)=214.01ms
       { expected_response:true }...: avg=85.36ms  min=1.44ms  med=77.76ms max=281.69ms p(90)=171.34ms p(95)=183.43ms p(99.9)=214.01ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 166562
     http_req_receiving.............: avg=110.63µs min=24.53µs med=49.28µs max=144.28ms p(90)=119.56µs p(95)=306.93µs p(99.9)=8.51ms  
     http_req_sending...............: avg=57.8µs   min=4.6µs   med=8.9µs   max=156.04ms p(90)=17.46µs  p(95)=106.16µs p(99.9)=7.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.19ms  min=1.37ms  med=77.59ms max=281.19ms p(90)=171.14ms p(95)=183.25ms p(99.9)=213.51ms
     http_reqs......................: 166562  2701.6356/s
     iteration_duration.............: avg=86.11ms  min=2.03ms  med=78.6ms  max=316.73ms p(90)=171.75ms p(95)=183.8ms  p(99.9)=215.13ms
     iterations.....................: 165562  2685.4156/s
     success_rate...................: 100.00% ✓ 165562    ✗ 0     
     vus............................: 87      min=0       max=498 
     vus_max........................: 500     min=500     max=500
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

     checks.........................: 100.00% ✓ 488301      ✗ 0     
     data_received..................: 14 GB   231 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=21.42µs  min=1.06µs  med=2.64µs   max=56.44ms  p(90)=4.3µs    p(95)=5.48µs   p(99.9)=2.5ms   
     http_req_connecting............: avg=18.03µs  min=0s      med=0s       max=56.39ms  p(90)=0s       p(95)=0s       p(99.9)=2.44ms  
     http_req_duration..............: avg=86.79ms  min=1.88ms  med=81.3ms   max=328.24ms p(90)=166.6ms  p(95)=185.5ms  p(99.9)=250.81ms
       { expected_response:true }...: avg=86.79ms  min=1.88ms  med=81.3ms   max=328.24ms p(90)=166.6ms  p(95)=185.5ms  p(99.9)=250.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163767
     http_req_receiving.............: avg=582.36µs min=52.54µs med=101.61µs max=83.11ms  p(90)=1.06ms   p(95)=1.93ms   p(99.9)=27.36ms 
     http_req_sending...............: avg=74.29µs  min=4.43µs  med=9.68µs   max=144.23ms p(90)=19.06µs  p(95)=120.53µs p(99.9)=11.03ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.14ms  min=1.81ms  med=80.58ms  max=327.84ms p(90)=165.8ms  p(95)=184.76ms p(99.9)=249.24ms
     http_reqs......................: 163767  2629.836291/s
     iteration_duration.............: avg=87.59ms  min=3.91ms  med=82.15ms  max=354.59ms p(90)=167.11ms p(95)=186.08ms p(99.9)=252.28ms
     iterations.....................: 162767  2613.777889/s
     success_rate...................: 100.00% ✓ 162767      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 474141      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=16.66µs min=872ns   med=2.03µs  max=77.97ms  p(90)=3.45µs   p(95)=4.57µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=14µs    min=0s      med=0s      max=77.93ms  p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=89.42ms min=1.96ms  med=76.84ms max=1.37s    p(90)=168.13ms p(95)=197.29ms p(99.9)=686.69ms
       { expected_response:true }...: avg=89.42ms min=1.96ms  med=76.84ms max=1.37s    p(90)=168.13ms p(95)=197.29ms p(99.9)=686.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159047
     http_req_receiving.............: avg=1.76ms  min=49.58µs med=93.82µs max=585.8ms  p(90)=1.65ms   p(95)=4.77ms   p(99.9)=199.91ms
     http_req_sending...............: avg=64.23µs min=4.5µs   med=8.69µs  max=219.66ms p(90)=16.64µs  p(95)=103.48µs p(99.9)=8.31ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.59ms min=1.85ms  med=75.77ms max=1.37s    p(90)=165.4ms  p(95)=191.94ms p(99.9)=658.74ms
     http_reqs......................: 159047  2548.339879/s
     iteration_duration.............: avg=90.24ms min=3.24ms  med=77.71ms max=1.37s    p(90)=168.72ms p(95)=197.98ms p(99.9)=687.64ms
     iterations.....................: 158047  2532.317321/s
     success_rate...................: 100.00% ✓ 158047      ✗ 0     
     vus............................: 75      min=0         max=494 
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

     checks.........................: 100.00% ✓ 463833      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=19.14µs min=992ns   med=2.54µs   max=73.8ms   p(90)=4.03µs   p(95)=5.04µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=15.85µs min=0s      med=0s       max=73.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=91.39ms min=1.97ms  med=82.21ms  max=1.12s    p(90)=172.97ms p(95)=201.48ms p(99.9)=604.27ms
       { expected_response:true }...: avg=91.39ms min=1.97ms  med=82.21ms  max=1.12s    p(90)=172.97ms p(95)=201.48ms p(99.9)=604.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155611
     http_req_receiving.............: avg=1.66ms  min=53.73µs med=101.28µs max=528ms    p(90)=1.73ms   p(95)=4.78ms   p(99.9)=115.6ms 
     http_req_sending...............: avg=68.02µs min=4.43µs  med=9.35µs   max=257.03ms p(90)=16.91µs  p(95)=110.43µs p(99.9)=9.2ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.66ms min=1.87ms  med=81.15ms  max=1.12s    p(90)=170.63ms p(95)=197.7ms  p(99.9)=588.9ms 
     http_reqs......................: 155611  2493.034705/s
     iteration_duration.............: avg=92.24ms min=3.31ms  med=83.13ms  max=1.12s    p(90)=173.59ms p(95)=202.19ms p(99.9)=605.27ms
     iterations.....................: 154611  2477.013764/s
     success_rate...................: 100.00% ✓ 154611      ✗ 0     
     vus............................: 76      min=0         max=493 
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

     checks.........................: 100.00% ✓ 427011      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=13.56µs  min=832ns   med=2.2µs    max=56.43ms  p(90)=3.71µs   p(95)=4.73µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=10.72µs  min=0s      med=0s       max=56.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=99.27ms  min=1.63ms  med=88.59ms  max=1.13s    p(90)=190.91ms p(95)=218.71ms p(99.9)=589.72ms
       { expected_response:true }...: avg=99.27ms  min=1.63ms  med=88.59ms  max=1.13s    p(90)=190.91ms p(95)=218.71ms p(99.9)=589.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143337
     http_req_receiving.............: avg=1.46ms   min=51.08µs med=102.84µs max=375.77ms p(90)=1.9ms    p(95)=4.76ms   p(99.9)=100.18ms
     http_req_sending...............: avg=58.43µs  min=4.49µs  med=9.04µs   max=125.48ms p(90)=16.65µs  p(95)=96.79µs  p(99.9)=7.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.74ms  min=1.56ms  med=87.31ms  max=1.13s    p(90)=187.95ms p(95)=213.2ms  p(99.9)=586.65ms
     http_reqs......................: 143337  2310.912421/s
     iteration_duration.............: avg=100.21ms min=2.83ms  med=89.75ms  max=1.13s    p(90)=191.5ms  p(95)=219.35ms p(99.9)=590.67ms
     iterations.....................: 142337  2294.790188/s
     success_rate...................: 100.00% ✓ 142337      ✗ 0     
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

     checks.........................: 100.00% ✓ 218610      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=4.83µs   min=972ns   med=1.95µs   max=5.68ms   p(90)=3.34µs   p(95)=4.15µs   p(99.9)=447.27µs
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=5.55ms   p(90)=0s       p(95)=0s       p(99.9)=379.02µs
     http_req_duration..............: avg=193.17ms min=1.91ms  med=193.31ms max=583.63ms p(90)=358.79ms p(95)=386.42ms p(99.9)=493.41ms
       { expected_response:true }...: avg=193.17ms min=1.91ms  med=193.31ms max=583.63ms p(90)=358.79ms p(95)=386.42ms p(99.9)=493.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73870
     http_req_receiving.............: avg=70.42µs  min=27.21µs med=55.96µs  max=253.9ms  p(90)=89.3µs   p(95)=102.71µs p(99.9)=892.19µs
     http_req_sending...............: avg=25.65µs  min=4.71µs  med=9.42µs   max=260.31ms p(90)=14.46µs  p(95)=17.97µs  p(99.9)=2.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.07ms min=1.84ms  med=193.19ms max=583.57ms p(90)=358.72ms p(95)=386.35ms p(99.9)=493.36ms
     http_reqs......................: 73870   1182.785635/s
     iteration_duration.............: avg=196.03ms min=5.45ms  med=196.53ms max=583.8ms  p(90)=359.8ms  p(95)=386.99ms p(99.9)=494.84ms
     iterations.....................: 72870   1166.773916/s
     success_rate...................: 100.00% ✓ 72870       ✗ 0    
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

     checks.........................: 100.00% ✓ 107640     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   689 kB/s
     http_req_blocked...............: avg=7.3µs    min=1.08µs  med=3.15µs   max=5.26ms  p(90)=4.98µs   p(95)=6.07µs   p(99.9)=671.14µs
     http_req_connecting............: avg=3.18µs   min=0s      med=0s       max=5.18ms  p(90)=0s       p(95)=0s       p(99.9)=613.37µs
     http_req_duration..............: avg=388.67ms min=3.47ms  med=358.99ms max=1.72s   p(90)=764.64ms p(95)=835.34ms p(99.9)=1.19s   
       { expected_response:true }...: avg=388.67ms min=3.47ms  med=358.99ms max=1.72s   p(90)=764.64ms p(95)=835.34ms p(99.9)=1.19s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36880
     http_req_receiving.............: avg=82.16µs  min=30.03µs med=71.74µs  max=26.44ms p(90)=111.62µs p(95)=126.75µs p(99.9)=877.01µs
     http_req_sending...............: avg=28.01µs  min=5.64µs  med=14.77µs  max=80.53ms p(90)=22.22µs  p(95)=25.28µs  p(99.9)=2.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=388.56ms min=3.37ms  med=358.88ms max=1.72s   p(90)=764.54ms p(95)=835.23ms p(99.9)=1.19s   
     http_reqs......................: 36880   574.0231/s
     iteration_duration.............: avg=399.74ms min=12.17ms med=372.67ms max=1.73s   p(90)=768.14ms p(95)=837.89ms p(99.9)=1.2s    
     iterations.....................: 35880   558.458482/s
     success_rate...................: 100.00% ✓ 35880      ✗ 0    
     vus............................: 67      min=0        max=496
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

     checks.........................: 100.00% ✓ 48243      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   306 kB/s
     http_req_blocked...............: avg=15.83µs  min=1.34µs  med=3.81µs   max=20.07ms p(90)=5.64µs   p(95)=7.19µs   p(99.9)=2.25ms
     http_req_connecting............: avg=10.36µs  min=0s      med=0s       max=19.99ms p(90)=0s       p(95)=0s       p(99.9)=2.08ms
     http_req_duration..............: avg=833.85ms min=5.51ms  med=745.52ms max=17.98s  p(90)=1.49s    p(95)=1.64s    p(99.9)=16.12s
       { expected_response:true }...: avg=833.85ms min=5.51ms  med=745.52ms max=17.98s  p(90)=1.49s    p(95)=1.64s    p(99.9)=16.12s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17081
     http_req_receiving.............: avg=101.32µs min=37.17µs med=91.9µs   max=17.84ms p(90)=130.56µs p(95)=147.12µs p(99.9)=1.4ms 
     http_req_sending...............: avg=32.04µs  min=6.26µs  med=18.73µs  max=20.8ms  p(90)=24.37µs  p(95)=28.8µs   p(99.9)=3.79ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=833.72ms min=5.43ms  med=745.44ms max=17.98s  p(90)=1.49s    p(95)=1.64s    p(99.9)=16.12s
     http_reqs......................: 17081   253.913626/s
     iteration_duration.............: avg=885.77ms min=38.45ms med=806.35ms max=17.99s  p(90)=1.5s     p(95)=1.65s    p(99.9)=16.13s
     iterations.....................: 16081   239.048359/s
     success_rate...................: 100.00% ✓ 16081      ✗ 0    
     vus............................: 66      min=0        max=498
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

     checks.........................: 100.00% ✓ 47556      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   282 kB/s
     http_req_blocked...............: avg=14.02µs  min=1.34µs  med=3.35µs   max=3.99ms   p(90)=4.89µs   p(95)=6.32µs   p(99.9)=2.14ms  
     http_req_connecting............: avg=9.05µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=2.12ms  
     http_req_duration..............: avg=389.99ms min=7.43ms  med=435.77ms max=1.1s     p(90)=678.37ms p(95)=735.2ms  p(99.9)=1.02s   
       { expected_response:true }...: avg=389.99ms min=7.43ms  med=435.77ms max=1.1s     p(90)=678.37ms p(95)=735.2ms  p(99.9)=1.02s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16852
     http_req_receiving.............: avg=94.79µs  min=33.04µs med=80.3µs   max=103.34ms p(90)=119.83µs p(95)=135.37µs p(99.9)=998.48µs
     http_req_sending...............: avg=36.2µs   min=6.02µs  med=15.72µs  max=100.71ms p(90)=21.48µs  p(95)=25.7µs   p(99.9)=2.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.86ms min=7.37ms  med=435.64ms max=1.1s     p(90)=678.3ms  p(95)=735.07ms p(99.9)=1.02s   
     http_reqs......................: 16852   230.399383/s
     iteration_duration.............: avg=414.57ms min=8.28ms  med=450.74ms max=1.11s    p(90)=684.87ms p(95)=739.62ms p(99.9)=1.03s   
     iterations.....................: 15852   216.727452/s
     success_rate...................: 100.00% ✓ 15852      ✗ 0    
     vus............................: 61      min=0        max=496
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 444522      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=19.76µs min=862ns   med=2.25µs   max=115.75ms p(90)=3.94µs   p(95)=5.11µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=16.48µs min=0s      med=0s       max=115.69ms p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=95.32ms min=1.54ms  med=82.34ms  max=1.78s    p(90)=180.16ms p(95)=209.27ms p(99.9)=912.28ms
       { expected_response:true }...: avg=95.32ms min=1.54ms  med=82.34ms  max=1.78s    p(90)=180.16ms p(95)=209.27ms p(99.9)=912.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149174
     http_req_receiving.............: avg=1.54ms  min=52.31µs med=101.82µs max=1s       p(90)=1.62ms   p(95)=4.1ms    p(99.9)=145.63ms
     http_req_sending...............: avg=67.01µs min=4.69µs  med=9.48µs   max=114.83ms p(90)=19.47µs  p(95)=107.29µs p(99.9)=9.15ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.71ms min=1.43ms  med=81.22ms  max=1.78s    p(90)=178.55ms p(95)=206.83ms p(99.9)=885.5ms 
     http_reqs......................: 149174  2409.832206/s
     iteration_duration.............: avg=96.25ms min=2.85ms  med=83.28ms  max=1.78s    p(90)=180.75ms p(95)=210.2ms  p(99.9)=919.64ms
     iterations.....................: 148174  2393.677701/s
     success_rate...................: 100.00% ✓ 148174      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 440229      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=13.21µs  min=882ns   med=2.2µs    max=53.22ms  p(90)=3.71µs   p(95)=4.79µs   p(99.9)=989.91µs
     http_req_connecting............: avg=10.23µs  min=0s      med=0s       max=50.85ms  p(90)=0s       p(95)=0s       p(99.9)=904.72µs
     http_req_duration..............: avg=96.28ms  min=1.45ms  med=91.61ms  max=356.14ms p(90)=182.94ms p(95)=198.25ms p(99.9)=263.49ms
       { expected_response:true }...: avg=96.28ms  min=1.45ms  med=91.61ms  max=356.14ms p(90)=182.94ms p(95)=198.25ms p(99.9)=263.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147743
     http_req_receiving.............: avg=699.75µs min=51.78µs med=108.95µs max=312.84ms p(90)=1.29ms   p(95)=2.3ms    p(99.9)=28.81ms 
     http_req_sending...............: avg=63.49µs  min=4.38µs  med=9.27µs   max=291.81ms p(90)=18.25µs  p(95)=107.51µs p(99.9)=7.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.52ms  min=1.36ms  med=90.85ms  max=354.98ms p(90)=182.08ms p(95)=197.24ms p(99.9)=261.28ms
     http_reqs......................: 147743  2391.354863/s
     iteration_duration.............: avg=97.18ms  min=3.12ms  med=92.56ms  max=356.31ms p(90)=183.38ms p(95)=198.7ms  p(99.9)=264.74ms
     iterations.....................: 146743  2375.168953/s
     success_rate...................: 100.00% ✓ 146743      ✗ 0     
     vus............................: 92      min=0         max=500 
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

     checks.........................: 100.00% ✓ 433434      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=13.36µs  min=912ns   med=2.52µs  max=39.45ms  p(90)=4.51µs   p(95)=5.81µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=10.05µs  min=0s      med=0s      max=39.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=97.77ms  min=1.62ms  med=94.05ms max=339.01ms p(90)=187.7ms  p(95)=202.73ms p(99.9)=252.8ms 
       { expected_response:true }...: avg=97.77ms  min=1.62ms  med=94.05ms max=339.01ms p(90)=187.7ms  p(95)=202.73ms p(99.9)=252.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 145478
     http_req_receiving.............: avg=122.65µs min=25.64µs med=55.33µs max=110.85ms p(90)=128.78µs p(95)=342.3µs  p(99.9)=10.78ms 
     http_req_sending...............: avg=62.17µs  min=4.9µs   med=10.56µs max=99.34ms  p(90)=21.42µs  p(95)=120.49µs p(99.9)=8.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.59ms  min=1.54ms  med=93.86ms max=338.66ms p(90)=187.45ms p(95)=202.53ms p(99.9)=252.02ms
     http_reqs......................: 145478  2346.32081/s
     iteration_duration.............: avg=98.7ms   min=4.09ms  med=95.16ms max=349.4ms  p(90)=188.19ms p(95)=203.13ms p(99.9)=254.85ms
     iterations.....................: 144478  2330.192455/s
     success_rate...................: 100.00% ✓ 144478      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 427887      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=19.55µs  min=1.05µs  med=2.88µs   max=89.28ms  p(90)=4.62µs   p(95)=5.84µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=15.64µs  min=0s      med=0s       max=65.97ms  p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=99.07ms  min=1.51ms  med=82.89ms  max=1.64s    p(90)=189.85ms p(95)=221.45ms p(99.9)=934.33ms
       { expected_response:true }...: avg=99.07ms  min=1.51ms  med=82.89ms  max=1.64s    p(90)=189.85ms p(95)=221.45ms p(99.9)=934.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143629
     http_req_receiving.............: avg=1.68ms   min=52.77µs med=109.29µs max=873.27ms p(90)=1.83ms   p(95)=5.01ms   p(99.9)=116.79ms
     http_req_sending...............: avg=72.42µs  min=5.04µs  med=10.53µs  max=149.79ms p(90)=19.62µs  p(95)=118.04µs p(99.9)=10.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.31ms  min=1.43ms  med=81.68ms  max=1.64s    p(90)=187.35ms p(95)=216.55ms p(99.9)=908.87ms
     http_reqs......................: 143629  2320.22378/s
     iteration_duration.............: avg=100.04ms min=3.17ms  med=84.03ms  max=1.64s    p(90)=190.57ms p(95)=222.26ms p(99.9)=938.21ms
     iterations.....................: 142629  2304.069495/s
     success_rate...................: 100.00% ✓ 142629      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 413190      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=16.61µs  min=932ns   med=2.46µs   max=85.05ms  p(90)=4.5µs    p(95)=5.64µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=13.33µs  min=0s      med=0s       max=84.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=102.61ms min=1.7ms   med=89.39ms  max=1.12s    p(90)=194.73ms p(95)=227.16ms p(99.9)=658.35ms
       { expected_response:true }...: avg=102.61ms min=1.7ms   med=89.39ms  max=1.12s    p(90)=194.73ms p(95)=227.16ms p(99.9)=658.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138730
     http_req_receiving.............: avg=1.57ms   min=50.97µs med=106.97µs max=658.53ms p(90)=1.64ms   p(95)=3.97ms   p(99.9)=139.52ms
     http_req_sending...............: avg=60.5µs   min=4.8µs   med=10.11µs  max=160.76ms p(90)=21.39µs  p(95)=101.64µs p(99.9)=7.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.98ms min=1.62ms  med=88.29ms  max=1.12s    p(90)=192.89ms p(95)=224.49ms p(99.9)=630.57ms
     http_reqs......................: 138730  2230.448433/s
     iteration_duration.............: avg=103.62ms min=2.99ms  med=90.54ms  max=1.12s    p(90)=195.42ms p(95)=228.08ms p(99.9)=659.57ms
     iterations.....................: 137730  2214.370812/s
     success_rate...................: 100.00% ✓ 137730      ✗ 0     
     vus............................: 67      min=0         max=496 
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

     checks.........................: 100.00% ✓ 207045      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.57µs   min=1.01µs  med=2.69µs   max=21.93ms  p(90)=4.59µs   p(95)=5.57µs   p(99.9)=515.7µs 
     http_req_connecting............: avg=3.17µs   min=0s      med=0s       max=21.85ms  p(90)=0s       p(95)=0s       p(99.9)=449.97µs
     http_req_duration..............: avg=203.86ms min=2.01ms  med=204.67ms max=551.81ms p(90)=378.22ms p(95)=405.6ms  p(99.9)=486.82ms
       { expected_response:true }...: avg=203.86ms min=2.01ms  med=204.67ms max=551.81ms p(90)=378.22ms p(95)=405.6ms  p(99.9)=486.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70015
     http_req_receiving.............: avg=81.01µs  min=27.84µs med=65.24µs  max=76.67ms  p(90)=110.13µs p(95)=127.5µs  p(99.9)=1.22ms  
     http_req_sending...............: avg=27.7µs   min=4.86µs  med=11.99µs  max=100.87ms p(90)=19.75µs  p(95)=23.58µs  p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.75ms min=1.89ms  med=204.56ms max=551.72ms p(90)=378.11ms p(95)=405.46ms p(99.9)=486.7ms 
     http_reqs......................: 70015   1117.049588/s
     iteration_duration.............: avg=207.06ms min=4.27ms  med=208.21ms max=551.99ms p(90)=379.09ms p(95)=406.31ms p(99.9)=487.14ms
     iterations.....................: 69015   1101.095155/s
     success_rate...................: 100.00% ✓ 69015       ✗ 0    
     vus............................: 88      min=0         max=499
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

     checks.........................: 100.00% ✓ 100653     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   641 kB/s
     http_req_blocked...............: avg=6.93µs   min=1.06µs  med=2.8µs    max=4.6ms   p(90)=4.51µs   p(95)=5.44µs   p(99.9)=683.29µs
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=4.54ms  p(90)=0s       p(95)=0s       p(99.9)=649.33µs
     http_req_duration..............: avg=415.23ms min=3.89ms  med=383.96ms max=1.77s   p(90)=817.3ms  p(95)=892.23ms p(99.9)=1.34s   
       { expected_response:true }...: avg=415.23ms min=3.89ms  med=383.96ms max=1.77s   p(90)=817.3ms  p(95)=892.23ms p(99.9)=1.34s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34551
     http_req_receiving.............: avg=85.17µs  min=29.1µs  med=73.69µs  max=64.4ms  p(90)=113.44µs p(95)=127.67µs p(99.9)=1.22ms  
     http_req_sending...............: avg=29.64µs  min=5.21µs  med=14.2µs   max=85.56ms p(90)=21.45µs  p(95)=24.32µs  p(99.9)=2.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=415.11ms min=3.81ms  med=383.84ms max=1.77s   p(90)=817.2ms  p(95)=892.14ms p(99.9)=1.34s   
     http_reqs......................: 34551   534.054613/s
     iteration_duration.............: avg=427.81ms min=19.49ms med=399.29ms max=1.77s   p(90)=821.29ms p(95)=894.56ms p(99.9)=1.35s   
     iterations.....................: 33551   518.597618/s
     success_rate...................: 100.00% ✓ 33551      ✗ 0    
     vus............................: 91      min=0        max=500
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

     checks.........................: 100.00% ✓ 46158      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   292 kB/s
     http_req_blocked...............: avg=15µs     min=1.05µs  med=3.14µs   max=18ms     p(90)=4.86µs   p(95)=6.54µs   p(99.9)=2.19ms
     http_req_connecting............: avg=10.07µs  min=0s      med=0s       max=17.93ms  p(90)=0s       p(95)=0s       p(99.9)=1.98ms
     http_req_duration..............: avg=889.16ms min=5.67ms  med=798.42ms max=5.03s    p(90)=1.78s    p(95)=2.03s    p(99.9)=4.29s 
       { expected_response:true }...: avg=889.16ms min=5.67ms  med=798.42ms max=5.03s    p(90)=1.78s    p(95)=2.03s    p(99.9)=4.29s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16386
     http_req_receiving.............: avg=100.16µs min=31.43µs med=91.73µs  max=25.05ms  p(90)=130.72µs p(95)=146.11µs p(99.9)=1.15ms
     http_req_sending...............: avg=40.89µs  min=4.81µs  med=17.64µs  max=120.66ms p(90)=23.12µs  p(95)=28.05µs  p(99.9)=3.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=889.02ms min=5.58ms  med=798.34ms max=5.03s    p(90)=1.78s    p(95)=2.02s    p(99.9)=4.29s 
     http_reqs......................: 16386   243.029116/s
     iteration_duration.............: avg=946.99ms min=50.68ms med=863.87ms max=5.04s    p(90)=1.8s     p(95)=2.04s    p(99.9)=4.32s 
     iterations.....................: 15386   228.197606/s
     success_rate...................: 100.00% ✓ 15386      ✗ 0    
     vus............................: 80      min=0        max=500
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

     checks.........................: 100.00% ✓ 44649      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=14.45µs  min=1.08µs  med=3.14µs   max=13.09ms  p(90)=4.84µs   p(95)=6.39µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=9.54µs   min=0s      med=0s       max=13.03ms  p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=914.46ms min=8.02ms  med=847.1ms  max=3.08s    p(90)=1.87s    p(95)=1.98s    p(99.9)=2.79s   
       { expected_response:true }...: avg=914.46ms min=8.02ms  med=847.1ms  max=3.08s    p(90)=1.87s    p(95)=1.98s    p(99.9)=2.79s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15883
     http_req_receiving.............: avg=93.49µs  min=32.19µs med=88.2µs   max=9.14ms   p(90)=126.93µs p(95)=142.38µs p(99.9)=379.22µs
     http_req_sending...............: avg=50.72µs  min=4.98µs  med=16.83µs  max=143.64ms p(90)=22.31µs  p(95)=27.03µs  p(99.9)=3.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=914.32ms min=7.91ms  med=846.97ms max=3.08s    p(90)=1.87s    p(95)=1.98s    p(99.9)=2.79s   
     http_reqs......................: 15883   230.230939/s
     iteration_duration.............: avg=975.89ms min=45.52ms med=918.27ms max=3.09s    p(90)=1.89s    p(95)=1.99s    p(99.9)=2.81s   
     iterations.....................: 14883   215.735508/s
     success_rate...................: 100.00% ✓ 14883      ✗ 0    
     vus............................: 51      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

