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
| hive-router | v0.0.83 | 2,763 | 2,927 | 2,733 | 2.5% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,554 | 2,628 | 2,515 | 1.4% |  |
| fusion-nightly | 16.5.1-p.2 | 2,470 | 2,574 | 2,456 | 1.6% |  |
| fusion | 16.5.0 | 2,403 | 2,489 | 2,385 | 1.5% |  |
| cosmo | 0.331.1 | 1,240 | 1,278 | 1,233 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.4 | 564 | 577 | 560 | 1.1% |  |
| hive-gateway | 2.10.4 | 252 | 257 | 247 | 1.3% |  |
| apollo-gateway | 2.14.2 | 233 | 237 | 230 | 0.9% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (10979 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| fusion-nightly-fed | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (498962 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,395 | 2,489 | 2,384 | 1.5% |  |
| hive-router | v0.0.83 | 2,378 | 2,526 | 2,363 | 2.4% |  |
| fusion-nightly | 16.5.1-p.2 | 2,266 | 2,363 | 2,255 | 1.7% |  |
| fusion | 16.5.0 | 2,220 | 2,337 | 2,204 | 2.1% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 2,075 | 2,160 | 2,057 | 1.6% |  |
| cosmo | 0.331.1 | 1,115 | 1,158 | 1,106 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.4 | 532 | 547 | 528 | 1.3% |  |
| hive-gateway | 2.10.4 | 247 | 250 | 245 | 0.7% |  |
| apollo-gateway | 2.14.2 | 235 | 238 | 234 | 0.6% |  |
| apollo-router | v2.16.0 | — | — | — | — | non-compatible response (18802 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (518895 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 508437      ✗ 0     
     data_received..................: 15 GB   242 MB/s
     data_sent......................: 205 MB  3.3 MB/s
     http_req_blocked...............: avg=14.19µs min=912ns   med=2.03µs  max=54.12ms  p(90)=3.43µs   p(95)=4.47µs   p(99.9)=1ms     
     http_req_connecting............: avg=11.51µs min=0s      med=0s      max=54.07ms  p(90)=0s       p(95)=0s       p(99.9)=955.28µs
     http_req_duration..............: avg=83.4ms  min=1.39ms  med=78.58ms max=312.68ms p(90)=160.36ms p(95)=173.06ms p(99.9)=221.55ms
       { expected_response:true }...: avg=83.4ms  min=1.39ms  med=78.58ms max=312.68ms p(90)=160.36ms p(95)=173.06ms p(99.9)=221.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 170479
     http_req_receiving.............: avg=127.9µs min=25.88µs med=48.84µs max=67.9ms   p(90)=117.65µs p(95)=308.34µs p(99.9)=15.01ms 
     http_req_sending...............: avg=61.74µs min=4.24µs  med=8.9µs   max=191.8ms  p(90)=16.38µs  p(95)=104.92µs p(99.9)=7.85ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.21ms min=1.34ms  med=78.38ms max=312.11ms p(90)=160.13ms p(95)=172.77ms p(99.9)=220.02ms
     http_reqs......................: 170479  2763.330596/s
     iteration_duration.............: avg=84.12ms min=2.05ms  med=79.38ms max=344.16ms p(90)=160.77ms p(95)=173.41ms p(99.9)=222.5ms 
     iterations.....................: 169479  2747.121382/s
     success_rate...................: 100.00% ✓ 169479      ✗ 0     
     vus............................: 87      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 474216      ✗ 0     
     data_received..................: 14 GB   224 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=13.19µs  min=882ns   med=2.07µs   max=36.62ms  p(90)=3.51µs   p(95)=4.58µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=10.45µs  min=0s      med=0s       max=36.57ms  p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=89.39ms  min=1.9ms   med=85.3ms   max=335.31ms p(90)=171.21ms p(95)=186.15ms p(99.9)=236.44ms
       { expected_response:true }...: avg=89.39ms  min=1.9ms   med=85.3ms   max=335.31ms p(90)=171.21ms p(95)=186.15ms p(99.9)=236.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159072
     http_req_receiving.............: avg=698.26µs min=50.23µs med=115.24µs max=98.85ms  p(90)=1.45ms   p(95)=2.32ms   p(99.9)=24.21ms 
     http_req_sending...............: avg=62.3µs   min=4.56µs  med=8.71µs   max=304.72ms p(90)=17.28µs  p(95)=105.06µs p(99.9)=7.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.63ms  min=1.82ms  med=84.51ms  max=331.2ms  p(90)=170.49ms p(95)=185.38ms p(99.9)=235.36ms
     http_reqs......................: 159072  2554.651857/s
     iteration_duration.............: avg=90.19ms  min=3.96ms  med=86.2ms   max=350.19ms p(90)=171.64ms p(95)=186.55ms p(99.9)=237.6ms 
     iterations.....................: 158072  2538.592137/s
     success_rate...................: 100.00% ✓ 158072      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458874      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=14.84µs min=872ns   med=2.08µs  max=61.47ms  p(90)=3.6µs    p(95)=4.78µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=11.77µs min=0s      med=0s      max=61.41ms  p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=92.35ms min=1.99ms  med=82.21ms max=1.19s    p(90)=173.31ms p(95)=197.92ms p(99.9)=679.96ms
       { expected_response:true }...: avg=92.35ms min=1.99ms  med=82.21ms max=1.19s    p(90)=173.31ms p(95)=197.92ms p(99.9)=679.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153958
     http_req_receiving.............: avg=1.29ms  min=51.25µs med=96.52µs max=725.14ms p(90)=1.64ms   p(95)=4.37ms   p(99.9)=87.26ms 
     http_req_sending...............: avg=59.39µs min=4.63µs  med=8.79µs  max=186.64ms p(90)=16.7µs   p(95)=96.6µs   p(99.9)=7.91ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.99ms min=1.91ms  med=81.04ms max=1.19s    p(90)=171.55ms p(95)=195.37ms p(99.9)=675.28ms
     http_reqs......................: 153958  2470.648247/s
     iteration_duration.............: avg=93.23ms min=3.28ms  med=83.23ms max=1.19s    p(90)=174.03ms p(95)=198.99ms p(99.9)=680.28ms
     iterations.....................: 152958  2454.6007/s
     success_rate...................: 100.00% ✓ 152958      ✗ 0     
     vus............................: 72      min=0         max=495 
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

     checks.........................: 100.00% ✓ 445770      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=16.98µs min=1.05µs med=2.58µs   max=81.67ms  p(90)=4.07µs   p(95)=5.13µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=13.56µs min=0s     med=0s       max=81.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.56ms  
     http_req_duration..............: avg=95.15ms min=1.95ms med=83.35ms  max=1.43s    p(90)=179.67ms p(95)=203.97ms p(99.9)=718.93ms
       { expected_response:true }...: avg=95.15ms min=1.95ms med=83.35ms  max=1.43s    p(90)=179.67ms p(95)=203.97ms p(99.9)=718.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149590
     http_req_receiving.............: avg=1.49ms  min=52.1µs med=102.99µs max=684.98ms p(90)=1.85ms   p(95)=4.73ms   p(99.9)=94.05ms 
     http_req_sending...............: avg=63.97µs min=4.35µs med=9.56µs   max=222.3ms  p(90)=17.17µs  p(95)=109.77µs p(99.9)=8.36ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.59ms min=1.84ms med=82.14ms  max=1.37s    p(90)=177.65ms p(95)=201.06ms p(99.9)=690.46ms
     http_reqs......................: 149590  2403.143267/s
     iteration_duration.............: avg=96.02ms min=3.39ms med=84.45ms  max=1.43s    p(90)=180.21ms p(95)=204.54ms p(99.9)=720.73ms
     iterations.....................: 148590  2387.078401/s
     success_rate...................: 100.00% ✓ 148590      ✗ 0     
     vus............................: 69      min=0         max=495 
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

     checks.........................: 100.00% ✓ 229629      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=5.22µs   min=1µs     med=2.15µs   max=17.42ms  p(90)=3.8µs    p(95)=4.72µs   p(99.9)=470.79µs
     http_req_connecting............: avg=2.41µs   min=0s      med=0s       max=17.21ms  p(90)=0s       p(95)=0s       p(99.9)=394.98µs
     http_req_duration..............: avg=183.99ms min=1.93ms  med=187.15ms max=571.34ms p(90)=339.13ms p(95)=364.42ms p(99.9)=503.33ms
       { expected_response:true }...: avg=183.99ms min=1.93ms  med=187.15ms max=571.34ms p(90)=339.13ms p(95)=364.42ms p(99.9)=503.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77543
     http_req_receiving.............: avg=73.04µs  min=27.43µs med=57.83µs  max=130.06ms p(90)=95.07µs  p(95)=109.54µs p(99.9)=1.24ms  
     http_req_sending...............: avg=27.93µs  min=4.82µs  med=10.04µs  max=158.11ms p(90)=16.95µs  p(95)=20.89µs  p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.89ms min=1.83ms  med=187.02ms max=571.3ms  p(90)=339.04ms p(95)=364.31ms p(99.9)=503.27ms
     http_reqs......................: 77543   1240.31861/s
     iteration_duration.............: avg=186.63ms min=3.39ms  med=190.15ms max=574.58ms p(90)=339.84ms p(95)=365.02ms p(99.9)=503.63ms
     iterations.....................: 76543   1224.323374/s
     success_rate...................: 100.00% ✓ 76543       ✗ 0    
     vus............................: 81      min=0         max=494
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

     checks.........................: 100.00% ✓ 105813     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   678 kB/s
     http_req_blocked...............: avg=14.89µs  min=1.16µs  med=2.98µs   max=21.7ms  p(90)=4.75µs   p(95)=5.79µs   p(99.9)=5.31ms  
     http_req_connecting............: avg=10.84µs  min=0s      med=0s       max=21.62ms p(90)=0s       p(95)=0s       p(99.9)=5.05ms  
     http_req_duration..............: avg=395.53ms min=3.54ms  med=366.35ms max=1.55s   p(90)=779.18ms p(95)=848.75ms p(99.9)=1.25s   
       { expected_response:true }...: avg=395.53ms min=3.54ms  med=366.35ms max=1.55s   p(90)=779.18ms p(95)=848.75ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36271
     http_req_receiving.............: avg=82.62µs  min=29.78µs med=66.89µs  max=69.12ms p(90)=105.81µs p(95)=120.5µs  p(99.9)=838.78µs
     http_req_sending...............: avg=29.37µs  min=5.28µs  med=13.21µs  max=79.93ms p(90)=20.7µs   p(95)=23.87µs  p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=395.41ms min=3.49ms  med=366.25ms max=1.55s   p(90)=779.06ms p(95)=848.67ms p(99.9)=1.25s   
     http_reqs......................: 36271   564.30514/s
     iteration_duration.............: avg=406.97ms min=20.75ms med=379.28ms max=1.55s   p(90)=782.9ms  p(95)=851.43ms p(99.9)=1.26s   
     iterations.....................: 35271   548.747114/s
     success_rate...................: 100.00% ✓ 35271      ✗ 0    
     vus............................: 70      min=0        max=496
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

     checks.........................: 100.00% ✓ 48141      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   304 kB/s
     http_req_blocked...............: avg=14.15µs  min=1.1µs   med=3.14µs   max=11.68ms p(90)=4.84µs   p(95)=6.25µs   p(99.9)=2.17ms 
     http_req_connecting............: avg=9.47µs   min=0s      med=0s       max=11.63ms p(90)=0s       p(95)=0s       p(99.9)=2.15ms 
     http_req_duration..............: avg=838.74ms min=5.58ms  med=750.39ms max=17.64s  p(90)=1.49s    p(95)=1.7s     p(99.9)=16.46s 
       { expected_response:true }...: avg=838.74ms min=5.58ms  med=750.39ms max=17.64s  p(90)=1.49s    p(95)=1.7s     p(99.9)=16.46s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17047
     http_req_receiving.............: avg=128.69µs min=32.59µs med=84.16µs  max=46.28ms p(90)=121.52µs p(95)=136.89µs p(99.9)=15.05ms
     http_req_sending...............: avg=34.05µs  min=5.51µs  med=16.07µs  max=60.96ms p(90)=21.81µs  p(95)=25.97µs  p(99.9)=3.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=838.58ms min=5.49ms  med=750.29ms max=17.64s  p(90)=1.49s    p(95)=1.7s     p(99.9)=16.46s 
     http_reqs......................: 17047   252.421212/s
     iteration_duration.............: avg=891.03ms min=32.88ms med=812.27ms max=17.64s  p(90)=1.52s    p(95)=1.71s    p(99.9)=16.51s 
     iterations.....................: 16047   237.613843/s
     success_rate...................: 100.00% ✓ 16047      ✗ 0    
     vus............................: 72      min=0        max=499
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

     checks.........................: 100.00% ✓ 48144      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   286 kB/s
     http_req_blocked...............: avg=13.15µs  min=1.13µs  med=3.01µs   max=4.64ms  p(90)=4.58µs   p(95)=5.92µs   p(99.9)=2.01ms  
     http_req_connecting............: avg=8.58µs   min=0s      med=0s       max=4.51ms  p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=368.14ms min=7.36ms  med=384.77ms max=1.18s   p(90)=657.13ms p(95)=709.28ms p(99.9)=1.02s   
       { expected_response:true }...: avg=368.14ms min=7.36ms  med=384.77ms max=1.18s   p(90)=657.13ms p(95)=709.28ms p(99.9)=1.02s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 17048
     http_req_receiving.............: avg=87.45µs  min=28.32µs med=80.66µs  max=23.59ms p(90)=119.53µs p(95)=134.28µs p(99.9)=788.96µs
     http_req_sending...............: avg=26.94µs  min=5.53µs  med=15.14µs  max=52.13ms p(90)=20.42µs  p(95)=25.05µs  p(99.9)=2.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=368.02ms min=7.26ms  med=384.68ms max=1.18s   p(90)=657.02ms p(95)=709.17ms p(99.9)=1.02s   
     http_reqs......................: 17048   233.437734/s
     iteration_duration.............: avg=391.11ms min=7.55ms  med=403.17ms max=1.18s   p(90)=663.27ms p(95)=713.57ms p(99.9)=1.03s   
     iterations.....................: 16048   219.744765/s
     success_rate...................: 100.00% ✓ 16048      ✗ 0    
     vus............................: 57      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441447      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=15.98µs  min=871ns   med=2.38µs   max=54.72ms  p(90)=4.24µs   p(95)=5.39µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=12.66µs  min=0s      med=0s       max=54.64ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=96.01ms  min=1.47ms  med=91.45ms  max=367.64ms p(90)=182.14ms p(95)=197.33ms p(99.9)=262.81ms
       { expected_response:true }...: avg=96.01ms  min=1.47ms  med=91.45ms  max=367.64ms p(90)=182.14ms p(95)=197.33ms p(99.9)=262.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148149
     http_req_receiving.............: avg=750.56µs min=50.28µs med=116.89µs max=220.34ms p(90)=1.6ms    p(95)=2.54ms   p(99.9)=26.51ms 
     http_req_sending...............: avg=66.87µs  min=4.89µs  med=9.68µs   max=243.56ms p(90)=21.31µs  p(95)=111.21µs p(99.9)=8.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.19ms  min=1.37ms  med=90.65ms  max=367.54ms p(90)=181.34ms p(95)=196.41ms p(99.9)=260.54ms
     http_reqs......................: 148149  2395.861292/s
     iteration_duration.............: avg=96.91ms  min=3.27ms  med=92.42ms  max=367.85ms p(90)=182.61ms p(95)=197.78ms p(99.9)=263.93ms
     iterations.....................: 147149  2379.689321/s
     success_rate...................: 100.00% ✓ 147149      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 439011      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=14.95µs  min=881ns   med=2.55µs  max=58.97ms  p(90)=4.66µs   p(95)=5.93µs   p(99.9)=875.51µs
     http_req_connecting............: avg=11.53µs  min=0s      med=0s      max=58.89ms  p(90)=0s       p(95)=0s       p(99.9)=732.98µs
     http_req_duration..............: avg=96.54ms  min=1.55ms  med=91.5ms  max=300.78ms p(90)=187.53ms p(95)=201.81ms p(99.9)=247.25ms
       { expected_response:true }...: avg=96.54ms  min=1.55ms  med=91.5ms  max=300.78ms p(90)=187.53ms p(95)=201.81ms p(99.9)=247.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147337
     http_req_receiving.............: avg=120.79µs min=26.31µs med=56.21µs max=37.55ms  p(90)=134.7µs  p(95)=339.08µs p(99.9)=9.05ms  
     http_req_sending...............: avg=65.28µs  min=4.68µs  med=10.63µs max=113.84ms p(90)=21.77µs  p(95)=120.81µs p(99.9)=8.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.35ms  min=1.5ms   med=91.32ms max=300.16ms p(90)=187.33ms p(95)=201.58ms p(99.9)=246.35ms
     http_reqs......................: 147337  2378.830355/s
     iteration_duration.............: avg=97.44ms  min=4.42ms  med=92.62ms max=327.47ms p(90)=187.97ms p(95)=202.24ms p(99.9)=247.94ms
     iterations.....................: 146337  2362.684849/s
     success_rate...................: 100.00% ✓ 146337      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 417843      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=19.23µs  min=912ns   med=2.79µs   max=82.94ms  p(90)=4.49µs   p(95)=5.69µs   p(99.9)=2.24ms  
     http_req_connecting............: avg=15.61µs  min=0s      med=0s       max=82.88ms  p(90)=0s       p(95)=0s       p(99.9)=2.15ms  
     http_req_duration..............: avg=101.46ms min=1.54ms  med=87.6ms   max=1.37s    p(90)=190.96ms p(95)=221.7ms  p(99.9)=739.28ms
       { expected_response:true }...: avg=101.46ms min=1.54ms  med=87.6ms   max=1.37s    p(90)=190.96ms p(95)=221.7ms  p(99.9)=739.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140281
     http_req_receiving.............: avg=1.59ms   min=53.87µs med=110.63µs max=640.65ms p(90)=1.91ms   p(95)=4.98ms   p(99.9)=102.93ms
     http_req_sending...............: avg=69.37µs  min=5.05µs  med=10.33µs  max=144.19ms p(90)=19.35µs  p(95)=121.42µs p(99.9)=9.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.8ms   min=1.47ms  med=86.35ms  max=1.37s    p(90)=188.84ms p(95)=218.34ms p(99.9)=723.98ms
     http_reqs......................: 140281  2266.395717/s
     iteration_duration.............: avg=102.45ms min=2.42ms  med=88.65ms  max=1.37s    p(90)=191.62ms p(95)=222.29ms p(99.9)=740.69ms
     iterations.....................: 139281  2250.239604/s
     success_rate...................: 100.00% ✓ 139281      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 409782      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=13.82µs  min=921ns   med=2.29µs   max=56.87ms  p(90)=3.98µs   p(95)=5.12µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=10.83µs  min=0s      med=0s       max=56.8ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=103.44ms min=1.57ms  med=92.43ms  max=1.3s     p(90)=196.02ms p(95)=223.19ms p(99.9)=800.05ms
       { expected_response:true }...: avg=103.44ms min=1.57ms  med=92.43ms  max=1.3s     p(90)=196.02ms p(95)=223.19ms p(99.9)=800.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137594
     http_req_receiving.............: avg=1.31ms   min=53.33µs med=108.88µs max=798.3ms  p(90)=1.76ms   p(95)=4.14ms   p(99.9)=75.68ms 
     http_req_sending...............: avg=56.96µs  min=4.77µs  med=9.58µs   max=162.96ms p(90)=19.03µs  p(95)=101.97µs p(99.9)=7.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.07ms min=1.49ms  med=91.25ms  max=1.3s     p(90)=194.39ms p(95)=221.01ms p(99.9)=785.27ms
     http_reqs......................: 137594  2220.387313/s
     iteration_duration.............: avg=104.45ms min=3.03ms  med=93.46ms  max=1.3s     p(90)=196.6ms  p(95)=223.83ms p(99.9)=802.06ms
     iterations.....................: 136594  2204.250074/s
     success_rate...................: 100.00% ✓ 136594      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 384777      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=9.89µs   min=852ns   med=2.28µs  max=54.67ms  p(90)=4.04µs   p(95)=5.18µs   p(99.9)=849.13µs
     http_req_connecting............: avg=6.94µs   min=0s      med=0s      max=54.6ms   p(90)=0s       p(95)=0s       p(99.9)=772.24µs
     http_req_duration..............: avg=110.19ms min=1.74ms  med=96.06ms max=2.27s    p(90)=206.12ms p(95)=239.43ms p(99.9)=1.01s   
       { expected_response:true }...: avg=110.19ms min=1.74ms  med=96.06ms max=2.27s    p(90)=206.12ms p(95)=239.43ms p(99.9)=1.01s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 129259
     http_req_receiving.............: avg=2.01ms   min=52.34µs med=113.6µs max=910.32ms p(90)=2.16ms   p(95)=5.46ms   p(99.9)=184.06ms
     http_req_sending...............: avg=48.14µs  min=4.64µs  med=9.44µs  max=119.08ms p(90)=17.65µs  p(95)=75.42µs  p(99.9)=6.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.13ms min=1.66ms  med=94.85ms max=2.27s    p(90)=203.67ms p(95)=234.54ms p(99.9)=978.31ms
     http_reqs......................: 129259  2075.892451/s
     iteration_duration.............: avg=111.3ms  min=3.59ms  med=97.21ms max=2.27s    p(90)=206.69ms p(95)=240.37ms p(99.9)=1.01s   
     iterations.....................: 128259  2059.832506/s
     success_rate...................: 100.00% ✓ 128259      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 206511      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=4.86µs   min=1.02µs  med=2.3µs    max=11.71ms  p(90)=3.99µs   p(95)=4.97µs   p(99.9)=373.11µs
     http_req_connecting............: avg=1.83µs   min=0s      med=0s       max=11.66ms  p(90)=0s       p(95)=0s       p(99.9)=325.05µs
     http_req_duration..............: avg=204.37ms min=2ms     med=204.12ms max=670.56ms p(90)=377.11ms p(95)=405.44ms p(99.9)=532.74ms
       { expected_response:true }...: avg=204.37ms min=2ms     med=204.12ms max=670.56ms p(90)=377.11ms p(95)=405.44ms p(99.9)=532.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69837
     http_req_receiving.............: avg=77.54µs  min=27.16µs med=65.62µs  max=21.72ms  p(90)=106.68µs p(95)=122.8µs  p(99.9)=957.73µs
     http_req_sending...............: avg=27.22µs  min=5.08µs  med=11.05µs  max=151.72ms p(90)=18.47µs  p(95)=22.22µs  p(99.9)=2.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.26ms min=1.9ms   med=204ms    max=670.47ms p(90)=376.99ms p(95)=405.35ms p(99.9)=532.67ms
     http_reqs......................: 69837   1115.43562/s
     iteration_duration.............: avg=207.57ms min=4.02ms  med=207.77ms max=670.77ms p(90)=378.06ms p(95)=406.15ms p(99.9)=533.13ms
     iterations.....................: 68837   1099.463633/s
     success_rate...................: 100.00% ✓ 68837       ✗ 0    
     vus............................: 84      min=0         max=496
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

     checks.........................: 100.00% ✓ 100446     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   639 kB/s
     http_req_blocked...............: avg=8.8µs    min=1.23µs  med=3.43µs   max=8.82ms   p(90)=5.29µs   p(95)=6.33µs   p(99.9)=806.88µs
     http_req_connecting............: avg=4.32µs   min=0s      med=0s       max=8.77ms   p(90)=0s       p(95)=0s       p(99.9)=786.11µs
     http_req_duration..............: avg=416.13ms min=3.67ms  med=384.97ms max=1.68s    p(90)=822.15ms p(95)=892.12ms p(99.9)=1.32s   
       { expected_response:true }...: avg=416.13ms min=3.67ms  med=384.97ms max=1.68s    p(90)=822.15ms p(95)=892.12ms p(99.9)=1.32s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34482
     http_req_receiving.............: avg=246.18µs min=29.76µs med=76.77µs  max=247.57ms p(90)=116.65µs p(95)=132.4µs  p(99.9)=41.39ms 
     http_req_sending...............: avg=26.63µs  min=5.64µs  med=15.39µs  max=16.17ms  p(90)=22.74µs  p(95)=25.83µs  p(99.9)=2.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=415.86ms min=3.56ms  med=384.88ms max=1.68s    p(90)=822.02ms p(95)=892ms    p(99.9)=1.32s   
     http_reqs......................: 34482   532.59284/s
     iteration_duration.............: avg=428.79ms min=6.93ms  med=401.55ms max=1.68s    p(90)=825.34ms p(95)=896.11ms p(99.9)=1.32s   
     iterations.....................: 33482   517.147308/s
     success_rate...................: 100.00% ✓ 33482      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 47142      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   297 kB/s
     http_req_blocked...............: avg=14.6µs   min=1.19µs  med=3.32µs   max=6.37ms  p(90)=5.16µs  p(95)=6.86µs   p(99.9)=2.08ms
     http_req_connecting............: avg=9.56µs   min=0s      med=0s       max=6.31ms  p(90)=0s      p(95)=0s       p(99.9)=2.06ms
     http_req_duration..............: avg=871.02ms min=5.79ms  med=770.8ms  max=4.67s   p(90)=1.73s   p(95)=1.98s    p(99.9)=3.98s 
       { expected_response:true }...: avg=871.02ms min=5.79ms  med=770.8ms  max=4.67s   p(90)=1.73s   p(95)=1.98s    p(99.9)=3.98s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16714
     http_req_receiving.............: avg=104.11µs min=36.82µs med=96.27µs  max=25.37ms p(90)=135.1µs p(95)=151.12µs p(99.9)=1.11ms
     http_req_sending...............: avg=37.72µs  min=5.7µs   med=18.14µs  max=69.35ms p(90)=23.93µs p(95)=29.05µs  p(99.9)=3.64ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=870.88ms min=5.71ms  med=770.71ms max=4.67s   p(90)=1.73s   p(95)=1.98s    p(99.9)=3.98s 
     http_reqs......................: 16714   247.190189/s
     iteration_duration.............: avg=926.5ms  min=52.18ms med=852.06ms max=4.67s   p(90)=1.75s   p(95)=2s       p(99.9)=4.01s 
     iterations.....................: 15714   232.40078/s
     success_rate...................: 100.00% ✓ 15714      ✗ 0    
     vus............................: 81      min=0        max=500
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

     checks.........................: 100.00% ✓ 45543      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   283 kB/s
     http_req_blocked...............: avg=13.48µs  min=1.03µs  med=3.16µs   max=3.72ms  p(90)=4.91µs   p(95)=6.53µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=8.62µs   min=0s      med=0s       max=3.68ms  p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=898.29ms min=7.57ms  med=820.85ms max=3.23s   p(90)=1.83s    p(95)=1.98s    p(99.9)=2.79s   
       { expected_response:true }...: avg=898.29ms min=7.57ms  med=820.85ms max=3.23s   p(90)=1.83s    p(95)=1.98s    p(99.9)=2.79s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16181
     http_req_receiving.............: avg=98.31µs  min=33.96µs med=90.95µs  max=17.71ms p(90)=127.89µs p(95)=142.28µs p(99.9)=884.02µs
     http_req_sending...............: avg=30.19µs  min=5.51µs  med=17.48µs  max=29.63ms p(90)=23.11µs  p(95)=28.17µs  p(99.9)=3.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=898.16ms min=7.46ms  med=820.74ms max=3.23s   p(90)=1.83s    p(95)=1.98s    p(99.9)=2.79s   
     http_reqs......................: 16181   235.776039/s
     iteration_duration.............: avg=957.38ms min=78.75ms med=891.18ms max=3.23s   p(90)=1.84s    p(95)=1.99s    p(99.9)=2.81s   
     iterations.....................: 15181   221.204873/s
     success_rate...................: 100.00% ✓ 15181      ✗ 0    
     vus............................: 86      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

