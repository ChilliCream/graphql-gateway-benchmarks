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
| hive-router | v0.0.84 | 2,739 | 2,843 | 2,707 | 1.9% |  |
| fusion-nightly | 16.6.2-p.6 | 2,590 | 2,687 | 2,580 | 1.5% |  |
| fusion-nightly-net11 | 16.6.2-p.6 | 2,569 | 2,675 | 2,543 | 1.9% |  |
| fusion | 16.6.1 | 2,554 | 2,648 | 2,532 | 1.6% |  |
| fusion-nightly-fed | 16.6.2-p.6 | 2,311 | 2,402 | 2,300 | 1.5% |  |
| cosmo | 0.334.0 | 1,228 | 1,271 | 1,222 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 575 | 588 | 572 | 1.0% |  |
| hive-gateway | 2.10.8 | 253 | 262 | 251 | 1.3% |  |
| apollo-gateway | 2.14.3 | 232 | 237 | 229 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (17105 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (525160 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,409 | 2,550 | 2,389 | 2.3% |  |
| fusion | 16.6.1 | 2,396 | 2,513 | 2,315 | 2.7% |  |
| fusion-nightly-net11 | 16.6.2-p.6 | 2,383 | 2,485 | 2,370 | 1.7% |  |
| fusion-nightly | 16.6.2-p.6 | 2,327 | 2,449 | 2,308 | 2.2% |  |
| fusion-nightly-fed | 16.6.2-p.6 | 2,159 | 2,251 | 2,144 | 1.6% |  |
| cosmo | 0.334.0 | 1,159 | 1,199 | 1,152 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 525 | 538 | 522 | 1.1% |  |
| hive-gateway | 2.10.8 | 240 | 245 | 237 | 0.9% |  |
| apollo-gateway | 2.14.3 | 234 | 237 | 231 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (24139 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (279324 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 503256      ✗ 0     
     data_received..................: 15 GB   240 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=12.56µs  min=941ns  med=2.05µs  max=42.29ms  p(90)=3.4µs    p(95)=4.42µs   p(99.9)=682.01µs
     http_req_connecting............: avg=9.79µs   min=0s     med=0s      max=42.22ms  p(90)=0s       p(95)=0s       p(99.9)=631.84µs
     http_req_duration..............: avg=84.25ms  min=1.31ms med=80.15ms max=307.84ms p(90)=162.31ms p(95)=174.15ms p(99.9)=216.62ms
       { expected_response:true }...: avg=84.25ms  min=1.31ms med=80.15ms max=307.84ms p(90)=162.31ms p(95)=174.15ms p(99.9)=216.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168752
     http_req_receiving.............: avg=109.44µs min=24.8µs med=48.16µs max=60.75ms  p(90)=110.92µs p(95)=296.79µs p(99.9)=10.03ms 
     http_req_sending...............: avg=59.72µs  min=3.95µs med=8.77µs  max=217.3ms  p(90)=16.31µs  p(95)=104.53µs p(99.9)=7.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.08ms  min=1.26ms med=79.98ms max=297.6ms  p(90)=162.09ms p(95)=173.94ms p(99.9)=215.4ms 
     http_reqs......................: 168752  2739.475435/s
     iteration_duration.............: avg=84.98ms  min=1.98ms med=81.04ms max=316.94ms p(90)=162.67ms p(95)=174.49ms p(99.9)=218.08ms
     iterations.....................: 167752  2723.241699/s
     success_rate...................: 100.00% ✓ 167752      ✗ 0     
     vus............................: 84      min=0         max=493 
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

     checks.........................: 100.00% ✓ 481752      ✗ 0     
     data_received..................: 14 GB   227 MB/s
     data_sent......................: 194 MB  3.1 MB/s
     http_req_blocked...............: avg=14.75µs min=861ns   med=2.03µs  max=56.1ms   p(90)=3.4µs    p(95)=4.44µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=12.03µs min=0s      med=0s      max=56.05ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=88.03ms min=1.94ms  med=76.16ms max=1.3s     p(90)=168.26ms p(95)=194.15ms p(99.9)=599.06ms
       { expected_response:true }...: avg=88.03ms min=1.94ms  med=76.16ms max=1.3s     p(90)=168.26ms p(95)=194.15ms p(99.9)=599.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161584
     http_req_receiving.............: avg=1.09ms  min=48.14µs med=92.3µs  max=725.74ms p(90)=1.28ms   p(95)=3.44ms   p(99.9)=78.68ms 
     http_req_sending...............: avg=61.5µs  min=4.36µs  med=8.44µs  max=271.52ms p(90)=15.84µs  p(95)=101.45µs p(99.9)=8.04ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.88ms min=1.86ms  med=75.13ms max=1.3s     p(90)=166.58ms p(95)=191.79ms p(99.9)=587.83ms
     http_reqs......................: 161584  2590.964714/s
     iteration_duration.............: avg=88.83ms min=2.94ms  med=77ms    max=1.3s     p(90)=168.79ms p(95)=194.99ms p(99.9)=599.74ms
     iterations.....................: 160584  2574.929929/s
     success_rate...................: 100.00% ✓ 160584      ✗ 0     
     vus............................: 73      min=0         max=494 
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

     checks.........................: 100.00% ✓ 475821      ✗ 0     
     data_received..................: 14 GB   225 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=18.28µs  min=862ns   med=2.34µs   max=59.25ms  p(90)=3.83µs   p(95)=4.86µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=15.13µs  min=0s      med=0s       max=59.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=89.08ms  min=1.88ms  med=84.29ms  max=323.13ms p(90)=171.22ms p(95)=187.79ms p(99.9)=241.62ms
       { expected_response:true }...: avg=89.08ms  min=1.88ms  med=84.29ms  max=323.13ms p(90)=171.22ms p(95)=187.79ms p(99.9)=241.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159607
     http_req_receiving.............: avg=644.05µs min=50.44µs med=106.12µs max=287.38ms p(90)=1.19ms   p(95)=2.14ms   p(99.9)=29.27ms 
     http_req_sending...............: avg=66.75µs  min=4.42µs  med=9.18µs   max=257ms    p(90)=17.28µs  p(95)=110.5µs  p(99.9)=8.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.37ms  min=1.8ms   med=83.58ms  max=303.08ms p(90)=170.4ms  p(95)=186.96ms p(99.9)=240.09ms
     http_reqs......................: 159607  2569.313895/s
     iteration_duration.............: avg=89.89ms  min=3.72ms  med=85.2ms   max=346.73ms p(90)=171.68ms p(95)=188.23ms p(99.9)=242.56ms
     iterations.....................: 158607  2553.216143/s
     success_rate...................: 100.00% ✓ 158607      ✗ 0     
     vus............................: 61      min=0         max=497 
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

     checks.........................: 100.00% ✓ 473892      ✗ 0     
     data_received..................: 14 GB   224 MB/s
     data_sent......................: 191 MB  3.1 MB/s
     http_req_blocked...............: avg=33.99µs min=852ns   med=2.11µs  max=106.91ms p(90)=3.55µs   p(95)=4.6µs    p(99.9)=2.49ms  
     http_req_connecting............: avg=31.12µs min=0s      med=0s      max=106.86ms p(90)=0s       p(95)=0s       p(99.9)=2.37ms  
     http_req_duration..............: avg=89.45ms min=1.91ms  med=80.31ms max=1.48s    p(90)=170.88ms p(95)=194.82ms p(99.9)=581.08ms
       { expected_response:true }...: avg=89.45ms min=1.91ms  med=80.31ms max=1.48s    p(90)=170.88ms p(95)=194.82ms p(99.9)=581.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158964
     http_req_receiving.............: avg=1.18ms  min=50.66µs med=94.79µs max=521.38ms p(90)=1.49ms   p(95)=3.94ms   p(99.9)=70.03ms 
     http_req_sending...............: avg=65.57µs min=4.46µs  med=8.97µs  max=99.71ms  p(90)=16.77µs  p(95)=102.53µs p(99.9)=8.59ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.19ms min=1.83ms  med=79.17ms max=1.48s    p(90)=169.23ms p(95)=192.16ms p(99.9)=568.39ms
     http_reqs......................: 158964  2554.823014/s
     iteration_duration.............: avg=90.29ms min=2.6ms   med=81.22ms max=1.48s    p(90)=171.41ms p(95)=195.49ms p(99.9)=581.66ms
     iterations.....................: 157964  2538.751306/s
     success_rate...................: 100.00% ✓ 157964      ✗ 0     
     vus............................: 69      min=0         max=496 
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

     checks.........................: 100.00% ✓ 427332      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=16.89µs  min=1.05µs  med=2.65µs   max=97.28ms  p(90)=4.21µs   p(95)=5.26µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=13.5µs   min=0s      med=0s       max=97.2ms   p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=99.22ms  min=1.66ms  med=85.96ms  max=2.14s    p(90)=186.9ms  p(95)=217.31ms p(99.9)=674.47ms
       { expected_response:true }...: avg=99.22ms  min=1.66ms  med=85.96ms  max=2.14s    p(90)=186.9ms  p(95)=217.31ms p(99.9)=674.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143444
     http_req_receiving.............: avg=1.28ms   min=52.86µs med=105.54µs max=493.49ms p(90)=1.62ms   p(95)=3.94ms   p(99.9)=84.52ms 
     http_req_sending...............: avg=63.44µs  min=4.79µs  med=10.1µs   max=94.55ms  p(90)=18.26µs  p(95)=110.21µs p(99.9)=8.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.87ms  min=1.59ms  med=84.76ms  max=2.14s    p(90)=185.21ms p(95)=214.63ms p(99.9)=671.97ms
     http_reqs......................: 143444  2311.934874/s
     iteration_duration.............: avg=100.19ms min=2.79ms  med=87.08ms  max=2.14s    p(90)=187.48ms p(95)=218.04ms p(99.9)=676.26ms
     iterations.....................: 142444  2295.81754/s
     success_rate...................: 100.00% ✓ 142444      ✗ 0     
     vus............................: 59      min=0         max=498 
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

     checks.........................: 100.00% ✓ 227388      ✗ 0    
     data_received..................: 6.7 GB  108 MB/s
     data_sent......................: 92 MB   1.5 MB/s
     http_req_blocked...............: avg=6.13µs   min=972ns   med=2.67µs   max=21.44ms  p(90)=4.37µs   p(95)=5.36µs   p(99.9)=526µs   
     http_req_connecting............: avg=2.79µs   min=0s      med=0s       max=21.25ms  p(90)=0s       p(95)=0s       p(99.9)=447.16µs
     http_req_duration..............: avg=185.76ms min=1.91ms  med=188.66ms max=475.62ms p(90)=343.62ms p(95)=367.82ms p(99.9)=438.11ms
       { expected_response:true }...: avg=185.76ms min=1.91ms  med=188.66ms max=475.62ms p(90)=343.62ms p(95)=367.82ms p(99.9)=438.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 76796
     http_req_receiving.............: avg=74.92µs  min=26.28µs med=59.92µs  max=79.46ms  p(90)=97.34µs  p(95)=111.89µs p(99.9)=1.09ms  
     http_req_sending...............: avg=31.39µs  min=5.1µs   med=11.25µs  max=111.73ms p(90)=18.22µs  p(95)=22.17µs  p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.65ms min=1.8ms   med=188.56ms max=475.57ms p(90)=343.53ms p(95)=367.71ms p(99.9)=438.02ms
     http_reqs......................: 76796   1228.969384/s
     iteration_duration.............: avg=188.45ms min=3.97ms  med=191.4ms  max=475.8ms  p(90)=344.51ms p(95)=368.49ms p(99.9)=438.46ms
     iterations.....................: 75796   1212.966345/s
     success_rate...................: 100.00% ✓ 75796       ✗ 0    
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

     checks.........................: 100.00% ✓ 107850     ✗ 0    
     data_received..................: 3.2 GB  51 MB/s
     data_sent......................: 44 MB   691 kB/s
     http_req_blocked...............: avg=8.8µs    min=1.07µs  med=3.13µs   max=13.19ms p(90)=4.88µs   p(95)=5.92µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=4.54µs   min=0s      med=0s       max=13.11ms p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=388.07ms min=3.43ms  med=359.33ms max=1.56s   p(90)=759.05ms p(95)=823.93ms p(99.9)=1.21s   
       { expected_response:true }...: avg=388.07ms min=3.43ms  med=359.33ms max=1.56s   p(90)=759.05ms p(95)=823.93ms p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36950
     http_req_receiving.............: avg=83.65µs  min=31.22µs med=70.37µs  max=91.64ms p(90)=109.96µs p(95)=125.24µs p(99.9)=991.41µs
     http_req_sending...............: avg=37.87µs  min=5.38µs  med=14.19µs  max=166.5ms p(90)=21.67µs  p(95)=24.89µs  p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.94ms min=3.33ms  med=359.23ms max=1.56s   p(90)=758.97ms p(95)=823.87ms p(99.9)=1.21s   
     http_reqs......................: 36950   575.544529/s
     iteration_duration.............: avg=399.12ms min=23.06ms med=372.48ms max=1.56s   p(90)=762.52ms p(95)=826.84ms p(99.9)=1.22s   
     iterations.....................: 35950   559.968223/s
     success_rate...................: 100.00% ✓ 35950      ✗ 0    
     vus............................: 66      min=0        max=496
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

     checks.........................: 100.00% ✓ 48447      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   305 kB/s
     http_req_blocked...............: avg=14.27µs  min=1.41µs  med=3.8µs    max=3.64ms  p(90)=5.65µs   p(95)=7.19µs   p(99.9)=2.53ms
     http_req_connecting............: avg=8.81µs   min=0s      med=0s       max=3.58ms  p(90)=0s       p(95)=0s       p(99.9)=2.5ms 
     http_req_duration..............: avg=831.44ms min=5.7ms   med=720.99ms max=16.95s  p(90)=1.45s    p(95)=1.65s    p(99.9)=15.73s
       { expected_response:true }...: avg=831.44ms min=5.7ms   med=720.99ms max=16.95s  p(90)=1.45s    p(95)=1.65s    p(99.9)=15.73s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17149
     http_req_receiving.............: avg=98.92µs  min=36.24µs med=91.12µs  max=17.17ms p(90)=130.08µs p(95)=146.73µs p(99.9)=1.34ms
     http_req_sending...............: avg=28.2µs   min=6.4µs   med=18.27µs  max=28.93ms p(90)=24.37µs  p(95)=28.38µs  p(99.9)=2.18ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=831.32ms min=5.61ms  med=720.88ms max=16.95s  p(90)=1.45s    p(95)=1.65s    p(99.9)=15.73s
     http_reqs......................: 17149   253.49104/s
     iteration_duration.............: avg=882.1ms  min=46.76ms med=781.27ms max=16.95s  p(90)=1.47s    p(95)=1.66s    p(99.9)=15.76s
     iterations.....................: 16148   238.694577/s
     success_rate...................: 100.00% ✓ 16149      ✗ 0    
     vus............................: 96      min=0        max=500
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

     checks.........................: 100.00% ✓ 47976      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   285 kB/s
     http_req_blocked...............: avg=11.32µs  min=1.13µs  med=3.28µs   max=3.61ms  p(90)=4.95µs  p(95)=6.37µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=6.11µs   min=0s      med=0s       max=3.54ms  p(90)=0s      p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=389.42ms min=7.46ms  med=457.46ms max=1.04s   p(90)=642.1ms p(95)=680.61ms p(99.9)=954.26ms
       { expected_response:true }...: avg=389.42ms min=7.46ms  med=457.46ms max=1.04s   p(90)=642.1ms p(95)=680.61ms p(99.9)=954.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16992
     http_req_receiving.............: avg=91.98µs  min=34.89µs med=84.28µs  max=18.42ms p(90)=123.7µs p(95)=137.41µs p(99.9)=856.07µs
     http_req_sending...............: avg=36.3µs   min=5.72µs  med=16.88µs  max=68.69ms p(90)=22.51µs p(95)=26.71µs  p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.29ms min=7.32ms  med=457.35ms max=1.04s   p(90)=642ms   p(95)=680.54ms p(99.9)=954.12ms
     http_reqs......................: 16992   232.486152/s
     iteration_duration.............: avg=413.74ms min=8.81ms  med=477.08ms max=1.04s   p(90)=644.8ms p(95)=687.51ms p(99.9)=965.77ms
     iterations.....................: 15992   218.804058/s
     success_rate...................: 100.00% ✓ 15992      ✗ 0    
     vus............................: 57      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 445518      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=14.57µs  min=932ns   med=2.49µs  max=51.65ms  p(90)=4.45µs   p(95)=5.71µs   p(99.9)=1.31ms  
     http_req_connecting............: avg=11.17µs  min=0s      med=0s      max=51.48ms  p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=95.13ms  min=1.6ms   med=90.29ms max=315.37ms p(90)=183.65ms p(95)=198.15ms p(99.9)=243.62ms
       { expected_response:true }...: avg=95.13ms  min=1.6ms   med=90.29ms max=315.37ms p(90)=183.65ms p(95)=198.15ms p(99.9)=243.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149506
     http_req_receiving.............: avg=128.49µs min=22.75µs med=53.67µs max=207.3ms  p(90)=132.44µs p(95)=340.06µs p(99.9)=11.69ms 
     http_req_sending...............: avg=64.19µs  min=4.85µs  med=10.21µs max=111.32ms p(90)=20.99µs  p(95)=119.93µs p(99.9)=8.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.94ms  min=1.54ms  med=90.1ms  max=300.87ms p(90)=183.42ms p(95)=197.83ms p(99.9)=241.91ms
     http_reqs......................: 149506  2409.714452/s
     iteration_duration.............: avg=96.02ms  min=3.15ms  med=91.3ms  max=341.47ms p(90)=184.1ms  p(95)=198.57ms p(99.9)=244.83ms
     iterations.....................: 148506  2393.596608/s
     success_rate...................: 100.00% ✓ 148506      ✗ 0     
     vus............................: 60      min=0         max=498 
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

     checks.........................: 100.00% ✓ 442518      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=17.2µs  min=881ns   med=2.25µs   max=58.26ms  p(90)=4.01µs   p(95)=5.2µs    p(99.9)=1.87ms  
     http_req_connecting............: avg=14.04µs min=0s      med=0s       max=58ms     p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=95.79ms min=1.52ms  med=81.64ms  max=1.54s    p(90)=181.86ms p(95)=208.11ms p(99.9)=740.57ms
       { expected_response:true }...: avg=95.79ms min=1.52ms  med=81.64ms  max=1.54s    p(90)=181.86ms p(95)=208.11ms p(99.9)=740.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148506
     http_req_receiving.............: avg=1.63ms  min=52.97µs med=102.74µs max=955.74ms p(90)=1.6ms    p(95)=4.33ms   p(99.9)=108.91ms
     http_req_sending...............: avg=64.42µs min=4.67µs  med=9.17µs   max=184.96ms p(90)=19.49µs  p(95)=106.2µs  p(99.9)=9.39ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.1ms  min=1.41ms  med=80.43ms  max=1.54s    p(90)=180.23ms p(95)=204.73ms p(99.9)=674.21ms
     http_reqs......................: 148506  2396.877911/s
     iteration_duration.............: avg=96.7ms  min=2.84ms  med=82.75ms  max=1.54s    p(90)=182.36ms p(95)=208.94ms p(99.9)=740.89ms
     iterations.....................: 147506  2380.737971/s
     success_rate...................: 100.00% ✓ 147506      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 438882      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=22.44µs  min=1µs     med=2.9µs    max=71.86ms  p(90)=4.68µs   p(95)=5.89µs   p(99.9)=2.89ms  
     http_req_connecting............: avg=18.65µs  min=0s      med=0s       max=71.8ms   p(90)=0s       p(95)=0s       p(99.9)=2.67ms  
     http_req_duration..............: avg=96.54ms  min=1.41ms  med=92.2ms   max=500.97ms p(90)=184.82ms p(95)=203.41ms p(99.9)=270.24ms
       { expected_response:true }...: avg=96.54ms  min=1.41ms  med=92.2ms   max=500.97ms p(90)=184.82ms p(95)=203.41ms p(99.9)=270.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147294
     http_req_receiving.............: avg=698.56µs min=54.54µs med=114.19µs max=126.15ms p(90)=1.31ms   p(95)=2.41ms   p(99.9)=28.45ms 
     http_req_sending...............: avg=73.54µs  min=4.92µs  med=10.95µs  max=61.21ms  p(90)=21.84µs  p(95)=128.93µs p(99.9)=10.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.77ms  min=1.33ms  med=91.42ms  max=500.86ms p(90)=183.93ms p(95)=202.5ms  p(99.9)=268.21ms
     http_reqs......................: 147294  2383.408942/s
     iteration_duration.............: avg=97.47ms  min=3.21ms  med=93.16ms  max=501.18ms p(90)=185.38ms p(95)=203.96ms p(99.9)=271.15ms
     iterations.....................: 146294  2367.227638/s
     success_rate...................: 100.00% ✓ 146294      ✗ 0     
     vus............................: 93      min=0         max=500 
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

     checks.........................: 100.00% ✓ 429687      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=16.26µs min=871ns   med=2.25µs   max=79.08ms  p(90)=3.86µs   p(95)=4.96µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=13.08µs min=0s      med=0s       max=79.01ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=98.64ms min=1.51ms  med=87.45ms  max=1.39s    p(90)=187.59ms p(95)=214.68ms p(99.9)=676.49ms
       { expected_response:true }...: avg=98.64ms min=1.51ms  med=87.45ms  max=1.39s    p(90)=187.59ms p(95)=214.68ms p(99.9)=676.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144229
     http_req_receiving.............: avg=1.58ms  min=52.82µs med=108.92µs max=552.38ms p(90)=1.86ms   p(95)=4.77ms   p(99.9)=107.24ms
     http_req_sending...............: avg=63.11µs min=4.68µs  med=9.48µs   max=167.09ms p(90)=19.44µs  p(95)=104.08µs p(99.9)=7.9ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.99ms min=1.43ms  med=86.26ms  max=1.39s    p(90)=185.4ms  p(95)=210.86ms p(99.9)=639.97ms
     http_reqs......................: 144229  2327.733061/s
     iteration_duration.............: avg=99.59ms min=3.11ms  med=88.52ms  max=1.39s    p(90)=188.16ms p(95)=215.42ms p(99.9)=677.78ms
     iterations.....................: 143229  2311.593914/s
     success_rate...................: 100.00% ✓ 143229      ✗ 0     
     vus............................: 56      min=0         max=499 
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

     checks.........................: 100.00% ✓ 400275      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=17.45µs  min=961ns   med=2.87µs   max=117.76ms p(90)=4.7µs    p(95)=5.93µs   p(99.9)=1.13ms  
     http_req_connecting............: avg=13.9µs   min=0s      med=0s       max=117.69ms p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=105.91ms min=1.85ms  med=91.27ms  max=2.04s    p(90)=197.41ms p(95)=231.87ms p(99.9)=839.87ms
       { expected_response:true }...: avg=105.91ms min=1.85ms  med=91.27ms  max=2.04s    p(90)=197.41ms p(95)=231.87ms p(99.9)=839.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134425
     http_req_receiving.............: avg=1.71ms   min=52.76µs med=115.06µs max=1.43s    p(90)=1.88ms   p(95)=4.78ms   p(99.9)=105.84ms
     http_req_sending...............: avg=68.98µs  min=4.73µs  med=11.04µs  max=181.32ms p(90)=21.31µs  p(95)=118.49µs p(99.9)=9.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.13ms min=1.75ms  med=90.15ms  max=2.04s    p(90)=195.18ms p(95)=228.23ms p(99.9)=821.96ms
     http_reqs......................: 134425  2159.295247/s
     iteration_duration.............: avg=106.99ms min=3.51ms  med=92.44ms  max=2.04s    p(90)=198.08ms p(95)=232.7ms  p(99.9)=840.42ms
     iterations.....................: 133425  2143.23205/s
     success_rate...................: 100.00% ✓ 133425      ✗ 0     
     vus............................: 75      min=0         max=495 
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

     checks.........................: 100.00% ✓ 214704      ✗ 0    
     data_received..................: 6.3 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=4.74µs   min=982ns   med=2.35µs   max=7.13ms   p(90)=4.12µs   p(95)=5.08µs   p(99.9)=316.23µs
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=7.06ms   p(90)=0s       p(95)=0s       p(99.9)=288.73µs
     http_req_duration..............: avg=196.62ms min=1.9ms   med=197.69ms max=514.53ms p(90)=363.6ms  p(95)=389ms    p(99.9)=465.69ms
       { expected_response:true }...: avg=196.62ms min=1.9ms   med=197.69ms max=514.53ms p(90)=363.6ms  p(95)=389ms    p(99.9)=465.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72568
     http_req_receiving.............: avg=76.18µs  min=27.18µs med=62.19µs  max=198.22ms p(90)=103.19µs p(95)=118.17µs p(99.9)=915.75µs
     http_req_sending...............: avg=25.97µs  min=5.13µs  med=11.21µs  max=102.06ms p(90)=18.78µs  p(95)=22.53µs  p(99.9)=2.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.52ms min=1.82ms  med=197.57ms max=514.44ms p(90)=363.5ms  p(95)=388.91ms p(99.9)=465.62ms
     http_reqs......................: 72568   1159.967368/s
     iteration_duration.............: avg=199.61ms min=4.32ms  med=200.96ms max=514.73ms p(90)=364.44ms p(95)=389.65ms p(99.9)=465.98ms
     iterations.....................: 71568   1143.98281/s
     success_rate...................: 100.00% ✓ 71568       ✗ 0    
     vus............................: 84      min=0         max=495
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

     checks.........................: 100.00% ✓ 98997      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   631 kB/s
     http_req_blocked...............: avg=7.78µs   min=1.07µs  med=2.68µs   max=3.84ms   p(90)=4.4µs    p(95)=5.38µs   p(99.9)=1.13ms 
     http_req_connecting............: avg=4.16µs   min=0s      med=0s       max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=1.11ms 
     http_req_duration..............: avg=422.07ms min=3.84ms  med=392.94ms max=2s       p(90)=830.91ms p(95)=900.33ms p(99.9)=1.32s  
       { expected_response:true }...: avg=422.07ms min=3.84ms  med=392.94ms max=2s       p(90)=830.91ms p(95)=900.33ms p(99.9)=1.32s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 33999
     http_req_receiving.............: avg=233.72µs min=30.38µs med=70.43µs  max=235.73ms p(90)=110.22µs p(95)=124.22µs p(99.9)=41.43ms
     http_req_sending...............: avg=36.71µs  min=5.08µs  med=13.24µs  max=264.28ms p(90)=20.5µs   p(95)=23.52µs  p(99.9)=1.96ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=421.8ms  min=3.74ms  med=392.86ms max=2s       p(90)=830.83ms p(95)=900.23ms p(99.9)=1.32s  
     http_reqs......................: 33999   525.81773/s
     iteration_duration.............: avg=435.05ms min=5.45ms  med=409.94ms max=2s       p(90)=834.72ms p(95)=903.54ms p(99.9)=1.32s  
     iterations.....................: 32999   510.352047/s
     success_rate...................: 100.00% ✓ 32999      ✗ 0    
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

     checks.........................: 100.00% ✓ 45858      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   289 kB/s
     http_req_blocked...............: avg=16.03µs  min=1.34µs  med=3.61µs   max=12.41ms p(90)=5.46µs  p(95)=7.09µs   p(99.9)=2.36ms
     http_req_connecting............: avg=10.57µs  min=0s      med=0s       max=12.35ms p(90)=0s      p(95)=0s       p(99.9)=2.34ms
     http_req_duration..............: avg=895.37ms min=5.82ms  med=784.67ms max=5.52s   p(90)=1.77s   p(95)=2.02s    p(99.9)=4.34s 
       { expected_response:true }...: avg=895.37ms min=5.82ms  med=784.67ms max=5.52s   p(90)=1.77s   p(95)=2.02s    p(99.9)=4.34s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16286
     http_req_receiving.............: avg=103.36µs min=34.67µs med=91.44µs  max=43.49ms p(90)=130µs   p(95)=146.12µs p(99.9)=1.22ms
     http_req_sending...............: avg=33.13µs  min=6.56µs  med=18.03µs  max=82.98ms p(90)=23.78µs p(95)=28.98µs  p(99.9)=2.37ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=895.24ms min=5.73ms  med=784.58ms max=5.52s   p(90)=1.77s   p(95)=2.02s    p(99.9)=4.34s 
     http_reqs......................: 16286   240.489616/s
     iteration_duration.............: avg=953.99ms min=44.34ms med=865.27ms max=5.53s   p(90)=1.79s   p(95)=2.04s    p(99.9)=4.36s 
     iterations.....................: 15286   225.722969/s
     success_rate...................: 100.00% ✓ 15286      ✗ 0    
     vus............................: 90      min=0        max=500
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

     checks.........................: 100.00% ✓ 45414      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=21.29µs  min=1.23µs  med=3.8µs    max=9.56ms  p(90)=5.74µs   p(95)=7.71µs   p(99.9)=4.02ms
     http_req_connecting............: avg=15.25µs  min=0s      med=0s       max=9.52ms  p(90)=0s       p(95)=0s       p(99.9)=3.71ms
     http_req_duration..............: avg=899.78ms min=7.88ms  med=804.16ms max=3.24s   p(90)=1.85s    p(95)=2s       p(99.9)=2.84s 
       { expected_response:true }...: avg=899.78ms min=7.88ms  med=804.16ms max=3.24s   p(90)=1.85s    p(95)=2s       p(99.9)=2.84s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16138
     http_req_receiving.............: avg=107.13µs min=33.69µs med=95.62µs  max=55.69ms p(90)=137.21µs p(95)=155.35µs p(99.9)=1.37ms
     http_req_sending...............: avg=42.88µs  min=6.03µs  med=18.44µs  max=50.62ms p(90)=24.69µs  p(95)=30.05µs  p(99.9)=4.55ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=899.63ms min=7.79ms  med=804.05ms max=3.24s   p(90)=1.85s    p(95)=2s       p(99.9)=2.84s 
     http_reqs......................: 16138   234.518386/s
     iteration_duration.............: avg=959.19ms min=22.63ms med=884.4ms  max=3.25s   p(90)=1.87s    p(95)=2s       p(99.9)=2.85s 
     iterations.....................: 15138   219.986326/s
     success_rate...................: 100.00% ✓ 15138      ✗ 0    
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

