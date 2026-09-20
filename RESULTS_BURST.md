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
| hive-router | v0.0.84 | 2,724 | 2,869 | 2,680 | 2.5% |  |
| fusion-nightly | 16.7.0-p.8 | 2,572 | 2,676 | 2,550 | 1.6% |  |
| fusion | 16.6.6 | 2,510 | 2,618 | 2,483 | 1.9% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,492 | 2,585 | 2,477 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,420 | 2,502 | 2,399 | 1.4% |  |
| cosmo | 0.334.0 | 1,205 | 1,235 | 1,197 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 564 | 576 | 557 | 1.1% |  |
| hive-gateway | 2.10.8 | 252 | 256 | 249 | 0.8% |  |
| apollo-gateway | 2.14.3 | 231 | 238 | 230 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (8953 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (579294 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,455 | 2,490 | 2,423 | 0.8% |  |
| fusion-nightly | 16.7.0-p.8 | 2,410 | 2,504 | 2,397 | 1.5% |  |
| fusion | 16.6.6 | 2,394 | 2,501 | 2,355 | 2.0% |  |
| hive-router | v0.0.84 | 2,222 | 2,386 | 2,194 | 2.8% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,130 | 2,231 | 2,120 | 1.8% |  |
| cosmo | 0.334.0 | 1,139 | 1,178 | 1,129 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 517 | 532 | 515 | 1.1% |  |
| hive-gateway | 2.10.8 | 245 | 252 | 242 | 1.1% |  |
| apollo-gateway | 2.14.3 | 230 | 234 | 229 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (30229 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (375343 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 501363      ✗ 0     
     data_received..................: 15 GB   239 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=17.54µs  min=861ns   med=2.39µs  max=57.6ms   p(90)=3.96µs   p(95)=5.01µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=14.05µs  min=0s      med=0s      max=57.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=84.56ms  min=1.47ms  med=78.56ms max=258.91ms p(90)=163.58ms p(95)=177.63ms p(99.9)=224.42ms
       { expected_response:true }...: avg=84.56ms  min=1.47ms  med=78.56ms max=258.91ms p(90)=163.58ms p(95)=177.63ms p(99.9)=224.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168121
     http_req_receiving.............: avg=142.71µs min=26.71µs med=51.5µs  max=102.93ms p(90)=140.32µs p(95)=339.47µs p(99.9)=16.57ms 
     http_req_sending...............: avg=65.66µs  min=4.44µs  med=9.37µs  max=69.55ms  p(90)=17.82µs  p(95)=118.43µs p(99.9)=9.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.35ms  min=1.4ms   med=78.38ms max=257.33ms p(90)=163.33ms p(95)=177.25ms p(99.9)=222.73ms
     http_reqs......................: 168121  2724.370887/s
     iteration_duration.............: avg=85.31ms  min=2.29ms  med=79.42ms max=314.21ms p(90)=163.97ms p(95)=178.04ms p(99.9)=225.91ms
     iterations.....................: 167121  2708.166065/s
     success_rate...................: 100.00% ✓ 167121      ✗ 0     
     vus............................: 89      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 478353      ✗ 0     
     data_received..................: 14 GB   226 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=22.53µs min=932ns   med=2.51µs  max=60.57ms  p(90)=4.14µs   p(95)=5.21µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=19.09µs min=0s      med=0s      max=60.5ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=88.63ms min=1.97ms  med=75.73ms max=1.69s    p(90)=170.96ms p(95)=199.44ms p(99.9)=636.05ms
       { expected_response:true }...: avg=88.63ms min=1.97ms  med=75.73ms max=1.69s    p(90)=170.96ms p(95)=199.44ms p(99.9)=636.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160451
     http_req_receiving.............: avg=1.21ms  min=49.89µs med=96.33µs max=569.2ms  p(90)=1.33ms   p(95)=3.71ms   p(99.9)=91.68ms 
     http_req_sending...............: avg=72.14µs min=4.65µs  med=9.29µs  max=233.17ms p(90)=17.34µs  p(95)=112.7µs  p(99.9)=10.44ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.34ms min=1.88ms  med=74.71ms max=1.69s    p(90)=169ms    p(95)=196.61ms p(99.9)=606.6ms 
     http_reqs......................: 160451  2572.545097/s
     iteration_duration.............: avg=89.46ms min=3.15ms  med=76.61ms max=1.69s    p(90)=171.53ms p(95)=200.14ms p(99.9)=636.79ms
     iterations.....................: 159451  2556.511884/s
     success_rate...................: 100.00% ✓ 159451      ✗ 0     
     vus............................: 75      min=0         max=494 
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

     checks.........................: 100.00% ✓ 466377      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=21.41µs min=882ns   med=2.49µs  max=78.67ms  p(90)=4.05µs   p(95)=5.12µs   p(99.9)=2.04ms  
     http_req_connecting............: avg=18.21µs min=0s      med=0s      max=78.51ms  p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=90.89ms min=1.96ms  med=78.4ms  max=1.12s    p(90)=173.93ms p(95)=203.48ms p(99.9)=577.52ms
       { expected_response:true }...: avg=90.89ms min=1.96ms  med=78.4ms  max=1.12s    p(90)=173.93ms p(95)=203.48ms p(99.9)=577.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156459
     http_req_receiving.............: avg=1.42ms  min=52.41µs med=97.96µs max=540.22ms p(90)=1.53ms   p(95)=4.43ms   p(99.9)=102.12ms
     http_req_sending...............: avg=69.15µs min=4.83µs  med=9.59µs  max=77.29ms  p(90)=17.71µs  p(95)=111.36µs p(99.9)=9.93ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.4ms  min=1.84ms  med=77.39ms max=1.12s    p(90)=172.16ms p(95)=200.57ms p(99.9)=561.65ms
     http_reqs......................: 156459  2510.788438/s
     iteration_duration.............: avg=91.74ms min=3.15ms  med=79.28ms max=1.12s    p(90)=174.56ms p(95)=204.29ms p(99.9)=578.11ms
     iterations.....................: 155459  2494.740858/s
     success_rate...................: 100.00% ✓ 155459      ✗ 0     
     vus............................: 71      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 461847      ✗ 0     
     data_received..................: 14 GB   218 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=16.14µs min=851ns   med=2.28µs   max=49.93ms  p(90)=3.8µs    p(95)=4.83µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=13.07µs min=0s      med=0s       max=49.73ms  p(90)=0s       p(95)=0s       p(99.9)=967.72µs
     http_req_duration..............: avg=91.77ms min=1.84ms  med=87.46ms  max=436.77ms p(90)=174.32ms p(95)=190.23ms p(99.9)=269.02ms
       { expected_response:true }...: avg=91.77ms min=1.84ms  med=87.46ms  max=436.77ms p(90)=174.32ms p(95)=190.23ms p(99.9)=269.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154949
     http_req_receiving.............: avg=1.43ms  min=53.65µs med=247.42µs max=314.09ms p(90)=3.42ms   p(95)=5.17ms   p(99.9)=37.1ms  
     http_req_sending...............: avg=59.08µs min=4.41µs  med=8.99µs   max=230.01ms p(90)=17.78µs  p(95)=104.87µs p(99.9)=7.72ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.27ms min=1.77ms  med=85.86ms  max=436.37ms p(90)=172.7ms  p(95)=188.57ms p(99.9)=267.68ms
     http_reqs......................: 154949  2492.014455/s
     iteration_duration.............: avg=92.61ms min=3.77ms  med=88.41ms  max=436.95ms p(90)=174.77ms p(95)=190.71ms p(99.9)=272.37ms
     iterations.....................: 153949  2475.931651/s
     success_rate...................: 100.00% ✓ 153949      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 447243      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=18.51µs min=992ns   med=2.74µs   max=68.47ms  p(90)=4.42µs   p(95)=5.57µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=15.03µs min=0s      med=0s       max=68.4ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=94.79ms min=1.64ms  med=78.87ms  max=1.32s    p(90)=182.49ms p(95)=221.37ms p(99.9)=802.86ms
       { expected_response:true }...: avg=94.79ms min=1.64ms  med=78.87ms  max=1.32s    p(90)=182.49ms p(95)=221.37ms p(99.9)=802.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150081
     http_req_receiving.............: avg=1.61ms  min=51.59µs med=100.62µs max=711.33ms p(90)=1.63ms   p(95)=4.61ms   p(99.9)=112.14ms
     http_req_sending...............: avg=69.77µs min=4.44µs  med=10.07µs  max=285.73ms p(90)=18.59µs  p(95)=114.39µs p(99.9)=9.12ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.1ms  min=1.56ms  med=77.86ms  max=1.32s    p(90)=179.92ms p(95)=216.59ms p(99.9)=742.64ms
     http_reqs......................: 150081  2420.521305/s
     iteration_duration.............: avg=95.68ms min=2.98ms  med=79.8ms   max=1.32s    p(90)=183.12ms p(95)=222.18ms p(99.9)=803.43ms
     iterations.....................: 149081  2404.393205/s
     success_rate...................: 100.00% ✓ 149081      ✗ 0     
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

     checks.........................: 100.00% ✓ 223167      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 91 MB   1.4 MB/s
     http_req_blocked...............: avg=5.1µs    min=992ns   med=2.31µs   max=18.17ms  p(90)=3.94µs   p(95)=4.79µs   p(99.9)=347.98µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=18.11ms  p(90)=0s       p(95)=0s       p(99.9)=313.18µs
     http_req_duration..............: avg=189.27ms min=1.91ms  med=189.79ms max=519ms    p(90)=352.72ms p(95)=378.53ms p(99.9)=456.7ms 
       { expected_response:true }...: avg=189.27ms min=1.91ms  med=189.79ms max=519ms    p(90)=352.72ms p(95)=378.53ms p(99.9)=456.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 75389
     http_req_receiving.............: avg=72.34µs  min=26.97µs med=57.66µs  max=117.06ms p(90)=93.55µs  p(95)=107.28µs p(99.9)=1.13ms  
     http_req_sending...............: avg=26.57µs  min=4.78µs  med=10.29µs  max=116.49ms p(90)=16.5µs   p(95)=20.27µs  p(99.9)=2.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.17ms min=1.85ms  med=189.69ms max=518.95ms p(90)=352.65ms p(95)=378.45ms p(99.9)=456.61ms
     http_reqs......................: 75389   1205.483772/s
     iteration_duration.............: avg=192.04ms min=4.25ms  med=192.75ms max=519.13ms p(90)=353.57ms p(95)=379.17ms p(99.9)=457.05ms
     iterations.....................: 74389   1189.49359/s
     success_rate...................: 100.00% ✓ 74389       ✗ 0    
     vus............................: 81      min=0         max=492
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

     checks.........................: 100.00% ✓ 105798     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   678 kB/s
     http_req_blocked...............: avg=8.14µs   min=1.05µs  med=2.83µs   max=3.69ms   p(90)=4.68µs   p(95)=5.74µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=4.29µs   min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=395.47ms min=3.59ms  med=361.68ms max=1.95s    p(90)=788.35ms p(95)=847.18ms p(99.9)=1.27s   
       { expected_response:true }...: avg=395.47ms min=3.59ms  med=361.68ms max=1.95s    p(90)=788.35ms p(95)=847.18ms p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36266
     http_req_receiving.............: avg=84.15µs  min=28.46µs med=66.27µs  max=189.23ms p(90)=105.25µs p(95)=120.15µs p(99.9)=898.23µs
     http_req_sending...............: avg=31.8µs   min=4.96µs  med=12.79µs  max=105.83ms p(90)=20.43µs  p(95)=23.52µs  p(99.9)=3.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=395.36ms min=3.5ms   med=361.6ms  max=1.95s    p(90)=788.24ms p(95)=847.08ms p(99.9)=1.27s   
     http_reqs......................: 36266   564.640666/s
     iteration_duration.............: avg=406.91ms min=22.85ms med=375.22ms max=1.96s    p(90)=791.4ms  p(95)=849.76ms p(99.9)=1.27s   
     iterations.....................: 35266   549.071244/s
     success_rate...................: 100.00% ✓ 35266      ✗ 0    
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

     checks.........................: 100.00% ✓ 47937      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   304 kB/s
     http_req_blocked...............: avg=13.79µs  min=1.33µs  med=3.68µs   max=3.53ms  p(90)=5.45µs   p(95)=6.85µs   p(99.9)=2.08ms
     http_req_connecting............: avg=8.42µs   min=0s      med=0s       max=3.5ms   p(90)=0s       p(95)=0s       p(99.9)=2.06ms
     http_req_duration..............: avg=841.93ms min=5.74ms  med=719.72ms max=18.95s  p(90)=1.42s    p(95)=1.6s     p(99.9)=17.62s
       { expected_response:true }...: avg=841.93ms min=5.74ms  med=719.72ms max=18.95s  p(90)=1.42s    p(95)=1.6s     p(99.9)=17.62s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16979
     http_req_receiving.............: avg=98.11µs  min=37.47µs med=91.02µs  max=7.11ms  p(90)=127.09µs p(95)=143.64µs p(99.9)=1.16ms
     http_req_sending...............: avg=29.49µs  min=6.88µs  med=18.55µs  max=44.91ms p(90)=24.48µs  p(95)=28.36µs  p(99.9)=2.19ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=841.8ms  min=5.65ms  med=719.6ms  max=18.94s  p(90)=1.42s    p(95)=1.6s     p(99.9)=17.62s
     http_reqs......................: 16979   252.121021/s
     iteration_duration.............: avg=894.66ms min=56.71ms med=768.93ms max=18.95s  p(90)=1.46s    p(95)=1.62s    p(99.9)=17.62s
     iterations.....................: 15979   237.27203/s
     success_rate...................: 100.00% ✓ 15979      ✗ 0    
     vus............................: 68      min=0        max=498
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

     checks.........................: 100.00% ✓ 47664      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=14.55µs  min=1.34µs  med=3.42µs   max=10.28ms  p(90)=5.05µs   p(95)=6.37µs   p(99.9)=2.13ms  
     http_req_connecting............: avg=9.53µs   min=0s      med=0s       max=10.22ms  p(90)=0s       p(95)=0s       p(99.9)=2.11ms  
     http_req_duration..............: avg=415.2ms  min=7.49ms  med=469.06ms max=1.3s     p(90)=732.69ms p(95)=798.25ms p(99.9)=1.1s    
       { expected_response:true }...: avg=415.2ms  min=7.49ms  med=469.06ms max=1.3s     p(90)=732.69ms p(95)=798.25ms p(99.9)=1.1s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 16888
     http_req_receiving.............: avg=92.12µs  min=35.59µs med=81.04µs  max=48.11ms  p(90)=120.74µs p(95)=136.36µs p(99.9)=924.65µs
     http_req_sending...............: avg=40.4µs   min=5.88µs  med=16.24µs  max=141.31ms p(90)=21.79µs  p(95)=25.82µs  p(99.9)=2.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=415.07ms min=7.41ms  med=468.98ms max=1.3s     p(90)=732.58ms p(95)=798.14ms p(99.9)=1.1s    
     http_reqs......................: 16888   231.013053/s
     iteration_duration.............: avg=441.35ms min=8.13ms  med=484.56ms max=1.3s     p(90)=741.71ms p(95)=804.34ms p(99.9)=1.11s   
     iterations.....................: 15888   217.333928/s
     success_rate...................: 100.00% ✓ 15888      ✗ 0    
     vus............................: 57      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 452061      ✗ 0     
     data_received..................: 13 GB   215 MB/s
     data_sent......................: 182 MB  2.9 MB/s
     http_req_blocked...............: avg=23.66µs min=1.03µs  med=3.04µs   max=66.1ms   p(90)=5.02µs   p(95)=6.29µs   p(99.9)=2.5ms   
     http_req_connecting............: avg=19.63µs min=0s      med=0s       max=65.9ms   p(90)=0s       p(95)=0s       p(99.9)=2.28ms  
     http_req_duration..............: avg=93.72ms min=1.44ms  med=87.74ms  max=535.58ms p(90)=180.87ms p(95)=199.95ms p(99.9)=283.68ms
       { expected_response:true }...: avg=93.72ms min=1.44ms  med=87.74ms  max=535.58ms p(90)=180.87ms p(95)=199.95ms p(99.9)=283.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151687
     http_req_receiving.............: avg=1.36ms  min=54.64µs med=131.76µs max=166.08ms p(90)=3.3ms    p(95)=5.14ms   p(99.9)=38.38ms 
     http_req_sending...............: avg=77.91µs min=4.68µs  med=11.01µs  max=89.72ms  p(90)=23.35µs  p(95)=131.25µs p(99.9)=10.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.27ms min=1.35ms  med=86.21ms  max=535.49ms p(90)=179.27ms p(95)=198.36ms p(99.9)=281.65ms
     http_reqs......................: 151687  2455.389014/s
     iteration_duration.............: avg=94.63ms min=3.41ms  med=88.75ms  max=535.76ms p(90)=181.44ms p(95)=200.53ms p(99.9)=287.41ms
     iterations.....................: 150687  2439.201806/s
     success_rate...................: 100.00% ✓ 150687      ✗ 0     
     vus............................: 91      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 444864      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=23.4µs  min=1.01µs  med=2.98µs   max=72.1ms   p(90)=4.87µs   p(95)=6.11µs   p(99.9)=2.47ms  
     http_req_connecting............: avg=19.4µs  min=0s      med=0s       max=64.34ms  p(90)=0s       p(95)=0s       p(99.9)=2.43ms  
     http_req_duration..............: avg=95.27ms min=1.47ms  med=81.32ms  max=1.63s    p(90)=184.22ms p(95)=213.72ms p(99.9)=658.9ms 
       { expected_response:true }...: avg=95.27ms min=1.47ms  med=81.32ms  max=1.63s    p(90)=184.22ms p(95)=213.72ms p(99.9)=658.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149288
     http_req_receiving.............: avg=1.2ms   min=52.57µs med=107.09µs max=543.06ms p(90)=1.44ms   p(95)=3.66ms   p(99.9)=85.5ms  
     http_req_sending...............: avg=78.9µs  min=4.84µs  med=11.13µs  max=115.12ms p(90)=22.17µs  p(95)=125.92µs p(99.9)=11.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.99ms min=1.39ms  med=80.06ms  max=1.63s    p(90)=182.64ms p(95)=211.34ms p(99.9)=652.4ms 
     http_reqs......................: 149288  2410.601061/s
     iteration_duration.............: avg=96.21ms min=2.83ms  med=82.38ms  max=1.63s    p(90)=184.87ms p(95)=214.51ms p(99.9)=659.75ms
     iterations.....................: 148288  2394.453741/s
     success_rate...................: 100.00% ✓ 148288      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 441951      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=16.07µs min=812ns   med=2.28µs   max=85.74ms  p(90)=4.06µs   p(95)=5.24µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=13.13µs min=0s      med=0s       max=85.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=95.96ms min=1.5ms   med=83.49ms  max=1.52s    p(90)=181.05ms p(95)=209.87ms p(99.9)=991.45ms
       { expected_response:true }...: avg=95.96ms min=1.5ms   med=83.49ms  max=1.52s    p(90)=181.05ms p(95)=209.87ms p(99.9)=991.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148317
     http_req_receiving.............: avg=1.48ms  min=51.79µs med=103.69µs max=1.41s    p(90)=1.79ms   p(95)=4.71ms   p(99.9)=87.08ms 
     http_req_sending...............: avg=62.84µs min=4.67µs  med=9.25µs   max=204.13ms p(90)=19.26µs  p(95)=104.53µs p(99.9)=8.24ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.42ms min=1.4ms   med=82.31ms  max=1.33s    p(90)=178.9ms  p(95)=206.77ms p(99.9)=966.85ms
     http_reqs......................: 148317  2394.950581/s
     iteration_duration.............: avg=96.87ms min=3.06ms  med=84.6ms   max=1.52s    p(90)=181.63ms p(95)=210.59ms p(99.9)=999.5ms 
     iterations.....................: 147317  2378.803069/s
     success_rate...................: 100.00% ✓ 147317      ✗ 0     
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

     checks.........................: 100.00% ✓ 410244      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=15.23µs  min=1.08µs  med=3.04µs  max=36.26ms  p(90)=4.84µs   p(95)=6.07µs   p(99.9)=865.34µs
     http_req_connecting............: avg=11.5µs   min=0s      med=0s      max=36.17ms  p(90)=0s       p(95)=0s       p(99.9)=766.88µs
     http_req_duration..............: avg=103.27ms min=1.49ms  med=97.99ms max=333.04ms p(90)=199.5ms  p(95)=216.07ms p(99.9)=263.97ms
       { expected_response:true }...: avg=103.27ms min=1.49ms  med=97.99ms max=333.04ms p(90)=199.5ms  p(95)=216.07ms p(99.9)=263.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137748
     http_req_receiving.............: avg=130.03µs min=27.63µs med=59.16µs max=75.94ms  p(90)=128.48µs p(95)=360.83µs p(99.9)=12.24ms 
     http_req_sending...............: avg=68.54µs  min=4.91µs  med=11.74µs max=147.94ms p(90)=22.15µs  p(95)=131.28µs p(99.9)=8.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.07ms min=1.44ms  med=97.75ms max=328.56ms p(90)=199.24ms p(95)=215.81ms p(99.9)=263.14ms
     http_reqs......................: 137748  2222.216172/s
     iteration_duration.............: avg=104.28ms min=3.97ms  med=99.17ms max=342.16ms p(90)=200.01ms p(95)=216.5ms  p(99.9)=264.43ms
     iterations.....................: 136748  2206.083697/s
     success_rate...................: 100.00% ✓ 136748      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 394659      ✗ 0     
     data_received..................: 12 GB   187 MB/s
     data_sent......................: 159 MB  2.6 MB/s
     http_req_blocked...............: avg=19.15µs  min=902ns   med=2.67µs  max=59.79ms  p(90)=4.59µs   p(95)=5.7µs    p(99.9)=3.34ms  
     http_req_connecting............: avg=15.51µs  min=0s      med=0s      max=59.53ms  p(90)=0s       p(95)=0s       p(99.9)=3.19ms  
     http_req_duration..............: avg=107.43ms min=1.69ms  med=95.16ms max=1.97s    p(90)=199.09ms p(95)=227.77ms p(99.9)=1.26s   
       { expected_response:true }...: avg=107.43ms min=1.69ms  med=95.16ms max=1.97s    p(90)=199.09ms p(95)=227.77ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 132553
     http_req_receiving.............: avg=1.48ms   min=52.41µs med=115.2µs max=1.72s    p(90)=1.81ms   p(95)=4.61ms   p(99.9)=126.13ms
     http_req_sending...............: avg=65.42µs  min=4.74µs  med=10.54µs max=120.74ms p(90)=20.83µs  p(95)=114.66µs p(99.9)=8.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.87ms min=1.61ms  med=93.93ms max=1.92s    p(90)=197.16ms p(95)=224.53ms p(99.9)=1.2s    
     http_reqs......................: 132553  2130.55535/s
     iteration_duration.............: avg=108.51ms min=3.2ms   med=96.44ms max=1.97s    p(90)=199.79ms p(95)=228.5ms  p(99.9)=1.31s   
     iterations.....................: 131553  2114.482117/s
     success_rate...................: 100.00% ✓ 131553      ✗ 0     
     vus............................: 68      min=0         max=496 
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

     checks.........................: 100.00% ✓ 210819      ✗ 0    
     data_received..................: 6.2 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=5.86µs   min=1.01µs  med=2.3µs    max=13.35ms  p(90)=4.05µs   p(95)=5.05µs   p(99.9)=605.48µs
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=13.3ms   p(90)=0s       p(95)=0s       p(99.9)=534µs   
     http_req_duration..............: avg=200.2ms  min=2.02ms  med=198.95ms max=539.2ms  p(90)=371.47ms p(95)=397.92ms p(99.9)=483.79ms
       { expected_response:true }...: avg=200.2ms  min=2.02ms  med=198.95ms max=539.2ms  p(90)=371.47ms p(95)=397.92ms p(99.9)=483.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71273
     http_req_receiving.............: avg=76.62µs  min=27.85µs med=62.19µs  max=177.06ms p(90)=103.44µs p(95)=119.91µs p(99.9)=1.01ms  
     http_req_sending...............: avg=32.82µs  min=5.12µs  med=11.11µs  max=164.18ms p(90)=18.51µs  p(95)=22.3µs   p(99.9)=3.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.1ms  min=1.95ms  med=198.84ms max=539.1ms  p(90)=371.37ms p(95)=397.84ms p(99.9)=483.74ms
     http_reqs......................: 71273   1139.15004/s
     iteration_duration.............: avg=203.31ms min=5.42ms  med=202.24ms max=539.39ms p(90)=372.3ms  p(95)=398.69ms p(99.9)=484.41ms
     iterations.....................: 70273   1123.167129/s
     success_rate...................: 100.00% ✓ 70273       ✗ 0    
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

     checks.........................: 100.00% ✓ 97479      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   621 kB/s
     http_req_blocked...............: avg=9.36µs   min=1.18µs  med=3.4µs    max=11.26ms  p(90)=5.12µs   p(95)=6.17µs   p(99.9)=1.32ms
     http_req_connecting............: avg=4.86µs   min=0s      med=0s       max=11.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.28ms
     http_req_duration..............: avg=428.61ms min=3.87ms  med=396.17ms max=1.97s    p(90)=844.59ms p(95)=919.29ms p(99.9)=1.41s 
       { expected_response:true }...: avg=428.61ms min=3.87ms  med=396.17ms max=1.97s    p(90)=844.59ms p(95)=919.29ms p(99.9)=1.41s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33493
     http_req_receiving.............: avg=113.02µs min=31.75µs med=77.59µs  max=182.86ms p(90)=116.28µs p(95)=131.37µs p(99.9)=1.49ms
     http_req_sending...............: avg=36.46µs  min=5.51µs  med=15.32µs  max=103.95ms p(90)=22.27µs  p(95)=25.52µs  p(99.9)=2.9ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=428.46ms min=3.75ms  med=396.04ms max=1.97s    p(90)=844.48ms p(95)=919.19ms p(99.9)=1.4s  
     http_reqs......................: 33493   517.517136/s
     iteration_duration.............: avg=442.02ms min=36.14ms med=413.86ms max=1.98s    p(90)=847.99ms p(95)=923.91ms p(99.9)=1.41s 
     iterations.....................: 32493   502.065635/s
     success_rate...................: 100.00% ✓ 32493      ✗ 0    
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

     checks.........................: 100.00% ✓ 46692      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=17.23µs  min=1.33µs  med=3.82µs   max=50.61ms p(90)=5.75µs   p(95)=7.58µs   p(99.9)=2.15ms
     http_req_connecting............: avg=8.31µs   min=0s      med=0s       max=3.31ms  p(90)=0s       p(95)=0s       p(99.9)=2.05ms
     http_req_duration..............: avg=879.96ms min=5.8ms   med=802.54ms max=5.1s    p(90)=1.75s    p(95)=2s       p(99.9)=4.06s 
       { expected_response:true }...: avg=879.96ms min=5.8ms   med=802.54ms max=5.1s    p(90)=1.75s    p(95)=2s       p(99.9)=4.06s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16564
     http_req_receiving.............: avg=107.3µs  min=37.36µs med=97.9µs   max=27.08ms p(90)=137.28µs p(95)=152.99µs p(99.9)=1.13ms
     http_req_sending...............: avg=31.05µs  min=6.74µs  med=19.16µs  max=23.96ms p(90)=25.27µs  p(95)=30.26µs  p(99.9)=2.45ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=879.82ms min=5.71ms  med=802.43ms max=5.1s    p(90)=1.75s    p(95)=2s       p(99.9)=4.06s 
     http_reqs......................: 16564   245.166922/s
     iteration_duration.............: avg=936.53ms min=27.5ms  med=873.74ms max=5.11s   p(90)=1.77s    p(95)=2.01s    p(99.9)=4.13s 
     iterations.....................: 15564   230.365731/s
     success_rate...................: 100.00% ✓ 15564      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 44625      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=13.93µs  min=1.07µs  med=3.2µs    max=9.93ms  p(90)=4.92µs   p(95)=6.6µs    p(99.9)=2.05ms  
     http_req_connecting............: avg=9.03µs   min=0s      med=0s       max=9.75ms  p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=915.37ms min=7.86ms  med=830.37ms max=3.23s   p(90)=1.86s    p(95)=1.98s    p(99.9)=2.97s   
       { expected_response:true }...: avg=915.37ms min=7.86ms  med=830.37ms max=3.23s   p(90)=1.86s    p(95)=1.98s    p(99.9)=2.97s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15875
     http_req_receiving.............: avg=98.84µs  min=33.98µs med=87.63µs  max=89.59ms p(90)=126.67µs p(95)=141.38µs p(99.9)=736.18µs
     http_req_sending...............: avg=45.84µs  min=5.32µs  med=16.5µs   max=117.3ms p(90)=22.12µs  p(95)=27.13µs  p(99.9)=4.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=915.23ms min=7.78ms  med=830.29ms max=3.23s   p(90)=1.86s    p(95)=1.98s    p(99.9)=2.97s   
     http_reqs......................: 15875   230.486494/s
     iteration_duration.............: avg=976.84ms min=52.23ms med=914.03ms max=3.23s   p(90)=1.88s    p(95)=1.98s    p(99.9)=2.99s   
     iterations.....................: 14875   215.96766/s
     success_rate...................: 100.00% ✓ 14875      ✗ 0    
     vus............................: 18      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

