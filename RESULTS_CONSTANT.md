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
| hive-router | v0.0.84 | 3,111 | 3,346 | 3,073 | 3.0% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,679 | 2,831 | 2,668 | 2.1% |  |
| fusion-nightly | 16.6.0-p.3 | 2,658 | 2,750 | 2,643 | 1.4% |  |
| fusion | 16.5.1 | 2,575 | 2,683 | 2,566 | 1.6% |  |
| grafbase | 0.53.5 | 2,224 | 2,328 | 2,210 | 1.8% |  |
| cosmo | 0.334.0 | 1,329 | 1,367 | 1,322 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.8 | 616 | 635 | 614 | 1.1% |  |
| apollo-router | v2.16.1 | 485 | 504 | 481 | 1.6% |  |
| hive-gateway | 2.10.8 | 283 | 290 | 281 | 1.0% |  |
| apollo-gateway | 2.14.3 | 279 | 284 | 277 | 0.7% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1531 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.6.0-p.3 | 2,462 | 2,575 | 2,457 | 1.7% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,423 | 2,542 | 2,413 | 1.9% |  |
| hive-router | v0.0.84 | 2,411 | 2,631 | 2,388 | 3.5% |  |
| fusion | 16.5.1 | 2,320 | 2,442 | 2,309 | 2.0% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 2,177 | 2,282 | 2,165 | 2.2% |  |
| grafbase | 0.53.5 | 1,619 | 1,671 | 1,614 | 1.2% |  |
| cosmo | 0.334.0 | 1,241 | 1,288 | 1,232 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 580 | 598 | 577 | 1.5% |  |
| apollo-router | v2.16.1 | 412 | 440 | 405 | 2.9% |  |
| apollo-gateway | 2.14.3 | 268 | 272 | 268 | 0.5% |  |
| hive-gateway | 2.10.8 | 262 | 271 | 262 | 1.3% |  |
| feddi | 5ff8b6165878 | 23 | 24 | 23 | 2.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1121562     ✗ 0     
     data_received..................: 33 GB   273 MB/s
     data_sent......................: 449 MB  3.7 MB/s
     http_req_blocked...............: avg=2.6µs   min=822ns   med=1.87µs  max=17.96ms  p(90)=3.09µs  p(95)=3.71µs   p(99.9)=29.17µs
     http_req_connecting............: avg=232ns   min=0s      med=0s      max=17.66ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.84ms min=1.38ms  med=15.18ms max=280.92ms p(90)=23.23ms p(95)=26.29ms  p(99.9)=45.63ms
       { expected_response:true }...: avg=15.84ms min=1.38ms  med=15.18ms max=280.92ms p(90)=23.23ms p(95)=26.29ms  p(99.9)=45.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 373954
     http_req_receiving.............: avg=81.23µs min=23.93µs med=43.29µs max=113.66ms p(90)=78.56µs p(95)=137.77µs p(99.9)=6.71ms 
     http_req_sending...............: avg=48.29µs min=4.47µs  med=8.06µs  max=167.17ms p(90)=13.73µs p(95)=87.93µs  p(99.9)=6.55ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.71ms min=1.3ms   med=15.08ms max=280.75ms p(90)=23.07ms p(95)=26.06ms  p(99.9)=44.35ms
     http_reqs......................: 373954  3111.768933/s
     iteration_duration.............: avg=16.04ms min=1.96ms  med=15.37ms max=292.62ms p(90)=23.42ms p(95)=26.51ms  p(99.9)=46.45ms
     iterations.....................: 373854  3110.936807/s
     success_rate...................: 100.00% ✓ 373854      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 966468      ✗ 0     
     data_received..................: 28 GB   235 MB/s
     data_sent......................: 387 MB  3.2 MB/s
     http_req_blocked...............: avg=3.12µs   min=922ns   med=2.3µs    max=17.18ms  p(90)=3.68µs  p(95)=4.3µs   p(99.9)=34.38µs
     http_req_connecting............: avg=293ns    min=0s      med=0s       max=4ms      p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.4ms   min=1.93ms  med=17.5ms   max=279.03ms p(90)=26.36ms p(95)=29.98ms p(99.9)=50.57ms
       { expected_response:true }...: avg=18.4ms   min=1.93ms  med=17.5ms   max=279.03ms p(90)=26.36ms p(95)=29.98ms p(99.9)=50.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 322256
     http_req_receiving.............: avg=664.57µs min=51.84µs med=104.14µs max=222.49ms p(90)=1.69ms  p(95)=2.56ms  p(99.9)=20.42ms
     http_req_sending...............: avg=48.28µs  min=4.59µs  med=8.71µs   max=165.53ms p(90)=16.19µs p(95)=95.75µs p(99.9)=5.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.68ms  min=1.85ms  med=16.8ms   max=278.28ms p(90)=25.48ms p(95)=29.05ms p(99.9)=48.84ms
     http_reqs......................: 322256  2679.766716/s
     iteration_duration.............: avg=18.61ms  min=2.89ms  med=17.7ms   max=308.37ms p(90)=26.58ms p(95)=30.21ms p(99.9)=51.28ms
     iterations.....................: 322156  2678.935152/s
     success_rate...................: 100.00% ✓ 322156      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 958737      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 384 MB  3.2 MB/s
     http_req_blocked...............: avg=2.71µs   min=901ns   med=1.86µs  max=17.27ms  p(90)=3.06µs  p(95)=3.63µs  p(99.9)=31.66µs 
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=4.09ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.56ms  min=2.03ms  med=16.02ms max=296.67ms p(90)=30.1ms  p(95)=36.37ms p(99.9)=118.89ms
       { expected_response:true }...: avg=18.56ms  min=2.03ms  med=16.02ms max=296.67ms p(90)=30.1ms  p(95)=36.37ms p(99.9)=118.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 319679
     http_req_receiving.............: avg=548.19µs min=50.67µs med=88.2µs  max=144.64ms p(90)=1.04ms  p(95)=1.87ms  p(99.9)=25.2ms  
     http_req_sending...............: avg=42.73µs  min=4.4µs   med=7.98µs  max=94.31ms  p(90)=14.05µs p(95)=81.28µs p(99.9)=4.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=17.97ms  min=1.9ms   med=15.51ms max=280.76ms p(90)=29.15ms p(95)=35.28ms p(99.9)=117.61ms
     http_reqs......................: 319679  2658.409395/s
     iteration_duration.............: avg=18.76ms  min=2.97ms  med=16.21ms max=306.34ms p(90)=30.32ms p(95)=36.6ms  p(99.9)=119.81ms
     iterations.....................: 319579  2657.577807/s
     success_rate...................: 100.00% ✓ 319579      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 928956      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=3.02µs   min=982ns   med=2.25µs  max=13.99ms  p(90)=3.48µs  p(95)=4.06µs  p(99.9)=34.26µs 
     http_req_connecting............: avg=264ns    min=0s      med=0s      max=3.23ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.15ms  min=2.06ms  med=16.47ms max=292.59ms p(90)=31.32ms p(95)=37.86ms p(99.9)=121.51ms
       { expected_response:true }...: avg=19.15ms  min=2.06ms  med=16.47ms max=292.59ms p(90)=31.32ms p(95)=37.86ms p(99.9)=121.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309752
     http_req_receiving.............: avg=559.99µs min=51.09µs med=89.71µs max=208.22ms p(90)=1.06ms  p(95)=1.91ms  p(99.9)=25.26ms 
     http_req_sending...............: avg=44.93µs  min=4.7µs   med=8.58µs  max=234.88ms p(90)=14.87µs p(95)=85.35µs p(99.9)=4.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.55ms  min=1.96ms  med=15.95ms max=292.51ms p(90)=30.39ms p(95)=36.84ms p(99.9)=120.5ms 
     http_reqs......................: 309752  2575.638276/s
     iteration_duration.............: avg=19.36ms  min=3.15ms  med=16.66ms max=300.76ms p(90)=31.54ms p(95)=38.1ms  p(99.9)=122.34ms
     iterations.....................: 309652  2574.80676/s
     success_rate...................: 100.00% ✓ 309652      ✗ 0     
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

     checks.........................: 100.00% ✓ 801822      ✗ 0     
     data_received..................: 24 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=3.45µs  min=1.04µs  med=2.61µs  max=18.53ms  p(90)=4.17µs  p(95)=4.93µs   p(99.9)=40.74µs
     http_req_connecting............: avg=311ns   min=0s      med=0s      max=3.32ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.21ms min=1.68ms  med=21.98ms max=296.19ms p(90)=26.47ms p(95)=28.39ms  p(99.9)=49.11ms
       { expected_response:true }...: avg=22.21ms min=1.68ms  med=21.98ms max=296.19ms p(90)=26.47ms p(95)=28.39ms  p(99.9)=49.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267374
     http_req_receiving.............: avg=96.13µs min=28.16µs med=57.41µs max=177.69ms p(90)=98.44µs p(95)=133.92µs p(99.9)=7.36ms 
     http_req_sending...............: avg=40.73µs min=4.98µs  med=10.71µs max=188.47ms p(90)=18.52µs p(95)=73.33µs  p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.07ms min=1.6ms   med=21.87ms max=270.43ms p(90)=26.33ms p(95)=28.2ms   p(99.9)=48.06ms
     http_reqs......................: 267374  2224.089063/s
     iteration_duration.............: avg=22.43ms min=3.55ms  med=22.18ms max=305.24ms p(90)=26.68ms p(95)=28.62ms  p(99.9)=49.6ms 
     iterations.....................: 267274  2223.257236/s
     success_rate...................: 100.00% ✓ 267274      ✗ 0     
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

     checks.........................: 100.00% ✓ 479367      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.27µs  min=922ns  med=2.04µs  max=6.4ms    p(90)=3.52µs  p(95)=4.15µs   p(99.9)=26.7µs  
     http_req_connecting............: avg=878ns   min=0s     med=0s      max=6.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.32ms min=1.97ms med=36.89ms max=273.4ms  p(90)=52.18ms p(95)=56.76ms  p(99.9)=78.03ms 
       { expected_response:true }...: avg=37.32ms min=1.97ms med=36.89ms max=273.4ms  p(90)=52.18ms p(95)=56.76ms  p(99.9)=78.03ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159889
     http_req_receiving.............: avg=77.73µs min=25.3µs med=55.89µs max=162.26ms p(90)=91.2µs  p(95)=106.18µs p(99.9)=874.69µs
     http_req_sending...............: avg=21.03µs min=4.5µs  med=9.63µs  max=52.18ms  p(90)=16.54µs p(95)=20.14µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.22ms min=1.88ms med=36.81ms max=269ms    p(90)=52.08ms p(95)=56.66ms  p(99.9)=77.17ms 
     http_reqs......................: 159889  1329.505433/s
     iteration_duration.............: avg=37.54ms min=3.59ms med=37.09ms max=297.47ms p(90)=52.38ms p(95)=56.95ms  p(99.9)=78.43ms 
     iterations.....................: 159789  1328.673915/s
     success_rate...................: 100.00% ✓ 159789      ✗ 0     
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

     checks.........................: 100.00% ✓ 222693     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   741 kB/s
     http_req_blocked...............: avg=4.67µs   min=1.13µs  med=2.99µs  max=4.05ms   p(90)=4.45µs   p(95)=5.09µs   p(99.9)=44.54µs 
     http_req_connecting............: avg=1.41µs   min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.49ms  min=3.59ms  med=79.01ms max=334.26ms p(90)=99.49ms  p(95)=109.07ms p(99.9)=187.63ms
       { expected_response:true }...: avg=80.49ms  min=3.59ms  med=79.01ms max=334.26ms p(90)=99.49ms  p(95)=109.07ms p(99.9)=187.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74331
     http_req_receiving.............: avg=125.95µs min=29.29µs med=69.5µs  max=241.42ms p(90)=104.81µs p(95)=117.36µs p(99.9)=842.63µs
     http_req_sending...............: avg=24.54µs  min=5.32µs  med=13.21µs max=177ms    p(90)=19.71µs  p(95)=22.01µs  p(99.9)=623.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.34ms  min=3.5ms   med=78.91ms max=279.88ms p(90)=99.35ms  p(95)=108.83ms p(99.9)=184.43ms
     http_reqs......................: 74331   616.994266/s
     iteration_duration.............: avg=80.83ms  min=11.16ms med=79.25ms max=343.55ms p(90)=99.73ms  p(95)=109.34ms p(99.9)=188.41ms
     iterations.....................: 74231   616.164203/s
     success_rate...................: 100.00% ✓ 74231      ✗ 0    
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

     checks.........................: 100.00% ✓ 175260     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   583 kB/s
     http_req_blocked...............: avg=5.23µs   min=1.13µs  med=3.38µs   max=4.17ms   p(90)=4.85µs   p(95)=5.45µs   p(99.9)=51.89µs 
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.28ms min=4.51ms  med=102.11ms max=340.45ms p(90)=123.3ms  p(95)=129.59ms p(99.9)=159.73ms
       { expected_response:true }...: avg=102.28ms min=4.51ms  med=102.11ms max=340.45ms p(90)=123.3ms  p(95)=129.59ms p(99.9)=159.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58520
     http_req_receiving.............: avg=85.98µs  min=26.21µs med=76.88µs  max=187.06ms p(90)=109.26µs p(95)=121.66µs p(99.9)=582.17µs
     http_req_sending...............: avg=28.38µs  min=5.68µs  med=16.32µs  max=136.61ms p(90)=22.13µs  p(95)=24.14µs  p(99.9)=576.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.17ms min=4.44ms  med=102ms    max=339.82ms p(90)=123.19ms p(95)=129.47ms p(99.9)=158.52ms
     http_reqs......................: 58520   485.260845/s
     iteration_duration.............: avg=102.73ms min=18.5ms  med=102.38ms max=359.98ms p(90)=123.56ms p(95)=129.88ms p(99.9)=162.85ms
     iterations.....................: 58420   484.431623/s
     success_rate...................: 100.00% ✓ 58420      ✗ 0    
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

     checks.........................: 100.00% ✓ 102552     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=7.14µs   min=1.63µs  med=3.77µs   max=4.45ms   p(90)=5.27µs   p(95)=5.91µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=3.09µs   min=0s      med=0s       max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=174.85ms min=5.72ms  med=158.84ms max=894.05ms p(90)=204.55ms p(95)=240.28ms p(99.9)=596.39ms
       { expected_response:true }...: avg=174.85ms min=5.72ms  med=158.84ms max=894.05ms p(90)=204.55ms p(95)=240.28ms p(99.9)=596.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34284
     http_req_receiving.............: avg=96.28µs  min=37.56µs med=91.82µs  max=15.49ms  p(90)=122.78µs p(95)=135.56µs p(99.9)=696.29µs
     http_req_sending...............: avg=25.69µs  min=6.51µs  med=18.68µs  max=34.52ms  p(90)=23.58µs  p(95)=25.46µs  p(99.9)=536.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.73ms min=5.59ms  med=158.73ms max=893.93ms p(90)=204.43ms p(95)=240.19ms p(99.9)=596.26ms
     http_reqs......................: 34284   283.492039/s
     iteration_duration.............: avg=175.64ms min=41.32ms med=159.22ms max=894.31ms p(90)=204.91ms p(95)=241.02ms p(99.9)=596.8ms 
     iterations.....................: 34184   282.665146/s
     success_rate...................: 100.00% ✓ 34184      ✗ 0    
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

     checks.........................: 100.00% ✓ 101106     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=5.85µs   min=1.09µs  med=2.95µs   max=4.09ms   p(90)=4.24µs   p(95)=4.74µs   p(99.9)=1.19ms  
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=177.33ms min=7.57ms  med=176.01ms max=391.2ms  p(90)=187.03ms p(95)=191.13ms p(99.9)=262.25ms
       { expected_response:true }...: avg=177.33ms min=7.57ms  med=176.01ms max=391.2ms  p(90)=187.03ms p(95)=191.13ms p(99.9)=262.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33802
     http_req_receiving.............: avg=90µs     min=31.39µs med=81.54µs  max=94.81ms  p(90)=111.2µs  p(95)=122.28µs p(99.9)=431.97µs
     http_req_sending...............: avg=36.41µs  min=5.27µs  med=15.73µs  max=177.15ms p(90)=20.12µs  p(95)=21.7µs   p(99.9)=512.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.2ms  min=7.45ms  med=175.91ms max=391.03ms p(90)=186.93ms p(95)=191.01ms p(99.9)=261.69ms
     http_reqs......................: 33802   279.541882/s
     iteration_duration.............: avg=178.11ms min=51.08ms med=176.31ms max=402.7ms  p(90)=187.28ms p(95)=191.41ms p(99.9)=272.73ms
     iterations.....................: 33702   278.714884/s
     success_rate...................: 100.00% ✓ 33702      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 887751      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=2.85µs   min=831ns   med=2µs     max=16.38ms  p(90)=3.62µs  p(95)=4.37µs  p(99.9)=34.95µs 
     http_req_connecting............: avg=317ns    min=0s      med=0s      max=3.62ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.05ms  min=1.57ms  med=16.81ms max=405.32ms p(90)=32.99ms p(95)=40.4ms  p(99.9)=144.74ms
       { expected_response:true }...: avg=20.05ms  min=1.57ms  med=16.81ms max=405.32ms p(90)=32.99ms p(95)=40.4ms  p(99.9)=144.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296017
     http_req_receiving.............: avg=577.52µs min=48.77µs med=90.98µs max=231.63ms p(90)=1.09ms  p(95)=1.92ms  p(99.9)=27.54ms 
     http_req_sending...............: avg=41.56µs  min=4.3µs   med=8.35µs  max=110.62ms p(90)=16.64µs p(95)=78.52µs p(99.9)=3.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.43ms  min=1.46ms  med=16.29ms max=405.24ms p(90)=31.96ms p(95)=39.18ms p(99.9)=143.16ms
     http_reqs......................: 296017  2462.759935/s
     iteration_duration.............: avg=20.26ms  min=2.58ms  med=17.01ms max=405.51ms p(90)=33.21ms p(95)=40.63ms p(99.9)=146.38ms
     iterations.....................: 295917  2461.927969/s
     success_rate...................: 100.00% ✓ 295917      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 873558      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=2.83µs   min=862ns   med=1.98µs   max=14.42ms  p(90)=3.41µs  p(95)=4.11µs  p(99.9)=30.79µs
     http_req_connecting............: avg=327ns    min=0s      med=0s       max=3.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.37ms  min=1.59ms  med=19.52ms  max=295.52ms p(90)=29.29ms p(95)=32.86ms p(99.9)=54.1ms 
       { expected_response:true }...: avg=20.37ms  min=1.59ms  med=19.52ms  max=295.52ms p(90)=29.29ms p(95)=32.86ms p(99.9)=54.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 291286
     http_req_receiving.............: avg=800.13µs min=50.97µs med=127.41µs max=129.19ms p(90)=2ms     p(95)=2.96ms  p(99.9)=21.31ms
     http_req_sending...............: avg=42.61µs  min=4.65µs  med=8.5µs    max=122.27ms p(90)=17.78µs p(95)=78.21µs p(99.9)=3.43ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.53ms  min=1.47ms  med=18.67ms  max=271.84ms p(90)=28.3ms  p(95)=31.81ms p(99.9)=51.95ms
     http_reqs......................: 291286  2423.250721/s
     iteration_duration.............: avg=20.59ms  min=2.98ms  med=19.73ms  max=304.13ms p(90)=29.5ms  p(95)=33.09ms p(99.9)=54.79ms
     iterations.....................: 291186  2422.418807/s
     success_rate...................: 100.00% ✓ 291186      ✗ 0     
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

     checks.........................: 100.00% ✓ 869409      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=3.55µs  min=1.06µs  med=2.69µs  max=14.79ms  p(90)=4.25µs  p(95)=4.96µs   p(99.9)=38.59µs
     http_req_connecting............: avg=333ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.48ms min=1.68ms  med=20.31ms max=298.24ms p(90)=28.47ms p(95)=30.87ms  p(99.9)=49.08ms
       { expected_response:true }...: avg=20.48ms min=1.68ms  med=20.31ms max=298.24ms p(90)=28.47ms p(95)=30.87ms  p(99.9)=49.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289903
     http_req_receiving.............: avg=86.25µs min=27.35µs med=53.4µs  max=48.88ms  p(90)=91.37µs p(95)=121.12µs p(99.9)=5.71ms 
     http_req_sending...............: avg=40.92µs min=4.79µs  med=10.31µs max=163.34ms p(90)=17.03µs p(95)=49.91µs  p(99.9)=2.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.35ms min=1.6ms   med=20.19ms max=291.28ms p(90)=28.34ms p(95)=30.69ms  p(99.9)=48.11ms
     http_reqs......................: 289903  2411.383361/s
     iteration_duration.............: avg=20.69ms min=3.2ms   med=20.51ms max=308ms    p(90)=28.68ms p(95)=31.09ms  p(99.9)=49.58ms
     iterations.....................: 289803  2410.551572/s
     success_rate...................: 100.00% ✓ 289803      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 836658      ✗ 0     
     data_received..................: 25 GB   203 MB/s
     data_sent......................: 335 MB  2.8 MB/s
     http_req_blocked...............: avg=3.38µs   min=942ns   med=2.61µs   max=15.73ms  p(90)=4.03µs  p(95)=4.71µs  p(99.9)=38.79µs 
     http_req_connecting............: avg=315ns    min=0s      med=0s       max=3.54ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.28ms  min=1.6ms   med=17.74ms  max=330.4ms  p(90)=35.02ms p(95)=43.01ms p(99.9)=156.2ms 
       { expected_response:true }...: avg=21.28ms  min=1.6ms   med=17.74ms  max=330.4ms  p(90)=35.02ms p(95)=43.01ms p(99.9)=156.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 278986
     http_req_receiving.............: avg=630.16µs min=52.72µs med=101.66µs max=160.52ms p(90)=1.15ms  p(95)=2ms     p(99.9)=29.32ms 
     http_req_sending...............: avg=46.2µs   min=5.08µs  med=9.93µs   max=256.77ms p(90)=17.42µs p(95)=90.99µs p(99.9)=3.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.6ms   min=1.48ms  med=17.16ms  max=330.05ms p(90)=33.95ms p(95)=41.72ms p(99.9)=154.23ms
     http_reqs......................: 278986  2320.815849/s
     iteration_duration.............: avg=21.5ms   min=2.63ms  med=17.95ms  max=330.59ms p(90)=35.24ms p(95)=43.24ms p(99.9)=157.06ms
     iterations.....................: 278886  2319.983974/s
     success_rate...................: 100.00% ✓ 278886      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 785406      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=3.19µs   min=862ns   med=2.18µs   max=16.2ms   p(90)=3.99µs  p(95)=4.77µs  p(99.9)=32.88µs 
     http_req_connecting............: avg=356ns    min=0s      med=0s       max=4.21ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.68ms  min=2ms     med=19.01ms  max=390.95ms p(90)=36.54ms p(95)=45.2ms  p(99.9)=167.78ms
       { expected_response:true }...: avg=22.68ms  min=2ms     med=19.01ms  max=390.95ms p(90)=36.54ms p(95)=45.2ms  p(99.9)=167.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261902
     http_req_receiving.............: avg=612.37µs min=51.12µs med=103.22µs max=213.91ms p(90)=1.16ms  p(95)=1.93ms  p(99.9)=29.02ms 
     http_req_sending...............: avg=38.23µs  min=4.65µs  med=9.25µs   max=101.99ms p(90)=19.17µs p(95)=42.27µs p(99.9)=2.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.03ms  min=1.88ms  med=18.44ms  max=390.86ms p(90)=35.52ms p(95)=44.03ms p(99.9)=165.77ms
     http_reqs......................: 261902  2177.683814/s
     iteration_duration.............: avg=22.91ms  min=3.41ms  med=19.21ms  max=391.13ms p(90)=36.77ms p(95)=45.43ms p(99.9)=168.66ms
     iterations.....................: 261802  2176.852326/s
     success_rate...................: 100.00% ✓ 261802      ✗ 0     
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

     checks.........................: 100.00% ✓ 584133      ✗ 0     
     data_received..................: 17 GB   142 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=4.14µs   min=1.06µs  med=3µs     max=8.08ms   p(90)=5.23µs   p(95)=6.3µs    p(99.9)=47.73µs
     http_req_connecting............: avg=539ns    min=0s      med=0s      max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.54ms  min=2.32ms  med=29.98ms max=312.32ms p(90)=40.5ms   p(95)=44.06ms  p(99.9)=67.5ms 
       { expected_response:true }...: avg=30.54ms  min=2.32ms  med=29.98ms max=312.32ms p(90)=40.5ms   p(95)=44.06ms  p(99.9)=67.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 194811
     http_req_receiving.............: avg=104.19µs min=27.83µs med=60.74µs max=61.43ms  p(90)=134.26µs p(95)=226.05µs p(99.9)=4.86ms 
     http_req_sending...............: avg=43.94µs  min=4.49µs  med=11.16µs max=119.23ms p(90)=25.82µs  p(95)=120.61µs p(99.9)=2.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.39ms  min=2.2ms   med=29.85ms max=283.78ms p(90)=40.34ms  p(95)=43.85ms  p(99.9)=66.57ms
     http_reqs......................: 194811  1619.618534/s
     iteration_duration.............: avg=30.8ms   min=5.08ms  med=30.21ms max=326.91ms p(90)=40.75ms  p(95)=44.3ms   p(99.9)=67.95ms
     iterations.....................: 194711  1618.787155/s
     success_rate...................: 100.00% ✓ 194711      ✗ 0     
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

     checks.........................: 100.00% ✓ 447765      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.28µs  min=952ns   med=2.37µs  max=3.43ms   p(90)=4.02µs  p(95)=4.75µs   p(99.9)=36.5µs  
     http_req_connecting............: avg=573ns   min=0s      med=0s      max=3.39ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.94ms min=2.14ms  med=39.57ms max=308.31ms p(90)=55.19ms p(95)=59.96ms  p(99.9)=83.29ms 
       { expected_response:true }...: avg=39.94ms min=2.14ms  med=39.57ms max=308.31ms p(90)=55.19ms p(95)=59.96ms  p(99.9)=83.29ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149355
     http_req_receiving.............: avg=79.67µs min=27.77µs med=64.32µs max=124.85ms p(90)=104.3µs p(95)=120.89µs p(99.9)=927.44µs
     http_req_sending...............: avg=25.78µs min=4.94µs  med=11.94µs max=93.17ms  p(90)=19.69µs p(95)=23.34µs  p(99.9)=1ms     
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.84ms min=2.03ms  med=39.47ms max=273.45ms p(90)=55.09ms p(95)=59.85ms  p(99.9)=83.12ms 
     http_reqs......................: 149355  1241.577719/s
     iteration_duration.............: avg=40.19ms min=4.25ms  med=39.78ms max=318.38ms p(90)=55.41ms p(95)=60.17ms  p(99.9)=83.92ms 
     iterations.....................: 149255  1240.746426/s
     success_rate...................: 100.00% ✓ 149255      ✗ 0     
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

     checks.........................: 100.00% ✓ 209508     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   697 kB/s
     http_req_blocked...............: avg=4.83µs  min=1.12µs  med=3.2µs   max=3.49ms   p(90)=4.74µs   p(95)=5.43µs   p(99.9)=46.33µs 
     http_req_connecting............: avg=1.36µs  min=0s      med=0s      max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.55ms min=3.93ms  med=83.35ms max=333.47ms p(90)=106.02ms p(95)=116.85ms p(99.9)=203ms   
       { expected_response:true }...: avg=85.55ms min=3.93ms  med=83.35ms max=333.47ms p(90)=106.02ms p(95)=116.85ms p(99.9)=203ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 69936
     http_req_receiving.............: avg=85.22µs min=28.87µs med=74.16µs max=82.76ms  p(90)=110.97µs p(95)=124.69µs p(99.9)=670.84µs
     http_req_sending...............: avg=30.43µs min=5.46µs  med=14.23µs max=243.95ms p(90)=20.83µs  p(95)=23.27µs  p(99.9)=651.85µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.44ms min=3.75ms  med=83.25ms max=333.16ms p(90)=105.89ms p(95)=116.73ms p(99.9)=202.7ms 
     http_reqs......................: 69936   580.294885/s
     iteration_duration.............: avg=85.92ms min=28.85ms med=83.61ms max=346.66ms p(90)=106.3ms  p(95)=117.14ms p(99.9)=205.27ms
     iterations.....................: 69836   579.465134/s
     success_rate...................: 100.00% ✓ 69836      ✗ 0    
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

     checks.........................: 100.00% ✓ 148872     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   495 kB/s
     http_req_blocked...............: avg=5.56µs   min=1.41µs  med=3.49µs   max=3.3ms    p(90)=4.97µs   p(95)=5.58µs   p(99.9)=255.38µs
     http_req_connecting............: avg=1.79µs   min=0s      med=0s       max=3.28ms   p(90)=0s       p(95)=0s       p(99.9)=118.31µs
     http_req_duration..............: avg=120.43ms min=5.12ms  med=118.06ms max=314.41ms p(90)=159.76ms p(95)=171.75ms p(99.9)=219.65ms
       { expected_response:true }...: avg=120.43ms min=5.12ms  med=118.06ms max=314.41ms p(90)=159.76ms p(95)=171.75ms p(99.9)=219.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49724
     http_req_receiving.............: avg=92.02µs  min=32.4µs  med=81.36µs  max=101.6ms  p(90)=112.43µs p(95)=124.69µs p(99.9)=548.52µs
     http_req_sending...............: avg=24.26µs  min=6.19µs  med=17.05µs  max=90.44ms  p(90)=22.79µs  p(95)=24.65µs  p(99.9)=589.77µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.31ms min=4.99ms  med=117.95ms max=313.79ms p(90)=159.64ms p(95)=171.62ms p(99.9)=219.1ms 
     http_reqs......................: 49724   412.084679/s
     iteration_duration.............: avg=120.93ms min=33.85ms med=118.37ms max=322.84ms p(90)=160.08ms p(95)=172.05ms p(99.9)=221.68ms
     iterations.....................: 49624   411.255935/s
     success_rate...................: 100.00% ✓ 49624      ✗ 0    
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

     checks.........................: 100.00% ✓ 97203      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=11.22µs  min=1.41µs  med=3.64µs   max=9.3ms    p(90)=5.05µs   p(95)=5.66µs   p(99.9)=3.1ms   
     http_req_connecting............: avg=7.05µs   min=0s      med=0s       max=9.26ms   p(90)=0s       p(95)=0s       p(99.9)=2.93ms  
     http_req_duration..............: avg=184.44ms min=7.93ms  med=183.52ms max=385.03ms p(90)=198.81ms p(95)=203.67ms p(99.9)=279.79ms
       { expected_response:true }...: avg=184.44ms min=7.93ms  med=183.52ms max=385.03ms p(90)=198.81ms p(95)=203.67ms p(99.9)=279.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32501
     http_req_receiving.............: avg=122.9µs  min=33.96µs med=89.2µs   max=141.67ms p(90)=120.5µs  p(95)=132.51µs p(99.9)=666µs   
     http_req_sending...............: avg=37.36µs  min=6.49µs  med=17.69µs  max=142.17ms p(90)=22.48µs  p(95)=24.38µs  p(99.9)=1.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.28ms min=7.78ms  med=183.4ms  max=383.29ms p(90)=198.68ms p(95)=203.49ms p(99.9)=279.05ms
     http_reqs......................: 32501   268.618295/s
     iteration_duration.............: avg=185.29ms min=40.09ms med=183.83ms max=401.25ms p(90)=199.1ms  p(95)=203.99ms p(99.9)=281.36ms
     iterations.....................: 32401   267.791802/s
     success_rate...................: 100.00% ✓ 32401      ✗ 0    
     vus............................: 5       min=5        max=50 
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

     checks.........................: 100.00% ✓ 94806      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=5.98µs   min=1.15µs  med=3.07µs   max=3.43ms   p(90)=4.39µs   p(95)=4.96µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=189.1ms  min=5.99ms  med=174.69ms max=616.97ms p(90)=219.1ms  p(95)=265.93ms p(99.9)=555.44ms
       { expected_response:true }...: avg=189.1ms  min=5.99ms  med=174.69ms max=616.97ms p(90)=219.1ms  p(95)=265.93ms p(99.9)=555.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31702
     http_req_receiving.............: avg=92.93µs  min=32.34µs med=88.54µs  max=58.84ms  p(90)=117.63µs p(95)=129.07µs p(99.9)=670.34µs
     http_req_sending...............: avg=37.57µs  min=5.4µs   med=17.49µs  max=130.15ms p(90)=21.63µs  p(95)=23.37µs  p(99.9)=465.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.97ms min=5.9ms   med=174.58ms max=616.83ms p(90)=218.97ms p(95)=265.83ms p(99.9)=555.35ms
     http_reqs......................: 31702   262.098986/s
     iteration_duration.............: avg=189.96ms min=35.38ms med=175.02ms max=617.24ms p(90)=219.47ms p(95)=267.6ms  p(99.9)=555.74ms
     iterations.....................: 31602   261.272227/s
     success_rate...................: 100.00% ✓ 31602      ✗ 0    
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

     checks.........................: 100.00% ✓ 8718      ✗ 0   
     data_received..................: 288 MB  2.3 MB/s
     data_sent......................: 3.6 MB  29 kB/s
     http_req_blocked...............: avg=36.72µs  min=1.59µs   med=3.83µs  max=3.42ms  p(90)=5.59µs   p(95)=6.63µs  p(99.9)=3.27ms
     http_req_connecting............: avg=32.2µs   min=0s       med=0s      max=3.39ms  p(90)=0s       p(95)=0s      p(99.9)=3.22ms
     http_req_duration..............: avg=2.01s    min=26.32ms  med=2.04s   max=4.01s   p(90)=2.73s    p(95)=2.94s   p(99.9)=3.7s  
       { expected_response:true }...: avg=2.01s    min=26.32ms  med=2.04s   max=4.01s   p(90)=2.73s    p(95)=2.94s   p(99.9)=3.7s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 3006
     http_req_receiving.............: avg=103.36µs min=35.09µs  med=96.22µs max=1.55ms  p(90)=140.11µs p(95)=156.6µs p(99.9)=1.27ms
     http_req_sending...............: avg=49.81µs  min=7.55µs   med=19.73µs max=20.29ms p(90)=25.12µs  p(95)=29.17µs p(99.9)=5.34ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=2.01s    min=26.18ms  med=2.04s   max=4.01s   p(90)=2.73s    p(95)=2.94s   p(99.9)=3.7s  
     http_reqs......................: 3006    23.992336/s
     iteration_duration.............: avg=2.07s    min=281.74ms med=2.07s   max=4.01s   p(90)=2.74s    p(95)=2.95s   p(99.9)=3.7s  
     iterations.....................: 2906    23.194188/s
     success_rate...................: 100.00% ✓ 2906      ✗ 0   
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

