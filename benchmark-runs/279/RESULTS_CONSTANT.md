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
| hive-router | v0.0.78 | 2,883 | 3,104 | 2,842 | 3.1% |  |
| fusion-nightly-net11 | 16.5.0-p.12 | 2,534 | 2,633 | 2,505 | 1.7% |  |
| fusion-nightly | 16.5.0-p.12 | 2,457 | 2,552 | 2,436 | 1.5% |  |
| fusion | 16.4.0 | 2,345 | 2,437 | 2,329 | 1.5% |  |
| grafbase | 0.53.5 | 2,205 | 2,310 | 2,185 | 1.8% |  |
| cosmo | 0.329.0 | 1,267 | 1,312 | 1,262 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 616 | 633 | 613 | 1.1% |  |
| apollo-router | v2.16.0 | 491 | 509 | 489 | 1.3% |  |
| apollo-gateway | 2.14.2 | 282 | 286 | 282 | 0.5% |  |
| hive-gateway | 2.10.2 | 278 | 284 | 276 | 0.8% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% |  |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,429 | 2,636 | 2,414 | 3.2% |  |
| fusion-nightly | 16.5.0-p.12 | 2,328 | 2,440 | 2,316 | 1.8% |  |
| fusion-nightly-net11 | 16.5.0-p.12 | 2,307 | 2,412 | 2,295 | 1.8% |  |
| fusion | 16.4.0 | 2,270 | 2,348 | 2,216 | 1.7% |  |
| fusion-nightly-fed | 16.5.0-p.12 | 2,182 | 2,227 | 2,146 | 1.4% |  |
| grafbase | 0.53.5 | 1,695 | 1,739 | 1,690 | 1.0% |  |
| cosmo | 0.329.0 | 1,184 | 1,229 | 1,182 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 575 | 596 | 571 | 1.6% |  |
| apollo-router | v2.16.0 | 414 | 433 | 410 | 1.8% |  |
| apollo-gateway | 2.14.2 | 269 | 273 | 265 | 0.8% |  |
| hive-gateway | 2.10.2 | 269 | 276 | 268 | 1.0% |  |
| feddi | 5ff8b6165878 | 23 | 23 | 22 | 2.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1039122     ✗ 0     
     data_received..................: 30 GB   253 MB/s
     data_sent......................: 416 MB  3.5 MB/s
     http_req_blocked...............: avg=2.72µs  min=871ns   med=1.84µs  max=18.47ms  p(90)=3.02µs  p(95)=3.58µs  p(99.9)=29.66µs
     http_req_connecting............: avg=263ns   min=0s      med=0s      max=3.53ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.11ms min=1.4ms   med=16.47ms max=286.69ms p(90)=25.24ms p(95)=28.34ms p(99.9)=47.38ms
       { expected_response:true }...: avg=17.11ms min=1.4ms   med=16.47ms max=286.69ms p(90)=25.24ms p(95)=28.34ms p(99.9)=47.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 346474
     http_req_receiving.............: avg=81.51µs min=26.46µs med=45.47µs max=156.1ms  p(90)=79.85µs p(95)=126.7µs p(99.9)=6.38ms 
     http_req_sending...............: avg=45.85µs min=4.4µs   med=8.12µs  max=127.95ms p(90)=13.84µs p(95)=79.5µs  p(99.9)=7.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=16.98ms min=1.35ms  med=16.36ms max=286.26ms p(90)=25.07ms p(95)=28.12ms p(99.9)=46.42ms
     http_reqs......................: 346474  2883.10926/s
     iteration_duration.............: avg=17.31ms min=1.85ms  med=16.66ms max=314.37ms p(90)=25.44ms p(95)=28.56ms p(99.9)=48.08ms
     iterations.....................: 346374  2882.277131/s
     success_rate...................: 100.00% ✓ 346374      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 914013      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 366 MB  3.0 MB/s
     http_req_blocked...............: avg=3.13µs   min=861ns   med=1.89µs   max=16.17ms  p(90)=3.17µs  p(95)=3.79µs  p(99.9)=29.13µs
     http_req_connecting............: avg=753ns    min=0s      med=0s       max=8.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.47ms  min=1.99ms  med=18.61ms  max=279.62ms p(90)=28.07ms p(95)=31.61ms p(99.9)=52.01ms
       { expected_response:true }...: avg=19.47ms  min=1.99ms  med=18.61ms  max=279.62ms p(90)=28.07ms p(95)=31.61ms p(99.9)=52.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 304771
     http_req_receiving.............: avg=720.51µs min=51.09µs med=118.89µs max=158ms    p(90)=1.76ms  p(95)=2.63ms  p(99.9)=18.4ms 
     http_req_sending...............: avg=41.89µs  min=4.1µs   med=8.1µs    max=183.87ms p(90)=15.96µs p(95)=75.84µs p(99.9)=3.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.71ms  min=1.9ms   med=17.84ms  max=275.19ms p(90)=27.17ms p(95)=30.64ms p(99.9)=50.37ms
     http_reqs......................: 304771  2534.42886/s
     iteration_duration.............: avg=19.68ms  min=3.46ms  med=18.81ms  max=311.5ms  p(90)=28.28ms p(95)=31.83ms p(99.9)=52.49ms
     iterations.....................: 304671  2533.597275/s
     success_rate...................: 100.00% ✓ 304671      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 886302      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=3.11µs   min=972ns   med=2.38µs  max=11.51ms  p(90)=3.64µs  p(95)=4.22µs  p(99.9)=35.3µs  
     http_req_connecting............: avg=298ns    min=0s      med=0s      max=3.57ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.09ms  min=2.14ms  med=17.17ms max=320.84ms p(90)=32.72ms p(95)=39.68ms p(99.9)=132.7ms 
       { expected_response:true }...: avg=20.09ms  min=2.14ms  med=17.17ms max=320.84ms p(90)=32.72ms p(95)=39.68ms p(99.9)=132.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 295534
     http_req_receiving.............: avg=700.36µs min=52.39µs med=96.57µs max=208.77ms p(90)=1.16ms  p(95)=2.28ms  p(99.9)=33.27ms 
     http_req_sending...............: avg=42.16µs  min=4.96µs  med=9.14µs  max=185.2ms  p(90)=15.23µs p(95)=85.42µs p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.35ms  min=2ms     med=16.56ms max=305.91ms p(90)=31.51ms p(95)=38.31ms p(99.9)=127.61ms
     http_reqs......................: 295534  2457.103716/s
     iteration_duration.............: avg=20.3ms   min=2.76ms  med=17.37ms max=354.93ms p(90)=32.93ms p(95)=39.91ms p(99.9)=133.7ms 
     iterations.....................: 295434  2456.272305/s
     success_rate...................: 100.00% ✓ 295434      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 845787      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 339 MB  2.8 MB/s
     http_req_blocked...............: avg=2.53µs   min=932ns   med=1.85µs  max=12.47ms  p(90)=2.88µs  p(95)=3.38µs  p(99.9)=25.12µs 
     http_req_connecting............: avg=336ns    min=0s      med=0s      max=3.87ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.07ms  min=2.22ms  med=17.86ms max=316.58ms p(90)=34.32ms p(95)=42.02ms p(99.9)=144.95ms
       { expected_response:true }...: avg=21.07ms  min=2.22ms  med=17.86ms max=316.58ms p(90)=34.32ms p(95)=42.02ms p(99.9)=144.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282029
     http_req_receiving.............: avg=612.31µs min=50.26µs med=91.36µs max=202.75ms p(90)=1.09ms  p(95)=1.93ms  p(99.9)=28.32ms 
     http_req_sending...............: avg=37.99µs  min=4.61µs  med=7.92µs  max=207.54ms p(90)=12.84µs p(95)=44.29µs p(99.9)=2.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.42ms  min=2.05ms  med=17.31ms max=316.49ms p(90)=33.26ms p(95)=40.73ms p(99.9)=143.43ms
     http_reqs......................: 282029  2345.004955/s
     iteration_duration.............: avg=21.27ms  min=3.19ms  med=18.05ms max=316.71ms p(90)=34.52ms p(95)=42.23ms p(99.9)=146.86ms
     iterations.....................: 281929  2344.173479/s
     success_rate...................: 100.00% ✓ 281929      ✗ 0     
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

     checks.........................: 100.00% ✓ 794991      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 319 MB  2.6 MB/s
     http_req_blocked...............: avg=3.38µs  min=942ns  med=2.57µs  max=11.58ms  p(90)=4.25µs  p(95)=5.05µs   p(99.9)=39.32µs
     http_req_connecting............: avg=340ns   min=0s     med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.41ms min=1.69ms med=22.16ms max=290.97ms p(90)=26.7ms  p(95)=28.59ms  p(99.9)=48.41ms
       { expected_response:true }...: avg=22.41ms min=1.69ms med=22.16ms max=290.97ms p(90)=26.7ms  p(95)=28.59ms  p(99.9)=48.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 265097
     http_req_receiving.............: avg=90.51µs min=26.3µs med=54.76µs max=40.62ms  p(90)=94.81µs p(95)=125.17µs p(99.9)=6.3ms  
     http_req_sending...............: avg=38.2µs  min=4.72µs med=10.41µs max=153.87ms p(90)=17.86µs p(95)=32.63µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.28ms min=1.64ms med=22.06ms max=290.57ms p(90)=26.56ms p(95)=28.4ms   p(99.9)=47.3ms 
     http_reqs......................: 265097  2205.041751/s
     iteration_duration.............: avg=22.63ms min=3.57ms med=22.36ms max=314.48ms p(90)=26.91ms p(95)=28.8ms   p(99.9)=48.89ms
     iterations.....................: 264997  2204.209964/s
     success_rate...................: 100.00% ✓ 264997      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 457098      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=2.87µs  min=951ns   med=1.95µs  max=3.75ms   p(90)=3.24µs  p(95)=3.84µs   p(99.9)=25.12µs 
     http_req_connecting............: avg=621ns   min=0s      med=0s      max=3.69ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.15ms min=1.98ms  med=38.77ms max=318.93ms p(90)=54.71ms p(95)=59.54ms  p(99.9)=81.8ms  
       { expected_response:true }...: avg=39.15ms min=1.98ms  med=38.77ms max=318.93ms p(90)=54.71ms p(95)=59.54ms  p(99.9)=81.8ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 152466
     http_req_receiving.............: avg=69.95µs min=27.49µs med=57.05µs max=119.55ms p(90)=90.42µs p(95)=104.79µs p(99.9)=865.04µs
     http_req_sending...............: avg=21.64µs min=4.77µs  med=9.5µs   max=265.27ms p(90)=15.33µs p(95)=19.1µs   p(99.9)=761.58µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.06ms min=1.89ms  med=38.68ms max=318.5ms  p(90)=54.61ms p(95)=59.45ms  p(99.9)=81.67ms 
     http_reqs......................: 152466  1267.731084/s
     iteration_duration.............: avg=39.37ms min=3.68ms  med=38.97ms max=326.72ms p(90)=54.9ms  p(95)=59.74ms  p(99.9)=82.18ms 
     iterations.....................: 152366  1266.8996/s
     success_rate...................: 100.00% ✓ 152366      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 222420     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   740 kB/s
     http_req_blocked...............: avg=6.59µs  min=1.16µs  med=3.01µs  max=156.95ms p(90)=4.48µs   p(95)=5.1µs    p(99.9)=43.94µs 
     http_req_connecting............: avg=1.22µs  min=0s      med=0s      max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.59ms min=3.59ms  med=78.47ms max=330.32ms p(90)=100.66ms p(95)=111.48ms p(99.9)=192.55ms
       { expected_response:true }...: avg=80.59ms min=3.59ms  med=78.47ms max=330.32ms p(90)=100.66ms p(95)=111.48ms p(99.9)=192.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74240
     http_req_receiving.............: avg=78.03µs min=29.29µs med=67.57µs max=165.96ms p(90)=102.61µs p(95)=115.59µs p(99.9)=615.63µs
     http_req_sending...............: avg=21.77µs min=5.32µs  med=13.23µs max=113.49ms p(90)=19.81µs  p(95)=22.11µs  p(99.9)=585.77µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.49ms min=3.54ms  med=78.38ms max=329.76ms p(90)=100.57ms p(95)=111.38ms p(99.9)=191.81ms
     http_reqs......................: 74240   616.236722/s
     iteration_duration.............: avg=80.93ms min=10.18ms med=78.73ms max=338.68ms p(90)=100.93ms p(95)=111.74ms p(99.9)=193.69ms
     iterations.....................: 74140   615.406662/s
     success_rate...................: 100.00% ✓ 74140      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 177423     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   590 kB/s
     http_req_blocked...............: avg=5.04µs   min=1.29µs  med=3.49µs   max=3.27ms   p(90)=4.95µs   p(95)=5.54µs   p(99.9)=50.51µs 
     http_req_connecting............: avg=1.31µs   min=0s      med=0s       max=3.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.01ms min=4.63ms  med=100.76ms max=305.86ms p(90)=121.97ms p(95)=128.21ms p(99.9)=156.36ms
       { expected_response:true }...: avg=101.01ms min=4.63ms  med=100.76ms max=305.86ms p(90)=121.97ms p(95)=128.21ms p(99.9)=156.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59241
     http_req_receiving.............: avg=89.35µs  min=32.86µs med=80.89µs  max=67.11ms  p(90)=114.65µs p(95)=128.92µs p(99.9)=547.28µs
     http_req_sending...............: avg=25.83µs  min=6µs     med=16.58µs  max=136.46ms p(90)=22.23µs  p(95)=24.23µs  p(99.9)=674.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.9ms  min=4.53ms  med=100.66ms max=305.06ms p(90)=121.86ms p(95)=128.1ms  p(99.9)=156.15ms
     http_reqs......................: 59241   491.351424/s
     iteration_duration.............: avg=101.46ms min=29.89ms med=101.04ms max=331.56ms p(90)=122.25ms p(95)=128.5ms  p(99.9)=158.65ms
     iterations.....................: 59141   490.522013/s
     success_rate...................: 100.00% ✓ 59141      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 102357     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=6.66µs   min=1.2µs   med=3.41µs   max=3.74ms   p(90)=4.69µs   p(95)=5.24µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=2.96µs   min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=175.17ms min=7.39ms  med=172.8ms  max=352.61ms p(90)=201.47ms p(95)=207.52ms p(99.9)=271.97ms
       { expected_response:true }...: avg=175.17ms min=7.39ms  med=172.8ms  max=352.61ms p(90)=201.47ms p(95)=207.52ms p(99.9)=271.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34219
     http_req_receiving.............: avg=91.25µs  min=34.89µs med=82.92µs  max=78.88ms  p(90)=113.54µs p(95)=124.55µs p(99.9)=588.14µs
     http_req_sending...............: avg=28.05µs  min=5.75µs  med=16.51µs  max=66.15ms  p(90)=21.14µs  p(95)=22.96µs  p(99.9)=535.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.05ms min=7.3ms   med=172.69ms max=352.15ms p(90)=201.35ms p(95)=207.41ms p(99.9)=271.01ms
     http_reqs......................: 34219   282.990397/s
     iteration_duration.............: avg=175.94ms min=33.58ms med=173.25ms max=382.57ms p(90)=201.74ms p(95)=207.83ms p(99.9)=273.74ms
     iterations.....................: 34119   282.163399/s
     success_rate...................: 100.00% ✓ 34119      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100677     ✗ 0    
     data_received..................: 3.0 GB  24 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=6.7µs    min=1.48µs  med=3.56µs   max=3.55ms   p(90)=5µs      p(95)=5.61µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=2.86µs   min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=178.07ms min=5.81ms  med=162.98ms max=680ms    p(90)=207.19ms p(95)=237.48ms p(99.9)=575.8ms 
       { expected_response:true }...: avg=178.07ms min=5.81ms  med=162.98ms max=680ms    p(90)=207.19ms p(95)=237.48ms p(99.9)=575.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33659
     http_req_receiving.............: avg=97.28µs  min=36.76µs med=88.22µs  max=79.17ms  p(90)=119.31µs p(95)=131.48µs p(99.9)=721.56µs
     http_req_sending...............: avg=23.75µs  min=6.57µs  med=18.14µs  max=32.58ms  p(90)=23.18µs  p(95)=25.1µs   p(99.9)=487.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.95ms min=5.69ms  med=162.87ms max=679.86ms p(90)=207.06ms p(95)=237.34ms p(99.9)=575.71ms
     http_reqs......................: 33659   278.35043/s
     iteration_duration.............: avg=178.87ms min=36.08ms med=163.35ms max=680.31ms p(90)=207.57ms p(95)=238.55ms p(99.9)=576.07ms
     iterations.....................: 33559   277.523458/s
     success_rate...................: 100.00% ✓ 33559      ✗ 0    
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
data_received..................: 1.2 MB 21 kB/s
     data_sent......................: 17 kB  280 B/s
     http_req_blocked...............: avg=18.41µs  min=2.8µs    med=3.51µs   max=197.13µs p(90)=4.72µs  p(95)=81.76µs p(99.9)=194.82µs
     http_req_connecting............: avg=8.43µs   min=0s       med=0s       max=109.7µs  p(90)=0s      p(95)=43.88µs p(99.9)=108.38µs
     http_req_duration..............: avg=2.35s    min=38.98ms  med=49.19ms  max=30.04s   p(90)=69.08ms p(95)=12.06s  p(99.9)=29.68s  
       { expected_response:true }...: avg=2.35s    min=38.98ms  med=49.19ms  max=30.04s   p(90)=69.08ms p(95)=12.06s  p(99.9)=29.68s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 13  
     http_req_receiving.............: avg=182.05µs min=117.34µs med=158.54µs max=358.33µs p(90)=315.2µs p(95)=348.8µs p(99.9)=358.14µs
     http_req_sending...............: avg=24.38µs  min=17.87µs  med=18.72µs  max=76.97µs  p(90)=30.73µs p(95)=50.66µs p(99.9)=76.44µs 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.35s    min=38.64ms  med=48.98ms  max=30.04s   p(90)=68.94ms p(95)=12.06s  p(99.9)=29.68s  
     http_reqs......................: 13     0.216665/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 875967      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=2.8µs   min=911ns   med=2.06µs  max=10.75ms  p(90)=3.52µs  p(95)=4.25µs  p(99.9)=31.13µs
     http_req_connecting............: avg=291ns   min=0s      med=0s      max=3.41ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.33ms min=1.68ms  med=20.14ms max=274.71ms p(90)=28.23ms p(95)=30.55ms p(99.9)=48.9ms 
       { expected_response:true }...: avg=20.33ms min=1.68ms  med=20.14ms max=274.71ms p(90)=28.23ms p(95)=30.55ms p(99.9)=48.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 292089
     http_req_receiving.............: avg=84.03µs min=26.08µs med=50.35µs max=128.63ms p(90)=88.28µs p(95)=116.2µs p(99.9)=5.4ms  
     http_req_sending...............: avg=38.06µs min=4.5µs   med=8.95µs  max=197.01ms p(90)=16.1µs  p(95)=27.78µs p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=20.21ms min=1.63ms  med=20.04ms max=265.35ms p(90)=28.11ms p(95)=30.39ms p(99.9)=47.45ms
     http_reqs......................: 292089  2429.506575/s
     iteration_duration.............: avg=20.53ms min=2.67ms  med=20.34ms max=289.02ms p(90)=28.43ms p(95)=30.76ms p(99.9)=49.39ms
     iterations.....................: 291989  2428.674805/s
     success_rate...................: 100.00% ✓ 291989      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 839319      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 336 MB  2.8 MB/s
     http_req_blocked...............: avg=3.52µs   min=1.08µs  med=2.63µs  max=14.54ms  p(90)=4.17µs  p(95)=4.87µs  p(99.9)=38.44µs 
     http_req_connecting............: avg=321ns    min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.21ms  min=1.59ms  med=17.57ms max=377.39ms p(90)=34.94ms p(95)=43.15ms p(99.9)=159.93ms
       { expected_response:true }...: avg=21.21ms  min=1.59ms  med=17.57ms max=377.39ms p(90)=34.94ms p(95)=43.15ms p(99.9)=159.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 279873
     http_req_receiving.............: avg=712.62µs min=52.49µs med=99.85µs max=186.25ms p(90)=1.21ms  p(95)=2.28ms  p(99.9)=33.36ms 
     http_req_sending...............: avg=40.52µs  min=4.85µs  med=9.77µs  max=104.81ms p(90)=17.61µs p(95)=83.51µs p(99.9)=2.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.45ms  min=1.51ms  med=16.95ms max=377.25ms p(90)=33.67ms p(95)=41.59ms p(99.9)=157.92ms
     http_reqs......................: 279873  2328.219299/s
     iteration_duration.............: avg=21.43ms  min=2.66ms  med=17.77ms max=377.6ms  p(90)=35.17ms p(95)=43.4ms  p(99.9)=161.99ms
     iterations.....................: 279773  2327.387415/s
     success_rate...................: 100.00% ✓ 279773      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 832002      ✗ 0     
     data_received..................: 24 GB   202 MB/s
     data_sent......................: 333 MB  2.8 MB/s
     http_req_blocked...............: avg=3.95µs   min=1.05µs med=2.64µs   max=14.8ms   p(90)=4.14µs  p(95)=4.82µs  p(99.9)=36.79µs
     http_req_connecting............: avg=828ns    min=0s     med=0s       max=8.13ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=21.39ms  min=1.55ms med=20.48ms  max=296.64ms p(90)=31.12ms p(95)=35.02ms p(99.9)=57.45ms
       { expected_response:true }...: avg=21.39ms  min=1.55ms med=20.48ms  max=296.64ms p(90)=31.12ms p(95)=35.02ms p(99.9)=57.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 277434
     http_req_receiving.............: avg=855.94µs min=52.3µs med=133.41µs max=189.76ms p(90)=2.12ms  p(95)=3.22ms  p(99.9)=22.17ms
     http_req_sending...............: avg=53.5µs   min=5.02µs med=10.04µs  max=194.31ms p(90)=18.59µs p(95)=86.96µs p(99.9)=4.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=20.49ms  min=1.42ms med=19.58ms  max=207.89ms p(90)=30.06ms p(95)=33.91ms p(99.9)=55.3ms 
     http_reqs......................: 277434  2307.997006/s
     iteration_duration.............: avg=21.62ms  min=2.8ms  med=20.7ms   max=314.26ms p(90)=31.34ms p(95)=35.26ms p(99.9)=57.82ms
     iterations.....................: 277334  2307.165098/s
     success_rate...................: 100.00% ✓ 277334      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 818508      ✗ 0     
     data_received..................: 24 GB   199 MB/s
     data_sent......................: 328 MB  2.7 MB/s
     http_req_blocked...............: avg=2.67µs  min=871ns   med=2.01µs  max=15.86ms  p(90)=3.48µs  p(95)=4.21µs  p(99.9)=29.39µs 
     http_req_connecting............: avg=206ns   min=0s      med=0s      max=2.75ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.76ms min=1.65ms  med=17.83ms max=345.18ms p(90)=35.96ms p(95)=44.67ms p(99.9)=176.02ms
       { expected_response:true }...: avg=21.76ms min=1.65ms  med=17.83ms max=345.18ms p(90)=35.96ms p(95)=44.67ms p(99.9)=176.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 272936
     http_req_receiving.............: avg=637.8µs min=51.19µs med=98.16µs max=196.71ms p(90)=1.14ms  p(95)=1.95ms  p(99.9)=30.84ms 
     http_req_sending...............: avg=36.2µs  min=4.35µs  med=8.54µs  max=108.91ms p(90)=16.02µs p(95)=32.63µs p(99.9)=2.29ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.09ms min=1.56ms  med=17.27ms max=345.09ms p(90)=34.81ms p(95)=43.36ms p(99.9)=173.25ms
     http_reqs......................: 272936  2270.425582/s
     iteration_duration.............: avg=21.98ms min=2.62ms  med=18.03ms max=345.4ms  p(90)=36.17ms p(95)=44.89ms p(99.9)=177.86ms
     iterations.....................: 272836  2269.593729/s
     success_rate...................: 100.00% ✓ 272836      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 787206      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=2.89µs   min=861ns   med=2.16µs  max=13.28ms  p(90)=3.74µs  p(95)=4.46µs  p(99.9)=34.39µs 
     http_req_connecting............: avg=269ns    min=0s      med=0s      max=3.76ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.63ms  min=2.01ms  med=19.04ms max=383.49ms p(90)=36.55ms p(95)=44.98ms p(99.9)=160.76ms
       { expected_response:true }...: avg=22.63ms  min=2.01ms  med=19.04ms max=383.49ms p(90)=36.55ms p(95)=44.98ms p(99.9)=160.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262502
     http_req_receiving.............: avg=642.24µs min=50.49µs med=101.1µs max=163.3ms  p(90)=1.16ms  p(95)=2.03ms  p(99.9)=29.73ms 
     http_req_sending...............: avg=38.18µs  min=4.6µs   med=9.21µs  max=118.44ms p(90)=18.06µs p(95)=50.83µs p(99.9)=2.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.95ms  min=1.9ms   med=18.46ms max=383.41ms p(90)=35.46ms p(95)=43.74ms p(99.9)=159.62ms
     http_reqs......................: 262502  2182.864351/s
     iteration_duration.............: avg=22.85ms  min=3.35ms  med=19.25ms max=383.69ms p(90)=36.79ms p(95)=45.2ms  p(99.9)=161.68ms
     iterations.....................: 262402  2182.03279/s
     success_rate...................: 100.00% ✓ 262402      ✗ 0     
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

     checks.........................: 100.00% ✓ 611721      ✗ 0     
     data_received..................: 18 GB   149 MB/s
     data_sent......................: 245 MB  2.0 MB/s
     http_req_blocked...............: avg=3.33µs  min=901ns   med=2.25µs  max=3.97ms   p(90)=4.53µs   p(95)=5.6µs    p(99.9)=44.17µs
     http_req_connecting............: avg=442ns   min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.17ms min=2.24ms  med=28.67ms max=301.32ms p(90)=38.49ms  p(95)=41.9ms   p(99.9)=63.46ms
       { expected_response:true }...: avg=29.17ms min=2.24ms  med=28.67ms max=301.32ms p(90)=38.49ms  p(95)=41.9ms   p(99.9)=63.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 204007
     http_req_receiving.............: avg=97.63µs min=26.76µs med=54.39µs max=109.93ms p(90)=125.22µs p(95)=203.8µs  p(99.9)=4.86ms 
     http_req_sending...............: avg=41.71µs min=4.66µs  med=9.5µs   max=155.54ms p(90)=24.51µs  p(95)=110.33µs p(99.9)=3.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.03ms min=2.15ms  med=28.55ms max=301.04ms p(90)=38.33ms  p(95)=41.71ms  p(99.9)=62.7ms 
     http_reqs......................: 204007  1695.79323/s
     iteration_duration.............: avg=29.41ms min=5.44ms  med=28.89ms max=311.99ms p(90)=38.71ms  p(95)=42.11ms  p(99.9)=63.98ms
     iterations.....................: 203907  1694.961988/s
     success_rate...................: 100.00% ✓ 203907      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427182      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=2.92µs  min=992ns   med=2.3µs   max=1.68ms   p(90)=3.91µs   p(95)=4.6µs    p(99.9)=38.82µs 
     http_req_connecting............: avg=258ns   min=0s      med=0s      max=1.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.89ms min=2.04ms  med=41.5ms  max=286.48ms p(90)=58.33ms  p(95)=63.31ms  p(99.9)=88.4ms  
       { expected_response:true }...: avg=41.89ms min=2.04ms  med=41.5ms  max=286.48ms p(90)=58.33ms  p(95)=63.31ms  p(99.9)=88.4ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 142494
     http_req_receiving.............: avg=75.53µs min=26.24µs med=62.45µs max=72.53ms  p(90)=101.24µs p(95)=118.05µs p(99.9)=846.67µs
     http_req_sending...............: avg=23.19µs min=4.74µs  med=10.89µs max=147.95ms p(90)=17.59µs  p(95)=21.05µs  p(99.9)=939.46µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.79ms min=1.97ms  med=41.4ms  max=286.16ms p(90)=58.23ms  p(95)=63.19ms  p(99.9)=88.17ms 
     http_reqs......................: 142494  1184.616797/s
     iteration_duration.............: avg=42.13ms min=3.9ms   med=41.71ms max=296.22ms p(90)=58.54ms  p(95)=63.52ms  p(99.9)=89.06ms 
     iterations.....................: 142394  1183.785452/s
     success_rate...................: 100.00% ✓ 142394      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 207810     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   691 kB/s
     http_req_blocked...............: avg=4.72µs  min=1.19µs  med=3.19µs  max=3.58ms   p(90)=4.76µs   p(95)=5.41µs   p(99.9)=51.91µs 
     http_req_connecting............: avg=1.26µs  min=0s      med=0s      max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.25ms min=3.84ms  med=84.46ms max=324.67ms p(90)=106.21ms p(95)=117.15ms p(99.9)=201.65ms
       { expected_response:true }...: avg=86.25ms min=3.84ms  med=84.46ms max=324.67ms p(90)=106.21ms p(95)=117.15ms p(99.9)=201.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69370
     http_req_receiving.............: avg=84.15µs min=30.07µs med=75.38µs max=47.42ms  p(90)=112.6µs  p(95)=126.4µs  p(99.9)=661.95µs
     http_req_sending...............: avg=23.94µs min=5.65µs  med=14.54µs max=192.2ms  p(90)=21.3µs   p(95)=23.64µs  p(99.9)=615.72µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.14ms min=3.76ms  med=84.36ms max=324.07ms p(90)=106.11ms p(95)=117.03ms p(99.9)=201.45ms
     http_reqs......................: 69370   575.569904/s
     iteration_duration.............: avg=86.62ms min=19.24ms med=84.72ms max=336.4ms  p(90)=106.49ms p(95)=117.46ms p(99.9)=203.37ms
     iterations.....................: 69270   574.740194/s
     success_rate...................: 100.00% ✓ 69270      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 149853     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   498 kB/s
     http_req_blocked...............: avg=5µs      min=1.09µs  med=2.93µs   max=3.84ms   p(90)=4.29µs   p(95)=4.84µs   p(99.9)=171.57µs
     http_req_connecting............: avg=1.86µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=83.56µs 
     http_req_duration..............: avg=119.65ms min=5.01ms  med=117.39ms max=315.09ms p(90)=158.22ms p(95)=170.43ms p(99.9)=220.28ms
       { expected_response:true }...: avg=119.65ms min=5.01ms  med=117.39ms max=315.09ms p(90)=158.22ms p(95)=170.43ms p(99.9)=220.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50051
     http_req_receiving.............: avg=82.73µs  min=29.88µs med=78.64µs  max=54.3ms   p(90)=109.4µs  p(95)=121.57µs p(99.9)=502µs   
     http_req_sending...............: avg=23.53µs  min=5.45µs  med=15.7µs   max=60.91ms  p(90)=20.97µs  p(95)=22.76µs  p(99.9)=412.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.55ms min=4.89ms  med=117.29ms max=314.93ms p(90)=158.11ms p(95)=170.32ms p(99.9)=220.12ms
     http_reqs......................: 50051   414.812042/s
     iteration_duration.............: avg=120.14ms min=22.01ms med=117.69ms max=324.03ms p(90)=158.51ms p(95)=170.75ms p(99.9)=222.1ms 
     iterations.....................: 49951   413.983263/s
     success_rate...................: 100.00% ✓ 49951      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97554      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=5.89µs   min=1.2µs   med=3.15µs   max=3.4ms    p(90)=4.52µs   p(95)=5.04µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=2.54µs   min=0s      med=0s       max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=183.76ms min=7.76ms  med=183.21ms max=398.08ms p(90)=195ms    p(95)=199.18ms p(99.9)=272.45ms
       { expected_response:true }...: avg=183.76ms min=7.76ms  med=183.21ms max=398.08ms p(90)=195ms    p(95)=199.18ms p(99.9)=272.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32618
     http_req_receiving.............: avg=93.55µs  min=29.37µs med=87.15µs  max=79.67ms  p(90)=116.98µs p(95)=128.64µs p(99.9)=599.08µs
     http_req_sending...............: avg=33.31µs  min=5.44µs  med=16.9µs   max=140.78ms p(90)=21.44µs  p(95)=23.27µs  p(99.9)=472.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.64ms min=7.56ms  med=183.11ms max=396.02ms p(90)=194.89ms p(95)=199.05ms p(99.9)=272.09ms
     http_reqs......................: 32618   269.665494/s
     iteration_duration.............: avg=184.61ms min=40.57ms med=183.5ms  max=405.77ms p(90)=195.29ms p(95)=199.48ms p(99.9)=276.11ms
     iterations.....................: 32518   268.838756/s
     success_rate...................: 100.00% ✓ 32518      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97773      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=6.09µs   min=1.13µs  med=3.23µs   max=3.56ms   p(90)=4.6µs    p(95)=5.19µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=2.58µs   min=0s      med=0s       max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=940.83µs
     http_req_duration..............: avg=183.42ms min=6.26ms  med=168.83ms max=676.17ms p(90)=213.94ms p(95)=258.59ms p(99.9)=540.01ms
       { expected_response:true }...: avg=183.42ms min=6.26ms  med=168.83ms max=676.17ms p(90)=213.94ms p(95)=258.59ms p(99.9)=540.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32691
     http_req_receiving.............: avg=97.46µs  min=30.77µs med=90.58µs  max=56.36ms  p(90)=122.55µs p(95)=135.49µs p(99.9)=873.29µs
     http_req_sending...............: avg=27.98µs  min=5.7µs   med=17.77µs  max=107.1ms  p(90)=22.19µs  p(95)=23.97µs  p(99.9)=905.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.3ms  min=6.16ms  med=168.71ms max=676.04ms p(90)=213.85ms p(95)=258.24ms p(99.9)=539.91ms
     http_reqs......................: 32691   269.961152/s
     iteration_duration.............: avg=184.24ms min=45.55ms med=169.19ms max=676.45ms p(90)=214.37ms p(95)=259.84ms p(99.9)=540.33ms
     iterations.....................: 32591   269.135356/s
     success_rate...................: 100.00% ✓ 32591      ✗ 0    
     vus............................: 11      min=11       max=50 
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

     checks.........................: 100.00% ✓ 8343      ✗ 0   
     data_received..................: 276 MB  2.2 MB/s
     data_sent......................: 3.5 MB  28 kB/s
     http_req_blocked...............: avg=66.21µs  min=1.65µs   med=3.95µs  max=9.87ms p(90)=5.6µs    p(95)=6.5µs    p(99.9)=9.01ms  
     http_req_connecting............: avg=61.27µs  min=0s       med=0s      max=9.83ms p(90)=0s       p(95)=0s       p(99.9)=8.98ms  
     http_req_duration..............: avg=2.1s     min=24.77ms  med=2.14s   max=4.02s  p(90)=2.79s    p(95)=3.02s    p(99.9)=3.76s   
       { expected_response:true }...: avg=2.1s     min=24.77ms  med=2.14s   max=4.02s  p(90)=2.79s    p(95)=3.02s    p(99.9)=3.76s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2881
     http_req_receiving.............: avg=103.71µs min=37.11µs  med=98.24µs max=1.4ms  p(90)=140.62µs p(95)=155.19µs p(99.9)=943.59µs
     http_req_sending...............: avg=80.68µs  min=6.34µs   med=20.27µs max=8ms    p(90)=25.76µs  p(95)=28.91µs  p(99.9)=4.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.1s     min=24.67ms  med=2.14s   max=4.02s  p(90)=2.79s    p(95)=3.02s    p(99.9)=3.76s   
     http_reqs......................: 2881    23.013374/s
     iteration_duration.............: avg=2.17s    min=528.68ms med=2.16s   max=4.02s  p(90)=2.8s     p(95)=3.03s    p(99.9)=3.77s   
     iterations.....................: 2781    22.214576/s
     success_rate...................: 100.00% ✓ 2781      ✗ 0   
     vus............................: 35      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

