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
| hive-router | v0.0.84 | 3,078 | 3,333 | 3,021 | 3.4% |  |
| fusion-nightly-net11 | 16.6.2-p.1 | 2,769 | 2,924 | 2,752 | 2.1% |  |
| fusion-nightly | 16.6.2-p.1 | 2,618 | 2,759 | 2,603 | 2.0% |  |
| fusion | 16.6.1 | 2,551 | 2,655 | 2,531 | 1.7% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 2,484 | 2,512 | 2,467 | 0.6% |  |
| grafbase | 0.53.5 | 2,231 | 2,342 | 2,215 | 1.9% |  |
| cosmo | 0.334.0 | 1,323 | 1,364 | 1,315 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 610 | 630 | 604 | 1.5% |  |
| apollo-router | v2.16.1 | 486 | 504 | 484 | 1.4% |  |
| apollo-gateway | 2.14.3 | 282 | 288 | 281 | 0.8% |  |
| hive-gateway | 2.10.8 | 280 | 287 | 280 | 0.8% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1206 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,575 | 2,760 | 2,546 | 2.8% |  |
| fusion-nightly-net11 | 16.6.2-p.1 | 2,567 | 2,700 | 2,555 | 1.9% |  |
| fusion-nightly | 16.6.2-p.1 | 2,482 | 2,595 | 2,475 | 1.7% |  |
| fusion | 16.6.1 | 2,373 | 2,490 | 2,356 | 1.9% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 2,303 | 2,403 | 2,281 | 1.6% |  |
| grafbase | 0.53.5 | 1,607 | 1,664 | 1,605 | 1.3% |  |
| cosmo | 0.334.0 | 1,190 | 1,236 | 1,186 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 576 | 597 | 574 | 1.5% |  |
| apollo-router | v2.16.1 | 418 | 436 | 408 | 2.3% |  |
| apollo-gateway | 2.14.3 | 272 | 276 | 272 | 0.6% |  |
| hive-gateway | 2.10.8 | 264 | 270 | 262 | 0.9% |  |
| feddi | 5ff8b6165878 | 21 | 22 | 21 | 2.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1109553     ✗ 0     
     data_received..................: 32 GB   270 MB/s
     data_sent......................: 445 MB  3.7 MB/s
     http_req_blocked...............: avg=2.54µs  min=862ns   med=1.92µs  max=17.36ms  p(90)=3.16µs  p(95)=3.76µs   p(99.9)=27.8µs 
     http_req_connecting............: avg=233ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.01ms min=1.44ms  med=15.33ms max=281.84ms p(90)=23.19ms p(95)=26.36ms  p(99.9)=46.42ms
       { expected_response:true }...: avg=16.01ms min=1.44ms  med=15.33ms max=281.84ms p(90)=23.19ms p(95)=26.36ms  p(99.9)=46.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 369951
     http_req_receiving.............: avg=89.75µs min=24.77µs med=43.08µs max=168.53ms p(90)=81.46µs p(95)=151.89µs p(99.9)=8.74ms 
     http_req_sending...............: avg=48.03µs min=4.43µs  med=8.2µs   max=182.73ms p(90)=14.51µs p(95)=90.18µs  p(99.9)=6.53ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.87ms min=1.39ms  med=15.22ms max=281.32ms p(90)=23.02ms p(95)=26.09ms  p(99.9)=45.36ms
     http_reqs......................: 369951  3078.023529/s
     iteration_duration.............: avg=16.21ms min=2.11ms  med=15.52ms max=296.8ms  p(90)=23.39ms p(95)=26.59ms  p(99.9)=47.21ms
     iterations.....................: 369851  3077.19152/s
     success_rate...................: 100.00% ✓ 369851      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 998598      ✗ 0     
     data_received..................: 29 GB   243 MB/s
     data_sent......................: 400 MB  3.3 MB/s
     http_req_blocked...............: avg=2.57µs   min=892ns   med=1.87µs  max=12.67ms  p(90)=3.05µs  p(95)=3.63µs  p(99.9)=28.17µs
     http_req_connecting............: avg=263ns    min=0s      med=0s      max=3.51ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.8ms   min=1.95ms  med=16.85ms max=284.88ms p(90)=25.91ms p(95)=29.56ms p(99.9)=50.25ms
       { expected_response:true }...: avg=17.8ms   min=1.95ms  med=16.85ms max=284.88ms p(90)=25.91ms p(95)=29.56ms p(99.9)=50.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 332966
     http_req_receiving.............: avg=461.52µs min=52.26µs med=87.54µs max=101.49ms p(90)=1.13ms  p(95)=1.8ms   p(99.9)=19.04ms
     http_req_sending...............: avg=44.92µs  min=4.56µs  med=8µs     max=238.88ms p(90)=14.07µs p(95)=81.28µs p(99.9)=5.39ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.3ms   min=1.87ms  med=16.37ms max=284.28ms p(90)=25.26ms p(95)=28.87ms p(99.9)=48.87ms
     http_reqs......................: 332966  2769.143454/s
     iteration_duration.............: avg=18.01ms  min=2.92ms  med=17.04ms max=300.21ms p(90)=26.12ms p(95)=29.79ms p(99.9)=50.7ms 
     iterations.....................: 332866  2768.311794/s
     success_rate...................: 100.00% ✓ 332866      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 944367      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 378 MB  3.1 MB/s
     http_req_blocked...............: avg=2.66µs   min=882ns   med=1.91µs  max=14.82ms  p(90)=3.18µs  p(95)=3.74µs  p(99.9)=27.81µs 
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.84ms  min=1.96ms  med=16.21ms max=303.52ms p(90)=30.47ms p(95)=37.05ms p(99.9)=117.91ms
       { expected_response:true }...: avg=18.84ms  min=1.96ms  med=16.21ms max=303.52ms p(90)=30.47ms p(95)=37.05ms p(99.9)=117.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 314889
     http_req_receiving.............: avg=554.14µs min=51.24µs med=87.89µs max=140.89ms p(90)=1.05ms  p(95)=1.9ms   p(99.9)=25.07ms 
     http_req_sending...............: avg=40.88µs  min=4.51µs  med=8µs     max=204.99ms p(90)=13.94µs p(95)=77.97µs p(99.9)=3.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.25ms  min=1.88ms  med=15.69ms max=302.78ms p(90)=29.55ms p(95)=35.98ms p(99.9)=116.52ms
     http_reqs......................: 314889  2618.532253/s
     iteration_duration.............: avg=19.05ms  min=3.04ms  med=16.4ms  max=323.18ms p(90)=30.68ms p(95)=37.28ms p(99.9)=119.7ms 
     iterations.....................: 314789  2617.70068/s
     success_rate...................: 100.00% ✓ 314789      ✗ 0     
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

     checks.........................: 100.00% ✓ 920283      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=3.22µs   min=1.01µs  med=2.33µs  max=17.21ms  p(90)=3.57µs  p(95)=4.13µs  p(99.9)=33.46µs 
     http_req_connecting............: avg=301ns    min=0s      med=0s      max=3.61ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.34ms  min=2.04ms  med=16.63ms max=296.65ms p(90)=31.39ms p(95)=38.12ms p(99.9)=121.32ms
       { expected_response:true }...: avg=19.34ms  min=2.04ms  med=16.63ms max=296.65ms p(90)=31.39ms p(95)=38.12ms p(99.9)=121.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306861
     http_req_receiving.............: avg=571.21µs min=51.66µs med=94.7µs  max=267.79ms p(90)=1.08ms  p(95)=1.95ms  p(99.9)=25.43ms 
     http_req_sending...............: avg=42.93µs  min=4.83µs  med=8.76µs  max=185.64ms p(90)=14.85µs p(95)=86.92µs p(99.9)=3.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.73ms  min=1.94ms  med=16.1ms  max=296.36ms p(90)=30.46ms p(95)=37.06ms p(99.9)=119.68ms
     http_reqs......................: 306861  2551.614859/s
     iteration_duration.............: avg=19.55ms  min=2.98ms  med=16.83ms max=318.58ms p(90)=31.6ms  p(95)=38.34ms p(99.9)=122.42ms
     iterations.....................: 306761  2550.783338/s
     success_rate...................: 100.00% ✓ 306761      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 895794      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=2.71µs   min=852ns   med=1.96µs  max=17.02ms  p(90)=3.22µs  p(95)=3.83µs  p(99.9)=28.27µs 
     http_req_connecting............: avg=289ns    min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.87ms  min=1.67ms  med=16.26ms max=296.38ms p(90)=34.06ms p(95)=42.65ms p(99.9)=148.74ms
       { expected_response:true }...: avg=19.87ms  min=1.67ms  med=16.26ms max=296.38ms p(90)=34.06ms p(95)=42.65ms p(99.9)=148.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298698
     http_req_receiving.............: avg=565.34µs min=51.03µs med=89.77µs max=212.01ms p(90)=1.02ms  p(95)=1.84ms  p(99.9)=28.39ms 
     http_req_sending...............: avg=39.35µs  min=4.71µs  med=8.3µs   max=123.82ms p(90)=14.89µs p(95)=65.29µs p(99.9)=2.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.26ms  min=1.59ms  med=15.76ms max=281.92ms p(90)=33.12ms p(95)=41.53ms p(99.9)=147.12ms
     http_reqs......................: 298698  2484.52929/s
     iteration_duration.............: avg=20.08ms  min=2.48ms  med=16.46ms max=305.21ms p(90)=34.29ms p(95)=42.89ms p(99.9)=149.88ms
     iterations.....................: 298598  2483.697504/s
     success_rate...................: 100.00% ✓ 298598      ✗ 0     
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

     checks.........................: 100.00% ✓ 804726      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 322 MB  2.7 MB/s
     http_req_blocked...............: avg=3.62µs  min=1.04µs  med=2.67µs  max=11.88ms  p(90)=4.33µs  p(95)=5.16µs   p(99.9)=41.41µs
     http_req_connecting............: avg=419ns   min=0s      med=0s      max=4.81ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.13ms min=1.68ms  med=21.89ms max=306.26ms p(90)=26.5ms  p(95)=28.59ms  p(99.9)=49.15ms
       { expected_response:true }...: avg=22.13ms min=1.68ms  med=21.89ms max=306.26ms p(90)=26.5ms  p(95)=28.59ms  p(99.9)=49.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 268342
     http_req_receiving.............: avg=96.97µs min=26.14µs med=56.38µs max=89.45ms  p(90)=98.38µs p(95)=136.64µs p(99.9)=7.33ms 
     http_req_sending...............: avg=41.78µs min=5.01µs  med=11.07µs max=99.49ms  p(90)=18.9µs  p(95)=69.75µs  p(99.9)=2.69ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.99ms min=1.6ms   med=21.78ms max=302.42ms p(90)=26.36ms p(95)=28.36ms  p(99.9)=48.22ms
     http_reqs......................: 268342  2231.998126/s
     iteration_duration.............: avg=22.35ms min=3.24ms  med=22.09ms max=318.03ms p(90)=26.72ms p(95)=28.82ms  p(99.9)=49.63ms
     iterations.....................: 268242  2231.166353/s
     success_rate...................: 100.00% ✓ 268242      ✗ 0     
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

     checks.........................: 100.00% ✓ 477165      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3.05µs  min=922ns   med=2.2µs   max=3.46ms   p(90)=3.64µs  p(95)=4.27µs   p(99.9)=36.36µs 
     http_req_connecting............: avg=540ns   min=0s      med=0s      max=3.41ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.49ms min=2.05ms  med=37.12ms max=297.99ms p(90)=52.4ms  p(95)=57.08ms  p(99.9)=79.36ms 
       { expected_response:true }...: avg=37.49ms min=2.05ms  med=37.12ms max=297.99ms p(90)=52.4ms  p(95)=57.08ms  p(99.9)=79.36ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159155
     http_req_receiving.............: avg=71.16µs min=26.74µs med=58.83µs max=21.33ms  p(90)=94.11µs p(95)=109.42µs p(99.9)=820.99µs
     http_req_sending...............: avg=25.88µs min=4.59µs  med=10.08µs max=133.93ms p(90)=16.51µs p(95)=20.37µs  p(99.9)=979.7µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.39ms min=1.95ms  med=37.03ms max=297.4ms  p(90)=52.31ms p(95)=56.98ms  p(99.9)=78.97ms 
     http_reqs......................: 159155  1323.279636/s
     iteration_duration.............: avg=37.71ms min=3.77ms  med=37.32ms max=307.11ms p(90)=52.61ms p(95)=57.29ms  p(99.9)=79.76ms 
     iterations.....................: 159055  1322.448195/s
     success_rate...................: 100.00% ✓ 159055      ✗ 0     
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

     checks.........................: 100.00% ✓ 220398     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 88 MB   733 kB/s
     http_req_blocked...............: avg=3.9µs   min=1.01µs  med=2.34µs  max=3.98ms   p(90)=3.85µs   p(95)=4.46µs   p(99.9)=42.5µs  
     http_req_connecting............: avg=1.26µs  min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.35ms min=3.56ms  med=78.91ms max=323.28ms p(90)=101.27ms p(95)=112.12ms p(99.9)=196.68ms
       { expected_response:true }...: avg=81.35ms min=3.56ms  med=78.91ms max=323.28ms p(90)=101.27ms p(95)=112.12ms p(99.9)=196.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73566
     http_req_receiving.............: avg=80.74µs min=27.01µs med=63.78µs max=153.32ms p(90)=100.44µs p(95)=114.11µs p(99.9)=710.65µs
     http_req_sending...............: avg=23.59µs min=4.83µs  med=11.94µs max=146.26ms p(90)=19.21µs  p(95)=21.57µs  p(99.9)=610.91µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.24ms min=3.51ms  med=78.82ms max=323.1ms  p(90)=101.18ms p(95)=111.97ms p(99.9)=196.06ms
     http_reqs......................: 73566   610.551903/s
     iteration_duration.............: avg=81.68ms min=20.67ms med=79.14ms max=333.69ms p(90)=101.51ms p(95)=112.4ms  p(99.9)=197.96ms
     iterations.....................: 73466   609.721966/s
     success_rate...................: 100.00% ✓ 73466      ✗ 0    
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

     checks.........................: 100.00% ✓ 175578     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   584 kB/s
     http_req_blocked...............: avg=4.73µs   min=1µs    med=2.98µs   max=3.91ms   p(90)=4.38µs   p(95)=4.87µs   p(99.9)=49.09µs 
     http_req_connecting............: avg=1.58µs   min=0s     med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.11ms min=4.55ms med=101.87ms max=327.51ms p(90)=123.19ms p(95)=129.54ms p(99.9)=158.57ms
       { expected_response:true }...: avg=102.11ms min=4.55ms med=101.87ms max=327.51ms p(90)=123.19ms p(95)=129.54ms p(99.9)=158.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58626
     http_req_receiving.............: avg=84.26µs  min=29.5µs med=77.45µs  max=88.96ms  p(90)=108.45µs p(95)=121.4µs  p(99.9)=538.57µs
     http_req_sending...............: avg=23.51µs  min=5.22µs med=15.55µs  max=79.31ms  p(90)=20.81µs  p(95)=22.65µs  p(99.9)=525.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102ms    min=4.45ms med=101.77ms max=327.35ms p(90)=123.1ms  p(95)=129.44ms p(99.9)=158.24ms
     http_reqs......................: 58626   486.197566/s
     iteration_duration.............: avg=102.53ms min=33ms   med=102.14ms max=336.61ms p(90)=123.45ms p(95)=129.8ms  p(99.9)=160.18ms
     iterations.....................: 58526   485.368245/s
     success_rate...................: 100.00% ✓ 58526      ✗ 0    
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

     checks.........................: 100.00% ✓ 102318     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=5.34µs   min=1.18µs  med=3.23µs   max=6.06ms   p(90)=4.47µs   p(95)=5.01µs   p(99.9)=463.44µs
     http_req_connecting............: avg=1.75µs   min=0s      med=0s       max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=404.16µs
     http_req_duration..............: avg=175.24ms min=7.22ms  med=176.23ms max=366.61ms p(90)=186.49ms p(95)=191.3ms  p(99.9)=266.54ms
       { expected_response:true }...: avg=175.24ms min=7.22ms  med=176.23ms max=366.61ms p(90)=186.49ms p(95)=191.3ms  p(99.9)=266.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34206
     http_req_receiving.............: avg=88.35µs  min=28.27µs med=78.22µs  max=155.13ms p(90)=109.5µs  p(95)=120.77µs p(99.9)=543.22µs
     http_req_sending...............: avg=33.16µs  min=5.79µs  med=15.92µs  max=183.61ms p(90)=20.61µs  p(95)=22.46µs  p(99.9)=520.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.12ms min=7.1ms   med=176.12ms max=365.06ms p(90)=186.39ms p(95)=191.18ms p(99.9)=265.5ms 
     http_reqs......................: 34206   282.910452/s
     iteration_duration.............: avg=176.02ms min=22.44ms med=176.68ms max=375.88ms p(90)=186.76ms p(95)=191.61ms p(99.9)=271.46ms
     iterations.....................: 34106   282.083374/s
     success_rate...................: 100.00% ✓ 34106      ✗ 0    
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

     checks.........................: 100.00% ✓ 101538     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.58µs   min=1.35µs  med=3.64µs   max=4ms      p(90)=5.11µs   p(95)=5.73µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=2.64µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=176.54ms min=5.74ms  med=161.7ms  max=610.81ms p(90)=205.67ms p(95)=246.18ms p(99.9)=536.11ms
       { expected_response:true }...: avg=176.54ms min=5.74ms  med=161.7ms  max=610.81ms p(90)=205.67ms p(95)=246.18ms p(99.9)=536.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33946
     http_req_receiving.............: avg=96.66µs  min=34.93µs med=91.69µs  max=46.32ms  p(90)=123µs    p(95)=136.11µs p(99.9)=662.29µs
     http_req_sending...............: avg=36.17µs  min=5.91µs  med=19.22µs  max=100.22ms p(90)=24.02µs  p(95)=25.88µs  p(99.9)=611.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.41ms min=5.66ms  med=161.56ms max=610.72ms p(90)=205.53ms p(95)=246.07ms p(99.9)=536.01ms
     http_reqs......................: 33946   280.954728/s
     iteration_duration.............: avg=177.35ms min=36.65ms med=162.06ms max=611.04ms p(90)=206.1ms  p(95)=247.33ms p(99.9)=536.41ms
     iterations.....................: 33846   280.127076/s
     success_rate...................: 100.00% ✓ 33846      ✗ 0    
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

     checks.........................: 100.00% ✓ 928605      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=2.91µs  min=902ns   med=2.12µs  max=9.76ms   p(90)=3.71µs  p(95)=4.51µs   p(99.9)=32.93µs
     http_req_connecting............: avg=320ns   min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.16ms min=1.64ms  med=18.77ms max=295.17ms p(90)=26.6ms  p(95)=29.07ms  p(99.9)=47.8ms 
       { expected_response:true }...: avg=19.16ms min=1.64ms  med=18.77ms max=295.17ms p(90)=26.6ms  p(95)=29.07ms  p(99.9)=47.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 309635
     http_req_receiving.............: avg=86.79µs min=25.04µs med=47.77µs max=89.04ms  p(90)=89.27µs p(95)=136.29µs p(99.9)=6.55ms 
     http_req_sending...............: avg=43.94µs min=4.72µs  med=9.13µs  max=115.29ms p(90)=17.07µs p(95)=84.74µs  p(99.9)=4.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.03ms min=1.56ms  med=18.66ms max=294.66ms p(90)=26.44ms p(95)=28.86ms  p(99.9)=46.63ms
     http_reqs......................: 309635  2575.597665/s
     iteration_duration.............: avg=19.37ms min=3.3ms   med=18.97ms max=306.23ms p(90)=26.81ms p(95)=29.28ms  p(99.9)=48.33ms
     iterations.....................: 309535  2574.765848/s
     success_rate...................: 100.00% ✓ 309535      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 925374      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=3.71µs   min=921ns   med=2.62µs  max=23.17ms  p(90)=4.31µs  p(95)=5.07µs   p(99.9)=35.45µs
     http_req_connecting............: avg=294ns    min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.21ms  min=1.52ms  med=18.33ms max=285.78ms p(90)=27.84ms p(95)=31.53ms  p(99.9)=54.02ms
       { expected_response:true }...: avg=19.21ms  min=1.52ms  med=18.33ms max=285.78ms p(90)=27.84ms p(95)=31.53ms  p(99.9)=54.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 308558
     http_req_receiving.............: avg=537.12µs min=50.26µs med=99.38µs max=172.9ms  p(90)=1.35ms  p(95)=2.2ms    p(99.9)=19.04ms
     http_req_sending...............: avg=47.72µs  min=4.55µs  med=9.96µs  max=143.16ms p(90)=19.83µs p(95)=101.26µs p(99.9)=4.37ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.62ms  min=1.4ms   med=17.75ms max=270.54ms p(90)=27.15ms p(95)=30.77ms  p(99.9)=51.96ms
     http_reqs......................: 308558  2567.140398/s
     iteration_duration.............: avg=19.44ms  min=2.65ms  med=18.54ms max=299.44ms p(90)=28.07ms p(95)=31.77ms  p(99.9)=54.74ms
     iterations.....................: 308458  2566.308418/s
     success_rate...................: 100.00% ✓ 308458      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 894894      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=3.31µs   min=881ns   med=2.05µs  max=16.12ms  p(90)=3.58µs  p(95)=4.3µs   p(99.9)=32.18µs 
     http_req_connecting............: avg=741ns    min=0s      med=0s      max=7.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.88ms  min=1.52ms  med=16.79ms max=279.45ms p(90)=32.48ms p(95)=39.77ms p(99.9)=137.4ms 
       { expected_response:true }...: avg=19.88ms  min=1.52ms  med=16.79ms max=279.45ms p(90)=32.48ms p(95)=39.77ms p(99.9)=137.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 298398
     http_req_receiving.............: avg=560.14µs min=50.82µs med=92.65µs max=149.53ms p(90)=1.06ms  p(95)=1.85ms  p(99.9)=27.06ms 
     http_req_sending...............: avg=47.31µs  min=4.62µs  med=8.64µs  max=150.16ms p(90)=16.86µs p(95)=85.39µs p(99.9)=4.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.28ms  min=1.44ms  med=16.27ms max=264.73ms p(90)=31.54ms p(95)=38.66ms p(99.9)=133.69ms
     http_reqs......................: 298398  2482.427702/s
     iteration_duration.............: avg=20.1ms   min=2.56ms  med=16.99ms max=306.44ms p(90)=32.71ms p(95)=40.02ms p(99.9)=138.27ms
     iterations.....................: 298298  2481.595783/s
     success_rate...................: 100.00% ✓ 298298      ✗ 0     
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

     checks.........................: 100.00% ✓ 855483      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=3.45µs   min=1.04µs  med=2.61µs   max=11.13ms  p(90)=4.13µs  p(95)=4.83µs  p(99.9)=38.98µs 
     http_req_connecting............: avg=322ns    min=0s      med=0s       max=4.16ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.8ms   min=1.59ms  med=17.43ms  max=339.71ms p(90)=34.25ms p(95)=41.9ms  p(99.9)=146.88ms
       { expected_response:true }...: avg=20.8ms   min=1.59ms  med=17.43ms  max=339.71ms p(90)=34.25ms p(95)=41.9ms  p(99.9)=146.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285261
     http_req_receiving.............: avg=605.87µs min=52.72µs med=101.06µs max=199.35ms p(90)=1.13ms  p(95)=1.99ms  p(99.9)=29.14ms 
     http_req_sending...............: avg=43.39µs  min=4.62µs  med=10.06µs  max=177.73ms p(90)=18.42µs p(95)=87.37µs p(99.9)=3.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.15ms  min=1.48ms  med=16.87ms  max=339.61ms p(90)=33.2ms  p(95)=40.67ms p(99.9)=144.67ms
     http_reqs......................: 285261  2373.094916/s
     iteration_duration.............: avg=21.03ms  min=2.15ms  med=17.64ms  max=339.89ms p(90)=34.48ms p(95)=42.14ms p(99.9)=148.64ms
     iterations.....................: 285161  2372.263013/s
     success_rate...................: 100.00% ✓ 285161      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 830709      ✗ 0     
     data_received..................: 24 GB   202 MB/s
     data_sent......................: 333 MB  2.8 MB/s
     http_req_blocked...............: avg=3.16µs   min=941ns   med=2.18µs  max=15.82ms  p(90)=3.87µs  p(95)=4.65µs  p(99.9)=34.03µs 
     http_req_connecting............: avg=338ns    min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.43ms  min=1.87ms  med=18.28ms max=308.18ms p(90)=34.7ms  p(95)=42.46ms p(99.9)=144.07ms
       { expected_response:true }...: avg=21.43ms  min=1.87ms  med=18.28ms max=308.18ms p(90)=34.7ms  p(95)=42.46ms p(99.9)=144.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 277003
     http_req_receiving.............: avg=582.61µs min=52.46µs med=99.07µs max=209.53ms p(90)=1.12ms  p(95)=1.94ms  p(99.9)=27.23ms 
     http_req_sending...............: avg=41.44µs  min=4.7µs   med=9.39µs  max=76.9ms   p(90)=19.55µs p(95)=77.43µs p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.81ms  min=1.77ms  med=17.73ms max=279.04ms p(90)=33.7ms  p(95)=41.3ms  p(99.9)=142.39ms
     http_reqs......................: 277003  2303.593654/s
     iteration_duration.............: avg=21.65ms  min=3.06ms  med=18.49ms max=316.92ms p(90)=34.92ms p(95)=42.69ms p(99.9)=145.39ms
     iterations.....................: 276903  2302.762041/s
     success_rate...................: 100.00% ✓ 276903      ✗ 0     
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

     checks.........................: 100.00% ✓ 579693      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.54µs  min=871ns   med=2.26µs  max=24.25ms  p(90)=4.39µs   p(95)=5.49µs   p(99.9)=51.46µs
     http_req_connecting............: avg=644ns   min=0s      med=0s      max=24.19ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.79ms min=2.29ms  med=30.23ms max=309.64ms p(90)=40.66ms  p(95)=44.1ms   p(99.9)=66.88ms
       { expected_response:true }...: avg=30.79ms min=2.29ms  med=30.23ms max=309.64ms p(90)=40.66ms  p(95)=44.1ms   p(99.9)=66.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193331
     http_req_receiving.............: avg=96.69µs min=27.02µs med=55.81µs max=208.14ms p(90)=127.51µs p(95)=212.74µs p(99.9)=3.77ms 
     http_req_sending...............: avg=42.03µs min=4.7µs   med=9.55µs  max=151.61ms p(90)=24.09µs  p(95)=108.49µs p(99.9)=3.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.65ms min=2.2ms   med=30.1ms  max=293.25ms p(90)=40.52ms  p(95)=43.94ms  p(99.9)=66.26ms
     http_reqs......................: 193331  1607.223648/s
     iteration_duration.............: avg=31.04ms min=6.8ms   med=30.45ms max=325.07ms p(90)=40.88ms  p(95)=44.33ms  p(99.9)=67.42ms
     iterations.....................: 193231  1606.392315/s
     success_rate...................: 100.00% ✓ 193231      ✗ 0     
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

     checks.........................: 100.00% ✓ 429288      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.92µs  min=1.14µs  med=2.95µs  max=4.28ms   p(90)=4.56µs   p(95)=5.28µs   p(99.9)=36.33µs 
     http_req_connecting............: avg=660ns   min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.66ms min=2.12ms  med=41.21ms max=295.82ms p(90)=58.04ms  p(95)=63.13ms  p(99.9)=86.99ms 
       { expected_response:true }...: avg=41.66ms min=2.12ms  med=41.21ms max=295.82ms p(90)=58.04ms  p(95)=63.13ms  p(99.9)=86.99ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143196
     http_req_receiving.............: avg=83.83µs min=28.35µs med=69.88µs max=113.69ms p(90)=110.02µs p(95)=128.11µs p(99.9)=934.17µs
     http_req_sending...............: avg=30.07µs min=4.89µs  med=12.68µs max=174.98ms p(90)=19.36µs  p(95)=23.4µs   p(99.9)=1.11ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.55ms min=2.05ms  med=41.11ms max=295.68ms p(90)=57.91ms  p(95)=63.02ms  p(99.9)=86.63ms 
     http_reqs......................: 143196  1190.530678/s
     iteration_duration.............: avg=41.92ms min=4.5ms   med=41.44ms max=315.86ms p(90)=58.25ms  p(95)=63.36ms  p(99.9)=87.49ms 
     iterations.....................: 143096  1189.699279/s
     success_rate...................: 100.00% ✓ 143096      ✗ 0     
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

     checks.........................: 100.00% ✓ 208161     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   693 kB/s
     http_req_blocked...............: avg=3.81µs  min=992ns   med=2.48µs  max=3.17ms   p(90)=3.96µs   p(95)=4.58µs   p(99.9)=50.83µs 
     http_req_connecting............: avg=1.04µs  min=0s      med=0s      max=3.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.14ms min=3.85ms  med=84.28ms max=293.04ms p(90)=106.41ms p(95)=117.83ms p(99.9)=199.86ms
       { expected_response:true }...: avg=86.14ms min=3.85ms  med=84.28ms max=293.04ms p(90)=106.41ms p(95)=117.83ms p(99.9)=199.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69487
     http_req_receiving.............: avg=76.49µs min=29.02µs med=69.09µs max=6.68ms   p(90)=105.23µs p(95)=118.23µs p(99.9)=569.72µs
     http_req_sending...............: avg=23.68µs min=5.07µs  med=12.4µs  max=173.93ms p(90)=19.41µs  p(95)=21.5µs   p(99.9)=581.59µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.04ms min=3.72ms  med=84.19ms max=292.9ms  p(90)=106.31ms p(95)=117.71ms p(99.9)=199.65ms
     http_reqs......................: 69487   576.595371/s
     iteration_duration.............: avg=86.49ms min=20.62ms med=84.52ms max=299.67ms p(90)=106.66ms p(95)=118.1ms  p(99.9)=200.7ms 
     iterations.....................: 69387   575.765582/s
     success_rate...................: 100.00% ✓ 69387      ✗ 0    
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

     checks.........................: 100.00% ✓ 151137     ✗ 0    
     data_received..................: 4.4 GB  37 MB/s
     data_sent......................: 61 MB   502 kB/s
     http_req_blocked...............: avg=6.38µs   min=1.05µs  med=3.07µs   max=68.75ms  p(90)=4.46µs   p(95)=5.04µs   p(99.9)=425.93µs
     http_req_connecting............: avg=1.76µs   min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=43.76µs 
     http_req_duration..............: avg=118.64ms min=4.92ms  med=116.39ms max=327.44ms p(90)=157.36ms p(95)=169.32ms p(99.9)=220.35ms
       { expected_response:true }...: avg=118.64ms min=4.92ms  med=116.39ms max=327.44ms p(90)=157.36ms p(95)=169.32ms p(99.9)=220.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50479
     http_req_receiving.............: avg=83.37µs  min=29.36µs med=78.35µs  max=68.73ms  p(90)=109.34µs p(95)=121.68µs p(99.9)=515.22µs
     http_req_sending...............: avg=21.2µs   min=5.34µs  med=15.84µs  max=62.21ms  p(90)=21.34µs  p(95)=23.22µs  p(99.9)=490.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.53ms min=4.81ms  med=116.29ms max=326.91ms p(90)=157.25ms p(95)=169.22ms p(99.9)=220.25ms
     http_reqs......................: 50479   418.388016/s
     iteration_duration.............: avg=119.12ms min=35.49ms med=116.71ms max=335.68ms p(90)=157.67ms p(95)=169.65ms p(99.9)=221.79ms
     iterations.....................: 50379   417.55918/s
     success_rate...................: 100.00% ✓ 50379      ✗ 0    
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

     checks.........................: 100.00% ✓ 98565      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.92µs   min=1.51µs  med=3.74µs   max=4ms      p(90)=5.22µs   p(95)=5.85µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=2.92µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=181.89ms min=7.8ms   med=183.23ms max=417.42ms p(90)=191.83ms p(95)=196.59ms p(99.9)=267.43ms
       { expected_response:true }...: avg=181.89ms min=7.8ms   med=183.23ms max=417.42ms p(90)=191.83ms p(95)=196.59ms p(99.9)=267.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32955
     http_req_receiving.............: avg=95.29µs  min=32.46µs med=89.1µs   max=56.06ms  p(90)=119.89µs p(95)=132.45µs p(99.9)=431.84µs
     http_req_sending...............: avg=36.58µs  min=6.59µs  med=18.45µs  max=130.07ms p(90)=23.3µs   p(95)=25.27µs  p(99.9)=516.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.75ms min=7.69ms  med=183.1ms  max=417.23ms p(90)=191.7ms  p(95)=196.46ms p(99.9)=267.3ms 
     http_reqs......................: 32955   272.420049/s
     iteration_duration.............: avg=182.73ms min=32.15ms med=183.63ms max=423.82ms p(90)=192.14ms p(95)=196.92ms p(99.9)=269.12ms
     iterations.....................: 32855   271.593407/s
     success_rate...................: 100.00% ✓ 32855      ✗ 0    
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

     checks.........................: 100.00% ✓ 95604      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=6.94µs   min=1.41µs  med=3.78µs   max=4.06ms   p(90)=5.29µs   p(95)=5.92µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=2.86µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=187.54ms min=6.28ms  med=172.05ms max=705.26ms p(90)=219.64ms p(95)=265.65ms p(99.9)=612.82ms
       { expected_response:true }...: avg=187.54ms min=6.28ms  med=172.05ms max=705.26ms p(90)=219.64ms p(95)=265.65ms p(99.9)=612.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31968
     http_req_receiving.............: avg=102.24µs min=35.41µs med=91.88µs  max=116.66ms p(90)=122.59µs p(95)=135.87µs p(99.9)=824.23µs
     http_req_sending...............: avg=28.25µs  min=7.31µs  med=19.18µs  max=55.65ms  p(90)=24.03µs  p(95)=26.04µs  p(99.9)=562.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.4ms  min=6.18ms  med=171.93ms max=705.14ms p(90)=219.52ms p(95)=265.19ms p(99.9)=612.73ms
     http_reqs......................: 31968   264.099538/s
     iteration_duration.............: avg=188.41ms min=45.6ms  med=172.43ms max=705.46ms p(90)=220.11ms p(95)=266.86ms p(99.9)=613.1ms 
     iterations.....................: 31868   263.273401/s
     success_rate...................: 100.00% ✓ 31868      ✗ 0    
     vus............................: 12      min=12       max=50 
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

     checks.........................: 100.00% ✓ 7890      ✗ 0   
     data_received..................: 261 MB  2.1 MB/s
     data_sent......................: 3.3 MB  26 kB/s
     http_req_blocked...............: avg=35µs     min=1.18µs   med=3.36µs  max=3.37ms  p(90)=4.95µs   p(95)=5.8µs    p(99.9)=3.09ms 
     http_req_connecting............: avg=30.91µs  min=0s       med=0s      max=3.33ms  p(90)=0s       p(95)=0s       p(99.9)=3.07ms 
     http_req_duration..............: avg=2.2s     min=26.96ms  med=2.21s   max=4.74s   p(90)=3.05s    p(95)=3.39s    p(99.9)=4.6s   
       { expected_response:true }...: avg=2.2s     min=26.96ms  med=2.21s   max=4.74s   p(90)=3.05s    p(95)=3.39s    p(99.9)=4.6s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2730
     http_req_receiving.............: avg=114.51µs min=35.23µs  med=97.75µs max=32.34ms p(90)=136.59µs p(95)=152.87µs p(99.9)=1.29ms 
     http_req_sending...............: avg=100.79µs min=5.57µs   med=18.87µs max=63.96ms p(90)=24.05µs  p(95)=28.96µs  p(99.9)=17.22ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.2s     min=26.82ms  med=2.21s   max=4.74s   p(90)=3.05s    p(95)=3.39s    p(99.9)=4.59s  
     http_reqs......................: 2730    21.832508/s
     iteration_duration.............: avg=2.29s    min=456.79ms med=2.23s   max=4.74s   p(90)=3.07s    p(95)=3.4s     p(99.9)=4.61s  
     iterations.....................: 2630    21.032783/s
     success_rate...................: 100.00% ✓ 2630      ✗ 0   
     vus............................: 14      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

