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
| hive-router | v0.0.84 | 2,737 | 2,889 | 2,704 | 2.3% |  |
| fusion | 16.6.6 | 2,480 | 2,577 | 2,453 | 1.6% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,474 | 2,580 | 2,461 | 1.7% |  |
| fusion-nightly | 16.7.0-p.7 | 2,466 | 2,549 | 2,447 | 1.5% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,324 | 2,377 | 2,292 | 1.1% |  |
| cosmo | 0.334.0 | 1,198 | 1,234 | 1,193 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 574 | 584 | 570 | 0.8% |  |
| hive-gateway | 2.10.8 | 249 | 256 | 246 | 1.2% |  |
| apollo-gateway | 2.14.3 | 235 | 239 | 234 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (8606 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (540215 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,452 | 2,544 | 2,442 | 1.4% |  |
| fusion | 16.6.6 | 2,399 | 2,464 | 2,360 | 1.7% |  |
| fusion-nightly | 16.7.0-p.7 | 2,353 | 2,471 | 2,330 | 2.2% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,230 | 2,317 | 2,222 | 1.5% |  |
| hive-router | v0.0.84 | 2,216 | 2,378 | 2,208 | 2.7% |  |
| cosmo | 0.334.0 | 1,163 | 1,207 | 1,159 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 530 | 545 | 526 | 1.3% |  |
| hive-gateway | 2.10.8 | 237 | 243 | 234 | 1.2% |  |
| apollo-gateway | 2.14.3 | 230 | 236 | 230 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (21543 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (346760 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 503910      ✗ 0     
     data_received..................: 15 GB   240 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=20.51µs  min=1.08µs  med=2.67µs  max=58.39ms  p(90)=4.29µs   p(95)=5.44µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=16.95µs  min=0s      med=0s      max=58.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=84.12ms  min=1.42ms  med=79.37ms max=328.29ms p(90)=162.94ms p(95)=177.1ms  p(99.9)=233.78ms
       { expected_response:true }...: avg=84.12ms  min=1.42ms  med=79.37ms max=328.29ms p(90)=162.94ms p(95)=177.1ms  p(99.9)=233.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168970
     http_req_receiving.............: avg=159.78µs min=26.48µs med=52.27µs max=247.48ms p(90)=156.02µs p(95)=357.22µs p(99.9)=20.75ms 
     http_req_sending...............: avg=71.48µs  min=4.53µs  med=9.9µs   max=150.43ms p(90)=18.57µs  p(95)=125.85µs p(99.9)=10.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.89ms  min=1.37ms  med=79.17ms max=320.15ms p(90)=162.61ms p(95)=176.75ms p(99.9)=232.67ms
     http_reqs......................: 168970  2737.760653/s
     iteration_duration.............: avg=84.87ms  min=2.06ms  med=80.2ms  max=336.73ms p(90)=163.38ms p(95)=177.57ms p(99.9)=235.58ms
     iterations.....................: 167970  2721.558009/s
     success_rate...................: 100.00% ✓ 167970      ✗ 0     
     vus............................: 88      min=0         max=497 
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

     checks.........................: 100.00% ✓ 460584      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=19µs    min=872ns   med=2.42µs  max=75.81ms  p(90)=3.99µs   p(95)=5.05µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=15.72µs min=0s      med=0s      max=75.65ms  p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=92.02ms min=1.96ms  med=77.86ms max=1.98s    p(90)=176.95ms p(95)=206.19ms p(99.9)=882.59ms
       { expected_response:true }...: avg=92.02ms min=1.96ms  med=77.86ms max=1.98s    p(90)=176.95ms p(95)=206.19ms p(99.9)=882.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154528
     http_req_receiving.............: avg=1.71ms  min=52.18µs med=101.1µs max=1.28s    p(90)=1.76ms   p(95)=5.45ms   p(99.9)=110.84ms
     http_req_sending...............: avg=67.29µs min=4.62µs  med=9.17µs  max=192.07ms p(90)=16.9µs   p(95)=108.88µs p(99.9)=9.47ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.24ms min=1.87ms  med=76.76ms max=1.89s    p(90)=174.34ms p(95)=202.11ms p(99.9)=823.36ms
     http_reqs......................: 154528  2480.784299/s
     iteration_duration.............: avg=92.9ms  min=2.95ms  med=78.75ms max=1.98s    p(90)=177.62ms p(95)=207ms    p(99.9)=885.5ms 
     iterations.....................: 153528  2464.730352/s
     success_rate...................: 100.00% ✓ 153528      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458598      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=14.16µs min=861ns   med=2.04µs   max=55.41ms  p(90)=3.46µs   p(95)=4.51µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=11.46µs min=0s      med=0s       max=55.35ms  p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=92.43ms min=1.84ms  med=87.55ms  max=409.48ms p(90)=177.35ms p(95)=192.55ms p(99.9)=264.81ms
       { expected_response:true }...: avg=92.43ms min=1.84ms  med=87.55ms  max=409.48ms p(90)=177.35ms p(95)=192.55ms p(99.9)=264.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153866
     http_req_receiving.............: avg=1.45ms  min=50.84µs med=238.05µs max=184.51ms p(90)=3.45ms   p(95)=5.26ms   p(99.9)=35.6ms  
     http_req_sending...............: avg=57.15µs min=4.18µs  med=8.56µs   max=124.11ms p(90)=17.21µs  p(95)=100.79µs p(99.9)=7.67ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.92ms min=1.77ms  med=85.99ms  max=406.06ms p(90)=175.67ms p(95)=190.79ms p(99.9)=262.62ms
     http_reqs......................: 153866  2474.834385/s
     iteration_duration.............: avg=93.28ms min=4.82ms  med=88.5ms   max=409.66ms p(90)=177.83ms p(95)=193ms    p(99.9)=266.09ms
     iterations.....................: 152866  2458.750036/s
     success_rate...................: 100.00% ✓ 152866      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 457998      ✗ 0     
     data_received..................: 14 GB   216 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=15.17µs min=812ns   med=2.28µs   max=62.05ms  p(90)=3.8µs    p(95)=4.82µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=12.17µs min=0s      med=0s       max=61.97ms  p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=92.58ms min=1.92ms  med=81.27ms  max=1.54s    p(90)=175.91ms p(95)=202.82ms p(99.9)=581.95ms
       { expected_response:true }...: avg=92.58ms min=1.92ms  med=81.27ms  max=1.54s    p(90)=175.91ms p(95)=202.82ms p(99.9)=581.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153666
     http_req_receiving.............: avg=1.25ms  min=51.78µs med=100.22µs max=667.35ms p(90)=1.59ms   p(95)=4.11ms   p(99.9)=72.25ms 
     http_req_sending...............: avg=62.9µs  min=4.64µs  med=8.99µs   max=276.13ms p(90)=16.67µs  p(95)=104.93µs p(99.9)=8.22ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.26ms min=1.84ms  med=80.28ms  max=1.54s    p(90)=174.22ms p(95)=199.79ms p(99.9)=578.82ms
     http_reqs......................: 153666  2466.388103/s
     iteration_duration.............: avg=93.42ms min=3.16ms  med=82.17ms  max=1.54s    p(90)=176.41ms p(95)=203.37ms p(99.9)=583.92ms
     iterations.....................: 152666  2450.337786/s
     success_rate...................: 100.00% ✓ 152666      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429780      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=11.88µs min=871ns   med=2.11µs   max=56.61ms  p(90)=3.61µs   p(95)=4.7µs    p(99.9)=988.06µs
     http_req_connecting............: avg=9.14µs  min=0s      med=0s       max=56.4ms   p(90)=0s       p(95)=0s       p(99.9)=914.98µs
     http_req_duration..............: avg=98.67ms min=1.65ms  med=84.86ms  max=2.84s    p(90)=187.07ms p(95)=220.29ms p(99.9)=741.47ms
       { expected_response:true }...: avg=98.67ms min=1.65ms  med=84.86ms  max=2.84s    p(90)=187.07ms p(95)=220.29ms p(99.9)=741.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144260
     http_req_receiving.............: avg=1.45ms  min=51.95µs med=100.15µs max=652.02ms p(90)=1.74ms   p(95)=4.5ms    p(99.9)=97.72ms 
     http_req_sending...............: avg=55.29µs min=4.65µs  med=8.91µs   max=171.57ms p(90)=17.1µs   p(95)=96.88µs  p(99.9)=7.34ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.16ms min=1.58ms  med=83.75ms  max=2.84s    p(90)=184.87ms p(95)=216.07ms p(99.9)=717.15ms
     http_reqs......................: 144260  2324.760535/s
     iteration_duration.............: avg=99.61ms min=3.01ms  med=86.04ms  max=2.84s    p(90)=187.64ms p(95)=221.26ms p(99.9)=741.96ms
     iterations.....................: 143260  2308.645461/s
     success_rate...................: 100.00% ✓ 143260      ✗ 0     
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

     checks.........................: 100.00% ✓ 221928      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.59µs   min=992ns   med=2.55µs   max=9.94ms   p(90)=4.23µs   p(95)=5.17µs   p(99.9)=402.37µs
     http_req_connecting............: avg=2.41µs   min=0s      med=0s       max=9.9ms    p(90)=0s       p(95)=0s       p(99.9)=371.73µs
     http_req_duration..............: avg=190.32ms min=1.89ms  med=193.31ms max=499.87ms p(90)=351.24ms p(95)=377.55ms p(99.9)=451.66ms
       { expected_response:true }...: avg=190.32ms min=1.89ms  med=193.31ms max=499.87ms p(90)=351.24ms p(95)=377.55ms p(99.9)=451.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74976
     http_req_receiving.............: avg=82.19µs  min=29.24µs med=63.26µs  max=197.15ms p(90)=101.13µs p(95)=116.15µs p(99.9)=1.18ms  
     http_req_sending...............: avg=27.1µs   min=5.2µs   med=11.13µs  max=133.78ms p(90)=17.79µs  p(95)=21.78µs  p(99.9)=2.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.21ms min=1.8ms   med=193.21ms max=498.06ms p(90)=351.15ms p(95)=377.46ms p(99.9)=451.6ms 
     http_reqs......................: 74976   1198.924661/s
     iteration_duration.............: avg=193.12ms min=4.87ms  med=196.25ms max=500.02ms p(90)=352.13ms p(95)=378.23ms p(99.9)=452.6ms 
     iterations.....................: 73976   1182.933882/s
     success_rate...................: 100.00% ✓ 73976       ✗ 0    
     vus............................: 83      min=0         max=493
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

     checks.........................: 100.00% ✓ 107742     ✗ 0    
     data_received..................: 3.2 GB  51 MB/s
     data_sent......................: 44 MB   690 kB/s
     http_req_blocked...............: avg=9.41µs   min=1.22µs  med=3.11µs   max=24.49ms  p(90)=4.86µs   p(95)=5.92µs   p(99.9)=1.56ms
     http_req_connecting............: avg=5.24µs   min=0s      med=0s       max=24.27ms  p(90)=0s       p(95)=0s       p(99.9)=1.42ms
     http_req_duration..............: avg=388.4ms  min=3.51ms  med=357.61ms max=1.67s    p(90)=767.88ms p(95)=834.35ms p(99.9)=1.25s 
       { expected_response:true }...: avg=388.4ms  min=3.51ms  med=357.61ms max=1.67s    p(90)=767.88ms p(95)=834.35ms p(99.9)=1.25s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36914
     http_req_receiving.............: avg=88.83µs  min=31.37µs med=72.24µs  max=72.97ms  p(90)=110.97µs p(95)=125.72µs p(99.9)=1.2ms 
     http_req_sending...............: avg=35.61µs  min=5.55µs  med=13.62µs  max=107.16ms p(90)=20.98µs  p(95)=23.96µs  p(99.9)=3.43ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=388.27ms min=3.4ms   med=357.5ms  max=1.67s    p(90)=767.74ms p(95)=834.24ms p(99.9)=1.25s 
     http_reqs......................: 36914   574.919604/s
     iteration_duration.............: avg=399.44ms min=26.74ms med=371.16ms max=1.67s    p(90)=771.26ms p(95)=837.51ms p(99.9)=1.26s 
     iterations.....................: 35914   559.345036/s
     success_rate...................: 100.00% ✓ 35914      ✗ 0    
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

     checks.........................: 100.00% ✓ 47499      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=13.52µs  min=1.14µs  med=3.3µs    max=8.06ms  p(90)=4.99µs   p(95)=6.28µs   p(99.9)=2.25ms
     http_req_connecting............: avg=8.63µs   min=0s      med=0s       max=7.99ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms
     http_req_duration..............: avg=852.55ms min=5.81ms  med=767.78ms max=19.12s  p(90)=1.5s     p(95)=1.69s    p(99.9)=16.83s
       { expected_response:true }...: avg=852.55ms min=5.81ms  med=767.78ms max=19.12s  p(90)=1.5s     p(95)=1.69s    p(99.9)=16.83s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16833
     http_req_receiving.............: avg=97.9µs   min=35.22µs med=88.73µs  max=61.06ms p(90)=124.28µs p(95)=138.75µs p(99.9)=1.19ms
     http_req_sending...............: avg=39.37µs  min=5.54µs  med=16.61µs  max=87.87ms p(90)=21.66µs  p(95)=25.65µs  p(99.9)=3.76ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=852.41ms min=5.73ms  med=767.69ms max=19.12s  p(90)=1.5s     p(95)=1.69s    p(99.9)=16.83s
     http_reqs......................: 16833   249.020979/s
     iteration_duration.............: avg=906.41ms min=18.17ms med=823.71ms max=19.12s  p(90)=1.52s    p(95)=1.72s    p(99.9)=17.18s
     iterations.....................: 15833   234.22736/s
     success_rate...................: 100.00% ✓ 15833      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 48525      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   289 kB/s
     http_req_blocked...............: avg=12.96µs  min=1.12µs  med=2.96µs   max=10.78ms p(90)=4.53µs   p(95)=5.73µs   p(99.9)=2.26ms  
     http_req_connecting............: avg=8.49µs   min=0s      med=0s       max=10.72ms p(90)=0s       p(95)=0s       p(99.9)=2.21ms  
     http_req_duration..............: avg=379.11ms min=7.22ms  med=414.28ms max=1.12s   p(90)=655.17ms p(95)=712.57ms p(99.9)=995.6ms 
       { expected_response:true }...: avg=379.11ms min=7.22ms  med=414.28ms max=1.12s   p(90)=655.17ms p(95)=712.57ms p(99.9)=995.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17175
     http_req_receiving.............: avg=97.3µs   min=32.72µs med=85.9µs   max=69.74ms p(90)=122.69µs p(95)=135.96µs p(99.9)=940.03µs
     http_req_sending...............: avg=46.49µs  min=5.37µs  med=16.54µs  max=136.8ms p(90)=21.48µs  p(95)=26.19µs  p(99.9)=2.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=378.96ms min=7.09ms  med=414.18ms max=1.12s   p(90)=655.04ms p(95)=712.49ms p(99.9)=995.48ms
     http_reqs......................: 17175   235.737249/s
     iteration_duration.............: avg=402.54ms min=7.86ms  med=434.86ms max=1.12s   p(90)=662.85ms p(95)=716.63ms p(99.9)=1s      
     iterations.....................: 16175   222.011645/s
     success_rate...................: 100.00% ✓ 16175      ✗ 0    
     vus............................: 89      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 451281      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=16.06µs min=871ns   med=2.31µs   max=64.35ms  p(90)=4.24µs   p(95)=5.44µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=12.91µs min=0s      med=0s       max=64.3ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=93.88ms min=1.36ms  med=88.3ms   max=374.26ms p(90)=179.84ms p(95)=197.83ms p(99.9)=283.28ms
       { expected_response:true }...: avg=93.88ms min=1.36ms  med=88.3ms   max=374.26ms p(90)=179.84ms p(95)=197.83ms p(99.9)=283.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151427
     http_req_receiving.............: avg=1.38ms  min=50.82µs med=135.44µs max=313.88ms p(90)=3.26ms   p(95)=5.12ms   p(99.9)=38.77ms 
     http_req_sending...............: avg=68.14µs min=4.33µs  med=9.37µs   max=254.49ms p(90)=21.8µs   p(95)=112.15µs p(99.9)=8.61ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.43ms min=1.29ms  med=86.85ms  max=374.16ms p(90)=178.25ms p(95)=196.17ms p(99.9)=276.51ms
     http_reqs......................: 151427  2452.166667/s
     iteration_duration.............: avg=94.79ms min=4.39ms  med=89.3ms   max=374.45ms p(90)=180.37ms p(95)=198.4ms  p(99.9)=285.01ms
     iterations.....................: 150427  2435.972945/s
     success_rate...................: 100.00% ✓ 150427      ✗ 0     
     vus............................: 93      min=0         max=500 
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

     checks.........................: 100.00% ✓ 442779      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=23.26µs min=932ns  med=2.99µs   max=68.01ms  p(90)=4.86µs   p(95)=6.12µs   p(99.9)=2.33ms  
     http_req_connecting............: avg=19.54µs min=0s     med=0s       max=67.96ms  p(90)=0s       p(95)=0s       p(99.9)=2.28ms  
     http_req_duration..............: avg=95.72ms min=1.59ms med=82.71ms  max=1.95s    p(90)=183.36ms p(95)=210.38ms p(99.9)=967.05ms
       { expected_response:true }...: avg=95.72ms min=1.59ms med=82.71ms  max=1.95s    p(90)=183.36ms p(95)=210.38ms p(99.9)=967.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148593
     http_req_receiving.............: avg=1.38ms  min=54.5µs med=107.91µs max=1.01s    p(90)=1.62ms   p(95)=4.3ms    p(99.9)=94.69ms 
     http_req_sending...............: avg=80.95µs min=4.88µs med=11.42µs  max=197.27ms p(90)=22.31µs  p(95)=132.5µs  p(99.9)=11.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.25ms min=1.5ms  med=81.64ms  max=1.95s    p(90)=180.82ms p(95)=207.28ms p(99.9)=962.73ms
     http_reqs......................: 148593  2399.103293/s
     iteration_duration.............: avg=96.64ms min=3.06ms med=83.69ms  max=1.95s    p(90)=184ms    p(95)=211.13ms p(99.9)=967.82ms
     iterations.....................: 147593  2382.957826/s
     success_rate...................: 100.00% ✓ 147593      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 434091      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=16.45µs min=872ns   med=2.29µs   max=50.02ms  p(90)=4.02µs   p(95)=5.17µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=13.49µs min=0s      med=0s       max=49.79ms  p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=97.69ms min=1.46ms  med=83.62ms  max=2.34s    p(90)=186.11ms p(95)=210.47ms p(99.9)=800.21ms
       { expected_response:true }...: avg=97.69ms min=1.46ms  med=83.62ms  max=2.34s    p(90)=186.11ms p(95)=210.47ms p(99.9)=800.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145697
     http_req_receiving.............: avg=1.54ms  min=54.36µs med=107.46µs max=2.17s    p(90)=1.81ms   p(95)=4.65ms   p(99.9)=96.6ms  
     http_req_sending...............: avg=65.49µs min=4.87µs  med=9.6µs    max=270.14ms p(90)=19.95µs  p(95)=108.02µs p(99.9)=8.69ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.08ms min=1.38ms  med=82.33ms  max=2.04s    p(90)=184.24ms p(95)=207.91ms p(99.9)=793.92ms
     http_reqs......................: 145697  2353.823229/s
     iteration_duration.............: avg=98.63ms min=2.68ms  med=84.66ms  max=2.34s    p(90)=186.61ms p(95)=211.04ms p(99.9)=802.36ms
     iterations.....................: 144697  2337.667624/s
     success_rate...................: 100.00% ✓ 144697      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413475      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=15.94µs  min=911ns   med=2.37µs   max=71.39ms  p(90)=4.32µs   p(95)=5.47µs   p(99.9)=1.12ms  
     http_req_connecting............: avg=12.76µs  min=0s      med=0s       max=71.34ms  p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=102.48ms min=1.81ms  med=90.33ms  max=1.36s    p(90)=195.76ms p(95)=223.86ms p(99.9)=705.79ms
       { expected_response:true }...: avg=102.48ms min=1.81ms  med=90.33ms  max=1.36s    p(90)=195.76ms p(95)=223.86ms p(99.9)=705.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138825
     http_req_receiving.............: avg=1.44ms   min=51.02µs med=107.28µs max=974.92ms p(90)=1.7ms    p(95)=4.05ms   p(99.9)=113.65ms
     http_req_sending...............: avg=62.49µs  min=4.46µs  med=9.87µs   max=62.87ms  p(90)=21.47µs  p(95)=108.26µs p(99.9)=8.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.97ms min=1.67ms  med=89.22ms  max=1.36s    p(90)=193.64ms p(95)=220.59ms p(99.9)=697.63ms
     http_reqs......................: 138825  2230.634177/s
     iteration_duration.............: avg=103.5ms  min=3.23ms  med=91.52ms  max=1.36s    p(90)=196.42ms p(95)=224.67ms p(99.9)=711.61ms
     iterations.....................: 137825  2214.56622/s
     success_rate...................: 100.00% ✓ 137825      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 409491      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=17.32µs  min=1µs     med=3.14µs  max=47.97ms  p(90)=5.06µs   p(95)=6.33µs   p(99.9)=2ms     
     http_req_connecting............: avg=13.32µs  min=0s      med=0s      max=47.91ms  p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=103.46ms min=1.64ms  med=98.04ms max=305.56ms p(90)=200.07ms p(95)=217.14ms p(99.9)=265.4ms 
       { expected_response:true }...: avg=103.46ms min=1.64ms  med=98.04ms max=305.56ms p(90)=200.07ms p(95)=217.14ms p(99.9)=265.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 137497
     http_req_receiving.............: avg=131.15µs min=28.35µs med=61.23µs max=181.66ms p(90)=145.27µs p(95)=376.84µs p(99.9)=9.63ms  
     http_req_sending...............: avg=73.22µs  min=4.96µs  med=12.43µs max=229.7ms  p(90)=23.3µs   p(95)=137.89µs p(99.9)=8.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.25ms min=1.56ms  med=97.86ms max=303.06ms p(90)=199.82ms p(95)=216.85ms p(99.9)=264.37ms
     http_reqs......................: 137497  2216.85668/s
     iteration_duration.............: avg=104.47ms min=4.54ms  med=99.18ms max=315.76ms p(90)=200.64ms p(95)=217.59ms p(99.9)=266.81ms
     iterations.....................: 136497  2200.733735/s
     success_rate...................: 100.00% ✓ 136497      ✗ 0     
     vus............................: 58      min=0         max=498 
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

     checks.........................: 100.00% ✓ 215598      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.8µs    min=1.04µs  med=3µs      max=23.59ms  p(90)=4.89µs   p(95)=5.94µs   p(99.9)=605.28µs
     http_req_connecting............: avg=3.09µs   min=0s      med=0s       max=23.52ms  p(90)=0s       p(95)=0s       p(99.9)=556µs   
     http_req_duration..............: avg=195.85ms min=2.06ms  med=196.39ms max=574.15ms p(90)=360.59ms p(95)=388.03ms p(99.9)=498.92ms
       { expected_response:true }...: avg=195.85ms min=2.06ms  med=196.39ms max=574.15ms p(90)=360.59ms p(95)=388.03ms p(99.9)=498.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72866
     http_req_receiving.............: avg=86.51µs  min=27.95µs med=69.48µs  max=111.47ms p(90)=110.46µs p(95)=126.64µs p(99.9)=1.57ms  
     http_req_sending...............: avg=35.45µs  min=4.92µs  med=12.87µs  max=209.6ms  p(90)=20.43µs  p(95)=24.5µs   p(99.9)=4.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.72ms min=1.99ms  med=196.28ms max=573.68ms p(90)=360.47ms p(95)=387.91ms p(99.9)=498.75ms
     http_reqs......................: 72866   1163.114231/s
     iteration_duration.............: avg=198.83ms min=6ms     med=199.36ms max=574.54ms p(90)=361.59ms p(95)=388.8ms  p(99.9)=499.23ms
     iterations.....................: 71866   1147.151858/s
     success_rate...................: 100.00% ✓ 71866       ✗ 0    
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

     checks.........................: 100.00% ✓ 99969      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   637 kB/s
     http_req_blocked...............: avg=7.79µs   min=1.07µs  med=2.59µs   max=4.88ms   p(90)=4.34µs   p(95)=5.33µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=4.2µs    min=0s      med=0s       max=4.39ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=418.06ms min=3.74ms  med=391.52ms max=1.93s    p(90)=824.23ms p(95)=896.57ms p(99.9)=1.36s   
       { expected_response:true }...: avg=418.06ms min=3.74ms  med=391.52ms max=1.93s    p(90)=824.23ms p(95)=896.57ms p(99.9)=1.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34323
     http_req_receiving.............: avg=85.7µs   min=29.9µs  med=72.7µs   max=108.45ms p(90)=113.68µs p(95)=127.95µs p(99.9)=916.72µs
     http_req_sending...............: avg=29.57µs  min=4.93µs  med=13.47µs  max=163.86ms p(90)=20.71µs  p(95)=23.6µs   p(99.9)=2.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=417.95ms min=3.67ms  med=391.37ms max=1.93s    p(90)=824.14ms p(95)=896.48ms p(99.9)=1.36s   
     http_reqs......................: 34323   530.435916/s
     iteration_duration.............: avg=430.84ms min=29.41ms med=407.48ms max=1.94s    p(90)=828.51ms p(95)=899.39ms p(99.9)=1.36s   
     iterations.....................: 33323   514.981675/s
     success_rate...................: 100.00% ✓ 33323      ✗ 0    
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

     checks.........................: 100.00% ✓ 45600      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   285 kB/s
     http_req_blocked...............: avg=15.24µs  min=1.61µs  med=3.68µs   max=6.15ms  p(90)=5.52µs   p(95)=7.19µs   p(99.9)=2.17ms
     http_req_connecting............: avg=9.65µs   min=0s      med=0s       max=5.91ms  p(90)=0s       p(95)=0s       p(99.9)=2.15ms
     http_req_duration..............: avg=899.97ms min=6.34ms  med=812.13ms max=5.22s   p(90)=1.76s    p(95)=2.04s    p(99.9)=4.39s 
       { expected_response:true }...: avg=899.97ms min=6.34ms  med=812.13ms max=5.22s   p(90)=1.76s    p(95)=2.04s    p(99.9)=4.39s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16200
     http_req_receiving.............: avg=100.95µs min=37.95µs med=92.21µs  max=18.04ms p(90)=131.05µs p(95)=145.42µs p(99.9)=1.33ms
     http_req_sending...............: avg=30.17µs  min=6.59µs  med=18.15µs  max=11.41ms p(90)=23.93µs  p(95)=29.22µs  p(99.9)=3.95ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=899.84ms min=6.23ms  med=812ms    max=5.22s   p(90)=1.76s    p(95)=2.04s    p(99.9)=4.39s 
     http_reqs......................: 16200   237.410291/s
     iteration_duration.............: avg=959.16ms min=33.93ms med=885.67ms max=5.23s   p(90)=1.79s    p(95)=2.05s    p(99.9)=4.41s 
     iterations.....................: 15200   222.755335/s
     success_rate...................: 100.00% ✓ 15200      ✗ 0    
     vus............................: 67      min=0        max=500
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

     checks.........................: 100.00% ✓ 44694      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=15.85µs  min=1.1µs   med=3.26µs   max=12.26ms p(90)=5.07µs   p(95)=6.86µs   p(99.9)=2.41ms
     http_req_connecting............: avg=10.76µs  min=0s      med=0s       max=12.12ms p(90)=0s       p(95)=0s       p(99.9)=2.39ms
     http_req_duration..............: avg=914.13ms min=8.05ms  med=828.22ms max=3.23s   p(90)=1.86s    p(95)=1.99s    p(99.9)=2.93s 
       { expected_response:true }...: avg=914.13ms min=8.05ms  med=828.22ms max=3.23s   p(90)=1.86s    p(95)=1.99s    p(99.9)=2.93s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15898
     http_req_receiving.............: avg=97.66µs  min=34.5µs  med=90.32µs  max=7.35ms  p(90)=130.79µs p(95)=146.09µs p(99.9)=1.16ms
     http_req_sending...............: avg=36.44µs  min=5.29µs  med=17.3µs   max=80.9ms  p(90)=23.06µs  p(95)=28.07µs  p(99.9)=2.97ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=914ms    min=7.9ms   med=828.1ms  max=3.23s   p(90)=1.86s    p(95)=1.99s    p(99.9)=2.93s 
     http_reqs......................: 15898   230.169591/s
     iteration_duration.............: avg=975.39ms min=41.08ms med=921.9ms  max=3.24s   p(90)=1.88s    p(95)=1.99s    p(99.9)=2.95s 
     iterations.....................: 14898   215.691695/s
     success_rate...................: 100.00% ✓ 14898      ✗ 0    
     vus............................: 56      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

