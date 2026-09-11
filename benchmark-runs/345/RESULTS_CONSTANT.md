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
| hive-router | v0.0.84 | 2,901 | 3,193 | 2,873 | 3.6% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,676 | 2,820 | 2,633 | 2.3% |  |
| fusion-nightly | 16.7.0-p.5 | 2,672 | 2,782 | 2,661 | 1.5% |  |
| fusion | 16.6.4 | 2,596 | 2,726 | 2,575 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,381 | 2,455 | 2,357 | 1.3% |  |
| grafbase | 0.53.5 | 2,098 | 2,225 | 2,085 | 2.4% |  |
| cosmo | 0.334.0 | 1,320 | 1,369 | 1,312 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 615 | 636 | 614 | 1.3% |  |
| apollo-router | v2.16.1 | 483 | 503 | 481 | 1.7% |  |
| hive-gateway | 2.10.8 | 280 | 287 | 278 | 1.0% |  |
| apollo-gateway | 2.14.3 | 278 | 283 | 278 | 0.6% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% | non-compatible response (173 across 1/2 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,639 | 2,819 | 2,613 | 2.7% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,544 | 2,644 | 2,536 | 1.5% |  |
| fusion-nightly | 16.7.0-p.5 | 2,467 | 2,586 | 2,460 | 1.8% |  |
| fusion | 16.6.4 | 2,367 | 2,484 | 2,351 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,292 | 2,386 | 2,279 | 1.5% |  |
| grafbase | 0.53.5 | 1,656 | 1,704 | 1,647 | 1.1% |  |
| cosmo | 0.334.0 | 1,187 | 1,233 | 1,182 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 601 | 619 | 600 | 1.1% |  |
| apollo-router | v2.16.1 | 446 | 461 | 440 | 1.4% |  |
| hive-gateway | 2.10.8 | 270 | 278 | 269 | 1.1% |  |
| apollo-gateway | 2.14.3 | 260 | 266 | 259 | 0.9% |  |
| feddi | 5ff8b6165878 | 26 | 28 | 26 | 2.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1045611     ✗ 0     
     data_received..................: 31 GB   255 MB/s
     data_sent......................: 419 MB  3.5 MB/s
     http_req_blocked...............: avg=2.73µs  min=852ns   med=2.09µs  max=6.43ms   p(90)=3.39µs  p(95)=3.97µs   p(99.9)=31.92µs
     http_req_connecting............: avg=264ns   min=0s      med=0s      max=3.88ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17ms    min=1.4ms   med=16.48ms max=283.67ms p(90)=24.77ms p(95)=27.8ms   p(99.9)=47.22ms
       { expected_response:true }...: avg=17ms    min=1.4ms   med=16.48ms max=283.67ms p(90)=24.77ms p(95)=27.8ms   p(99.9)=47.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 348637
     http_req_receiving.............: avg=85.9µs  min=24.43µs med=44.87µs max=34.2ms   p(90)=81.28µs p(95)=140.15µs p(99.9)=7.57ms 
     http_req_sending...............: avg=43.46µs min=4.58µs  med=8.3µs   max=164.86ms p(90)=14.47µs p(95)=88.23µs  p(99.9)=3.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.87ms min=1.32ms  med=16.37ms max=283.43ms p(90)=24.61ms p(95)=27.57ms  p(99.9)=46.06ms
     http_reqs......................: 348637  2901.173544/s
     iteration_duration.............: avg=17.2ms  min=2.01ms  med=16.67ms max=296.81ms p(90)=24.97ms p(95)=28.02ms  p(99.9)=47.92ms
     iterations.....................: 348537  2900.341397/s
     success_rate...................: 100.00% ✓ 348537      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 965241      ✗ 0     
     data_received..................: 28 GB   235 MB/s
     data_sent......................: 387 MB  3.2 MB/s
     http_req_blocked...............: avg=3.21µs  min=1µs     med=2.4µs    max=18.04ms  p(90)=3.75µs  p(95)=4.42µs  p(99.9)=33.13µs
     http_req_connecting............: avg=294ns   min=0s      med=0s       max=4.09ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.42ms min=1.84ms  med=17.31ms  max=299.11ms p(90)=26.41ms p(95)=30.23ms p(99.9)=51.79ms
       { expected_response:true }...: avg=18.42ms min=1.84ms  med=17.31ms  max=299.11ms p(90)=26.41ms p(95)=30.23ms p(99.9)=51.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 321847
     http_req_receiving.............: avg=1.06ms  min=51.62µs med=130.17µs max=284.52ms p(90)=2.69ms  p(95)=3.7ms   p(99.9)=24.72ms
     http_req_sending...............: avg=47.53µs min=4.88µs  med=8.8µs    max=146.04ms p(90)=16.06µs p(95)=93.92µs p(99.9)=5.64ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.31ms min=1.76ms  med=16.19ms  max=290.61ms p(90)=25.05ms p(95)=28.76ms p(99.9)=49.46ms
     http_reqs......................: 321847  2676.759851/s
     iteration_duration.............: avg=18.63ms min=2.79ms  med=17.51ms  max=308.3ms  p(90)=26.63ms p(95)=30.45ms p(99.9)=52.62ms
     iterations.....................: 321747  2675.928164/s
     success_rate...................: 100.00% ✓ 321747      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 963552      ✗ 0     
     data_received..................: 28 GB   234 MB/s
     data_sent......................: 386 MB  3.2 MB/s
     http_req_blocked...............: avg=2.68µs   min=872ns  med=1.87µs  max=20.97ms  p(90)=3.06µs  p(95)=3.64µs  p(99.9)=29.7µs  
     http_req_connecting............: avg=264ns    min=0s     med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.46ms  min=1.94ms med=16ms    max=281.86ms p(90)=29.89ms p(95)=36.08ms p(99.9)=111.82ms
       { expected_response:true }...: avg=18.46ms  min=1.94ms med=16ms    max=281.86ms p(90)=29.89ms p(95)=36.08ms p(99.9)=111.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 321284
     http_req_receiving.............: avg=530.11µs min=50.2µs med=85.99µs max=193.1ms  p(90)=1.02ms  p(95)=1.83ms  p(99.9)=24.16ms 
     http_req_sending...............: avg=43.2µs   min=4.4µs  med=7.91µs  max=174.42ms p(90)=14.35µs p(95)=81.08µs p(99.9)=4.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=17.89ms  min=1.82ms med=15.49ms max=281.24ms p(90)=28.99ms p(95)=35.07ms p(99.9)=110.88ms
     http_reqs......................: 321284  2672.072809/s
     iteration_duration.............: avg=18.67ms  min=3.3ms  med=16.19ms max=297.02ms p(90)=30.11ms p(95)=36.32ms p(99.9)=112.94ms
     iterations.....................: 321184  2671.241123/s
     success_rate...................: 100.00% ✓ 321184      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 936537      ✗ 0     
     data_received..................: 27 GB   228 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=2.46µs  min=852ns   med=1.95µs  max=16.27ms  p(90)=3.19µs  p(95)=3.78µs  p(99.9)=29.22µs 
     http_req_connecting............: avg=111ns   min=0s      med=0s      max=1.75ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19ms    min=2.06ms  med=16.42ms max=344.36ms p(90)=30.68ms p(95)=37.06ms p(99.9)=119.13ms
       { expected_response:true }...: avg=19ms    min=2.06ms  med=16.42ms max=344.36ms p(90)=30.68ms p(95)=37.06ms p(99.9)=119.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 312279
     http_req_receiving.............: avg=552.4µs min=50.34µs med=90.96µs max=220.43ms p(90)=1.05ms  p(95)=1.88ms  p(99.9)=25.12ms 
     http_req_sending...............: avg=44.05µs min=4.12µs  med=8.26µs  max=241.78ms p(90)=15.47µs p(95)=86.03µs p(99.9)=3.51ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.4ms  min=1.9ms   med=15.91ms max=344.26ms p(90)=29.72ms p(95)=36ms    p(99.9)=116.76ms
     http_reqs......................: 312279  2596.639252/s
     iteration_duration.............: avg=19.21ms min=3.05ms  med=16.62ms max=344.55ms p(90)=30.9ms  p(95)=37.29ms p(99.9)=120.45ms
     iterations.....................: 312179  2595.807739/s
     success_rate...................: 100.00% ✓ 312179      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 858552      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.61µs   min=901ns  med=1.92µs  max=10.57ms  p(90)=3.05µs  p(95)=3.58µs  p(99.9)=26.38µs 
     http_req_connecting............: avg=337ns    min=0s     med=0s      max=3.59ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.75ms  min=1.71ms med=16.64ms max=530.9ms  p(90)=35.12ms p(95)=44.69ms p(99.9)=181.48ms
       { expected_response:true }...: avg=20.75ms  min=1.71ms med=16.64ms max=530.9ms  p(90)=35.12ms p(95)=44.69ms p(99.9)=181.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286284
     http_req_receiving.............: avg=603.55µs min=51.2µs med=90.83µs max=316.45ms p(90)=1.06ms  p(95)=1.87ms  p(99.9)=30.97ms 
     http_req_sending...............: avg=38.24µs  min=4.58µs med=8.21µs  max=216.85ms p(90)=14.08µs p(95)=28.89µs p(99.9)=2.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.11ms  min=1.61ms med=16.1ms  max=530.34ms p(90)=34.03ms p(95)=43.38ms p(99.9)=179.05ms
     http_reqs......................: 286284  2381.446805/s
     iteration_duration.............: avg=20.95ms  min=2.57ms med=16.83ms max=531.14ms p(90)=35.34ms p(95)=44.92ms p(99.9)=183.95ms
     iterations.....................: 286184  2380.614958/s
     success_rate...................: 100.00% ✓ 286184      ✗ 0     
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

     checks.........................: 100.00% ✓ 756747      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=2.92µs  min=932ns   med=2.1µs   max=10.85ms  p(90)=3.47µs  p(95)=4.16µs   p(99.9)=33.01µs
     http_req_connecting............: avg=371ns   min=0s      med=0s      max=3.82ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.56ms min=1.7ms   med=23.32ms max=310.17ms p(90)=27.93ms p(95)=29.66ms  p(99.9)=48.64ms
       { expected_response:true }...: avg=23.56ms min=1.7ms   med=23.32ms max=310.17ms p(90)=27.93ms p(95)=29.66ms  p(99.9)=48.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252349
     http_req_receiving.............: avg=85.8µs  min=26.91µs med=54.79µs max=72.47ms  p(90)=92.69µs p(95)=116.88µs p(99.9)=5.09ms 
     http_req_sending...............: avg=36.03µs min=4.94µs  med=9.97µs  max=251.4ms  p(90)=16.9µs  p(95)=25.18µs  p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.44ms min=1.65ms  med=23.22ms max=309.72ms p(90)=27.8ms  p(95)=29.5ms   p(99.9)=47.69ms
     http_reqs......................: 252349  2098.988256/s
     iteration_duration.............: avg=23.77ms min=4.62ms  med=23.51ms max=319.44ms p(90)=28.13ms p(95)=29.87ms  p(99.9)=48.96ms
     iterations.....................: 252249  2098.156476/s
     success_rate...................: 100.00% ✓ 252249      ✗ 0     
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

     checks.........................: 100.00% ✓ 476115      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3.37µs  min=1.08µs  med=2.51µs  max=3.41ms   p(90)=3.94µs  p(95)=4.58µs  p(99.9)=34.03µs 
     http_req_connecting............: avg=555ns   min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=37.56ms min=1.94ms  med=37.22ms max=289.39ms p(90)=52.53ms p(95)=57.15ms p(99.9)=78.95ms 
       { expected_response:true }...: avg=37.56ms min=1.94ms  med=37.22ms max=289.39ms p(90)=52.53ms p(95)=57.15ms p(99.9)=78.95ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 158805
     http_req_receiving.............: avg=73.08µs min=27.89µs med=60.43µs max=99.84ms  p(90)=95.48µs p(95)=110.3µs p(99.9)=905.54µs
     http_req_sending...............: avg=23.29µs min=4.93µs  med=10.69µs max=57.17ms  p(90)=16.8µs  p(95)=20.93µs p(99.9)=989.81µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=37.47ms min=1.89ms  med=37.13ms max=288.93ms p(90)=52.44ms p(95)=57.04ms p(99.9)=78.79ms 
     http_reqs......................: 158805  1320.463083/s
     iteration_duration.............: avg=37.79ms min=3.45ms  med=37.43ms max=318.59ms p(90)=52.73ms p(95)=57.35ms p(99.9)=79.43ms 
     iterations.....................: 158705  1319.631583/s
     success_rate...................: 100.00% ✓ 158705      ✗ 0     
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

     checks.........................: 100.00% ✓ 222210     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   740 kB/s
     http_req_blocked...............: avg=3.81µs   min=1.02µs  med=2.2µs   max=3.69ms   p(90)=3.78µs  p(95)=4.37µs   p(99.9)=41.85µs 
     http_req_connecting............: avg=1.27µs   min=0s      med=0s      max=3.64ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.69ms  min=3.58ms  med=78.92ms max=342.02ms p(90)=98.82ms p(95)=108.36ms p(99.9)=187.19ms
       { expected_response:true }...: avg=80.69ms  min=3.58ms  med=78.92ms max=342.02ms p(90)=98.82ms p(95)=108.36ms p(99.9)=187.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74170
     http_req_receiving.............: avg=137.77µs min=28.64µs med=64.05µs max=228.39ms p(90)=98.61µs p(95)=111.94µs p(99.9)=1.32ms  
     http_req_sending...............: avg=19.78µs  min=4.64µs  med=11.03µs max=230.44ms p(90)=17.76µs p(95)=19.74µs  p(99.9)=543µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.53ms  min=3.53ms  med=78.83ms max=213.23ms p(90)=98.73ms p(95)=108.26ms p(99.9)=183.96ms
     http_reqs......................: 74170   615.6648/s
     iteration_duration.............: avg=81.01ms  min=5.24ms  med=79.15ms max=353.7ms  p(90)=99.06ms p(95)=108.61ms p(99.9)=188.19ms
     iterations.....................: 74070   614.834728/s
     success_rate...................: 100.00% ✓ 74070      ✗ 0    
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

     checks.........................: 100.00% ✓ 174672     ✗ 0    
     data_received..................: 5.1 GB  42 MB/s
     data_sent......................: 70 MB   581 kB/s
     http_req_blocked...............: avg=4.78µs   min=1.14µs  med=2.93µs   max=3.92ms   p(90)=4.4µs    p(95)=4.95µs   p(99.9)=69.21µs 
     http_req_connecting............: avg=1.62µs   min=0s      med=0s       max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.65ms min=4.66ms  med=102.46ms max=327.22ms p(90)=123.67ms p(95)=130.11ms p(99.9)=161.7ms 
       { expected_response:true }...: avg=102.65ms min=4.66ms  med=102.46ms max=327.22ms p(90)=123.67ms p(95)=130.11ms p(99.9)=161.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 58324
     http_req_receiving.............: avg=84.84µs  min=28.36µs med=74.94µs  max=238.01ms p(90)=106.84µs p(95)=119.75µs p(99.9)=560.82µs
     http_req_sending...............: avg=23.46µs  min=5.12µs  med=14.19µs  max=114.48ms p(90)=20.09µs  p(95)=22µs     p(99.9)=542.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.54ms min=4.52ms  med=102.37ms max=323.3ms  p(90)=123.57ms p(95)=130.01ms p(99.9)=161.37ms
     http_reqs......................: 58324   483.589048/s
     iteration_duration.............: avg=103.07ms min=31.62ms med=102.73ms max=340.1ms  p(90)=123.93ms p(95)=130.36ms p(99.9)=162.6ms 
     iterations.....................: 58224   482.759905/s
     success_rate...................: 100.00% ✓ 58224      ✗ 0    
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

     checks.........................: 100.00% ✓ 101355     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.7µs    min=1.39µs  med=3.65µs   max=4.15ms   p(90)=5.12µs   p(95)=5.76µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.78µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=176.89ms min=5.61ms  med=161.95ms max=612.69ms p(90)=209.25ms p(95)=254.85ms p(99.9)=537.55ms
       { expected_response:true }...: avg=176.89ms min=5.61ms  med=161.95ms max=612.69ms p(90)=209.25ms p(95)=254.85ms p(99.9)=537.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33885
     http_req_receiving.............: avg=96.99µs  min=36.3µs  med=89.11µs  max=55.08ms  p(90)=119.92µs p(95)=132µs    p(99.9)=648.34µs
     http_req_sending...............: avg=35.8µs   min=7.01µs  med=18.18µs  max=166.43ms p(90)=23.16µs  p(95)=25.03µs  p(99.9)=564.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.76ms min=5.49ms  med=161.83ms max=612.6ms  p(90)=209.13ms p(95)=254.73ms p(99.9)=537.45ms
     http_reqs......................: 33885   280.546531/s
     iteration_duration.............: avg=177.69ms min=32.88ms med=162.3ms  max=612.89ms p(90)=209.61ms p(95)=256.09ms p(99.9)=537.79ms
     iterations.....................: 33785   279.718594/s
     success_rate...................: 100.00% ✓ 33785      ✗ 0    
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

     checks.........................: 100.00% ✓ 100683     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=5.55µs   min=1.14µs  med=2.82µs   max=3.49ms   p(90)=4.02µs   p(95)=4.5µs    p(99.9)=1.19ms  
     http_req_connecting............: avg=2.56µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=178.11ms min=7.38ms  med=178.28ms max=327.2ms  p(90)=186.69ms p(95)=191.4ms  p(99.9)=251.68ms
       { expected_response:true }...: avg=178.11ms min=7.38ms  med=178.28ms max=327.2ms  p(90)=186.69ms p(95)=191.4ms  p(99.9)=251.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33661
     http_req_receiving.............: avg=88.47µs  min=30.9µs  med=77.78µs  max=86.66ms  p(90)=107.84µs p(95)=119µs    p(99.9)=547.78µs
     http_req_sending...............: avg=25.61µs  min=5.4µs   med=15.36µs  max=81.65ms  p(90)=19.88µs  p(95)=21.56µs  p(99.9)=503.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.99ms min=7.28ms  med=178.19ms max=326.63ms p(90)=186.6ms  p(95)=191.28ms p(99.9)=251.42ms
     http_reqs......................: 33661   278.392998/s
     iteration_duration.............: avg=178.88ms min=26.98ms med=178.55ms max=349.1ms  p(90)=186.97ms p(95)=191.68ms p(99.9)=253.14ms
     iterations.....................: 33561   277.565949/s
     success_rate...................: 100.00% ✓ 33561      ✗ 0    
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
data_received..................: 9.0 MB 150 kB/s
     data_sent......................: 114 kB 1.9 kB/s
     http_req_blocked...............: avg=19.27µs  min=2.68µs  med=3.39µs  max=1.48ms   p(90)=4.55µs   p(95)=4.83µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=14.72µs  min=0s      med=0s      max=1.38ms   p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=355.93ms min=25.78ms med=37.54ms max=30.02s   p(90)=43.09ms  p(95)=45ms     p(99.9)=27.23s  
       { expected_response:true }...: avg=355.93ms min=25.78ms med=37.54ms max=30.02s   p(90)=43.09ms  p(95)=45ms     p(99.9)=27.23s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 94  
     http_req_receiving.............: avg=111.33µs min=70.94µs med=92.4µs  max=366.83µs p(90)=142.29µs p(95)=199.18µs p(99.9)=363.67µs
     http_req_sending...............: avg=20.87µs  min=15.03µs med=18.37µs max=162.35µs p(90)=21.26µs  p(95)=24.37µs  p(99.9)=154.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=355.79ms min=25.64ms med=37.41ms max=30.02s   p(90)=42.97ms  p(95)=44.88ms  p(99.9)=27.23s  
     http_reqs......................: 94     1.566661/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
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

     checks.........................: 100.00% ✓ 951753      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 381 MB  3.2 MB/s
     http_req_blocked...............: avg=3.54µs  min=982ns   med=2.83µs  max=10.91ms  p(90)=4.56µs  p(95)=5.38µs   p(99.9)=39.62µs
     http_req_connecting............: avg=274ns   min=0s      med=0s      max=3.51ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=18.68ms min=1.67ms  med=18.28ms max=299.9ms  p(90)=25.89ms p(95)=28.5ms   p(99.9)=48.82ms
       { expected_response:true }...: avg=18.68ms min=1.67ms  med=18.28ms max=299.9ms  p(90)=25.89ms p(95)=28.5ms   p(99.9)=48.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317351
     http_req_receiving.............: avg=97.52µs min=26.27µs med=52.72µs max=236.91ms p(90)=95.39µs p(95)=164.46µs p(99.9)=7.39ms 
     http_req_sending...............: avg=48.64µs min=4.93µs  med=10.94µs max=130.91ms p(90)=19.27µs p(95)=105.53µs p(99.9)=3.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.53ms min=1.58ms  med=18.16ms max=299.17ms p(90)=25.73ms p(95)=28.26ms  p(99.9)=47.78ms
     http_reqs......................: 317351  2639.86984/s
     iteration_duration.............: avg=18.9ms  min=3.5ms   med=18.49ms max=329.18ms p(90)=26.11ms p(95)=28.72ms  p(99.9)=49.35ms
     iterations.....................: 317251  2639.037995/s
     success_rate...................: 100.00% ✓ 317251      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 917097      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=2.78µs  min=872ns   med=2.01µs   max=14.64ms  p(90)=3.68µs  p(95)=4.5µs   p(99.9)=30.41µs
     http_req_connecting............: avg=215ns   min=0s      med=0s       max=3.28ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.39ms min=1.49ms  med=18.32ms  max=311.93ms p(90)=28.13ms p(95)=31.93ms p(99.9)=54.26ms
       { expected_response:true }...: avg=19.39ms min=1.49ms  med=18.32ms  max=311.93ms p(90)=28.13ms p(95)=31.93ms p(99.9)=54.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305799
     http_req_receiving.............: avg=1.21ms  min=51.65µs med=166.58µs max=276.31ms p(90)=3.1ms   p(95)=4.25ms  p(99.9)=25.75ms
     http_req_sending...............: avg=43.48µs min=4.35µs  med=8.61µs   max=63.7ms   p(90)=19.25µs p(95)=92.46µs p(99.9)=4.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.14ms min=1.41ms  med=17.04ms  max=123.93ms p(90)=26.61ms p(95)=30.35ms p(99.9)=50.73ms
     http_reqs......................: 305799  2544.229115/s
     iteration_duration.............: avg=19.61ms min=2.51ms  med=18.53ms  max=336.8ms  p(90)=28.35ms p(95)=32.16ms p(99.9)=54.75ms
     iterations.....................: 305699  2543.397121/s
     success_rate...................: 100.00% ✓ 305699      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 889542      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=2.91µs   min=841ns   med=2.09µs  max=9.56ms   p(90)=3.76µs  p(95)=4.53µs  p(99.9)=33.8µs  
     http_req_connecting............: avg=325ns    min=0s      med=0s      max=3.61ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.01ms  min=1.6ms   med=16.86ms max=341.78ms p(90)=32.68ms p(95)=40.03ms p(99.9)=140.99ms
       { expected_response:true }...: avg=20.01ms  min=1.6ms   med=16.86ms max=341.78ms p(90)=32.68ms p(95)=40.03ms p(99.9)=140.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296614
     http_req_receiving.............: avg=565.39µs min=50.44µs med=94.03µs max=276.17ms p(90)=1.07ms  p(95)=1.86ms  p(99.9)=26.45ms 
     http_req_sending...............: avg=40.15µs  min=4.53µs  med=8.74µs  max=131.62ms p(90)=17.31µs p(95)=71.36µs p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.4ms   min=1.49ms  med=16.34ms max=339.67ms p(90)=31.74ms p(95)=38.87ms p(99.9)=137.88ms
     http_reqs......................: 296614  2467.354495/s
     iteration_duration.............: avg=20.22ms  min=2.52ms  med=17.05ms max=341.99ms p(90)=32.9ms  p(95)=40.25ms p(99.9)=141.74ms
     iterations.....................: 296514  2466.522655/s
     success_rate...................: 100.00% ✓ 296514      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 853620      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=2.68µs   min=841ns  med=1.98µs  max=6.65ms   p(90)=3.35µs  p(95)=4.03µs  p(99.9)=30.69µs 
     http_req_connecting............: avg=313ns    min=0s     med=0s      max=3.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.86ms  min=1.64ms med=17.4ms  max=433.29ms p(90)=34.28ms p(95)=42.06ms p(99.9)=156.75ms
       { expected_response:true }...: avg=20.86ms  min=1.64ms med=17.4ms  max=433.29ms p(90)=34.28ms p(95)=42.06ms p(99.9)=156.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284640
     http_req_receiving.............: avg=593.68µs min=51.4µs med=96.61µs max=257.92ms p(90)=1.09ms  p(95)=1.89ms  p(99.9)=27.26ms 
     http_req_sending...............: avg=41.11µs  min=4.55µs med=8.61µs  max=161.49ms p(90)=16.77µs p(95)=62.28µs p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.22ms  min=1.55ms med=16.87ms max=433.1ms  p(90)=33.27ms p(95)=40.91ms p(99.9)=154.75ms
     http_reqs......................: 284640  2367.819078/s
     iteration_duration.............: avg=21.07ms  min=2.64ms med=17.6ms  max=433.69ms p(90)=34.51ms p(95)=42.29ms p(99.9)=157.7ms 
     iterations.....................: 284540  2366.987213/s
     success_rate...................: 100.00% ✓ 284540      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 826785      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 331 MB  2.8 MB/s
     http_req_blocked...............: avg=13.84µs  min=872ns   med=2.17µs  max=154.02ms p(90)=3.92µs  p(95)=4.68µs  p(99.9)=35.45µs 
     http_req_connecting............: avg=11.13µs  min=0s      med=0s      max=145.09ms p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.53ms  min=1.94ms  med=18.19ms max=322.58ms p(90)=34.98ms p(95)=43.22ms p(99.9)=149.64ms
       { expected_response:true }...: avg=21.53ms  min=1.94ms  med=18.19ms max=322.58ms p(90)=34.98ms p(95)=43.22ms p(99.9)=149.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 275695
     http_req_receiving.............: avg=573.35µs min=51.01µs med=98.86µs max=181.79ms p(90)=1.11ms  p(95)=1.89ms  p(99.9)=26.53ms 
     http_req_sending...............: avg=42.75µs  min=4.49µs  med=9.44µs  max=121.88ms p(90)=19.97µs p(95)=78.19µs p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.91ms  min=1.77ms  med=17.66ms max=321.51ms p(90)=34.01ms p(95)=42.1ms  p(99.9)=147.22ms
     http_reqs......................: 275695  2292.833811/s
     iteration_duration.............: avg=21.76ms  min=2.97ms  med=18.4ms  max=322.89ms p(90)=35.21ms p(95)=43.46ms p(99.9)=152.57ms
     iterations.....................: 275595  2292.002155/s
     success_rate...................: 100.00% ✓ 275595      ✗ 0     
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

     checks.........................: 100.00% ✓ 597504      ✗ 0     
     data_received..................: 18 GB   145 MB/s
     data_sent......................: 239 MB  2.0 MB/s
     http_req_blocked...............: avg=3.49µs  min=852ns   med=2.22µs  max=26.73ms  p(90)=4.51µs   p(95)=5.63µs   p(99.9)=46.07µs
     http_req_connecting............: avg=480ns   min=0s      med=0s      max=3.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.87ms min=2.25ms  med=29.4ms  max=305.75ms p(90)=39.42ms  p(95)=42.78ms  p(99.9)=63.54ms
       { expected_response:true }...: avg=29.87ms min=2.25ms  med=29.4ms  max=305.75ms p(90)=39.42ms  p(95)=42.78ms  p(99.9)=63.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199268
     http_req_receiving.............: avg=95.37µs min=26.29µs med=54.65µs max=165.75ms p(90)=126.36µs p(95)=201.93µs p(99.9)=4.07ms 
     http_req_sending...............: avg=41.05µs min=4.61µs  med=9.33µs  max=183.27ms p(90)=24.87µs  p(95)=109.43µs p(99.9)=2.77ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.73ms min=2.18ms  med=29.28ms max=287.14ms p(90)=39.27ms  p(95)=42.6ms   p(99.9)=63.14ms
     http_reqs......................: 199268  1656.656779/s
     iteration_duration.............: avg=30.11ms min=4.51ms  med=29.62ms max=323.81ms p(90)=39.64ms  p(95)=43ms     p(99.9)=64.28ms
     iterations.....................: 199168  1655.825408/s
     success_rate...................: 100.00% ✓ 199168      ✗ 0     
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

     checks.........................: 100.00% ✓ 428367      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.43µs   min=1.01µs  med=2.41µs  max=3.96ms   p(90)=4.06µs   p(95)=4.75µs   p(99.9)=39.16µs 
     http_req_connecting............: avg=664ns    min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.76ms  min=2.15ms  med=41.38ms max=276.54ms p(90)=58.05ms  p(95)=63.07ms  p(99.9)=86.95ms 
       { expected_response:true }...: avg=41.76ms  min=2.15ms  med=41.38ms max=276.54ms p(90)=58.05ms  p(95)=63.07ms  p(99.9)=86.95ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142889
     http_req_receiving.............: avg=103.76µs min=25.29µs med=64.68µs max=182.4ms  p(90)=106.15µs p(95)=123.95µs p(99.9)=1.01ms  
     http_req_sending...............: avg=22.33µs  min=4.78µs  med=11.14µs max=37.7ms   p(90)=18.71µs  p(95)=22.28µs  p(99.9)=909.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.64ms  min=2.03ms  med=41.28ms max=131.82ms p(90)=57.95ms  p(95)=62.96ms  p(99.9)=86.1ms  
     http_reqs......................: 142889  1187.811019/s
     iteration_duration.............: avg=42.01ms  min=4.2ms   med=41.58ms max=328.42ms p(90)=58.26ms  p(95)=63.28ms  p(99.9)=87.44ms 
     iterations.....................: 142789  1186.979737/s
     success_rate...................: 100.00% ✓ 142789      ✗ 0     
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

     checks.........................: 100.00% ✓ 217047     ✗ 0    
     data_received..................: 6.3 GB  53 MB/s
     data_sent......................: 87 MB   722 kB/s
     http_req_blocked...............: avg=4.21µs  min=1.06µs  med=2.67µs  max=4.22ms   p(90)=4.22µs   p(95)=4.85µs   p(99.9)=47.18µs 
     http_req_connecting............: avg=1.28µs  min=0s      med=0s      max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=82.58ms min=3.81ms  med=80.68ms max=328.16ms p(90)=100.92ms p(95)=110.81ms p(99.9)=194.77ms
       { expected_response:true }...: avg=82.58ms min=3.81ms  med=80.68ms max=328.16ms p(90)=100.92ms p(95)=110.81ms p(99.9)=194.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 72449
     http_req_receiving.............: avg=83.42µs min=28.92µs med=71.69µs max=158.46ms p(90)=109.16µs p(95)=123.28µs p(99.9)=695.79µs
     http_req_sending...............: avg=26.67µs min=4.92µs  med=13.12µs max=163.11ms p(90)=20.32µs  p(95)=22.52µs  p(99.9)=672.41µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.47ms min=3.71ms  med=80.57ms max=327.35ms p(90)=100.8ms  p(95)=110.69ms p(99.9)=194.23ms
     http_reqs......................: 72449   601.215608/s
     iteration_duration.............: avg=82.94ms min=25.64ms med=80.93ms max=336.19ms p(90)=101.18ms p(95)=111.09ms p(99.9)=195.82ms
     iterations.....................: 72349   600.385761/s
     success_rate...................: 100.00% ✓ 72349      ✗ 0    
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

     checks.........................: 100.00% ✓ 161202     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   536 kB/s
     http_req_blocked...............: avg=5.84µs   min=1.3µs   med=3.68µs   max=3.74ms   p(90)=5.16µs   p(95)=5.76µs   p(99.9)=79.87µs 
     http_req_connecting............: avg=1.89µs   min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.21ms min=5.26ms  med=108.88ms max=322.15ms p(90)=146.99ms p(95)=158.03ms p(99.9)=202.9ms 
       { expected_response:true }...: avg=111.21ms min=5.26ms  med=108.88ms max=322.15ms p(90)=146.99ms p(95)=158.03ms p(99.9)=202.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 53834
     http_req_receiving.............: avg=90.15µs  min=33.08µs med=86.81µs  max=20.71ms  p(90)=117.47µs p(95)=129.98µs p(99.9)=600.95µs
     http_req_sending...............: avg=32.46µs  min=5.83µs  med=18.21µs  max=148.77ms p(90)=23.53µs  p(95)=25.55µs  p(99.9)=577.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.09ms min=5.12ms  med=108.77ms max=320.3ms  p(90)=146.88ms p(95)=157.91ms p(99.9)=202.72ms
     http_reqs......................: 53834   446.141924/s
     iteration_duration.............: avg=111.69ms min=21.17ms med=109.24ms max=330.88ms p(90)=147.29ms p(95)=158.35ms p(99.9)=204.2ms 
     iterations.....................: 53734   445.313188/s
     success_rate...................: 100.00% ✓ 53734      ✗ 0    
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

     checks.........................: 100.00% ✓ 97776      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=7.14µs   min=1.34µs  med=3.86µs   max=4.02ms   p(90)=5.43µs   p(95)=6.1µs    p(99.9)=1.46ms  
     http_req_connecting............: avg=2.96µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=183.33ms min=5.99ms  med=169.3ms  max=669.52ms p(90)=207.78ms p(95)=258.03ms p(99.9)=527.75ms
       { expected_response:true }...: avg=183.33ms min=5.99ms  med=169.3ms  max=669.52ms p(90)=207.78ms p(95)=258.03ms p(99.9)=527.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32692
     http_req_receiving.............: avg=100.56µs min=34.85µs med=93.54µs  max=70.36ms  p(90)=125.3µs  p(95)=138.62µs p(99.9)=677.73µs
     http_req_sending...............: avg=28.25µs  min=6.66µs  med=19.68µs  max=63.99ms  p(90)=24.63µs  p(95)=26.64µs  p(99.9)=552.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.2ms  min=5.91ms  med=169.18ms max=669.42ms p(90)=207.66ms p(95)=256.85ms p(99.9)=527.64ms
     http_reqs......................: 32692   270.556347/s
     iteration_duration.............: avg=184.19ms min=16.47ms med=169.66ms max=669.76ms p(90)=208.18ms p(95)=260.08ms p(99.9)=528.03ms
     iterations.....................: 32592   269.728755/s
     success_rate...................: 100.00% ✓ 32592      ✗ 0    
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

     checks.........................: 100.00% ✓ 94149      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.81µs   min=1.45µs  med=3.62µs   max=4.11ms   p(90)=4.98µs   p(95)=5.57µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.94µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=190.4ms  min=7.83ms  med=192.15ms max=401.05ms p(90)=213.84ms p(95)=218.51ms p(99.9)=287.38ms
       { expected_response:true }...: avg=190.4ms  min=7.83ms  med=192.15ms max=401.05ms p(90)=213.84ms p(95)=218.51ms p(99.9)=287.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31483
     http_req_receiving.............: avg=96.95µs  min=34.04µs med=88.6µs   max=96.54ms  p(90)=120.04µs p(95)=131.93µs p(99.9)=580.54µs
     http_req_sending...............: avg=32.38µs  min=6.19µs  med=18.28µs  max=160.87ms p(90)=22.93µs  p(95)=24.82µs  p(99.9)=549.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.27ms min=7.75ms  med=192.02ms max=391.84ms p(90)=213.72ms p(95)=218.39ms p(99.9)=287.02ms
     http_reqs......................: 31483   260.141851/s
     iteration_duration.............: avg=191.3ms  min=30.47ms med=192.76ms max=408.59ms p(90)=214.14ms p(95)=218.83ms p(99.9)=291.2ms 
     iterations.....................: 31383   259.315558/s
     success_rate...................: 100.00% ✓ 31383      ✗ 0    
     vus............................: 22      min=22       max=50 
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

     checks.........................: 100.00% ✓ 9705      ✗ 0   
     data_received..................: 319 MB  2.6 MB/s
     data_sent......................: 4.0 MB  32 kB/s
     http_req_blocked...............: avg=34.14µs  min=1.2µs   med=3.51µs  max=4.32ms  p(90)=5.19µs   p(95)=6µs      p(99.9)=3.81ms
     http_req_connecting............: avg=30µs     min=0s      med=0s      max=4.28ms  p(90)=0s       p(95)=0s       p(99.9)=3.77ms
     http_req_duration..............: avg=1.81s    min=22.14ms med=1.84s   max=4.55s   p(90)=2.52s    p(95)=2.73s    p(99.9)=3.69s 
       { expected_response:true }...: avg=1.81s    min=22.14ms med=1.84s   max=4.55s   p(90)=2.52s    p(95)=2.73s    p(99.9)=3.69s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 3335
     http_req_receiving.............: avg=120.29µs min=33.92µs med=100.4µs max=16.61ms p(90)=144.19µs p(95)=164.63µs p(99.9)=3.08ms
     http_req_sending...............: avg=48.53µs  min=5.97µs  med=19.68µs max=26.45ms p(90)=25.29µs  p(95)=29.23µs  p(99.9)=4.35ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.81s    min=22.03ms med=1.84s   max=4.55s   p(90)=2.52s    p(95)=2.73s    p(99.9)=3.69s 
     http_reqs......................: 3335    26.732733/s
     iteration_duration.............: avg=1.87s    min=99.61ms med=1.86s   max=4.55s   p(90)=2.53s    p(95)=2.74s    p(99.9)=3.7s  
     iterations.....................: 3235    25.931152/s
     success_rate...................: 100.00% ✓ 3235      ✗ 0   
     vus............................: 44      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

