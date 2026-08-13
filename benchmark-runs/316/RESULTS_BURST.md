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
| hive-router | v0.0.84 | 2,884 | 3,022 | 2,867 | 2.1% |  |
| fusion-nightly-net11 | 16.6.1-p.1 | 2,576 | 2,641 | 2,528 | 1.5% |  |
| fusion | 16.6.0 | 2,529 | 2,630 | 2,521 | 1.6% |  |
| fusion-nightly | 16.6.1-p.1 | 2,510 | 2,592 | 2,497 | 1.3% |  |
| fusion-nightly-fed | 16.6.1-p.1 | 2,285 | 2,379 | 2,270 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 558 | 575 | 554 | 1.4% |  |
| hive-gateway | 2.10.8 | 253 | 262 | 250 | 1.4% |  |
| apollo-gateway | 2.14.3 | 234 | 241 | 233 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (18381 across 9/9 runs) |
| cosmo | — | — | — | — | — | benchmark run failed |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (484963 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.1-p.1 | 2,495 | 2,590 | 2,486 | 1.5% |  |
| fusion | 16.6.0 | 2,395 | 2,479 | 2,381 | 1.4% |  |
| fusion-nightly | 16.6.1-p.1 | 2,390 | 2,474 | 2,382 | 1.3% |  |
| fusion-nightly-fed | 16.6.1-p.1 | 2,234 | 2,317 | 2,219 | 1.4% |  |
| hive-router | v0.0.84 | 2,213 | 2,354 | 2,187 | 2.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 548 | 559 | 546 | 0.8% |  |
| hive-gateway | 2.10.8 | 239 | 246 | 238 | 1.0% |  |
| apollo-gateway | 2.14.3 | 230 | 235 | 229 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (17416 across 9/9 runs) |
| cosmo | — | — | — | — | — | benchmark run failed |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (388171 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 530670      ✗ 0     
     data_received..................: 16 GB   253 MB/s
     data_sent......................: 214 MB  3.5 MB/s
     http_req_blocked...............: avg=26.33µs  min=831ns   med=2.56µs  max=75.75ms  p(90)=4.32µs   p(95)=5.53µs   p(99.9)=2.85ms  
     http_req_connecting............: avg=22.66µs  min=0s      med=0s      max=75.52ms  p(90)=0s       p(95)=0s       p(99.9)=2.59ms  
     http_req_duration..............: avg=79.84ms  min=1.36ms  med=74.11ms max=292.66ms p(90)=154.66ms p(95)=172.52ms p(99.9)=242.31ms
       { expected_response:true }...: avg=79.84ms  min=1.36ms  med=74.11ms max=292.66ms p(90)=154.66ms p(95)=172.52ms p(99.9)=242.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177890
     http_req_receiving.............: avg=189.33µs min=26.54µs med=53.14µs max=57.09ms  p(90)=175.56µs p(95)=367.98µs p(99.9)=25.75ms 
     http_req_sending...............: avg=81.44µs  min=4.66µs  med=9.9µs   max=242.84ms p(90)=19.54µs  p(95)=126.01µs p(99.9)=11.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.57ms  min=1.32ms  med=73.85ms max=290.01ms p(90)=154.17ms p(95)=171.9ms  p(99.9)=239.48ms
     http_reqs......................: 177890  2884.550342/s
     iteration_duration.............: avg=80.58ms  min=2.36ms  med=74.95ms max=310.87ms p(90)=155.16ms p(95)=173.31ms p(99.9)=244.29ms
     iterations.....................: 176890  2868.334983/s
     success_rate...................: 100.00% ✓ 176890      ✗ 0     
     vus............................: 86      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 477990      ✗ 0     
     data_received..................: 14 GB   226 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=14.25µs  min=862ns   med=2.08µs   max=46.59ms  p(90)=3.37µs   p(95)=4.35µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=11.3µs   min=0s      med=0s       max=46.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=88.69ms  min=1.84ms  med=84.35ms  max=362.64ms p(90)=168.65ms p(95)=183.71ms p(99.9)=234.58ms
       { expected_response:true }...: avg=88.69ms  min=1.84ms  med=84.35ms  max=362.64ms p(90)=168.65ms p(95)=183.71ms p(99.9)=234.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160330
     http_req_receiving.............: avg=612.53µs min=48.16µs med=101.15µs max=202.35ms p(90)=1.15ms   p(95)=2.02ms   p(99.9)=25.45ms 
     http_req_sending...............: avg=54.95µs  min=4.45µs  med=8.66µs   max=160.06ms p(90)=16.1µs   p(95)=101.24µs p(99.9)=7.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.02ms  min=1.76ms  med=83.63ms  max=361.52ms p(90)=167.87ms p(95)=182.92ms p(99.9)=233.18ms
     http_reqs......................: 160330  2576.973133/s
     iteration_duration.............: avg=89.48ms  min=4.13ms  med=85.27ms  max=362.81ms p(90)=169.12ms p(95)=184.15ms p(99.9)=235.14ms
     iterations.....................: 159330  2560.900201/s
     success_rate...................: 100.00% ✓ 159330      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 470940      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=15.39µs min=891ns   med=2.05µs  max=51.08ms  p(90)=3.39µs   p(95)=4.41µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=12.55µs min=0s      med=0s      max=50.94ms  p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=90.02ms min=1.97ms  med=78.81ms max=1.54s    p(90)=172.01ms p(95)=198.03ms p(99.9)=686.45ms
       { expected_response:true }...: avg=90.02ms min=1.97ms  med=78.81ms max=1.54s    p(90)=172.01ms p(95)=198.03ms p(99.9)=686.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157980
     http_req_receiving.............: avg=1.48ms  min=50.27µs med=94.28µs max=967.59ms p(90)=1.65ms   p(95)=4.99ms   p(99.9)=82.53ms 
     http_req_sending...............: avg=65.13µs min=4.28µs  med=8.48µs  max=285.51ms p(90)=15.9µs   p(95)=97.64µs  p(99.9)=8.39ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.47ms min=1.9ms   med=77.75ms max=1.51s    p(90)=169.93ms p(95)=194.91ms p(99.9)=681.55ms
     http_reqs......................: 157980  2529.175132/s
     iteration_duration.............: avg=90.86ms min=3.04ms  med=79.64ms max=1.54s    p(90)=172.68ms p(95)=198.88ms p(99.9)=689.45ms
     iterations.....................: 156980  2513.165668/s
     success_rate...................: 100.00% ✓ 156980      ✗ 0     
     vus............................: 77      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 466992      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=15.47µs min=832ns   med=2.1µs   max=74.46ms  p(90)=3.5µs    p(95)=4.57µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=12.71µs min=0s      med=0s      max=74.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=90.77ms min=1.97ms  med=80ms    max=838.7ms  p(90)=173.94ms p(95)=197.13ms p(99.9)=575.21ms
       { expected_response:true }...: avg=90.77ms min=1.97ms  med=80ms    max=838.7ms  p(90)=173.94ms p(95)=197.13ms p(99.9)=575.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156664
     http_req_receiving.............: avg=1.51ms  min=51.65µs med=97.44µs max=569.67ms p(90)=1.91ms   p(95)=4.96ms   p(99.9)=124.47ms
     http_req_sending...............: avg=61.98µs min=4.77µs  med=8.92µs  max=156.78ms p(90)=16.38µs  p(95)=102.29µs p(99.9)=8.28ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.2ms  min=1.88ms  med=78.73ms max=838.6ms  p(90)=171.76ms p(95)=193.92ms p(99.9)=547.63ms
     http_reqs......................: 156664  2510.480914/s
     iteration_duration.............: avg=91.6ms  min=3.51ms  med=80.87ms max=838.91ms p(90)=174.44ms p(95)=197.68ms p(99.9)=577.18ms
     iterations.....................: 155664  2494.456295/s
     success_rate...................: 100.00% ✓ 155664      ✗ 0     
     vus............................: 75      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 422535      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=11.85µs  min=801ns   med=2.18µs   max=56.3ms   p(90)=3.78µs   p(95)=4.82µs   p(99.9)=696.62µs
     http_req_connecting............: avg=9.07µs   min=0s      med=0s       max=56.16ms  p(90)=0s       p(95)=0s       p(99.9)=653.27µs
     http_req_duration..............: avg=100.37ms min=1.67ms  med=84.95ms  max=2.33s    p(90)=190.05ms p(95)=224.14ms p(99.9)=957.34ms
       { expected_response:true }...: avg=100.37ms min=1.67ms  med=84.95ms  max=2.33s    p(90)=190.05ms p(95)=224.14ms p(99.9)=957.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141845
     http_req_receiving.............: avg=1.51ms   min=50.71µs med=103.65µs max=1.35s    p(90)=1.85ms   p(95)=4.54ms   p(99.9)=83.12ms 
     http_req_sending...............: avg=56.03µs  min=4.37µs  med=8.9µs    max=160.18ms p(90)=16.47µs  p(95)=88.15µs  p(99.9)=7.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.8ms   min=1.6ms   med=83.77ms  max=2.33s    p(90)=188ms    p(95)=220.2ms  p(99.9)=924.01ms
     http_reqs......................: 141845  2285.92889/s
     iteration_duration.............: avg=101.32ms min=2.78ms  med=85.96ms  max=2.33s    p(90)=190.63ms p(95)=224.99ms p(99.9)=960.24ms
     iterations.....................: 140845  2269.813208/s
     success_rate...................: 100.00% ✓ 140845      ✗ 0     
     vus............................: 59      min=0         max=498 
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

     checks.........................: 100.00% ✓ 104541     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   670 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.11µs  med=3.01µs   max=3.24ms   p(90)=4.66µs   p(95)=5.71µs   p(99.9)=695.28µs
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=3.15ms   p(90)=0s       p(95)=0s       p(99.9)=579.68µs
     http_req_duration..............: avg=400.29ms min=3.54ms  med=374.38ms max=1.65s    p(90)=787.31ms p(95)=853.37ms p(99.9)=1.27s   
       { expected_response:true }...: avg=400.29ms min=3.54ms  med=374.38ms max=1.65s    p(90)=787.31ms p(95)=853.37ms p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35847
     http_req_receiving.............: avg=85.43µs  min=29.7µs  med=69.51µs  max=114.93ms p(90)=107.97µs p(95)=122.85µs p(99.9)=1.07ms  
     http_req_sending...............: avg=30.28µs  min=4.94µs  med=13.49µs  max=193.6ms  p(90)=20.36µs  p(95)=23.21µs  p(99.9)=2.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=400.18ms min=3.45ms  med=374.25ms max=1.65s    p(90)=787.24ms p(95)=853.29ms p(99.9)=1.27s   
     http_reqs......................: 35847   558.255375/s
     iteration_duration.............: avg=412.01ms min=17.65ms med=387.38ms max=1.66s    p(90)=790.99ms p(95)=855.99ms p(99.9)=1.27s   
     iterations.....................: 34847   542.682095/s
     success_rate...................: 100.00% ✓ 34847      ✗ 0    
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

     checks.........................: 100.00% ✓ 48159      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   306 kB/s
     http_req_blocked...............: avg=15.31µs  min=1.34µs  med=3.8µs    max=18.78ms p(90)=5.63µs   p(95)=7.11µs   p(99.9)=2.46ms
     http_req_connecting............: avg=9.76µs   min=0s      med=0s       max=18.72ms p(90)=0s       p(95)=0s       p(99.9)=2.43ms
     http_req_duration..............: avg=832.93ms min=5.45ms  med=706.64ms max=21.75s  p(90)=1.39s    p(95)=1.57s    p(99.9)=19.18s
       { expected_response:true }...: avg=832.93ms min=5.45ms  med=706.64ms max=21.75s  p(90)=1.39s    p(95)=1.57s    p(99.9)=19.18s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17053
     http_req_receiving.............: avg=102.04µs min=39.15µs med=93.62µs  max=19.71ms p(90)=131.88µs p(95)=148.13µs p(99.9)=1.02ms
     http_req_sending...............: avg=41.26µs  min=5.7µs   med=18.59µs  max=60.5ms  p(90)=24.58µs  p(95)=28.5µs   p(99.9)=3.27ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=832.79ms min=5.36ms  med=706.52ms max=21.75s  p(90)=1.39s    p(95)=1.57s    p(99.9)=19.18s
     http_reqs......................: 17053   253.790843/s
     iteration_duration.............: avg=884.9ms  min=54.64ms med=768.94ms max=21.75s  p(90)=1.41s    p(95)=1.59s    p(99.9)=19.55s
     iterations.....................: 16053   238.908368/s
     success_rate...................: 100.00% ✓ 16053      ✗ 0    
     vus............................: 61      min=0        max=499
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

     checks.........................: 100.00% ✓ 48420      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   288 kB/s
     http_req_blocked...............: avg=14.78µs  min=1.13µs  med=3.02µs   max=14.14ms  p(90)=4.64µs   p(95)=5.87µs   p(99.9)=2.24ms  
     http_req_connecting............: avg=10.14µs  min=0s      med=0s       max=14.07ms  p(90)=0s       p(95)=0s       p(99.9)=2.21ms  
     http_req_duration..............: avg=346.87ms min=7.54ms  med=398.94ms max=952.22ms p(90)=595.69ms p(95)=640.91ms p(99.9)=885.55ms
       { expected_response:true }...: avg=346.87ms min=7.54ms  med=398.94ms max=952.22ms p(90)=595.69ms p(95)=640.91ms p(99.9)=885.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17140
     http_req_receiving.............: avg=92.66µs  min=34.69µs med=87.32µs  max=3.77ms   p(90)=124.68µs p(95)=139.53µs p(99.9)=1.05ms  
     http_req_sending...............: avg=30.76µs  min=5.76µs  med=17.06µs  max=94.64ms  p(90)=22.4µs   p(95)=27.47µs  p(99.9)=1.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=346.74ms min=7.41ms  med=398.83ms max=952.07ms p(90)=595.58ms p(95)=640.79ms p(99.9)=885.36ms
     http_reqs......................: 17140   234.578333/s
     iteration_duration.............: avg=368.36ms min=8.06ms  med=415.2ms  max=958.1ms  p(90)=600.33ms p(95)=644.66ms p(99.9)=894.99ms
     iterations.....................: 16140   220.892316/s
     success_rate...................: 100.00% ✓ 16140      ✗ 0    
     vus............................: 58      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459657      ✗ 0     
     data_received..................: 14 GB   219 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=28.89µs  min=872ns   med=2.75µs  max=67.3ms   p(90)=4.66µs   p(95)=5.84µs   p(99.9)=9.34ms  
     http_req_connecting............: avg=25.12µs  min=0s      med=0s      max=64.01ms  p(90)=0s       p(95)=0s       p(99.9)=9.31ms  
     http_req_duration..............: avg=92.19ms  min=1.44ms  med=87.15ms max=392.87ms p(90)=176.5ms  p(95)=196.42ms p(99.9)=266.55ms
       { expected_response:true }...: avg=92.19ms  min=1.44ms  med=87.15ms max=392.87ms p(90)=176.5ms  p(95)=196.42ms p(99.9)=266.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154219
     http_req_receiving.............: avg=644.04µs min=52.32µs med=105.4µs max=198.76ms p(90)=1.2ms    p(95)=2.16ms   p(99.9)=28.67ms 
     http_req_sending...............: avg=74.5µs   min=4.6µs   med=10.41µs max=204.29ms p(90)=21.32µs  p(95)=125.95µs p(99.9)=10.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.47ms  min=1.33ms  med=86.37ms max=358.07ms p(90)=175.79ms p(95)=195.59ms p(99.9)=265.16ms
     http_reqs......................: 154219  2495.928612/s
     iteration_duration.............: avg=93.07ms  min=3.33ms  med=88.16ms max=393.07ms p(90)=177.07ms p(95)=197.02ms p(99.9)=268.53ms
     iterations.....................: 153219  2479.744299/s
     success_rate...................: 100.00% ✓ 153219      ✗ 0     
     vus............................: 92      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441885      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=19.44µs min=921ns   med=2.57µs   max=74.1ms   p(90)=4.39µs   p(95)=5.55µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=16.24µs min=0s      med=0s       max=74.04ms  p(90)=0s       p(95)=0s       p(99.9)=2.15ms  
     http_req_duration..............: avg=95.94ms min=1.52ms  med=80.34ms  max=1.5s     p(90)=186.1ms  p(95)=218.16ms p(99.9)=669.39ms
       { expected_response:true }...: avg=95.94ms min=1.52ms  med=80.34ms  max=1.5s     p(90)=186.1ms  p(95)=218.16ms p(99.9)=669.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148295
     http_req_receiving.............: avg=1.32ms  min=52.52µs med=104.99µs max=1.34s    p(90)=1.55ms   p(95)=4.21ms   p(99.9)=71.99ms 
     http_req_sending...............: avg=72.33µs min=4.88µs  med=10.26µs  max=163.11ms p(90)=20.53µs  p(95)=117.13µs p(99.9)=10.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.54ms min=1.42ms  med=79.26ms  max=1.47s    p(90)=184.43ms p(95)=215.25ms p(99.9)=662.51ms
     http_reqs......................: 148295  2395.717683/s
     iteration_duration.............: avg=96.86ms min=2.64ms  med=81.47ms  max=1.5s     p(90)=186.77ms p(95)=218.98ms p(99.9)=670.31ms
     iterations.....................: 147295  2379.562602/s
     success_rate...................: 100.00% ✓ 147295      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 440979      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=18.2µs  min=872ns   med=2.22µs   max=85.26ms  p(90)=3.94µs   p(95)=5.14µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=14.8µs  min=0s      med=0s       max=85.03ms  p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=96.15ms min=1.52ms  med=82.53ms  max=1.99s    p(90)=181.33ms p(95)=213.02ms p(99.9)=777.33ms
       { expected_response:true }...: avg=96.15ms min=1.52ms  med=82.53ms  max=1.99s    p(90)=181.33ms p(95)=213.02ms p(99.9)=777.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147993
     http_req_receiving.............: avg=2.09ms  min=52.35µs med=103.71µs max=623.39ms p(90)=1.75ms   p(95)=5ms      p(99.9)=217.84ms
     http_req_sending...............: avg=68.59µs min=4.61µs  med=9.24µs   max=141.35ms p(90)=18.92µs  p(95)=106.1µs  p(99.9)=9.61ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.99ms min=1.45ms  med=81.23ms  max=1.64s    p(90)=179.14ms p(95)=208.68ms p(99.9)=647.88ms
     http_reqs......................: 147993  2390.447752/s
     iteration_duration.............: avg=97.08ms min=2.77ms  med=83.66ms  max=1.99s    p(90)=181.96ms p(95)=213.87ms p(99.9)=777.78ms
     iterations.....................: 146993  2374.295314/s
     success_rate...................: 100.00% ✓ 146993      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 414012      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=14.77µs  min=902ns   med=2.43µs   max=52.77ms  p(90)=4.28µs   p(95)=5.48µs   p(99.9)=2.24ms  
     http_req_connecting............: avg=11.31µs  min=0s      med=0s       max=52.7ms   p(90)=0s       p(95)=0s       p(99.9)=2.05ms  
     http_req_duration..............: avg=102.37ms min=1.85ms  med=89.26ms  max=1.3s     p(90)=192.8ms  p(95)=222.61ms p(99.9)=739.78ms
       { expected_response:true }...: avg=102.37ms min=1.85ms  med=89.26ms  max=1.3s     p(90)=192.8ms  p(95)=222.61ms p(99.9)=739.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139004
     http_req_receiving.............: avg=1.52ms   min=53.25µs med=108.36µs max=777.06ms p(90)=1.6ms    p(95)=4.04ms   p(99.9)=116.27ms
     http_req_sending...............: avg=67µs     min=4.85µs  med=9.89µs   max=85.42ms  p(90)=20.52µs  p(95)=110.25µs p(99.9)=8.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.78ms min=1.73ms  med=88.16ms  max=1.3s     p(90)=191.09ms p(95)=219.78ms p(99.9)=706.75ms
     http_reqs......................: 139004  2234.818223/s
     iteration_duration.............: avg=103.36ms min=3.01ms  med=90.3ms   max=1.3s     p(90)=193.4ms  p(95)=223.3ms  p(99.9)=740ms   
     iterations.....................: 138004  2218.740857/s
     success_rate...................: 100.00% ✓ 138004      ✗ 0     
     vus............................: 68      min=0         max=496 
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

     checks.........................: 100.00% ✓ 408663      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=11.07µs  min=912ns   med=2.35µs  max=34.12ms  p(90)=3.97µs   p(95)=5.15µs   p(99.9)=794.26µs
     http_req_connecting............: avg=7.99µs   min=0s      med=0s      max=34.05ms  p(90)=0s       p(95)=0s       p(99.9)=729.91µs
     http_req_duration..............: avg=103.69ms min=1.61ms  med=97.12ms max=323.79ms p(90)=201.89ms p(95)=218.07ms p(99.9)=261.27ms
       { expected_response:true }...: avg=103.69ms min=1.61ms  med=97.12ms max=323.79ms p(90)=201.89ms p(95)=218.07ms p(99.9)=261.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137221
     http_req_receiving.............: avg=102.69µs min=28.16µs med=56.22µs max=34.67ms  p(90)=106.21µs p(95)=288.76µs p(99.9)=6.85ms  
     http_req_sending...............: avg=52.66µs  min=4.97µs  med=10.3µs  max=190.17ms p(90)=17.72µs  p(95)=102.1µs  p(99.9)=6.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.53ms min=1.54ms  med=96.96ms max=323.1ms  p(90)=201.71ms p(95)=217.87ms p(99.9)=260.81ms
     http_reqs......................: 137221  2213.1245/s
     iteration_duration.............: avg=104.69ms min=3.58ms  med=98.27ms max=343.74ms p(90)=202.37ms p(95)=218.48ms p(99.9)=262.93ms
     iterations.....................: 136221  2196.996324/s
     success_rate...................: 100.00% ✓ 136221      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 103308     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 43 MB   659 kB/s
     http_req_blocked...............: avg=10.04µs  min=1.24µs  med=3.41µs   max=15.45ms  p(90)=5.27µs   p(95)=6.44µs   p(99.9)=1.67ms
     http_req_connecting............: avg=5.53µs   min=0s      med=0s       max=15.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.59ms
     http_req_duration..............: avg=404.82ms min=3.72ms  med=376.64ms max=1.51s    p(90)=798.62ms p(95)=873.26ms p(99.9)=1.27s 
       { expected_response:true }...: avg=404.82ms min=3.72ms  med=376.64ms max=1.51s    p(90)=798.62ms p(95)=873.26ms p(99.9)=1.27s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35436
     http_req_receiving.............: avg=88.68µs  min=31.18µs med=77.06µs  max=8.39ms   p(90)=115.73µs p(95)=131.04µs p(99.9)=1.35ms
     http_req_sending...............: avg=33.46µs  min=5.54µs  med=15.5µs   max=203.41ms p(90)=22.87µs  p(95)=26.05µs  p(99.9)=2.51ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=404.7ms  min=3.6ms   med=376.49ms max=1.51s    p(90)=798.52ms p(95)=873.1ms  p(99.9)=1.27s 
     http_reqs......................: 35436   548.716959/s
     iteration_duration.............: avg=416.81ms min=12.69ms med=390.87ms max=1.51s    p(90)=802.74ms p(95)=875.89ms p(99.9)=1.28s 
     iterations.....................: 34436   533.232227/s
     success_rate...................: 100.00% ✓ 34436      ✗ 0    
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

     checks.........................: 100.00% ✓ 45678      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   288 kB/s
     http_req_blocked...............: avg=13.09µs  min=1.1µs   med=3.24µs   max=7.74ms  p(90)=5.07µs  p(95)=6.63µs   p(99.9)=1.72ms
     http_req_connecting............: avg=8.11µs   min=0s      med=0s       max=7.49ms  p(90)=0s      p(95)=0s       p(99.9)=1.7ms 
     http_req_duration..............: avg=897.35ms min=5.85ms  med=805.03ms max=4.61s   p(90)=1.76s   p(95)=2.01s    p(99.9)=4.16s 
       { expected_response:true }...: avg=897.35ms min=5.85ms  med=805.03ms max=4.61s   p(90)=1.76s   p(95)=2.01s    p(99.9)=4.16s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16226
     http_req_receiving.............: avg=108.61µs min=33.91µs med=93.58µs  max=41.6ms  p(90)=131.9µs p(95)=147.14µs p(99.9)=2.46ms
     http_req_sending...............: avg=34.7µs   min=5.54µs  med=17.78µs  max=77.27ms p(90)=23.25µs p(95)=27.92µs  p(99.9)=3.34ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=897.2ms  min=5.76ms  med=804.95ms max=4.61s   p(90)=1.76s   p(95)=2.01s    p(99.9)=4.16s 
     http_reqs......................: 16226   239.864476/s
     iteration_duration.............: avg=956.29ms min=28.55ms med=881.32ms max=4.61s   p(90)=1.78s   p(95)=2.03s    p(99.9)=4.18s 
     iterations.....................: 15226   225.081753/s
     success_rate...................: 100.00% ✓ 15226      ✗ 0    
     vus............................: 88      min=0        max=500
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

     checks.........................: 100.00% ✓ 44634      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=14.06µs  min=962ns   med=3.15µs   max=3.89ms  p(90)=4.89µs   p(95)=6.56µs  p(99.9)=2.14ms  
     http_req_connecting............: avg=9.17µs   min=0s      med=0s       max=3.85ms  p(90)=0s       p(95)=0s      p(99.9)=2.08ms  
     http_req_duration..............: avg=915.97ms min=7.94ms  med=830.56ms max=3.27s   p(90)=1.88s    p(95)=1.98s   p(99.9)=2.92s   
       { expected_response:true }...: avg=915.97ms min=7.94ms  med=830.56ms max=3.27s   p(90)=1.88s    p(95)=1.98s   p(99.9)=2.92s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15878
     http_req_receiving.............: avg=105.95µs min=32.37µs med=91.02µs  max=83.83ms p(90)=131.24µs p(95)=147.2µs p(99.9)=923.42µs
     http_req_sending...............: avg=46.53µs  min=5.04µs  med=17.22µs  max=92.24ms p(90)=22.58µs  p(95)=27.65µs p(99.9)=3.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=915.82ms min=7.84ms  med=830.47ms max=3.27s   p(90)=1.88s    p(95)=1.98s   p(99.9)=2.92s   
     http_reqs......................: 15878   230.559096/s
     iteration_duration.............: avg=977.5ms  min=51.04ms med=911.78ms max=3.28s   p(90)=1.91s    p(95)=1.99s   p(99.9)=2.93s   
     iterations.....................: 14878   216.038432/s
     success_rate...................: 100.00% ✓ 14878      ✗ 0    
     vus............................: 3       min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

