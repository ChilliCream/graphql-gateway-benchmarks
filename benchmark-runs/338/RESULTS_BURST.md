## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,883 | 3,026 | 2,863 | 2.1% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,598 | 2,719 | 2,581 | 1.8% |  |
| fusion | 16.6.3 | 2,584 | 2,664 | 2,574 | 1.3% |  |
| fusion-nightly | 16.7.0-p.2 | 2,533 | 2,641 | 2,501 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,325 | 2,415 | 2,303 | 1.6% |  |
| cosmo | 0.334.0 | 1,196 | 1,235 | 1,185 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 578 | 593 | 574 | 1.2% |  |
| hive-gateway | 2.10.8 | 257 | 261 | 254 | 0.9% |  |
| apollo-gateway | 2.14.3 | 235 | 241 | 230 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (7473 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (529944 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,481 | 2,571 | 2,472 | 1.4% |  |
| fusion | 16.6.3 | 2,394 | 2,483 | 2,382 | 1.5% |  |
| fusion-nightly | 16.7.0-p.2 | 2,371 | 2,458 | 2,350 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,243 | 2,338 | 2,226 | 1.6% |  |
| hive-router | v0.0.84 | 2,179 | 2,333 | 2,163 | 2.6% |  |
| cosmo | 0.334.0 | 1,128 | 1,173 | 1,114 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.8 | 543 | 555 | 542 | 0.8% |  |
| hive-gateway | 2.10.8 | 237 | 242 | 234 | 1.0% |  |
| apollo-gateway | 2.14.3 | 233 | 240 | 233 | 1.0% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (30228 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (301499 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 530913     ✗ 0     
     data_received..................: 16 GB   253 MB/s
     data_sent......................: 214 MB  3.5 MB/s
     http_req_blocked...............: avg=12.97µs  min=892ns   med=2.05µs  max=59.7ms   p(90)=3.46µs   p(95)=4.54µs   p(99.9)=1.04ms  
     http_req_connecting............: avg=10.21µs  min=0s      med=0s      max=59.62ms  p(90)=0s       p(95)=0s       p(99.9)=872.13µs
     http_req_duration..............: avg=79.87ms  min=1.44ms  med=75.4ms  max=324.55ms p(90)=155.88ms p(95)=168.66ms p(99.9)=213.71ms
       { expected_response:true }...: avg=79.87ms  min=1.44ms  med=75.4ms  max=324.55ms p(90)=155.88ms p(95)=168.66ms p(99.9)=213.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 177971
     http_req_receiving.............: avg=125.68µs min=24.64µs med=47.94µs max=183.48ms p(90)=129.29µs p(95)=311.82µs p(99.9)=12.4ms  
     http_req_sending...............: avg=68.35µs  min=4.31µs  med=9µs     max=298.07ms p(90)=16.88µs  p(95)=107.86µs p(99.9)=8.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.68ms  min=1.39ms  med=75.23ms max=290.29ms p(90)=155.61ms p(95)=168.32ms p(99.9)=213.25ms
     http_reqs......................: 177971  2883.03065/s
     iteration_duration.............: avg=80.55ms  min=2.17ms  med=76.17ms max=344.15ms p(90)=156.26ms p(95)=169.02ms p(99.9)=215.22ms
     iterations.....................: 176971  2866.83121/s
     success_rate...................: 100.00% ✓ 176971     ✗ 0     
     vus............................: 90      min=0        max=498 
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 481878      ✗ 0     
     data_received..................: 14 GB   228 MB/s
     data_sent......................: 194 MB  3.1 MB/s
     http_req_blocked...............: avg=16.45µs  min=841ns   med=2.11µs   max=56.42ms  p(90)=3.62µs   p(95)=4.68µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=13.53µs  min=0s      med=0s       max=56.23ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=87.96ms  min=1.89ms  med=83.86ms  max=329.02ms p(90)=168.11ms p(95)=184.47ms p(99.9)=239.9ms 
       { expected_response:true }...: avg=87.96ms  min=1.89ms  med=83.86ms  max=329.02ms p(90)=168.11ms p(95)=184.47ms p(99.9)=239.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 161626
     http_req_receiving.............: avg=583.28µs min=50.26µs med=102.05µs max=67.72ms  p(90)=1.12ms   p(95)=1.93ms   p(99.9)=25.15ms 
     http_req_sending...............: avg=61.69µs  min=4.5µs   med=8.84µs   max=255.59ms p(90)=17.76µs  p(95)=106.37µs p(99.9)=7.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.31ms  min=1.8ms   med=83.19ms  max=328.38ms p(90)=167.34ms p(95)=183.67ms p(99.9)=238.84ms
     http_reqs......................: 161626  2598.482746/s
     iteration_duration.............: avg=88.75ms  min=3.38ms  med=84.79ms  max=357.19ms p(90)=168.6ms  p(95)=184.92ms p(99.9)=241ms   
     iterations.....................: 160626  2582.405613/s
     success_rate...................: 100.00% ✓ 160626      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 480741      ✗ 0     
     data_received..................: 14 GB   227 MB/s
     data_sent......................: 194 MB  3.1 MB/s
     http_req_blocked...............: avg=23.1µs  min=1.07µs  med=2.59µs  max=92.71ms  p(90)=4.2µs    p(95)=5.35µs   p(99.9)=3.03ms  
     http_req_connecting............: avg=19.32µs min=0s      med=0s      max=92.63ms  p(90)=0s       p(95)=0s       p(99.9)=2.97ms  
     http_req_duration..............: avg=88.14ms min=1.96ms  med=77.56ms max=1.88s    p(90)=169.76ms p(95)=194.73ms p(99.9)=594.85ms
       { expected_response:true }...: avg=88.14ms min=1.96ms  med=77.56ms max=1.88s    p(90)=169.76ms p(95)=194.73ms p(99.9)=594.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161247
     http_req_receiving.............: avg=1.22ms  min=53.92µs med=97.54µs max=476.9ms  p(90)=1.32ms   p(95)=3.55ms   p(99.9)=96.07ms 
     http_req_sending...............: avg=77.99µs min=4.87µs  med=9.8µs   max=271.43ms p(90)=18.54µs  p(95)=118.55µs p(99.9)=11.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.84ms min=1.85ms  med=76.43ms max=1.88s    p(90)=168.05ms p(95)=192.67ms p(99.9)=570.31ms
     http_reqs......................: 161247  2584.260063/s
     iteration_duration.............: avg=89.02ms min=2.82ms  med=78.5ms  max=1.88s    p(90)=170.53ms p(95)=195.53ms p(99.9)=596.33ms
     iterations.....................: 160247  2568.233345/s
     success_rate...................: 100.00% ✓ 160247      ✗ 0     
     vus............................: 74      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 470886      ✗ 0     
     data_received..................: 14 GB   222 MB/s
     data_sent......................: 190 MB  3.0 MB/s
     http_req_blocked...............: avg=21.76µs min=922ns   med=2.6µs   max=70.38ms  p(90)=4.22µs   p(95)=5.34µs   p(99.9)=2.56ms  
     http_req_connecting............: avg=18.17µs min=0s      med=0s      max=70.31ms  p(90)=0s       p(95)=0s       p(99.9)=2.4ms   
     http_req_duration..............: avg=90.03ms min=1.92ms  med=79.62ms max=1.36s    p(90)=173.53ms p(95)=199.92ms p(99.9)=547.46ms
       { expected_response:true }...: avg=90.03ms min=1.92ms  med=79.62ms max=1.36s    p(90)=173.53ms p(95)=199.92ms p(99.9)=547.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157962
     http_req_receiving.............: avg=1.13ms  min=51.93µs med=98.79µs max=456.73ms p(90)=1.33ms   p(95)=3.47ms   p(99.9)=70.58ms 
     http_req_sending...............: avg=70.89µs min=4.54µs  med=9.66µs  max=129.94ms p(90)=18.72µs  p(95)=120.95µs p(99.9)=10.06ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.82ms min=1.84ms  med=78.6ms  max=1.34s    p(90)=171.92ms p(95)=197.94ms p(99.9)=529.46ms
     http_reqs......................: 157962  2533.241268/s
     iteration_duration.............: avg=90.86ms min=3.26ms  med=80.56ms max=1.36s    p(90)=174.11ms p(95)=200.59ms p(99.9)=547.72ms
     iterations.....................: 156962  2517.204238/s
     success_rate...................: 100.00% ✓ 156962      ✗ 0     
     vus............................: 73      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429618      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=13.22µs min=912ns   med=2.09µs  max=47.01ms  p(90)=3.42µs   p(95)=4.41µs   p(99.9)=924.71µs
     http_req_connecting............: avg=10.49µs min=0s      med=0s      max=46.95ms  p(90)=0s       p(95)=0s       p(99.9)=873.67µs
     http_req_duration..............: avg=98.7ms  min=1.6ms   med=83.57ms max=1.38s    p(90)=188.08ms p(95)=222.08ms p(99.9)=683.72ms
       { expected_response:true }...: avg=98.7ms  min=1.6ms   med=83.57ms max=1.38s    p(90)=188.08ms p(95)=222.08ms p(99.9)=683.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144206
     http_req_receiving.............: avg=1.47ms  min=51.61µs med=99.08µs max=931.29ms p(90)=1.75ms   p(95)=4.57ms   p(99.9)=92.43ms 
     http_req_sending...............: avg=54.7µs  min=4.31µs  med=8.67µs  max=88.68ms  p(90)=14.96µs  p(95)=89.49µs  p(99.9)=7.66ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.17ms min=1.54ms  med=82.4ms  max=1.38s    p(90)=186.1ms  p(95)=217.78ms p(99.9)=681.73ms
     http_reqs......................: 144206  2325.922623/s
     iteration_duration.............: avg=99.63ms min=2.63ms  med=84.68ms max=1.38s    p(90)=188.67ms p(95)=222.87ms p(99.9)=685.12ms
     iterations.....................: 143206  2309.793456/s
     success_rate...................: 100.00% ✓ 143206      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 221337      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.52µs   min=942ns   med=2.32µs   max=7.29ms   p(90)=3.95µs   p(95)=4.79µs   p(99.9)=557.29µs
     http_req_connecting............: avg=2.54µs   min=0s      med=0s       max=6.4ms    p(90)=0s       p(95)=0s       p(99.9)=458.41µs
     http_req_duration..............: avg=190.86ms min=1.95ms  med=191.55ms max=534.54ms p(90)=353.4ms  p(95)=378.59ms p(99.9)=461.46ms
       { expected_response:true }...: avg=190.86ms min=1.95ms  med=191.55ms max=534.54ms p(90)=353.4ms  p(95)=378.59ms p(99.9)=461.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74779
     http_req_receiving.............: avg=69.55µs  min=27.37µs med=57.23µs  max=18.92ms  p(90)=92.8µs   p(95)=107.32µs p(99.9)=844.18µs
     http_req_sending...............: avg=27.86µs  min=4.63µs  med=10.09µs  max=95.83ms  p(90)=16.07µs  p(95)=19.71µs  p(99.9)=3.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.76ms min=1.88ms  med=191.46ms max=534.48ms p(90)=353.33ms p(95)=378.5ms  p(99.9)=461.39ms
     http_reqs......................: 74779   1196.387304/s
     iteration_duration.............: avg=193.67ms min=4.36ms  med=194.65ms max=534.68ms p(90)=354.25ms p(95)=379.2ms  p(99.9)=462.05ms
     iterations.....................: 73779   1180.388329/s
     success_rate...................: 100.00% ✓ 73779       ✗ 0    
     vus............................: 80      min=0         max=493
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 108543     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   694 kB/s
     http_req_blocked...............: avg=8.92µs   min=1.17µs  med=3.08µs   max=11.69ms p(90)=4.89µs   p(95)=5.94µs   p(99.9)=1.29ms 
     http_req_connecting............: avg=4.84µs   min=0s      med=0s       max=11.63ms p(90)=0s       p(95)=0s       p(99.9)=1.27ms 
     http_req_duration..............: avg=385.76ms min=3.59ms  med=354.48ms max=1.66s   p(90)=762.85ms p(95)=825.82ms p(99.9)=1.21s  
       { expected_response:true }...: avg=385.76ms min=3.59ms  med=354.48ms max=1.66s   p(90)=762.85ms p(95)=825.82ms p(99.9)=1.21s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 37181
     http_req_receiving.............: avg=83.27µs  min=30.73µs med=71.89µs  max=25.07ms p(90)=110.76µs p(95)=125.71µs p(99.9)=953.7µs
     http_req_sending...............: avg=25.07µs  min=5.63µs  med=14.07µs  max=25.62ms p(90)=21.68µs  p(95)=25.03µs  p(99.9)=2.39ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=385.65ms min=3.53ms  med=354.35ms max=1.66s   p(90)=762.73ms p(95)=825.72ms p(99.9)=1.21s  
     http_reqs......................: 37181   578.078782/s
     iteration_duration.............: avg=396.68ms min=13.69ms med=366.6ms  max=1.66s   p(90)=765.94ms p(95)=828.13ms p(99.9)=1.21s  
     iterations.....................: 36181   562.531089/s
     success_rate...................: 100.00% ✓ 36181      ✗ 0    
     vus............................: 71      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 48824      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=14.14µs  min=1.07µs  med=3.48µs   max=8.02ms  p(90)=5.28µs   p(95)=6.68µs   p(99.9)=2.19ms
     http_req_connecting............: avg=9.01µs   min=0s      med=0s       max=7.97ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms
     http_req_duration..............: avg=832.83ms min=5.46ms  med=690.5ms  max=18.74s  p(90)=1.39s    p(95)=1.54s    p(99.9)=16.69s
       { expected_response:true }...: avg=832.83ms min=5.46ms  med=690.5ms  max=18.74s  p(90)=1.39s    p(95)=1.54s    p(99.9)=16.69s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17275
     http_req_receiving.............: avg=98.12µs  min=34.14µs med=90.6µs   max=9.77ms  p(90)=127.29µs p(95)=143.25µs p(99.9)=1.08ms
     http_req_sending...............: avg=29.18µs  min=5.82µs  med=17.76µs  max=50.23ms p(90)=23.45µs  p(95)=27.19µs  p(99.9)=2.59ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=832.7ms  min=5.33ms  med=690.42ms max=18.74s  p(90)=1.39s    p(95)=1.54s    p(99.9)=16.69s
     http_reqs......................: 17275   257.165334/s
     iteration_duration.............: avg=883.19ms min=96.4ms  med=737.53ms max=18.74s  p(90)=1.41s    p(95)=1.55s    p(99.9)=16.76s
     iterations.....................: 16274   242.263887/s
     success_rate...................: 100.00% ✓ 16274      ✗ 0    
     vus............................: 58      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 48525      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   289 kB/s
     http_req_blocked...............: avg=14.26µs  min=1.19µs  med=3.45µs   max=8.36ms  p(90)=5.06µs   p(95)=6.25µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=8.99µs   min=0s      med=0s       max=6.46ms  p(90)=0s       p(95)=0s       p(99.9)=2.07ms  
     http_req_duration..............: avg=365.35ms min=7.33ms  med=409.92ms max=1.09s   p(90)=635.47ms p(95)=672.29ms p(99.9)=936.26ms
       { expected_response:true }...: avg=365.35ms min=7.33ms  med=409.92ms max=1.09s   p(90)=635.47ms p(95)=672.29ms p(99.9)=936.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17175
     http_req_receiving.............: avg=97.36µs  min=32.35µs med=84.01µs  max=44.08ms p(90)=122.78µs p(95)=137.18µs p(99.9)=1.24ms  
     http_req_sending...............: avg=32.87µs  min=5.74µs  med=16.44µs  max=61.81ms p(90)=21.87µs  p(95)=26.51µs  p(99.9)=2.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=365.22ms min=7.24ms  med=409.84ms max=1.09s   p(90)=635.4ms  p(95)=672.19ms p(99.9)=936.15ms
     http_reqs......................: 17175   235.519135/s
     iteration_duration.............: avg=387.96ms min=7.98ms  med=426.94ms max=1.1s    p(90)=639.59ms p(95)=676.61ms p(99.9)=948.76ms
     iterations.....................: 16175   221.806231/s
     success_rate...................: 100.00% ✓ 16175      ✗ 0    
     vus............................: 49      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 456915      ✗ 0     
     data_received..................: 13 GB   218 MB/s
     data_sent......................: 184 MB  3.0 MB/s
     http_req_blocked...............: avg=17.01µs  min=941ns   med=2.36µs   max=62.46ms  p(90)=4.15µs   p(95)=5.33µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=13.77µs  min=0s      med=0s       max=60.8ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=92.75ms  min=1.44ms  med=87.84ms  max=351.79ms p(90)=178.73ms p(95)=194.03ms p(99.9)=246.59ms
       { expected_response:true }...: avg=92.75ms  min=1.44ms  med=87.84ms  max=351.79ms p(90)=178.73ms p(95)=194.03ms p(99.9)=246.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153305
     http_req_receiving.............: avg=615.95µs min=51.82µs med=104.74µs max=202.86ms p(90)=1.2ms    p(95)=2.12ms   p(99.9)=25.22ms 
     http_req_sending...............: avg=65.78µs  min=4.76µs  med=9.76µs   max=143.83ms p(90)=20.69µs  p(95)=113.4µs  p(99.9)=8.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.07ms  min=1.35ms  med=87.2ms   max=351.69ms p(90)=178.04ms p(95)=193.26ms p(99.9)=245.27ms
     http_reqs......................: 153305  2481.462113/s
     iteration_duration.............: avg=93.61ms  min=3.28ms  med=88.78ms  max=351.99ms p(90)=179.2ms  p(95)=194.49ms p(99.9)=247.3ms 
     iterations.....................: 152305  2465.275673/s
     success_rate...................: 100.00% ✓ 152305      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441987      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 178 MB  2.9 MB/s
     http_req_blocked...............: avg=17.08µs min=841ns   med=2.28µs   max=98.49ms p(90)=4.08µs   p(95)=5.28µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=14.1µs  min=0s      med=0s       max=98.42ms p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=95.93ms min=1.54ms  med=84.05ms  max=1.33s   p(90)=179.88ms p(95)=208.7ms  p(99.9)=1.01s   
       { expected_response:true }...: avg=95.93ms min=1.54ms  med=84.05ms  max=1.33s   p(90)=179.88ms p(95)=208.7ms  p(99.9)=1.01s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 148329
     http_req_receiving.............: avg=1.52ms  min=51.41µs med=104.06µs max=1s      p(90)=1.67ms   p(95)=4.28ms   p(99.9)=116.14ms
     http_req_sending...............: avg=65.43µs min=4.71µs  med=9.58µs   max=69.9ms  p(90)=20.37µs  p(95)=105.08µs p(99.9)=8.8ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.33ms min=1.45ms  med=82.95ms  max=1.29s   p(90)=178.14ms p(95)=205.73ms p(99.9)=968.13ms
     http_reqs......................: 148329  2394.35597/s
     iteration_duration.............: avg=96.84ms min=2.91ms  med=85.13ms  max=1.33s   p(90)=180.49ms p(95)=209.46ms p(99.9)=1.02s   
     iterations.....................: 147329  2378.213772/s
     success_rate...................: 100.00% ✓ 147329      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436956      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=21.26µs min=962ns   med=2.86µs   max=74.77ms  p(90)=4.56µs   p(95)=5.74µs   p(99.9)=4.43ms  
     http_req_connecting............: avg=17.52µs min=0s      med=0s       max=74.69ms  p(90)=0s       p(95)=0s       p(99.9)=4.3ms   
     http_req_duration..............: avg=96.98ms min=1.5ms   med=79.91ms  max=1.63s    p(90)=186.71ms p(95)=219.93ms p(99.9)=972.26ms
       { expected_response:true }...: avg=96.98ms min=1.5ms   med=79.91ms  max=1.63s    p(90)=186.71ms p(95)=219.93ms p(99.9)=972.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146652
     http_req_receiving.............: avg=1.53ms  min=55.13µs med=108.74µs max=1.25s    p(90)=1.79ms   p(95)=4.76ms   p(99.9)=82.87ms 
     http_req_sending...............: avg=69.85µs min=4.92µs  med=10.47µs  max=119.99ms p(90)=19.5µs   p(95)=116.03µs p(99.9)=9.24ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.37ms min=1.38ms  med=78.58ms  max=1.6s     p(90)=184.8ms  p(95)=217.11ms p(99.9)=926.91ms
     http_reqs......................: 146652  2371.811587/s
     iteration_duration.............: avg=97.93ms min=2.8ms   med=80.86ms  max=1.63s    p(90)=187.36ms p(95)=221.2ms  p(99.9)=972.69ms
     iterations.....................: 145652  2355.638528/s
     success_rate...................: 100.00% ✓ 145652      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 415989      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=20.21µs  min=1.03µs  med=3.04µs   max=67.57ms  p(90)=4.97µs   p(95)=6.28µs   p(99.9)=2.29ms  
     http_req_connecting............: avg=15.91µs  min=0s      med=0s       max=67.49ms  p(90)=0s       p(95)=0s       p(99.9)=2.2ms   
     http_req_duration..............: avg=101.87ms min=1.83ms  med=89.05ms  max=1.27s    p(90)=194.24ms p(95)=225.69ms p(99.9)=677.14ms
       { expected_response:true }...: avg=101.87ms min=1.83ms  med=89.05ms  max=1.27s    p(90)=194.24ms p(95)=225.69ms p(99.9)=677.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139663
     http_req_receiving.............: avg=1.5ms    min=52.41µs med=111.91µs max=544.57ms p(90)=1.77ms   p(95)=4.6ms    p(99.9)=105.06ms
     http_req_sending...............: avg=79.73µs  min=5.29µs  med=11.61µs  max=230.8ms  p(90)=22.94µs  p(95)=126.93µs p(99.9)=10.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.29ms min=1.76ms  med=87.87ms  max=1.11s    p(90)=192.13ms p(95)=222.79ms p(99.9)=639.89ms
     http_reqs......................: 139663  2243.939102/s
     iteration_duration.............: avg=102.88ms min=3.07ms  med=90.11ms  max=1.27s    p(90)=194.91ms p(95)=226.43ms p(99.9)=677.64ms
     iterations.....................: 138663  2227.87229/s
     success_rate...................: 100.00% ✓ 138663      ✗ 0     
     vus............................: 70      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 402537      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=10.55µs  min=962ns  med=2.35µs  max=58.63ms  p(90)=4.03µs   p(95)=5.21µs   p(99.9)=766.7µs 
     http_req_connecting............: avg=7.22µs   min=0s     med=0s      max=45.55ms  p(90)=0s       p(95)=0s       p(99.9)=719.81µs
     http_req_duration..............: avg=105.26ms min=1.45ms med=99.85ms max=294.12ms p(90)=202.13ms p(95)=219.23ms p(99.9)=263.31ms
       { expected_response:true }...: avg=105.26ms min=1.45ms med=99.85ms max=294.12ms p(90)=202.13ms p(95)=219.23ms p(99.9)=263.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135179
     http_req_receiving.............: avg=97.22µs  min=25.8µs med=54.88µs max=50.53ms  p(90)=103.91µs p(95)=260.02µs p(99.9)=5.68ms  
     http_req_sending...............: avg=51.37µs  min=4.71µs med=10.33µs max=241ms    p(90)=18.61µs  p(95)=96.46µs  p(99.9)=6.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.11ms min=1.41ms med=99.71ms max=294.05ms p(90)=201.95ms p(95)=219.06ms p(99.9)=262.6ms 
     http_reqs......................: 135179  2179.872745/s
     iteration_duration.............: avg=106.28ms min=5.13ms med=101.1ms max=355.49ms p(90)=202.63ms p(95)=219.66ms p(99.9)=264.03ms
     iterations.....................: 134179  2163.746922/s
     success_rate...................: 100.00% ✓ 134179      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 208773      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=6.5µs    min=1.05µs  med=2.9µs    max=28.81ms  p(90)=4.7µs    p(95)=5.72µs   p(99.9)=712.55µs
     http_req_connecting............: avg=2.81µs   min=0s      med=0s       max=28.75ms  p(90)=0s       p(95)=0s       p(99.9)=552.2µs 
     http_req_duration..............: avg=202.14ms min=1.83ms  med=201.97ms max=547.18ms p(90)=372.14ms p(95)=397.55ms p(99.9)=480.5ms 
       { expected_response:true }...: avg=202.14ms min=1.83ms  med=201.97ms max=547.18ms p(90)=372.14ms p(95)=397.55ms p(99.9)=480.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 70591
     http_req_receiving.............: avg=84.65µs  min=29.45µs med=70.41µs  max=144.45ms p(90)=111.97µs p(95)=128.32µs p(99.9)=1.29ms  
     http_req_sending...............: avg=28.2µs   min=5.16µs  med=12.53µs  max=114.26ms p(90)=19.86µs  p(95)=23.7µs   p(99.9)=2.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.03ms min=1.77ms  med=201.88ms max=547.11ms p(90)=372.06ms p(95)=397.46ms p(99.9)=480.3ms 
     http_reqs......................: 70591   1128.368475/s
     iteration_duration.............: avg=205.3ms  min=5.65ms  med=205.25ms max=547.39ms p(90)=373.06ms p(95)=398.19ms p(99.9)=480.93ms
     iterations.....................: 69591   1112.383881/s
     success_rate...................: 100.00% ✓ 69591       ✗ 0    
     vus............................: 83      min=0         max=495
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 102354     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   652 kB/s
     http_req_blocked...............: avg=9.81µs   min=1.31µs  med=3.56µs   max=13.21ms p(90)=5.4µs    p(95)=6.51µs   p(99.9)=1.44ms
     http_req_connecting............: avg=5.21µs   min=0s      med=0s       max=13.14ms p(90)=0s       p(95)=0s       p(99.9)=1.39ms
     http_req_duration..............: avg=408.71ms min=3.72ms  med=379.83ms max=1.75s   p(90)=807.15ms p(95)=871.88ms p(99.9)=1.27s 
       { expected_response:true }...: avg=408.71ms min=3.72ms  med=379.83ms max=1.75s   p(90)=807.15ms p(95)=871.88ms p(99.9)=1.27s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35118
     http_req_receiving.............: avg=93.97µs  min=29.98µs med=75.62µs  max=23.34ms p(90)=116.98µs p(95)=133.24µs p(99.9)=1.31ms
     http_req_sending...............: avg=37.97µs  min=5.69µs  med=15.56µs  max=172.5ms p(90)=23.04µs  p(95)=26.23µs  p(99.9)=2.79ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=408.57ms min=3.6ms   med=379.63ms max=1.75s   p(90)=807.03ms p(95)=871.75ms p(99.9)=1.27s 
     http_reqs......................: 35118   543.101443/s
     iteration_duration.............: avg=420.94ms min=22.45ms med=393.56ms max=1.75s   p(90)=810.62ms p(95)=874.8ms  p(99.9)=1.28s 
     iterations.....................: 34118   527.636399/s
     success_rate...................: 100.00% ✓ 34118      ✗ 0    
     vus............................: 88      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 45591      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   286 kB/s
     http_req_blocked...............: avg=12.84µs  min=1.17µs  med=3.14µs   max=3.14ms   p(90)=4.86µs   p(95)=6.46µs   p(99.9)=2.02ms
     http_req_connecting............: avg=8.02µs   min=0s      med=0s       max=3.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.99ms
     http_req_duration..............: avg=898.98ms min=6.11ms  med=799.2ms  max=4.78s    p(90)=1.77s    p(95)=2.03s    p(99.9)=4.24s 
       { expected_response:true }...: avg=898.98ms min=6.11ms  med=799.2ms  max=4.78s    p(90)=1.77s    p(95)=2.03s    p(99.9)=4.24s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16197
     http_req_receiving.............: avg=103.14µs min=34.95µs med=90.13µs  max=56.81ms  p(90)=126.67µs p(95)=142.63µs p(99.9)=1.16ms
     http_req_sending...............: avg=48.92µs  min=5.56µs  med=17.35µs  max=124.36ms p(90)=22.75µs  p(95)=27.78µs  p(99.9)=3.59ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=898.82ms min=6.03ms  med=799.1ms  max=4.78s    p(90)=1.77s    p(95)=2.03s    p(99.9)=4.24s 
     http_reqs......................: 16197   237.968847/s
     iteration_duration.............: avg=958.1ms  min=29.91ms med=880.26ms max=4.78s    p(90)=1.81s    p(95)=2.06s    p(99.9)=4.26s 
     iterations.....................: 15197   223.276691/s
     success_rate...................: 100.00% ✓ 15197      ✗ 0    
     vus............................: 23      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 45306      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=14.22µs  min=1.13µs  med=3.23µs   max=12.33ms p(90)=5.02µs   p(95)=6.65µs   p(99.9)=2.05ms  
     http_req_connecting............: avg=9.28µs   min=0s      med=0s       max=12.26ms p(90)=0s       p(95)=0s       p(99.9)=2.03ms  
     http_req_duration..............: avg=902.5ms  min=7.81ms  med=819.84ms max=3.12s   p(90)=1.83s    p(95)=2.01s    p(99.9)=2.85s   
       { expected_response:true }...: avg=902.5ms  min=7.81ms  med=819.84ms max=3.12s   p(90)=1.83s    p(95)=2.01s    p(99.9)=2.85s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16102
     http_req_receiving.............: avg=105.46µs min=33.85µs med=90.72µs  max=85.7ms  p(90)=131.75µs p(95)=149.47µs p(99.9)=902.29µs
     http_req_sending...............: avg=33.65µs  min=5.51µs  med=16.64µs  max=47.32ms p(90)=22.52µs  p(95)=27.73µs  p(99.9)=3.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=902.36ms min=7.73ms  med=819.72ms max=3.12s   p(90)=1.83s    p(95)=2.01s    p(99.9)=2.85s   
     http_reqs......................: 16102   233.910592/s
     iteration_duration.............: avg=962.2ms  min=26.18ms med=894.77ms max=3.12s   p(90)=1.84s    p(95)=2.02s    p(99.9)=2.87s   
     iterations.....................: 15102   219.383788/s
     success_rate...................: 100.00% ✓ 15102      ✗ 0    
     vus............................: 94      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

