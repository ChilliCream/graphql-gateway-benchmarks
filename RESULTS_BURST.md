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
| hive-router | v0.0.84 | 2,703 | 2,858 | 2,660 | 2.5% |  |
| fusion-nightly-net11 | 16.6.2-p.6 | 2,669 | 2,767 | 2,659 | 1.4% |  |
| fusion | 16.6.1 | 2,492 | 2,615 | 2,482 | 2.1% |  |
| fusion-nightly | 16.6.2-p.6 | 2,486 | 2,587 | 2,460 | 1.8% |  |
| fusion-nightly-fed | 16.6.2-p.6 | 2,284 | 2,375 | 2,264 | 1.6% |  |
| cosmo | 0.334.0 | 1,236 | 1,275 | 1,231 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 572 | 584 | 570 | 0.8% |  |
| hive-gateway | 2.10.8 | 261 | 266 | 257 | 1.0% |  |
| apollo-gateway | 2.14.3 | 229 | 237 | 228 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (4097 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (543342 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.6 | 2,492 | 2,586 | 2,477 | 1.5% |  |
| fusion-nightly | 16.6.2-p.6 | 2,328 | 2,428 | 2,309 | 1.7% |  |
| fusion | 16.6.1 | 2,303 | 2,395 | 2,296 | 1.5% |  |
| hive-router | v0.0.84 | 2,294 | 2,449 | 2,217 | 3.3% |  |
| fusion-nightly-fed | 16.6.2-p.6 | 2,223 | 2,306 | 2,215 | 1.4% |  |
| cosmo | 0.334.0 | 1,123 | 1,166 | 1,114 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 522 | 532 | 516 | 1.1% |  |
| hive-gateway | 2.10.8 | 242 | 244 | 240 | 0.6% |  |
| apollo-gateway | 2.14.3 | 236 | 240 | 235 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (31942 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (311977 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 497841      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 201 MB  3.2 MB/s
     http_req_blocked...............: avg=16.16µs  min=922ns   med=2.52µs  max=58.21ms  p(90)=4.09µs   p(95)=5.17µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=13.05µs  min=0s      med=0s      max=58.15ms  p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=85.14ms  min=1.47ms  med=79.67ms max=299.51ms p(90)=165.51ms p(95)=178.74ms p(99.9)=228.09ms
       { expected_response:true }...: avg=85.14ms  min=1.47ms  med=79.67ms max=299.51ms p(90)=165.51ms p(95)=178.74ms p(99.9)=228.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166947
     http_req_receiving.............: avg=128.66µs min=25.74µs med=52.38µs max=48.12ms  p(90)=141.35µs p(95)=338.53µs p(99.9)=12.97ms 
     http_req_sending...............: avg=65.1µs   min=4.36µs  med=9.45µs  max=126ms    p(90)=17.26µs  p(95)=118.18µs p(99.9)=8.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.95ms  min=1.43ms  med=79.49ms max=299.08ms p(90)=165.29ms p(95)=178.48ms p(99.9)=227.28ms
     http_reqs......................: 166947  2703.75251/s
     iteration_duration.............: avg=85.89ms  min=2.37ms  med=80.5ms  max=348.26ms p(90)=165.91ms p(95)=179.13ms p(99.9)=228.76ms
     iterations.....................: 165947  2687.557235/s
     success_rate...................: 100.00% ✓ 165947      ✗ 0     
     vus............................: 90      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 494586      ✗ 0     
     data_received..................: 15 GB   234 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=22.68µs  min=1µs    med=2.53µs   max=64.92ms  p(90)=4.13µs   p(95)=5.24µs   p(99.9)=4.32ms  
     http_req_connecting............: avg=19.32µs  min=0s     med=0s       max=64.86ms  p(90)=0s       p(95)=0s       p(99.9)=4.2ms   
     http_req_duration..............: avg=85.7ms   min=1.87ms med=80.37ms  max=305.77ms p(90)=164.57ms p(95)=183.22ms p(99.9)=243.91ms
       { expected_response:true }...: avg=85.7ms   min=1.87ms med=80.37ms  max=305.77ms p(90)=164.57ms p(95)=183.22ms p(99.9)=243.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165862
     http_req_receiving.............: avg=585.99µs min=53.1µs med=101.87µs max=191.13ms p(90)=1.08ms   p(95)=1.93ms   p(99.9)=25.73ms 
     http_req_sending...............: avg=75.09µs  min=4.42µs med=9.5µs    max=144.92ms p(90)=18.86µs  p(95)=121.53µs p(99.9)=10.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.04ms  min=1.79ms med=79.68ms  max=304.53ms p(90)=163.86ms p(95)=182.4ms  p(99.9)=242.96ms
     http_reqs......................: 165862  2669.614826/s
     iteration_duration.............: avg=86.48ms  min=3.35ms med=81.19ms  max=316.42ms p(90)=165.07ms p(95)=183.73ms p(99.9)=246.31ms
     iterations.....................: 164862  2653.519428/s
     success_rate...................: 100.00% ✓ 164862      ✗ 0     
     vus............................: 62      min=0         max=497 
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

     checks.........................: 100.00% ✓ 463614      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 187 MB  3.0 MB/s
     http_req_blocked...............: avg=17.83µs min=852ns   med=2.16µs  max=54.44ms  p(90)=3.62µs   p(95)=4.71µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=14.38µs min=0s      med=0s      max=54.37ms  p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=91.46ms min=1.95ms  med=80.73ms max=1.4s     p(90)=172.69ms p(95)=197.98ms p(99.9)=599.04ms
       { expected_response:true }...: avg=91.46ms min=1.95ms  med=80.73ms max=1.4s     p(90)=172.69ms p(95)=197.98ms p(99.9)=599.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155538
     http_req_receiving.............: avg=1.08ms  min=53.13µs med=97.81µs max=519.49ms p(90)=1.4ms    p(95)=3.69ms   p(99.9)=62.41ms 
     http_req_sending...............: avg=64.2µs  min=4.63µs  med=9.07µs  max=227.04ms p(90)=17.68µs  p(95)=106.35µs p(99.9)=8.37ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.31ms min=1.85ms  med=79.6ms  max=1.4s     p(90)=171.12ms p(95)=195.99ms p(99.9)=582.02ms
     http_reqs......................: 155538  2492.637786/s
     iteration_duration.............: avg=92.3ms  min=3.26ms  med=81.65ms max=1.41s    p(90)=173.21ms p(95)=198.58ms p(99.9)=600.22ms
     iterations.....................: 154538  2476.611877/s
     success_rate...................: 100.00% ✓ 154538      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462609      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=14.34µs min=882ns   med=2.02µs  max=55.04ms  p(90)=3.3µs    p(95)=4.24µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=11.7µs  min=0s      med=0s      max=54.87ms  p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=91.67ms min=1.98ms  med=80.05ms max=1.27s    p(90)=173.56ms p(95)=197.48ms p(99.9)=665.43ms
       { expected_response:true }...: avg=91.67ms min=1.98ms  med=80.05ms max=1.27s    p(90)=173.56ms p(95)=197.48ms p(99.9)=665.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155203
     http_req_receiving.............: avg=1.32ms  min=52.37µs med=98.19µs max=703.84ms p(90)=1.66ms   p(95)=4.2ms    p(99.9)=95.44ms 
     http_req_sending...............: avg=57.06µs min=4.45µs  med=8.64µs  max=39.65ms  p(90)=15.12µs  p(95)=95.69µs  p(99.9)=8.07ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.29ms min=1.87ms  med=78.91ms max=1.27s    p(90)=171.63ms p(95)=194.34ms p(99.9)=648.47ms
     http_reqs......................: 155203  2486.720214/s
     iteration_duration.............: avg=92.5ms  min=3.17ms  med=80.98ms max=1.27s    p(90)=174.13ms p(95)=198.06ms p(99.9)=667.34ms
     iterations.....................: 154203  2470.697842/s
     success_rate...................: 100.00% ✓ 154203      ✗ 0     
     vus............................: 76      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 422160      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=16.72µs  min=1.02µs  med=2.66µs   max=108.55ms p(90)=4.28µs   p(95)=5.39µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=13.41µs  min=0s      med=0s       max=108.4ms  p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=100.45ms min=1.65ms  med=87.1ms   max=1.4s     p(90)=188.35ms p(95)=222.72ms p(99.9)=871.02ms
       { expected_response:true }...: avg=100.45ms min=1.65ms  med=87.1ms   max=1.4s     p(90)=188.35ms p(95)=222.72ms p(99.9)=871.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141720
     http_req_receiving.............: avg=1.86ms   min=52.41µs med=108.49µs max=840.39ms p(90)=1.99ms   p(95)=5.46ms   p(99.9)=151.42ms
     http_req_sending...............: avg=62.22µs  min=4.55µs  med=10.01µs  max=140.68ms p(90)=18.94µs  p(95)=112.9µs  p(99.9)=8.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.52ms  min=1.57ms  med=85.84ms  max=1.36s    p(90)=185.96ms p(95)=217.39ms p(99.9)=844.92ms
     http_reqs......................: 141720  2284.333866/s
     iteration_duration.............: avg=101.42ms min=2.83ms  med=88.14ms  max=1.4s     p(90)=189.01ms p(95)=223.65ms p(99.9)=878.23ms
     iterations.....................: 140720  2268.215224/s
     success_rate...................: 100.00% ✓ 140720      ✗ 0     
     vus............................: 58      min=0         max=498 
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

     checks.........................: 100.00% ✓ 228879      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=5.15µs   min=952ns   med=2.16µs   max=16.43ms  p(90)=3.82µs   p(95)=4.75µs   p(99.9)=445.16µs
     http_req_connecting............: avg=2.31µs   min=0s      med=0s       max=14.6ms   p(90)=0s       p(95)=0s       p(99.9)=394.6µs 
     http_req_duration..............: avg=184.59ms min=1.96ms  med=186.88ms max=479.76ms p(90)=342.23ms p(95)=365.45ms p(99.9)=433.98ms
       { expected_response:true }...: avg=184.59ms min=1.96ms  med=186.88ms max=479.76ms p(90)=342.23ms p(95)=365.45ms p(99.9)=433.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77293
     http_req_receiving.............: avg=71.82µs  min=26.89µs med=56.59µs  max=94.18ms  p(90)=93.64µs  p(95)=108.03µs p(99.9)=965.86µs
     http_req_sending...............: avg=27.24µs  min=4.76µs  med=10.11µs  max=104.91ms p(90)=17.47µs  p(95)=21.27µs  p(99.9)=2.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.49ms min=1.89ms  med=186.77ms max=479.71ms p(90)=342.13ms p(95)=365.37ms p(99.9)=433.92ms
     http_reqs......................: 77293   1236.639197/s
     iteration_duration.............: avg=187.23ms min=4.67ms  med=189.79ms max=479.97ms p(90)=343.07ms p(95)=366.07ms p(99.9)=434.25ms
     iterations.....................: 76293   1220.639829/s
     success_rate...................: 100.00% ✓ 76293       ✗ 0    
     vus............................: 81      min=0         max=493
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

     checks.........................: 100.00% ✓ 107325     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   687 kB/s
     http_req_blocked...............: avg=7.84µs   min=1.04µs  med=2.52µs   max=6.59ms  p(90)=4.28µs   p(95)=5.25µs   p(99.9)=1.57ms
     http_req_connecting............: avg=4.35µs   min=0s      med=0s       max=6.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms 
     http_req_duration..............: avg=390.1ms  min=3.59ms  med=362.41ms max=1.55s   p(90)=767.76ms p(95)=831.01ms p(99.9)=1.26s 
       { expected_response:true }...: avg=390.1ms  min=3.59ms  med=362.41ms max=1.55s   p(90)=767.76ms p(95)=831.01ms p(99.9)=1.26s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36775
     http_req_receiving.............: avg=76.48µs  min=26.74µs med=64.81µs  max=25.35ms p(90)=104.23µs p(95)=118.45µs p(99.9)=1.03ms
     http_req_sending...............: avg=30.71µs  min=5.17µs  med=12.12µs  max=87.13ms p(90)=19.86µs  p(95)=22.9µs   p(99.9)=2.89ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=389.99ms min=3.48ms  med=362.33ms max=1.55s   p(90)=767.67ms p(95)=830.85ms p(99.9)=1.26s 
     http_reqs......................: 36775   572.088285/s
     iteration_duration.............: avg=401.22ms min=20.94ms med=374.7ms  max=1.57s   p(90)=771.12ms p(95)=833.49ms p(99.9)=1.27s 
     iterations.....................: 35775   556.531839/s
     success_rate...................: 100.00% ✓ 35775      ✗ 0    
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

     checks.........................: 100.00% ✓ 49485      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   314 kB/s
     http_req_blocked...............: avg=13µs     min=1.54µs  med=3.84µs   max=8.55ms  p(90)=5.74µs   p(95)=7.26µs   p(99.9)=1.6ms 
     http_req_connecting............: avg=7.33µs   min=0s      med=0s       max=8.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms 
     http_req_duration..............: avg=818.08ms min=5.32ms  med=709.26ms max=17.34s  p(90)=1.45s    p(95)=1.63s    p(99.9)=14.87s
       { expected_response:true }...: avg=818.08ms min=5.32ms  med=709.26ms max=17.34s  p(90)=1.45s    p(95)=1.63s    p(99.9)=14.87s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17495
     http_req_receiving.............: avg=101.15µs min=38.28µs med=93.91µs  max=9.64ms  p(90)=132.53µs p(95)=148.47µs p(99.9)=1.5ms 
     http_req_sending...............: avg=33.76µs  min=6.67µs  med=18.93µs  max=75.78ms p(90)=25.01µs  p(95)=29.06µs  p(99.9)=2.09ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=817.94ms min=5.25ms  med=709.16ms max=17.34s  p(90)=1.45s    p(95)=1.63s    p(99.9)=14.87s
     http_reqs......................: 17495   261.133178/s
     iteration_duration.............: avg=867.77ms min=32.31ms med=762.61ms max=17.34s  p(90)=1.48s    p(95)=1.64s    p(99.9)=15.09s
     iterations.....................: 16495   246.207017/s
     success_rate...................: 100.00% ✓ 16495      ✗ 0    
     vus............................: 54      min=0        max=500
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

     checks.........................: 100.00% ✓ 47562      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   282 kB/s
     http_req_blocked...............: avg=14.22µs  min=1.16µs  med=3.2µs    max=10.49ms p(90)=4.77µs   p(95)=5.97µs   p(99.9)=2.07ms  
     http_req_connecting............: avg=9.48µs   min=0s      med=0s       max=10.36ms p(90)=0s       p(95)=0s       p(99.9)=2.05ms  
     http_req_duration..............: avg=389.98ms min=7.63ms  med=453.67ms max=1.14s   p(90)=673.98ms p(95)=738.4ms  p(99.9)=1.02s   
       { expected_response:true }...: avg=389.98ms min=7.63ms  med=453.67ms max=1.14s   p(90)=673.98ms p(95)=738.4ms  p(99.9)=1.02s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16854
     http_req_receiving.............: avg=87.83µs  min=32.07µs med=80.67µs  max=4.88ms  p(90)=120.89µs p(95)=136.41µs p(99.9)=879.34µs
     http_req_sending...............: avg=35.96µs  min=5.51µs  med=16.19µs  max=60.07ms p(90)=21.68µs  p(95)=26.02µs  p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.85ms min=7.55ms  med=453.47ms max=1.14s   p(90)=673.77ms p(95)=738.29ms p(99.9)=1.02s   
     http_reqs......................: 16854   229.900852/s
     iteration_duration.............: avg=414.52ms min=8.53ms  med=469.56ms max=1.15s   p(90)=683.08ms p(95)=745.1ms  p(99.9)=1.03s   
     iterations.....................: 15854   216.260123/s
     success_rate...................: 100.00% ✓ 15854      ✗ 0    
     vus............................: 63      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459063      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=16.77µs  min=912ns   med=2.24µs   max=51.73ms  p(90)=3.98µs   p(95)=5.14µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=13.67µs  min=0s      med=0s       max=51.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=92.32ms  min=1.43ms  med=87.95ms  max=322.33ms p(90)=176.94ms p(95)=192.45ms p(99.9)=253.54ms
       { expected_response:true }...: avg=92.32ms  min=1.43ms  med=87.95ms  max=322.33ms p(90)=176.94ms p(95)=192.45ms p(99.9)=253.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154021
     http_req_receiving.............: avg=628.26µs min=53.92µs med=104.92µs max=65.13ms  p(90)=1.2ms    p(95)=2.15ms   p(99.9)=26.59ms 
     http_req_sending...............: avg=65.88µs  min=4.68µs  med=9.52µs   max=209.8ms  p(90)=20.8µs   p(95)=114.81µs p(99.9)=8.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.63ms  min=1.35ms  med=87.22ms  max=322.05ms p(90)=176.12ms p(95)=191.59ms p(99.9)=252.27ms
     http_reqs......................: 154021  2492.763728/s
     iteration_duration.............: avg=93.18ms  min=3.27ms  med=88.9ms   max=339.49ms p(90)=177.38ms p(95)=192.86ms p(99.9)=253.99ms
     iterations.....................: 153021  2476.579158/s
     success_rate...................: 100.00% ✓ 153021      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429603      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=15.01µs min=851ns  med=2.14µs   max=111.62ms p(90)=3.63µs   p(95)=4.69µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=11.61µs min=0s     med=0s       max=111.56ms p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=98.68ms min=1.47ms med=86.96ms  max=2.25s    p(90)=188.69ms p(95)=216.92ms p(99.9)=685.15ms
       { expected_response:true }...: avg=98.68ms min=1.47ms med=86.96ms  max=2.25s    p(90)=188.69ms p(95)=216.92ms p(99.9)=685.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144201
     http_req_receiving.............: avg=1.58ms  min=52.2µs med=108.37µs max=525.37ms p(90)=1.74ms   p(95)=4.3ms    p(99.9)=113.63ms
     http_req_sending...............: avg=58.41µs min=4.53µs med=9.21µs   max=156.63ms p(90)=18.24µs  p(95)=99.96µs  p(99.9)=8.07ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.03ms min=1.4ms  med=85.8ms   max=2.25s    p(90)=186.19ms p(95)=212.94ms p(99.9)=682.99ms
     http_reqs......................: 144201  2328.697303/s
     iteration_duration.............: avg=99.63ms min=2.85ms med=88.05ms  max=2.25s    p(90)=189.23ms p(95)=217.63ms p(99.9)=686.79ms
     iterations.....................: 143201  2312.548335/s
     success_rate...................: 100.00% ✓ 143201      ✗ 0     
     vus............................: 51      min=0         max=499 
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

     checks.........................: 100.00% ✓ 424767      ✗ 0     
     data_received..................: 13 GB   202 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=17.25µs  min=881ns   med=2.19µs  max=84.7ms   p(90)=3.7µs    p(95)=4.79µs   p(99.9)=1.04ms  
     http_req_connecting............: avg=14.17µs  min=0s      med=0s      max=84.63ms  p(90)=0s       p(95)=0s       p(99.9)=988.78µs
     http_req_duration..............: avg=99.79ms  min=1.57ms  med=83.05ms max=1.66s    p(90)=189.99ms p(95)=220.17ms p(99.9)=888.97ms
       { expected_response:true }...: avg=99.79ms  min=1.57ms  med=83.05ms max=1.66s    p(90)=189.99ms p(95)=220.17ms p(99.9)=888.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142589
     http_req_receiving.............: avg=1.96ms   min=52.77µs med=107.6µs max=1.52s    p(90)=1.78ms   p(95)=4.43ms   p(99.9)=274.08ms
     http_req_sending...............: avg=62.55µs  min=4.82µs  med=9.34µs  max=141.84ms p(90)=18.36µs  p(95)=103.38µs p(99.9)=8.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.76ms  min=1.45ms  med=81.85ms max=1.63s    p(90)=187.69ms p(95)=216.03ms p(99.9)=874.09ms
     http_reqs......................: 142589  2303.934194/s
     iteration_duration.............: avg=100.75ms min=2.62ms  med=84.06ms max=1.66s    p(90)=190.63ms p(95)=220.94ms p(99.9)=890.72ms
     iterations.....................: 141589  2287.776326/s
     success_rate...................: 100.00% ✓ 141589      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 424143      ✗ 0     
     data_received..................: 12 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=19.81µs  min=1.04µs  med=3.12µs  max=75.49ms  p(90)=5.08µs   p(95)=6.38µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=15.32µs  min=0s      med=0s      max=75.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=99.9ms   min=1.66ms  med=94.27ms max=326.3ms  p(90)=191.74ms p(95)=209.24ms p(99.9)=273.84ms
       { expected_response:true }...: avg=99.9ms   min=1.66ms  med=94.27ms max=326.3ms  p(90)=191.74ms p(95)=209.24ms p(99.9)=273.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142381
     http_req_receiving.............: avg=148.48µs min=26.84µs med=59.28µs max=45.02ms  p(90)=149.23µs p(95)=380.67µs p(99.9)=15.29ms 
     http_req_sending...............: avg=75.49µs  min=5.02µs  med=12.07µs max=114.86ms p(90)=22.84µs  p(95)=136.44µs p(99.9)=10.02ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.67ms  min=1.61ms  med=94.07ms max=326.03ms p(90)=191.46ms p(95)=208.9ms  p(99.9)=271.59ms
     http_reqs......................: 142381  2294.20488/s
     iteration_duration.............: avg=100.87ms min=4.5ms   med=95.35ms max=351.93ms p(90)=192.24ms p(95)=209.74ms p(99.9)=276ms   
     iterations.....................: 141381  2278.091741/s
     success_rate...................: 100.00% ✓ 141381      ✗ 0     
     vus............................: 59      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 411834      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=17.2µs   min=912ns   med=2.44µs   max=75.65ms  p(90)=4.39µs   p(95)=5.53µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=13.8µs   min=0s      med=0s       max=75.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=102.89ms min=1.8ms   med=84.28ms  max=1.27s    p(90)=197.17ms p(95)=228.04ms p(99.9)=831.57ms
       { expected_response:true }...: avg=102.89ms min=1.8ms   med=84.28ms  max=1.27s    p(90)=197.17ms p(95)=228.04ms p(99.9)=831.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138278
     http_req_receiving.............: avg=1.42ms   min=52.72µs med=106.26µs max=864.7ms  p(90)=1.55ms   p(95)=3.83ms   p(99.9)=117.2ms 
     http_req_sending...............: avg=63.87µs  min=4.5µs   med=10.13µs  max=119.06ms p(90)=21.53µs  p(95)=107.9µs  p(99.9)=8.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.4ms  min=1.68ms  med=83.16ms  max=1.27s    p(90)=195.21ms p(95)=224.43ms p(99.9)=818.74ms
     http_reqs......................: 138278  2223.191006/s
     iteration_duration.............: avg=103.91ms min=3.02ms  med=85.61ms  max=1.27s    p(90)=197.83ms p(95)=228.69ms p(99.9)=832.89ms
     iterations.....................: 137278  2207.113315/s
     success_rate...................: 100.00% ✓ 137278      ✗ 0     
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

     checks.........................: 100.00% ✓ 207912      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.17µs   min=1.11µs  med=3µs      max=7.46ms   p(90)=4.74µs   p(95)=5.69µs   p(99.9)=495.77µs
     http_req_connecting............: avg=2.5µs    min=0s      med=0s       max=7.41ms   p(90)=0s       p(95)=0s       p(99.9)=442.86µs
     http_req_duration..............: avg=203.04ms min=1.98ms  med=203.26ms max=531.43ms p(90)=376ms    p(95)=404.48ms p(99.9)=485.34ms
       { expected_response:true }...: avg=203.04ms min=1.98ms  med=203.26ms max=531.43ms p(90)=376ms    p(95)=404.48ms p(99.9)=485.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70304
     http_req_receiving.............: avg=88.2µs   min=30.07µs med=69.27µs  max=251.72ms p(90)=110.83µs p(95)=127.18µs p(99.9)=1.3ms   
     http_req_sending...............: avg=30.02µs  min=5.15µs  med=12.32µs  max=92.67ms  p(90)=19.4µs   p(95)=23.26µs  p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.92ms min=1.87ms  med=203.14ms max=531.37ms p(90)=375.9ms  p(95)=404.36ms p(99.9)=485.24ms
     http_reqs......................: 70304   1123.165353/s
     iteration_duration.............: avg=206.22ms min=4.67ms  med=206.72ms max=531.6ms  p(90)=376.92ms p(95)=405.35ms p(99.9)=485.89ms
     iterations.....................: 69304   1107.189515/s
     success_rate...................: 100.00% ✓ 69304       ✗ 0    
     vus............................: 85      min=0         max=496
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

     checks.........................: 100.00% ✓ 98322      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   628 kB/s
     http_req_blocked...............: avg=8.3µs    min=1.06µs  med=2.61µs   max=21.64ms p(90)=4.3µs    p(95)=5.27µs   p(99.9)=1.04ms  
     http_req_connecting............: avg=4.42µs   min=0s      med=0s       max=14.95ms p(90)=0s       p(95)=0s       p(99.9)=890.59µs
     http_req_duration..............: avg=424.87ms min=3.8ms   med=397.96ms max=1.83s   p(90)=833.09ms p(95)=898.59ms p(99.9)=1.35s   
       { expected_response:true }...: avg=424.87ms min=3.8ms   med=397.96ms max=1.83s   p(90)=833.09ms p(95)=898.59ms p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33774
     http_req_receiving.............: avg=82.78µs  min=29.77µs med=72.2µs   max=46.77ms p(90)=111.01µs p(95)=125.27µs p(99.9)=803.01µs
     http_req_sending...............: avg=28.32µs  min=5.1µs   med=13.2µs   max=83.77ms p(90)=20.7µs   p(95)=23.72µs  p(99.9)=2.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=424.75ms min=3.69ms  med=397.84ms max=1.83s   p(90)=833ms    p(95)=898.48ms p(99.9)=1.35s   
     http_reqs......................: 33774   522.848132/s
     iteration_duration.............: avg=438.04ms min=17.42ms med=411.54ms max=1.83s   p(90)=836.87ms p(95)=901.1ms  p(99.9)=1.36s   
     iterations.....................: 32774   507.367345/s
     success_rate...................: 100.00% ✓ 32774      ✗ 0    
     vus............................: 84      min=0        max=499
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

     checks.........................: 100.00% ✓ 46347      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   291 kB/s
     http_req_blocked...............: avg=14.77µs  min=1.31µs  med=3.81µs   max=6.26ms  p(90)=5.67µs   p(95)=7.29µs  p(99.9)=2.41ms
     http_req_connecting............: avg=9.02µs   min=0s      med=0s       max=6.19ms  p(90)=0s       p(95)=0s      p(99.9)=2.32ms
     http_req_duration..............: avg=884.95ms min=5.68ms  med=798.01ms max=5.1s    p(90)=1.74s    p(95)=1.96s   p(99.9)=4.09s 
       { expected_response:true }...: avg=884.95ms min=5.68ms  med=798.01ms max=5.1s    p(90)=1.74s    p(95)=1.96s   p(99.9)=4.09s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16449
     http_req_receiving.............: avg=108.53µs min=40.1µs  med=92.83µs  max=46.69ms p(90)=129.38µs p(95)=145.6µs p(99.9)=1.24ms
     http_req_sending...............: avg=32.11µs  min=6.57µs  med=18.4µs   max=27.66ms p(90)=24.38µs  p(95)=29.41µs p(99.9)=4.03ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=884.81ms min=5.59ms  med=797.93ms max=5.1s    p(90)=1.74s    p(95)=1.96s   p(99.9)=4.09s 
     http_reqs......................: 16449   242.779573/s
     iteration_duration.............: avg=942.25ms min=23.86ms med=879.79ms max=5.11s   p(90)=1.76s    p(95)=1.97s   p(99.9)=4.1s  
     iterations.....................: 15449   228.020039/s
     success_rate...................: 100.00% ✓ 15449      ✗ 0    
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

     checks.........................: 100.00% ✓ 45774      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=13.73µs  min=1.07µs  med=3.49µs   max=9.44ms  p(90)=5.31µs   p(95)=6.84µs  p(99.9)=2.14ms  
     http_req_connecting............: avg=8.49µs   min=0s      med=0s       max=9.36ms  p(90)=0s       p(95)=0s      p(99.9)=2.11ms  
     http_req_duration..............: avg=894ms    min=7.77ms  med=818.33ms max=3.11s   p(90)=1.82s    p(95)=1.94s   p(99.9)=2.71s   
       { expected_response:true }...: avg=894ms    min=7.77ms  med=818.33ms max=3.11s   p(90)=1.82s    p(95)=1.94s   p(99.9)=2.71s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16258
     http_req_receiving.............: avg=101.5µs  min=34.55µs med=91.53µs  max=33.41ms p(90)=134.46µs p(95)=149.9µs p(99.9)=729.19µs
     http_req_sending...............: avg=27.96µs  min=5.9µs   med=18.65µs  max=34.64ms p(90)=24.29µs  p(95)=28.99µs p(99.9)=1.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=893.87ms min=7.68ms  med=818.21ms max=3.11s   p(90)=1.82s    p(95)=1.94s   p(99.9)=2.71s   
     http_reqs......................: 16258   236.369632/s
     iteration_duration.............: avg=952.52ms min=36.44ms med=882.54ms max=3.12s   p(90)=1.84s    p(95)=1.96s   p(99.9)=2.72s   
     iterations.....................: 15258   221.830966/s
     success_rate...................: 100.00% ✓ 15258      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

