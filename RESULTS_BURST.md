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
| hive-router | v0.0.84 | 2,788 | 2,892 | 2,748 | 1.8% |  |
| fusion | 16.6.4 | 2,538 | 2,670 | 2,532 | 1.9% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,487 | 2,583 | 2,450 | 1.9% |  |
| fusion-nightly | 16.7.0-p.5 | 2,482 | 2,591 | 2,470 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,409 | 2,494 | 2,394 | 1.4% |  |
| cosmo | 0.334.0 | 1,243 | 1,280 | 1,234 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 559 | 572 | 557 | 1.0% |  |
| hive-gateway | 2.10.8 | 254 | 260 | 253 | 0.8% |  |
| apollo-gateway | 2.14.3 | 235 | 241 | 233 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (4695 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (517626 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,390 | 2,549 | 2,356 | 2.8% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,369 | 2,448 | 2,341 | 1.7% |  |
| fusion | 16.6.4 | 2,323 | 2,420 | 2,306 | 1.7% |  |
| fusion-nightly | 16.7.0-p.5 | 2,298 | 2,405 | 2,279 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,223 | 2,316 | 2,214 | 1.6% |  |
| cosmo | 0.334.0 | 1,163 | 1,200 | 1,149 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 527 | 543 | 523 | 1.4% |  |
| hive-gateway | 2.10.8 | 249 | 255 | 247 | 1.0% |  |
| apollo-gateway | 2.14.3 | 235 | 241 | 234 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (29352 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (245978 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 512760      ✗ 0     
     data_received..................: 15 GB   245 MB/s
     data_sent......................: 207 MB  3.3 MB/s
     http_req_blocked...............: avg=21.22µs  min=992ns   med=2.64µs  max=67.35ms  p(90)=4.34µs   p(95)=5.54µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=17.66µs  min=0s      med=0s      max=55.46ms  p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=82.64ms  min=1.36ms  med=76.87ms max=272.58ms p(90)=161.62ms p(95)=176.16ms p(99.9)=235.08ms
       { expected_response:true }...: avg=82.64ms  min=1.36ms  med=76.87ms max=272.58ms p(90)=161.62ms p(95)=176.16ms p(99.9)=235.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 171920
     http_req_receiving.............: avg=145.41µs min=26.14µs med=52.69µs max=69.23ms  p(90)=150.94µs p(95)=348.24µs p(99.9)=17.46ms 
     http_req_sending...............: avg=73.82µs  min=4.23µs  med=9.7µs   max=252.96ms p(90)=18.72µs  p(95)=123.85µs p(99.9)=10.2ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.43ms  min=1.32ms  med=76.62ms max=272.5ms  p(90)=161.38ms p(95)=175.85ms p(99.9)=234.08ms
     http_reqs......................: 171920  2788.700714/s
     iteration_duration.............: avg=83.41ms  min=2.5ms   med=77.69ms max=372.59ms p(90)=162.13ms p(95)=176.58ms p(99.9)=236.25ms
     iterations.....................: 170920  2772.479794/s
     success_rate...................: 100.00% ✓ 170920      ✗ 0     
     vus............................: 87      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 471234      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=18.71µs min=1.02µs  med=2.64µs   max=74.67ms  p(90)=4.29µs   p(95)=5.44µs   p(99.9)=2.24ms  
     http_req_connecting............: avg=15.17µs min=0s      med=0s       max=74.62ms  p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=89.97ms min=1.95ms  med=79.04ms  max=1.26s    p(90)=166.88ms p(95)=194.65ms p(99.9)=726.5ms 
       { expected_response:true }...: avg=89.97ms min=1.95ms  med=79.04ms  max=1.26s    p(90)=166.88ms p(95)=194.65ms p(99.9)=726.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 158078
     http_req_receiving.............: avg=1.65ms  min=53.21µs med=100.93µs max=985.82ms p(90)=1.7ms    p(95)=4.98ms   p(99.9)=146.41ms
     http_req_sending...............: avg=73.19µs min=4.69µs  med=9.79µs   max=187.29ms p(90)=18.7µs   p(95)=117.87µs p(99.9)=10.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.24ms min=1.87ms  med=77.99ms  max=1.26s    p(90)=164.65ms p(95)=191.35ms p(99.9)=708.91ms
     http_reqs......................: 158078  2538.234431/s
     iteration_duration.............: avg=90.8ms  min=3.14ms  med=79.93ms  max=1.26s    p(90)=167.42ms p(95)=195.31ms p(99.9)=728.03ms
     iterations.....................: 157078  2522.177583/s
     success_rate...................: 100.00% ✓ 157078      ✗ 0     
     vus............................: 68      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 461919      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=19.23µs min=892ns   med=2.53µs   max=54.11ms  p(90)=4.21µs   p(95)=5.32µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=15.98µs min=0s      med=0s       max=53.97ms  p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=91.75ms min=1.91ms  med=86.76ms  max=339.57ms p(90)=176.34ms p(95)=192.79ms p(99.9)=259.66ms
       { expected_response:true }...: avg=91.75ms min=1.91ms  med=86.76ms  max=339.57ms p(90)=176.34ms p(95)=192.79ms p(99.9)=259.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154973
     http_req_receiving.............: avg=1.39ms  min=49.98µs med=186.96µs max=147.77ms p(90)=3.3ms    p(95)=5.07ms   p(99.9)=34.43ms 
     http_req_sending...............: avg=66.46µs min=4.61µs  med=9.56µs   max=73.27ms  p(90)=19.31µs  p(95)=116.91µs p(99.9)=9.18ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.29ms min=1.79ms  med=85.13ms  max=337.3ms  p(90)=174.8ms  p(95)=191.25ms p(99.9)=258.15ms
     http_reqs......................: 154973  2487.430779/s
     iteration_duration.............: avg=92.6ms  min=2.85ms  med=87.71ms  max=356.27ms p(90)=176.84ms p(95)=193.26ms p(99.9)=260.12ms
     iterations.....................: 153973  2471.380042/s
     success_rate...................: 100.00% ✓ 153973      ✗ 0     
     vus............................: 72      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462093      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=15.06µs min=861ns   med=1.98µs  max=90.01ms  p(90)=3.21µs   p(95)=4.18µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=12.3µs  min=0s      med=0s      max=89.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=91.76ms min=2.01ms  med=80.36ms max=1.44s    p(90)=173.66ms p(95)=199.57ms p(99.9)=582.32ms
       { expected_response:true }...: avg=91.76ms min=2.01ms  med=80.36ms max=1.44s    p(90)=173.66ms p(95)=199.57ms p(99.9)=582.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155031
     http_req_receiving.............: avg=1.4ms   min=52.34µs med=97.6µs  max=526.33ms p(90)=1.72ms   p(95)=4.5ms    p(99.9)=98ms    
     http_req_sending...............: avg=59.38µs min=4.57µs  med=8.37µs  max=330.77ms p(90)=14.65µs  p(95)=95.43µs  p(99.9)=8.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.3ms  min=1.9ms   med=79.24ms max=1.44s    p(90)=171.73ms p(95)=196.48ms p(99.9)=551.69ms
     http_reqs......................: 155031  2482.795235/s
     iteration_duration.............: avg=92.59ms min=3.27ms  med=81.29ms max=1.44s    p(90)=174.16ms p(95)=200.28ms p(99.9)=582.98ms
     iterations.....................: 154031  2466.780404/s
     success_rate...................: 100.00% ✓ 154031      ✗ 0     
     vus............................: 77      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 445362      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=18.8µs  min=922ns   med=2.65µs   max=73.94ms  p(90)=4.29µs   p(95)=5.41µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=15.47µs min=0s      med=0s       max=73.71ms  p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=95.19ms min=1.66ms  med=80.07ms  max=1.54s    p(90)=179.24ms p(95)=211.25ms p(99.9)=897.88ms
       { expected_response:true }...: avg=95.19ms min=1.66ms  med=80.07ms  max=1.54s    p(90)=179.24ms p(95)=211.25ms p(99.9)=897.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149454
     http_req_receiving.............: avg=1.83ms  min=52.81µs med=101.45µs max=821.53ms p(90)=1.58ms   p(95)=4.55ms   p(99.9)=244.15ms
     http_req_sending...............: avg=66.14µs min=4.53µs  med=9.99µs   max=137.98ms p(90)=18.43µs  p(95)=116.57µs p(99.9)=9.16ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.29ms min=1.59ms  med=79.07ms  max=1.54s    p(90)=177.53ms p(95)=207.27ms p(99.9)=815.33ms
     http_reqs......................: 149454  2409.353393/s
     iteration_duration.............: avg=96.11ms min=2.92ms  med=81.09ms  max=1.54s    p(90)=179.84ms p(95)=212.02ms p(99.9)=898.4ms 
     iterations.....................: 148454  2393.232357/s
     success_rate...................: 100.00% ✓ 148454      ✗ 0     
     vus............................: 60      min=0         max=498 
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

     checks.........................: 100.00% ✓ 230199      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=4.88µs   min=952ns   med=2.11µs   max=8.65ms   p(90)=3.79µs   p(95)=4.74µs   p(99.9)=366.41µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=8.59ms   p(90)=0s       p(95)=0s       p(99.9)=306.75µs
     http_req_duration..............: avg=183.52ms min=1.93ms  med=185.61ms max=538.27ms p(90)=339.06ms p(95)=363.86ms p(99.9)=455.02ms
       { expected_response:true }...: avg=183.52ms min=1.93ms  med=185.61ms max=538.27ms p(90)=339.06ms p(95)=363.86ms p(99.9)=455.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77733
     http_req_receiving.............: avg=71.64µs  min=26.91µs med=56.88µs  max=198.68ms p(90)=93.26µs  p(95)=106.8µs  p(99.9)=881.83µs
     http_req_sending...............: avg=27.52µs  min=4.98µs  med=10.03µs  max=151.87ms p(90)=17.52µs  p(95)=21.16µs  p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.42ms min=1.84ms  med=185.53ms max=538.14ms p(90)=338.95ms p(95)=363.78ms p(99.9)=454.95ms
     http_reqs......................: 77733   1243.911289/s
     iteration_duration.............: avg=186.15ms min=4.78ms  med=188.38ms max=538.53ms p(90)=339.84ms p(95)=364.58ms p(99.9)=455.76ms
     iterations.....................: 76733   1227.908931/s
     success_rate...................: 100.00% ✓ 76733       ✗ 0    
     vus............................: 79      min=0         max=493
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

     checks.........................: 100.00% ✓ 104925     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   672 kB/s
     http_req_blocked...............: avg=6.1µs    min=1.02µs  med=2.44µs   max=3.96ms   p(90)=4.05µs   p(95)=4.97µs   p(99.9)=555.53µs
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=477.38µs
     http_req_duration..............: avg=398.64ms min=3.6ms   med=370.99ms max=1.58s    p(90)=789.09ms p(95)=855.49ms p(99.9)=1.26s   
       { expected_response:true }...: avg=398.64ms min=3.6ms   med=370.99ms max=1.58s    p(90)=789.09ms p(95)=855.49ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35975
     http_req_receiving.............: avg=81.76µs  min=28.9µs  med=64.58µs  max=180.2ms  p(90)=103.89µs p(95)=117.14µs p(99.9)=853.67µs
     http_req_sending...............: avg=30.05µs  min=4.82µs  med=11.56µs  max=141.71ms p(90)=19.11µs  p(95)=21.84µs  p(99.9)=2.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=398.53ms min=3.51ms  med=370.93ms max=1.58s    p(90)=788.99ms p(95)=855.38ms p(99.9)=1.26s   
     http_reqs......................: 35975   559.866698/s
     iteration_duration.............: avg=410.24ms min=21.21ms med=384.26ms max=1.58s    p(90)=792.71ms p(95)=858.11ms p(99.9)=1.26s   
     iterations.....................: 34975   544.304038/s
     success_rate...................: 100.00% ✓ 34975      ✗ 0    
     vus............................: 68      min=0        max=496
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

     checks.........................: 100.00% ✓ 48270      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=12.8µs   min=1.09µs  med=3.2µs    max=3.45ms  p(90)=5.05µs   p(95)=6.38µs   p(99.9)=2.16ms
     http_req_connecting............: avg=7.61µs   min=0s      med=0s       max=3.33ms  p(90)=0s       p(95)=0s       p(99.9)=2.07ms
     http_req_duration..............: avg=832.51ms min=5.43ms  med=737.39ms max=18.12s  p(90)=1.46s    p(95)=1.68s    p(99.9)=16.41s
       { expected_response:true }...: avg=832.51ms min=5.43ms  med=737.39ms max=18.12s  p(90)=1.46s    p(95)=1.68s    p(99.9)=16.41s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17090
     http_req_receiving.............: avg=97.54µs  min=35.04µs med=89.13µs  max=34.41ms p(90)=124.96µs p(95)=139.86µs p(99.9)=1.43ms
     http_req_sending...............: avg=26.15µs  min=5.63µs  med=17.37µs  max=6.77ms  p(90)=22.94µs  p(95)=26.92µs  p(99.9)=2.4ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=832.39ms min=5.35ms  med=737.31ms max=18.12s  p(90)=1.46s    p(95)=1.68s    p(99.9)=16.41s
     http_reqs......................: 17090   254.804712/s
     iteration_duration.............: avg=884.27ms min=40.57ms med=802.06ms max=18.12s  p(90)=1.48s    p(95)=1.69s    p(99.9)=16.52s
     iterations.....................: 16090   239.895133/s
     success_rate...................: 100.00% ✓ 16090      ✗ 0    
     vus............................: 58      min=0        max=499
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

     checks.........................: 100.00% ✓ 48465      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   288 kB/s
     http_req_blocked...............: avg=13.45µs  min=1.11µs  med=3.01µs   max=13.24ms  p(90)=4.63µs   p(95)=5.98µs   p(99.9)=2.25ms  
     http_req_connecting............: avg=8.75µs   min=0s      med=0s       max=13.08ms  p(90)=0s       p(95)=0s       p(99.9)=2.13ms  
     http_req_duration..............: avg=356.53ms min=7.37ms  med=421.42ms max=993.58ms p(90)=587.06ms p(95)=624.34ms p(99.9)=887.38ms
       { expected_response:true }...: avg=356.53ms min=7.37ms  med=421.42ms max=993.58ms p(90)=587.06ms p(95)=624.34ms p(99.9)=887.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17155
     http_req_receiving.............: avg=97.04µs  min=31.21µs med=82.12µs  max=132.57ms p(90)=121.79µs p(95)=137.42µs p(99.9)=978.68µs
     http_req_sending...............: avg=49.77µs  min=5.65µs  med=16.15µs  max=105.97ms p(90)=21.39µs  p(95)=25.78µs  p(99.9)=5.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=356.39ms min=7.23ms  med=421.29ms max=993.39ms p(90)=586.96ms p(95)=624.24ms p(99.9)=887.27ms
     http_reqs......................: 17155   235.163613/s
     iteration_duration.............: avg=378.69ms min=12.5ms  med=436.74ms max=1.01s    p(90)=590.56ms p(95)=627.96ms p(99.9)=897.15ms
     iterations.....................: 16155   221.455446/s
     success_rate...................: 100.00% ✓ 16155      ✗ 0    
     vus............................: 50      min=0        max=498
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 441603      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=21.17µs  min=982ns   med=3.13µs  max=63.92ms  p(90)=5.12µs   p(95)=6.42µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=16.81µs  min=0s      med=0s      max=59.65ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=95.95ms  min=1.53ms  med=90.96ms max=340.52ms p(90)=184.87ms p(95)=203.14ms p(99.9)=268.3ms 
       { expected_response:true }...: avg=95.95ms  min=1.53ms  med=90.96ms max=340.52ms p(90)=184.87ms p(95)=203.14ms p(99.9)=268.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148201
     http_req_receiving.............: avg=170.48µs min=27.53µs med=58.54µs max=109.16ms p(90)=167.85µs p(95)=381.95µs p(99.9)=24.82ms 
     http_req_sending...............: avg=74.11µs  min=5.09µs  med=11.86µs max=109.14ms p(90)=23.43µs  p(95)=138.4µs  p(99.9)=9.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.71ms  min=1.47ms  med=90.73ms max=326.27ms p(90)=184.5ms  p(95)=202.72ms p(99.9)=265.66ms
     http_reqs......................: 148201  2390.607572/s
     iteration_duration.............: avg=96.87ms  min=3.78ms  med=91.94ms max=365.53ms p(90)=185.4ms  p(95)=203.65ms p(99.9)=269.42ms
     iterations.....................: 147201  2374.476725/s
     success_rate...................: 100.00% ✓ 147201      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436116      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=13µs    min=861ns   med=2.22µs   max=60.38ms  p(90)=4.02µs   p(95)=5.22µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=10.12µs min=0s      med=0s       max=60.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.19ms  
     http_req_duration..............: avg=97.18ms min=1.45ms  med=92.27ms  max=473.83ms p(90)=186.2ms  p(95)=204.2ms  p(99.9)=309.56ms
       { expected_response:true }...: avg=97.18ms min=1.45ms  med=92.27ms  max=473.83ms p(90)=186.2ms  p(95)=204.2ms  p(99.9)=309.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146372
     http_req_receiving.............: avg=1.45ms  min=52.34µs med=158.85µs max=168.66ms p(90)=3.39ms   p(95)=5.36ms   p(99.9)=40.02ms 
     http_req_sending...............: avg=58.45µs min=4.72µs  med=9.29µs   max=214.39ms p(90)=20.66µs  p(95)=104.39µs p(99.9)=7.64ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.66ms min=1.36ms  med=90.69ms  max=472ms    p(90)=184.35ms p(95)=202.37ms p(99.9)=302.92ms
     http_reqs......................: 146372  2369.247835/s
     iteration_duration.............: avg=98.1ms  min=3.07ms  med=93.32ms  max=474.01ms p(90)=186.71ms p(95)=204.64ms p(99.9)=311.39ms
     iterations.....................: 145372  2353.061352/s
     success_rate...................: 100.00% ✓ 145372      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428298      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=18.95µs min=882ns   med=2.74µs   max=61.38ms  p(90)=4.41µs   p(95)=5.56µs   p(99.9)=1.95ms  
     http_req_connecting............: avg=15.34µs min=0s      med=0s       max=61.31ms  p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=98.99ms min=1.49ms  med=84.37ms  max=1.79s    p(90)=189.92ms p(95)=217.04ms p(99.9)=746.35ms
       { expected_response:true }...: avg=98.99ms min=1.49ms  med=84.37ms  max=1.79s    p(90)=189.92ms p(95)=217.04ms p(99.9)=746.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143766
     http_req_receiving.............: avg=1.74ms  min=52.74µs med=110.59µs max=995ms    p(90)=1.92ms   p(95)=4.94ms   p(99.9)=121.32ms
     http_req_sending...............: avg=69.27µs min=4.68µs  med=10.3µs   max=180.62ms p(90)=19.39µs  p(95)=116.74µs p(99.9)=9.44ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.18ms min=1.41ms  med=83.23ms  max=1.79s    p(90)=187.64ms p(95)=213.28ms p(99.9)=667.05ms
     http_reqs......................: 143766  2323.769339/s
     iteration_duration.............: avg=99.95ms min=2.84ms  med=85.39ms  max=1.79s    p(90)=190.53ms p(95)=217.92ms p(99.9)=746.97ms
     iterations.....................: 142766  2307.605786/s
     success_rate...................: 100.00% ✓ 142766      ✗ 0     
     vus............................: 98      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 424422      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=20.63µs  min=982ns   med=2.9µs    max=86.08ms  p(90)=4.67µs   p(95)=5.85µs   p(99.9)=2.43ms  
     http_req_connecting............: avg=16.54µs  min=0s      med=0s       max=86.02ms  p(90)=0s       p(95)=0s       p(99.9)=2.29ms  
     http_req_duration..............: avg=99.88ms  min=1.58ms  med=84.63ms  max=1.31s    p(90)=193.19ms p(95)=223.01ms p(99.9)=720.31ms
       { expected_response:true }...: avg=99.88ms  min=1.58ms  med=84.63ms  max=1.31s    p(90)=193.19ms p(95)=223.01ms p(99.9)=720.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142474
     http_req_receiving.............: avg=1.55ms   min=54.08µs med=113.42µs max=842.16ms p(90)=1.87ms   p(95)=4.95ms   p(99.9)=97.15ms 
     http_req_sending...............: avg=77.14µs  min=5.1µs   med=10.91µs  max=65.77ms  p(90)=21.44µs  p(95)=123.24µs p(99.9)=10.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.24ms  min=1.5ms   med=83.16ms  max=1.31s    p(90)=190.83ms p(95)=219.45ms p(99.9)=708.81ms
     http_reqs......................: 142474  2298.129702/s
     iteration_duration.............: avg=100.86ms min=2.8ms   med=85.83ms  max=1.31s    p(90)=193.92ms p(95)=223.82ms p(99.9)=721.08ms
     iterations.....................: 141474  2281.999533/s
     success_rate...................: 100.00% ✓ 141474      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 412482      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=16.56µs  min=842ns   med=2.58µs   max=70.66ms p(90)=4.66µs   p(95)=5.77µs   p(99.9)=3.49ms  
     http_req_connecting............: avg=13.05µs  min=0s      med=0s       max=70.46ms p(90)=0s       p(95)=0s       p(99.9)=2.92ms  
     http_req_duration..............: avg=102.61ms min=1.77ms  med=92.81ms  max=2.03s   p(90)=188.63ms p(95)=213.63ms p(99.9)=924.81ms
       { expected_response:true }...: avg=102.61ms min=1.77ms  med=92.81ms  max=2.03s   p(90)=188.63ms p(95)=213.63ms p(99.9)=924.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138494
     http_req_receiving.............: avg=1.82ms   min=50.98µs med=108.86µs max=1.8s    p(90)=1.63ms   p(95)=3.78ms   p(99.9)=145.65ms
     http_req_sending...............: avg=64.34µs  min=4.71µs  med=10.29µs  max=173.2ms p(90)=21.38µs  p(95)=106.81µs p(99.9)=8.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.72ms min=1.69ms  med=91.73ms  max=2.03s   p(90)=186.94ms p(95)=211.14ms p(99.9)=723.63ms
     http_reqs......................: 138494  2223.786246/s
     iteration_duration.............: avg=103.75ms min=3.4ms   med=94.04ms  max=2.13s   p(90)=189.24ms p(95)=214.83ms p(99.9)=946.48ms
     iterations.....................: 137494  2207.729332/s
     success_rate...................: 100.00% ✓ 137494      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 215850      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=5.88µs   min=961ns  med=2.95µs   max=5.78ms   p(90)=4.84µs   p(95)=5.88µs   p(99.9)=497.99µs
     http_req_connecting............: avg=2.23µs   min=0s     med=0s       max=5.72ms   p(90)=0s       p(95)=0s       p(99.9)=411.74µs
     http_req_duration..............: avg=195.57ms min=2.14ms med=196.42ms max=558.85ms p(90)=361.77ms p(95)=388.84ms p(99.9)=475.37ms
       { expected_response:true }...: avg=195.57ms min=2.14ms med=196.42ms max=558.85ms p(90)=361.77ms p(95)=388.84ms p(99.9)=475.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72950
     http_req_receiving.............: avg=84.68µs  min=28.7µs med=68.21µs  max=99.66ms  p(90)=109.93µs p(95)=125.69µs p(99.9)=1.44ms  
     http_req_sending...............: avg=37µs     min=5.02µs med=13.11µs  max=162.03ms p(90)=21.32µs  p(95)=25.37µs  p(99.9)=4.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.45ms min=2.03ms med=196.29ms max=558.77ms p(90)=361.67ms p(95)=388.74ms p(99.9)=475.24ms
     http_reqs......................: 72950   1163.416293/s
     iteration_duration.............: avg=198.53ms min=4.95ms med=199.78ms max=559.04ms p(90)=362.7ms  p(95)=389.57ms p(99.9)=475.79ms
     iterations.....................: 71950   1147.46816/s
     success_rate...................: 100.00% ✓ 71950       ✗ 0    
     vus............................: 89      min=0         max=498
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

     checks.........................: 100.00% ✓ 99402      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   633 kB/s
     http_req_blocked...............: avg=9.97µs   min=1.13µs  med=3.46µs   max=15.88ms  p(90)=5.3µs    p(95)=6.41µs   p(99.9)=1.49ms
     http_req_connecting............: avg=5.45µs   min=0s      med=0s       max=15.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.47ms
     http_req_duration..............: avg=420.34ms min=3.86ms  med=390.71ms max=1.87s    p(90)=831.5ms  p(95)=905.42ms p(99.9)=1.33s 
       { expected_response:true }...: avg=420.34ms min=3.86ms  med=390.71ms max=1.87s    p(90)=831.5ms  p(95)=905.42ms p(99.9)=1.33s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34134
     http_req_receiving.............: avg=93.62µs  min=32.12µs med=79.48µs  max=121.29ms p(90)=118.87µs p(95)=135.47µs p(99.9)=1.25ms
     http_req_sending...............: avg=32.59µs  min=5.78µs  med=16.13µs  max=164.43ms p(90)=23.3µs   p(95)=26.59µs  p(99.9)=2.54ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=420.21ms min=3.77ms  med=390.61ms max=1.87s    p(90)=831.35ms p(95)=905.3ms  p(99.9)=1.33s 
     http_reqs......................: 34134   527.433931/s
     iteration_duration.............: avg=433.26ms min=19.65ms med=406.58ms max=1.87s    p(90)=835.66ms p(95)=909.51ms p(99.9)=1.33s 
     iterations.....................: 33134   511.982067/s
     success_rate...................: 100.00% ✓ 33134      ✗ 0    
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

     checks.........................: 100.00% ✓ 47532      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=15.83µs  min=1.53µs  med=4.09µs   max=10.76ms p(90)=6.09µs   p(95)=7.8µs    p(99.9)=2.13ms
     http_req_connecting............: avg=9.88µs   min=0s      med=0s       max=10.69ms p(90)=0s       p(95)=0s       p(99.9)=2.09ms
     http_req_duration..............: avg=864.55ms min=5.74ms  med=780.87ms max=4.56s   p(90)=1.71s    p(95)=1.97s    p(99.9)=3.9s  
       { expected_response:true }...: avg=864.55ms min=5.74ms  med=780.87ms max=4.56s   p(90)=1.71s    p(95)=1.97s    p(99.9)=3.9s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16844
     http_req_receiving.............: avg=105.99µs min=40.69µs med=98.44µs  max=6.07ms  p(90)=138.45µs p(95)=155.05µs p(99.9)=1.46ms
     http_req_sending...............: avg=32.71µs  min=7.31µs  med=19.34µs  max=45.83ms p(90)=25.33µs  p(95)=30.53µs  p(99.9)=2.68ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=864.41ms min=5.61ms  med=780.73ms max=4.56s   p(90)=1.71s    p(95)=1.97s    p(99.9)=3.9s  
     http_reqs......................: 16844   249.652784/s
     iteration_duration.............: avg=919.17ms min=66.84ms med=841.15ms max=4.56s   p(90)=1.74s    p(95)=1.99s    p(99.9)=3.91s 
     iterations.....................: 15844   234.831317/s
     success_rate...................: 100.00% ✓ 15844      ✗ 0    
     vus............................: 76      min=0        max=500
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

     checks.........................: 100.00% ✓ 45663      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   283 kB/s
     http_req_blocked...............: avg=35.24µs  min=1.16µs  med=3.2µs    max=21.71ms p(90)=4.93µs   p(95)=6.36µs   p(99.9)=8.95ms
     http_req_connecting............: avg=30.16µs  min=0s      med=0s       max=21.6ms  p(90)=0s       p(95)=0s       p(99.9)=8.86ms
     http_req_duration..............: avg=895.02ms min=7.74ms  med=815.94ms max=3.02s   p(90)=1.83s    p(95)=1.95s    p(99.9)=2.73s 
       { expected_response:true }...: avg=895.02ms min=7.74ms  med=815.94ms max=3.02s   p(90)=1.83s    p(95)=1.95s    p(99.9)=2.73s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16221
     http_req_receiving.............: avg=95.72µs  min=34.72µs med=86.5µs   max=49.81ms p(90)=125.38µs p(95)=141.32µs p(99.9)=1.07ms
     http_req_sending...............: avg=26.6µs   min=5.33µs  med=16.26µs  max=29.53ms p(90)=21.89µs  p(95)=26.46µs  p(99.9)=2.14ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=894.9ms  min=7.61ms  med=815.84ms max=3.02s   p(90)=1.83s    p(95)=1.95s    p(99.9)=2.73s 
     http_reqs......................: 16221   235.812123/s
     iteration_duration.............: avg=953.8ms  min=34.98ms med=910.83ms max=3.03s   p(90)=1.84s    p(95)=1.95s    p(99.9)=2.74s 
     iterations.....................: 15221   221.274664/s
     success_rate...................: 100.00% ✓ 15221      ✗ 0    
     vus............................: 99      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

