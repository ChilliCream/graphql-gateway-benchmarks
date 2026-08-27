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
| hive-router | v0.0.84 | 2,711 | 2,867 | 2,689 | 2.4% |  |
| fusion-nightly-net11 | 16.6.2-p.8 | 2,573 | 2,660 | 2,552 | 1.4% |  |
| fusion | 16.6.1 | 2,566 | 2,660 | 2,557 | 1.4% |  |
| fusion-nightly | 16.6.2-p.8 | 2,522 | 2,636 | 2,509 | 1.7% |  |
| fusion-nightly-fed | 16.6.2-p.8 | 2,312 | 2,388 | 2,286 | 1.4% |  |
| cosmo | 0.334.0 | 1,198 | 1,237 | 1,185 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 573 | 584 | 569 | 0.9% |  |
| hive-gateway | 2.10.8 | 251 | 256 | 249 | 0.9% |  |
| apollo-gateway | 2.14.3 | 228 | 236 | 227 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (11199 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (567569 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.6.2-p.8 | 2,404 | 2,501 | 2,387 | 1.6% |  |
| fusion | 16.6.1 | 2,397 | 2,482 | 2,391 | 1.4% |  |
| fusion-nightly-net11 | 16.6.2-p.8 | 2,390 | 2,503 | 2,377 | 1.9% |  |
| fusion-nightly-fed | 16.6.2-p.8 | 2,233 | 2,303 | 2,197 | 1.6% |  |
| hive-router | v0.0.84 | 2,216 | 2,385 | 2,204 | 2.8% |  |
| cosmo | 0.334.0 | 1,112 | 1,157 | 1,102 | 1.8% |  |
| hive-gateway-router-runtime | 2.10.8 | 531 | 546 | 528 | 1.1% |  |
| hive-gateway | 2.10.8 | 237 | 244 | 235 | 1.3% |  |
| apollo-gateway | 2.14.3 | 236 | 240 | 234 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (44137 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (324604 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 499356      ✗ 0     
     data_received..................: 15 GB   238 MB/s
     data_sent......................: 201 MB  3.3 MB/s
     http_req_blocked...............: avg=21.15µs  min=1.08µs  med=2.65µs  max=58.57ms  p(90)=4.32µs   p(95)=5.48µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=17.47µs  min=0s      med=0s      max=58.5ms   p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=84.86ms  min=1.43ms  med=79.95ms max=348.58ms p(90)=162.92ms p(95)=178.96ms p(99.9)=236.94ms
       { expected_response:true }...: avg=84.86ms  min=1.43ms  med=79.95ms max=348.58ms p(90)=162.92ms p(95)=178.96ms p(99.9)=236.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167452
     http_req_receiving.............: avg=158.73µs min=27.28µs med=54.04µs max=47.61ms  p(90)=146.68µs p(95)=349.35µs p(99.9)=20.92ms 
     http_req_sending...............: avg=72.16µs  min=4.95µs  med=9.86µs  max=202.74ms p(90)=18.94µs  p(95)=123.34µs p(99.9)=9.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.62ms  min=1.38ms  med=79.73ms max=338.77ms p(90)=162.59ms p(95)=178.61ms p(99.9)=236.01ms
     http_reqs......................: 167452  2711.815764/s
     iteration_duration.............: avg=85.64ms  min=2.04ms  med=80.83ms max=364.56ms p(90)=163.38ms p(95)=179.5ms  p(99.9)=240.14ms
     iterations.....................: 166452  2695.621179/s
     success_rate...................: 100.00% ✓ 166452      ✗ 0     
     vus............................: 91      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 476886      ✗ 0     
     data_received..................: 14 GB   226 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=21.23µs  min=1.01µs  med=2.64µs   max=55.38ms  p(90)=4.21µs   p(95)=5.32µs   p(99.9)=2.46ms  
     http_req_connecting............: avg=17.5µs   min=0s      med=0s       max=55.24ms  p(90)=0s       p(95)=0s       p(99.9)=2.36ms  
     http_req_duration..............: avg=88.87ms  min=1.86ms  med=84.22ms  max=347.83ms p(90)=170.98ms p(95)=187.07ms p(99.9)=243.45ms
       { expected_response:true }...: avg=88.87ms  min=1.86ms  med=84.22ms  max=347.83ms p(90)=170.98ms p(95)=187.07ms p(99.9)=243.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159962
     http_req_receiving.............: avg=630.79µs min=53.44µs med=104.65µs max=124.16ms p(90)=1.14ms   p(95)=2.08ms   p(99.9)=29.1ms  
     http_req_sending...............: avg=72.26µs  min=4.44µs  med=9.83µs   max=188.07ms p(90)=18.43µs  p(95)=119.5µs  p(99.9)=10.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.16ms  min=1.8ms   med=83.42ms  max=347.75ms p(90)=170.26ms p(95)=186.32ms p(99.9)=242.65ms
     http_reqs......................: 159962  2573.47202/s
     iteration_duration.............: avg=89.69ms  min=3.77ms  med=85.17ms  max=355.87ms p(90)=171.44ms p(95)=187.53ms p(99.9)=244.21ms
     iterations.....................: 158962  2557.383999/s
     success_rate...................: 100.00% ✓ 158962      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 477093      ✗ 0     
     data_received..................: 14 GB   225 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=17.63µs min=862ns   med=2µs     max=72.88ms  p(90)=3.31µs   p(95)=4.33µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=14.75µs min=0s      med=0s      max=72.81ms  p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=88.88ms min=1.98ms  med=77.83ms max=1.77s    p(90)=170.4ms  p(95)=193.61ms p(99.9)=556.01ms
       { expected_response:true }...: avg=88.88ms min=1.98ms  med=77.83ms max=1.77s    p(90)=170.4ms  p(95)=193.61ms p(99.9)=556.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160031
     http_req_receiving.............: avg=1.39ms  min=51.74µs med=93.15µs max=852.48ms p(90)=1.52ms   p(95)=4.19ms   p(99.9)=79ms    
     http_req_sending...............: avg=65.33µs min=4.51µs  med=8.66µs  max=224.6ms  p(90)=15.87µs  p(95)=100.92µs p(99.9)=9.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.42ms min=1.87ms  med=76.72ms max=1.77s    p(90)=168.61ms p(95)=190.89ms p(99.9)=543.66ms
     http_reqs......................: 160031  2566.08363/s
     iteration_duration.............: avg=89.68ms min=2.97ms  med=78.78ms max=1.77s    p(90)=170.91ms p(95)=194.21ms p(99.9)=556.3ms 
     iterations.....................: 159031  2550.048714/s
     success_rate...................: 100.00% ✓ 159031      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 468972      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 189 MB  3.0 MB/s
     http_req_blocked...............: avg=17.76µs min=892ns   med=2.04µs  max=91.17ms  p(90)=3.5µs    p(95)=4.55µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=14.98µs min=0s      med=0s      max=90.86ms  p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=90.42ms min=1.94ms  med=78.12ms max=1.13s    p(90)=170.85ms p(95)=193.93ms p(99.9)=624.53ms
       { expected_response:true }...: avg=90.42ms min=1.94ms  med=78.12ms max=1.13s    p(90)=170.85ms p(95)=193.93ms p(99.9)=624.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157324
     http_req_receiving.............: avg=1.31ms  min=50.37µs med=96.5µs  max=766.67ms p(90)=1.57ms   p(95)=4.34ms   p(99.9)=82.59ms 
     http_req_sending...............: avg=63.7µs  min=4.48µs  med=8.83µs  max=202.78ms p(90)=17.64µs  p(95)=104.4µs  p(99.9)=8.78ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.04ms min=1.83ms  med=76.85ms max=1.13s    p(90)=169.16ms p(95)=191.43ms p(99.9)=617.9ms 
     http_reqs......................: 157324  2522.31307/s
     iteration_duration.............: avg=91.25ms min=3.35ms  med=79.15ms max=1.13s    p(90)=171.37ms p(95)=194.55ms p(99.9)=624.95ms
     iterations.....................: 156324  2506.280468/s
     success_rate...................: 100.00% ✓ 156324      ✗ 0     
     vus............................: 73      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427464      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=15.23µs  min=922ns   med=2.17µs   max=121.13ms p(90)=3.65µs   p(95)=4.73µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=12.34µs  min=0s      med=0s       max=121.08ms p(90)=0s       p(95)=0s       p(99.9)=972.95µs
     http_req_duration..............: avg=99.11ms  min=1.65ms  med=80.99ms  max=2.25s    p(90)=179.27ms p(95)=215.07ms p(99.9)=1.26s   
       { expected_response:true }...: avg=99.11ms  min=1.65ms  med=80.99ms  max=2.25s    p(90)=179.27ms p(95)=215.07ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 143488
     http_req_receiving.............: avg=1.53ms   min=51.87µs med=102.22µs max=1.09s    p(90)=1.65ms   p(95)=4.43ms   p(99.9)=113.66ms
     http_req_sending...............: avg=60.83µs  min=4.64µs  med=9.22µs   max=109.97ms p(90)=16.85µs  p(95)=94.4µs   p(99.9)=8.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.52ms  min=1.57ms  med=79.88ms  max=2.25s    p(90)=177.58ms p(95)=212.87ms p(99.9)=1.23s   
     http_reqs......................: 143488  2312.397892/s
     iteration_duration.............: avg=100.16ms min=2.33ms  med=81.92ms  max=2.34s    p(90)=180.03ms p(95)=216.24ms p(99.9)=1.29s   
     iterations.....................: 142488  2296.282273/s
     success_rate...................: 100.00% ✓ 142488      ✗ 0     
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

     checks.........................: 100.00% ✓ 221475      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=8.39µs   min=1.02µs  med=2.57µs   max=9.57ms   p(90)=4.19µs   p(95)=5.11µs   p(99.9)=400.32µs
     http_req_connecting............: avg=5.12µs   min=0s      med=0s       max=9.51ms   p(90)=0s       p(95)=0s       p(99.9)=351.65µs
     http_req_duration..............: avg=190.68ms min=1.93ms  med=191.37ms max=547.38ms p(90)=352.64ms p(95)=379.16ms p(99.9)=473.33ms
       { expected_response:true }...: avg=190.68ms min=1.93ms  med=191.37ms max=547.38ms p(90)=352.64ms p(95)=379.16ms p(99.9)=473.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74825
     http_req_receiving.............: avg=74.37µs  min=28.06µs med=60.08µs  max=40.88ms  p(90)=96.66µs  p(95)=111.94µs p(99.9)=1.02ms  
     http_req_sending...............: avg=27.74µs  min=4.79µs  med=10.65µs  max=101.56ms p(90)=16.88µs  p(95)=20.61µs  p(99.9)=2.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.58ms min=1.86ms  med=191.28ms max=547.31ms p(90)=352.53ms p(95)=379.09ms p(99.9)=473.25ms
     http_reqs......................: 74825   1198.175964/s
     iteration_duration.............: avg=193.5ms  min=4.6ms   med=194.34ms max=547.56ms p(90)=353.57ms p(95)=379.84ms p(99.9)=474.72ms
     iterations.....................: 73825   1182.16292/s
     success_rate...................: 100.00% ✓ 73825       ✗ 0    
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

     checks.........................: 100.00% ✓ 107478     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   689 kB/s
     http_req_blocked...............: avg=8.79µs   min=1.09µs  med=3.13µs   max=18.7ms   p(90)=4.96µs   p(95)=6.08µs   p(99.9)=1.16ms
     http_req_connecting............: avg=4.6µs    min=0s      med=0s       max=18.62ms  p(90)=0s       p(95)=0s       p(99.9)=1.13ms
     http_req_duration..............: avg=389.37ms min=3.5ms   med=358.28ms max=1.66s    p(90)=760.3ms  p(95)=831.92ms p(99.9)=1.17s 
       { expected_response:true }...: avg=389.37ms min=3.5ms   med=358.28ms max=1.66s    p(90)=760.3ms  p(95)=831.92ms p(99.9)=1.17s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36826
     http_req_receiving.............: avg=88.97µs  min=30.4µs  med=72.74µs  max=131.52ms p(90)=111.93µs p(95)=126.77µs p(99.9)=1.48ms
     http_req_sending...............: avg=27.99µs  min=5.39µs  med=14.13µs  max=67.5ms   p(90)=21.75µs  p(95)=24.86µs  p(99.9)=2.47ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=389.25ms min=3.41ms  med=358.19ms max=1.66s    p(90)=760.21ms p(95)=831.77ms p(99.9)=1.17s 
     http_reqs......................: 36826   573.760949/s
     iteration_duration.............: avg=400.49ms min=25.47ms med=372.01ms max=1.66s    p(90)=763.22ms p(95)=834.72ms p(99.9)=1.19s 
     iterations.....................: 35826   558.180627/s
     success_rate...................: 100.00% ✓ 35826      ✗ 0    
     vus............................: 63      min=0        max=497
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

     checks.........................: 100.00% ✓ 47688      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   302 kB/s
     http_req_blocked...............: avg=12.61µs  min=1.44µs  med=3.63µs   max=10.6ms   p(90)=5.42µs   p(95)=6.98µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=7.13µs   min=0s      med=0s       max=10.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=843.85ms min=5.68ms  med=753.93ms max=17.2s    p(90)=1.6s     p(95)=1.74s    p(99.9)=13.9s   
       { expected_response:true }...: avg=843.85ms min=5.68ms  med=753.93ms max=17.2s    p(90)=1.6s     p(95)=1.74s    p(99.9)=13.9s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16896
     http_req_receiving.............: avg=99.96µs  min=39.09µs med=89.01µs  max=54.37ms  p(90)=127.56µs p(95)=143.12µs p(99.9)=978.77µs
     http_req_sending...............: avg=32.66µs  min=6.71µs  med=17.13µs  max=100.27ms p(90)=23.1µs   p(95)=26.95µs  p(99.9)=1.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=843.71ms min=5.63ms  med=753.83ms max=17.2s    p(90)=1.6s     p(95)=1.74s    p(99.9)=13.9s   
     http_reqs......................: 16896   251.06119/s
     iteration_duration.............: avg=896.98ms min=40.3ms  med=824.85ms max=17.2s    p(90)=1.63s    p(95)=1.75s    p(99.9)=13.98s  
     iterations.....................: 15896   236.201981/s
     success_rate...................: 100.00% ✓ 15896      ✗ 0    
     vus............................: 73      min=0        max=499
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

     checks.........................: 100.00% ✓ 47088      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   280 kB/s
     http_req_blocked...............: avg=9.67µs   min=1.09µs  med=2.9µs    max=9.94ms  p(90)=4.45µs   p(95)=5.81µs   p(99.9)=675.58µs
     http_req_connecting............: avg=5.24µs   min=0s      med=0s       max=9.68ms  p(90)=0s       p(95)=0s       p(99.9)=647.58µs
     http_req_duration..............: avg=411.37ms min=7.57ms  med=498.16ms max=1.15s   p(90)=676.08ms p(95)=715.03ms p(99.9)=1s      
       { expected_response:true }...: avg=411.37ms min=7.57ms  med=498.16ms max=1.15s   p(90)=676.08ms p(95)=715.03ms p(99.9)=1s      
     http_req_failed................: 0.00%   ✓ 0          ✗ 16696
     http_req_receiving.............: avg=86.57µs  min=32.32µs med=79.63µs  max=11.12ms p(90)=118.01µs p(95)=132.6µs  p(99.9)=886.98µs
     http_req_sending...............: avg=29.8µs   min=5.3µs   med=14.89µs  max=26.59ms p(90)=19.86µs  p(95)=24.39µs  p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=411.26ms min=7.46ms  med=498.06ms max=1.15s   p(90)=675.99ms p(95)=714.92ms p(99.9)=1s      
     http_reqs......................: 16696   228.201037/s
     iteration_duration.............: avg=437.51ms min=13.14ms med=515.58ms max=1.15s   p(90)=679.26ms p(95)=720.4ms  p(99.9)=1.01s   
     iterations.....................: 15696   214.53303/s
     success_rate...................: 100.00% ✓ 15696      ✗ 0    
     vus............................: 55      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443676      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=19.25µs min=892ns   med=2.38µs   max=117.56ms p(90)=4.27µs   p(95)=5.42µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=16.2µs  min=0s      med=0s       max=117.34ms p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=95.55ms min=1.53ms  med=83.85ms  max=1.47s    p(90)=182.61ms p(95)=210.9ms  p(99.9)=647.47ms
       { expected_response:true }...: avg=95.55ms min=1.53ms  med=83.85ms  max=1.47s    p(90)=182.61ms p(95)=210.9ms  p(99.9)=647.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148892
     http_req_receiving.............: avg=1.29ms  min=51.68µs med=101.38µs max=641.37ms p(90)=1.39ms   p(95)=3.48ms   p(99.9)=112.44ms
     http_req_sending...............: avg=69.7µs  min=4.69µs  med=9.91µs   max=285.61ms p(90)=21.22µs  p(95)=109.13µs p(99.9)=9.1ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.19ms min=1.44ms  med=82.88ms  max=1.46s    p(90)=180.89ms p(95)=208.04ms p(99.9)=642.57ms
     http_reqs......................: 148892  2404.39445/s
     iteration_duration.............: avg=96.47ms min=2.64ms  med=84.85ms  max=1.47s    p(90)=183.22ms p(95)=211.65ms p(99.9)=649.99ms
     iterations.....................: 147892  2388.245869/s
     success_rate...................: 100.00% ✓ 147892      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 442254      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=17.34µs min=882ns  med=2.31µs   max=54.86ms  p(90)=4.03µs   p(95)=5.21µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=14.38µs min=0s     med=0s       max=54.75ms  p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=95.84ms min=1.52ms med=85.94ms  max=1.22s    p(90)=181.54ms p(95)=208.47ms p(99.9)=663.92ms
       { expected_response:true }...: avg=95.84ms min=1.52ms med=85.94ms  max=1.22s    p(90)=181.54ms p(95)=208.47ms p(99.9)=663.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148418
     http_req_receiving.............: avg=1.23ms  min=53.7µs med=103.47µs max=493.13ms p(90)=1.53ms   p(95)=3.94ms   p(99.9)=69.9ms  
     http_req_sending...............: avg=65.35µs min=4.88µs med=9.67µs   max=38.15ms  p(90)=19.79µs  p(95)=109.34µs p(99.9)=9.12ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.54ms min=1.44ms med=84.95ms  max=1.22s    p(90)=179.75ms p(95)=205.6ms  p(99.9)=658.44ms
     http_reqs......................: 148418  2397.694841/s
     iteration_duration.............: avg=96.76ms min=2.99ms med=86.98ms  max=1.22s    p(90)=182.16ms p(95)=209.16ms p(99.9)=664.81ms
     iterations.....................: 147418  2381.539827/s
     success_rate...................: 100.00% ✓ 147418      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 439737      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=21.02µs  min=1.07µs  med=2.82µs   max=55.99ms  p(90)=4.53µs   p(95)=5.7µs    p(99.9)=2.5ms   
     http_req_connecting............: avg=17.29µs  min=0s      med=0s       max=55.92ms  p(90)=0s       p(95)=0s       p(99.9)=2.34ms  
     http_req_duration..............: avg=96.34ms  min=1.39ms  med=91.43ms  max=377.88ms p(90)=184.02ms p(95)=201.9ms  p(99.9)=269.38ms
       { expected_response:true }...: avg=96.34ms  min=1.39ms  med=91.43ms  max=377.88ms p(90)=184.02ms p(95)=201.9ms  p(99.9)=269.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147579
     http_req_receiving.............: avg=723.75µs min=54.45µs med=112.41µs max=243.89ms p(90)=1.29ms   p(95)=2.36ms   p(99.9)=33ms    
     http_req_sending...............: avg=70.5µs   min=4.8µs   med=10.64µs  max=180.95ms p(90)=20.84µs  p(95)=127.18µs p(99.9)=9.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.55ms  min=1.31ms  med=90.64ms  max=377.78ms p(90)=183.2ms  p(95)=200.9ms  p(99.9)=265.83ms
     http_reqs......................: 147579  2390.293174/s
     iteration_duration.............: avg=97.27ms  min=3.51ms  med=92.43ms  max=378.06ms p(90)=184.55ms p(95)=202.39ms p(99.9)=271.37ms
     iterations.....................: 146579  2374.096471/s
     success_rate...................: 100.00% ✓ 146579      ✗ 0     
     vus............................: 90      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 414147      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=15.78µs  min=862ns   med=2.43µs  max=68.54ms  p(90)=4.46µs   p(95)=5.59µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=12.15µs  min=0s      med=0s      max=68.41ms  p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=102.33ms min=1.8ms   med=90.82ms max=1.35s    p(90)=194.89ms p(95)=225.08ms p(99.9)=702.64ms
       { expected_response:true }...: avg=102.33ms min=1.8ms   med=90.82ms max=1.35s    p(90)=194.89ms p(95)=225.08ms p(99.9)=702.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139049
     http_req_receiving.............: avg=1.33ms   min=52.69µs med=107.8µs max=449.11ms p(90)=1.7ms    p(95)=4.27ms   p(99.9)=72.5ms  
     http_req_sending...............: avg=59.9µs   min=4.54µs  med=9.84µs  max=101.71ms p(90)=20.72µs  p(95)=105.42µs p(99.9)=7.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.93ms min=1.71ms  med=89.61ms max=1.35s    p(90)=192.67ms p(95)=221.29ms p(99.9)=695.98ms
     http_reqs......................: 139049  2233.828476/s
     iteration_duration.............: avg=103.33ms min=3.22ms  med=91.99ms max=1.35s    p(90)=195.5ms  p(95)=225.77ms p(99.9)=707.11ms
     iterations.....................: 138049  2217.763431/s
     success_rate...................: 100.00% ✓ 138049      ✗ 0     
     vus............................: 67      min=0         max=496 
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

     checks.........................: 100.00% ✓ 409449      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=16.71µs  min=1.02µs  med=3.08µs  max=75.14ms  p(90)=4.93µs   p(95)=6.24µs   p(99.9)=922.06µs
     http_req_connecting............: avg=12.81µs  min=0s      med=0s      max=74.93ms  p(90)=0s       p(95)=0s       p(99.9)=800.75µs
     http_req_duration..............: avg=103.46ms min=1.66ms  med=98.31ms max=319.86ms p(90)=199.55ms p(95)=218.22ms p(99.9)=273.9ms 
       { expected_response:true }...: avg=103.46ms min=1.66ms  med=98.31ms max=319.86ms p(90)=199.55ms p(95)=218.22ms p(99.9)=273.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 137483
     http_req_receiving.............: avg=132.94µs min=27.62µs med=60.33µs max=121.58ms p(90)=134.92µs p(95)=366.55µs p(99.9)=10.6ms  
     http_req_sending...............: avg=64.95µs  min=5.46µs  med=11.93µs max=130.23ms p(90)=22.28µs  p(95)=131.72µs p(99.9)=8.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.26ms min=1.57ms  med=98.1ms  max=319.56ms p(90)=199.33ms p(95)=217.97ms p(99.9)=272.09ms
     http_reqs......................: 137483  2216.657041/s
     iteration_duration.............: avg=104.49ms min=4.29ms  med=99.58ms max=353.07ms p(90)=200.12ms p(95)=218.78ms p(99.9)=275.93ms
     iterations.....................: 136483  2200.533905/s
     success_rate...................: 100.00% ✓ 136483      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 205995      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=5.86µs   min=1.05µs  med=2.82µs   max=8.61ms   p(90)=4.58µs   p(95)=5.59µs   p(99.9)=465.27µs
     http_req_connecting............: avg=2.28µs   min=0s      med=0s       max=8.5ms    p(90)=0s       p(95)=0s       p(99.9)=408.45µs
     http_req_duration..............: avg=204.86ms min=1.95ms  med=204.78ms max=527.38ms p(90)=381.53ms p(95)=408.58ms p(99.9)=480.5ms 
       { expected_response:true }...: avg=204.86ms min=1.95ms  med=204.78ms max=527.38ms p(90)=381.53ms p(95)=408.58ms p(99.9)=480.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 69665
     http_req_receiving.............: avg=86.96µs  min=29.36µs med=69.2µs   max=209.8ms  p(90)=109.83µs p(95)=125.87µs p(99.9)=1.05ms  
     http_req_sending...............: avg=30.94µs  min=5.11µs  med=12.4µs   max=123.61ms p(90)=19.37µs  p(95)=23.18µs  p(99.9)=2.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.74ms min=1.85ms  med=204.63ms max=527.31ms p(90)=381.41ms p(95)=408.42ms p(99.9)=480.44ms
     http_reqs......................: 69665   1112.756208/s
     iteration_duration.............: avg=208.1ms  min=4.95ms  med=208.19ms max=527.55ms p(90)=382.39ms p(95)=409.29ms p(99.9)=481.14ms
     iterations.....................: 68665   1096.783249/s
     success_rate...................: 100.00% ✓ 68665       ✗ 0    
     vus............................: 84      min=0         max=496
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

     checks.........................: 100.00% ✓ 100209     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   639 kB/s
     http_req_blocked...............: avg=9.01µs   min=1.04µs  med=2.71µs   max=22.63ms  p(90)=4.42µs   p(95)=5.43µs   p(99.9)=1.43ms
     http_req_connecting............: avg=5.3µs    min=0s      med=0s       max=22.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.4ms 
     http_req_duration..............: avg=417.17ms min=3.73ms  med=387.01ms max=1.7s     p(90)=816.69ms p(95)=892.26ms p(99.9)=1.34s 
       { expected_response:true }...: avg=417.17ms min=3.73ms  med=387.01ms max=1.7s     p(90)=816.69ms p(95)=892.26ms p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34403
     http_req_receiving.............: avg=88.37µs  min=30.14µs med=72.62µs  max=104.87ms p(90)=112.17µs p(95)=126.62µs p(99.9)=1.3ms 
     http_req_sending...............: avg=34.15µs  min=4.95µs  med=13.64µs  max=121.84ms p(90)=21.28µs  p(95)=24.28µs  p(99.9)=3.33ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=417.04ms min=3.67ms  med=386.89ms max=1.7s     p(90)=816.56ms p(95)=892.2ms  p(99.9)=1.34s 
     http_reqs......................: 34403   531.979947/s
     iteration_duration.............: avg=429.87ms min=31.77ms med=401.72ms max=1.7s     p(90)=821.27ms p(95)=894.81ms p(99.9)=1.35s 
     iterations.....................: 33403   516.516762/s
     success_rate...................: 100.00% ✓ 33403      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 45306      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   285 kB/s
     http_req_blocked...............: avg=13.62µs  min=1.16µs  med=3.21µs   max=4.05ms  p(90)=4.95µs   p(95)=6.53µs  p(99.9)=2.22ms  
     http_req_connecting............: avg=8.61µs   min=0s      med=0s       max=3.99ms  p(90)=0s       p(95)=0s      p(99.9)=2.17ms  
     http_req_duration..............: avg=904.93ms min=5.99ms  med=810.56ms max=4.71s   p(90)=1.76s    p(95)=2.03s   p(99.9)=4.2s    
       { expected_response:true }...: avg=904.93ms min=5.99ms  med=810.56ms max=4.71s   p(90)=1.76s    p(95)=2.03s   p(99.9)=4.2s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 16102
     http_req_receiving.............: avg=93.83µs  min=32.29µs med=88.33µs  max=6.04ms  p(90)=124.24µs p(95)=138µs   p(99.9)=968.61µs
     http_req_sending...............: avg=29.99µs  min=5.86µs  med=16.58µs  max=42.51ms p(90)=22.17µs  p(95)=26.97µs p(99.9)=2.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=904.81ms min=5.9ms   med=810.38ms max=4.71s   p(90)=1.76s    p(95)=2.03s   p(99.9)=4.2s    
     http_reqs......................: 16102   237.604043/s
     iteration_duration.............: avg=964.81ms min=29.81ms med=886.36ms max=4.71s   p(90)=1.78s    p(95)=2.04s   p(99.9)=4.22s   
     iterations.....................: 15102   222.847861/s
     success_rate...................: 100.00% ✓ 15102      ✗ 0    
     vus............................: 99      min=0        max=500
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

     checks.........................: 100.00% ✓ 45570      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   283 kB/s
     http_req_blocked...............: avg=13.96µs  min=1.41µs  med=3.65µs   max=18.25ms  p(90)=5.49µs   p(95)=7.29µs   p(99.9)=1.63ms
     http_req_connecting............: avg=8.26µs   min=0s      med=0s       max=18.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.48ms
     http_req_duration..............: avg=897.36ms min=7.66ms  med=804.81ms max=3.33s    p(90)=1.82s    p(95)=1.98s    p(99.9)=2.78s 
       { expected_response:true }...: avg=897.36ms min=7.66ms  med=804.81ms max=3.33s    p(90)=1.82s    p(95)=1.98s    p(99.9)=2.78s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16190
     http_req_receiving.............: avg=104.24µs min=35.76µs med=94.02µs  max=29.87ms  p(90)=134.49µs p(95)=150.22µs p(99.9)=1.02ms
     http_req_sending...............: avg=44.46µs  min=6.11µs  med=18.37µs  max=156.54ms p(90)=24.06µs  p(95)=29.29µs  p(99.9)=2.78ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=897.21ms min=7.52ms  med=804.71ms max=3.33s    p(90)=1.82s    p(95)=1.98s    p(99.9)=2.78s 
     http_reqs......................: 16190   236.010041/s
     iteration_duration.............: avg=956.44ms min=35.97ms med=900.28ms max=3.33s    p(90)=1.84s    p(95)=1.98s    p(99.9)=2.8s  
     iterations.....................: 15190   221.432522/s
     success_rate...................: 100.00% ✓ 15190      ✗ 0    
     vus............................: 85      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

