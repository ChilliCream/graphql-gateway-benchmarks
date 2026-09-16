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
| hive-router | v0.0.84 | 3,146 | 3,366 | 3,098 | 2.8% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,687 | 2,822 | 2,668 | 2.0% |  |
| fusion-nightly | 16.7.0-p.7 | 2,622 | 2,764 | 2,612 | 2.0% |  |
| fusion | 16.6.6 | 2,540 | 2,694 | 2,529 | 2.4% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,468 | 2,573 | 2,459 | 1.6% |  |
| grafbase | 0.53.5 | 2,145 | 2,269 | 2,129 | 2.3% |  |
| cosmo | 0.334.0 | 1,311 | 1,350 | 1,304 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 610 | 630 | 608 | 1.1% |  |
| apollo-router | v2.16.1 | 443 | 463 | 438 | 1.9% |  |
| hive-gateway | 2.10.8 | 288 | 295 | 287 | 0.9% |  |
| apollo-gateway | 2.14.3 | 276 | 280 | 274 | 0.7% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1159 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,588 | 2,780 | 2,564 | 2.9% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,511 | 2,626 | 2,500 | 1.9% |  |
| fusion-nightly | 16.7.0-p.7 | 2,484 | 2,592 | 2,474 | 1.7% |  |
| fusion | 16.6.6 | 2,469 | 2,575 | 2,458 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,282 | 2,374 | 2,274 | 1.5% |  |
| grafbase | 0.53.5 | 1,617 | 1,669 | 1,610 | 1.3% |  |
| cosmo | 0.334.0 | 1,246 | 1,292 | 1,238 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 592 | 609 | 590 | 1.1% |  |
| apollo-router | v2.16.1 | 411 | 427 | 406 | 1.7% |  |
| apollo-gateway | 2.14.3 | 266 | 271 | 265 | 0.7% |  |
| hive-gateway | 2.10.8 | 263 | 271 | 261 | 1.2% |  |
| feddi | 5ff8b6165878 | 19 | 20 | 19 | 1.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1134141     ✗ 0     
     data_received..................: 33 GB   276 MB/s
     data_sent......................: 454 MB  3.8 MB/s
     http_req_blocked...............: avg=3.2µs   min=1.01µs  med=2.36µs  max=23.53ms  p(90)=3.72µs  p(95)=4.34µs   p(99.9)=36.86µs
     http_req_connecting............: avg=243ns   min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.65ms min=1.44ms  med=14.85ms max=278.43ms p(90)=23.04ms p(95)=26.44ms  p(99.9)=47.34ms
       { expected_response:true }...: avg=15.65ms min=1.44ms  med=14.85ms max=278.43ms p(90)=23.04ms p(95)=26.44ms  p(99.9)=47.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 378147
     http_req_receiving.............: avg=94.92µs min=25.21µs med=45.53µs max=149.51ms p(90)=87.17µs p(95)=178.56µs p(99.9)=7.99ms 
     http_req_sending...............: avg=53.11µs min=4.8µs   med=9.09µs  max=155.15ms p(90)=15.9µs  p(95)=103.2µs  p(99.9)=8.05ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.5ms  min=1.38ms  med=14.73ms max=278.31ms p(90)=22.85ms p(95)=26.13ms  p(99.9)=46.13ms
     http_reqs......................: 378147  3146.367033/s
     iteration_duration.............: avg=15.86ms min=2.07ms  med=15.04ms max=294.83ms p(90)=23.25ms p(95)=26.68ms  p(99.9)=48.29ms
     iterations.....................: 378047  3145.534984/s
     success_rate...................: 100.00% ✓ 378047      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 969327      ✗ 0     
     data_received..................: 28 GB   236 MB/s
     data_sent......................: 388 MB  3.2 MB/s
     http_req_blocked...............: avg=3.18µs  min=982ns   med=2.4µs    max=7.93ms   p(90)=3.8µs   p(95)=4.46µs  p(99.9)=33.39µs
     http_req_connecting............: avg=296ns   min=0s      med=0s       max=4.17ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.34ms min=1.94ms  med=17.24ms  max=280.51ms p(90)=26.28ms p(95)=30.03ms p(99.9)=52.15ms
       { expected_response:true }...: avg=18.34ms min=1.94ms  med=17.24ms  max=280.51ms p(90)=26.28ms p(95)=30.03ms p(99.9)=52.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 323209
     http_req_receiving.............: avg=1.05ms  min=52.77µs med=124.07µs max=68.74ms  p(90)=2.72ms  p(95)=3.75ms  p(99.9)=25ms   
     http_req_sending...............: avg=46.57µs min=4.78µs  med=8.88µs   max=179.99ms p(90)=16.44µs p(95)=94.17µs p(99.9)=5.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.23ms min=1.85ms  med=16.12ms  max=276.07ms p(90)=24.91ms p(95)=28.59ms p(99.9)=49.49ms
     http_reqs......................: 323209  2687.981888/s
     iteration_duration.............: avg=18.55ms min=3.18ms  med=17.44ms  max=298.95ms p(90)=26.5ms  p(95)=30.26ms p(99.9)=52.84ms
     iterations.....................: 323109  2687.150233/s
     success_rate...................: 100.00% ✓ 323109      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 945744      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 379 MB  3.2 MB/s
     http_req_blocked...............: avg=2.49µs   min=832ns  med=1.87µs  max=5.5ms    p(90)=3.05µs  p(95)=3.62µs  p(99.9)=27.62µs 
     http_req_connecting............: avg=271ns    min=0s     med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.81ms  min=1.98ms med=16.17ms max=296.33ms p(90)=30.58ms p(95)=37.03ms p(99.9)=122.35ms
       { expected_response:true }...: avg=18.81ms  min=1.98ms med=16.17ms max=296.33ms p(90)=30.58ms p(95)=37.03ms p(99.9)=122.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315348
     http_req_receiving.............: avg=557.49µs min=50.7µs med=90.81µs max=111.39ms p(90)=1.06ms  p(95)=1.9ms   p(99.9)=24.79ms 
     http_req_sending...............: avg=42.31µs  min=4.25µs med=8.05µs  max=133ms    p(90)=13.95µs p(95)=79.98µs p(99.9)=4.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.21ms  min=1.9ms  med=15.64ms max=295.79ms p(90)=29.66ms p(95)=35.97ms p(99.9)=121.83ms
     http_reqs......................: 315348  2622.099283/s
     iteration_duration.............: avg=19.02ms  min=3.01ms med=16.36ms max=307.28ms p(90)=30.8ms  p(95)=37.26ms p(99.9)=123.16ms
     iterations.....................: 315248  2621.267789/s
     success_rate...................: 100.00% ✓ 315248      ✗ 0     
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

     checks.........................: 100.00% ✓ 916305     ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 367 MB  3.1 MB/s
     http_req_blocked...............: avg=3.07µs   min=1.05µs  med=2.35µs  max=17.62ms  p(90)=3.6µs   p(95)=4.16µs  p(99.9)=32.84µs 
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.42ms  min=2.02ms  med=16.72ms max=307.61ms p(90)=31.49ms p(95)=38.17ms p(99.9)=125.38ms
       { expected_response:true }...: avg=19.42ms  min=2.02ms  med=16.72ms max=307.61ms p(90)=31.49ms p(95)=38.17ms p(99.9)=125.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 305535
     http_req_receiving.............: avg=587.26µs min=51.99µs med=93.81µs max=270.61ms p(90)=1.1ms   p(95)=1.98ms  p(99.9)=27.4ms  
     http_req_sending...............: avg=43.44µs  min=4.8µs   med=8.82µs  max=130.52ms p(90)=14.72µs p(95)=85.97µs p(99.9)=4.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.79ms  min=1.94ms  med=16.17ms max=305.04ms p(90)=30.52ms p(95)=37.01ms p(99.9)=123.67ms
     http_reqs......................: 305535  2540.46404/s
     iteration_duration.............: avg=19.63ms  min=3.02ms  med=16.92ms max=321.02ms p(90)=31.72ms p(95)=38.43ms p(99.9)=126.16ms
     iterations.....................: 305435  2539.63256/s
     success_rate...................: 100.00% ✓ 305435     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 889923      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.69µs   min=882ns   med=1.94µs  max=14.83ms  p(90)=3.2µs   p(95)=3.79µs  p(99.9)=31.28µs 
     http_req_connecting............: avg=280ns    min=0s      med=0s      max=3.2ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.01ms  min=1.73ms  med=16.07ms max=521.17ms p(90)=33.56ms p(95)=42.63ms p(99.9)=182.28ms
       { expected_response:true }...: avg=20.01ms  min=1.73ms  med=16.07ms max=521.17ms p(90)=33.56ms p(95)=42.63ms p(99.9)=182.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296741
     http_req_receiving.............: avg=564.98µs min=50.62µs med=91.41µs max=229.33ms p(90)=1.03ms  p(95)=1.78ms  p(99.9)=28.24ms 
     http_req_sending...............: avg=39.38µs  min=4.48µs  med=8.42µs  max=173.64ms p(90)=15.6µs  p(95)=66.41µs p(99.9)=2.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.4ms   min=1.63ms  med=15.58ms max=519.84ms p(90)=32.59ms p(95)=41.49ms p(99.9)=180.86ms
     http_reqs......................: 296741  2468.379305/s
     iteration_duration.............: avg=20.21ms  min=2.56ms  med=16.27ms max=521.38ms p(90)=33.78ms p(95)=42.85ms p(99.9)=184.03ms
     iterations.....................: 296641  2467.547476/s
     success_rate...................: 100.00% ✓ 296641      ✗ 0     
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

     checks.........................: 100.00% ✓ 773400      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.37µs  min=992ns   med=2.55µs  max=8.63ms   p(90)=4.03µs  p(95)=4.74µs   p(99.9)=38.23µs
     http_req_connecting............: avg=383ns   min=0s      med=0s      max=3.85ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.04ms min=1.73ms  med=22.79ms max=289.44ms p(90)=27.44ms p(95)=29.3ms   p(99.9)=49.6ms 
       { expected_response:true }...: avg=23.04ms min=1.73ms  med=22.79ms max=289.44ms p(90)=27.44ms p(95)=29.3ms   p(99.9)=49.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 257900
     http_req_receiving.............: avg=90.95µs min=28.08µs med=57.31µs max=171.9ms  p(90)=95.72µs p(95)=126.12µs p(99.9)=5.74ms 
     http_req_sending...............: avg=40.41µs min=4.64µs  med=10.11µs max=175.76ms p(90)=16.67µs p(95)=34.28µs  p(99.9)=2.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.91ms min=1.68ms  med=22.69ms max=288.94ms p(90)=27.3ms  p(95)=29.12ms  p(99.9)=48.23ms
     http_reqs......................: 257900  2145.186421/s
     iteration_duration.............: avg=23.26ms min=3.39ms  med=22.99ms max=299.67ms p(90)=27.64ms p(95)=29.51ms  p(99.9)=49.95ms
     iterations.....................: 257800  2144.354631/s
     success_rate...................: 100.00% ✓ 257800      ✗ 0     
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

     checks.........................: 100.00% ✓ 473052      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=3.02µs  min=872ns   med=2.12µs  max=3.71ms   p(90)=3.58µs  p(95)=4.22µs   p(99.9)=30.57µs 
     http_req_connecting............: avg=566ns   min=0s      med=0s      max=3.66ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.82ms min=1.99ms  med=37.5ms  max=304.4ms  p(90)=52.73ms p(95)=57.28ms  p(99.9)=79.03ms 
       { expected_response:true }...: avg=37.82ms min=1.99ms  med=37.5ms  max=304.4ms  p(90)=52.73ms p(95)=57.28ms  p(99.9)=79.03ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 157784
     http_req_receiving.............: avg=76.34µs min=25.42µs med=56.23µs max=234.43ms p(90)=91.42µs p(95)=106.79µs p(99.9)=879.91µs
     http_req_sending...............: avg=25.01µs min=4.55µs  med=9.78µs  max=145.56ms p(90)=16.36µs p(95)=20.27µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.72ms min=1.92ms  med=37.41ms max=294.47ms p(90)=52.63ms p(95)=57.18ms  p(99.9)=78.56ms 
     http_reqs......................: 157784  1311.925372/s
     iteration_duration.............: avg=38.04ms min=3.53ms  med=37.7ms  max=314.32ms p(90)=52.92ms p(95)=57.49ms  p(99.9)=79.37ms 
     iterations.....................: 157684  1311.093903/s
     success_rate...................: 100.00% ✓ 157684      ✗ 0     
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

     checks.........................: 100.00% ✓ 220194     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 88 MB   733 kB/s
     http_req_blocked...............: avg=4.53µs  min=1.19µs  med=2.99µs  max=4.11ms   p(90)=4.47µs   p(95)=5.12µs   p(99.9)=48.23µs 
     http_req_connecting............: avg=1.27µs  min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.41ms min=3.61ms  med=79.68ms max=338.28ms p(90)=101.39ms p(95)=111.99ms p(99.9)=195.19ms
       { expected_response:true }...: avg=81.41ms min=3.61ms  med=79.68ms max=338.28ms p(90)=101.39ms p(95)=111.99ms p(99.9)=195.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73498
     http_req_receiving.............: avg=76.2µs  min=29.31µs med=66.35µs max=43.29ms  p(90)=101.13µs p(95)=114.43µs p(99.9)=640.93µs
     http_req_sending...............: avg=28.6µs  min=5.2µs   med=12.7µs  max=229.98ms p(90)=18.94µs  p(95)=21.16µs  p(99.9)=619.73µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.3ms  min=3.54ms  med=79.58ms max=337.89ms p(90)=101.28ms p(95)=111.87ms p(99.9)=194.43ms
     http_reqs......................: 73498   610.061345/s
     iteration_duration.............: avg=81.75ms min=22.77ms med=79.92ms max=347.04ms p(90)=101.64ms p(95)=112.25ms p(99.9)=198ms   
     iterations.....................: 73398   609.231307/s
     success_rate...................: 100.00% ✓ 73398      ✗ 0    
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

     checks.........................: 100.00% ✓ 160026     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   532 kB/s
     http_req_blocked...............: avg=3.73µs   min=1.06µs  med=2.69µs   max=2.03ms   p(90)=4.09µs   p(95)=4.63µs   p(99.9)=91.23µs 
     http_req_connecting............: avg=829ns    min=0s      med=0s       max=1.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.05ms min=4.62ms  med=111.86ms max=325.2ms  p(90)=135.25ms p(95)=142.25ms p(99.9)=175.72ms
       { expected_response:true }...: avg=112.05ms min=4.62ms  med=111.86ms max=325.2ms  p(90)=135.25ms p(95)=142.25ms p(99.9)=175.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53442
     http_req_receiving.............: avg=83.66µs  min=28.64µs med=74.59µs  max=170.98ms p(90)=104.94µs p(95)=117.31µs p(99.9)=484.5µs 
     http_req_sending...............: avg=18.7µs   min=5.26µs  med=14.34µs  max=45.18ms  p(90)=20.14µs  p(95)=21.88µs  p(99.9)=460.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.95ms min=4.52ms  med=111.76ms max=324.92ms p(90)=135.15ms p(95)=142.13ms p(99.9)=175.53ms
     http_reqs......................: 53442   443.119346/s
     iteration_duration.............: avg=112.5ms  min=36.22ms med=112.13ms max=332.77ms p(90)=135.51ms p(95)=142.52ms p(99.9)=178.39ms
     iterations.....................: 53342   442.290187/s
     success_rate...................: 100.00% ✓ 53342      ✗ 0    
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

     checks.........................: 100.00% ✓ 104118     ✗ 0    
     data_received..................: 3.1 GB  25 MB/s
     data_sent......................: 42 MB   346 kB/s
     http_req_blocked...............: avg=7.06µs   min=1.42µs  med=3.78µs   max=3.76ms   p(90)=5.32µs   p(95)=5.94µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=2.97µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=172.22ms min=5.51ms  med=158.14ms max=644.33ms p(90)=202.76ms p(95)=239.59ms p(99.9)=586.27ms
       { expected_response:true }...: avg=172.22ms min=5.51ms  med=158.14ms max=644.33ms p(90)=202.76ms p(95)=239.59ms p(99.9)=586.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34806
     http_req_receiving.............: avg=100.35µs min=35.39µs med=93.08µs  max=56.93ms  p(90)=125.03µs p(95)=138.35µs p(99.9)=942.53µs
     http_req_sending...............: avg=28.32µs  min=6.25µs  med=18.49µs  max=59.19ms  p(90)=23.18µs  p(95)=25.07µs  p(99.9)=551.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=172.09ms min=5.37ms  med=158.03ms max=644.2ms  p(90)=202.64ms p(95)=239.39ms p(99.9)=586.17ms
     http_reqs......................: 34806   288.032867/s
     iteration_duration.............: avg=172.99ms min=37.5ms  med=158.52ms max=644.62ms p(90)=203.19ms p(95)=240.43ms p(99.9)=586.58ms
     iterations.....................: 34706   287.205329/s
     success_rate...................: 100.00% ✓ 34706      ✗ 0    
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

     checks.........................: 100.00% ✓ 100110     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   332 kB/s
     http_req_blocked...............: avg=5.79µs   min=1.12µs  med=3.09µs   max=3.47ms   p(90)=4.34µs   p(95)=4.85µs   p(99.9)=1.18ms  
     http_req_connecting............: avg=2.54µs   min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=179.1ms  min=7.51ms  med=177.75ms max=384.14ms p(90)=207.98ms p(95)=212.05ms p(99.9)=279.06ms
       { expected_response:true }...: avg=179.1ms  min=7.51ms  med=177.75ms max=384.14ms p(90)=207.98ms p(95)=212.05ms p(99.9)=279.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33470
     http_req_receiving.............: avg=86.55µs  min=31.68µs med=80.93µs  max=83.04ms  p(90)=111.23µs p(95)=121.73µs p(99.9)=458.33µs
     http_req_sending...............: avg=29.26µs  min=5.38µs  med=15.72µs  max=139.4ms  p(90)=19.88µs  p(95)=21.5µs   p(99.9)=496.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.98ms min=7.41ms  med=177.63ms max=383.63ms p(90)=207.88ms p(95)=211.93ms p(99.9)=278.6ms 
     http_reqs......................: 33470   276.696717/s
     iteration_duration.............: avg=179.9ms  min=35.95ms med=179.08ms max=392.88ms p(90)=208.25ms p(95)=212.35ms p(99.9)=280.06ms
     iterations.....................: 33370   275.870017/s
     success_rate...................: 100.00% ✓ 33370      ✗ 0    
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

     checks.........................: 100.00% ✓ 933192      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=2.88µs  min=882ns   med=2.07µs  max=16.1ms   p(90)=3.58µs  p(95)=4.33µs  p(99.9)=30.69µs
     http_req_connecting............: avg=292ns   min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.07ms min=1.69ms  med=18.79ms max=291.69ms p(90)=26.28ms p(95)=28.64ms p(99.9)=47.77ms
       { expected_response:true }...: avg=19.07ms min=1.69ms  med=18.79ms max=291.69ms p(90)=26.28ms p(95)=28.64ms p(99.9)=47.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311164
     http_req_receiving.............: avg=88µs    min=25.79µs med=49.29µs max=123.61ms p(90)=89.38µs p(95)=126.9µs p(99.9)=6.92ms 
     http_req_sending...............: avg=41.75µs min=4.6µs   med=8.89µs  max=86.41ms  p(90)=15.98µs p(95)=70µs    p(99.9)=3.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.94ms min=1.61ms  med=18.67ms max=290.96ms p(90)=26.13ms p(95)=28.43ms p(99.9)=46.84ms
     http_reqs......................: 311164  2588.45336/s
     iteration_duration.............: avg=19.27ms min=3.43ms  med=18.98ms max=302.02ms p(90)=26.48ms p(95)=28.85ms p(99.9)=48.27ms
     iterations.....................: 311064  2587.621498/s
     success_rate...................: 100.00% ✓ 311064      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 905130      ✗ 0     
     data_received..................: 27 GB   220 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=3.01µs  min=922ns   med=2.12µs   max=17.55ms  p(90)=3.87µs  p(95)=4.7µs   p(99.9)=29.94µs
     http_req_connecting............: avg=301ns   min=0s      med=0s       max=4.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.65ms min=1.51ms  med=18.57ms  max=269.18ms p(90)=28.59ms p(95)=32.39ms p(99.9)=53.91ms
       { expected_response:true }...: avg=19.65ms min=1.51ms  med=18.57ms  max=269.18ms p(90)=28.59ms p(95)=32.39ms p(99.9)=53.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301810
     http_req_receiving.............: avg=1.22ms  min=52.03µs med=182.94µs max=219.52ms p(90)=3.13ms  p(95)=4.28ms  p(99.9)=25.65ms
     http_req_sending...............: avg=45.5µs  min=4.81µs  med=8.77µs   max=238.77ms p(90)=19.34µs p(95)=86.92µs p(99.9)=4.44ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.38ms min=1.39ms  med=17.27ms  max=269.05ms p(90)=27.05ms p(95)=30.8ms  p(99.9)=51.41ms
     http_reqs......................: 301810  2511.141511/s
     iteration_duration.............: avg=19.87ms min=2.6ms   med=18.78ms  max=306ms    p(90)=28.81ms p(95)=32.62ms p(99.9)=54.65ms
     iterations.....................: 301710  2510.309484/s
     success_rate...................: 100.00% ✓ 301710      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 895698      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=2.83µs   min=771ns   med=2.04µs  max=14.12ms  p(90)=3.64µs  p(95)=4.36µs  p(99.9)=32.96µs 
     http_req_connecting............: avg=280ns    min=0s      med=0s      max=3.23ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.87ms  min=1.59ms  med=16.56ms max=381.01ms p(90)=32.75ms p(95)=40.36ms p(99.9)=150.28ms
       { expected_response:true }...: avg=19.87ms  min=1.59ms  med=16.56ms max=381.01ms p(90)=32.75ms p(95)=40.36ms p(99.9)=150.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298666
     http_req_receiving.............: avg=567.48µs min=49.51µs med=91.79µs max=209.03ms p(90)=1.08ms  p(95)=1.89ms  p(99.9)=27.09ms 
     http_req_sending...............: avg=41.95µs  min=4.53µs  med=8.5µs   max=120.83ms p(90)=17.21µs p(95)=77.93µs p(99.9)=3.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.26ms  min=1.44ms  med=16.03ms max=380.67ms p(90)=31.75ms p(95)=39.25ms p(99.9)=149.14ms
     http_reqs......................: 298666  2484.685528/s
     iteration_duration.............: avg=20.08ms  min=2.55ms  med=16.76ms max=381.15ms p(90)=32.97ms p(95)=40.6ms  p(99.9)=151.77ms
     iterations.....................: 298566  2483.8536/s
     success_rate...................: 100.00% ✓ 298566      ✗ 0     
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

     checks.........................: 100.00% ✓ 890373      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.89µs   min=882ns   med=2.09µs  max=13.22ms  p(90)=3.73µs  p(95)=4.48µs  p(99.9)=33.57µs 
     http_req_connecting............: avg=307ns    min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.98ms  min=1.6ms   med=16.74ms max=358.02ms p(90)=32.82ms p(95)=40.11ms p(99.9)=146.07ms
       { expected_response:true }...: avg=19.98ms  min=1.6ms   med=16.74ms max=358.02ms p(90)=32.82ms p(95)=40.11ms p(99.9)=146.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296891
     http_req_receiving.............: avg=577.43µs min=52.85µs med=95.63µs max=190.63ms p(90)=1.09ms  p(95)=1.87ms  p(99.9)=28.12ms 
     http_req_sending...............: avg=41.29µs  min=4.78µs  med=8.85µs  max=111.04ms p(90)=17.48µs p(95)=83.84µs p(99.9)=2.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.36ms  min=1.46ms  med=16.21ms max=356.21ms p(90)=31.8ms  p(95)=39ms    p(99.9)=144.49ms
     http_reqs......................: 296891  2469.701391/s
     iteration_duration.............: avg=20.2ms   min=2.71ms  med=16.94ms max=358.22ms p(90)=33.04ms p(95)=40.34ms p(99.9)=147.51ms
     iterations.....................: 296791  2468.869537/s
     success_rate...................: 100.00% ✓ 296791      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 823101      ✗ 0     
     data_received..................: 24 GB   200 MB/s
     data_sent......................: 330 MB  2.7 MB/s
     http_req_blocked...............: avg=3.2µs    min=921ns   med=2.3µs   max=16.35ms  p(90)=4.15µs  p(95)=4.88µs  p(99.9)=35µs    
     http_req_connecting............: avg=339ns    min=0s      med=0s      max=3.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.63ms  min=1.88ms  med=18.3ms  max=393.4ms  p(90)=35.31ms p(95)=43.18ms p(99.9)=149.7ms 
       { expected_response:true }...: avg=21.63ms  min=1.88ms  med=18.3ms  max=393.4ms  p(90)=35.31ms p(95)=43.18ms p(99.9)=149.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 274467
     http_req_receiving.............: avg=579.07µs min=50.32µs med=97.16µs max=155.63ms p(90)=1.13ms  p(95)=1.95ms  p(99.9)=26.67ms 
     http_req_sending...............: avg=41.77µs  min=4.18µs  med=9.17µs  max=100.82ms p(90)=19.5µs  p(95)=76.68µs p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.01ms  min=1.74ms  med=17.74ms max=393.32ms p(90)=34.35ms p(95)=42.06ms p(99.9)=148.27ms
     http_reqs......................: 274467  2282.519144/s
     iteration_duration.............: avg=21.85ms  min=2.87ms  med=18.5ms  max=393.57ms p(90)=35.54ms p(95)=43.43ms p(99.9)=150.9ms 
     iterations.....................: 274367  2281.687526/s
     success_rate...................: 100.00% ✓ 274367      ✗ 0     
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

     checks.........................: 100.00% ✓ 583521      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.37µs  min=872ns   med=2.31µs  max=3.73ms   p(90)=4.44µs   p(95)=5.45µs   p(99.9)=47.51µs
     http_req_connecting............: avg=468ns   min=0s      med=0s      max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.6ms  min=2.25ms  med=29.96ms max=323.77ms p(90)=40.07ms  p(95)=43.45ms  p(99.9)=64.12ms
       { expected_response:true }...: avg=30.6ms  min=2.25ms  med=29.96ms max=323.77ms p(90)=40.07ms  p(95)=43.45ms  p(99.9)=64.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194607
     http_req_receiving.............: avg=92.36µs min=26.86µs med=57.72µs max=45.89ms  p(90)=124.65µs p(95)=191.03µs p(99.9)=3.09ms 
     http_req_sending...............: avg=39.83µs min=4.71µs  med=9.75µs  max=170.35ms p(90)=24.44µs  p(95)=99.92µs  p(99.9)=2.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.47ms min=2.13ms  med=29.84ms max=310.05ms p(90)=39.93ms  p(95)=43.29ms  p(99.9)=63.07ms
     http_reqs......................: 194607  1617.777251/s
     iteration_duration.............: avg=30.84ms min=6.92ms  med=30.18ms max=332.93ms p(90)=40.3ms   p(95)=43.67ms  p(99.9)=64.58ms
     iterations.....................: 194507  1616.945947/s
     success_rate...................: 100.00% ✓ 194507      ✗ 0     
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

     checks.........................: 100.00% ✓ 449586      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.9µs   min=1.21µs  med=2.97µs  max=4.14ms   p(90)=4.62µs  p(95)=5.37µs   p(99.9)=36.64µs
     http_req_connecting............: avg=607ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.77ms min=2.05ms  med=39.34ms max=315.78ms p(90)=55.25ms p(95)=60.15ms  p(99.9)=83.48ms
       { expected_response:true }...: avg=39.77ms min=2.05ms  med=39.34ms max=315.78ms p(90)=55.25ms p(95)=60.15ms  p(99.9)=83.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149962
     http_req_receiving.............: avg=84.33µs min=28.05µs med=69.31µs max=120.01ms p(90)=108.6µs p(95)=126.18µs p(99.9)=1.05ms 
     http_req_sending...............: avg=28.33µs min=5.38µs  med=12.9µs  max=141.17ms p(90)=20.01µs p(95)=24.11µs  p(99.9)=1.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.66ms min=1.95ms  med=39.23ms max=315.16ms p(90)=55.14ms p(95)=60.02ms  p(99.9)=83.27ms
     http_reqs......................: 149962  1246.782336/s
     iteration_duration.............: avg=40.02ms min=4.16ms  med=39.57ms max=324.02ms p(90)=55.48ms p(95)=60.37ms  p(99.9)=83.85ms
     iterations.....................: 149862  1245.950937/s
     success_rate...................: 100.00% ✓ 149862      ✗ 0     
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

     checks.........................: 100.00% ✓ 213861     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   712 kB/s
     http_req_blocked...............: avg=4.12µs  min=1.05µs  med=2.68µs  max=3.48ms   p(90)=4.18µs   p(95)=4.8µs    p(99.9)=41.45µs 
     http_req_connecting............: avg=1.21µs  min=0s      med=0s      max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.82ms min=3.72ms  med=81.84ms max=327.1ms  p(90)=102.45ms p(95)=112.45ms p(99.9)=198.66ms
       { expected_response:true }...: avg=83.82ms min=3.72ms  med=81.84ms max=327.1ms  p(90)=102.45ms p(95)=112.45ms p(99.9)=198.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71387
     http_req_receiving.............: avg=84.09µs min=28.04µs med=71.2µs  max=112.89ms p(90)=108.49µs p(95)=122.57µs p(99.9)=667.3µs 
     http_req_sending...............: avg=21.8µs  min=4.85µs  med=13.03µs max=79.91ms  p(90)=20.25µs  p(95)=22.43µs  p(99.9)=600.1µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.71ms min=3.61ms  med=81.75ms max=325.58ms p(90)=102.33ms p(95)=112.33ms p(99.9)=198.09ms
     http_reqs......................: 71387   592.44323/s
     iteration_duration.............: avg=84.17ms min=19.55ms med=82.08ms max=345.14ms p(90)=102.7ms  p(95)=112.71ms p(99.9)=199.93ms
     iterations.....................: 71287   591.613327/s
     success_rate...................: 100.00% ✓ 71287      ✗ 0    
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

     checks.........................: 100.00% ✓ 148710     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   494 kB/s
     http_req_blocked...............: avg=5.72µs   min=1.46µs  med=3.54µs   max=4.21ms   p(90)=5µs      p(95)=5.57µs   p(99.9)=349.77µs
     http_req_connecting............: avg=1.9µs    min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=177.32µs
     http_req_duration..............: avg=120.56ms min=5.18ms  med=118.36ms max=327.45ms p(90)=159.23ms p(95)=171.34ms p(99.9)=223.85ms
       { expected_response:true }...: avg=120.56ms min=5.18ms  med=118.36ms max=327.45ms p(90)=159.23ms p(95)=171.34ms p(99.9)=223.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49670
     http_req_receiving.............: avg=88.95µs  min=32.15µs med=82.01µs  max=77.89ms  p(90)=113.66µs p(95)=125.78µs p(99.9)=584.24µs
     http_req_sending...............: avg=26.37µs  min=6.48µs  med=17.12µs  max=79.3ms   p(90)=22.35µs  p(95)=24.17µs  p(99.9)=553.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.44ms min=5.05ms  med=118.24ms max=317.41ms p(90)=159.12ms p(95)=171.23ms p(99.9)=223.27ms
     http_reqs......................: 49670   411.614119/s
     iteration_duration.............: avg=121.07ms min=23.86ms med=118.68ms max=332.47ms p(90)=159.55ms p(95)=171.66ms p(99.9)=226.81ms
     iterations.....................: 49570   410.785421/s
     success_rate...................: 100.00% ✓ 49570      ✗ 0    
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

     checks.........................: 100.00% ✓ 96390      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=5.18µs   min=1.08µs  med=3.04µs   max=2.73ms   p(90)=4.37µs   p(95)=4.88µs   p(99.9)=964.22µs
     http_req_connecting............: avg=1.9µs    min=0s      med=0s       max=2.68ms   p(90)=0s       p(95)=0s       p(99.9)=939.39µs
     http_req_duration..............: avg=185.99ms min=7.66ms  med=185.07ms max=378.12ms p(90)=199.63ms p(95)=205.38ms p(99.9)=271.49ms
       { expected_response:true }...: avg=185.99ms min=7.66ms  med=185.07ms max=378.12ms p(90)=199.63ms p(95)=205.38ms p(99.9)=271.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32230
     http_req_receiving.............: avg=94.07µs  min=30.86µs med=84.73µs  max=98.51ms  p(90)=115.31µs p(95)=126.14µs p(99.9)=476.12µs
     http_req_sending...............: avg=38.69µs  min=5.46µs  med=17.27µs  max=111.36ms p(90)=21.85µs  p(95)=23.66µs  p(99.9)=543.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.86ms min=7.56ms  med=184.97ms max=377.57ms p(90)=199.52ms p(95)=205.26ms p(99.9)=271.31ms
     http_reqs......................: 32230   266.464343/s
     iteration_duration.............: avg=186.84ms min=41.7ms  med=185.44ms max=385.43ms p(90)=199.91ms p(95)=205.68ms p(99.9)=272.56ms
     iterations.....................: 32130   265.637584/s
     success_rate...................: 100.00% ✓ 32130      ✗ 0    
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

     checks.........................: 100.00% ✓ 95271      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.23µs   min=1.09µs  med=3.21µs   max=3.88ms   p(90)=4.53µs   p(95)=5.08µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=2.79µs   min=0s      med=0s       max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=188.2ms  min=6.35ms  med=175.61ms max=712.61ms p(90)=221.46ms p(95)=269.06ms p(99.9)=607.99ms
       { expected_response:true }...: avg=188.2ms  min=6.35ms  med=175.61ms max=712.61ms p(90)=221.46ms p(95)=269.06ms p(99.9)=607.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31857
     http_req_receiving.............: avg=100.25µs min=31.97µs med=90.82µs  max=80.27ms  p(90)=120.26µs p(95)=131.98µs p(99.9)=888.06µs
     http_req_sending...............: avg=25.85µs  min=5.1µs   med=17.47µs  max=50.6ms   p(90)=21.83µs  p(95)=23.55µs  p(99.9)=502.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.07ms min=6.24ms  med=175.48ms max=712.48ms p(90)=221.35ms p(95)=268.95ms p(99.9)=607.86ms
     http_reqs......................: 31857   263.51564/s
     iteration_duration.............: avg=189.05ms min=44.61ms med=175.98ms max=712.85ms p(90)=221.84ms p(95)=271.77ms p(99.9)=608.26ms
     iterations.....................: 31757   262.688457/s
     success_rate...................: 100.00% ✓ 31757      ✗ 0    
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

     checks.........................: 100.00% ✓ 7056      ✗ 0   
     data_received..................: 235 MB  1.9 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=84.88µs  min=1.32µs   med=3.75µs  max=6.71ms p(90)=5.28µs   p(95)=6.03µs   p(99.9)=6.1ms  
     http_req_connecting............: avg=75.46µs  min=0s       med=0s      max=6.37ms p(90)=0s       p(95)=0s       p(99.9)=5.9ms  
     http_req_duration..............: avg=2.46s    min=25.91ms  med=2.52s   max=5.49s  p(90)=3.34s    p(95)=3.59s    p(99.9)=4.51s  
       { expected_response:true }...: avg=2.46s    min=25.91ms  med=2.52s   max=5.49s  p(90)=3.34s    p(95)=3.59s    p(99.9)=4.51s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2452
     http_req_receiving.............: avg=101.21µs min=36.12µs  med=93.12µs max=6.1ms  p(90)=137.78µs p(95)=154.07µs p(99.9)=393.5µs
     http_req_sending...............: avg=89.54µs  min=6.36µs   med=18.88µs max=15.3ms p(90)=24.21µs  p(95)=27.56µs  p(99.9)=8.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.46s    min=25.74ms  med=2.52s   max=5.49s  p(90)=3.34s    p(95)=3.59s    p(99.9)=4.51s  
     http_reqs......................: 2452    19.486941/s
     iteration_duration.............: avg=2.57s    min=567.08ms med=2.56s   max=5.49s  p(90)=3.35s    p(95)=3.6s     p(99.9)=4.54s  
     iterations.....................: 2352    18.692204/s
     success_rate...................: 100.00% ✓ 2352      ✗ 0   
     vus............................: 41      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

