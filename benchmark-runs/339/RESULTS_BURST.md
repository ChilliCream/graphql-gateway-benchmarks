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
| hive-router | v0.0.84 | 2,912 | 3,046 | 2,874 | 1.9% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,568 | 2,677 | 2,551 | 1.7% |  |
| fusion-nightly | 16.7.0-p.2 | 2,550 | 2,637 | 2,532 | 1.4% |  |
| fusion | 16.6.4 | 2,478 | 2,620 | 2,457 | 2.6% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,388 | 2,470 | 2,379 | 1.3% |  |
| cosmo | 0.334.0 | 1,240 | 1,276 | 1,231 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 571 | 583 | 569 | 0.8% |  |
| hive-gateway | 2.10.8 | 254 | 264 | 253 | 1.4% |  |
| apollo-gateway | 2.14.3 | 231 | 239 | 230 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (11434 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (512726 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,510 | 2,596 | 2,499 | 1.3% |  |
| hive-router | v0.0.84 | 2,390 | 2,509 | 2,367 | 2.0% |  |
| fusion | 16.6.4 | 2,333 | 2,443 | 2,307 | 2.1% |  |
| fusion-nightly | 16.7.0-p.2 | 2,312 | 2,417 | 2,300 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,247 | 2,338 | 2,238 | 1.6% |  |
| cosmo | 0.334.0 | 1,119 | 1,167 | 1,113 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 547 | 559 | 540 | 1.1% |  |
| hive-gateway | 2.10.8 | 249 | 253 | 246 | 0.9% |  |
| apollo-gateway | 2.14.3 | 228 | 233 | 227 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (17660 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (333526 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 536076      ✗ 0     
     data_received..................: 16 GB   255 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=17.7µs   min=841ns  med=2.09µs  max=49.68ms  p(90)=3.67µs   p(95)=4.81µs   p(99.9)=925.06µs
     http_req_connecting............: avg=14.66µs  min=0s     med=0s      max=49.63ms  p(90)=0s       p(95)=0s       p(99.9)=730.56µs
     http_req_duration..............: avg=79.08ms  min=1.38ms med=74.01ms max=296.19ms p(90)=152.59ms p(95)=166.17ms p(99.9)=215.58ms
       { expected_response:true }...: avg=79.08ms  min=1.38ms med=74.01ms max=296.19ms p(90)=152.59ms p(95)=166.17ms p(99.9)=215.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179692
     http_req_receiving.............: avg=154.14µs min=24.1µs med=48.64µs max=44.61ms  p(90)=141.08µs p(95)=324.07µs p(99.9)=20.61ms 
     http_req_sending...............: avg=72.18µs  min=4.39µs med=8.96µs  max=199.58ms p(90)=17.94µs  p(95)=112µs    p(99.9)=9.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.85ms  min=1.31ms med=73.82ms max=295.91ms p(90)=152.23ms p(95)=165.74ms p(99.9)=214.26ms
     http_reqs......................: 179692  2912.0492/s
     iteration_duration.............: avg=79.77ms  min=1.88ms med=74.76ms max=323.33ms p(90)=153.02ms p(95)=166.6ms  p(99.9)=217.3ms 
     iterations.....................: 178692  2895.843419/s
     success_rate...................: 100.00% ✓ 178692      ✗ 0     
     vus............................: 89      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 476487      ✗ 0     
     data_received..................: 14 GB   225 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=17.99µs  min=992ns   med=2.49µs   max=66.44ms  p(90)=3.97µs   p(95)=4.98µs   p(99.9)=2ms     
     http_req_connecting............: avg=14.67µs  min=0s      med=0s       max=66.37ms  p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=88.95ms  min=1.87ms  med=83.78ms  max=339.43ms p(90)=170.89ms p(95)=188.24ms p(99.9)=247.92ms
       { expected_response:true }...: avg=88.95ms  min=1.87ms  med=83.78ms  max=339.43ms p(90)=170.89ms p(95)=188.24ms p(99.9)=247.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159829
     http_req_receiving.............: avg=644.98µs min=50.98µs med=104.39µs max=58.28ms  p(90)=1.14ms   p(95)=2.06ms   p(99.9)=31.35ms 
     http_req_sending...............: avg=68.47µs  min=4.59µs  med=9.38µs   max=257.34ms p(90)=17.13µs  p(95)=115.81µs p(99.9)=9.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.24ms  min=1.79ms  med=83.04ms  max=338.99ms p(90)=170.04ms p(95)=187.25ms p(99.9)=245.15ms
     http_reqs......................: 159829  2568.069414/s
     iteration_duration.............: avg=89.76ms  min=3.72ms  med=84.64ms  max=348.49ms p(90)=171.36ms p(95)=188.71ms p(99.9)=248.86ms
     iterations.....................: 158829  2552.001808/s
     success_rate...................: 100.00% ✓ 158829      ✗ 0     
     vus............................: 68      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 474549      ✗ 0     
     data_received..................: 14 GB   224 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=21.11µs min=871ns   med=2.38µs  max=67.82ms  p(90)=4.01µs   p(95)=5.07µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=17.86µs min=0s      med=0s      max=67.76ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=89.31ms min=2ms     med=75.41ms max=1.73s    p(90)=170.19ms p(95)=201.82ms p(99.9)=658.8ms 
       { expected_response:true }...: avg=89.31ms min=2ms     med=75.41ms max=1.73s    p(90)=170.19ms p(95)=201.82ms p(99.9)=658.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159183
     http_req_receiving.............: avg=1.38ms  min=51.17µs med=95.79µs max=674.14ms p(90)=1.43ms   p(95)=4.03ms   p(99.9)=138.39ms
     http_req_sending...............: avg=66.35µs min=4.59µs  med=9.25µs  max=57.6ms   p(90)=18.47µs  p(95)=115.57µs p(99.9)=8.93ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.86ms min=1.88ms  med=74.3ms  max=1.73s    p(90)=168.3ms  p(95)=198.55ms p(99.9)=630.77ms
     http_reqs......................: 159183  2550.300733/s
     iteration_duration.............: avg=90.16ms min=3.02ms  med=76.38ms max=1.73s    p(90)=170.84ms p(95)=202.64ms p(99.9)=667.11ms
     iterations.....................: 158183  2534.279545/s
     success_rate...................: 100.00% ✓ 158183      ✗ 0     
     vus............................: 75      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460323      ✗ 0     
     data_received..................: 14 GB   217 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=18.46µs min=932ns   med=2.55µs   max=55.78ms  p(90)=4.02µs   p(95)=5.03µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=15.23µs min=0s      med=0s       max=55.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=92.12ms min=1.94ms  med=81.96ms  max=1.15s    p(90)=176.59ms p(95)=198.87ms p(99.9)=574.56ms
       { expected_response:true }...: avg=92.12ms min=1.94ms  med=81.96ms  max=1.15s    p(90)=176.59ms p(95)=198.87ms p(99.9)=574.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154441
     http_req_receiving.............: avg=1.26ms  min=50.72µs med=101.81µs max=742.68ms p(90)=1.56ms   p(95)=3.95ms   p(99.9)=84.27ms 
     http_req_sending...............: avg=68.43µs min=4.59µs  med=9.59µs   max=166.72ms p(90)=17.41µs  p(95)=113.55µs p(99.9)=9.27ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.79ms min=1.85ms  med=80.69ms  max=1.15s    p(90)=174.86ms p(95)=196.25ms p(99.9)=570.37ms
     http_reqs......................: 154441  2478.071502/s
     iteration_duration.............: avg=92.97ms min=3.04ms  med=82.89ms  max=1.15s    p(90)=177.11ms p(95)=199.51ms p(99.9)=575.22ms
     iterations.....................: 153441  2462.026077/s
     success_rate...................: 100.00% ✓ 153441      ✗ 0     
     vus............................: 72      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441411      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=14.56µs min=891ns   med=2.12µs  max=78.82ms  p(90)=3.6µs    p(95)=4.7µs    p(99.9)=1.67ms  
     http_req_connecting............: avg=11.48µs min=0s      med=0s      max=59.43ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=96.08ms min=1.65ms  med=82.88ms max=1.29s    p(90)=184.02ms p(95)=210.93ms p(99.9)=650.79ms
       { expected_response:true }...: avg=96.08ms min=1.65ms  med=82.88ms max=1.29s    p(90)=184.02ms p(95)=210.93ms p(99.9)=650.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148137
     http_req_receiving.............: avg=1.18ms  min=51.98µs med=98µs    max=457.37ms p(90)=1.5ms    p(95)=3.84ms   p(99.9)=70.25ms 
     http_req_sending...............: avg=60.01µs min=4.53µs  med=9.17µs  max=105.94ms p(90)=17.75µs  p(95)=101.7µs  p(99.9)=7.94ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.84ms min=1.56ms  med=81.8ms  max=1.29s    p(90)=182.55ms p(95)=208.58ms p(99.9)=646.44ms
     http_reqs......................: 148137  2388.799228/s
     iteration_duration.............: avg=97ms    min=2.77ms  med=83.98ms max=1.29s    p(90)=184.57ms p(95)=211.61ms p(99.9)=652.76ms
     iterations.....................: 147137  2372.673619/s
     success_rate...................: 100.00% ✓ 147137      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 229497      ✗ 0    
     data_received..................: 6.8 GB  109 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=5.98µs   min=1.07µs  med=2.69µs   max=14.15ms  p(90)=4.41µs   p(95)=5.38µs   p(99.9)=482.76µs
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=14.08ms  p(90)=0s       p(95)=0s       p(99.9)=412.57µs
     http_req_duration..............: avg=184.11ms min=1.96ms  med=186.06ms max=478.36ms p(90)=341.52ms p(95)=364.71ms p(99.9)=434.73ms
       { expected_response:true }...: avg=184.11ms min=1.96ms  med=186.06ms max=478.36ms p(90)=341.52ms p(95)=364.71ms p(99.9)=434.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77499
     http_req_receiving.............: avg=74.52µs  min=27.77µs med=61.28µs  max=21.33ms  p(90)=98.97µs  p(95)=113.48µs p(99.9)=1.12ms  
     http_req_sending...............: avg=31.15µs  min=4.88µs  med=11.29µs  max=86.7ms   p(90)=18.24µs  p(95)=22.13µs  p(99.9)=3.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.01ms min=1.87ms  med=185.97ms max=478.3ms  p(90)=341.41ms p(95)=364.63ms p(99.9)=434.63ms
     http_reqs......................: 77499   1240.08505/s
     iteration_duration.............: avg=186.75ms min=4.18ms  med=189.04ms max=478.55ms p(90)=342.22ms p(95)=365.32ms p(99.9)=434.96ms
     iterations.....................: 76499   1224.083746/s
     success_rate...................: 100.00% ✓ 76499       ✗ 0    
     vus............................: 79      min=0         max=493
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

     checks.........................: 100.00% ✓ 107145     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   686 kB/s
     http_req_blocked...............: avg=9.05µs   min=1.15µs  med=3.22µs   max=21.92ms  p(90)=5.02µs   p(95)=6.11µs   p(99.9)=1.48ms 
     http_req_connecting............: avg=4.85µs   min=0s      med=0s       max=21.83ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms 
     http_req_duration..............: avg=390.64ms min=3.53ms  med=365.3ms  max=1.55s    p(90)=770.29ms p(95)=836.61ms p(99.9)=1.2s   
       { expected_response:true }...: avg=390.64ms min=3.53ms  med=365.3ms  max=1.55s    p(90)=770.29ms p(95)=836.61ms p(99.9)=1.2s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36715
     http_req_receiving.............: avg=85µs     min=31.7µs  med=71.27µs  max=133.93ms p(90)=110.32µs p(95)=124.74µs p(99.9)=877.6µs
     http_req_sending...............: avg=28.38µs  min=5.34µs  med=14.2µs   max=104.32ms p(90)=21.68µs  p(95)=24.94µs  p(99.9)=2.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=390.52ms min=3.47ms  med=365.22ms max=1.55s    p(90)=770.2ms  p(95)=836.5ms  p(99.9)=1.2s   
     http_reqs......................: 36715   571.779183/s
     iteration_duration.............: avg=401.81ms min=26.14ms med=380.28ms max=1.55s    p(90)=773.53ms p(95)=839.18ms p(99.9)=1.21s  
     iterations.....................: 35715   556.205734/s
     success_rate...................: 100.00% ✓ 35715      ✗ 0    
     vus............................: 67      min=0        max=496
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

     checks.........................: 100.00% ✓ 48258      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=13.58µs  min=1.32µs  med=3.7µs    max=3.8ms    p(90)=5.44µs   p(95)=6.84µs   p(99.9)=2.11ms
     http_req_connecting............: avg=8.21µs   min=0s      med=0s       max=3.76ms   p(90)=0s       p(95)=0s       p(99.9)=2.06ms
     http_req_duration..............: avg=838.54ms min=5.31ms  med=737.22ms max=15.94s   p(90)=1.54s    p(95)=1.7s     p(99.9)=15.04s
       { expected_response:true }...: avg=838.54ms min=5.31ms  med=737.22ms max=15.94s   p(90)=1.54s    p(95)=1.7s     p(99.9)=15.04s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17086
     http_req_receiving.............: avg=111.16µs min=37.19µs med=90.28µs  max=189.11ms p(90)=128.32µs p(95)=144.79µs p(99.9)=1.66ms
     http_req_sending...............: avg=68.77µs  min=5.78µs  med=17.61µs  max=234.43ms p(90)=23.25µs  p(95)=27.63µs  p(99.9)=4.07ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=838.36ms min=5.24ms  med=737.07ms max=15.94s   p(90)=1.54s    p(95)=1.7s     p(99.9)=15.04s
     http_reqs......................: 17086   254.912016/s
     iteration_duration.............: avg=890.78ms min=31.43ms med=795.21ms max=15.94s   p(90)=1.56s    p(95)=1.71s    p(99.9)=15.2s 
     iterations.....................: 16086   239.992666/s
     success_rate...................: 100.00% ✓ 16086      ✗ 0    
     vus............................: 57      min=0        max=499
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

     checks.........................: 100.00% ✓ 47748      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   284 kB/s
     http_req_blocked...............: avg=12.88µs  min=1.13µs  med=3.24µs   max=4.67ms   p(90)=4.88µs   p(95)=6.22µs   p(99.9)=2.14ms  
     http_req_connecting............: avg=8.08µs   min=0s      med=0s       max=4.45ms   p(90)=0s       p(95)=0s       p(99.9)=2.12ms  
     http_req_duration..............: avg=385.16ms min=7.38ms  med=463.03ms max=1.14s    p(90)=631.85ms p(95)=687.94ms p(99.9)=940.85ms
       { expected_response:true }...: avg=385.16ms min=7.38ms  med=463.03ms max=1.14s    p(90)=631.85ms p(95)=687.94ms p(99.9)=940.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16916
     http_req_receiving.............: avg=100.84µs min=31.76µs med=83.46µs  max=66.41ms  p(90)=123.91µs p(95)=139.56µs p(99.9)=1.19ms  
     http_req_sending...............: avg=40.65µs  min=5.92µs  med=16.62µs  max=102.98ms p(90)=22.13µs  p(95)=26.86µs  p(99.9)=2.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=385.02ms min=7.25ms  med=462.93ms max=1.14s    p(90)=631.74ms p(95)=687.81ms p(99.9)=940.73ms
     http_reqs......................: 16916   231.639868/s
     iteration_duration.............: avg=409.36ms min=8.62ms  med=480.65ms max=1.15s    p(90)=638.06ms p(95)=692.42ms p(99.9)=951.68ms
     iterations.....................: 15916   217.946331/s
     success_rate...................: 100.00% ✓ 15916      ✗ 0    
     vus............................: 50      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462186      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=16.52µs  min=862ns  med=2.27µs   max=67.9ms   p(90)=4.1µs    p(95)=5.26µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=13.21µs  min=0s     med=0s       max=67.71ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=91.7ms   min=1.45ms med=86.74ms  max=332.06ms p(90)=175.63ms p(95)=191.78ms p(99.9)=251.34ms
       { expected_response:true }...: avg=91.7ms   min=1.45ms med=86.74ms  max=332.06ms p(90)=175.63ms p(95)=191.78ms p(99.9)=251.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155062
     http_req_receiving.............: avg=639.59µs min=52.5µs med=105.26µs max=223.21ms p(90)=1.22ms   p(95)=2.17ms   p(99.9)=26.67ms 
     http_req_sending...............: avg=63.53µs  min=4.74µs med=9.3µs    max=216.2ms  p(90)=20.25µs  p(95)=109.7µs  p(99.9)=8.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91ms     min=1.32ms med=86.01ms  max=323.85ms p(90)=174.85ms p(95)=190.92ms p(99.9)=249.56ms
     http_reqs......................: 155062  2510.491991/s
     iteration_duration.............: avg=92.54ms  min=3.08ms med=87.73ms  max=341.97ms p(90)=176.06ms p(95)=192.22ms p(99.9)=252.07ms
     iterations.....................: 154062  2494.301745/s
     success_rate...................: 100.00% ✓ 154062      ✗ 0     
     vus............................: 91      min=0         max=499 
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

     checks.........................: 100.00% ✓ 440490      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=23.58µs  min=911ns   med=3.07µs  max=80ms     p(90)=5µs      p(95)=6.33µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=19.4µs   min=0s      med=0s      max=79.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=96.18ms  min=1.47ms  med=91.03ms max=344.07ms p(90)=186.21ms p(95)=203.86ms p(99.9)=274.92ms
       { expected_response:true }...: avg=96.18ms  min=1.47ms  med=91.03ms max=344.07ms p(90)=186.21ms p(95)=203.86ms p(99.9)=274.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147830
     http_req_receiving.............: avg=158.49µs min=25.94µs med=58.01µs max=57.87ms  p(90)=160.5µs  p(95)=387.74µs p(99.9)=17.64ms 
     http_req_sending...............: avg=79.01µs  min=5.24µs  med=11.89µs max=131.08ms p(90)=22.91µs  p(95)=137.34µs p(99.9)=10.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.94ms  min=1.43ms  med=90.82ms max=343.54ms p(90)=185.88ms p(95)=203.49ms p(99.9)=273.05ms
     http_reqs......................: 147830  2390.407181/s
     iteration_duration.............: avg=97.11ms  min=3.45ms  med=92.1ms  max=366.35ms p(90)=186.76ms p(95)=204.44ms p(99.9)=276.45ms
     iterations.....................: 146830  2374.237207/s
     success_rate...................: 100.00% ✓ 146830      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 430434      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=17.66µs min=1.05µs  med=2.83µs   max=133.48ms p(90)=4.51µs   p(95)=5.67µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=13.08µs min=0s      med=0s       max=71.06ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=98.52ms min=1.5ms   med=82.77ms  max=1.4s     p(90)=190.46ms p(95)=219.56ms p(99.9)=698.74ms
       { expected_response:true }...: avg=98.52ms min=1.5ms   med=82.77ms  max=1.4s     p(90)=190.46ms p(95)=219.56ms p(99.9)=698.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144478
     http_req_receiving.............: avg=1.53ms  min=54.11µs med=111.11µs max=852.56ms p(90)=1.85ms   p(95)=4.83ms   p(99.9)=89.64ms 
     http_req_sending...............: avg=70.51µs min=5.07µs  med=10.43µs  max=81.62ms  p(90)=19.13µs  p(95)=115.13µs p(99.9)=9.67ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.92ms min=1.42ms  med=81.32ms  max=1.34s    p(90)=188.16ms p(95)=216.08ms p(99.9)=693.35ms
     http_reqs......................: 144478  2333.54346/s
     iteration_duration.............: avg=99.47ms min=2.67ms  med=83.81ms  max=1.4s     p(90)=191.05ms p(95)=220.22ms p(99.9)=699.59ms
     iterations.....................: 143478  2317.391911/s
     success_rate...................: 100.00% ✓ 143478      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 426702      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=18.8µs   min=922ns   med=2.27µs   max=85.9ms   p(90)=3.89µs   p(95)=5.06µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=15.77µs  min=0s      med=0s       max=85.69ms  p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=99.35ms  min=1.53ms  med=85.53ms  max=1.45s    p(90)=188.97ms p(95)=222.88ms p(99.9)=722.87ms
       { expected_response:true }...: avg=99.35ms  min=1.53ms  med=85.53ms  max=1.45s    p(90)=188.97ms p(95)=222.88ms p(99.9)=722.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143234
     http_req_receiving.............: avg=1.74ms   min=52.99µs med=108.56µs max=1s       p(90)=1.83ms   p(95)=4.79ms   p(99.9)=133.97ms
     http_req_sending...............: avg=63.2µs   min=4.63µs  med=9.39µs   max=115.29ms p(90)=18.71µs  p(95)=102.42µs p(99.9)=8.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.54ms  min=1.45ms  med=84.3ms   max=1.42s    p(90)=186.47ms p(95)=218.32ms p(99.9)=713.85ms
     http_reqs......................: 143234  2312.857898/s
     iteration_duration.............: avg=100.33ms min=3.06ms  med=86.56ms  max=1.45s    p(90)=189.66ms p(95)=223.81ms p(99.9)=724.24ms
     iterations.....................: 142234  2296.710489/s
     success_rate...................: 100.00% ✓ 142234      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 416124      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=18.96µs  min=941ns   med=2.32µs   max=91.48ms  p(90)=4.17µs   p(95)=5.39µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=15.52µs  min=0s      med=0s       max=77.36ms  p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=101.85ms min=1.68ms  med=85.1ms   max=1.65s    p(90)=196.8ms  p(95)=232.9ms  p(99.9)=732.82ms
       { expected_response:true }...: avg=101.85ms min=1.68ms  med=85.1ms   max=1.65s    p(90)=196.8ms  p(95)=232.9ms  p(99.9)=732.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139708
     http_req_receiving.............: avg=1.76ms   min=53.82µs med=107.68µs max=1.17s    p(90)=1.74ms   p(95)=4.68ms   p(99.9)=147.87ms
     http_req_sending...............: avg=64.94µs  min=4.83µs  med=9.93µs   max=182.78ms p(90)=21.3µs   p(95)=106.64µs p(99.9)=8.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.02ms min=1.59ms  med=84.15ms  max=1.62s    p(90)=194.64ms p(95)=227.8ms  p(99.9)=692.76ms
     http_reqs......................: 139708  2247.576971/s
     iteration_duration.............: avg=102.86ms min=3.1ms   med=86.14ms  max=1.65s    p(90)=197.55ms p(95)=233.91ms p(99.9)=733.5ms 
     iterations.....................: 138708  2231.489296/s
     success_rate...................: 100.00% ✓ 138708      ✗ 0     
     vus............................: 64      min=0         max=496 
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

     checks.........................: 100.00% ✓ 207288      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=5.66µs   min=1.01µs  med=2.39µs   max=29.61ms  p(90)=4.14µs   p(95)=5.08µs   p(99.9)=340.05µs
     http_req_connecting............: avg=2.52µs   min=0s      med=0s       max=29.54ms  p(90)=0s       p(95)=0s       p(99.9)=308.75µs
     http_req_duration..............: avg=203.67ms min=2.1ms   med=204.81ms max=620.39ms p(90)=376.79ms p(95)=403.48ms p(99.9)=506.34ms
       { expected_response:true }...: avg=203.67ms min=2.1ms   med=204.81ms max=620.39ms p(90)=376.79ms p(95)=403.48ms p(99.9)=506.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70096
     http_req_receiving.............: avg=79.79µs  min=29.01µs med=65.77µs  max=33.62ms  p(90)=107.01µs p(95)=124.3µs  p(99.9)=1.27ms  
     http_req_sending...............: avg=29.74µs  min=4.91µs  med=11.09µs  max=128.31ms p(90)=18.1µs   p(95)=21.95µs  p(99.9)=3.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.56ms min=2.03ms  med=204.73ms max=620.31ms p(90)=376.71ms p(95)=403.39ms p(99.9)=506.24ms
     http_reqs......................: 70096   1119.10533/s
     iteration_duration.............: avg=206.84ms min=4.28ms  med=208.24ms max=620.57ms p(90)=377.68ms p(95)=404.2ms  p(99.9)=506.61ms
     iterations.....................: 69096   1103.140006/s
     success_rate...................: 100.00% ✓ 69096       ✗ 0    
     vus............................: 86      min=0         max=499
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

     checks.........................: 100.00% ✓ 103140     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 43 MB   657 kB/s
     http_req_blocked...............: avg=8.34µs   min=1.02µs  med=3µs      max=3.45ms  p(90)=4.74µs   p(95)=5.72µs   p(99.9)=1.44ms
     http_req_connecting............: avg=4.24µs   min=0s      med=0s       max=3.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.28ms
     http_req_duration..............: avg=405.63ms min=3.77ms  med=375.91ms max=1.97s   p(90)=799.04ms p(95)=866.06ms p(99.9)=1.36s 
       { expected_response:true }...: avg=405.63ms min=3.77ms  med=375.91ms max=1.97s   p(90)=799.04ms p(95)=866.06ms p(99.9)=1.36s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35380
     http_req_receiving.............: avg=89.78µs  min=28.27µs med=73.34µs  max=179.8ms p(90)=113.72µs p(95)=127.3µs  p(99.9)=1.09ms
     http_req_sending...............: avg=30.07µs  min=4.96µs  med=14.67µs  max=78.86ms p(90)=21.89µs  p(95)=24.8µs   p(99.9)=2.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=405.51ms min=3.66ms  med=375.81ms max=1.97s   p(90)=798.97ms p(95)=865.95ms p(99.9)=1.36s 
     http_reqs......................: 35380   547.09311/s
     iteration_duration.............: avg=417.66ms min=18.47ms med=389.91ms max=1.97s   p(90)=802.69ms p(95)=869.62ms p(99.9)=1.37s 
     iterations.....................: 34380   531.629766/s
     success_rate...................: 100.00% ✓ 34380      ✗ 0    
     vus............................: 88      min=0        max=500
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

     checks.........................: 100.00% ✓ 47493      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=15.69µs  min=1.27µs  med=3.98µs   max=10.9ms  p(90)=6.01µs   p(95)=7.77µs   p(99.9)=2.19ms
     http_req_connecting............: avg=9.86µs   min=0s      med=0s       max=10.83ms p(90)=0s       p(95)=0s       p(99.9)=2.16ms
     http_req_duration..............: avg=864.01ms min=5.69ms  med=772.86ms max=4.65s   p(90)=1.71s    p(95)=1.94s    p(99.9)=3.85s 
       { expected_response:true }...: avg=864.01ms min=5.69ms  med=772.86ms max=4.65s   p(90)=1.71s    p(95)=1.94s    p(99.9)=3.85s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16831
     http_req_receiving.............: avg=105.43µs min=32.3µs  med=97.89µs  max=6.05ms  p(90)=138.24µs p(95)=154.53µs p(99.9)=1.31ms
     http_req_sending...............: avg=38.39µs  min=6.16µs  med=19.7µs   max=80.92ms p(90)=25.64µs  p(95)=30.3µs   p(99.9)=4.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=863.86ms min=5.59ms  med=772.73ms max=4.65s   p(90)=1.71s    p(95)=1.94s    p(99.9)=3.85s 
     http_reqs......................: 16831   249.710728/s
     iteration_duration.............: avg=918.64ms min=39.36ms med=855.12ms max=4.66s   p(90)=1.72s    p(95)=1.95s    p(99.9)=3.89s 
     iterations.....................: 15831   234.87437/s
     success_rate...................: 100.00% ✓ 15831      ✗ 0    
     vus............................: 71      min=0        max=500
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

     checks.........................: 100.00% ✓ 44382      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=14.88µs  min=1.19µs  med=3.59µs   max=9.73ms   p(90)=5.45µs  p(95)=7.44µs   p(99.9)=2.24ms 
     http_req_connecting............: avg=9.46µs   min=0s      med=0s       max=9.66ms   p(90)=0s      p(95)=0s       p(99.9)=2.22ms 
     http_req_duration..............: avg=920.95ms min=8.06ms  med=848.13ms max=3.33s    p(90)=1.89s   p(95)=2.03s    p(99.9)=3.05s  
       { expected_response:true }...: avg=920.95ms min=8.06ms  med=848.13ms max=3.33s    p(90)=1.89s   p(95)=2.03s    p(99.9)=3.05s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15794
     http_req_receiving.............: avg=303.77µs min=34.49µs med=91.53µs  max=216.92ms p(90)=132.1µs p(95)=149.11µs p(99.9)=76.87ms
     http_req_sending...............: avg=31.72µs  min=5.55µs  med=17.84µs  max=22.27ms  p(90)=23.54µs p(95)=28.85µs  p(99.9)=4.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=920.61ms min=7.97ms  med=847.96ms max=3.33s    p(90)=1.89s   p(95)=2.03s    p(99.9)=3.05s  
     http_reqs......................: 15794   228.581637/s
     iteration_duration.............: avg=983.16ms min=17.33ms med=910.14ms max=3.34s    p(90)=1.9s    p(95)=2.04s    p(99.9)=3.06s  
     iterations.....................: 14794   214.108949/s
     success_rate...................: 100.00% ✓ 14794      ✗ 0    
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

