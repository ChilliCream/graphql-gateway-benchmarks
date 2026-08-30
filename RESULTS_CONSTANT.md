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
| hive-router | v0.0.84 | 3,089 | 3,349 | 3,068 | 3.1% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,687 | 2,801 | 2,670 | 1.7% |  |
| fusion-nightly | 16.7.0-p.1 | 2,572 | 2,698 | 2,557 | 1.8% |  |
| fusion | 16.6.2 | 2,549 | 2,678 | 2,536 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,469 | 2,532 | 2,461 | 0.9% |  |
| grafbase | 0.53.5 | 2,187 | 2,303 | 2,175 | 2.0% |  |
| cosmo | 0.334.0 | 1,323 | 1,370 | 1,316 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 602 | 623 | 599 | 1.5% |  |
| apollo-router | v2.16.1 | 484 | 504 | 479 | 1.7% |  |
| hive-gateway | 2.10.8 | 285 | 294 | 283 | 1.3% |  |
| apollo-gateway | 2.14.3 | 282 | 285 | 280 | 0.7% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1276 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,574 | 2,685 | 2,558 | 1.7% |  |
| fusion-nightly | 16.7.0-p.1 | 2,507 | 2,621 | 2,501 | 1.7% |  |
| fusion | 16.6.2 | 2,443 | 2,560 | 2,433 | 1.8% |  |
| hive-router | v0.0.84 | 2,430 | 2,633 | 2,386 | 3.4% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,320 | 2,408 | 2,315 | 1.6% |  |
| grafbase | 0.53.5 | 1,632 | 1,692 | 1,629 | 1.3% |  |
| cosmo | 0.334.0 | 1,232 | 1,278 | 1,227 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 565 | 586 | 563 | 1.3% |  |
| apollo-router | v2.16.1 | 413 | 435 | 403 | 2.9% |  |
| apollo-gateway | 2.14.3 | 262 | 267 | 260 | 0.8% |  |
| hive-gateway | 2.10.8 | 262 | 271 | 261 | 1.2% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 21 | 3.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1113837     ✗ 0     
     data_received..................: 33 GB   271 MB/s
     data_sent......................: 446 MB  3.7 MB/s
     http_req_blocked...............: avg=2.83µs  min=902ns   med=2.04µs  max=18.24ms  p(90)=3.35µs  p(95)=3.98µs  p(99.9)=29.82µs
     http_req_connecting............: avg=223ns   min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=15.94ms min=1.52ms  med=15.24ms max=283.09ms p(90)=23.35ms p(95)=26.55ms p(99.9)=46.79ms
       { expected_response:true }...: avg=15.94ms min=1.52ms  med=15.24ms max=283.09ms p(90)=23.35ms p(95)=26.55ms p(99.9)=46.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 371379
     http_req_receiving.............: avg=88.8µs  min=24.42µs med=44.18µs max=167.62ms p(90)=82.77µs p(95)=159.5µs p(99.9)=7.52ms 
     http_req_sending...............: avg=49.63µs min=4.81µs  med=8.49µs  max=170.93ms p(90)=14.83µs p(95)=94.8µs  p(99.9)=7.03ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=15.8ms  min=1.44ms  med=15.12ms max=282.47ms p(90)=23.18ms p(95)=26.29ms p(99.9)=45.67ms
     http_reqs......................: 371379  3089.803229/s
     iteration_duration.............: avg=16.15ms min=1.89ms  med=15.43ms max=292.07ms p(90)=23.56ms p(95)=26.79ms p(99.9)=47.64ms
     iterations.....................: 371279  3088.971248/s
     success_rate...................: 100.00% ✓ 371279      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 969024      ✗ 0     
     data_received..................: 28 GB   236 MB/s
     data_sent......................: 388 MB  3.2 MB/s
     http_req_blocked...............: avg=2.88µs  min=951ns   med=2.21µs  max=14.46ms  p(90)=3.42µs  p(95)=3.96µs  p(99.9)=30.47µs
     http_req_connecting............: avg=308ns   min=0s      med=0s      max=3.59ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.35ms min=1.92ms  med=17.47ms max=303.05ms p(90)=26.6ms  p(95)=30.2ms  p(99.9)=51.36ms
       { expected_response:true }...: avg=18.35ms min=1.92ms  med=17.47ms max=303.05ms p(90)=26.6ms  p(95)=30.2ms  p(99.9)=51.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 323108
     http_req_receiving.............: avg=478.9µs min=51.96µs med=95.56µs max=114.54ms p(90)=1.16ms  p(95)=1.8ms   p(99.9)=17.34ms
     http_req_sending...............: avg=45.32µs min=4.62µs  med=8.36µs  max=209.83ms p(90)=14.39µs p(95)=90.47µs p(99.9)=4.56ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.83ms min=1.82ms  med=16.95ms max=286.39ms p(90)=25.97ms p(95)=29.48ms p(99.9)=49.72ms
     http_reqs......................: 323108  2687.257347/s
     iteration_duration.............: avg=18.56ms min=3.18ms  med=17.66ms max=312.42ms p(90)=26.81ms p(95)=30.44ms p(99.9)=51.88ms
     iterations.....................: 323008  2686.425657/s
     success_rate...................: 100.00% ✓ 323008      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 927729      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=3.43µs   min=1.02µs  med=2.4µs   max=73.54ms  p(90)=3.62µs  p(95)=4.2µs   p(99.9)=33.65µs 
     http_req_connecting............: avg=287ns    min=0s      med=0s      max=3.57ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.18ms  min=2.01ms  med=16.58ms max=334.23ms p(90)=31.03ms p(95)=37.51ms p(99.9)=115.57ms
       { expected_response:true }...: avg=19.18ms  min=2.01ms  med=16.58ms max=334.23ms p(90)=31.03ms p(95)=37.51ms p(99.9)=115.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309343
     http_req_receiving.............: avg=565.15µs min=50.95µs med=93.66µs max=133.58ms p(90)=1.08ms  p(95)=1.92ms  p(99.9)=26.08ms 
     http_req_sending...............: avg=41.56µs  min=4.93µs  med=8.98µs  max=201.34ms p(90)=14.89µs p(95)=89.24µs p(99.9)=3.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.57ms  min=1.91ms  med=16.04ms max=334.15ms p(90)=30.1ms  p(95)=36.43ms p(99.9)=114.35ms
     http_reqs......................: 309343  2572.314227/s
     iteration_duration.............: avg=19.39ms  min=3.08ms  med=16.78ms max=334.42ms p(90)=31.25ms p(95)=37.74ms p(99.9)=116.55ms
     iterations.....................: 309243  2571.482686/s
     success_rate...................: 100.00% ✓ 309243      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 919569      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=3.05µs   min=1.03µs  med=2.35µs  max=10.19ms  p(90)=3.6µs   p(95)=4.18µs  p(99.9)=33.33µs 
     http_req_connecting............: avg=309ns    min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.35ms  min=2.04ms  med=16.62ms max=351.13ms p(90)=31.53ms p(95)=38.2ms  p(99.9)=122.76ms
       { expected_response:true }...: avg=19.35ms  min=2.04ms  med=16.62ms max=351.13ms p(90)=31.53ms p(95)=38.2ms  p(99.9)=122.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306623
     http_req_receiving.............: avg=580.29µs min=51.82µs med=94.56µs max=202.98ms p(90)=1.09ms  p(95)=1.92ms  p(99.9)=26.74ms 
     http_req_sending...............: avg=42.57µs  min=4.5µs   med=8.73µs  max=182.31ms p(90)=14.73µs p(95)=87.48µs p(99.9)=3.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.73ms  min=1.89ms  med=16.08ms max=350.99ms p(90)=30.59ms p(95)=37.12ms p(99.9)=121.01ms
     http_reqs......................: 306623  2549.57371/s
     iteration_duration.............: avg=19.56ms  min=3.13ms  med=16.82ms max=351.32ms p(90)=31.76ms p(95)=38.47ms p(99.9)=123.38ms
     iterations.....................: 306523  2548.742209/s
     success_rate...................: 100.00% ✓ 306523      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 890367      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.62µs   min=862ns  med=1.93µs  max=8.27ms   p(90)=3.18µs  p(95)=3.78µs  p(99.9)=30.5µs  
     http_req_connecting............: avg=319ns    min=0s     med=0s      max=3.79ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.99ms  min=1.68ms med=16.31ms max=328.47ms p(90)=34.27ms p(95)=43.16ms p(99.9)=150.55ms
       { expected_response:true }...: avg=19.99ms  min=1.68ms med=16.31ms max=328.47ms p(90)=34.27ms p(95)=43.16ms p(99.9)=150.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296889
     http_req_receiving.............: avg=574.35µs min=48.8µs med=89.18µs max=156.68ms p(90)=1.04ms  p(95)=1.85ms  p(99.9)=28.36ms 
     http_req_sending...............: avg=41.75µs  min=4.52µs med=8.26µs  max=133.31ms p(90)=14.78µs p(95)=65.39µs p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.38ms  min=1.59ms med=15.81ms max=328.37ms p(90)=33.28ms p(95)=42ms    p(99.9)=149.59ms
     http_reqs......................: 296889  2469.653946/s
     iteration_duration.............: avg=20.2ms   min=2.67ms med=16.51ms max=328.69ms p(90)=34.49ms p(95)=43.38ms p(99.9)=152.1ms 
     iterations.....................: 296789  2468.822101/s
     success_rate...................: 100.00% ✓ 296789      ✗ 0     
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

     checks.........................: 100.00% ✓ 788712      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 316 MB  2.6 MB/s
     http_req_blocked...............: avg=2.78µs  min=942ns   med=2.04µs  max=10.3ms   p(90)=3.37µs  p(95)=4.07µs   p(99.9)=32.19µs
     http_req_connecting............: avg=328ns   min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.6ms  min=1.7ms   med=22.36ms max=280.51ms p(90)=26.79ms p(95)=28.48ms  p(99.9)=46.85ms
       { expected_response:true }...: avg=22.6ms  min=1.7ms   med=22.36ms max=280.51ms p(90)=26.79ms p(95)=28.48ms  p(99.9)=46.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263004
     http_req_receiving.............: avg=85.51µs min=27.71µs med=54.54µs max=213.81ms p(90)=91.76µs p(95)=118.04µs p(99.9)=5.31ms 
     http_req_sending...............: avg=34.82µs min=4.8µs   med=9.26µs  max=123.86ms p(90)=15.65µs p(95)=24.65µs  p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.48ms min=1.62ms  med=22.27ms max=279.96ms p(90)=26.66ms p(95)=28.31ms  p(99.9)=45.68ms
     http_reqs......................: 263004  2187.504559/s
     iteration_duration.............: avg=22.81ms min=3.03ms  med=22.55ms max=293.63ms p(90)=26.98ms p(95)=28.69ms  p(99.9)=47.35ms
     iterations.....................: 262904  2186.672821/s
     success_rate...................: 100.00% ✓ 262904      ✗ 0     
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

     checks.........................: 100.00% ✓ 477279      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3µs     min=932ns   med=2.08µs  max=4.01ms   p(90)=3.5µs   p(95)=4.14µs   p(99.9)=32.93µs 
     http_req_connecting............: avg=594ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.48ms min=2.03ms  med=37.08ms max=286.06ms p(90)=52.24ms p(95)=56.77ms  p(99.9)=78.83ms 
       { expected_response:true }...: avg=37.48ms min=2.03ms  med=37.08ms max=286.06ms p(90)=52.24ms p(95)=56.77ms  p(99.9)=78.83ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159193
     http_req_receiving.............: avg=68.97µs min=25.54µs med=56.43µs max=49.65ms  p(90)=91.25µs p(95)=105.58µs p(99.9)=830.4µs 
     http_req_sending...............: avg=23.14µs min=4.65µs  med=9.83µs  max=199.35ms p(90)=16.69µs p(95)=20.5µs   p(99.9)=911.59µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.39ms min=1.87ms  med=36.99ms max=285.41ms p(90)=52.14ms p(95)=56.66ms  p(99.9)=78.54ms 
     http_reqs......................: 159193  1323.535672/s
     iteration_duration.............: avg=37.7ms  min=3.9ms   med=37.28ms max=295.96ms p(90)=52.43ms p(95)=56.97ms  p(99.9)=79.29ms 
     iterations.....................: 159093  1322.704269/s
     success_rate...................: 100.00% ✓ 159093      ✗ 0     
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

     checks.........................: 100.00% ✓ 217572     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 87 MB   724 kB/s
     http_req_blocked...............: avg=3.81µs  min=952ns   med=2.27µs  max=3.99ms   p(90)=3.87µs   p(95)=4.47µs   p(99.9)=41.28µs 
     http_req_connecting............: avg=1.2µs   min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=82.39ms min=3.59ms  med=79.74ms max=318.01ms p(90)=108.53ms p(95)=120.35ms p(99.9)=207.62ms
       { expected_response:true }...: avg=82.39ms min=3.59ms  med=79.74ms max=318.01ms p(90)=108.53ms p(95)=120.35ms p(99.9)=207.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 72624
     http_req_receiving.............: avg=74.67µs min=27.25µs med=62.66µs max=160.51ms p(90)=98.35µs  p(95)=112.11µs p(99.9)=565.26µs
     http_req_sending...............: avg=22.02µs min=4.76µs  med=11.36µs max=161.65ms p(90)=18.33µs  p(95)=20.39µs  p(99.9)=573.12µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.3ms  min=3.5ms   med=79.66ms max=317.6ms  p(90)=108.44ms p(95)=120.24ms p(99.9)=207ms   
     http_reqs......................: 72624   602.799505/s
     iteration_duration.............: avg=82.74ms min=31.37ms med=79.99ms max=327.54ms p(90)=108.79ms p(95)=120.66ms p(99.9)=211.4ms 
     iterations.....................: 72524   601.969477/s
     success_rate...................: 100.00% ✓ 72524      ✗ 0    
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

     checks.........................: 100.00% ✓ 174957     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   582 kB/s
     http_req_blocked...............: avg=4.65µs   min=1.09µs  med=2.96µs   max=3.23ms   p(90)=4.35µs   p(95)=4.87µs   p(99.9)=51.46µs 
     http_req_connecting............: avg=1.51µs   min=0s      med=0s       max=3.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.46ms min=4.68ms  med=102.31ms max=326.17ms p(90)=123.47ms p(95)=129.66ms p(99.9)=158.01ms
       { expected_response:true }...: avg=102.46ms min=4.68ms  med=102.31ms max=326.17ms p(90)=123.47ms p(95)=129.66ms p(99.9)=158.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58419
     http_req_receiving.............: avg=84.44µs  min=29.83µs med=78.8µs   max=134.13ms p(90)=109.44µs p(95)=122.51µs p(99.9)=609.86µs
     http_req_sending...............: avg=30.11µs  min=5.36µs  med=15.69µs  max=210.48ms p(90)=21.09µs  p(95)=22.91µs  p(99.9)=537.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.34ms min=4.55ms  med=102.21ms max=325.63ms p(90)=123.37ms p(95)=129.55ms p(99.9)=157.43ms
     http_reqs......................: 58419   484.428015/s
     iteration_duration.............: avg=102.9ms  min=11.69ms med=102.59ms max=335.63ms p(90)=123.74ms p(95)=129.94ms p(99.9)=159.74ms
     iterations.....................: 58319   483.598785/s
     success_rate...................: 100.00% ✓ 58319      ✗ 0    
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

     checks.........................: 100.00% ✓ 103323     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   343 kB/s
     http_req_blocked...............: avg=5.95µs   min=1.08µs  med=3.34µs   max=3.37ms   p(90)=4.72µs   p(95)=5.29µs   p(99.9)=1.09ms  
     http_req_connecting............: avg=2.42µs   min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=173.61ms min=5.54ms  med=158.28ms max=670.79ms p(90)=199.98ms p(95)=233.45ms p(99.9)=596.94ms
       { expected_response:true }...: avg=173.61ms min=5.54ms  med=158.28ms max=670.79ms p(90)=199.98ms p(95)=233.45ms p(99.9)=596.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34541
     http_req_receiving.............: avg=96.42µs  min=32.54µs med=91.7µs   max=48.6ms   p(90)=121.07µs p(95)=132.56µs p(99.9)=523.16µs
     http_req_sending...............: avg=27.81µs  min=5.61µs  med=17.73µs  max=169.04ms p(90)=21.95µs  p(95)=23.67µs  p(99.9)=477.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.49ms min=5.41ms  med=158.16ms max=670.72ms p(90)=199.83ms p(95)=233.22ms p(99.9)=596.84ms
     http_reqs......................: 34541   285.386193/s
     iteration_duration.............: avg=174.38ms min=37.39ms med=158.58ms max=671.15ms p(90)=200.32ms p(95)=234.03ms p(99.9)=597.23ms
     iterations.....................: 34441   284.559969/s
     success_rate...................: 100.00% ✓ 34441      ✗ 0    
     vus............................: 10      min=10       max=50 
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

     checks.........................: 100.00% ✓ 102129     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=6.21µs   min=1.37µs  med=3.42µs   max=3.56ms   p(90)=4.77µs   p(95)=5.33µs   p(99.9)=1.18ms  
     http_req_connecting............: avg=2.55µs   min=0s      med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=175.54ms min=7.4ms   med=175.19ms max=399.36ms p(90)=185.63ms p(95)=189.96ms p(99.9)=264.36ms
       { expected_response:true }...: avg=175.54ms min=7.4ms   med=175.19ms max=399.36ms p(90)=185.63ms p(95)=189.96ms p(99.9)=264.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34143
     http_req_receiving.............: avg=90.28µs  min=32.66µs med=82.82µs  max=123.4ms  p(90)=112.77µs p(95)=123.83µs p(99.9)=489.79µs
     http_req_sending...............: avg=30.85µs  min=6.33µs  med=16.8µs   max=97.96ms  p(90)=21.46µs  p(95)=23.21µs  p(99.9)=542.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.42ms min=7.31ms  med=175.08ms max=398.74ms p(90)=185.51ms p(95)=189.8ms  p(99.9)=264.12ms
     http_reqs......................: 34143   282.301294/s
     iteration_duration.............: avg=176.34ms min=51.8ms  med=175.5ms  max=408.8ms  p(90)=185.9ms  p(95)=190.27ms p(99.9)=268.4ms 
     iterations.....................: 34043   281.474474/s
     success_rate...................: 100.00% ✓ 34043      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 927873      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=2.94µs   min=922ns   med=2.23µs  max=13.77ms  p(90)=3.8µs   p(95)=4.52µs  p(99.9)=33.41µs
     http_req_connecting............: avg=275ns    min=0s      med=0s      max=3.21ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.17ms  min=1.5ms   med=18.33ms max=332.64ms p(90)=27.67ms p(95)=31.18ms p(99.9)=52.32ms
       { expected_response:true }...: avg=19.17ms  min=1.5ms   med=18.33ms max=332.64ms p(90)=27.67ms p(95)=31.18ms p(99.9)=52.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309391
     http_req_receiving.............: avg=529.22µs min=50.46µs med=97.74µs max=83.64ms  p(90)=1.35ms  p(95)=2.14ms  p(99.9)=18.5ms 
     http_req_sending...............: avg=44.82µs  min=4.81µs  med=9.08µs  max=182.98ms p(90)=18.09µs p(95)=89.58µs p(99.9)=3.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.59ms  min=1.39ms  med=17.76ms max=332.03ms p(90)=26.99ms p(95)=30.44ms p(99.9)=50.43ms
     http_reqs......................: 309391  2574.093769/s
     iteration_duration.............: avg=19.38ms  min=2.41ms  med=18.53ms max=345.48ms p(90)=27.89ms p(95)=31.42ms p(99.9)=53.03ms
     iterations.....................: 309291  2573.261782/s
     success_rate...................: 100.00% ✓ 309291      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 904059      ✗ 0     
     data_received..................: 26 GB   220 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=2.62µs   min=912ns   med=2.07µs  max=7.11ms   p(90)=3.57µs  p(95)=4.3µs   p(99.9)=33.02µs 
     http_req_connecting............: avg=117ns    min=0s      med=0s      max=1.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.68ms  min=1.55ms  med=16.66ms max=536.91ms p(90)=32.1ms  p(95)=39.09ms p(99.9)=134.01ms
       { expected_response:true }...: avg=19.68ms  min=1.55ms  med=16.66ms max=536.91ms p(90)=32.1ms  p(95)=39.09ms p(99.9)=134.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301453
     http_req_receiving.............: avg=544.52µs min=50.57µs med=91.52µs max=195.16ms p(90)=1.04ms  p(95)=1.83ms  p(99.9)=26.5ms  
     http_req_sending...............: avg=43.13µs  min=4.56µs  med=8.68µs  max=153.45ms p(90)=16.73µs p(95)=81.66µs p(99.9)=3.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.1ms   min=1.47ms  med=16.16ms max=536.81ms p(90)=31.13ms p(95)=38ms    p(99.9)=131.62ms
     http_reqs......................: 301453  2507.617711/s
     iteration_duration.............: avg=19.9ms   min=2.59ms  med=16.86ms max=537.05ms p(90)=32.32ms p(95)=39.33ms p(99.9)=135.22ms
     iterations.....................: 301353  2506.785867/s
     success_rate...................: 100.00% ✓ 301353      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 881070      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=2.94µs  min=852ns   med=2.12µs  max=18.11ms  p(90)=3.88µs  p(95)=4.63µs  p(99.9)=34.51µs 
     http_req_connecting............: avg=300ns   min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.2ms  min=1.58ms  med=16.94ms max=371.55ms p(90)=33.05ms p(95)=40.54ms p(99.9)=149.52ms
       { expected_response:true }...: avg=20.2ms  min=1.58ms  med=16.94ms max=371.55ms p(90)=33.05ms p(95)=40.54ms p(99.9)=149.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293790
     http_req_receiving.............: avg=567.2µs min=50.22µs med=94.01µs max=195.54ms p(90)=1.09ms  p(95)=1.89ms  p(99.9)=26.16ms 
     http_req_sending...............: avg=42.76µs min=4.67µs  med=8.68µs  max=195.54ms p(90)=17.84µs p(95)=79.9µs  p(99.9)=3.21ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.59ms min=1.51ms  med=16.42ms max=371.46ms p(90)=32.06ms p(95)=39.47ms p(99.9)=147.41ms
     http_reqs......................: 293790  2443.892639/s
     iteration_duration.............: avg=20.42ms min=2.51ms  med=17.14ms max=371.75ms p(90)=33.28ms p(95)=40.79ms p(99.9)=151.89ms
     iterations.....................: 293690  2443.060789/s
     success_rate...................: 100.00% ✓ 293690      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 876324      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=3.4µs   min=1.09µs  med=2.64µs  max=11.92ms  p(90)=4.16µs  p(95)=4.88µs   p(99.9)=36.95µs
     http_req_connecting............: avg=322ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.31ms min=1.73ms  med=20.1ms  max=295.78ms p(90)=28.21ms p(95)=30.63ms  p(99.9)=49.51ms
       { expected_response:true }...: avg=20.31ms min=1.73ms  med=20.1ms  max=295.78ms p(90)=28.21ms p(95)=30.63ms  p(99.9)=49.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292208
     http_req_receiving.............: avg=88.46µs min=26.32µs med=53.45µs max=159.42ms p(90)=91.44µs p(95)=122.31µs p(99.9)=5.98ms 
     http_req_sending...............: avg=40.56µs min=5.07µs  med=10.16µs max=118.79ms p(90)=16.52µs p(95)=52.96µs  p(99.9)=2.49ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.18ms min=1.67ms  med=19.99ms max=295.32ms p(90)=28.07ms p(95)=30.45ms  p(99.9)=48.3ms 
     http_reqs......................: 292208  2430.603135/s
     iteration_duration.............: avg=20.53ms min=3.07ms  med=20.3ms  max=316.6ms  p(90)=28.42ms p(95)=30.84ms  p(99.9)=49.94ms
     iterations.....................: 292108  2429.771329/s
     success_rate...................: 100.00% ✓ 292108      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 836664      ✗ 0     
     data_received..................: 25 GB   203 MB/s
     data_sent......................: 335 MB  2.8 MB/s
     http_req_blocked...............: avg=2.94µs   min=832ns   med=2.1µs   max=12.97ms  p(90)=3.83µs  p(95)=4.6µs   p(99.9)=35.27µs 
     http_req_connecting............: avg=336ns    min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.28ms  min=1.86ms  med=17.86ms max=447.45ms p(90)=34.73ms p(95)=42.86ms p(99.9)=149.63ms
       { expected_response:true }...: avg=21.28ms  min=1.86ms  med=17.86ms max=447.45ms p(90)=34.73ms p(95)=42.86ms p(99.9)=149.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 278988
     http_req_receiving.............: avg=574.65µs min=50.89µs med=98.27µs max=161.92ms p(90)=1.09ms  p(95)=1.88ms  p(99.9)=28.05ms 
     http_req_sending...............: avg=40.63µs  min=4.46µs  med=8.82µs  max=142.38ms p(90)=18.44µs p(95)=69.39µs p(99.9)=2.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.67ms  min=1.74ms  med=17.33ms max=447.36ms p(90)=33.75ms p(95)=41.74ms p(99.9)=147.99ms
     http_reqs......................: 278988  2320.394821/s
     iteration_duration.............: avg=21.5ms   min=2.86ms  med=18.06ms max=447.57ms p(90)=34.95ms p(95)=43.1ms  p(99.9)=150.41ms
     iterations.....................: 278888  2319.563102/s
     success_rate...................: 100.00% ✓ 278888      ✗ 0     
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

     checks.........................: 100.00% ✓ 588987      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 236 MB  2.0 MB/s
     http_req_blocked...............: avg=4.08µs   min=992ns   med=3.03µs  max=10.92ms  p(90)=5.22µs   p(95)=6.3µs    p(99.9)=49.09µs
     http_req_connecting............: avg=436ns    min=0s      med=0s      max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.3ms   min=2.19ms  med=29.71ms max=291.7ms  p(90)=40.13ms  p(95)=43.54ms  p(99.9)=68.69ms
       { expected_response:true }...: avg=30.3ms   min=2.19ms  med=29.71ms max=291.7ms  p(90)=40.13ms  p(95)=43.54ms  p(99.9)=68.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196429
     http_req_receiving.............: avg=102.95µs min=26.91µs med=60.15µs max=113.48ms p(90)=130.81µs p(95)=218.98µs p(99.9)=4.47ms 
     http_req_sending...............: avg=43.68µs  min=5.17µs  med=11.3µs  max=106.07ms p(90)=25.36µs  p(95)=114.89µs p(99.9)=2.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.15ms  min=2.11ms  med=29.59ms max=290.78ms p(90)=39.97ms  p(95)=43.35ms  p(99.9)=68.1ms 
     http_reqs......................: 196429  1632.949703/s
     iteration_duration.............: avg=30.55ms  min=4.39ms  med=29.94ms max=324.26ms p(90)=40.36ms  p(95)=43.76ms  p(99.9)=69.22ms
     iterations.....................: 196329  1632.118385/s
     success_rate...................: 100.00% ✓ 196329      ✗ 0     
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

     checks.........................: 100.00% ✓ 444516      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.93µs  min=1.1µs   med=2.94µs  max=4.32ms   p(90)=4.58µs   p(95)=5.29µs   p(99.9)=37.58µs 
     http_req_connecting............: avg=658ns   min=0s      med=0s      max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.23ms min=2.13ms  med=39.88ms max=304.57ms p(90)=55.97ms  p(95)=60.9ms   p(99.9)=84.55ms 
       { expected_response:true }...: avg=40.23ms min=2.13ms  med=39.88ms max=304.57ms p(90)=55.97ms  p(95)=60.9ms   p(99.9)=84.55ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148272
     http_req_receiving.............: avg=82.28µs min=28.67µs med=69.48µs max=19.58ms  p(90)=108.99µs p(95)=126.15µs p(99.9)=908.32µs
     http_req_sending...............: avg=28.18µs min=5.26µs  med=12.76µs max=120.04ms p(90)=19.75µs  p(95)=23.62µs  p(99.9)=1.11ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.12ms min=2.05ms  med=39.77ms max=304.4ms  p(90)=55.84ms  p(95)=60.77ms  p(99.9)=84.08ms 
     http_reqs......................: 148272  1232.718809/s
     iteration_duration.............: avg=40.48ms min=3.95ms  med=40.1ms  max=327.21ms p(90)=56.19ms  p(95)=61.12ms  p(99.9)=84.87ms 
     iterations.....................: 148172  1231.887419/s
     success_rate...................: 100.00% ✓ 148172      ✗ 0     
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

     checks.........................: 100.00% ✓ 204054     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   679 kB/s
     http_req_blocked...............: avg=4.24µs  min=1.02µs  med=2.61µs  max=3.99ms   p(90)=4.1µs    p(95)=4.71µs   p(99.9)=43µs    
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.86ms min=3.97ms  med=85.97ms max=327.6ms  p(90)=107.35ms p(95)=117.52ms p(99.9)=206.87ms
       { expected_response:true }...: avg=87.86ms min=3.97ms  med=85.97ms max=327.6ms  p(90)=107.35ms p(95)=117.52ms p(99.9)=206.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68118
     http_req_receiving.............: avg=88.65µs min=29.43µs med=70.2µs  max=204.63ms p(90)=105.65µs p(95)=118.74µs p(99.9)=609.67µs
     http_req_sending...............: avg=20.38µs min=5.08µs  med=12.87µs max=72.83ms  p(90)=19.76µs  p(95)=21.84µs  p(99.9)=560.65µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.75ms min=3.84ms  med=85.88ms max=327.33ms p(90)=107.23ms p(95)=117.4ms  p(99.9)=205.19ms
     http_reqs......................: 68118   565.16357/s
     iteration_duration.............: avg=88.22ms min=22.23ms med=86.21ms max=354.54ms p(90)=107.59ms p(95)=117.8ms  p(99.9)=208.16ms
     iterations.....................: 68018   564.333887/s
     success_rate...................: 100.00% ✓ 68018      ✗ 0    
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

     checks.........................: 100.00% ✓ 149553     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   497 kB/s
     http_req_blocked...............: avg=4.92µs   min=1.11µs med=2.81µs   max=3.88ms   p(90)=4.24µs   p(95)=4.81µs   p(99.9)=227.87µs
     http_req_connecting............: avg=1.9µs    min=0s     med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=113.39µs
     http_req_duration..............: avg=119.91ms min=5.03ms med=117.69ms max=324.98ms p(90)=158.78ms p(95)=171.08ms p(99.9)=219.38ms
       { expected_response:true }...: avg=119.91ms min=5.03ms med=117.69ms max=324.98ms p(90)=158.78ms p(95)=171.08ms p(99.9)=219.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49951
     http_req_receiving.............: avg=87.11µs  min=27.9µs med=75.32µs  max=163.94ms p(90)=107.72µs p(95)=119.78µs p(99.9)=576.63µs
     http_req_sending...............: avg=22.99µs  min=5.33µs med=15.09µs  max=85.1ms   p(90)=20.65µs  p(95)=22.43µs  p(99.9)=522.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.8ms  min=4.91ms med=117.6ms  max=324.76ms p(90)=158.66ms p(95)=170.95ms p(99.9)=219.22ms
     http_reqs......................: 49951   413.986852/s
     iteration_duration.............: avg=120.39ms min=31ms   med=118ms    max=346.56ms p(90)=159.08ms p(95)=171.36ms p(99.9)=220.54ms
     iterations.....................: 49851   413.158066/s
     success_rate...................: 100.00% ✓ 49851      ✗ 0    
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

     checks.........................: 100.00% ✓ 95034      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=5.19µs   min=1.12µs  med=3.12µs   max=2.71ms   p(90)=4.43µs   p(95)=4.95µs   p(99.9)=924.85µs
     http_req_connecting............: avg=1.87µs   min=0s      med=0s       max=2.67ms   p(90)=0s       p(95)=0s       p(99.9)=899.65µs
     http_req_duration..............: avg=188.61ms min=7.99ms  med=187.04ms max=377.19ms p(90)=201.18ms p(95)=207.08ms p(99.9)=280.96ms
       { expected_response:true }...: avg=188.61ms min=7.99ms  med=187.04ms max=377.19ms p(90)=201.18ms p(95)=207.08ms p(99.9)=280.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31778
     http_req_receiving.............: avg=90.06µs  min=32.87µs med=87.95µs  max=4.72ms   p(90)=117.97µs p(95)=129.26µs p(99.9)=505.09µs
     http_req_sending...............: avg=36.57µs  min=5.05µs  med=17.27µs  max=170ms    p(90)=21.78µs  p(95)=23.5µs   p(99.9)=502.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.49ms min=7.87ms  med=186.92ms max=376.55ms p(90)=201.07ms p(95)=206.97ms p(99.9)=280.85ms
     http_reqs......................: 31778   262.656527/s
     iteration_duration.............: avg=189.49ms min=32.5ms  med=187.39ms max=387.16ms p(90)=201.47ms p(95)=207.39ms p(99.9)=282.89ms
     iterations.....................: 31678   261.829991/s
     success_rate...................: 100.00% ✓ 31678      ✗ 0    
     vus............................: 0       min=0        max=50 
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

     checks.........................: 100.00% ✓ 94986      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.29µs  med=3.72µs   max=4.03ms   p(90)=5.12µs   p(95)=5.73µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.8µs    min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=188.72ms min=5.79ms  med=174.62ms max=627.78ms p(90)=219.15ms p(95)=268.74ms p(99.9)=560.68ms
       { expected_response:true }...: avg=188.72ms min=5.79ms  med=174.62ms max=627.78ms p(90)=219.15ms p(95)=268.74ms p(99.9)=560.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31762
     http_req_receiving.............: avg=100.49µs min=34.14µs med=91.44µs  max=99.98ms  p(90)=122.35µs p(95)=133.94µs p(99.9)=628.42µs
     http_req_sending...............: avg=27.75µs  min=6.11µs  med=18.54µs  max=69.69ms  p(90)=23.01µs  p(95)=24.83µs  p(99.9)=512.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.59ms min=5.69ms  med=174.51ms max=627.66ms p(90)=219.03ms p(95)=268.66ms p(99.9)=560.59ms
     http_reqs......................: 31762   262.580036/s
     iteration_duration.............: avg=189.6ms  min=33.36ms med=174.99ms max=628.02ms p(90)=219.64ms p(95)=270.23ms p(99.9)=560.98ms
     iterations.....................: 31662   261.753325/s
     success_rate...................: 100.00% ✓ 31662      ✗ 0    
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

     checks.........................: 100.00% ✓ 8178      ✗ 0   
     data_received..................: 271 MB  2.2 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=82.37µs  min=1.26µs   med=3.42µs  max=8.28ms  p(90)=5.01µs   p(95)=5.88µs   p(99.9)=7.76ms 
     http_req_connecting............: avg=74.27µs  min=0s       med=0s      max=8.26ms  p(90)=0s       p(95)=0s       p(99.9)=7.73ms 
     http_req_duration..............: avg=2.13s    min=26.24ms  med=2.19s   max=4.13s   p(90)=2.8s     p(95)=2.97s    p(99.9)=3.74s  
       { expected_response:true }...: avg=2.13s    min=26.24ms  med=2.19s   max=4.13s   p(90)=2.8s     p(95)=2.97s    p(99.9)=3.74s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2826
     http_req_receiving.............: avg=105.55µs min=30.92µs  med=94.34µs max=10.79ms p(90)=142.91µs p(95)=159.14µs p(99.9)=1ms    
     http_req_sending...............: avg=101.53µs min=5.85µs   med=19.1µs  max=34.54ms p(90)=24.39µs  p(95)=28.44µs  p(99.9)=14.68ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.13s    min=26.07ms  med=2.19s   max=4.13s   p(90)=2.8s     p(95)=2.97s    p(99.9)=3.74s  
     http_reqs......................: 2826    22.681918/s
     iteration_duration.............: avg=2.2s     min=325.32ms med=2.21s   max=4.13s   p(90)=2.81s    p(95)=2.98s    p(99.9)=3.74s  
     iterations.....................: 2726    21.879302/s
     success_rate...................: 100.00% ✓ 2726      ✗ 0   
     vus............................: 46      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

