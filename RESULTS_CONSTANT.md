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
| hive-router | v0.0.84 | 3,106 | 3,380 | 3,065 | 3.3% |  |
| fusion-nightly | 16.6.0-p.8 | 2,654 | 2,758 | 2,646 | 1.5% |  |
| fusion-nightly-net11 | 16.6.0-p.8 | 2,649 | 2,770 | 2,617 | 2.0% |  |
| fusion | 16.5.1 | 2,586 | 2,685 | 2,568 | 1.6% |  |
| grafbase | 0.53.5 | 2,123 | 2,249 | 2,110 | 2.3% |  |
| cosmo | 0.334.0 | 1,314 | 1,359 | 1,306 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 617 | 635 | 616 | 1.0% |  |
| apollo-router | v2.16.1 | 474 | 493 | 462 | 2.1% |  |
| apollo-gateway | 2.14.3 | 280 | 283 | 279 | 0.5% |  |
| hive-gateway | 2.10.8 | 277 | 286 | 275 | 1.2% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1230 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.6.0-p.8 | 2,455 | 2,561 | 2,448 | 1.6% |  |
| fusion-nightly-net11 | 16.6.0-p.8 | 2,427 | 2,539 | 2,415 | 1.7% |  |
| hive-router | v0.0.84 | 2,423 | 2,608 | 2,392 | 3.1% |  |
| fusion | 16.5.1 | 2,408 | 2,440 | 2,399 | 0.5% |  |
| fusion-nightly-fed | 16.6.0-p.8 | 2,269 | 2,374 | 2,264 | 1.7% |  |
| grafbase | 0.53.5 | 1,637 | 1,690 | 1,627 | 1.3% |  |
| cosmo | 0.334.0 | 1,187 | 1,234 | 1,181 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 569 | 592 | 567 | 1.4% |  |
| apollo-router | v2.16.1 | 408 | 426 | 405 | 1.8% |  |
| apollo-gateway | 2.14.3 | 267 | 270 | 264 | 0.6% |  |
| hive-gateway | 2.10.8 | 262 | 268 | 260 | 1.1% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 3.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1119888     ✗ 0     
     data_received..................: 33 GB   273 MB/s
     data_sent......................: 449 MB  3.7 MB/s
     http_req_blocked...............: avg=2.87µs  min=862ns  med=2.1µs   max=20.97ms  p(90)=3.52µs  p(95)=4.16µs   p(99.9)=31.33µs
     http_req_connecting............: avg=259ns   min=0s     med=0s      max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.86ms min=1.49ms med=15.19ms max=291.52ms p(90)=23.09ms p(95)=26.33ms  p(99.9)=46.59ms
       { expected_response:true }...: avg=15.86ms min=1.49ms med=15.19ms max=291.52ms p(90)=23.09ms p(95)=26.33ms  p(99.9)=46.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 373396
     http_req_receiving.............: avg=90.9µs  min=24.4µs med=45.44µs max=40.88ms  p(90)=86.08µs p(95)=170.99µs p(99.9)=7.43ms 
     http_req_sending...............: avg=50.97µs min=4.54µs med=8.65µs  max=165.01ms p(90)=15.69µs p(95)=98.3µs   p(99.9)=8.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.71ms min=1.39ms med=15.08ms max=290.83ms p(90)=22.91ms p(95)=26.07ms  p(99.9)=45.05ms
     http_reqs......................: 373396  3106.705888/s
     iteration_duration.............: avg=16.06ms min=1.95ms med=15.38ms max=307.48ms p(90)=23.29ms p(95)=26.57ms  p(99.9)=47.44ms
     iterations.....................: 373296  3105.873874/s
     success_rate...................: 100.00% ✓ 373296      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 957378     ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 384 MB  3.2 MB/s
     http_req_blocked...............: avg=2.64µs   min=822ns   med=1.85µs  max=16.34ms  p(90)=2.94µs  p(95)=3.47µs  p(99.9)=28.15µs 
     http_req_connecting............: avg=268ns    min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.59ms  min=1.97ms  med=15.96ms max=292.72ms p(90)=30.35ms p(95)=36.78ms p(99.9)=115.49ms
       { expected_response:true }...: avg=18.59ms  min=1.97ms  med=15.96ms max=292.72ms p(90)=30.35ms p(95)=36.78ms p(99.9)=115.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 319226
     http_req_receiving.............: avg=540.88µs min=50.99µs med=87.89µs max=248.31ms p(90)=1.02ms  p(95)=1.82ms  p(99.9)=24.8ms  
     http_req_sending...............: avg=40.92µs  min=4.39µs  med=7.85µs  max=155.01ms p(90)=13.58µs p(95)=74.96µs p(99.9)=4.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18ms     min=1.89ms  med=15.45ms max=292.24ms p(90)=29.42ms p(95)=35.74ms p(99.9)=113.19ms
     http_reqs......................: 319226  2654.55758/s
     iteration_duration.............: avg=18.79ms  min=2.99ms  med=16.14ms max=312.36ms p(90)=30.56ms p(95)=37.01ms p(99.9)=116.34ms
     iterations.....................: 319126  2653.72602/s
     success_rate...................: 100.00% ✓ 319126     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 955638      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 383 MB  3.2 MB/s
     http_req_blocked...............: avg=2.61µs   min=822ns   med=1.91µs   max=6.3ms    p(90)=3.31µs  p(95)=3.96µs  p(99.9)=28.5µs 
     http_req_connecting............: avg=265ns    min=0s      med=0s       max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.61ms  min=1.96ms  med=17.78ms  max=310.68ms p(90)=26.59ms p(95)=30.09ms p(99.9)=50.07ms
       { expected_response:true }...: avg=18.61ms  min=1.96ms  med=17.78ms  max=310.68ms p(90)=26.59ms p(95)=30.09ms p(99.9)=50.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 318646
     http_req_receiving.............: avg=664.18µs min=50.01µs med=104.12µs max=143.53ms p(90)=1.7ms   p(95)=2.52ms  p(99.9)=19.28ms
     http_req_sending...............: avg=44.06µs  min=4.53µs  med=8.23µs   max=133.5ms  p(90)=16.97µs p(95)=85.75µs p(99.9)=4.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.9ms   min=1.83ms  med=17.07ms  max=305.53ms p(90)=25.76ms p(95)=29.17ms p(99.9)=48.44ms
     http_reqs......................: 318646  2649.967768/s
     iteration_duration.............: avg=18.82ms  min=3.66ms  med=17.98ms  max=324.31ms p(90)=26.8ms  p(95)=30.32ms p(99.9)=50.82ms
     iterations.....................: 318546  2649.136134/s
     success_rate...................: 100.00% ✓ 318546      ✗ 0     
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

     checks.........................: 100.00% ✓ 932694      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=2.66µs   min=832ns   med=1.92µs  max=19.48ms  p(90)=3.05µs  p(95)=3.6µs   p(99.9)=29.09µs 
     http_req_connecting............: avg=299ns    min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.08ms  min=1.99ms  med=16.4ms  max=323.62ms p(90)=30.94ms p(95)=37.48ms p(99.9)=118.47ms
       { expected_response:true }...: avg=19.08ms  min=1.99ms  med=16.4ms  max=323.62ms p(90)=30.94ms p(95)=37.48ms p(99.9)=118.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310998
     http_req_receiving.............: avg=544.56µs min=50.41µs med=89.17µs max=171.92ms p(90)=1.04ms  p(95)=1.82ms  p(99.9)=24.77ms 
     http_req_sending...............: avg=37.4µs   min=4.63µs  med=8.21µs  max=156.37ms p(90)=14.3µs  p(95)=75.04µs p(99.9)=2.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.5ms   min=1.88ms  med=15.9ms  max=323.45ms p(90)=30.03ms p(95)=36.38ms p(99.9)=117.64ms
     http_reqs......................: 310998  2586.335716/s
     iteration_duration.............: avg=19.29ms  min=2.69ms  med=16.6ms  max=323.8ms  p(90)=31.15ms p(95)=37.7ms  p(99.9)=119.45ms
     iterations.....................: 310898  2585.504092/s
     success_rate...................: 100.00% ✓ 310898      ✗ 0     
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

     checks.........................: 100.00% ✓ 765798      ✗ 0     
     data_received..................: 22 GB   187 MB/s
     data_sent......................: 307 MB  2.6 MB/s
     http_req_blocked...............: avg=3.01µs  min=942ns   med=2.17µs  max=14.76ms  p(90)=3.59µs  p(95)=4.29µs   p(99.9)=31.91µs
     http_req_connecting............: avg=324ns   min=0s      med=0s      max=3.3ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.28ms min=1.77ms  med=23.05ms max=285.59ms p(90)=27.53ms p(95)=29.22ms  p(99.9)=47.68ms
       { expected_response:true }...: avg=23.28ms min=1.77ms  med=23.05ms max=285.59ms p(90)=27.53ms p(95)=29.22ms  p(99.9)=47.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 255366
     http_req_receiving.............: avg=84.92µs min=28.23µs med=54.91µs max=153ms    p(90)=90.53µs p(95)=113.98µs p(99.9)=4.74ms 
     http_req_sending...............: avg=32.68µs min=4.93µs  med=9.37µs  max=114.26ms p(90)=15.83µs p(95)=23.54µs  p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.16ms min=1.68ms  med=22.95ms max=284.94ms p(90)=27.41ms p(95)=29.06ms  p(99.9)=46.69ms
     http_reqs......................: 255366  2123.986314/s
     iteration_duration.............: avg=23.49ms min=5.9ms   med=23.24ms max=295.78ms p(90)=27.73ms p(95)=29.43ms  p(99.9)=48.26ms
     iterations.....................: 255266  2123.154572/s
     success_rate...................: 100.00% ✓ 255266      ✗ 0     
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

     checks.........................: 100.00% ✓ 473889      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=3.42µs  min=1.09µs  med=2.56µs  max=3.53ms   p(90)=4.05µs  p(95)=4.71µs   p(99.9)=34.32µs 
     http_req_connecting............: avg=551ns   min=0s      med=0s      max=3.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.74ms min=2.02ms  med=37.39ms max=314.27ms p(90)=52.7ms  p(95)=57.33ms  p(99.9)=78.7ms  
       { expected_response:true }...: avg=37.74ms min=2.02ms  med=37.39ms max=314.27ms p(90)=52.7ms  p(95)=57.33ms  p(99.9)=78.7ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 158063
     http_req_receiving.............: avg=73.46µs min=26.73µs med=59.14µs max=64.41ms  p(90)=94.87µs p(95)=110.25µs p(99.9)=918.57µs
     http_req_sending...............: avg=26.25µs min=4.83µs  med=11.11µs max=128.83ms p(90)=17.68µs p(95)=21.74µs  p(99.9)=1.03ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.64ms min=1.92ms  med=37.29ms max=313.67ms p(90)=52.6ms  p(95)=57.22ms  p(99.9)=78.45ms 
     http_reqs......................: 158063  1314.295694/s
     iteration_duration.............: avg=37.97ms min=3.5ms   med=37.61ms max=325.33ms p(90)=52.92ms p(95)=57.54ms  p(99.9)=78.94ms 
     iterations.....................: 157963  1313.464193/s
     success_rate...................: 100.00% ✓ 157963      ✗ 0     
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

     checks.........................: 100.00% ✓ 223035     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   742 kB/s
     http_req_blocked...............: avg=3.77µs  min=942ns   med=2.23µs  max=4.14ms   p(90)=3.65µs  p(95)=4.23µs   p(99.9)=43.68µs 
     http_req_connecting............: avg=1.22µs  min=0s      med=0s      max=4.09ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.39ms min=3.58ms  med=79.02ms max=321.75ms p(90)=98.92ms p(95)=108.17ms p(99.9)=192.25ms
       { expected_response:true }...: avg=80.39ms min=3.58ms  med=79.02ms max=321.75ms p(90)=98.92ms p(95)=108.17ms p(99.9)=192.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74445
     http_req_receiving.............: avg=76.81µs min=28.99µs med=62.71µs max=114.45ms p(90)=97.83µs p(95)=110.65µs p(99.9)=599.45µs
     http_req_sending...............: avg=18.97µs min=4.77µs  med=10.81µs max=95ms     p(90)=17.83µs p(95)=19.85µs  p(99.9)=575.59µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.29ms min=3.5ms   med=78.93ms max=320.96ms p(90)=98.82ms p(95)=108.05ms p(99.9)=191.64ms
     http_reqs......................: 74445   617.889856/s
     iteration_duration.............: avg=80.72ms min=25.2ms  med=79.25ms max=336.62ms p(90)=99.16ms p(95)=108.42ms p(99.9)=195.58ms
     iterations.....................: 74345   617.059861/s
     success_rate...................: 100.00% ✓ 74345      ✗ 0    
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

     checks.........................: 100.00% ✓ 171414     ✗ 0    
     data_received..................: 5.0 GB  42 MB/s
     data_sent......................: 69 MB   570 kB/s
     http_req_blocked...............: avg=5.06µs   min=1.23µs  med=3.34µs   max=3.47ms   p(90)=4.73µs   p(95)=5.3µs    p(99.9)=58.98µs 
     http_req_connecting............: avg=1.51µs   min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=104.6ms  min=4.49ms  med=104.2ms  max=323.84ms p(90)=127.06ms p(95)=133.99ms p(99.9)=166.45ms
       { expected_response:true }...: avg=104.6ms  min=4.49ms  med=104.2ms  max=323.84ms p(90)=127.06ms p(95)=133.99ms p(99.9)=166.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 57238
     http_req_receiving.............: avg=82.7µs   min=29.59µs med=73.88µs  max=168.89ms p(90)=106.42µs p(95)=118.96µs p(99.9)=603.74µs
     http_req_sending...............: avg=23.55µs  min=5.36µs  med=15.42µs  max=113.3ms  p(90)=20.93µs  p(95)=22.83µs  p(99.9)=569.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.49ms min=4.43ms  med=104.09ms max=323.2ms  p(90)=126.94ms p(95)=133.89ms p(99.9)=166.14ms
     http_reqs......................: 57238   474.645463/s
     iteration_duration.............: avg=105.03ms min=24.12ms med=104.46ms max=333.02ms p(90)=127.3ms  p(95)=134.25ms p(99.9)=167.4ms 
     iterations.....................: 57138   473.816215/s
     success_rate...................: 100.00% ✓ 57138      ✗ 0    
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

     checks.........................: 100.00% ✓ 101448     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   337 kB/s
     http_req_blocked...............: avg=10.22µs  min=1.07µs  med=2.88µs   max=8.49ms   p(90)=4.13µs   p(95)=4.6µs    p(99.9)=3.59ms  
     http_req_connecting............: avg=7.02µs   min=0s      med=0s       max=8.31ms   p(90)=0s       p(95)=0s       p(99.9)=3.48ms  
     http_req_duration..............: avg=176.75ms min=7.54ms  med=176.19ms max=386.23ms p(90)=186.29ms p(95)=191.07ms p(99.9)=252.55ms
       { expected_response:true }...: avg=176.75ms min=7.54ms  med=176.19ms max=386.23ms p(90)=186.29ms p(95)=191.07ms p(99.9)=252.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33916
     http_req_receiving.............: avg=84.42µs  min=29.06µs med=80.02µs  max=81.12ms  p(90)=108.93µs p(95)=120.06µs p(99.9)=456.44µs
     http_req_sending...............: avg=23.62µs  min=5.09µs  med=15.62µs  max=63.13ms  p(90)=19.57µs  p(95)=21.13µs  p(99.9)=673.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.64ms min=7.4ms   med=176.09ms max=385.72ms p(90)=186.19ms p(95)=190.97ms p(99.9)=252.37ms
     http_reqs......................: 33916   280.404631/s
     iteration_duration.............: avg=177.53ms min=39.11ms med=176.52ms max=405.09ms p(90)=186.54ms p(95)=191.34ms p(99.9)=256.46ms
     iterations.....................: 33816   279.577869/s
     success_rate...................: 100.00% ✓ 33816      ✗ 0    
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

     checks.........................: 100.00% ✓ 100206     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   333 kB/s
     http_req_blocked...............: avg=6.69µs   min=1.43µs  med=3.61µs   max=3.43ms   p(90)=5.04µs   p(95)=5.64µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=2.81µs   min=0s      med=0s       max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=178.89ms min=5.66ms  med=165.41ms max=689.83ms p(90)=215.35ms p(95)=263.63ms p(99.9)=556.02ms
       { expected_response:true }...: avg=178.89ms min=5.66ms  med=165.41ms max=689.83ms p(90)=215.35ms p(95)=263.63ms p(99.9)=556.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33502
     http_req_receiving.............: avg=101.17µs min=34.65µs med=89.97µs  max=155.34ms p(90)=120.63µs p(95)=132.68µs p(99.9)=778.32µs
     http_req_sending...............: avg=23.98µs  min=6.51µs  med=18.02µs  max=37.52ms  p(90)=22.94µs  p(95)=24.75µs  p(99.9)=447.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.77ms min=5.51ms  med=165.3ms  max=689.73ms p(90)=215.16ms p(95)=263.06ms p(99.9)=555.92ms
     http_reqs......................: 33502   277.301427/s
     iteration_duration.............: avg=179.7ms  min=46.1ms  med=165.82ms max=690.02ms p(90)=215.76ms p(95)=265.49ms p(99.9)=556.38ms
     iterations.....................: 33402   276.473711/s
     success_rate...................: 100.00% ✓ 33402      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 885129      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=2.88µs   min=872ns  med=2.02µs  max=17.65ms  p(90)=3.63µs  p(95)=4.36µs  p(99.9)=33.78µs 
     http_req_connecting............: avg=331ns    min=0s     med=0s      max=3.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.11ms  min=1.6ms  med=16.76ms max=309.46ms p(90)=33.09ms p(95)=40.73ms p(99.9)=154.44ms
       { expected_response:true }...: avg=20.11ms  min=1.6ms  med=16.76ms max=309.46ms p(90)=33.09ms p(95)=40.73ms p(99.9)=154.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295143
     http_req_receiving.............: avg=567.32µs min=51.5µs med=92.24µs max=161.36ms p(90)=1.07ms  p(95)=1.85ms  p(99.9)=28.75ms 
     http_req_sending...............: avg=41.19µs  min=4.48µs med=8.47µs  max=260.19ms p(90)=17.06µs p(95)=76.66µs p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.5ms   min=1.48ms med=16.26ms max=308.89ms p(90)=32.12ms p(95)=39.57ms p(99.9)=152.96ms
     http_reqs......................: 295143  2455.095949/s
     iteration_duration.............: avg=20.32ms  min=2.59ms med=16.97ms max=309.67ms p(90)=33.32ms p(95)=40.97ms p(99.9)=155.36ms
     iterations.....................: 295043  2454.264116/s
     success_rate...................: 100.00% ✓ 295043      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 875148      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=2.85µs   min=871ns   med=2.02µs   max=12.38ms  p(90)=3.66µs  p(95)=4.41µs  p(99.9)=29.96µs
     http_req_connecting............: avg=321ns    min=0s      med=0s       max=3.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.34ms  min=1.54ms  med=19.51ms  max=296.84ms p(90)=29.17ms p(95)=32.69ms p(99.9)=54.06ms
       { expected_response:true }...: avg=20.34ms  min=1.54ms  med=19.51ms  max=296.84ms p(90)=29.17ms p(95)=32.69ms p(99.9)=54.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291816
     http_req_receiving.............: avg=782.12µs min=51.45µs med=127.06µs max=220.09ms p(90)=1.96ms  p(95)=2.89ms  p(99.9)=20.63ms
     http_req_sending...............: avg=41.03µs  min=4.64µs  med=8.45µs   max=122.65ms p(90)=17.56µs p(95)=76.49µs p(99.9)=3.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.51ms  min=1.41ms  med=18.67ms  max=279.28ms p(90)=28.21ms p(95)=31.67ms p(99.9)=51.81ms
     http_reqs......................: 291816  2427.641847/s
     iteration_duration.............: avg=20.55ms  min=2.74ms  med=19.71ms  max=307.42ms p(90)=29.38ms p(95)=32.91ms p(99.9)=54.65ms
     iterations.....................: 291716  2426.809939/s
     success_rate...................: 100.00% ✓ 291716      ✗ 0     
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

     checks.........................: 100.00% ✓ 873885      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=3.19µs  min=941ns   med=2.61µs  max=6.24ms   p(90)=4.18µs  p(95)=4.93µs   p(99.9)=39.04µs
     http_req_connecting............: avg=145ns   min=0s      med=0s      max=2.68ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.36ms min=1.76ms  med=20.14ms max=300.98ms p(90)=28.28ms p(95)=30.7ms   p(99.9)=49.58ms
       { expected_response:true }...: avg=20.36ms min=1.76ms  med=20.14ms max=300.98ms p(90)=28.28ms p(95)=30.7ms   p(99.9)=49.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291395
     http_req_receiving.............: avg=92.93µs min=27.15µs med=54.83µs max=114.95ms p(90)=95.38µs p(95)=132.49µs p(99.9)=6.84ms 
     http_req_sending...............: avg=41.83µs min=4.6µs   med=10.68µs max=102.21ms p(90)=17.91µs p(95)=82.09µs  p(99.9)=2.58ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.23ms min=1.68ms  med=20.02ms max=300.76ms p(90)=28.12ms p(95)=30.51ms  p(99.9)=48.66ms
     http_reqs......................: 291395  2423.834825/s
     iteration_duration.............: avg=20.58ms min=3.32ms  med=20.35ms max=328.24ms p(90)=28.49ms p(95)=30.91ms  p(99.9)=50.09ms
     iterations.....................: 291295  2423.003021/s
     success_rate...................: 100.00% ✓ 291295      ✗ 0     
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

     checks.........................: 100.00% ✓ 868389      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=3.4µs    min=961ns   med=2.51µs  max=14.87ms  p(90)=4.05µs  p(95)=4.76µs  p(99.9)=37.21µs 
     http_req_connecting............: avg=311ns    min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.5ms   min=1.64ms  med=17.22ms max=441.04ms p(90)=33.58ms p(95)=41.05ms p(99.9)=145.55ms
       { expected_response:true }...: avg=20.5ms   min=1.64ms  med=17.22ms max=441.04ms p(90)=33.58ms p(95)=41.05ms p(99.9)=145.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289563
     http_req_receiving.............: avg=577.44µs min=50.89µs med=97.33µs max=184.58ms p(90)=1.09ms  p(95)=1.92ms  p(99.9)=27.43ms 
     http_req_sending...............: avg=44.29µs  min=4.59µs  med=9.57µs  max=183.46ms p(90)=17.92µs p(95)=89.61µs p(99.9)=3.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.87ms  min=1.56ms  med=16.69ms max=440.94ms p(90)=32.58ms p(95)=39.9ms  p(99.9)=144.03ms
     http_reqs......................: 289563  2408.628334/s
     iteration_duration.............: avg=20.71ms  min=2.61ms  med=17.43ms max=441.24ms p(90)=33.81ms p(95)=41.3ms  p(99.9)=146.25ms
     iterations.....................: 289463  2407.796519/s
     success_rate...................: 100.00% ✓ 289463      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 818304     ✗ 0     
     data_received..................: 24 GB   199 MB/s
     data_sent......................: 328 MB  2.7 MB/s
     http_req_blocked...............: avg=3.13µs  min=872ns   med=2.16µs  max=17.66ms  p(90)=3.81µs  p(95)=4.55µs  p(99.9)=32.65µs 
     http_req_connecting............: avg=350ns   min=0s      med=0s      max=3.64ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.77ms min=1.92ms  med=18.57ms max=317.63ms p(90)=34.93ms p(95)=42.81ms p(99.9)=136.37ms
       { expected_response:true }...: avg=21.77ms min=1.92ms  med=18.57ms max=317.63ms p(90)=34.93ms p(95)=42.81ms p(99.9)=136.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 272868
     http_req_receiving.............: avg=572.5µs min=51.43µs med=99.44µs max=176.81ms p(90)=1.11ms  p(95)=1.9ms   p(99.9)=27.24ms 
     http_req_sending...............: avg=41.7µs  min=4.47µs  med=9.15µs  max=116.85ms p(90)=19.04µs p(95)=77.94µs p(99.9)=3.28ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.15ms min=1.79ms  med=18.05ms max=317.54ms p(90)=33.95ms p(95)=41.61ms p(99.9)=135.47ms
     http_reqs......................: 272868  2269.11614/s
     iteration_duration.............: avg=21.98ms min=3.33ms  med=18.78ms max=317.83ms p(90)=35.16ms p(95)=43.04ms p(99.9)=137.14ms
     iterations.....................: 272768  2268.28456/s
     success_rate...................: 100.00% ✓ 272768     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 590502      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=3.28µs  min=891ns   med=2.22µs  max=7.4ms    p(90)=4.24µs   p(95)=5.4µs    p(99.9)=41.56µs
     http_req_connecting............: avg=432ns   min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.23ms min=2.27ms  med=29.71ms max=307.15ms p(90)=39.9ms   p(95)=43.28ms  p(99.9)=63.2ms 
       { expected_response:true }...: avg=30.23ms min=2.27ms  med=29.71ms max=307.15ms p(90)=39.9ms   p(95)=43.28ms  p(99.9)=63.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 196934
     http_req_receiving.............: avg=91.96µs min=26.53µs med=54.92µs max=116.81ms p(90)=122.72µs p(95)=193.14µs p(99.9)=3.25ms 
     http_req_sending...............: avg=41.27µs min=4.74µs  med=9.41µs  max=115.03ms p(90)=23.36µs  p(95)=102.3µs  p(99.9)=3.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.1ms  min=2.19ms  med=29.59ms max=306.51ms p(90)=39.75ms  p(95)=43.1ms   p(99.9)=62.67ms
     http_reqs......................: 196934  1637.324947/s
     iteration_duration.............: avg=30.47ms min=6.36ms  med=29.92ms max=324.64ms p(90)=40.12ms  p(95)=43.5ms   p(99.9)=63.85ms
     iterations.....................: 196834  1636.493539/s
     success_rate...................: 100.00% ✓ 196834      ✗ 0     
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

     checks.........................: 100.00% ✓ 428073      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.26µs  min=992ns   med=2.31µs  max=3.34ms   p(90)=3.9µs    p(95)=4.58µs   p(99.9)=35.51µs 
     http_req_connecting............: avg=623ns   min=0s      med=0s      max=3.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.8ms  min=2.11ms  med=41.39ms max=300.99ms p(90)=58.35ms  p(95)=63.41ms  p(99.9)=89.23ms 
       { expected_response:true }...: avg=41.8ms  min=2.11ms  med=41.39ms max=300.99ms p(90)=58.35ms  p(95)=63.41ms  p(99.9)=89.23ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142791
     http_req_receiving.............: avg=78.91µs min=26.22µs med=65.58µs max=113.49ms p(90)=105.05µs p(95)=121.35µs p(99.9)=786.36µs
     http_req_sending...............: avg=23.3µs  min=4.83µs  med=10.91µs max=134.52ms p(90)=17.54µs  p(95)=21.03µs  p(99.9)=950.82µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.69ms min=1.99ms  med=41.29ms max=300.08ms p(90)=58.23ms  p(95)=63.3ms   p(99.9)=88.93ms 
     http_reqs......................: 142791  1187.178556/s
     iteration_duration.............: avg=42.04ms min=4.09ms  med=41.6ms  max=310.07ms p(90)=58.56ms  p(95)=63.62ms  p(99.9)=89.77ms 
     iterations.....................: 142691  1186.347146/s
     success_rate...................: 100.00% ✓ 142691      ✗ 0     
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

     checks.........................: 100.00% ✓ 205581     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   684 kB/s
     http_req_blocked...............: avg=4.94µs  min=1.23µs  med=3.27µs  max=4.13ms   p(90)=4.75µs   p(95)=5.43µs   p(99.9)=46.45µs 
     http_req_connecting............: avg=1.43µs  min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.18ms min=3.84ms  med=85.24ms max=342.02ms p(90)=108.01ms p(95)=118.91ms p(99.9)=204.77ms
       { expected_response:true }...: avg=87.18ms min=3.84ms  med=85.24ms max=342.02ms p(90)=108.01ms p(95)=118.91ms p(99.9)=204.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68627
     http_req_receiving.............: avg=85.16µs min=31.88µs med=75.55µs max=100.22ms p(90)=111.44µs p(95)=124.82µs p(99.9)=714.93µs
     http_req_sending...............: avg=31.22µs min=5.73µs  med=14.94µs max=241.07ms p(90)=21.5µs   p(95)=23.67µs  p(99.9)=621.32µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.06ms min=3.76ms  med=85.13ms max=341.31ms p(90)=107.89ms p(95)=118.79ms p(99.9)=204.33ms
     http_reqs......................: 68627   569.480484/s
     iteration_duration.............: avg=87.56ms min=27.7ms  med=85.5ms  max=353.97ms p(90)=108.28ms p(95)=119.2ms  p(99.9)=206.56ms
     iterations.....................: 68527   568.650664/s
     success_rate...................: 100.00% ✓ 68527      ✗ 0    
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

     checks.........................: 100.00% ✓ 147576     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   490 kB/s
     http_req_blocked...............: avg=5.59µs   min=1.11µs  med=3.65µs   max=3.42ms   p(90)=5.12µs   p(95)=5.7µs    p(99.9)=117.25µs
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=69.48µs 
     http_req_duration..............: avg=121.48ms min=5.51ms  med=119.29ms max=319.8ms  p(90)=160.93ms p(95)=172.47ms p(99.9)=220.49ms
       { expected_response:true }...: avg=121.48ms min=5.51ms  med=119.29ms max=319.8ms  p(90)=160.93ms p(95)=172.47ms p(99.9)=220.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49292
     http_req_receiving.............: avg=88.61µs  min=34.24µs med=84.14µs  max=71.85ms  p(90)=114.67µs p(95)=127.21µs p(99.9)=598.27µs
     http_req_sending...............: avg=28.61µs  min=6.12µs  med=17.88µs  max=105.72ms p(90)=22.88µs  p(95)=24.73µs  p(99.9)=570.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.37ms min=5.38ms  med=119.18ms max=308.46ms p(90)=160.81ms p(95)=172.35ms p(99.9)=220.38ms
     http_reqs......................: 49292   408.460914/s
     iteration_duration.............: avg=122ms    min=30.78ms med=119.61ms max=331.4ms  p(90)=161.23ms p(95)=172.77ms p(99.9)=222.32ms
     iterations.....................: 49192   407.632259/s
     success_rate...................: 100.00% ✓ 49192      ✗ 0    
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

     checks.........................: 100.00% ✓ 96738      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.51µs   min=1.2µs   med=3.19µs   max=4.07ms   p(90)=4.57µs   p(95)=5.14µs   p(99.9)=1.47ms  
     http_req_connecting............: avg=3.08µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=185.34ms min=7.79ms  med=185.17ms max=362.96ms p(90)=197.98ms p(95)=202.69ms p(99.9)=273.68ms
       { expected_response:true }...: avg=185.34ms min=7.79ms  med=185.17ms max=362.96ms p(90)=197.98ms p(95)=202.69ms p(99.9)=273.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32346
     http_req_receiving.............: avg=90.19µs  min=31.35µs med=86.89µs  max=18.24ms  p(90)=116.78µs p(95)=127.82µs p(99.9)=576.79µs
     http_req_sending...............: avg=28.9µs   min=5.57µs  med=17.51µs  max=56.34ms  p(90)=22.3µs   p(95)=24.2µs   p(99.9)=544.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.22ms min=7.65ms  med=185.05ms max=362.62ms p(90)=197.87ms p(95)=202.58ms p(99.9)=273.55ms
     http_reqs......................: 32346   267.357663/s
     iteration_duration.............: avg=186.18ms min=49.22ms med=185.53ms max=371.87ms p(90)=198.28ms p(95)=203ms    p(99.9)=275.55ms
     iterations.....................: 32246   266.531107/s
     success_rate...................: 100.00% ✓ 32246      ✗ 0    
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

     checks.........................: 100.00% ✓ 94944      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=5.97µs   min=1.13µs  med=3.02µs   max=3.56ms   p(90)=4.31µs   p(95)=4.86µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.77µs   min=0s      med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=188.82ms min=6.48ms  med=182.64ms max=673.67ms p(90)=229.63ms p(95)=298.87ms p(99.9)=564.78ms
       { expected_response:true }...: avg=188.82ms min=6.48ms  med=182.64ms max=673.67ms p(90)=229.63ms p(95)=298.87ms p(99.9)=564.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31748
     http_req_receiving.............: avg=93.22µs  min=32.37µs med=87.79µs  max=61.21ms  p(90)=116.93µs p(95)=128.56µs p(99.9)=665.27µs
     http_req_sending...............: avg=31.2µs   min=5.39µs  med=16.74µs  max=112.17ms p(90)=21.04µs  p(95)=22.77µs  p(99.9)=549.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.7ms  min=6.35ms  med=182.52ms max=673.57ms p(90)=229.47ms p(95)=298.77ms p(99.9)=564.7ms 
     http_reqs......................: 31748   262.616462/s
     iteration_duration.............: avg=189.69ms min=20.58ms med=183.01ms max=673.94ms p(90)=230.1ms  p(95)=301.09ms p(99.9)=565.07ms
     iterations.....................: 31648   261.789271/s
     success_rate...................: 100.00% ✓ 31648      ✗ 0    
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

     checks.........................: 100.00% ✓ 7551      ✗ 0   
     data_received..................: 251 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=38.38µs  min=1.28µs   med=3.61µs  max=3.65ms  p(90)=5.32µs   p(95)=6.06µs   p(99.9)=3.36ms
     http_req_connecting............: avg=34.18µs  min=0s       med=0s      max=3.6ms   p(90)=0s       p(95)=0s       p(99.9)=3.33ms
     http_req_duration..............: avg=2.3s     min=25.35ms  med=2.36s   max=4.66s   p(90)=3.11s    p(95)=3.29s    p(99.9)=4.28s 
       { expected_response:true }...: avg=2.3s     min=25.35ms  med=2.36s   max=4.66s   p(90)=3.11s    p(95)=3.29s    p(99.9)=4.28s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2617
     http_req_receiving.............: avg=114.95µs min=35.57µs  med=95.28µs max=16.75ms p(90)=139.08µs p(95)=154.36µs p(99.9)=5.28ms
     http_req_sending...............: avg=46.45µs  min=5.93µs   med=19.5µs  max=20.65ms p(90)=24.83µs  p(95)=28.81µs  p(99.9)=3.19ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.3s     min=25.15ms  med=2.36s   max=4.66s   p(90)=3.11s    p(95)=3.29s    p(99.9)=4.28s 
     http_reqs......................: 2617    20.865796/s
     iteration_duration.............: avg=2.39s    min=370.02ms med=2.39s   max=4.66s   p(90)=3.12s    p(95)=3.31s    p(99.9)=4.3s  
     iterations.....................: 2517    20.068479/s
     success_rate...................: 100.00% ✓ 2517      ✗ 0   
     vus............................: 22      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

