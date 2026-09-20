## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,921 | 3,189 | 2,857 | 3.7% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,673 | 2,807 | 2,647 | 2.1% |  |
| fusion-nightly | 16.7.0-p.8 | 2,564 | 2,682 | 2,540 | 1.9% |  |
| fusion | 16.6.6 | 2,560 | 2,686 | 2,543 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,406 | 2,501 | 2,398 | 1.4% |  |
| grafbase | 0.53.5 | 2,034 | 2,170 | 2,025 | 2.6% |  |
| cosmo | 0.334.0 | 1,291 | 1,331 | 1,277 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 634 | 650 | 633 | 1.0% |  |
| apollo-router | v2.16.1 | 480 | 502 | 478 | 1.9% |  |
| apollo-gateway | 2.14.3 | 283 | 287 | 283 | 0.6% |  |
| hive-gateway | 2.10.8 | 279 | 285 | 277 | 1.0% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1070 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,584 | 2,745 | 2,569 | 2.4% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,512 | 2,626 | 2,494 | 1.8% |  |
| fusion-nightly | 16.7.0-p.8 | 2,500 | 2,602 | 2,489 | 1.6% |  |
| fusion | 16.6.6 | 2,331 | 2,461 | 2,323 | 2.1% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,211 | 2,324 | 2,206 | 1.8% |  |
| grafbase | 0.53.5 | 1,632 | 1,689 | 1,621 | 1.4% |  |
| cosmo | 0.334.0 | 1,233 | 1,274 | 1,229 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 598 | 573 | 1.4% |  |
| apollo-router | v2.16.1 | 449 | 465 | 447 | 1.5% |  |
| apollo-gateway | 2.14.3 | 267 | 271 | 266 | 0.6% |  |
| hive-gateway | 2.10.8 | 261 | 270 | 260 | 1.3% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 21 | 3.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1052961     ✗ 0     
     data_received..................: 31 GB   256 MB/s
     data_sent......................: 422 MB  3.5 MB/s
     http_req_blocked...............: avg=3.12µs  min=961ns   med=2.35µs  max=17.93ms  p(90)=3.7µs   p(95)=4.32µs   p(99.9)=36.53µs
     http_req_connecting............: avg=264ns   min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.87ms min=1.49ms  med=16.12ms max=302.72ms p(90)=24.94ms p(95)=28.29ms  p(99.9)=47.25ms
       { expected_response:true }...: avg=16.87ms min=1.49ms  med=16.12ms max=302.72ms p(90)=24.94ms p(95)=28.29ms  p(99.9)=47.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 351087
     http_req_receiving.............: avg=94.15µs min=26.76µs med=48.74µs max=123.01ms p(90)=87.89µs p(95)=162.15µs p(99.9)=7.95ms 
     http_req_sending...............: avg=45.99µs min=4.82µs  med=9.05µs  max=40.37ms  p(90)=15.76µs p(95)=98.77µs  p(99.9)=5.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.73ms min=1.41ms  med=16ms    max=290.56ms p(90)=24.76ms p(95)=28.03ms  p(99.9)=46.37ms
     http_reqs......................: 351087  2921.075456/s
     iteration_duration.............: avg=17.08ms min=2.11ms  med=16.31ms max=312.4ms  p(90)=25.15ms p(95)=28.52ms  p(99.9)=48.14ms
     iterations.....................: 350987  2920.243447/s
     success_rate...................: 100.00% ✓ 350987      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 964143      ✗ 0     
     data_received..................: 28 GB   234 MB/s
     data_sent......................: 386 MB  3.2 MB/s
     http_req_blocked...............: avg=2.65µs  min=852ns   med=1.92µs   max=16.66ms  p(90)=3.32µs  p(95)=4.02µs  p(99.9)=27.89µs
     http_req_connecting............: avg=123ns   min=0s      med=0s       max=1.71ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.44ms min=1.93ms  med=17.39ms  max=292.24ms p(90)=26.33ms p(95)=30.04ms p(99.9)=50.99ms
       { expected_response:true }...: avg=18.44ms min=1.93ms  med=17.39ms  max=292.24ms p(90)=26.33ms p(95)=30.04ms p(99.9)=50.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 321481
     http_req_receiving.............: avg=1.05ms  min=51.77µs med=131.52µs max=122.52ms p(90)=2.69ms  p(95)=3.66ms  p(99.9)=24.07ms
     http_req_sending...............: avg=46.23µs min=4.47µs  med=8.14µs   max=236.2ms  p(90)=16.34µs p(95)=87.23µs p(99.9)=5.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.35ms min=1.82ms  med=16.27ms  max=274.5ms  p(90)=24.99ms p(95)=28.63ms p(99.9)=48.85ms
     http_reqs......................: 321481  2673.633652/s
     iteration_duration.............: avg=18.66ms min=3.16ms  med=17.59ms  max=307.62ms p(90)=26.54ms p(95)=30.28ms p(99.9)=51.76ms
     iterations.....................: 321381  2672.801991/s
     success_rate...................: 100.00% ✓ 321381      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 924726      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=3.03µs   min=1.04µs  med=2.3µs   max=24.23ms  p(90)=3.51µs  p(95)=4.08µs  p(99.9)=32.84µs 
     http_req_connecting............: avg=280ns    min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.24ms  min=1.98ms  med=16.56ms max=318.99ms p(90)=31.29ms p(95)=37.75ms p(99.9)=121.1ms 
       { expected_response:true }...: avg=19.24ms  min=1.98ms  med=16.56ms max=318.99ms p(90)=31.29ms p(95)=37.75ms p(99.9)=121.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 308342
     http_req_receiving.............: avg=581.04µs min=51.82µs med=93.28µs max=168.48ms p(90)=1.11ms  p(95)=2.02ms  p(99.9)=24.98ms 
     http_req_sending...............: avg=44.14µs  min=4.71µs  med=8.56µs  max=196.81ms p(90)=14.49µs p(95)=85.42µs p(99.9)=4.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.62ms  min=1.89ms  med=16.02ms max=317.88ms p(90)=30.35ms p(95)=36.67ms p(99.9)=119.34ms
     http_reqs......................: 308342  2564.073606/s
     iteration_duration.............: avg=19.45ms  min=2.53ms  med=16.76ms max=319.17ms p(90)=31.52ms p(95)=37.99ms p(99.9)=122.19ms
     iterations.....................: 308242  2563.242037/s
     success_rate...................: 100.00% ✓ 308242      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 923322      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=3.09µs   min=1µs     med=2.33µs  max=16.13ms  p(90)=3.57µs  p(95)=4.12µs  p(99.9)=31.81µs 
     http_req_connecting............: avg=290ns    min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.27ms  min=2.01ms  med=16.55ms max=277.18ms p(90)=31.41ms p(95)=38.11ms p(99.9)=121.18ms
       { expected_response:true }...: avg=19.27ms  min=2.01ms  med=16.55ms max=277.18ms p(90)=31.41ms p(95)=38.11ms p(99.9)=121.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307874
     http_req_receiving.............: avg=592.22µs min=50.31µs med=94.24µs max=221.68ms p(90)=1.11ms  p(95)=2ms     p(99.9)=26.55ms 
     http_req_sending...............: avg=42.71µs  min=4.65µs  med=8.67µs  max=109.1ms  p(90)=14.63µs p(95)=88.7µs  p(99.9)=4.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.64ms  min=1.89ms  med=16ms    max=277.07ms p(90)=30.45ms p(95)=37.01ms p(99.9)=119.91ms
     http_reqs......................: 307874  2560.254752/s
     iteration_duration.............: avg=19.48ms  min=3.06ms  med=16.75ms max=294.16ms p(90)=31.63ms p(95)=38.32ms p(99.9)=122.64ms
     iterations.....................: 307774  2559.423161/s
     success_rate...................: 100.00% ✓ 307774      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 867636      ✗ 0     
     data_received..................: 25 GB   212 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=2.64µs   min=872ns   med=1.9µs   max=16.95ms  p(90)=3.07µs  p(95)=3.63µs  p(99.9)=29.87µs 
     http_req_connecting............: avg=313ns    min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.52ms  min=1.76ms  med=16.71ms max=377.13ms p(90)=35.18ms p(95)=44.1ms  p(99.9)=158.2ms 
       { expected_response:true }...: avg=20.52ms  min=1.76ms  med=16.71ms max=377.13ms p(90)=35.18ms p(95)=44.1ms  p(99.9)=158.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 289312
     http_req_receiving.............: avg=611.48µs min=52.23µs med=93.45µs max=159.79ms p(90)=1.08ms  p(95)=1.95ms  p(99.9)=31.29ms 
     http_req_sending...............: avg=39.68µs  min=4.72µs  med=8.16µs  max=107.19ms p(90)=14.12µs p(95)=61.44µs p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.87ms  min=1.64ms  med=16.17ms max=377ms    p(90)=34.11ms p(95)=42.9ms  p(99.9)=156.57ms
     http_reqs......................: 289312  2406.522574/s
     iteration_duration.............: avg=20.73ms  min=2.62ms  med=16.9ms  max=377.31ms p(90)=35.39ms p(95)=44.34ms p(99.9)=160.1ms 
     iterations.....................: 289212  2405.690765/s
     success_rate...................: 100.00% ✓ 289212      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 733518      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=2.66µs  min=942ns   med=2.05µs  max=10.07ms  p(90)=3.38µs  p(95)=4.04µs   p(99.9)=30.3µs 
     http_req_connecting............: avg=205ns   min=0s      med=0s      max=2.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.32ms min=1.73ms  med=24.08ms max=291.65ms p(90)=28.67ms p(95)=30.3ms   p(99.9)=47.6ms 
       { expected_response:true }...: avg=24.32ms min=1.73ms  med=24.08ms max=291.65ms p(90)=28.67ms p(95)=30.3ms   p(99.9)=47.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 244606
     http_req_receiving.............: avg=80.59µs min=26.79µs med=54.26µs max=75.54ms  p(90)=89.93µs p(95)=110.92µs p(99.9)=3.66ms 
     http_req_sending...............: avg=30.58µs min=4.72µs  med=9.39µs  max=91.51ms  p(90)=15.4µs  p(95)=21.58µs  p(99.9)=1.5ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.2ms  min=1.65ms  med=23.98ms max=291.03ms p(90)=28.55ms p(95)=30.15ms  p(99.9)=46.74ms
     http_reqs......................: 244606  2034.512755/s
     iteration_duration.............: avg=24.53ms min=5.98ms  med=24.27ms max=302.17ms p(90)=28.86ms p(95)=30.5ms   p(99.9)=48.26ms
     iterations.....................: 244506  2033.681004/s
     success_rate...................: 100.00% ✓ 244506      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 465645      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 187 MB  1.6 MB/s
     http_req_blocked...............: avg=2.87µs  min=942ns   med=1.96µs  max=3.87ms   p(90)=3.22µs  p(95)=3.82µs   p(99.9)=25.99µs 
     http_req_connecting............: avg=614ns   min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.43ms min=1.98ms  med=38ms    max=301.89ms p(90)=53.74ms p(95)=58.59ms  p(99.9)=82.14ms 
       { expected_response:true }...: avg=38.43ms min=1.98ms  med=38ms    max=301.89ms p(90)=53.74ms p(95)=58.59ms  p(99.9)=82.14ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 155315
     http_req_receiving.............: avg=69.6µs  min=25.14µs med=55.91µs max=175.11ms p(90)=89.44µs p(95)=104.46µs p(99.9)=830.59µs
     http_req_sending...............: avg=22.05µs min=4.91µs  med=9.34µs  max=129.03ms p(90)=14.72µs p(95)=18.6µs   p(99.9)=894.22µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.33ms min=1.89ms  med=37.92ms max=301.67ms p(90)=53.65ms p(95)=58.49ms  p(99.9)=82ms    
     http_reqs......................: 155315  1291.363927/s
     iteration_duration.............: avg=38.65ms min=4.07ms  med=38.21ms max=312.16ms p(90)=53.93ms p(95)=58.79ms  p(99.9)=82.56ms 
     iterations.....................: 155215  1290.532479/s
     success_rate...................: 100.00% ✓ 155215      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 229191     ✗ 0    
     data_received..................: 6.7 GB  56 MB/s
     data_sent......................: 92 MB   763 kB/s
     http_req_blocked...............: avg=4.86µs  min=1.24µs  med=3.2µs   max=4.11ms   p(90)=4.82µs   p(95)=5.54µs   p(99.9)=46.78µs 
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=78.19ms min=3.51ms  med=74.95ms max=305.42ms p(90)=110.25ms p(95)=121.28ms p(99.9)=200.09ms
       { expected_response:true }...: avg=78.19ms min=3.51ms  med=74.95ms max=305.42ms p(90)=110.25ms p(95)=121.28ms p(99.9)=200.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 76497
     http_req_receiving.............: avg=85.1µs  min=30.6µs  med=73.08µs max=194.16ms p(90)=111.36µs p(95)=125.6µs  p(99.9)=679.64µs
     http_req_sending...............: avg=24.27µs min=5.6µs   med=14.29µs max=135.64ms p(90)=21.35µs  p(95)=23.71µs  p(99.9)=657.79µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.08ms min=3.45ms  med=74.83ms max=305.26ms p(90)=110.14ms p(95)=121.16ms p(99.9)=199.79ms
     http_reqs......................: 76497   634.969561/s
     iteration_duration.............: avg=78.54ms min=10.33ms med=75.23ms max=323.1ms  p(90)=110.52ms p(95)=121.6ms  p(99.9)=201.69ms
     iterations.....................: 76397   634.139503/s
     success_rate...................: 100.00% ✓ 76397      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 173715     ✗ 0    
     data_received..................: 5.1 GB  42 MB/s
     data_sent......................: 70 MB   578 kB/s
     http_req_blocked...............: avg=5.24µs   min=1.26µs  med=3.46µs   max=4.02ms   p(90)=4.88µs   p(95)=5.47µs   p(99.9)=50.92µs 
     http_req_connecting............: avg=1.55µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=103.18ms min=4.68ms  med=102.97ms max=333.88ms p(90)=124.52ms p(95)=130.89ms p(99.9)=161.84ms
       { expected_response:true }...: avg=103.18ms min=4.68ms  med=102.97ms max=333.88ms p(90)=124.52ms p(95)=130.89ms p(99.9)=161.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58005
     http_req_receiving.............: avg=86.75µs  min=31.92µs med=80.77µs  max=115.19ms p(90)=111.96µs p(95)=124.4µs  p(99.9)=604.73µs
     http_req_sending...............: avg=29.24µs  min=5.83µs  med=16.36µs  max=222.21ms p(90)=22.22µs  p(95)=24.09µs  p(99.9)=607.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.06ms min=4.59ms  med=102.86ms max=333.11ms p(90)=124.41ms p(95)=130.78ms p(99.9)=160.97ms
     http_reqs......................: 58005   480.990954/s
     iteration_duration.............: avg=103.63ms min=11.68ms med=103.25ms max=343.63ms p(90)=124.8ms  p(95)=131.18ms p(99.9)=164.75ms
     iterations.....................: 57905   480.161731/s
     success_rate...................: 100.00% ✓ 57905      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 102702     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   341 kB/s
     http_req_blocked...............: avg=6.08µs   min=1.44µs  med=3.42µs   max=3.49ms   p(90)=4.78µs   p(95)=5.36µs   p(99.9)=892.67µs
     http_req_connecting............: avg=2.37µs   min=0s      med=0s       max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=792.13µs
     http_req_duration..............: avg=174.57ms min=7.34ms  med=175.1ms  max=391.2ms  p(90)=200.86ms p(95)=205.49ms p(99.9)=268.03ms
       { expected_response:true }...: avg=174.57ms min=7.34ms  med=175.1ms  max=391.2ms  p(90)=200.86ms p(95)=205.49ms p(99.9)=268.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34334
     http_req_receiving.............: avg=94.87µs  min=33.68µs med=85.3µs   max=199.5ms  p(90)=115.89µs p(95)=127.29µs p(99.9)=549.21µs
     http_req_sending...............: avg=42.93µs  min=6µs     med=17.4µs   max=182.27ms p(90)=21.87µs  p(95)=23.65µs  p(99.9)=902.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.43ms min=7.25ms  med=174.99ms max=390.14ms p(90)=200.73ms p(95)=205.35ms p(99.9)=267.39ms
     http_reqs......................: 34334   283.928108/s
     iteration_duration.............: avg=175.36ms min=41.52ms med=175.74ms max=411.27ms p(90)=201.13ms p(95)=205.78ms p(99.9)=269.35ms
     iterations.....................: 34234   283.101149/s
     success_rate...................: 100.00% ✓ 34234      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 101115     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=6.27µs   min=1.33µs  med=3.51µs   max=3.46ms   p(90)=4.88µs   p(95)=5.47µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=2.5µs    min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=177.32ms min=5.79ms  med=162.51ms max=672.11ms p(90)=207.98ms p(95)=241.36ms p(99.9)=577.51ms
       { expected_response:true }...: avg=177.32ms min=5.79ms  med=162.51ms max=672.11ms p(90)=207.98ms p(95)=241.36ms p(99.9)=577.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33805
     http_req_receiving.............: avg=93.24µs  min=31.87µs med=88.24µs  max=42.17ms  p(90)=118.67µs p(95)=131.45µs p(99.9)=513.04µs
     http_req_sending...............: avg=27.36µs  min=6.39µs  med=17.25µs  max=114.19ms p(90)=22.04µs  p(95)=23.82µs  p(99.9)=491.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.2ms  min=5.66ms  med=162.39ms max=672.02ms p(90)=207.87ms p(95)=241.03ms p(99.9)=577.41ms
     http_reqs......................: 33805   279.539239/s
     iteration_duration.............: avg=178.11ms min=47.27ms med=162.87ms max=672.36ms p(90)=208.33ms p(95)=242.61ms p(99.9)=577.75ms
     iterations.....................: 33705   278.712322/s
     success_rate...................: 100.00% ✓ 33705      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 932031      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.92µs  min=941ns   med=2.12µs  max=14.15ms  p(90)=3.67µs  p(95)=4.43µs   p(99.9)=33.12µs
     http_req_connecting............: avg=300ns   min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.09ms min=1.71ms  med=18.76ms max=288.04ms p(90)=26.48ms p(95)=28.81ms  p(99.9)=47.24ms
       { expected_response:true }...: avg=19.09ms min=1.71ms  med=18.76ms max=288.04ms p(90)=26.48ms p(95)=28.81ms  p(99.9)=47.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310777
     http_req_receiving.............: avg=84.07µs min=25.16µs med=48.09µs max=31.8ms   p(90)=88.88µs p(95)=133.14µs p(99.9)=6.01ms 
     http_req_sending...............: avg=44.29µs min=4.67µs  med=9.46µs  max=234.42ms p(90)=16.92µs p(95)=86.07µs  p(99.9)=3.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.96ms min=1.66ms  med=18.65ms max=265.66ms p(90)=26.33ms p(95)=28.62ms  p(99.9)=46.41ms
     http_reqs......................: 310777  2584.960657/s
     iteration_duration.............: avg=19.3ms  min=3.5ms   med=18.96ms max=323.98ms p(90)=26.68ms p(95)=29.03ms  p(99.9)=47.71ms
     iterations.....................: 310677  2584.128883/s
     success_rate...................: 100.00% ✓ 310677      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 905862      ✗ 0     
     data_received..................: 27 GB   220 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=2.81µs  min=871ns   med=2.03µs   max=6.81ms   p(90)=3.73µs  p(95)=4.55µs  p(99.9)=30.04µs
     http_req_connecting............: avg=291ns   min=0s      med=0s       max=4ms      p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.64ms min=1.54ms  med=18.61ms  max=299.07ms p(90)=28.45ms p(95)=32.19ms p(99.9)=53.46ms
       { expected_response:true }...: avg=19.64ms min=1.54ms  med=18.61ms  max=299.07ms p(90)=28.45ms p(95)=32.19ms p(99.9)=53.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 302054
     http_req_receiving.............: avg=1.21ms  min=50.53µs med=165.04µs max=82.04ms  p(90)=3.11ms  p(95)=4.26ms  p(99.9)=24.99ms
     http_req_sending...............: avg=45.73µs min=4.5µs   med=8.54µs   max=104.49ms p(90)=19.18µs p(95)=89.29µs p(99.9)=4.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.38ms min=1.47ms  med=17.31ms  max=298.46ms p(90)=26.93ms p(95)=30.57ms p(99.9)=51.39ms
     http_reqs......................: 302054  2512.704516/s
     iteration_duration.............: avg=19.86ms min=2.91ms  med=18.81ms  max=325.09ms p(90)=28.67ms p(95)=32.42ms p(99.9)=53.98ms
     iterations.....................: 301954  2511.872643/s
     success_rate...................: 100.00% ✓ 301954      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 901263      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=4.38µs   min=821ns   med=2.01µs  max=60.79ms  p(90)=3.47µs  p(95)=4.18µs  p(99.9)=27.28µs 
     http_req_connecting............: avg=1.88µs   min=0s      med=0s      max=60.74ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.74ms  min=1.55ms  med=16.72ms max=290.88ms p(90)=32.11ms p(95)=39.24ms p(99.9)=137.21ms
       { expected_response:true }...: avg=19.74ms  min=1.55ms  med=16.72ms max=290.88ms p(90)=32.11ms p(95)=39.24ms p(99.9)=137.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300521
     http_req_receiving.............: avg=558.87µs min=52.12µs med=93.16µs max=164.05ms p(90)=1.07ms  p(95)=1.87ms  p(99.9)=26.63ms 
     http_req_sending...............: avg=44.71µs  min=4.58µs  med=8.71µs  max=219.24ms p(90)=17.01µs p(95)=80.36µs p(99.9)=3.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.14ms  min=1.47ms  med=16.2ms  max=290.8ms  p(90)=31.16ms p(95)=38.1ms  p(99.9)=135.28ms
     http_reqs......................: 300521  2500.038141/s
     iteration_duration.............: avg=19.96ms  min=2.43ms  med=16.92ms max=291.36ms p(90)=32.33ms p(95)=39.49ms p(99.9)=139ms   
     iterations.....................: 300421  2499.20624/s
     success_rate...................: 100.00% ✓ 300421      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 840657      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=3.57µs   min=1.03µs  med=2.71µs   max=11.58ms  p(90)=4.3µs   p(95)=5.04µs  p(99.9)=39.16µs 
     http_req_connecting............: avg=336ns    min=0s      med=0s       max=4.03ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.17ms  min=1.65ms  med=17.67ms  max=299.59ms p(90)=34.77ms p(95)=42.66ms p(99.9)=154.21ms
       { expected_response:true }...: avg=21.17ms  min=1.65ms  med=17.67ms  max=299.59ms p(90)=34.77ms p(95)=42.66ms p(99.9)=154.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280319
     http_req_receiving.............: avg=618.09µs min=53.08µs med=100.03µs max=287.84ms p(90)=1.14ms  p(95)=1.99ms  p(99.9)=29.78ms 
     http_req_sending...............: avg=46.98µs  min=4.95µs  med=10.28µs  max=161.95ms p(90)=18.53µs p(95)=90.4µs  p(99.9)=4.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.5ms   min=1.51ms  med=17.09ms  max=282.73ms p(90)=33.7ms  p(95)=41.42ms p(99.9)=153.07ms
     http_reqs......................: 280319  2331.817427/s
     iteration_duration.............: avg=21.4ms   min=2.69ms  med=17.88ms  max=300.26ms p(90)=35ms    p(95)=42.92ms p(99.9)=155.57ms
     iterations.....................: 280219  2330.985583/s
     success_rate...................: 100.00% ✓ 280219      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 797454      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 320 MB  2.7 MB/s
     http_req_blocked...............: avg=2.9µs    min=862ns   med=2.09µs  max=10.19ms  p(90)=3.64µs  p(95)=4.37µs  p(99.9)=36.13µs 
     http_req_connecting............: avg=339ns    min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.34ms  min=1.95ms  med=18.51ms max=368.31ms p(90)=36.74ms p(95)=45.92ms p(99.9)=166.32ms
       { expected_response:true }...: avg=22.34ms  min=1.95ms  med=18.51ms max=368.31ms p(90)=36.74ms p(95)=45.92ms p(99.9)=166.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 265918
     http_req_receiving.............: avg=613.04µs min=51.48µs med=100.7µs max=194.05ms p(90)=1.14ms  p(95)=1.98ms  p(99.9)=30.07ms 
     http_req_sending...............: avg=40.4µs   min=4.88µs  med=8.95µs  max=144.28ms p(90)=17.16µs p(95)=50.7µs  p(99.9)=2.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.68ms  min=1.82ms  med=17.94ms max=368.07ms p(90)=35.69ms p(95)=44.59ms p(99.9)=165.15ms
     http_reqs......................: 265918  2211.326145/s
     iteration_duration.............: avg=22.56ms  min=2.8ms   med=18.72ms max=368.51ms p(90)=36.96ms p(95)=46.16ms p(99.9)=167.88ms
     iterations.....................: 265818  2210.494563/s
     success_rate...................: 100.00% ✓ 265818      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 588717      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 236 MB  2.0 MB/s
     http_req_blocked...............: avg=3.31µs  min=862ns   med=2.25µs  max=3.54ms   p(90)=4.4µs    p(95)=5.5µs    p(99.9)=48.71µs
     http_req_connecting............: avg=446ns   min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.32ms min=2.32ms  med=29.9ms  max=302.34ms p(90)=40.03ms  p(95)=43.29ms  p(99.9)=63.9ms 
       { expected_response:true }...: avg=30.32ms min=2.32ms  med=29.9ms  max=302.34ms p(90)=40.03ms  p(95)=43.29ms  p(99.9)=63.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 196339
     http_req_receiving.............: avg=94.71µs min=27.86µs med=55.16µs max=78.19ms  p(90)=125.81µs p(95)=206.11µs p(99.9)=4.04ms 
     http_req_sending...............: avg=39.9µs  min=4.92µs  med=9.55µs  max=131.48ms p(90)=24.4µs   p(95)=108.32µs p(99.9)=2.91ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.19ms min=2.24ms  med=29.78ms max=301.48ms p(90)=39.88ms  p(95)=43.1ms   p(99.9)=63.02ms
     http_reqs......................: 196339  1632.120215/s
     iteration_duration.............: avg=30.56ms min=7.48ms  med=30.13ms max=357.19ms p(90)=40.26ms  p(95)=43.51ms  p(99.9)=64.65ms
     iterations.....................: 196239  1631.288939/s
     success_rate...................: 100.00% ✓ 196239      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 444660      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.37µs  min=990ns   med=2.44µs  max=3.91ms   p(90)=4.08µs   p(95)=4.77µs   p(99.9)=33.16µs 
     http_req_connecting............: avg=601ns   min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.23ms min=2.06ms  med=39.87ms max=313.87ms p(90)=55.91ms  p(95)=60.81ms  p(99.9)=84.09ms 
       { expected_response:true }...: avg=40.23ms min=2.06ms  med=39.87ms max=313.87ms p(90)=55.91ms  p(95)=60.81ms  p(99.9)=84.09ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148320
     http_req_receiving.............: avg=76µs    min=26.61µs med=63.41µs max=75.49ms  p(90)=102.36µs p(95)=118.13µs p(99.9)=835.57µs
     http_req_sending...............: avg=25.4µs  min=4.55µs  med=10.84µs max=206.55ms p(90)=17.93µs  p(95)=21.71µs  p(99.9)=955.19µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.13ms min=1.94ms  med=39.77ms max=313.57ms p(90)=55.81ms  p(95)=60.71ms  p(99.9)=83.89ms 
     http_reqs......................: 148320  1233.167772/s
     iteration_duration.............: avg=40.47ms min=3.97ms  med=40.08ms max=323.18ms p(90)=56.11ms  p(95)=61.02ms  p(99.9)=84.67ms 
     iterations.....................: 148220  1232.336349/s
     success_rate...................: 100.00% ✓ 148220      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 208041     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 83 MB   692 kB/s
     http_req_blocked...............: avg=4.34µs  min=1.01µs  med=2.77µs  max=3.79ms   p(90)=4.21µs   p(95)=4.79µs   p(99.9)=48.84µs 
     http_req_connecting............: avg=1.34µs  min=0s      med=0s      max=3.76ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.16ms min=3.92ms  med=84.25ms max=317.26ms p(90)=107.71ms p(95)=118.67ms p(99.9)=202.89ms
       { expected_response:true }...: avg=86.16ms min=3.92ms  med=84.25ms max=317.26ms p(90)=107.71ms p(95)=118.67ms p(99.9)=202.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69447
     http_req_receiving.............: avg=84.94µs min=27.47µs med=73.89µs max=97.19ms  p(90)=110.48µs p(95)=123.79µs p(99.9)=626.86µs
     http_req_sending...............: avg=23.1µs  min=5.09µs  med=14.07µs max=91.97ms  p(90)=20.68µs  p(95)=22.83µs  p(99.9)=620.48µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.05ms min=3.85ms  med=84.15ms max=301.06ms p(90)=107.61ms p(95)=118.55ms p(99.9)=202.58ms
     http_reqs......................: 69447   576.24031/s
     iteration_duration.............: avg=86.53ms min=25.47ms med=84.49ms max=329.36ms p(90)=107.97ms p(95)=118.99ms p(99.9)=204.59ms
     iterations.....................: 69347   575.410554/s
     success_rate...................: 100.00% ✓ 69347      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 162273     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=5.73µs   min=1.49µs  med=3.71µs   max=3.97ms   p(90)=5.23µs   p(95)=5.85µs   p(99.9)=148.55µs
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.47ms min=5.33ms  med=108.46ms max=323.28ms p(90)=145.73ms p(95)=156.49ms p(99.9)=198.66ms
       { expected_response:true }...: avg=110.47ms min=5.33ms  med=108.46ms max=323.28ms p(90)=145.73ms p(95)=156.49ms p(99.9)=198.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54191
     http_req_receiving.............: avg=91.89µs  min=33.44µs med=84.88µs  max=94.08ms  p(90)=115.73µs p(95)=128.02µs p(99.9)=555.21µs
     http_req_sending...............: avg=23.85µs  min=6.26µs  med=17.79µs  max=42.47ms  p(90)=23.23µs  p(95)=25.23µs  p(99.9)=608.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.35ms min=5.23ms  med=108.35ms max=322.99ms p(90)=145.62ms p(95)=156.37ms p(99.9)=198.47ms
     http_reqs......................: 54191   449.149744/s
     iteration_duration.............: avg=110.95ms min=30.36ms med=108.79ms max=333.45ms p(90)=146.04ms p(95)=156.77ms p(99.9)=200.34ms
     iterations.....................: 54091   448.320917/s
     success_rate...................: 100.00% ✓ 54091      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 96627      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.02µs   min=1.15µs  med=3.13µs   max=3.63ms   p(90)=4.48µs   p(95)=5.02µs   p(99.9)=1.05ms  
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=1.03ms  
     http_req_duration..............: avg=185.52ms min=7.92ms  med=180.4ms  max=400.43ms p(90)=204.84ms p(95)=211.86ms p(99.9)=284.19ms
       { expected_response:true }...: avg=185.52ms min=7.92ms  med=180.4ms  max=400.43ms p(90)=204.84ms p(95)=211.86ms p(99.9)=284.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32309
     http_req_receiving.............: avg=92.1µs   min=30.09µs med=87.66µs  max=85.3ms   p(90)=117.43µs p(95)=128.5µs  p(99.9)=476.2µs 
     http_req_sending...............: avg=38.37µs  min=5.54µs  med=17.05µs  max=129.93ms p(90)=21.69µs  p(95)=23.5µs   p(99.9)=818.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.39ms min=7.77ms  med=180.29ms max=399.53ms p(90)=204.72ms p(95)=211.73ms p(99.9)=282.83ms
     http_reqs......................: 32309   267.057427/s
     iteration_duration.............: avg=186.38ms min=36ms    med=180.67ms max=410.81ms p(90)=205.12ms p(95)=212.15ms p(99.9)=287ms   
     iterations.....................: 32209   266.230854/s
     success_rate...................: 100.00% ✓ 32209      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 94518      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=7.25µs   min=1.64µs  med=3.76µs   max=3.91ms   p(90)=5.17µs   p(95)=5.81µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=189.68ms min=6.33ms  med=173.69ms max=728.94ms p(90)=223.25ms p(95)=273.39ms p(99.9)=590.42ms
       { expected_response:true }...: avg=189.68ms min=6.33ms  med=173.69ms max=728.94ms p(90)=223.25ms p(95)=273.39ms p(99.9)=590.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31606
     http_req_receiving.............: avg=96.72µs  min=36.67µs med=88.69µs  max=37.19ms  p(90)=120.29µs p(95)=131.94µs p(99.9)=696.34µs
     http_req_sending...............: avg=27.57µs  min=6.89µs  med=18.2µs   max=52.65ms  p(90)=22.8µs   p(95)=24.69µs  p(99.9)=494.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.56ms min=6.19ms  med=173.57ms max=728.87ms p(90)=223.15ms p(95)=273.27ms p(99.9)=590.32ms
     http_reqs......................: 31606   261.198463/s
     iteration_duration.............: avg=190.53ms min=35.82ms med=174.02ms max=729.15ms p(90)=223.61ms p(95)=274.17ms p(99.9)=590.7ms 
     iterations.....................: 31506   260.372043/s
     success_rate...................: 100.00% ✓ 31506      ✗ 0    
     vus............................: 7       min=7        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 8001      ✗ 0   
     data_received..................: 265 MB  2.1 MB/s
     data_sent......................: 3.3 MB  27 kB/s
     http_req_blocked...............: avg=53.32µs min=1.19µs   med=3.25µs  max=6.51ms  p(90)=4.76µs   p(95)=5.46µs   p(99.9)=5.61ms  
     http_req_connecting............: avg=46.67µs min=0s       med=0s      max=6.47ms  p(90)=0s       p(95)=0s       p(99.9)=5.52ms  
     http_req_duration..............: avg=2.18s   min=29.35ms  med=2.19s   max=11.77s  p(90)=3.04s    p(95)=3.25s    p(99.9)=9.53s   
       { expected_response:true }...: avg=2.18s   min=29.35ms  med=2.19s   max=11.77s  p(90)=3.04s    p(95)=3.25s    p(99.9)=9.53s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2767
     http_req_receiving.............: avg=98.78µs min=31.72µs  med=94.44µs max=1.08ms  p(90)=132.54µs p(95)=149.18µs p(99.9)=754.15µs
     http_req_sending...............: avg=62.07µs min=5.84µs   med=18.71µs max=20.58ms p(90)=23.99µs  p(95)=28.16µs  p(99.9)=4.18ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.18s   min=29.2ms   med=2.19s   max=11.77s  p(90)=3.04s    p(95)=3.25s    p(99.9)=9.53s   
     http_reqs......................: 2767    22.054653/s
     iteration_duration.............: avg=2.26s   min=508.26ms med=2.21s   max=11.78s  p(90)=3.05s    p(95)=3.26s    p(99.9)=9.58s   
     iterations.....................: 2667    21.257593/s
     success_rate...................: 100.00% ✓ 2667      ✗ 0   
     vus............................: 26      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

