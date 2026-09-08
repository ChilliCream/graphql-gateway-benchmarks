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
| hive-router | v0.0.84 | 3,051 | 3,251 | 3,000 | 2.7% |  |
| fusion-nightly-net11 | 16.7.0-p.4 | 2,701 | 2,843 | 2,626 | 2.4% |  |
| fusion | 16.6.4 | 2,634 | 2,774 | 2,626 | 1.9% |  |
| fusion-nightly | 16.7.0-p.4 | 2,619 | 2,760 | 2,596 | 2.1% |  |
| fusion-nightly-fed | 16.7.0-p.4 | 2,512 | 2,570 | 2,500 | 0.8% |  |
| grafbase | 0.53.5 | 2,142 | 2,264 | 2,133 | 2.2% |  |
| cosmo | 0.334.0 | 1,281 | 1,328 | 1,270 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 613 | 634 | 611 | 1.3% |  |
| apollo-router | v2.16.1 | 444 | 467 | 440 | 2.1% |  |
| hive-gateway | 2.10.8 | 284 | 291 | 283 | 1.1% |  |
| apollo-gateway | 2.14.3 | 283 | 286 | 282 | 0.4% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% | non-compatible response (137 across 1/2 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.4 | 2,579 | 2,679 | 2,576 | 1.4% |  |
| fusion | 16.6.4 | 2,394 | 2,524 | 2,381 | 2.1% |  |
| fusion-nightly | 16.7.0-p.4 | 2,384 | 2,499 | 2,372 | 1.8% |  |
| hive-router | v0.0.84 | 2,320 | 2,523 | 2,296 | 3.4% |  |
| fusion-nightly-fed | 16.7.0-p.4 | 2,316 | 2,411 | 2,311 | 1.5% |  |
| grafbase | 0.53.5 | 1,656 | 1,714 | 1,651 | 1.3% |  |
| cosmo | 0.334.0 | 1,236 | 1,263 | 1,220 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 572 | 595 | 571 | 1.4% |  |
| apollo-router | v2.16.1 | 406 | 426 | 403 | 1.8% |  |
| apollo-gateway | 2.14.3 | 272 | 276 | 272 | 0.6% |  |
| hive-gateway | 2.10.8 | 263 | 270 | 261 | 1.2% |  |
| feddi | 5ff8b6165878 | 23 | 23 | 22 | 2.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1100064     ✗ 0     
     data_received..................: 32 GB   268 MB/s
     data_sent......................: 441 MB  3.7 MB/s
     http_req_blocked...............: avg=3.39µs  min=982ns   med=2.51µs  max=26.14ms  p(90)=3.93µs  p(95)=4.59µs   p(99.9)=36.91µs
     http_req_connecting............: avg=257ns   min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.14ms min=1.51ms  med=15.43ms max=281.77ms p(90)=23.67ms p(95)=26.94ms  p(99.9)=47.31ms
       { expected_response:true }...: avg=16.14ms min=1.51ms  med=15.43ms max=281.77ms p(90)=23.67ms p(95)=26.94ms  p(99.9)=47.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 366788
     http_req_receiving.............: avg=92.97µs min=25.08µs med=47.25µs max=188.97ms p(90)=88.47µs p(95)=175.04µs p(99.9)=7.37ms 
     http_req_sending...............: avg=49.96µs min=4.62µs  med=9.23µs  max=197.49ms p(90)=16.45µs p(95)=103.73µs p(99.9)=5.66ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16ms    min=1.44ms  med=15.31ms max=267.1ms  p(90)=23.5ms  p(95)=26.68ms  p(99.9)=46.24ms
     http_reqs......................: 366788  3051.622333/s
     iteration_duration.............: avg=16.35ms min=2.04ms  med=15.63ms max=292.95ms p(90)=23.88ms p(95)=27.18ms  p(99.9)=48.06ms
     iterations.....................: 366688  3050.790348/s
     success_rate...................: 100.00% ✓ 366688      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 974289      ✗ 0     
     data_received..................: 29 GB   237 MB/s
     data_sent......................: 390 MB  3.2 MB/s
     http_req_blocked...............: avg=2.57µs   min=862ns   med=1.86µs  max=16.95ms  p(90)=3.19µs  p(95)=3.86µs  p(99.9)=30.02µs
     http_req_connecting............: avg=262ns    min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.25ms  min=1.92ms  med=17.39ms max=293.95ms p(90)=26.34ms p(95)=29.81ms p(99.9)=50.5ms 
       { expected_response:true }...: avg=18.25ms  min=1.92ms  med=17.39ms max=293.95ms p(90)=26.34ms p(95)=29.81ms p(99.9)=50.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 324863
     http_req_receiving.............: avg=465.88µs min=50.64µs med=91.37µs max=38.45ms  p(90)=1.14ms  p(95)=1.77ms  p(99.9)=17.81ms
     http_req_sending...............: avg=43.09µs  min=4.32µs  med=8.14µs  max=213.99ms p(90)=15.22µs p(95)=80.02µs p(99.9)=3.94ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.74ms  min=1.82ms  med=16.89ms max=293.45ms p(90)=25.7ms  p(95)=29.13ms p(99.9)=49.25ms
     http_reqs......................: 324863  2701.946513/s
     iteration_duration.............: avg=18.46ms  min=3.05ms  med=17.59ms max=301.96ms p(90)=26.55ms p(95)=30.05ms p(99.9)=50.94ms
     iterations.....................: 324763  2701.114794/s
     success_rate...................: 100.00% ✓ 324763      ✗ 0     
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

     checks.........................: 100.00% ✓ 950367      ✗ 0     
     data_received..................: 28 GB   231 MB/s
     data_sent......................: 381 MB  3.2 MB/s
     http_req_blocked...............: avg=2.76µs   min=902ns   med=1.94µs  max=15.9ms   p(90)=3.19µs  p(95)=3.8µs   p(99.9)=30.85µs 
     http_req_connecting............: avg=308ns    min=0s      med=0s      max=4.14ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.72ms  min=1.99ms  med=16.17ms max=366.85ms p(90)=30.27ms p(95)=36.54ms p(99.9)=115.37ms
       { expected_response:true }...: avg=18.72ms  min=1.99ms  med=16.17ms max=366.85ms p(90)=30.27ms p(95)=36.54ms p(99.9)=115.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 316889
     http_req_receiving.............: avg=554.32µs min=49.95µs med=88.71µs max=195.02ms p(90)=1.06ms  p(95)=1.94ms  p(99.9)=24.93ms 
     http_req_sending...............: avg=44.29µs  min=4.76µs  med=8.35µs  max=154.03ms p(90)=14.98µs p(95)=84.17µs p(99.9)=5.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.12ms  min=1.9ms   med=15.64ms max=365.94ms p(90)=29.34ms p(95)=35.5ms  p(99.9)=113.28ms
     http_reqs......................: 316889  2634.971642/s
     iteration_duration.............: avg=18.93ms  min=3.1ms   med=16.36ms max=367.04ms p(90)=30.5ms  p(95)=36.77ms p(99.9)=116.36ms
     iterations.....................: 316789  2634.140129/s
     success_rate...................: 100.00% ✓ 316789      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 944631      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 379 MB  3.1 MB/s
     http_req_blocked...............: avg=2.64µs   min=941ns   med=1.96µs  max=16.1ms   p(90)=3.19µs  p(95)=3.8µs   p(99.9)=26.33µs 
     http_req_connecting............: avg=267ns    min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.83ms  min=1.94ms  med=16.25ms max=282.53ms p(90)=30.38ms p(95)=36.73ms p(99.9)=121.85ms
       { expected_response:true }...: avg=18.83ms  min=1.94ms  med=16.25ms max=282.53ms p(90)=30.38ms p(95)=36.73ms p(99.9)=121.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 314977
     http_req_receiving.............: avg=540.28µs min=51.42µs med=90.89µs max=175.1ms  p(90)=1.03ms  p(95)=1.86ms  p(99.9)=23.93ms 
     http_req_sending...............: avg=43.28µs  min=4.65µs  med=8.35µs  max=167.88ms p(90)=14.85µs p(95)=83.34µs p(99.9)=4.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.25ms  min=1.81ms  med=15.74ms max=282.38ms p(90)=29.48ms p(95)=35.75ms p(99.9)=119.32ms
     http_reqs......................: 314977  2619.308868/s
     iteration_duration.............: avg=19.04ms  min=3.01ms  med=16.44ms max=298.93ms p(90)=30.6ms  p(95)=36.97ms p(99.9)=122.51ms
     iterations.....................: 314877  2618.477281/s
     success_rate...................: 100.00% ✓ 314877      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 905886      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=2.62µs   min=892ns   med=1.93µs  max=12.52ms  p(90)=3.11µs  p(95)=3.7µs   p(99.9)=30.34µs 
     http_req_connecting............: avg=292ns    min=0s      med=0s      max=3.7ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.65ms  min=1.65ms  med=16.02ms max=304.08ms p(90)=33.71ms p(95)=42.28ms p(99.9)=146.24ms
       { expected_response:true }...: avg=19.65ms  min=1.65ms  med=16.02ms max=304.08ms p(90)=33.71ms p(95)=42.28ms p(99.9)=146.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 302062
     http_req_receiving.............: avg=563.95µs min=50.32µs med=89.92µs max=210.86ms p(90)=1.04ms  p(95)=1.86ms  p(99.9)=27.35ms 
     http_req_sending...............: avg=41.48µs  min=4.49µs  med=8.27µs  max=110.36ms p(90)=14.36µs p(95)=65.38µs p(99.9)=3.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.05ms  min=1.58ms  med=15.52ms max=303.63ms p(90)=32.71ms p(95)=41.13ms p(99.9)=143.9ms 
     http_reqs......................: 302062  2512.618455/s
     iteration_duration.............: avg=19.86ms  min=2.54ms  med=16.21ms max=304.21ms p(90)=33.93ms p(95)=42.51ms p(99.9)=147.11ms
     iterations.....................: 301962  2511.786633/s
     success_rate...................: 100.00% ✓ 301962      ✗ 0     
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

     checks.........................: 100.00% ✓ 772278      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.06µs  min=921ns   med=2.21µs  max=10.75ms  p(90)=3.79µs  p(95)=4.55µs   p(99.9)=36.41µs
     http_req_connecting............: avg=343ns   min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.08ms min=1.71ms  med=22.85ms max=275.09ms p(90)=27.32ms p(95)=29.04ms  p(99.9)=47.63ms
       { expected_response:true }...: avg=23.08ms min=1.71ms  med=22.85ms max=275.09ms p(90)=27.32ms p(95)=29.04ms  p(99.9)=47.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257526
     http_req_receiving.............: avg=85.75µs min=27.87µs med=54.35µs max=172.97ms p(90)=92.79µs p(95)=117.48µs p(99.9)=5.11ms 
     http_req_sending...............: avg=34.67µs min=4.81µs  med=9.85µs  max=114.14ms p(90)=17.3µs  p(95)=25.69µs  p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.96ms min=1.64ms  med=22.76ms max=274.56ms p(90)=27.2ms  p(95)=28.88ms  p(99.9)=46.48ms
     http_reqs......................: 257526  2142.079923/s
     iteration_duration.............: avg=23.29ms min=4.3ms   med=23.05ms max=316.6ms  p(90)=27.53ms p(95)=29.25ms  p(99.9)=48.12ms
     iterations.....................: 257426  2141.248132/s
     success_rate...................: 100.00% ✓ 257426      ✗ 0     
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

     checks.........................: 100.00% ✓ 462201      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.27µs  min=1.1µs   med=2.41µs  max=4.03ms   p(90)=3.79µs  p(95)=4.41µs   p(99.9)=35.74µs 
     http_req_connecting............: avg=569ns   min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.71ms min=2.03ms  med=38.27ms max=302.27ms p(90)=53.95ms p(95)=58.77ms  p(99.9)=81.36ms 
       { expected_response:true }...: avg=38.71ms min=2.03ms  med=38.27ms max=302.27ms p(90)=53.95ms p(95)=58.77ms  p(99.9)=81.36ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 154167
     http_req_receiving.............: avg=74.96µs min=27.32µs med=60.22µs max=155.21ms p(90)=95.65µs p(95)=111.28µs p(99.9)=787.6µs 
     http_req_sending...............: avg=26.65µs min=5.09µs  med=10.55µs max=192.53ms p(90)=16µs    p(95)=19.83µs  p(99.9)=866.04µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.6ms  min=1.94ms  med=38.18ms max=296.2ms  p(90)=53.86ms p(95)=58.67ms  p(99.9)=81.02ms 
     http_reqs......................: 154167  1281.866069/s
     iteration_duration.............: avg=38.93ms min=3.76ms  med=38.47ms max=311.93ms p(90)=54.16ms p(95)=58.98ms  p(99.9)=81.61ms 
     iterations.....................: 154067  1281.03459/s
     success_rate...................: 100.00% ✓ 154067      ✗ 0     
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

     checks.........................: 100.00% ✓ 221367     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   737 kB/s
     http_req_blocked...............: avg=4.47µs   min=1.15µs  med=2.9µs   max=4.33ms   p(90)=4.39µs   p(95)=5.03µs   p(99.9)=43.48µs 
     http_req_connecting............: avg=1.29µs   min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.99ms  min=3.56ms  med=80.14ms max=313.76ms p(90)=102.2ms  p(95)=112.62ms p(99.9)=189.18ms
       { expected_response:true }...: avg=80.99ms  min=3.56ms  med=80.14ms max=313.76ms p(90)=102.2ms  p(95)=112.62ms p(99.9)=189.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73889
     http_req_receiving.............: avg=136.27µs min=30.48µs med=67.37µs max=216.29ms p(90)=103.1µs  p(95)=116.17µs p(99.9)=923.09µs
     http_req_sending...............: avg=20.75µs  min=5.13µs  med=12.92µs max=60.59ms  p(90)=19.02µs  p(95)=21.48µs  p(99.9)=652.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.83ms  min=3.51ms  med=80.04ms max=216.02ms p(90)=102.04ms p(95)=112.39ms p(99.9)=185.86ms
     http_reqs......................: 73889   613.316317/s
     iteration_duration.............: avg=81.32ms  min=24.93ms med=80.38ms max=337.46ms p(90)=102.44ms p(95)=112.91ms p(99.9)=190.52ms
     iterations.....................: 73789   612.486266/s
     success_rate...................: 100.00% ✓ 73789      ✗ 0    
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

     checks.........................: 100.00% ✓ 160692     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   534 kB/s
     http_req_blocked...............: avg=5.08µs   min=1.25µs  med=3.23µs   max=3.91ms   p(90)=4.6µs    p(95)=5.17µs   p(99.9)=64.65µs 
     http_req_connecting............: avg=1.63µs   min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.59ms min=4.86ms  med=111.18ms max=332.54ms p(90)=134.97ms p(95)=141.95ms p(99.9)=177.49ms
       { expected_response:true }...: avg=111.59ms min=4.86ms  med=111.18ms max=332.54ms p(90)=134.97ms p(95)=141.95ms p(99.9)=177.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53664
     http_req_receiving.............: avg=81.23µs  min=30.95µs med=70.99µs  max=111.17ms p(90)=103.13µs p(95)=115.54µs p(99.9)=563.63µs
     http_req_sending...............: avg=25.14µs  min=5.77µs  med=15.37µs  max=133.17ms p(90)=21.13µs  p(95)=23.06µs  p(99.9)=510.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.49ms min=4.73ms  med=111.08ms max=325.32ms p(90)=134.87ms p(95)=141.83ms p(99.9)=176.39ms
     http_reqs......................: 53664   444.915053/s
     iteration_duration.............: avg=112.04ms min=23.92ms med=111.46ms max=342.64ms p(90)=135.24ms p(95)=142.2ms  p(99.9)=179.66ms
     iterations.....................: 53564   444.085977/s
     success_rate...................: 100.00% ✓ 53564      ✗ 0    
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

     checks.........................: 100.00% ✓ 102633     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   341 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.61µs  med=3.78µs   max=4.14ms   p(90)=5.25µs   p(95)=5.88µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=174.66ms min=5.5ms   med=159.28ms max=737.46ms p(90)=202.68ms p(95)=243.28ms p(99.9)=582.83ms
       { expected_response:true }...: avg=174.66ms min=5.5ms   med=159.28ms max=737.46ms p(90)=202.68ms p(95)=243.28ms p(99.9)=582.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34311
     http_req_receiving.............: avg=95.96µs  min=37.32µs med=92.3µs   max=13.76ms  p(90)=122.54µs p(95)=135.08µs p(99.9)=724.58µs
     http_req_sending...............: avg=24.42µs  min=6.75µs  med=19.09µs  max=53.35ms  p(90)=23.89µs  p(95)=25.76µs  p(99.9)=507.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.54ms min=5.42ms  med=159.16ms max=737.34ms p(90)=202.55ms p(95)=243.16ms p(99.9)=582.7ms 
     http_reqs......................: 34311   284.097384/s
     iteration_duration.............: avg=175.46ms min=24.61ms med=159.62ms max=737.75ms p(90)=203.11ms p(95)=244.34ms p(99.9)=583.2ms 
     iterations.....................: 34211   283.269377/s
     success_rate...................: 100.00% ✓ 34211      ✗ 0    
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

     checks.........................: 100.00% ✓ 102399     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.35µs  med=3.46µs   max=4.17ms   p(90)=4.8µs    p(95)=5.38µs   p(99.9)=1.37ms  
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.35ms  
     http_req_duration..............: avg=175.08ms min=7.47ms  med=175.74ms max=388.86ms p(90)=185.74ms p(95)=190.3ms  p(99.9)=262.09ms
       { expected_response:true }...: avg=175.08ms min=7.47ms  med=175.74ms max=388.86ms p(90)=185.74ms p(95)=190.3ms  p(99.9)=262.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34233
     http_req_receiving.............: avg=100.07µs min=30.52µs med=83.79µs  max=202.07ms p(90)=115.19µs p(95)=126.64µs p(99.9)=466.06µs
     http_req_sending...............: avg=38.67µs  min=5.74µs  med=16.73µs  max=166.24ms p(90)=21.34µs  p(95)=23.08µs  p(99.9)=512.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.94ms min=7.34ms  med=175.63ms max=388.68ms p(90)=185.62ms p(95)=190.18ms p(99.9)=260.65ms
     http_reqs......................: 34233   283.105725/s
     iteration_duration.............: avg=175.86ms min=25.64ms med=176.12ms max=415.61ms p(90)=186.01ms p(95)=190.57ms p(99.9)=266.91ms
     iterations.....................: 34133   282.278729/s
     success_rate...................: 100.00% ✓ 34133      ✗ 0    
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
data_received..................: 3.1 MB 51 kB/s
     data_sent......................: 40 kB  659 B/s
     http_req_blocked...............: avg=8.99µs   min=2.53µs   med=3.41µs  max=170.22µs p(90)=6.04µs   p(95)=9µs      p(99.9)=165.27µs
     http_req_connecting............: avg=2.99µs   min=0s       med=0s      max=95.8µs   p(90)=0s       p(95)=0s       p(99.9)=92.83µs 
     http_req_duration..............: avg=969.86ms min=22.13ms  med=32.88ms max=30.04s   p(90)=40.5ms   p(95)=43.71ms  p(99.9)=29.11s  
       { expected_response:true }...: avg=969.86ms min=22.13ms  med=32.88ms max=30.04s   p(90)=40.5ms   p(95)=43.71ms  p(99.9)=29.11s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 32  
     http_req_receiving.............: avg=154.33µs min=102.52µs med=130.3µs max=312.47µs p(90)=270.25µs p(95)=288.41µs p(99.9)=312.31µs
     http_req_sending...............: avg=20.68µs  min=13.9µs   med=18.63µs max=42.93µs  p(90)=30.56µs  p(95)=38.91µs  p(99.9)=42.9µs  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=969.69ms min=21.85ms  med=32.71ms max=30.04s   p(90)=40.36ms  p(95)=43.45ms  p(99.9)=29.11s  
     http_reqs......................: 32     0.533328/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 929964      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.78µs   min=871ns   med=1.97µs  max=15.67ms  p(90)=3.51µs  p(95)=4.27µs  p(99.9)=29.76µs
     http_req_connecting............: avg=272ns    min=0s      med=0s      max=3.36ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.13ms  min=1.51ms  med=18.33ms max=288.4ms  p(90)=27.56ms p(95)=31ms    p(99.9)=52.02ms
       { expected_response:true }...: avg=19.13ms  min=1.51ms  med=18.33ms max=288.4ms  p(90)=27.56ms p(95)=31ms    p(99.9)=52.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310088
     http_req_receiving.............: avg=520.51µs min=51.27µs med=96.72µs max=151.21ms p(90)=1.32ms  p(95)=2.07ms  p(99.9)=17.38ms
     http_req_sending...............: avg=41.94µs  min=4.65µs  med=8.65µs  max=187.28ms p(90)=17.57µs p(95)=82.85µs p(99.9)=3.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.57ms  min=1.44ms  med=17.77ms max=287.61ms p(90)=26.89ms p(95)=30.29ms p(99.9)=50.2ms 
     http_reqs......................: 310088  2579.813908/s
     iteration_duration.............: avg=19.34ms  min=2.52ms  med=18.53ms max=300.43ms p(90)=27.77ms p(95)=31.23ms p(99.9)=52.57ms
     iterations.....................: 309988  2578.981946/s
     success_rate...................: 100.00% ✓ 309988      ✗ 0     
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

     checks.........................: 100.00% ✓ 863175      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.93µs   min=922ns   med=2.04µs  max=15.16ms  p(90)=3.44µs  p(95)=4.13µs  p(99.9)=33.62µs 
     http_req_connecting............: avg=391ns    min=0s      med=0s      max=4.21ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.62ms  min=1.62ms  med=17.18ms max=404.93ms p(90)=33.81ms p(95)=41.6ms  p(99.9)=151.52ms
       { expected_response:true }...: avg=20.62ms  min=1.62ms  med=17.18ms max=404.93ms p(90)=33.81ms p(95)=41.6ms  p(99.9)=151.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287825
     http_req_receiving.............: avg=597.09µs min=51.61µs med=97.63µs max=206.8ms  p(90)=1.12ms  p(95)=1.92ms  p(99.9)=28.09ms 
     http_req_sending...............: avg=39.77µs  min=4.56µs  med=8.73µs  max=127.71ms p(90)=16.67µs p(95)=66.76µs p(99.9)=2.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.99ms  min=1.53ms  med=16.63ms max=404.68ms p(90)=32.77ms p(95)=40.39ms p(99.9)=149.65ms
     http_reqs......................: 287825  2394.447795/s
     iteration_duration.............: avg=20.84ms  min=2.43ms  med=17.38ms max=405.18ms p(90)=34.03ms p(95)=41.82ms p(99.9)=152.46ms
     iterations.....................: 287725  2393.615884/s
     success_rate...................: 100.00% ✓ 287725      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 859482      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.27µs   min=942ns  med=2.59µs  max=14.29ms  p(90)=4.05µs  p(95)=4.71µs  p(99.9)=37.15µs 
     http_req_connecting............: avg=232ns    min=0s     med=0s      max=3.18ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.71ms  min=1.57ms med=17.18ms max=450.69ms p(90)=34.18ms p(95)=42.07ms p(99.9)=157.46ms
       { expected_response:true }...: avg=20.71ms  min=1.57ms med=17.18ms max=450.69ms p(90)=34.18ms p(95)=42.07ms p(99.9)=157.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286594
     http_req_receiving.............: avg=621.63µs min=52.9µs med=99.11µs max=250.78ms p(90)=1.13ms  p(95)=2.01ms  p(99.9)=28.76ms 
     http_req_sending...............: avg=44.21µs  min=4.81µs med=9.54µs  max=118.83ms p(90)=16.65µs p(95)=86.67µs p(99.9)=3.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.05ms  min=1.47ms med=16.61ms max=450.47ms p(90)=33.08ms p(95)=40.79ms p(99.9)=155.06ms
     http_reqs......................: 286594  2384.029663/s
     iteration_duration.............: avg=20.93ms  min=2.65ms med=17.39ms max=450.92ms p(90)=34.41ms p(95)=42.33ms p(99.9)=158.15ms
     iterations.....................: 286494  2383.197814/s
     success_rate...................: 100.00% ✓ 286494      ✗ 0     
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

     checks.........................: 100.00% ✓ 836595      ✗ 0     
     data_received..................: 24 GB   203 MB/s
     data_sent......................: 335 MB  2.8 MB/s
     http_req_blocked...............: avg=2.82µs  min=912ns   med=2.14µs  max=3.52ms   p(90)=3.65µs  p(95)=4.4µs    p(99.9)=30.29µs
     http_req_connecting............: avg=306ns   min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.3ms  min=1.87ms  med=21.07ms max=308.54ms p(90)=29.54ms p(95)=31.8ms   p(99.9)=48.76ms
       { expected_response:true }...: avg=21.3ms  min=1.87ms  med=21.07ms max=308.54ms p(90)=29.54ms p(95)=31.8ms   p(99.9)=48.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 278965
     http_req_receiving.............: avg=80.47µs min=25.19µs med=50.37µs max=159.1ms  p(90)=89.66µs p(95)=116.95µs p(99.9)=4.73ms 
     http_req_sending...............: avg=34.83µs min=4.45µs  med=9.1µs   max=138.4ms  p(90)=16.38µs p(95)=28.31µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.18ms min=1.78ms  med=20.97ms max=308ms    p(90)=29.42ms p(95)=31.66ms  p(99.9)=47.25ms
     http_reqs......................: 278965  2320.072257/s
     iteration_duration.............: avg=21.5ms  min=2.98ms  med=21.26ms max=318.43ms p(90)=29.74ms p(95)=32ms     p(99.9)=49.37ms
     iterations.....................: 278865  2319.240585/s
     success_rate...................: 100.00% ✓ 278865      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 835173      ✗ 0     
     data_received..................: 24 GB   203 MB/s
     data_sent......................: 335 MB  2.8 MB/s
     http_req_blocked...............: avg=3.13µs  min=882ns   med=2.16µs  max=19.06ms  p(90)=3.73µs  p(95)=4.49µs  p(99.9)=32.58µs 
     http_req_connecting............: avg=332ns   min=0s      med=0s      max=4.18ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.32ms min=1.88ms  med=18.13ms max=322.27ms p(90)=34.68ms p(95)=42.44ms p(99.9)=149.81ms
       { expected_response:true }...: avg=21.32ms min=1.88ms  med=18.13ms max=322.27ms p(90)=34.68ms p(95)=42.44ms p(99.9)=149.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 278491
     http_req_receiving.............: avg=576.4µs min=50.24µs med=99.06µs max=214.07ms p(90)=1.1ms   p(95)=1.9ms   p(99.9)=27.75ms 
     http_req_sending...............: avg=40.15µs min=4.7µs   med=9.24µs  max=113.14ms p(90)=18.43µs p(95)=72.17µs p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.7ms  min=1.76ms  med=17.59ms max=322.19ms p(90)=33.74ms p(95)=41.29ms p(99.9)=147.97ms
     http_reqs......................: 278491  2316.082343/s
     iteration_duration.............: avg=21.54ms min=2.97ms  med=18.34ms max=322.43ms p(90)=34.9ms  p(95)=42.68ms p(99.9)=150.39ms
     iterations.....................: 278391  2315.250689/s
     success_rate...................: 100.00% ✓ 278391      ✗ 0     
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

     checks.........................: 100.00% ✓ 597225      ✗ 0     
     data_received..................: 17 GB   145 MB/s
     data_sent......................: 239 MB  2.0 MB/s
     http_req_blocked...............: avg=3.3µs   min=932ns   med=2.28µs  max=3.47ms   p(90)=4.53µs   p(95)=5.61µs   p(99.9)=46.13µs
     http_req_connecting............: avg=420ns   min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.88ms min=2.1ms   med=29.41ms max=308.81ms p(90)=39.21ms  p(95)=42.53ms  p(99.9)=64.15ms
       { expected_response:true }...: avg=29.88ms min=2.1ms   med=29.41ms max=308.81ms p(90)=39.21ms  p(95)=42.53ms  p(99.9)=64.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 199175
     http_req_receiving.............: avg=95.99µs min=28.49µs med=56.64µs max=128.32ms p(90)=126.23µs p(95)=198.05µs p(99.9)=3.61ms 
     http_req_sending...............: avg=40.23µs min=5.04µs  med=9.77µs  max=137.6ms  p(90)=24.87µs  p(95)=104.78µs p(99.9)=2.68ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.75ms min=2.03ms  med=29.28ms max=278.85ms p(90)=39.06ms  p(95)=42.36ms  p(99.9)=63.48ms
     http_reqs......................: 199175  1656.003479/s
     iteration_duration.............: avg=30.12ms min=4.92ms  med=29.62ms max=318.83ms p(90)=39.43ms  p(95)=42.75ms  p(99.9)=64.47ms
     iterations.....................: 199075  1655.172048/s
     success_rate...................: 100.00% ✓ 199075      ✗ 0     
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

     checks.........................: 100.00% ✓ 445857      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.96µs  min=1.17µs  med=3.02µs  max=4.26ms   p(90)=4.61µs   p(95)=5.29µs   p(99.9)=37.64µs 
     http_req_connecting............: avg=641ns   min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.11ms min=2.07ms  med=39.73ms max=299.55ms p(90)=55.75ms  p(95)=60.69ms  p(99.9)=83.77ms 
       { expected_response:true }...: avg=40.11ms min=2.07ms  med=39.73ms max=299.55ms p(90)=55.75ms  p(95)=60.69ms  p(99.9)=83.77ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148719
     http_req_receiving.............: avg=79.01µs min=27.67µs med=63.94µs max=138.85ms p(90)=102.03µs p(95)=118.71µs p(99.9)=996.74µs
     http_req_sending...............: avg=28.22µs min=4.98µs  med=12.17µs max=187.02ms p(90)=18.73µs  p(95)=22.74µs  p(99.9)=1.1ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40ms    min=1.99ms  med=39.62ms max=299.23ms p(90)=55.65ms  p(95)=60.58ms  p(99.9)=83.46ms 
     http_reqs......................: 148719  1236.423029/s
     iteration_duration.............: avg=40.36ms min=3.99ms  med=39.95ms max=311.47ms p(90)=55.97ms  p(95)=60.91ms  p(99.9)=84.39ms 
     iterations.....................: 148619  1235.591647/s
     success_rate...................: 100.00% ✓ 148619      ✗ 0     
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

     checks.........................: 100.00% ✓ 206748     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   688 kB/s
     http_req_blocked...............: avg=4.81µs  min=1.26µs  med=3.18µs  max=4.25ms   p(90)=4.66µs   p(95)=5.33µs   p(99.9)=49.79µs 
     http_req_connecting............: avg=1.34µs  min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.7ms  min=4.13ms  med=84.66ms max=340.07ms p(90)=105.48ms p(95)=115.34ms p(99.9)=207.55ms
       { expected_response:true }...: avg=86.7ms  min=4.13ms  med=84.66ms max=340.07ms p(90)=105.48ms p(95)=115.34ms p(99.9)=207.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69016
     http_req_receiving.............: avg=87µs    min=32.45µs med=75.81µs max=106.22ms p(90)=111.02µs p(95)=124.29µs p(99.9)=655.48µs
     http_req_sending...............: avg=29.14µs min=5.74µs  med=14.95µs max=126ms    p(90)=21.72µs  p(95)=23.98µs  p(99.9)=620.12µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.58ms min=4.02ms  med=84.55ms max=339.92ms p(90)=105.35ms p(95)=115.15ms p(99.9)=207.29ms
     http_reqs......................: 69016   572.544679/s
     iteration_duration.............: avg=87.07ms min=17.36ms med=84.9ms  max=349.83ms p(90)=105.75ms p(95)=115.63ms p(99.9)=208.76ms
     iterations.....................: 68916   571.715097/s
     success_rate...................: 100.00% ✓ 68916      ✗ 0    
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

     checks.........................: 100.00% ✓ 146760     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   488 kB/s
     http_req_blocked...............: avg=5.65µs   min=1.47µs  med=3.54µs   max=4.12ms   p(90)=4.97µs   p(95)=5.54µs   p(99.9)=162.22µs
     http_req_connecting............: avg=1.85µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=84.23µs 
     http_req_duration..............: avg=122.16ms min=5.26ms  med=119.65ms max=321.07ms p(90)=161.8ms  p(95)=173.53ms p(99.9)=223.24ms
       { expected_response:true }...: avg=122.16ms min=5.26ms  med=119.65ms max=321.07ms p(90)=161.8ms  p(95)=173.53ms p(99.9)=223.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49020
     http_req_receiving.............: avg=88.65µs  min=30.88µs med=84.48µs  max=43.84ms  p(90)=115.19µs p(95)=126.91µs p(99.9)=563.55µs
     http_req_sending...............: avg=27.83µs  min=6.39µs  med=17.24µs  max=146.23ms p(90)=22.3µs   p(95)=24.23µs  p(99.9)=584.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.05ms min=5.12ms  med=119.53ms max=320.33ms p(90)=161.68ms p(95)=173.42ms p(99.9)=223.11ms
     http_reqs......................: 49020   406.201542/s
     iteration_duration.............: avg=122.68ms min=27.95ms med=119.98ms max=330.76ms p(90)=162.13ms p(95)=173.86ms p(99.9)=224.02ms
     iterations.....................: 48920   405.372897/s
     success_rate...................: 100.00% ✓ 48920      ✗ 0    
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

     checks.........................: 100.00% ✓ 98661     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.68µs   min=1.35µs  med=3.69µs   max=4.1ms    p(90)=5.11µs   p(95)=5.7µs    p(99.9)=1.31ms  
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=181.71ms min=7.74ms  med=183.29ms max=388.58ms p(90)=190.93ms p(95)=195.35ms p(99.9)=269.95ms
       { expected_response:true }...: avg=181.71ms min=7.74ms  med=183.29ms max=388.58ms p(90)=190.93ms p(95)=195.35ms p(99.9)=269.95ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 32987
     http_req_receiving.............: avg=95.15µs  min=34.53µs med=90.74µs  max=15.05ms  p(90)=122.07µs p(95)=134.08µs p(99.9)=614.07µs
     http_req_sending...............: avg=28.54µs  min=5.94µs  med=18.22µs  max=64.75ms  p(90)=23.14µs  p(95)=25.02µs  p(99.9)=591.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.59ms min=7.6ms   med=183.18ms max=381.3ms  p(90)=190.8ms  p(95)=195.24ms p(99.9)=269.74ms
     http_reqs......................: 32987   272.6906/s
     iteration_duration.............: avg=182.54ms min=32.84ms med=183.73ms max=396.4ms  p(90)=191.24ms p(95)=195.65ms p(99.9)=279.33ms
     iterations.....................: 32887   271.86394/s
     success_rate...................: 100.00% ✓ 32887     ✗ 0    
     vus............................: 50      min=50      max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 95547      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=6.74µs   min=1.49µs  med=3.66µs   max=3.81ms   p(90)=5.1µs    p(95)=5.73µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=2.81µs   min=0s      med=0s       max=3.76ms   p(90)=0s       p(95)=0s       p(99.9)=1.33ms  
     http_req_duration..............: avg=187.68ms min=5.75ms  med=173.25ms max=954.87ms p(90)=216.48ms p(95)=262.35ms p(99.9)=571.58ms
       { expected_response:true }...: avg=187.68ms min=5.75ms  med=173.25ms max=954.87ms p(90)=216.48ms p(95)=262.35ms p(99.9)=571.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31949
     http_req_receiving.............: avg=98.86µs  min=36.12µs med=89.85µs  max=70.89ms  p(90)=122.01µs p(95)=134.57µs p(99.9)=779.6µs 
     http_req_sending...............: avg=27.86µs  min=6.73µs  med=18.3µs   max=63.35ms  p(90)=23.15µs  p(95)=25.08µs  p(99.9)=554.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.55ms min=5.61ms  med=173.14ms max=954.79ms p(90)=216.37ms p(95)=261.94ms p(99.9)=571.46ms
     http_reqs......................: 31949   263.879625/s
     iteration_duration.............: avg=188.55ms min=25.79ms med=173.61ms max=955.08ms p(90)=216.88ms p(95)=264.94ms p(99.9)=572.22ms
     iterations.....................: 31849   263.053684/s
     success_rate...................: 100.00% ✓ 31849      ✗ 0    
     vus............................: 9       min=9        max=50 
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
     http_req_blocked...............: avg=99.51µs  min=1.66µs   med=3.86µs  max=9.04ms  p(90)=5.54µs   p(95)=6.33µs   p(99.9)=8.26ms
     http_req_connecting............: avg=92.82µs  min=0s       med=0s      max=8.99ms  p(90)=0s       p(95)=0s       p(99.9)=8.21ms
     http_req_duration..............: avg=2.06s    min=27.29ms  med=2.11s   max=3.96s   p(90)=2.73s    p(95)=2.9s     p(99.9)=3.67s 
       { expected_response:true }...: avg=2.06s    min=27.29ms  med=2.11s   max=3.96s   p(90)=2.73s    p(95)=2.9s     p(99.9)=3.67s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2939
     http_req_receiving.............: avg=119.68µs min=34.38µs  med=100.5µs max=33.85ms p(90)=142.36µs p(95)=159.38µs p(99.9)=1.32ms
     http_req_sending...............: avg=66.42µs  min=6.17µs   med=20.15µs max=25.2ms  p(90)=25.75µs  p(95)=29.07µs  p(99.9)=9.03ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.06s    min=27.15ms  med=2.11s   max=3.96s   p(90)=2.73s    p(95)=2.9s     p(99.9)=3.67s 
     http_reqs......................: 2939    23.355358/s
     iteration_duration.............: avg=2.13s    min=324.81ms med=2.13s   max=3.96s   p(90)=2.74s    p(95)=2.91s    p(99.9)=3.7s  
     iterations.....................: 2839    22.560688/s
     success_rate...................: 100.00% ✓ 2839      ✗ 0   
     vus............................: 40      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

