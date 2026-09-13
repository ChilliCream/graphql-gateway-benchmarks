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
| hive-router | v0.0.84 | 2,957 | 3,178 | 2,910 | 3.2% |  |
| fusion | 16.6.6 | 2,626 | 2,699 | 2,585 | 1.2% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,620 | 2,728 | 2,609 | 1.5% |  |
| fusion-nightly | 16.7.0-p.6 | 2,571 | 2,711 | 2,561 | 2.1% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,451 | 2,543 | 2,437 | 1.4% |  |
| grafbase | 0.53.5 | 2,137 | 2,266 | 2,125 | 2.2% |  |
| cosmo | 0.334.0 | 1,327 | 1,370 | 1,325 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 616 | 637 | 615 | 1.4% |  |
| apollo-router | v2.16.1 | 487 | 505 | 485 | 1.4% |  |
| apollo-gateway | 2.14.3 | 280 | 284 | 278 | 0.7% |  |
| hive-gateway | 2.10.8 | 272 | 280 | 269 | 1.5% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1158 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,509 | 2,598 | 2,497 | 1.4% |  |
| fusion-nightly | 16.7.0-p.6 | 2,403 | 2,522 | 2,389 | 1.8% |  |
| fusion | 16.6.6 | 2,399 | 2,536 | 2,384 | 2.1% |  |
| hive-router | v0.0.84 | 2,348 | 2,566 | 2,327 | 3.6% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,302 | 2,400 | 2,290 | 1.7% |  |
| grafbase | 0.53.5 | 1,645 | 1,694 | 1,635 | 1.2% |  |
| cosmo | 0.334.0 | 1,228 | 1,269 | 1,217 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 568 | 590 | 566 | 1.6% |  |
| apollo-router | v2.16.1 | 443 | 463 | 435 | 2.1% |  |
| apollo-gateway | 2.14.3 | 267 | 272 | 267 | 0.6% |  |
| hive-gateway | 2.10.8 | 263 | 273 | 262 | 1.6% |  |
| feddi | 5ff8b6165878 | 20 | 20 | 19 | 2.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1066008     ✗ 0     
     data_received..................: 31 GB   259 MB/s
     data_sent......................: 427 MB  3.6 MB/s
     http_req_blocked...............: avg=3.08µs  min=881ns   med=1.83µs  max=19.89ms  p(90)=2.95µs  p(95)=3.5µs    p(99.9)=30.09µs
     http_req_connecting............: avg=808ns   min=0s      med=0s      max=9.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.68ms min=1.48ms  med=16ms    max=269.16ms p(90)=24.65ms p(95)=27.67ms  p(99.9)=46.25ms
       { expected_response:true }...: avg=16.68ms min=1.48ms  med=16ms    max=269.16ms p(90)=24.65ms p(95)=27.67ms  p(99.9)=46.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 355436
     http_req_receiving.............: avg=82.5µs  min=26.48µs med=45.69µs max=131.02ms p(90)=78.57µs p(95)=123.17µs p(99.9)=6.76ms 
     http_req_sending...............: avg=43.48µs min=4.52µs  med=8.12µs  max=219.73ms p(90)=13.44µs p(95)=79.85µs  p(99.9)=4.53ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.55ms min=1.42ms  med=15.9ms  max=267.15ms p(90)=24.48ms p(95)=27.45ms  p(99.9)=45.1ms 
     http_reqs......................: 355436  2957.291431/s
     iteration_duration.............: avg=16.87ms min=2ms     med=16.18ms max=280.38ms p(90)=24.84ms p(95)=27.88ms  p(99.9)=47.03ms
     iterations.....................: 355336  2956.459413/s
     success_rate...................: 100.00% ✓ 355336      ✗ 0     
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

     checks.........................: 100.00% ✓ 947274      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=3.96µs   min=831ns   med=1.78µs  max=55.02ms  p(90)=2.88µs  p(95)=3.43µs  p(99.9)=26.4µs  
     http_req_connecting............: avg=1.79µs   min=0s      med=0s      max=54.97ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.78ms  min=1.96ms  med=16.23ms max=287.87ms p(90)=30.45ms p(95)=36.81ms p(99.9)=113.45ms
       { expected_response:true }...: avg=18.78ms  min=1.96ms  med=16.23ms max=287.87ms p(90)=30.45ms p(95)=36.81ms p(99.9)=113.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315858
     http_req_receiving.............: avg=562.97µs min=51.73µs med=87.49µs max=158.87ms p(90)=1.07ms  p(95)=1.94ms  p(99.9)=25.39ms 
     http_req_sending...............: avg=42.92µs  min=4.26µs  med=7.81µs  max=146.24ms p(90)=13.4µs  p(95)=77.39µs p(99.9)=5.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.18ms  min=1.84ms  med=15.7ms  max=273.87ms p(90)=29.49ms p(95)=35.73ms p(99.9)=111.34ms
     http_reqs......................: 315858  2626.858708/s
     iteration_duration.............: avg=18.99ms  min=2.86ms  med=16.42ms max=296.2ms  p(90)=30.66ms p(95)=37.04ms p(99.9)=114.08ms
     iterations.....................: 315758  2626.02705/s
     success_rate...................: 100.00% ✓ 315758      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 944958      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 379 MB  3.1 MB/s
     http_req_blocked...............: avg=3.22µs  min=942ns   med=2.27µs  max=74.97ms  p(90)=3.51µs  p(95)=4.1µs   p(99.9)=31.06µs
     http_req_connecting............: avg=323ns   min=0s      med=0s      max=4.49ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.82ms min=1.97ms  med=17.69ms max=271.55ms p(90)=27.08ms p(95)=30.89ms p(99.9)=52.74ms
       { expected_response:true }...: avg=18.82ms min=1.97ms  med=17.69ms max=271.55ms p(90)=27.08ms p(95)=30.89ms p(99.9)=52.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315086
     http_req_receiving.............: avg=1.11ms  min=52.14µs med=184.5µs max=111.78ms p(90)=2.74ms  p(95)=3.76ms  p(99.9)=25.03ms
     http_req_sending...............: avg=44.05µs min=4.79µs  med=8.6µs   max=108.09ms p(90)=15.15µs p(95)=90.23µs p(99.9)=4.73ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.67ms min=1.85ms  med=16.5ms  max=270.82ms p(90)=25.66ms p(95)=29.37ms p(99.9)=50.3ms 
     http_reqs......................: 315086  2620.173969/s
     iteration_duration.............: avg=19.04ms min=3.05ms  med=17.88ms max=287.6ms  p(90)=27.29ms p(95)=31.12ms p(99.9)=53.49ms
     iterations.....................: 314986  2619.342394/s
     success_rate...................: 100.00% ✓ 314986      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 927666      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=3.08µs   min=1µs     med=2.34µs  max=16.91ms  p(90)=3.6µs   p(95)=4.17µs  p(99.9)=32.93µs 
     http_req_connecting............: avg=283ns    min=0s      med=0s      max=3.41ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.18ms  min=2.05ms  med=16.41ms max=280.64ms p(90)=31.32ms p(95)=38ms    p(99.9)=125.16ms
       { expected_response:true }...: avg=19.18ms  min=2.05ms  med=16.41ms max=280.64ms p(90)=31.32ms p(95)=38ms    p(99.9)=125.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309322
     http_req_receiving.............: avg=576.44µs min=52.16µs med=94.83µs max=143.18ms p(90)=1.09ms  p(95)=1.96ms  p(99.9)=25.44ms 
     http_req_sending...............: avg=44.28µs  min=4.86µs  med=8.73µs  max=150.83ms p(90)=14.62µs p(95)=89.18µs p(99.9)=4.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.56ms  min=1.92ms  med=15.86ms max=280.08ms p(90)=30.35ms p(95)=36.91ms p(99.9)=123.48ms
     http_reqs......................: 309322  2571.993674/s
     iteration_duration.............: avg=19.39ms  min=3.11ms  med=16.61ms max=296.77ms p(90)=31.53ms p(95)=38.23ms p(99.9)=126.33ms
     iterations.....................: 309222  2571.16218/s
     success_rate...................: 100.00% ✓ 309222      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 883995      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 354 MB  2.9 MB/s
     http_req_blocked...............: avg=2.73µs   min=812ns  med=2.04µs  max=7.73ms   p(90)=3.28µs  p(95)=3.88µs  p(99.9)=29.05µs 
     http_req_connecting............: avg=323ns    min=0s     med=0s      max=3.89ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.14ms  min=1.69ms med=16.42ms max=438.13ms p(90)=33.71ms p(95)=42.63ms p(99.9)=167.75ms
       { expected_response:true }...: avg=20.14ms  min=1.69ms med=16.42ms max=438.13ms p(90)=33.71ms p(95)=42.63ms p(99.9)=167.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 294765
     http_req_receiving.............: avg=562.04µs min=50µs   med=89.97µs max=166.39ms p(90)=1.01ms  p(95)=1.77ms  p(99.9)=28.04ms 
     http_req_sending...............: avg=40.75µs  min=4.5µs  med=8.22µs  max=192.15ms p(90)=14.36µs p(95)=53.2µs  p(99.9)=3.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.54ms  min=1.61ms med=15.93ms max=438.02ms p(90)=32.69ms p(95)=41.48ms p(99.9)=166.09ms
     http_reqs......................: 294765  2451.946337/s
     iteration_duration.............: avg=20.35ms  min=2.58ms med=16.62ms max=438.3ms  p(90)=33.92ms p(95)=42.85ms p(99.9)=168.98ms
     iterations.....................: 294665  2451.114506/s
     success_rate...................: 100.00% ✓ 294665      ✗ 0     
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

     checks.........................: 100.00% ✓ 770766      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=2.87µs  min=892ns   med=2.12µs  max=11ms     p(90)=3.56µs  p(95)=4.29µs   p(99.9)=31.82µs
     http_req_connecting............: avg=343ns   min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.13ms min=1.73ms  med=22.9ms  max=289.11ms p(90)=27.34ms p(95)=29.01ms  p(99.9)=46.66ms
       { expected_response:true }...: avg=23.13ms min=1.73ms  med=22.9ms  max=289.11ms p(90)=27.34ms p(95)=29.01ms  p(99.9)=46.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257022
     http_req_receiving.............: avg=84.25µs min=28.11µs med=55.09µs max=256.56ms p(90)=91.52µs p(95)=113.58µs p(99.9)=4.58ms 
     http_req_sending...............: avg=32.24µs min=4.62µs  med=9.06µs  max=147.56ms p(90)=15.29µs p(95)=22.64µs  p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.02ms min=1.63ms  med=22.81ms max=288.65ms p(90)=27.23ms p(95)=28.85ms  p(99.9)=45.43ms
     http_reqs......................: 257022  2137.852099/s
     iteration_duration.............: avg=23.34ms min=4.09ms  med=23.09ms max=333.56ms p(90)=27.54ms p(95)=29.21ms  p(99.9)=47.03ms
     iterations.....................: 256922  2137.020321/s
     success_rate...................: 100.00% ✓ 256922      ✗ 0     
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

     checks.........................: 100.00% ✓ 478581      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=2.9µs   min=921ns   med=2.02µs  max=3.83ms   p(90)=3.45µs  p(95)=4.1µs    p(99.9)=30.77µs 
     http_req_connecting............: avg=558ns   min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.38ms min=2ms     med=37.01ms max=288.85ms p(90)=52.19ms p(95)=56.86ms  p(99.9)=78.48ms 
       { expected_response:true }...: avg=37.38ms min=2ms     med=37.01ms max=288.85ms p(90)=52.19ms p(95)=56.86ms  p(99.9)=78.48ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159627
     http_req_receiving.............: avg=69.86µs min=25.68µs med=56.55µs max=104.92ms p(90)=91.72µs p(95)=106.88µs p(99.9)=904.64µs
     http_req_sending...............: avg=22.42µs min=4.74µs  med=9.44µs  max=135.72ms p(90)=16µs    p(95)=19.85µs  p(99.9)=885.77µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.29ms min=1.95ms  med=36.93ms max=288.22ms p(90)=52.1ms  p(95)=56.77ms  p(99.9)=78.34ms 
     http_reqs......................: 159627  1327.169664/s
     iteration_duration.............: avg=37.6ms  min=3.34ms  med=37.21ms max=301.18ms p(90)=52.39ms p(95)=57.04ms  p(99.9)=78.82ms 
     iterations.....................: 159527  1326.338245/s
     success_rate...................: 100.00% ✓ 159527      ✗ 0     
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

     checks.........................: 100.00% ✓ 222615     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   741 kB/s
     http_req_blocked...............: avg=4.35µs  min=1.15µs  med=2.84µs  max=3.98ms   p(90)=4.31µs   p(95)=4.97µs   p(99.9)=46.16µs 
     http_req_connecting............: avg=1.22µs  min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.52ms min=3.56ms  med=79.3ms  max=326.65ms p(90)=99.29ms  p(95)=108.41ms p(99.9)=189.36ms
       { expected_response:true }...: avg=80.52ms min=3.56ms  med=79.3ms  max=326.65ms p(90)=99.29ms  p(95)=108.41ms p(99.9)=189.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74305
     http_req_receiving.............: avg=78.01µs min=29.88µs med=68.35µs max=86.63ms  p(90)=104.01µs p(95)=117.09µs p(99.9)=672.35µs
     http_req_sending...............: avg=25.85µs min=5.52µs  med=13.03µs max=210.61ms p(90)=19.32µs  p(95)=21.64µs  p(99.9)=621.42µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.41ms min=3.49ms  med=79.21ms max=326.26ms p(90)=99.18ms  p(95)=108.3ms  p(99.9)=189.17ms
     http_reqs......................: 74305   616.791873/s
     iteration_duration.............: avg=80.86ms min=10.31ms med=79.53ms max=348.46ms p(90)=99.52ms  p(95)=108.68ms p(99.9)=191.79ms
     iterations.....................: 74205   615.961792/s
     success_rate...................: 100.00% ✓ 74205      ✗ 0    
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

     checks.........................: 100.00% ✓ 176085     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   586 kB/s
     http_req_blocked...............: avg=4.41µs   min=1.24µs  med=3.47µs   max=1.97ms   p(90)=4.89µs   p(95)=5.45µs   p(99.9)=53.12µs 
     http_req_connecting............: avg=704ns    min=0s      med=0s       max=1.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.8ms  min=4.71ms  med=101.48ms max=307.43ms p(90)=122.82ms p(95)=129.07ms p(99.9)=157.85ms
       { expected_response:true }...: avg=101.8ms  min=4.71ms  med=101.48ms max=307.43ms p(90)=122.82ms p(95)=129.07ms p(99.9)=157.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58795
     http_req_receiving.............: avg=90.54µs  min=30.95µs med=81.9µs   max=120.96ms p(90)=113.49µs p(95)=126.62µs p(99.9)=610.65µs
     http_req_sending...............: avg=24.61µs  min=5.86µs  med=16.46µs  max=83.69ms  p(90)=22.06µs  p(95)=23.94µs  p(99.9)=587.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.68ms min=4.56ms  med=101.37ms max=307.08ms p(90)=122.71ms p(95)=128.95ms p(99.9)=157.24ms
     http_reqs......................: 58795   487.599098/s
     iteration_duration.............: avg=102.24ms min=14.65ms med=101.76ms max=333.15ms p(90)=123.09ms p(95)=129.36ms p(99.9)=159.94ms
     iterations.....................: 58695   486.769778/s
     success_rate...................: 100.00% ✓ 58695      ✗ 0    
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

     checks.........................: 100.00% ✓ 101589     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=5.98µs   min=1.42µs  med=3.4µs    max=3.36ms   p(90)=4.65µs   p(95)=5.18µs   p(99.9)=772.11µs
     http_req_connecting............: avg=2.35µs   min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=750.05µs
     http_req_duration..............: avg=176.53ms min=7.36ms  med=175.26ms max=309.82ms p(90)=189.72ms p(95)=194.87ms p(99.9)=254.54ms
       { expected_response:true }...: avg=176.53ms min=7.36ms  med=175.26ms max=309.82ms p(90)=189.72ms p(95)=194.87ms p(99.9)=254.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33963
     http_req_receiving.............: avg=85.98µs  min=33.22µs med=81.05µs  max=25.71ms  p(90)=110.24µs p(95)=120.67µs p(99.9)=515.17µs
     http_req_sending...............: avg=22.31µs  min=5.72µs  med=16.57µs  max=27.07ms  p(90)=20.9µs   p(95)=22.53µs  p(99.9)=595.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.42ms min=7.27ms  med=175.15ms max=309.66ms p(90)=189.62ms p(95)=194.77ms p(99.9)=254.36ms
     http_reqs......................: 33963   280.79641/s
     iteration_duration.............: avg=177.29ms min=29.88ms med=175.76ms max=315.95ms p(90)=190ms    p(95)=195.14ms p(99.9)=255.24ms
     iterations.....................: 33863   279.969638/s
     success_rate...................: 100.00% ✓ 33863      ✗ 0    
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

     checks.........................: 100.00% ✓ 98298      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=4.91µs   min=1.07µs  med=2.9µs    max=2.64ms   p(90)=4.18µs   p(95)=4.71µs   p(99.9)=821.13µs
     http_req_connecting............: avg=1.81µs   min=0s      med=0s       max=2.61ms   p(90)=0s       p(95)=0s       p(99.9)=714.43µs
     http_req_duration..............: avg=182.41ms min=5.85ms  med=168.55ms max=760.57ms p(90)=219.84ms p(95)=270.71ms p(99.9)=620.5ms 
       { expected_response:true }...: avg=182.41ms min=5.85ms  med=168.55ms max=760.57ms p(90)=219.84ms p(95)=270.71ms p(99.9)=620.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32866
     http_req_receiving.............: avg=87.97µs  min=33.09µs med=83.25µs  max=14.07ms  p(90)=112.98µs p(95)=124.85µs p(99.9)=832.07µs
     http_req_sending...............: avg=26.16µs  min=5.56µs  med=15.77µs  max=82.72ms  p(90)=20.3µs   p(95)=21.91µs  p(99.9)=763.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.3ms  min=5.69ms  med=168.44ms max=760.47ms p(90)=219.73ms p(95)=270.64ms p(99.9)=620.41ms
     http_reqs......................: 32866   272.026069/s
     iteration_duration.............: avg=183.22ms min=41.39ms med=168.91ms max=760.82ms p(90)=220.22ms p(95)=271.58ms p(99.9)=620.8ms 
     iterations.....................: 32766   271.198386/s
     success_rate...................: 100.00% ✓ 32766      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 904740      ✗ 0     
     data_received..................: 26 GB   220 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=4.76µs  min=842ns   med=2.03µs   max=70.7ms   p(90)=3.75µs  p(95)=4.59µs  p(99.9)=28.35µs
     http_req_connecting............: avg=2.1µs   min=0s      med=0s       max=70.67ms  p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.66ms min=1.51ms  med=18.58ms  max=256.09ms p(90)=28.55ms p(95)=32.35ms p(99.9)=54.57ms
       { expected_response:true }...: avg=19.66ms min=1.51ms  med=18.58ms  max=256.09ms p(90)=28.55ms p(95)=32.35ms p(99.9)=54.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301680
     http_req_receiving.............: avg=1.2ms   min=51.18µs med=162.65µs max=118.3ms  p(90)=3.11ms  p(95)=4.27ms  p(99.9)=24.29ms
     http_req_sending...............: avg=44.67µs min=4.56µs  med=8.58µs   max=136.13ms p(90)=19.9µs  p(95)=92.66µs p(99.9)=4.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.41ms min=1.39ms  med=17.28ms  max=241.11ms p(90)=27.05ms p(95)=30.76ms p(99.9)=52.79ms
     http_reqs......................: 301680  2509.991785/s
     iteration_duration.............: avg=19.88ms min=2.63ms  med=18.79ms  max=297.11ms p(90)=28.77ms p(95)=32.58ms p(99.9)=55.13ms
     iterations.....................: 301580  2509.15978/s
     success_rate...................: 100.00% ✓ 301580      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 866469      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=3.39µs   min=932ns   med=2.6µs   max=12.07ms  p(90)=4.07µs  p(95)=4.74µs  p(99.9)=34.3µs  
     http_req_connecting............: avg=293ns    min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.54ms  min=1.55ms  med=17.18ms max=370.14ms p(90)=33.71ms p(95)=41.46ms p(99.9)=146.03ms
       { expected_response:true }...: avg=20.54ms  min=1.55ms  med=17.18ms max=370.14ms p(90)=33.71ms p(95)=41.46ms p(99.9)=146.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288923
     http_req_receiving.............: avg=604.73µs min=51.98µs med=99.19µs max=183.73ms p(90)=1.13ms  p(95)=1.98ms  p(99.9)=27.49ms 
     http_req_sending...............: avg=44.84µs  min=4.86µs  med=9.75µs  max=214.04ms p(90)=17.1µs  p(95)=90.32µs p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.89ms  min=1.43ms  med=16.63ms max=369.73ms p(90)=32.66ms p(95)=40.24ms p(99.9)=144.59ms
     http_reqs......................: 288923  2403.633174/s
     iteration_duration.............: avg=20.76ms  min=2.74ms  med=17.39ms max=370.35ms p(90)=33.95ms p(95)=41.72ms p(99.9)=146.92ms
     iterations.....................: 288823  2402.801245/s
     success_rate...................: 100.00% ✓ 288823      ✗ 0     
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

     checks.........................: 100.00% ✓ 864915      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=2.92µs  min=851ns   med=1.98µs  max=18.05ms  p(90)=3.51µs  p(95)=4.21µs  p(99.9)=30.27µs 
     http_req_connecting............: avg=308ns   min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.58ms min=1.61ms  med=17.11ms max=285.66ms p(90)=33.95ms p(95)=41.88ms p(99.9)=146.26ms
       { expected_response:true }...: avg=20.58ms min=1.61ms  med=17.11ms max=285.66ms p(90)=33.95ms p(95)=41.88ms p(99.9)=146.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288405
     http_req_receiving.............: avg=596.3µs min=50.96µs med=95.98µs max=167.06ms p(90)=1.12ms  p(95)=1.93ms  p(99.9)=27.51ms 
     http_req_sending...............: avg=39.45µs min=4.55µs  med=8.53µs  max=119.57ms p(90)=17.26µs p(95)=69.73µs p(99.9)=2.62ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.95ms min=1.45ms  med=16.56ms max=285.57ms p(90)=32.92ms p(95)=40.72ms p(99.9)=144.87ms
     http_reqs......................: 288405  2399.165999/s
     iteration_duration.............: avg=20.8ms  min=2.63ms  med=17.32ms max=300.71ms p(90)=34.16ms p(95)=42.11ms p(99.9)=148.92ms
     iterations.....................: 288305  2398.334125/s
     success_rate...................: 100.00% ✓ 288305      ✗ 0     
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

     checks.........................: 100.00% ✓ 846609      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 339 MB  2.8 MB/s
     http_req_blocked...............: avg=3.64µs  min=1.07µs  med=2.78µs  max=13.71ms  p(90)=4.43µs  p(95)=5.23µs   p(99.9)=41.62µs
     http_req_connecting............: avg=353ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.02ms min=1.69ms  med=20.75ms max=292.59ms p(90)=29.41ms p(95)=31.91ms  p(99.9)=51.2ms 
       { expected_response:true }...: avg=21.02ms min=1.69ms  med=20.75ms max=292.59ms p(90)=29.41ms p(95)=31.91ms  p(99.9)=51.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 282303
     http_req_receiving.............: avg=96.1µs  min=28.25µs med=55.85µs max=133.22ms p(90)=97.07µs p(95)=134.22µs p(99.9)=7.21ms 
     http_req_sending...............: avg=43.53µs min=4.92µs  med=11.17µs max=125.23ms p(90)=18.98µs p(95)=67.76µs  p(99.9)=3.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.88ms min=1.6ms   med=20.63ms max=284.69ms p(90)=29.25ms p(95)=31.73ms  p(99.9)=50.38ms
     http_reqs......................: 282303  2348.322482/s
     iteration_duration.............: avg=21.25ms min=3.61ms  med=20.96ms max=314.53ms p(90)=29.62ms p(95)=32.14ms  p(99.9)=51.64ms
     iterations.....................: 282203  2347.490638/s
     success_rate...................: 100.00% ✓ 282203      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 830196      ✗ 0     
     data_received..................: 24 GB   202 MB/s
     data_sent......................: 333 MB  2.8 MB/s
     http_req_blocked...............: avg=2.76µs  min=872ns   med=2.15µs  max=3.91ms   p(90)=3.89µs  p(95)=4.66µs  p(99.9)=28.78µs 
     http_req_connecting............: avg=157ns   min=0s      med=0s      max=1.85ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.45ms min=1.95ms  med=18.22ms max=297.64ms p(90)=34.59ms p(95)=42.52ms p(99.9)=147.01ms
       { expected_response:true }...: avg=21.45ms min=1.95ms  med=18.22ms max=297.64ms p(90)=34.59ms p(95)=42.52ms p(99.9)=147.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 276832
     http_req_receiving.............: avg=579.1µs min=51.35µs med=99.38µs max=166.64ms p(90)=1.13ms  p(95)=1.94ms  p(99.9)=26.93ms 
     http_req_sending...............: avg=42.74µs min=4.58µs  med=9.09µs  max=166.56ms p(90)=19.02µs p(95)=80.85µs p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.83ms min=1.81ms  med=17.67ms max=297.48ms p(90)=33.6ms  p(95)=41.39ms p(99.9)=145.98ms
     http_reqs......................: 276832  2302.288498/s
     iteration_duration.............: avg=21.67ms min=2.95ms  med=18.42ms max=305.37ms p(90)=34.82ms p(95)=42.77ms p(99.9)=148.24ms
     iterations.....................: 276732  2301.456843/s
     success_rate...................: 100.00% ✓ 276732      ✗ 0     
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

     checks.........................: 100.00% ✓ 593472      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=3.94µs  min=811ns   med=2.22µs  max=9.17ms   p(90)=4.43µs   p(95)=5.46µs   p(99.9)=44.08µs
     http_req_connecting............: avg=1.07µs  min=0s      med=0s      max=9.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.07ms min=2.23ms  med=29.71ms max=274.81ms p(90)=39.86ms  p(95)=43.23ms  p(99.9)=63.5ms 
       { expected_response:true }...: avg=30.07ms min=2.23ms  med=29.71ms max=274.81ms p(90)=39.86ms  p(95)=43.23ms  p(99.9)=63.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 197924
     http_req_receiving.............: avg=91.8µs  min=26.34µs med=53.63µs max=45.45ms  p(90)=126.07µs p(95)=211.57µs p(99.9)=3.48ms 
     http_req_sending...............: avg=38.9µs  min=4.58µs  med=9.06µs  max=96.67ms  p(90)=23.8µs   p(95)=110.57µs p(99.9)=2.75ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.94ms min=2.12ms  med=29.59ms max=274.66ms p(90)=39.72ms  p(95)=43.06ms  p(99.9)=62.75ms
     http_reqs......................: 197924  1645.425479/s
     iteration_duration.............: avg=30.32ms min=7.11ms  med=29.92ms max=312.65ms p(90)=40.07ms  p(95)=43.44ms  p(99.9)=64.22ms
     iterations.....................: 197824  1644.594137/s
     success_rate...................: 100.00% ✓ 197824      ✗ 0     
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

     checks.........................: 100.00% ✓ 442995      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=4.98µs  min=962ns   med=2.95µs  max=9.42ms   p(90)=4.5µs    p(95)=5.21µs   p(99.9)=38.67µs 
     http_req_connecting............: avg=1.57µs  min=0s      med=0s      max=8.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.37ms min=2.22ms  med=39.95ms max=308.52ms p(90)=56.05ms  p(95)=61.14ms  p(99.9)=84.62ms 
       { expected_response:true }...: avg=40.37ms min=2.22ms  med=39.95ms max=308.52ms p(90)=56.05ms  p(95)=61.14ms  p(99.9)=84.62ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147765
     http_req_receiving.............: avg=81.2µs  min=25.75µs med=67.27µs max=64.28ms  p(90)=107.75µs p(95)=124.82µs p(99.9)=993.91µs
     http_req_sending...............: avg=27.76µs min=5.15µs  med=12.24µs max=160.49ms p(90)=19.34µs  p(95)=23.44µs  p(99.9)=1.04ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.26ms min=2.1ms   med=39.84ms max=302.51ms p(90)=55.94ms  p(95)=61.02ms  p(99.9)=84.39ms 
     http_reqs......................: 147765  1228.435265/s
     iteration_duration.............: avg=40.62ms min=3.48ms  med=40.17ms max=322.12ms p(90)=56.27ms  p(95)=61.37ms  p(99.9)=85.01ms 
     iterations.....................: 147665  1227.603922/s
     success_rate...................: 100.00% ✓ 147665      ✗ 0     
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

     checks.........................: 100.00% ✓ 205434     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   683 kB/s
     http_req_blocked...............: avg=5.02µs  min=1.15µs  med=3.2µs   max=3.95ms   p(90)=4.73µs   p(95)=5.39µs   p(99.9)=44.9µs  
     http_req_connecting............: avg=1.55µs  min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.26ms min=3.78ms  med=83.97ms max=327.43ms p(90)=111.17ms p(95)=123.71ms p(99.9)=219.98ms
       { expected_response:true }...: avg=87.26ms min=3.78ms  med=83.97ms max=327.43ms p(90)=111.17ms p(95)=123.71ms p(99.9)=219.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68578
     http_req_receiving.............: avg=85.59µs min=29.73µs med=74.49µs max=132.45ms p(90)=109.51µs p(95)=122.36µs p(99.9)=697.2µs 
     http_req_sending...............: avg=23µs    min=5.64µs  med=14.48µs max=61.25ms  p(90)=20.92µs  p(95)=23.16µs  p(99.9)=627.48µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.15ms min=3.72ms  med=83.87ms max=326.91ms p(90)=111.06ms p(95)=123.61ms p(99.9)=219.17ms
     http_reqs......................: 68578   568.98786/s
     iteration_duration.............: avg=87.63ms min=27.74ms med=84.23ms max=338.45ms p(90)=111.44ms p(95)=123.97ms p(99.9)=221.75ms
     iterations.....................: 68478   568.158166/s
     success_rate...................: 100.00% ✓ 68478      ✗ 0    
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

     checks.........................: 100.00% ✓ 160257     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   533 kB/s
     http_req_blocked...............: avg=5.16µs   min=1.07µs  med=3.23µs   max=4ms      p(90)=4.71µs   p(95)=5.29µs   p(99.9)=104.51µs
     http_req_connecting............: avg=1.69µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.87ms min=5.38ms  med=109.53ms max=324.12ms p(90)=147.93ms p(95)=159.58ms p(99.9)=202.86ms
       { expected_response:true }...: avg=111.87ms min=5.38ms  med=109.53ms max=324.12ms p(90)=147.93ms p(95)=159.58ms p(99.9)=202.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53519
     http_req_receiving.............: avg=85.01µs  min=29.62µs med=81.77µs  max=47.96ms  p(90)=112.42µs p(95)=124.56µs p(99.9)=547.82µs
     http_req_sending...............: avg=29.77µs  min=5.33µs  med=16.94µs  max=157.82ms p(90)=22.15µs  p(95)=24.06µs  p(99.9)=537.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.75ms min=5.22ms  med=109.43ms max=316.15ms p(90)=147.83ms p(95)=159.46ms p(99.9)=202.47ms
     http_reqs......................: 53519   443.566616/s
     iteration_duration.............: avg=112.34ms min=15.34ms med=109.84ms max=331.94ms p(90)=148.23ms p(95)=159.87ms p(99.9)=204.04ms
     iterations.....................: 53419   442.737814/s
     success_rate...................: 100.00% ✓ 53419      ✗ 0    
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

     checks.........................: 100.00% ✓ 96777      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=10.31µs  min=1.11µs  med=3.1µs    max=8.75ms   p(90)=4.46µs   p(95)=4.97µs   p(99.9)=3.2ms   
     http_req_connecting............: avg=6.85µs   min=0s      med=0s       max=8.7ms    p(90)=0s       p(95)=0s       p(99.9)=2.99ms  
     http_req_duration..............: avg=185.24ms min=7.69ms  med=184.25ms max=399.55ms p(90)=199.46ms p(95)=204.5ms  p(99.9)=275.65ms
       { expected_response:true }...: avg=185.24ms min=7.69ms  med=184.25ms max=399.55ms p(90)=199.46ms p(95)=204.5ms  p(99.9)=275.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32359
     http_req_receiving.............: avg=89.35µs  min=30.98µs med=87.29µs  max=5.62ms   p(90)=117.21µs p(95)=128.52µs p(99.9)=465.14µs
     http_req_sending...............: avg=26.08µs  min=5.32µs  med=17.34µs  max=72.53ms  p(90)=21.77µs  p(95)=23.57µs  p(99.9)=954.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.12ms min=7.55ms  med=184.14ms max=398.44ms p(90)=199.35ms p(95)=204.4ms  p(99.9)=275.52ms
     http_reqs......................: 32359   267.432005/s
     iteration_duration.............: avg=186.1ms  min=43.41ms med=184.54ms max=413.12ms p(90)=199.74ms p(95)=204.82ms p(99.9)=279.38ms
     iterations.....................: 32259   266.605552/s
     success_rate...................: 100.00% ✓ 32259      ✗ 0    
     vus............................: 8       min=8        max=50 
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

     checks.........................: 100.00% ✓ 95184      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.06µs   min=1.4µs   med=3.68µs   max=2.86ms   p(90)=5.11µs   p(95)=5.71µs   p(99.9)=703.54µs
     http_req_connecting............: avg=2.11µs   min=0s      med=0s       max=2.83ms   p(90)=0s       p(95)=0s       p(99.9)=679.85µs
     http_req_duration..............: avg=188.38ms min=5.85ms  med=173.13ms max=706.92ms p(90)=221.33ms p(95)=268.22ms p(99.9)=571.03ms
       { expected_response:true }...: avg=188.38ms min=5.85ms  med=173.13ms max=706.92ms p(90)=221.33ms p(95)=268.22ms p(99.9)=571.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31828
     http_req_receiving.............: avg=97µs     min=33.86µs med=92.26µs  max=23.54ms  p(90)=122.92µs p(95)=135.53µs p(99.9)=555.67µs
     http_req_sending...............: avg=24.53µs  min=6.45µs  med=18.6µs   max=32.37ms  p(90)=23.09µs  p(95)=24.92µs  p(99.9)=553.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.26ms min=5.76ms  med=173ms    max=706.81ms p(90)=221.24ms p(95)=268.12ms p(99.9)=570.9ms 
     http_reqs......................: 31828   263.090796/s
     iteration_duration.............: avg=189.23ms min=43.9ms  med=173.49ms max=707.22ms p(90)=221.72ms p(95)=269.05ms p(99.9)=571.35ms
     iterations.....................: 31728   262.264195/s
     success_rate...................: 100.00% ✓ 31728      ✗ 0    
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

     checks.........................: 100.00% ✓ 7377      ✗ 0   
     data_received..................: 245 MB  1.9 MB/s
     data_sent......................: 3.1 MB  24 kB/s
     http_req_blocked...............: avg=19.66µs min=1.15µs   med=3.06µs  max=1.75ms   p(90)=4.5µs   p(95)=5.33µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=15.91µs min=0s       med=0s      max=1.71ms   p(90)=0s      p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=2.37s   min=27.54ms  med=2.38s   max=4.76s    p(90)=3.32s   p(95)=3.54s    p(99.9)=4.61s   
       { expected_response:true }...: avg=2.37s   min=27.54ms  med=2.38s   max=4.76s    p(90)=3.32s   p(95)=3.54s    p(99.9)=4.61s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2559
     http_req_receiving.............: avg=92.64µs min=34µs     med=89.66µs max=620.47µs p(90)=130.2µs p(95)=144.62µs p(99.9)=340.14µs
     http_req_sending...............: avg=69.24µs min=6.08µs   med=17.97µs max=57.77ms  p(90)=22.89µs p(95)=26.59µs  p(99.9)=9.21ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.37s   min=27.41ms  med=2.38s   max=4.76s    p(90)=3.32s   p(95)=3.54s    p(99.9)=4.61s   
     http_reqs......................: 2559    20.300957/s
     iteration_duration.............: avg=2.46s   min=396.76ms med=2.4s    max=4.76s    p(90)=3.33s   p(95)=3.55s    p(99.9)=4.62s   
     iterations.....................: 2459    19.507641/s
     success_rate...................: 100.00% ✓ 2459      ✗ 0   
     vus............................: 11      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

