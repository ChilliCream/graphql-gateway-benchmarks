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
| hive-router | v0.0.84 | 2,895 | 3,166 | 2,849 | 3.9% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,668 | 2,813 | 2,655 | 2.0% |  |
| fusion | 16.6.6 | 2,625 | 2,766 | 2,613 | 2.1% |  |
| fusion-nightly | 16.7.0-p.7 | 2,581 | 2,700 | 2,560 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,478 | 2,551 | 2,461 | 1.1% |  |
| grafbase | 0.53.5 | 2,159 | 2,276 | 2,151 | 2.0% |  |
| cosmo | 0.334.0 | 1,289 | 1,332 | 1,275 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 613 | 629 | 610 | 1.1% |  |
| apollo-router | v2.16.1 | 480 | 491 | 476 | 1.1% |  |
| apollo-gateway | 2.14.3 | 282 | 285 | 281 | 0.5% |  |
| hive-gateway | 2.10.8 | 276 | 284 | 274 | 1.3% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1250 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,502 | 2,581 | 2,479 | 1.3% |  |
| hive-router | v0.0.84 | 2,480 | 2,670 | 2,466 | 2.9% |  |
| fusion-nightly | 16.7.0-p.7 | 2,429 | 2,512 | 2,381 | 1.8% |  |
| fusion | 16.6.6 | 2,391 | 2,512 | 2,379 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,215 | 2,336 | 2,206 | 2.0% |  |
| grafbase | 0.53.5 | 1,641 | 1,715 | 1,635 | 1.7% |  |
| cosmo | 0.334.0 | 1,182 | 1,229 | 1,178 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 578 | 598 | 574 | 1.3% |  |
| apollo-router | v2.16.1 | 441 | 461 | 438 | 2.0% |  |
| apollo-gateway | 2.14.3 | 270 | 272 | 267 | 0.7% |  |
| hive-gateway | 2.10.8 | 269 | 277 | 267 | 1.2% |  |
| feddi | 5ff8b6165878 | 23 | 24 | 22 | 2.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1043541     ✗ 0     
     data_received..................: 31 GB   254 MB/s
     data_sent......................: 418 MB  3.5 MB/s
     http_req_blocked...............: avg=2.65µs  min=861ns   med=1.9µs   max=14.78ms  p(90)=3.13µs  p(95)=3.74µs   p(99.9)=26.27µs
     http_req_connecting............: avg=237ns   min=0s      med=0s      max=3.3ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.03ms min=1.41ms  med=16.32ms max=294.33ms p(90)=25.1ms  p(95)=28.24ms  p(99.9)=48ms   
       { expected_response:true }...: avg=17.03ms min=1.41ms  med=16.32ms max=294.33ms p(90)=25.1ms  p(95)=28.24ms  p(99.9)=48ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 347947
     http_req_receiving.............: avg=86.74µs min=24.61µs med=44.14µs max=230.39ms p(90)=80.79µs p(95)=129.84µs p(99.9)=8.16ms 
     http_req_sending...............: avg=44.56µs min=4.24µs  med=8.03µs  max=135.66ms p(90)=14µs    p(95)=83.21µs  p(99.9)=5.52ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.9ms  min=1.33ms  med=16.22ms max=293.76ms p(90)=24.93ms p(95)=27.99ms  p(99.9)=46.74ms
     http_reqs......................: 347947  2895.335667/s
     iteration_duration.............: avg=17.24ms min=2.02ms  med=16.51ms max=306.42ms p(90)=25.31ms p(95)=28.46ms  p(99.9)=48.67ms
     iterations.....................: 347847  2894.503547/s
     success_rate...................: 100.00% ✓ 347847      ✗ 0     
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

     checks.........................: 100.00% ✓ 962355      ✗ 0     
     data_received..................: 28 GB   234 MB/s
     data_sent......................: 386 MB  3.2 MB/s
     http_req_blocked...............: avg=2.58µs  min=862ns   med=1.92µs   max=8.02ms   p(90)=3.18µs  p(95)=3.83µs  p(99.9)=25.38µs
     http_req_connecting............: avg=279ns   min=0s      med=0s       max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.48ms min=1.99ms  med=17.4ms   max=297.32ms p(90)=26.45ms p(95)=30.12ms p(99.9)=51.12ms
       { expected_response:true }...: avg=18.48ms min=1.99ms  med=17.4ms   max=297.32ms p(90)=26.45ms p(95)=30.12ms p(99.9)=51.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 320885
     http_req_receiving.............: avg=1.04ms  min=51.23µs med=132.44µs max=121.98ms p(90)=2.66ms  p(95)=3.65ms  p(99.9)=23.86ms
     http_req_sending...............: avg=45.57µs min=4.53µs  med=8.16µs   max=177.42ms p(90)=14.88µs p(95)=85.83µs p(99.9)=5.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.39ms min=1.87ms  med=16.28ms  max=296.85ms p(90)=25.07ms p(95)=28.7ms  p(99.9)=48.7ms 
     http_reqs......................: 320885  2668.514304/s
     iteration_duration.............: avg=18.69ms min=3.04ms  med=17.59ms  max=311.71ms p(90)=26.66ms p(95)=30.35ms p(99.9)=51.92ms
     iterations.....................: 320785  2667.682693/s
     success_rate...................: 100.00% ✓ 320785      ✗ 0     
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

     checks.........................: 100.00% ✓ 946689      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 379 MB  3.2 MB/s
     http_req_blocked...............: avg=2.65µs   min=841ns   med=1.87µs  max=19.64ms  p(90)=3.03µs  p(95)=3.6µs   p(99.9)=29.89µs 
     http_req_connecting............: avg=289ns    min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.79ms  min=1.98ms  med=16.19ms max=304.75ms p(90)=30.37ms p(95)=36.82ms p(99.9)=119.35ms
       { expected_response:true }...: avg=18.79ms  min=1.98ms  med=16.19ms max=304.75ms p(90)=30.37ms p(95)=36.82ms p(99.9)=119.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315663
     http_req_receiving.............: avg=554.15µs min=50.99µs med=90.7µs  max=260.1ms  p(90)=1.05ms  p(95)=1.89ms  p(99.9)=25.03ms 
     http_req_sending...............: avg=42.85µs  min=4.51µs  med=8.1µs   max=150.25ms p(90)=14.28µs p(95)=82.67µs p(99.9)=4.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.2ms   min=1.89ms  med=15.67ms max=304.65ms p(90)=29.44ms p(95)=35.74ms p(99.9)=118.12ms
     http_reqs......................: 315663  2625.007426/s
     iteration_duration.............: avg=19ms     min=3.03ms  med=16.39ms max=304.96ms p(90)=30.59ms p(95)=37.06ms p(99.9)=120.4ms 
     iterations.....................: 315563  2624.175841/s
     success_rate...................: 100.00% ✓ 315563      ✗ 0     
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

     checks.........................: 100.00% ✓ 931005      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.74µs   min=952ns   med=1.93µs  max=23.55ms  p(90)=3.04µs  p(95)=3.58µs  p(99.9)=25.82µs 
     http_req_connecting............: avg=282ns    min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.12ms  min=1.99ms  med=16.4ms  max=305.75ms p(90)=31.03ms p(95)=37.68ms p(99.9)=125.34ms
       { expected_response:true }...: avg=19.12ms  min=1.99ms  med=16.4ms  max=305.75ms p(90)=31.03ms p(95)=37.68ms p(99.9)=125.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310435
     http_req_receiving.............: avg=567.79µs min=50.26µs med=89.64µs max=122.74ms p(90)=1.08ms  p(95)=1.94ms  p(99.9)=25.73ms 
     http_req_sending...............: avg=41.11µs  min=4.48µs  med=8.17µs  max=124.56ms p(90)=13.94µs p(95)=76.53µs p(99.9)=3.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.51ms  min=1.85ms  med=15.88ms max=305.13ms p(90)=30.08ms p(95)=36.6ms  p(99.9)=123.78ms
     http_reqs......................: 310435  2581.239889/s
     iteration_duration.............: avg=19.32ms  min=3.06ms  med=16.59ms max=314.98ms p(90)=31.25ms p(95)=37.91ms p(99.9)=126.04ms
     iterations.....................: 310335  2580.408398/s
     success_rate...................: 100.00% ✓ 310335      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 893577      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.71µs   min=822ns   med=1.93µs  max=18ms     p(90)=3.22µs  p(95)=3.85µs  p(99.9)=30.77µs 
     http_req_connecting............: avg=313ns    min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.92ms  min=1.76ms  med=16.19ms max=296.17ms p(90)=34.07ms p(95)=42.81ms p(99.9)=152.17ms
       { expected_response:true }...: avg=19.92ms  min=1.76ms  med=16.19ms max=296.17ms p(90)=34.07ms p(95)=42.81ms p(99.9)=152.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297959
     http_req_receiving.............: avg=562.75µs min=50.65µs med=89.12µs max=164.47ms p(90)=1.03ms  p(95)=1.8ms   p(99.9)=28.36ms 
     http_req_sending...............: avg=39.67µs  min=4.66µs  med=8.23µs  max=92.94ms  p(90)=15.34µs p(95)=62.53µs p(99.9)=3.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.32ms  min=1.61ms  med=15.69ms max=295.43ms p(90)=33.09ms p(95)=41.72ms p(99.9)=150.48ms
     http_reqs......................: 297959  2478.259305/s
     iteration_duration.............: avg=20.13ms  min=2.71ms  med=16.38ms max=317.73ms p(90)=34.29ms p(95)=43.05ms p(99.9)=152.94ms
     iterations.....................: 297859  2477.42756/s
     success_rate...................: 100.00% ✓ 297859      ✗ 0     
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

     checks.........................: 100.00% ✓ 778539      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=3.15µs  min=942ns   med=2.52µs  max=10.56ms  p(90)=4.14µs  p(95)=4.91µs   p(99.9)=37.43µs
     http_req_connecting............: avg=157ns   min=0s      med=0s      max=1.73ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.89ms min=1.74ms  med=22.67ms max=271.43ms p(90)=27.19ms p(95)=28.99ms  p(99.9)=47.45ms
       { expected_response:true }...: avg=22.89ms min=1.74ms  med=22.67ms max=271.43ms p(90)=27.19ms p(95)=28.99ms  p(99.9)=47.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259613
     http_req_receiving.............: avg=94.51µs min=28.96µs med=56.67µs max=219.12ms p(90)=95.2µs  p(95)=123.18µs p(99.9)=5.54ms 
     http_req_sending...............: avg=37.77µs min=4.83µs  med=10.4µs  max=147.59ms p(90)=17.16µs p(95)=28.69µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.76ms min=1.66ms  med=22.57ms max=269.37ms p(90)=27.07ms p(95)=28.81ms  p(99.9)=46.28ms
     http_reqs......................: 259613  2159.360678/s
     iteration_duration.............: avg=23.11ms min=4.63ms  med=22.86ms max=286.73ms p(90)=27.4ms  p(95)=29.2ms   p(99.9)=47.87ms
     iterations.....................: 259513  2158.528917/s
     success_rate...................: 100.00% ✓ 259513      ✗ 0     
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

     checks.........................: 100.00% ✓ 464871     ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=3.33µs  min=1.05µs  med=2.43µs  max=4.03ms   p(90)=3.81µs  p(95)=4.43µs  p(99.9)=33.28µs 
     http_req_connecting............: avg=592ns   min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=38.48ms min=2.09ms  med=38.1ms  max=307.22ms p(90)=53.76ms p(95)=58.52ms p(99.9)=81.2ms  
       { expected_response:true }...: avg=38.48ms min=2.09ms  med=38.1ms  max=307.22ms p(90)=53.76ms p(95)=58.52ms p(99.9)=81.2ms  
     http_req_failed................: 0.00%   ✓ 0          ✗ 155057
     http_req_receiving.............: avg=72.33µs min=26.15µs med=59.66µs max=20.24ms  p(90)=94.66µs p(95)=110.4µs p(99.9)=936µs   
     http_req_sending...............: avg=25.98µs min=5.05µs  med=10.86µs max=165.4ms  p(90)=16.69µs p(95)=20.65µs p(99.9)=987.85µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=38.38ms min=2.01ms  med=38.01ms max=307ms    p(90)=53.66ms p(95)=58.41ms p(99.9)=80.74ms 
     http_reqs......................: 155057  1289.09688/s
     iteration_duration.............: avg=38.71ms min=4.12ms  med=38.31ms max=328.85ms p(90)=53.97ms p(95)=58.72ms p(99.9)=81.6ms  
     iterations.....................: 154957  1288.26551/s
     success_rate...................: 100.00% ✓ 154957     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 221601     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   737 kB/s
     http_req_blocked...............: avg=4.36µs  min=1.18µs  med=2.89µs  max=3.61ms   p(90)=4.32µs   p(95)=4.95µs   p(99.9)=45.15µs 
     http_req_connecting............: avg=1.19µs  min=0s      med=0s      max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.89ms min=3.72ms  med=79.06ms max=323.44ms p(90)=103.24ms p(95)=114.54ms p(99.9)=195.61ms
       { expected_response:true }...: avg=80.89ms min=3.72ms  med=79.06ms max=323.44ms p(90)=103.24ms p(95)=114.54ms p(99.9)=195.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73967
     http_req_receiving.............: avg=78.54µs min=29.13µs med=67.95µs max=119.8ms  p(90)=103.72µs p(95)=116.92µs p(99.9)=660.84µs
     http_req_sending...............: avg=28.93µs min=4.87µs  med=13.17µs max=181.75ms p(90)=19.88µs  p(95)=22.19µs  p(99.9)=620.11µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.78ms min=3.57ms  med=78.95ms max=322.82ms p(90)=103.14ms p(95)=114.41ms p(99.9)=195.24ms
     http_reqs......................: 73967   613.932627/s
     iteration_duration.............: avg=81.23ms min=16.69ms med=79.31ms max=332.37ms p(90)=103.49ms p(95)=114.83ms p(99.9)=196.48ms
     iterations.....................: 73867   613.102618/s
     success_rate...................: 100.00% ✓ 73867      ✗ 0    
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

     checks.........................: 100.00% ✓ 173556     ✗ 0    
     data_received..................: 5.1 GB  42 MB/s
     data_sent......................: 70 MB   577 kB/s
     http_req_blocked...............: avg=4.86µs   min=1.06µs  med=2.95µs   max=3.7ms    p(90)=4.28µs   p(95)=4.83µs   p(99.9)=100.85µs
     http_req_connecting............: avg=1.7µs    min=0s      med=0s       max=3.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=103.29ms min=4.73ms  med=103.14ms max=329.11ms p(90)=124.36ms p(95)=130.72ms p(99.9)=160.73ms
       { expected_response:true }...: avg=103.29ms min=4.73ms  med=103.14ms max=329.11ms p(90)=124.36ms p(95)=130.72ms p(99.9)=160.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 57952
     http_req_receiving.............: avg=86.01µs  min=29.63µs med=80.15µs  max=156.26ms p(90)=110.06µs p(95)=123.14µs p(99.9)=590.39µs
     http_req_sending...............: avg=26.96µs  min=5.4µs   med=16.36µs  max=163.5ms  p(90)=21.7µs   p(95)=23.49µs  p(99.9)=528.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.18ms min=4.64ms  med=103.03ms max=320.72ms p(90)=124.25ms p(95)=130.62ms p(99.9)=159.53ms
     http_reqs......................: 57952   480.613304/s
     iteration_duration.............: avg=103.72ms min=20.12ms med=103.42ms max=338.43ms p(90)=124.62ms p(95)=130.99ms p(99.9)=161.9ms 
     iterations.....................: 57852   479.783974/s
     success_rate...................: 100.00% ✓ 57852      ✗ 0    
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

     checks.........................: 100.00% ✓ 102045     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=6.33µs   min=1.34µs  med=3.32µs   max=4.23ms   p(90)=4.63µs   p(95)=5.21µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=175.69ms min=7.45ms  med=173.98ms max=401.64ms p(90)=187.4ms  p(95)=191.53ms p(99.9)=266.54ms
       { expected_response:true }...: avg=175.69ms min=7.45ms  med=173.98ms max=401.64ms p(90)=187.4ms  p(95)=191.53ms p(99.9)=266.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34115
     http_req_receiving.............: avg=91.2µs   min=33.54µs med=85.74µs  max=73.87ms  p(90)=115.52µs p(95)=126.35µs p(99.9)=470.66µs
     http_req_sending...............: avg=29.06µs  min=6.02µs  med=16.77µs  max=94.36ms  p(90)=21.52µs  p(95)=23.33µs  p(99.9)=612.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.57ms min=7.37ms  med=173.88ms max=400.95ms p(90)=187.29ms p(95)=191.42ms p(99.9)=266.44ms
     http_reqs......................: 34115   282.094722/s
     iteration_duration.............: avg=176.47ms min=30.29ms med=174.26ms max=412.02ms p(90)=187.67ms p(95)=191.8ms  p(99.9)=267.59ms
     iterations.....................: 34015   281.267828/s
     success_rate...................: 100.00% ✓ 34015      ✗ 0    
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

     checks.........................: 100.00% ✓ 99816      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   332 kB/s
     http_req_blocked...............: avg=6.58µs   min=1.54µs  med=3.65µs   max=3.36ms   p(90)=5µs      p(95)=5.61µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=2.68µs   min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=179.6ms  min=5.88ms  med=163.93ms max=685.67ms p(90)=210.98ms p(95)=249.45ms p(99.9)=588.63ms
       { expected_response:true }...: avg=179.6ms  min=5.88ms  med=163.93ms max=685.67ms p(90)=210.98ms p(95)=249.45ms p(99.9)=588.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33372
     http_req_receiving.............: avg=96.67µs  min=35.56µs med=90.85µs  max=65.66ms  p(90)=121.3µs  p(95)=133.17µs p(99.9)=491.02µs
     http_req_sending...............: avg=33.71µs  min=6.79µs  med=18.61µs  max=145.1ms  p(90)=23.1µs   p(95)=24.87µs  p(99.9)=495.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.47ms min=5.8ms   med=163.82ms max=685.58ms p(90)=210.86ms p(95)=249.26ms p(99.9)=588.53ms
     http_reqs......................: 33372   276.177566/s
     iteration_duration.............: avg=180.42ms min=22.14ms med=164.3ms  max=685.9ms  p(90)=211.45ms p(95)=250.37ms p(99.9)=589.01ms
     iterations.....................: 33272   275.349993/s
     success_rate...................: 100.00% ✓ 33272      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 902235      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=2.85µs  min=881ns   med=2.07µs   max=15.6ms   p(90)=3.75µs  p(95)=4.62µs  p(99.9)=28.25µs
     http_req_connecting............: avg=289ns   min=0s      med=0s       max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.71ms min=1.49ms  med=18.64ms  max=276.73ms p(90)=28.67ms p(95)=32.47ms p(99.9)=54.62ms
       { expected_response:true }...: avg=19.71ms min=1.49ms  med=18.64ms  max=276.73ms p(90)=28.67ms p(95)=32.47ms p(99.9)=54.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300845
     http_req_receiving.............: avg=1.2ms   min=51.72µs med=144.59µs max=179.08ms p(90)=3.13ms  p(95)=4.34ms  p(99.9)=25.27ms
     http_req_sending...............: avg=46.77µs min=4.63µs  med=8.79µs   max=207.89ms p(90)=18.74µs p(95)=86.35µs p(99.9)=4.89ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.46ms min=1.41ms  med=17.33ms  max=276.09ms p(90)=27.13ms p(95)=30.93ms p(99.9)=52.66ms
     http_reqs......................: 300845  2502.868714/s
     iteration_duration.............: avg=19.94ms min=2.71ms  med=18.84ms  max=306.4ms  p(90)=28.9ms  p(95)=32.72ms p(99.9)=55.11ms
     iterations.....................: 300745  2502.036767/s
     success_rate...................: 100.00% ✓ 300745      ✗ 0     
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

     checks.........................: 100.00% ✓ 894258      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=3.08µs  min=902ns   med=2.28µs  max=15.15ms  p(90)=3.82µs  p(95)=4.52µs   p(99.9)=34.36µs
     http_req_connecting............: avg=276ns   min=0s      med=0s      max=3.32ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.91ms min=1.67ms  med=19.71ms max=286.02ms p(90)=27.52ms p(95)=29.84ms  p(99.9)=48.43ms
       { expected_response:true }...: avg=19.91ms min=1.67ms  med=19.71ms max=286.02ms p(90)=27.52ms p(95)=29.84ms  p(99.9)=48.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298186
     http_req_receiving.............: avg=88.33µs min=27.01µs med=51.2µs  max=115.42ms p(90)=89.34µs p(95)=126.64µs p(99.9)=6.11ms 
     http_req_sending...............: avg=41.37µs min=4.77µs  med=9.56µs  max=129.2ms  p(90)=16.41µs p(95)=72.17µs  p(99.9)=3.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.78ms min=1.58ms  med=19.6ms  max=285.48ms p(90)=27.38ms p(95)=29.66ms  p(99.9)=47.61ms
     http_reqs......................: 298186  2480.248056/s
     iteration_duration.............: avg=20.11ms min=3.33ms  med=19.91ms max=294.36ms p(90)=27.72ms p(95)=30.05ms  p(99.9)=48.81ms
     iterations.....................: 298086  2479.416278/s
     success_rate...................: 100.00% ✓ 298086      ✗ 0     
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

     checks.........................: 100.00% ✓ 875838      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=2.7µs    min=822ns   med=1.98µs  max=6.68ms   p(90)=3.26µs  p(95)=3.87µs  p(99.9)=28.34µs 
     http_req_connecting............: avg=318ns    min=0s      med=0s      max=3.31ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.33ms  min=1.62ms  med=17.02ms max=353.95ms p(90)=33.37ms p(95)=40.96ms p(99.9)=144.97ms
       { expected_response:true }...: avg=20.33ms  min=1.62ms  med=17.02ms max=353.95ms p(90)=33.37ms p(95)=40.96ms p(99.9)=144.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292046
     http_req_receiving.............: avg=588.37µs min=52.64µs med=96.36µs max=180.18ms p(90)=1.1ms   p(95)=1.89ms  p(99.9)=27.1ms  
     http_req_sending...............: avg=38.68µs  min=4.62µs  med=8.53µs  max=123.67ms p(90)=15.54µs p(95)=58.58µs p(99.9)=3.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.7ms   min=1.5ms   med=16.48ms max=353.11ms p(90)=32.36ms p(95)=39.81ms p(99.9)=143.87ms
     http_reqs......................: 292046  2429.516655/s
     iteration_duration.............: avg=20.54ms  min=2.58ms  med=17.22ms max=354.13ms p(90)=33.58ms p(95)=41.19ms p(99.9)=146.09ms
     iterations.....................: 291946  2428.684759/s
     success_rate...................: 100.00% ✓ 291946      ✗ 0     
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

     checks.........................: 100.00% ✓ 862116      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=3.45µs   min=862ns   med=2.56µs  max=17.02ms  p(90)=4.2µs   p(95)=4.93µs  p(99.9)=38.92µs 
     http_req_connecting............: avg=316ns    min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.64ms  min=1.53ms  med=17.14ms max=439.01ms p(90)=34.15ms p(95)=42.08ms p(99.9)=149.82ms
       { expected_response:true }...: avg=20.64ms  min=1.53ms  med=17.14ms max=439.01ms p(90)=34.15ms p(95)=42.08ms p(99.9)=149.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287472
     http_req_receiving.............: avg=615.26µs min=52.36µs med=99.42µs max=174.79ms p(90)=1.14ms  p(95)=2.01ms  p(99.9)=28.84ms 
     http_req_sending...............: avg=45.69µs  min=4.74µs  med=9.88µs  max=219.71ms p(90)=17.92µs p(95)=89.07µs p(99.9)=3.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.98ms  min=1.46ms  med=16.58ms max=438.92ms p(90)=33.08ms p(95)=40.81ms p(99.9)=148.25ms
     http_reqs......................: 287472  2391.497966/s
     iteration_duration.............: avg=20.86ms  min=2.45ms  med=17.35ms max=439.18ms p(90)=34.39ms p(95)=42.34ms p(99.9)=150.94ms
     iterations.....................: 287372  2390.666059/s
     success_rate...................: 100.00% ✓ 287372      ✗ 0     
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

     checks.........................: 100.00% ✓ 798855      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 320 MB  2.7 MB/s
     http_req_blocked...............: avg=3.62µs   min=982ns   med=2.76µs   max=17.02ms  p(90)=4.33µs  p(95)=5.07µs  p(99.9)=41.3µs  
     http_req_connecting............: avg=324ns    min=0s      med=0s       max=3.49ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.29ms  min=1.9ms   med=18.46ms  max=568.3ms  p(90)=36.77ms p(95)=45.67ms p(99.9)=162.63ms
       { expected_response:true }...: avg=22.29ms  min=1.9ms   med=18.46ms  max=568.3ms  p(90)=36.77ms p(95)=45.67ms p(99.9)=162.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266385
     http_req_receiving.............: avg=625.93µs min=54.11µs med=108.04µs max=199.34ms p(90)=1.15ms  p(95)=1.98ms  p(99.9)=30.04ms 
     http_req_sending...............: avg=43.16µs  min=4.84µs  med=10.48µs  max=131.71ms p(90)=18.96µs p(95)=83.2µs  p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.62ms  min=1.8ms   med=17.89ms  max=524.96ms p(90)=35.68ms p(95)=44.42ms p(99.9)=161.05ms
     http_reqs......................: 266385  2215.096083/s
     iteration_duration.............: avg=22.52ms  min=2.76ms  med=18.68ms  max=568.5ms  p(90)=37ms    p(95)=45.93ms p(99.9)=164.16ms
     iterations.....................: 266285  2214.264544/s
     success_rate...................: 100.00% ✓ 266285      ✗ 0     
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

     checks.........................: 100.00% ✓ 592050      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=3.31µs  min=902ns   med=2.24µs  max=3.84ms   p(90)=4.53µs   p(95)=5.65µs   p(99.9)=43.09µs
     http_req_connecting............: avg=439ns   min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.15ms min=2.25ms  med=29.68ms max=283.25ms p(90)=39.69ms  p(95)=43.1ms   p(99.9)=63.89ms
       { expected_response:true }...: avg=30.15ms min=2.25ms  med=29.68ms max=283.25ms p(90)=39.69ms  p(95)=43.1ms   p(99.9)=63.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 197450
     http_req_receiving.............: avg=93.69µs min=26.88µs med=55.84µs max=54.57ms  p(90)=125.54µs p(95)=201.28µs p(99.9)=3.96ms 
     http_req_sending...............: avg=39.69µs min=4.45µs  med=9.38µs  max=118.7ms  p(90)=24.09µs  p(95)=106.54µs p(99.9)=2.7ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.02ms min=2.16ms  med=29.56ms max=282.54ms p(90)=39.54ms  p(95)=42.93ms  p(99.9)=63.45ms
     http_reqs......................: 197450  1641.373514/s
     iteration_duration.............: avg=30.39ms min=4.59ms  med=29.89ms max=309.65ms p(90)=39.92ms  p(95)=43.32ms  p(99.9)=64.29ms
     iterations.....................: 197350  1640.542229/s
     success_rate...................: 100.00% ✓ 197350      ✗ 0     
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

     checks.........................: 100.00% ✓ 426462      ✗ 0     
     data_received..................: 12 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.04µs  med=2.76µs  max=2.26ms   p(90)=4.29µs   p(95)=4.98µs   p(99.9)=38.23µs 
     http_req_connecting............: avg=342ns   min=0s      med=0s      max=2.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.95ms min=2.09ms  med=41.57ms max=306.77ms p(90)=58.41ms  p(95)=63.49ms  p(99.9)=86.57ms 
       { expected_response:true }...: avg=41.95ms min=2.09ms  med=41.57ms max=306.77ms p(90)=58.41ms  p(95)=63.49ms  p(99.9)=86.57ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142254
     http_req_receiving.............: avg=82.74µs min=26.57µs med=67.62µs max=236.3ms  p(90)=107.39µs p(95)=124.86µs p(99.9)=862.22µs
     http_req_sending...............: avg=27.15µs min=5.11µs  med=12.35µs max=105.27ms p(90)=18.96µs  p(95)=22.82µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.84ms min=1.98ms  med=41.47ms max=286.82ms p(90)=58.3ms   p(95)=63.37ms  p(99.9)=85.88ms 
     http_reqs......................: 142254  1182.725959/s
     iteration_duration.............: avg=42.2ms  min=4.21ms  med=41.8ms  max=322.07ms p(90)=58.64ms  p(95)=63.71ms  p(99.9)=86.81ms 
     iterations.....................: 142154  1181.894541/s
     success_rate...................: 100.00% ✓ 142154      ✗ 0     
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

     checks.........................: 100.00% ✓ 208863     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   695 kB/s
     http_req_blocked...............: avg=4.82µs  min=1.24µs  med=3.21µs  max=3.62ms   p(90)=4.75µs   p(95)=5.42µs   p(99.9)=48.23µs 
     http_req_connecting............: avg=1.33µs  min=0s      med=0s      max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.82ms min=3.92ms  med=83.76ms max=322.15ms p(90)=106.41ms p(95)=117.16ms p(99.9)=203.11ms
       { expected_response:true }...: avg=85.82ms min=3.92ms  med=83.76ms max=322.15ms p(90)=106.41ms p(95)=117.16ms p(99.9)=203.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69721
     http_req_receiving.............: avg=82.26µs min=29.74µs med=73.89µs max=18.2ms   p(90)=109.86µs p(95)=123.45µs p(99.9)=688.58µs
     http_req_sending...............: avg=21.85µs min=5.47µs  med=14.19µs max=67.39ms  p(90)=20.78µs  p(95)=23.08µs  p(99.9)=634.98µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.71ms min=3.8ms   med=83.65ms max=321.58ms p(90)=106.3ms  p(95)=117.03ms p(99.9)=202.93ms
     http_reqs......................: 69721   578.570086/s
     iteration_duration.............: avg=86.19ms min=30.22ms med=84.02ms max=340.28ms p(90)=106.65ms p(95)=117.46ms p(99.9)=204.31ms
     iterations.....................: 69621   577.74025/s
     success_rate...................: 100.00% ✓ 69621      ✗ 0    
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

     checks.........................: 100.00% ✓ 159462     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   530 kB/s
     http_req_blocked...............: avg=5.05µs   min=1.06µs  med=3.19µs   max=3.32ms   p(90)=4.71µs   p(95)=5.3µs    p(99.9)=109.89µs
     http_req_connecting............: avg=1.63µs   min=0s      med=0s       max=3.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.42ms min=4.93ms  med=110.21ms max=317.41ms p(90)=148.45ms p(95)=159.54ms p(99.9)=205.66ms
       { expected_response:true }...: avg=112.42ms min=4.93ms  med=110.21ms max=317.41ms p(90)=148.45ms p(95)=159.54ms p(99.9)=205.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53254
     http_req_receiving.............: avg=89.52µs  min=29.5µs  med=82.91µs  max=119.93ms p(90)=113.08µs p(95)=125.04µs p(99.9)=543.16µs
     http_req_sending...............: avg=30.93µs  min=5.32µs  med=16.69µs  max=120.74ms p(90)=21.99µs  p(95)=23.96µs  p(99.9)=557.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.3ms  min=4.86ms  med=110.09ms max=316.95ms p(90)=148.34ms p(95)=159.39ms p(99.9)=204.94ms
     http_reqs......................: 53254   441.356804/s
     iteration_duration.............: avg=112.9ms  min=28.01ms med=110.53ms max=326.38ms p(90)=148.78ms p(95)=159.81ms p(99.9)=207.07ms
     iterations.....................: 53154   440.528027/s
     success_rate...................: 100.00% ✓ 53154      ✗ 0    
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

     checks.........................: 100.00% ✓ 98052      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.82µs   min=1.27µs  med=3.63µs   max=4.06ms   p(90)=5.09µs   p(95)=5.71µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=182.81ms min=7.93ms  med=183.94ms max=411.02ms p(90)=195.26ms p(95)=199.15ms p(99.9)=281.51ms
       { expected_response:true }...: avg=182.81ms min=7.93ms  med=183.94ms max=411.02ms p(90)=195.26ms p(95)=199.15ms p(99.9)=281.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32784
     http_req_receiving.............: avg=99.32µs  min=32.39µs med=92.07µs  max=117.92ms p(90)=123.08µs p(95)=134.97µs p(99.9)=488.23µs
     http_req_sending...............: avg=35.34µs  min=6.35µs  med=18.75µs  max=187.35ms p(90)=23.65µs  p(95)=25.5µs   p(99.9)=516.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.68ms min=7.75ms  med=183.81ms max=410.78ms p(90)=195.13ms p(95)=199.01ms p(99.9)=280.32ms
     http_reqs......................: 32784   270.949685/s
     iteration_duration.............: avg=183.68ms min=18.88ms med=184.34ms max=429.58ms p(90)=195.57ms p(95)=199.45ms p(99.9)=284.67ms
     iterations.....................: 32684   270.123216/s
     success_rate...................: 100.00% ✓ 32684      ✗ 0    
     vus............................: 10      min=10       max=50 
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

     checks.........................: 100.00% ✓ 97416      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=7µs      min=1.28µs  med=3.76µs   max=3.79ms   p(90)=5.24µs   p(95)=5.87µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=2.96µs   min=0s      med=0s       max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=184.07ms min=5.8ms   med=167.74ms max=648.21ms p(90)=226.25ms p(95)=269.47ms p(99.9)=560.99ms
       { expected_response:true }...: avg=184.07ms min=5.8ms   med=167.74ms max=648.21ms p(90)=226.25ms p(95)=269.47ms p(99.9)=560.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32572
     http_req_receiving.............: avg=123.7µs  min=38.15µs med=94.12µs  max=158.43ms p(90)=125.28µs p(95)=137.74µs p(99.9)=918.29µs
     http_req_sending...............: avg=36.73µs  min=5.96µs  med=18.98µs  max=182.82ms p(90)=23.76µs  p(95)=25.58µs  p(99.9)=453µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.91ms min=5.65ms  med=167.59ms max=648.08ms p(90)=226.08ms p(95)=269.21ms p(99.9)=560.9ms 
     http_reqs......................: 32572   269.123095/s
     iteration_duration.............: avg=184.93ms min=46.26ms med=168.14ms max=648.5ms  p(90)=226.78ms p(95)=271.08ms p(99.9)=561.3ms 
     iterations.....................: 32472   268.296855/s
     success_rate...................: 100.00% ✓ 32472      ✗ 0    
     vus............................: 8       min=8        max=50 
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

     checks.........................: 100.00% ✓ 8529      ✗ 0   
     data_received..................: 282 MB  2.2 MB/s
     data_sent......................: 3.5 MB  28 kB/s
     http_req_blocked...............: avg=97.07µs min=992ns    med=3.21µs  max=8.71ms  p(90)=4.8µs    p(95)=5.56µs   p(99.9)=8.26ms  
     http_req_connecting............: avg=88.22µs min=0s       med=0s      max=8.64ms  p(90)=0s       p(95)=0s       p(99.9)=8.24ms  
     http_req_duration..............: avg=2.05s   min=25.62ms  med=2.1s    max=3.88s   p(90)=2.75s    p(95)=2.94s    p(99.9)=3.55s   
       { expected_response:true }...: avg=2.05s   min=25.62ms  med=2.1s    max=3.88s   p(90)=2.75s    p(95)=2.94s    p(99.9)=3.55s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2943
     http_req_receiving.............: avg=97.07µs min=26.59µs  med=92.99µs max=1.33ms  p(90)=133.83µs p(95)=150.38µs p(99.9)=490.27µs
     http_req_sending...............: avg=55.18µs min=5.14µs   med=18.29µs max=18.14ms p(90)=23.3µs   p(95)=27.08µs  p(99.9)=7.94ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.05s   min=25.47ms  med=2.1s    max=3.88s   p(90)=2.75s    p(95)=2.94s    p(99.9)=3.55s   
     http_reqs......................: 2943    23.416619/s
     iteration_duration.............: avg=2.12s   min=103.24ms med=2.13s   max=3.88s   p(90)=2.75s    p(95)=2.95s    p(99.9)=3.56s   
     iterations.....................: 2843    22.620947/s
     success_rate...................: 100.00% ✓ 2843      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

