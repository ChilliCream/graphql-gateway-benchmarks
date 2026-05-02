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
| hive-router | v0.0.49 | 2,838 | 2,940 | 2,808 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,087 | 2,135 | 2,071 | 1.1% |  |
| cosmo | 0.307.0 | 1,209 | 1,209 | 1,181 | 1.6% | non-compatible response (19 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 500 | 509 | 493 | 0.9% |  |
| hive-gateway | 2.5.25 | 231 | 235 | 230 | 0.7% |  |
| apollo-gateway | 2.13.3 | 198 | 203 | 196 | 1.1% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16945 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (531988 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,356 | 2,454 | 2,323 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,925 | 1,955 | 1,904 | 1.0% |  |
| cosmo | 0.307.0 | 1,167 | 1,167 | 1,146 | 1.3% | non-compatible response (14 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 478 | 486 | 474 | 0.9% |  |
| hive-gateway | 2.5.25 | 228 | 231 | 225 | 0.8% |  |
| apollo-gateway | 2.13.3 | 209 | 212 | 207 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (18716 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (361763 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 523905      ✗ 0     
     data_received..................: 15 GB   249 MB/s
     data_sent......................: 211 MB  3.4 MB/s
     http_req_blocked...............: avg=33.6µs   min=982ns   med=2.41µs  max=74.92ms  p(90)=4.04µs   p(95)=5.19µs   p(99.9)=7.63ms  
     http_req_connecting............: avg=30.14µs  min=0s      med=0s      max=74.86ms  p(90)=0s       p(95)=0s       p(99.9)=7.05ms  
     http_req_duration..............: avg=80.78ms  min=1.63ms  med=73.73ms max=314.92ms p(90)=157.21ms p(95)=175.91ms p(99.9)=243.46ms
       { expected_response:true }...: avg=80.78ms  min=1.63ms  med=73.73ms max=314.92ms p(90)=157.21ms p(95)=175.91ms p(99.9)=243.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175635
     http_req_receiving.............: avg=570.21µs min=27.78µs med=56.55µs max=136.35ms p(90)=276.92µs p(95)=444.29µs p(99.9)=54.69ms 
     http_req_sending...............: avg=102.14µs min=5µs     med=10.05µs max=104.4ms  p(90)=19.84µs  p(95)=135.67µs p(99.9)=17.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.1ms   min=1.57ms  med=73.27ms max=291.58ms p(90)=156.19ms p(95)=173.73ms p(99.9)=234.56ms
     http_reqs......................: 175635  2838.202835/s
     iteration_duration.............: avg=81.64ms  min=2.33ms  med=74.65ms max=335.93ms p(90)=158.01ms p(95)=176.94ms p(99.9)=246.4ms 
     iterations.....................: 174635  2822.04317/s
     success_rate...................: 100.00% ✓ 174635      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 389334      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=15.97µs  min=962ns   med=2.2µs    max=105.02ms p(90)=3.53µs   p(95)=4.45µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=12.93µs  min=0s      med=0s       max=104.83ms p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=108.9ms  min=2.35ms  med=97.34ms  max=1.52s    p(90)=211.36ms p(95)=246.1ms  p(99.9)=480.85ms
       { expected_response:true }...: avg=108.9ms  min=2.35ms  med=97.34ms  max=1.52s    p(90)=211.36ms p(95)=246.1ms  p(99.9)=480.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130778
     http_req_receiving.............: avg=1.96ms   min=51.96µs med=110.87µs max=1.28s    p(90)=1.35ms   p(95)=4.52ms   p(99.9)=152.62ms
     http_req_sending...............: avg=64.91µs  min=5.28µs  med=9.64µs   max=136.13ms p(90)=17.86µs  p(95)=119.28µs p(99.9)=8.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.87ms min=2.27ms  med=96.23ms  max=1.52s    p(90)=208.51ms p(95)=239.36ms p(99.9)=450.98ms
     http_reqs......................: 130778  2087.831412/s
     iteration_duration.............: avg=110.01ms min=3.56ms  med=98.54ms  max=1.52s    p(90)=211.99ms p(95)=247.03ms p(99.9)=481.36ms
     iterations.....................: 129778  2071.866713/s
     success_rate...................: 100.00% ✓ 129778      ✗ 0     
     vus............................: 89      min=0         max=498 
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

     checks.........................: 100.00% ✓ 223776      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=6.08µs   min=1.09µs  med=2.49µs   max=8.45ms   p(90)=4.11µs   p(95)=5.04µs   p(99.9)=507.56µs
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=8.41ms   p(90)=0s       p(95)=0s       p(99.9)=391.48µs
     http_req_duration..............: avg=188.77ms min=2ms     med=189.22ms max=549.47ms p(90)=350.65ms p(95)=376.21ms p(99.9)=465.19ms
       { expected_response:true }...: avg=188.77ms min=2ms     med=189.22ms max=549.47ms p(90)=350.65ms p(95)=376.21ms p(99.9)=465.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75592
     http_req_receiving.............: avg=77.98µs  min=30.29µs med=62.07µs  max=31.36ms  p(90)=97.08µs  p(95)=111.69µs p(99.9)=1.59ms  
     http_req_sending...............: avg=31.83µs  min=5.52µs  med=10.97µs  max=36.23ms  p(90)=17.49µs  p(95)=21.08µs  p(99.9)=4.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.66ms min=1.95ms  med=189.08ms max=549.4ms  p(90)=350.55ms p(95)=376.09ms p(99.9)=465.11ms
     http_reqs......................: 75592   1209.323017/s
     iteration_duration.............: avg=191.54ms min=4.52ms  med=192.27ms max=549.62ms p(90)=351.42ms p(95)=376.85ms p(99.9)=465.66ms
     iterations.....................: 74592   1193.324988/s
     success_rate...................: 100.00% ✓ 74592       ✗ 0    
     vus............................: 81      min=0         max=493
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

     checks.........................: 100.00% ✓ 94320      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   601 kB/s
     http_req_blocked...............: avg=9.24µs   min=1.19µs  med=2.57µs   max=5.5ms    p(90)=4.3µs    p(95)=5.29µs   p(99.9)=1.69ms
     http_req_connecting............: avg=5.41µs   min=0s      med=0s       max=5.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms
     http_req_duration..............: avg=442.77ms min=3.94ms  med=409.39ms max=1.72s    p(90)=868.96ms p(95)=954.28ms p(99.9)=1.41s 
       { expected_response:true }...: avg=442.77ms min=3.94ms  med=409.39ms max=1.72s    p(90)=868.96ms p(95)=954.28ms p(99.9)=1.41s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32440
     http_req_receiving.............: avg=110.78µs min=32.55µs med=75.23µs  max=134.77ms p(90)=111.72µs p(95)=124.71µs p(99.9)=1.44ms
     http_req_sending...............: avg=31.26µs  min=5.5µs   med=12.63µs  max=107.93ms p(90)=20.18µs  p(95)=23.61µs  p(99.9)=2.7ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=442.63ms min=3.88ms  med=409.32ms max=1.72s    p(90)=868.81ms p(95)=954.16ms p(99.9)=1.41s 
     http_reqs......................: 32440   500.369154/s
     iteration_duration.............: avg=457.07ms min=21.9ms  med=426.67ms max=1.74s    p(90)=873.62ms p(95)=958.12ms p(99.9)=1.42s 
     iterations.....................: 31440   484.944705/s
     success_rate...................: 100.00% ✓ 31440      ✗ 0    
     vus............................: 3       min=0        max=500
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

     checks.........................: 100.00% ✓ 44103      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   278 kB/s
     http_req_blocked...............: avg=14.81µs  min=1.15µs  med=3.51µs   max=4.21ms   p(90)=5.38µs   p(95)=6.95µs   p(99.9)=2.48ms 
     http_req_connecting............: avg=9.71µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=2.45ms 
     http_req_duration..............: avg=911.32ms min=6.02ms  med=797.95ms max=16.63s   p(90)=1.64s    p(95)=1.81s    p(99.9)=15.1s  
       { expected_response:true }...: avg=911.32ms min=6.02ms  med=797.95ms max=16.63s   p(90)=1.64s    p(95)=1.81s    p(99.9)=15.1s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15701
     http_req_receiving.............: avg=178.47µs min=32.22µs med=102.64µs max=130.06ms p(90)=141.95µs p(95)=155.11µs p(99.9)=10.15ms
     http_req_sending...............: avg=35.81µs  min=5.61µs  med=18.36µs  max=84.37ms  p(90)=24.48µs  p(95)=30.09µs  p(99.9)=3ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=911.1ms  min=5.93ms  med=797.77ms max=16.63s   p(90)=1.64s    p(95)=1.81s    p(99.9)=15.1s  
     http_reqs......................: 15701   231.250984/s
     iteration_duration.............: avg=973.28ms min=50.1ms  med=868.98ms max=16.63s   p(90)=1.66s    p(95)=1.84s    p(99.9)=15.19s 
     iterations.....................: 14701   216.52256/s
     success_rate...................: 100.00% ✓ 14701      ✗ 0    
     vus............................: 19      min=0        max=500
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

     checks.........................: 100.00% ✓ 41526      ✗ 0    
     data_received..................: 1.3 GB  17 MB/s
     data_sent......................: 18 MB   243 kB/s
     http_req_blocked...............: avg=15.11µs  min=1.27µs  med=3.17µs   max=19.47ms p(90)=4.81µs   p(95)=6.44µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=10.09µs  min=0s      med=0s       max=19.41ms p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=448.88ms min=8.53ms  med=503.37ms max=1.35s   p(90)=770.86ms p(95)=840.16ms p(99.9)=1.2s    
       { expected_response:true }...: avg=448.88ms min=8.53ms  med=503.37ms max=1.35s   p(90)=770.86ms p(95)=840.16ms p(99.9)=1.2s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 14842
     http_req_receiving.............: avg=97.54µs  min=38.21µs med=89.18µs  max=40.64ms p(90)=127.4µs  p(95)=140.17µs p(99.9)=985.28µs
     http_req_sending...............: avg=31.72µs  min=6.22µs  med=16.2µs   max=74.56ms p(90)=22.07µs  p(95)=27.21µs  p(99.9)=2.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.75ms min=8.44ms  med=503.2ms  max=1.35s   p(90)=770.76ms p(95)=840.08ms p(99.9)=1.2s    
     http_reqs......................: 14842   198.338625/s
     iteration_duration.............: avg=481.11ms min=13.78ms med=529.48ms max=1.35s   p(90)=780.01ms p(95)=846.81ms p(99.9)=1.21s   
     iterations.....................: 13842   184.97529/s
     success_rate...................: 100.00% ✓ 13842      ✗ 0    
     vus............................: 84      min=0        max=500
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

     checks.........................: 100.00% ✓ 436059      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=33.95µs  min=1µs     med=2.6µs   max=88.36ms  p(90)=4.49µs   p(95)=5.84µs   p(99.9)=7.09ms  
     http_req_connecting............: avg=30.4µs   min=0s      med=0s      max=88.22ms  p(90)=0s       p(95)=0s       p(99.9)=7.02ms  
     http_req_duration..............: avg=97.14ms  min=1.64ms  med=91.17ms max=305.01ms p(90)=187.46ms p(95)=203.61ms p(99.9)=255.82ms
       { expected_response:true }...: avg=97.14ms  min=1.64ms  med=91.17ms max=305.01ms p(90)=187.46ms p(95)=203.61ms p(99.9)=255.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146353
     http_req_receiving.............: avg=263.89µs min=29.72µs med=60.95µs max=170.99ms p(90)=205.77µs p(95)=433.31µs p(99.9)=30.55ms 
     http_req_sending...............: avg=85.99µs  min=5.22µs  med=10.98µs max=103.11ms p(90)=22.32µs  p(95)=141.51µs p(99.9)=12.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.79ms  min=1.55ms  med=90.85ms max=286.03ms p(90)=186.93ms p(95)=202.71ms p(99.9)=254.74ms
     http_reqs......................: 146353  2356.779444/s
     iteration_duration.............: avg=98.11ms  min=4.56ms  med=92.29ms max=371.05ms p(90)=187.95ms p(95)=204.19ms p(99.9)=257.16ms
     iterations.....................: 145353  2340.676054/s
     success_rate...................: 100.00% ✓ 145353      ✗ 0     
     vus............................: 61      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 356703      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=14.94µs  min=1µs     med=2.34µs   max=53.32ms  p(90)=3.94µs   p(95)=4.97µs   p(99.9)=2ms     
     http_req_connecting............: avg=11.92µs  min=0s      med=0s       max=53.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=118.74ms min=1.79ms  med=109.3ms  max=870.66ms p(90)=227.93ms p(95)=259.93ms p(99.9)=664.59ms
       { expected_response:true }...: avg=118.74ms min=1.79ms  med=109.3ms  max=870.66ms p(90)=227.93ms p(95)=259.93ms p(99.9)=664.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119901
     http_req_receiving.............: avg=1.66ms   min=52.86µs med=113.72µs max=314.39ms p(90)=1.5ms    p(95)=3.94ms   p(99.9)=130.15ms
     http_req_sending...............: avg=62.42µs  min=5.37µs  med=10.21µs  max=251.87ms p(90)=20.38µs  p(95)=119.64µs p(99.9)=8.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.02ms min=1.69ms  med=108.19ms max=870.54ms p(90)=225.49ms p(95)=255.46ms p(99.9)=663.75ms
     http_reqs......................: 119901  1925.526895/s
     iteration_duration.............: avg=120ms    min=3.35ms  med=110.76ms max=870.84ms p(90)=228.66ms p(95)=260.64ms p(99.9)=666.15ms
     iterations.....................: 118901  1909.467589/s
     success_rate...................: 100.00% ✓ 118901      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 215814      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=7.22µs   min=1.09µs  med=2.42µs   max=24.53ms  p(90)=4.07µs   p(95)=4.98µs   p(99.9)=703.79µs
     http_req_connecting............: avg=4.07µs   min=0s      med=0s       max=24.35ms  p(90)=0s       p(95)=0s       p(99.9)=681.38µs
     http_req_duration..............: avg=195.67ms min=2.09ms  med=198.24ms max=567.44ms p(90)=360.45ms p(95)=387.52ms p(99.9)=484.78ms
       { expected_response:true }...: avg=195.67ms min=2.09ms  med=198.24ms max=567.44ms p(90)=360.45ms p(95)=387.52ms p(99.9)=484.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72938
     http_req_receiving.............: avg=79.82µs  min=30.72µs med=64.4µs   max=21.28ms  p(90)=101.36µs p(95)=116.84µs p(99.9)=1.9ms   
     http_req_sending...............: avg=33.45µs  min=5.58µs  med=11.37µs  max=127.56ms p(90)=18.27µs  p(95)=21.95µs  p(99.9)=4.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.56ms min=2ms     med=198.11ms max=567.37ms p(90)=360.36ms p(95)=387.39ms p(99.9)=484.7ms 
     http_reqs......................: 72938   1167.389789/s
     iteration_duration.............: avg=198.64ms min=4.23ms  med=201.47ms max=567.68ms p(90)=361.37ms p(95)=388.19ms p(99.9)=485.45ms
     iterations.....................: 71938   1151.384555/s
     success_rate...................: 100.00% ✓ 71938       ✗ 0    
     vus............................: 80      min=0         max=494
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

     checks.........................: 100.00% ✓ 90588      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   574 kB/s
     http_req_blocked...............: avg=10.5µs   min=1.11µs  med=2.97µs   max=11.91ms  p(90)=4.72µs   p(95)=5.76µs   p(99.9)=2.15ms  
     http_req_connecting............: avg=6.49µs   min=0s      med=0s       max=11.83ms  p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=460.64ms min=4.15ms  med=429.63ms max=1.91s    p(90)=907.71ms p(95)=986.44ms p(99.9)=1.44s   
       { expected_response:true }...: avg=460.64ms min=4.15ms  med=429.63ms max=1.91s    p(90)=907.71ms p(95)=986.44ms p(99.9)=1.44s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31196
     http_req_receiving.............: avg=100.36µs min=33.14µs med=82.18µs  max=232.69ms p(90)=118.72µs p(95)=132.9µs  p(99.9)=895.91µs
     http_req_sending...............: avg=37.06µs  min=5.93µs  med=15µs     max=237.32ms p(90)=22.06µs  p(95)=25.38µs  p(99.9)=2.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=460.51ms min=4.06ms  med=429.52ms max=1.91s    p(90)=907.64ms p(95)=986.34ms p(99.9)=1.44s   
     http_reqs......................: 31196   478.102811/s
     iteration_duration.............: avg=476.16ms min=21.31ms med=448.42ms max=1.92s    p(90)=912.12ms p(95)=989.38ms p(99.9)=1.44s   
     iterations.....................: 30196   462.777038/s
     success_rate...................: 100.00% ✓ 30196      ✗ 0    
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

     checks.........................: 100.00% ✓ 43794      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=17.39µs  min=1.23µs  med=3.51µs   max=16.77ms p(90)=5.4µs    p(95)=7.14µs   p(99.9)=2.91ms  
     http_req_connecting............: avg=12.2µs   min=0s      med=0s       max=16.7ms  p(90)=0s       p(95)=0s       p(99.9)=2.88ms  
     http_req_duration..............: avg=935.6ms  min=6.34ms  med=872.07ms max=5.22s   p(90)=1.83s    p(95)=2.05s    p(99.9)=4.81s   
       { expected_response:true }...: avg=935.6ms  min=6.34ms  med=872.07ms max=5.22s   p(90)=1.83s    p(95)=2.05s    p(99.9)=4.81s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15598
     http_req_receiving.............: avg=107.04µs min=36.23µs med=100.66µs max=6.69ms  p(90)=140.05µs p(95)=152.81µs p(99.9)=982.81µs
     http_req_sending...............: avg=39.75µs  min=6.22µs  med=18.52µs  max=66.2ms  p(90)=24.45µs  p(95)=29.41µs  p(99.9)=4.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=935.45ms min=6.24ms  med=871.96ms max=5.22s   p(90)=1.83s    p(95)=2.05s    p(99.9)=4.81s   
     http_reqs......................: 15598   228.251898/s
     iteration_duration.............: avg=999.69ms min=41.26ms med=927.95ms max=5.23s   p(90)=1.85s    p(95)=2.06s    p(99.9)=4.83s   
     iterations.....................: 14598   213.61849/s
     success_rate...................: 100.00% ✓ 14598      ✗ 0    
     vus............................: 70      min=0        max=500
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

     checks.........................: 100.00% ✓ 40851      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=17.67µs  min=1.23µs  med=3.34µs   max=25.73ms  p(90)=5.11µs   p(95)=6.99µs   p(99.9)=2.64ms  
     http_req_connecting............: avg=12.55µs  min=0s      med=0s       max=25.67ms  p(90)=0s       p(95)=0s       p(99.9)=2.62ms  
     http_req_duration..............: avg=997.49ms min=8.6ms   med=918.23ms max=4.08s    p(90)=2.02s    p(95)=2.16s    p(99.9)=3.48s   
       { expected_response:true }...: avg=997.49ms min=8.6ms   med=918.23ms max=4.08s    p(90)=2.02s    p(95)=2.16s    p(99.9)=3.48s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14617
     http_req_receiving.............: avg=313.43µs min=33.69µs med=93.76µs  max=185.2ms  p(90)=134.31µs p(95)=146.76µs p(99.9)=103.04ms
     http_req_sending...............: avg=46.86µs  min=6.2µs   med=17.4µs   max=289.71ms p(90)=23.17µs  p(95)=28.48µs  p(99.9)=2.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=997.13ms min=8.5ms   med=918.12ms max=4.08s    p(90)=2.02s    p(95)=2.16s    p(99.9)=3.48s   
     http_reqs......................: 14617   209.524697/s
     iteration_duration.............: avg=1.07s    min=17.44ms med=1s       max=4.09s    p(90)=2.04s    p(95)=2.17s    p(99.9)=3.49s   
     iterations.....................: 13617   195.190381/s
     success_rate...................: 100.00% ✓ 13617      ✗ 0    
     vus............................: 97      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

