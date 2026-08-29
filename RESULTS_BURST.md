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
| hive-router | v0.0.84 | 2,926 | 3,051 | 2,902 | 1.8% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,635 | 2,713 | 2,574 | 1.7% |  |
| fusion-nightly | 16.7.0-p.1 | 2,546 | 2,640 | 2,526 | 1.5% |  |
| fusion | 16.6.2 | 2,537 | 2,632 | 2,514 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,306 | 2,399 | 2,296 | 1.5% |  |
| cosmo | 0.334.0 | 1,214 | 1,248 | 1,196 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 574 | 584 | 571 | 0.7% |  |
| hive-gateway | 2.10.8 | 253 | 259 | 251 | 0.9% |  |
| apollo-gateway | 2.14.3 | 233 | 240 | 232 | 1.3% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (14806 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (563123 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,501 | 2,589 | 2,484 | 1.4% |  |
| fusion | 16.6.2 | 2,398 | 2,489 | 2,395 | 1.3% |  |
| hive-router | v0.0.84 | 2,385 | 2,514 | 2,368 | 2.2% |  |
| fusion-nightly | 16.7.0-p.1 | 2,337 | 2,433 | 2,322 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,228 | 2,316 | 2,225 | 1.4% |  |
| cosmo | 0.334.0 | 1,125 | 1,172 | 1,118 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 533 | 546 | 531 | 0.9% |  |
| hive-gateway | 2.10.8 | 250 | 255 | 249 | 0.9% |  |
| apollo-gateway | 2.14.3 | 235 | 238 | 234 | 0.5% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (35874 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (387052 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 538431      ✗ 0     
     data_received..................: 16 GB   257 MB/s
     data_sent......................: 217 MB  3.5 MB/s
     http_req_blocked...............: avg=19.45µs  min=881ns   med=2.14µs  max=63.18ms  p(90)=3.68µs   p(95)=4.87µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=16.41µs  min=0s      med=0s      max=63.09ms  p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=78.73ms  min=1.39ms  med=73.75ms max=298.42ms p(90)=150.39ms p(95)=164.82ms p(99.9)=217.54ms
       { expected_response:true }...: avg=78.73ms  min=1.39ms  med=73.75ms max=298.42ms p(90)=150.39ms p(95)=164.82ms p(99.9)=217.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180477
     http_req_receiving.............: avg=133.99µs min=25.34µs med=48.95µs max=116.43ms p(90)=140.94µs p(95)=323.63µs p(99.9)=16ms    
     http_req_sending...............: avg=68.15µs  min=4.67µs  med=9.19µs  max=147.46ms p(90)=17.94µs  p(95)=112.99µs p(99.9)=8.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.53ms  min=1.34ms  med=73.57ms max=297.73ms p(90)=150.12ms p(95)=164.54ms p(99.9)=216.41ms
     http_reqs......................: 180477  2926.810147/s
     iteration_duration.............: avg=79.42ms  min=2.68ms  med=74.46ms max=331.13ms p(90)=150.8ms  p(95)=165.36ms p(99.9)=218.46ms
     iterations.....................: 179477  2910.593066/s
     success_rate...................: 100.00% ✓ 179477      ✗ 0     
     vus............................: 87      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 488604      ✗ 0     
     data_received..................: 14 GB   231 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=15.73µs  min=851ns   med=2.09µs  max=50.05ms  p(90)=3.55µs   p(95)=4.64µs   p(99.9)=1.18ms  
     http_req_connecting............: avg=12.94µs  min=0s      med=0s      max=49.99ms  p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=86.75ms  min=1.86ms  med=81.6ms  max=371.27ms p(90)=167.95ms p(95)=183.84ms p(99.9)=240.37ms
       { expected_response:true }...: avg=86.75ms  min=1.86ms  med=81.6ms  max=371.27ms p(90)=167.95ms p(95)=183.84ms p(99.9)=240.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 163868
     http_req_receiving.............: avg=578.89µs min=51.83µs med=99.66µs max=75.4ms   p(90)=1.11ms   p(95)=1.91ms   p(99.9)=23.62ms 
     http_req_sending...............: avg=64.61µs  min=4.5µs   med=8.62µs  max=162.44ms p(90)=16.93µs  p(95)=107.06µs p(99.9)=9.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.11ms  min=1.78ms  med=80.93ms max=371.07ms p(90)=167.23ms p(95)=183.07ms p(99.9)=239.46ms
     http_reqs......................: 163868  2635.316449/s
     iteration_duration.............: avg=87.53ms  min=3.95ms  med=82.36ms max=371.46ms p(90)=168.38ms p(95)=184.29ms p(99.9)=242.46ms
     iterations.....................: 162868  2619.234502/s
     success_rate...................: 100.00% ✓ 162868      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 472824      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=16.62µs min=821ns   med=2.07µs  max=104.04ms p(90)=3.51µs   p(95)=4.6µs    p(99.9)=1.16ms  
     http_req_connecting............: avg=13.62µs min=0s      med=0s      max=78.66ms  p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=89.66ms min=1.92ms  med=79.14ms max=1.19s    p(90)=172.77ms p(95)=199.4ms  p(99.9)=600.15ms
       { expected_response:true }...: avg=89.66ms min=1.92ms  med=79.14ms max=1.19s    p(90)=172.77ms p(95)=199.4ms  p(99.9)=600.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158608
     http_req_receiving.............: avg=1.46ms  min=51.09µs med=95.44µs max=969.68ms p(90)=1.66ms   p(95)=4.43ms   p(99.9)=88.49ms 
     http_req_sending...............: avg=63.09µs min=4.6µs   med=8.71µs  max=176.14ms p(90)=16.35µs  p(95)=99.82µs  p(99.9)=8.71ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.13ms min=1.85ms  med=77.94ms max=1.18s    p(90)=170.75ms p(95)=196.52ms p(99.9)=577.39ms
     http_reqs......................: 158608  2546.979445/s
     iteration_duration.............: avg=90.48ms min=3.35ms  med=79.99ms max=1.19s    p(90)=173.38ms p(95)=200.07ms p(99.9)=601.67ms
     iterations.....................: 157608  2530.921116/s
     success_rate...................: 100.00% ✓ 157608      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 472431      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=21.13µs min=951ns  med=2.31µs  max=89.69ms  p(90)=3.9µs    p(95)=5.03µs   p(99.9)=2.03ms  
     http_req_connecting............: avg=18.15µs min=0s     med=0s      max=89.63ms  p(90)=0s       p(95)=0s       p(99.9)=1.98ms  
     http_req_duration..............: avg=89.72ms min=1.98ms med=77.89ms max=1.78s    p(90)=168.15ms p(95)=197.3ms  p(99.9)=702.58ms
       { expected_response:true }...: avg=89.72ms min=1.98ms med=77.89ms max=1.78s    p(90)=168.15ms p(95)=197.3ms  p(99.9)=702.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158477
     http_req_receiving.............: avg=1.45ms  min=51.4µs med=95.3µs  max=819.57ms p(90)=1.39ms   p(95)=4.14ms   p(99.9)=121ms   
     http_req_sending...............: avg=67.02µs min=4.52µs med=9.09µs  max=69.41ms  p(90)=17.32µs  p(95)=110.14µs p(99.9)=9.26ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.19ms min=1.91ms med=76.83ms max=1.39s    p(90)=166.41ms p(95)=194.65ms p(99.9)=644.69ms
     http_reqs......................: 158477  2537.388028/s
     iteration_duration.............: avg=90.56ms min=3.24ms med=78.78ms max=1.78s    p(90)=168.73ms p(95)=197.98ms p(99.9)=714.32ms
     iterations.....................: 157477  2521.376948/s
     success_rate...................: 100.00% ✓ 157477      ✗ 0     
     vus............................: 78      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 426069      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=13.35µs  min=832ns   med=2.15µs   max=49.74ms  p(90)=3.59µs   p(95)=4.57µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=10.59µs  min=0s      med=0s       max=49.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=99.53ms  min=1.58ms  med=83.36ms  max=1.94s    p(90)=188.8ms  p(95)=221.7ms  p(99.9)=936.82ms
       { expected_response:true }...: avg=99.53ms  min=1.58ms  med=83.36ms  max=1.94s    p(90)=188.8ms  p(95)=221.7ms  p(99.9)=936.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143023
     http_req_receiving.............: avg=1.39ms   min=51.35µs med=101.57µs max=1.39s    p(90)=1.72ms   p(95)=4.33ms   p(99.9)=90.04ms 
     http_req_sending...............: avg=54.58µs  min=4.42µs  med=8.72µs   max=179.77ms p(90)=16.06µs  p(95)=91.12µs  p(99.9)=7.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.08ms  min=1.52ms  med=82.34ms  max=1.94s    p(90)=186.81ms p(95)=217.98ms p(99.9)=932.35ms
     http_reqs......................: 143023  2306.683034/s
     iteration_duration.............: avg=100.47ms min=2.85ms  med=84.37ms  max=1.94s    p(90)=189.38ms p(95)=222.41ms p(99.9)=940.8ms 
     iterations.....................: 142023  2290.554977/s
     success_rate...................: 100.00% ✓ 142023      ✗ 0     
     vus............................: 57      min=0         max=498 
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

     checks.........................: 100.00% ✓ 224742      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=5.14µs   min=1.07µs  med=2.65µs   max=23.63ms  p(90)=4.28µs   p(95)=5.2µs    p(99.9)=403.15µs
     http_req_connecting............: avg=1.83µs   min=0s      med=0s       max=23.55ms  p(90)=0s       p(95)=0s       p(99.9)=351.45µs
     http_req_duration..............: avg=187.97ms min=1.83ms  med=187.77ms max=504.06ms p(90)=349.22ms p(95)=374.25ms p(99.9)=447.3ms 
       { expected_response:true }...: avg=187.97ms min=1.83ms  med=187.77ms max=504.06ms p(90)=349.22ms p(95)=374.25ms p(99.9)=447.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 75914
     http_req_receiving.............: avg=76.44µs  min=27.08µs med=60.25µs  max=89.44ms  p(90)=96.55µs  p(95)=111µs    p(99.9)=1.13ms  
     http_req_sending...............: avg=31.61µs  min=4.93µs  med=11.03µs  max=164.43ms p(90)=17.21µs  p(95)=20.81µs  p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.86ms min=1.78ms  med=187.65ms max=504ms    p(90)=349.12ms p(95)=374.13ms p(99.9)=447.23ms
     http_reqs......................: 75914   1214.809254/s
     iteration_duration.............: avg=190.72ms min=4.32ms  med=190.6ms  max=504.2ms  p(90)=350.03ms p(95)=374.84ms p(99.9)=447.6ms 
     iterations.....................: 74914   1198.806813/s
     success_rate...................: 100.00% ✓ 74914       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 107730     ✗ 0    
     data_received..................: 3.2 GB  51 MB/s
     data_sent......................: 44 MB   690 kB/s
     http_req_blocked...............: avg=8.02µs   min=1.11µs  med=3.03µs   max=3.83ms   p(90)=4.77µs   p(95)=5.76µs   p(99.9)=1.24ms
     http_req_connecting............: avg=4.03µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=1.17ms
     http_req_duration..............: avg=388.5ms  min=3.46ms  med=362.04ms max=1.53s    p(90)=766.55ms p(95)=828.42ms p(99.9)=1.2s  
       { expected_response:true }...: avg=388.5ms  min=3.46ms  med=362.04ms max=1.53s    p(90)=766.55ms p(95)=828.42ms p(99.9)=1.2s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 36910
     http_req_receiving.............: avg=92.39µs  min=29.39µs med=67.06µs  max=237.14ms p(90)=106.11µs p(95)=120.59µs p(99.9)=1.16ms
     http_req_sending...............: avg=33.48µs  min=5.3µs   med=13.36µs  max=144.56ms p(90)=20.59µs  p(95)=23.8µs   p(99.9)=3.01ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=388.38ms min=3.41ms  med=361.95ms max=1.53s    p(90)=766.47ms p(95)=828.33ms p(99.9)=1.2s  
     http_reqs......................: 36910   574.863531/s
     iteration_duration.............: avg=399.57ms min=18.1ms  med=374.03ms max=1.54s    p(90)=769.71ms p(95)=831.58ms p(99.9)=1.2s  
     iterations.....................: 35910   559.288795/s
     success_rate...................: 100.00% ✓ 35910      ✗ 0    
     vus............................: 65      min=0        max=496
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

     checks.........................: 100.00% ✓ 48117      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   306 kB/s
     http_req_blocked...............: avg=13.96µs  min=1.1µs   med=3.29µs   max=16.38ms p(90)=5.01µs   p(95)=6.39µs   p(99.9)=2.09ms
     http_req_connecting............: avg=8.96µs   min=0s      med=0s       max=16.3ms  p(90)=0s       p(95)=0s       p(99.9)=2.06ms
     http_req_duration..............: avg=835.23ms min=5.35ms  med=733.91ms max=17.93s  p(90)=1.46s    p(95)=1.68s    p(99.9)=15.93s
       { expected_response:true }...: avg=835.23ms min=5.35ms  med=733.91ms max=17.93s  p(90)=1.46s    p(95)=1.68s    p(99.9)=15.93s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17039
     http_req_receiving.............: avg=94.9µs   min=32.37µs med=89.43µs  max=8.05ms  p(90)=123.86µs p(95)=138.13µs p(99.9)=1.17ms
     http_req_sending...............: avg=26.27µs  min=5.49µs  med=17.17µs  max=8.59ms  p(90)=22.43µs  p(95)=26.13µs  p(99.9)=2.85ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=835.1ms  min=5.27ms  med=733.76ms max=17.93s  p(90)=1.46s    p(95)=1.68s    p(99.9)=15.93s
     http_reqs......................: 17039   253.82531/s
     iteration_duration.............: avg=887.33ms min=70.2ms  med=795.22ms max=17.94s  p(90)=1.48s    p(95)=1.69s    p(99.9)=16.18s
     iterations.....................: 16039   238.928584/s
     success_rate...................: 100.00% ✓ 16039      ✗ 0    
     vus............................: 42      min=0        max=500
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

     checks.........................: 100.00% ✓ 48243      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   286 kB/s
     http_req_blocked...............: avg=22.56µs  min=1.11µs  med=3.48µs   max=9.56ms  p(90)=5.15µs   p(95)=6.45µs   p(99.9)=6.36ms  
     http_req_connecting............: avg=17.08µs  min=0s      med=0s       max=9.21ms  p(90)=0s       p(95)=0s       p(99.9)=6.33ms  
     http_req_duration..............: avg=394.83ms min=7.57ms  med=465.89ms max=1.05s   p(90)=653.01ms p(95)=695.11ms p(99.9)=954.41ms
       { expected_response:true }...: avg=394.83ms min=7.57ms  med=465.89ms max=1.05s   p(90)=653.01ms p(95)=695.11ms p(99.9)=954.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17081
     http_req_receiving.............: avg=92.42µs  min=32.49µs med=85.16µs  max=4.58ms  p(90)=122.8µs  p(95)=138.13µs p(99.9)=1.02ms  
     http_req_sending...............: avg=41.35µs  min=6.44µs  med=16.77µs  max=93.97ms p(90)=22.36µs  p(95)=26.53µs  p(99.9)=3.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=394.69ms min=7.49ms  med=465.7ms  max=1.05s   p(90)=652.89ms p(95)=694.99ms p(99.9)=954.26ms
     http_reqs......................: 17081   233.288182/s
     iteration_duration.............: avg=419.38ms min=12.82ms med=487.36ms max=1.05s   p(90)=655.84ms p(95)=699.7ms  p(99.9)=960.79ms
     iterations.....................: 16081   219.630423/s
     success_rate...................: 100.00% ✓ 16081      ✗ 0    
     vus............................: 60      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 460362      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 186 MB  3.0 MB/s
     http_req_blocked...............: avg=23.31µs  min=1.09µs  med=2.88µs   max=74.06ms  p(90)=4.68µs   p(95)=5.95µs   p(99.9)=2.65ms  
     http_req_connecting............: avg=19.51µs  min=0s      med=0s       max=74ms     p(90)=0s       p(95)=0s       p(99.9)=2.52ms  
     http_req_duration..............: avg=92.05ms  min=1.44ms  med=86.11ms  max=354.15ms p(90)=176.53ms p(95)=194.34ms p(99.9)=263.51ms
       { expected_response:true }...: avg=92.05ms  min=1.44ms  med=86.11ms  max=354.15ms p(90)=176.53ms p(95)=194.34ms p(99.9)=263.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154454
     http_req_receiving.............: avg=668.86µs min=53.41µs med=106.06µs max=252.93ms p(90)=1.18ms   p(95)=2.2ms    p(99.9)=34.54ms 
     http_req_sending...............: avg=77.61µs  min=4.63µs  med=10.69µs  max=139.96ms p(90)=21.33µs  p(95)=130.18µs p(99.9)=10.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.3ms   min=1.36ms  med=85.33ms  max=353ms    p(90)=175.64ms p(95)=193.38ms p(99.9)=260.29ms
     http_reqs......................: 154454  2501.346486/s
     iteration_duration.............: avg=92.91ms  min=3.17ms  med=87.01ms  max=354.39ms p(90)=177.02ms p(95)=194.92ms p(99.9)=264.47ms
     iterations.....................: 153454  2485.151719/s
     success_rate...................: 100.00% ✓ 153454      ✗ 0     
     vus............................: 90      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 442461      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=19.26µs min=892ns   med=2.38µs   max=69.34ms  p(90)=4.27µs   p(95)=5.46µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=16.05µs min=0s      med=0s       max=69.26ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=95.8ms  min=1.49ms  med=84.89ms  max=1.73s    p(90)=177.99ms p(95)=211.33ms p(99.9)=876.67ms
       { expected_response:true }...: avg=95.8ms  min=1.49ms  med=84.89ms  max=1.73s    p(90)=177.99ms p(95)=211.33ms p(99.9)=876.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148487
     http_req_receiving.............: avg=1.48ms  min=52.17µs med=103.25µs max=914.87ms p(90)=1.52ms   p(95)=3.83ms   p(99.9)=199.93ms
     http_req_sending...............: avg=67.8µs  min=4.94µs  med=9.67µs   max=229.24ms p(90)=20.43µs  p(95)=110.73µs p(99.9)=8.66ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.25ms min=1.41ms  med=83.94ms  max=1.73s    p(90)=175.82ms p(95)=208.09ms p(99.9)=745.2ms 
     http_reqs......................: 148487  2398.764758/s
     iteration_duration.............: avg=96.71ms min=2.68ms  med=85.88ms  max=1.73s    p(90)=178.64ms p(95)=212.06ms p(99.9)=879.66ms
     iterations.....................: 147487  2382.610045/s
     success_rate...................: 100.00% ✓ 147487      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 439038      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=15.16µs  min=932ns   med=2.43µs  max=50.57ms  p(90)=4.23µs   p(95)=5.47µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=12.03µs  min=0s      med=0s      max=50.31ms  p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=96.53ms  min=1.46ms  med=91.51ms max=360.65ms p(90)=185.79ms p(95)=201.14ms p(99.9)=245.79ms
       { expected_response:true }...: avg=96.53ms  min=1.46ms  med=91.51ms max=360.65ms p(90)=185.79ms p(95)=201.14ms p(99.9)=245.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147346
     http_req_receiving.............: avg=122.22µs min=24.72µs med=54.21µs max=50.95ms  p(90)=133.53µs p(95)=340.24µs p(99.9)=9.98ms  
     http_req_sending...............: avg=62.34µs  min=4.8µs   med=10.3µs  max=164.02ms p(90)=20.99µs  p(95)=120.88µs p(99.9)=7.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.34ms  min=1.41ms  med=91.33ms max=351.88ms p(90)=185.56ms p(95)=200.92ms p(99.9)=244.6ms 
     http_reqs......................: 147346  2385.30527/s
     iteration_duration.............: avg=97.43ms  min=3.65ms  med=92.51ms max=370.71ms p(90)=186.28ms p(95)=201.54ms p(99.9)=246.52ms
     iterations.....................: 146346  2369.116807/s
     success_rate...................: 100.00% ✓ 146346      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431262      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=20.28µs min=1.02µs  med=2.91µs   max=110.46ms p(90)=4.61µs   p(95)=5.75µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=16.63µs min=0s      med=0s       max=110.41ms p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=98.28ms min=1.52ms  med=87.48ms  max=1.41s    p(90)=190.12ms p(95)=217.49ms p(99.9)=677.24ms
       { expected_response:true }...: avg=98.28ms min=1.52ms  med=87.48ms  max=1.41s    p(90)=190.12ms p(95)=217.49ms p(99.9)=677.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144754
     http_req_receiving.............: avg=1.43ms  min=55.11µs med=110.61µs max=917.17ms p(90)=1.65ms   p(95)=4.32ms   p(99.9)=83.34ms 
     http_req_sending...............: avg=72.21µs min=5.18µs  med=11.16µs  max=232.5ms  p(90)=21.23µs  p(95)=124.5µs  p(99.9)=9.75ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.78ms min=1.43ms  med=86.19ms  max=1.41s    p(90)=188.08ms p(95)=214.5ms  p(99.9)=673.12ms
     http_reqs......................: 144754  2337.346026/s
     iteration_duration.............: avg=99.24ms min=3ms     med=88.42ms  max=1.41s    p(90)=190.73ms p(95)=218.28ms p(99.9)=677.63ms
     iterations.....................: 143754  2321.199004/s
     success_rate...................: 100.00% ✓ 143754      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 412698      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=16.44µs  min=902ns   med=2.42µs   max=101.79ms p(90)=4.44µs   p(95)=5.59µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=13.32µs  min=0s      med=0s       max=101.75ms p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=102.71ms min=1.75ms  med=91.76ms  max=1.25s    p(90)=189.65ms p(95)=222.32ms p(99.9)=684.4ms 
       { expected_response:true }...: avg=102.71ms min=1.75ms  med=91.76ms  max=1.25s    p(90)=189.65ms p(95)=222.32ms p(99.9)=684.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 138566
     http_req_receiving.............: avg=1.62ms   min=51.37µs med=106.06µs max=903.11ms p(90)=1.7ms    p(95)=4.36ms   p(99.9)=111.53ms
     http_req_sending...............: avg=62.53µs  min=4.68µs  med=10.14µs  max=192.82ms p(90)=21µs     p(95)=102.47µs p(99.9)=7.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.01ms min=1.67ms  med=90.7ms   max=1.25s    p(90)=187.65ms p(95)=218.07ms p(99.9)=644.84ms
     http_reqs......................: 138566  2228.21138/s
     iteration_duration.............: avg=103.72ms min=3.34ms  med=92.79ms  max=1.25s    p(90)=190.37ms p(95)=223.14ms p(99.9)=685.44ms
     iterations.....................: 137566  2212.130874/s
     success_rate...................: 100.00% ✓ 137566      ✗ 0     
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

     checks.........................: 100.00% ✓ 208695      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=7.01µs   min=1.16µs  med=3.04µs   max=31.65ms  p(90)=4.84µs   p(95)=5.87µs   p(99.9)=491.87µs
     http_req_connecting............: avg=3.29µs   min=0s      med=0s       max=31.58ms  p(90)=0s       p(95)=0s       p(99.9)=430.12µs
     http_req_duration..............: avg=202.25ms min=1.96ms  med=202.14ms max=577.45ms p(90)=374.3ms  p(95)=401.76ms p(99.9)=494.35ms
       { expected_response:true }...: avg=202.25ms min=1.96ms  med=202.14ms max=577.45ms p(90)=374.3ms  p(95)=401.76ms p(99.9)=494.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70565
     http_req_receiving.............: avg=84.44µs  min=27.98µs med=69.99µs  max=85.29ms  p(90)=113.77µs p(95)=130.36µs p(99.9)=1.14ms  
     http_req_sending...............: avg=33.66µs  min=5.09µs  med=12.99µs  max=159.3ms  p(90)=20.34µs  p(95)=24.07µs  p(99.9)=3.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.13ms min=1.9ms   med=202.03ms max=577.38ms p(90)=374.17ms p(95)=401.64ms p(99.9)=494.04ms
     http_reqs......................: 70565   1125.861286/s
     iteration_duration.............: avg=205.41ms min=4.13ms  med=205.72ms max=577.59ms p(90)=375.05ms p(95)=402.46ms p(99.9)=496.4ms 
     iterations.....................: 69565   1109.906332/s
     success_rate...................: 100.00% ✓ 69565       ✗ 0    
     vus............................: 88      min=0         max=499
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

     checks.........................: 100.00% ✓ 100497     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   641 kB/s
     http_req_blocked...............: avg=8.17µs   min=1.06µs  med=3.28µs   max=6.51ms   p(90)=5.08µs   p(95)=6.18µs   p(99.9)=793.37µs
     http_req_connecting............: avg=3.88µs   min=0s      med=0s       max=6.32ms   p(90)=0s       p(95)=0s       p(99.9)=762.36µs
     http_req_duration..............: avg=416.08ms min=3.85ms  med=387.87ms max=1.61s    p(90)=820.56ms p(95)=900.4ms  p(99.9)=1.27s   
       { expected_response:true }...: avg=416.08ms min=3.85ms  med=387.87ms max=1.61s    p(90)=820.56ms p(95)=900.4ms  p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34499
     http_req_receiving.............: avg=224.53µs min=31.73µs med=77.69µs  max=244.61ms p(90)=117.14µs p(95)=132.81µs p(99.9)=28.24ms 
     http_req_sending...............: avg=25.97µs  min=5.2µs   med=15.21µs  max=24.54ms  p(90)=22.55µs  p(95)=25.6µs   p(99.9)=2.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=415.83ms min=3.73ms  med=387.77ms max=1.61s    p(90)=820.46ms p(95)=900.28ms p(99.9)=1.27s   
     http_reqs......................: 34499   533.7277/s
     iteration_duration.............: avg=428.73ms min=5.87ms  med=400.9ms  max=1.61s    p(90)=823.99ms p(95)=904.13ms p(99.9)=1.28s   
     iterations.....................: 33499   518.256884/s
     success_rate...................: 100.00% ✓ 33499      ✗ 0    
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

     checks.........................: 100.00% ✓ 47544      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=15.56µs  min=1.38µs  med=3.92µs   max=12.41ms p(90)=5.92µs   p(95)=7.73µs   p(99.9)=2.29ms
     http_req_connecting............: avg=9.74µs   min=0s      med=0s       max=12.34ms p(90)=0s       p(95)=0s       p(99.9)=2.25ms
     http_req_duration..............: avg=862.41ms min=5.71ms  med=776.06ms max=4.89s   p(90)=1.71s    p(95)=1.93s    p(99.9)=3.82s 
       { expected_response:true }...: avg=862.41ms min=5.71ms  med=776.06ms max=4.89s   p(90)=1.71s    p(95)=1.93s    p(99.9)=3.82s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16848
     http_req_receiving.............: avg=106.99µs min=37.25µs med=95.88µs  max=57.35ms p(90)=136.35µs p(95)=152.75µs p(99.9)=1ms   
     http_req_sending...............: avg=32.34µs  min=6.48µs  med=19.41µs  max=45.72ms p(90)=25.41µs  p(95)=30.16µs  p(99.9)=2.48ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=862.27ms min=5.62ms  med=775.91ms max=4.89s   p(90)=1.71s    p(95)=1.93s    p(99.9)=3.82s 
     http_reqs......................: 16848   250.444089/s
     iteration_duration.............: avg=916.93ms min=38.4ms  med=835.68ms max=4.9s    p(90)=1.73s    p(95)=1.95s    p(99.9)=3.83s 
     iterations.....................: 15848   235.579174/s
     success_rate...................: 100.00% ✓ 15848      ✗ 0    
     vus............................: 70      min=0        max=500
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

     checks.........................: 100.00% ✓ 45555      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   282 kB/s
     http_req_blocked...............: avg=15.16µs  min=1.04µs  med=3.41µs   max=6.87ms  p(90)=5.26µs   p(95)=7.07µs   p(99.9)=2.29ms
     http_req_connecting............: avg=9.94µs   min=0s      med=0s       max=6.79ms  p(90)=0s       p(95)=0s       p(99.9)=2.27ms
     http_req_duration..............: avg=897.83ms min=7.85ms  med=814.13ms max=3.22s   p(90)=1.83s    p(95)=1.94s    p(99.9)=2.72s 
       { expected_response:true }...: avg=897.83ms min=7.85ms  med=814.13ms max=3.22s   p(90)=1.83s    p(95)=1.94s    p(99.9)=2.72s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16185
     http_req_receiving.............: avg=105.36µs min=33.71µs med=91.12µs  max=97.51ms p(90)=132.95µs p(95)=150.41µs p(99.9)=1.02ms
     http_req_sending...............: avg=35.59µs  min=5.46µs  med=17.64µs  max=52.61ms p(90)=23.59µs  p(95)=29.39µs  p(99.9)=2.33ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=897.69ms min=7.71ms  med=813.96ms max=3.22s   p(90)=1.83s    p(95)=1.94s    p(99.9)=2.72s 
     http_reqs......................: 16185   235.122271/s
     iteration_duration.............: avg=956.92ms min=60.19ms med=885.61ms max=3.24s   p(90)=1.83s    p(95)=1.96s    p(99.9)=2.73s 
     iterations.....................: 15185   220.5951/s
     success_rate...................: 100.00% ✓ 15185      ✗ 0    
     vus............................: 98      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

