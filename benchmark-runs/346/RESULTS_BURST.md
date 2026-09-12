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
| hive-router | v0.0.84 | 2,903 | 3,048 | 2,887 | 2.1% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,579 | 2,681 | 2,566 | 1.5% |  |
| fusion-nightly | 16.7.0-p.6 | 2,536 | 2,632 | 2,493 | 1.6% |  |
| fusion | 16.6.6 | 2,468 | 2,568 | 2,446 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,398 | 2,488 | 2,392 | 1.4% |  |
| cosmo | 0.334.0 | 1,232 | 1,268 | 1,223 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 555 | 568 | 554 | 0.9% |  |
| hive-gateway | 2.10.8 | 255 | 261 | 254 | 0.9% |  |
| apollo-gateway | 2.14.3 | 237 | 243 | 236 | 0.9% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (4336 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (531722 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,464 | 2,554 | 2,446 | 1.5% |  |
| fusion-nightly | 16.7.0-p.6 | 2,417 | 2,501 | 2,406 | 1.3% |  |
| fusion | 16.6.6 | 2,382 | 2,487 | 2,370 | 1.7% |  |
| hive-router | v0.0.84 | 2,270 | 2,384 | 2,214 | 2.2% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,228 | 2,317 | 2,213 | 1.6% |  |
| cosmo | 0.334.0 | 1,113 | 1,159 | 1,107 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 532 | 542 | 527 | 0.8% |  |
| hive-gateway | 2.10.8 | 238 | 245 | 237 | 1.0% |  |
| apollo-gateway | 2.14.3 | 233 | 238 | 232 | 0.8% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (26855 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (219191 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 534639      ✗ 0     
     data_received..................: 16 GB   255 MB/s
     data_sent......................: 215 MB  3.5 MB/s
     http_req_blocked...............: avg=18.95µs  min=842ns   med=2.08µs  max=60.23ms  p(90)=3.6µs    p(95)=4.74µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=15.54µs  min=0s      med=0s      max=60.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=79.28ms  min=1.38ms  med=74.89ms max=334.43ms p(90)=152.04ms p(95)=165.9ms  p(99.9)=214.27ms
       { expected_response:true }...: avg=79.28ms  min=1.38ms  med=74.89ms max=334.43ms p(90)=152.04ms p(95)=165.9ms  p(99.9)=214.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179213
     http_req_receiving.............: avg=154.39µs min=24.75µs med=48.57µs max=226.36ms p(90)=130.08µs p(95)=318.15µs p(99.9)=20.61ms 
     http_req_sending...............: avg=67.99µs  min=4.34µs  med=8.86µs  max=136.72ms p(90)=17.24µs  p(95)=109.67µs p(99.9)=9.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.06ms  min=1.33ms  med=74.7ms  max=334.23ms p(90)=151.65ms p(95)=165.44ms p(99.9)=213.3ms 
     http_reqs......................: 179213  2903.136262/s
     iteration_duration.............: avg=79.98ms  min=2.03ms  med=75.66ms max=344.96ms p(90)=152.47ms p(95)=166.38ms p(99.9)=216.03ms
     iterations.....................: 178213  2886.9369/s
     success_rate...................: 100.00% ✓ 178213      ✗ 0     
     vus............................: 89      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 478137      ✗ 0     
     data_received..................: 14 GB   226 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=18.27µs min=882ns   med=2.14µs   max=62.05ms  p(90)=3.81µs   p(95)=4.98µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=15.19µs min=0s      med=0s       max=62ms     p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=88.64ms min=1.82ms  med=84.23ms  max=324.77ms p(90)=170.56ms p(95)=186.98ms p(99.9)=245.52ms
       { expected_response:true }...: avg=88.64ms min=1.82ms  med=84.23ms  max=324.77ms p(90)=170.56ms p(95)=186.98ms p(99.9)=245.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160379
     http_req_receiving.............: avg=1.43ms  min=51.98µs med=196.57µs max=183.69ms p(90)=3.49ms   p(95)=5.24ms   p(99.9)=33.59ms 
     http_req_sending...............: avg=67.09µs min=4.48µs  med=8.87µs   max=258.76ms p(90)=20.22µs  p(95)=109.33µs p(99.9)=9.27ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.14ms min=1.76ms  med=82.61ms  max=324.68ms p(90)=169.01ms p(95)=185.4ms  p(99.9)=243.15ms
     http_reqs......................: 160379  2579.14483/s
     iteration_duration.............: avg=89.46ms min=4.23ms  med=85.15ms  max=338.36ms p(90)=171.03ms p(95)=187.45ms p(99.9)=246.46ms
     iterations.....................: 159379  2563.063268/s
     success_rate...................: 100.00% ✓ 159379      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 470841      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=17.91µs min=852ns   med=2.11µs  max=86.81ms  p(90)=3.54µs   p(95)=4.65µs   p(99.9)=2.15ms  
     http_req_connecting............: avg=14.95µs min=0s      med=0s      max=86.64ms  p(90)=0s       p(95)=0s       p(99.9)=2.04ms  
     http_req_duration..............: avg=90.08ms min=1.94ms  med=79.65ms max=1.96s    p(90)=171.86ms p(95)=199.05ms p(99.9)=635.12ms
       { expected_response:true }...: avg=90.08ms min=1.94ms  med=79.65ms max=1.96s    p(90)=171.86ms p(95)=199.05ms p(99.9)=635.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157947
     http_req_receiving.............: avg=1.62ms  min=50.71µs med=96.05µs max=538.27ms p(90)=1.74ms   p(95)=5.21ms   p(99.9)=101.1ms 
     http_req_sending...............: avg=65.58µs min=4.59µs  med=8.99µs  max=211.51ms p(90)=16.76µs  p(95)=101.52µs p(99.9)=8.89ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.38ms min=1.83ms  med=78.64ms max=1.96s    p(90)=169.77ms p(95)=195.57ms p(99.9)=599.24ms
     http_reqs......................: 157947  2536.029092/s
     iteration_duration.............: avg=90.89ms min=3.35ms  med=80.49ms max=1.96s    p(90)=172.39ms p(95)=199.59ms p(99.9)=635.88ms
     iterations.....................: 156947  2519.972889/s
     success_rate...................: 100.00% ✓ 156947      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 458598      ✗ 0     
     data_received..................: 14 GB   216 MB/s
     data_sent......................: 185 MB  3.0 MB/s
     http_req_blocked...............: avg=19.31µs min=921ns   med=2.46µs  max=76.59ms  p(90)=3.97µs   p(95)=5.01µs   p(99.9)=1.42ms  
     http_req_connecting............: avg=15.96µs min=0s      med=0s      max=76.37ms  p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=92.46ms min=1.94ms  med=80.34ms max=1.26s    p(90)=176.13ms p(95)=202.61ms p(99.9)=680.63ms
       { expected_response:true }...: avg=92.46ms min=1.94ms  med=80.34ms max=1.26s    p(90)=176.13ms p(95)=202.61ms p(99.9)=680.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153866
     http_req_receiving.............: avg=1.43ms  min=51.11µs med=99.62µs max=849.41ms p(90)=1.74ms   p(95)=4.86ms   p(99.9)=90.82ms 
     http_req_sending...............: avg=70.76µs min=4.65µs  med=9.49µs  max=238.99ms p(90)=17.41µs  p(95)=113.16µs p(99.9)=9.83ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.96ms min=1.85ms  med=79.28ms max=1.26s    p(90)=174.15ms p(95)=200ms    p(99.9)=660.9ms 
     http_reqs......................: 153866  2468.601029/s
     iteration_duration.............: avg=93.32ms min=3.42ms  med=81.21ms max=1.26s    p(90)=176.67ms p(95)=203.3ms  p(99.9)=681.84ms
     iterations.....................: 152866  2452.557192/s
     success_rate...................: 100.00% ✓ 152866      ✗ 0     
     vus............................: 73      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 443373      ✗ 0     
     data_received..................: 13 GB   211 MB/s
     data_sent......................: 179 MB  2.9 MB/s
     http_req_blocked...............: avg=20.73µs min=861ns   med=2.45µs  max=68.59ms  p(90)=4.11µs   p(95)=5.22µs   p(99.9)=2.13ms  
     http_req_connecting............: avg=17.58µs min=0s      med=0s      max=68.51ms  p(90)=0s       p(95)=0s       p(99.9)=2.05ms  
     http_req_duration..............: avg=95.65ms min=1.66ms  med=81.34ms max=1.88s    p(90)=181.57ms p(95)=214.71ms p(99.9)=851.42ms
       { expected_response:true }...: avg=95.65ms min=1.66ms  med=81.34ms max=1.88s    p(90)=181.57ms p(95)=214.71ms p(99.9)=851.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148791
     http_req_receiving.............: avg=1.4ms   min=51.89µs med=99.09µs max=917.63ms p(90)=1.57ms   p(95)=4.43ms   p(99.9)=88.64ms 
     http_req_sending...............: avg=67.38µs min=4.72µs  med=9.59µs  max=160.82ms p(90)=17.93µs  p(95)=112.13µs p(99.9)=8.9ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.17ms min=1.57ms  med=80.32ms max=1.88s    p(90)=179.3ms  p(95)=210.85ms p(99.9)=805.2ms 
     http_reqs......................: 148791  2398.377231/s
     iteration_duration.............: avg=96.55ms min=2.93ms  med=82.42ms max=1.88s    p(90)=182.23ms p(95)=215.53ms p(99.9)=851.91ms
     iterations.....................: 147791  2382.25813/s
     success_rate...................: 100.00% ✓ 147791      ✗ 0     
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

     checks.........................: 100.00% ✓ 228117      ✗ 0    
     data_received..................: 6.8 GB  108 MB/s
     data_sent......................: 93 MB   1.5 MB/s
     http_req_blocked...............: avg=5.63µs   min=1.04µs  med=2.59µs   max=6.57ms   p(90)=4.28µs   p(95)=5.19µs   p(99.9)=459.85µs
     http_req_connecting............: avg=2.37µs   min=0s      med=0s       max=6.49ms   p(90)=0s       p(95)=0s       p(99.9)=416.12µs
     http_req_duration..............: avg=185.16ms min=1.9ms   med=186.67ms max=483.94ms p(90)=343.46ms p(95)=368.64ms p(99.9)=436.96ms
       { expected_response:true }...: avg=185.16ms min=1.9ms   med=186.67ms max=483.94ms p(90)=343.46ms p(95)=368.64ms p(99.9)=436.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 77039
     http_req_receiving.............: avg=74.65µs  min=27.27µs med=59.96µs  max=162.24ms p(90)=96.99µs  p(95)=111.64µs p(99.9)=1.07ms  
     http_req_sending...............: avg=31.24µs  min=4.96µs  med=10.99µs  max=141.97ms p(90)=17.86µs  p(95)=21.8µs   p(99.9)=3.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.06ms min=1.84ms  med=186.56ms max=483.88ms p(90)=343.37ms p(95)=368.55ms p(99.9)=436.91ms
     http_reqs......................: 77039   1232.913288/s
     iteration_duration.............: avg=187.83ms min=4.53ms  med=189.72ms max=484.11ms p(90)=344.28ms p(95)=369.22ms p(99.9)=437.32ms
     iterations.....................: 76039   1216.909533/s
     success_rate...................: 100.00% ✓ 76039       ✗ 0    
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

     checks.........................: 100.00% ✓ 104091     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   668 kB/s
     http_req_blocked...............: avg=7.74µs   min=1.02µs  med=2.76µs   max=3.6ms    p(90)=4.44µs   p(95)=5.49µs   p(99.9)=1.23ms  
     http_req_connecting............: avg=4.02µs   min=0s      med=0s       max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=401.73ms min=3.51ms  med=375.04ms max=1.99s    p(90)=788.45ms p(95)=852.41ms p(99.9)=1.25s   
       { expected_response:true }...: avg=401.73ms min=3.51ms  med=375.04ms max=1.99s    p(90)=788.45ms p(95)=852.41ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35697
     http_req_receiving.............: avg=80.97µs  min=29.04µs med=68.59µs  max=108.93ms p(90)=106.19µs p(95)=119.7µs  p(99.9)=918.76µs
     http_req_sending...............: avg=31.52µs  min=5.15µs  med=13µs     max=121.35ms p(90)=20.27µs  p(95)=23.28µs  p(99.9)=2.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=401.61ms min=3.45ms  med=374.96ms max=1.99s    p(90)=788.34ms p(95)=852.28ms p(99.9)=1.25s   
     http_reqs......................: 35697   555.989949/s
     iteration_duration.............: avg=413.53ms min=23.15ms med=389.17ms max=1.99s    p(90)=791.42ms p(95)=855.23ms p(99.9)=1.26s   
     iterations.....................: 34697   540.414692/s
     success_rate...................: 100.00% ✓ 34697      ✗ 0    
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

     checks.........................: 100.00% ✓ 48429      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=11.13µs  min=1.13µs  med=3.64µs   max=11.61ms p(90)=5.51µs   p(95)=6.86µs   p(99.9)=1.12ms
     http_req_connecting............: avg=5.91µs   min=0s      med=0s       max=11.54ms p(90)=0s       p(95)=0s       p(99.9)=1.1ms 
     http_req_duration..............: avg=834.72ms min=5.57ms  med=710.27ms max=17.13s  p(90)=1.45s    p(95)=1.64s    p(99.9)=15.93s
       { expected_response:true }...: avg=834.72ms min=5.57ms  med=710.27ms max=17.13s  p(90)=1.45s    p(95)=1.64s    p(99.9)=15.93s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17143
     http_req_receiving.............: avg=103.91µs min=31.21µs med=93.33µs  max=48.76ms p(90)=131.88µs p(95)=147.87µs p(99.9)=1.59ms
     http_req_sending...............: avg=29.67µs  min=5.76µs  med=17.96µs  max=71.88ms p(90)=23.61µs  p(95)=27.77µs  p(99.9)=1.79ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=834.59ms min=5.49ms  med=710.08ms max=17.13s  p(90)=1.45s    p(95)=1.64s    p(99.9)=15.93s
     http_reqs......................: 17143   255.206485/s
     iteration_duration.............: avg=886.48ms min=41.42ms med=759.88ms max=17.13s  p(90)=1.47s    p(95)=1.65s    p(99.9)=15.94s
     iterations.....................: 16143   240.319564/s
     success_rate...................: 100.00% ✓ 16143      ✗ 0    
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

     checks.........................: 100.00% ✓ 49026      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   291 kB/s
     http_req_blocked...............: avg=11.18µs  min=1.07µs  med=2.92µs   max=5.43ms  p(90)=4.57µs   p(95)=5.99µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=6.75µs   min=0s      med=0s       max=5.37ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=361.1ms  min=7.43ms  med=395.41ms max=1.17s   p(90)=634.86ms p(95)=689.19ms p(99.9)=955.51ms
       { expected_response:true }...: avg=361.1ms  min=7.43ms  med=395.41ms max=1.17s   p(90)=634.86ms p(95)=689.19ms p(99.9)=955.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17342
     http_req_receiving.............: avg=89.74µs  min=32.68µs med=84.27µs  max=6.13ms  p(90)=120.71µs p(95)=134.59µs p(99.9)=1.06ms  
     http_req_sending...............: avg=32.94µs  min=5.2µs   med=16.1µs   max=42.02ms p(90)=21.28µs  p(95)=25.33µs  p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=360.98ms min=7.37ms  med=395.28ms max=1.17s   p(90)=634.72ms p(95)=688.65ms p(99.9)=955.36ms
     http_reqs......................: 17342   237.171923/s
     iteration_duration.............: avg=383.18ms min=8.09ms  med=415.79ms max=1.17s   p(90)=642.87ms p(95)=694.88ms p(99.9)=967.7ms 
     iterations.....................: 16342   223.495765/s
     success_rate...................: 100.00% ✓ 16342      ✗ 0    
     vus............................: 57      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 453753      ✗ 0     
     data_received..................: 13 GB   216 MB/s
     data_sent......................: 183 MB  3.0 MB/s
     http_req_blocked...............: avg=16.74µs min=841ns   med=2.26µs   max=47.74ms  p(90)=4.02µs   p(95)=5.25µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=13.57µs min=0s      med=0s       max=47.67ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=93.41ms min=1.45ms  med=87.9ms   max=355.25ms p(90)=179.08ms p(95)=196.14ms p(99.9)=260.41ms
       { expected_response:true }...: avg=93.41ms min=1.45ms  med=87.9ms   max=355.25ms p(90)=179.08ms p(95)=196.14ms p(99.9)=260.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152251
     http_req_receiving.............: avg=1.38ms  min=52.43µs med=136.32µs max=127.23ms p(90)=3.35ms   p(95)=5.33ms   p(99.9)=34.71ms 
     http_req_sending...............: avg=64.85µs min=4.71µs  med=9.58µs   max=163.51ms p(90)=21.51µs  p(95)=112.22µs p(99.9)=8.5ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.96ms min=1.37ms  med=86.48ms  max=352.02ms p(90)=177.49ms p(95)=194.53ms p(99.9)=258.25ms
     http_reqs......................: 152251  2464.148378/s
     iteration_duration.............: avg=94.28ms min=4.15ms  med=88.92ms  max=355.43ms p(90)=179.55ms p(95)=196.6ms  p(99.9)=261.18ms
     iterations.....................: 151251  2447.963602/s
     success_rate...................: 100.00% ✓ 151251      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 445914      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=17.91µs min=851ns   med=2.29µs   max=94.01ms  p(90)=4.1µs    p(95)=5.26µs   p(99.9)=884.56µs
     http_req_connecting............: avg=14.87µs min=0s      med=0s       max=87.18ms  p(90)=0s       p(95)=0s       p(99.9)=816.69µs
     http_req_duration..............: avg=95.07ms min=1.53ms  med=81.76ms  max=1.58s    p(90)=179.44ms p(95)=210.87ms p(99.9)=703.1ms 
       { expected_response:true }...: avg=95.07ms min=1.53ms  med=81.76ms  max=1.58s    p(90)=179.44ms p(95)=210.87ms p(99.9)=703.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149638
     http_req_receiving.............: avg=1.73ms  min=51.85µs med=102.62µs max=1.04s    p(90)=1.74ms   p(95)=5.02ms   p(99.9)=143.66ms
     http_req_sending...............: avg=68.18µs min=4.69µs  med=9.41µs   max=253.97ms p(90)=20µs     p(95)=106.66µs p(99.9)=8.52ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.27ms min=1.44ms  med=80.59ms  max=1.58s    p(90)=177.21ms p(95)=207ms    p(99.9)=696.46ms
     http_reqs......................: 149638  2417.882978/s
     iteration_duration.............: avg=95.98ms min=3.14ms  med=82.68ms  max=1.58s    p(90)=180.15ms p(95)=211.62ms p(99.9)=704.68ms
     iterations.....................: 148638  2401.724763/s
     success_rate...................: 100.00% ✓ 148638      ✗ 0     
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

     checks.........................: 100.00% ✓ 439836      ✗ 0     
     data_received..................: 13 GB   209 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=17.68µs min=882ns   med=2.25µs   max=59.06ms  p(90)=4µs      p(95)=5.19µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=14.46µs min=0s      med=0s       max=58.83ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=96.38ms min=1.6ms   med=85.45ms  max=1.43s    p(90)=182.72ms p(95)=212.87ms p(99.9)=676.74ms
       { expected_response:true }...: avg=96.38ms min=1.6ms   med=85.45ms  max=1.43s    p(90)=182.72ms p(95)=212.87ms p(99.9)=676.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147612
     http_req_receiving.............: avg=1.3ms   min=52.42µs med=103.76µs max=574.6ms  p(90)=1.5ms    p(95)=3.69ms   p(99.9)=95.86ms 
     http_req_sending...............: avg=66.04µs min=4.92µs  med=9.49µs   max=201.42ms p(90)=20.55µs  p(95)=111.05µs p(99.9)=8.38ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.01ms min=1.46ms  med=84.36ms  max=1.43s    p(90)=180.96ms p(95)=209.96ms p(99.9)=647.89ms
     http_reqs......................: 147612  2382.138354/s
     iteration_duration.............: avg=97.29ms min=2.7ms   med=86.53ms  max=1.43s    p(90)=183.35ms p(95)=213.52ms p(99.9)=677.99ms
     iterations.....................: 146612  2366.000517/s
     success_rate...................: 100.00% ✓ 146612      ✗ 0     
     vus............................: 55      min=0         max=498 
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

     checks.........................: 100.00% ✓ 419337      ✗ 0     
     data_received..................: 12 GB   199 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=12.44µs  min=961ns   med=2.5µs   max=46.62ms  p(90)=4.4µs    p(95)=5.62µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=9.28µs   min=0s      med=0s      max=46.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=101.06ms min=1.49ms  med=96.3ms  max=315.21ms p(90)=193.69ms p(95)=211.12ms p(99.9)=260.39ms
       { expected_response:true }...: avg=101.06ms min=1.49ms  med=96.3ms  max=315.21ms p(90)=193.69ms p(95)=211.12ms p(99.9)=260.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140779
     http_req_receiving.............: avg=116.12µs min=24.91µs med=54.85µs max=205.67ms p(90)=114µs    p(95)=314.82µs p(99.9)=9.62ms  
     http_req_sending...............: avg=55.11µs  min=4.73µs  med=10.45µs max=110.11ms p(90)=20.46µs  p(95)=111.45µs p(99.9)=6.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.89ms min=1.41ms  med=96.15ms max=314.92ms p(90)=193.43ms p(95)=210.88ms p(99.9)=259.88ms
     http_reqs......................: 140779  2270.304134/s
     iteration_duration.............: avg=102.03ms min=4.75ms  med=97.47ms max=329.68ms p(90)=194.2ms  p(95)=211.61ms p(99.9)=261.77ms
     iterations.....................: 139779  2254.17741/s
     success_rate...................: 100.00% ✓ 139779      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413073     ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=17.99µs  min=882ns   med=2.72µs   max=93.33ms  p(90)=4.74µs   p(95)=5.91µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=14.55µs  min=0s      med=0s       max=93.27ms  p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=102.64ms min=1.74ms  med=89.65ms  max=1.47s    p(90)=193.61ms p(95)=228.36ms p(99.9)=717.97ms
       { expected_response:true }...: avg=102.64ms min=1.74ms  med=89.65ms  max=1.47s    p(90)=193.61ms p(95)=228.36ms p(99.9)=717.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 138691
     http_req_receiving.............: avg=2.12ms   min=52.24µs med=108.63µs max=782.58ms p(90)=1.78ms   p(95)=5.09ms   p(99.9)=272.86ms
     http_req_sending...............: avg=64.81µs  min=4.81µs  med=10.59µs  max=86ms     p(90)=21.96µs  p(95)=116.13µs p(99.9)=9.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.45ms min=1.64ms  med=88.54ms  max=1.47s    p(90)=191.13ms p(95)=222.27ms p(99.9)=624.59ms
     http_reqs......................: 138691  2228.06684/s
     iteration_duration.............: avg=103.66ms min=3.33ms  med=90.74ms  max=1.47s    p(90)=194.24ms p(95)=229.32ms p(99.9)=720.26ms
     iterations.....................: 137691  2212.00187/s
     success_rate...................: 100.00% ✓ 137691     ✗ 0     
     vus............................: 71      min=0        max=495 
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 206190      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.05µs   min=982ns   med=2.42µs   max=11.13ms  p(90)=4.32µs   p(95)=5.31µs   p(99.9)=658.5µs 
     http_req_connecting............: avg=2.81µs   min=0s      med=0s       max=11.07ms  p(90)=0s       p(95)=0s       p(99.9)=472.41µs
     http_req_duration..............: avg=204.63ms min=2.08ms  med=204.89ms max=561.93ms p(90)=378.79ms p(95)=406.74ms p(99.9)=495.45ms
       { expected_response:true }...: avg=204.63ms min=2.08ms  med=204.89ms max=561.93ms p(90)=378.79ms p(95)=406.74ms p(99.9)=495.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69730
     http_req_receiving.............: avg=75.68µs  min=27.39µs med=63.43µs  max=15.74ms  p(90)=107.24µs p(95)=123.21µs p(99.9)=873.77µs
     http_req_sending...............: avg=28.58µs  min=4.83µs  med=10.83µs  max=141.49ms p(90)=18.39µs  p(95)=22.26µs  p(99.9)=2.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.52ms min=2ms     med=204.78ms max=561.7ms  p(90)=378.7ms  p(95)=406.6ms  p(99.9)=495.38ms
     http_reqs......................: 69730   1113.572653/s
     iteration_duration.............: avg=207.84ms min=3.95ms  med=208.37ms max=562.11ms p(90)=379.86ms p(95)=407.45ms p(99.9)=495.97ms
     iterations.....................: 68730   1097.602875/s
     success_rate...................: 100.00% ✓ 68730       ✗ 0    
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

     checks.........................: 100.00% ✓ 100236     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   639 kB/s
     http_req_blocked...............: avg=11.1µs   min=1.18µs  med=3.41µs   max=35.14ms  p(90)=5.23µs   p(95)=6.33µs   p(99.9)=1.64ms
     http_req_connecting............: avg=6.63µs   min=0s      med=0s       max=35.1ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms 
     http_req_duration..............: avg=416.9ms  min=3.83ms  med=385.76ms max=1.84s    p(90)=825.29ms p(95)=894.27ms p(99.9)=1.35s 
       { expected_response:true }...: avg=416.9ms  min=3.83ms  med=385.76ms max=1.84s    p(90)=825.29ms p(95)=894.27ms p(99.9)=1.35s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34412
     http_req_receiving.............: avg=85.5µs   min=31.29µs med=74.96µs  max=7.4ms    p(90)=114.34µs p(95)=128.51µs p(99.9)=1.12ms
     http_req_sending...............: avg=33.94µs  min=5.74µs  med=14.75µs  max=135.51ms p(90)=21.95µs  p(95)=25.31µs  p(99.9)=2.72ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=416.78ms min=3.75ms  med=385.68ms max=1.84s    p(90)=825.17ms p(95)=894.08ms p(99.9)=1.35s 
     http_reqs......................: 34412   532.358789/s
     iteration_duration.............: avg=429.62ms min=9.56ms  med=400.5ms  max=1.85s    p(90)=829.07ms p(95)=897.48ms p(99.9)=1.36s 
     iterations.....................: 33412   516.88864/s
     success_rate...................: 100.00% ✓ 33412      ✗ 0    
     vus............................: 86      min=0        max=500
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

     checks.........................: 100.00% ✓ 45441     ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   286 kB/s
     http_req_blocked...............: avg=14.65µs  min=1.63µs  med=3.72µs   max=3.86ms   p(90)=5.59µs  p(95)=7.53µs   p(99.9)=2.1ms 
     http_req_connecting............: avg=8.98µs   min=0s      med=0s       max=3.82ms   p(90)=0s      p(95)=0s       p(99.9)=1.99ms
     http_req_duration..............: avg=902.18ms min=5.99ms  med=816.52ms max=5.28s    p(90)=1.8s    p(95)=2.01s    p(99.9)=4.31s 
       { expected_response:true }...: avg=902.18ms min=5.99ms  med=816.52ms max=5.28s    p(90)=1.8s    p(95)=2.01s    p(99.9)=4.31s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 16147
     http_req_receiving.............: avg=111.35µs min=36.04µs med=94.4µs   max=57.01ms  p(90)=134.7µs p(95)=150.52µs p(99.9)=1.4ms 
     http_req_sending...............: avg=57.27µs  min=7.11µs  med=17.89µs  max=181.67ms p(90)=23.72µs p(95)=29.51µs  p(99.9)=2.12ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=902.01ms min=5.91ms  med=816.37ms max=5.28s    p(90)=1.8s    p(95)=2.01s    p(99.9)=4.31s 
     http_reqs......................: 16147   238.57467/s
     iteration_duration.............: avg=961.8ms  min=34.39ms med=892.62ms max=5.29s    p(90)=1.83s   p(95)=2.04s    p(99.9)=4.33s 
     iterations.....................: 15147   223.7995/s
     success_rate...................: 100.00% ✓ 15147     ✗ 0    
     vus............................: 91      min=0       max=500
     vus_max........................: 500     min=500     max=500
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

     checks.........................: 100.00% ✓ 45027      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=14.88µs  min=1.62µs  med=3.66µs   max=6.08ms  p(90)=5.4µs    p(95)=6.91µs   p(99.9)=2.17ms  
     http_req_connecting............: avg=9.4µs    min=0s      med=0s       max=6.01ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=907.82ms min=7.81ms  med=827.32ms max=3.15s   p(90)=1.83s    p(95)=1.99s    p(99.9)=2.9s    
       { expected_response:true }...: avg=907.82ms min=7.81ms  med=827.32ms max=3.15s   p(90)=1.83s    p(95)=1.99s    p(99.9)=2.9s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 16009
     http_req_receiving.............: avg=108.98µs min=37.72µs med=93.44µs  max=90.9ms  p(90)=132.39µs p(95)=149.63µs p(99.9)=585.24µs
     http_req_sending...............: avg=35.73µs  min=6.49µs  med=18.02µs  max=87.09ms p(90)=23.76µs  p(95)=29.03µs  p(99.9)=2.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=907.68ms min=7.71ms  med=827.21ms max=3.15s   p(90)=1.83s    p(95)=1.99s    p(99.9)=2.9s    
     http_reqs......................: 16009   233.043173/s
     iteration_duration.............: avg=968.29ms min=42ms    med=895.23ms max=3.15s   p(90)=1.84s    p(95)=2.01s    p(99.9)=2.92s   
     iterations.....................: 15009   218.486163/s
     success_rate...................: 100.00% ✓ 15009      ✗ 0    
     vus............................: 91      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

