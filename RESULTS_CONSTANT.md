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
| hive-router | v0.0.84 | 2,934 | 3,230 | 2,899 | 3.8% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,641 | 2,808 | 2,623 | 2.3% |  |
| fusion-nightly | 16.7.0-p.7 | 2,576 | 2,686 | 2,567 | 1.7% |  |
| fusion | 16.6.6 | 2,529 | 2,658 | 2,514 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,381 | 2,477 | 2,366 | 1.6% |  |
| grafbase | 0.53.5 | 2,242 | 2,348 | 2,235 | 1.9% |  |
| cosmo | 0.334.0 | 1,330 | 1,375 | 1,323 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 625 | 642 | 620 | 1.1% |  |
| apollo-router | v2.16.1 | 484 | 503 | 480 | 1.6% |  |
| apollo-gateway | 2.14.3 | 286 | 289 | 283 | 0.6% |  |
| hive-gateway | 2.10.8 | 284 | 291 | 283 | 0.9% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1105 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.7 | 2,517 | 2,632 | 2,503 | 1.8% |  |
| fusion-nightly | 16.7.0-p.7 | 2,474 | 2,578 | 2,460 | 1.7% |  |
| fusion | 16.6.6 | 2,470 | 2,584 | 2,461 | 1.7% |  |
| hive-router | v0.0.84 | 2,407 | 2,619 | 2,370 | 3.5% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 2,219 | 2,327 | 2,214 | 1.8% |  |
| grafbase | 0.53.5 | 1,608 | 1,665 | 1,606 | 1.3% |  |
| cosmo | 0.334.0 | 1,235 | 1,277 | 1,230 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 583 | 603 | 580 | 1.3% |  |
| apollo-router | v2.16.1 | 420 | 432 | 406 | 1.9% |  |
| apollo-gateway | 2.14.3 | 264 | 268 | 262 | 0.8% |  |
| hive-gateway | 2.10.8 | 264 | 272 | 263 | 1.2% |  |
| feddi | 5ff8b6165878 | 21 | 21 | 18 | 5.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1057662     ✗ 0     
     data_received..................: 31 GB   257 MB/s
     data_sent......................: 424 MB  3.5 MB/s
     http_req_blocked...............: avg=3.08µs  min=1µs     med=2.4µs   max=12.93ms  p(90)=3.79µs  p(95)=4.44µs   p(99.9)=35.57µs
     http_req_connecting............: avg=261ns   min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.79ms min=1.47ms  med=16.03ms max=271.57ms p(90)=24.81ms p(95)=28.14ms  p(99.9)=48.4ms 
       { expected_response:true }...: avg=16.79ms min=1.47ms  med=16.03ms max=271.57ms p(90)=24.81ms p(95)=28.14ms  p(99.9)=48.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 352654
     http_req_receiving.............: avg=94.29µs min=25.31µs med=47.06µs max=187.88ms p(90)=85.85µs p(95)=157.64µs p(99.9)=8.22ms 
     http_req_sending...............: avg=48.67µs min=4.9µs   med=8.9µs   max=117.38ms p(90)=15.38µs p(95)=97.91µs  p(99.9)=6.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.65ms min=1.42ms  med=15.91ms max=259.08ms p(90)=24.63ms p(95)=27.87ms  p(99.9)=46.92ms
     http_reqs......................: 352654  2934.311208/s
     iteration_duration.............: avg=17ms    min=2.11ms  med=16.22ms max=302.89ms p(90)=25.03ms p(95)=28.38ms  p(99.9)=49.54ms
     iterations.....................: 352554  2933.479143/s
     success_rate...................: 100.00% ✓ 352554      ✗ 0     
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

     checks.........................: 100.00% ✓ 952563      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 382 MB  3.2 MB/s
     http_req_blocked...............: avg=2.58µs  min=852ns   med=1.89µs   max=12.09ms  p(90)=3.03µs  p(95)=3.62µs  p(99.9)=25.71µs
     http_req_connecting............: avg=299ns   min=0s      med=0s       max=4.15ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.68ms min=1.96ms  med=17.61ms  max=280.64ms p(90)=26.78ms p(95)=30.42ms p(99.9)=51.68ms
       { expected_response:true }...: avg=18.68ms min=1.96ms  med=17.61ms  max=280.64ms p(90)=26.78ms p(95)=30.42ms p(99.9)=51.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317621
     http_req_receiving.............: avg=1.09ms  min=51.03µs med=203.44µs max=50.27ms  p(90)=2.71ms  p(95)=3.64ms  p(99.9)=24.09ms
     http_req_sending...............: avg=42.68µs min=4.6µs   med=7.96µs   max=126.57ms p(90)=14.34µs p(95)=79.9µs  p(99.9)=4.62ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.53ms min=1.86ms  med=16.46ms  max=280.06ms p(90)=25.35ms p(95)=28.92ms p(99.9)=49.18ms
     http_reqs......................: 317621  2641.480885/s
     iteration_duration.............: avg=18.88ms min=2.95ms  med=17.81ms  max=325.24ms p(90)=26.99ms p(95)=30.65ms p(99.9)=52.11ms
     iterations.....................: 317521  2640.649239/s
     success_rate...................: 100.00% ✓ 317521      ✗ 0     
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

     checks.........................: 100.00% ✓ 929226      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=2.97µs   min=931ns   med=2.29µs  max=13.85ms  p(90)=3.54µs  p(95)=4.11µs  p(99.9)=35.1µs  
     http_req_connecting............: avg=307ns    min=0s      med=0s      max=4.14ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.15ms  min=2.01ms  med=16.41ms max=281.4ms  p(90)=31.21ms p(95)=37.82ms p(99.9)=121.73ms
       { expected_response:true }...: avg=19.15ms  min=2.01ms  med=16.41ms max=281.4ms  p(90)=31.21ms p(95)=37.82ms p(99.9)=121.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309842
     http_req_receiving.............: avg=568.38µs min=51.71µs med=93.31µs max=143.7ms  p(90)=1.08ms  p(95)=1.95ms  p(99.9)=24.94ms 
     http_req_sending...............: avg=44.32µs  min=4.67µs  med=8.79µs  max=157.99ms p(90)=14.69µs p(95)=87.79µs p(99.9)=4.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.54ms  min=1.89ms  med=15.87ms max=281.12ms p(90)=30.28ms p(95)=36.79ms p(99.9)=120.45ms
     http_reqs......................: 309842  2576.520432/s
     iteration_duration.............: avg=19.36ms  min=2.93ms  med=16.61ms max=302.94ms p(90)=31.43ms p(95)=38.05ms p(99.9)=122.68ms
     iterations.....................: 309742  2575.688872/s
     success_rate...................: 100.00% ✓ 309742      ✗ 0     
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

     checks.........................: 100.00% ✓ 912075      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 365 MB  3.0 MB/s
     http_req_blocked...............: avg=2.53µs   min=872ns   med=1.79µs  max=14.87ms  p(90)=2.88µs  p(95)=3.4µs   p(99.9)=27.05µs 
     http_req_connecting............: avg=294ns    min=0s      med=0s      max=3.82ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.51ms  min=1.94ms  med=16.66ms max=288.97ms p(90)=31.86ms p(95)=38.74ms p(99.9)=123.43ms
       { expected_response:true }...: avg=19.51ms  min=1.94ms  med=16.66ms max=288.97ms p(90)=31.86ms p(95)=38.74ms p(99.9)=123.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 304125
     http_req_receiving.............: avg=585.62µs min=51.71µs med=89.71µs max=232.13ms p(90)=1.1ms   p(95)=1.99ms  p(99.9)=26.23ms 
     http_req_sending...............: avg=40.17µs  min=4.28µs  med=7.86µs  max=227.93ms p(90)=13.35µs p(95)=71.14µs p(99.9)=3.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.89ms  min=1.83ms  med=16.12ms max=288.86ms p(90)=30.85ms p(95)=37.55ms p(99.9)=122.55ms
     http_reqs......................: 304125  2529.482097/s
     iteration_duration.............: avg=19.72ms  min=3.2ms   med=16.85ms max=294.3ms  p(90)=32.08ms p(95)=38.98ms p(99.9)=124.79ms
     iterations.....................: 304025  2528.650373/s
     success_rate...................: 100.00% ✓ 304025      ✗ 0     
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

     checks.........................: 100.00% ✓ 858744      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.19µs   min=992ns   med=2.37µs  max=16.67ms  p(90)=3.69µs  p(95)=4.28µs  p(99.9)=34.69µs 
     http_req_connecting............: avg=331ns    min=0s      med=0s      max=3.72ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.73ms  min=1.69ms  med=16.95ms max=645.94ms p(90)=34.86ms p(95)=43.92ms p(99.9)=168.13ms
       { expected_response:true }...: avg=20.73ms  min=1.69ms  med=16.95ms max=645.94ms p(90)=34.86ms p(95)=43.92ms p(99.9)=168.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286348
     http_req_receiving.............: avg=594.76µs min=50.16µs med=96.57µs max=435.55ms p(90)=1.07ms  p(95)=1.91ms  p(99.9)=29.08ms 
     http_req_sending...............: avg=43.32µs  min=4.66µs  med=9.24µs  max=263.2ms  p(90)=16.02µs p(95)=75.38µs p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.1ms   min=1.57ms  med=16.39ms max=645.86ms p(90)=33.89ms p(95)=42.69ms p(99.9)=166.32ms
     http_reqs......................: 286348  2381.750728/s
     iteration_duration.............: avg=20.95ms  min=2.86ms  med=17.15ms max=646.16ms p(90)=35.09ms p(95)=44.16ms p(99.9)=169.34ms
     iterations.....................: 286248  2380.91896/s
     success_rate...................: 100.00% ✓ 286248      ✗ 0     
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

     checks.........................: 100.00% ✓ 808485      ✗ 0     
     data_received..................: 24 GB   197 MB/s
     data_sent......................: 324 MB  2.7 MB/s
     http_req_blocked...............: avg=3.55µs   min=1µs     med=2.68µs  max=15.8ms   p(90)=4.34µs  p(95)=5.14µs   p(99.9)=37.24µs
     http_req_connecting............: avg=366ns    min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.03ms  min=1.76ms  med=21.79ms max=328.94ms p(90)=26.31ms p(95)=28.35ms  p(99.9)=49.13ms
       { expected_response:true }...: avg=22.03ms  min=1.76ms  med=21.79ms max=328.94ms p(90)=26.31ms p(95)=28.35ms  p(99.9)=49.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 269595
     http_req_receiving.............: avg=118.07µs min=24.64µs med=55.02µs max=294.71ms p(90)=95.93µs p(95)=133.85µs p(99.9)=9.16ms 
     http_req_sending...............: avg=40.64µs  min=4.81µs  med=10.61µs max=34.43ms  p(90)=18.07µs p(95)=74.98µs  p(99.9)=2.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.87ms  min=1.69ms  med=21.68ms max=121.13ms p(90)=26.16ms p(95)=28.14ms  p(99.9)=47.44ms
     http_reqs......................: 269595  2242.512869/s
     iteration_duration.............: avg=22.25ms  min=3.25ms  med=21.98ms max=339.74ms p(90)=26.52ms p(95)=28.57ms  p(99.9)=49.79ms
     iterations.....................: 269495  2241.681061/s
     success_rate...................: 100.00% ✓ 269495      ✗ 0     
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

     checks.........................: 100.00% ✓ 479586      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.54µs  min=1.05µs  med=2.64µs  max=3.85ms   p(90)=4.1µs   p(95)=4.74µs   p(99.9)=34.7µs 
     http_req_connecting............: avg=603ns   min=0s      med=0s      max=3.81ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.29ms min=2.05ms  med=36.9ms  max=305.62ms p(90)=52.03ms p(95)=56.63ms  p(99.9)=78.6ms 
       { expected_response:true }...: avg=37.29ms min=2.05ms  med=36.9ms  max=305.62ms p(90)=52.03ms p(95)=56.63ms  p(99.9)=78.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159962
     http_req_receiving.............: avg=74.14µs min=25.36µs med=59.25µs max=97.85ms  p(90)=95.34µs p(95)=111.19µs p(99.9)=1.04ms 
     http_req_sending...............: avg=25.76µs min=5.02µs  med=11.05µs max=221.38ms p(90)=17.77µs p(95)=21.92µs  p(99.9)=1.05ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.19ms min=1.95ms  med=36.8ms  max=278.95ms p(90)=51.93ms p(95)=56.52ms  p(99.9)=78.5ms 
     http_reqs......................: 159962  1330.022081/s
     iteration_duration.............: avg=37.52ms min=3.86ms  med=37.11ms max=316.75ms p(90)=52.23ms p(95)=56.84ms  p(99.9)=79.25ms
     iterations.....................: 159862  1329.19062/s
     success_rate...................: 100.00% ✓ 159862      ✗ 0     
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

     checks.........................: 100.00% ✓ 225744     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   751 kB/s
     http_req_blocked...............: avg=3.95µs  min=1µs     med=2.42µs  max=4.07ms   p(90)=3.98µs   p(95)=4.58µs   p(99.9)=44.31µs 
     http_req_connecting............: avg=1.21µs  min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.41ms min=3.58ms  med=77.2ms  max=311.05ms p(90)=98.53ms  p(95)=108.68ms p(99.9)=189.61ms
       { expected_response:true }...: avg=79.41ms min=3.58ms  med=77.2ms  max=311.05ms p(90)=98.53ms  p(95)=108.68ms p(99.9)=189.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75348
     http_req_receiving.............: avg=73.75µs min=27.66µs med=62.91µs max=82.3ms   p(90)=100.19µs p(95)=113.75µs p(99.9)=576.1µs 
     http_req_sending...............: avg=22.22µs min=4.95µs  med=12.17µs max=150.92ms p(90)=19.43µs  p(95)=21.61µs  p(99.9)=606.89µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.32ms min=3.48ms  med=77.11ms max=310.3ms  p(90)=98.43ms  p(95)=108.58ms p(99.9)=189.29ms
     http_reqs......................: 75348   625.411808/s
     iteration_duration.............: avg=79.74ms min=17.57ms med=77.43ms max=328.34ms p(90)=98.78ms  p(95)=108.94ms p(99.9)=190.97ms
     iterations.....................: 75248   624.581777/s
     success_rate...................: 100.00% ✓ 75248      ✗ 0    
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

     checks.........................: 100.00% ✓ 174843     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   581 kB/s
     http_req_blocked...............: avg=4.67µs   min=1.06µs  med=2.87µs   max=3.97ms   p(90)=4.28µs   p(95)=4.81µs   p(99.9)=58.38µs 
     http_req_connecting............: avg=1.58µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.54ms min=4.76ms  med=102.32ms max=332.1ms  p(90)=123.9ms  p(95)=130.17ms p(99.9)=159.25ms
       { expected_response:true }...: avg=102.54ms min=4.76ms  med=102.32ms max=332.1ms  p(90)=123.9ms  p(95)=130.17ms p(99.9)=159.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58381
     http_req_receiving.............: avg=80.8µs   min=28.61µs med=73.89µs  max=93.63ms  p(90)=106.55µs p(95)=120.14µs p(99.9)=552.98µs
     http_req_sending...............: avg=24.55µs  min=4.88µs  med=15µs     max=112.64ms p(90)=20.81µs  p(95)=22.64µs  p(99.9)=561.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.43ms min=4.63ms  med=102.21ms max=331.59ms p(90)=123.8ms  p(95)=130.05ms p(99.9)=158.7ms 
     http_reqs......................: 58381   484.128808/s
     iteration_duration.............: avg=102.96ms min=28.36ms med=102.6ms  max=341.5ms  p(90)=124.15ms p(95)=130.44ms p(99.9)=160.98ms
     iterations.....................: 58281   483.29955/s
     success_rate...................: 100.00% ✓ 58281      ✗ 0    
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

     checks.........................: 100.00% ✓ 103689     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   344 kB/s
     http_req_blocked...............: avg=6.42µs   min=1.16µs  med=3.26µs   max=3.73ms   p(90)=4.58µs   p(95)=5.12µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=2.93µs   min=0s      med=0s       max=3.68ms   p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=172.91ms min=7.39ms  med=172.26ms max=375.45ms p(90)=210.24ms p(95)=215.37ms p(99.9)=285.45ms
       { expected_response:true }...: avg=172.91ms min=7.39ms  med=172.26ms max=375.45ms p(90)=210.24ms p(95)=215.37ms p(99.9)=285.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34663
     http_req_receiving.............: avg=90.16µs  min=29.01µs med=82.63µs  max=80.14ms  p(90)=113.56µs p(95)=124.46µs p(99.9)=432.96µs
     http_req_sending...............: avg=26µs     min=5.3µs   med=17.21µs  max=90ms     p(90)=21.92µs  p(95)=23.77µs  p(99.9)=423.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=172.79ms min=7.23ms  med=172.14ms max=368.74ms p(90)=210.12ms p(95)=215.24ms p(99.9)=284.64ms
     http_reqs......................: 34663   286.688173/s
     iteration_duration.............: avg=173.67ms min=46.16ms med=173.2ms  max=381.21ms p(90)=210.52ms p(95)=215.66ms p(99.9)=287.69ms
     iterations.....................: 34563   285.8611/s
     success_rate...................: 100.00% ✓ 34563      ✗ 0    
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

     checks.........................: 100.00% ✓ 102744     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   341 kB/s
     http_req_blocked...............: avg=6.71µs   min=1.46µs  med=3.9µs    max=3.4ms    p(90)=5.45µs   p(95)=6.06µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=2.54µs   min=0s      med=0s       max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=174.48ms min=5.62ms  med=159.18ms max=704ms    p(90)=204.41ms p(95)=240.34ms p(99.9)=572.48ms
       { expected_response:true }...: avg=174.48ms min=5.62ms  med=159.18ms max=704ms    p(90)=204.41ms p(95)=240.34ms p(99.9)=572.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34348
     http_req_receiving.............: avg=98.95µs  min=37.36µs med=90.22µs  max=121.88ms p(90)=121.28µs p(95)=133.31µs p(99.9)=716.4µs 
     http_req_sending...............: avg=32.36µs  min=6.86µs  med=18.73µs  max=87.9ms   p(90)=23.63µs  p(95)=25.45µs  p(99.9)=564.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.35ms min=5.53ms  med=159.05ms max=703.91ms p(90)=204.3ms  p(95)=240.08ms p(99.9)=572.37ms
     http_reqs......................: 34348   284.369868/s
     iteration_duration.............: avg=175.28ms min=34.26ms med=159.52ms max=704.24ms p(90)=204.84ms p(95)=241.22ms p(99.9)=572.77ms
     iterations.....................: 34248   283.54196/s
     success_rate...................: 100.00% ✓ 34248      ✗ 0    
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

     checks.........................: 100.00% ✓ 907554      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 364 MB  3.0 MB/s
     http_req_blocked...............: avg=3.19µs  min=892ns   med=2.27µs   max=13.63ms  p(90)=4.07µs  p(95)=4.91µs  p(99.9)=34.94µs
     http_req_connecting............: avg=309ns   min=0s      med=0s       max=3.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.59ms min=1.51ms  med=18.48ms  max=284.58ms p(90)=28.55ms p(95)=32.4ms  p(99.9)=53.74ms
       { expected_response:true }...: avg=19.59ms min=1.51ms  med=18.48ms  max=284.58ms p(90)=28.55ms p(95)=32.4ms  p(99.9)=53.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 302618
     http_req_receiving.............: avg=1.21ms  min=52.16µs med=141.66µs max=45.68ms  p(90)=3.16ms  p(95)=4.37ms  p(99.9)=25.17ms
     http_req_sending...............: avg=48.35µs min=4.58µs  med=9.05µs   max=78.03ms  p(90)=19.97µs p(95)=93.92µs p(99.9)=5.83ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.33ms min=1.41ms  med=17.16ms  max=283.91ms p(90)=27.03ms p(95)=30.78ms p(99.9)=51.55ms
     http_reqs......................: 302618  2517.523266/s
     iteration_duration.............: avg=19.82ms min=2.73ms  med=18.69ms  max=315.4ms  p(90)=28.78ms p(95)=32.66ms p(99.9)=54.35ms
     iterations.....................: 302518  2516.691351/s
     success_rate...................: 100.00% ✓ 302518      ✗ 0     
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

     checks.........................: 100.00% ✓ 892020      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=3.07µs   min=891ns  med=2.12µs  max=20.88ms  p(90)=3.68µs  p(95)=4.43µs  p(99.9)=34.57µs 
     http_req_connecting............: avg=308ns    min=0s     med=0s      max=3.43ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.95ms  min=1.55ms med=16.78ms max=322.14ms p(90)=32.69ms p(95)=39.98ms p(99.9)=138.34ms
       { expected_response:true }...: avg=19.95ms  min=1.55ms med=16.78ms max=322.14ms p(90)=32.69ms p(95)=39.98ms p(99.9)=138.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297440
     http_req_receiving.............: avg=559.21µs min=51.7µs med=94.83µs max=243.39ms p(90)=1.07ms  p(95)=1.86ms  p(99.9)=25.92ms 
     http_req_sending...............: avg=42.1µs   min=4.67µs med=8.97µs  max=227.99ms p(90)=17.72µs p(95)=77.99µs p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.35ms  min=1.46ms med=16.26ms max=322.04ms p(90)=31.75ms p(95)=38.85ms p(99.9)=136.01ms
     http_reqs......................: 297440  2474.486679/s
     iteration_duration.............: avg=20.16ms  min=2.68ms med=16.99ms max=326.3ms  p(90)=32.92ms p(95)=40.22ms p(99.9)=139.14ms
     iterations.....................: 297340  2473.654751/s
     success_rate...................: 100.00% ✓ 297340      ✗ 0     
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

     checks.........................: 100.00% ✓ 890553      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.91µs   min=862ns   med=2.12µs  max=9.88ms   p(90)=3.8µs   p(95)=4.56µs  p(99.9)=36.11µs 
     http_req_connecting............: avg=283ns    min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.98ms  min=1.62ms  med=16.86ms max=295.85ms p(90)=32.67ms p(95)=39.93ms p(99.9)=135.72ms
       { expected_response:true }...: avg=19.98ms  min=1.62ms  med=16.86ms max=295.85ms p(90)=32.67ms p(95)=39.93ms p(99.9)=135.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296951
     http_req_receiving.............: avg=557.26µs min=50.34µs med=93.5µs  max=248.62ms p(90)=1.07ms  p(95)=1.86ms  p(99.9)=25.95ms 
     http_req_sending...............: avg=41.77µs  min=4.34µs  med=8.65µs  max=104.79ms p(90)=17.71µs p(95)=83.54µs p(99.9)=3.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.39ms  min=1.51ms  med=16.34ms max=295.25ms p(90)=31.73ms p(95)=38.84ms p(99.9)=133.74ms
     http_reqs......................: 296951  2470.337128/s
     iteration_duration.............: avg=20.2ms   min=2.63ms  med=17.06ms max=305.75ms p(90)=32.9ms  p(95)=40.16ms p(99.9)=136.98ms
     iterations.....................: 296851  2469.505227/s
     success_rate...................: 100.00% ✓ 296851      ✗ 0     
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

     checks.........................: 100.00% ✓ 867771      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=2.83µs  min=901ns   med=2.06µs  max=10.23ms  p(90)=3.51µs  p(95)=4.23µs  p(99.9)=33.4µs 
     http_req_connecting............: avg=313ns   min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.53ms min=1.51ms  med=20.4ms  max=295.42ms p(90)=28.38ms p(95)=30.66ms p(99.9)=48.25ms
       { expected_response:true }...: avg=20.53ms min=1.51ms  med=20.4ms  max=295.42ms p(90)=28.38ms p(95)=30.66ms p(99.9)=48.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289357
     http_req_receiving.............: avg=80.87µs min=25.72µs med=48.98µs max=83.57ms  p(90)=86.06µs p(95)=111.9µs p(99.9)=5.25ms 
     http_req_sending...............: avg=36.85µs min=4.53µs  med=9.01µs  max=138.72ms p(90)=15.49µs p(95)=25.74µs p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=20.41ms min=1.45ms  med=20.3ms  max=294.73ms p(90)=28.25ms p(95)=30.49ms p(99.9)=47.07ms
     http_reqs......................: 289357  2407.262382/s
     iteration_duration.............: avg=20.73ms min=3.29ms  med=20.59ms max=310.61ms p(90)=28.58ms p(95)=30.86ms p(99.9)=48.61ms
     iterations.....................: 289257  2406.430447/s
     success_rate...................: 100.00% ✓ 289257      ✗ 0     
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

     checks.........................: 100.00% ✓ 800175      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=4.63µs  min=1.04µs med=2.71µs   max=76.54ms  p(90)=4.29µs  p(95)=5.03µs  p(99.9)=38.92µs 
     http_req_connecting............: avg=1.4µs   min=0s     med=0s       max=76.08ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.25ms min=1.84ms med=18.67ms  max=330.19ms p(90)=36.52ms p(95)=45.22ms p(99.9)=154.66ms
       { expected_response:true }...: avg=22.25ms min=1.84ms med=18.67ms  max=330.19ms p(90)=36.52ms p(95)=45.22ms p(99.9)=154.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266825
     http_req_receiving.............: avg=615.4µs min=53.6µs med=104.96µs max=212.28ms p(90)=1.15ms  p(95)=1.99ms  p(99.9)=28.53ms 
     http_req_sending...............: avg=42.96µs min=4.85µs med=10.47µs  max=220.98ms p(90)=18.54µs p(95)=83.75µs p(99.9)=3.51ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.59ms min=1.74ms med=18.09ms  max=328.89ms p(90)=35.47ms p(95)=43.95ms p(99.9)=153.4ms 
     http_reqs......................: 266825  2219.208618/s
     iteration_duration.............: avg=22.48ms min=2.82ms med=18.88ms  max=330.38ms p(90)=36.75ms p(95)=45.47ms p(99.9)=155.78ms
     iterations.....................: 266725  2218.376908/s
     success_rate...................: 100.00% ✓ 266725      ✗ 0     
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

     checks.........................: 100.00% ✓ 580029      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=4.25µs   min=1.02µs  med=3.08µs  max=11.29ms  p(90)=5.3µs    p(95)=6.35µs   p(99.9)=46.92µs
     http_req_connecting............: avg=482ns    min=0s      med=0s      max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.76ms  min=2.3ms   med=30.24ms max=310.22ms p(90)=40.66ms  p(95)=44.11ms  p(99.9)=67.42ms
       { expected_response:true }...: avg=30.76ms  min=2.3ms   med=30.24ms max=310.22ms p(90)=40.66ms  p(95)=44.11ms  p(99.9)=67.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193443
     http_req_receiving.............: avg=104.51µs min=27.63µs med=61.16µs max=116.48ms p(90)=132.91µs p(95)=230.25µs p(99.9)=4.82ms 
     http_req_sending...............: avg=46.5µs   min=4.91µs  med=11.44µs max=182.8ms  p(90)=26.13µs  p(95)=122.9µs  p(99.9)=3.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.61ms  min=2.18ms  med=30.1ms  max=309.77ms p(90)=40.49ms  p(95)=43.92ms  p(99.9)=66.25ms
     http_reqs......................: 193443  1608.092422/s
     iteration_duration.............: avg=31.02ms  min=4.49ms  med=30.48ms max=321.73ms p(90)=40.9ms   p(95)=44.35ms  p(99.9)=67.82ms
     iterations.....................: 193343  1607.261122/s
     success_rate...................: 100.00% ✓ 193343      ✗ 0     
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

     checks.........................: 100.00% ✓ 445692      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=4.02µs  min=1.02µs  med=3.07µs  max=4.11ms   p(90)=4.76µs   p(95)=5.49µs   p(99.9)=37.64µs
     http_req_connecting............: avg=660ns   min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.12ms min=2.12ms  med=39.72ms max=316.2ms  p(90)=55.59ms  p(95)=60.47ms  p(99.9)=84.28ms
       { expected_response:true }...: avg=40.12ms min=2.12ms  med=39.72ms max=316.2ms  p(90)=55.59ms  p(95)=60.47ms  p(99.9)=84.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148664
     http_req_receiving.............: avg=83.57µs min=26.03µs med=69.58µs max=125.47ms p(90)=109.63µs p(95)=127.14µs p(99.9)=1.02ms 
     http_req_sending...............: avg=26.5µs  min=4.92µs  med=12.96µs max=78.61ms  p(90)=20.15µs  p(95)=24.16µs  p(99.9)=1.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.01ms min=2.01ms  med=39.62ms max=302.31ms p(90)=55.48ms  p(95)=60.36ms  p(99.9)=84.12ms
     http_reqs......................: 148664  1235.982821/s
     iteration_duration.............: avg=40.37ms min=4.49ms  med=39.95ms max=326.08ms p(90)=55.81ms  p(95)=60.69ms  p(99.9)=84.62ms
     iterations.....................: 148564  1235.151428/s
     success_rate...................: 100.00% ✓ 148564      ✗ 0     
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

     checks.........................: 100.00% ✓ 210777     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   701 kB/s
     http_req_blocked...............: avg=4.38µs  min=1.01µs  med=2.79µs  max=4.19ms   p(90)=4.31µs   p(95)=4.95µs   p(99.9)=45.41µs 
     http_req_connecting............: avg=1.33µs  min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.04ms min=3.81ms  med=83.23ms max=311.93ms p(90)=103.19ms p(95)=113.1ms  p(99.9)=200.13ms
       { expected_response:true }...: avg=85.04ms min=3.81ms  med=83.23ms max=311.93ms p(90)=103.19ms p(95)=113.1ms  p(99.9)=200.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70359
     http_req_receiving.............: avg=81.19µs min=30.46µs med=72.2µs  max=65.56ms  p(90)=106.54µs p(95)=118.91µs p(99.9)=637.95µs
     http_req_sending...............: avg=23.52µs min=5.12µs  med=13.01µs max=110.89ms p(90)=19.52µs  p(95)=21.77µs  p(99.9)=584.57µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.94ms min=3.69ms  med=83.13ms max=311.38ms p(90)=103.09ms p(95)=112.99ms p(99.9)=200.02ms
     http_reqs......................: 70359   583.927826/s
     iteration_duration.............: avg=85.4ms  min=22.77ms med=83.47ms max=341.8ms  p(90)=103.43ms p(95)=113.38ms p(99.9)=201.77ms
     iterations.....................: 70259   583.097899/s
     success_rate...................: 100.00% ✓ 70259      ✗ 0    
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

     checks.........................: 100.00% ✓ 151863     ✗ 0    
     data_received..................: 4.4 GB  37 MB/s
     data_sent......................: 61 MB   505 kB/s
     http_req_blocked...............: avg=5.58µs   min=1.33µs  med=3.45µs   max=3.74ms   p(90)=4.88µs   p(95)=5.45µs   p(99.9)=241.14µs
     http_req_connecting............: avg=1.91µs   min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=28.84µs 
     http_req_duration..............: avg=118.05ms min=5.02ms  med=115.82ms max=318.23ms p(90)=156.37ms p(95)=168.61ms p(99.9)=218.11ms
       { expected_response:true }...: avg=118.05ms min=5.02ms  med=115.82ms max=318.23ms p(90)=156.37ms p(95)=168.61ms p(99.9)=218.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50721
     http_req_receiving.............: avg=87.66µs  min=32.12µs med=78.27µs  max=169.06ms p(90)=109.67µs p(95)=122.04µs p(99.9)=483.7µs 
     http_req_sending...............: avg=23.14µs  min=5.64µs  med=16.04µs  max=76.24ms  p(90)=21.75µs  p(95)=23.7µs   p(99.9)=524.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.94ms min=4.94ms  med=115.72ms max=312.33ms p(90)=156.26ms p(95)=168.48ms p(99.9)=217.44ms
     http_reqs......................: 50721   420.441115/s
     iteration_duration.............: avg=118.54ms min=31.08ms med=116.15ms max=327.59ms p(90)=156.67ms p(95)=168.9ms  p(99.9)=219.38ms
     iterations.....................: 50621   419.612185/s
     success_rate...................: 100.00% ✓ 50621      ✗ 0    
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

     checks.........................: 100.00% ✓ 95874      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=6.23µs   min=1.1µs   med=3.14µs   max=3.92ms   p(90)=4.45µs   p(95)=4.98µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=186.99ms min=7.67ms  med=182.05ms max=400.21ms p(90)=208.8ms  p(95)=213.49ms p(99.9)=285.53ms
       { expected_response:true }...: avg=186.99ms min=7.67ms  med=182.05ms max=400.21ms p(90)=208.8ms  p(95)=213.49ms p(99.9)=285.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32058
     http_req_receiving.............: avg=94.24µs  min=28.87µs med=86.81µs  max=111.66ms p(90)=115.66µs p(95)=126.37µs p(99.9)=382.26µs
     http_req_sending...............: avg=30.96µs  min=5.1µs   med=17.42µs  max=82.23ms  p(90)=21.77µs  p(95)=23.44µs  p(99.9)=879.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.87ms min=7.58ms  med=181.94ms max=399.23ms p(90)=208.69ms p(95)=213.39ms p(99.9)=285.37ms
     http_reqs......................: 32058   264.967654/s
     iteration_duration.............: avg=187.85ms min=57.4ms  med=182.33ms max=407.5ms  p(90)=209.08ms p(95)=213.76ms p(99.9)=287.71ms
     iterations.....................: 31958   264.141128/s
     success_rate...................: 100.00% ✓ 31958      ✗ 0    
     vus............................: 1       min=1        max=50 
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

     checks.........................: 100.00% ✓ 95766      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   318 kB/s
     http_req_blocked...............: avg=7.15µs   min=1.43µs  med=3.79µs   max=4.04ms   p(90)=5.22µs   p(95)=5.84µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=3.07µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=187.21ms min=6.22ms  med=171.87ms max=668.1ms  p(90)=219.53ms p(95)=269.92ms p(99.9)=561.4ms 
       { expected_response:true }...: avg=187.21ms min=6.22ms  med=171.87ms max=668.1ms  p(90)=219.53ms p(95)=269.92ms p(99.9)=561.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32022
     http_req_receiving.............: avg=114.09µs min=37.15µs med=94.65µs  max=218.83ms p(90)=125.35µs p(95)=138.64µs p(99.9)=608.99µs
     http_req_sending...............: avg=25.26µs  min=6.61µs  med=18.82µs  max=36.51ms  p(90)=23.45µs  p(95)=25.39µs  p(99.9)=611.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.07ms min=6.04ms  med=171.75ms max=667.84ms p(90)=219.35ms p(95)=269.51ms p(99.9)=561.28ms
     http_reqs......................: 32022   264.942773/s
     iteration_duration.............: avg=188.07ms min=32.18ms med=172.22ms max=668.53ms p(90)=219.96ms p(95)=271.6ms  p(99.9)=561.64ms
     iterations.....................: 31922   264.115395/s
     success_rate...................: 100.00% ✓ 31922      ✗ 0    
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

     checks.........................: 100.00% ✓ 7722      ✗ 0   
     data_received..................: 256 MB  2.1 MB/s
     data_sent......................: 3.2 MB  26 kB/s
     http_req_blocked...............: avg=51.22µs min=1.22µs   med=3.93µs  max=4.4ms   p(90)=5.57µs   p(95)=6.43µs   p(99.9)=3.99ms  
     http_req_connecting............: avg=46.39µs min=0s       med=0s      max=4.38ms  p(90)=0s       p(95)=0s       p(99.9)=3.91ms  
     http_req_duration..............: avg=2.25s   min=26.74ms  med=2.27s   max=4.15s   p(90)=3.03s    p(95)=3.23s    p(99.9)=4.01s   
       { expected_response:true }...: avg=2.25s   min=26.74ms  med=2.27s   max=4.15s   p(90)=3.03s    p(95)=3.23s    p(99.9)=4.01s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2674
     http_req_receiving.............: avg=107.5µs min=33.76µs  med=98.03µs max=8.67ms  p(90)=143.11µs p(95)=162.42µs p(99.9)=567.88µs
     http_req_sending...............: avg=81.37µs min=6.62µs   med=20.38µs max=12.22ms p(90)=26.38µs  p(95)=30.48µs  p(99.9)=4.35ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.25s   min=26.58ms  med=2.27s   max=4.15s   p(90)=3.03s    p(95)=3.23s    p(99.9)=4.01s   
     http_reqs......................: 2674    21.440874/s
     iteration_duration.............: avg=2.34s   min=346.11ms med=2.31s   max=4.15s   p(90)=3.04s    p(95)=3.25s    p(99.9)=4.02s   
     iterations.....................: 2574    20.639046/s
     success_rate...................: 100.00% ✓ 2574      ✗ 0   
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

