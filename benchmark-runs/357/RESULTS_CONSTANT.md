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
| hive-router | v0.0.84 | 3,091 | 3,326 | 3,014 | 3.5% |  |
| fusion-nightly-net11 | 16.7.0-p.9 | 2,674 | 2,818 | 2,664 | 2.1% |  |
| fusion | 16.6.6 | 2,646 | 2,779 | 2,630 | 1.9% |  |
| fusion-nightly | 16.7.0-p.9 | 2,553 | 2,677 | 2,535 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.9 | 2,458 | 2,564 | 2,446 | 1.7% |  |
| grafbase | 0.53.5 | 2,220 | 2,332 | 2,204 | 1.9% |  |
| cosmo | 0.334.0 | 1,316 | 1,364 | 1,311 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 608 | 625 | 604 | 1.1% |  |
| apollo-router | v2.16.1 | 482 | 502 | 478 | 1.9% |  |
| apollo-gateway | 2.14.3 | 285 | 288 | 283 | 0.5% |  |
| hive-gateway | 2.10.8 | 276 | 283 | 275 | 1.0% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.9 | 2,502 | 2,627 | 2,491 | 1.9% |  |
| fusion-nightly | 16.7.0-p.9 | 2,472 | 2,584 | 2,430 | 2.0% |  |
| fusion | 16.6.6 | 2,409 | 2,524 | 2,385 | 1.9% |  |
| hive-router | v0.0.84 | 2,364 | 2,573 | 2,336 | 3.4% |  |
| fusion-nightly-fed | 16.7.0-p.9 | 2,186 | 2,298 | 2,179 | 1.9% |  |
| grafbase | 0.53.5 | 1,657 | 1,711 | 1,647 | 1.3% |  |
| cosmo | 0.334.0 | 1,181 | 1,227 | 1,170 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 595 | 616 | 589 | 1.6% |  |
| apollo-router | v2.16.1 | 441 | 452 | 425 | 1.6% |  |
| apollo-gateway | 2.14.3 | 270 | 274 | 270 | 0.5% |  |
| hive-gateway | 2.10.8 | 270 | 279 | 268 | 1.3% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 20 | 2.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1114332     ✗ 0     
     data_received..................: 33 GB   271 MB/s
     data_sent......................: 447 MB  3.7 MB/s
     http_req_blocked...............: avg=2.9µs   min=811ns   med=1.95µs  max=19.02ms  p(90)=3.39µs  p(95)=4.06µs   p(99.9)=33.31µs
     http_req_connecting............: avg=221ns   min=0s      med=0s      max=3.8ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.93ms min=1.4ms   med=15.17ms max=265.72ms p(90)=23.45ms p(95)=26.74ms  p(99.9)=46.3ms 
       { expected_response:true }...: avg=15.93ms min=1.4ms   med=15.17ms max=265.72ms p(90)=23.45ms p(95)=26.74ms  p(99.9)=46.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 371544
     http_req_receiving.............: avg=91.33µs min=25.44µs med=44.5µs  max=148.42ms p(90)=83.6µs  p(95)=160.46µs p(99.9)=7.94ms 
     http_req_sending...............: avg=50.34µs min=4.6µs   med=8.24µs  max=187.58ms p(90)=15.01µs p(95)=93.94µs  p(99.9)=9.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.79ms min=1.34ms  med=15.06ms max=265.29ms p(90)=23.26ms p(95)=26.45ms  p(99.9)=44.98ms
     http_reqs......................: 371544  3091.580688/s
     iteration_duration.............: avg=16.14ms min=2.06ms  med=15.36ms max=292.71ms p(90)=23.65ms p(95)=26.98ms  p(99.9)=47.32ms
     iterations.....................: 371444  3090.748598/s
     success_rate...................: 100.00% ✓ 371444      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 964530      ✗ 0     
     data_received..................: 28 GB   234 MB/s
     data_sent......................: 387 MB  3.2 MB/s
     http_req_blocked...............: avg=3.33µs  min=941ns   med=2.47µs   max=18.51ms  p(90)=4.05µs  p(95)=4.78µs  p(99.9)=35.57µs
     http_req_connecting............: avg=261ns   min=0s      med=0s       max=3.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.43ms min=1.89ms  med=17.32ms  max=276.5ms  p(90)=26.41ms p(95)=30.27ms p(99.9)=52.77ms
       { expected_response:true }...: avg=18.43ms min=1.89ms  med=17.32ms  max=276.5ms  p(90)=26.41ms p(95)=30.27ms p(99.9)=52.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 321610
     http_req_receiving.............: avg=1.05ms  min=51.11µs med=122.11µs max=133.28ms p(90)=2.72ms  p(95)=3.78ms  p(99.9)=25.11ms
     http_req_sending...............: avg=47.65µs min=4.8µs   med=8.98µs   max=120.77ms p(90)=17.57µs p(95)=95.51µs p(99.9)=5.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.33ms min=1.81ms  med=16.2ms   max=275.98ms p(90)=25.03ms p(95)=28.84ms p(99.9)=49.98ms
     http_reqs......................: 321610  2674.698142/s
     iteration_duration.............: avg=18.65ms min=2.98ms  med=17.52ms  max=295.13ms p(90)=26.63ms p(95)=30.51ms p(99.9)=53.26ms
     iterations.....................: 321510  2673.866483/s
     success_rate...................: 100.00% ✓ 321510      ✗ 0     
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

     checks.........................: 100.00% ✓ 954528      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 383 MB  3.2 MB/s
     http_req_blocked...............: avg=2.55µs   min=882ns   med=1.92µs  max=6.3ms    p(90)=3.12µs  p(95)=3.72µs  p(99.9)=26.37µs 
     http_req_connecting............: avg=281ns    min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.64ms  min=1.96ms  med=16.07ms max=287.37ms p(90)=30.19ms p(95)=36.4ms  p(99.9)=120.22ms
       { expected_response:true }...: avg=18.64ms  min=1.96ms  med=16.07ms max=287.37ms p(90)=30.19ms p(95)=36.4ms  p(99.9)=120.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 318276
     http_req_receiving.............: avg=544.66µs min=49.44µs med=87.8µs  max=177.31ms p(90)=1.05ms  p(95)=1.86ms  p(99.9)=23.87ms 
     http_req_sending...............: avg=43.33µs  min=4.53µs  med=8.27µs  max=166.01ms p(90)=15.04µs p(95)=82.35µs p(99.9)=4.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.05ms  min=1.88ms  med=15.55ms max=281.79ms p(90)=29.28ms p(95)=35.34ms p(99.9)=118.71ms
     http_reqs......................: 318276  2646.621047/s
     iteration_duration.............: avg=18.85ms  min=2.94ms  med=16.26ms max=304.05ms p(90)=30.4ms  p(95)=36.63ms p(99.9)=121.36ms
     iterations.....................: 318176  2645.789498/s
     success_rate...................: 100.00% ✓ 318176      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 920631      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=3.19µs   min=1.04µs  med=2.4µs   max=11.37ms  p(90)=3.71µs  p(95)=4.3µs   p(99.9)=33.68µs 
     http_req_connecting............: avg=305ns    min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.33ms  min=1.95ms  med=16.65ms max=320.12ms p(90)=31.55ms p(95)=38.08ms p(99.9)=115.31ms
       { expected_response:true }...: avg=19.33ms  min=1.95ms  med=16.65ms max=320.12ms p(90)=31.55ms p(95)=38.08ms p(99.9)=115.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306977
     http_req_receiving.............: avg=596.24µs min=53.25µs med=94.33µs max=208.77ms p(90)=1.11ms  p(95)=2.04ms  p(99.9)=26.88ms 
     http_req_sending...............: avg=44.31µs  min=4.98µs  med=9.01µs  max=208.05ms p(90)=14.92µs p(95)=86.61µs p(99.9)=4.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.69ms  min=1.86ms  med=16.1ms  max=231.22ms p(90)=30.57ms p(95)=36.95ms p(99.9)=112.93ms
     http_reqs......................: 306977  2553.068932/s
     iteration_duration.............: avg=19.54ms  min=2.81ms  med=16.85ms max=335.85ms p(90)=31.78ms p(95)=38.33ms p(99.9)=116.47ms
     iterations.....................: 306877  2552.237251/s
     success_rate...................: 100.00% ✓ 306877      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 886527      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=2.65µs   min=871ns   med=1.96µs  max=14.89ms  p(90)=3.24µs  p(95)=3.86µs  p(99.9)=28.4µs  
     http_req_connecting............: avg=283ns    min=0s      med=0s      max=3.39ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.08ms  min=1.62ms  med=16.28ms max=508.99ms p(90)=33.94ms p(95)=42.9ms  p(99.9)=167.21ms
       { expected_response:true }...: avg=20.08ms  min=1.62ms  med=16.28ms max=508.99ms p(90)=33.94ms p(95)=42.9ms  p(99.9)=167.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295609
     http_req_receiving.............: avg=579.15µs min=50.25µs med=90.78µs max=207.97ms p(90)=1.03ms  p(95)=1.84ms  p(99.9)=29.66ms 
     http_req_sending...............: avg=37.41µs  min=4.56µs  med=8.45µs  max=129.66ms p(90)=15.38µs p(95)=58.64µs p(99.9)=2.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.47ms  min=1.54ms  med=15.77ms max=508.92ms p(90)=32.98ms p(95)=41.77ms p(99.9)=165.11ms
     http_reqs......................: 295609  2458.978913/s
     iteration_duration.............: avg=20.29ms  min=2.25ms  med=16.47ms max=509.15ms p(90)=34.16ms p(95)=43.13ms p(99.9)=168.61ms
     iterations.....................: 295509  2458.147078/s
     success_rate...................: 100.00% ✓ 295509      ✗ 0     
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

     checks.........................: 100.00% ✓ 800706      ✗ 0     
     data_received..................: 24 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=3.48µs  min=1.03µs  med=2.67µs  max=12.4ms   p(90)=4.25µs  p(95)=5.04µs   p(99.9)=38.68µs
     http_req_connecting............: avg=339ns   min=0s      med=0s      max=3.6ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.25ms min=1.71ms  med=22.01ms max=299.22ms p(90)=26.57ms p(95)=28.46ms  p(99.9)=49.07ms
       { expected_response:true }...: avg=22.25ms min=1.71ms  med=22.01ms max=299.22ms p(90)=26.57ms p(95)=28.46ms  p(99.9)=49.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267002
     http_req_receiving.............: avg=94.05µs min=28.73µs med=56.99µs max=187.3ms  p(90)=96.08µs p(95)=126.36µs p(99.9)=6.51ms 
     http_req_sending...............: avg=40.91µs min=4.94µs  med=10.54µs max=146.04ms p(90)=17.6µs  p(95)=43.78µs  p(99.9)=2.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.11ms min=1.64ms  med=21.91ms max=298.42ms p(90)=26.43ms p(95)=28.26ms  p(99.9)=47.81ms
     http_reqs......................: 267002  2220.895256/s
     iteration_duration.............: avg=22.47ms min=3.33ms  med=22.21ms max=311.72ms p(90)=26.78ms p(95)=28.68ms  p(99.9)=49.49ms
     iterations.....................: 266902  2220.063466/s
     success_rate...................: 100.00% ✓ 266902      ✗ 0     
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

     checks.........................: 100.00% ✓ 474804      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=2.95µs  min=842ns   med=2.03µs  max=3.93ms   p(90)=3.47µs  p(95)=4.11µs   p(99.9)=30.16µs 
     http_req_connecting............: avg=597ns   min=0s      med=0s      max=3.89ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.68ms min=1.89ms  med=37.31ms max=297.07ms p(90)=52.64ms p(95)=57.23ms  p(99.9)=79.74ms 
       { expected_response:true }...: avg=37.68ms min=1.89ms  med=37.31ms max=297.07ms p(90)=52.64ms p(95)=57.23ms  p(99.9)=79.74ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 158368
     http_req_receiving.............: avg=68.38µs min=27.04µs med=56.28µs max=115.81ms p(90)=91.05µs p(95)=105.68µs p(99.9)=859.26µs
     http_req_sending...............: avg=21.79µs min=4.56µs  med=9.45µs  max=228.1ms  p(90)=16.12µs p(95)=20.05µs  p(99.9)=905.8µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.59ms min=1.84ms  med=37.22ms max=296.65ms p(90)=52.54ms p(95)=57.14ms  p(99.9)=79.54ms 
     http_reqs......................: 158368  1316.72981/s
     iteration_duration.............: avg=37.9ms  min=3.7ms   med=37.51ms max=305.37ms p(90)=52.83ms p(95)=57.42ms  p(99.9)=80.21ms 
     iterations.....................: 158268  1315.898373/s
     success_rate...................: 100.00% ✓ 158268      ✗ 0     
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

     checks.........................: 100.00% ✓ 219540     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 88 MB   731 kB/s
     http_req_blocked...............: avg=4µs     min=1.02µs  med=2.61µs  max=3.43ms   p(90)=4.14µs   p(95)=4.77µs   p(99.9)=41.7µs  
     http_req_connecting............: avg=1.13µs  min=0s      med=0s      max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.66ms min=3.6ms   med=79.73ms max=334.44ms p(90)=100.19ms p(95)=109.92ms p(99.9)=192.29ms
       { expected_response:true }...: avg=81.66ms min=3.6ms   med=79.73ms max=334.44ms p(90)=100.19ms p(95)=109.92ms p(99.9)=192.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73280
     http_req_receiving.............: avg=79.2µs  min=29.88µs med=67.52µs max=102.62ms p(90)=104.02µs p(95)=117.11µs p(99.9)=599.7µs 
     http_req_sending...............: avg=21.61µs min=5.13µs  med=12.25µs max=105.49ms p(90)=19.24µs  p(95)=21.53µs  p(99.9)=591.23µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.56ms min=3.54ms  med=79.64ms max=333.88ms p(90)=100.1ms  p(95)=109.84ms p(99.9)=192.08ms
     http_reqs......................: 73280   608.255182/s
     iteration_duration.............: avg=82ms    min=20.13ms med=79.97ms max=342.24ms p(90)=100.45ms p(95)=110.18ms p(99.9)=193.4ms 
     iterations.....................: 73180   607.42514/s
     success_rate...................: 100.00% ✓ 73180      ✗ 0    
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

     checks.........................: 100.00% ✓ 174234     ✗ 0    
     data_received..................: 5.1 GB  42 MB/s
     data_sent......................: 70 MB   579 kB/s
     http_req_blocked...............: avg=5.47µs   min=1.36µs  med=3.51µs   max=3.9ms    p(90)=4.95µs   p(95)=5.52µs   p(99.9)=96.38µs 
     http_req_connecting............: avg=1.71µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.88ms min=4.74ms  med=102.67ms max=333.4ms  p(90)=123.92ms p(95)=130.36ms p(99.9)=160.59ms
       { expected_response:true }...: avg=102.88ms min=4.74ms  med=102.67ms max=333.4ms  p(90)=123.92ms p(95)=130.36ms p(99.9)=160.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58178
     http_req_receiving.............: avg=84.89µs  min=30.58µs med=77.62µs  max=85.33ms  p(90)=109.51µs p(95)=122.24µs p(99.9)=624.05µs
     http_req_sending...............: avg=30.11µs  min=6.02µs  med=16.47µs  max=179.85ms p(90)=21.86µs  p(95)=23.79µs  p(99.9)=586.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.76ms min=4.62ms  med=102.56ms max=333.08ms p(90)=123.81ms p(95)=130.24ms p(99.9)=160.33ms
     http_reqs......................: 58178   482.439582/s
     iteration_duration.............: avg=103.33ms min=36.4ms  med=102.96ms max=342.58ms p(90)=124.2ms  p(95)=130.64ms p(99.9)=162.32ms
     iterations.....................: 58078   481.610334/s
     success_rate...................: 100.00% ✓ 58078      ✗ 0    
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

     checks.........................: 100.00% ✓ 103197     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   343 kB/s
     http_req_blocked...............: avg=5.82µs   min=1.09µs  med=2.98µs   max=4.03ms   p(90)=4.21µs   p(95)=4.71µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=2.66µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=173.76ms min=7.29ms  med=169.58ms max=326.21ms p(90)=205.29ms p(95)=210.12ms p(99.9)=273.43ms
       { expected_response:true }...: avg=173.76ms min=7.29ms  med=169.58ms max=326.21ms p(90)=205.29ms p(95)=210.12ms p(99.9)=273.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34499
     http_req_receiving.............: avg=85.57µs  min=31.61µs med=80.33µs  max=49.69ms  p(90)=110.33µs p(95)=121.62µs p(99.9)=416.91µs
     http_req_sending...............: avg=25.27µs  min=5.23µs  med=15.74µs  max=95.62ms  p(90)=20.05µs  p(95)=21.68µs  p(99.9)=496.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.65ms min=7.21ms  med=169.48ms max=325.99ms p(90)=205.19ms p(95)=210.03ms p(99.9)=273.35ms
     http_reqs......................: 34499   285.33349/s
     iteration_duration.............: avg=174.51ms min=54.38ms med=169.84ms max=341.78ms p(90)=205.57ms p(95)=210.38ms p(99.9)=276.22ms
     iterations.....................: 34399   284.506412/s
     success_rate...................: 100.00% ✓ 34399      ✗ 0    
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

     checks.........................: 100.00% ✓ 99936      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   332 kB/s
     http_req_blocked...............: avg=6.87µs   min=1.3µs   med=3.68µs   max=3.57ms   p(90)=5.14µs   p(95)=5.75µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=2.83µs   min=0s      med=0s       max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=179.4ms  min=5.74ms  med=165.9ms  max=601.39ms p(90)=210.24ms p(95)=256.95ms p(99.9)=537.15ms
       { expected_response:true }...: avg=179.4ms  min=5.74ms  med=165.9ms  max=601.39ms p(90)=210.24ms p(95)=256.95ms p(99.9)=537.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33412
     http_req_receiving.............: avg=97.25µs  min=37.27µs med=90µs     max=96.04ms  p(90)=119.87µs p(95)=132.02µs p(99.9)=726.29µs
     http_req_sending...............: avg=27.49µs  min=6.46µs  med=18.25µs  max=82.25ms  p(90)=22.98µs  p(95)=24.87µs  p(99.9)=630.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.27ms min=5.61ms  med=165.78ms max=601.26ms p(90)=210.09ms p(95)=256.84ms p(99.9)=537.02ms
     http_reqs......................: 33412   276.298268/s
     iteration_duration.............: avg=180.21ms min=21.69ms med=166.25ms max=601.68ms p(90)=210.6ms  p(95)=258.4ms  p(99.9)=537.42ms
     iterations.....................: 33312   275.471325/s
     success_rate...................: 100.00% ✓ 33312      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
data_received..................: 2.2 MB 37 kB/s
     data_sent......................: 29 kB  479 B/s
     http_req_blocked...............: avg=11.27µs  min=2.71µs   med=3.44µs  max=176.21µs p(90)=5.31µs   p(95)=9.79µs   p(99.9)=172.55µs
     http_req_connecting............: avg=4.01µs   min=0s       med=0s      max=92.33µs  p(90)=0s       p(95)=0s       p(99.9)=90.3µs  
     http_req_duration..............: avg=1.33s    min=22.38ms  med=31.51ms max=30.02s   p(90)=43.32ms  p(95)=45.32ms  p(99.9)=29.36s  
       { expected_response:true }...: avg=1.33s    min=22.38ms  med=31.51ms max=30.02s   p(90)=43.32ms  p(95)=45.32ms  p(99.9)=29.36s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 23  
     http_req_receiving.............: avg=174.87µs min=112.74µs med=153.9µs max=355.6µs  p(90)=264.86µs p(95)=296.04µs p(99.9)=354.35µs
     http_req_sending...............: avg=27.15µs  min=12.87µs  med=19.3µs  max=160.37µs p(90)=35.19µs  p(95)=43.3µs   p(99.9)=157.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.33s    min=22.07ms  med=31.36ms max=30.02s   p(90)=43.16ms  p(95)=45.15ms  p(99.9)=29.36s  
     http_reqs......................: 23     0.383331/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 902055      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=3.46µs  min=1.03µs  med=2.64µs   max=14.93ms  p(90)=4.35µs  p(95)=5.15µs   p(99.9)=35.68µs
     http_req_connecting............: avg=314ns   min=0s      med=0s       max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.72ms min=1.61ms  med=18.62ms  max=322.27ms p(90)=28.63ms p(95)=32.49ms  p(99.9)=54.39ms
       { expected_response:true }...: avg=19.72ms min=1.61ms  med=18.62ms  max=322.27ms p(90)=28.63ms p(95)=32.49ms  p(99.9)=54.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300785
     http_req_receiving.............: avg=1.21ms  min=51.11µs med=133.44µs max=201.18ms p(90)=3.2ms   p(95)=4.46ms   p(99.9)=26.63ms
     http_req_sending...............: avg=48.79µs min=4.75µs  med=9.66µs   max=96.28ms  p(90)=20.14µs p(95)=100.31µs p(99.9)=4.98ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.45ms min=1.47ms  med=17.31ms  max=314.84ms p(90)=27.1ms  p(95)=30.87ms  p(99.9)=51.98ms
     http_reqs......................: 300785  2502.104873/s
     iteration_duration.............: avg=19.94ms min=2.68ms  med=18.83ms  max=345.41ms p(90)=28.86ms p(95)=32.74ms  p(99.9)=54.96ms
     iterations.....................: 300685  2501.273014/s
     success_rate...................: 100.00% ✓ 300685      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 891240      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.95µs   min=902ns   med=2.07µs  max=17ms     p(90)=3.61µs  p(95)=4.31µs  p(99.9)=33.7µs  
     http_req_connecting............: avg=322ns    min=0s      med=0s      max=3.81ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.96ms  min=1.66ms  med=16.97ms max=307.35ms p(90)=32.58ms p(95)=39.54ms p(99.9)=126.07ms
       { expected_response:true }...: avg=19.96ms  min=1.66ms  med=16.97ms max=307.35ms p(90)=32.58ms p(95)=39.54ms p(99.9)=126.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297180
     http_req_receiving.............: avg=555.45µs min=49.02µs med=92.9µs  max=250.96ms p(90)=1.07ms  p(95)=1.87ms  p(99.9)=26.18ms 
     http_req_sending...............: avg=42.09µs  min=4.3µs   med=8.72µs  max=141.8ms  p(90)=17.68µs p(95)=74.42µs p(99.9)=3.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.36ms  min=1.54ms  med=16.45ms max=307.12ms p(90)=31.65ms p(95)=38.5ms  p(99.9)=124.28ms
     http_reqs......................: 297180  2472.17154/s
     iteration_duration.............: avg=20.18ms  min=2.74ms  med=17.17ms max=329.68ms p(90)=32.82ms p(95)=39.8ms  p(99.9)=127.79ms
     iterations.....................: 297080  2471.339663/s
     success_rate...................: 100.00% ✓ 297080      ✗ 0     
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

     checks.........................: 100.00% ✓ 868710     ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=3.42µs   min=1.01µs  med=2.52µs  max=16.24ms  p(90)=4.01µs  p(95)=4.7µs   p(99.9)=35.27µs 
     http_req_connecting............: avg=335ns    min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.49ms  min=1.61ms  med=17.18ms max=365.85ms p(90)=33.83ms p(95)=41.34ms p(99.9)=142.44ms
       { expected_response:true }...: avg=20.49ms  min=1.61ms  med=17.18ms max=365.85ms p(90)=33.83ms p(95)=41.34ms p(99.9)=142.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 289670
     http_req_receiving.............: avg=603.63µs min=50.32µs med=96.16µs max=243.43ms p(90)=1.12ms  p(95)=1.99ms  p(99.9)=29.44ms 
     http_req_sending...............: avg=43.92µs  min=4.78µs  med=9.44µs  max=185.65ms p(90)=16.78µs p(95)=88.97µs p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.84ms  min=1.49ms  med=16.63ms max=365.74ms p(90)=32.79ms p(95)=40.13ms p(99.9)=139.87ms
     http_reqs......................: 289670  2409.59316/s
     iteration_duration.............: avg=20.71ms  min=2.46ms  med=17.38ms max=366.03ms p(90)=34.06ms p(95)=41.58ms p(99.9)=143.85ms
     iterations.....................: 289570  2408.76132/s
     success_rate...................: 100.00% ✓ 289570     ✗ 0     
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

     checks.........................: 100.00% ✓ 852585      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=3.38µs  min=1.04µs  med=2.65µs  max=16.31ms  p(90)=4.16µs  p(95)=4.87µs   p(99.9)=39.05µs
     http_req_connecting............: avg=305ns   min=0s      med=0s      max=3.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.88ms min=1.8ms   med=20.69ms max=280.96ms p(90)=29.09ms p(95)=31.46ms  p(99.9)=49.69ms
       { expected_response:true }...: avg=20.88ms min=1.8ms   med=20.69ms max=280.96ms p(90)=29.09ms p(95)=31.46ms  p(99.9)=49.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284295
     http_req_receiving.............: avg=88.67µs min=25.98µs med=53.76µs max=33.81ms  p(90)=93.86µs p(95)=126.84µs p(99.9)=6.06ms 
     http_req_sending...............: avg=39.93µs min=4.99µs  med=10.61µs max=146.67ms p(90)=17.43µs p(95)=52.16µs  p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.75ms min=1.71ms  med=20.57ms max=270.66ms p(90)=28.94ms p(95)=31.29ms  p(99.9)=48.86ms
     http_reqs......................: 284295  2364.56337/s
     iteration_duration.............: avg=21.1ms  min=2.81ms  med=20.89ms max=292.65ms p(90)=29.29ms p(95)=31.68ms  p(99.9)=50.42ms
     iterations.....................: 284195  2363.731642/s
     success_rate...................: 100.00% ✓ 284195      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 788421      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 316 MB  2.6 MB/s
     http_req_blocked...............: avg=3.16µs   min=902ns   med=2.19µs   max=15.39ms  p(90)=3.88µs  p(95)=4.62µs  p(99.9)=31.28µs 
     http_req_connecting............: avg=343ns    min=0s      med=0s       max=3.74ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.6ms   min=1.94ms  med=19.04ms  max=339.09ms p(90)=36.84ms p(95)=45.27ms p(99.9)=156.17ms
       { expected_response:true }...: avg=22.6ms   min=1.94ms  med=19.04ms  max=339.09ms p(90)=36.84ms p(95)=45.27ms p(99.9)=156.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262907
     http_req_receiving.............: avg=630.29µs min=51.72µs med=101.62µs max=247.48ms p(90)=1.18ms  p(95)=2.02ms  p(99.9)=29.78ms 
     http_req_sending...............: avg=41.49µs  min=4.57µs  med=9.27µs   max=217.36ms p(90)=19.08µs p(95)=48.93µs p(99.9)=2.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.92ms  min=1.8ms   med=18.44ms  max=338.96ms p(90)=35.77ms p(95)=43.99ms p(99.9)=154.55ms
     http_reqs......................: 262907  2186.470537/s
     iteration_duration.............: avg=22.82ms  min=3.04ms  med=19.24ms  max=339.32ms p(90)=37.06ms p(95)=45.5ms  p(99.9)=157.05ms
     iterations.....................: 262807  2185.638886/s
     success_rate...................: 100.00% ✓ 262807      ✗ 0     
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

     checks.........................: 100.00% ✓ 597990      ✗ 0     
     data_received..................: 18 GB   145 MB/s
     data_sent......................: 240 MB  2.0 MB/s
     http_req_blocked...............: avg=3.96µs   min=881ns   med=2.89µs  max=4.77ms   p(90)=5.22µs   p(95)=6.28µs   p(99.9)=47.54µs
     http_req_connecting............: avg=499ns    min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.84ms  min=2.28ms  med=29.33ms max=341.67ms p(90)=39.5ms   p(95)=42.79ms  p(99.9)=63.62ms
       { expected_response:true }...: avg=29.84ms  min=2.28ms  med=29.33ms max=341.67ms p(90)=39.5ms   p(95)=42.79ms  p(99.9)=63.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199430
     http_req_receiving.............: avg=129.72µs min=28.43µs med=60.12µs max=266.23ms p(90)=133.11µs p(95)=226.02µs p(99.9)=5.1ms  
     http_req_sending...............: avg=44.02µs  min=4.64µs  med=10.83µs max=121.96ms p(90)=25.57µs  p(95)=120.37µs p(99.9)=3.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.66ms  min=2.2ms   med=29.2ms  max=87.05ms  p(90)=39.34ms  p(95)=42.6ms   p(99.9)=62.96ms
     http_reqs......................: 199430  1657.936193/s
     iteration_duration.............: avg=30.09ms  min=4.71ms  med=29.56ms max=361.6ms  p(90)=39.73ms  p(95)=43.01ms  p(99.9)=63.99ms
     iterations.....................: 199330  1657.104856/s
     success_rate...................: 100.00% ✓ 199330      ✗ 0     
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

     checks.........................: 100.00% ✓ 425973      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.15µs  min=1.04µs  med=2.22µs  max=3.41ms   p(90)=3.75µs   p(95)=4.44µs   p(99.9)=33µs    
     http_req_connecting............: avg=595ns   min=0s      med=0s      max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.01ms min=2.11ms  med=41.6ms  max=306.85ms p(90)=58.54ms  p(95)=63.63ms  p(99.9)=88.04ms 
       { expected_response:true }...: avg=42.01ms min=2.11ms  med=41.6ms  max=306.85ms p(90)=58.54ms  p(95)=63.63ms  p(99.9)=88.04ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142091
     http_req_receiving.............: avg=78.09µs min=28.29µs med=65.52µs max=202.69ms p(90)=104.11µs p(95)=119.99µs p(99.9)=717.17µs
     http_req_sending...............: avg=27.75µs min=4.59µs  med=10.85µs max=218.32ms p(90)=17.49µs  p(95)=20.99µs  p(99.9)=926.92µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.9ms  min=2ms     med=41.5ms  max=275.65ms p(90)=58.43ms  p(95)=63.53ms  p(99.9)=87.74ms 
     http_reqs......................: 142091  1181.256688/s
     iteration_duration.............: avg=42.25ms min=3.96ms  med=41.81ms max=315.85ms p(90)=58.74ms  p(95)=63.84ms  p(99.9)=88.6ms  
     iterations.....................: 141991  1180.425349/s
     success_rate...................: 100.00% ✓ 141991      ✗ 0     
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

     checks.........................: 100.00% ✓ 214890     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   715 kB/s
     http_req_blocked...............: avg=4.96µs  min=1.15µs  med=3.38µs  max=3.46ms   p(90)=4.98µs   p(95)=5.69µs   p(99.9)=45.12µs 
     http_req_connecting............: avg=1.28µs  min=0s      med=0s      max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.4ms  min=3.84ms  med=81.36ms max=320.13ms p(90)=101.65ms p(95)=111.76ms p(99.9)=196.87ms
       { expected_response:true }...: avg=83.4ms  min=3.84ms  med=81.36ms max=320.13ms p(90)=101.65ms p(95)=111.76ms p(99.9)=196.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71730
     http_req_receiving.............: avg=89.96µs min=30.5µs  med=78.09µs max=144.81ms p(90)=113.88µs p(95)=126.66µs p(99.9)=679.85µs
     http_req_sending...............: avg=26.12µs min=5.57µs  med=15.46µs max=158.74ms p(90)=22.6µs   p(95)=24.96µs  p(99.9)=668.36µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.29ms min=3.76ms  med=81.25ms max=319.55ms p(90)=101.53ms p(95)=111.63ms p(99.9)=196.48ms
     http_reqs......................: 71730   595.219137/s
     iteration_duration.............: avg=83.77ms min=20.93ms med=81.61ms max=334.09ms p(90)=101.92ms p(95)=112.05ms p(99.9)=198.1ms 
     iterations.....................: 71630   594.389332/s
     success_rate...................: 100.00% ✓ 71630      ✗ 0    
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

     checks.........................: 100.00% ✓ 159369     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   530 kB/s
     http_req_blocked...............: avg=4.79µs   min=1.04µs  med=3.04µs   max=3.32ms   p(90)=4.46µs   p(95)=5.02µs   p(99.9)=85.55µs 
     http_req_connecting............: avg=1.56µs   min=0s      med=0s       max=3.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.5ms  min=4.94ms  med=110.43ms max=319.54ms p(90)=148.63ms p(95)=159.95ms p(99.9)=203.51ms
       { expected_response:true }...: avg=112.5ms  min=4.94ms  med=110.43ms max=319.54ms p(90)=148.63ms p(95)=159.95ms p(99.9)=203.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53223
     http_req_receiving.............: avg=82.3µs   min=28.51µs med=78.58µs  max=66.08ms  p(90)=108.91µs p(95)=120.64µs p(99.9)=556.89µs
     http_req_sending...............: avg=22.98µs  min=5.25µs  med=16.66µs  max=71.7ms   p(90)=21.76µs  p(95)=23.62µs  p(99.9)=488.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.4ms  min=4.81ms  med=110.33ms max=293.49ms p(90)=148.54ms p(95)=159.86ms p(99.9)=203.4ms 
     http_reqs......................: 53223   441.144806/s
     iteration_duration.............: avg=112.98ms min=21.04ms med=110.75ms max=338.61ms p(90)=148.97ms p(95)=160.26ms p(99.9)=206.45ms
     iterations.....................: 53123   440.315945/s
     success_rate...................: 100.00% ✓ 53123      ✗ 0    
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

     checks.........................: 100.00% ✓ 98040      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.43µs  med=3.62µs   max=4.21ms   p(90)=5.04µs   p(95)=5.64µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.87µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=182.85ms min=7.76ms  med=189.24ms max=370.61ms p(90)=204.53ms p(95)=209.51ms p(99.9)=280.24ms
       { expected_response:true }...: avg=182.85ms min=7.76ms  med=189.24ms max=370.61ms p(90)=204.53ms p(95)=209.51ms p(99.9)=280.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32780
     http_req_receiving.............: avg=98.44µs  min=35.14µs med=91.33µs  max=68.06ms  p(90)=122.29µs p(95)=134.81µs p(99.9)=486.37µs
     http_req_sending...............: avg=27.89µs  min=5.93µs  med=18.06µs  max=88.47ms  p(90)=22.82µs  p(95)=24.78µs  p(99.9)=631.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.73ms min=7.62ms  med=189.13ms max=360.35ms p(90)=204.41ms p(95)=209.38ms p(99.9)=279.48ms
     http_reqs......................: 32780   270.963959/s
     iteration_duration.............: avg=183.7ms  min=46.41ms med=189.53ms max=378.59ms p(90)=204.82ms p(95)=209.82ms p(99.9)=281.67ms
     iterations.....................: 32680   270.137345/s
     success_rate...................: 100.00% ✓ 32680      ✗ 0    
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

     checks.........................: 100.00% ✓ 97590      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=6.65µs   min=1.41µs  med=3.78µs   max=3.48ms   p(90)=5.29µs   p(95)=5.93µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=2.6µs    min=0s      med=0s       max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=183.69ms min=5.89ms  med=167.59ms max=671.55ms p(90)=215.96ms p(95)=261ms    p(99.9)=608.04ms
       { expected_response:true }...: avg=183.69ms min=5.89ms  med=167.59ms max=671.55ms p(90)=215.96ms p(95)=261ms    p(99.9)=608.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32630
     http_req_receiving.............: avg=100.64µs min=36.02µs med=91.37µs  max=81.01ms  p(90)=122.02µs p(95)=135.38µs p(99.9)=618.53µs
     http_req_sending...............: avg=28.31µs  min=6.57µs  med=19.1µs   max=64.28ms  p(90)=23.85µs  p(95)=25.9µs   p(99.9)=578.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.56ms min=5.75ms  med=167.47ms max=671.44ms p(90)=215.83ms p(95)=260.74ms p(99.9)=607.92ms
     http_reqs......................: 32630   270.072528/s
     iteration_duration.............: avg=184.54ms min=35.26ms med=167.95ms max=671.82ms p(90)=216.42ms p(95)=262.38ms p(99.9)=608.36ms
     iterations.....................: 32530   269.244847/s
     success_rate...................: 100.00% ✓ 32530      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 7296      ✗ 0   
     data_received..................: 242 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=40.14µs  min=1.48µs   med=3.91µs  max=3.53ms  p(90)=5.63µs   p(95)=6.62µs   p(99.9)=3.25ms  
     http_req_connecting............: avg=35.51µs  min=0s       med=0s      max=3.49ms  p(90)=0s       p(95)=0s       p(99.9)=3.23ms  
     http_req_duration..............: avg=2.37s    min=26.55ms  med=2.39s   max=5.55s   p(90)=3.26s    p(95)=3.55s    p(99.9)=5.14s   
       { expected_response:true }...: avg=2.37s    min=26.55ms  med=2.39s   max=5.55s   p(90)=3.26s    p(95)=3.55s    p(99.9)=5.14s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2532
     http_req_receiving.............: avg=109.84µs min=32.12µs  med=97.57µs max=18.58ms p(90)=139.82µs p(95)=163.53µs p(99.9)=368.67µs
     http_req_sending...............: avg=46.67µs  min=5.95µs   med=19.5µs  max=16.9ms  p(90)=24.95µs  p(95)=29.94µs  p(99.9)=2.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.37s    min=26.46ms  med=2.39s   max=5.55s   p(90)=3.26s    p(95)=3.55s    p(99.9)=5.13s   
     http_reqs......................: 2532    20.298794/s
     iteration_duration.............: avg=2.47s    min=760.82ms med=2.42s   max=5.55s   p(90)=3.28s    p(95)=3.57s    p(99.9)=5.14s   
     iterations.....................: 2432    19.497104/s
     success_rate...................: 100.00% ✓ 2432      ✗ 0   
     vus............................: 35      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

