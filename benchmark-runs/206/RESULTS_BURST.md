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
| hive-router | v0.0.49 | 2,826 | 2,941 | 2,798 | 1.8% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,034 | 2,070 | 2,009 | 1.0% |  |
| cosmo | 0.307.0 | 1,193 | 1,210 | 1,191 | 0.9% | non-compatible response (15 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 493 | 498 | 489 | 0.6% |  |
| hive-gateway | 2.5.25 | 223 | 225 | 220 | 0.7% |  |
| apollo-gateway | 2.13.3 | 206 | 211 | 205 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (25993 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (457518 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,218 | 2,296 | 2,188 | 1.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,963 | 1,975 | 1,913 | 1.2% |  |
| cosmo | 0.307.0 | 1,149 | 1,149 | 1,146 | 0.2% | non-compatible response (17 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 476 | 486 | 471 | 1.1% |  |
| hive-gateway | 2.5.25 | 211 | 213 | 208 | 0.9% |  |
| apollo-gateway | 2.13.3 | 207 | 210 | 206 | 0.6% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (17147 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (322794 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 522153      ✗ 0     
     data_received..................: 15 GB   248 MB/s
     data_sent......................: 210 MB  3.4 MB/s
     http_req_blocked...............: avg=42.7µs   min=1.05µs  med=2.75µs  max=92.02ms  p(90)=4.44µs   p(95)=5.64µs   p(99.9)=13.15ms 
     http_req_connecting............: avg=38.72µs  min=0s      med=0s      max=91.96ms  p(90)=0s       p(95)=0s       p(99.9)=12.78ms 
     http_req_duration..............: avg=81.04ms  min=1.65ms  med=73.14ms max=396.16ms p(90)=159.38ms p(95)=181.87ms p(99.9)=252.19ms
       { expected_response:true }...: avg=81.04ms  min=1.65ms  med=73.14ms max=396.16ms p(90)=159.38ms p(95)=181.87ms p(99.9)=252.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175051
     http_req_receiving.............: avg=613.11µs min=28.93µs med=57.87µs max=81.32ms  p(90)=294.09µs p(95)=468.19µs p(99.9)=57.88ms 
     http_req_sending...............: avg=109.02µs min=5.44µs  med=10.57µs max=209.02ms p(90)=20.55µs  p(95)=146.26µs p(99.9)=18.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.32ms  min=1.59ms  med=72.61ms max=395.73ms p(90)=158.12ms p(95)=179.44ms p(99.9)=247.73ms
     http_reqs......................: 175051  2826.583173/s
     iteration_duration.............: avg=81.9ms   min=2.39ms  med=74.01ms max=412.19ms p(90)=160.21ms p(95)=182.83ms p(99.9)=257.69ms
     iterations.....................: 174051  2810.435975/s
     success_rate...................: 100.00% ✓ 174051      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 379347      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=17.34µs  min=992ns   med=2.47µs   max=84.46ms  p(90)=3.8µs    p(95)=4.67µs   p(99.9)=2.15ms  
     http_req_connecting............: avg=14.09µs  min=0s      med=0s       max=84.25ms  p(90)=0s       p(95)=0s       p(99.9)=2.03ms  
     http_req_duration..............: avg=111.7ms  min=2.35ms  med=100.74ms max=764.16ms p(90)=218.53ms p(95)=257.05ms p(99.9)=526.1ms 
       { expected_response:true }...: avg=111.7ms  min=2.35ms  med=100.74ms max=764.16ms p(90)=218.53ms p(95)=257.05ms p(99.9)=526.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 127449
     http_req_receiving.............: avg=2.47ms   min=51.92µs med=117.88µs max=574.77ms p(90)=1.62ms   p(95)=6.53ms   p(99.9)=171.08ms
     http_req_sending...............: avg=64.48µs  min=5.34µs  med=10.05µs  max=209.67ms p(90)=17.63µs  p(95)=123.81µs p(99.9)=8.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.16ms min=2.22ms  med=99.5ms   max=756.9ms  p(90)=214.19ms p(95)=248.43ms p(99.9)=450.94ms
     http_reqs......................: 127449  2034.417205/s
     iteration_duration.............: avg=112.85ms min=3.85ms  med=101.98ms max=764.39ms p(90)=219.26ms p(95)=257.89ms p(99.9)=526.49ms
     iterations.....................: 126449  2018.454607/s
     success_rate...................: 100.00% ✓ 126449      ✗ 0     
     vus............................: 88      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 220749      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=7.67µs   min=971ns  med=2.59µs   max=41.23ms  p(90)=4.21µs   p(95)=5.15µs   p(99.9)=711.81µs
     http_req_connecting............: avg=4.35µs   min=0s     med=0s       max=41.07ms  p(90)=0s       p(95)=0s       p(99.9)=527.08µs
     http_req_duration..............: avg=191.24ms min=2.04ms med=192.26ms max=600.91ms p(90)=354.55ms p(95)=380.53ms p(99.9)=499.35ms
       { expected_response:true }...: avg=191.24ms min=2.04ms med=192.26ms max=600.91ms p(90)=354.55ms p(95)=380.53ms p(99.9)=499.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74583
     http_req_receiving.............: avg=119.7µs  min=31µs   med=63.13µs  max=211.82ms p(90)=99.89µs  p(95)=118.27µs p(99.9)=3.08ms  
     http_req_sending...............: avg=32.69µs  min=5.4µs  med=11.02µs  max=144.72ms p(90)=17.44µs  p(95)=21.63µs  p(99.9)=3.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.09ms min=1.98ms med=191.96ms max=600.84ms p(90)=354.47ms p(95)=380.45ms p(99.9)=499.27ms
     http_reqs......................: 74583   1193.656654/s
     iteration_duration.............: avg=194.15ms min=5.21ms med=195.59ms max=601.08ms p(90)=355.64ms p(95)=381.24ms p(99.9)=499.93ms
     iterations.....................: 73583   1177.652248/s
     success_rate...................: 100.00% ✓ 73583       ✗ 0    
     vus............................: 80      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93129      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   592 kB/s
     http_req_blocked...............: avg=11.03µs  min=1.16µs  med=3.03µs   max=29.74ms  p(90)=4.84µs   p(95)=5.91µs   p(99.9)=1.79ms
     http_req_connecting............: avg=6.88µs   min=0s      med=0s       max=29.68ms  p(90)=0s       p(95)=0s       p(99.9)=1.63ms
     http_req_duration..............: avg=448.08ms min=4.08ms  med=422.2ms  max=1.68s    p(90)=884.72ms p(95)=954.41ms p(99.9)=1.44s 
       { expected_response:true }...: avg=448.08ms min=4.08ms  med=422.2ms  max=1.68s    p(90)=884.72ms p(95)=954.41ms p(99.9)=1.44s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32043
     http_req_receiving.............: avg=92.73µs  min=33.27µs med=77.54µs  max=124.17ms p(90)=113.65µs p(95)=126.89µs p(99.9)=1.05ms
     http_req_sending...............: avg=27.58µs  min=6.15µs  med=13.75µs  max=45.05ms  p(90)=21.23µs  p(95)=24.45µs  p(99.9)=2.64ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=447.96ms min=3.99ms  med=422.09ms max=1.68s    p(90)=884.62ms p(95)=954.32ms p(99.9)=1.44s 
     http_reqs......................: 32043   493.454918/s
     iteration_duration.............: avg=462.74ms min=27.63ms med=438.68ms max=1.68s    p(90)=888.53ms p(95)=957.59ms p(99.9)=1.44s 
     iterations.....................: 31043   478.055146/s
     success_rate...................: 100.00% ✓ 31043      ✗ 0    
     vus............................: 44      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42654      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   269 kB/s
     http_req_blocked...............: avg=14.67µs  min=1.3µs   med=3.71µs   max=16.92ms p(90)=5.59µs   p(95)=7.43µs   p(99.9)=1.77ms
     http_req_connecting............: avg=8.95µs   min=0s      med=0s       max=16.87ms p(90)=0s       p(95)=0s       p(99.9)=1.46ms
     http_req_duration..............: avg=946.83ms min=6.14ms  med=824.84ms max=15.61s  p(90)=1.63s    p(95)=1.88s    p(99.9)=13.92s
       { expected_response:true }...: avg=946.83ms min=6.14ms  med=824.84ms max=15.61s  p(90)=1.63s    p(95)=1.88s    p(99.9)=13.92s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15218
     http_req_receiving.............: avg=106.53µs min=37.22µs med=98.42µs  max=8.19ms  p(90)=138.78µs p(95)=152.49µs p(99.9)=1.15ms
     http_req_sending...............: avg=33.1µs   min=6.71µs  med=18.09µs  max=16.27ms p(90)=24.37µs  p(95)=30.81µs  p(99.9)=4.25ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=946.69ms min=6.04ms  med=824.73ms max=15.61s  p(90)=1.63s    p(95)=1.88s    p(99.9)=13.92s
     http_reqs......................: 15218   223.517706/s
     iteration_duration.............: avg=1.01s    min=59.58ms med=907.13ms max=15.61s  p(90)=1.66s    p(95)=1.9s     p(99.9)=13.94s
     iterations.....................: 14218   208.829988/s
     success_rate...................: 100.00% ✓ 14218      ✗ 0    
     vus............................: 61      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 43038      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   253 kB/s
     http_req_blocked...............: avg=12.17µs  min=1.32µs  med=3.59µs   max=4.33ms   p(90)=5.24µs   p(95)=6.71µs   p(99.9)=1.23ms
     http_req_connecting............: avg=6.98µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms 
     http_req_duration..............: avg=428.21ms min=8.42ms  med=519.56ms max=1.21s    p(90)=710.84ms p(95)=758.04ms p(99.9)=1.05s 
       { expected_response:true }...: avg=428.21ms min=8.42ms  med=519.56ms max=1.21s    p(90)=710.84ms p(95)=758.04ms p(99.9)=1.05s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15346
     http_req_receiving.............: avg=179.62µs min=37.87µs med=93.18µs  max=120.27ms p(90)=133.3µs  p(95)=146.84µs p(99.9)=23.3ms
     http_req_sending...............: avg=44.75µs  min=6.56µs  med=17.27µs  max=249.95ms p(90)=23.21µs  p(95)=27.66µs  p(99.9)=3.09ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=427.98ms min=8.32ms  med=519.43ms max=1.21s    p(90)=710.73ms p(95)=757.88ms p(99.9)=1.05s 
     http_reqs......................: 15346   206.335035/s
     iteration_duration.............: avg=458.01ms min=9.21ms  med=541.6ms  max=1.22s    p(90)=717.78ms p(95)=762.58ms p(99.9)=1.06s 
     iterations.....................: 14346   192.889509/s
     success_rate...................: 100.00% ✓ 14346      ✗ 0    
     vus............................: 66      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 409380      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=27.67µs  min=1.05µs  med=2.95µs  max=78.9ms   p(90)=4.77µs   p(95)=6.11µs   p(99.9)=3.69ms  
     http_req_connecting............: avg=23.65µs  min=0s      med=0s      max=78.81ms  p(90)=0s       p(95)=0s       p(99.9)=3.47ms  
     http_req_duration..............: avg=103.45ms min=1.62ms  med=98.02ms max=386.38ms p(90)=199.1ms  p(95)=218.94ms p(99.9)=286.33ms
       { expected_response:true }...: avg=103.45ms min=1.62ms  med=98.02ms max=386.38ms p(90)=199.1ms  p(95)=218.94ms p(99.9)=286.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137460
     http_req_receiving.............: avg=333.69µs min=29.84µs med=65.08µs max=348.25ms p(90)=211.59µs p(95)=458.85µs p(99.9)=37.3ms  
     http_req_sending...............: avg=85.54µs  min=5.52µs  med=11.67µs max=49.83ms  p(90)=22.53µs  p(95)=150.49µs p(99.9)=12.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.03ms min=1.56ms  med=97.68ms max=329.02ms p(90)=198.42ms p(95)=217.87ms p(99.9)=283.89ms
     http_reqs......................: 137460  2218.56342/s
     iteration_duration.............: avg=104.51ms min=3.46ms  med=99.3ms  max=414.39ms p(90)=199.67ms p(95)=219.52ms p(99.9)=289.56ms
     iterations.....................: 136460  2202.423718/s
     success_rate...................: 100.00% ✓ 136460      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 363312      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 147 MB  2.4 MB/s
     http_req_blocked...............: avg=19.98µs  min=1.06µs  med=2.78µs   max=94.17ms  p(90)=4.5µs    p(95)=5.66µs   p(99.9)=2.73ms  
     http_req_connecting............: avg=16.5µs   min=0s      med=0s       max=94.12ms  p(90)=0s       p(95)=0s       p(99.9)=2.65ms  
     http_req_duration..............: avg=116.57ms min=1.74ms  med=108.09ms max=1.2s     p(90)=223.92ms p(95)=255.33ms p(99.9)=490.63ms
       { expected_response:true }...: avg=116.57ms min=1.74ms  med=108.09ms max=1.2s     p(90)=223.92ms p(95)=255.33ms p(99.9)=490.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 122104
     http_req_receiving.............: avg=1.7ms    min=53.69µs med=116.72µs max=361.42ms p(90)=1.51ms   p(95)=4.3ms    p(99.9)=155.6ms 
     http_req_sending...............: avg=72.87µs  min=5.53µs  med=11.11µs  max=122.61ms p(90)=21.59µs  p(95)=136.07µs p(99.9)=10.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.78ms min=1.66ms  med=106.71ms max=1.19s    p(90)=221.38ms p(95)=251.74ms p(99.9)=430.82ms
     http_reqs......................: 122104  1963.42583/s
     iteration_duration.............: avg=117.82ms min=2.78ms  med=109.67ms max=1.2s     p(90)=224.65ms p(95)=255.99ms p(99.9)=491.98ms
     iterations.....................: 121104  1947.345883/s
     success_rate...................: 100.00% ✓ 121104      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 212931      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=8.28µs   min=1.03µs  med=2.86µs   max=64.08ms  p(90)=4.66µs   p(95)=5.74µs   p(99.9)=643.84µs
     http_req_connecting............: avg=4.64µs   min=0s      med=0s       max=64.01ms  p(90)=0s       p(95)=0s       p(99.9)=553.91µs
     http_req_duration..............: avg=198.23ms min=2.08ms  med=201.45ms max=637.83ms p(90)=363.68ms p(95)=390.83ms p(99.9)=510.83ms
       { expected_response:true }...: avg=198.23ms min=2.08ms  med=201.45ms max=637.83ms p(90)=363.68ms p(95)=390.83ms p(99.9)=510.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71977
     http_req_receiving.............: avg=119.48µs min=29.98µs med=67.98µs  max=167.16ms p(90)=108µs    p(95)=125.99µs p(99.9)=3.1ms   
     http_req_sending...............: avg=39.39µs  min=5.46µs  med=12.39µs  max=163.64ms p(90)=19.74µs  p(95)=23.9µs   p(99.9)=5.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.07ms min=2.01ms  med=201.15ms max=637.77ms p(90)=363.54ms p(95)=390.73ms p(99.9)=510.7ms 
     http_reqs......................: 71977   1149.600296/s
     iteration_duration.............: avg=201.3ms  min=4.75ms  med=204.72ms max=638ms    p(90)=364.53ms p(95)=391.64ms p(99.9)=511.16ms
     iterations.....................: 70977   1133.628523/s
     success_rate...................: 100.00% ✓ 70977       ✗ 0    
     vus............................: 86      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90258      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   572 kB/s
     http_req_blocked...............: avg=11.43µs  min=1.23µs  med=3.36µs   max=27.4ms   p(90)=5.15µs   p(95)=6.16µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=6.96µs   min=0s      med=0s       max=27.34ms  p(90)=0s       p(95)=0s       p(99.9)=1.95ms  
     http_req_duration..............: avg=462ms    min=4.12ms  med=430.4ms  max=2.08s    p(90)=916.54ms p(95)=991.33ms p(99.9)=1.48s   
       { expected_response:true }...: avg=462ms    min=4.12ms  med=430.4ms  max=2.08s    p(90)=916.54ms p(95)=991.33ms p(99.9)=1.48s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31086
     http_req_receiving.............: avg=95.48µs  min=34.13µs med=82.67µs  max=103.12ms p(90)=120.1µs  p(95)=134.66µs p(99.9)=928.12µs
     http_req_sending...............: avg=28.07µs  min=5.61µs  med=15.07µs  max=32.88ms  p(90)=22.15µs  p(95)=25.67µs  p(99.9)=3.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=461.88ms min=4.05ms  med=430.28ms max=2.08s    p(90)=916.4ms  p(95)=991.24ms p(99.9)=1.48s   
     http_reqs......................: 31086   476.6701/s
     iteration_duration.............: avg=477.59ms min=23.22ms med=448.18ms max=2.08s    p(90)=920.7ms  p(95)=994.99ms p(99.9)=1.5s    
     iterations.....................: 30086   461.336185/s
     success_rate...................: 100.00% ✓ 30086      ✗ 0    
     vus............................: 67      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 40392      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 17 MB   254 kB/s
     http_req_blocked...............: avg=17.87µs  min=1.21µs  med=3.83µs   max=29.61ms p(90)=5.66µs   p(95)=7.67µs   p(99.9)=2.61ms
     http_req_connecting............: avg=12.05µs  min=0s      med=0s       max=29.55ms p(90)=0s       p(95)=0s       p(99.9)=2.59ms
     http_req_duration..............: avg=1s       min=6.5ms   med=913.21ms max=6.09s   p(90)=1.99s    p(95)=2.23s    p(99.9)=5.54s 
       { expected_response:true }...: avg=1s       min=6.5ms   med=913.21ms max=6.09s   p(90)=1.99s    p(95)=2.23s    p(99.9)=5.54s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14464
     http_req_receiving.............: avg=113.16µs min=35.69µs med=98.66µs  max=50.86ms p(90)=137.39µs p(95)=149.65µs p(99.9)=1.63ms
     http_req_sending...............: avg=38.51µs  min=5.96µs  med=18.2µs   max=40.08ms p(90)=24.35µs  p(95)=30.48µs  p(99.9)=3.88ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=6.4ms   med=913.08ms max=6.09s   p(90)=1.99s    p(95)=2.23s    p(99.9)=5.54s 
     http_reqs......................: 14464   211.191563/s
     iteration_duration.............: avg=1.08s    min=25.12ms med=1s       max=6.1s    p(90)=2.02s    p(95)=2.25s    p(99.9)=5.58s 
     iterations.....................: 13464   196.590376/s
     success_rate...................: 100.00% ✓ 13464      ✗ 0    
     vus............................: 84      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 40524      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   250 kB/s
     http_req_blocked...............: avg=13.16µs  min=1.29µs  med=3.56µs  max=3.48ms   p(90)=5.23µs   p(95)=6.79µs   p(99.9)=1.54ms
     http_req_connecting............: avg=7.68µs   min=0s      med=0s      max=2.62ms   p(90)=0s       p(95)=0s       p(99.9)=1.44ms
     http_req_duration..............: avg=1s       min=8.68ms  med=919.9ms max=4.1s     p(90)=2.05s    p(95)=2.15s    p(99.9)=3.64s 
       { expected_response:true }...: avg=1s       min=8.68ms  med=919.9ms max=4.1s     p(90)=2.05s    p(95)=2.15s    p(99.9)=3.64s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14508
     http_req_receiving.............: avg=117.76µs min=37.68µs med=92.77µs max=101.04ms p(90)=133.39µs p(95)=144.98µs p(99.9)=1.06ms
     http_req_sending...............: avg=34.12µs  min=6.21µs  med=16.86µs max=87.63ms  p(90)=22.53µs  p(95)=27.61µs  p(99.9)=3.12ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=8.57ms  med=919.8ms max=4.1s     p(90)=2.05s    p(95)=2.15s    p(99.9)=3.64s 
     http_reqs......................: 14508   207.864957/s
     iteration_duration.............: avg=1.07s    min=73.47ms med=1.01s   max=4.11s    p(90)=2.07s    p(95)=2.17s    p(99.9)=3.68s 
     iterations.....................: 13508   193.537347/s
     success_rate...................: 100.00% ✓ 13508      ✗ 0    
     vus............................: 100     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

