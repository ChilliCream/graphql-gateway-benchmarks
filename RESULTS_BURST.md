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
| hive-router | v0.0.84 | 2,917 | 3,060 | 2,890 | 2.1% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,607 | 2,706 | 2,597 | 1.4% |  |
| fusion-nightly | 16.7.0-p.7 | 2,542 | 2,651 | 2,532 | 1.6% |  |
| fusion | 16.6.6 | 2,514 | 2,620 | 2,491 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,399 | 2,491 | 2,387 | 1.5% |  |
| cosmo | 0.334.0 | 1,235 | 1,277 | 1,231 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 566 | 582 | 561 | 1.2% |  |
| hive-gateway | 2.10.8 | 248 | 256 | 244 | 1.4% |  |
| apollo-gateway | 2.14.3 | 230 | 237 | 228 | 1.1% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (3575 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (540382 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.6 | 2,433 | 2,523 | 2,418 | 1.5% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,344 | 2,439 | 2,322 | 1.7% |  |
| fusion-nightly | 16.7.0-p.7 | 2,314 | 2,417 | 2,304 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,235 | 2,322 | 2,215 | 1.6% |  |
| hive-router | v0.0.84 | 2,223 | 2,363 | 2,212 | 2.3% |  |
| cosmo | 0.334.0 | 1,135 | 1,174 | 1,128 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 523 | 538 | 521 | 1.0% |  |
| hive-gateway | 2.10.8 | 240 | 246 | 239 | 0.9% |  |
| apollo-gateway | 2.14.3 | 229 | 235 | 228 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (43426 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (413980 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 537012      ✗ 0     
     data_received..................: 16 GB   256 MB/s
     data_sent......................: 216 MB  3.5 MB/s
     http_req_blocked...............: avg=19.81µs  min=831ns   med=2.13µs  max=56.57ms  p(90)=3.63µs   p(95)=4.77µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=16.8µs   min=0s      med=0s      max=56.49ms  p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=78.93ms  min=1.43ms  med=74.33ms max=305.29ms p(90)=151.91ms p(95)=167.28ms p(99.9)=218.67ms
       { expected_response:true }...: avg=78.93ms  min=1.43ms  med=74.33ms max=305.29ms p(90)=151.91ms p(95)=167.28ms p(99.9)=218.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180004
     http_req_receiving.............: avg=161.78µs min=25.67µs med=50.35µs max=156.17ms p(90)=139.93µs p(95)=327.54µs p(99.9)=22.79ms 
     http_req_sending...............: avg=69.52µs  min=4.55µs  med=8.96µs  max=140.69ms p(90)=17.34µs  p(95)=112.85µs p(99.9)=9.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.7ms   min=1.36ms  med=74.13ms max=304.94ms p(90)=151.61ms p(95)=166.88ms p(99.9)=216.42ms
     http_reqs......................: 180004  2917.857532/s
     iteration_duration.............: avg=79.63ms  min=2.3ms   med=75.13ms max=335.02ms p(90)=152.36ms p(95)=167.76ms p(99.9)=220.22ms
     iterations.....................: 179004  2901.647572/s
     success_rate...................: 100.00% ✓ 179004      ✗ 0     
     vus............................: 88      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 483018      ✗ 0     
     data_received..................: 14 GB   229 MB/s
     data_sent......................: 195 MB  3.1 MB/s
     http_req_blocked...............: avg=15.95µs min=891ns   med=2.07µs   max=52.88ms  p(90)=3.63µs   p(95)=4.77µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=13.13µs min=0s      med=0s       max=52.76ms  p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=87.77ms min=1.88ms  med=83.49ms  max=336.29ms p(90)=167.91ms p(95)=183.51ms p(99.9)=245.98ms
       { expected_response:true }...: avg=87.77ms min=1.88ms  med=83.49ms  max=336.29ms p(90)=167.91ms p(95)=183.51ms p(99.9)=245.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 162006
     http_req_receiving.............: avg=1.39ms  min=52.01µs med=181.68µs max=122.65ms p(90)=3.41ms   p(95)=5.16ms   p(99.9)=35.15ms 
     http_req_sending...............: avg=62.37µs min=4.61µs  med=8.76µs   max=122.06ms p(90)=18.77µs  p(95)=106.38µs p(99.9)=8.3ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.32ms min=1.77ms  med=82ms     max=335.09ms p(90)=166.29ms p(95)=181.85ms p(99.9)=243.99ms
     http_reqs......................: 162006  2607.345358/s
     iteration_duration.............: avg=88.56ms min=4.92ms  med=84.4ms   max=336.5ms  p(90)=168.35ms p(95)=183.9ms  p(99.9)=247.09ms
     iterations.....................: 161006  2591.251229/s
     success_rate...................: 100.00% ✓ 161006      ✗ 0     
     vus............................: 63      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 472068      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 190 MB  3.1 MB/s
     http_req_blocked...............: avg=23.37µs min=951ns   med=2.59µs  max=92.08ms  p(90)=4.2µs    p(95)=5.3µs    p(99.9)=2.46ms  
     http_req_connecting............: avg=20.08µs min=0s      med=0s      max=92.03ms  p(90)=0s       p(95)=0s       p(99.9)=2.38ms  
     http_req_duration..............: avg=89.72ms min=1.89ms  med=78.59ms max=1.15s    p(90)=173.65ms p(95)=201.93ms p(99.9)=567.51ms
       { expected_response:true }...: avg=89.72ms min=1.89ms  med=78.59ms max=1.15s    p(90)=173.65ms p(95)=201.93ms p(99.9)=567.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158356
     http_req_receiving.............: avg=1.55ms  min=52.65µs med=99.75µs max=675.38ms p(90)=1.56ms   p(95)=4.48ms   p(99.9)=124.29ms
     http_req_sending...............: avg=76.09µs min=4.66µs  med=9.77µs  max=164.17ms p(90)=18.51µs  p(95)=115.21µs p(99.9)=10.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.09ms min=1.81ms  med=77.41ms max=1.15s    p(90)=171.76ms p(95)=199.52ms p(99.9)=546.21ms
     http_reqs......................: 158356  2542.079925/s
     iteration_duration.............: avg=90.63ms min=3.05ms  med=79.56ms max=1.15s    p(90)=174.44ms p(95)=203.08ms p(99.9)=569.55ms
     iterations.....................: 157356  2526.026982/s
     success_rate...................: 100.00% ✓ 157356      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 467277      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=15.85µs min=852ns   med=2.1µs   max=62.22ms  p(90)=3.55µs   p(95)=4.6µs    p(99.9)=1.58ms  
     http_req_connecting............: avg=12.67µs min=0s      med=0s      max=62.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=90.74ms min=1.93ms  med=81.51ms max=1.07s    p(90)=171.96ms p(95)=194.86ms p(99.9)=563.56ms
       { expected_response:true }...: avg=90.74ms min=1.93ms  med=81.51ms max=1.07s    p(90)=171.96ms p(95)=194.86ms p(99.9)=563.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156759
     http_req_receiving.............: avg=1.15ms  min=51.88µs med=96.36µs max=380.71ms p(90)=1.54ms   p(95)=3.95ms   p(99.9)=66.29ms 
     http_req_sending...............: avg=61.03µs min=4.72µs  med=8.89µs  max=210.2ms  p(90)=17.17µs  p(95)=100.99µs p(99.9)=8ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.52ms min=1.85ms  med=80.52ms max=1.07s    p(90)=169.95ms p(95)=192.28ms p(99.9)=562.56ms
     http_reqs......................: 156759  2514.716628/s
     iteration_duration.............: avg=91.56ms min=3.3ms   med=82.44ms max=1.07s    p(90)=172.51ms p(95)=195.41ms p(99.9)=563.88ms
     iterations.....................: 155759  2498.674699/s
     success_rate...................: 100.00% ✓ 155759      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443343      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=16.99µs min=871ns   med=2.09µs  max=52.45ms  p(90)=3.56µs   p(95)=4.64µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=14.18µs min=0s      med=0s      max=52.35ms  p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=95.62ms min=1.63ms  med=80.95ms max=1.58s    p(90)=179.89ms p(95)=214.87ms p(99.9)=864.56ms
       { expected_response:true }...: avg=95.62ms min=1.63ms  med=80.95ms max=1.58s    p(90)=179.89ms p(95)=214.87ms p(99.9)=864.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148781
     http_req_receiving.............: avg=1.48ms  min=52.18µs med=97.37µs max=678.69ms p(90)=1.63ms   p(95)=4.51ms   p(99.9)=101.04ms
     http_req_sending...............: avg=62.92µs min=4.53µs  med=8.81µs  max=159.53ms p(90)=16.67µs  p(95)=97.92µs  p(99.9)=8.6ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.08ms min=1.55ms  med=79.73ms max=1.58s    p(90)=178.07ms p(95)=210.29ms p(99.9)=851.54ms
     http_reqs......................: 148781  2399.203638/s
     iteration_duration.............: avg=96.54ms min=2.94ms  med=81.94ms max=1.58s    p(90)=180.5ms  p(95)=215.69ms p(99.9)=867.84ms
     iterations.....................: 147781  2383.077898/s
     success_rate...................: 100.00% ✓ 147781      ✗ 0     
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

     checks.........................: 100.00% ✓ 228618      ✗ 0    
     data_received..................: 6.8 GB  108 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=5.39µs   min=891ns   med=2.11µs   max=10.62ms  p(90)=3.74µs   p(95)=4.66µs   p(99.9)=412.47µs
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=10.46ms  p(90)=0s       p(95)=0s       p(99.9)=368.35µs
     http_req_duration..............: avg=184.77ms min=1.94ms  med=185.75ms max=475.82ms p(90)=341.65ms p(95)=364.23ms p(99.9)=430.11ms
       { expected_response:true }...: avg=184.77ms min=1.94ms  med=185.75ms max=475.82ms p(90)=341.65ms p(95)=364.23ms p(99.9)=430.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77206
     http_req_receiving.............: avg=74.56µs  min=27.22µs med=58µs     max=156.73ms p(90)=95.89µs  p(95)=110.57µs p(99.9)=1.14ms  
     http_req_sending...............: avg=26.84µs  min=4.75µs  med=9.69µs   max=98.46ms  p(90)=16.49µs  p(95)=20.2µs   p(99.9)=3.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.67ms min=1.85ms  med=185.62ms max=475.74ms p(90)=341.57ms p(95)=364.13ms p(99.9)=430.06ms
     http_reqs......................: 77206   1235.223979/s
     iteration_duration.............: avg=187.43ms min=3.84ms  med=188.52ms max=476.03ms p(90)=342.39ms p(95)=364.73ms p(99.9)=430.42ms
     iterations.....................: 76206   1219.224912/s
     success_rate...................: 100.00% ✓ 76206       ✗ 0    
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

     checks.........................: 100.00% ✓ 106332     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   681 kB/s
     http_req_blocked...............: avg=6.64µs   min=1µs     med=2.99µs   max=12.34ms  p(90)=4.72µs   p(95)=5.69µs   p(99.9)=454.72µs
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=12.27ms  p(90)=0s       p(95)=0s       p(99.9)=403.21µs
     http_req_duration..............: avg=393.51ms min=3.56ms  med=367.92ms max=1.51s    p(90)=779.39ms p(95)=846.86ms p(99.9)=1.25s   
       { expected_response:true }...: avg=393.51ms min=3.56ms  med=367.92ms max=1.51s    p(90)=779.39ms p(95)=846.86ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36444
     http_req_receiving.............: avg=78.75µs  min=28.88µs med=67.82µs  max=29.15ms  p(90)=106.41µs p(95)=120.94µs p(99.9)=894.13µs
     http_req_sending...............: avg=37.83µs  min=5.28µs  med=12.91µs  max=272.27ms p(90)=20.08µs  p(95)=23.29µs  p(99.9)=2.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=393.39ms min=3.51ms  med=367.78ms max=1.51s    p(90)=779.32ms p(95)=846.79ms p(99.9)=1.25s   
     http_reqs......................: 36444   566.882431/s
     iteration_duration.............: avg=404.85ms min=23.64ms med=380.49ms max=1.51s    p(90)=782.85ms p(95)=849.48ms p(99.9)=1.26s   
     iterations.....................: 35444   551.32754/s
     success_rate...................: 100.00% ✓ 35444      ✗ 0    
     vus............................: 68      min=0        max=495
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

     checks.........................: 100.00% ✓ 46983      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=14.18µs  min=1.41µs  med=3.63µs   max=12.11ms p(90)=5.32µs   p(95)=6.77µs   p(99.9)=2.16ms
     http_req_connecting............: avg=8.78µs   min=0s      med=0s       max=12.05ms p(90)=0s       p(95)=0s       p(99.9)=2.11ms
     http_req_duration..............: avg=854.51ms min=5.27ms  med=751.47ms max=18.35s  p(90)=1.48s    p(95)=1.65s    p(99.9)=16.93s
       { expected_response:true }...: avg=854.51ms min=5.27ms  med=751.47ms max=18.35s  p(90)=1.48s    p(95)=1.65s    p(99.9)=16.93s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16661
     http_req_receiving.............: avg=100.12µs min=32.93µs med=88.32µs  max=73.38ms p(90)=125.53µs p(95)=140.04µs p(99.9)=1.23ms
     http_req_sending...............: avg=32µs     min=6.14µs  med=17.96µs  max=22.45ms p(90)=23.54µs  p(95)=27.81µs  p(99.9)=3.66ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=854.38ms min=5.19ms  med=751.38ms max=18.35s  p(90)=1.48s    p(95)=1.65s    p(99.9)=16.92s
     http_reqs......................: 16661   248.641014/s
     iteration_duration.............: avg=909.12ms min=38.57ms med=821.48ms max=18.35s  p(90)=1.5s     p(95)=1.66s    p(99.9)=17s   
     iterations.....................: 15661   233.717479/s
     success_rate...................: 100.00% ✓ 15661      ✗ 0    
     vus............................: 51      min=0        max=500
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

     checks.........................: 100.00% ✓ 47625      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   283 kB/s
     http_req_blocked...............: avg=15.37µs  min=1.25µs  med=3.38µs   max=14.83ms  p(90)=5.02µs   p(95)=6.49µs   p(99.9)=2.32ms  
     http_req_connecting............: avg=10.27µs  min=0s      med=0s       max=14.78ms  p(90)=0s       p(95)=0s       p(99.9)=2.29ms  
     http_req_duration..............: avg=387.8ms  min=7.52ms  med=463.31ms max=1.2s     p(90)=649.26ms p(95)=706.59ms p(99.9)=988.71ms
       { expected_response:true }...: avg=387.8ms  min=7.52ms  med=463.31ms max=1.2s     p(90)=649.26ms p(95)=706.59ms p(99.9)=988.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16875
     http_req_receiving.............: avg=95.85µs  min=33.97µs med=83.39µs  max=56.88ms  p(90)=122.92µs p(95)=139.33µs p(99.9)=994.91µs
     http_req_sending...............: avg=36.54µs  min=6.07µs  med=16.67µs  max=119.84ms p(90)=22.29µs  p(95)=26.41µs  p(99.9)=2.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.67ms min=7.39ms  med=463.23ms max=1.2s     p(90)=649.11ms p(95)=706.45ms p(99.9)=988.57ms
     http_reqs......................: 16875   230.84215/s
     iteration_duration.............: avg=412.27ms min=8.43ms  med=476.15ms max=1.2s     p(90)=652.31ms p(95)=710ms    p(99.9)=998.05ms
     iterations.....................: 15875   217.162615/s
     success_rate...................: 100.00% ✓ 15875      ✗ 0    
     vus............................: 56      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 448551      ✗ 0     
     data_received..................: 13 GB   213 MB/s
     data_sent......................: 181 MB  2.9 MB/s
     http_req_blocked...............: avg=16.93µs min=851ns   med=2.28µs   max=61.78ms p(90)=3.98µs   p(95)=5.21µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=13.73µs min=0s      med=0s       max=61.7ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=94.58ms min=1.47ms  med=81.43ms  max=1.52s   p(90)=178.67ms p(95)=205.72ms p(99.9)=946.11ms
       { expected_response:true }...: avg=94.58ms min=1.47ms  med=81.43ms  max=1.52s   p(90)=178.67ms p(95)=205.72ms p(99.9)=946.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150517
     http_req_receiving.............: avg=1.57ms  min=52.35µs med=102.57µs max=1.07s   p(90)=1.72ms   p(95)=4.78ms   p(99.9)=109.54ms
     http_req_sending...............: avg=65.58µs min=4.7µs   med=9.53µs   max=223.1ms p(90)=18.97µs  p(95)=103.78µs p(99.9)=9.12ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.94ms min=1.4ms   med=80.31ms  max=1.46s   p(90)=176.86ms p(95)=202.47ms p(99.9)=901.4ms 
     http_reqs......................: 150517  2433.003726/s
     iteration_duration.............: avg=95.49ms min=2.53ms  med=82.45ms  max=1.52s   p(90)=179.3ms  p(95)=206.38ms p(99.9)=948.85ms
     iterations.....................: 149517  2416.839414/s
     success_rate...................: 100.00% ✓ 149517      ✗ 0     
     vus............................: 23      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431565      ✗ 0     
     data_received..................: 13 GB   206 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=19.25µs min=902ns  med=2.76µs   max=74.35ms  p(90)=4.63µs   p(95)=5.82µs   p(99.9)=2.14ms  
     http_req_connecting............: avg=15.68µs min=0s     med=0s       max=74.23ms  p(90)=0s       p(95)=0s       p(99.9)=2.04ms  
     http_req_duration..............: avg=98.18ms min=1.41ms med=93.23ms  max=436.6ms  p(90)=188.08ms p(95)=206.17ms p(99.9)=294.53ms
       { expected_response:true }...: avg=98.18ms min=1.41ms med=93.23ms  max=436.6ms  p(90)=188.08ms p(95)=206.17ms p(99.9)=294.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144855
     http_req_receiving.............: avg=1.51ms  min=54.3µs med=152.75µs max=325.26ms p(90)=3.42ms   p(95)=5.63ms   p(99.9)=48.13ms 
     http_req_sending...............: avg=69.41µs min=4.87µs med=10.31µs  max=177.45ms p(90)=21.76µs  p(95)=120.78µs p(99.9)=9.17ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.59ms min=1.32ms med=91.51ms  max=436.5ms  p(90)=186.31ms p(95)=204.26ms p(99.9)=287.62ms
     http_reqs......................: 144855  2344.39905/s
     iteration_duration.............: avg=99.13ms min=3.48ms med=94.31ms  max=436.82ms p(90)=188.6ms  p(95)=206.64ms p(99.9)=295.55ms
     iterations.....................: 143855  2328.214597/s
     success_rate...................: 100.00% ✓ 143855      ✗ 0     
     vus............................: 93      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 426756      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=16.52µs min=882ns   med=2.13µs   max=64.36ms  p(90)=3.65µs   p(95)=4.78µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=13.48µs min=0s      med=0s       max=64.19ms  p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=99.36ms min=1.57ms  med=84.32ms  max=1.77s    p(90)=184.69ms p(95)=214.48ms p(99.9)=772.5ms 
       { expected_response:true }...: avg=99.36ms min=1.57ms  med=84.32ms  max=1.77s    p(90)=184.69ms p(95)=214.48ms p(99.9)=772.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143252
     http_req_receiving.............: avg=1.68ms  min=51.73µs med=107.04µs max=1.36s    p(90)=1.98ms   p(95)=5.22ms   p(99.9)=82.62ms 
     http_req_sending...............: avg=64.4µs  min=4.76µs  med=9.06µs   max=129.68ms p(90)=17.72µs  p(95)=96.28µs  p(99.9)=8.51ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.61ms min=1.47ms  med=82.98ms  max=1.77s    p(90)=182.73ms p(95)=210.61ms p(99.9)=747.01ms
     http_reqs......................: 143252  2314.471149/s
     iteration_duration.............: avg=100.3ms min=2.99ms  med=85.38ms  max=1.77s    p(90)=185.18ms p(95)=215.2ms  p(99.9)=773.44ms
     iterations.....................: 142252  2298.314508/s
     success_rate...................: 100.00% ✓ 142252      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 414486      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=14.38µs  min=862ns   med=2.35µs   max=69.22ms  p(90)=4.12µs   p(95)=5.31µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=11.39µs  min=0s      med=0s       max=69.08ms  p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=102.24ms min=1.78ms  med=90.59ms  max=1.64s    p(90)=192.51ms p(95)=221.33ms p(99.9)=934.32ms
       { expected_response:true }...: avg=102.24ms min=1.78ms  med=90.59ms  max=1.64s    p(90)=192.51ms p(95)=221.33ms p(99.9)=934.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139162
     http_req_receiving.............: avg=1.54ms   min=51.91µs med=106.16µs max=881.49ms p(90)=1.55ms   p(95)=3.66ms   p(99.9)=94.65ms 
     http_req_sending...............: avg=59.65µs  min=4.69µs  med=10.03µs  max=65.24ms  p(90)=21.46µs  p(95)=104.51µs p(99.9)=7.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.63ms min=1.72ms  med=89.36ms  max=1.64s    p(90)=190.61ms p(95)=218.3ms  p(99.9)=790.59ms
     http_reqs......................: 139162  2235.219481/s
     iteration_duration.............: avg=103.26ms min=3.13ms  med=91.77ms  max=1.64s    p(90)=193.14ms p(95)=222.1ms  p(99.9)=935.6ms 
     iterations.....................: 138162  2219.157485/s
     success_rate...................: 100.00% ✓ 138162      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 409431      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=14.91µs  min=1.03µs  med=2.86µs  max=44.54ms  p(90)=4.64µs   p(95)=5.85µs   p(99.9)=777.64µs
     http_req_connecting............: avg=11.19µs  min=0s      med=0s      max=44.23ms  p(90)=0s       p(95)=0s       p(99.9)=734.79µs
     http_req_duration..............: avg=103.48ms min=1.53ms  med=98.81ms max=380.67ms p(90)=198.7ms  p(95)=214.63ms p(99.9)=262.78ms
       { expected_response:true }...: avg=103.48ms min=1.53ms  med=98.81ms max=380.67ms p(90)=198.7ms  p(95)=214.63ms p(99.9)=262.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137477
     http_req_receiving.............: avg=152.48µs min=27.44µs med=58.81µs max=276.81ms p(90)=126.88µs p(95)=349.84µs p(99.9)=9.4ms   
     http_req_sending...............: avg=60.84µs  min=5.1µs   med=11.38µs max=39.31ms  p(90)=20.59µs  p(95)=126.41µs p(99.9)=8.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.26ms min=1.46ms  med=98.64ms max=294.82ms p(90)=198.47ms p(95)=214.34ms p(99.9)=260.62ms
     http_reqs......................: 137477  2223.911716/s
     iteration_duration.............: avg=104.49ms min=3.41ms  med=99.96ms max=389.46ms p(90)=199.14ms p(95)=215.08ms p(99.9)=264.36ms
     iterations.....................: 136477  2207.735107/s
     success_rate...................: 100.00% ✓ 136477      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 210075      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=7.25µs   min=1.16µs  med=3.02µs   max=18.32ms  p(90)=4.85µs   p(95)=5.86µs   p(99.9)=477.94µs
     http_req_connecting............: avg=3.52µs   min=0s      med=0s       max=18.14ms  p(90)=0s       p(95)=0s       p(99.9)=429.18µs
     http_req_duration..............: avg=200.88ms min=1.96ms  med=202.79ms max=565.68ms p(90)=371.57ms p(95)=398.01ms p(99.9)=480.32ms
       { expected_response:true }...: avg=200.88ms min=1.96ms  med=202.79ms max=565.68ms p(90)=371.57ms p(95)=398.01ms p(99.9)=480.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71025
     http_req_receiving.............: avg=84.54µs  min=29.73µs med=67.42µs  max=151.48ms p(90)=109.08µs p(95)=125.52µs p(99.9)=1.26ms  
     http_req_sending...............: avg=30.55µs  min=5.47µs  med=12.4µs   max=63.72ms  p(90)=19.6µs   p(95)=23.57µs  p(99.9)=3.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.76ms min=1.86ms  med=202.68ms max=565.6ms  p(90)=371.43ms p(95)=397.93ms p(99.9)=480.23ms
     http_reqs......................: 71025   1135.064626/s
     iteration_duration.............: avg=204ms    min=5.13ms  med=206.05ms max=565.84ms p(90)=372.49ms p(95)=398.63ms p(99.9)=480.63ms
     iterations.....................: 70025   1119.083427/s
     success_rate...................: 100.00% ✓ 70025       ✗ 0    
     vus............................: 83      min=0         max=497
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

     checks.........................: 100.00% ✓ 98613      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   628 kB/s
     http_req_blocked...............: avg=10.63µs  min=1.12µs  med=3.34µs   max=109.42ms p(90)=5.11µs   p(95)=6.14µs   p(99.9)=622.16µs
     http_req_connecting............: avg=2.98µs   min=0s      med=0s       max=3.14ms   p(90)=0s       p(95)=0s       p(99.9)=519.39µs
     http_req_duration..............: avg=423.57ms min=3.83ms  med=399.18ms max=2.21s    p(90)=825.74ms p(95)=895.52ms p(99.9)=1.36s   
       { expected_response:true }...: avg=423.57ms min=3.83ms  med=399.18ms max=2.21s    p(90)=825.74ms p(95)=895.52ms p(99.9)=1.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33871
     http_req_receiving.............: avg=86.63µs  min=30.48µs med=77.2µs   max=26.39ms  p(90)=116.28µs p(95)=130.62µs p(99.9)=1.01ms  
     http_req_sending...............: avg=27.48µs  min=5.49µs  med=14.93µs  max=121.22ms p(90)=22.04µs  p(95)=25.05µs  p(99.9)=2.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=423.45ms min=3.77ms  med=399.06ms max=2.21s    p(90)=825.67ms p(95)=895.42ms p(99.9)=1.36s   
     http_reqs......................: 33871   523.203166/s
     iteration_duration.............: avg=436.7ms  min=18.16ms med=415.89ms max=2.21s    p(90)=830.87ms p(95)=898.42ms p(99.9)=1.37s   
     iterations.....................: 32871   507.75623/s
     success_rate...................: 100.00% ✓ 32871      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 45906      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   288 kB/s
     http_req_blocked...............: avg=14.27µs  min=1.13µs  med=3.23µs   max=7.48ms  p(90)=5µs      p(95)=6.72µs   p(99.9)=2.16ms
     http_req_connecting............: avg=9.28µs   min=0s      med=0s       max=7.19ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms
     http_req_duration..............: avg=893.98ms min=6.03ms  med=801.5ms  max=5.07s   p(90)=1.78s    p(95)=2s       p(99.9)=4.25s 
       { expected_response:true }...: avg=893.98ms min=6.03ms  med=801.5ms  max=5.07s   p(90)=1.78s    p(95)=2s       p(99.9)=4.25s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16302
     http_req_receiving.............: avg=101.41µs min=33µs    med=92.2µs   max=19.63ms p(90)=130.74µs p(95)=146.84µs p(99.9)=1.43ms
     http_req_sending...............: avg=35.96µs  min=5.5µs   med=17.15µs  max=38.02ms p(90)=22.89µs  p(95)=28.52µs  p(99.9)=4.33ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=893.84ms min=5.94ms  med=801.36ms max=5.07s   p(90)=1.78s    p(95)=2s       p(99.9)=4.25s 
     http_reqs......................: 16302   240.141791/s
     iteration_duration.............: avg=952.41ms min=42.23ms med=872.96ms max=5.08s   p(90)=1.79s    p(95)=2.01s    p(99.9)=4.3s  
     iterations.....................: 15302   225.410974/s
     success_rate...................: 100.00% ✓ 15302      ✗ 0    
     vus............................: 8       min=0        max=500
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

     checks.........................: 100.00% ✓ 44415      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   275 kB/s
     http_req_blocked...............: avg=16.45µs  min=1.55µs  med=3.65µs   max=11.22ms p(90)=5.48µs   p(95)=7.4µs    p(99.9)=2.31ms
     http_req_connecting............: avg=10.63µs  min=0s      med=0s       max=11.16ms p(90)=0s       p(95)=0s       p(99.9)=2.26ms
     http_req_duration..............: avg=919.27ms min=7.92ms  med=824.14ms max=3.29s   p(90)=1.89s    p(95)=1.98s    p(99.9)=2.99s 
       { expected_response:true }...: avg=919.27ms min=7.92ms  med=824.14ms max=3.29s   p(90)=1.89s    p(95)=1.98s    p(99.9)=2.99s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15805
     http_req_receiving.............: avg=119.8µs  min=35.67µs med=91.54µs  max=74.75ms p(90)=130.24µs p(95)=145.83µs p(99.9)=1.1ms 
     http_req_sending...............: avg=29.95µs  min=5.83µs  med=17.91µs  max=29.55ms p(90)=24.01µs  p(95)=29.15µs  p(99.9)=2.41ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=919.12ms min=7.84ms  med=824.04ms max=3.29s   p(90)=1.89s    p(95)=1.98s    p(99.9)=2.99s 
     http_reqs......................: 15805   229.22575/s
     iteration_duration.............: avg=981.29ms min=98.44ms med=904.69ms max=3.3s    p(90)=1.9s     p(95)=1.99s    p(99.9)=3s    
     iterations.....................: 14805   214.722381/s
     success_rate...................: 100.00% ✓ 14805      ✗ 0    
     vus............................: 29      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

