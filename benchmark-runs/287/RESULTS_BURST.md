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
| hive-router | v0.0.83 | 2,665 | 2,864 | 2,649 | 2.7% |  |
| fusion-nightly-net11 | 16.5.1-p.1 | 2,494 | 2,599 | 2,480 | 1.6% |  |
| fusion | 16.5.0 | 2,468 | 2,559 | 2,458 | 1.5% |  |
| fusion-nightly | 16.5.1-p.1 | 2,356 | 2,461 | 2,343 | 1.8% |  |
| cosmo | 0.331.1 | 1,245 | 1,285 | 1,239 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.4 | 562 | 575 | 559 | 1.0% |  |
| hive-gateway | 2.10.4 | 255 | 263 | 253 | 1.2% |  |
| apollo-gateway | 2.14.2 | 232 | 237 | 231 | 0.7% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (12544 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (477198 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.5.1-p.1 | 2,361 | 2,448 | 2,351 | 1.4% |  |
| fusion | 16.5.0 | 2,334 | 2,421 | 2,327 | 1.5% |  |
| fusion-nightly | 16.5.1-p.1 | 2,334 | 2,424 | 2,318 | 1.5% |  |
| hive-router | v0.0.83 | 2,315 | 2,450 | 2,277 | 2.4% |  |
| fusion-nightly-fed | 16.5.1-p.1 | 2,165 | 2,260 | 2,159 | 1.6% |  |
| cosmo | 0.331.1 | 1,136 | 1,176 | 1,128 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.4 | 536 | 550 | 533 | 1.1% |  |
| hive-gateway | 2.10.4 | 241 | 248 | 239 | 1.2% |  |
| apollo-gateway | 2.14.2 | 231 | 236 | 230 | 0.8% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (39708 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (309064 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 489759      ✗ 0     
     data_received..................: 14 GB   234 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=18.86µs  min=912ns   med=2.45µs  max=57.47ms  p(90)=4.1µs    p(95)=5.24µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=15.58µs  min=0s      med=0s      max=57.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.87ms  
     http_req_duration..............: avg=86.55ms  min=1.35ms  med=80.56ms max=333.28ms p(90)=167.79ms p(95)=181.54ms p(99.9)=232.9ms 
       { expected_response:true }...: avg=86.55ms  min=1.35ms  med=80.56ms max=333.28ms p(90)=167.79ms p(95)=181.54ms p(99.9)=232.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 164253
     http_req_receiving.............: avg=156.54µs min=27.16µs med=53.21µs max=253.89ms p(90)=130.68µs p(95)=338.25µs p(99.9)=16.64ms 
     http_req_sending...............: avg=65.26µs  min=4.74µs  med=9.52µs  max=127.31ms p(90)=18.13µs  p(95)=120.24µs p(99.9)=8.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.33ms  min=1.3ms   med=80.35ms max=273.4ms  p(90)=167.54ms p(95)=181.21ms p(99.9)=230.59ms
     http_reqs......................: 164253  2665.159619/s
     iteration_duration.............: avg=87.32ms  min=2.14ms  med=81.38ms max=343.44ms p(90)=168.24ms p(95)=181.92ms p(99.9)=233.59ms
     iterations.....................: 163253  2648.933677/s
     success_rate...................: 100.00% ✓ 163253      ✗ 0     
     vus............................: 84      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462537      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=16.99µs  min=882ns   med=2.14µs   max=43.54ms  p(90)=3.69µs   p(95)=4.79µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=14.11µs  min=0s      med=0s       max=43.46ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=91.63ms  min=1.93ms  med=87.6ms   max=338.37ms p(90)=174.12ms p(95)=190.06ms p(99.9)=254.33ms
       { expected_response:true }...: avg=91.63ms  min=1.93ms  med=87.6ms   max=338.37ms p(90)=174.12ms p(95)=190.06ms p(99.9)=254.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155179
     http_req_receiving.............: avg=736.59µs min=51.02µs med=113.25µs max=204.53ms p(90)=1.51ms   p(95)=2.45ms   p(99.9)=28.12ms 
     http_req_sending...............: avg=65.8µs   min=4.54µs  med=8.95µs   max=248.25ms p(90)=18.72µs  p(95)=107.28µs p(99.9)=8.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.83ms  min=1.84ms  med=86.76ms  max=319.05ms p(90)=173.29ms p(95)=189.16ms p(99.9)=251.39ms
     http_reqs......................: 155179  2494.782527/s
     iteration_duration.............: avg=92.48ms  min=4.22ms  med=88.49ms  max=346.8ms  p(90)=174.6ms  p(95)=190.46ms p(99.9)=255.78ms
     iterations.....................: 154179  2478.705722/s
     success_rate...................: 100.00% ✓ 154179      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459606      ✗ 0     
     data_received..................: 14 GB   216 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=14.43µs min=842ns   med=2.04µs  max=72.67ms  p(90)=3.4µs    p(95)=4.42µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=11.76µs min=0s      med=0s      max=72.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=92.21ms min=2.03ms  med=82.01ms max=1.16s    p(90)=175.7ms  p(95)=200.35ms p(99.9)=606.33ms
       { expected_response:true }...: avg=92.21ms min=2.03ms  med=82.01ms max=1.16s    p(90)=175.7ms  p(95)=200.35ms p(99.9)=606.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154202
     http_req_receiving.............: avg=1.16ms  min=49.39µs med=94.11µs max=469ms    p(90)=1.44ms   p(95)=3.9ms    p(99.9)=71.67ms 
     http_req_sending...............: avg=58.21µs min=4.36µs  med=8.82µs  max=198.54ms p(90)=16.3µs   p(95)=94.94µs  p(99.9)=8.33ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.99ms min=1.93ms  med=80.96ms max=1.16s    p(90)=173.78ms p(95)=197.64ms p(99.9)=595.1ms 
     http_reqs......................: 154202  2468.118173/s
     iteration_duration.............: avg=93.08ms min=3.28ms  med=82.94ms max=1.16s    p(90)=176.18ms p(95)=200.92ms p(99.9)=606.64ms
     iterations.....................: 153202  2452.112426/s
     success_rate...................: 100.00% ✓ 153202      ✗ 0     
     vus............................: 78      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 438672      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 177 MB  2.8 MB/s
     http_req_blocked...............: avg=13.29µs min=862ns   med=2.02µs   max=66.64ms  p(90)=3.34µs   p(95)=4.33µs   p(99.9)=847.18µs
     http_req_connecting............: avg=10.59µs min=0s      med=0s       max=66.59ms  p(90)=0s       p(95)=0s       p(99.9)=783.92µs
     http_req_duration..............: avg=96.67ms min=1.99ms  med=84.11ms  max=1.39s    p(90)=180.42ms p(95)=210.16ms p(99.9)=776.14ms
       { expected_response:true }...: avg=96.67ms min=1.99ms  med=84.11ms  max=1.39s    p(90)=180.42ms p(95)=210.16ms p(99.9)=776.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147224
     http_req_receiving.............: avg=1.48ms  min=50.66µs med=101.55µs max=627.54ms p(90)=1.79ms   p(95)=4.61ms   p(99.9)=102.94ms
     http_req_sending...............: avg=56.39µs min=4.61µs  med=8.77µs   max=67.83ms  p(90)=15.68µs  p(95)=93.26µs  p(99.9)=7.72ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.13ms min=1.92ms  med=82.91ms  max=1.39s    p(90)=178.33ms p(95)=206.88ms p(99.9)=746.44ms
     http_reqs......................: 147224  2356.639061/s
     iteration_duration.............: avg=97.56ms min=3.5ms   med=85.14ms  max=1.39s    p(90)=181ms    p(95)=210.75ms p(99.9)=776.96ms
     iterations.....................: 146224  2340.631895/s
     success_rate...................: 100.00% ✓ 146224      ✗ 0     
     vus............................: 78      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 230556      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 94 MB   1.5 MB/s
     http_req_blocked...............: avg=4.55µs   min=952ns  med=2.22µs   max=10.46ms  p(90)=3.82µs   p(95)=4.74µs   p(99.9)=329.32µs
     http_req_connecting............: avg=1.6µs    min=0s     med=0s       max=6.91ms   p(90)=0s       p(95)=0s       p(99.9)=240.13µs
     http_req_duration..............: avg=183.25ms min=1.95ms med=184.99ms max=464.23ms p(90)=340ms    p(95)=361.83ms p(99.9)=426.89ms
       { expected_response:true }...: avg=183.25ms min=1.95ms med=184.99ms max=464.23ms p(90)=340ms    p(95)=361.83ms p(99.9)=426.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77852
     http_req_receiving.............: avg=70.93µs  min=26.5µs med=56.76µs  max=133.29ms p(90)=94.2µs   p(95)=108.1µs  p(99.9)=983.25µs
     http_req_sending...............: avg=27.69µs  min=4.8µs  med=10.17µs  max=171.04ms p(90)=17.32µs  p(95)=21.12µs  p(99.9)=3.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.15ms min=1.86ms med=184.86ms max=464.18ms p(90)=339.91ms p(95)=361.73ms p(99.9)=426.81ms
     http_reqs......................: 77852   1245.685848/s
     iteration_duration.............: avg=185.86ms min=4.7ms  med=187.67ms max=464.41ms p(90)=340.69ms p(95)=362.39ms p(99.9)=427.19ms
     iterations.....................: 76852   1229.685156/s
     success_rate...................: 100.00% ✓ 76852       ✗ 0    
     vus............................: 80      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 105402     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   675 kB/s
     http_req_blocked...............: avg=7.63µs   min=952ns   med=2.29µs   max=7.51ms   p(90)=4.01µs   p(95)=4.98µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=4.06µs   min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=396.87ms min=3.5ms   med=366.97ms max=1.61s    p(90)=780.98ms p(95)=847.56ms p(99.9)=1.25s   
       { expected_response:true }...: avg=396.87ms min=3.5ms   med=366.97ms max=1.61s    p(90)=780.98ms p(95)=847.56ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36134
     http_req_receiving.............: avg=77.91µs  min=28.79µs med=63.26µs  max=93.8ms   p(90)=102.64µs p(95)=117.02µs p(99.9)=957.56µs
     http_req_sending...............: avg=33.96µs  min=4.91µs  med=11.33µs  max=189.48ms p(90)=18.72µs  p(95)=21.5µs   p(99.9)=2.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=396.76ms min=3.45ms  med=366.86ms max=1.61s    p(90)=780.9ms  p(95)=847.45ms p(99.9)=1.25s   
     http_reqs......................: 36134   562.355015/s
     iteration_duration.............: avg=408.37ms min=20.11ms med=380.73ms max=1.61s    p(90)=784.52ms p(95)=850.35ms p(99.9)=1.26s   
     iterations.....................: 35134   546.791972/s
     success_rate...................: 100.00% ✓ 35134      ✗ 0    
     vus............................: 67      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48963      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=14.36µs  min=1.45µs  med=3.81µs   max=7.35ms  p(90)=5.71µs   p(95)=7.29µs   p(99.9)=2.2ms 
     http_req_connecting............: avg=8.79µs   min=0s      med=0s       max=7.21ms  p(90)=0s       p(95)=0s       p(99.9)=1.88ms
     http_req_duration..............: avg=832.42ms min=5.45ms  med=738.05ms max=14.4s   p(90)=1.58s    p(95)=1.71s    p(99.9)=12.41s
       { expected_response:true }...: avg=832.42ms min=5.45ms  med=738.05ms max=14.4s   p(90)=1.58s    p(95)=1.71s    p(99.9)=12.41s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17321
     http_req_receiving.............: avg=105.84µs min=39.33µs med=94.18µs  max=81.14ms p(90)=132.25µs p(95)=149.03µs p(99.9)=1.51ms
     http_req_sending...............: avg=42.63µs  min=6.6µs   med=18.32µs  max=157.5ms p(90)=24.08µs  p(95)=28.23µs  p(99.9)=3.82ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=832.27ms min=5.38ms  med=737.94ms max=14.4s   p(90)=1.58s    p(95)=1.71s    p(99.9)=12.41s
     http_reqs......................: 17321   255.726386/s
     iteration_duration.............: avg=883.47ms min=36.44ms med=793.82ms max=14.4s   p(90)=1.6s     p(95)=1.72s    p(99.9)=12.52s
     iterations.....................: 16321   240.962436/s
     success_rate...................: 100.00% ✓ 16321      ✗ 0    
     vus............................: 84      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47967      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   284 kB/s
     http_req_blocked...............: avg=12.18µs  min=1.25µs  med=3.47µs   max=13.66ms p(90)=5.16µs   p(95)=6.72µs   p(99.9)=1.31ms  
     http_req_connecting............: avg=7.05µs   min=0s      med=0s       max=13.6ms  p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=386.3ms  min=7.6ms   med=445.59ms max=1.11s   p(90)=651.54ms p(95)=699.9ms  p(99.9)=982.69ms
       { expected_response:true }...: avg=386.3ms  min=7.6ms   med=445.59ms max=1.11s   p(90)=651.54ms p(95)=699.9ms  p(99.9)=982.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16989
     http_req_receiving.............: avg=94.84µs  min=33.14µs med=83.93µs  max=54.42ms p(90)=123.25µs p(95)=139.41µs p(99.9)=879.39µs
     http_req_sending...............: avg=38.31µs  min=6.36µs  med=16.95µs  max=62.06ms p(90)=22.91µs  p(95)=27.1µs   p(99.9)=4.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=386.16ms min=7.47ms  med=445.51ms max=1.11s   p(90)=651.43ms p(95)=699.75ms p(99.9)=982.55ms
     http_reqs......................: 16989   232.063558/s
     iteration_duration.............: avg=410.45ms min=8.26ms  med=465.93ms max=1.12s   p(90)=655.77ms p(95)=705.6ms  p(99.9)=988.13ms
     iterations.....................: 15989   218.403922/s
     success_rate...................: 100.00% ✓ 15989      ✗ 0    
     vus............................: 62      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 434928      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=20.93µs min=952ns   med=2.86µs   max=76.89ms  p(90)=4.65µs   p(95)=5.82µs   p(99.9)=2.45ms  
     http_req_connecting............: avg=17.35µs min=0s      med=0s       max=76.79ms  p(90)=0s       p(95)=0s       p(99.9)=2.41ms  
     http_req_duration..............: avg=97.41ms min=1.46ms  med=92.76ms  max=386.91ms p(90)=184.98ms p(95)=202.59ms p(99.9)=262.02ms
       { expected_response:true }...: avg=97.41ms min=1.46ms  med=92.76ms  max=386.91ms p(90)=184.98ms p(95)=202.59ms p(99.9)=262.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145976
     http_req_receiving.............: avg=781.4µs min=53.79µs med=120.36µs max=122.77ms p(90)=1.62ms   p(95)=2.61ms   p(99.9)=27.35ms 
     http_req_sending...............: avg=74.28µs min=4.96µs  med=10.85µs  max=234.7ms  p(90)=22.58µs  p(95)=127.67µs p(99.9)=9.56ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.55ms min=1.37ms  med=91.86ms  max=386.81ms p(90)=184.16ms p(95)=201.62ms p(99.9)=261.37ms
     http_reqs......................: 145976  2361.326703/s
     iteration_duration.............: avg=98.35ms min=3.4ms   med=93.8ms   max=387.17ms p(90)=185.47ms p(95)=203.12ms p(99.9)=263.01ms
     iterations.....................: 144976  2345.150573/s
     success_rate...................: 100.00% ✓ 144976      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 430452      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=13.23µs min=872ns   med=2.28µs   max=64.58ms  p(90)=4.09µs   p(95)=5.26µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=10.19µs min=0s      med=0s       max=64.52ms  p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=98.53ms min=1.46ms  med=81.42ms  max=1.59s    p(90)=187.26ms p(95)=216.3ms  p(99.9)=787.94ms
       { expected_response:true }...: avg=98.53ms min=1.46ms  med=81.42ms  max=1.59s    p(90)=187.26ms p(95)=216.3ms  p(99.9)=787.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144484
     http_req_receiving.............: avg=1.46ms  min=51.95µs med=102.84µs max=1.09s    p(90)=1.71ms   p(95)=4.44ms   p(99.9)=86.88ms 
     http_req_sending...............: avg=62.24µs min=4.54µs  med=9.51µs   max=264.23ms p(90)=19.67µs  p(95)=101.33µs p(99.9)=7.78ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97ms    min=1.38ms  med=80.3ms   max=1.59s    p(90)=185.71ms p(95)=212.93ms p(99.9)=765.36ms
     http_reqs......................: 144484  2334.911316/s
     iteration_duration.............: avg=99.47ms min=2.92ms  med=82.37ms  max=1.59s    p(90)=187.85ms p(95)=216.99ms p(99.9)=789.08ms
     iterations.....................: 143484  2318.750971/s
     success_rate...................: 100.00% ✓ 143484      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 430548      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=14.56µs min=841ns   med=2.27µs   max=48.4ms   p(90)=4.06µs   p(95)=5.27µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=11.62µs min=0s      med=0s       max=48.33ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=98.47ms min=1.53ms  med=87.5ms   max=2.65s    p(90)=186.5ms  p(95)=213.38ms p(99.9)=705.6ms 
       { expected_response:true }...: avg=98.47ms min=1.53ms  med=87.5ms   max=2.65s    p(90)=186.5ms  p(95)=213.38ms p(99.9)=705.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144516
     http_req_receiving.............: avg=1.36ms  min=52.08µs med=103.08µs max=645.11ms p(90)=1.53ms   p(95)=4ms      p(99.9)=86.51ms 
     http_req_sending...............: avg=60.77µs min=4.55µs  med=9.41µs   max=40.98ms  p(90)=20.15µs  p(95)=105.98µs p(99.9)=8.13ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.05ms min=1.44ms  med=86.36ms  max=2.65s    p(90)=184.62ms p(95)=210.45ms p(99.9)=692.87ms
     http_reqs......................: 144516  2334.825339/s
     iteration_duration.............: avg=99.42ms min=2.75ms  med=88.6ms   max=2.65s    p(90)=187.06ms p(95)=214.11ms p(99.9)=707.94ms
     iterations.....................: 143516  2318.669168/s
     success_rate...................: 100.00% ✓ 143516      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428073      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=20.91µs min=1.02µs  med=3.09µs  max=75.35ms  p(90)=5.03µs   p(95)=6.29µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=16.82µs min=0s      med=0s      max=75.08ms  p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=98.98ms min=1.68ms  med=95.13ms max=342.93ms p(90)=187.76ms p(95)=204.46ms p(99.9)=260.85ms
       { expected_response:true }...: avg=98.98ms min=1.68ms  med=95.13ms max=342.93ms p(90)=187.76ms p(95)=204.46ms p(99.9)=260.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143691
     http_req_receiving.............: avg=145.4µs min=27.48µs med=58.94µs max=52.45ms  p(90)=155.76µs p(95)=387.01µs p(99.9)=14.42ms 
     http_req_sending...............: avg=74.95µs min=5.19µs  med=11.97µs max=126.09ms p(90)=23.72µs  p(95)=140.24µs p(99.9)=9.93ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.76ms min=1.62ms  med=94.92ms max=342.41ms p(90)=187.47ms p(95)=204.15ms p(99.9)=259.72ms
     http_reqs......................: 143691  2315.758808/s
     iteration_duration.............: avg=99.93ms min=3.43ms  med=96.13ms max=351.55ms p(90)=188.32ms p(95)=204.96ms p(99.9)=261.55ms
     iterations.....................: 142691  2299.642567/s
     success_rate...................: 100.00% ✓ 142691      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 401871      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=13.85µs  min=922ns   med=2.37µs  max=87.7ms   p(90)=4.2µs    p(95)=5.36µs   p(99.9)=830.4µs 
     http_req_connecting............: avg=10.79µs  min=0s      med=0s      max=87.65ms  p(90)=0s       p(95)=0s       p(99.9)=774.2µs 
     http_req_duration..............: avg=105.47ms min=1.88ms  med=93.44ms max=2.16s    p(90)=200.15ms p(95)=227.65ms p(99.9)=774.47ms
       { expected_response:true }...: avg=105.47ms min=1.88ms  med=93.44ms max=2.16s    p(90)=200.15ms p(95)=227.65ms p(99.9)=774.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134957
     http_req_receiving.............: avg=1.23ms   min=52.98µs med=107.2µs max=682.66ms p(90)=1.58ms   p(95)=3.85ms   p(99.9)=78.56ms 
     http_req_sending...............: avg=57.99µs  min=4.81µs  med=9.85µs  max=138.91ms p(90)=20µs     p(95)=102.02µs p(99.9)=7.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.18ms min=1.8ms   med=92.55ms max=2.16s    p(90)=198.4ms  p(95)=224.9ms  p(99.9)=732.46ms
     http_reqs......................: 134957  2165.818631/s
     iteration_duration.............: avg=106.53ms min=3.37ms  med=94.63ms max=2.16s    p(90)=200.68ms p(95)=228.29ms p(99.9)=776.08ms
     iterations.....................: 133957  2149.770418/s
     success_rate...................: 100.00% ✓ 133957      ✗ 0     
     vus............................: 74      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 210306      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=6.43µs   min=1.03µs  med=3.04µs   max=18.19ms  p(90)=4.92µs   p(95)=6µs      p(99.9)=455.97µs
     http_req_connecting............: avg=2.6µs    min=0s      med=0s       max=18.13ms  p(90)=0s       p(95)=0s       p(99.9)=395.32µs
     http_req_duration..............: avg=200.74ms min=1.89ms  med=197.15ms max=553.23ms p(90)=376.84ms p(95)=404.65ms p(99.9)=486.07ms
       { expected_response:true }...: avg=200.74ms min=1.89ms  med=197.15ms max=553.23ms p(90)=376.84ms p(95)=404.65ms p(99.9)=486.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71102
     http_req_receiving.............: avg=92.45µs  min=27.07µs med=65.57µs  max=211.74ms p(90)=106.73µs p(95)=123.11µs p(99.9)=1.31ms  
     http_req_sending...............: avg=29.67µs  min=5.37µs  med=12.79µs  max=81.89ms  p(90)=20µs     p(95)=23.9µs   p(99.9)=3.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.62ms min=1.84ms  med=196.97ms max=553.1ms  p(90)=376.74ms p(95)=404.54ms p(99.9)=486ms   
     http_reqs......................: 71102   1136.110565/s
     iteration_duration.............: avg=203.86ms min=4.34ms  med=200.76ms max=553.48ms p(90)=377.69ms p(95)=405.26ms p(99.9)=486.56ms
     iterations.....................: 70102   1120.131963/s
     success_rate...................: 100.00% ✓ 70102       ✗ 0    
     vus............................: 85      min=0         max=495
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 101307     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   645 kB/s
     http_req_blocked...............: avg=9.41µs   min=1.11µs  med=3.43µs   max=7.65ms  p(90)=5.29µs   p(95)=6.34µs   p(99.9)=1.55ms
     http_req_connecting............: avg=4.85µs   min=0s      med=0s       max=7.59ms  p(90)=0s       p(95)=0s       p(99.9)=1.52ms
     http_req_duration..............: avg=412.55ms min=3.93ms  med=384.44ms max=2.02s   p(90)=807.63ms p(95)=876.5ms  p(99.9)=1.34s 
       { expected_response:true }...: avg=412.55ms min=3.93ms  med=384.44ms max=2.02s   p(90)=807.63ms p(95)=876.5ms  p(99.9)=1.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34769
     http_req_receiving.............: avg=89.2µs   min=28.6µs  med=76.58µs  max=82.22ms p(90)=116.56µs p(95)=131.72µs p(99.9)=1.04ms
     http_req_sending...............: avg=36.95µs  min=5.53µs  med=15.55µs  max=147.4ms p(90)=22.93µs  p(95)=26.08µs  p(99.9)=2.83ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=412.43ms min=3.8ms   med=384.28ms max=2.02s   p(90)=807.52ms p(95)=876.42ms p(99.9)=1.34s 
     http_reqs......................: 34769   536.979032/s
     iteration_duration.............: avg=425.01ms min=15.88ms med=400.13ms max=2.03s   p(90)=810.88ms p(95)=879.51ms p(99.9)=1.35s 
     iterations.....................: 33769   521.534842/s
     success_rate...................: 100.00% ✓ 33769      ✗ 0    
     vus............................: 89      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45930      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   290 kB/s
     http_req_blocked...............: avg=16.25µs  min=1.2µs   med=3.84µs   max=12.28ms p(90)=5.74µs   p(95)=7.31µs   p(99.9)=2.3ms 
     http_req_connecting............: avg=10.54µs  min=0s      med=0s       max=12.22ms p(90)=0s       p(95)=0s       p(99.9)=2.28ms
     http_req_duration..............: avg=892.36ms min=5.87ms  med=802.93ms max=4.9s    p(90)=1.79s    p(95)=2.01s    p(99.9)=4.2s  
       { expected_response:true }...: avg=892.36ms min=5.87ms  med=802.93ms max=4.9s    p(90)=1.79s    p(95)=2.01s    p(99.9)=4.2s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16310
     http_req_receiving.............: avg=108.42µs min=38.71µs med=97.13µs  max=65.16ms p(90)=135.03µs p(95)=151.19µs p(99.9)=1.11ms
     http_req_sending...............: avg=34.48µs  min=6.36µs  med=19.1µs   max=36.88ms p(90)=24.98µs  p(95)=30.29µs  p(99.9)=2.99ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=892.22ms min=5.78ms  med=802.81ms max=4.9s    p(90)=1.79s    p(95)=2.01s    p(99.9)=4.2s  
     http_reqs......................: 16310   241.730312/s
     iteration_duration.............: avg=950.7ms  min=39.42ms med=869.11ms max=4.91s   p(90)=1.81s    p(95)=2.01s    p(99.9)=4.21s 
     iterations.....................: 15310   226.909324/s
     success_rate...................: 100.00% ✓ 15310      ✗ 0    
     vus............................: 75      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 44742      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=14.09µs  min=1.18µs  med=3.79µs   max=8.27ms   p(90)=5.59µs   p(95)=7.04µs   p(99.9)=2.01ms
     http_req_connecting............: avg=8.49µs   min=0s      med=0s       max=8.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.97ms
     http_req_duration..............: avg=913.02ms min=7.84ms  med=839.98ms max=3.27s    p(90)=1.85s    p(95)=1.97s    p(99.9)=2.83s 
       { expected_response:true }...: avg=913.02ms min=7.84ms  med=839.98ms max=3.27s    p(90)=1.85s    p(95)=1.97s    p(99.9)=2.83s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15914
     http_req_receiving.............: avg=114.22µs min=33.98µs med=92.9µs   max=96.21ms  p(90)=134.72µs p(95)=150.83µs p(99.9)=1.16ms
     http_req_sending...............: avg=51.89µs  min=5.47µs  med=17.98µs  max=104.18ms p(90)=23.77µs  p(95)=28.98µs  p(99.9)=3.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=912.85ms min=7.73ms  med=839.84ms max=3.27s    p(90)=1.85s    p(95)=1.97s    p(99.9)=2.83s 
     http_reqs......................: 15914   231.082027/s
     iteration_duration.............: avg=974.26ms min=48.39ms med=918.26ms max=3.28s    p(90)=1.86s    p(95)=1.99s    p(99.9)=2.84s 
     iterations.....................: 14914   216.561352/s
     success_rate...................: 100.00% ✓ 14914      ✗ 0    
     vus............................: 10      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

