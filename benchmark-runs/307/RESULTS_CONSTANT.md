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
| fusion-nightly-net11 | 16.6.0-p.15 | 2,717 | 2,827 | 2,699 | 1.6% |  |
| fusion-nightly | 16.6.0-p.15 | 2,644 | 2,756 | 2,635 | 1.7% |  |
| fusion | 16.5.1 | 2,520 | 2,622 | 2,497 | 1.6% |  |
| fusion-nightly-fed | 16.6.0-p.15 | 2,478 | 2,541 | 2,469 | 1.0% |  |
| grafbase | 0.53.5 | 2,218 | 2,342 | 2,204 | 2.2% |  |
| cosmo | 0.334.0 | 1,313 | 1,358 | 1,306 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 608 | 628 | 604 | 1.5% |  |
| apollo-router | v2.16.1 | 443 | 465 | 438 | 2.1% |  |
| hive-gateway | 2.10.8 | 280 | 287 | 278 | 1.0% |  |
| apollo-gateway | 2.14.3 | 278 | 282 | 276 | 0.8% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1104 across 9/9 runs) |
| hive-router | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.6.0-p.15 | 2,436 | 2,559 | 2,429 | 1.9% |  |
| fusion-nightly-net11 | 16.6.0-p.15 | 2,434 | 2,529 | 2,400 | 1.9% |  |
| fusion | 16.5.1 | 2,309 | 2,424 | 2,301 | 1.9% |  |
| fusion-nightly-fed | 16.6.0-p.15 | 2,288 | 2,388 | 2,281 | 1.6% |  |
| grafbase | 0.53.5 | 1,637 | 1,694 | 1,631 | 1.3% |  |
| cosmo | 0.334.0 | 1,238 | 1,284 | 1,236 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 584 | 603 | 583 | 1.1% |  |
| apollo-router | v2.16.1 | 410 | 429 | 409 | 1.7% |  |
| hive-gateway | 2.10.8 | 267 | 275 | 267 | 1.0% |  |
| apollo-gateway | 2.14.3 | 264 | 268 | 263 | 0.7% |  |
| feddi | 5ff8b6165878 | 18 | 19 | 17 | 2.8% |  |
| hive-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 979962     ✗ 0     
     data_received..................: 29 GB   238 MB/s
     data_sent......................: 393 MB  3.3 MB/s
     http_req_blocked...............: avg=2.81µs   min=852ns   med=2.16µs   max=16.31ms  p(90)=3.5µs   p(95)=4.09µs  p(99.9)=31.18µs
     http_req_connecting............: avg=117ns    min=0s      med=0s       max=2.12ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.14ms  min=1.92ms  med=17.25ms  max=296.11ms p(90)=26.06ms p(95)=29.58ms p(99.9)=50.74ms
       { expected_response:true }...: avg=18.14ms  min=1.92ms  med=17.25ms  max=296.11ms p(90)=26.06ms p(95)=29.58ms p(99.9)=50.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 326754
     http_req_receiving.............: avg=649.62µs min=50.09µs med=101.08µs max=114.08ms p(90)=1.65ms  p(95)=2.47ms  p(99.9)=20.14ms
     http_req_sending...............: avg=46.28µs  min=4.75µs  med=8.46µs   max=126.72ms p(90)=15.88µs p(95)=90.36µs p(99.9)=5.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.45ms  min=1.83ms  med=16.56ms  max=295.76ms p(90)=25.22ms p(95)=28.71ms p(99.9)=49.04ms
     http_reqs......................: 326754  2717.38219/s
     iteration_duration.............: avg=18.35ms  min=3.25ms  med=17.45ms  max=305.71ms p(90)=26.27ms p(95)=29.8ms  p(99.9)=51.49ms
     iterations.....................: 326654  2716.55056/s
     success_rate...................: 100.00% ✓ 326654     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 953604      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 382 MB  3.2 MB/s
     http_req_blocked...............: avg=2.62µs   min=892ns   med=1.87µs  max=17.31ms  p(90)=3.04µs  p(95)=3.63µs  p(99.9)=28.83µs 
     http_req_connecting............: avg=298ns    min=0s      med=0s      max=3.67ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.66ms  min=2.01ms  med=16.08ms max=276.87ms p(90)=30.28ms p(95)=36.65ms p(99.9)=117.79ms
       { expected_response:true }...: avg=18.66ms  min=2.01ms  med=16.08ms max=276.87ms p(90)=30.28ms p(95)=36.65ms p(99.9)=117.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317968
     http_req_receiving.............: avg=533.42µs min=50.12µs med=86.73µs max=179.41ms p(90)=1.03ms  p(95)=1.86ms  p(99.9)=23.4ms  
     http_req_sending...............: avg=43.98µs  min=4.55µs  med=8.13µs  max=110.32ms p(90)=14.37µs p(95)=78.46µs p(99.9)=4.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.08ms  min=1.87ms  med=15.58ms max=276.55ms p(90)=29.43ms p(95)=35.62ms p(99.9)=116.64ms
     http_reqs......................: 317968  2644.164972/s
     iteration_duration.............: avg=18.86ms  min=3.08ms  med=16.27ms max=308.65ms p(90)=30.5ms  p(95)=36.89ms p(99.9)=118.67ms
     iterations.....................: 317868  2643.33339/s
     success_rate...................: 100.00% ✓ 317868      ✗ 0     
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

     checks.........................: 100.00% ✓ 909264      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 364 MB  3.0 MB/s
     http_req_blocked...............: avg=2.67µs   min=851ns  med=1.88µs  max=17.13ms  p(90)=3.04µs  p(95)=3.6µs   p(99.9)=28.36µs 
     http_req_connecting............: avg=296ns    min=0s     med=0s      max=3.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.58ms  min=2.06ms med=16.83ms max=291.13ms p(90)=31.78ms p(95)=38.44ms p(99.9)=127.1ms 
       { expected_response:true }...: avg=19.58ms  min=2.06ms med=16.83ms max=291.13ms p(90)=31.78ms p(95)=38.44ms p(99.9)=127.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 303188
     http_req_receiving.............: avg=568.54µs min=49.3µs med=89.05µs max=160.85ms p(90)=1.06ms  p(95)=1.89ms  p(99.9)=26.22ms 
     http_req_sending...............: avg=41.18µs  min=4.32µs med=7.97µs  max=137.43ms p(90)=14.39µs p(95)=76.21µs p(99.9)=4.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.97ms  min=1.96ms med=16.3ms  max=280.83ms p(90)=30.82ms p(95)=37.3ms  p(99.9)=125.48ms
     http_reqs......................: 303188  2520.778871/s
     iteration_duration.............: avg=19.78ms  min=2.59ms med=17.02ms max=300.95ms p(90)=31.99ms p(95)=38.66ms p(99.9)=128.1ms 
     iterations.....................: 303088  2519.947446/s
     success_rate...................: 100.00% ✓ 303088      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 893499      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.86µs   min=902ns   med=2.04µs  max=16.92ms  p(90)=3.41µs  p(95)=4.01µs  p(99.9)=30.91µs 
     http_req_connecting............: avg=329ns    min=0s      med=0s      max=4.27ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.92ms  min=1.7ms   med=16.24ms max=371.37ms p(90)=34.17ms p(95)=42.75ms p(99.9)=158.91ms
       { expected_response:true }...: avg=19.92ms  min=1.7ms   med=16.24ms max=371.37ms p(90)=34.17ms p(95)=42.75ms p(99.9)=158.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297933
     http_req_receiving.............: avg=563.82µs min=51.89µs med=91.07µs max=190.08ms p(90)=1.03ms  p(95)=1.83ms  p(99.9)=28.19ms 
     http_req_sending...............: avg=42.02µs  min=4.75µs  med=8.47µs  max=239.24ms p(90)=15.06µs p(95)=69.11µs p(99.9)=3.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.32ms  min=1.6ms   med=15.74ms max=370.85ms p(90)=33.18ms p(95)=41.66ms p(99.9)=157.05ms
     http_reqs......................: 297933  2478.250551/s
     iteration_duration.............: avg=20.13ms  min=2.53ms  med=16.44ms max=371.62ms p(90)=34.39ms p(95)=42.98ms p(99.9)=159.86ms
     iterations.....................: 297833  2477.418737/s
     success_rate...................: 100.00% ✓ 297833      ✗ 0     
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

     checks.........................: 100.00% ✓ 799929      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=3.53µs  min=942ns   med=2.17µs  max=14.63ms  p(90)=3.79µs  p(95)=4.58µs   p(99.9)=36.36µs
     http_req_connecting............: avg=721ns   min=0s      med=0s      max=7.78ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.28ms min=1.72ms  med=22.04ms max=279.46ms p(90)=26.48ms p(95)=28.29ms  p(99.9)=47.74ms
       { expected_response:true }...: avg=22.28ms min=1.72ms  med=22.04ms max=279.46ms p(90)=26.48ms p(95)=28.29ms  p(99.9)=47.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266743
     http_req_receiving.............: avg=87.22µs min=26.42µs med=52.81µs max=33.46ms  p(90)=92.22µs p(95)=120.69µs p(99.9)=6.56ms 
     http_req_sending...............: avg=35.48µs min=4.51µs  med=9.35µs  max=61.46ms  p(90)=16.96µs p(95)=28.44µs  p(99.9)=2.06ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.15ms min=1.61ms  med=21.95ms max=279.08ms p(90)=26.34ms p(95)=28.11ms  p(99.9)=46.55ms
     http_reqs......................: 266743  2218.747824/s
     iteration_duration.............: avg=22.49ms min=4.3ms   med=22.23ms max=292.59ms p(90)=26.68ms p(95)=28.51ms  p(99.9)=48.27ms
     iterations.....................: 266643  2217.916032/s
     success_rate...................: 100.00% ✓ 266643      ✗ 0     
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

     checks.........................: 100.00% ✓ 473640      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=2.91µs  min=842ns   med=2.04µs  max=3.44ms   p(90)=3.49µs  p(95)=4.13µs   p(99.9)=32.78µs 
     http_req_connecting............: avg=542ns   min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.77ms min=2ms     med=37.42ms max=297.54ms p(90)=52.62ms p(95)=57.28ms  p(99.9)=78.51ms 
       { expected_response:true }...: avg=37.77ms min=2ms     med=37.42ms max=297.54ms p(90)=52.62ms p(95)=57.28ms  p(99.9)=78.51ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 157980
     http_req_receiving.............: avg=68.22µs min=25.58µs med=55.97µs max=65.67ms  p(90)=90.85µs p(95)=105.19µs p(99.9)=829.13µs
     http_req_sending...............: avg=26.13µs min=4.87µs  med=9.61µs  max=203.94ms p(90)=16.25µs p(95)=20.17µs  p(99.9)=957.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.68ms min=1.94ms  med=37.33ms max=296.97ms p(90)=52.52ms p(95)=57.16ms  p(99.9)=78.32ms 
     http_reqs......................: 157980  1313.419834/s
     iteration_duration.............: avg=37.99ms min=3.62ms  med=37.62ms max=306.78ms p(90)=52.82ms p(95)=57.47ms  p(99.9)=79.24ms 
     iterations.....................: 157880  1312.588451/s
     success_rate...................: 100.00% ✓ 157880      ✗ 0     
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

     checks.........................: 100.00% ✓ 219492     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 88 MB   730 kB/s
     http_req_blocked...............: avg=4.42µs  min=1.05µs  med=2.85µs  max=3.99ms   p(90)=4.31µs   p(95)=4.95µs   p(99.9)=46.57µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.67ms min=3.58ms  med=79.87ms max=319.84ms p(90)=103.16ms p(95)=114.28ms p(99.9)=191.06ms
       { expected_response:true }...: avg=81.67ms min=3.58ms  med=79.87ms max=319.84ms p(90)=103.16ms p(95)=114.28ms p(99.9)=191.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73264
     http_req_receiving.............: avg=77.77µs min=29.2µs  med=68.64µs max=43.19ms  p(90)=104.37µs p(95)=117.29µs p(99.9)=614.48µs
     http_req_sending...............: avg=22.11µs min=4.94µs  med=13.05µs max=105.89ms p(90)=19.53µs  p(95)=21.74µs  p(99.9)=591.07µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.57ms min=3.47ms  med=79.78ms max=319.6ms  p(90)=103.06ms p(95)=114.17ms p(99.9)=190.95ms
     http_reqs......................: 73264   608.066693/s
     iteration_duration.............: avg=82.02ms min=22.25ms med=80.14ms max=329.49ms p(90)=103.4ms  p(95)=114.53ms p(99.9)=192.85ms
     iterations.....................: 73164   607.236726/s
     success_rate...................: 100.00% ✓ 73164      ✗ 0    
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

     checks.........................: 100.00% ✓ 160251     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   533 kB/s
     http_req_blocked...............: avg=5.2µs    min=1.26µs  med=3.13µs   max=3.71ms   p(90)=4.47µs   p(95)=5.05µs   p(99.9)=130.03µs
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=3.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.9ms  min=4.52ms  med=111.74ms max=326.68ms p(90)=135.13ms p(95)=142.1ms  p(99.9)=173ms   
       { expected_response:true }...: avg=111.9ms  min=4.52ms  med=111.74ms max=326.68ms p(90)=135.13ms p(95)=142.1ms  p(99.9)=173ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 53517
     http_req_receiving.............: avg=78.43µs  min=30.15µs med=72.42µs  max=11.36ms  p(90)=104.61µs p(95)=116.79µs p(99.9)=544.45µs
     http_req_sending...............: avg=29.28µs  min=6.03µs  med=15.4µs   max=171.34ms p(90)=20.99µs  p(95)=22.95µs  p(99.9)=525.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.79ms min=4.44ms  med=111.63ms max=326.26ms p(90)=135.02ms p(95)=142ms    p(99.9)=172.09ms
     http_reqs......................: 53517   443.70449/s
     iteration_duration.............: avg=112.35ms min=31.01ms med=112.01ms max=335.67ms p(90)=135.38ms p(95)=142.35ms p(99.9)=175.8ms 
     iterations.....................: 53417   442.875399/s
     success_rate...................: 100.00% ✓ 53417      ✗ 0    
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

     checks.........................: 100.00% ✓ 101436     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=6.89µs   min=1.44µs  med=3.65µs   max=4.02ms   p(90)=5.12µs   p(95)=5.77µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=176.73ms min=5.71ms  med=160.78ms max=903.99ms p(90)=206.66ms p(95)=242.74ms p(99.9)=580.51ms
       { expected_response:true }...: avg=176.73ms min=5.71ms  med=160.78ms max=903.99ms p(90)=206.66ms p(95)=242.74ms p(99.9)=580.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33912
     http_req_receiving.............: avg=98.07µs  min=35.98µs med=87.8µs   max=132.13ms p(90)=119.13µs p(95)=131.7µs  p(99.9)=708.63µs
     http_req_sending...............: avg=40.86µs  min=6.48µs  med=18.19µs  max=131.98ms p(90)=23.19µs  p(95)=25.09µs  p(99.9)=574.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.59ms min=5.58ms  med=160.65ms max=903.88ms p(90)=206.52ms p(95)=242.43ms p(99.9)=580.42ms
     http_reqs......................: 33912   280.685692/s
     iteration_duration.............: avg=177.53ms min=22.76ms med=161.12ms max=904.26ms p(90)=207.11ms p(95)=243.82ms p(99.9)=580.84ms
     iterations.....................: 33812   279.858004/s
     success_rate...................: 100.00% ✓ 33812      ✗ 0    
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

     checks.........................: 100.00% ✓ 100656     ✗ 0    
     data_received..................: 3.0 GB  24 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=6.15µs   min=1.41µs  med=3.35µs   max=3.37ms   p(90)=4.64µs   p(95)=5.18µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=2.59µs   min=0s      med=0s       max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=178.13ms min=7.7ms   med=196.64ms max=374.39ms p(90)=204.98ms p(95)=207.96ms p(99.9)=279.51ms
       { expected_response:true }...: avg=178.13ms min=7.7ms   med=196.64ms max=374.39ms p(90)=204.98ms p(95)=207.96ms p(99.9)=279.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33652
     http_req_receiving.............: avg=94.7µs   min=36.57µs med=85.07µs  max=155.66ms p(90)=114.12µs p(95)=124.81µs p(99.9)=500.22µs
     http_req_sending...............: avg=23.81µs  min=6.21µs  med=16.74µs  max=58.05ms  p(90)=21µs     p(95)=22.75µs  p(99.9)=628.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.01ms min=7.57ms  med=196.53ms max=373.62ms p(90)=204.87ms p(95)=207.84ms p(99.9)=279.41ms
     http_reqs......................: 33652   278.203269/s
     iteration_duration.............: avg=178.92ms min=36.86ms med=196.91ms max=381.73ms p(90)=205.26ms p(95)=208.23ms p(99.9)=280ms   
     iterations.....................: 33552   277.376563/s
     success_rate...................: 100.00% ✓ 33552      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 878163      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=4.91µs   min=881ns   med=2.11µs  max=43.78ms  p(90)=3.77µs  p(95)=4.53µs  p(99.9)=37.37µs 
     http_req_connecting............: avg=2.27µs   min=0s      med=0s      max=43.65ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.27ms  min=1.6ms   med=17.07ms max=464.01ms p(90)=33.21ms p(95)=40.58ms p(99.9)=138.93ms
       { expected_response:true }...: avg=20.27ms  min=1.6ms   med=17.07ms max=464.01ms p(90)=33.21ms p(95)=40.58ms p(99.9)=138.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292821
     http_req_receiving.............: avg=575.11µs min=51.61µs med=93.71µs max=151.92ms p(90)=1.09ms  p(95)=1.91ms  p(99.9)=27.45ms 
     http_req_sending...............: avg=51.94µs  min=4.85µs  med=8.87µs  max=219.13ms p(90)=17.8µs  p(95)=81.2µs  p(99.9)=4.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.64ms  min=1.48ms  med=16.54ms max=463.81ms p(90)=32.21ms p(95)=39.35ms p(99.9)=135.84ms
     http_reqs......................: 292821  2436.041303/s
     iteration_duration.............: avg=20.48ms  min=2.68ms  med=17.27ms max=464.21ms p(90)=33.44ms p(95)=40.81ms p(99.9)=139.93ms
     iterations.....................: 292721  2435.209381/s
     success_rate...................: 100.00% ✓ 292721      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 877572      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=3.33µs  min=972ns   med=2.69µs  max=12.65ms  p(90)=4.3µs   p(95)=5.03µs  p(99.9)=36.43µs
     http_req_connecting............: avg=194ns   min=0s      med=0s      max=3.34ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.26ms min=1.51ms  med=19.35ms max=286.36ms p(90)=29.3ms  p(95)=33.11ms p(99.9)=55.03ms
       { expected_response:true }...: avg=20.26ms min=1.51ms  med=19.35ms max=286.36ms p(90)=29.3ms  p(95)=33.11ms p(99.9)=55.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292624
     http_req_receiving.............: avg=791.5µs min=52.31µs med=122µs   max=115.56ms p(90)=2.02ms  p(95)=3.03ms  p(99.9)=22.18ms
     http_req_sending...............: avg=46.22µs min=4.76µs  med=10.17µs max=146ms    p(90)=19.7µs  p(95)=97.7µs  p(99.9)=4.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.42ms min=1.44ms  med=18.51ms max=286.02ms p(90)=28.31ms p(95)=32.06ms p(99.9)=53.32ms
     http_reqs......................: 292624  2434.422542/s
     iteration_duration.............: avg=20.5ms  min=3.04ms  med=19.56ms max=299.69ms p(90)=29.53ms p(95)=33.36ms p(99.9)=55.53ms
     iterations.....................: 292524  2433.590614/s
     success_rate...................: 100.00% ✓ 292524      ✗ 0     
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

     checks.........................: 100.00% ✓ 832443      ✗ 0     
     data_received..................: 24 GB   202 MB/s
     data_sent......................: 334 MB  2.8 MB/s
     http_req_blocked...............: avg=3.57µs  min=1.04µs  med=2.68µs   max=16.67ms  p(90)=4.24µs  p(95)=4.95µs  p(99.9)=39.21µs 
     http_req_connecting............: avg=340ns   min=0s      med=0s       max=3.63ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.38ms min=1.67ms  med=17.72ms  max=443.11ms p(90)=35.44ms p(95)=43.45ms p(99.9)=160.39ms
       { expected_response:true }...: avg=21.38ms min=1.67ms  med=17.72ms  max=443.11ms p(90)=35.44ms p(95)=43.45ms p(99.9)=160.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 277581
     http_req_receiving.............: avg=622µs   min=52.96µs med=102.55µs max=184.97ms p(90)=1.15ms  p(95)=1.97ms  p(99.9)=28.87ms 
     http_req_sending...............: avg=41.58µs min=4.85µs  med=10.33µs  max=136.65ms p(90)=18.33µs p(95)=80.79µs p(99.9)=3.02ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.72ms min=1.52ms  med=17.16ms  max=443.03ms p(90)=34.35ms p(95)=42.2ms  p(99.9)=158.66ms
     http_reqs......................: 277581  2309.04487/s
     iteration_duration.............: avg=21.61ms min=2.81ms  med=17.93ms  max=443.35ms p(90)=35.68ms p(95)=43.7ms  p(99.9)=163.18ms
     iterations.....................: 277481  2308.213024/s
     success_rate...................: 100.00% ✓ 277481      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 825351      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 331 MB  2.7 MB/s
     http_req_blocked...............: avg=3.36µs   min=872ns   med=2.73µs   max=15.36ms  p(90)=4.46µs  p(95)=5.21µs  p(99.9)=39.68µs 
     http_req_connecting............: avg=177ns    min=0s      med=0s       max=2.34ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.57ms  min=1.94ms  med=18.33ms  max=350.81ms p(90)=35.08ms p(95)=42.98ms p(99.9)=146.35ms
       { expected_response:true }...: avg=21.57ms  min=1.94ms  med=18.33ms  max=350.81ms p(90)=35.08ms p(95)=42.98ms p(99.9)=146.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 275217
     http_req_receiving.............: avg=581.53µs min=51.29µs med=101.75µs max=286.13ms p(90)=1.11ms  p(95)=1.92ms  p(99.9)=27.93ms 
     http_req_sending...............: avg=44.23µs  min=4.61µs  med=10.69µs  max=198.71ms p(90)=20.18µs p(95)=92.76µs p(99.9)=3.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.94ms  min=1.79ms  med=17.79ms  max=349.57ms p(90)=34.1ms  p(95)=41.87ms p(99.9)=143.36ms
     http_reqs......................: 275217  2288.575072/s
     iteration_duration.............: avg=21.8ms   min=2.72ms  med=18.55ms  max=351.02ms p(90)=35.31ms p(95)=43.23ms p(99.9)=147.69ms
     iterations.....................: 275117  2287.743519/s
     success_rate...................: 100.00% ✓ 275117      ✗ 0     
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

     checks.........................: 100.00% ✓ 590571      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=3.33µs  min=932ns   med=2.26µs  max=8.59ms   p(90)=4.39µs   p(95)=5.53µs   p(99.9)=42.4µs 
     http_req_connecting............: avg=471ns   min=0s      med=0s      max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.22ms min=2.24ms  med=29.76ms max=275.74ms p(90)=39.78ms  p(95)=43.07ms  p(99.9)=62.75ms
       { expected_response:true }...: avg=30.22ms min=2.24ms  med=29.76ms max=275.74ms p(90)=39.78ms  p(95)=43.07ms  p(99.9)=62.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 196957
     http_req_receiving.............: avg=92.79µs min=27.47µs med=55.86µs max=76.45ms  p(90)=125.22µs p(95)=205.16µs p(99.9)=3.61ms 
     http_req_sending...............: avg=41.23µs min=4.98µs  med=9.59µs  max=149.05ms p(90)=23.72µs  p(95)=106.93µs p(99.9)=3.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.09ms min=2.14ms  med=29.63ms max=275.62ms p(90)=39.63ms  p(95)=42.89ms  p(99.9)=62.37ms
     http_reqs......................: 196957  1637.300651/s
     iteration_duration.............: avg=30.47ms min=6.16ms  med=29.98ms max=322.43ms p(90)=40ms     p(95)=43.29ms  p(99.9)=63.24ms
     iterations.....................: 196857  1636.469353/s
     success_rate...................: 100.00% ✓ 196857      ✗ 0     
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

     checks.........................: 100.00% ✓ 446628      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=4.75µs  min=932ns   med=2.68µs  max=9.98ms   p(90)=4.41µs   p(95)=5.12µs   p(99.9)=35.65µs 
     http_req_connecting............: avg=1.66µs  min=0s      med=0s      max=9.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.04ms min=2.16ms  med=39.64ms max=301.37ms p(90)=55.55ms  p(95)=60.47ms  p(99.9)=83.23ms 
       { expected_response:true }...: avg=40.04ms min=2.16ms  med=39.64ms max=301.37ms p(90)=55.55ms  p(95)=60.47ms  p(99.9)=83.23ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148976
     http_req_receiving.............: avg=81.23µs min=26.43µs med=67.09µs max=175.73ms p(90)=107.23µs p(95)=124.24µs p(99.9)=909.35µs
     http_req_sending...............: avg=24.47µs min=4.92µs  med=11.77µs max=99.28ms  p(90)=19.29µs  p(95)=23.08µs  p(99.9)=1.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.94ms min=2.05ms  med=39.54ms max=300.32ms p(90)=55.44ms  p(95)=60.35ms  p(99.9)=82.77ms 
     http_reqs......................: 148976  1238.524305/s
     iteration_duration.............: avg=40.29ms min=4.22ms  med=39.87ms max=319.59ms p(90)=55.76ms  p(95)=60.68ms  p(99.9)=83.84ms 
     iterations.....................: 148876  1237.692947/s
     success_rate...................: 100.00% ✓ 148876      ✗ 0     
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

     checks.........................: 100.00% ✓ 211059     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   702 kB/s
     http_req_blocked...............: avg=4.88µs  min=1.29µs  med=3.34µs  max=3.95ms   p(90)=4.86µs   p(95)=5.55µs   p(99.9)=46.67µs 
     http_req_connecting............: avg=1.25µs  min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.93ms min=4.08ms  med=82.89ms max=329.24ms p(90)=104.07ms p(95)=114.32ms p(99.9)=199.11ms
       { expected_response:true }...: avg=84.93ms min=4.08ms  med=82.89ms max=329.24ms p(90)=104.07ms p(95)=114.32ms p(99.9)=199.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70453
     http_req_receiving.............: avg=86.35µs min=29.09µs med=77.59µs max=63.67ms  p(90)=114.34µs p(95)=128.61µs p(99.9)=667.48µs
     http_req_sending...............: avg=28.93µs min=5.19µs  med=15.79µs max=214.53ms p(90)=22.7µs   p(95)=25.01µs  p(99.9)=633.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.81ms min=3.96ms  med=82.79ms max=328.9ms  p(90)=103.94ms p(95)=114.16ms p(99.9)=198.98ms
     http_reqs......................: 70453   584.350728/s
     iteration_duration.............: avg=85.3ms  min=15.57ms med=83.16ms max=339.88ms p(90)=104.34ms p(95)=114.63ms p(99.9)=200.31ms
     iterations.....................: 70353   583.521309/s
     success_rate...................: 100.00% ✓ 70353      ✗ 0    
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

     checks.........................: 100.00% ✓ 148374     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   493 kB/s
     http_req_blocked...............: avg=5.52µs   min=1.16µs  med=3.4µs    max=4.15ms   p(90)=4.89µs   p(95)=5.49µs   p(99.9)=325.05µs
     http_req_connecting............: avg=1.92µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=238.9µs 
     http_req_duration..............: avg=120.84ms min=5.32ms  med=118.62ms max=314.68ms p(90)=159.28ms p(95)=171.12ms p(99.9)=220.52ms
       { expected_response:true }...: avg=120.84ms min=5.32ms  med=118.62ms max=314.68ms p(90)=159.28ms p(95)=171.12ms p(99.9)=220.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49558
     http_req_receiving.............: avg=86.3µs   min=28.44µs med=81.48µs  max=71.4ms   p(90)=112.42µs p(95)=124.72µs p(99.9)=585.88µs
     http_req_sending...............: avg=29.31µs  min=5.55µs  med=17.19µs  max=189.92ms p(90)=22.37µs  p(95)=24.13µs  p(99.9)=529.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.73ms min=5.23ms  med=118.51ms max=313.89ms p(90)=159.16ms p(95)=171.01ms p(99.9)=219.31ms
     http_reqs......................: 49558   410.669566/s
     iteration_duration.............: avg=121.35ms min=26.66ms med=118.93ms max=334.23ms p(90)=159.6ms  p(95)=171.44ms p(99.9)=221.59ms
     iterations.....................: 49458   409.840902/s
     success_rate...................: 100.00% ✓ 49458      ✗ 0    
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

     checks.........................: 100.00% ✓ 96531      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.36µs   min=1.03µs  med=3.21µs   max=3.58ms   p(90)=4.56µs   p(95)=5.13µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=185.71ms min=6.31ms  med=170.74ms max=673.25ms p(90)=215.81ms p(95)=267.33ms p(99.9)=574.92ms
       { expected_response:true }...: avg=185.71ms min=6.31ms  med=170.74ms max=673.25ms p(90)=215.81ms p(95)=267.33ms p(99.9)=574.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32277
     http_req_receiving.............: avg=94.2µs   min=28.45µs med=90.95µs  max=17.86ms  p(90)=120.84µs p(95)=132.77µs p(99.9)=621.09µs
     http_req_sending...............: avg=27.55µs  min=5.24µs  med=17.98µs  max=84.8ms   p(90)=22.24µs  p(95)=23.96µs  p(99.9)=451.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.59ms min=6.22ms  med=170.63ms max=673.16ms p(90)=215.61ms p(95)=267.23ms p(99.9)=574.81ms
     http_reqs......................: 32277   267.020968/s
     iteration_duration.............: avg=186.57ms min=40.04ms med=171.1ms  max=673.46ms p(90)=216.28ms p(95)=269.05ms p(99.9)=575.22ms
     iterations.....................: 32177   266.193689/s
     success_rate...................: 100.00% ✓ 32177      ✗ 0    
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

     checks.........................: 100.00% ✓ 95739      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   318 kB/s
     http_req_blocked...............: avg=7.12µs   min=1.29µs  med=3.54µs   max=4.32ms   p(90)=4.9µs    p(95)=5.49µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.32µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=187.26ms min=7.83ms  med=188.22ms max=380.99ms p(90)=243.03ms p(95)=248.8ms  p(99.9)=322.8ms 
       { expected_response:true }...: avg=187.26ms min=7.83ms  med=188.22ms max=380.99ms p(90)=243.03ms p(95)=248.8ms  p(99.9)=322.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32013
     http_req_receiving.............: avg=93.33µs  min=35.05µs med=88.84µs  max=14.47ms  p(90)=120.39µs p(95)=133.31µs p(99.9)=468.75µs
     http_req_sending...............: avg=40.11µs  min=6.18µs  med=17.75µs  max=150.13ms p(90)=22.5µs   p(95)=24.43µs  p(99.9)=511.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.12ms min=7.74ms  med=188.09ms max=380.66ms p(90)=242.9ms  p(95)=248.68ms p(99.9)=322.27ms
     http_reqs......................: 32013   264.53337/s
     iteration_duration.............: avg=188.12ms min=39.02ms med=188.67ms max=412.63ms p(90)=243.31ms p(95)=249.11ms p(99.9)=326.8ms 
     iterations.....................: 31913   263.707039/s
     success_rate...................: 100.00% ✓ 31913      ✗ 0    
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

     checks.........................: 100.00% ✓ 6564      ✗ 0   
     data_received..................: 219 MB  1.7 MB/s
     data_sent......................: 2.7 MB  22 kB/s
     http_req_blocked...............: avg=34.31µs min=1.63µs   med=3.57µs  max=4.85ms p(90)=5.09µs   p(95)=5.8µs   p(99.9)=4.59ms 
     http_req_connecting............: avg=27.08µs min=0s       med=0s      max=4.79ms p(90)=0s       p(95)=0s      p(99.9)=4.56ms 
     http_req_duration..............: avg=2.64s   min=29.37ms  med=2.66s   max=14.61s p(90)=3.66s    p(95)=4.09s   p(99.9)=13.34s 
       { expected_response:true }...: avg=2.64s   min=29.37ms  med=2.66s   max=14.61s p(90)=3.66s    p(95)=4.09s   p(99.9)=13.34s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2288
     http_req_receiving.............: avg=97.69µs min=34.4µs   med=93.31µs max=1.1ms  p(90)=132.41µs p(95)=153µs   p(99.9)=342.9µs
     http_req_sending...............: avg=38.23µs min=6.32µs   med=18.82µs max=6.53ms p(90)=23.7µs   p(95)=27.68µs p(99.9)=3.53ms 
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=2.64s   min=29.22ms  med=2.66s   max=14.61s p(90)=3.66s    p(95)=4.09s   p(99.9)=13.34s 
     http_reqs......................: 2288    18.10366/s
     iteration_duration.............: avg=2.76s   min=563.57ms med=2.68s   max=14.62s p(90)=3.67s    p(95)=4.13s   p(99.9)=13.39s 
     iterations.....................: 2188    17.312416/s
     success_rate...................: 100.00% ✓ 2188      ✗ 0   
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

