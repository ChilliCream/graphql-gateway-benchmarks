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
| hive-router | v0.0.84 | 3,026 | 3,323 | 2,948 | 4.2% |  |
| fusion | 16.6.0 | 2,579 | 2,689 | 2,559 | 1.8% |  |
| grafbase | 0.53.5 | 2,222 | 2,319 | 2,203 | 1.8% |  |
| cosmo | 0.334.0 | 1,309 | 1,357 | 1,299 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 618 | 634 | 613 | 1.0% |  |
| apollo-router | v2.16.1 | 450 | 469 | 445 | 2.1% |  |
| apollo-gateway | 2.14.3 | 287 | 290 | 286 | 0.4% |  |
| hive-gateway | 2.10.8 | 277 | 286 | 275 | 1.6% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1092 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.0 | 2,350 | 2,482 | 2,339 | 2.1% |  |
| hive-router | v0.0.84 | 2,340 | 2,535 | 2,320 | 3.3% |  |
| grafbase | 0.53.5 | 1,587 | 1,662 | 1,581 | 1.9% |  |
| cosmo | 0.334.0 | 1,234 | 1,265 | 1,221 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 572 | 595 | 571 | 1.4% |  |
| hive-gateway | 2.10.8 | 271 | 279 | 271 | 1.0% |  |
| apollo-gateway | 2.14.3 | 270 | 276 | 269 | 0.9% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 2.3% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1090866     ✗ 0     
     data_received..................: 32 GB   265 MB/s
     data_sent......................: 437 MB  3.6 MB/s
     http_req_blocked...............: avg=2.63µs  min=872ns   med=1.97µs  max=16.75ms  p(90)=3.22µs  p(95)=3.83µs   p(99.9)=30.47µs
     http_req_connecting............: avg=239ns   min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.28ms min=1.47ms  med=15.82ms max=285.93ms p(90)=23.41ms p(95)=26.35ms  p(99.9)=45.8ms 
       { expected_response:true }...: avg=16.28ms min=1.47ms  med=15.82ms max=285.93ms p(90)=23.41ms p(95)=26.35ms  p(99.9)=45.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 363722
     http_req_receiving.............: avg=84.53µs min=24.58µs med=44.18µs max=157.78ms p(90)=82.41µs p(95)=142.17µs p(99.9)=7.1ms  
     http_req_sending...............: avg=47.04µs min=4.6µs   med=8.49µs  max=91.65ms  p(90)=14.88µs p(95)=89.77µs  p(99.9)=6.91ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.15ms min=1.39ms  med=15.71ms max=285.36ms p(90)=23.25ms p(95)=26.11ms  p(99.9)=44.91ms
     http_reqs......................: 363722  3026.289241/s
     iteration_duration.............: avg=16.49ms min=2.07ms  med=16.01ms max=301.83ms p(90)=23.61ms p(95)=26.58ms  p(99.9)=46.93ms
     iterations.....................: 363622  3025.457207/s
     success_rate...................: 100.00% ✓ 363622      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 930306      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=3.17µs   min=961ns   med=2.27µs  max=21.3ms   p(90)=3.44µs  p(95)=3.98µs  p(99.9)=33.68µs 
     http_req_connecting............: avg=277ns    min=0s      med=0s      max=3.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.13ms  min=1.93ms  med=16.45ms max=440.82ms p(90)=31.22ms p(95)=37.7ms  p(99.9)=119.03ms
       { expected_response:true }...: avg=19.13ms  min=1.93ms  med=16.45ms max=440.82ms p(90)=31.22ms p(95)=37.7ms  p(99.9)=119.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310202
     http_req_receiving.............: avg=596.07µs min=52.85µs med=92.04µs max=166.68ms p(90)=1.12ms  p(95)=2.07ms  p(99.9)=26.74ms 
     http_req_sending...............: avg=46.25µs  min=4.47µs  med=8.67µs  max=187.33ms p(90)=14.52µs p(95)=90.32µs p(99.9)=5.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.48ms  min=1.85ms  med=15.89ms max=440.7ms  p(90)=30.24ms p(95)=36.49ms p(99.9)=117.56ms
     http_reqs......................: 310202  2579.965234/s
     iteration_duration.............: avg=19.33ms  min=2.93ms  med=16.65ms max=440.99ms p(90)=31.44ms p(95)=37.94ms p(99.9)=119.64ms
     iterations.....................: 310102  2579.133529/s
     success_rate...................: 100.00% ✓ 310102      ✗ 0     
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

     checks.........................: 100.00% ✓ 801264      ✗ 0     
     data_received..................: 24 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=2.94µs  min=922ns   med=2.14µs  max=9.03ms   p(90)=3.74µs  p(95)=4.53µs   p(99.9)=35.26µs
     http_req_connecting............: avg=319ns   min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.24ms min=1.7ms   med=21.99ms max=303.58ms p(90)=26.54ms p(95)=28.43ms  p(99.9)=48.92ms
       { expected_response:true }...: avg=22.24ms min=1.7ms   med=21.99ms max=303.58ms p(90)=26.54ms p(95)=28.43ms  p(99.9)=48.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267188
     http_req_receiving.............: avg=90.11µs min=27.76µs med=53.8µs  max=256.44ms p(90)=94.04µs p(95)=123.03µs p(99.9)=6.34ms 
     http_req_sending...............: avg=38.7µs  min=4.77µs  med=9.79µs  max=230.02ms p(90)=18.2µs  p(95)=32.4µs   p(99.9)=2.03ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.11ms min=1.63ms  med=21.9ms  max=277.68ms p(90)=26.4ms  p(95)=28.23ms  p(99.9)=47.64ms
     http_reqs......................: 267188  2222.38443/s
     iteration_duration.............: avg=22.45ms min=3.22ms  med=22.19ms max=319.77ms p(90)=26.74ms p(95)=28.65ms  p(99.9)=49.29ms
     iterations.....................: 267088  2221.552662/s
     success_rate...................: 100.00% ✓ 267088      ✗ 0     
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

     checks.........................: 100.00% ✓ 472029      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 189 MB  1.6 MB/s
     http_req_blocked...............: avg=3.33µs  min=1.1µs   med=2.59µs  max=3.18ms   p(90)=4.07µs  p(95)=4.73µs   p(99.9)=35.51µs 
     http_req_connecting............: avg=419ns   min=0s      med=0s      max=3.14ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.89ms min=2.03ms  med=37.43ms max=299.1ms  p(90)=52.91ms p(95)=57.61ms  p(99.9)=79.24ms 
       { expected_response:true }...: avg=37.89ms min=2.03ms  med=37.43ms max=299.1ms  p(90)=52.91ms p(95)=57.61ms  p(99.9)=79.24ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 157443
     http_req_receiving.............: avg=76.12µs min=26.64µs med=60.39µs max=196.01ms p(90)=96.69µs p(95)=112.25µs p(99.9)=932.78µs
     http_req_sending...............: avg=23.79µs min=4.68µs  med=10.86µs max=87.37ms  p(90)=17.11µs p(95)=21.1µs   p(99.9)=973µs   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.79ms min=1.94ms  med=37.34ms max=269.05ms p(90)=52.81ms p(95)=57.51ms  p(99.9)=79.06ms 
     http_reqs......................: 157443  1309.068618/s
     iteration_duration.............: avg=38.12ms min=3.6ms   med=37.64ms max=309.98ms p(90)=53.12ms p(95)=57.82ms  p(99.9)=79.81ms 
     iterations.....................: 157343  1308.237163/s
     success_rate...................: 100.00% ✓ 157343      ✗ 0     
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

     checks.........................: 100.00% ✓ 223227     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 90 MB   743 kB/s
     http_req_blocked...............: avg=4.27µs  min=1.16µs  med=2.8µs   max=3.5ms    p(90)=4.25µs   p(95)=4.89µs   p(99.9)=44.58µs 
     http_req_connecting............: avg=1.15µs  min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.31ms min=3.62ms  med=85.06ms max=297.43ms p(90)=107.79ms p(95)=117.87ms p(99.9)=199.27ms
       { expected_response:true }...: avg=80.31ms min=3.62ms  med=85.06ms max=297.43ms p(90)=107.79ms p(95)=117.87ms p(99.9)=199.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74509
     http_req_receiving.............: avg=78.18µs min=29.23µs med=68.13µs max=119.37ms p(90)=103.99µs p(95)=117.32µs p(99.9)=632.32µs
     http_req_sending...............: avg=26.51µs min=4.92µs  med=13.27µs max=101.37ms p(90)=19.8µs   p(95)=22.07µs  p(99.9)=631.21µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.2ms  min=3.55ms  med=84.96ms max=296.7ms  p(90)=107.69ms p(95)=117.72ms p(99.9)=198.78ms
     http_reqs......................: 74509   618.396455/s
     iteration_duration.............: avg=80.65ms min=19.89ms med=85.29ms max=317.61ms p(90)=108.04ms p(95)=118.12ms p(99.9)=200.39ms
     iterations.....................: 74409   617.566493/s
     success_rate...................: 100.00% ✓ 74409      ✗ 0    
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

     checks.........................: 100.00% ✓ 162864     ✗ 0    
     data_received..................: 4.8 GB  40 MB/s
     data_sent......................: 65 MB   542 kB/s
     http_req_blocked...............: avg=5.18µs   min=1.17µs  med=3.23µs   max=4.21ms   p(90)=4.61µs   p(95)=5.18µs   p(99.9)=116.84µs
     http_req_connecting............: avg=1.71µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.09ms min=4.7ms   med=109.74ms max=321.97ms p(90)=133.08ms p(95)=139.88ms p(99.9)=171.86ms
       { expected_response:true }...: avg=110.09ms min=4.7ms   med=109.74ms max=321.97ms p(90)=133.08ms p(95)=139.88ms p(99.9)=171.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54388
     http_req_receiving.............: avg=81.38µs  min=29.77µs med=75.27µs  max=48.51ms  p(90)=107.22µs p(95)=119.79µs p(99.9)=555.67µs
     http_req_sending...............: avg=24.79µs  min=5.75µs  med=15.83µs  max=120.06ms p(90)=21.31µs  p(95)=23.24µs  p(99.9)=571.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.99ms min=4.58ms  med=109.65ms max=321.62ms p(90)=132.97ms p(95)=139.77ms p(99.9)=171.22ms
     http_reqs......................: 54388   450.957111/s
     iteration_duration.............: avg=110.55ms min=16.73ms med=110.02ms max=344.43ms p(90)=133.36ms p(95)=140.14ms p(99.9)=173.81ms
     iterations.....................: 54288   450.127963/s
     success_rate...................: 100.00% ✓ 54288      ✗ 0    
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

     checks.........................: 100.00% ✓ 104055     ✗ 0    
     data_received..................: 3.1 GB  25 MB/s
     data_sent......................: 42 MB   345 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.26µs  med=3.45µs   max=3.07ms   p(90)=4.83µs   p(95)=5.42µs   p(99.9)=1.07ms  
     http_req_connecting............: avg=2.32µs   min=0s      med=0s       max=3.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=172.33ms min=7.26ms  med=180.9ms  max=353.23ms p(90)=197.62ms p(95)=200.74ms p(99.9)=278.7ms 
       { expected_response:true }...: avg=172.33ms min=7.26ms  med=180.9ms  max=353.23ms p(90)=197.62ms p(95)=200.74ms p(99.9)=278.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34785
     http_req_receiving.............: avg=93.32µs  min=35.64µs med=86.35µs  max=116.39ms p(90)=116.42µs p(95)=127.68µs p(99.9)=508.6µs 
     http_req_sending...............: avg=29.44µs  min=6.19µs  med=17.39µs  max=150.88ms p(90)=22.22µs  p(95)=23.97µs  p(99.9)=766.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=172.2ms  min=7.18ms  med=180.38ms max=352.46ms p(90)=197.51ms p(95)=200.63ms p(99.9)=278.11ms
     http_reqs......................: 34785   287.668203/s
     iteration_duration.............: avg=173.09ms min=32.17ms med=184.53ms max=363.28ms p(90)=197.92ms p(95)=201.01ms p(99.9)=281.3ms 
     iterations.....................: 34685   286.841214/s
     success_rate...................: 100.00% ✓ 34685      ✗ 0    
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

     checks.........................: 100.00% ✓ 100326     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   333 kB/s
     http_req_blocked...............: avg=5.98µs   min=1.06µs  med=3.1µs    max=3.89ms   p(90)=4.43µs   p(95)=4.98µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=178.73ms min=5.52ms  med=165.76ms max=709.09ms p(90)=217.46ms p(95)=263.49ms p(99.9)=571.43ms
       { expected_response:true }...: avg=178.73ms min=5.52ms  med=165.76ms max=709.09ms p(90)=217.46ms p(95)=263.49ms p(99.9)=571.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33542
     http_req_receiving.............: avg=94.66µs  min=30.49µs med=86.58µs  max=62.02ms  p(90)=116.75µs p(95)=127.89µs p(99.9)=693.56µs
     http_req_sending...............: avg=22.61µs  min=5.41µs  med=17.26µs  max=27.37ms  p(90)=21.54µs  p(95)=23.15µs  p(99.9)=506.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.61ms min=5.38ms  med=165.64ms max=708.99ms p(90)=217.29ms p(95)=263.4ms  p(99.9)=571.34ms
     http_reqs......................: 33542   277.612215/s
     iteration_duration.............: avg=179.52ms min=42.06ms med=166.18ms max=709.33ms p(90)=217.86ms p(95)=264.41ms p(99.9)=571.81ms
     iterations.....................: 33442   276.784559/s
     success_rate...................: 100.00% ✓ 33442      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 847242      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 340 MB  2.8 MB/s
     http_req_blocked...............: avg=2.89µs   min=882ns   med=2.04µs  max=13.68ms  p(90)=3.59µs  p(95)=4.31µs  p(99.9)=33.19µs 
     http_req_connecting............: avg=330ns    min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.02ms  min=1.69ms  med=17.52ms max=336.43ms p(90)=34.37ms p(95)=42.1ms  p(99.9)=156.42ms
       { expected_response:true }...: avg=21.02ms  min=1.69ms  med=17.52ms max=336.43ms p(90)=34.37ms p(95)=42.1ms  p(99.9)=156.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282514
     http_req_receiving.............: avg=622.99µs min=51.76µs med=98.26µs max=231.26ms p(90)=1.16ms  p(95)=1.98ms  p(99.9)=28.9ms  
     http_req_sending...............: avg=38.83µs  min=4.55µs  med=8.55µs  max=216.79ms p(90)=16.85µs p(95)=61.35µs p(99.9)=2.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.36ms  min=1.58ms  med=16.97ms max=335.47ms p(90)=33.31ms p(95)=40.89ms p(99.9)=153.82ms
     http_reqs......................: 282514  2350.110733/s
     iteration_duration.............: avg=21.23ms  min=2.79ms  med=17.72ms max=336.73ms p(90)=34.58ms p(95)=42.34ms p(99.9)=157.64ms
     iterations.....................: 282414  2349.278876/s
     success_rate...................: 100.00% ✓ 282414      ✗ 0     
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

     checks.........................: 100.00% ✓ 843819      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 338 MB  2.8 MB/s
     http_req_blocked...............: avg=3.39µs  min=942ns   med=2.47µs  max=15.67ms  p(90)=4µs     p(95)=4.73µs   p(99.9)=36.93µs
     http_req_connecting............: avg=361ns   min=0s      med=0s      max=3.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.1ms  min=1.6ms   med=20.89ms max=287.33ms p(90)=29.45ms p(95)=31.88ms  p(99.9)=50.48ms
       { expected_response:true }...: avg=21.1ms  min=1.6ms   med=20.89ms max=287.33ms p(90)=29.45ms p(95)=31.88ms  p(99.9)=50.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 281373
     http_req_receiving.............: avg=86.75µs min=25.74µs med=52.49µs max=137.33ms p(90)=92.01µs p(95)=120.22µs p(99.9)=5.74ms 
     http_req_sending...............: avg=38.77µs min=4.68µs  med=10.42µs max=150.01ms p(90)=17.76µs p(95)=29.51µs  p(99.9)=2.03ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.98ms min=1.52ms  med=20.78ms max=287.04ms p(90)=29.31ms p(95)=31.7ms   p(99.9)=48.99ms
     http_reqs......................: 281373  2340.669865/s
     iteration_duration.............: avg=21.32ms min=3.23ms  med=21.09ms max=298.38ms p(90)=29.65ms p(95)=32.1ms   p(99.9)=50.98ms
     iterations.....................: 281273  2339.837991/s
     success_rate...................: 100.00% ✓ 281273      ✗ 0     
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

     checks.........................: 100.00% ✓ 572442      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=7.93µs   min=1.06µs  med=3.13µs  max=61ms     p(90)=5.42µs   p(95)=6.52µs   p(99.9)=47.05µs
     http_req_connecting............: avg=4.01µs   min=0s      med=0s      max=60.84ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.17ms  min=2.28ms  med=30.55ms max=281.97ms p(90)=41.22ms  p(95)=44.83ms  p(99.9)=68.03ms
       { expected_response:true }...: avg=31.17ms  min=2.28ms  med=30.55ms max=281.97ms p(90)=41.22ms  p(95)=44.83ms  p(99.9)=68.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190914
     http_req_receiving.............: avg=106.87µs min=28.04µs med=62.97µs max=133.36ms p(90)=134.83µs p(95)=223.33µs p(99.9)=4.62ms 
     http_req_sending...............: avg=56.35µs  min=5.27µs  med=11.76µs max=122.42ms p(90)=26.39µs  p(95)=118.24µs p(99.9)=3.96ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.01ms  min=2.19ms  med=30.42ms max=227.46ms p(90)=41.05ms  p(95)=44.64ms  p(99.9)=66.95ms
     http_reqs......................: 190914  1587.020507/s
     iteration_duration.............: avg=31.43ms  min=6.48ms  med=30.79ms max=310.91ms p(90)=41.46ms  p(95)=45.07ms  p(99.9)=68.64ms
     iterations.....................: 190814  1586.189232/s
     success_rate...................: 100.00% ✓ 190814      ✗ 0     
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

     checks.........................: 100.00% ✓ 445299      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.95µs  min=1.13µs  med=2.96µs  max=3.57ms   p(90)=4.61µs   p(95)=5.36µs   p(99.9)=38.91µs 
     http_req_connecting............: avg=649ns   min=0s      med=0s      max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.15ms min=2.17ms  med=39.77ms max=307.79ms p(90)=55.82ms  p(95)=60.61ms  p(99.9)=84ms    
       { expected_response:true }...: avg=40.15ms min=2.17ms  med=39.77ms max=307.79ms p(90)=55.82ms  p(95)=60.61ms  p(99.9)=84ms    
     http_req_failed................: 0.00%   ✓ 0           ✗ 148533
     http_req_receiving.............: avg=85.26µs min=26.42µs med=69.78µs max=182.08ms p(90)=109.04µs p(95)=126.58µs p(99.9)=974.87µs
     http_req_sending...............: avg=29.81µs min=5.29µs  med=13.08µs max=177.38ms p(90)=20.08µs  p(95)=24µs     p(99.9)=1.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.04ms min=2.05ms  med=39.66ms max=307.06ms p(90)=55.71ms  p(95)=60.49ms  p(99.9)=83.13ms 
     http_reqs......................: 148533  1234.846426/s
     iteration_duration.............: avg=40.41ms min=4.25ms  med=40ms    max=319.43ms p(90)=56.04ms  p(95)=60.83ms  p(99.9)=84.63ms 
     iterations.....................: 148433  1234.015064/s
     success_rate...................: 100.00% ✓ 148433      ✗ 0     
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

     checks.........................: 100.00% ✓ 206661     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   687 kB/s
     http_req_blocked...............: avg=4.86µs  min=1.27µs  med=3.23µs  max=3.85ms   p(90)=4.71µs   p(95)=5.36µs   p(99.9)=42.86µs 
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.74ms min=3.99ms  med=85.26ms max=311.44ms p(90)=106.52ms p(95)=116.95ms p(99.9)=203.03ms
       { expected_response:true }...: avg=86.74ms min=3.99ms  med=85.26ms max=311.44ms p(90)=106.52ms p(95)=116.95ms p(99.9)=203.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68987
     http_req_receiving.............: avg=83.82µs min=30.74µs med=75.27µs max=112.32ms p(90)=109.47µs p(95)=122.12µs p(99.9)=638.32µs
     http_req_sending...............: avg=21.07µs min=5.38µs  med=14.36µs max=55.25ms  p(90)=20.72µs  p(95)=22.91µs  p(99.9)=589.59µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.63ms min=3.92ms  med=85.16ms max=311.1ms  p(90)=106.41ms p(95)=116.82ms p(99.9)=202.87ms
     http_reqs......................: 68987   572.26398/s
     iteration_duration.............: avg=87.11ms min=21.05ms med=85.5ms  max=334.75ms p(90)=106.78ms p(95)=117.25ms p(99.9)=204.28ms
     iterations.....................: 68887   571.434455/s
     success_rate...................: 100.00% ✓ 68887      ✗ 0    
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

     checks.........................: 100.00% ✓ 98004      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   326 kB/s
     http_req_blocked...............: avg=7.07µs   min=1.33µs  med=3.95µs   max=4.04ms   p(90)=5.51µs   p(95)=6.15µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.84µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=182.9ms  min=5.7ms   med=168.84ms max=683.54ms p(90)=211.01ms p(95)=260ms    p(99.9)=546.34ms
       { expected_response:true }...: avg=182.9ms  min=5.7ms   med=168.84ms max=683.54ms p(90)=211.01ms p(95)=260ms    p(99.9)=546.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32768
     http_req_receiving.............: avg=98.6µs   min=35.55µs med=92.64µs  max=33.12ms  p(90)=124.47µs p(95)=136.93µs p(99.9)=776.38µs
     http_req_sending...............: avg=25.13µs  min=6.81µs  med=19.71µs  max=25.85ms  p(90)=24.62µs  p(95)=26.55µs  p(99.9)=516.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.78ms min=5.62ms  med=168.72ms max=683.42ms p(90)=210.89ms p(95)=259.89ms p(99.9)=546.22ms
     http_reqs......................: 32768   271.266103/s
     iteration_duration.............: avg=183.76ms min=52.08ms med=169.2ms  max=683.85ms p(90)=211.45ms p(95)=262.54ms p(99.9)=546.64ms
     iterations.....................: 32668   270.438265/s
     success_rate...................: 100.00% ✓ 32668      ✗ 0    
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

     checks.........................: 100.00% ✓ 97866      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=7.12µs   min=1.48µs  med=3.8µs    max=4.15ms   p(90)=5.3µs    p(95)=5.9µs    p(99.9)=1.45ms  
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=183.16ms min=7.93ms  med=183.03ms max=411.46ms p(90)=239.36ms p(95)=247.07ms p(99.9)=315.68ms
       { expected_response:true }...: avg=183.16ms min=7.93ms  med=183.03ms max=411.46ms p(90)=239.36ms p(95)=247.07ms p(99.9)=315.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32722
     http_req_receiving.............: avg=100.82µs min=36.78µs med=90.72µs  max=119.41ms p(90)=123.25µs p(95)=136.54µs p(99.9)=575.62µs
     http_req_sending...............: avg=28.57µs  min=6.26µs  med=18.68µs  max=88.44ms  p(90)=23.5µs   p(95)=25.52µs  p(99.9)=545.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.03ms min=7.79ms  med=182.61ms max=410.86ms p(90)=239.25ms p(95)=246.92ms p(99.9)=315.3ms 
     http_reqs......................: 32722   270.429158/s
     iteration_duration.............: avg=184.02ms min=41.23ms med=193.05ms max=421.69ms p(90)=239.67ms p(95)=247.41ms p(99.9)=319.62ms
     iterations.....................: 32622   269.602714/s
     success_rate...................: 100.00% ✓ 32622      ✗ 0    
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

     checks.........................: 100.00% ✓ 7248      ✗ 0   
     data_received..................: 241 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=41.38µs  min=1.43µs   med=3.57µs  max=3.65ms  p(90)=5.21µs   p(95)=6.15µs   p(99.9)=3.36ms
     http_req_connecting............: avg=36.67µs  min=0s       med=0s      max=3.61ms  p(90)=0s       p(95)=0s       p(99.9)=3.33ms
     http_req_duration..............: avg=2.41s    min=25.59ms  med=2.49s   max=4.42s   p(90)=3.23s    p(95)=3.47s    p(99.9)=4.26s 
       { expected_response:true }...: avg=2.41s    min=25.59ms  med=2.49s   max=4.42s   p(90)=3.23s    p(95)=3.47s    p(99.9)=4.26s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2516
     http_req_receiving.............: avg=100.47µs min=37.12µs  med=90.71µs max=11.24ms p(90)=132.41µs p(95)=149.18µs p(99.9)=1.38ms
     http_req_sending...............: avg=58.19µs  min=6.1µs    med=18.94µs max=26.17ms p(90)=24.16µs  p(95)=28.64µs  p(99.9)=8.67ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.41s    min=25.39ms  med=2.49s   max=4.42s   p(90)=3.23s    p(95)=3.47s    p(99.9)=4.26s 
     http_reqs......................: 2516    19.89906/s
     iteration_duration.............: avg=2.51s    min=782.99ms med=2.53s   max=4.42s   p(90)=3.24s    p(95)=3.48s    p(99.9)=4.27s 
     iterations.....................: 2416    19.108159/s
     success_rate...................: 100.00% ✓ 2416      ✗ 0   
     vus............................: 19      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

