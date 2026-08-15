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
| hive-router | v0.0.84 | 3,132 | 3,302 | 3,093 | 2.2% |  |
| fusion-nightly-net11 | 16.6.1-p.3 | 2,660 | 2,798 | 2,624 | 2.2% |  |
| fusion | 16.6.0 | 2,613 | 2,725 | 2,586 | 1.8% |  |
| fusion-nightly | 16.6.1-p.3 | 2,581 | 2,734 | 2,534 | 2.6% |  |
| fusion-nightly-fed | 16.6.1-p.3 | 2,454 | 2,563 | 2,439 | 1.7% |  |
| grafbase | 0.53.5 | 2,134 | 2,263 | 2,125 | 2.3% |  |
| cosmo | 0.334.0 | 1,328 | 1,371 | 1,317 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 626 | 643 | 625 | 0.9% |  |
| apollo-router | v2.16.1 | 447 | 466 | 443 | 1.7% |  |
| apollo-gateway | 2.14.3 | 285 | 289 | 284 | 0.6% |  |
| hive-gateway | 2.10.8 | 280 | 283 | 277 | 0.6% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.1-p.3 | 2,550 | 2,656 | 2,543 | 1.6% |  |
| fusion-nightly | 16.6.1-p.3 | 2,459 | 2,551 | 2,394 | 1.9% |  |
| fusion | 16.6.0 | 2,452 | 2,572 | 2,448 | 1.8% |  |
| hive-router | v0.0.84 | 2,415 | 2,638 | 2,396 | 3.6% |  |
| fusion-nightly-fed | 16.6.1-p.3 | 2,222 | 2,312 | 2,199 | 1.8% |  |
| grafbase | 0.53.5 | 1,584 | 1,649 | 1,581 | 1.5% |  |
| cosmo | 0.334.0 | 1,183 | 1,234 | 1,177 | 1.8% |  |
| hive-gateway-router-runtime | 2.10.8 | 586 | 604 | 585 | 1.1% |  |
| apollo-gateway | 2.14.3 | 267 | 272 | 264 | 0.8% |  |
| hive-gateway | 2.10.8 | 260 | 267 | 259 | 1.0% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 18 | 4.6% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1129020     ✗ 0     
     data_received..................: 33 GB   275 MB/s
     data_sent......................: 452 MB  3.8 MB/s
     http_req_blocked...............: avg=2.6µs   min=892ns   med=1.95µs  max=11.7ms   p(90)=3.27µs  p(95)=3.91µs   p(99.9)=30.28µs
     http_req_connecting............: avg=253ns   min=0s      med=0s      max=3.57ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.73ms min=1.4ms   med=15.19ms max=284.59ms p(90)=22.77ms p(95)=25.69ms  p(99.9)=44.73ms
       { expected_response:true }...: avg=15.73ms min=1.4ms   med=15.19ms max=284.59ms p(90)=22.77ms p(95)=25.69ms  p(99.9)=44.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 376440
     http_req_receiving.............: avg=80.59µs min=24.02µs med=43.15µs max=132.44ms p(90)=80.83µs p(95)=145.32µs p(99.9)=6.39ms 
     http_req_sending...............: avg=45.48µs min=4.45µs  med=8.15µs  max=92.05ms  p(90)=14.71µs p(95)=91.35µs  p(99.9)=5.59ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.61ms min=1.34ms  med=15.08ms max=275.86ms p(90)=22.61ms p(95)=25.46ms  p(99.9)=43.71ms
     http_reqs......................: 376440  3132.317581/s
     iteration_duration.............: avg=15.93ms min=1.95ms  med=15.37ms max=294.37ms p(90)=22.96ms p(95)=25.91ms  p(99.9)=45.75ms
     iterations.....................: 376340  3131.485492/s
     success_rate...................: 100.00% ✓ 376340      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 959373      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 384 MB  3.2 MB/s
     http_req_blocked...............: avg=2.58µs   min=832ns  med=1.91µs  max=14.94ms  p(90)=3.03µs  p(95)=3.59µs  p(99.9)=26.06µs
     http_req_connecting............: avg=303ns    min=0s     med=0s      max=4.01ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.54ms  min=1.92ms med=17.68ms max=295.25ms p(90)=26.88ms p(95)=30.36ms p(99.9)=51.43ms
       { expected_response:true }...: avg=18.54ms  min=1.92ms med=17.68ms max=295.25ms p(90)=26.88ms p(95)=30.36ms p(99.9)=51.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 319891
     http_req_receiving.............: avg=481.85µs min=50.7µs med=92.7µs  max=180.98ms p(90)=1.17ms  p(95)=1.79ms  p(99.9)=17.67ms
     http_req_sending...............: avg=41.77µs  min=4.59µs med=8.1µs   max=193.43ms p(90)=14.21µs p(95)=79.77µs p(99.9)=3.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.02ms  min=1.85ms med=17.17ms max=277.86ms p(90)=26.24ms p(95)=29.67ms p(99.9)=49.49ms
     http_reqs......................: 319891  2660.396141/s
     iteration_duration.............: avg=18.75ms  min=3.18ms med=17.87ms max=306.76ms p(90)=27.09ms p(95)=30.59ms p(99.9)=51.94ms
     iterations.....................: 319791  2659.564484/s
     success_rate...................: 100.00% ✓ 319791      ✗ 0     
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

     checks.........................: 100.00% ✓ 942372      ✗ 0     
     data_received..................: 28 GB   229 MB/s
     data_sent......................: 378 MB  3.1 MB/s
     http_req_blocked...............: avg=2.56µs  min=891ns   med=1.84µs  max=16.23ms  p(90)=2.93µs  p(95)=3.48µs  p(99.9)=27.27µs 
     http_req_connecting............: avg=223ns   min=0s      med=0s      max=4.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.89ms min=1.95ms  med=16.27ms max=269.99ms p(90)=30.68ms p(95)=37.19ms p(99.9)=114.16ms
       { expected_response:true }...: avg=18.89ms min=1.95ms  med=16.27ms max=269.99ms p(90)=30.68ms p(95)=37.19ms p(99.9)=114.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 314224
     http_req_receiving.............: avg=574.9µs min=51.08µs med=88.37µs max=213.88ms p(90)=1.1ms   p(95)=1.97ms  p(99.9)=25.27ms 
     http_req_sending...............: avg=38.7µs  min=4.44µs  med=7.85µs  max=118.07ms p(90)=13.41µs p(95)=67.77µs p(99.9)=3.19ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.27ms min=1.87ms  med=15.74ms max=269.45ms p(90)=29.72ms p(95)=36.06ms p(99.9)=111.68ms
     http_reqs......................: 314224  2613.119773/s
     iteration_duration.............: avg=19.09ms min=3ms     med=16.46ms max=293.47ms p(90)=30.9ms  p(95)=37.41ms p(99.9)=114.94ms
     iterations.....................: 314124  2612.288163/s
     success_rate...................: 100.00% ✓ 314124      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 930987      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.87µs   min=842ns   med=1.93µs  max=19.06ms  p(90)=3.15µs  p(95)=3.73µs  p(99.9)=27.6µs  
     http_req_connecting............: avg=296ns    min=0s      med=0s      max=3.29ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.11ms  min=2.02ms  med=16.44ms max=282.49ms p(90)=31.12ms p(95)=37.7ms  p(99.9)=117.58ms
       { expected_response:true }...: avg=19.11ms  min=2.02ms  med=16.44ms max=282.49ms p(90)=31.12ms p(95)=37.7ms  p(99.9)=117.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310429
     http_req_receiving.............: avg=568.54µs min=50.19µs med=89.33µs max=230.15ms p(90)=1.08ms  p(95)=1.94ms  p(99.9)=24.74ms 
     http_req_sending...............: avg=43.55µs  min=4.46µs  med=8.07µs  max=118.02ms p(90)=14.42µs p(95)=78.45µs p(99.9)=4.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.5ms   min=1.91ms  med=15.91ms max=281.97ms p(90)=30.18ms p(95)=36.63ms p(99.9)=116.11ms
     http_reqs......................: 310429  2581.202109/s
     iteration_duration.............: avg=19.32ms  min=2.56ms  med=16.64ms max=297.11ms p(90)=31.34ms p(95)=37.95ms p(99.9)=119.03ms
     iterations.....................: 310329  2580.370614/s
     success_rate...................: 100.00% ✓ 310329      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 884934      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 355 MB  2.9 MB/s
     http_req_blocked...............: avg=3.28µs   min=1µs     med=2.54µs  max=8.65ms   p(90)=3.97µs  p(95)=4.64µs  p(99.9)=36.97µs 
     http_req_connecting............: avg=324ns    min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.11ms  min=1.67ms  med=16.45ms max=334.12ms p(90)=33.84ms p(95)=42.65ms p(99.9)=160.67ms
       { expected_response:true }...: avg=20.11ms  min=1.67ms  med=16.45ms max=334.12ms p(90)=33.84ms p(95)=42.65ms p(99.9)=160.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295078
     http_req_receiving.............: avg=560.35µs min=51.05µs med=95.21µs max=238.86ms p(90)=1.04ms  p(95)=1.85ms  p(99.9)=27.4ms  
     http_req_sending...............: avg=43.32µs  min=4.65µs  med=9.53µs  max=225.69ms p(90)=16.83µs p(95)=88.57µs p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.51ms  min=1.59ms  med=15.93ms max=334.02ms p(90)=32.88ms p(95)=41.45ms p(99.9)=159.89ms
     http_reqs......................: 295078  2454.35294/s
     iteration_duration.............: avg=20.33ms  min=2.53ms  med=16.65ms max=334.3ms  p(90)=34.06ms p(95)=42.89ms p(99.9)=162.11ms
     iterations.....................: 294978  2453.521176/s
     success_rate...................: 100.00% ✓ 294978      ✗ 0     
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

     checks.........................: 100.00% ✓ 769626      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=3.6µs   min=1.05µs med=2.67µs  max=11.73ms  p(90)=4.15µs  p(95)=4.88µs   p(99.9)=39.23µs
     http_req_connecting............: avg=394ns   min=0s     med=0s      max=4.23ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.15ms min=1.79ms med=22.92ms max=303.15ms p(90)=27.58ms p(95)=29.44ms  p(99.9)=48.89ms
       { expected_response:true }...: avg=23.15ms min=1.79ms med=22.92ms max=303.15ms p(90)=27.58ms p(95)=29.44ms  p(99.9)=48.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256642
     http_req_receiving.............: avg=93.05µs min=28.9µs med=57.86µs max=186.92ms p(90)=95.35µs p(95)=121.44µs p(99.9)=6.64ms 
     http_req_sending...............: avg=38.88µs min=5.05µs med=10.46µs max=193.79ms p(90)=17.13µs p(95)=28.43µs  p(99.9)=1.98ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.02ms min=1.67ms med=22.82ms max=283.72ms p(90)=27.45ms p(95)=29.26ms  p(99.9)=47.89ms
     http_reqs......................: 256642  2134.659235/s
     iteration_duration.............: avg=23.37ms min=3.92ms med=23.12ms max=313.91ms p(90)=27.79ms p(95)=29.66ms  p(99.9)=49.36ms
     iterations.....................: 256542  2133.82747/s
     success_rate...................: 100.00% ✓ 256542      ✗ 0     
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

     checks.........................: 100.00% ✓ 478914      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.46µs  min=1.06µs  med=2.6µs   max=4.51ms   p(90)=4.09µs  p(95)=4.75µs   p(99.9)=35.38µs
     http_req_connecting............: avg=532ns   min=0s      med=0s      max=4.45ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.34ms min=2.02ms  med=36.96ms max=293.17ms p(90)=52.09ms p(95)=56.76ms  p(99.9)=79.09ms
       { expected_response:true }...: avg=37.34ms min=2.02ms  med=36.96ms max=293.17ms p(90)=52.09ms p(95)=56.76ms  p(99.9)=79.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159738
     http_req_receiving.............: avg=75.33µs min=26.01µs med=61.55µs max=58.54ms  p(90)=98.7µs  p(95)=115.44µs p(99.9)=1.02ms 
     http_req_sending...............: avg=24.95µs min=5.03µs  med=11.07µs max=174.63ms p(90)=17.46µs p(95)=21.6µs   p(99.9)=1ms    
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.24ms min=1.96ms  med=36.86ms max=292.82ms p(90)=51.99ms p(95)=56.64ms  p(99.9)=78.78ms
     http_reqs......................: 159738  1328.207746/s
     iteration_duration.............: avg=37.57ms min=3.73ms  med=37.18ms max=300.58ms p(90)=52.29ms p(95)=56.97ms  p(99.9)=79.79ms
     iterations.....................: 159638  1327.376255/s
     success_rate...................: 100.00% ✓ 159638      ✗ 0     
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

     checks.........................: 100.00% ✓ 226074     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   752 kB/s
     http_req_blocked...............: avg=3.88µs  min=972ns   med=2.41µs  max=3.84ms   p(90)=4µs      p(95)=4.63µs   p(99.9)=45.2µs  
     http_req_connecting............: avg=1.15µs  min=0s      med=0s      max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.3ms  min=3.67ms  med=77.76ms max=311.98ms p(90)=97.09ms  p(95)=106.14ms p(99.9)=183.59ms
       { expected_response:true }...: avg=79.3ms  min=3.67ms  med=77.76ms max=311.98ms p(90)=97.09ms  p(95)=106.14ms p(99.9)=183.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75458
     http_req_receiving.............: avg=77.6µs  min=28.21µs med=65.5µs  max=88.46ms  p(90)=104.24µs p(95)=117.45µs p(99.9)=733.66µs
     http_req_sending...............: avg=20.17µs min=4.31µs  med=11.97µs max=83.69ms  p(90)=19.38µs  p(95)=21.5µs   p(99.9)=572.95µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.2ms  min=3.57ms  med=77.67ms max=311.42ms p(90)=96.99ms  p(95)=106.01ms p(99.9)=183.34ms
     http_reqs......................: 75458   626.206959/s
     iteration_duration.............: avg=79.63ms min=21.01ms med=77.98ms max=340.69ms p(90)=97.34ms  p(95)=106.43ms p(99.9)=184.36ms
     iterations.....................: 75358   625.377084/s
     success_rate...................: 100.00% ✓ 75358      ✗ 0    
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

     checks.........................: 100.00% ✓ 161439     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   537 kB/s
     http_req_blocked...............: avg=5.16µs   min=1.28µs  med=3.19µs   max=3.98ms   p(90)=4.58µs   p(95)=5.16µs   p(99.9)=89.66µs 
     http_req_connecting............: avg=1.74µs   min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.06ms min=4.76ms  med=110.8ms  max=340.11ms p(90)=133.84ms p(95)=140.67ms p(99.9)=173.83ms
       { expected_response:true }...: avg=111.06ms min=4.76ms  med=110.8ms  max=340.11ms p(90)=133.84ms p(95)=140.67ms p(99.9)=173.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53913
     http_req_receiving.............: avg=85.16µs  min=31.59µs med=73.08µs  max=120.51ms p(90)=104.72µs p(95)=117.07µs p(99.9)=564.07µs
     http_req_sending...............: avg=25.54µs  min=6µs     med=15.4µs   max=98.8ms   p(90)=21.04µs  p(95)=22.87µs  p(99.9)=538.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.95ms min=4.69ms  med=110.7ms  max=339.87ms p(90)=133.74ms p(95)=140.57ms p(99.9)=172.92ms
     http_reqs......................: 53913   447.010744/s
     iteration_duration.............: avg=111.53ms min=17.91ms med=111.08ms max=348.24ms p(90)=134.11ms p(95)=140.92ms p(99.9)=178.35ms
     iterations.....................: 53813   446.181611/s
     success_rate...................: 100.00% ✓ 53813      ✗ 0    
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

     checks.........................: 100.00% ✓ 103107     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=6.01µs   min=1.14µs  med=3.47µs   max=3.31ms   p(90)=4.73µs   p(95)=5.27µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=2.3µs    min=0s      med=0s       max=3.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=173.89ms min=7.35ms  med=186.1ms  max=352.37ms p(90)=200.59ms p(95)=204.68ms p(99.9)=270.25ms
       { expected_response:true }...: avg=173.89ms min=7.35ms  med=186.1ms  max=352.37ms p(90)=200.59ms p(95)=204.68ms p(99.9)=270.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34469
     http_req_receiving.............: avg=91.01µs  min=35.64µs med=86.87µs  max=19.12ms  p(90)=117.58µs p(95)=128.74µs p(99.9)=413.9µs 
     http_req_sending...............: avg=33.2µs   min=5.99µs  med=17.3µs   max=111.18ms p(90)=21.71µs  p(95)=23.35µs  p(99.9)=554.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.77ms min=7.24ms  med=185.96ms max=352.01ms p(90)=200.48ms p(95)=204.58ms p(99.9)=270.14ms
     http_reqs......................: 34469   285.080797/s
     iteration_duration.............: avg=174.66ms min=45.83ms med=186.72ms max=361.31ms p(90)=200.85ms p(95)=204.97ms p(99.9)=272.2ms 
     iterations.....................: 34369   284.253733/s
     success_rate...................: 100.00% ✓ 34369      ✗ 0    
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

     checks.........................: 100.00% ✓ 101205     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=6.11µs   min=1.12µs  med=3.02µs   max=3.8ms    p(90)=4.41µs   p(95)=5.01µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=177.16ms min=5.91ms  med=162.18ms max=655.87ms p(90)=207.39ms p(95)=243.27ms p(99.9)=594.16ms
       { expected_response:true }...: avg=177.16ms min=5.91ms  med=162.18ms max=655.87ms p(90)=207.39ms p(95)=243.27ms p(99.9)=594.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33835
     http_req_receiving.............: avg=91.01µs  min=32.37µs med=87.35µs  max=40.54ms  p(90)=116.6µs  p(95)=128.81µs p(99.9)=545.12µs
     http_req_sending...............: avg=27.37µs  min=5.44µs  med=16.77µs  max=62.81ms  p(90)=21.45µs  p(95)=23.28µs  p(99.9)=537.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.04ms min=5.84ms  med=162.07ms max=655.76ms p(90)=207.27ms p(95)=243ms    p(99.9)=594.06ms
     http_reqs......................: 33835   280.033543/s
     iteration_duration.............: avg=177.95ms min=38.13ms med=162.5ms  max=656.11ms p(90)=207.8ms  p(95)=244.36ms p(99.9)=594.42ms
     iterations.....................: 33735   279.205899/s
     success_rate...................: 100.00% ✓ 33735      ✗ 0    
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
data_received..................: 9.4 MB 156 kB/s
     data_sent......................: 119 kB 2.0 kB/s
     http_req_blocked...............: avg=5.52µs   min=2.54µs  med=3.29µs   max=179.22µs p(90)=4.86µs   p(95)=5.51µs   p(99.9)=162.94µs
     http_req_connecting............: avg=959ns    min=0s      med=0s       max=93.99µs  p(90)=0s       p(95)=0s       p(99.9)=84.87µs 
     http_req_duration..............: avg=342.46ms min=26.39ms med=35.9ms   max=30.02s   p(90)=44.7ms   p(95)=46.86ms  p(99.9)=27.11s  
       { expected_response:true }...: avg=342.46ms min=26.39ms med=35.9ms   max=30.02s   p(90)=44.7ms   p(95)=46.86ms  p(99.9)=27.11s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 98  
     http_req_receiving.............: avg=134.46µs min=69.85µs med=130.21µs max=374.27µs p(90)=179.26µs p(95)=201.54µs p(99.9)=372.79µs
     http_req_sending...............: avg=22.44µs  min=14.93µs med=17.95µs  max=164.65µs p(90)=21.17µs  p(95)=22.9µs   p(99.9)=163.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=342.3ms  min=26.24ms med=35.73ms  max=30.02s   p(90)=44.55ms  p(95)=46.76ms  p(99.9)=27.11s  
     http_reqs......................: 98     1.633301/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 919527      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=2.98µs   min=851ns   med=2.01µs  max=18.35ms  p(90)=3.58µs  p(95)=4.34µs  p(99.9)=29.61µs
     http_req_connecting............: avg=310ns    min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.34ms  min=1.51ms  med=18.54ms max=287.47ms p(90)=27.88ms p(95)=31.45ms p(99.9)=52.64ms
       { expected_response:true }...: avg=19.34ms  min=1.51ms  med=18.54ms max=287.47ms p(90)=27.88ms p(95)=31.45ms p(99.9)=52.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306609
     http_req_receiving.............: avg=548.12µs min=51.03µs med=98.14µs max=274.27ms p(90)=1.37ms  p(95)=2.17ms  p(99.9)=20.16ms
     http_req_sending...............: avg=44.51µs  min=4.63µs  med=8.66µs  max=144.99ms p(90)=18.55µs p(95)=86.86µs p(99.9)=3.87ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.75ms  min=1.42ms  med=17.95ms max=274.38ms p(90)=27.18ms p(95)=30.67ms p(99.9)=50.76ms
     http_reqs......................: 306609  2550.895971/s
     iteration_duration.............: avg=19.56ms  min=2.6ms   med=18.74ms max=305.6ms  p(90)=28.1ms  p(95)=31.68ms p(99.9)=53.22ms
     iterations.....................: 306509  2550.064001/s
     success_rate...................: 100.00% ✓ 306509      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 886476      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=2.85µs   min=902ns   med=2.12µs  max=8.81ms   p(90)=3.75µs  p(95)=4.49µs  p(99.9)=30.81µs 
     http_req_connecting............: avg=284ns    min=0s      med=0s      max=3.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.07ms  min=1.58ms  med=16.91ms max=340.93ms p(90)=32.84ms p(95)=40.05ms p(99.9)=146.29ms
       { expected_response:true }...: avg=20.07ms  min=1.58ms  med=16.91ms max=340.93ms p(90)=32.84ms p(95)=40.05ms p(99.9)=146.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295592
     http_req_receiving.............: avg=561.06µs min=52.13µs med=93.6µs  max=137.63ms p(90)=1.07ms  p(95)=1.89ms  p(99.9)=26.41ms 
     http_req_sending...............: avg=43.69µs  min=4.82µs  med=8.89µs  max=114.98ms p(90)=17.46µs p(95)=82.16µs p(99.9)=4.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.47ms  min=1.5ms   med=16.39ms max=340.82ms p(90)=31.86ms p(95)=38.93ms p(99.9)=144.77ms
     http_reqs......................: 295592  2459.053314/s
     iteration_duration.............: avg=20.29ms  min=2.72ms  med=17.11ms max=341.08ms p(90)=33.07ms p(95)=40.28ms p(99.9)=147.46ms
     iterations.....................: 295492  2458.221406/s
     success_rate...................: 100.00% ✓ 295492      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 883980      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 354 MB  2.9 MB/s
     http_req_blocked...............: avg=2.87µs   min=921ns   med=2.09µs  max=14.14ms  p(90)=3.59µs  p(95)=4.32µs  p(99.9)=33.9µs  
     http_req_connecting............: avg=347ns    min=0s      med=0s      max=3.64ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.13ms  min=1.65ms  med=17.01ms max=343.09ms p(90)=32.75ms p(95)=39.93ms p(99.9)=144.91ms
       { expected_response:true }...: avg=20.13ms  min=1.65ms  med=17.01ms max=343.09ms p(90)=32.75ms p(95)=39.93ms p(99.9)=144.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 294760
     http_req_receiving.............: avg=568.27µs min=52.68µs med=95.97µs max=186.9ms  p(90)=1.08ms  p(95)=1.87ms  p(99.9)=26.32ms 
     http_req_sending...............: avg=42.51µs  min=4.78µs  med=9.01µs  max=150.92ms p(90)=18.04µs p(95)=80.33µs p(99.9)=3.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.52ms  min=1.47ms  med=16.5ms  max=343ms    p(90)=31.74ms p(95)=38.77ms p(99.9)=143.17ms
     http_reqs......................: 294760  2452.035845/s
     iteration_duration.............: avg=20.35ms  min=2.82ms  med=17.21ms max=343.29ms p(90)=32.98ms p(95)=40.17ms p(99.9)=147.49ms
     iterations.....................: 294660  2451.20397/s
     success_rate...................: 100.00% ✓ 294660      ✗ 0     
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

     checks.........................: 100.00% ✓ 871038      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=4.03µs  min=932ns   med=2.18µs  max=15.24ms  p(90)=3.63µs  p(95)=4.32µs   p(99.9)=35.32µs
     http_req_connecting............: avg=1.46µs  min=0s      med=0s      max=15.21ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.44ms min=1.73ms  med=20.25ms max=266.43ms p(90)=28.54ms p(95)=30.87ms  p(99.9)=48.17ms
       { expected_response:true }...: avg=20.44ms min=1.73ms  med=20.25ms max=266.43ms p(90)=28.54ms p(95)=30.87ms  p(99.9)=48.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290446
     http_req_receiving.............: avg=82.54µs min=26.07µs med=51.27µs max=70.01ms  p(90)=88.31µs p(95)=114.37µs p(99.9)=5.44ms 
     http_req_sending...............: avg=37.5µs  min=4.46µs  med=9.54µs  max=168.85ms p(90)=16.04µs p(95)=28.32µs  p(99.9)=2.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.32ms min=1.68ms  med=20.14ms max=252.4ms  p(90)=28.42ms p(95)=30.73ms  p(99.9)=47.14ms
     http_reqs......................: 290446  2415.973821/s
     iteration_duration.............: avg=20.65ms min=2.61ms  med=20.44ms max=301.82ms p(90)=28.74ms p(95)=31.08ms  p(99.9)=48.61ms
     iterations.....................: 290346  2415.142006/s
     success_rate...................: 100.00% ✓ 290346      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 801225      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=3.58µs   min=1µs     med=2.78µs   max=6.73ms   p(90)=4.36µs  p(95)=5.09µs  p(99.9)=39.98µs 
     http_req_connecting............: avg=370ns    min=0s      med=0s       max=3.77ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.22ms  min=1.92ms  med=18.53ms  max=328.52ms p(90)=36.56ms p(95)=45.49ms p(99.9)=155.86ms
       { expected_response:true }...: avg=22.22ms  min=1.92ms  med=18.53ms  max=328.52ms p(90)=36.56ms p(95)=45.49ms p(99.9)=155.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267175
     http_req_receiving.............: avg=626.55µs min=53.18µs med=105.22µs max=177.15ms p(90)=1.13ms  p(95)=1.98ms  p(99.9)=31.37ms 
     http_req_sending...............: avg=46.17µs  min=4.91µs  med=10.62µs  max=141.91ms p(90)=18.97µs p(95)=88.69µs p(99.9)=3.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.55ms  min=1.82ms  med=17.94ms  max=328.42ms p(90)=35.51ms p(95)=44.15ms p(99.9)=153.9ms 
     http_reqs......................: 267175  2222.005796/s
     iteration_duration.............: avg=22.45ms  min=3.15ms  med=18.75ms  max=328.69ms p(90)=36.8ms  p(95)=45.74ms p(99.9)=156.49ms
     iterations.....................: 267075  2221.174129/s
     success_rate...................: 100.00% ✓ 267075      ✗ 0     
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

     checks.........................: 100.00% ✓ 571650      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.59µs  min=902ns   med=2.59µs  max=3.32ms   p(90)=4.92µs   p(95)=6.03µs   p(99.9)=44.51µs
     http_req_connecting............: avg=447ns   min=0s      med=0s      max=3.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.22ms min=2.29ms  med=30.66ms max=300.26ms p(90)=41.17ms  p(95)=44.74ms  p(99.9)=66.59ms
       { expected_response:true }...: avg=31.22ms min=2.29ms  med=30.66ms max=300.26ms p(90)=41.17ms  p(95)=44.74ms  p(99.9)=66.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190650
     http_req_receiving.............: avg=98.57µs min=26.67µs med=58.77µs max=60ms     p(90)=130.66µs p(95)=212.56µs p(99.9)=3.65ms 
     http_req_sending...............: avg=42.41µs min=4.93µs  med=10.3µs  max=164.53ms p(90)=25.01µs  p(95)=113.95µs p(99.9)=2.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.08ms min=2.2ms   med=30.53ms max=299.48ms p(90)=41.02ms  p(95)=44.58ms  p(99.9)=65.39ms
     http_reqs......................: 190650  1584.824176/s
     iteration_duration.............: avg=31.47ms min=6.47ms  med=30.89ms max=310.33ms p(90)=41.4ms   p(95)=44.97ms  p(99.9)=66.97ms
     iterations.....................: 190550  1583.992902/s
     success_rate...................: 100.00% ✓ 190550      ✗ 0     
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

     checks.........................: 100.00% ✓ 426723      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.81µs  min=992ns   med=2.93µs  max=3.77ms   p(90)=4.57µs   p(95)=5.29µs   p(99.9)=37.26µs 
     http_req_connecting............: avg=566ns   min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.91ms min=2.24ms  med=41.51ms max=283.03ms p(90)=58.24ms  p(95)=63.26ms  p(99.9)=87.73ms 
       { expected_response:true }...: avg=41.91ms min=2.24ms  med=41.51ms max=283.03ms p(90)=58.24ms  p(95)=63.26ms  p(99.9)=87.73ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142341
     http_req_receiving.............: avg=84.04µs min=28.67µs med=71.63µs max=131.98ms p(90)=112.98µs p(95)=130.56µs p(99.9)=861.79µs
     http_req_sending...............: avg=26.45µs min=5.1µs   med=12.81µs max=65.49ms  p(90)=19.53µs  p(95)=23.16µs  p(99.9)=1.03ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.8ms  min=2.15ms  med=41.4ms  max=282.18ms p(90)=58.13ms  p(95)=63.14ms  p(99.9)=87.66ms 
     http_reqs......................: 142341  1183.184758/s
     iteration_duration.............: avg=42.17ms min=4.61ms  med=41.74ms max=308.53ms p(90)=58.47ms  p(95)=63.49ms  p(99.9)=88.1ms  
     iterations.....................: 142241  1182.353525/s
     success_rate...................: 100.00% ✓ 142241      ✗ 0     
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

     checks.........................: 100.00% ✓ 211665     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   704 kB/s
     http_req_blocked...............: avg=4.31µs   min=1.05µs  med=2.84µs  max=4.01ms   p(90)=4.33µs   p(95)=4.93µs   p(99.9)=46.38µs 
     http_req_connecting............: avg=1.26µs   min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.68ms  min=3.89ms  med=83.04ms max=331.26ms p(90)=103.35ms p(95)=113.21ms p(99.9)=197.6ms 
       { expected_response:true }...: avg=84.68ms  min=3.89ms  med=83.04ms max=331.26ms p(90)=103.35ms p(95)=113.21ms p(99.9)=197.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 70655
     http_req_receiving.............: avg=117.51µs min=28.14µs med=73.17µs max=245.09ms p(90)=109.23µs p(95)=122.14µs p(99.9)=670.61µs
     http_req_sending...............: avg=21.99µs  min=4.96µs  med=14.06µs max=112.83ms p(90)=20.76µs  p(95)=22.9µs   p(99.9)=562.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.54ms  min=3.82ms  med=82.93ms max=331.05ms p(90)=103.2ms  p(95)=113.04ms p(99.9)=195.54ms
     http_reqs......................: 70655   586.23996/s
     iteration_duration.............: avg=85.04ms  min=8.42ms  med=83.28ms max=341.53ms p(90)=103.61ms p(95)=113.49ms p(99.9)=199.18ms
     iterations.....................: 70555   585.410238/s
     success_rate...................: 100.00% ✓ 70555      ✗ 0    
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

     checks.........................: 100.00% ✓ 96936      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   322 kB/s
     http_req_blocked...............: avg=6.97µs   min=1.27µs  med=3.66µs   max=3.75ms   p(90)=5.04µs   p(95)=5.63µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=3.04µs   min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=184.95ms min=7.86ms  med=187.14ms max=376.14ms p(90)=197.83ms p(95)=202.79ms p(99.9)=269.47ms
       { expected_response:true }...: avg=184.95ms min=7.86ms  med=187.14ms max=376.14ms p(90)=197.83ms p(95)=202.79ms p(99.9)=269.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32412
     http_req_receiving.............: avg=96.93µs  min=35.73µs med=90.16µs  max=56.08ms  p(90)=121.91µs p(95)=134.72µs p(99.9)=508.42µs
     http_req_sending...............: avg=28.57µs  min=5.67µs  med=18.09µs  max=71.51ms  p(90)=22.77µs  p(95)=24.68µs  p(99.9)=467.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.82ms min=7.76ms  med=187.02ms max=375.78ms p(90)=197.72ms p(95)=202.67ms p(99.9)=269.36ms
     http_reqs......................: 32412   267.916018/s
     iteration_duration.............: avg=185.79ms min=81.44ms med=187.43ms max=389.36ms p(90)=198.14ms p(95)=203.08ms p(99.9)=271.18ms
     iterations.....................: 32312   267.089422/s
     success_rate...................: 100.00% ✓ 32312      ✗ 0    
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

     checks.........................: 100.00% ✓ 94047      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.71µs   min=1.42µs  med=3.54µs   max=4.07ms   p(90)=4.92µs   p(95)=5.56µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.31ms  
     http_req_duration..............: avg=190.62ms min=6.32ms  med=175.04ms max=622.56ms p(90)=223.55ms p(95)=273.91ms p(99.9)=565.45ms
       { expected_response:true }...: avg=190.62ms min=6.32ms  med=175.04ms max=622.56ms p(90)=223.55ms p(95)=273.91ms p(99.9)=565.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31449
     http_req_receiving.............: avg=94.93µs  min=37.72µs med=91.06µs  max=11.05ms  p(90)=121.16µs p(95)=132.37µs p(99.9)=413.27µs
     http_req_sending...............: avg=28.9µs   min=6.81µs  med=18.25µs  max=76.47ms  p(90)=22.99µs  p(95)=24.79µs  p(99.9)=535.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.49ms min=6.21ms  med=174.93ms max=622.47ms p(90)=223.43ms p(95)=273.8ms  p(99.9)=565.35ms
     http_reqs......................: 31449   260.180119/s
     iteration_duration.............: avg=191.5ms  min=41.27ms med=175.42ms max=622.78ms p(90)=223.99ms p(95)=276.57ms p(99.9)=565.83ms
     iterations.....................: 31349   259.352811/s
     success_rate...................: 100.00% ✓ 31349      ✗ 0    
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

     checks.........................: 100.00% ✓ 7602      ✗ 0   
     data_received..................: 252 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=33.79µs  min=1.78µs   med=4.01µs   max=5.83ms  p(90)=5.69µs   p(95)=6.53µs   p(99.9)=3.6ms 
     http_req_connecting............: avg=28.09µs  min=0s       med=0s       max=5.81ms  p(90)=0s       p(95)=0s       p(99.9)=3.47ms
     http_req_duration..............: avg=2.3s     min=24.81ms  med=2.34s    max=4.42s   p(90)=3.01s    p(95)=3.25s    p(99.9)=4.14s 
       { expected_response:true }...: avg=2.3s     min=24.81ms  med=2.34s    max=4.42s   p(90)=3.01s    p(95)=3.25s    p(99.9)=4.14s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2634
     http_req_receiving.............: avg=112.05µs min=32.9µs   med=100.31µs max=6.9ms   p(90)=146.57µs p(95)=166.35µs p(99.9)=1.92ms
     http_req_sending...............: avg=43.27µs  min=7.61µs   med=20.46µs  max=13.05ms p(90)=26.49µs  p(95)=30.3µs   p(99.9)=2.99ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.3s     min=24.71ms  med=2.34s    max=4.42s   p(90)=3.01s    p(95)=3.25s    p(99.9)=4.14s 
     http_reqs......................: 2634    20.975673/s
     iteration_duration.............: avg=2.39s    min=666.97ms med=2.36s    max=4.42s   p(90)=3.03s    p(95)=3.26s    p(99.9)=4.14s 
     iterations.....................: 2534    20.17933/s
     success_rate...................: 100.00% ✓ 2534      ✗ 0   
     vus............................: 34      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

