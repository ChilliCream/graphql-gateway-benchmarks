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
| hive-router | v0.0.84 | 2,941 | 3,141 | 2,871 | 3.1% |  |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,789 | 2,911 | 2,766 | 1.8% |  |
| fusion | 16.6.2 | 2,585 | 2,701 | 2,554 | 1.8% |  |
| fusion-nightly | 16.7.0-p.1 | 2,578 | 2,739 | 2,515 | 2.5% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,504 | 2,570 | 2,495 | 1.2% |  |
| grafbase | 0.53.5 | 2,180 | 2,294 | 2,166 | 2.0% |  |
| cosmo | 0.334.0 | 1,320 | 1,368 | 1,313 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 619 | 640 | 618 | 1.2% |  |
| apollo-router | v2.16.1 | 447 | 466 | 444 | 1.7% |  |
| hive-gateway | 2.10.8 | 286 | 294 | 285 | 1.1% |  |
| apollo-gateway | 2.14.3 | 281 | 285 | 279 | 0.6% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1135 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.1 | 2,475 | 2,595 | 2,462 | 1.9% |  |
| fusion-nightly | 16.7.0-p.1 | 2,468 | 2,589 | 2,460 | 1.8% |  |
| hive-router | v0.0.84 | 2,467 | 2,648 | 2,448 | 2.7% |  |
| fusion | 16.6.2 | 2,394 | 2,519 | 2,382 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.1 | 2,295 | 2,398 | 2,289 | 1.7% |  |
| grafbase | 0.53.5 | 1,673 | 1,722 | 1,666 | 1.1% |  |
| cosmo | 0.334.0 | 1,186 | 1,235 | 1,183 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 577 | 595 | 572 | 1.5% |  |
| apollo-router | v2.16.1 | 408 | 429 | 405 | 2.0% |  |
| apollo-gateway | 2.14.3 | 272 | 275 | 269 | 0.7% |  |
| hive-gateway | 2.10.8 | 270 | 277 | 269 | 1.0% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 19 | 3.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1060326     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 425 MB  3.5 MB/s
     http_req_blocked...............: avg=8.97µs  min=862ns   med=1.88µs  max=132.48ms p(90)=3.04µs  p(95)=3.61µs   p(99.9)=29.76µs
     http_req_connecting............: avg=6.48µs  min=0s      med=0s      max=126.48ms p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.76ms min=1.47ms  med=16.04ms max=236.13ms p(90)=24.87ms p(95)=28.05ms  p(99.9)=47.92ms
       { expected_response:true }...: avg=16.76ms min=1.47ms  med=16.04ms max=236.13ms p(90)=24.87ms p(95)=28.05ms  p(99.9)=47.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 353542
     http_req_receiving.............: avg=84.22µs min=25.43µs med=42.99µs max=96.94ms  p(90)=76.64µs p(95)=126.64µs p(99.9)=7.98ms 
     http_req_sending...............: avg=48.29µs min=4.43µs  med=7.9µs   max=121.49ms p(90)=13.58µs p(95)=80.98µs  p(99.9)=10.17ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.63ms min=1.39ms  med=15.93ms max=138.91ms p(90)=24.7ms  p(95)=27.81ms  p(99.9)=46.59ms
     http_reqs......................: 353542  2941.316688/s
     iteration_duration.............: avg=16.96ms min=2.07ms  med=16.22ms max=303.61ms p(90)=25.08ms p(95)=28.27ms  p(99.9)=48.72ms
     iterations.....................: 353442  2940.484732/s
     success_rate...................: 100.00% ✓ 353442      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1005792     ✗ 0     
     data_received..................: 29 GB   245 MB/s
     data_sent......................: 403 MB  3.4 MB/s
     http_req_blocked...............: avg=2.59µs   min=832ns   med=1.86µs  max=14.33ms  p(90)=3µs     p(95)=3.55µs  p(99.9)=27.55µs
     http_req_connecting............: avg=279ns    min=0s      med=0s      max=3.86ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.68ms  min=1.9ms   med=16.78ms max=277.92ms p(90)=25.63ms p(95)=29.23ms p(99.9)=49.44ms
       { expected_response:true }...: avg=17.68ms  min=1.9ms   med=16.78ms max=277.92ms p(90)=25.63ms p(95)=29.23ms p(99.9)=49.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 335364
     http_req_receiving.............: avg=449.83µs min=50.72µs med=85.68µs max=148.59ms p(90)=1.11ms  p(95)=1.74ms  p(99.9)=17.95ms
     http_req_sending...............: avg=43.96µs  min=4.52µs  med=7.94µs  max=169.56ms p(90)=14.1µs  p(95)=82.26µs p(99.9)=5.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.19ms  min=1.81ms  med=16.3ms  max=277.25ms p(90)=25.01ms p(95)=28.52ms p(99.9)=47.67ms
     http_reqs......................: 335364  2789.083599/s
     iteration_duration.............: avg=17.88ms  min=2.96ms  med=16.97ms max=301.69ms p(90)=25.83ms p(95)=29.46ms p(99.9)=50.25ms
     iterations.....................: 335264  2788.25194/s
     success_rate...................: 100.00% ✓ 335264      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 932304      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 374 MB  3.1 MB/s
     http_req_blocked...............: avg=2.99µs   min=952ns   med=2.34µs  max=6.84ms   p(90)=3.57µs  p(95)=4.14µs  p(99.9)=31.63µs 
     http_req_connecting............: avg=289ns    min=0s      med=0s      max=4.17ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.08ms  min=2.02ms  med=16.4ms  max=299.24ms p(90)=30.96ms p(95)=37.6ms  p(99.9)=127.68ms
       { expected_response:true }...: avg=19.08ms  min=2.02ms  med=16.4ms  max=299.24ms p(90)=30.96ms p(95)=37.6ms  p(99.9)=127.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310868
     http_req_receiving.............: avg=579.34µs min=52.23µs med=94.2µs  max=154.95ms p(90)=1.09ms  p(95)=1.97ms  p(99.9)=26.72ms 
     http_req_sending...............: avg=43.86µs  min=4.9µs   med=8.78µs  max=141.66ms p(90)=14.55µs p(95)=89.5µs  p(99.9)=3.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.46ms  min=1.88ms  med=15.85ms max=298.64ms p(90)=30.01ms p(95)=36.48ms p(99.9)=126.1ms 
     http_reqs......................: 310868  2585.055662/s
     iteration_duration.............: avg=19.29ms  min=3.03ms  med=16.59ms max=308.82ms p(90)=31.18ms p(95)=37.84ms p(99.9)=128.31ms
     iterations.....................: 310768  2584.224102/s
     success_rate...................: 100.00% ✓ 310768      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 929940      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=2.81µs   min=892ns   med=1.95µs  max=17.87ms  p(90)=3.24µs  p(95)=3.86µs  p(99.9)=29.5µs  
     http_req_connecting............: avg=311ns    min=0s      med=0s      max=4.2ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.13ms  min=2.12ms  med=16.49ms max=306.1ms  p(90)=30.92ms p(95)=37.48ms p(99.9)=122.25ms
       { expected_response:true }...: avg=19.13ms  min=2.12ms  med=16.49ms max=306.1ms  p(90)=30.92ms p(95)=37.48ms p(99.9)=122.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310080
     http_req_receiving.............: avg=542.19µs min=51.42µs med=90.39µs max=147.85ms p(90)=1.04ms  p(95)=1.85ms  p(99.9)=24.29ms 
     http_req_sending...............: avg=42.46µs  min=4.69µs  med=8.46µs  max=72.12ms  p(90)=15.14µs p(95)=81.23µs p(99.9)=3.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.55ms  min=1.96ms  med=15.97ms max=306.03ms p(90)=30.05ms p(95)=36.48ms p(99.9)=120.09ms
     http_reqs......................: 310080  2578.300035/s
     iteration_duration.............: avg=19.34ms  min=2.34ms  med=16.69ms max=306.61ms p(90)=31.15ms p(95)=37.72ms p(99.9)=123.57ms
     iterations.....................: 309980  2577.46854/s
     success_rate...................: 100.00% ✓ 309980      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 903036      ✗ 0     
     data_received..................: 27 GB   220 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=2.77µs   min=882ns   med=1.96µs  max=13.53ms  p(90)=3.17µs  p(95)=3.79µs  p(99.9)=29.33µs 
     http_req_connecting............: avg=319ns    min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.71ms  min=1.69ms  med=16.02ms max=329.35ms p(90)=34ms    p(95)=42.58ms p(99.9)=148ms   
       { expected_response:true }...: avg=19.71ms  min=1.69ms  med=16.02ms max=329.35ms p(90)=34ms    p(95)=42.58ms p(99.9)=148ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 301112
     http_req_receiving.............: avg=563.97µs min=51.45µs med=90.64µs max=235.18ms p(90)=1.03ms  p(95)=1.84ms  p(99.9)=27.72ms 
     http_req_sending...............: avg=41.75µs  min=4.73µs  med=8.42µs  max=166.51ms p(90)=14.8µs  p(95)=69.95µs p(99.9)=3.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.11ms  min=1.58ms  med=15.51ms max=329.2ms  p(90)=33.02ms p(95)=41.48ms p(99.9)=146.6ms 
     http_reqs......................: 301112  2504.498831/s
     iteration_duration.............: avg=19.92ms  min=2.46ms  med=16.21ms max=329.58ms p(90)=34.22ms p(95)=42.82ms p(99.9)=148.91ms
     iterations.....................: 301012  2503.667081/s
     success_rate...................: 100.00% ✓ 301012      ✗ 0     
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

     checks.........................: 100.00% ✓ 786117      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=2.93µs  min=912ns   med=2.14µs  max=9.46ms   p(90)=3.56µs  p(95)=4.28µs   p(99.9)=35.16µs
     http_req_connecting............: avg=380ns   min=0s      med=0s      max=3.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.68ms min=1.74ms  med=22.44ms max=301.11ms p(90)=26.9ms  p(95)=28.62ms  p(99.9)=46.85ms
       { expected_response:true }...: avg=22.68ms min=1.74ms  med=22.44ms max=301.11ms p(90)=26.9ms  p(95)=28.62ms  p(99.9)=46.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262139
     http_req_receiving.............: avg=84.2µs  min=26.74µs med=52.37µs max=86.77ms  p(90)=88.34µs p(95)=112.39µs p(99.9)=5.48ms 
     http_req_sending...............: avg=33.05µs min=4.68µs  med=9.26µs  max=117.76ms p(90)=15.46µs p(95)=24.03µs  p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.56ms min=1.67ms  med=22.35ms max=300.78ms p(90)=26.78ms p(95)=28.45ms  p(99.9)=45.88ms
     http_reqs......................: 262139  2180.454411/s
     iteration_duration.............: avg=22.88ms min=5.15ms  med=22.63ms max=319.53ms p(90)=27.1ms  p(95)=28.83ms  p(99.9)=47.3ms 
     iterations.....................: 262039  2179.622618/s
     success_rate...................: 100.00% ✓ 262039      ✗ 0     
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

     checks.........................: 100.00% ✓ 475983      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=2.98µs  min=962ns   med=2.09µs  max=3.94ms   p(90)=3.57µs  p(95)=4.22µs   p(99.9)=29.51µs 
     http_req_connecting............: avg=559ns   min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.58ms min=2.03ms  med=37.18ms max=281.79ms p(90)=52.43ms p(95)=57.06ms  p(99.9)=79.08ms 
       { expected_response:true }...: avg=37.58ms min=2.03ms  med=37.18ms max=281.79ms p(90)=52.43ms p(95)=57.06ms  p(99.9)=79.08ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 158761
     http_req_receiving.............: avg=71.59µs min=25.78µs med=56.97µs max=181.79ms p(90)=92.5µs  p(95)=107.63µs p(99.9)=935.18µs
     http_req_sending...............: avg=22.56µs min=4.81µs  med=9.76µs  max=180.87ms p(90)=16.51µs p(95)=20.38µs  p(99.9)=939µs   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.49ms min=1.9ms   med=37.09ms max=281.19ms p(90)=52.33ms p(95)=56.96ms  p(99.9)=78.86ms 
     http_reqs......................: 158761  1320.003689/s
     iteration_duration.............: avg=37.81ms min=3.73ms  med=37.38ms max=313.55ms p(90)=52.63ms p(95)=57.27ms  p(99.9)=79.43ms 
     iterations.....................: 158661  1319.172248/s
     success_rate...................: 100.00% ✓ 158661      ✗ 0     
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

     checks.........................: 100.00% ✓ 223635     ✗ 0    
     data_received..................: 6.6 GB  54 MB/s
     data_sent......................: 90 MB   744 kB/s
     http_req_blocked...............: avg=4.51µs  min=1.11µs  med=3.01µs  max=4.1ms    p(90)=4.47µs   p(95)=5.1µs    p(99.9)=45.76µs 
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.16ms min=3.62ms  med=78.14ms max=315.07ms p(90)=100.59ms p(95)=110.95ms p(99.9)=189.12ms
       { expected_response:true }...: avg=80.16ms min=3.62ms  med=78.14ms max=315.07ms p(90)=100.59ms p(95)=110.95ms p(99.9)=189.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74645
     http_req_receiving.............: avg=78.61µs min=28.25µs med=66.85µs max=143.77ms p(90)=102.53µs p(95)=115.19µs p(99.9)=614.29µs
     http_req_sending...............: avg=22.99µs min=5.07µs  med=12.92µs max=142.95ms p(90)=19.79µs  p(95)=22.12µs  p(99.9)=592.07µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.06ms min=3.53ms  med=78.05ms max=314.45ms p(90)=100.49ms p(95)=110.84ms p(99.9)=188.97ms
     http_reqs......................: 74645   619.553665/s
     iteration_duration.............: avg=80.49ms min=17.17ms med=78.38ms max=324.06ms p(90)=100.84ms p(95)=111.2ms  p(99.9)=191.09ms
     iterations.....................: 74545   618.723665/s
     success_rate...................: 100.00% ✓ 74545      ✗ 0    
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

     checks.........................: 100.00% ✓ 161625     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   538 kB/s
     http_req_blocked...............: avg=5.13µs   min=1.35µs  med=3.23µs   max=3.46ms   p(90)=4.55µs   p(95)=5.12µs   p(99.9)=77.31µs 
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.92ms min=4.5ms   med=110.67ms max=323.18ms p(90)=134.05ms p(95)=140.91ms p(99.9)=173.4ms 
       { expected_response:true }...: avg=110.92ms min=4.5ms   med=110.67ms max=323.18ms p(90)=134.05ms p(95)=140.91ms p(99.9)=173.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 53975
     http_req_receiving.............: avg=82.03µs  min=31.94µs med=74.53µs  max=63.05ms  p(90)=106.69µs p(95)=119.07µs p(99.9)=524.41µs
     http_req_sending...............: avg=22.02µs  min=5.54µs  med=15.53µs  max=121.36ms p(90)=20.87µs  p(95)=22.65µs  p(99.9)=563.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.82ms min=4.44ms  med=110.58ms max=322.42ms p(90)=133.93ms p(95)=140.79ms p(99.9)=173.29ms
     http_reqs......................: 53975   447.591668/s
     iteration_duration.............: avg=111.39ms min=26.49ms med=110.94ms max=332.43ms p(90)=134.31ms p(95)=141.18ms p(99.9)=175.04ms
     iterations.....................: 53875   446.762411/s
     success_rate...................: 100.00% ✓ 53875      ✗ 0    
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

     checks.........................: 100.00% ✓ 103359     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   344 kB/s
     http_req_blocked...............: avg=5.95µs   min=1.05µs  med=3.17µs   max=3.83ms   p(90)=4.55µs   p(95)=5.13µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=2.57µs   min=0s      med=0s       max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=173.47ms min=5.46ms  med=158.59ms max=654.67ms p(90)=201.18ms p(95)=238.47ms p(99.9)=558.78ms
       { expected_response:true }...: avg=173.47ms min=5.46ms  med=158.59ms max=654.67ms p(90)=201.18ms p(95)=238.47ms p(99.9)=558.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34553
     http_req_receiving.............: avg=96.68µs  min=32.43µs med=91.17µs  max=56.48ms  p(90)=121.48µs p(95)=133.49µs p(99.9)=604.61µs
     http_req_sending...............: avg=23.94µs  min=5.42µs  med=17.6µs   max=65.73ms  p(90)=21.86µs  p(95)=23.63µs  p(99.9)=424.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.35ms min=5.36ms  med=158.47ms max=654.57ms p(90)=201.07ms p(95)=238.28ms p(99.9)=558.69ms
     http_reqs......................: 34553   286.114113/s
     iteration_duration.............: avg=174.24ms min=31.68ms med=158.92ms max=654.91ms p(90)=201.54ms p(95)=239.29ms p(99.9)=559.12ms
     iterations.....................: 34453   285.286069/s
     success_rate...................: 100.00% ✓ 34453      ✗ 0    
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

     checks.........................: 100.00% ✓ 101712     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   338 kB/s
     http_req_blocked...............: avg=5.66µs   min=1.37µs  med=3.28µs   max=3.16ms   p(90)=4.57µs   p(95)=5.1µs    p(99.9)=917.42µs
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=3.13ms   p(90)=0s       p(95)=0s       p(99.9)=887.58µs
     http_req_duration..............: avg=176.31ms min=7.44ms  med=178.88ms max=325.06ms p(90)=209.33ms p(95)=215.81ms p(99.9)=275.62ms
       { expected_response:true }...: avg=176.31ms min=7.44ms  med=178.88ms max=325.06ms p(90)=209.33ms p(95)=215.81ms p(99.9)=275.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34004
     http_req_receiving.............: avg=85µs     min=31.67µs med=78.44µs  max=23.4ms   p(90)=108.72µs p(95)=119.29µs p(99.9)=613.82µs
     http_req_sending...............: avg=22.57µs  min=5.57µs  med=15.88µs  max=47.96ms  p(90)=20.5µs   p(95)=22.26µs  p(99.9)=544.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.2ms  min=7.35ms  med=178.75ms max=324.54ms p(90)=209.22ms p(95)=215.71ms p(99.9)=275.53ms
     http_reqs......................: 34004   281.158537/s
     iteration_duration.............: avg=177.07ms min=32ms    med=179.23ms max=332.94ms p(90)=209.59ms p(95)=216.07ms p(99.9)=275.91ms
     iterations.....................: 33904   280.331698/s
     success_rate...................: 100.00% ✓ 33904      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 892374      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=3.45µs   min=942ns   med=2.53µs   max=17.12ms  p(90)=4.04µs  p(95)=4.72µs  p(99.9)=37.19µs
     http_req_connecting............: avg=311ns    min=0s      med=0s       max=4.06ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.94ms  min=1.53ms  med=19.09ms  max=292.41ms p(90)=28.99ms p(95)=32.61ms p(99.9)=52.7ms 
       { expected_response:true }...: avg=19.94ms  min=1.53ms  med=19.09ms  max=292.41ms p(90)=28.99ms p(95)=32.61ms p(99.9)=52.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 297558
     http_req_receiving.............: avg=565.48µs min=53.01µs med=104.64µs max=49.17ms  p(90)=1.4ms   p(95)=2.18ms  p(99.9)=18.6ms 
     http_req_sending...............: avg=44.42µs  min=4.72µs  med=9.61µs   max=170.69ms p(90)=17.86µs p(95)=92.73µs p(99.9)=3.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.33ms  min=1.45ms  med=18.49ms  max=291.86ms p(90)=28.27ms p(95)=31.81ms p(99.9)=51.43ms
     http_reqs......................: 297558  2475.601795/s
     iteration_duration.............: avg=20.16ms  min=2.66ms  med=19.3ms   max=334.63ms p(90)=29.2ms  p(95)=32.84ms p(99.9)=53.23ms
     iterations.....................: 297458  2474.769822/s
     success_rate...................: 100.00% ✓ 297458      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 889989      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.99µs   min=881ns   med=2.12µs  max=22.34ms  p(90)=3.71µs  p(95)=4.46µs  p(99.9)=33.37µs 
     http_req_connecting............: avg=282ns    min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.99ms  min=1.63ms  med=16.94ms max=308.93ms p(90)=32.47ms p(95)=39.74ms p(99.9)=139.73ms
       { expected_response:true }...: avg=19.99ms  min=1.63ms  med=16.94ms max=308.93ms p(90)=32.47ms p(95)=39.74ms p(99.9)=139.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296763
     http_req_receiving.............: avg=549.55µs min=52.88µs med=96.33µs max=182.36ms p(90)=1.06ms  p(95)=1.86ms  p(99.9)=25.63ms 
     http_req_sending...............: avg=39.64µs  min=4.69µs  med=9.01µs  max=197.54ms p(90)=18.21µs p(95)=84.26µs p(99.9)=2.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.4ms   min=1.52ms  med=16.43ms max=308.35ms p(90)=31.56ms p(95)=38.65ms p(99.9)=138.45ms
     http_reqs......................: 296763  2468.501309/s
     iteration_duration.............: avg=20.21ms  min=2.82ms  med=17.15ms max=324.83ms p(90)=32.71ms p(95)=39.98ms p(99.9)=140.52ms
     iterations.....................: 296663  2467.6695/s
     success_rate...................: 100.00% ✓ 296663      ✗ 0     
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

     checks.........................: 100.00% ✓ 889461      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=3.29µs  min=1µs     med=2.66µs  max=16.89ms  p(90)=4.19µs  p(95)=4.89µs   p(99.9)=35.76µs
     http_req_connecting............: avg=134ns   min=0s      med=0s      max=1.78ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.01ms min=1.7ms   med=19.75ms max=285.42ms p(90)=27.78ms p(95)=30.25ms  p(99.9)=49.24ms
       { expected_response:true }...: avg=20.01ms min=1.7ms   med=19.75ms max=285.42ms p(90)=27.78ms p(95)=30.25ms  p(99.9)=49.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296587
     http_req_receiving.............: avg=90.58µs min=26.45µs med=53.41µs max=98.87ms  p(90)=92.9µs  p(95)=132.36µs p(99.9)=6.41ms 
     http_req_sending...............: avg=44.72µs min=5.15µs  med=10.45µs max=132.51ms p(90)=17.61µs p(95)=83.65µs  p(99.9)=3.5ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.87ms min=1.65ms  med=19.64ms max=278.14ms p(90)=27.63ms p(95)=30.06ms  p(99.9)=48.5ms 
     http_reqs......................: 296587  2467.172714/s
     iteration_duration.............: avg=20.22ms min=2.71ms  med=19.96ms max=302.3ms  p(90)=27.99ms p(95)=30.47ms  p(99.9)=49.84ms
     iterations.....................: 296487  2466.340859/s
     success_rate...................: 100.00% ✓ 296487      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 863226      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.83µs  min=842ns   med=2.01µs  max=16.06ms  p(90)=3.56µs  p(95)=4.26µs  p(99.9)=31.45µs 
     http_req_connecting............: avg=327ns   min=0s      med=0s      max=4.12ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.63ms min=1.62ms  med=17.18ms max=348.17ms p(90)=33.8ms  p(95)=41.48ms p(99.9)=156.16ms
       { expected_response:true }...: avg=20.63ms min=1.62ms  med=17.18ms max=348.17ms p(90)=33.8ms  p(95)=41.48ms p(99.9)=156.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287842
     http_req_receiving.............: avg=599.5µs min=51.03µs med=97.97µs max=150.96ms p(90)=1.13ms  p(95)=1.94ms  p(99.9)=27.15ms 
     http_req_sending...............: avg=39.37µs min=4.61µs  med=8.62µs  max=133.54ms p(90)=16.95µs p(95)=69.39µs p(99.9)=2.72ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.99ms min=1.48ms  med=16.65ms max=348.03ms p(90)=32.77ms p(95)=40.31ms p(99.9)=155.61ms
     http_reqs......................: 287842  2394.5932/s
     iteration_duration.............: avg=20.84ms min=2.67ms  med=17.38ms max=348.36ms p(90)=34.02ms p(95)=41.7ms  p(99.9)=157.12ms
     iterations.....................: 287742  2393.761288/s
     success_rate...................: 100.00% ✓ 287742      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 827724      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 332 MB  2.8 MB/s
     http_req_blocked...............: avg=3.63µs   min=962ns   med=2.67µs  max=17.32ms  p(90)=4.36µs  p(95)=5.14µs  p(99.9)=36.2µs  
     http_req_connecting............: avg=329ns    min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.5ms   min=1.88ms  med=18.22ms max=431.37ms p(90)=35.14ms p(95)=43.04ms p(99.9)=145.97ms
       { expected_response:true }...: avg=21.5ms   min=1.88ms  med=18.22ms max=431.37ms p(90)=35.14ms p(95)=43.04ms p(99.9)=145.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 276008
     http_req_receiving.............: avg=583.38µs min=52.06µs med=99.34µs max=227.76ms p(90)=1.11ms  p(95)=1.99ms  p(99.9)=27.85ms 
     http_req_sending...............: avg=45.24µs  min=4.8µs   med=10.47µs max=198.52ms p(90)=19.58µs p(95)=86.81µs p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.87ms  min=1.75ms  med=17.67ms max=431.26ms p(90)=34.13ms p(95)=41.91ms p(99.9)=144.43ms
     http_reqs......................: 276008  2295.294382/s
     iteration_duration.............: avg=21.73ms  min=3.01ms  med=18.43ms max=431.59ms p(90)=35.39ms p(95)=43.3ms  p(99.9)=147.52ms
     iterations.....................: 275908  2294.462778/s
     success_rate...................: 100.00% ✓ 275908      ✗ 0     
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

     checks.........................: 100.00% ✓ 603687      ✗ 0     
     data_received..................: 18 GB   147 MB/s
     data_sent......................: 242 MB  2.0 MB/s
     http_req_blocked...............: avg=3.32µs  min=832ns   med=2.26µs  max=3.69ms   p(90)=4.5µs    p(95)=5.56µs   p(99.9)=42.89µs
     http_req_connecting............: avg=476ns   min=0s      med=0s      max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.56ms min=2.22ms  med=29.14ms max=302.13ms p(90)=39.07ms  p(95)=42.36ms  p(99.9)=64.06ms
       { expected_response:true }...: avg=29.56ms min=2.22ms  med=29.14ms max=302.13ms p(90)=39.07ms  p(95)=42.36ms  p(99.9)=64.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 201329
     http_req_receiving.............: avg=93.67µs min=26.29µs med=54.39µs max=27.69ms  p(90)=128.14µs p(95)=212.7µs  p(99.9)=3.76ms 
     http_req_sending...............: avg=40.53µs min=4.58µs  med=9.26µs  max=111.84ms p(90)=24.21µs  p(95)=111.46µs p(99.9)=2.87ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.42ms min=2.13ms  med=29.02ms max=301.86ms p(90)=38.92ms  p(95)=42.2ms   p(99.9)=63.39ms
     http_reqs......................: 201329  1673.790672/s
     iteration_duration.............: avg=29.8ms  min=5.04ms  med=29.36ms max=314.02ms p(90)=39.29ms  p(95)=42.59ms  p(99.9)=64.38ms
     iterations.....................: 201229  1672.959302/s
     success_rate...................: 100.00% ✓ 201229      ✗ 0     
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

     checks.........................: 100.00% ✓ 428037      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.42µs  min=982ns  med=2.43µs  max=3.75ms   p(90)=4.07µs   p(95)=4.76µs   p(99.9)=34.79µs 
     http_req_connecting............: avg=661ns   min=0s     med=0s      max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.8ms  min=2.16ms med=41.38ms max=298.85ms p(90)=58.1ms   p(95)=63.27ms  p(99.9)=87.09ms 
       { expected_response:true }...: avg=41.8ms  min=2.16ms med=41.38ms max=298.85ms p(90)=58.1ms   p(95)=63.27ms  p(99.9)=87.09ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142779
     http_req_receiving.............: avg=79.32µs min=26.6µs med=64.55µs max=186.82ms p(90)=106.04µs p(95)=123.08µs p(99.9)=808.89µs
     http_req_sending...............: avg=27.14µs min=4.85µs med=11.32µs max=201.83ms p(90)=19.04µs  p(95)=22.46µs  p(99.9)=927.77µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.69ms min=2.03ms med=41.28ms max=278ms    p(90)=58ms     p(95)=63.16ms  p(99.9)=86.75ms 
     http_reqs......................: 142779  1186.987383/s
     iteration_duration.............: avg=42.04ms min=4.23ms med=41.6ms  max=328.76ms p(90)=58.31ms  p(95)=63.49ms  p(99.9)=87.67ms 
     iterations.....................: 142679  1186.156037/s
     success_rate...................: 100.00% ✓ 142679      ✗ 0     
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

     checks.........................: 100.00% ✓ 208719     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   694 kB/s
     http_req_blocked...............: avg=4.11µs  min=1.02µs  med=2.58µs  max=4.01ms   p(90)=4.15µs   p(95)=4.74µs   p(99.9)=45.33µs 
     http_req_connecting............: avg=1.26µs  min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.9ms  min=4.05ms  med=84.04ms max=305.92ms p(90)=106.95ms p(95)=118.37ms p(99.9)=205.51ms
       { expected_response:true }...: avg=85.9ms  min=4.05ms  med=84.04ms max=305.92ms p(90)=106.95ms p(95)=118.37ms p(99.9)=205.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69673
     http_req_receiving.............: avg=81.96µs min=29µs    med=73.47µs max=122.36ms p(90)=108.6µs  p(95)=121.77µs p(99.9)=651.42µs
     http_req_sending...............: avg=23.84µs min=4.51µs  med=13.19µs max=109.14ms p(90)=19.85µs  p(95)=21.91µs  p(99.9)=565.19µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.8ms  min=3.96ms  med=83.94ms max=305.75ms p(90)=106.85ms p(95)=118.25ms p(99.9)=205.3ms 
     http_reqs......................: 69673   577.951617/s
     iteration_duration.............: avg=86.26ms min=21.54ms med=84.28ms max=339.98ms p(90)=107.2ms  p(95)=118.65ms p(99.9)=207.04ms
     iterations.....................: 69573   577.122097/s
     success_rate...................: 100.00% ✓ 69573      ✗ 0    
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

     checks.........................: 100.00% ✓ 147423     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   490 kB/s
     http_req_blocked...............: avg=5.65µs   min=1.25µs  med=3.68µs   max=3.42ms   p(90)=5.11µs   p(95)=5.71µs   p(99.9)=136.38µs
     http_req_connecting............: avg=1.73µs   min=0s      med=0s       max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=86.01µs 
     http_req_duration..............: avg=121.61ms min=5.18ms  med=119.38ms max=318.16ms p(90)=161.05ms p(95)=173.08ms p(99.9)=220.14ms
       { expected_response:true }...: avg=121.61ms min=5.18ms  med=119.38ms max=318.16ms p(90)=161.05ms p(95)=173.08ms p(99.9)=220.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49241
     http_req_receiving.............: avg=86.72µs  min=32.84µs med=83.23µs  max=15.19ms  p(90)=114.69µs p(95)=127.15µs p(99.9)=522.44µs
     http_req_sending...............: avg=24.66µs  min=6.08µs  med=17.48µs  max=107.96ms p(90)=22.61µs  p(95)=24.48µs  p(99.9)=535.77µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.5ms  min=5.07ms  med=119.26ms max=311.39ms p(90)=160.93ms p(95)=172.97ms p(99.9)=220.03ms
     http_reqs......................: 49241   408.031063/s
     iteration_duration.............: avg=122.13ms min=32.09ms med=119.73ms max=327.32ms p(90)=161.37ms p(95)=173.4ms  p(99.9)=223.03ms
     iterations.....................: 49141   407.202422/s
     success_rate...................: 100.00% ✓ 49141      ✗ 0    
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

     checks.........................: 100.00% ✓ 98688      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=6.5µs    min=1.06µs  med=3.06µs   max=4.24ms   p(90)=4.48µs   p(95)=5.03µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=181.64ms min=7.69ms  med=174.19ms max=415.1ms  p(90)=207.07ms p(95)=212.53ms p(99.9)=276.24ms
       { expected_response:true }...: avg=181.64ms min=7.69ms  med=174.19ms max=415.1ms  p(90)=207.07ms p(95)=212.53ms p(99.9)=276.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32996
     http_req_receiving.............: avg=92.43µs  min=30.81µs med=86.23µs  max=87.14ms  p(90)=118.99µs p(95)=133.11µs p(99.9)=546.84µs
     http_req_sending...............: avg=26.59µs  min=5.22µs  med=16.85µs  max=83.16ms  p(90)=21.44µs  p(95)=23.31µs  p(99.9)=592.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.52ms min=7.58ms  med=174.08ms max=414.32ms p(90)=206.97ms p(95)=212.4ms  p(99.9)=275.93ms
     http_reqs......................: 32996   272.832687/s
     iteration_duration.............: avg=182.46ms min=39.62ms med=174.48ms max=428.89ms p(90)=207.36ms p(95)=212.83ms p(99.9)=283.05ms
     iterations.....................: 32896   272.005821/s
     success_rate...................: 100.00% ✓ 32896      ✗ 0    
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

     checks.........................: 100.00% ✓ 97707      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=4.87µs   min=1.08µs  med=3.27µs   max=2.03ms   p(90)=4.68µs   p(95)=5.29µs   p(99.9)=569.06µs
     http_req_connecting............: avg=1.38µs   min=0s      med=0s       max=2.01ms   p(90)=0s       p(95)=0s       p(99.9)=541.34µs
     http_req_duration..............: avg=183.49ms min=5.8ms   med=169.17ms max=646.07ms p(90)=210.03ms p(95)=260.85ms p(99.9)=539.64ms
       { expected_response:true }...: avg=183.49ms min=5.8ms   med=169.17ms max=646.07ms p(90)=210.03ms p(95)=260.85ms p(99.9)=539.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32669
     http_req_receiving.............: avg=94.24µs  min=31.14µs med=91.04µs  max=16.2ms   p(90)=121.75µs p(95)=134.49µs p(99.9)=600.99µs
     http_req_sending...............: avg=21.35µs  min=5.49µs  med=18.41µs  max=25.7ms   p(90)=22.66µs  p(95)=24.5µs   p(99.9)=410.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.38ms min=5.65ms  med=169.06ms max=645.67ms p(90)=209.93ms p(95)=260.73ms p(99.9)=539.52ms
     http_reqs......................: 32669   270.438718/s
     iteration_duration.............: avg=184.31ms min=35.33ms med=169.49ms max=652.37ms p(90)=210.39ms p(95)=262.03ms p(99.9)=539.99ms
     iterations.....................: 32569   269.610903/s
     success_rate...................: 100.00% ✓ 32569      ✗ 0    
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

     checks.........................: 100.00% ✓ 7527      ✗ 0   
     data_received..................: 250 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=37.42µs min=1.19µs  med=3.15µs  max=3.29ms   p(90)=4.49µs   p(95)=5.19µs   p(99.9)=2.97ms  
     http_req_connecting............: avg=32.96µs min=0s      med=0s      max=3.25ms   p(90)=0s       p(95)=0s       p(99.9)=2.95ms  
     http_req_duration..............: avg=2.31s   min=27.31ms med=2.38s   max=5.97s    p(90)=3.14s    p(95)=3.38s    p(99.9)=5.05s   
       { expected_response:true }...: avg=2.31s   min=27.31ms med=2.38s   max=5.97s    p(90)=3.14s    p(95)=3.38s    p(99.9)=5.05s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2609
     http_req_receiving.............: avg=94.21µs min=35.93µs med=92.32µs max=719.63µs p(90)=128.13µs p(95)=146.75µs p(99.9)=364.66µs
     http_req_sending...............: avg=54.82µs min=5.95µs  med=18.05µs max=20.18ms  p(90)=22.66µs  p(95)=25.87µs  p(99.9)=3.25ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.31s   min=27.16ms med=2.38s   max=5.97s    p(90)=3.14s    p(95)=3.38s    p(99.9)=5.05s   
     http_reqs......................: 2609    20.741798/s
     iteration_duration.............: avg=2.4s    min=214.9ms med=2.4s    max=5.98s    p(90)=3.14s    p(95)=3.39s    p(99.9)=5.06s   
     iterations.....................: 2509    19.946789/s
     success_rate...................: 100.00% ✓ 2509      ✗ 0   
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

