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
| hive-router | v0.0.49 | 2,851 | 2,957 | 2,815 | 1.7% |  |
| hotchocolate | 16.1.0-p.14 | 2,084 | 2,122 | 2,070 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 497 | 503 | 494 | 0.6% |  |
| hive-gateway | 2.5.25 | 219 | 221 | 216 | 0.8% |  |
| apollo-gateway | 2.13.3 | 199 | 203 | 198 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (15689 across 9/9 runs) |
| cosmo | 0.307.0 | — | — | — | — | non-compatible response (23 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (516751 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,272 | 2,350 | 2,217 | 2.0% |  |
| hotchocolate | 16.1.0-p.14 | 1,924 | 1,955 | 1,756 | 3.1% |  |
| cosmo | 0.307.0 | 1,114 | 1,127 | 1,113 | 0.7% | non-compatible response (17 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 478 | 484 | 472 | 0.9% |  |
| hive-gateway | 2.5.25 | 218 | 220 | 216 | 0.6% |  |
| apollo-gateway | 2.13.3 | 202 | 204 | 201 | 0.4% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16423 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (372518 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 526008      ✗ 0     
     data_received..................: 16 GB   250 MB/s
     data_sent......................: 212 MB  3.4 MB/s
     http_req_blocked...............: avg=32.21µs  min=971ns   med=2.26µs  max=87.55ms  p(90)=3.69µs   p(95)=4.81µs   p(99.9)=7.82ms  
     http_req_connecting............: avg=29.2µs   min=0s      med=0s      max=87.46ms  p(90)=0s       p(95)=0s       p(99.9)=7.75ms  
     http_req_duration..............: avg=80.47ms  min=1.62ms  med=73.98ms max=309.13ms p(90)=156.53ms p(95)=175.82ms p(99.9)=240.69ms
       { expected_response:true }...: avg=80.47ms  min=1.62ms  med=73.98ms max=309.13ms p(90)=156.53ms p(95)=175.82ms p(99.9)=240.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176336
     http_req_receiving.............: avg=463.02µs min=28.26µs med=55µs    max=116.06ms p(90)=255.12µs p(95)=422.8µs  p(99.9)=50.71ms 
     http_req_sending...............: avg=91.43µs  min=5.32µs  med=9.81µs  max=54.12ms  p(90)=18.35µs  p(95)=133.34µs p(99.9)=14.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.92ms  min=1.57ms  med=73.55ms max=281.34ms p(90)=155.56ms p(95)=173.86ms p(99.9)=238.98ms
     http_reqs......................: 176336  2851.144246/s
     iteration_duration.............: avg=81.29ms  min=2.34ms  med=74.87ms max=342.24ms p(90)=157.18ms p(95)=176.67ms p(99.9)=246.99ms
     iterations.....................: 175336  2834.97543/s
     success_rate...................: 100.00% ✓ 175336      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 389856      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=15.76µs  min=992ns   med=2.19µs   max=60.51ms  p(90)=3.41µs   p(95)=4.35µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=12.66µs  min=0s      med=0s       max=58.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=108.71ms min=2.4ms   med=100.38ms max=715.08ms p(90)=211.56ms p(95)=245.79ms p(99.9)=426.15ms
       { expected_response:true }...: avg=108.71ms min=2.4ms   med=100.38ms max=715.08ms p(90)=211.56ms p(95)=245.79ms p(99.9)=426.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130952
     http_req_receiving.............: avg=1.77ms   min=52.08µs med=111.24µs max=633.6ms  p(90)=1.46ms   p(95)=5.53ms   p(99.9)=153.27ms
     http_req_sending...............: avg=65.12µs  min=5.23µs  med=9.52µs   max=248.49ms p(90)=17.27µs  p(95)=120.48µs p(99.9)=8.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.87ms min=2.31ms  med=99.23ms  max=707.37ms p(90)=208.33ms p(95)=239.03ms p(99.9)=412.05ms
     http_reqs......................: 130952  2084.293381/s
     iteration_duration.............: avg=109.8ms  min=3.75ms  med=101.69ms max=715.31ms p(90)=212.14ms p(95)=246.53ms p(99.9)=426.87ms
     iterations.....................: 129952  2068.376913/s
     success_rate...................: 100.00% ✓ 129952      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 93774      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   597 kB/s
     http_req_blocked...............: avg=8.47µs   min=1.15µs  med=2.99µs   max=29.82ms  p(90)=4.73µs   p(95)=5.79µs   p(99.9)=816.86µs
     http_req_connecting............: avg=4.42µs   min=0s      med=0s       max=29.77ms  p(90)=0s       p(95)=0s       p(99.9)=693.74µs
     http_req_duration..............: avg=445.35ms min=3.96ms  med=417.37ms max=1.92s    p(90)=879.77ms p(95)=957.33ms p(99.9)=1.37s   
       { expected_response:true }...: avg=445.35ms min=3.96ms  med=417.37ms max=1.92s    p(90)=879.77ms p(95)=957.33ms p(99.9)=1.37s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32258
     http_req_receiving.............: avg=88.12µs  min=32.02µs med=74.78µs  max=137.14ms p(90)=109.96µs p(95)=122.34µs p(99.9)=860.21µs
     http_req_sending...............: avg=32.89µs  min=5.85µs  med=13.03µs  max=253.72ms p(90)=19.99µs  p(95)=23.35µs  p(99.9)=2.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=445.23ms min=3.88ms  med=417.23ms max=1.92s    p(90)=879.69ms p(95)=957.25ms p(99.9)=1.37s   
     http_reqs......................: 32258   497.664712/s
     iteration_duration.............: avg=459.83ms min=27.19ms med=432.4ms  max=1.92s    p(90)=883.53ms p(95)=961.24ms p(99.9)=1.38s   
     iterations.....................: 31258   482.237075/s
     success_rate...................: 100.00% ✓ 31258      ✗ 0    
     vus............................: 98      min=0        max=500
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

     checks.........................: 100.00% ✓ 41871      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   265 kB/s
     http_req_blocked...............: avg=16.12µs  min=1.27µs  med=3.56µs   max=5.06ms  p(90)=5.36µs   p(95)=7.05µs   p(99.9)=2.63ms  
     http_req_connecting............: avg=10.49µs  min=0s      med=0s       max=5ms     p(90)=0s       p(95)=0s       p(99.9)=2.56ms  
     http_req_duration..............: avg=936.81ms min=6.22ms  med=843.77ms max=22.28s  p(90)=1.59s    p(95)=1.77s    p(99.9)=18.35s  
       { expected_response:true }...: avg=936.81ms min=6.22ms  med=843.77ms max=22.28s  p(90)=1.59s    p(95)=1.77s    p(99.9)=18.35s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14957
     http_req_receiving.............: avg=101.18µs min=35.6µs  med=95.18µs  max=6.44ms  p(90)=134.32µs p(95)=146.93µs p(99.9)=489.96µs
     http_req_sending...............: avg=37.84µs  min=6.18µs  med=17.29µs  max=96.84ms p(90)=23.79µs  p(95)=28.17µs  p(99.9)=4.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=936.67ms min=6.13ms  med=843.67ms max=22.28s  p(90)=1.59s    p(95)=1.77s    p(99.9)=18.35s  
     http_reqs......................: 14957   219.777925/s
     iteration_duration.............: avg=1s       min=63.57ms med=908.72ms max=22.28s  p(90)=1.62s    p(95)=1.78s    p(99.9)=18.39s  
     iterations.....................: 13957   205.08394/s
     success_rate...................: 100.00% ✓ 13957      ✗ 0    
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

     checks.........................: 100.00% ✓ 41526      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   245 kB/s
     http_req_blocked...............: avg=15.82µs  min=1.34µs  med=3.4µs    max=17.5ms  p(90)=5.06µs   p(95)=6.57µs   p(99.9)=2.34ms  
     http_req_connecting............: avg=10.58µs  min=0s      med=0s       max=17.43ms p(90)=0s       p(95)=0s       p(99.9)=2.31ms  
     http_req_duration..............: avg=482.6ms  min=8.38ms  med=569.8ms  max=1.44s   p(90)=811.71ms p(95)=879.68ms p(99.9)=1.22s   
       { expected_response:true }...: avg=482.6ms  min=8.38ms  med=569.8ms  max=1.44s   p(90)=811.71ms p(95)=879.68ms p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14842
     http_req_receiving.............: avg=97.36µs  min=37.53µs med=88.31µs  max=16.47ms p(90)=128.06µs p(95)=142.18µs p(99.9)=880.61µs
     http_req_sending...............: avg=25.97µs  min=5.95µs  med=15.66µs  max=8.25ms  p(90)=22.1µs   p(95)=26.96µs  p(99.9)=2.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=482.47ms min=8.24ms  med=569.7ms  max=1.44s   p(90)=811.59ms p(95)=879.6ms  p(99.9)=1.22s   
     http_reqs......................: 14842   199.56322/s
     iteration_duration.............: avg=517.29ms min=9.04ms  med=597.62ms max=1.45s   p(90)=818.46ms p(95)=892.02ms p(99.9)=1.24s   
     iterations.....................: 13842   186.117376/s
     success_rate...................: 100.00% ✓ 13842      ✗ 0    
     vus............................: 65      min=0        max=495
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

     checks.........................: 100.00% ✓ 420561      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=22.04µs  min=1.05µs  med=2.61µs  max=54.28ms  p(90)=4.39µs   p(95)=5.61µs   p(99.9)=2.75ms  
     http_req_connecting............: avg=18.63µs  min=0s      med=0s      max=54.17ms  p(90)=0s       p(95)=0s       p(99.9)=2.71ms  
     http_req_duration..............: avg=100.71ms min=1.72ms  med=94.97ms max=317.1ms  p(90)=193.35ms p(95)=211.83ms p(99.9)=269.83ms
       { expected_response:true }...: avg=100.71ms min=1.72ms  med=94.97ms max=317.1ms  p(90)=193.35ms p(95)=211.83ms p(99.9)=269.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141187
     http_req_receiving.............: avg=269.87µs min=30.08µs med=60.93µs max=151.78ms p(90)=199.4µs  p(95)=434.98µs p(99.9)=29.27ms 
     http_req_sending...............: avg=81.06µs  min=5.32µs  med=10.9µs  max=51.36ms  p(90)=21.11µs  p(95)=140.73µs p(99.9)=11.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.36ms min=1.63ms  med=94.67ms max=313.24ms p(90)=192.67ms p(95)=210.83ms p(99.9)=268.36ms
     http_reqs......................: 141187  2272.251448/s
     iteration_duration.............: avg=101.72ms min=4.57ms  med=96.09ms max=394.46ms p(90)=193.93ms p(95)=212.36ms p(99.9)=270.74ms
     iterations.....................: 140187  2256.157534/s
     success_rate...................: 100.00% ✓ 140187      ✗ 0     
     vus............................: 64      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 356460      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=15.4µs   min=1.02µs  med=2.32µs   max=70.65ms  p(90)=3.94µs   p(95)=5.04µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=12.46µs  min=0s      med=0s       max=70.47ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=118.83ms min=1.82ms  med=112.47ms max=724.08ms p(90)=225.97ms p(95)=255.78ms p(99.9)=451.65ms
       { expected_response:true }...: avg=118.83ms min=1.82ms  med=112.47ms max=724.08ms p(90)=225.97ms p(95)=255.78ms p(99.9)=451.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119820
     http_req_receiving.............: avg=1.59ms   min=53.73µs med=111.42µs max=277.66ms p(90)=1.48ms   p(95)=3.63ms   p(99.9)=143.86ms
     http_req_sending...............: avg=63.9µs   min=5.3µs   med=10.16µs  max=125.74ms p(90)=19.62µs  p(95)=119.89µs p(99.9)=8.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.17ms min=1.73ms  med=111.34ms max=723.93ms p(90)=223.51ms p(95)=251.17ms p(99.9)=435.62ms
     http_reqs......................: 119820  1924.681712/s
     iteration_duration.............: avg=120.1ms  min=3.22ms  med=113.77ms max=724.3ms  p(90)=226.66ms p(95)=256.6ms  p(99.9)=453ms   
     iterations.....................: 118820  1908.618603/s
     success_rate...................: 100.00% ✓ 118820      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 206442      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.17µs   min=1.1µs   med=2.42µs   max=17.04ms  p(90)=4.05µs   p(95)=5µs      p(99.9)=448.32µs
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=16.99ms  p(90)=0s       p(95)=0s       p(99.9)=395.69µs
     http_req_duration..............: avg=204.47ms min=2.11ms  med=204.6ms  max=646.95ms p(90)=377.84ms p(95)=406.2ms  p(99.9)=552.32ms
       { expected_response:true }...: avg=204.47ms min=2.11ms  med=204.6ms  max=646.95ms p(90)=377.84ms p(95)=406.2ms  p(99.9)=552.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69814
     http_req_receiving.............: avg=83.15µs  min=30.73µs med=65.33µs  max=144.58ms p(90)=101.93µs p(95)=117.61µs p(99.9)=1.5ms   
     http_req_sending...............: avg=31.82µs  min=5.36µs  med=11.14µs  max=144.45ms p(90)=17.81µs  p(95)=21.51µs  p(99.9)=3.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.36ms min=2.03ms  med=204.48ms max=646.76ms p(90)=377.74ms p(95)=406.09ms p(99.9)=552.23ms
     http_reqs......................: 69814   1114.714425/s
     iteration_duration.............: avg=207.69ms min=4.76ms  med=208.21ms max=647.16ms p(90)=378.83ms p(95)=406.97ms p(99.9)=552.51ms
     iterations.....................: 68814   1098.747507/s
     success_rate...................: 100.00% ✓ 68814       ✗ 0    
     vus............................: 87      min=0         max=497
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

     checks.........................: 100.00% ✓ 90636      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 38 MB   575 kB/s
     http_req_blocked...............: avg=9.8µs    min=1.1µs   med=3.45µs   max=4.09ms   p(90)=5.3µs    p(95)=6.41µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=5.3µs    min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=460.48ms min=4.24ms  med=426.97ms max=2.03s    p(90)=911.5ms  p(95)=990.54ms p(99.9)=1.53s   
       { expected_response:true }...: avg=460.48ms min=4.24ms  med=426.97ms max=2.03s    p(90)=911.5ms  p(95)=990.54ms p(99.9)=1.53s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31212
     http_req_receiving.............: avg=91µs     min=32.12µs med=83.39µs  max=5.99ms   p(90)=119.35µs p(95)=133.84µs p(99.9)=840.76µs
     http_req_sending...............: avg=35.93µs  min=5.51µs  med=14.67µs  max=123.72ms p(90)=21.85µs  p(95)=25.43µs  p(99.9)=3.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=460.36ms min=4.12ms  med=426.86ms max=2.03s    p(90)=911.32ms p(95)=990.41ms p(99.9)=1.53s   
     http_reqs......................: 31212   478.610545/s
     iteration_duration.............: avg=475.94ms min=16.21ms med=447.56ms max=2.04s    p(90)=915.69ms p(95)=993.42ms p(99.9)=1.54s   
     iterations.....................: 30212   463.276361/s
     success_rate...................: 100.00% ✓ 30212      ✗ 0    
     vus............................: 65      min=0        max=496
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

     checks.........................: 100.00% ✓ 41897      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   262 kB/s
     http_req_blocked...............: avg=18.22µs  min=1.29µs  med=3.89µs   max=33.57ms p(90)=5.96µs   p(95)=7.86µs   p(99.9)=2.77ms
     http_req_connecting............: avg=12.29µs  min=0s      med=0s       max=33.52ms p(90)=0s       p(95)=0s       p(99.9)=2.7ms 
     http_req_duration..............: avg=975.99ms min=6.61ms  med=881.72ms max=5.68s   p(90)=1.93s    p(95)=2.16s    p(99.9)=5.19s 
       { expected_response:true }...: avg=975.99ms min=6.61ms  med=881.72ms max=5.68s   p(90)=1.93s    p(95)=2.16s    p(99.9)=5.19s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14966
     http_req_receiving.............: avg=118.22µs min=34.16µs med=102.72µs max=52.85ms p(90)=141.38µs p(95)=155.35µs p(99.9)=1.03ms
     http_req_sending...............: avg=35.39µs  min=6.62µs  med=19.23µs  max=55.15ms p(90)=25.54µs  p(95)=30.8µs   p(99.9)=3.31ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=975.83ms min=6.47ms  med=881.58ms max=5.68s   p(90)=1.93s    p(95)=2.16s    p(99.9)=5.19s 
     http_reqs......................: 14966   218.121485/s
     iteration_duration.............: avg=1.04s    min=30.48ms med=977.06ms max=5.68s   p(90)=1.95s    p(95)=2.18s    p(99.9)=5.21s 
     iterations.....................: 13965   203.532443/s
     success_rate...................: 100.00% ✓ 13965      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 39564      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   243 kB/s
     http_req_blocked...............: avg=16.38µs  min=1.25µs  med=3.46µs   max=3.95ms  p(90)=5.24µs   p(95)=7.18µs   p(99.9)=2.58ms
     http_req_connecting............: avg=10.94µs  min=0s      med=0s       max=3.9ms   p(90)=0s       p(95)=0s       p(99.9)=2.54ms
     http_req_duration..............: avg=1.02s    min=8.77ms  med=957.21ms max=4.39s   p(90)=2.07s    p(95)=2.2s     p(99.9)=3.78s 
       { expected_response:true }...: avg=1.02s    min=8.77ms  med=957.21ms max=4.39s   p(90)=2.07s    p(95)=2.2s     p(99.9)=3.78s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14188
     http_req_receiving.............: avg=110.73µs min=33.96µs med=94.47µs  max=96.88ms p(90)=134.96µs p(95)=147.41µs p(99.9)=1.15ms
     http_req_sending...............: avg=55.95µs  min=6.06µs  med=16.89µs  max=159.2ms p(90)=22.9µs   p(95)=28.15µs  p(99.9)=3.07ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.02s    min=8.66ms  med=957.12ms max=4.39s   p(90)=2.07s    p(95)=2.2s     p(99.9)=3.78s 
     http_reqs......................: 14188   202.66464/s
     iteration_duration.............: avg=1.1s     min=39.24ms med=1.03s    max=4.39s   p(90)=2.1s     p(95)=2.21s    p(99.9)=3.81s 
     iterations.....................: 13188   188.380411/s
     success_rate...................: 100.00% ✓ 13188      ✗ 0    
     vus............................: 56      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

