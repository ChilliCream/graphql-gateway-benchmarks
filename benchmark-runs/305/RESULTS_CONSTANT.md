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
| hive-router | v0.0.84 | 2,999 | 3,265 | 2,936 | 3.5% |  |
| fusion-nightly-net11 | 16.6.0-p.13 | 2,743 | 2,870 | 2,737 | 1.8% |  |
| fusion | 16.5.1 | 2,589 | 2,699 | 2,554 | 1.7% |  |
| fusion-nightly | 16.6.0-p.13 | 2,557 | 2,695 | 2,537 | 2.1% |  |
| grafbase | 0.53.5 | 2,160 | 2,275 | 2,138 | 2.1% |  |
| cosmo | 0.334.0 | 1,324 | 1,370 | 1,316 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 615 | 635 | 613 | 1.3% |  |
| apollo-router | v2.16.1 | 487 | 503 | 485 | 1.4% |  |
| apollo-gateway | 2.14.3 | 286 | 290 | 285 | 0.5% |  |
| hive-gateway | 2.10.8 | 273 | 280 | 272 | 1.0% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% |  |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.13 | 2,536 | 2,636 | 2,531 | 1.4% |  |
| hive-router | v0.0.84 | 2,474 | 2,661 | 2,398 | 3.5% |  |
| fusion-nightly | 16.6.0-p.13 | 2,466 | 2,573 | 2,456 | 1.6% |  |
| fusion | 16.5.1 | 2,294 | 2,399 | 2,275 | 1.9% |  |
| fusion-nightly-fed | 16.6.0-p.13 | 2,258 | 2,325 | 2,211 | 1.7% |  |
| grafbase | 0.53.5 | 1,639 | 1,699 | 1,635 | 1.4% |  |
| cosmo | 0.334.0 | 1,238 | 1,280 | 1,236 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 595 | 613 | 590 | 1.2% |  |
| apollo-router | v2.16.1 | 443 | 463 | 440 | 1.9% |  |
| hive-gateway | 2.10.8 | 266 | 273 | 265 | 1.0% |  |
| apollo-gateway | 2.14.3 | 264 | 270 | 262 | 0.9% |  |
| feddi | 5ff8b6165878 | 23 | 23 | 22 | 1.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1081068     ✗ 0     
     data_received..................: 32 GB   263 MB/s
     data_sent......................: 433 MB  3.6 MB/s
     http_req_blocked...............: avg=3.32µs  min=1.01µs  med=2.41µs  max=20.63ms  p(90)=3.75µs  p(95)=4.38µs   p(99.9)=35.29µs
     http_req_connecting............: avg=270ns   min=0s      med=0s      max=3.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.43ms min=1.39ms  med=15.68ms max=277.9ms  p(90)=24.49ms p(95)=27.74ms  p(99.9)=47.73ms
       { expected_response:true }...: avg=16.43ms min=1.39ms  med=15.68ms max=277.9ms  p(90)=24.49ms p(95)=27.74ms  p(99.9)=47.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 360456
     http_req_receiving.............: avg=90.25µs min=25.64µs med=47.68µs max=179.27ms p(90)=86.73µs p(95)=162.7µs  p(99.9)=7.26ms 
     http_req_sending...............: avg=50.21µs min=4.81µs  med=9.1µs   max=240.97ms p(90)=15.68µs p(95)=100.35µs p(99.9)=7.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.29ms min=1.31ms  med=15.56ms max=277.45ms p(90)=24.31ms p(95)=27.49ms  p(99.9)=46.73ms
     http_reqs......................: 360456  2999.291115/s
     iteration_duration.............: avg=16.64ms min=1.99ms  med=15.88ms max=286.67ms p(90)=24.7ms  p(95)=27.97ms  p(99.9)=48.32ms
     iterations.....................: 360356  2998.459033/s
     success_rate...................: 100.00% ✓ 360356      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 989241      ✗ 0     
     data_received..................: 29 GB   240 MB/s
     data_sent......................: 396 MB  3.3 MB/s
     http_req_blocked...............: avg=3.07µs   min=872ns   med=2.22µs  max=17.87ms  p(90)=3.45µs  p(95)=4.02µs  p(99.9)=33.31µs
     http_req_connecting............: avg=284ns    min=0s      med=0s      max=4.09ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.97ms  min=1.91ms  med=17.07ms max=292.58ms p(90)=25.73ms p(95)=29.35ms p(99.9)=50.55ms
       { expected_response:true }...: avg=17.97ms  min=1.91ms  med=17.07ms max=292.58ms p(90)=25.73ms p(95)=29.35ms p(99.9)=50.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 329847
     http_req_receiving.............: avg=648.81µs min=51.59µs med=99.57µs max=135.98ms p(90)=1.65ms  p(95)=2.5ms   p(99.9)=21.08ms
     http_req_sending...............: avg=47.02µs  min=4.51µs  med=8.52µs  max=168.81ms p(90)=15.27µs p(95)=89.26µs p(99.9)=5.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.27ms  min=1.83ms  med=16.39ms max=291.85ms p(90)=24.89ms p(95)=28.42ms p(99.9)=48.42ms
     http_reqs......................: 329847  2743.195614/s
     iteration_duration.............: avg=18.18ms  min=3.21ms  med=17.27ms max=318.32ms p(90)=25.95ms p(95)=29.59ms p(99.9)=51.18ms
     iterations.....................: 329747  2742.363957/s
     success_rate...................: 100.00% ✓ 329747      ✗ 0     
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

     checks.........................: 100.00% ✓ 933978      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=2.95µs   min=1µs     med=2.35µs  max=17.94ms  p(90)=3.61µs  p(95)=4.2µs   p(99.9)=33.49µs 
     http_req_connecting............: avg=131ns    min=0s      med=0s      max=2.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.05ms  min=2.08ms  med=16.43ms max=299.94ms p(90)=31.02ms p(95)=37.58ms p(99.9)=121.48ms
       { expected_response:true }...: avg=19.05ms  min=2.08ms  med=16.43ms max=299.94ms p(90)=31.02ms p(95)=37.58ms p(99.9)=121.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311426
     http_req_receiving.............: avg=555.09µs min=50.28µs med=91.94µs max=152.5ms  p(90)=1.07ms  p(95)=1.89ms  p(99.9)=25.32ms 
     http_req_sending...............: avg=44.58µs  min=4.81µs  med=8.83µs  max=208.53ms p(90)=14.89µs p(95)=87.64µs p(99.9)=3.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.45ms  min=1.95ms  med=15.9ms  max=299.84ms p(90)=30.07ms p(95)=36.51ms p(99.9)=119.92ms
     http_reqs......................: 311426  2589.608016/s
     iteration_duration.............: avg=19.26ms  min=2.92ms  med=16.62ms max=300.07ms p(90)=31.25ms p(95)=37.83ms p(99.9)=121.94ms
     iterations.....................: 311326  2588.776484/s
     success_rate...................: 100.00% ✓ 311326      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 922341      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=3.07µs   min=1.03µs  med=2.34µs  max=13.9ms   p(90)=3.56µs  p(95)=4.13µs  p(99.9)=30.2µs  
     http_req_connecting............: avg=290ns    min=0s      med=0s      max=3.54ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.29ms  min=1.96ms  med=16.54ms max=354.27ms p(90)=31.28ms p(95)=38.11ms p(99.9)=126.42ms
       { expected_response:true }...: avg=19.29ms  min=1.96ms  med=16.54ms max=354.27ms p(90)=31.28ms p(95)=38.11ms p(99.9)=126.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307547
     http_req_receiving.............: avg=586.48µs min=52.07µs med=93.49µs max=224.78ms p(90)=1.1ms   p(95)=2ms     p(99.9)=25.21ms 
     http_req_sending...............: avg=41.44µs  min=4.81µs  med=8.71µs  max=101.62ms p(90)=14.57µs p(95)=86.07µs p(99.9)=3.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.66ms  min=1.86ms  med=16ms    max=353.97ms p(90)=30.28ms p(95)=36.93ms p(99.9)=124.09ms
     http_reqs......................: 307547  2557.845146/s
     iteration_duration.............: avg=19.5ms   min=3.17ms  med=16.74ms max=354.48ms p(90)=31.5ms  p(95)=38.38ms p(99.9)=128.46ms
     iterations.....................: 307447  2557.013453/s
     success_rate...................: 100.00% ✓ 307447      ✗ 0     
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

     checks.........................: 100.00% ✓ 778983      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=3.47µs  min=1.01µs  med=2.69µs  max=10.34ms  p(90)=4.35µs  p(95)=5.18µs   p(99.9)=42.59µs
     http_req_connecting............: avg=331ns   min=0s      med=0s      max=3.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.87ms min=1.71ms  med=22.61ms max=286.46ms p(90)=27.3ms  p(95)=29.29ms  p(99.9)=50.04ms
       { expected_response:true }...: avg=22.87ms min=1.71ms  med=22.61ms max=286.46ms p(90)=27.3ms  p(95)=29.29ms  p(99.9)=50.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259761
     http_req_receiving.............: avg=94.43µs min=26.94µs med=55.89µs max=29.78ms  p(90)=97.06µs p(95)=129.39µs p(99.9)=8ms    
     http_req_sending...............: avg=41.93µs min=4.84µs  med=10.82µs max=177.85ms p(90)=17.89µs p(95)=47.19µs  p(99.9)=2.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.73ms min=1.6ms   med=22.51ms max=285.75ms p(90)=27.15ms p(95)=29.09ms  p(99.9)=48.85ms
     http_reqs......................: 259761  2160.700085/s
     iteration_duration.............: avg=23.09ms min=3.39ms  med=22.82ms max=306.01ms p(90)=27.51ms p(95)=29.52ms  p(99.9)=50.59ms
     iterations.....................: 259661  2159.868282/s
     success_rate...................: 100.00% ✓ 259661      ✗ 0     
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

     checks.........................: 100.00% ✓ 477528      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3.47µs  min=1.1µs   med=2.57µs  max=3.58ms   p(90)=4.02µs  p(95)=4.67µs   p(99.9)=33.29µs 
     http_req_connecting............: avg=591ns   min=0s      med=0s      max=3.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.45ms min=2.1ms   med=37.07ms max=305.72ms p(90)=52.18ms p(95)=56.7ms   p(99.9)=79.2ms  
       { expected_response:true }...: avg=37.45ms min=2.1ms   med=37.07ms max=305.72ms p(90)=52.18ms p(95)=56.7ms   p(99.9)=79.2ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 159276
     http_req_receiving.............: avg=73.99µs min=25.77µs med=59.69µs max=96.69ms  p(90)=95.58µs p(95)=111.14µs p(99.9)=918.34µs
     http_req_sending...............: avg=29.52µs min=5.13µs  med=11.05µs max=258.76ms p(90)=17.39µs p(95)=21.56µs  p(99.9)=1.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.35ms min=1.98ms  med=36.98ms max=305.15ms p(90)=52.08ms p(95)=56.59ms  p(99.9)=78.6ms  
     http_reqs......................: 159276  1324.172517/s
     iteration_duration.............: avg=37.69ms min=3.76ms  med=37.28ms max=316.9ms  p(90)=52.39ms p(95)=56.91ms  p(99.9)=79.6ms  
     iterations.....................: 159176  1323.341147/s
     success_rate...................: 100.00% ✓ 159176      ✗ 0     
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

     checks.........................: 100.00% ✓ 222009     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   739 kB/s
     http_req_blocked...............: avg=4.47µs  min=1.19µs  med=2.85µs  max=3.81ms   p(90)=4.28µs   p(95)=4.9µs    p(99.9)=44.89µs 
     http_req_connecting............: avg=1.33µs  min=0s      med=0s      max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.74ms min=3.56ms  med=79.09ms max=319.27ms p(90)=98.7ms   p(95)=108.01ms p(99.9)=191.25ms
       { expected_response:true }...: avg=80.74ms min=3.56ms  med=79.09ms max=319.27ms p(90)=98.7ms   p(95)=108.01ms p(99.9)=191.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74103
     http_req_receiving.............: avg=79.34µs min=29.79µs med=69.08µs max=114.96ms p(90)=103.35µs p(95)=116.32µs p(99.9)=682.5µs 
     http_req_sending...............: avg=24.59µs min=5.02µs  med=13.02µs max=155.61ms p(90)=19.25µs  p(95)=21.61µs  p(99.9)=599.22µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.63ms min=3.49ms  med=78.99ms max=318.84ms p(90)=98.6ms   p(95)=107.89ms p(99.9)=190.9ms 
     http_reqs......................: 74103   615.194028/s
     iteration_duration.............: avg=81.07ms min=23.87ms med=79.32ms max=344.33ms p(90)=98.96ms  p(95)=108.26ms p(99.9)=191.92ms
     iterations.....................: 74003   614.36384/s
     success_rate...................: 100.00% ✓ 74003      ✗ 0    
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

     checks.........................: 100.00% ✓ 175998     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   585 kB/s
     http_req_blocked...............: avg=4.63µs   min=1.05µs  med=2.83µs   max=3.51ms   p(90)=4.2µs    p(95)=4.7µs    p(99.9)=48.78µs 
     http_req_connecting............: avg=1.57µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.86ms min=4.61ms  med=101.62ms max=334.93ms p(90)=122.9ms  p(95)=129.29ms p(99.9)=156.01ms
       { expected_response:true }...: avg=101.86ms min=4.61ms  med=101.62ms max=334.93ms p(90)=122.9ms  p(95)=129.29ms p(99.9)=156.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58766
     http_req_receiving.............: avg=82.89µs  min=30.33µs med=77.47µs  max=28.31ms  p(90)=108.58µs p(95)=121.74µs p(99.9)=615.5µs 
     http_req_sending...............: avg=22.89µs  min=4.97µs  med=15.58µs  max=77.55ms  p(90)=20.79µs  p(95)=22.58µs  p(99.9)=534.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.76ms min=4.43ms  med=101.53ms max=334.4ms  p(90)=122.79ms p(95)=129.17ms p(99.9)=155.9ms 
     http_reqs......................: 58766   487.371598/s
     iteration_duration.............: avg=102.29ms min=27.65ms med=101.9ms  max=354.02ms p(90)=123.15ms p(95)=129.54ms p(99.9)=156.94ms
     iterations.....................: 58666   486.542255/s
     success_rate...................: 100.00% ✓ 58666      ✗ 0    
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

     checks.........................: 100.00% ✓ 103545     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   344 kB/s
     http_req_blocked...............: avg=6.32µs   min=1.39µs  med=3.48µs   max=3.63ms   p(90)=4.86µs   p(95)=5.43µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=2.6µs    min=0s      med=0s       max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=173.14ms min=7.23ms  med=178.14ms max=411.55ms p(90)=184.63ms p(95)=189.39ms p(99.9)=258.18ms
       { expected_response:true }...: avg=173.14ms min=7.23ms  med=178.14ms max=411.55ms p(90)=184.63ms p(95)=189.39ms p(99.9)=258.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34615
     http_req_receiving.............: avg=95.23µs  min=35.55µs med=84.66µs  max=91.28ms  p(90)=115.45µs p(95)=126.99µs p(99.9)=570.49µs
     http_req_sending...............: avg=34.76µs  min=6.2µs   med=17.69µs  max=187.31ms p(90)=22.62µs  p(95)=24.39µs  p(99.9)=545.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.01ms min=7.15ms  med=178.03ms max=408.51ms p(90)=184.52ms p(95)=189.27ms p(99.9)=257.66ms
     http_reqs......................: 34615   286.353004/s
     iteration_duration.............: avg=173.92ms min=33.44ms med=178.42ms max=422.13ms p(90)=184.9ms  p(95)=189.67ms p(99.9)=259.11ms
     iterations.....................: 34515   285.525752/s
     success_rate...................: 100.00% ✓ 34515      ✗ 0    
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

     checks.........................: 100.00% ✓ 98850      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=5.78µs   min=1.09µs  med=2.84µs   max=3.96ms   p(90)=4.11µs   p(95)=4.64µs   p(99.9)=1.24ms  
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=181.39ms min=6.01ms  med=165.36ms max=732.34ms p(90)=210.2ms  p(95)=246.42ms p(99.9)=624.22ms
       { expected_response:true }...: avg=181.39ms min=6.01ms  med=165.36ms max=732.34ms p(90)=210.2ms  p(95)=246.42ms p(99.9)=624.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33050
     http_req_receiving.............: avg=92.22µs  min=30.52µs med=81.32µs  max=80.22ms  p(90)=110.74µs p(95)=122.61µs p(99.9)=868.64µs
     http_req_sending...............: avg=27.09µs  min=5.5µs   med=16.03µs  max=76.68ms  p(90)=20.93µs  p(95)=22.63µs  p(99.9)=486.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.27ms min=5.87ms  med=165.26ms max=732.22ms p(90)=210.1ms  p(95)=246.23ms p(99.9)=624.1ms 
     http_reqs......................: 33050   273.493959/s
     iteration_duration.............: avg=182.19ms min=44.25ms med=165.69ms max=732.62ms p(90)=210.58ms p(95)=247.31ms p(99.9)=624.56ms
     iterations.....................: 32950   272.666444/s
     success_rate...................: 100.00% ✓ 32950      ✗ 0    
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
     http_req_blocked...............: avg=15.21µs  min=2.56µs  med=3.2µs    max=160.05µs p(90)=3.63µs   p(95)=66.22µs  p(99.9)=158.18µs
     http_req_connecting............: avg=6.24µs   min=0s      med=0s       max=81.2µs   p(90)=0s       p(95)=32.48µs  p(99.9)=80.22µs 
     http_req_duration..............: avg=2.34s    min=20.86ms med=36.66ms  max=30.02s   p(90)=42.72ms  p(95)=12.03s   p(99.9)=29.66s  
       { expected_response:true }...: avg=2.34s    min=20.86ms med=36.66ms  max=30.02s   p(90)=42.72ms  p(95)=12.03s   p(99.9)=29.66s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 13  
     http_req_receiving.............: avg=178.97µs min=77.74µs med=138.84µs max=341.56µs p(90)=293.25µs p(95)=318.37µs p(99.9)=341.1µs 
     http_req_sending...............: avg=24.88µs  min=17.12µs med=19.14µs  max=56.5µs   p(90)=38.22µs  p(95)=46.44µs  p(99.9)=56.3µs  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.34s    min=20.65ms med=36.39ms  max=30.02s   p(90)=42.49ms  p(95)=12.03s   p(99.9)=29.66s  
     http_reqs......................: 13     0.216664/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 914337      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 366 MB  3.0 MB/s
     http_req_blocked...............: avg=3.23µs   min=842ns   med=1.99µs   max=14.04ms  p(90)=3.62µs  p(95)=4.4µs   p(99.9)=28.21µs
     http_req_connecting............: avg=660ns    min=0s      med=0s       max=7.31ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.46ms  min=1.46ms  med=18.62ms  max=278.35ms p(90)=27.95ms p(95)=31.45ms p(99.9)=51.84ms
       { expected_response:true }...: avg=19.46ms  min=1.46ms  med=18.62ms  max=278.35ms p(90)=27.95ms p(95)=31.45ms p(99.9)=51.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 304879
     http_req_receiving.............: avg=753.42µs min=51.27µs med=115.71µs max=42.55ms  p(90)=1.93ms  p(95)=2.87ms  p(99.9)=19.88ms
     http_req_sending...............: avg=52.53µs  min=4.56µs  med=8.53µs   max=164.17ms p(90)=18µs    p(95)=87.28µs p(99.9)=4.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.65ms  min=1.36ms  med=17.82ms  max=186.08ms p(90)=27.03ms p(95)=30.45ms p(99.9)=50.06ms
     http_reqs......................: 304879  2536.631369/s
     iteration_duration.............: avg=19.67ms  min=2.81ms  med=18.82ms  max=294.3ms  p(90)=28.16ms p(95)=31.68ms p(99.9)=52.56ms
     iterations.....................: 304779  2535.799357/s
     success_rate...................: 100.00% ✓ 304779      ✗ 0     
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

     checks.........................: 100.00% ✓ 892182      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=2.88µs  min=932ns   med=2.14µs  max=16.2ms   p(90)=3.6µs   p(95)=4.3µs    p(99.9)=35.06µs
     http_req_connecting............: avg=292ns   min=0s      med=0s      max=3.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.95ms min=1.83ms  med=19.59ms max=273.6ms  p(90)=28ms    p(95)=30.5ms   p(99.9)=48.84ms
       { expected_response:true }...: avg=19.95ms min=1.83ms  med=19.59ms max=273.6ms  p(90)=28ms    p(95)=30.5ms   p(99.9)=48.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297494
     http_req_receiving.............: avg=86.05µs min=25.18µs med=49.97µs max=45.43ms  p(90)=89.16µs p(95)=122.51µs p(99.9)=6.22ms 
     http_req_sending...............: avg=40.47µs min=4.89µs  med=9.22µs  max=92.54ms  p(90)=16.2µs  p(95)=54.24µs  p(99.9)=2.98ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.83ms min=1.78ms  med=19.47ms max=273.06ms p(90)=27.86ms p(95)=30.32ms  p(99.9)=47.54ms
     http_reqs......................: 297494  2474.419579/s
     iteration_duration.............: avg=20.16ms min=3.04ms  med=19.78ms max=301.94ms p(90)=28.21ms p(95)=30.72ms  p(99.9)=49.33ms
     iterations.....................: 297394  2473.587825/s
     success_rate...................: 100.00% ✓ 297394      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 889029      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=2.8µs    min=802ns   med=1.94µs  max=17.9ms   p(90)=3.39µs  p(95)=4.1µs   p(99.9)=32.21µs 
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.02ms  min=1.55ms  med=16.7ms  max=379.76ms p(90)=32.87ms p(95)=40.5ms  p(99.9)=149.49ms
       { expected_response:true }...: avg=20.02ms  min=1.55ms  med=16.7ms  max=379.76ms p(90)=32.87ms p(95)=40.5ms  p(99.9)=149.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296443
     http_req_receiving.............: avg=567.16µs min=51.07µs med=94.37µs max=295.06ms p(90)=1.07ms  p(95)=1.84ms  p(99.9)=27.33ms 
     http_req_sending...............: avg=41.24µs  min=4.56µs  med=8.37µs  max=201.71ms p(90)=16.87µs p(95)=75.35µs p(99.9)=3.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.41ms  min=1.43ms  med=16.19ms max=379.68ms p(90)=31.85ms p(95)=39.4ms  p(99.9)=147.48ms
     http_reqs......................: 296443  2466.230903/s
     iteration_duration.............: avg=20.23ms  min=2.67ms  med=16.9ms  max=379.93ms p(90)=33.08ms p(95)=40.73ms p(99.9)=150.51ms
     iterations.....................: 296343  2465.398962/s
     success_rate...................: 100.00% ✓ 296343      ✗ 0     
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

     checks.........................: 100.00% ✓ 827163      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 331 MB  2.8 MB/s
     http_req_blocked...............: avg=2.79µs   min=892ns   med=2.04µs  max=15.17ms  p(90)=3.58µs  p(95)=4.29µs  p(99.9)=31.16µs 
     http_req_connecting............: avg=279ns    min=0s      med=0s      max=3.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.53ms  min=1.61ms  med=17.87ms max=335.06ms p(90)=35.47ms p(95)=43.65ms p(99.9)=159.7ms 
       { expected_response:true }...: avg=21.53ms  min=1.61ms  med=17.87ms max=335.06ms p(90)=35.47ms p(95)=43.65ms p(99.9)=159.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 275821
     http_req_receiving.............: avg=615.96µs min=51.79µs med=99.78µs max=164.45ms p(90)=1.16ms  p(95)=1.95ms  p(99.9)=28.61ms 
     http_req_sending...............: avg=39.22µs  min=4.49µs  med=8.79µs  max=128.57ms p(90)=17.95µs p(95)=47.45µs p(99.9)=2.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.87ms  min=1.51ms  med=17.3ms  max=334.97ms p(90)=34.42ms p(95)=42.4ms  p(99.9)=157.99ms
     http_reqs......................: 275821  2294.409387/s
     iteration_duration.............: avg=21.75ms  min=2.69ms  med=18.07ms max=335.24ms p(90)=35.69ms p(95)=43.88ms p(99.9)=161.76ms
     iterations.....................: 275721  2293.57754/s
     success_rate...................: 100.00% ✓ 275721      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 814356      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 326 MB  2.7 MB/s
     http_req_blocked...............: avg=2.98µs   min=912ns   med=2.17µs  max=7.05ms   p(90)=3.9µs   p(95)=4.67µs  p(99.9)=37.42µs 
     http_req_connecting............: avg=325ns    min=0s      med=0s      max=4ms      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.87ms  min=1.96ms  med=18.58ms max=337.03ms p(90)=35.25ms p(95)=43.13ms p(99.9)=149.16ms
       { expected_response:true }...: avg=21.87ms  min=1.96ms  med=18.58ms max=337.03ms p(90)=35.25ms p(95)=43.13ms p(99.9)=149.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 271552
     http_req_receiving.............: avg=604.14µs min=52.68µs med=98.86µs max=275.45ms p(90)=1.11ms  p(95)=1.92ms  p(99.9)=29.4ms  
     http_req_sending...............: avg=40.17µs  min=4.76µs  med=9.26µs  max=63.77ms  p(90)=19.01µs p(95)=80.03µs p(99.9)=2.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.22ms  min=1.87ms  med=18.03ms max=298.06ms p(90)=34.22ms p(95)=41.96ms p(99.9)=144.16ms
     http_reqs......................: 271552  2258.250357/s
     iteration_duration.............: avg=22.09ms  min=3.18ms  med=18.79ms max=354.84ms p(90)=35.47ms p(95)=43.36ms p(99.9)=149.93ms
     iterations.....................: 271452  2257.418748/s
     success_rate...................: 100.00% ✓ 271452      ✗ 0     
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

     checks.........................: 100.00% ✓ 591423      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 237 MB  2.0 MB/s
     http_req_blocked...............: avg=3.29µs  min=822ns   med=2.15µs  max=9.29ms   p(90)=4.32µs   p(95)=5.44µs   p(99.9)=41µs   
     http_req_connecting............: avg=462ns   min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.18ms min=2.21ms  med=29.7ms  max=293.75ms p(90)=39.82ms  p(95)=43.3ms   p(99.9)=63.16ms
       { expected_response:true }...: avg=30.18ms min=2.21ms  med=29.7ms  max=293.75ms p(90)=39.82ms  p(95)=43.3ms   p(99.9)=63.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 197241
     http_req_receiving.............: avg=92.56µs min=26.64µs med=54.49µs max=217.61ms p(90)=124.33µs p(95)=199.03µs p(99.9)=3.67ms 
     http_req_sending...............: avg=37.49µs min=4.57µs  med=9.15µs  max=80.74ms  p(90)=23.46µs  p(95)=101.45µs p(99.9)=2.75ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.05ms min=2.14ms  med=29.58ms max=285.81ms p(90)=39.67ms  p(95)=43.12ms  p(99.9)=62.56ms
     http_reqs......................: 197241  1639.887147/s
     iteration_duration.............: avg=30.42ms min=7.06ms  med=29.92ms max=349.46ms p(90)=40.04ms  p(95)=43.51ms  p(99.9)=63.56ms
     iterations.....................: 197141  1639.055734/s
     success_rate...................: 100.00% ✓ 197141      ✗ 0     
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

     checks.........................: 100.00% ✓ 446823      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.35µs  min=942ns   med=2.39µs  max=4.08ms   p(90)=4.09µs   p(95)=4.8µs    p(99.9)=35.35µs 
     http_req_connecting............: avg=604ns   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.03ms min=2.06ms  med=39.65ms max=302.6ms  p(90)=55.51ms  p(95)=60.26ms  p(99.9)=83.05ms 
       { expected_response:true }...: avg=40.03ms min=2.06ms  med=39.65ms max=302.6ms  p(90)=55.51ms  p(95)=60.26ms  p(99.9)=83.05ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149041
     http_req_receiving.............: avg=79.24µs min=26.59µs med=64.31µs max=124.68ms p(90)=103.83µs p(95)=120.01µs p(99.9)=920.01µs
     http_req_sending...............: avg=24.31µs min=4.93µs  med=11.4µs  max=76.94ms  p(90)=18.85µs  p(95)=22.49µs  p(99.9)=998.42µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.93ms min=1.94ms  med=39.55ms max=302.26ms p(90)=55.41ms  p(95)=60.15ms  p(99.9)=82.87ms 
     http_reqs......................: 149041  1238.983667/s
     iteration_duration.............: avg=40.27ms min=3.87ms  med=39.87ms max=316.63ms p(90)=55.72ms  p(95)=60.47ms  p(99.9)=83.37ms 
     iterations.....................: 148941  1238.152363/s
     success_rate...................: 100.00% ✓ 148941      ✗ 0     
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

     checks.........................: 100.00% ✓ 215097     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   716 kB/s
     http_req_blocked...............: avg=4.41µs  min=1.08µs  med=2.69µs  max=4.14ms   p(90)=4.25µs   p(95)=4.91µs   p(99.9)=51.89µs 
     http_req_connecting............: avg=1.45µs  min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.34ms min=3.89ms  med=81.35ms max=326.68ms p(90)=104.01ms p(95)=114.86ms p(99.9)=200.43ms
       { expected_response:true }...: avg=83.34ms min=3.89ms  med=81.35ms max=326.68ms p(90)=104.01ms p(95)=114.86ms p(99.9)=200.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71799
     http_req_receiving.............: avg=81.35µs min=27.66µs med=71.87µs max=63.17ms  p(90)=108.87µs p(95)=121.74µs p(99.9)=612.76µs
     http_req_sending...............: avg=21.33µs min=4.97µs  med=13.26µs max=102.8ms  p(90)=20.15µs  p(95)=22.35µs  p(99.9)=563.62µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.24ms min=3.8ms   med=81.25ms max=326.33ms p(90)=103.91ms p(95)=114.74ms p(99.9)=199.99ms
     http_reqs......................: 71799   595.703211/s
     iteration_duration.............: avg=83.69ms min=23.59ms med=81.59ms max=336.52ms p(90)=104.25ms p(95)=115.16ms p(99.9)=202.55ms
     iterations.....................: 71699   594.873529/s
     success_rate...................: 100.00% ✓ 71699      ✗ 0    
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

     checks.........................: 100.00% ✓ 160119     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   532 kB/s
     http_req_blocked...............: avg=5.21µs   min=1.13µs  med=3.1µs    max=4.11ms   p(90)=4.55µs   p(95)=5.08µs   p(99.9)=135.41µs
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.95ms min=5.06ms  med=110.08ms max=327.96ms p(90)=147.66ms p(95)=158.47ms p(99.9)=203.1ms 
       { expected_response:true }...: avg=111.95ms min=5.06ms  med=110.08ms max=327.96ms p(90)=147.66ms p(95)=158.47ms p(99.9)=203.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 53473
     http_req_receiving.............: avg=87.15µs  min=27.22µs med=81.5µs   max=116.41ms p(90)=110.85µs p(95)=122.82µs p(99.9)=518.06µs
     http_req_sending...............: avg=29.17µs  min=4.93µs  med=17.17µs  max=186.27ms p(90)=22.47µs  p(95)=24.31µs  p(99.9)=545.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.84ms min=4.95ms  med=109.97ms max=327.35ms p(90)=147.55ms p(95)=158.34ms p(99.9)=202.82ms
     http_reqs......................: 53473   443.183853/s
     iteration_duration.............: avg=112.44ms min=21.6ms  med=110.4ms  max=334.44ms p(90)=147.99ms p(95)=158.78ms p(99.9)=205.77ms
     iterations.....................: 53373   442.355054/s
     success_rate...................: 100.00% ✓ 53373      ✗ 0    
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

     checks.........................: 100.00% ✓ 96375      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.42µs   min=1.09µs  med=3.52µs   max=3.56ms   p(90)=5.02µs   p(95)=5.71µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=186.03ms min=6.34ms  med=169.85ms max=656.3ms  p(90)=219.12ms p(95)=271.31ms p(99.9)=563.04ms
       { expected_response:true }...: avg=186.03ms min=6.34ms  med=169.85ms max=656.3ms  p(90)=219.12ms p(95)=271.31ms p(99.9)=563.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32225
     http_req_receiving.............: avg=102.27µs min=32.51µs med=91.37µs  max=131.45ms p(90)=122.16µs p(95)=133.82µs p(99.9)=780.37µs
     http_req_sending...............: avg=34.59µs  min=5.83µs  med=18.63µs  max=121.58ms p(90)=23.65µs  p(95)=25.55µs  p(99.9)=526.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.89ms min=6.18ms  med=169.75ms max=656.22ms p(90)=218.91ms p(95)=270.91ms p(99.9)=562.92ms
     http_reqs......................: 32225   266.55727/s
     iteration_duration.............: avg=186.88ms min=36.72ms med=170.22ms max=656.48ms p(90)=219.55ms p(95)=272.99ms p(99.9)=563.43ms
     iterations.....................: 32125   265.730095/s
     success_rate...................: 100.00% ✓ 32125      ✗ 0    
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

     checks.........................: 100.00% ✓ 95805      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.22µs  med=3.57µs   max=2.53ms   p(90)=4.98µs   p(95)=5.58µs   p(99.9)=561.14µs
     http_req_connecting............: avg=1.52µs   min=0s      med=0s       max=2.49ms   p(90)=0s       p(95)=0s       p(99.9)=537.02µs
     http_req_duration..............: avg=187.15ms min=7.93ms  med=186.97ms max=375.59ms p(90)=226.62ms p(95)=233.83ms p(99.9)=299.23ms
       { expected_response:true }...: avg=187.15ms min=7.93ms  med=186.97ms max=375.59ms p(90)=226.62ms p(95)=233.83ms p(99.9)=299.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32035
     http_req_receiving.............: avg=91.23µs  min=32.93µs med=86.66µs  max=30.59ms  p(90)=116.88µs p(95)=128.06µs p(99.9)=629.27µs
     http_req_sending...............: avg=23.53µs  min=5.83µs  med=17.6µs   max=28.87ms  p(90)=22.37µs  p(95)=24.22µs  p(99.9)=527.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.04ms min=7.78ms  med=186.87ms max=375.37ms p(90)=226.52ms p(95)=233.75ms p(99.9)=299.12ms
     http_reqs......................: 32035   264.750724/s
     iteration_duration.............: avg=187.99ms min=63.09ms med=187.84ms max=390.3ms  p(90)=226.91ms p(95)=234.19ms p(99.9)=299.68ms
     iterations.....................: 31935   263.924282/s
     success_rate...................: 100.00% ✓ 31935      ✗ 0    
     vus............................: 5       min=5        max=50 
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

     checks.........................: 100.00% ✓ 8529      ✗ 0   
     data_received..................: 282 MB  2.2 MB/s
     data_sent......................: 3.5 MB  28 kB/s
     http_req_blocked...............: avg=96.52µs min=1.04µs   med=3.27µs  max=9.29ms  p(90)=4.73µs   p(95)=5.51µs   p(99.9)=7.83ms  
     http_req_connecting............: avg=90.72µs min=0s       med=0s      max=9.25ms  p(90)=0s       p(95)=0s       p(99.9)=7.8ms   
     http_req_duration..............: avg=2.05s   min=27.39ms  med=2.11s   max=4.05s   p(90)=2.74s    p(95)=2.91s    p(99.9)=3.61s   
       { expected_response:true }...: avg=2.05s   min=27.39ms  med=2.11s   max=4.05s   p(90)=2.74s    p(95)=2.91s    p(99.9)=3.61s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2943
     http_req_receiving.............: avg=99.47µs min=30.63µs  med=94.34µs max=1.05ms  p(90)=138.71µs p(95)=154.43µs p(99.9)=411.99µs
     http_req_sending...............: avg=65.55µs min=5.89µs   med=18.53µs max=33.11ms p(90)=23.64µs  p(95)=27.27µs  p(99.9)=3.5ms   
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.05s   min=27.3ms   med=2.11s   max=4.05s   p(90)=2.74s    p(95)=2.91s    p(99.9)=3.61s   
     http_reqs......................: 2943    23.4447/s
     iteration_duration.............: avg=2.12s   min=389.38ms med=2.13s   max=4.05s   p(90)=2.75s    p(95)=2.93s    p(99.9)=3.61s   
     iterations.....................: 2843    22.648074/s
     success_rate...................: 100.00% ✓ 2843      ✗ 0   
     vus............................: 34      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

