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
| hive-router | v0.0.84 | 3,093 | 3,333 | 3,041 | 3.1% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,688 | 2,819 | 2,685 | 1.8% |  |
| fusion | 16.6.6 | 2,626 | 2,781 | 2,614 | 2.3% |  |
| fusion-nightly | 16.7.0-p.6 | 2,599 | 2,692 | 2,574 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,508 | 2,577 | 2,489 | 1.1% |  |
| grafbase | 0.53.5 | 2,160 | 2,277 | 2,144 | 2.1% |  |
| cosmo | 0.334.0 | 1,275 | 1,316 | 1,263 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 628 | 643 | 624 | 0.9% |  |
| apollo-router | v2.16.1 | 482 | 502 | 480 | 1.6% |  |
| apollo-gateway | 2.14.3 | 279 | 283 | 277 | 0.6% |  |
| hive-gateway | 2.10.8 | 271 | 279 | 269 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1233 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion | 16.6.6 | 2,474 | 2,582 | 2,464 | 1.6% |  |
| hive-router | v0.0.84 | 2,424 | 2,607 | 2,411 | 2.8% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,415 | 2,537 | 2,399 | 2.0% |  |
| fusion-nightly | 16.7.0-p.6 | 2,388 | 2,508 | 2,374 | 1.9% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,225 | 2,332 | 2,213 | 1.8% |  |
| grafbase | 0.53.5 | 1,578 | 1,639 | 1,577 | 1.5% |  |
| cosmo | 0.334.0 | 1,245 | 1,286 | 1,241 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 591 | 608 | 587 | 1.2% |  |
| apollo-router | v2.16.1 | 450 | 467 | 446 | 1.5% |  |
| apollo-gateway | 2.14.3 | 270 | 274 | 269 | 0.7% |  |
| hive-gateway | 2.10.8 | 269 | 277 | 267 | 1.1% |  |
| feddi | 5ff8b6165878 | 22 | 22 | 21 | 1.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1115373     ✗ 0     
     data_received..................: 33 GB   271 MB/s
     data_sent......................: 447 MB  3.7 MB/s
     http_req_blocked...............: avg=2.68µs  min=832ns   med=1.9µs   max=16.69ms  p(90)=3.2µs   p(95)=3.82µs   p(99.9)=31.96µs
     http_req_connecting............: avg=232ns   min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.93ms min=1.4ms   med=15.22ms max=349.74ms p(90)=23.43ms p(95)=26.74ms  p(99.9)=46.79ms
       { expected_response:true }...: avg=15.93ms min=1.4ms   med=15.22ms max=349.74ms p(90)=23.43ms p(95)=26.74ms  p(99.9)=46.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 371891
     http_req_receiving.............: avg=89.95µs min=24.09µs med=42.54µs max=59.9ms   p(90)=80.24µs p(95)=151.09µs p(99.9)=8.63ms 
     http_req_sending...............: avg=47.44µs min=4.56µs  med=8.05µs  max=117.14ms p(90)=14.43µs p(95)=88.93µs  p(99.9)=7.51ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.79ms min=1.36ms  med=15.11ms max=349.15ms p(90)=23.24ms p(95)=26.45ms  p(99.9)=45.4ms 
     http_reqs......................: 371891  3093.895402/s
     iteration_duration.............: avg=16.13ms min=2ms     med=15.41ms max=358.56ms p(90)=23.63ms p(95)=26.96ms  p(99.9)=47.58ms
     iterations.....................: 371791  3093.063466/s
     success_rate...................: 100.00% ✓ 371791      ✗ 0     
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

     checks.........................: 100.00% ✓ 969447      ✗ 0     
     data_received..................: 28 GB   236 MB/s
     data_sent......................: 388 MB  3.2 MB/s
     http_req_blocked...............: avg=2.74µs  min=872ns   med=1.93µs   max=24.73ms  p(90)=3.2µs   p(95)=3.83µs  p(99.9)=28.61µs
     http_req_connecting............: avg=272ns   min=0s      med=0s       max=3.96ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.34ms min=1.91ms  med=17.3ms   max=295.85ms p(90)=26.23ms p(95)=29.83ms p(99.9)=49.8ms 
       { expected_response:true }...: avg=18.34ms min=1.91ms  med=17.3ms   max=295.85ms p(90)=26.23ms p(95)=29.83ms p(99.9)=49.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 323249
     http_req_receiving.............: avg=1.04ms  min=52.46µs med=129.12µs max=213.75ms p(90)=2.66ms  p(95)=3.66ms  p(99.9)=23.95ms
     http_req_sending...............: avg=46.16µs min=4.52µs  med=8.18µs   max=101.31ms p(90)=15.84µs p(95)=87.58µs p(99.9)=5.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.25ms min=1.79ms  med=16.19ms  max=275.01ms p(90)=24.85ms p(95)=28.43ms p(99.9)=47.55ms
     http_reqs......................: 323249  2688.29822/s
     iteration_duration.............: avg=18.55ms min=2.56ms  med=17.5ms   max=305.49ms p(90)=26.45ms p(95)=30.06ms p(99.9)=50.66ms
     iterations.....................: 323149  2687.466571/s
     success_rate...................: 100.00% ✓ 323149      ✗ 0     
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

     checks.........................: 100.00% ✓ 947319      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 380 MB  3.2 MB/s
     http_req_blocked...............: avg=3.15µs   min=1.04µs  med=2.43µs  max=16.44ms  p(90)=3.78µs  p(95)=4.4µs   p(99.9)=34.61µs 
     http_req_connecting............: avg=248ns    min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.77ms  min=2ms     med=16.28ms max=300.6ms  p(90)=30.43ms p(95)=36.81ms p(99.9)=106.85ms
       { expected_response:true }...: avg=18.77ms  min=2ms     med=16.28ms max=300.6ms  p(90)=30.43ms p(95)=36.81ms p(99.9)=106.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 315873
     http_req_receiving.............: avg=558.83µs min=52.49µs med=94.32µs max=142.72ms p(90)=1.07ms  p(95)=1.98ms  p(99.9)=25.88ms 
     http_req_sending...............: avg=45.55µs  min=4.92µs  med=9.2µs   max=75.23ms  p(90)=16.12µs p(95)=97.32µs p(99.9)=4.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.16ms  min=1.92ms  med=15.75ms max=300.34ms p(90)=29.52ms p(95)=35.73ms p(99.9)=105.52ms
     http_reqs......................: 315873  2626.777379/s
     iteration_duration.............: avg=18.99ms  min=3.17ms  med=16.49ms max=309.89ms p(90)=30.67ms p(95)=37.05ms p(99.9)=108.2ms 
     iterations.....................: 315773  2625.945786/s
     success_rate...................: 100.00% ✓ 315773      ✗ 0     
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

     checks.........................: 100.00% ✓ 937662      ✗ 0     
     data_received..................: 27 GB   228 MB/s
     data_sent......................: 376 MB  3.1 MB/s
     http_req_blocked...............: avg=2.67µs   min=841ns   med=1.92µs  max=16.79ms  p(90)=3.13µs  p(95)=3.73µs  p(99.9)=31.58µs 
     http_req_connecting............: avg=296ns    min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.98ms  min=2.03ms  med=16.37ms max=281.31ms p(90)=30.92ms p(95)=37.28ms p(99.9)=115.34ms
       { expected_response:true }...: avg=18.98ms  min=2.03ms  med=16.37ms max=281.31ms p(90)=30.92ms p(95)=37.28ms p(99.9)=115.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 312654
     http_req_receiving.............: avg=560.26µs min=50.18µs med=88.75µs max=236.63ms p(90)=1.05ms  p(95)=1.88ms  p(99.9)=25.64ms 
     http_req_sending...............: avg=40.82µs  min=4.4µs   med=8.13µs  max=207.89ms p(90)=14.88µs p(95)=75.58µs p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.38ms  min=1.94ms  med=15.85ms max=271.06ms p(90)=29.96ms p(95)=36.23ms p(99.9)=114.03ms
     http_reqs......................: 312654  2599.822659/s
     iteration_duration.............: avg=19.18ms  min=2.38ms  med=16.56ms max=298.46ms p(90)=31.14ms p(95)=37.52ms p(99.9)=116.02ms
     iterations.....................: 312554  2598.991125/s
     success_rate...................: 100.00% ✓ 312554      ✗ 0     
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

     checks.........................: 100.00% ✓ 904194      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=2.98µs   min=851ns   med=1.92µs  max=15.85ms  p(90)=3.18µs  p(95)=3.79µs  p(99.9)=27.7µs  
     http_req_connecting............: avg=501ns    min=0s      med=0s      max=6.54ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.69ms  min=1.63ms  med=16.03ms max=350.68ms p(90)=33.82ms p(95)=42.45ms p(99.9)=152.89ms
       { expected_response:true }...: avg=19.69ms  min=1.63ms  med=16.03ms max=350.68ms p(90)=33.82ms p(95)=42.45ms p(99.9)=152.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301498
     http_req_receiving.............: avg=561.49µs min=50.03µs med=88.32µs max=262.95ms p(90)=1.03ms  p(95)=1.81ms  p(99.9)=28.48ms 
     http_req_sending...............: avg=41.52µs  min=4.51µs  med=8.01µs  max=151.63ms p(90)=14.4µs  p(95)=61.07µs p(99.9)=3.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.08ms  min=1.55ms  med=15.53ms max=349.56ms p(90)=32.81ms p(95)=41.36ms p(99.9)=151.61ms
     http_reqs......................: 301498  2508.006999/s
     iteration_duration.............: avg=19.89ms  min=2.2ms   med=16.22ms max=350.9ms  p(90)=34.04ms p(95)=42.69ms p(99.9)=153.93ms
     iterations.....................: 301398  2507.17515/s
     success_rate...................: 100.00% ✓ 301398      ✗ 0     
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

     checks.........................: 100.00% ✓ 778992      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=3.25µs  min=952ns  med=2.35µs  max=11.82ms  p(90)=3.99µs  p(95)=4.77µs  p(99.9)=37.9µs 
     http_req_connecting............: avg=363ns   min=0s     med=0s      max=4.13ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=22.87ms min=1.69ms med=22.63ms max=285.69ms p(90)=27.15ms p(95)=28.94ms p(99.9)=48.74ms
       { expected_response:true }...: avg=22.87ms min=1.69ms med=22.63ms max=285.69ms p(90)=27.15ms p(95)=28.94ms p(99.9)=48.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259764
     http_req_receiving.............: avg=91.03µs min=28.1µs med=55.58µs max=121.79ms p(90)=96.53µs p(95)=128.1µs p(99.9)=6.04ms 
     http_req_sending...............: avg=38.88µs min=4.91µs med=10.05µs max=157.46ms p(90)=17.24µs p(95)=32.3µs  p(99.9)=2.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.74ms min=1.61ms med=22.53ms max=284.99ms p(90)=27.01ms p(95)=28.76ms p(99.9)=47.85ms
     http_reqs......................: 259764  2160.663729/s
     iteration_duration.............: avg=23.09ms min=4.33ms med=22.83ms max=302.14ms p(90)=27.36ms p(95)=29.16ms p(99.9)=49.43ms
     iterations.....................: 259664  2159.831949/s
     success_rate...................: 100.00% ✓ 259664      ✗ 0     
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

     checks.........................: 100.00% ✓ 459831      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=2.59µs  min=962ns   med=1.88µs  max=2.69ms   p(90)=3.06µs  p(95)=3.61µs   p(99.9)=31.04µs 
     http_req_connecting............: avg=404ns   min=0s      med=0s      max=2.66ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.91ms min=2.02ms  med=38.53ms max=273.75ms p(90)=54.43ms p(95)=59.3ms   p(99.9)=82.67ms 
       { expected_response:true }...: avg=38.91ms min=2.02ms  med=38.53ms max=273.75ms p(90)=54.43ms p(95)=59.3ms   p(99.9)=82.67ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 153377
     http_req_receiving.............: avg=65.9µs  min=25.97µs med=54.13µs max=19.61ms  p(90)=86.66µs p(95)=101.58µs p(99.9)=834.21µs
     http_req_sending...............: avg=24µs    min=4.64µs  med=9.1µs   max=229.81ms p(90)=14.37µs p(95)=18.16µs  p(99.9)=911.89µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.82ms min=1.9ms   med=38.44ms max=273ms    p(90)=54.34ms p(95)=59.2ms   p(99.9)=82.31ms 
     http_reqs......................: 153377  1275.354073/s
     iteration_duration.............: avg=39.13ms min=3.87ms  med=38.72ms max=293.38ms p(90)=54.63ms p(95)=59.48ms  p(99.9)=83.24ms 
     iterations.....................: 153277  1274.522557/s
     success_rate...................: 100.00% ✓ 153277      ✗ 0     
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

     checks.........................: 100.00% ✓ 226851     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   755 kB/s
     http_req_blocked...............: avg=4.51µs  min=1.18µs  med=2.98µs  max=4ms      p(90)=4.52µs   p(95)=5.18µs   p(99.9)=51.07µs 
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.01ms min=3.57ms  med=77.38ms max=326.88ms p(90)=98.42ms  p(95)=107.95ms p(99.9)=189.82ms
       { expected_response:true }...: avg=79.01ms min=3.57ms  med=77.38ms max=326.88ms p(90)=98.42ms  p(95)=107.95ms p(99.9)=189.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75717
     http_req_receiving.............: avg=85.3µs  min=29.38µs med=69.74µs max=173.54ms p(90)=105.86µs p(95)=119.12µs p(99.9)=696.62µs
     http_req_sending...............: avg=21.9µs  min=5.65µs  med=13.5µs  max=124.77ms p(90)=20.63µs  p(95)=23.02µs  p(99.9)=594.89µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.9ms  min=3.48ms  med=77.27ms max=318.67ms p(90)=98.3ms   p(95)=107.85ms p(99.9)=188.92ms
     http_reqs......................: 75717   628.507366/s
     iteration_duration.............: avg=79.35ms min=17.62ms med=77.62ms max=342.38ms p(90)=98.65ms  p(95)=108.23ms p(99.9)=193.28ms
     iterations.....................: 75617   627.677292/s
     success_rate...................: 100.00% ✓ 75617      ✗ 0    
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

     checks.........................: 100.00% ✓ 174357     ✗ 0    
     data_received..................: 5.1 GB  42 MB/s
     data_sent......................: 70 MB   580 kB/s
     http_req_blocked...............: avg=5.11µs   min=1.28µs  med=3.48µs   max=3.37ms   p(90)=4.89µs   p(95)=5.46µs   p(99.9)=52.86µs 
     http_req_connecting............: avg=1.4µs    min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.81ms min=4.62ms  med=102.5ms  max=313.75ms p(90)=124.07ms p(95)=130.45ms p(99.9)=162.64ms
       { expected_response:true }...: avg=102.81ms min=4.62ms  med=102.5ms  max=313.75ms p(90)=124.07ms p(95)=130.45ms p(99.9)=162.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58219
     http_req_receiving.............: avg=85.24µs  min=31.54µs med=79.88µs  max=35.85ms  p(90)=111.67µs p(95)=124.5µs  p(99.9)=597.45µs
     http_req_sending...............: avg=29.84µs  min=6.07µs  med=16.78µs  max=159.76ms p(90)=22.09µs  p(95)=23.97µs  p(99.9)=564.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.7ms  min=4.5ms   med=102.4ms  max=313.24ms p(90)=123.96ms p(95)=130.34ms p(99.9)=161.36ms
     http_reqs......................: 58219   482.821732/s
     iteration_duration.............: avg=103.25ms min=21.49ms med=102.79ms max=328.15ms p(90)=124.34ms p(95)=130.72ms p(99.9)=164.5ms 
     iterations.....................: 58119   481.992412/s
     success_rate...................: 100.00% ✓ 58119      ✗ 0    
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

     checks.........................: 100.00% ✓ 100965     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   335 kB/s
     http_req_blocked...............: avg=6.42µs   min=1.21µs  med=3.29µs   max=3.95ms   p(90)=4.58µs   p(95)=5.12µs   p(99.9)=1.48ms  
     http_req_connecting............: avg=2.88µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=177.57ms min=7.47ms  med=177.22ms max=373.23ms p(90)=203.76ms p(95)=207.96ms p(99.9)=277.19ms
       { expected_response:true }...: avg=177.57ms min=7.47ms  med=177.22ms max=373.23ms p(90)=203.76ms p(95)=207.96ms p(99.9)=277.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33755
     http_req_receiving.............: avg=90.51µs  min=34.52µs med=81.85µs  max=133.3ms  p(90)=112.6µs  p(95)=123.87µs p(99.9)=480.01µs
     http_req_sending...............: avg=25.15µs  min=6.07µs  med=16.2µs   max=132.97ms p(90)=20.66µs  p(95)=22.41µs  p(99.9)=433.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.46ms min=7.38ms  med=177.1ms  max=373.03ms p(90)=203.64ms p(95)=207.84ms p(99.9)=275.97ms
     http_reqs......................: 33755   279.071838/s
     iteration_duration.............: avg=178.38ms min=34.91ms med=178.16ms max=392.49ms p(90)=204.04ms p(95)=208.25ms p(99.9)=279ms   
     iterations.....................: 33655   278.245081/s
     success_rate...................: 100.00% ✓ 33655      ✗ 0    
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

     checks.........................: 100.00% ✓ 97992      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   326 kB/s
     http_req_blocked...............: avg=6.06µs   min=1.12µs  med=2.94µs   max=3.94ms   p(90)=4.19µs   p(95)=4.72µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=2.93µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=182.99ms min=5.91ms  med=167.31ms max=653.85ms p(90)=211.19ms p(95)=245.48ms p(99.9)=589.64ms
       { expected_response:true }...: avg=182.99ms min=5.91ms  med=167.31ms max=653.85ms p(90)=211.19ms p(95)=245.48ms p(99.9)=589.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32764
     http_req_receiving.............: avg=85.83µs  min=30.08µs med=83.07µs  max=11.99ms  p(90)=112.22µs p(95)=123.88µs p(99.9)=549.84µs
     http_req_sending...............: avg=31.21µs  min=5.49µs  med=16.27µs  max=153.31ms p(90)=20.72µs  p(95)=22.4µs   p(99.9)=490.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.87ms min=5.79ms  med=167.2ms  max=653.75ms p(90)=211.08ms p(95)=245.27ms p(99.9)=589.54ms
     http_reqs......................: 32764   271.095281/s
     iteration_duration.............: avg=183.79ms min=30.55ms med=167.64ms max=654.15ms p(90)=211.51ms p(95)=247ms    p(99.9)=589.96ms
     iterations.....................: 32664   270.267863/s
     success_rate...................: 100.00% ✓ 32664      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 892089      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=2.96µs   min=892ns   med=2.09µs  max=16.69ms  p(90)=3.64µs  p(95)=4.35µs  p(99.9)=33.69µs 
     http_req_connecting............: avg=320ns    min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.95ms  min=1.49ms  med=16.73ms max=348.09ms p(90)=32.77ms p(95)=40.03ms p(99.9)=145.98ms
       { expected_response:true }...: avg=19.95ms  min=1.49ms  med=16.73ms max=348.09ms p(90)=32.77ms p(95)=40.03ms p(99.9)=145.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297463
     http_req_receiving.............: avg=562.81µs min=49.11µs med=93.11µs max=270.52ms p(90)=1.07ms  p(95)=1.84ms  p(99.9)=26.34ms 
     http_req_sending...............: avg=43.15µs  min=4.39µs  med=8.69µs  max=184.16ms p(90)=18.07µs p(95)=81.66µs p(99.9)=3.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.34ms  min=1.39ms  med=16.21ms max=344.41ms p(90)=31.78ms p(95)=38.92ms p(99.9)=144.32ms
     http_reqs......................: 297463  2474.88218/s
     iteration_duration.............: avg=20.16ms  min=2.44ms  med=16.93ms max=348.3ms  p(90)=32.99ms p(95)=40.27ms p(99.9)=146.44ms
     iterations.....................: 297363  2474.050183/s
     success_rate...................: 100.00% ✓ 297363      ✗ 0     
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

     checks.........................: 100.00% ✓ 874107      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=2.81µs  min=942ns   med=2.09µs  max=12.17ms  p(90)=3.48µs  p(95)=4.18µs   p(99.9)=33.7µs 
     http_req_connecting............: avg=298ns   min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.37ms min=1.58ms  med=20.13ms max=292.15ms p(90)=28.37ms p(95)=30.69ms  p(99.9)=49.06ms
       { expected_response:true }...: avg=20.37ms min=1.58ms  med=20.13ms max=292.15ms p(90)=28.37ms p(95)=30.69ms  p(99.9)=49.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291469
     http_req_receiving.............: avg=83.99µs min=26.16µs med=50.07µs max=49.04ms  p(90)=88.95µs p(95)=119.54µs p(99.9)=5.86ms 
     http_req_sending...............: avg=41.68µs min=4.79µs  med=9.22µs  max=143.98ms p(90)=15.87µs p(95)=42.21µs  p(99.9)=3.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.24ms min=1.53ms  med=20.02ms max=270.24ms p(90)=28.22ms p(95)=30.52ms  p(99.9)=47.99ms
     http_reqs......................: 291469  2424.784387/s
     iteration_duration.............: avg=20.58ms min=3.16ms  med=20.33ms max=303.85ms p(90)=28.57ms p(95)=30.9ms   p(99.9)=49.82ms
     iterations.....................: 291369  2423.952469/s
     success_rate...................: 100.00% ✓ 291369      ✗ 0     
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

     checks.........................: 100.00% ✓ 870864      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=2.82µs  min=882ns   med=2µs      max=17.23ms  p(90)=3.49µs  p(95)=4.24µs  p(99.9)=29.85µs
     http_req_connecting............: avg=342ns   min=0s      med=0s       max=3.86ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.44ms min=1.55ms  med=19.33ms  max=278.09ms p(90)=29.79ms p(95)=33.69ms p(99.9)=55.65ms
       { expected_response:true }...: avg=20.44ms min=1.55ms  med=19.33ms  max=278.09ms p(90)=29.79ms p(95)=33.69ms p(99.9)=55.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290388
     http_req_receiving.............: avg=1.27ms  min=52.14µs med=361.17µs max=241.33ms p(90)=3.16ms  p(95)=4.25ms  p(99.9)=24.69ms
     http_req_sending...............: avg=43.52µs min=4.64µs  med=8.57µs   max=241.62ms p(90)=17.89µs p(95)=85.37µs p(99.9)=3.47ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.12ms min=1.44ms  med=17.94ms  max=277.93ms p(90)=28.25ms p(95)=32.03ms p(99.9)=53.27ms
     http_reqs......................: 290388  2415.785211/s
     iteration_duration.............: avg=20.65ms min=2.5ms   med=19.53ms  max=298.36ms p(90)=30.02ms p(95)=33.91ms p(99.9)=56.35ms
     iterations.....................: 290288  2414.953294/s
     success_rate...................: 100.00% ✓ 290288      ✗ 0     
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

     checks.........................: 100.00% ✓ 861063      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=2.69µs   min=852ns   med=1.91µs  max=12.02ms  p(90)=3.28µs  p(95)=3.95µs  p(99.9)=28µs    
     http_req_connecting............: avg=325ns    min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.68ms  min=1.56ms  med=17.22ms max=349.62ms p(90)=34.11ms p(95)=41.93ms p(99.9)=152.14ms
       { expected_response:true }...: avg=20.68ms  min=1.56ms  med=17.22ms max=349.62ms p(90)=34.11ms p(95)=41.93ms p(99.9)=152.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287121
     http_req_receiving.............: avg=605.81µs min=52.42µs med=94.32µs max=293.94ms p(90)=1.14ms  p(95)=1.98ms  p(99.9)=27.52ms 
     http_req_sending...............: avg=40.43µs  min=4.45µs  med=8.11µs  max=179.93ms p(90)=15.08µs p(95)=61.52µs p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.03ms  min=1.42ms  med=16.65ms max=349.41ms p(90)=33.04ms p(95)=40.66ms p(99.9)=150.85ms
     http_reqs......................: 287121  2388.682738/s
     iteration_duration.............: avg=20.89ms  min=2.68ms  med=17.41ms max=349.88ms p(90)=34.32ms p(95)=42.15ms p(99.9)=153.59ms
     iterations.....................: 287021  2387.850795/s
     success_rate...................: 100.00% ✓ 287021      ✗ 0     
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

     checks.........................: 100.00% ✓ 802734      ✗ 0     
     data_received..................: 24 GB   195 MB/s
     data_sent......................: 322 MB  2.7 MB/s
     http_req_blocked...............: avg=3.53µs   min=922ns   med=2.78µs   max=13.46ms  p(90)=4.36µs  p(95)=5.06µs  p(99.9)=37.56µs 
     http_req_connecting............: avg=325ns    min=0s      med=0s       max=3.79ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.18ms  min=1.89ms  med=18.59ms  max=572.89ms p(90)=36.34ms p(95)=44.96ms p(99.9)=155.27ms
       { expected_response:true }...: avg=22.18ms  min=1.89ms  med=18.59ms  max=572.89ms p(90)=36.34ms p(95)=44.96ms p(99.9)=155.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267678
     http_req_receiving.............: avg=641.07µs min=53.06µs med=104.73µs max=166.22ms p(90)=1.18ms  p(95)=2.07ms  p(99.9)=31.95ms 
     http_req_sending...............: avg=44.5µs   min=4.97µs  med=10.58µs  max=64.99ms  p(90)=19.11µs p(95)=90.64µs p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.5ms   min=1.76ms  med=17.99ms  max=572.76ms p(90)=35.24ms p(95)=43.63ms p(99.9)=154.23ms
     http_reqs......................: 267678  2225.95284/s
     iteration_duration.............: avg=22.41ms  min=2.99ms  med=18.81ms  max=573.09ms p(90)=36.57ms p(95)=45.19ms p(99.9)=156.55ms
     iterations.....................: 267578  2225.121261/s
     success_rate...................: 100.00% ✓ 267578      ✗ 0     
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

     checks.........................: 100.00% ✓ 569220      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 228 MB  1.9 MB/s
     http_req_blocked...............: avg=4.44µs   min=1.1µs   med=3.19µs  max=7.63ms   p(90)=5.41µs   p(95)=6.51µs   p(99.9)=51.29µs
     http_req_connecting............: avg=599ns    min=0s      med=0s      max=5.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.34ms  min=2.21ms  med=30.69ms max=271.39ms p(90)=41.57ms  p(95)=45.25ms  p(99.9)=66.3ms 
       { expected_response:true }...: avg=31.34ms  min=2.21ms  med=30.69ms max=271.39ms p(90)=41.57ms  p(95)=45.25ms  p(99.9)=66.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 189840
     http_req_receiving.............: avg=107.93µs min=27.92µs med=64.21µs max=143.24ms p(90)=137.65µs p(95)=231.06µs p(99.9)=4.59ms 
     http_req_sending...............: avg=44.83µs  min=5.08µs  med=11.61µs max=228.32ms p(90)=25.48µs  p(95)=119.71µs p(99.9)=2.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.19ms  min=2.13ms  med=30.56ms max=269.99ms p(90)=41.4ms   p(95)=45.07ms  p(99.9)=65.71ms
     http_reqs......................: 189840  1578.312979/s
     iteration_duration.............: avg=31.6ms   min=5.24ms  med=30.94ms max=353.32ms p(90)=41.82ms  p(95)=45.5ms   p(99.9)=67.15ms
     iterations.....................: 189740  1577.481588/s
     success_rate...................: 100.00% ✓ 189740      ✗ 0     
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

     checks.........................: 100.00% ✓ 448983      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.77µs  min=1.13µs  med=3.03µs  max=7.97ms   p(90)=4.64µs   p(95)=5.39µs   p(99.9)=40µs    
     http_req_connecting............: avg=371ns   min=0s      med=0s      max=2.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.82ms min=2.15ms  med=39.42ms max=299.14ms p(90)=55.33ms  p(95)=60.24ms  p(99.9)=82.79ms 
       { expected_response:true }...: avg=39.82ms min=2.15ms  med=39.42ms max=299.14ms p(90)=55.33ms  p(95)=60.24ms  p(99.9)=82.79ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149761
     http_req_receiving.............: avg=84.76µs min=27.69µs med=69.24µs max=198.96ms p(90)=109.44µs p(95)=126.49µs p(99.9)=904.53µs
     http_req_sending...............: avg=29.07µs min=5.4µs   med=13.24µs max=146.93ms p(90)=20.1µs   p(95)=24.14µs  p(99.9)=1.14ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.71ms min=2.04ms  med=39.31ms max=298.68ms p(90)=55.21ms  p(95)=60.13ms  p(99.9)=82.21ms 
     http_reqs......................: 149761  1245.077414/s
     iteration_duration.............: avg=40.08ms min=4.01ms  med=39.65ms max=317.73ms p(90)=55.55ms  p(95)=60.47ms  p(99.9)=83.2ms  
     iterations.....................: 149661  1244.246038/s
     success_rate...................: 100.00% ✓ 149661      ✗ 0     
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

     checks.........................: 100.00% ✓ 213384     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 86 MB   710 kB/s
     http_req_blocked...............: avg=5.95µs  min=1.15µs  med=3.28µs  max=8.36ms   p(90)=4.89µs   p(95)=5.6µs    p(99.9)=47.71µs 
     http_req_connecting............: avg=2.29µs  min=0s      med=0s      max=8.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.99ms min=3.84ms  med=82.19ms max=301.16ms p(90)=102.2ms  p(95)=111.86ms p(99.9)=192.56ms
       { expected_response:true }...: avg=83.99ms min=3.84ms  med=82.19ms max=301.16ms p(90)=102.2ms  p(95)=111.86ms p(99.9)=192.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71228
     http_req_receiving.............: avg=89.82µs min=29.51µs med=76.89µs max=136.67ms p(90)=113.04µs p(95)=126.71µs p(99.9)=723.54µs
     http_req_sending...............: avg=23.81µs min=5.26µs  med=14.69µs max=83.61ms  p(90)=21.76µs  p(95)=24.16µs  p(99.9)=715.11µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.87ms min=3.71ms  med=82.08ms max=291.46ms p(90)=102.07ms p(95)=111.74ms p(99.9)=191.89ms
     http_reqs......................: 71228   591.043817/s
     iteration_duration.............: avg=84.36ms min=11.67ms med=82.44ms max=308.29ms p(90)=102.5ms  p(95)=112.18ms p(99.9)=195.07ms
     iterations.....................: 71128   590.214026/s
     success_rate...................: 100.00% ✓ 71128      ✗ 0    
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

     checks.........................: 100.00% ✓ 162690     ✗ 0    
     data_received..................: 4.8 GB  39 MB/s
     data_sent......................: 65 MB   541 kB/s
     http_req_blocked...............: avg=6.36µs   min=1.17µs  med=3.21µs   max=9.09ms   p(90)=4.71µs   p(95)=5.27µs   p(99.9)=65.32µs 
     http_req_connecting............: avg=2.7µs    min=0s      med=0s       max=9.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.19ms min=5.22ms  med=108.21ms max=317.71ms p(90)=145.02ms p(95)=156.12ms p(99.9)=202.65ms
       { expected_response:true }...: avg=110.19ms min=5.22ms  med=108.21ms max=317.71ms p(90)=145.02ms p(95)=156.12ms p(99.9)=202.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54330
     http_req_receiving.............: avg=87.34µs  min=30.52µs med=83.78µs  max=70.15ms  p(90)=115.12µs p(95)=128.05µs p(99.9)=532.99µs
     http_req_sending...............: avg=24.29µs  min=5.38µs  med=16.32µs  max=133.32ms p(90)=21.47µs  p(95)=23.31µs  p(99.9)=610.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.07ms min=5.08ms  med=108.09ms max=317.26ms p(90)=144.9ms  p(95)=156.02ms p(99.9)=202.38ms
     http_reqs......................: 54330   450.26643/s
     iteration_duration.............: avg=110.66ms min=17.9ms  med=108.51ms max=340.67ms p(90)=145.34ms p(95)=156.43ms p(99.9)=204.64ms
     iterations.....................: 54230   449.437668/s
     success_rate...................: 100.00% ✓ 54230      ✗ 0    
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

     checks.........................: 100.00% ✓ 97725      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=6.07µs   min=1.12µs  med=3.21µs   max=3.5ms    p(90)=4.59µs   p(95)=5.14µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=2.65µs   min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=183.44ms min=7.82ms  med=183.3ms  max=366.44ms p(90)=194.25ms p(95)=199.12ms p(99.9)=270.74ms
       { expected_response:true }...: avg=183.44ms min=7.82ms  med=183.3ms  max=366.44ms p(90)=194.25ms p(95)=199.12ms p(99.9)=270.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32675
     http_req_receiving.............: avg=92.59µs  min=30.91µs med=88.33µs  max=43.62ms  p(90)=118.37µs p(95)=129.47µs p(99.9)=624.57µs
     http_req_sending...............: avg=26.22µs  min=5.55µs  med=17.43µs  max=66.82ms  p(90)=21.95µs  p(95)=23.8µs   p(99.9)=481.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.32ms min=7.73ms  med=183.19ms max=365.87ms p(90)=194.14ms p(95)=199.01ms p(99.9)=270.64ms
     http_reqs......................: 32675   270.090114/s
     iteration_duration.............: avg=184.27ms min=53.52ms med=183.71ms max=376.55ms p(90)=194.54ms p(95)=199.44ms p(99.9)=273.07ms
     iterations.....................: 32575   269.263518/s
     success_rate...................: 100.00% ✓ 32575      ✗ 0    
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

     checks.........................: 100.00% ✓ 97401      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=7.41µs   min=1.58µs  med=3.95µs   max=3.81ms   p(90)=5.5µs    p(95)=6.14µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=3.16µs   min=0s      med=0s       max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=184.06ms min=6.23ms  med=170.18ms max=616.45ms p(90)=209.53ms p(95)=256.62ms p(99.9)=532.67ms
       { expected_response:true }...: avg=184.06ms min=6.23ms  med=170.18ms max=616.45ms p(90)=209.53ms p(95)=256.62ms p(99.9)=532.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32567
     http_req_receiving.............: avg=101.55µs min=34.97µs med=92.64µs  max=102.6ms  p(90)=129.82µs p(95)=146.64µs p(99.9)=582.82µs
     http_req_sending...............: avg=38.17µs  min=6.01µs  med=19.12µs  max=169.98ms p(90)=24.03µs  p(95)=26.05µs  p(99.9)=440.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.92ms min=6.13ms  med=170.05ms max=616.34ms p(90)=209.4ms  p(95)=256.39ms p(99.9)=532.37ms
     http_reqs......................: 32567   269.374051/s
     iteration_duration.............: avg=184.92ms min=45.13ms med=170.55ms max=616.7ms  p(90)=209.95ms p(95)=259.4ms  p(99.9)=532.95ms
     iterations.....................: 32467   268.546913/s
     success_rate...................: 100.00% ✓ 32467      ✗ 0    
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

     checks.........................: 100.00% ✓ 8076      ✗ 0   
     data_received..................: 267 MB  2.1 MB/s
     data_sent......................: 3.3 MB  27 kB/s
     http_req_blocked...............: avg=86.24µs  min=1.42µs   med=3.72µs  max=9.98ms  p(90)=5.37µs   p(95)=6.32µs   p(99.9)=7.94ms 
     http_req_connecting............: avg=80.71µs  min=0s       med=0s      max=9.94ms  p(90)=0s       p(95)=0s       p(99.9)=7.89ms 
     http_req_duration..............: avg=2.16s    min=26.11ms  med=2.22s   max=4.73s   p(90)=2.92s    p(95)=3.1s     p(99.9)=3.91s  
       { expected_response:true }...: avg=2.16s    min=26.11ms  med=2.22s   max=4.73s   p(90)=2.92s    p(95)=3.1s     p(99.9)=3.91s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2792
     http_req_receiving.............: avg=116.68µs min=35.13µs  med=93.94µs max=16.63ms p(90)=134.95µs p(95)=153.09µs p(99.9)=9.12ms 
     http_req_sending...............: avg=107.74µs min=6.82µs   med=19.48µs max=35.99ms p(90)=24.4µs   p(95)=28.16µs  p(99.9)=20.49ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.16s    min=25.96ms  med=2.22s   max=4.73s   p(90)=2.92s    p(95)=3.1s     p(99.9)=3.91s  
     http_reqs......................: 2792    22.201756/s
     iteration_duration.............: avg=2.24s    min=166.62ms med=2.24s   max=4.74s   p(90)=2.93s    p(95)=3.11s    p(99.9)=3.92s  
     iterations.....................: 2692    21.406564/s
     success_rate...................: 100.00% ✓ 2692      ✗ 0   
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

