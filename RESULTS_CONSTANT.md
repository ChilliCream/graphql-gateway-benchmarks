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
| hive-router | v0.0.84 | 2,953 | 3,157 | 2,889 | 3.2% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,660 | 2,804 | 2,638 | 2.2% |  |
| fusion | 16.6.4 | 2,636 | 2,740 | 2,562 | 2.1% |  |
| fusion-nightly | 16.7.0-p.5 | 2,618 | 2,747 | 2,577 | 2.2% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,506 | 2,568 | 2,499 | 1.0% |  |
| grafbase | 0.53.5 | 2,146 | 2,262 | 2,103 | 2.2% |  |
| cosmo | 0.334.0 | 1,268 | 1,324 | 1,258 | 1.8% |  |
| hive-gateway-router-runtime | 2.10.8 | 614 | 633 | 613 | 1.2% |  |
| apollo-router | v2.16.1 | 456 | 486 | 442 | 3.2% |  |
| apollo-gateway | 2.14.3 | 286 | 288 | 285 | 0.3% |  |
| hive-gateway | 2.10.8 | 277 | 283 | 275 | 0.9% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1205 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,549 | 2,730 | 2,529 | 2.7% |  |
| fusion-nightly-net11 | 16.7.0-p.5 | 2,521 | 2,638 | 2,511 | 1.8% |  |
| fusion-nightly | 16.7.0-p.5 | 2,464 | 2,567 | 2,457 | 1.5% |  |
| fusion | 16.6.4 | 2,384 | 2,516 | 2,367 | 2.2% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 2,295 | 2,393 | 2,271 | 1.7% |  |
| grafbase | 0.53.5 | 1,609 | 1,665 | 1,601 | 1.3% |  |
| cosmo | 0.334.0 | 1,230 | 1,275 | 1,228 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 570 | 591 | 566 | 1.4% |  |
| apollo-router | v2.16.1 | 410 | 429 | 407 | 2.0% |  |
| apollo-gateway | 2.14.3 | 265 | 268 | 263 | 0.6% |  |
| hive-gateway | 2.10.8 | 262 | 269 | 260 | 1.2% |  |
| feddi | 5ff8b6165878 | 23 | 23 | 23 | 0.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1064550     ✗ 0     
     data_received..................: 31 GB   259 MB/s
     data_sent......................: 427 MB  3.5 MB/s
     http_req_blocked...............: avg=3.27µs  min=1.01µs  med=2.39µs  max=18.61ms  p(90)=3.77µs  p(95)=4.41µs   p(99.9)=36.18µs
     http_req_connecting............: avg=245ns   min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.68ms min=1.43ms  med=15.91ms max=270.69ms p(90)=24.67ms p(95)=28.08ms  p(99.9)=48.55ms
       { expected_response:true }...: avg=16.68ms min=1.43ms  med=15.91ms max=270.69ms p(90)=24.67ms p(95)=28.08ms  p(99.9)=48.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 354950
     http_req_receiving.............: avg=95.98µs min=25.04µs med=47.47µs max=112.16ms p(90)=87.34µs p(95)=165.72µs p(99.9)=8.47ms 
     http_req_sending...............: avg=48.65µs min=4.87µs  med=9.11µs  max=129.42ms p(90)=15.84µs p(95)=101.95µs p(99.9)=5.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.54ms min=1.38ms  med=15.79ms max=270.38ms p(90)=24.48ms p(95)=27.8ms   p(99.9)=47.46ms
     http_reqs......................: 354950  2953.139992/s
     iteration_duration.............: avg=16.89ms min=1.98ms  med=16.1ms  max=306.01ms p(90)=24.88ms p(95)=28.31ms  p(99.9)=49.58ms
     iterations.....................: 354850  2952.308005/s
     success_rate...................: 100.00% ✓ 354850      ✗ 0     
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

     checks.........................: 100.00% ✓ 959631      ✗ 0     
     data_received..................: 28 GB   233 MB/s
     data_sent......................: 385 MB  3.2 MB/s
     http_req_blocked...............: avg=2.81µs  min=831ns   med=1.89µs   max=18.09ms  p(90)=3.19µs  p(95)=3.87µs  p(99.9)=28.45µs
     http_req_connecting............: avg=259ns   min=0s      med=0s       max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.53ms min=1.97ms  med=17.46ms  max=284.01ms p(90)=26.44ms p(95)=30.14ms p(99.9)=51.73ms
       { expected_response:true }...: avg=18.53ms min=1.97ms  med=17.46ms  max=284.01ms p(90)=26.44ms p(95)=30.14ms p(99.9)=51.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 319977
     http_req_receiving.............: avg=1.06ms  min=51.74µs med=124.94µs max=44.11ms  p(90)=2.72ms  p(95)=3.75ms  p(99.9)=25.02ms
     http_req_sending...............: avg=45.4µs  min=4.5µs   med=8.12µs   max=112.1ms  p(90)=15.73µs p(95)=83.13µs p(99.9)=5.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.42ms min=1.86ms  med=16.32ms  max=283.43ms p(90)=25.06ms p(95)=28.68ms p(99.9)=48.9ms 
     http_reqs......................: 319977  2660.672025/s
     iteration_duration.............: avg=18.74ms min=3.12ms  med=17.66ms  max=296.1ms  p(90)=26.66ms p(95)=30.38ms p(99.9)=52.24ms
     iterations.....................: 319877  2659.840505/s
     success_rate...................: 100.00% ✓ 319877      ✗ 0     
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

     checks.........................: 100.00% ✓ 950880      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 381 MB  3.2 MB/s
     http_req_blocked...............: avg=2.65µs   min=911ns   med=1.95µs  max=14.07ms  p(90)=3.13µs  p(95)=3.72µs  p(99.9)=27.52µs 
     http_req_connecting............: avg=287ns    min=0s      med=0s      max=3.64ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.71ms  min=1.94ms  med=16.18ms max=287.94ms p(90)=30.36ms p(95)=36.72ms p(99.9)=109.67ms
       { expected_response:true }...: avg=18.71ms  min=1.94ms  med=16.18ms max=287.94ms p(90)=30.36ms p(95)=36.72ms p(99.9)=109.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317060
     http_req_receiving.............: avg=553.17µs min=52.05µs med=89.9µs  max=106.7ms  p(90)=1.06ms  p(95)=1.92ms  p(99.9)=25.53ms 
     http_req_sending...............: avg=40.78µs  min=4.49µs  med=8.39µs  max=79.84ms  p(90)=14.55µs p(95)=81.93µs p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.11ms  min=1.86ms  med=15.67ms max=287.05ms p(90)=29.45ms p(95)=35.64ms p(99.9)=107.87ms
     http_reqs......................: 317060  2636.508759/s
     iteration_duration.............: avg=18.92ms  min=2.93ms  med=16.37ms max=308.69ms p(90)=30.58ms p(95)=36.97ms p(99.9)=110.52ms
     iterations.....................: 316960  2635.67721/s
     success_rate...................: 100.00% ✓ 316960      ✗ 0     
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

     checks.........................: 100.00% ✓ 944427      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 378 MB  3.1 MB/s
     http_req_blocked...............: avg=2.56µs  min=822ns  med=1.89µs  max=12.2ms   p(90)=3.12µs  p(95)=3.7µs   p(99.9)=27.62µs 
     http_req_connecting............: avg=262ns   min=0s     med=0s      max=3.32ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.85ms min=2.02ms med=16.12ms max=290.04ms p(90)=30.62ms p(95)=37.2ms  p(99.9)=125.01ms
       { expected_response:true }...: avg=18.85ms min=2.02ms med=16.12ms max=290.04ms p(90)=30.62ms p(95)=37.2ms  p(99.9)=125.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 314909
     http_req_receiving.............: avg=549.7µs min=51µs   med=89.73µs max=175.05ms p(90)=1.04ms  p(95)=1.87ms  p(99.9)=25.11ms 
     http_req_sending...............: avg=41.59µs min=4.35µs med=7.99µs  max=155.6ms  p(90)=14.13µs p(95)=71.26µs p(99.9)=3.84ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.26ms min=1.91ms med=15.6ms  max=286.9ms  p(90)=29.74ms p(95)=36.17ms p(99.9)=122.95ms
     http_reqs......................: 314909  2618.230744/s
     iteration_duration.............: avg=19.05ms min=2.92ms med=16.31ms max=304.59ms p(90)=30.83ms p(95)=37.43ms p(99.9)=125.67ms
     iterations.....................: 314809  2617.39932/s
     success_rate...................: 100.00% ✓ 314809      ✗ 0     
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

     checks.........................: 100.00% ✓ 903738      ✗ 0     
     data_received..................: 27 GB   220 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=3.25µs  min=1.06µs  med=2.47µs  max=13.49ms  p(90)=3.83µs  p(95)=4.46µs  p(99.9)=33.98µs 
     http_req_connecting............: avg=323ns   min=0s      med=0s      max=4.15ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.69ms min=1.64ms  med=16.07ms max=388.94ms p(90)=33.78ms p(95)=42.27ms p(99.9)=150.54ms
       { expected_response:true }...: avg=19.69ms min=1.64ms  med=16.07ms max=388.94ms p(90)=33.78ms p(95)=42.27ms p(99.9)=150.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301346
     http_req_receiving.............: avg=572.1µs min=50.83µs med=93.09µs max=238.03ms p(90)=1.04ms  p(95)=1.87ms  p(99.9)=29.41ms 
     http_req_sending...............: avg=44.26µs min=4.74µs  med=9.47µs  max=179.15ms p(90)=16.18µs p(95)=84.37µs p(99.9)=3.74ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.07ms min=1.56ms  med=15.56ms max=383.79ms p(90)=32.77ms p(95)=41.2ms  p(99.9)=149.31ms
     http_reqs......................: 301346  2506.752121/s
     iteration_duration.............: avg=19.9ms  min=2.13ms  med=16.28ms max=389.13ms p(90)=34.01ms p(95)=42.52ms p(99.9)=151.47ms
     iterations.....................: 301246  2505.92027/s
     success_rate...................: 100.00% ✓ 301246      ✗ 0     
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

     checks.........................: 100.00% ✓ 773721      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.07µs  min=912ns   med=2.18µs  max=11.74ms  p(90)=3.77µs  p(95)=4.54µs  p(99.9)=35.24µs
     http_req_connecting............: avg=385ns   min=0s      med=0s      max=3.88ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=23.04ms min=1.69ms  med=22.81ms max=319.66ms p(90)=27.35ms p(95)=29.09ms p(99.9)=47.93ms
       { expected_response:true }...: avg=23.04ms min=1.69ms  med=22.81ms max=319.66ms p(90)=27.35ms p(95)=29.09ms p(99.9)=47.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258007
     http_req_receiving.............: avg=84.85µs min=22.84µs med=53.46µs max=31.72ms  p(90)=92.6µs  p(95)=118.5µs p(99.9)=5.29ms 
     http_req_sending...............: avg=35.37µs min=4.91µs  med=9.82µs  max=143.7ms  p(90)=17.67µs p(95)=26.3µs  p(99.9)=1.71ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.92ms min=1.63ms  med=22.71ms max=319.32ms p(90)=27.22ms p(95)=28.92ms p(99.9)=46.8ms 
     http_reqs......................: 258007  2146.050428/s
     iteration_duration.............: avg=23.25ms min=4.37ms  med=23ms    max=329.79ms p(90)=27.55ms p(95)=29.3ms  p(99.9)=48.57ms
     iterations.....................: 257907  2145.218648/s
     success_rate...................: 100.00% ✓ 257907      ✗ 0     
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

     checks.........................: 100.00% ✓ 457515      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.16µs  min=1.07µs  med=2.5µs   max=2.94ms   p(90)=3.94µs  p(95)=4.58µs   p(99.9)=35.96µs 
     http_req_connecting............: avg=343ns   min=0s      med=0s      max=2.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.1ms  min=2.07ms  med=38.69ms max=302.01ms p(90)=54.71ms p(95)=59.62ms  p(99.9)=83.24ms 
       { expected_response:true }...: avg=39.1ms  min=2.07ms  med=38.69ms max=302.01ms p(90)=54.71ms p(95)=59.62ms  p(99.9)=83.24ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 152605
     http_req_receiving.............: avg=75.9µs  min=28.95µs med=61.44µs max=155.76ms p(90)=97.3µs  p(95)=114.03µs p(99.9)=981.75µs
     http_req_sending...............: avg=23.93µs min=4.91µs  med=10.55µs max=116.22ms p(90)=16.38µs p(95)=20.24µs  p(99.9)=949.28µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39ms    min=1.97ms  med=38.6ms  max=286.11ms p(90)=54.61ms p(95)=59.51ms  p(99.9)=82.9ms  
     http_reqs......................: 152605  1268.81292/s
     iteration_duration.............: avg=39.33ms min=4.39ms  med=38.9ms  max=309.16ms p(90)=54.92ms p(95)=59.82ms  p(99.9)=83.65ms 
     iterations.....................: 152505  1267.981484/s
     success_rate...................: 100.00% ✓ 152505      ✗ 0     
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

     checks.........................: 100.00% ✓ 221904     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   738 kB/s
     http_req_blocked...............: avg=4.42µs  min=1.2µs   med=2.82µs  max=4.03ms   p(90)=4.28µs   p(95)=4.91µs   p(99.9)=47.27µs 
     http_req_connecting............: avg=1.31µs  min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.78ms min=3.63ms  med=79.45ms max=327.27ms p(90)=102.5ms  p(95)=113.64ms p(99.9)=194.71ms
       { expected_response:true }...: avg=80.78ms min=3.63ms  med=79.45ms max=327.27ms p(90)=102.5ms  p(95)=113.64ms p(99.9)=194.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74068
     http_req_receiving.............: avg=78.07µs min=28.66µs med=68.28µs max=62.62ms  p(90)=102.88µs p(95)=115.54µs p(99.9)=660.95µs
     http_req_sending...............: avg=23.35µs min=5.38µs  med=12.99µs max=182.75ms p(90)=19.38µs  p(95)=21.74µs  p(99.9)=591.71µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.68ms min=3.53ms  med=79.34ms max=326.76ms p(90)=102.4ms  p(95)=113.54ms p(99.9)=194.15ms
     http_reqs......................: 74068   614.734676/s
     iteration_duration.............: avg=81.13ms min=22.08ms med=79.7ms  max=336.7ms  p(90)=102.75ms p(95)=113.93ms p(99.9)=196.24ms
     iterations.....................: 73968   613.904716/s
     success_rate...................: 100.00% ✓ 73968      ✗ 0    
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

     checks.........................: 100.00% ✓ 164904     ✗ 0    
     data_received..................: 4.8 GB  40 MB/s
     data_sent......................: 66 MB   548 kB/s
     http_req_blocked...............: avg=5.51µs   min=1.4µs   med=3.54µs   max=4.05ms   p(90)=4.93µs   p(95)=5.51µs   p(99.9)=116.34µs
     http_req_connecting............: avg=1.73µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=108.71ms min=4.77ms  med=108.34ms max=329.82ms p(90)=131.16ms p(95)=138.2ms  p(99.9)=175.26ms
       { expected_response:true }...: avg=108.71ms min=4.77ms  med=108.34ms max=329.82ms p(90)=131.16ms p(95)=138.2ms  p(99.9)=175.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 55068
     http_req_receiving.............: avg=86.96µs  min=30.38µs med=81.62µs  max=32.75ms  p(90)=113.67µs p(95)=126.51µs p(99.9)=618.18µs
     http_req_sending...............: avg=29.87µs  min=5.96µs  med=16.93µs  max=139.37ms p(90)=22.16µs  p(95)=24.02µs  p(99.9)=611µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.6ms  min=4.61ms  med=108.23ms max=321.53ms p(90)=131.05ms p(95)=138.08ms p(99.9)=174.15ms
     http_reqs......................: 55068   456.603497/s
     iteration_duration.............: avg=109.17ms min=23.97ms med=108.63ms max=340.19ms p(90)=131.44ms p(95)=138.46ms p(99.9)=176.51ms
     iterations.....................: 54968   455.774334/s
     success_rate...................: 100.00% ✓ 54968      ✗ 0    
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

     checks.........................: 100.00% ✓ 103539     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   344 kB/s
     http_req_blocked...............: avg=6.99µs   min=1.34µs  med=3.47µs   max=3.98ms   p(90)=4.89µs   p(95)=5.47µs   p(99.9)=1.93ms  
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=173.17ms min=7.5ms   med=174.87ms max=382.12ms p(90)=182.79ms p(95)=186.62ms p(99.9)=252.71ms
       { expected_response:true }...: avg=173.17ms min=7.5ms   med=174.87ms max=382.12ms p(90)=182.79ms p(95)=186.62ms p(99.9)=252.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34613
     http_req_receiving.............: avg=180µs    min=33.46µs med=83.93µs  max=207.06ms p(90)=114.53µs p(95)=125.71µs p(99.9)=1.58ms  
     http_req_sending...............: avg=29.01µs  min=5.99µs  med=17.25µs  max=188.53ms p(90)=21.83µs  p(95)=23.74µs  p(99.9)=536.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=172.96ms min=7.37ms  med=174.73ms max=255.67ms p(90)=182.62ms p(95)=186.44ms p(99.9)=251.22ms
     http_reqs......................: 34613   286.257933/s
     iteration_duration.............: avg=173.93ms min=41.3ms  med=175.26ms max=391.83ms p(90)=183.06ms p(95)=186.88ms p(99.9)=253.58ms
     iterations.....................: 34513   285.430909/s
     success_rate...................: 100.00% ✓ 34513      ✗ 0    
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

     checks.........................: 100.00% ✓ 100449     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   333 kB/s
     http_req_blocked...............: avg=6.61µs   min=1.12µs  med=3.53µs   max=3.93ms   p(90)=4.92µs   p(95)=5.52µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.75µs   min=0s      med=0s       max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=178.6ms  min=5.81ms  med=164.73ms max=669.27ms p(90)=211.66ms p(95)=259.4ms  p(99.9)=578.16ms
       { expected_response:true }...: avg=178.6ms  min=5.81ms  med=164.73ms max=669.27ms p(90)=211.66ms p(95)=259.4ms  p(99.9)=578.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33583
     http_req_receiving.............: avg=92.38µs  min=33.66µs med=85.86µs  max=52.58ms  p(90)=116.4µs  p(95)=127.91µs p(99.9)=603.9µs 
     http_req_sending...............: avg=29.57µs  min=5.32µs  med=17.68µs  max=95.05ms  p(90)=22.69µs  p(95)=24.57µs  p(99.9)=510.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.48ms min=5.7ms   med=164.62ms max=669.19ms p(90)=211.54ms p(95)=259.29ms p(99.9)=578.06ms
     http_reqs......................: 33583   277.599992/s
     iteration_duration.............: avg=179.39ms min=33.54ms med=165.09ms max=669.48ms p(90)=211.98ms p(95)=261ms    p(99.9)=578.51ms
     iterations.....................: 33483   276.773383/s
     success_rate...................: 100.00% ✓ 33483      ✗ 0    
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

     checks.........................: 100.00% ✓ 919422      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=2.94µs  min=891ns   med=2.19µs  max=5.59ms   p(90)=3.83µs  p(95)=4.67µs   p(99.9)=36.02µs
     http_req_connecting............: avg=312ns   min=0s      med=0s      max=3.52ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.35ms min=1.74ms  med=19.06ms max=289.88ms p(90)=26.61ms p(95)=28.91ms  p(99.9)=47.6ms 
       { expected_response:true }...: avg=19.35ms min=1.74ms  med=19.06ms max=289.88ms p(90)=26.61ms p(95)=28.91ms  p(99.9)=47.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 306574
     http_req_receiving.............: avg=87.28µs min=24.95µs med=50.91µs max=181.53ms p(90)=92.45µs p(95)=128.68µs p(99.9)=6.25ms 
     http_req_sending...............: avg=41.35µs min=4.57µs  med=9.32µs  max=197.36ms p(90)=17.68µs p(95)=68.59µs  p(99.9)=2.88ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.22ms min=1.69ms  med=18.95ms max=289.44ms p(90)=26.47ms p(95)=28.73ms  p(99.9)=46.62ms
     http_reqs......................: 306574  2549.933743/s
     iteration_duration.............: avg=19.56ms min=3.34ms  med=19.26ms max=306.06ms p(90)=26.81ms p(95)=29.12ms  p(99.9)=48.27ms
     iterations.....................: 306474  2549.101991/s
     success_rate...................: 100.00% ✓ 306474      ✗ 0     
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

     checks.........................: 100.00% ✓ 909012      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 364 MB  3.0 MB/s
     http_req_blocked...............: avg=2.99µs  min=841ns   med=2.09µs   max=23.94ms  p(90)=3.79µs  p(95)=4.62µs  p(99.9)=33.79µs
     http_req_connecting............: avg=281ns   min=0s      med=0s       max=3.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.57ms min=1.54ms  med=18.49ms  max=283.97ms p(90)=28.38ms p(95)=32.15ms p(99.9)=54.5ms 
       { expected_response:true }...: avg=19.57ms min=1.54ms  med=18.49ms  max=283.97ms p(90)=28.38ms p(95)=32.15ms p(99.9)=54.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 303104
     http_req_receiving.............: avg=1.21ms  min=51.53µs med=145.43µs max=266.59ms p(90)=3.13ms  p(95)=4.32ms  p(99.9)=26.07ms
     http_req_sending...............: avg=47.47µs min=4.29µs  med=8.65µs   max=165.78ms p(90)=19.13µs p(95)=89.94µs p(99.9)=5.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.3ms  min=1.47ms  med=17.18ms  max=275.47ms p(90)=26.81ms p(95)=30.52ms p(99.9)=51.2ms 
     http_reqs......................: 303104  2521.701358/s
     iteration_duration.............: avg=19.79ms min=2.72ms  med=18.69ms  max=296.51ms p(90)=28.6ms  p(95)=32.38ms p(99.9)=54.92ms
     iterations.....................: 303004  2520.869399/s
     success_rate...................: 100.00% ✓ 303004      ✗ 0     
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

     checks.........................: 100.00% ✓ 888369      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=2.88µs  min=871ns   med=2.06µs  max=12.43ms  p(90)=3.67µs  p(95)=4.4µs   p(99.9)=33.88µs 
     http_req_connecting............: avg=327ns   min=0s      med=0s      max=3.62ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.03ms min=1.56ms  med=16.95ms max=371.39ms p(90)=32.76ms p(95)=39.95ms p(99.9)=126.92ms
       { expected_response:true }...: avg=20.03ms min=1.56ms  med=16.95ms max=371.39ms p(90)=32.76ms p(95)=39.95ms p(99.9)=126.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296223
     http_req_receiving.............: avg=560.9µs min=50.81µs med=91.76µs max=149.17ms p(90)=1.07ms  p(95)=1.9ms   p(99.9)=26.78ms 
     http_req_sending...............: avg=42.05µs min=4.75µs  med=8.69µs  max=134.17ms p(90)=17.28µs p(95)=82.52µs p(99.9)=3.54ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.43ms min=1.48ms  med=16.44ms max=371.31ms p(90)=31.83ms p(95)=38.8ms  p(99.9)=125.84ms
     http_reqs......................: 296223  2464.203917/s
     iteration_duration.............: avg=20.25ms min=2.87ms  med=17.15ms max=371.56ms p(90)=32.98ms p(95)=40.2ms  p(99.9)=127.47ms
     iterations.....................: 296123  2463.372043/s
     success_rate...................: 100.00% ✓ 296123      ✗ 0     
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

     checks.........................: 100.00% ✓ 859686      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=3.13µs   min=891ns   med=2.3µs   max=13.76ms  p(90)=3.92µs  p(95)=4.63µs  p(99.9)=35.88µs 
     http_req_connecting............: avg=264ns    min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.71ms  min=1.64ms  med=17.31ms max=479.72ms p(90)=34.03ms p(95)=41.88ms p(99.9)=149.02ms
       { expected_response:true }...: avg=20.71ms  min=1.64ms  med=17.31ms max=479.72ms p(90)=34.03ms p(95)=41.88ms p(99.9)=149.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286662
     http_req_receiving.............: avg=607.52µs min=52.89µs med=96.58µs max=190.36ms p(90)=1.15ms  p(95)=2.03ms  p(99.9)=28.43ms 
     http_req_sending...............: avg=43µs     min=4.42µs  med=9.02µs  max=83.13ms  p(90)=17.39µs p(95)=82.75µs p(99.9)=3.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.06ms  min=1.51ms  med=16.75ms max=479.09ms p(90)=33.01ms p(95)=40.74ms p(99.9)=147.93ms
     http_reqs......................: 286662  2384.692527/s
     iteration_duration.............: avg=20.92ms  min=2.54ms  med=17.51ms max=479.91ms p(90)=34.26ms p(95)=42.1ms  p(99.9)=149.56ms
     iterations.....................: 286562  2383.860644/s
     success_rate...................: 100.00% ✓ 286562      ✗ 0     
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

     checks.........................: 100.00% ✓ 827496      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 332 MB  2.8 MB/s
     http_req_blocked...............: avg=2.93µs  min=902ns  med=2.16µs  max=9.01ms   p(90)=3.8µs   p(95)=4.53µs  p(99.9)=31.67µs 
     http_req_connecting............: avg=328ns   min=0s     med=0s      max=3.92ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.52ms min=1.81ms med=18.27ms max=323.4ms  p(90)=34.83ms p(95)=42.75ms p(99.9)=150.06ms
       { expected_response:true }...: avg=21.52ms min=1.81ms med=18.27ms max=323.4ms  p(90)=34.83ms p(95)=42.75ms p(99.9)=150.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 275932
     http_req_receiving.............: avg=568.2µs min=51.8µs med=96.8µs  max=165.19ms p(90)=1.11ms  p(95)=1.91ms  p(99.9)=26.63ms 
     http_req_sending...............: avg=41.75µs min=4.36µs med=9.25µs  max=169.23ms p(90)=18.85µs p(95)=76.33µs p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.91ms min=1.74ms med=17.74ms max=323.31ms p(90)=33.88ms p(95)=41.63ms p(99.9)=148.9ms 
     http_reqs......................: 275932  2295.010221/s
     iteration_duration.............: avg=21.74ms min=3.06ms med=18.48ms max=323.6ms  p(90)=35.05ms p(95)=42.97ms p(99.9)=150.6ms 
     iterations.....................: 275832  2294.178491/s
     success_rate...................: 100.00% ✓ 275832      ✗ 0     
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

     checks.........................: 100.00% ✓ 580359      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.93µs  min=1.04µs  med=2.92µs  max=4.05ms   p(90)=5.13µs   p(95)=6.22µs   p(99.9)=50.01µs
     http_req_connecting............: avg=443ns   min=0s      med=0s      max=3.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.75ms min=2.29ms  med=30.23ms max=296.99ms p(90)=40.71ms  p(95)=44.16ms  p(99.9)=65.64ms
       { expected_response:true }...: avg=30.75ms min=2.29ms  med=30.23ms max=296.99ms p(90)=40.71ms  p(95)=44.16ms  p(99.9)=65.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193553
     http_req_receiving.............: avg=101.2µs min=26.34µs med=60.56µs max=30.31ms  p(90)=135.56µs p(95)=227.43µs p(99.9)=3.86ms 
     http_req_sending...............: avg=42.36µs min=4.82µs  med=11.01µs max=114.37ms p(90)=25.85µs  p(95)=118.84µs p(99.9)=2.6ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.6ms  min=2.17ms  med=30.11ms max=296.38ms p(90)=40.55ms  p(95)=43.98ms  p(99.9)=65.24ms
     http_reqs......................: 193553  1609.025993/s
     iteration_duration.............: avg=31ms    min=6.57ms  med=30.47ms max=309.65ms p(90)=40.94ms  p(95)=44.38ms  p(99.9)=66.12ms
     iterations.....................: 193453  1608.194683/s
     success_rate...................: 100.00% ✓ 193453      ✗ 0     
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

     checks.........................: 100.00% ✓ 443736      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.91µs  min=1.12µs  med=2.96µs  max=3.38ms   p(90)=4.56µs   p(95)=5.26µs   p(99.9)=39.7µs  
     http_req_connecting............: avg=626ns   min=0s      med=0s      max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.3ms  min=2.07ms  med=39.88ms max=289.31ms p(90)=56.06ms  p(95)=60.9ms   p(99.9)=84.38ms 
       { expected_response:true }...: avg=40.3ms  min=2.07ms  med=39.88ms max=289.31ms p(90)=56.06ms  p(95)=60.9ms   p(99.9)=84.38ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148012
     http_req_receiving.............: avg=83.25µs min=27.11µs med=69.45µs max=144.47ms p(90)=108.57µs p(95)=125.15µs p(99.9)=900.15µs
     http_req_sending...............: avg=31.43µs min=4.86µs  med=12.51µs max=219.62ms p(90)=19.5µs   p(95)=23.41µs  p(99.9)=1.03ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.19ms min=1.92ms  med=39.78ms max=281.64ms p(90)=55.94ms  p(95)=60.78ms  p(99.9)=83.87ms 
     http_reqs......................: 148012  1230.602069/s
     iteration_duration.............: avg=40.55ms min=3.91ms  med=40.11ms max=317.61ms p(90)=56.27ms  p(95)=61.11ms  p(99.9)=85.14ms 
     iterations.....................: 147912  1229.770649/s
     success_rate...................: 100.00% ✓ 147912      ✗ 0     
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

     checks.........................: 100.00% ✓ 206094     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   686 kB/s
     http_req_blocked...............: avg=4.18µs  min=1.08µs  med=2.62µs  max=3.84ms   p(90)=4.09µs   p(95)=4.69µs   p(99.9)=43.51µs 
     http_req_connecting............: avg=1.32µs  min=0s      med=0s      max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.99ms min=4.01ms  med=85.35ms max=291.35ms p(90)=108.64ms p(95)=119.78ms p(99.9)=202.72ms
       { expected_response:true }...: avg=86.99ms min=4.01ms  med=85.35ms max=291.35ms p(90)=108.64ms p(95)=119.78ms p(99.9)=202.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68798
     http_req_receiving.............: avg=80.29µs min=26.77µs med=70.21µs max=116.88ms p(90)=107.49µs p(95)=120.67µs p(99.9)=638.42µs
     http_req_sending...............: avg=23.68µs min=4.92µs  med=12.93µs max=129.38ms p(90)=19.93µs  p(95)=22.09µs  p(99.9)=572.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.89ms min=3.92ms  med=85.25ms max=291.29ms p(90)=108.53ms p(95)=119.67ms p(99.9)=202.48ms
     http_reqs......................: 68798   570.76016/s
     iteration_duration.............: avg=87.35ms min=20.38ms med=85.6ms  max=328.63ms p(90)=108.9ms  p(95)=120.04ms p(99.9)=204.72ms
     iterations.....................: 68698   569.930543/s
     success_rate...................: 100.00% ✓ 68698      ✗ 0    
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

     checks.........................: 100.00% ✓ 148455     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   494 kB/s
     http_req_blocked...............: avg=5.68µs   min=1.42µs  med=3.63µs   max=3.47ms   p(90)=5.07µs   p(95)=5.64µs   p(99.9)=114.94µs
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=61.68µs 
     http_req_duration..............: avg=120.76ms min=5.2ms   med=118.47ms max=333.61ms p(90)=159.62ms p(95)=171.33ms p(99.9)=219.89ms
       { expected_response:true }...: avg=120.76ms min=5.2ms   med=118.47ms max=333.61ms p(90)=159.62ms p(95)=171.33ms p(99.9)=219.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49585
     http_req_receiving.............: avg=88.17µs  min=32.22µs med=81.1µs   max=67.67ms  p(90)=112.57µs p(95)=124.64µs p(99.9)=545.58µs
     http_req_sending...............: avg=27.24µs  min=5.84µs  med=16.62µs  max=99.77ms  p(90)=22.22µs  p(95)=24.1µs   p(99.9)=582.45µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.65ms min=5.05ms  med=118.37ms max=305.41ms p(90)=159.53ms p(95)=171.21ms p(99.9)=219.65ms
     http_reqs......................: 49585   410.975497/s
     iteration_duration.............: avg=121.28ms min=34.28ms med=118.79ms max=343.87ms p(90)=159.93ms p(95)=171.63ms p(99.9)=222.48ms
     iterations.....................: 49485   410.146667/s
     success_rate...................: 100.00% ✓ 49485      ✗ 0    
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

     checks.........................: 100.00% ✓ 96225      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.09µs   min=1.12µs  med=3.12µs   max=3.55ms   p(90)=4.43µs   p(95)=4.94µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.77µs   min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=186.29ms min=7.8ms   med=179.37ms max=388.92ms p(90)=212.01ms p(95)=218.94ms p(99.9)=290.98ms
       { expected_response:true }...: avg=186.29ms min=7.8ms   med=179.37ms max=388.92ms p(90)=212.01ms p(95)=218.94ms p(99.9)=290.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32175
     http_req_receiving.............: avg=92.35µs  min=29.72µs med=84.98µs  max=102.24ms p(90)=114.73µs p(95)=125.55µs p(99.9)=479.74µs
     http_req_sending...............: avg=28.19µs  min=5.63µs  med=17.14µs  max=99.29ms  p(90)=21.75µs  p(95)=23.59µs  p(99.9)=567.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.17ms min=7.68ms  med=179.27ms max=388.35ms p(90)=211.9ms  p(95)=218.82ms p(99.9)=290.88ms
     http_reqs......................: 32175   265.965575/s
     iteration_duration.............: avg=187.15ms min=34.5ms  med=179.65ms max=418.45ms p(90)=212.3ms  p(95)=219.22ms p(99.9)=299.39ms
     iterations.....................: 32075   265.138954/s
     success_rate...................: 100.00% ✓ 32075      ✗ 0    
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

     checks.........................: 100.00% ✓ 95001      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=7.34µs   min=1.49µs  med=3.68µs   max=4.47ms   p(90)=5.1µs    p(95)=5.74µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=3.4µs    min=0s      med=0s       max=4.42ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=188.72ms min=6.43ms  med=174.37ms max=634.36ms p(90)=225.24ms p(95)=275.2ms  p(99.9)=558.67ms
       { expected_response:true }...: avg=188.72ms min=6.43ms  med=174.37ms max=634.36ms p(90)=225.24ms p(95)=275.2ms  p(99.9)=558.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31767
     http_req_receiving.............: avg=97.37µs  min=34.62µs med=91.05µs  max=33.34ms  p(90)=122.39µs p(95)=135.09µs p(99.9)=706.76µs
     http_req_sending...............: avg=24.45µs  min=6.57µs  med=18.69µs  max=25.75ms  p(90)=23.35µs  p(95)=25.17µs  p(99.9)=478.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.6ms  min=6.24ms  med=174.26ms max=634.21ms p(90)=225.12ms p(95)=275.11ms p(99.9)=558.56ms
     http_reqs......................: 31767   262.769152/s
     iteration_duration.............: avg=189.57ms min=48.04ms med=174.76ms max=634.63ms p(90)=225.62ms p(95)=276ms    p(99.9)=558.9ms 
     iterations.....................: 31667   261.941976/s
     success_rate...................: 100.00% ✓ 31667      ✗ 0    
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

     checks.........................: 100.00% ✓ 8517      ✗ 0   
     data_received..................: 281 MB  2.2 MB/s
     data_sent......................: 3.5 MB  28 kB/s
     http_req_blocked...............: avg=29.02µs min=1.54µs   med=3.8µs   max=4.12ms   p(90)=5.48µs  p(95)=6.31µs   p(99.9)=3.2ms   
     http_req_connecting............: avg=22.85µs min=0s       med=0s      max=3.64ms   p(90)=0s      p(95)=0s       p(99.9)=3.11ms  
     http_req_duration..............: avg=2.05s   min=24.59ms  med=2.07s   max=3.84s    p(90)=2.92s   p(95)=3.12s    p(99.9)=3.72s   
       { expected_response:true }...: avg=2.05s   min=24.59ms  med=2.07s   max=3.84s    p(90)=2.92s   p(95)=3.12s    p(99.9)=3.72s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2939
     http_req_receiving.............: avg=97.12µs min=38.67µs  med=94.54µs max=376.99µs p(90)=133.8µs p(95)=150.13µs p(99.9)=315.27µs
     http_req_sending...............: avg=39.66µs min=6.73µs   med=19.15µs max=3.3ms    p(90)=25.07µs p(95)=28.35µs  p(99.9)=2.75ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.05s   min=24.49ms  med=2.07s   max=3.84s    p(90)=2.92s   p(95)=3.12s    p(99.9)=3.72s   
     http_reqs......................: 2939    23.411643/s
     iteration_duration.............: avg=2.12s   min=166.28ms med=2.1s    max=3.84s    p(90)=2.93s   p(95)=3.13s    p(99.9)=3.73s   
     iterations.....................: 2839    22.615058/s
     success_rate...................: 100.00% ✓ 2839      ✗ 0   
     vus............................: 30      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

