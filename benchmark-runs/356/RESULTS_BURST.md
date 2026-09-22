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
| hive-router | v0.0.84 | 2,938 | 3,056 | 2,914 | 1.7% |  |
| fusion-nightly-net11 | 16.7.0-p.9 | 2,562 | 2,679 | 2,548 | 1.8% |  |
| fusion | 16.6.6 | 2,428 | 2,542 | 2,412 | 1.9% |  |
| fusion-nightly | 16.7.0-p.9 | 2,428 | 2,533 | 2,415 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.9 | 2,389 | 2,471 | 2,371 | 1.4% |  |
| cosmo | 0.334.0 | 1,190 | 1,233 | 1,176 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 566 | 580 | 564 | 0.9% |  |
| hive-gateway | 2.10.8 | 256 | 264 | 253 | 1.3% |  |
| apollo-gateway | 2.14.3 | 232 | 238 | 231 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (10832 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (496231 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.9 | 2,464 | 2,562 | 2,456 | 1.5% |  |
| fusion | 16.6.6 | 2,427 | 2,519 | 2,371 | 1.8% |  |
| fusion-nightly | 16.7.0-p.9 | 2,320 | 2,418 | 2,309 | 1.6% |  |
| hive-router | v0.0.84 | 2,207 | 2,341 | 2,171 | 2.6% |  |
| fusion-nightly-fed | 16.7.0-p.9 | 2,186 | 2,257 | 2,148 | 1.7% |  |
| cosmo | 0.334.0 | 1,150 | 1,194 | 1,144 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 536 | 549 | 531 | 1.1% |  |
| hive-gateway | 2.10.8 | 246 | 252 | 243 | 1.3% |  |
| apollo-gateway | 2.14.3 | 237 | 240 | 234 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (30047 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (553865 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 540708      ✗ 0     
     data_received..................: 16 GB   258 MB/s
     data_sent......................: 218 MB  3.5 MB/s
     http_req_blocked...............: avg=20.15µs  min=891ns   med=2.11µs  max=57.65ms  p(90)=3.56µs   p(95)=4.66µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=17.01µs  min=0s      med=0s      max=57.52ms  p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=78.41ms  min=1.33ms  med=73.02ms max=297.6ms  p(90)=151.95ms p(95)=165.79ms p(99.9)=213.22ms
       { expected_response:true }...: avg=78.41ms  min=1.33ms  med=73.02ms max=297.6ms  p(90)=151.95ms p(95)=165.79ms p(99.9)=213.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181236
     http_req_receiving.............: avg=147.49µs min=24.58µs med=48.49µs max=54.37ms  p(90)=136.45µs p(95)=321.3µs  p(99.9)=19.17ms 
     http_req_sending...............: avg=68.72µs  min=4.51µs  med=9.18µs  max=199.28ms p(90)=17.19µs  p(95)=109.73µs p(99.9)=9.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.2ms   min=1.29ms  med=72.81ms max=296.51ms p(90)=151.66ms p(95)=165.36ms p(99.9)=211.78ms
     http_reqs......................: 181236  2938.953845/s
     iteration_duration.............: avg=79.09ms  min=1.91ms  med=73.76ms max=313.05ms p(90)=152.35ms p(95)=166.22ms p(99.9)=214.25ms
     iterations.....................: 180236  2922.737675/s
     success_rate...................: 100.00% ✓ 180236      ✗ 0     
     vus............................: 87      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 475842      ✗ 0     
     data_received..................: 14 GB   225 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=23.62µs min=1.06µs  med=2.67µs   max=53.65ms  p(90)=4.36µs   p(95)=5.6µs    p(99.9)=2.81ms  
     http_req_connecting............: avg=20.06µs min=0s      med=0s       max=53.6ms   p(90)=0s       p(95)=0s       p(99.9)=2.75ms  
     http_req_duration..............: avg=89.05ms min=1.88ms  med=84.14ms  max=340ms    p(90)=172.15ms p(95)=189ms    p(99.9)=251.46ms
       { expected_response:true }...: avg=89.05ms min=1.88ms  med=84.14ms  max=340ms    p(90)=172.15ms p(95)=189ms    p(99.9)=251.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159614
     http_req_receiving.............: avg=1.34ms  min=53.74µs med=144.59µs max=142.91ms p(90)=3.27ms   p(95)=4.98ms   p(99.9)=36.78ms 
     http_req_sending...............: avg=74.76µs min=4.75µs  med=9.89µs   max=152.29ms p(90)=20.78µs  p(95)=125.08µs p(99.9)=10.09ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.63ms min=1.8ms   med=82.6ms   max=339.64ms p(90)=170.63ms p(95)=187.6ms  p(99.9)=248.62ms
     http_reqs......................: 159614  2562.676165/s
     iteration_duration.............: avg=89.88ms min=4.64ms  med=85ms     max=363.04ms p(90)=172.66ms p(95)=189.53ms p(99.9)=252.53ms
     iterations.....................: 158614  2546.620705/s
     success_rate...................: 100.00% ✓ 158614      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 450909      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=19.53µs min=1.07µs  med=2.63µs   max=81.75ms  p(90)=4.17µs   p(95)=5.25µs   p(99.9)=2.05ms  
     http_req_connecting............: avg=16.1µs  min=0s      med=0s       max=81.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.95ms  
     http_req_duration..............: avg=94.06ms min=1.95ms  med=81.32ms  max=1.53s    p(90)=176.13ms p(95)=207.87ms p(99.9)=661.32ms
       { expected_response:true }...: avg=94.06ms min=1.95ms  med=81.32ms  max=1.53s    p(90)=176.13ms p(95)=207.87ms p(99.9)=661.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151303
     http_req_receiving.............: avg=1.54ms  min=53.75µs med=102.51µs max=578.46ms p(90)=1.57ms   p(95)=4.29ms   p(99.9)=96.2ms  
     http_req_sending...............: avg=69.75µs min=4.74µs  med=9.82µs   max=226.18ms p(90)=17.72µs  p(95)=113.56µs p(99.9)=9.77ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.45ms min=1.85ms  med=80.16ms  max=1.35s    p(90)=174.38ms p(95)=205.7ms  p(99.9)=605.45ms
     http_reqs......................: 151303  2428.323617/s
     iteration_duration.............: avg=94.95ms min=3.53ms  med=82.24ms  max=1.53s    p(90)=176.83ms p(95)=208.64ms p(99.9)=662.39ms
     iterations.....................: 150303  2412.274209/s
     success_rate...................: 100.00% ✓ 150303      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 451479      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=13.96µs min=821ns   med=2.06µs   max=79.81ms  p(90)=3.36µs   p(95)=4.36µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=11.15µs min=0s      med=0s       max=79.65ms  p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=93.89ms min=1.97ms  med=79.6ms   max=2.23s    p(90)=176.03ms p(95)=204.99ms p(99.9)=711.24ms
       { expected_response:true }...: avg=93.89ms min=1.97ms  med=79.6ms   max=2.23s    p(90)=176.03ms p(95)=204.99ms p(99.9)=711.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151493
     http_req_receiving.............: avg=1.68ms  min=53.01µs med=100.17µs max=840.07ms p(90)=1.79ms   p(95)=4.77ms   p(99.9)=122.13ms
     http_req_sending...............: avg=59.83µs min=4.66µs  med=8.57µs   max=200.14ms p(90)=15.06µs  p(95)=97.53µs  p(99.9)=8.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.15ms min=1.89ms  med=78.16ms  max=2.18s    p(90)=173.98ms p(95)=200.98ms p(99.9)=705.73ms
     http_reqs......................: 151493  2428.025742/s
     iteration_duration.............: avg=94.79ms min=3.04ms  med=80.61ms  max=2.23s    p(90)=176.67ms p(95)=205.81ms p(99.9)=716.73ms
     iterations.....................: 150493  2411.998429/s
     success_rate...................: 100.00% ✓ 150493      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441594      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=19.59µs min=962ns   med=2.63µs  max=73.43ms  p(90)=4.25µs   p(95)=5.42µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=16.13µs min=0s      med=0s      max=73.37ms  p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=96.03ms min=1.61ms  med=81.54ms max=1.75s    p(90)=187.03ms p(95)=217.49ms p(99.9)=659.19ms
       { expected_response:true }...: avg=96.03ms min=1.61ms  med=81.54ms max=1.75s    p(90)=187.03ms p(95)=217.49ms p(99.9)=659.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148198
     http_req_receiving.............: avg=1.37ms  min=51.47µs med=99.54µs max=1.18s    p(90)=1.5ms    p(95)=3.96ms   p(99.9)=95.05ms 
     http_req_sending...............: avg=67.19µs min=4.48µs  med=10.05µs max=166.53ms p(90)=18.46µs  p(95)=116.36µs p(99.9)=8.97ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.59ms min=1.54ms  med=80.44ms max=1.75s    p(90)=184.86ms p(95)=214.42ms p(99.9)=648.41ms
     http_reqs......................: 148198  2389.470618/s
     iteration_duration.............: avg=96.93ms min=2.78ms  med=82.46ms max=1.75s    p(90)=187.7ms  p(95)=218.25ms p(99.9)=660.93ms
     iterations.....................: 147198  2373.347117/s
     success_rate...................: 100.00% ✓ 147198      ✗ 0     
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

     checks.........................: 100.00% ✓ 220092      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=4.44µs   min=941ns   med=2.01µs   max=7.49ms   p(90)=3.42µs   p(95)=4.26µs   p(99.9)=394.34µs
     http_req_connecting............: avg=1.8µs    min=0s      med=0s       max=7.44ms   p(90)=0s       p(95)=0s       p(99.9)=348.96µs
     http_req_duration..............: avg=191.91ms min=1.93ms  med=191.71ms max=576.7ms  p(90)=357.58ms p(95)=385.02ms p(99.9)=514.54ms
       { expected_response:true }...: avg=191.91ms min=1.93ms  med=191.71ms max=576.7ms  p(90)=357.58ms p(95)=385.02ms p(99.9)=514.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74364
     http_req_receiving.............: avg=70.75µs  min=27.19µs med=55.99µs  max=95.68ms  p(90)=90.82µs  p(95)=105.42µs p(99.9)=951.61µs
     http_req_sending...............: avg=25.76µs  min=4.96µs  med=9.7µs    max=136.61ms p(90)=15.09µs  p(95)=18.8µs   p(99.9)=2.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.81ms min=1.83ms  med=191.61ms max=576.64ms p(90)=357.48ms p(95)=384.97ms p(99.9)=514.48ms
     http_reqs......................: 74364   1190.233466/s
     iteration_duration.............: avg=194.74ms min=4.59ms  med=194.41ms max=576.85ms p(90)=358.56ms p(95)=385.72ms p(99.9)=515.36ms
     iterations.....................: 73364   1174.22796/s
     success_rate...................: 100.00% ✓ 73364       ✗ 0    
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

     checks.........................: 100.00% ✓ 106095     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   680 kB/s
     http_req_blocked...............: avg=7.91µs   min=1.06µs  med=2.24µs   max=21.63ms p(90)=3.88µs   p(95)=4.8µs    p(99.9)=1.54ms 
     http_req_connecting............: avg=4.63µs   min=0s      med=0s       max=21.57ms p(90)=0s       p(95)=0s       p(99.9)=1.37ms 
     http_req_duration..............: avg=394.33ms min=3.49ms  med=365.3ms  max=1.74s   p(90)=777.78ms p(95)=849.64ms p(99.9)=1.2s   
       { expected_response:true }...: avg=394.33ms min=3.49ms  med=365.3ms  max=1.74s   p(90)=777.78ms p(95)=849.64ms p(99.9)=1.2s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36365
     http_req_receiving.............: avg=74.83µs  min=29.6µs  med=64.18µs  max=6.04ms  p(90)=102.32µs p(95)=116.42µs p(99.9)=957.7µs
     http_req_sending...............: avg=23.45µs  min=5.03µs  med=11.26µs  max=70.75ms p(90)=18.54µs  p(95)=21.47µs  p(99.9)=2.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=394.23ms min=3.43ms  med=365.12ms max=1.74s   p(90)=777.59ms p(95)=849.57ms p(99.9)=1.2s   
     http_reqs......................: 36365   566.659454/s
     iteration_duration.............: avg=405.68ms min=20.62ms med=381.98ms max=1.75s   p(90)=780.95ms p(95)=853.03ms p(99.9)=1.2s   
     iterations.....................: 35365   551.076904/s
     success_rate...................: 100.00% ✓ 35365      ✗ 0    
     vus............................: 64      min=0        max=497
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

     checks.........................: 100.00% ✓ 48768      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   308 kB/s
     http_req_blocked...............: avg=12.3µs   min=1.18µs  med=3.26µs   max=3.11ms   p(90)=5.05µs   p(95)=6.48µs   p(99.9)=2.06ms 
     http_req_connecting............: avg=7.5µs    min=0s      med=0s       max=3.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.98ms 
     http_req_duration..............: avg=832.74ms min=5.42ms  med=748.85ms max=15.74s   p(90)=1.52s    p(95)=1.69s    p(99.9)=13.35s 
       { expected_response:true }...: avg=832.74ms min=5.42ms  med=748.85ms max=15.74s   p(90)=1.52s    p(95)=1.69s    p(99.9)=13.35s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17256
     http_req_receiving.............: avg=171.71µs min=31.7µs  med=92.37µs  max=203.37ms p(90)=127.71µs p(95)=142.36µs p(99.9)=29.43ms
     http_req_sending...............: avg=43.4µs   min=5.65µs  med=17.24µs  max=134.03ms p(90)=22.55µs  p(95)=26.68µs  p(99.9)=3.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=832.52ms min=5.32ms  med=748.76ms max=15.74s   p(90)=1.52s    p(95)=1.69s    p(99.9)=13.35s 
     http_reqs......................: 17256   256.361617/s
     iteration_duration.............: avg=884.06ms min=13.18ms med=795.56ms max=15.74s   p(90)=1.54s    p(95)=1.7s     p(99.9)=13.43s 
     iterations.....................: 16256   241.505241/s
     success_rate...................: 100.00% ✓ 16256      ✗ 0    
     vus............................: 66      min=0        max=497
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

     checks.........................: 100.00% ✓ 48063      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   285 kB/s
     http_req_blocked...............: avg=11.57µs  min=1.27µs  med=3.37µs   max=10.42ms p(90)=4.96µs   p(95)=6.41µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=6.53µs   min=0s      med=0s       max=10.35ms p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=411.8ms  min=7.47ms  med=447.09ms max=1.36s   p(90)=798.67ms p(95)=887.64ms p(99.9)=1.23s   
       { expected_response:true }...: avg=411.8ms  min=7.47ms  med=447.09ms max=1.36s   p(90)=798.67ms p(95)=887.64ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 17021
     http_req_receiving.............: avg=89.99µs  min=33.07µs med=79.29µs  max=41.03ms p(90)=118.7µs  p(95)=133.6µs  p(99.9)=776.88µs
     http_req_sending...............: avg=31.43µs  min=6.24µs  med=15.47µs  max=54.72ms p(90)=21.31µs  p(95)=25.62µs  p(99.9)=3.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=411.68ms min=7.35ms  med=447ms    max=1.36s   p(90)=798.59ms p(95)=887.52ms p(99.9)=1.23s   
     http_reqs......................: 17021   232.899477/s
     iteration_duration.............: avg=437.47ms min=8.5ms   med=464.27ms max=1.36s   p(90)=810.75ms p(95)=893.47ms p(99.9)=1.24s   
     iterations.....................: 16021   219.216411/s
     success_rate...................: 100.00% ✓ 16021      ✗ 0    
     vus............................: 48      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453642      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 183 MB  3.0 MB/s
     http_req_blocked...............: avg=17.44µs min=852ns  med=2.35µs   max=63ms     p(90)=4.36µs   p(95)=5.59µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=14.35µs min=0s     med=0s       max=62.85ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=93.42ms min=1.38ms med=88.53ms  max=401.4ms  p(90)=178.68ms p(95)=195.98ms p(99.9)=277.92ms
       { expected_response:true }...: avg=93.42ms min=1.38ms med=88.53ms  max=401.4ms  p(90)=178.68ms p(95)=195.98ms p(99.9)=277.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152214
     http_req_receiving.............: avg=1.35ms  min=53.3µs med=129.11µs max=95.95ms  p(90)=3.27ms   p(95)=5.2ms    p(99.9)=39.32ms 
     http_req_sending...............: avg=69µs    min=4.72µs med=9.62µs   max=213.77ms p(90)=22.17µs  p(95)=113.37µs p(99.9)=9.32ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92ms    min=1.31ms med=87.13ms  max=401.31ms p(90)=177.03ms p(95)=194.38ms p(99.9)=275.66ms
     http_reqs......................: 152214  2464.287725/s
     iteration_duration.............: avg=94.3ms  min=3.7ms  med=89.51ms  max=401.58ms p(90)=179.13ms p(95)=196.46ms p(99.9)=279.27ms
     iterations.....................: 151214  2448.098099/s
     success_rate...................: 100.00% ✓ 151214      ✗ 0     
     vus............................: 92      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 447546      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=17.39µs min=892ns   med=2.33µs   max=65.77ms  p(90)=4.14µs   p(95)=5.36µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=14.03µs min=0s      med=0s       max=57.74ms  p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=94.71ms min=1.52ms  med=83.59ms  max=1.52s    p(90)=176.26ms p(95)=201.34ms p(99.9)=766.9ms 
       { expected_response:true }...: avg=94.71ms min=1.52ms  med=83.59ms  max=1.52s    p(90)=176.26ms p(95)=201.34ms p(99.9)=766.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 150182
     http_req_receiving.............: avg=1.46ms  min=51.08µs med=100.84µs max=806.58ms p(90)=1.56ms   p(95)=4.03ms   p(99.9)=102.16ms
     http_req_sending...............: avg=68.36µs min=4.75µs  med=9.56µs   max=76.93ms  p(90)=20.32µs  p(95)=110.22µs p(99.9)=9.51ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.17ms min=1.42ms  med=82.37ms  max=1.52s    p(90)=174.66ms p(95)=198.4ms  p(99.9)=758.68ms
     http_reqs......................: 150182  2427.255487/s
     iteration_duration.............: avg=95.62ms min=2.85ms  med=84.66ms  max=1.52s    p(90)=176.81ms p(95)=201.93ms p(99.9)=772.99ms
     iterations.....................: 149182  2411.093393/s
     success_rate...................: 100.00% ✓ 149182      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428178      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=18.2µs  min=921ns   med=2.62µs   max=51.76ms  p(90)=4.35µs   p(95)=5.45µs   p(99.9)=2.12ms  
     http_req_connecting............: avg=14.96µs min=0s      med=0s       max=51.57ms  p(90)=0s       p(95)=0s       p(99.9)=1.98ms  
     http_req_duration..............: avg=99ms    min=1.52ms  med=83.51ms  max=1.72s    p(90)=186ms    p(95)=216.25ms p(99.9)=795.68ms
       { expected_response:true }...: avg=99ms    min=1.52ms  med=83.51ms  max=1.72s    p(90)=186ms    p(95)=216.25ms p(99.9)=795.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143726
     http_req_receiving.............: avg=1.72ms  min=53.38µs med=111.23µs max=719.61ms p(90)=2.03ms   p(95)=5.4ms    p(99.9)=130.32ms
     http_req_sending...............: avg=67.99µs min=4.83µs  med=10.23µs  max=114.5ms  p(90)=19.37µs  p(95)=107.47µs p(99.9)=9.09ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.21ms min=1.44ms  med=82.13ms  max=1.72s    p(90)=183.93ms p(95)=212.33ms p(99.9)=784.11ms
     http_reqs......................: 143726  2320.926367/s
     iteration_duration.............: avg=99.96ms min=2.77ms  med=84.72ms  max=1.72s    p(90)=186.6ms  p(95)=217.13ms p(99.9)=796.81ms
     iterations.....................: 142726  2304.778096/s
     success_rate...................: 100.00% ✓ 142726      ✗ 0     
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

     checks.........................: 100.00% ✓ 407787      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=13.39µs  min=922ns   med=2.94µs   max=48.5ms   p(90)=4.81µs   p(95)=6µs      p(99.9)=1.12ms  
     http_req_connecting............: avg=9.54µs   min=0s      med=0s       max=37.51ms  p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=103.91ms min=1.59ms  med=99.76ms  max=289.72ms p(90)=201.47ms p(95)=217.06ms p(99.9)=257.71ms
       { expected_response:true }...: avg=103.91ms min=1.59ms  med=99.76ms  max=289.72ms p(90)=201.47ms p(95)=217.06ms p(99.9)=257.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136929
     http_req_receiving.............: avg=123.1µs  min=27.99µs med=59.27µs  max=156.13ms p(90)=131.15µs p(95)=358.3µs  p(99.9)=8.71ms  
     http_req_sending...............: avg=64.15µs  min=4.71µs  med=11.4µs   max=160.79ms p(90)=20.56µs  p(95)=127.93µs p(99.9)=8.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.72ms min=1.52ms  med=99.61ms  max=289.66ms p(90)=201.23ms p(95)=216.8ms  p(99.9)=256.99ms
     http_reqs......................: 136929  2207.147372/s
     iteration_duration.............: avg=104.92ms min=2.89ms  med=100.85ms max=320.94ms p(90)=201.96ms p(95)=217.5ms  p(99.9)=258.95ms
     iterations.....................: 135929  2191.028454/s
     success_rate...................: 100.00% ✓ 135929      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 404856      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=10.96µs  min=842ns   med=2.28µs   max=45.83ms  p(90)=4.15µs   p(95)=5.28µs   p(99.9)=737.35µs
     http_req_connecting............: avg=7.96µs   min=0s      med=0s       max=45.76ms  p(90)=0s       p(95)=0s       p(99.9)=643.69µs
     http_req_duration..............: avg=104.71ms min=1.67ms  med=87.56ms  max=1.43s    p(90)=199.32ms p(95)=230.64ms p(99.9)=860.88ms
       { expected_response:true }...: avg=104.71ms min=1.67ms  med=87.56ms  max=1.43s    p(90)=199.32ms p(95)=230.64ms p(99.9)=860.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135952
     http_req_receiving.............: avg=1.87ms   min=50.12µs med=110.09µs max=779.82ms p(90)=1.73ms   p(95)=4.27ms   p(99.9)=284.8ms 
     http_req_sending...............: avg=60.29µs  min=4.48µs  med=9.57µs   max=191.83ms p(90)=19.17µs  p(95)=97.04µs  p(99.9)=7.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.77ms min=1.6ms   med=86.18ms  max=1.43s    p(90)=197.28ms p(95)=225.68ms p(99.9)=829.7ms 
     http_reqs......................: 135952  2186.706942/s
     iteration_duration.............: avg=105.72ms min=2.99ms  med=88.89ms  max=1.43s    p(90)=199.89ms p(95)=231.43ms p(99.9)=861.39ms
     iterations.....................: 134952  2170.622538/s
     success_rate...................: 100.00% ✓ 134952      ✗ 0     
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

     checks.........................: 100.00% ✓ 213222      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=5.63µs   min=952ns   med=2.48µs   max=6.81ms   p(90)=4.29µs   p(95)=5.27µs   p(99.9)=575.46µs
     http_req_connecting............: avg=2.41µs   min=0s      med=0s       max=6.62ms   p(90)=0s       p(95)=0s       p(99.9)=507.8µs 
     http_req_duration..............: avg=198ms    min=1.94ms  med=198.12ms max=511.25ms p(90)=364.43ms p(95)=390.13ms p(99.9)=464.58ms
       { expected_response:true }...: avg=198ms    min=1.94ms  med=198.12ms max=511.25ms p(90)=364.43ms p(95)=390.13ms p(99.9)=464.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72074
     http_req_receiving.............: avg=75.89µs  min=27.01µs med=62.57µs  max=32.66ms  p(90)=104.03µs p(95)=120.03µs p(99.9)=1.16ms  
     http_req_sending...............: avg=30.56µs  min=4.98µs  med=11.43µs  max=156.36ms p(90)=19.26µs  p(95)=23.07µs  p(99.9)=3.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.89ms min=1.83ms  med=198.03ms max=511.16ms p(90)=364.33ms p(95)=390.03ms p(99.9)=464.47ms
     http_reqs......................: 72074   1150.493358/s
     iteration_duration.............: avg=201.02ms min=4.62ms  med=201.46ms max=511.45ms p(90)=365.25ms p(95)=390.92ms p(99.9)=464.99ms
     iterations.....................: 71074   1134.53069/s
     success_rate...................: 100.00% ✓ 71074       ✗ 0    
     vus............................: 88      min=0         max=497
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

     checks.........................: 100.00% ✓ 101115     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   644 kB/s
     http_req_blocked...............: avg=15.43µs  min=1.21µs  med=3.39µs   max=15.68ms  p(90)=5.13µs   p(95)=6.2µs    p(99.9)=3.45ms 
     http_req_connecting............: avg=10.7µs   min=0s      med=0s       max=15.51ms  p(90)=0s       p(95)=0s       p(99.9)=3.14ms 
     http_req_duration..............: avg=413.2ms  min=3.79ms  med=385.57ms max=1.78s    p(90)=818.98ms p(95)=894.98ms p(99.9)=1.26s  
       { expected_response:true }...: avg=413.2ms  min=3.79ms  med=385.57ms max=1.78s    p(90)=818.98ms p(95)=894.98ms p(99.9)=1.26s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 34705
     http_req_receiving.............: avg=87.95µs  min=31.32µs med=78.43µs  max=18.51ms  p(90)=117.57µs p(95)=132.92µs p(99.9)=955.5µs
     http_req_sending...............: avg=31.27µs  min=5.88µs  med=15.52µs  max=103.06ms p(90)=22.85µs  p(95)=26.01µs  p(99.9)=2.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=413.08ms min=3.68ms  med=385.45ms max=1.78s    p(90)=818.88ms p(95)=894.91ms p(99.9)=1.26s  
     http_reqs......................: 34705   536.367442/s
     iteration_duration.............: avg=425.68ms min=21.04ms med=400.54ms max=1.79s    p(90)=822.54ms p(95)=897.99ms p(99.9)=1.26s  
     iterations.....................: 33705   520.912394/s
     success_rate...................: 100.00% ✓ 33705      ✗ 0    
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

     checks.........................: 100.00% ✓ 47070      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   296 kB/s
     http_req_blocked...............: avg=15.45µs  min=1.43µs  med=3.94µs   max=12.25ms p(90)=5.94µs   p(95)=7.9µs    p(99.9)=2.25ms
     http_req_connecting............: avg=9.62µs   min=0s      med=0s       max=12.18ms p(90)=0s       p(95)=0s       p(99.9)=2.23ms
     http_req_duration..............: avg=871.78ms min=6.03ms  med=786.11ms max=5.51s   p(90)=1.75s    p(95)=1.98s    p(99.9)=4.1s  
       { expected_response:true }...: avg=871.78ms min=6.03ms  med=786.11ms max=5.51s   p(90)=1.75s    p(95)=1.98s    p(99.9)=4.1s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16690
     http_req_receiving.............: avg=133.65µs min=36.67µs med=97.24µs  max=79.22ms p(90)=137.12µs p(95)=153.41µs p(99.9)=2.85ms
     http_req_sending...............: avg=45.82µs  min=6.36µs  med=19.29µs  max=95.46ms p(90)=25.17µs  p(95)=31.16µs  p(99.9)=3.56ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=871.6ms  min=5.92ms  med=785.99ms max=5.51s   p(90)=1.75s    p(95)=1.98s    p(99.9)=4.1s  
     http_reqs......................: 16690   246.196539/s
     iteration_duration.............: avg=927.46ms min=21.06ms med=868.09ms max=5.51s   p(90)=1.78s    p(95)=1.99s    p(99.9)=4.12s 
     iterations.....................: 15690   231.445398/s
     success_rate...................: 100.00% ✓ 15690      ✗ 0    
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

     checks.........................: 100.00% ✓ 45939      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   285 kB/s
     http_req_blocked...............: avg=15.14µs  min=1.37µs  med=3.81µs   max=12.18ms p(90)=5.75µs   p(95)=7.41µs   p(99.9)=2.02ms
     http_req_connecting............: avg=9.2µs    min=0s      med=0s       max=12.12ms p(90)=0s       p(95)=0s       p(99.9)=1.97ms
     http_req_duration..............: avg=890.39ms min=7.85ms  med=822.4ms  max=3.14s   p(90)=1.81s    p(95)=1.93s    p(99.9)=2.67s 
       { expected_response:true }...: avg=890.39ms min=7.85ms  med=822.4ms  max=3.14s   p(90)=1.81s    p(95)=1.93s    p(99.9)=2.67s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16313
     http_req_receiving.............: avg=101.78µs min=35.16µs med=93.28µs  max=9.07ms  p(90)=134.23µs p(95)=151.09µs p(99.9)=1.26ms
     http_req_sending...............: avg=37.78µs  min=6.52µs  med=18.84µs  max=77.63ms p(90)=24.97µs  p(95)=30.17µs  p(99.9)=3.56ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=890.25ms min=7.75ms  med=821.67ms max=3.14s   p(90)=1.81s    p(95)=1.93s    p(99.9)=2.67s 
     http_reqs......................: 16313   237.073766/s
     iteration_duration.............: avg=948.5ms  min=59.3ms  med=895.51ms max=3.14s   p(90)=1.82s    p(95)=1.94s    p(99.9)=2.68s 
     iterations.....................: 15313   222.540954/s
     success_rate...................: 100.00% ✓ 15313      ✗ 0    
     vus............................: 98      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

