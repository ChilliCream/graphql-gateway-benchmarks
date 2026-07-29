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
| hive-router | v0.0.84 | 2,735 | 2,859 | 2,713 | 2.1% |  |
| fusion-nightly | 16.6.0-p.6 | 2,526 | 2,628 | 2,515 | 1.5% |  |
| fusion-nightly-net11 | 16.6.0-p.6 | 2,495 | 2,572 | 2,455 | 1.5% |  |
| fusion | 16.5.1 | 2,474 | 2,550 | 2,462 | 1.1% |  |
| cosmo | 0.334.0 | 1,214 | 1,242 | 1,192 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 575 | 585 | 572 | 0.7% |  |
| hive-gateway | 2.10.8 | 248 | 255 | 246 | 1.0% |  |
| apollo-gateway | 2.14.3 | 237 | 243 | 235 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (10391 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (511706 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.6 | 2,450 | 2,544 | 2,439 | 1.4% |  |
| fusion-nightly | 16.6.0-p.6 | 2,396 | 2,478 | 2,392 | 1.3% |  |
| fusion | 16.5.1 | 2,367 | 2,437 | 2,353 | 1.2% |  |
| hive-router | v0.0.84 | 2,231 | 2,395 | 2,215 | 3.0% |  |
| fusion-nightly-fed | 16.6.0-p.6 | 2,196 | 2,247 | 2,149 | 1.2% |  |
| cosmo | 0.334.0 | 1,124 | 1,164 | 1,117 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 528 | 539 | 526 | 0.8% |  |
| hive-gateway | 2.10.8 | 240 | 251 | 239 | 1.6% |  |
| apollo-gateway | 2.14.3 | 226 | 234 | 225 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (29417 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (528978 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 503790      ✗ 0     
     data_received..................: 15 GB   240 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=21.22µs  min=942ns   med=2.59µs  max=59.68ms  p(90)=4.22µs   p(95)=5.4µs    p(99.9)=2.09ms  
     http_req_connecting............: avg=17.71µs  min=0s      med=0s      max=57.76ms  p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=84.13ms  min=1.48ms  med=77.9ms  max=290.56ms p(90)=162.87ms p(95)=178.07ms p(99.9)=229.08ms
       { expected_response:true }...: avg=84.13ms  min=1.48ms  med=77.9ms  max=290.56ms p(90)=162.87ms p(95)=178.07ms p(99.9)=229.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168930
     http_req_receiving.............: avg=145.61µs min=28.53µs med=54.26µs max=165.69ms p(90)=147µs    p(95)=354.31µs p(99.9)=17.2ms  
     http_req_sending...............: avg=73.7µs   min=4.38µs  med=9.69µs  max=89.59ms  p(90)=18.77µs  p(95)=125.53µs p(99.9)=9.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.91ms  min=1.4ms   med=77.72ms max=289.29ms p(90)=162.63ms p(95)=177.76ms p(99.9)=228.06ms
     http_reqs......................: 168930  2735.393589/s
     iteration_duration.............: avg=84.89ms  min=2.29ms  med=78.7ms  max=311.29ms p(90)=163.35ms p(95)=178.61ms p(99.9)=230.59ms
     iterations.....................: 167930  2719.201121/s
     success_rate...................: 100.00% ✓ 167930      ✗ 0     
     vus............................: 91      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 470067      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 189 MB  3.0 MB/s
     http_req_blocked...............: avg=19.81µs min=861ns   med=1.99µs  max=156.73ms p(90)=3.39µs   p(95)=4.44µs   p(99.9)=2.14ms  
     http_req_connecting............: avg=16.17µs min=0s      med=0s      max=61.35ms  p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=90.22ms min=1.96ms  med=78.76ms max=1.59s    p(90)=170.91ms p(95)=197.04ms p(99.9)=712.88ms
       { expected_response:true }...: avg=90.22ms min=1.96ms  med=78.76ms max=1.59s    p(90)=170.91ms p(95)=197.04ms p(99.9)=712.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157689
     http_req_receiving.............: avg=1.55ms  min=51.96µs med=96.6µs  max=660.78ms p(90)=1.64ms   p(95)=4.51ms   p(99.9)=148.39ms
     http_req_sending...............: avg=64.36µs min=4.51µs  med=8.77µs  max=104.83ms p(90)=16.75µs  p(95)=102.47µs p(99.9)=9.07ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.6ms  min=1.86ms  med=77.66ms max=1.57s    p(90)=169.02ms p(95)=193.49ms p(99.9)=655.71ms
     http_reqs......................: 157689  2526.80431/s
     iteration_duration.............: avg=91.04ms min=3.57ms  med=79.67ms max=1.59s    p(90)=171.43ms p(95)=197.76ms p(99.9)=713.24ms
     iterations.....................: 156689  2510.780337/s
     success_rate...................: 100.00% ✓ 156689      ✗ 0     
     vus............................: 76      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 463257      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=16.89µs  min=982ns  med=2.63µs   max=39.61ms  p(90)=4.17µs   p(95)=5.24µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=13.51µs  min=0s     med=0s       max=39.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=91.48ms  min=1.88ms med=87.65ms  max=338.74ms p(90)=173.98ms p(95)=188.5ms  p(99.9)=240.54ms
       { expected_response:true }...: avg=91.48ms  min=1.88ms med=87.65ms  max=338.74ms p(90)=173.98ms p(95)=188.5ms  p(99.9)=240.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155419
     http_req_receiving.............: avg=751.44µs min=52.3µs med=123.05µs max=111.25ms p(90)=1.52ms   p(95)=2.47ms   p(99.9)=26.02ms 
     http_req_sending...............: avg=65.52µs  min=4.52µs med=9.78µs   max=228.96ms p(90)=19.05µs  p(95)=117.3µs  p(99.9)=8.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.67ms  min=1.81ms med=86.79ms  max=338.61ms p(90)=173.1ms  p(95)=187.63ms p(99.9)=239.45ms
     http_reqs......................: 155419  2495.072015/s
     iteration_duration.............: avg=92.32ms  min=3.96ms med=88.6ms   max=352.82ms p(90)=174.41ms p(95)=188.89ms p(99.9)=241.91ms
     iterations.....................: 154419  2479.018174/s
     success_rate...................: 100.00% ✓ 154419      ✗ 0     
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

     checks.........................: 100.00% ✓ 460395      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=18.12µs min=962ns   med=2.55µs  max=62.29ms  p(90)=4.09µs   p(95)=5.15µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=14.61µs min=0s      med=0s      max=62.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=92.08ms min=1.96ms  med=79.53ms max=1.22s    p(90)=176.13ms p(95)=201.4ms  p(99.9)=683.32ms
       { expected_response:true }...: avg=92.08ms min=1.96ms  med=79.53ms max=1.22s    p(90)=176.13ms p(95)=201.4ms  p(99.9)=683.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154465
     http_req_receiving.............: avg=1.43ms  min=49.67µs med=98µs    max=953.44ms p(90)=1.66ms   p(95)=4.55ms   p(99.9)=85.48ms 
     http_req_sending...............: avg=66.85µs min=4.46µs  med=9.51µs  max=143.66ms p(90)=17.86µs  p(95)=113.79µs p(99.9)=9.1ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.58ms min=1.88ms  med=78.29ms max=1.22s    p(90)=173.92ms p(95)=197.73ms p(99.9)=676.18ms
     http_reqs......................: 154465  2474.970153/s
     iteration_duration.............: avg=92.95ms min=3.47ms  med=80.54ms max=1.22s    p(90)=176.67ms p(95)=202.06ms p(99.9)=685.17ms
     iterations.....................: 153465  2458.947299/s
     success_rate...................: 100.00% ✓ 153465      ✗ 0     
     vus............................: 76      min=0         max=493 
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

     checks.........................: 100.00% ✓ 224757      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=8.54µs   min=932ns   med=2.09µs   max=90.28ms  p(90)=3.67µs   p(95)=4.57µs   p(99.9)=451.23µs
     http_req_connecting............: avg=5.48µs   min=0s      med=0s       max=80.38ms  p(90)=0s       p(95)=0s       p(99.9)=397.45µs
     http_req_duration..............: avg=187.94ms min=1.89ms  med=187.74ms max=583.03ms p(90)=349.47ms p(95)=374.15ms p(99.9)=509.59ms
       { expected_response:true }...: avg=187.94ms min=1.89ms  med=187.74ms max=583.03ms p(90)=349.47ms p(95)=374.15ms p(99.9)=509.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75919
     http_req_receiving.............: avg=73.1µs   min=26.37µs med=59.61µs  max=150.76ms p(90)=96.42µs  p(95)=111.16µs p(99.9)=902.01µs
     http_req_sending...............: avg=35.62µs  min=4.67µs  med=9.69µs   max=201.54ms p(90)=16.52µs  p(95)=20.43µs  p(99.9)=3.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.83ms min=1.83ms  med=187.59ms max=582.96ms p(90)=349.37ms p(95)=374.04ms p(99.9)=509.48ms
     http_reqs......................: 75919   1214.828341/s
     iteration_duration.............: avg=190.68ms min=4.34ms  med=190.67ms max=583.16ms p(90)=350.2ms  p(95)=374.88ms p(99.9)=511.34ms
     iterations.....................: 74919   1198.826703/s
     success_rate...................: 100.00% ✓ 74919       ✗ 0    
     vus............................: 80      min=0         max=494
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

     checks.........................: 100.00% ✓ 107712     ✗ 0    
     data_received..................: 3.2 GB  51 MB/s
     data_sent......................: 44 MB   691 kB/s
     http_req_blocked...............: avg=6.58µs   min=1.23µs  med=3.1µs    max=5.66ms   p(90)=4.88µs   p(95)=5.93µs   p(99.9)=508.34µs
     http_req_connecting............: avg=2.54µs   min=0s      med=0s       max=5.59ms   p(90)=0s       p(95)=0s       p(99.9)=486.16µs
     http_req_duration..............: avg=388.5ms  min=3.46ms  med=363.35ms max=1.7s     p(90)=767.86ms p(95)=835.5ms  p(99.9)=1.22s   
       { expected_response:true }...: avg=388.5ms  min=3.46ms  med=363.35ms max=1.7s     p(90)=767.86ms p(95)=835.5ms  p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36904
     http_req_receiving.............: avg=83.65µs  min=28.81µs med=69.58µs  max=127.9ms  p(90)=109.02µs p(95)=123.72µs p(99.9)=903.44µs
     http_req_sending...............: avg=32.77µs  min=4.91µs  med=13.5µs   max=144.27ms p(90)=20.73µs  p(95)=23.72µs  p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=388.39ms min=3.4ms   med=363.27ms max=1.7s     p(90)=767.78ms p(95)=835.3ms  p(99.9)=1.22s   
     http_reqs......................: 36904   575.150817/s
     iteration_duration.............: avg=399.57ms min=14.86ms med=376.49ms max=1.71s    p(90)=771.61ms p(95)=838.06ms p(99.9)=1.23s   
     iterations.....................: 35904   559.565763/s
     success_rate...................: 100.00% ✓ 35904      ✗ 0    
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

     checks.........................: 100.00% ✓ 47250      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=13.11µs  min=1.08µs  med=3.11µs   max=4ms     p(90)=4.78µs   p(95)=6.06µs   p(99.9)=2.13ms
     http_req_connecting............: avg=8.47µs   min=0s      med=0s       max=3.96ms  p(90)=0s       p(95)=0s       p(99.9)=2.1ms 
     http_req_duration..............: avg=853.64ms min=5.94ms  med=753.45ms max=19.82s  p(90)=1.46s    p(95)=1.61s    p(99.9)=17.86s
       { expected_response:true }...: avg=853.64ms min=5.94ms  med=753.45ms max=19.82s  p(90)=1.46s    p(95)=1.61s    p(99.9)=17.86s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16750
     http_req_receiving.............: avg=93.02µs  min=32.52µs med=86.16µs  max=12.08ms p(90)=122.82µs p(95)=137.38µs p(99.9)=1.11ms
     http_req_sending...............: avg=24.58µs  min=5.68µs  med=16.72µs  max=17.41ms p(90)=22.15µs  p(95)=26.21µs  p(99.9)=1.62ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=853.53ms min=5.81ms  med=753.35ms max=19.82s  p(90)=1.46s    p(95)=1.61s    p(99.9)=17.86s
     http_reqs......................: 16750   248.053128/s
     iteration_duration.............: avg=907.85ms min=37.04ms med=801.17ms max=19.83s  p(90)=1.48s    p(95)=1.62s    p(99.9)=17.97s
     iterations.....................: 15750   233.243986/s
     success_rate...................: 100.00% ✓ 15750      ✗ 0    
     vus............................: 83      min=0        max=499
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

     checks.........................: 100.00% ✓ 48948      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   290 kB/s
     http_req_blocked...............: avg=12.27µs  min=1.31µs  med=3.57µs   max=10.28ms p(90)=5.35µs   p(95)=6.89µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=7.03µs   min=0s      med=0s       max=10.21ms p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=412.04ms min=7.45ms  med=482.51ms max=1.13s   p(90)=686.2ms  p(95)=747.83ms p(99.9)=1.01s   
       { expected_response:true }...: avg=412.04ms min=7.45ms  med=482.51ms max=1.13s   p(90)=686.2ms  p(95)=747.83ms p(99.9)=1.01s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 17316
     http_req_receiving.............: avg=97.14µs  min=35.82µs med=85.83µs  max=39.26ms p(90)=123.83µs p(95)=139.38µs p(99.9)=986.24µs
     http_req_sending...............: avg=40.56µs  min=6.42µs  med=17.87µs  max=85.29ms p(90)=23.66µs  p(95)=28.47µs  p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=411.91ms min=7.29ms  med=482.4ms  max=1.13s   p(90)=686.05ms p(95)=747.73ms p(99.9)=1.01s   
     http_reqs......................: 17316   237.131892/s
     iteration_duration.............: avg=437.32ms min=8ms     med=502.34ms max=1.13s   p(90)=691.67ms p(95)=752.39ms p(99.9)=1.02s   
     iterations.....................: 16316   223.437512/s
     success_rate...................: 100.00% ✓ 16316      ✗ 0    
     vus............................: 51      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 451644      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=15.16µs  min=851ns   med=2.31µs  max=44.74ms  p(90)=4.2µs    p(95)=5.37µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=12.03µs  min=0s      med=0s      max=44.7ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=93.84ms  min=1.45ms  med=89.5ms  max=310.44ms p(90)=179.16ms p(95)=194.71ms p(99.9)=245.55ms
       { expected_response:true }...: avg=93.84ms  min=1.45ms  med=89.5ms  max=310.44ms p(90)=179.16ms p(95)=194.71ms p(99.9)=245.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151548
     http_req_receiving.............: avg=784.56µs min=52.42µs med=118.9µs max=176.42ms p(90)=1.66ms   p(95)=2.65ms   p(99.9)=27.03ms 
     http_req_sending...............: avg=63.19µs  min=4.42µs  med=9.5µs   max=107.36ms p(90)=21.54µs  p(95)=111.25µs p(99.9)=8.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.99ms  min=1.38ms  med=88.63ms max=299.54ms p(90)=178.3ms  p(95)=193.64ms p(99.9)=244.56ms
     http_reqs......................: 151548  2450.622664/s
     iteration_duration.............: avg=94.71ms  min=3.2ms   med=90.5ms  max=335.26ms p(90)=179.6ms  p(95)=195.12ms p(99.9)=246.75ms
     iterations.....................: 150548  2434.45206/s
     success_rate...................: 100.00% ✓ 150548      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441936      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=16.13µs min=871ns   med=2.28µs   max=89.22ms  p(90)=4.03µs   p(95)=5.22µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=13.08µs min=0s      med=0s       max=89.06ms  p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=95.92ms min=1.56ms  med=83.36ms  max=1.38s    p(90)=182.17ms p(95)=209.58ms p(99.9)=688.44ms
       { expected_response:true }...: avg=95.92ms min=1.56ms  med=83.36ms  max=1.38s    p(90)=182.17ms p(95)=209.58ms p(99.9)=688.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148312
     http_req_receiving.............: avg=1.47ms  min=52.21µs med=102.34µs max=641.44ms p(90)=1.62ms   p(95)=4.15ms   p(99.9)=136.06ms
     http_req_sending...............: avg=63.37µs min=4.72µs  med=9.39µs   max=143.45ms p(90)=19.49µs  p(95)=107.34µs p(99.9)=8.77ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.38ms min=1.47ms  med=82.27ms  max=1.38s    p(90)=180.29ms p(95)=207.14ms p(99.9)=639.41ms
     http_reqs......................: 148312  2396.11272/s
     iteration_duration.............: avg=96.83ms min=3.1ms   med=84.41ms  max=1.38s    p(90)=182.79ms p(95)=210.25ms p(99.9)=689.24ms
     iterations.....................: 147312  2379.956828/s
     success_rate...................: 100.00% ✓ 147312      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 436431      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=28.22µs min=862ns   med=2.59µs   max=157.29ms p(90)=4.36µs   p(95)=5.5µs    p(99.9)=2.71ms  
     http_req_connecting............: avg=24.67µs min=0s      med=0s       max=157.24ms p(90)=0s       p(95)=0s       p(99.9)=2.59ms  
     http_req_duration..............: avg=97.11ms min=1.5ms   med=82.85ms  max=2.1s     p(90)=185.36ms p(95)=214.33ms p(99.9)=780.67ms
       { expected_response:true }...: avg=97.11ms min=1.5ms   med=82.85ms  max=2.1s     p(90)=185.36ms p(95)=214.33ms p(99.9)=780.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146477
     http_req_receiving.............: avg=1.38ms  min=51.19µs med=104.66µs max=2.03s    p(90)=1.63ms   p(95)=4.16ms   p(99.9)=93.65ms 
     http_req_sending...............: avg=72.75µs min=4.61µs  med=10.13µs  max=97.33ms  p(90)=19.51µs  p(95)=112.52µs p(99.9)=9.09ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.65ms min=1.42ms  med=81.73ms  max=1.77s    p(90)=183.86ms p(95)=211.71ms p(99.9)=757.91ms
     http_reqs......................: 146477  2367.622294/s
     iteration_duration.............: avg=98.06ms min=2.96ms  med=83.99ms  max=2.1s     p(90)=185.98ms p(95)=215.18ms p(99.9)=791.64ms
     iterations.....................: 145477  2351.458512/s
     success_rate...................: 100.00% ✓ 145477      ✗ 0     
     vus............................: 37      min=0         max=500 
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

     checks.........................: 100.00% ✓ 411066      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=10.68µs  min=942ns   med=2.32µs  max=51.21ms  p(90)=3.96µs   p(95)=5.14µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=7.54µs   min=0s      med=0s      max=51.05ms  p(90)=0s       p(95)=0s       p(99.9)=968.29µs
     http_req_duration..............: avg=103.09ms min=1.51ms  med=98.28ms max=296.52ms p(90)=196.79ms p(95)=213.81ms p(99.9)=265.72ms
       { expected_response:true }...: avg=103.09ms min=1.51ms  med=98.28ms max=296.52ms p(90)=196.79ms p(95)=213.81ms p(99.9)=265.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138022
     http_req_receiving.............: avg=106.17µs min=24.82µs med=54.35µs max=107.97ms p(90)=106.77µs p(95)=298.2µs  p(99.9)=6.62ms  
     http_req_sending...............: avg=54.03µs  min=4.94µs  med=10.16µs max=72.91ms  p(90)=18.48µs  p(95)=105.07µs p(99.9)=7.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.93ms min=1.42ms  med=98.12ms max=296.08ms p(90)=196.58ms p(95)=213.59ms p(99.9)=265.16ms
     http_reqs......................: 138022  2231.31967/s
     iteration_duration.............: avg=104.08ms min=4.26ms  med=99.39ms max=329.23ms p(90)=197.24ms p(95)=214.23ms p(99.9)=266.46ms
     iterations.....................: 137022  2215.153264/s
     success_rate...................: 100.00% ✓ 137022      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 407835      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.6 MB/s
     http_req_blocked...............: avg=17.01µs  min=872ns   med=2.52µs   max=48.02ms  p(90)=4.61µs   p(95)=5.77µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=13.62µs  min=0s      med=0s       max=47.87ms  p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=103.87ms min=1.89ms  med=93.44ms  max=2.05s    p(90)=192.73ms p(95)=221.87ms p(99.9)=932.56ms
       { expected_response:true }...: avg=103.87ms min=1.89ms  med=93.44ms  max=2.05s    p(90)=192.73ms p(95)=221.87ms p(99.9)=932.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136945
     http_req_receiving.............: avg=1.49ms   min=51.47µs med=109.08µs max=917.99ms p(90)=1.74ms   p(95)=4.34ms   p(99.9)=87.93ms 
     http_req_sending...............: avg=66.14µs  min=4.31µs  med=10.18µs  max=111.46ms p(90)=21.99µs  p(95)=111.04µs p(99.9)=8.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.3ms  min=1.8ms   med=92.18ms  max=2s       p(90)=190.64ms p(95)=218.52ms p(99.9)=902.92ms
     http_reqs......................: 136945  2196.363768/s
     iteration_duration.............: avg=104.94ms min=3.64ms  med=94.58ms  max=2.05s    p(90)=193.42ms p(95)=222.73ms p(99.9)=932.94ms
     iterations.....................: 135945  2180.325477/s
     success_rate...................: 100.00% ✓ 135945      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 208059      ✗ 0    
     data_received..................: 6.2 GB  98 MB/s
     data_sent......................: 85 MB   1.3 MB/s
     http_req_blocked...............: avg=4.88µs   min=952ns   med=2.25µs   max=4.16ms   p(90)=3.98µs   p(95)=4.95µs   p(99.9)=379.74µs
     http_req_connecting............: avg=1.95µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=336.49µs
     http_req_duration..............: avg=202.89ms min=1.97ms  med=204.22ms max=543.54ms p(90)=375.1ms  p(95)=403.58ms p(99.9)=483.32ms
       { expected_response:true }...: avg=202.89ms min=1.97ms  med=204.22ms max=543.54ms p(90)=375.1ms  p(95)=403.58ms p(99.9)=483.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70353
     http_req_receiving.............: avg=82.72µs  min=27.65µs med=64.8µs   max=186.83ms p(90)=107.24µs p(95)=124.03µs p(99.9)=919.69µs
     http_req_sending...............: avg=27.65µs  min=4.87µs  med=10.96µs  max=157.6ms  p(90)=18.61µs  p(95)=22.4µs   p(99.9)=2.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.78ms min=1.89ms  med=204.12ms max=543.47ms p(90)=374.98ms p(95)=403.48ms p(99.9)=483.25ms
     http_reqs......................: 70353   1124.136164/s
     iteration_duration.............: avg=206.05ms min=4.95ms  med=207.72ms max=543.69ms p(90)=376.03ms p(95)=404.17ms p(99.9)=483.8ms 
     iterations.....................: 69353   1108.157654/s
     success_rate...................: 100.00% ✓ 69353       ✗ 0    
     vus............................: 84      min=0         max=497
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

     checks.........................: 100.00% ✓ 99522      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   635 kB/s
     http_req_blocked...............: avg=7.75µs   min=1.04µs  med=2.72µs   max=4.21ms  p(90)=4.45µs   p(95)=5.41µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=3.99µs   min=0s      med=0s       max=4.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.05ms  
     http_req_duration..............: avg=420.17ms min=3.86ms  med=388.61ms max=2.05s   p(90)=837.15ms p(95)=899.08ms p(99.9)=1.39s   
       { expected_response:true }...: avg=420.17ms min=3.86ms  med=388.61ms max=2.05s   p(90)=837.15ms p(95)=899.08ms p(99.9)=1.39s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34174
     http_req_receiving.............: avg=84.32µs  min=31.18µs med=72.65µs  max=84.8ms  p(90)=111.69µs p(95)=125.36µs p(99.9)=766.49µs
     http_req_sending...............: avg=23.13µs  min=5.11µs  med=12.99µs  max=34.02ms p(90)=20.3µs   p(95)=23.37µs  p(99.9)=1.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=420.06ms min=3.77ms  med=388.5ms  max=2.05s   p(90)=837.06ms p(95)=899.03ms p(99.9)=1.39s   
     http_reqs......................: 34174   528.746251/s
     iteration_duration.............: avg=433.03ms min=11.23ms med=403.53ms max=2.06s   p(90)=841.08ms p(95)=901.88ms p(99.9)=1.4s    
     iterations.....................: 33174   513.274072/s
     success_rate...................: 100.00% ✓ 33174      ✗ 0    
     vus............................: 86      min=0        max=500
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

     checks.........................: 100.00% ✓ 45714      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   289 kB/s
     http_req_blocked...............: avg=13.54µs  min=1.19µs  med=3.15µs   max=3.9ms   p(90)=4.88µs   p(95)=6.47µs   p(99.9)=2ms   
     http_req_connecting............: avg=8.7µs    min=0s      med=0s       max=3.84ms  p(90)=0s       p(95)=0s       p(99.9)=1.98ms
     http_req_duration..............: avg=896.65ms min=5.77ms  med=818.94ms max=4.93s   p(90)=1.76s    p(95)=1.98s    p(99.9)=4.11s 
       { expected_response:true }...: avg=896.65ms min=5.77ms  med=818.94ms max=4.93s   p(90)=1.76s    p(95)=1.98s    p(99.9)=4.11s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16238
     http_req_receiving.............: avg=96.6µs   min=32.86µs med=89.03µs  max=8.23ms  p(90)=126.22µs p(95)=140.79µs p(99.9)=1.35ms
     http_req_sending...............: avg=25.21µs  min=5.87µs  med=17.46µs  max=13.98ms p(90)=22.89µs  p(95)=28.04µs  p(99.9)=1.75ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=896.53ms min=5.69ms  med=818.84ms max=4.93s   p(90)=1.76s    p(95)=1.98s    p(99.9)=4.11s 
     http_reqs......................: 16238   240.787255/s
     iteration_duration.............: avg=955.48ms min=36.07ms med=894.56ms max=4.94s   p(90)=1.78s    p(95)=2.01s    p(99.9)=4.17s 
     iterations.....................: 15238   225.958627/s
     success_rate...................: 100.00% ✓ 15238      ✗ 0    
     vus............................: 82      min=0        max=500
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

     checks.........................: 100.00% ✓ 43866      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   272 kB/s
     http_req_blocked...............: avg=14.82µs  min=1.25µs  med=3.62µs   max=3.24ms   p(90)=5.4µs    p(95)=7.09µs   p(99.9)=2.35ms  
     http_req_connecting............: avg=9.33µs   min=0s      med=0s       max=3.2ms    p(90)=0s       p(95)=0s       p(99.9)=2.32ms  
     http_req_duration..............: avg=929.99ms min=7.96ms  med=866.82ms max=3.26s    p(90)=1.89s    p(95)=2s       p(99.9)=2.94s   
       { expected_response:true }...: avg=929.99ms min=7.96ms  med=866.82ms max=3.26s    p(90)=1.89s    p(95)=2s       p(99.9)=2.94s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15622
     http_req_receiving.............: avg=130.74µs min=34.27µs med=92.59µs  max=215.31ms p(90)=134.56µs p(95)=150.94µs p(99.9)=951.05µs
     http_req_sending...............: avg=34.31µs  min=6.32µs  med=17.57µs  max=72.15ms  p(90)=23.26µs  p(95)=28.17µs  p(99.9)=2.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=929.82ms min=7.87ms  med=866.66ms max=3.26s    p(90)=1.89s    p(95)=2s       p(99.9)=2.94s   
     http_reqs......................: 15622   226.325441/s
     iteration_duration.............: avg=993.59ms min=33.73ms med=937.51ms max=3.26s    p(90)=1.9s     p(95)=2.01s    p(99.9)=2.96s   
     iterations.....................: 14622   211.837831/s
     success_rate...................: 100.00% ✓ 14622      ✗ 0    
     vus............................: 59      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

