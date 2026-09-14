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
| hive-router | v0.0.84 | 3,163 | 3,448 | 3,066 | 3.7% |  |
| fusion | 16.6.6 | 2,666 | 2,792 | 2,659 | 1.8% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,653 | 2,787 | 2,629 | 2.2% |  |
| fusion-nightly | 16.7.0-p.6 | 2,557 | 2,679 | 2,542 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,478 | 2,549 | 2,457 | 1.1% |  |
| grafbase | 0.53.5 | 2,171 | 2,272 | 2,157 | 2.0% |  |
| cosmo | 0.334.0 | 1,283 | 1,341 | 1,272 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.8 | 616 | 635 | 614 | 1.4% |  |
| apollo-router | v2.16.1 | 446 | 467 | 442 | 2.0% |  |
| apollo-gateway | 2.14.3 | 281 | 285 | 278 | 0.7% |  |
| hive-gateway | 2.10.8 | 274 | 282 | 273 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1138 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,549 | 2,745 | 2,501 | 3.1% |  |
| fusion | 16.6.6 | 2,444 | 2,566 | 2,410 | 2.0% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,429 | 2,549 | 2,406 | 2.0% |  |
| fusion-nightly | 16.7.0-p.6 | 2,404 | 2,542 | 2,390 | 2.3% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,314 | 2,391 | 2,294 | 1.4% |  |
| grafbase | 0.53.5 | 1,600 | 1,657 | 1,599 | 1.3% |  |
| cosmo | 0.334.0 | 1,190 | 1,235 | 1,183 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 594 | 607 | 586 | 1.0% |  |
| apollo-router | v2.16.1 | 413 | 434 | 410 | 1.9% |  |
| apollo-gateway | 2.14.3 | 267 | 270 | 266 | 0.5% |  |
| hive-gateway | 2.10.8 | 258 | 267 | 258 | 1.3% |  |
| feddi | 5ff8b6165878 | 21 | 22 | 21 | 2.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1140105     ✗ 0     
     data_received..................: 33 GB   277 MB/s
     data_sent......................: 457 MB  3.8 MB/s
     http_req_blocked...............: avg=2.62µs  min=892ns   med=1.97µs  max=16.8ms   p(90)=3.17µs  p(95)=3.77µs   p(99.9)=29.45µs
     http_req_connecting............: avg=221ns   min=0s      med=0s      max=3.31ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.57ms min=1.4ms   med=14.96ms max=283.9ms  p(90)=22.55ms p(95)=25.62ms  p(99.9)=45.94ms
       { expected_response:true }...: avg=15.57ms min=1.4ms   med=14.96ms max=283.9ms  p(90)=22.55ms p(95)=25.62ms  p(99.9)=45.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 380135
     http_req_receiving.............: avg=86.55µs min=24.94µs med=44.92µs max=130.34ms p(90)=81.5µs  p(95)=151.36µs p(99.9)=7.13ms 
     http_req_sending...............: avg=47.49µs min=4.33µs  med=8.25µs  max=221.49ms p(90)=14.05µs p(95)=90.69µs  p(99.9)=6.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.44ms min=1.35ms  med=14.85ms max=272.49ms p(90)=22.39ms p(95)=25.37ms  p(99.9)=44.71ms
     http_reqs......................: 380135  3163.035815/s
     iteration_duration.............: avg=15.77ms min=1.88ms  med=15.14ms max=294.3ms  p(90)=22.75ms p(95)=25.83ms  p(99.9)=46.76ms
     iterations.....................: 380035  3162.203733/s
     success_rate...................: 100.00% ✓ 380035      ✗ 0     
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

     checks.........................: 100.00% ✓ 961698      ✗ 0     
     data_received..................: 28 GB   234 MB/s
     data_sent......................: 385 MB  3.2 MB/s
     http_req_blocked...............: avg=3.16µs   min=972ns   med=2.33µs  max=16.37ms  p(90)=3.62µs  p(95)=4.23µs  p(99.9)=33.41µs 
     http_req_connecting............: avg=296ns    min=0s      med=0s      max=3.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.49ms  min=1.92ms  med=15.97ms max=283.71ms p(90)=30.04ms p(95)=36.29ms p(99.9)=111.41ms
       { expected_response:true }...: avg=18.49ms  min=1.92ms  med=15.97ms max=283.71ms p(90)=30.04ms p(95)=36.29ms p(99.9)=111.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 320666
     http_req_receiving.............: avg=534.49µs min=49.98µs med=88.5µs  max=177.02ms p(90)=1.03ms  p(95)=1.9ms   p(99.9)=23.93ms 
     http_req_sending...............: avg=47.29µs  min=4.79µs  med=8.72µs  max=165.95ms p(90)=15µs    p(95)=90.1µs  p(99.9)=5.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=17.91ms  min=1.84ms  med=15.46ms max=265.12ms p(90)=29.15ms p(95)=35.27ms p(99.9)=110.18ms
     http_reqs......................: 320666  2666.455761/s
     iteration_duration.............: avg=18.71ms  min=2.5ms   med=16.17ms max=296.16ms p(90)=30.28ms p(95)=36.55ms p(99.9)=112.13ms
     iterations.....................: 320566  2665.624224/s
     success_rate...................: 100.00% ✓ 320566      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 956937      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 383 MB  3.2 MB/s
     http_req_blocked...............: avg=2.87µs  min=902ns   med=1.98µs  max=17.6ms   p(90)=3.51µs  p(95)=4.22µs  p(99.9)=31.56µs
     http_req_connecting............: avg=264ns   min=0s      med=0s      max=3.29ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.58ms min=1.92ms  med=17.51ms max=281.95ms p(90)=26.54ms p(95)=30.19ms p(99.9)=52.38ms
       { expected_response:true }...: avg=18.58ms min=1.92ms  med=17.51ms max=281.95ms p(90)=26.54ms p(95)=30.19ms p(99.9)=52.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 319079
     http_req_receiving.............: avg=1.08ms  min=51.02µs med=143.3µs max=226.42ms p(90)=2.73ms  p(95)=3.71ms  p(99.9)=24.83ms
     http_req_sending...............: avg=46.27µs min=4.81µs  med=8.42µs  max=99.56ms  p(90)=17.08µs p(95)=88.38µs p(99.9)=5.57ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.45ms min=1.86ms  med=16.36ms max=281.42ms p(90)=25.14ms p(95)=28.73ms p(99.9)=49.6ms 
     http_reqs......................: 319079  2653.585881/s
     iteration_duration.............: avg=18.8ms  min=3.11ms  med=17.71ms max=292.49ms p(90)=26.75ms p(95)=30.43ms p(99.9)=53.05ms
     iterations.....................: 318979  2652.754242/s
     success_rate...................: 100.00% ✓ 318979      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 922497      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=2.57µs   min=862ns   med=1.88µs  max=17.18ms  p(90)=2.89µs  p(95)=3.39µs  p(99.9)=27.11µs 
     http_req_connecting............: avg=293ns    min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.3ms   min=1.98ms  med=16.6ms  max=515.47ms p(90)=31.46ms p(95)=37.99ms p(99.9)=122.67ms
       { expected_response:true }...: avg=19.3ms   min=1.98ms  med=16.6ms  max=515.47ms p(90)=31.46ms p(95)=37.99ms p(99.9)=122.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307599
     http_req_receiving.............: avg=585.08µs min=51.56µs med=89.95µs max=215.66ms p(90)=1.09ms  p(95)=1.99ms  p(99.9)=25.25ms 
     http_req_sending...............: avg=41.09µs  min=4.47µs  med=7.78µs  max=196.99ms p(90)=12.81µs p(95)=66.39µs p(99.9)=4.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.67ms  min=1.86ms  med=16.05ms max=515.33ms p(90)=30.49ms p(95)=36.89ms p(99.9)=121.28ms
     http_reqs......................: 307599  2557.856981/s
     iteration_duration.............: avg=19.5ms   min=2.89ms  med=16.79ms max=515.59ms p(90)=31.67ms p(95)=38.21ms p(99.9)=123.75ms
     iterations.....................: 307499  2557.025426/s
     success_rate...................: 100.00% ✓ 307499      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 893541      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.62µs   min=861ns   med=1.91µs  max=12.96ms  p(90)=3.19µs  p(95)=3.8µs   p(99.9)=24.54µs 
     http_req_connecting............: avg=338ns    min=0s      med=0s      max=3.85ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.93ms  min=1.68ms  med=16.08ms max=413.46ms p(90)=33.52ms p(95)=42.68ms p(99.9)=164.93ms
       { expected_response:true }...: avg=19.93ms  min=1.68ms  med=16.08ms max=413.46ms p(90)=33.52ms p(95)=42.68ms p(99.9)=164.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297947
     http_req_receiving.............: avg=568.98µs min=49.68µs med=90.5µs  max=181.43ms p(90)=1.03ms  p(95)=1.78ms  p(99.9)=30.9ms  
     http_req_sending...............: avg=36µs     min=4.41µs  med=8.31µs  max=69.4ms   p(90)=15.47µs p(95)=63.03µs p(99.9)=2.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.32ms  min=1.54ms  med=15.57ms max=412.53ms p(90)=32.56ms p(95)=41.54ms p(99.9)=163.52ms
     http_reqs......................: 297947  2478.471691/s
     iteration_duration.............: avg=20.13ms  min=2.58ms  med=16.27ms max=413.63ms p(90)=33.73ms p(95)=42.9ms  p(99.9)=166.05ms
     iterations.....................: 297847  2477.639841/s
     success_rate...................: 100.00% ✓ 297847      ✗ 0     
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

     checks.........................: 100.00% ✓ 782967      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=3.26µs  min=882ns   med=2.41µs  max=16.75ms  p(90)=3.8µs   p(95)=4.46µs  p(99.9)=36.53µs
     http_req_connecting............: avg=346ns   min=0s      med=0s      max=3.73ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=22.77ms min=1.69ms  med=22.54ms max=314.13ms p(90)=27.06ms p(95)=28.82ms p(99.9)=47.55ms
       { expected_response:true }...: avg=22.77ms min=1.69ms  med=22.54ms max=314.13ms p(90)=27.06ms p(95)=28.82ms p(99.9)=47.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261089
     http_req_receiving.............: avg=84.57µs min=27.32µs med=53.88µs max=31.35ms  p(90)=89.57µs p(95)=114.2µs p(99.9)=5.27ms 
     http_req_sending...............: avg=36.08µs min=4.76µs  med=9.82µs  max=102.65ms p(90)=15.79µs p(95)=25.28µs p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.65ms min=1.6ms   med=22.44ms max=302.29ms p(90)=26.93ms p(95)=28.65ms p(99.9)=46.5ms 
     http_reqs......................: 261089  2171.704107/s
     iteration_duration.............: avg=22.98ms min=3.96ms  med=22.73ms max=327.3ms  p(90)=27.25ms p(95)=29.03ms p(99.9)=48.11ms
     iterations.....................: 260989  2170.87232/s
     success_rate...................: 100.00% ✓ 260989      ✗ 0     
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

     checks.........................: 100.00% ✓ 462744      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.05µs  med=2.55µs  max=3.49ms   p(90)=3.98µs  p(95)=4.61µs  p(99.9)=35.56µs 
     http_req_connecting............: avg=553ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=38.66ms min=2.04ms  med=38.31ms max=292.13ms p(90)=54.01ms p(95)=58.82ms p(99.9)=81.65ms 
       { expected_response:true }...: avg=38.66ms min=2.04ms  med=38.31ms max=292.13ms p(90)=54.01ms p(95)=58.82ms p(99.9)=81.65ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 154348
     http_req_receiving.............: avg=77.18µs min=26.84µs med=60.38µs max=180.96ms p(90)=96.61µs p(95)=112.9µs p(99.9)=916.96µs
     http_req_sending...............: avg=23.08µs min=4.71µs  med=10.87µs max=79.68ms  p(90)=16.68µs p(95)=20.48µs p(99.9)=935.48µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=38.56ms min=1.91ms  med=38.22ms max=288.21ms p(90)=53.92ms p(95)=58.72ms p(99.9)=81.41ms 
     http_reqs......................: 154348  1283.181039/s
     iteration_duration.............: avg=38.89ms min=3.45ms  med=38.53ms max=304.36ms p(90)=54.22ms p(95)=59.02ms p(99.9)=82.11ms 
     iterations.....................: 154248  1282.349683/s
     success_rate...................: 100.00% ✓ 154248      ✗ 0     
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

     checks.........................: 100.00% ✓ 222651     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   741 kB/s
     http_req_blocked...............: avg=3.96µs  min=1.08µs  med=2.31µs  max=3.78ms   p(90)=3.82µs   p(95)=4.45µs   p(99.9)=45.25µs 
     http_req_connecting............: avg=1.32µs  min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.53ms min=3.59ms  med=79.11ms max=328.32ms p(90)=100.38ms p(95)=110.37ms p(99.9)=192.86ms
       { expected_response:true }...: avg=80.53ms min=3.59ms  med=79.11ms max=328.32ms p(90)=100.38ms p(95)=110.37ms p(99.9)=192.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74317
     http_req_receiving.............: avg=75.55µs min=28.35µs med=63.48µs max=95.1ms   p(90)=100.06µs p(95)=112.79µs p(99.9)=589.64µs
     http_req_sending...............: avg=20.91µs min=4.77µs  med=11.19µs max=135.81ms p(90)=18.44µs  p(95)=20.72µs  p(99.9)=559.16µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.43ms min=3.54ms  med=79.02ms max=328.07ms p(90)=100.28ms p(95)=110.24ms p(99.9)=192.43ms
     http_reqs......................: 74317   616.817954/s
     iteration_duration.............: avg=80.86ms min=18.66ms med=79.35ms max=341.21ms p(90)=100.61ms p(95)=110.64ms p(99.9)=194.02ms
     iterations.....................: 74217   615.987972/s
     success_rate...................: 100.00% ✓ 74217      ✗ 0    
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

     checks.........................: 100.00% ✓ 161169     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   536 kB/s
     http_req_blocked...............: avg=7.56µs   min=1.05µs  med=2.69µs   max=9.31ms   p(90)=4.05µs   p(95)=4.55µs   p(99.9)=85.83µs 
     http_req_connecting............: avg=4.56µs   min=0s      med=0s       max=9.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.26ms min=4.54ms  med=111.05ms max=323.26ms p(90)=134.49ms p(95)=141.21ms p(99.9)=171.92ms
       { expected_response:true }...: avg=111.26ms min=4.54ms  med=111.05ms max=323.26ms p(90)=134.49ms p(95)=141.21ms p(99.9)=171.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53823
     http_req_receiving.............: avg=84.7µs   min=27.42µs med=73.84µs  max=65.24ms  p(90)=105.8µs  p(95)=118.76µs p(99.9)=523.08µs
     http_req_sending...............: avg=20.16µs  min=4.28µs  med=14.26µs  max=103.58ms p(90)=20.03µs  p(95)=21.73µs  p(99.9)=543.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.15ms min=4.4ms   med=110.96ms max=322.49ms p(90)=134.4ms  p(95)=141.1ms  p(99.9)=171.66ms
     http_reqs......................: 53823   446.342504/s
     iteration_duration.............: avg=111.7ms  min=19.15ms med=111.32ms max=333.17ms p(90)=134.74ms p(95)=141.47ms p(99.9)=173.3ms 
     iterations.....................: 53723   445.513225/s
     success_rate...................: 100.00% ✓ 53723      ✗ 0    
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

     checks.........................: 100.00% ✓ 101919     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   338 kB/s
     http_req_blocked...............: avg=6.37µs   min=1.39µs  med=3.35µs   max=4.21ms   p(90)=4.69µs   p(95)=5.23µs   p(99.9)=1.31ms  
     http_req_connecting............: avg=2.77µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=175.89ms min=7.41ms  med=182.28ms max=398.78ms p(90)=189.65ms p(95)=193.97ms p(99.9)=260.57ms
       { expected_response:true }...: avg=175.89ms min=7.41ms  med=182.28ms max=398.78ms p(90)=189.65ms p(95)=193.97ms p(99.9)=260.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34073
     http_req_receiving.............: avg=97.01µs  min=34.85µs med=85.3µs   max=141.6ms  p(90)=115.64µs p(95)=126.39µs p(99.9)=510.22µs
     http_req_sending...............: avg=24.28µs  min=6.55µs  med=17.25µs  max=73.11ms  p(90)=21.99µs  p(95)=23.73µs  p(99.9)=575.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.77ms min=7.32ms  med=182.17ms max=389.37ms p(90)=189.54ms p(95)=193.85ms p(99.9)=260.43ms
     http_reqs......................: 34073   281.749245/s
     iteration_duration.............: avg=176.69ms min=22.63ms med=182.59ms max=405.53ms p(90)=189.94ms p(95)=194.26ms p(99.9)=261.59ms
     iterations.....................: 33973   280.922346/s
     success_rate...................: 100.00% ✓ 33973      ✗ 0    
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

     checks.........................: 100.00% ✓ 99135      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=5.98µs   min=1.1µs   med=2.98µs   max=3.95ms   p(90)=4.23µs   p(95)=4.79µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=2.81µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.27ms  
     http_req_duration..............: avg=180.87ms min=5.94ms  med=170ms    max=660.71ms p(90)=214.12ms p(95)=262.95ms p(99.9)=553.03ms
       { expected_response:true }...: avg=180.87ms min=5.94ms  med=170ms    max=660.71ms p(90)=214.12ms p(95)=262.95ms p(99.9)=553.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33145
     http_req_receiving.............: avg=90.35µs  min=33.55µs med=81.57µs  max=99.42ms  p(90)=111.47µs p(95)=122.89µs p(99.9)=578.75µs
     http_req_sending...............: avg=23.89µs  min=5.14µs  med=15.53µs  max=64.6ms   p(90)=19.99µs  p(95)=21.55µs  p(99.9)=434.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.75ms min=5.83ms  med=169.89ms max=660.59ms p(90)=214ms    p(95)=262.83ms p(99.9)=552.94ms
     http_reqs......................: 33145   274.302735/s
     iteration_duration.............: avg=181.66ms min=34.06ms med=170.33ms max=660.92ms p(90)=214.49ms p(95)=265.02ms p(99.9)=553.27ms
     iterations.....................: 33045   273.475151/s
     success_rate...................: 100.00% ✓ 33045      ✗ 0    
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

     checks.........................: 100.00% ✓ 919113      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=3.11µs  min=931ns   med=2.22µs  max=14.81ms  p(90)=3.73µs  p(95)=4.47µs   p(99.9)=35.35µs
     http_req_connecting............: avg=348ns   min=0s      med=0s      max=3.8ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.36ms min=1.59ms  med=19.03ms max=272.68ms p(90)=26.69ms p(95)=29.06ms  p(99.9)=48.39ms
       { expected_response:true }...: avg=19.36ms min=1.59ms  med=19.03ms max=272.68ms p(90)=26.69ms p(95)=29.06ms  p(99.9)=48.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306471
     http_req_receiving.............: avg=86.55µs min=25.64µs med=49.39µs max=145.22ms p(90)=91.69µs p(95)=131.58µs p(99.9)=5.98ms 
     http_req_sending...............: avg=41.07µs min=4.68µs  med=9.59µs  max=154.12ms p(90)=17.44µs p(95)=81.74µs  p(99.9)=2.64ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.23ms min=1.5ms   med=18.92ms max=272.48ms p(90)=26.55ms p(95)=28.87ms  p(99.9)=47.23ms
     http_reqs......................: 306471  2549.672668/s
     iteration_duration.............: avg=19.57ms min=3.11ms  med=19.23ms max=310.34ms p(90)=26.89ms p(95)=29.28ms  p(99.9)=49.12ms
     iterations.....................: 306371  2548.840722/s
     success_rate...................: 100.00% ✓ 306371      ✗ 0     
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

     checks.........................: 100.00% ✓ 881493      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=3.62µs   min=1.03µs  med=2.69µs  max=22.59ms  p(90)=4.28µs  p(95)=5.02µs  p(99.9)=38µs    
     http_req_connecting............: avg=148ns    min=0s      med=0s      max=2.7ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.18ms  min=1.68ms  med=17.04ms max=336.42ms p(90)=33.07ms p(95)=40.42ms p(99.9)=137.23ms
       { expected_response:true }...: avg=20.18ms  min=1.68ms  med=17.04ms max=336.42ms p(90)=33.07ms p(95)=40.42ms p(99.9)=137.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293931
     http_req_receiving.............: avg=570.49µs min=51.52µs med=96.25µs max=165.87ms p(90)=1.1ms   p(95)=1.94ms  p(99.9)=27.33ms 
     http_req_sending...............: avg=46.02µs  min=4.83µs  med=9.97µs  max=149.93ms p(90)=18.44µs p(95)=94.5µs  p(99.9)=3.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.57ms  min=1.56ms  med=16.51ms max=336.22ms p(90)=32.13ms p(95)=39.34ms p(99.9)=135.74ms
     http_reqs......................: 293931  2444.818618/s
     iteration_duration.............: avg=20.41ms  min=2.61ms  med=17.25ms max=336.62ms p(90)=33.3ms  p(95)=40.66ms p(99.9)=138.71ms
     iterations.....................: 293831  2443.986852/s
     success_rate...................: 100.00% ✓ 293831      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 875844      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=2.94µs  min=861ns  med=2.04µs   max=16.4ms   p(90)=3.72µs  p(95)=4.52µs  p(99.9)=32.58µs
     http_req_connecting............: avg=307ns   min=0s     med=0s       max=4ms      p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.32ms min=1.53ms med=19.18ms  max=271ms    p(90)=29.72ms p(95)=33.69ms p(99.9)=56.18ms
       { expected_response:true }...: avg=20.32ms min=1.53ms med=19.18ms  max=271ms    p(90)=29.72ms p(95)=33.69ms p(99.9)=56.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292048
     http_req_receiving.............: avg=1.26ms  min=51.5µs med=261.43µs max=88.78ms  p(90)=3.17ms  p(95)=4.35ms  p(99.9)=24.7ms 
     http_req_sending...............: avg=45.07µs min=4.33µs med=8.49µs   max=110.41ms p(90)=18.6µs  p(95)=85.29µs p(99.9)=4.97ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.01ms min=1.46ms med=17.83ms  max=270.38ms p(90)=28.12ms p(95)=32ms    p(99.9)=54.01ms
     http_reqs......................: 292048  2429.707796/s
     iteration_duration.............: avg=20.54ms min=2.57ms med=19.38ms  max=293.73ms p(90)=29.94ms p(95)=33.93ms p(99.9)=56.49ms
     iterations.....................: 291948  2428.875841/s
     success_rate...................: 100.00% ✓ 291948      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 866682      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=2.42µs   min=872ns   med=1.92µs  max=5.5ms    p(90)=3.23µs  p(95)=3.84µs  p(99.9)=30.55µs 
     http_req_connecting............: avg=124ns    min=0s      med=0s      max=1.55ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.55ms  min=1.55ms  med=17.09ms max=464.04ms p(90)=33.68ms p(95)=41.51ms p(99.9)=155.53ms
       { expected_response:true }...: avg=20.55ms  min=1.55ms  med=17.09ms max=464.04ms p(90)=33.68ms p(95)=41.51ms p(99.9)=155.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288994
     http_req_receiving.............: avg=596.24µs min=49.68µs med=94.19µs max=202.28ms p(90)=1.11ms  p(95)=1.94ms  p(99.9)=28.22ms 
     http_req_sending...............: avg=40.43µs  min=4.37µs  med=8.38µs  max=117.76ms p(90)=15.69µs p(95)=67.75µs p(99.9)=3.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.91ms  min=1.47ms  med=16.56ms max=463.28ms p(90)=32.69ms p(95)=40.32ms p(99.9)=153.47ms
     http_reqs......................: 288994  2404.171771/s
     iteration_duration.............: avg=20.76ms  min=2.65ms  med=17.29ms max=464.23ms p(90)=33.91ms p(95)=41.73ms p(99.9)=158.19ms
     iterations.....................: 288894  2403.33986/s
     success_rate...................: 100.00% ✓ 288894      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 834708      ✗ 0     
     data_received..................: 24 GB   203 MB/s
     data_sent......................: 335 MB  2.8 MB/s
     http_req_blocked...............: avg=3.01µs  min=872ns   med=2.22µs  max=7.58ms   p(90)=4.08µs  p(95)=4.84µs  p(99.9)=34.43µs 
     http_req_connecting............: avg=292ns   min=0s      med=0s      max=3.27ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.33ms min=1.91ms  med=18.13ms max=303.38ms p(90)=35.04ms p(95)=42.76ms p(99.9)=130.03ms
       { expected_response:true }...: avg=21.33ms min=1.91ms  med=18.13ms max=303.38ms p(90)=35.04ms p(95)=42.76ms p(99.9)=130.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 278336
     http_req_receiving.............: avg=595.3µs min=51.08µs med=98.54µs max=256.39ms p(90)=1.14ms  p(95)=1.98ms  p(99.9)=27.18ms 
     http_req_sending...............: avg=44.14µs min=4.36µs  med=9.29µs  max=183.73ms p(90)=19.69µs p(95)=78.51µs p(99.9)=3.25ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.69ms min=1.81ms  med=17.57ms max=263.12ms p(90)=34.01ms p(95)=41.59ms p(99.9)=127.86ms
     http_reqs......................: 278336  2314.902163/s
     iteration_duration.............: avg=21.55ms min=3.07ms  med=18.34ms max=314.4ms  p(90)=35.26ms p(95)=43.02ms p(99.9)=130.44ms
     iterations.....................: 278236  2314.07047/s
     success_rate...................: 100.00% ✓ 278236      ✗ 0     
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

     checks.........................: 100.00% ✓ 577311      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.37µs  min=922ns   med=2.29µs  max=8.87ms   p(90)=4.48µs   p(95)=5.64µs   p(99.9)=42.09µs
     http_req_connecting............: avg=434ns   min=0s      med=0s      max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.92ms min=2.2ms   med=30.42ms max=304.97ms p(90)=40.98ms  p(95)=44.47ms  p(99.9)=65.26ms
       { expected_response:true }...: avg=30.92ms min=2.2ms   med=30.42ms max=304.97ms p(90)=40.98ms  p(95)=44.47ms  p(99.9)=65.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192537
     http_req_receiving.............: avg=93.3µs  min=26.82µs med=56.21µs max=109.23ms p(90)=126.64µs p(95)=204.39µs p(99.9)=3.12ms 
     http_req_sending...............: avg=42.62µs min=4.85µs  med=9.53µs  max=130.75ms p(90)=24µs     p(95)=107.2µs  p(99.9)=3.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.79ms min=2.13ms  med=30.3ms  max=304.44ms p(90)=40.84ms  p(95)=44.31ms  p(99.9)=64.7ms 
     http_reqs......................: 192537  1600.668287/s
     iteration_duration.............: avg=31.17ms min=4.87ms  med=30.65ms max=319.8ms  p(90)=41.21ms  p(95)=44.69ms  p(99.9)=65.56ms
     iterations.....................: 192437  1599.836931/s
     success_rate...................: 100.00% ✓ 192437      ✗ 0     
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

     checks.........................: 100.00% ✓ 429156      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.9µs   min=1.12µs  med=3.03µs  max=3.23ms   p(90)=4.61µs   p(95)=5.3µs    p(99.9)=37.76µs 
     http_req_connecting............: avg=579ns   min=0s      med=0s      max=3.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.68ms min=2.22ms  med=41.25ms max=310.08ms p(90)=58.01ms  p(95)=63.17ms  p(99.9)=87.14ms 
       { expected_response:true }...: avg=41.68ms min=2.22ms  med=41.25ms max=310.08ms p(90)=58.01ms  p(95)=63.17ms  p(99.9)=87.14ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143152
     http_req_receiving.............: avg=83.03µs min=27.41µs med=68.02µs max=100.06ms p(90)=109.14µs p(95)=126.84µs p(99.9)=830.81µs
     http_req_sending...............: avg=25.6µs  min=5.2µs   med=12.71µs max=123.78ms p(90)=19.58µs  p(95)=23.4µs   p(99.9)=975.41µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.57ms min=2.06ms  med=41.15ms max=286.99ms p(90)=57.9ms   p(95)=63.05ms  p(99.9)=86.98ms 
     http_reqs......................: 143152  1190.124681/s
     iteration_duration.............: avg=41.93ms min=4.06ms  med=41.48ms max=338.13ms p(90)=58.23ms  p(95)=63.4ms   p(99.9)=87.53ms 
     iterations.....................: 143052  1189.29331/s
     success_rate...................: 100.00% ✓ 143052      ✗ 0     
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

     checks.........................: 100.00% ✓ 214764     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   714 kB/s
     http_req_blocked...............: avg=4.28µs  min=1.04µs  med=2.78µs  max=3.97ms   p(90)=4.33µs   p(95)=4.96µs   p(99.9)=44.32µs 
     http_req_connecting............: avg=1.25µs  min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.46ms min=3.96ms  med=81.38ms max=331.04ms p(90)=101.27ms p(95)=110.71ms p(99.9)=195.81ms
       { expected_response:true }...: avg=83.46ms min=3.96ms  med=81.38ms max=331.04ms p(90)=101.27ms p(95)=110.71ms p(99.9)=195.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71688
     http_req_receiving.............: avg=88.22µs min=27.46µs med=72.43µs max=146.96ms p(90)=108.94µs p(95)=122.26µs p(99.9)=629.94µs
     http_req_sending...............: avg=27.98µs min=4.84µs  med=13.82µs max=181.59ms p(90)=20.43µs  p(95)=22.56µs  p(99.9)=604.17µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.34ms min=3.89ms  med=81.28ms max=310.39ms p(90)=101.15ms p(95)=110.57ms p(99.9)=195.23ms
     http_reqs......................: 71688   594.849063/s
     iteration_duration.............: avg=83.81ms min=22.23ms med=81.61ms max=342.66ms p(90)=101.53ms p(95)=111.04ms p(99.9)=196.69ms
     iterations.....................: 71588   594.019288/s
     success_rate...................: 100.00% ✓ 71588      ✗ 0    
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

     checks.........................: 100.00% ✓ 149553     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   497 kB/s
     http_req_blocked...............: avg=5.31µs   min=1.11µs  med=3.58µs   max=3.24ms   p(90)=5.07µs   p(95)=5.69µs   p(99.9)=149.8µs 
     http_req_connecting............: avg=1.46µs   min=0s      med=0s       max=3.21ms   p(90)=0s       p(95)=0s       p(99.9)=67.77µs 
     http_req_duration..............: avg=119.89ms min=5.43ms  med=117.58ms max=326.23ms p(90)=158.54ms p(95)=170.76ms p(99.9)=220.65ms
       { expected_response:true }...: avg=119.89ms min=5.43ms  med=117.58ms max=326.23ms p(90)=158.54ms p(95)=170.76ms p(99.9)=220.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49951
     http_req_receiving.............: avg=87.62µs  min=32.3µs  med=82.22µs  max=56.91ms  p(90)=113.77µs p(95)=126.25µs p(99.9)=602.98µs
     http_req_sending...............: avg=22µs     min=5.65µs  med=17.34µs  max=31.82ms  p(90)=22.72µs  p(95)=24.66µs  p(99.9)=572.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.78ms min=5.29ms  med=117.48ms max=325.7ms  p(90)=158.45ms p(95)=170.64ms p(99.9)=220.54ms
     http_reqs......................: 49951   413.899687/s
     iteration_duration.............: avg=120.4ms  min=29.31ms med=117.92ms max=336.63ms p(90)=158.86ms p(95)=171.11ms p(99.9)=221.63ms
     iterations.....................: 49851   413.071076/s
     success_rate...................: 100.00% ✓ 49851      ✗ 0    
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

     checks.........................: 100.00% ✓ 96858      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.47µs   min=1.11µs  med=3.21µs   max=4.36ms   p(90)=4.61µs   p(95)=5.22µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=2.99µs   min=0s      med=0s       max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=185.09ms min=7.86ms  med=191.46ms max=405.15ms p(90)=199ms    p(95)=203.32ms p(99.9)=277.19ms
       { expected_response:true }...: avg=185.09ms min=7.86ms  med=191.46ms max=405.15ms p(90)=199ms    p(95)=203.32ms p(99.9)=277.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32386
     http_req_receiving.............: avg=97.03µs  min=32.3µs  med=87.48µs  max=158.5ms  p(90)=118.23µs p(95)=130.08µs p(99.9)=533.76µs
     http_req_sending...............: avg=29.85µs  min=5.4µs   med=17.47µs  max=89.45ms  p(90)=22.22µs  p(95)=24.19µs  p(99.9)=612.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.97ms min=7.72ms  med=191.35ms max=378.98ms p(90)=198.88ms p(95)=203.21ms p(99.9)=276.91ms
     http_reqs......................: 32386   267.656992/s
     iteration_duration.............: avg=185.94ms min=50.71ms med=191.77ms max=413.7ms  p(90)=199.28ms p(95)=203.6ms  p(99.9)=280.11ms
     iterations.....................: 32286   266.830533/s
     success_rate...................: 100.00% ✓ 32286      ✗ 0    
     vus............................: 7       min=7        max=50 
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

     checks.........................: 100.00% ✓ 93570      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=5.98µs   min=1.09µs  med=3µs      max=3.57ms   p(90)=4.29µs   p(95)=4.81µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.79µs   min=0s      med=0s       max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=191.59ms min=6.29ms  med=175.86ms max=639.51ms p(90)=222.06ms p(95)=273.69ms p(99.9)=563.98ms
       { expected_response:true }...: avg=191.59ms min=6.29ms  med=175.86ms max=639.51ms p(90)=222.06ms p(95)=273.69ms p(99.9)=563.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31290
     http_req_receiving.............: avg=101.89µs min=33µs    med=88.7µs   max=197.35ms p(90)=119.31µs p(95)=130.78µs p(99.9)=504.67µs
     http_req_sending...............: avg=27.62µs  min=4.85µs  med=16.88µs  max=93.58ms  p(90)=20.96µs  p(95)=22.59µs  p(99.9)=519.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.46ms min=6.16ms  med=175.76ms max=639.39ms p(90)=221.93ms p(95)=272.62ms p(99.9)=563.87ms
     http_reqs......................: 31290   258.870343/s
     iteration_duration.............: avg=192.48ms min=22.15ms med=176.21ms max=639.78ms p(90)=222.49ms p(95)=276.15ms p(99.9)=564.48ms
     iterations.....................: 31190   258.043017/s
     success_rate...................: 100.00% ✓ 31190      ✗ 0    
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

     checks.........................: 100.00% ✓ 7932      ✗ 0   
     data_received..................: 263 MB  2.1 MB/s
     data_sent......................: 3.3 MB  26 kB/s
     http_req_blocked...............: avg=43.11µs  min=1.46µs   med=3.84µs  max=3.71ms  p(90)=5.47µs   p(95)=6.15µs   p(99.9)=3.67ms
     http_req_connecting............: avg=38.15µs  min=0s       med=0s      max=3.68ms  p(90)=0s       p(95)=0s       p(99.9)=3.63ms
     http_req_duration..............: avg=2.21s    min=26.44ms  med=2.25s   max=4.59s   p(90)=3.03s    p(95)=3.24s    p(99.9)=4.31s 
       { expected_response:true }...: avg=2.21s    min=26.44ms  med=2.25s   max=4.59s   p(90)=3.03s    p(95)=3.24s    p(99.9)=4.31s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2744
     http_req_receiving.............: avg=113.11µs min=35.17µs  med=95.31µs max=17.01ms p(90)=138.06µs p(95)=157.67µs p(99.9)=1.47ms
     http_req_sending...............: avg=86.89µs  min=6.58µs   med=19.61µs max=20.07ms p(90)=24.95µs  p(95)=28.88µs  p(99.9)=4.37ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.21s    min=26.28ms  med=2.25s   max=4.59s   p(90)=3.03s    p(95)=3.24s    p(99.9)=4.31s 
     http_reqs......................: 2744    21.839645/s
     iteration_duration.............: avg=2.29s    min=365.81ms med=2.27s   max=4.59s   p(90)=3.06s    p(95)=3.25s    p(99.9)=4.32s 
     iterations.....................: 2644    21.04374/s
     success_rate...................: 100.00% ✓ 2644      ✗ 0   
     vus............................: 45      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

