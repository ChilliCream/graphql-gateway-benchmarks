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
| hive-router | v0.0.84 | 2,914 | 3,201 | 2,844 | 4.1% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,674 | 2,818 | 2,660 | 2.1% |  |
| fusion-nightly | 16.7.0-p.8 | 2,565 | 2,700 | 2,547 | 2.1% |  |
| fusion | 16.6.6 | 2,555 | 2,687 | 2,525 | 2.2% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,478 | 2,539 | 2,470 | 0.9% |  |
| grafbase | 0.53.5 | 2,120 | 2,225 | 2,086 | 2.4% |  |
| cosmo | 0.334.0 | 1,328 | 1,377 | 1,314 | 1.8% |  |
| hive-gateway-router-runtime | 2.10.8 | 631 | 649 | 628 | 1.1% |  |
| apollo-router | v2.16.1 | 445 | 465 | 440 | 1.9% |  |
| apollo-gateway | 2.14.3 | 282 | 284 | 279 | 0.6% |  |
| hive-gateway | 2.10.8 | 278 | 286 | 276 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1246 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,475 | 2,643 | 2,431 | 2.8% |  |
| fusion-nightly | 16.7.0-p.8 | 2,463 | 2,574 | 2,451 | 1.8% |  |
| fusion-nightly-net11 | 16.7.0-p.8 | 2,443 | 2,545 | 2,430 | 1.6% |  |
| fusion | 16.6.6 | 2,389 | 2,512 | 2,370 | 2.1% |  |
| fusion-nightly-fed | 16.7.0-p.8 | 2,290 | 2,394 | 2,276 | 1.7% |  |
| grafbase | 0.53.5 | 1,630 | 1,684 | 1,627 | 1.3% |  |
| cosmo | 0.334.0 | 1,231 | 1,272 | 1,227 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 572 | 599 | 569 | 1.8% |  |
| apollo-router | v2.16.1 | 450 | 465 | 442 | 1.6% |  |
| hive-gateway | 2.10.8 | 267 | 277 | 266 | 1.3% |  |
| apollo-gateway | 2.14.3 | 264 | 269 | 263 | 0.9% |  |
| feddi | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1050474     ✗ 0     
     data_received..................: 31 GB   256 MB/s
     data_sent......................: 421 MB  3.5 MB/s
     http_req_blocked...............: avg=2.97µs  min=882ns   med=2.2µs   max=17.56ms  p(90)=3.52µs  p(95)=4.12µs   p(99.9)=33.94µs
     http_req_connecting............: avg=241ns   min=0s      med=0s      max=3.41ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.92ms min=1.44ms  med=16.2ms  max=302.54ms p(90)=24.88ms p(95)=28.17ms  p(99.9)=48.47ms
       { expected_response:true }...: avg=16.92ms min=1.44ms  med=16.2ms  max=302.54ms p(90)=24.88ms p(95)=28.17ms  p(99.9)=48.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 350258
     http_req_receiving.............: avg=90.63µs min=26.36µs med=47.46µs max=141.57ms p(90)=84.2µs  p(95)=149.54µs p(99.9)=7.43ms 
     http_req_sending...............: avg=48.12µs min=4.79µs  med=8.65µs  max=120.85ms p(90)=14.8µs  p(95)=93.36µs  p(99.9)=6.67ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.78ms min=1.38ms  med=16.08ms max=301.94ms p(90)=24.7ms  p(95)=27.93ms  p(99.9)=47.63ms
     http_reqs......................: 350258  2914.274438/s
     iteration_duration.............: avg=17.12ms min=1.98ms  med=16.39ms max=314.03ms p(90)=25.08ms p(95)=28.39ms  p(99.9)=49.35ms
     iterations.....................: 350158  2913.442402/s
     success_rate...................: 100.00% ✓ 350158      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 964641      ✗ 0     
     data_received..................: 28 GB   234 MB/s
     data_sent......................: 387 MB  3.2 MB/s
     http_req_blocked...............: avg=2.77µs  min=901ns   med=1.96µs   max=16.28ms  p(90)=3.23µs  p(95)=3.89µs  p(99.9)=25.73µs
     http_req_connecting............: avg=299ns   min=0s      med=0s       max=3.58ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.43ms min=1.92ms  med=17.36ms  max=293.16ms p(90)=26.34ms p(95)=30.02ms p(99.9)=51.07ms
       { expected_response:true }...: avg=18.43ms min=1.92ms  med=17.36ms  max=293.16ms p(90)=26.34ms p(95)=30.02ms p(99.9)=51.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 321647
     http_req_receiving.............: avg=1.06ms  min=52.43µs med=135.75µs max=141.22ms p(90)=2.68ms  p(95)=3.68ms  p(99.9)=24.12ms
     http_req_sending...............: avg=44.97µs min=4.48µs  med=8.23µs   max=186.48ms p(90)=15.36µs p(95)=86.89µs p(99.9)=5.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.33ms min=1.79ms  med=16.26ms  max=292.74ms p(90)=24.94ms p(95)=28.6ms  p(99.9)=48.47ms
     http_reqs......................: 321647  2674.777157/s
     iteration_duration.............: avg=18.65ms min=3.47ms  med=17.56ms  max=302.63ms p(90)=26.56ms p(95)=30.26ms p(99.9)=51.72ms
     iterations.....................: 321547  2673.94557/s
     success_rate...................: 100.00% ✓ 321547      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 925323      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=3.24µs   min=1.01µs  med=2.28µs  max=16.5ms   p(90)=3.46µs  p(95)=4.01µs  p(99.9)=32.95µs 
     http_req_connecting............: avg=310ns    min=0s      med=0s      max=3.6ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.23ms  min=1.96ms  med=16.55ms max=289.89ms p(90)=31.44ms p(95)=38.01ms p(99.9)=115.07ms
       { expected_response:true }...: avg=19.23ms  min=1.96ms  med=16.55ms max=289.89ms p(90)=31.44ms p(95)=38.01ms p(99.9)=115.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 308541
     http_req_receiving.............: avg=577.63µs min=51.25µs med=90.68µs max=160.11ms p(90)=1.09ms  p(95)=2ms     p(99.9)=25.78ms 
     http_req_sending...............: avg=43.14µs  min=4.92µs  med=8.62µs  max=147.83ms p(90)=14.52µs p(95)=84.35µs p(99.9)=4.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.61ms  min=1.88ms  med=16ms    max=289.47ms p(90)=30.49ms p(95)=36.88ms p(99.9)=113.36ms
     http_reqs......................: 308541  2565.705292/s
     iteration_duration.............: avg=19.44ms  min=3.1ms   med=16.74ms max=301.17ms p(90)=31.66ms p(95)=38.23ms p(99.9)=115.99ms
     iterations.....................: 308441  2564.873731/s
     success_rate...................: 100.00% ✓ 308441      ✗ 0     
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

     checks.........................: 100.00% ✓ 921474      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=2.62µs   min=912ns   med=1.86µs  max=22.14ms  p(90)=2.9µs   p(95)=3.41µs  p(99.9)=26.87µs 
     http_req_connecting............: avg=295ns    min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.31ms  min=1.97ms  med=16.51ms max=404.07ms p(90)=31.42ms p(95)=38.25ms p(99.9)=129.03ms
       { expected_response:true }...: avg=19.31ms  min=1.97ms  med=16.51ms max=404.07ms p(90)=31.42ms p(95)=38.25ms p(99.9)=129.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307258
     http_req_receiving.............: avg=576.77µs min=50.08µs med=91.14µs max=160.58ms p(90)=1.08ms  p(95)=1.95ms  p(99.9)=25.92ms 
     http_req_sending...............: avg=40.32µs  min=4.57µs  med=8.12µs  max=154.63ms p(90)=13.57µs p(95)=76.38µs p(99.9)=3.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.7ms   min=1.86ms  med=15.97ms max=403.97ms p(90)=30.45ms p(95)=37.08ms p(99.9)=127.34ms
     http_reqs......................: 307258  2555.347271/s
     iteration_duration.............: avg=19.52ms  min=2.9ms   med=16.69ms max=404.26ms p(90)=31.63ms p(95)=38.48ms p(99.9)=129.77ms
     iterations.....................: 307158  2554.515609/s
     success_rate...................: 100.00% ✓ 307158      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 893436      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.69µs   min=881ns   med=1.89µs  max=13.31ms  p(90)=3.18µs  p(95)=3.8µs   p(99.9)=29.39µs 
     http_req_connecting............: avg=283ns    min=0s      med=0s      max=3.35ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.93ms  min=1.67ms  med=16.15ms max=456.93ms p(90)=34.25ms p(95)=43.19ms p(99.9)=154.23ms
       { expected_response:true }...: avg=19.93ms  min=1.67ms  med=16.15ms max=456.93ms p(90)=34.25ms p(95)=43.19ms p(99.9)=154.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297912
     http_req_receiving.............: avg=558.92µs min=49.52µs med=88.98µs max=141.45ms p(90)=1.02ms  p(95)=1.79ms  p(99.9)=27.72ms 
     http_req_sending...............: avg=38.63µs  min=4.38µs  med=8.12µs  max=104.16ms p(90)=15.01µs p(95)=49.02µs p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.33ms  min=1.6ms   med=15.65ms max=456.8ms  p(90)=33.25ms p(95)=42.04ms p(99.9)=153.21ms
     http_reqs......................: 297912  2478.159841/s
     iteration_duration.............: avg=20.13ms  min=2.48ms  med=16.35ms max=457.1ms  p(90)=34.49ms p(95)=43.42ms p(99.9)=155.07ms
     iterations.....................: 297812  2477.327998/s
     success_rate...................: 100.00% ✓ 297812      ✗ 0     
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

     checks.........................: 100.00% ✓ 764571      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=2.95µs  min=872ns   med=2.1µs   max=13.43ms  p(90)=3.59µs  p(95)=4.33µs   p(99.9)=31.31µs
     http_req_connecting............: avg=356ns   min=0s      med=0s      max=3.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.32ms min=1.74ms  med=23.07ms max=291.22ms p(90)=27.57ms p(95)=29.25ms  p(99.9)=47.23ms
       { expected_response:true }...: avg=23.32ms min=1.74ms  med=23.07ms max=291.22ms p(90)=27.57ms p(95)=29.25ms  p(99.9)=47.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 254957
     http_req_receiving.............: avg=86.04µs min=29.12µs med=55.03µs max=74.92ms  p(90)=92.37µs p(95)=115.59µs p(99.9)=5.22ms 
     http_req_sending...............: avg=34.38µs min=4.5µs   med=9.42µs  max=196.38ms p(90)=16.4µs  p(95)=23.94µs  p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.2ms  min=1.68ms  med=22.98ms max=290.96ms p(90)=27.45ms p(95)=29.09ms  p(99.9)=45.9ms 
     http_reqs......................: 254957  2120.728144/s
     iteration_duration.............: avg=23.53ms min=5.58ms  med=23.26ms max=318.67ms p(90)=27.77ms p(95)=29.45ms  p(99.9)=47.63ms
     iterations.....................: 254857  2119.896346/s
     success_rate...................: 100.00% ✓ 254857      ✗ 0     
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

     checks.........................: 100.00% ✓ 479121      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.13µs  min=1.09µs  med=2.56µs  max=1.81ms   p(90)=4.07µs  p(95)=4.74µs   p(99.9)=34.55µs 
     http_req_connecting............: avg=246ns   min=0s      med=0s      max=1.77ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.33ms min=2.03ms  med=36.87ms max=288.86ms p(90)=52.25ms p(95)=56.89ms  p(99.9)=78.8ms  
       { expected_response:true }...: avg=37.33ms min=2.03ms  med=36.87ms max=288.86ms p(90)=52.25ms p(95)=56.89ms  p(99.9)=78.8ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 159807
     http_req_receiving.............: avg=77.09µs min=27.24µs med=61.98µs max=85.72ms  p(90)=97.97µs p(95)=113.77µs p(99.9)=970.43µs
     http_req_sending...............: avg=26.34µs min=5.19µs  med=11.06µs max=146.97ms p(90)=17.22µs p(95)=21.35µs  p(99.9)=1.07ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.22ms min=1.91ms  med=36.77ms max=288.68ms p(90)=52.15ms p(95)=56.78ms  p(99.9)=78.48ms 
     http_reqs......................: 159807  1328.598934/s
     iteration_duration.............: avg=37.56ms min=3.69ms  med=37.08ms max=296.37ms p(90)=52.46ms p(95)=57.09ms  p(99.9)=79.2ms  
     iterations.....................: 159707  1327.767557/s
     success_rate...................: 100.00% ✓ 159707      ✗ 0     
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

     checks.........................: 100.00% ✓ 228093     ✗ 0    
     data_received..................: 6.7 GB  56 MB/s
     data_sent......................: 91 MB   759 kB/s
     http_req_blocked...............: avg=4.42µs  min=1.23µs  med=3.02µs  max=3.5ms    p(90)=4.56µs   p(95)=5.23µs   p(99.9)=48.18µs 
     http_req_connecting............: avg=1.13µs  min=0s      med=0s      max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=78.58ms min=3.59ms  med=76.84ms max=337.18ms p(90)=96.42ms  p(95)=105.6ms  p(99.9)=182.63ms
       { expected_response:true }...: avg=78.58ms min=3.59ms  med=76.84ms max=337.18ms p(90)=96.42ms  p(95)=105.6ms  p(99.9)=182.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 76131
     http_req_receiving.............: avg=80.61µs min=29.89µs med=71.06µs max=58.19ms  p(90)=107.93µs p(95)=121.69µs p(99.9)=652.85µs
     http_req_sending...............: avg=22.31µs min=5.53µs  med=13.85µs max=88.37ms  p(90)=20.82µs  p(95)=23.25µs  p(99.9)=643.89µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.48ms min=3.53ms  med=76.74ms max=336.52ms p(90)=96.31ms  p(95)=105.48ms p(99.9)=182.5ms 
     http_reqs......................: 76131   631.925403/s
     iteration_duration.............: avg=78.92ms min=26.95ms med=77.08ms max=351.88ms p(90)=96.68ms  p(95)=105.88ms p(99.9)=183.45ms
     iterations.....................: 76031   631.095353/s
     success_rate...................: 100.00% ✓ 76031      ✗ 0    
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

     checks.........................: 100.00% ✓ 160695     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   534 kB/s
     http_req_blocked...............: avg=4.89µs   min=1.19µs  med=3.19µs   max=4.15ms   p(90)=4.52µs   p(95)=5.09µs   p(99.9)=123.24µs
     http_req_connecting............: avg=1.42µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.58ms min=4.54ms  med=111.37ms max=317.14ms p(90)=134.66ms p(95)=141.9ms  p(99.9)=174.43ms
       { expected_response:true }...: avg=111.58ms min=4.54ms  med=111.37ms max=317.14ms p(90)=134.66ms p(95)=141.9ms  p(99.9)=174.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53665
     http_req_receiving.............: avg=86.29µs  min=32.09µs med=75.49µs  max=127.02ms p(90)=107.17µs p(95)=119.16µs p(99.9)=526.08µs
     http_req_sending...............: avg=28.88µs  min=5.64µs  med=15.45µs  max=166.89ms p(90)=20.92µs  p(95)=22.82µs  p(99.9)=541.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.47ms min=4.48ms  med=111.27ms max=316.73ms p(90)=134.55ms p(95)=141.78ms p(99.9)=172.89ms
     http_reqs......................: 53665   445.003635/s
     iteration_duration.............: avg=112.03ms min=25.28ms med=111.65ms max=334.83ms p(90)=134.91ms p(95)=142.15ms p(99.9)=175.26ms
     iterations.....................: 53565   444.17441/s
     success_rate...................: 100.00% ✓ 53565      ✗ 0    
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

     checks.........................: 100.00% ✓ 102249     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   339 kB/s
     http_req_blocked...............: avg=5.87µs   min=1.1µs   med=3.05µs   max=4.03ms   p(90)=4.33µs   p(95)=4.85µs   p(99.9)=1.13ms  
     http_req_connecting............: avg=2.64µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=175.35ms min=7.32ms  med=178.01ms max=390.6ms  p(90)=200.6ms  p(95)=209.85ms p(99.9)=273.08ms
       { expected_response:true }...: avg=175.35ms min=7.32ms  med=178.01ms max=390.6ms  p(90)=200.6ms  p(95)=209.85ms p(99.9)=273.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34183
     http_req_receiving.............: avg=98.92µs  min=28.75µs med=85.65µs  max=127.66ms p(90)=114.83µs p(95)=126.39µs p(99.9)=537.13µs
     http_req_sending...............: avg=28.64µs  min=5.22µs  med=16.44µs  max=125.56ms p(90)=20.74µs  p(95)=22.41µs  p(99.9)=519.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.23ms min=7.24ms  med=177.91ms max=386.81ms p(90)=200.48ms p(95)=209.72ms p(99.9)=272.79ms
     http_reqs......................: 34183   282.674948/s
     iteration_duration.............: avg=176.13ms min=38.87ms med=178.28ms max=398.25ms p(90)=200.87ms p(95)=210.14ms p(99.9)=273.62ms
     iterations.....................: 34083   281.848002/s
     success_rate...................: 100.00% ✓ 34083      ✗ 0    
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

     checks.........................: 100.00% ✓ 100467     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=6.73µs   min=1.37µs  med=3.57µs   max=4.08ms   p(90)=5µs      p(95)=5.64µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=178.43ms min=5.64ms  med=163.45ms max=627.17ms p(90)=208.77ms p(95)=247.33ms p(99.9)=543.5ms 
       { expected_response:true }...: avg=178.43ms min=5.64ms  med=163.45ms max=627.17ms p(90)=208.77ms p(95)=247.33ms p(99.9)=543.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33589
     http_req_receiving.............: avg=92.43µs  min=31.44µs med=87.62µs  max=31.81ms  p(90)=118.01µs p(95)=129.58µs p(99.9)=862.19µs
     http_req_sending...............: avg=29.44µs  min=6.59µs  med=17.8µs   max=81.95ms  p(90)=22.6µs   p(95)=24.41µs  p(99.9)=501.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.31ms min=5.5ms   med=163.33ms max=627.06ms p(90)=208.64ms p(95)=247.22ms p(99.9)=543.36ms
     http_reqs......................: 33589   278.059489/s
     iteration_duration.............: avg=179.25ms min=22.2ms  med=163.79ms max=627.39ms p(90)=209.22ms p(95)=248.92ms p(99.9)=543.88ms
     iterations.....................: 33489   277.23166/s
     success_rate...................: 100.00% ✓ 33489      ✗ 0    
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

     checks.........................: 100.00% ✓ 892497      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.97µs   min=812ns   med=2.17µs  max=21.04ms  p(90)=3.77µs  p(95)=4.57µs  p(99.9)=35.37µs
     http_req_connecting............: avg=295ns    min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.95ms  min=1.72ms  med=19.58ms max=308.12ms p(90)=28.09ms p(95)=30.66ms p(99.9)=49.11ms
       { expected_response:true }...: avg=19.95ms  min=1.72ms  med=19.58ms max=308.12ms p(90)=28.09ms p(95)=30.66ms p(99.9)=49.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297599
     http_req_receiving.............: avg=104.19µs min=24.81µs med=49.69µs max=278.7ms  p(90)=90.53µs p(95)=120.5µs p(99.9)=6.67ms 
     http_req_sending...............: avg=40.16µs  min=4.72µs  med=9.54µs  max=58.69ms  p(90)=17.46µs p(95)=36.48µs p(99.9)=3.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.8ms   min=1.64ms  med=19.47ms max=104.71ms p(90)=27.94ms p(95)=30.47ms p(99.9)=47.44ms
     http_reqs......................: 297599  2475.113169/s
     iteration_duration.............: avg=20.15ms  min=2.85ms  med=19.78ms max=324.18ms p(90)=28.29ms p(95)=30.87ms p(99.9)=49.64ms
     iterations.....................: 297499  2474.281475/s
     success_rate...................: 100.00% ✓ 297499      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 888198      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=3.37µs   min=1.09µs  med=2.65µs  max=8.79ms   p(90)=4.21µs  p(95)=4.95µs  p(99.9)=39.4µs  
     http_req_connecting............: avg=308ns    min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.02ms  min=1.58ms  med=16.91ms max=338.09ms p(90)=32.7ms  p(95)=39.99ms p(99.9)=143.25ms
       { expected_response:true }...: avg=20.02ms  min=1.58ms  med=16.91ms max=338.09ms p(90)=32.7ms  p(95)=39.99ms p(99.9)=143.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296166
     http_req_receiving.............: avg=579.93µs min=50.91µs med=98.4µs  max=281.44ms p(90)=1.07ms  p(95)=1.89ms  p(99.9)=27.33ms 
     http_req_sending...............: avg=45.75µs  min=4.85µs  med=9.97µs  max=256.83ms p(90)=18.75µs p(95)=99.63µs p(99.9)=3.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.4ms   min=1.46ms  med=16.39ms max=291.83ms p(90)=31.73ms p(95)=38.86ms p(99.9)=139.71ms
     http_reqs......................: 296166  2463.795962/s
     iteration_duration.............: avg=20.25ms  min=2.45ms  med=17.12ms max=349.01ms p(90)=32.93ms p(95)=40.23ms p(99.9)=144.21ms
     iterations.....................: 296066  2462.964065/s
     success_rate...................: 100.00% ✓ 296066      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 880815      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=6.53µs  min=1.04µs  med=2.63µs  max=84.66ms  p(90)=4.26µs  p(95)=5.03µs   p(99.9)=38.71µs
     http_req_connecting............: avg=3.26µs  min=0s      med=0s      max=84.51ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.19ms min=1.51ms  med=19.06ms max=264.35ms p(90)=29.54ms p(95)=33.48ms  p(99.9)=56.11ms
       { expected_response:true }...: avg=20.19ms min=1.51ms  med=19.06ms max=264.35ms p(90)=29.54ms p(95)=33.48ms  p(99.9)=56.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293705
     http_req_receiving.............: avg=1.25ms  min=52.87µs med=198.7µs max=124.2ms  p(90)=3.22ms  p(95)=4.47ms   p(99.9)=25.48ms
     http_req_sending...............: avg=48.33µs min=4.8µs   med=9.73µs  max=80.25ms  p(90)=19.23µs p(95)=101.05µs p(99.9)=4.77ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.89ms min=1.43ms  med=17.7ms  max=261.25ms p(90)=28.01ms p(95)=31.86ms  p(99.9)=53.43ms
     http_reqs......................: 293705  2443.477513/s
     iteration_duration.............: avg=20.42ms min=2.55ms  med=19.27ms max=305.22ms p(90)=29.76ms p(95)=33.72ms  p(99.9)=56.47ms
     iterations.....................: 293605  2442.645563/s
     success_rate...................: 100.00% ✓ 293605      ✗ 0     
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

     checks.........................: 100.00% ✓ 861306      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=3.08µs   min=891ns   med=2.34µs  max=9.55ms   p(90)=3.87µs  p(95)=4.54µs  p(99.9)=36.33µs 
     http_req_connecting............: avg=343ns    min=0s      med=0s      max=3.55ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.67ms  min=1.6ms   med=17.23ms max=329.51ms p(90)=34.06ms p(95)=41.84ms p(99.9)=154.58ms
       { expected_response:true }...: avg=20.67ms  min=1.6ms   med=17.23ms max=329.51ms p(90)=34.06ms p(95)=41.84ms p(99.9)=154.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287202
     http_req_receiving.............: avg=613.55µs min=52.16µs med=98.09µs max=298.77ms p(90)=1.13ms  p(95)=1.99ms  p(99.9)=29.05ms 
     http_req_sending...............: avg=41.07µs  min=4.6µs   med=8.9µs   max=68ms     p(90)=16.29µs p(95)=81.55µs p(99.9)=3.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.01ms  min=1.47ms  med=16.68ms max=305.73ms p(90)=32.98ms p(95)=40.63ms p(99.9)=152.51ms
     http_reqs......................: 287202  2389.169618/s
     iteration_duration.............: avg=20.88ms  min=2.58ms  med=17.43ms max=329.72ms p(90)=34.28ms p(95)=42.08ms p(99.9)=156.22ms
     iterations.....................: 287102  2388.33774/s
     success_rate...................: 100.00% ✓ 287102      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 826032      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 331 MB  2.8 MB/s
     http_req_blocked...............: avg=3.54µs   min=902ns   med=2.13µs  max=10.21ms  p(90)=3.85µs  p(95)=4.59µs  p(99.9)=36.29µs 
     http_req_connecting............: avg=854ns    min=0s      med=0s      max=8.66ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.56ms  min=1.87ms  med=18.21ms max=347.44ms p(90)=35ms    p(95)=43.22ms p(99.9)=146.39ms
       { expected_response:true }...: avg=21.56ms  min=1.87ms  med=18.21ms max=347.44ms p(90)=35ms    p(95)=43.22ms p(99.9)=146.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 275444
     http_req_receiving.............: avg=568.55µs min=51.22µs med=98.07µs max=184.96ms p(90)=1.11ms  p(95)=1.9ms   p(99.9)=26.58ms 
     http_req_sending...............: avg=39.84µs  min=4.4µs   med=9.14µs  max=151.9ms  p(90)=19.18µs p(95)=67.53µs p(99.9)=2.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.95ms  min=1.76ms  med=17.69ms max=328.35ms p(90)=34.06ms p(95)=42.1ms  p(99.9)=144.2ms 
     http_reqs......................: 275444  2290.667179/s
     iteration_duration.............: avg=21.78ms  min=2.83ms  med=18.42ms max=347.62ms p(90)=35.22ms p(95)=43.48ms p(99.9)=147.18ms
     iterations.....................: 275344  2289.835552/s
     success_rate...................: 100.00% ✓ 275344      ✗ 0     
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

     checks.........................: 100.00% ✓ 588210      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 236 MB  2.0 MB/s
     http_req_blocked...............: avg=3.14µs  min=861ns   med=2.12µs  max=6.68ms   p(90)=4.27µs  p(95)=5.37µs   p(99.9)=43.18µs
     http_req_connecting............: avg=384ns   min=0s      med=0s      max=3.58ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.35ms min=2.23ms  med=29.91ms max=294.16ms p(90)=39.98ms p(95)=43.34ms  p(99.9)=65.61ms
       { expected_response:true }...: avg=30.35ms min=2.23ms  med=29.91ms max=294.16ms p(90)=39.98ms p(95)=43.34ms  p(99.9)=65.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196170
     http_req_receiving.............: avg=91.74µs min=27.11µs med=54.48µs max=83.21ms  p(90)=124µs   p(95)=201.75µs p(99.9)=3.41ms 
     http_req_sending...............: avg=41.4µs  min=4.56µs  med=9.12µs  max=164.16ms p(90)=23.71µs p(95)=106.22µs p(99.9)=3.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.22ms min=2.16ms  med=29.8ms  max=289.58ms p(90)=39.82ms p(95)=43.17ms  p(99.9)=65.1ms 
     http_reqs......................: 196170  1630.70411/s
     iteration_duration.............: avg=30.59ms min=6ms     med=30.13ms max=307.44ms p(90)=40.19ms p(95)=43.55ms  p(99.9)=66.05ms
     iterations.....................: 196070  1629.872839/s
     success_rate...................: 100.00% ✓ 196070      ✗ 0     
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

     checks.........................: 100.00% ✓ 444027      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.92µs  min=1.1µs   med=3.03µs  max=3.58ms   p(90)=4.64µs   p(95)=5.35µs   p(99.9)=38.08µs 
     http_req_connecting............: avg=576ns   min=0s      med=0s      max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.28ms min=2.14ms  med=39.89ms max=316.93ms p(90)=55.9ms   p(95)=60.74ms  p(99.9)=83.98ms 
       { expected_response:true }...: avg=40.28ms min=2.14ms  med=39.89ms max=316.93ms p(90)=55.9ms   p(95)=60.74ms  p(99.9)=83.98ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148109
     http_req_receiving.............: avg=80µs    min=26.79µs med=66.9µs  max=42.53ms  p(90)=106.24µs p(95)=123.05µs p(99.9)=996.62µs
     http_req_sending...............: avg=29.55µs min=5.26µs  med=12.85µs max=119.47ms p(90)=20.01µs  p(95)=23.94µs  p(99.9)=1.1ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.17ms min=2.03ms  med=39.79ms max=300.7ms  p(90)=55.78ms  p(95)=60.63ms  p(99.9)=83.58ms 
     http_reqs......................: 148109  1231.342684/s
     iteration_duration.............: avg=40.53ms min=4.1ms   med=40.11ms max=331.79ms p(90)=56.12ms  p(95)=60.97ms  p(99.9)=84.27ms 
     iterations.....................: 148009  1230.511308/s
     success_rate...................: 100.00% ✓ 148009      ✗ 0     
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

     checks.........................: 100.00% ✓ 206652     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   688 kB/s
     http_req_blocked...............: avg=4.32µs  min=1.02µs  med=2.66µs  max=3.86ms   p(90)=4.13µs   p(95)=4.71µs   p(99.9)=44.89µs 
     http_req_connecting............: avg=1.41µs  min=0s      med=0s      max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.75ms min=3.81ms  med=85.15ms max=333.2ms  p(90)=106.51ms p(95)=116.95ms p(99.9)=203.71ms
       { expected_response:true }...: avg=86.75ms min=3.81ms  med=85.15ms max=333.2ms  p(90)=106.51ms p(95)=116.95ms p(99.9)=203.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68984
     http_req_receiving.............: avg=80.74µs min=28.79µs med=70.24µs max=107.07ms p(90)=105.77µs p(95)=118.35µs p(99.9)=624.61µs
     http_req_sending...............: avg=21.21µs min=4.78µs  med=12.81µs max=157.96ms p(90)=19.46µs  p(95)=21.47µs  p(99.9)=596.43µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.64ms min=3.69ms  med=85.05ms max=332.79ms p(90)=106.41ms p(95)=116.84ms p(99.9)=203.54ms
     http_reqs......................: 68984   572.394184/s
     iteration_duration.............: avg=87.1ms  min=27.61ms med=85.38ms max=343.62ms p(90)=106.76ms p(95)=117.19ms p(99.9)=205.3ms 
     iterations.....................: 68884   571.564435/s
     success_rate...................: 100.00% ✓ 68884      ✗ 0    
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

     checks.........................: 100.00% ✓ 162789     ✗ 0    
     data_received..................: 4.8 GB  39 MB/s
     data_sent......................: 65 MB   541 kB/s
     http_req_blocked...............: avg=5.77µs   min=1.36µs  med=3.71µs   max=4.3ms    p(90)=5.3µs    p(95)=5.95µs   p(99.9)=86.97µs 
     http_req_connecting............: avg=1.76µs   min=0s      med=0s       max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.12ms min=5.25ms  med=108.02ms max=337.77ms p(90)=145.34ms p(95)=156.43ms p(99.9)=198.63ms
       { expected_response:true }...: avg=110.12ms min=5.25ms  med=108.02ms max=337.77ms p(90)=145.34ms p(95)=156.43ms p(99.9)=198.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54363
     http_req_receiving.............: avg=90.45µs  min=28.3µs  med=87.19µs  max=3.33ms   p(90)=118.63µs p(95)=131.13µs p(99.9)=528.03µs
     http_req_sending...............: avg=27.71µs  min=5.96µs  med=18.36µs  max=97.57ms  p(90)=23.84µs  p(95)=25.86µs  p(99.9)=645.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110ms    min=5.11ms  med=107.91ms max=337.01ms p(90)=145.23ms p(95)=156.29ms p(99.9)=198.28ms
     http_reqs......................: 54363   450.550672/s
     iteration_duration.............: avg=110.6ms  min=27.85ms med=108.38ms max=351.7ms  p(90)=145.64ms p(95)=156.76ms p(99.9)=200.64ms
     iterations.....................: 54263   449.721891/s
     success_rate...................: 100.00% ✓ 54263      ✗ 0    
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

     checks.........................: 100.00% ✓ 96768      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=7.03µs   min=1.45µs  med=3.85µs   max=4.2ms    p(90)=5.32µs   p(95)=5.98µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=2.89µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=185.27ms min=6.05ms  med=169.8ms  max=676.54ms p(90)=216.55ms p(95)=256.47ms p(99.9)=602.48ms
       { expected_response:true }...: avg=185.27ms min=6.05ms  med=169.8ms  max=676.54ms p(90)=216.55ms p(95)=256.47ms p(99.9)=602.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32356
     http_req_receiving.............: avg=105.73µs min=37.29µs med=92.26µs  max=123.61ms p(90)=123.83µs p(95)=136.56µs p(99.9)=780.07µs
     http_req_sending...............: avg=39.69µs  min=6.53µs  med=19.31µs  max=93.41ms  p(90)=24.17µs  p(95)=26.15µs  p(99.9)=634.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.13ms min=5.92ms  med=169.67ms max=676.44ms p(90)=216.41ms p(95)=256.37ms p(99.9)=602.34ms
     http_reqs......................: 32356   267.720365/s
     iteration_duration.............: avg=186.12ms min=39.38ms med=170.14ms max=676.81ms p(90)=216.93ms p(95)=257.33ms p(99.9)=602.81ms
     iterations.....................: 32256   266.892944/s
     success_rate...................: 100.00% ✓ 32256      ✗ 0    
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

     checks.........................: 100.00% ✓ 95541      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=5.67µs   min=1.13µs  med=2.89µs   max=3.38ms   p(90)=4.12µs   p(95)=4.62µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=2.59µs   min=0s      med=0s       max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=187.65ms min=8.1ms   med=192.54ms max=406.73ms p(90)=199.87ms p(95)=203.93ms p(99.9)=272.73ms
       { expected_response:true }...: avg=187.65ms min=8.1ms   med=192.54ms max=406.73ms p(90)=199.87ms p(95)=203.93ms p(99.9)=272.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31947
     http_req_receiving.............: avg=101.99µs min=30.73µs med=84.28µs  max=188.21ms p(90)=114.36µs p(95)=125.06µs p(99.9)=663.77µs
     http_req_sending...............: avg=25.88µs  min=5.13µs  med=16.47µs  max=67.33ms  p(90)=20.99µs  p(95)=22.81µs  p(99.9)=499.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.52ms min=7.92ms  med=192.43ms max=406.2ms  p(90)=199.76ms p(95)=203.82ms p(99.9)=272.22ms
     http_reqs......................: 31947   264.007489/s
     iteration_duration.............: avg=188.51ms min=33.28ms med=192.8ms  max=413.56ms p(90)=200.13ms p(95)=204.24ms p(99.9)=273.35ms
     iterations.....................: 31847   263.181097/s
     success_rate...................: 100.00% ✓ 31847      ✗ 0    
     vus............................: 17      min=17       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

