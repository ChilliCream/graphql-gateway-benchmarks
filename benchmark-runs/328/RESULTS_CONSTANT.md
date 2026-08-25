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
| hive-router | v0.0.84 | 3,122 | 3,352 | 3,057 | 3.1% |  |
| fusion-nightly-net11 | 16.6.2-p.7 | 2,658 | 2,773 | 2,628 | 1.9% |  |
| fusion | 16.6.1 | 2,619 | 2,690 | 2,567 | 1.6% |  |
| fusion-nightly | 16.6.2-p.7 | 2,582 | 2,698 | 2,559 | 1.9% |  |
| fusion-nightly-fed | 16.6.2-p.7 | 2,493 | 2,562 | 2,468 | 1.2% |  |
| grafbase | 0.53.5 | 2,243 | 2,357 | 2,225 | 2.1% |  |
| cosmo | 0.334.0 | 1,301 | 1,341 | 1,288 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 627 | 646 | 625 | 1.2% |  |
| apollo-router | v2.16.1 | 487 | 504 | 484 | 1.4% |  |
| apollo-gateway | 2.14.3 | 284 | 287 | 283 | 0.5% |  |
| hive-gateway | 2.10.8 | 277 | 284 | 275 | 1.0% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1321 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,553 | 2,711 | 2,521 | 2.4% |  |
| fusion-nightly-net11 | 16.6.2-p.7 | 2,475 | 2,598 | 2,453 | 2.0% |  |
| fusion-nightly | 16.6.2-p.7 | 2,390 | 2,526 | 2,378 | 2.2% |  |
| fusion | 16.6.1 | 2,354 | 2,506 | 2,333 | 2.7% |  |
| fusion-nightly-fed | 16.6.2-p.7 | 2,239 | 2,351 | 2,230 | 2.0% |  |
| grafbase | 0.53.5 | 1,617 | 1,676 | 1,614 | 1.3% |  |
| cosmo | 0.334.0 | 1,195 | 1,244 | 1,190 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 573 | 589 | 568 | 1.1% |  |
| apollo-router | v2.16.1 | 425 | 445 | 409 | 2.2% |  |
| apollo-gateway | 2.14.3 | 271 | 276 | 271 | 0.6% |  |
| hive-gateway | 2.10.8 | 259 | 266 | 258 | 1.2% |  |
| feddi | 5ff8b6165878 | 20 | 20 | 19 | 1.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1125309     ✗ 0     
     data_received..................: 33 GB   274 MB/s
     data_sent......................: 451 MB  3.8 MB/s
     http_req_blocked...............: avg=3.06µs  min=902ns   med=2.24µs  max=25.55ms  p(90)=3.6µs   p(95)=4.24µs   p(99.9)=36.75µs
     http_req_connecting............: avg=240ns   min=0s      med=0s      max=3.77ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.77ms min=1.37ms  med=14.9ms  max=282.96ms p(90)=23.44ms p(95)=27.17ms  p(99.9)=47.81ms
       { expected_response:true }...: avg=15.77ms min=1.37ms  med=14.9ms  max=282.96ms p(90)=23.44ms p(95)=27.17ms  p(99.9)=47.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 375203
     http_req_receiving.............: avg=98.15µs min=25.59µs med=44.57µs max=133.89ms p(90)=85.24µs p(95)=169.44µs p(99.9)=8.91ms 
     http_req_sending...............: avg=51.43µs min=4.47µs  med=8.45µs  max=202.6ms  p(90)=15.1µs  p(95)=97.35µs  p(99.9)=9.5ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.62ms min=1.3ms   med=14.79ms max=282.49ms p(90)=23.24ms p(95)=26.87ms  p(99.9)=46.53ms
     http_reqs......................: 375203  3122.115627/s
     iteration_duration.............: avg=15.98ms min=1.89ms  med=15.09ms max=302.26ms p(90)=23.65ms p(95)=27.41ms  p(99.9)=48.56ms
     iterations.....................: 375103  3121.283513/s
     success_rate...................: 100.00% ✓ 375103      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 958671      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 384 MB  3.2 MB/s
     http_req_blocked...............: avg=3.2µs    min=1.02µs  med=2.37µs  max=23.75ms  p(90)=3.67µs  p(95)=4.27µs  p(99.9)=34.8µs 
     http_req_connecting............: avg=299ns    min=0s      med=0s      max=3.68ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.55ms  min=1.93ms  med=17.63ms max=266.54ms p(90)=26.92ms p(95)=30.59ms p(99.9)=52.37ms
       { expected_response:true }...: avg=18.55ms  min=1.93ms  med=17.63ms max=266.54ms p(90)=26.92ms p(95)=30.59ms p(99.9)=52.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 319657
     http_req_receiving.............: avg=485.31µs min=51.34µs med=96.31µs max=168.62ms p(90)=1.17ms  p(95)=1.83ms  p(99.9)=18.46ms
     http_req_sending...............: avg=46.11µs  min=4.78µs  med=8.96µs  max=137.32ms p(90)=15.59µs p(95)=93.97µs p(99.9)=4.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.02ms  min=1.8ms   med=17.12ms max=265.95ms p(90)=26.27ms p(95)=29.85ms p(99.9)=50.76ms
     http_reqs......................: 319657  2658.465449/s
     iteration_duration.............: avg=18.76ms  min=3.06ms  med=17.83ms max=310.97ms p(90)=27.13ms p(95)=30.82ms p(99.9)=53.05ms
     iterations.....................: 319557  2657.633788/s
     success_rate...................: 100.00% ✓ 319557      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 944658      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 379 MB  3.1 MB/s
     http_req_blocked...............: avg=3.58µs   min=942ns   med=2.42µs  max=25.57ms  p(90)=3.81µs  p(95)=4.44µs  p(99.9)=35.52µs 
     http_req_connecting............: avg=666ns    min=0s      med=0s      max=15.88ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.83ms  min=2.08ms  med=16.3ms  max=282.59ms p(90)=30.47ms p(95)=36.84ms p(99.9)=110.4ms 
       { expected_response:true }...: avg=18.83ms  min=2.08ms  med=16.3ms  max=282.59ms p(90)=30.47ms p(95)=36.84ms p(99.9)=110.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 314986
     http_req_receiving.............: avg=569.14µs min=51.26µs med=93.95µs max=180.51ms p(90)=1.1ms   p(95)=2.01ms  p(99.9)=25.55ms 
     http_req_sending...............: avg=48.73µs  min=4.96µs  med=9.18µs  max=187.97ms p(90)=16.27µs p(95)=95.92µs p(99.9)=4.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.21ms  min=1.99ms  med=15.77ms max=265.1ms  p(90)=29.51ms p(95)=35.75ms p(99.9)=108.55ms
     http_reqs......................: 314986  2619.260597/s
     iteration_duration.............: avg=19.04ms  min=2.76ms  med=16.51ms max=321.29ms p(90)=30.7ms  p(95)=37.1ms  p(99.9)=111.45ms
     iterations.....................: 314886  2618.429049/s
     success_rate...................: 100.00% ✓ 314886      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 931416      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.43µs   min=882ns   med=1.87µs  max=4.79ms   p(90)=2.99µs  p(95)=3.54µs  p(99.9)=26.14µs 
     http_req_connecting............: avg=202ns    min=0s      med=0s      max=2.83ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.11ms  min=1.99ms  med=16.37ms max=291.87ms p(90)=31.1ms  p(95)=37.74ms p(99.9)=126.26ms
       { expected_response:true }...: avg=19.11ms  min=1.99ms  med=16.37ms max=291.87ms p(90)=31.1ms  p(95)=37.74ms p(99.9)=126.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310572
     http_req_receiving.............: avg=569.31µs min=52.09µs med=90.16µs max=145.75ms p(90)=1.06ms  p(95)=1.93ms  p(99.9)=25.46ms 
     http_req_sending...............: avg=40.29µs  min=4.52µs  med=8.09µs  max=67.67ms  p(90)=13.63µs p(95)=76.87µs p(99.9)=3.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.5ms   min=1.9ms   med=15.83ms max=291.79ms p(90)=30.14ms p(95)=36.62ms p(99.9)=124.84ms
     http_reqs......................: 310572  2582.533095/s
     iteration_duration.............: avg=19.31ms  min=3.14ms  med=16.56ms max=293.12ms p(90)=31.31ms p(95)=37.96ms p(99.9)=127.23ms
     iterations.....................: 310472  2581.701554/s
     success_rate...................: 100.00% ✓ 310472      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 898893      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 360 MB  3.0 MB/s
     http_req_blocked...............: avg=2.92µs   min=871ns   med=2.02µs  max=20.34ms  p(90)=3.52µs  p(95)=4.2µs   p(99.9)=34.67µs 
     http_req_connecting............: avg=301ns    min=0s      med=0s      max=4ms      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.8ms   min=1.66ms  med=16.19ms max=340.24ms p(90)=33.89ms p(95)=42.44ms p(99.9)=151.36ms
       { expected_response:true }...: avg=19.8ms   min=1.66ms  med=16.19ms max=340.24ms p(90)=33.89ms p(95)=42.44ms p(99.9)=151.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299731
     http_req_receiving.............: avg=573.61µs min=51.74µs med=90.59µs max=276.68ms p(90)=1.05ms  p(95)=1.87ms  p(99.9)=28.37ms 
     http_req_sending...............: avg=43.68µs  min=4.48µs  med=8.6µs   max=216.93ms p(90)=16.25µs p(95)=63.17µs p(99.9)=4.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.19ms  min=1.58ms  med=15.67ms max=337.78ms p(90)=32.93ms p(95)=41.3ms  p(99.9)=149.11ms
     http_reqs......................: 299731  2493.169656/s
     iteration_duration.............: avg=20.01ms  min=2.58ms  med=16.39ms max=340.43ms p(90)=34.11ms p(95)=42.68ms p(99.9)=152.23ms
     iterations.....................: 299631  2492.337854/s
     success_rate...................: 100.00% ✓ 299631      ✗ 0     
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

     checks.........................: 100.00% ✓ 808728      ✗ 0     
     data_received..................: 24 GB   197 MB/s
     data_sent......................: 324 MB  2.7 MB/s
     http_req_blocked...............: avg=3.12µs  min=921ns   med=2.24µs  max=11.15ms  p(90)=3.9µs   p(95)=4.7µs    p(99.9)=37.19µs
     http_req_connecting............: avg=326ns   min=0s      med=0s      max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.03ms min=1.72ms  med=21.79ms max=291.5ms  p(90)=26.24ms p(95)=28.16ms  p(99.9)=47.46ms
       { expected_response:true }...: avg=22.03ms min=1.72ms  med=21.79ms max=291.5ms  p(90)=26.24ms p(95)=28.16ms  p(99.9)=47.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 269676
     http_req_receiving.............: avg=89.24µs min=26.96µs med=52.95µs max=138.84ms p(90)=93.67µs p(95)=126.37µs p(99.9)=6.01ms 
     http_req_sending...............: avg=39.05µs min=4.56µs  med=9.36µs  max=155.46ms p(90)=17.17µs p(95)=44.59µs  p(99.9)=2.62ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.9ms  min=1.63ms  med=21.69ms max=291.06ms p(90)=26.11ms p(95)=27.95ms  p(99.9)=46.28ms
     http_reqs......................: 269676  2243.141551/s
     iteration_duration.............: avg=22.24ms min=3.72ms  med=21.98ms max=315.27ms p(90)=26.45ms p(95)=28.37ms  p(99.9)=47.91ms
     iterations.....................: 269576  2242.30976/s
     success_rate...................: 100.00% ✓ 269576      ✗ 0     
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

     checks.........................: 100.00% ✓ 469338      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 188 MB  1.6 MB/s
     http_req_blocked...............: avg=3.32µs  min=1µs     med=2.4µs   max=4.23ms   p(90)=3.78µs  p(95)=4.4µs    p(99.9)=36.32µs 
     http_req_connecting............: avg=599ns   min=0s      med=0s      max=4.17ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.11ms min=2ms     med=37.71ms max=309.73ms p(90)=53.23ms p(95)=57.91ms  p(99.9)=80.18ms 
       { expected_response:true }...: avg=38.11ms min=2ms     med=37.71ms max=309.73ms p(90)=53.23ms p(95)=57.91ms  p(99.9)=80.18ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 156546
     http_req_receiving.............: avg=76.34µs min=26.19µs med=58.96µs max=205.14ms p(90)=94.88µs p(95)=110.67µs p(99.9)=894.01µs
     http_req_sending...............: avg=22.69µs min=4.88µs  med=10.63µs max=127.11ms p(90)=16.56µs p(95)=20.42µs  p(99.9)=923.2µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.01ms min=1.94ms  med=37.62ms max=300.05ms p(90)=53.13ms p(95)=57.79ms  p(99.9)=80.02ms 
     http_reqs......................: 156546  1301.574284/s
     iteration_duration.............: avg=38.34ms min=3.75ms  med=37.91ms max=324.32ms p(90)=53.43ms p(95)=58.11ms  p(99.9)=80.73ms 
     iterations.....................: 156446  1300.742852/s
     success_rate...................: 100.00% ✓ 156446      ✗ 0     
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

     checks.........................: 100.00% ✓ 226356     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   753 kB/s
     http_req_blocked...............: avg=5.4µs   min=942ns   med=2.33µs  max=8.42ms   p(90)=3.85µs  p(95)=4.43µs   p(99.9)=45.91µs 
     http_req_connecting............: avg=2.74µs  min=0s      med=0s      max=8.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.2ms  min=3.43ms  med=77.46ms max=307.28ms p(90)=96.74ms p(95)=106.03ms p(99.9)=181.56ms
       { expected_response:true }...: avg=79.2ms  min=3.43ms  med=77.46ms max=307.28ms p(90)=96.74ms p(95)=106.03ms p(99.9)=181.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75552
     http_req_receiving.............: avg=95.46µs min=27.77µs med=63.68µs max=175.96ms p(90)=99.9µs  p(95)=113.25µs p(99.9)=667.12µs
     http_req_sending...............: avg=22.51µs min=4.65µs  med=11.6µs  max=70.38ms  p(90)=18.8µs  p(95)=20.85µs  p(99.9)=785.73µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.08ms min=3.38ms  med=77.37ms max=292.3ms  p(90)=96.61ms p(95)=105.82ms p(99.9)=179.79ms
     http_reqs......................: 75552   627.179889/s
     iteration_duration.............: avg=79.52ms min=22.4ms  med=77.69ms max=316.99ms p(90)=96.99ms p(95)=106.28ms p(99.9)=182.71ms
     iterations.....................: 75452   626.349758/s
     success_rate...................: 100.00% ✓ 75452      ✗ 0    
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

     checks.........................: 100.00% ✓ 176145     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   586 kB/s
     http_req_blocked...............: avg=4.73µs   min=1.06µs  med=3.01µs   max=3.97ms   p(90)=4.41µs   p(95)=4.93µs   p(99.9)=72.02µs 
     http_req_connecting............: avg=1.5µs    min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.77ms min=4.52ms  med=101.58ms max=296.91ms p(90)=122.41ms p(95)=128.54ms p(99.9)=158.93ms
       { expected_response:true }...: avg=101.77ms min=4.52ms  med=101.58ms max=296.91ms p(90)=122.41ms p(95)=128.54ms p(99.9)=158.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58815
     http_req_receiving.............: avg=80.68µs  min=29.47µs med=76.56µs  max=16.1ms   p(90)=107.62µs p(95)=120.61µs p(99.9)=536.53µs
     http_req_sending...............: avg=24.67µs  min=5.04µs  med=15.6µs   max=180.84ms p(90)=20.87µs  p(95)=22.73µs  p(99.9)=565.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.67ms min=4.46ms  med=101.48ms max=296.37ms p(90)=122.32ms p(95)=128.44ms p(99.9)=158.03ms
     http_reqs......................: 58815   487.736066/s
     iteration_duration.............: avg=102.21ms min=13.35ms med=101.85ms max=328.8ms  p(90)=122.68ms p(95)=128.8ms  p(99.9)=160.83ms
     iterations.....................: 58715   486.906794/s
     success_rate...................: 100.00% ✓ 58715      ✗ 0    
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

     checks.........................: 100.00% ✓ 103068     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=6.21µs   min=1.33µs  med=3.35µs   max=4.11ms   p(90)=4.65µs   p(95)=5.18µs   p(99.9)=951.34µs
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=902.54µs
     http_req_duration..............: avg=173.95ms min=7.45ms  med=173.66ms max=398.71ms p(90)=181.85ms p(95)=185.5ms  p(99.9)=257.51ms
       { expected_response:true }...: avg=173.95ms min=7.45ms  med=173.66ms max=398.71ms p(90)=181.85ms p(95)=185.5ms  p(99.9)=257.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34456
     http_req_receiving.............: avg=95.13µs  min=32.51µs med=82.08µs  max=160.42ms p(90)=112.47µs p(95)=123.09µs p(99.9)=661.17µs
     http_req_sending...............: avg=32.89µs  min=5.87µs  med=16.76µs  max=164.07ms p(90)=21.35µs  p(95)=23.05µs  p(99.9)=617.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.83ms min=7.34ms  med=173.56ms max=395.52ms p(90)=181.75ms p(95)=185.38ms p(99.9)=257.33ms
     http_reqs......................: 34456   284.890224/s
     iteration_duration.............: avg=174.74ms min=41.74ms med=173.96ms max=408.25ms p(90)=182.13ms p(95)=185.78ms p(99.9)=262.23ms
     iterations.....................: 34356   284.063401/s
     success_rate...................: 100.00% ✓ 34356      ✗ 0    
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

     checks.........................: 100.00% ✓ 100191     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   333 kB/s
     http_req_blocked...............: avg=6.84µs   min=1.26µs  med=3.63µs   max=3.86ms   p(90)=5.02µs   p(95)=5.6µs    p(99.9)=1.63ms  
     http_req_connecting............: avg=2.92µs   min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=178.95ms min=5.79ms  med=164.56ms max=612.45ms p(90)=211.24ms p(95)=252.32ms p(99.9)=552.55ms
       { expected_response:true }...: avg=178.95ms min=5.79ms  med=164.56ms max=612.45ms p(90)=211.24ms p(95)=252.32ms p(99.9)=552.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33497
     http_req_receiving.............: avg=90.2µs   min=34.54µs med=82.16µs  max=85.71ms  p(90)=112.76µs p(95)=123.79µs p(99.9)=581.27µs
     http_req_sending...............: avg=25.3µs   min=5.56µs  med=16.95µs  max=75.19ms  p(90)=21.86µs  p(95)=23.51µs  p(99.9)=529.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.83ms min=5.66ms  med=164.45ms max=612.37ms p(90)=211.11ms p(95)=252.16ms p(99.9)=552.44ms
     http_reqs......................: 33497   277.275634/s
     iteration_duration.............: avg=179.75ms min=41.93ms med=164.93ms max=612.63ms p(90)=211.66ms p(95)=253.88ms p(99.9)=552.93ms
     iterations.....................: 33397   276.447871/s
     success_rate...................: 100.00% ✓ 33397      ✗ 0    
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

     checks.........................: 100.00% ✓ 920640      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=3.53µs  min=1µs     med=2.7µs   max=9.39ms   p(90)=4.37µs  p(95)=5.19µs   p(99.9)=39.28µs
     http_req_connecting............: avg=329ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.31ms min=1.73ms  med=18.91ms max=270.89ms p(90)=26.82ms p(95)=29.51ms  p(99.9)=49.91ms
       { expected_response:true }...: avg=19.31ms min=1.73ms  med=18.91ms max=270.89ms p(90)=26.82ms p(95)=29.51ms  p(99.9)=49.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306980
     http_req_receiving.............: avg=96.99µs min=25.64µs med=53.69µs max=86.18ms  p(90)=97.46µs p(95)=149.36µs p(99.9)=7.6ms  
     http_req_sending...............: avg=45.52µs min=4.92µs  med=10.62µs max=143.68ms p(90)=18.88µs p(95)=99.92µs  p(99.9)=3.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.17ms min=1.66ms  med=18.78ms max=270.68ms p(90)=26.65ms p(95)=29.27ms  p(99.9)=48.86ms
     http_reqs......................: 306980  2553.545211/s
     iteration_duration.............: avg=19.54ms min=3.5ms   med=19.11ms max=308.62ms p(90)=27.04ms p(95)=29.73ms  p(99.9)=50.56ms
     iterations.....................: 306880  2552.713383/s
     success_rate...................: 100.00% ✓ 306880      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 892140      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.81µs   min=891ns   med=1.99µs   max=15.65ms  p(90)=3.31µs  p(95)=3.98µs  p(99.9)=30.7µs 
     http_req_connecting............: avg=301ns    min=0s      med=0s       max=3.78ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.95ms  min=1.49ms  med=19.11ms  max=282.36ms p(90)=28.97ms p(95)=32.5ms  p(99.9)=53.2ms 
       { expected_response:true }...: avg=19.95ms  min=1.49ms  med=19.11ms  max=282.36ms p(90)=28.97ms p(95)=32.5ms  p(99.9)=53.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 297480
     http_req_receiving.............: avg=554.95µs min=51.03µs med=103.96µs max=250.93ms p(90)=1.36ms  p(95)=2.1ms   p(99.9)=17.65ms
     http_req_sending...............: avg=39.32µs  min=4.7µs   med=8.49µs   max=118.07ms p(90)=15.85µs p(95)=73.94µs p(99.9)=2.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.36ms  min=1.42ms  med=18.53ms  max=282.15ms p(90)=28.26ms p(95)=31.7ms  p(99.9)=51.47ms
     http_reqs......................: 297480  2475.019764/s
     iteration_duration.............: avg=20.16ms  min=2.54ms  med=19.31ms  max=297.83ms p(90)=29.17ms p(95)=32.72ms p(99.9)=53.84ms
     iterations.....................: 297380  2474.187768/s
     success_rate...................: 100.00% ✓ 297380      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 861822      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=2.89µs   min=902ns   med=2.06µs  max=15.49ms  p(90)=3.44µs  p(95)=4.12µs  p(99.9)=31.55µs 
     http_req_connecting............: avg=373ns    min=0s      med=0s      max=4.53ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.66ms  min=1.53ms  med=17.22ms max=459.43ms p(90)=33.89ms p(95)=41.66ms p(99.9)=155.55ms
       { expected_response:true }...: avg=20.66ms  min=1.53ms  med=17.22ms max=459.43ms p(90)=33.89ms p(95)=41.66ms p(99.9)=155.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287374
     http_req_receiving.............: avg=592.67µs min=51.75µs med=96.72µs max=223.45ms p(90)=1.11ms  p(95)=1.91ms  p(99.9)=27.44ms 
     http_req_sending...............: avg=39.15µs  min=4.64µs  med=8.66µs  max=109.8ms  p(90)=16.2µs  p(95)=69.07µs p(99.9)=3ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.03ms  min=1.36ms  med=16.68ms max=456.08ms p(90)=32.9ms  p(95)=40.45ms p(99.9)=154.57ms
     http_reqs......................: 287374  2390.688026/s
     iteration_duration.............: avg=20.87ms  min=2.52ms  med=17.42ms max=459.62ms p(90)=34.1ms  p(95)=41.89ms p(99.9)=157.02ms
     iterations.....................: 287274  2389.856118/s
     success_rate...................: 100.00% ✓ 287274      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 848640      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 340 MB  2.8 MB/s
     http_req_blocked...............: avg=2.93µs   min=911ns   med=2.07µs  max=16.31ms  p(90)=3.6µs   p(95)=4.3µs   p(99.9)=33.42µs 
     http_req_connecting............: avg=343ns    min=0s      med=0s      max=3.59ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.98ms  min=1.61ms  med=17.47ms max=362.11ms p(90)=34.51ms p(95)=42.42ms p(99.9)=150.23ms
       { expected_response:true }...: avg=20.98ms  min=1.61ms  med=17.47ms max=362.11ms p(90)=34.51ms p(95)=42.42ms p(99.9)=150.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282980
     http_req_receiving.............: avg=598.87µs min=51.69µs med=95.69µs max=184.25ms p(90)=1.12ms  p(95)=1.96ms  p(99.9)=27.99ms 
     http_req_sending...............: avg=41.72µs  min=4.38µs  med=8.73µs  max=151.07ms p(90)=16.93µs p(95)=68.53µs p(99.9)=3.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.34ms  min=1.5ms   med=16.92ms max=362.03ms p(90)=33.46ms p(95)=41.23ms p(99.9)=148.98ms
     http_reqs......................: 282980  2354.083859/s
     iteration_duration.............: avg=21.2ms   min=2.67ms  med=17.68ms max=362.29ms p(90)=34.73ms p(95)=42.65ms p(99.9)=152.41ms
     iterations.....................: 282880  2353.251968/s
     success_rate...................: 100.00% ✓ 282880      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 807453      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 324 MB  2.7 MB/s
     http_req_blocked...............: avg=2.74µs   min=872ns  med=2.14µs   max=3.31ms   p(90)=3.74µs  p(95)=4.49µs  p(99.9)=31.84µs 
     http_req_connecting............: avg=199ns    min=0s     med=0s       max=3.29ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.06ms  min=1.88ms med=18.61ms  max=331.19ms p(90)=36.04ms p(95)=44.3ms  p(99.9)=151.06ms
       { expected_response:true }...: avg=22.06ms  min=1.88ms med=18.61ms  max=331.19ms p(90)=36.04ms p(95)=44.3ms  p(99.9)=151.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 269251
     http_req_receiving.............: avg=608.58µs min=51.6µs med=101.16µs max=280.08ms p(90)=1.16ms  p(95)=1.98ms  p(99.9)=26.58ms 
     http_req_sending...............: avg=39.84µs  min=4.77µs med=9.08µs   max=146.74ms p(90)=18µs    p(95)=40.41µs p(99.9)=2.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.41ms  min=1.75ms med=18.05ms  max=328.06ms p(90)=35.01ms p(95)=43.09ms p(99.9)=148.73ms
     http_reqs......................: 269251  2239.314467/s
     iteration_duration.............: avg=22.28ms  min=2.94ms med=18.81ms  max=331.4ms  p(90)=36.26ms p(95)=44.53ms p(99.9)=151.94ms
     iterations.....................: 269151  2238.482784/s
     success_rate...................: 100.00% ✓ 269151      ✗ 0     
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

     checks.........................: 100.00% ✓ 583488      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.11µs  min=841ns   med=2.1µs   max=3.8ms    p(90)=4.14µs   p(95)=5.26µs   p(99.9)=39.01µs
     http_req_connecting............: avg=459ns   min=0s      med=0s      max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.6ms  min=2.22ms  med=30.13ms max=272.17ms p(90)=40.28ms  p(95)=43.61ms  p(99.9)=63.39ms
       { expected_response:true }...: avg=30.6ms  min=2.22ms  med=30.13ms max=272.17ms p(90)=40.28ms  p(95)=43.61ms  p(99.9)=63.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194596
     http_req_receiving.............: avg=90.29µs min=26.16µs med=54.08µs max=104.49ms p(90)=123.63µs p(95)=198.05µs p(99.9)=3.25ms 
     http_req_sending...............: avg=36.83µs min=4.43µs  med=9.01µs  max=172.01ms p(90)=23.07µs  p(95)=102.71µs p(99.9)=2.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.48ms min=2.11ms  med=30.01ms max=270.96ms p(90)=40.14ms  p(95)=43.46ms  p(99.9)=62.88ms
     http_reqs......................: 194596  1617.659204/s
     iteration_duration.............: avg=30.84ms min=4.38ms  med=30.35ms max=305.77ms p(90)=40.5ms   p(95)=43.84ms  p(99.9)=63.65ms
     iterations.....................: 194496  1616.827913/s
     success_rate...................: 100.00% ✓ 194496      ✗ 0     
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

     checks.........................: 100.00% ✓ 431097      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs  min=1.16µs  med=2.77µs  max=3.79ms   p(90)=4.3µs    p(95)=4.98µs  p(99.9)=35.97µs 
     http_req_connecting............: avg=630ns   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=41.49ms min=2.17ms  med=41.06ms max=313.76ms p(90)=57.65ms  p(95)=62.75ms p(99.9)=86.9ms  
       { expected_response:true }...: avg=41.49ms min=2.17ms  med=41.06ms max=313.76ms p(90)=57.65ms  p(95)=62.75ms p(99.9)=86.9ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 143799
     http_req_receiving.............: avg=83.41µs min=28.66µs med=70.42µs max=125.91ms p(90)=109.95µs p(95)=127.5µs p(99.9)=824.35µs
     http_req_sending...............: avg=26.05µs min=5.05µs  med=12.42µs max=77.58ms  p(90)=19.43µs  p(95)=23.38µs p(99.9)=985.02µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=41.38ms min=2.05ms  med=40.96ms max=313.2ms  p(90)=57.53ms  p(95)=62.64ms p(99.9)=86.55ms 
     http_reqs......................: 143799  1195.367262/s
     iteration_duration.............: avg=41.74ms min=4.3ms   med=41.29ms max=326.25ms p(90)=57.86ms  p(95)=62.97ms p(99.9)=87.4ms  
     iterations.....................: 143699  1194.535985/s
     success_rate...................: 100.00% ✓ 143699      ✗ 0     
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

     checks.........................: 100.00% ✓ 206991     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   689 kB/s
     http_req_blocked...............: avg=4.64µs  min=1.22µs  med=3.1µs   max=3.31ms   p(90)=4.63µs   p(95)=5.29µs   p(99.9)=46.23µs 
     http_req_connecting............: avg=1.26µs  min=0s      med=0s      max=3.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.6ms  min=3.74ms  med=84.78ms max=315.74ms p(90)=106.09ms p(95)=116.34ms p(99.9)=203.3ms 
       { expected_response:true }...: avg=86.6ms  min=3.74ms  med=84.78ms max=315.74ms p(90)=106.09ms p(95)=116.34ms p(99.9)=203.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 69097
     http_req_receiving.............: avg=82.69µs min=28.62µs med=73.34µs max=126.14ms p(90)=109.51µs p(95)=122.35µs p(99.9)=643.35µs
     http_req_sending...............: avg=28.15µs min=5.27µs  med=14.15µs max=204.66ms p(90)=20.63µs  p(95)=22.92µs  p(99.9)=627.3µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.49ms min=3.65ms  med=84.68ms max=315.1ms  p(90)=105.97ms p(95)=116.21ms p(99.9)=202.83ms
     http_reqs......................: 69097   573.422686/s
     iteration_duration.............: avg=86.97ms min=22.58ms med=85.04ms max=329.19ms p(90)=106.35ms p(95)=116.65ms p(99.9)=204.49ms
     iterations.....................: 68997   572.592806/s
     success_rate...................: 100.00% ✓ 68997      ✗ 0    
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

     checks.........................: 100.00% ✓ 153627     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   511 kB/s
     http_req_blocked...............: avg=5.74µs   min=1.37µs  med=3.66µs   max=4.15ms   p(90)=5.22µs   p(95)=5.84µs   p(99.9)=149.51µs
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.7ms  min=5.59ms  med=114.3ms  max=330.39ms p(90)=154.43ms p(95)=166.18ms p(99.9)=212.79ms
       { expected_response:true }...: avg=116.7ms  min=5.59ms  med=114.3ms  max=330.39ms p(90)=154.43ms p(95)=166.18ms p(99.9)=212.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51309
     http_req_receiving.............: avg=96.81µs  min=33.45µs med=85.97µs  max=132.33ms p(90)=117.6µs  p(95)=130.35µs p(99.9)=583.68µs
     http_req_sending...............: avg=29.7µs   min=6.49µs  med=17.73µs  max=149.34ms p(90)=23.33µs  p(95)=25.33µs  p(99.9)=593.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.57ms min=5.44ms  med=114.17ms max=330.2ms  p(90)=154.3ms  p(95)=166.05ms p(99.9)=212.53ms
     http_reqs......................: 51309   425.144368/s
     iteration_duration.............: avg=117.2ms  min=35.1ms  med=114.64ms max=339.45ms p(90)=154.74ms p(95)=166.5ms  p(99.9)=215.19ms
     iterations.....................: 51209   424.315772/s
     success_rate...................: 100.00% ✓ 51209      ✗ 0    
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

     checks.........................: 100.00% ✓ 98226      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   326 kB/s
     http_req_blocked...............: avg=6.92µs   min=1.38µs  med=3.73µs   max=3.5ms    p(90)=5.24µs   p(95)=5.86µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=2.78µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=182.5ms  min=7.72ms  med=183.86ms max=416.5ms  p(90)=194.03ms p(95)=201.71ms p(99.9)=270.65ms
       { expected_response:true }...: avg=182.5ms  min=7.72ms  med=183.86ms max=416.5ms  p(90)=194.03ms p(95)=201.71ms p(99.9)=270.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32842
     http_req_receiving.............: avg=99.69µs  min=35.97µs med=90.46µs  max=105.41ms p(90)=122.06µs p(95)=134.92µs p(99.9)=595.73µs
     http_req_sending...............: avg=26.84µs  min=6.18µs  med=18.89µs  max=61.55ms  p(90)=24.02µs  p(95)=25.93µs  p(99.9)=505.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.37ms min=7.59ms  med=183.76ms max=416.01ms p(90)=193.9ms  p(95)=201.59ms p(99.9)=270.44ms
     http_reqs......................: 32842   271.494484/s
     iteration_duration.............: avg=183.36ms min=53.62ms med=184.24ms max=425.36ms p(90)=194.33ms p(95)=202.08ms p(99.9)=273.75ms
     iterations.....................: 32742   270.667816/s
     success_rate...................: 100.00% ✓ 32742      ✗ 0    
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

     checks.........................: 100.00% ✓ 93825      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.8µs    min=1.54µs  med=3.67µs   max=4.1ms    p(90)=5.04µs   p(95)=5.68µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.89µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=191.07ms min=6.39ms  med=176.52ms max=679.38ms p(90)=221.28ms p(95)=271.04ms p(99.9)=561.64ms
       { expected_response:true }...: avg=191.07ms min=6.39ms  med=176.52ms max=679.38ms p(90)=221.28ms p(95)=271.04ms p(99.9)=561.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31375
     http_req_receiving.............: avg=103.03µs min=34.6µs  med=89.06µs  max=106.21ms p(90)=120.2µs  p(95)=131.59µs p(99.9)=635.38µs
     http_req_sending...............: avg=23.78µs  min=6.76µs  med=17.84µs  max=25.43ms  p(90)=22.47µs  p(95)=24.29µs  p(99.9)=608.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.95ms min=6.23ms  med=176.41ms max=679.3ms  p(90)=221.15ms p(95)=270.63ms p(99.9)=561.52ms
     http_reqs......................: 31375   259.538715/s
     iteration_duration.............: avg=191.95ms min=51.33ms med=176.85ms max=679.56ms p(90)=221.62ms p(95)=272.85ms p(99.9)=561.94ms
     iterations.....................: 31275   258.7115/s
     success_rate...................: 100.00% ✓ 31275      ✗ 0    
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

     checks.........................: 100.00% ✓ 7299      ✗ 0   
     data_received..................: 242 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=97.4µs   min=1.74µs   med=3.77µs  max=8.77ms  p(90)=5.38µs   p(95)=6.36µs   p(99.9)=7.88ms  
     http_req_connecting............: avg=91.31µs  min=0s       med=0s      max=8.19ms  p(90)=0s       p(95)=0s       p(99.9)=7.85ms  
     http_req_duration..............: avg=2.39s    min=28.42ms  med=2.49s   max=4.08s   p(90)=3.18s    p(95)=3.41s    p(99.9)=4.06s   
       { expected_response:true }...: avg=2.39s    min=28.42ms  med=2.49s   max=4.08s   p(90)=3.18s    p(95)=3.41s    p(99.9)=4.06s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2533
     http_req_receiving.............: avg=104.02µs min=34.42µs  med=93.08µs max=17.27ms p(90)=132.23µs p(95)=147.47µs p(99.9)=392.43µs
     http_req_sending...............: avg=74.92µs  min=6.6µs    med=19.69µs max=5.99ms  p(90)=25.5µs   p(95)=29.61µs  p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.39s    min=28.27ms  med=2.49s   max=4.07s   p(90)=3.18s    p(95)=3.41s    p(99.9)=4.06s   
     http_reqs......................: 2533    20.044581/s
     iteration_duration.............: avg=2.49s    min=437.51ms med=2.52s   max=4.08s   p(90)=3.19s    p(95)=3.42s    p(99.9)=4.06s   
     iterations.....................: 2433    19.253243/s
     success_rate...................: 100.00% ✓ 2433      ✗ 0   
     vus............................: 23      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

