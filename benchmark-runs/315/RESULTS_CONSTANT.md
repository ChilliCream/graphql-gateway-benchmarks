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
| hive-router | v0.0.84 | 3,077 | 3,361 | 3,027 | 3.7% |  |
| fusion-nightly-net11 | 16.6.1-p.1 | 2,705 | 2,869 | 2,696 | 2.2% |  |
| fusion-nightly | 16.6.1-p.1 | 2,536 | 2,666 | 2,526 | 2.0% |  |
| fusion | 16.6.0 | 2,526 | 2,644 | 2,511 | 1.8% |  |
| fusion-nightly-fed | 16.6.1-p.1 | 2,441 | 2,549 | 2,431 | 1.7% |  |
| grafbase | 0.53.5 | 2,160 | 2,284 | 2,145 | 2.1% |  |
| cosmo | 0.334.0 | 1,329 | 1,378 | 1,323 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 608 | 629 | 603 | 1.5% |  |
| apollo-router | v2.16.1 | 488 | 506 | 485 | 1.6% |  |
| apollo-gateway | 2.14.3 | 285 | 289 | 284 | 0.6% |  |
| hive-gateway | 2.10.8 | 274 | 283 | 273 | 1.2% |  |
| feddi | 5ff8b6165878 | 0 | 0 | 0 | 0.0% | non-compatible response (116 across 1/2 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,542 | 2,677 | 2,433 | 3.0% |  |
| fusion-nightly-net11 | 16.6.1-p.1 | 2,531 | 2,649 | 2,516 | 1.8% |  |
| fusion | 16.6.0 | 2,461 | 2,568 | 2,452 | 1.6% |  |
| fusion-nightly | 16.6.1-p.1 | 2,444 | 2,542 | 2,376 | 2.3% |  |
| fusion-nightly-fed | 16.6.1-p.1 | 2,287 | 2,395 | 2,273 | 1.8% |  |
| grafbase | 0.53.5 | 1,626 | 1,681 | 1,624 | 1.2% |  |
| cosmo | 0.334.0 | 1,232 | 1,271 | 1,229 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 572 | 596 | 571 | 1.7% |  |
| apollo-router | v2.16.1 | 446 | 460 | 439 | 1.6% |  |
| hive-gateway | 2.10.8 | 268 | 275 | 267 | 1.1% |  |
| apollo-gateway | 2.14.3 | 266 | 271 | 265 | 0.7% |  |
| feddi | 5ff8b6165878 | 18 | 20 | 17 | 4.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1109496     ✗ 0     
     data_received..................: 32 GB   270 MB/s
     data_sent......................: 445 MB  3.7 MB/s
     http_req_blocked...............: avg=2.62µs  min=852ns   med=1.89µs  max=12.86ms  p(90)=3.18µs  p(95)=3.82µs   p(99.9)=28.29µs
     http_req_connecting............: avg=252ns   min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.01ms min=1.38ms  med=15.29ms max=266.02ms p(90)=23.33ms p(95)=26.59ms  p(99.9)=46.74ms
       { expected_response:true }...: avg=16.01ms min=1.38ms  med=15.29ms max=266.02ms p(90)=23.33ms p(95)=26.59ms  p(99.9)=46.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 369932
     http_req_receiving.............: avg=90.82µs min=25.31µs med=44.65µs max=182.5ms  p(90)=83.19µs p(95)=152.44µs p(99.9)=8.08ms 
     http_req_sending...............: avg=48.26µs min=4.54µs  med=8.12µs  max=172.08ms p(90)=14.24µs p(95)=89.03µs  p(99.9)=8.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.87ms min=1.33ms  med=15.17ms max=265.86ms p(90)=23.15ms p(95)=26.31ms  p(99.9)=45.24ms
     http_reqs......................: 369932  3077.90181/s
     iteration_duration.............: avg=16.21ms min=1.96ms  med=15.47ms max=311.42ms p(90)=23.53ms p(95)=26.82ms  p(99.9)=47.38ms
     iterations.....................: 369832  3077.069792/s
     success_rate...................: 100.00% ✓ 369832      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 975681      ✗ 0     
     data_received..................: 29 GB   237 MB/s
     data_sent......................: 391 MB  3.3 MB/s
     http_req_blocked...............: avg=3.38µs   min=1.08µs  med=2.43µs  max=17.89ms  p(90)=3.79µs  p(95)=4.44µs  p(99.9)=34.34µs
     http_req_connecting............: avg=284ns    min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.22ms  min=1.97ms  med=17.3ms  max=286.02ms p(90)=26.32ms p(95)=29.98ms p(99.9)=51.63ms
       { expected_response:true }...: avg=18.22ms  min=1.97ms  med=17.3ms  max=286.02ms p(90)=26.32ms p(95)=29.98ms p(99.9)=51.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 325327
     http_req_receiving.............: avg=466.31µs min=51.44µs med=94.62µs max=180.45ms p(90)=1.15ms  p(95)=1.83ms  p(99.9)=17.7ms 
     http_req_sending...............: avg=47.07µs  min=4.62µs  med=9.02µs  max=117.39ms p(90)=16.35µs p(95)=96.59µs p(99.9)=4.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.71ms  min=1.89ms  med=16.81ms max=285.77ms p(90)=25.7ms  p(95)=29.29ms p(99.9)=50.08ms
     http_reqs......................: 325327  2705.257762/s
     iteration_duration.............: avg=18.43ms  min=2.85ms  med=17.5ms  max=308.97ms p(90)=26.53ms p(95)=30.2ms  p(99.9)=52.19ms
     iterations.....................: 325227  2704.426212/s
     success_rate...................: 100.00% ✓ 325227      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 914598      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 367 MB  3.0 MB/s
     http_req_blocked...............: avg=2.61µs   min=841ns   med=1.94µs  max=10.28ms  p(90)=3.1µs   p(95)=3.66µs  p(99.9)=27.83µs 
     http_req_connecting............: avg=280ns    min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.46ms  min=2ms     med=16.76ms max=295.19ms p(90)=31.48ms p(95)=38.15ms p(99.9)=121.57ms
       { expected_response:true }...: avg=19.46ms  min=2ms     med=16.76ms max=295.19ms p(90)=31.48ms p(95)=38.15ms p(99.9)=121.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 304966
     http_req_receiving.............: avg=581.64µs min=51.09µs med=91.88µs max=173.93ms p(90)=1.11ms  p(95)=1.95ms  p(99.9)=25.25ms 
     http_req_sending...............: avg=39.37µs  min=4.68µs  med=8.24µs  max=105.15ms p(90)=14.05µs p(95)=74.64µs p(99.9)=3.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.84ms  min=1.88ms  med=16.22ms max=294.66ms p(90)=30.49ms p(95)=37.04ms p(99.9)=119.75ms
     http_reqs......................: 304966  2536.186354/s
     iteration_duration.............: avg=19.67ms  min=3.06ms  med=16.95ms max=303.65ms p(90)=31.7ms  p(95)=38.39ms p(99.9)=122.6ms 
     iterations.....................: 304866  2535.354725/s
     success_rate...................: 100.00% ✓ 304866      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 910968      ✗ 0     
     data_received..................: 27 GB   221 MB/s
     data_sent......................: 365 MB  3.0 MB/s
     http_req_blocked...............: avg=2.69µs   min=902ns   med=1.91µs  max=17.73ms  p(90)=3.06µs  p(95)=3.61µs  p(99.9)=26.32µs 
     http_req_connecting............: avg=303ns    min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.54ms  min=2.01ms  med=16.78ms max=314.51ms p(90)=31.73ms p(95)=38.31ms p(99.9)=126.89ms
       { expected_response:true }...: avg=19.54ms  min=2.01ms  med=16.78ms max=314.51ms p(90)=31.73ms p(95)=38.31ms p(99.9)=126.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 303756
     http_req_receiving.............: avg=575.92µs min=51.45µs med=91.31µs max=187.93ms p(90)=1.08ms  p(95)=1.93ms  p(99.9)=25.4ms  
     http_req_sending...............: avg=41.44µs  min=4.53µs  med=8.09µs  max=104ms    p(90)=13.91µs p(95)=73.72µs p(99.9)=4.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.92ms  min=1.9ms   med=16.24ms max=314.41ms p(90)=30.74ms p(95)=37.21ms p(99.9)=125.6ms 
     http_reqs......................: 303756  2526.035305/s
     iteration_duration.............: avg=19.75ms  min=3.16ms  med=16.98ms max=314.7ms  p(90)=31.95ms p(95)=38.56ms p(99.9)=128.21ms
     iterations.....................: 303656  2525.203705/s
     success_rate...................: 100.00% ✓ 303656      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 880437      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=2.62µs   min=821ns   med=1.89µs  max=7.28ms   p(90)=3.23µs  p(95)=3.9µs   p(99.9)=31.54µs 
     http_req_connecting............: avg=327ns    min=0s      med=0s      max=3.71ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.22ms  min=1.67ms  med=16.59ms max=524.48ms p(90)=33.86ms p(95)=42.62ms p(99.9)=154.61ms
       { expected_response:true }...: avg=20.22ms  min=1.67ms  med=16.59ms max=524.48ms p(90)=33.86ms p(95)=42.62ms p(99.9)=154.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293579
     http_req_receiving.............: avg=575.25µs min=51.53µs med=90.11µs max=131.71ms p(90)=1.04ms  p(95)=1.85ms  p(99.9)=29.66ms 
     http_req_sending...............: avg=40.11µs  min=4.62µs  med=8.32µs  max=148.67ms p(90)=15.41µs p(95)=69.45µs p(99.9)=3.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.61ms  min=1.59ms  med=16.06ms max=524.39ms p(90)=32.88ms p(95)=41.47ms p(99.9)=153.04ms
     http_reqs......................: 293579  2441.94132/s
     iteration_duration.............: avg=20.43ms  min=2.55ms  med=16.78ms max=524.68ms p(90)=34.07ms p(95)=42.86ms p(99.9)=155.38ms
     iterations.....................: 293479  2441.109536/s
     success_rate...................: 100.00% ✓ 293479      ✗ 0     
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

     checks.........................: 100.00% ✓ 779073      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=2.89µs  min=922ns   med=2.08µs  max=11.92ms  p(90)=3.5µs   p(95)=4.26µs   p(99.9)=33.77µs
     http_req_connecting............: avg=352ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.88ms min=1.65ms  med=22.64ms max=297.35ms p(90)=27.1ms  p(95)=28.82ms  p(99.9)=47.9ms 
       { expected_response:true }...: avg=22.88ms min=1.65ms  med=22.64ms max=297.35ms p(90)=27.1ms  p(95)=28.82ms  p(99.9)=47.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 259791
     http_req_receiving.............: avg=85.91µs min=28.34µs med=53.86µs max=155.03ms p(90)=91.32µs p(95)=117.25µs p(99.9)=5.4ms  
     http_req_sending...............: avg=34.13µs min=4.65µs  med=8.99µs  max=101.11ms p(90)=15.21µs p(95)=24.5µs   p(99.9)=1.74ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.76ms min=1.6ms   med=22.54ms max=296.77ms p(90)=26.98ms p(95)=28.65ms  p(99.9)=46.81ms
     http_reqs......................: 259791  2160.860001/s
     iteration_duration.............: avg=23.09ms min=4.64ms  med=22.83ms max=314.21ms p(90)=27.3ms  p(95)=29.03ms  p(99.9)=48.24ms
     iterations.....................: 259691  2160.028233/s
     success_rate...................: 100.00% ✓ 259691      ✗ 0     
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

     checks.........................: 100.00% ✓ 479283      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.06µs  med=2.56µs  max=3.81ms   p(90)=4µs     p(95)=4.66µs   p(99.9)=32.28µs
     http_req_connecting............: avg=534ns   min=0s      med=0s      max=3.76ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.31ms min=2.03ms  med=36.94ms max=297.77ms p(90)=52.02ms p(95)=56.52ms  p(99.9)=78.51ms
       { expected_response:true }...: avg=37.31ms min=2.03ms  med=36.94ms max=297.77ms p(90)=52.02ms p(95)=56.52ms  p(99.9)=78.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159861
     http_req_receiving.............: avg=75.06µs min=27.06µs med=59.95µs max=82.8ms   p(90)=95.86µs p(95)=111.86µs p(99.9)=1.11ms 
     http_req_sending...............: avg=27.92µs min=4.7µs   med=11.01µs max=165.83ms p(90)=17.51µs p(95)=21.72µs  p(99.9)=1.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.21ms min=1.94ms  med=36.84ms max=282.51ms p(90)=51.91ms p(95)=56.41ms  p(99.9)=78.15ms
     http_reqs......................: 159861  1329.150383/s
     iteration_duration.............: avg=37.54ms min=3.69ms  med=37.15ms max=305.16ms p(90)=52.22ms p(95)=56.73ms  p(99.9)=78.89ms
     iterations.....................: 159761  1328.318942/s
     success_rate...................: 100.00% ✓ 159761      ✗ 0     
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

     checks.........................: 100.00% ✓ 219645     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 88 MB   731 kB/s
     http_req_blocked...............: avg=3.97µs  min=982ns   med=2.45µs  max=4.07ms   p(90)=3.89µs   p(95)=4.49µs   p(99.9)=47.32µs 
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.62ms min=3.64ms  med=79.31ms max=314.72ms p(90)=105.78ms p(95)=116.84ms p(99.9)=198.12ms
       { expected_response:true }...: avg=81.62ms min=3.64ms  med=79.31ms max=314.72ms p(90)=105.78ms p(95)=116.84ms p(99.9)=198.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73315
     http_req_receiving.............: avg=74.99µs min=27.82µs med=66.38µs max=12.03ms  p(90)=103.81µs p(95)=117.15µs p(99.9)=596.05µs
     http_req_sending...............: avg=23.98µs min=4.89µs  med=12.48µs max=232.36ms p(90)=19.55µs  p(95)=21.55µs  p(99.9)=590.69µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.52ms min=3.58ms  med=79.21ms max=314.3ms  p(90)=105.69ms p(95)=116.74ms p(99.9)=197.9ms 
     http_reqs......................: 73315   608.412348/s
     iteration_duration.............: avg=81.95ms min=23.31ms med=79.56ms max=334.2ms  p(90)=106.01ms p(95)=117.13ms p(99.9)=199.73ms
     iterations.....................: 73215   607.582487/s
     success_rate...................: 100.00% ✓ 73215      ✗ 0    
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

     checks.........................: 100.00% ✓ 176592     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   587 kB/s
     http_req_blocked...............: avg=5.01µs   min=1.2µs   med=3.51µs   max=3.13ms   p(90)=4.91µs   p(95)=5.51µs   p(99.9)=50.64µs 
     http_req_connecting............: avg=1.27µs   min=0s      med=0s       max=3.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.5ms  min=4.7ms   med=101.18ms max=314.7ms  p(90)=122.33ms p(95)=128.66ms p(99.9)=159.73ms
       { expected_response:true }...: avg=101.5ms  min=4.7ms   med=101.18ms max=314.7ms  p(90)=122.33ms p(95)=128.66ms p(99.9)=159.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58964
     http_req_receiving.............: avg=83.94µs  min=29.69µs med=78.17µs  max=45.21ms  p(90)=109.53µs p(95)=122.13µs p(99.9)=562.69µs
     http_req_sending...............: avg=28.62µs  min=6.45µs  med=16.65µs  max=128.88ms p(90)=21.91µs  p(95)=23.72µs  p(99.9)=698.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.39ms min=4.54ms  med=101.07ms max=301.79ms p(90)=122.22ms p(95)=128.56ms p(99.9)=159.5ms 
     http_reqs......................: 58964   488.990217/s
     iteration_duration.............: avg=101.94ms min=28.13ms med=101.47ms max=326.53ms p(90)=122.6ms  p(95)=128.96ms p(99.9)=160.78ms
     iterations.....................: 58864   488.160914/s
     success_rate...................: 100.00% ✓ 58864      ✗ 0    
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

     checks.........................: 100.00% ✓ 103296     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   343 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.13µs  med=2.91µs   max=3.5ms    p(90)=4.13µs   p(95)=4.61µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=2.5µs    min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=173.57ms min=7.34ms  med=178.26ms max=375.64ms p(90)=185.38ms p(95)=189.67ms p(99.9)=254.32ms
       { expected_response:true }...: avg=173.57ms min=7.34ms  med=178.26ms max=375.64ms p(90)=185.38ms p(95)=189.67ms p(99.9)=254.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34532
     http_req_receiving.............: avg=92.12µs  min=30.57µs med=85.46µs  max=86.33ms  p(90)=114.79µs p(95)=126.21µs p(99.9)=703.53µs
     http_req_sending...............: avg=24.65µs  min=5.07µs  med=17µs     max=61.3ms   p(90)=20.77µs  p(95)=22.41µs  p(99.9)=520.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.46ms min=7.21ms  med=178.15ms max=375.08ms p(90)=185.28ms p(95)=189.58ms p(99.9)=253.83ms
     http_reqs......................: 34532   285.615866/s
     iteration_duration.............: avg=174.33ms min=37.4ms  med=178.52ms max=397.23ms p(90)=185.66ms p(95)=189.94ms p(99.9)=255.22ms
     iterations.....................: 34432   284.788761/s
     success_rate...................: 100.00% ✓ 34432      ✗ 0    
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

     checks.........................: 100.00% ✓ 99411      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   330 kB/s
     http_req_blocked...............: avg=5.28µs   min=1.33µs  med=3.55µs   max=3.18ms   p(90)=4.91µs   p(95)=5.49µs   p(99.9)=472.8µs 
     http_req_connecting............: avg=1.42µs   min=0s      med=0s       max=2.79ms   p(90)=0s       p(95)=0s       p(99.9)=389.44µs
     http_req_duration..............: avg=180.33ms min=5.92ms  med=164.61ms max=686.7ms  p(90)=208.81ms p(95)=239.81ms p(99.9)=610.66ms
       { expected_response:true }...: avg=180.33ms min=5.92ms  med=164.61ms max=686.7ms  p(90)=208.81ms p(95)=239.81ms p(99.9)=610.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33237
     http_req_receiving.............: avg=95.98µs  min=36.81µs med=89.32µs  max=69.26ms  p(90)=118.96µs p(95)=130.56µs p(99.9)=616.65µs
     http_req_sending...............: avg=27.21µs  min=5.3µs   med=18.55µs  max=61.4ms   p(90)=23.13µs  p(95)=24.89µs  p(99.9)=455.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.21ms min=5.83ms  med=164.5ms  max=686.6ms  p(90)=208.71ms p(95)=239.52ms p(99.9)=610.57ms
     http_reqs......................: 33237   274.751615/s
     iteration_duration.............: avg=181.15ms min=45.3ms  med=164.95ms max=686.96ms p(90)=209.21ms p(95)=240.77ms p(99.9)=610.93ms
     iterations.....................: 33137   273.924971/s
     success_rate...................: 100.00% ✓ 33137      ✗ 0    
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
data_received..................: 1.3 MB 22 kB/s
     data_sent......................: 18 kB  300 B/s
     http_req_blocked...............: avg=15.04µs min=2.86µs   med=3.37µs  max=158.96µs p(90)=8.11µs   p(95)=61.68µs  p(99.9)=157.02µs
     http_req_connecting............: avg=6µs     min=0s       med=0s      max=84.06µs  p(90)=0s       p(95)=29.42µs  p(99.9)=82.97µs 
     http_req_duration..............: avg=2.17s   min=22.96ms  med=28.88ms max=30.02s   p(90)=38.89ms  p(95)=10.53s   p(99.9)=29.63s  
       { expected_response:true }...: avg=2.17s   min=22.96ms  med=28.88ms max=30.02s   p(90)=38.89ms  p(95)=10.53s   p(99.9)=29.63s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 14  
     http_req_receiving.............: avg=214.5µs min=100.52µs med=170.3µs max=671µs    p(90)=335.34µs p(95)=458.97µs p(99.9)=666.76µs
     http_req_sending...............: avg=22.31µs min=14.4µs   med=19.85µs max=42.51µs  p(90)=36.07µs  p(95)=42.2µs   p(99.9)=42.5µs  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.17s   min=22.77ms  med=28.59ms max=30.02s   p(90)=38.32ms  p(95)=10.53s   p(99.9)=29.63s  
     http_reqs......................: 14     0.233329/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
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

     checks.........................: 100.00% ✓ 916797      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 367 MB  3.1 MB/s
     http_req_blocked...............: avg=2.88µs  min=921ns   med=2.09µs  max=15.16ms  p(90)=3.66µs  p(95)=4.41µs   p(99.9)=35.32µs
     http_req_connecting............: avg=306ns   min=0s      med=0s      max=3.51ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.41ms min=1.66ms  med=19.04ms max=282.92ms p(90)=27.12ms p(95)=29.66ms  p(99.9)=48.76ms
       { expected_response:true }...: avg=19.41ms min=1.66ms  med=19.04ms max=282.92ms p(90)=27.12ms p(95)=29.66ms  p(99.9)=48.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305699
     http_req_receiving.............: avg=85.98µs min=25.04µs med=47.4µs  max=99.44ms  p(90)=87.08µs p(95)=123.51µs p(99.9)=6.82ms 
     http_req_sending...............: avg=41.01µs min=4.68µs  med=9.17µs  max=139.74ms p(90)=16.5µs  p(95)=64.8µs   p(99.9)=3.54ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.28ms min=1.56ms  med=18.93ms max=255.7ms  p(90)=26.98ms p(95)=29.47ms  p(99.9)=47.65ms
     http_reqs......................: 305699  2542.765972/s
     iteration_duration.............: avg=19.62ms min=2.86ms  med=19.24ms max=304.73ms p(90)=27.33ms p(95)=29.88ms  p(99.9)=49.31ms
     iterations.....................: 305599  2541.934185/s
     success_rate...................: 100.00% ✓ 305599      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 912366      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 366 MB  3.0 MB/s
     http_req_blocked...............: avg=2.89µs   min=892ns   med=2.12µs   max=5.33ms   p(90)=3.91µs  p(95)=4.69µs  p(99.9)=29.03µs
     http_req_connecting............: avg=310ns    min=0s      med=0s       max=4.21ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.49ms  min=1.51ms  med=18.67ms  max=304.83ms p(90)=28.16ms p(95)=31.69ms p(99.9)=52.81ms
       { expected_response:true }...: avg=19.49ms  min=1.51ms  med=18.67ms  max=304.83ms p(90)=28.16ms p(95)=31.69ms p(99.9)=52.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 304222
     http_req_receiving.............: avg=536.76µs min=51.91µs med=101.02µs max=235.69ms p(90)=1.35ms  p(95)=2.11ms  p(99.9)=17.52ms
     http_req_sending...............: avg=44.5µs   min=4.57µs  med=8.82µs   max=182.56ms p(90)=19.07µs p(95)=87.37µs p(99.9)=3.76ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.91ms  min=1.37ms  med=18.09ms  max=304.27ms p(90)=27.47ms p(95)=30.94ms p(99.9)=51.41ms
     http_reqs......................: 304222  2531.016026/s
     iteration_duration.............: avg=19.71ms  min=2.72ms  med=18.87ms  max=314.01ms p(90)=28.38ms p(95)=31.92ms p(99.9)=53.41ms
     iterations.....................: 304122  2530.184063/s
     success_rate...................: 100.00% ✓ 304122      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 887367      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=2.94µs   min=922ns   med=2.16µs  max=18.5ms   p(90)=3.77µs  p(95)=4.49µs  p(99.9)=31.48µs 
     http_req_connecting............: avg=285ns    min=0s      med=0s      max=3.42ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.05ms  min=1.52ms  med=16.9ms  max=359.7ms  p(90)=32.72ms p(95)=39.93ms p(99.9)=149.44ms
       { expected_response:true }...: avg=20.05ms  min=1.52ms  med=16.9ms  max=359.7ms  p(90)=32.72ms p(95)=39.93ms p(99.9)=149.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295889
     http_req_receiving.............: avg=547.03µs min=50.17µs med=94.77µs max=267.13ms p(90)=1.05ms  p(95)=1.79ms  p(99.9)=26.18ms 
     http_req_sending...............: avg=41.99µs  min=4.57µs  med=9µs     max=156.33ms p(90)=17.59µs p(95)=84.1µs  p(99.9)=2.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.47ms  min=1.42ms  med=16.39ms max=359.61ms p(90)=31.8ms  p(95)=38.89ms p(99.9)=147.77ms
     http_reqs......................: 295889  2461.389405/s
     iteration_duration.............: avg=20.27ms  min=2.57ms  med=17.1ms  max=359.89ms p(90)=32.94ms p(95)=40.16ms p(99.9)=150.43ms
     iterations.....................: 295789  2460.557542/s
     success_rate...................: 100.00% ✓ 295789      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 881349      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 353 MB  2.9 MB/s
     http_req_blocked...............: avg=3.52µs   min=1.03µs  med=2.64µs  max=16.05ms  p(90)=4.28µs  p(95)=5.04µs  p(99.9)=34.26µs 
     http_req_connecting............: avg=329ns    min=0s      med=0s      max=3.62ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.19ms  min=1.68ms  med=16.97ms max=325.98ms p(90)=33.14ms p(95)=40.51ms p(99.9)=139.38ms
       { expected_response:true }...: avg=20.19ms  min=1.68ms  med=16.97ms max=325.98ms p(90)=33.14ms p(95)=40.51ms p(99.9)=139.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293883
     http_req_receiving.............: avg=578.41µs min=51.25µs med=97.33µs max=216.68ms p(90)=1.09ms  p(95)=1.94ms  p(99.9)=27.86ms 
     http_req_sending...............: avg=46.28µs  min=4.7µs   med=9.88µs  max=165.73ms p(90)=18.13µs p(95)=96.28µs p(99.9)=3.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.56ms  min=1.57ms  med=16.45ms max=325.89ms p(90)=32.14ms p(95)=39.35ms p(99.9)=137.17ms
     http_reqs......................: 293883  2444.562517/s
     iteration_duration.............: avg=20.41ms  min=2.58ms  med=17.18ms max=326.19ms p(90)=33.38ms p(95)=40.76ms p(99.9)=140.8ms 
     iterations.....................: 293783  2443.730702/s
     success_rate...................: 100.00% ✓ 293783      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.1-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 825000      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 331 MB  2.7 MB/s
     http_req_blocked...............: avg=3.82µs   min=942ns   med=2.91µs   max=15.78ms  p(90)=4.7µs   p(95)=5.49µs  p(99.9)=35.31µs 
     http_req_connecting............: avg=368ns    min=0s      med=0s       max=3.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.57ms  min=1.94ms  med=18.33ms  max=322.1ms  p(90)=35.05ms p(95)=43ms    p(99.9)=142.28ms
       { expected_response:true }...: avg=21.57ms  min=1.94ms  med=18.33ms  max=322.1ms  p(90)=35.05ms p(95)=43ms    p(99.9)=142.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 275100
     http_req_receiving.............: avg=582.94µs min=51.34µs med=101.52µs max=137.13ms p(90)=1.11ms  p(95)=1.96ms  p(99.9)=28.19ms 
     http_req_sending...............: avg=45.31µs  min=4.76µs  med=11.11µs  max=118.13ms p(90)=20.72µs p(95)=93.78µs p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.95ms  min=1.86ms  med=17.79ms  max=322.01ms p(90)=34.06ms p(95)=41.92ms p(99.9)=141.31ms
     http_reqs......................: 275100  2287.738706/s
     iteration_duration.............: avg=21.8ms   min=2.81ms  med=18.55ms  max=322.29ms p(90)=35.3ms  p(95)=43.26ms p(99.9)=142.66ms
     iterations.....................: 275000  2286.907104/s
     success_rate...................: 100.00% ✓ 275000      ✗ 0     
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

     checks.........................: 100.00% ✓ 586767      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 235 MB  2.0 MB/s
     http_req_blocked...............: avg=3.19µs  min=812ns   med=2.18µs  max=3.39ms   p(90)=4.44µs   p(95)=5.53µs   p(99.9)=41.61µs
     http_req_connecting............: avg=426ns   min=0s      med=0s      max=3.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.42ms min=2.31ms  med=30.03ms max=294.66ms p(90)=40.1ms   p(95)=43.43ms  p(99.9)=63.54ms
       { expected_response:true }...: avg=30.42ms min=2.31ms  med=30.03ms max=294.66ms p(90)=40.1ms   p(95)=43.43ms  p(99.9)=63.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195689
     http_req_receiving.............: avg=92.45µs min=27.42µs med=55.12µs max=106.28ms p(90)=126.22µs p(95)=208.99µs p(99.9)=3.21ms 
     http_req_sending...............: avg=38.29µs min=4.52µs  med=9.25µs  max=106.6ms  p(90)=24.42µs  p(95)=109.2µs  p(99.9)=2.58ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.29ms min=2.15ms  med=29.91ms max=286.7ms  p(90)=39.95ms  p(95)=43.26ms  p(99.9)=63.15ms
     http_reqs......................: 195689  1626.953287/s
     iteration_duration.............: avg=30.66ms min=6.68ms  med=30.25ms max=313.45ms p(90)=40.32ms  p(95)=43.65ms  p(99.9)=63.99ms
     iterations.....................: 195589  1626.12189/s
     success_rate...................: 100.00% ✓ 195589      ✗ 0     
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

     checks.........................: 100.00% ✓ 444420      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=4.04µs  min=1.11µs  med=2.94µs  max=4.66ms   p(90)=4.51µs   p(95)=5.19µs   p(99.9)=36.39µs
     http_req_connecting............: avg=785ns   min=0s      med=0s      max=4.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.24ms min=2.1ms   med=39.83ms max=295.05ms p(90)=55.97ms  p(95)=60.8ms   p(99.9)=84.66ms
       { expected_response:true }...: avg=40.24ms min=2.1ms   med=39.83ms max=295.05ms p(90)=55.97ms  p(95)=60.8ms   p(99.9)=84.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148240
     http_req_receiving.............: avg=79.74µs min=26.71µs med=65.77µs max=110.28ms p(90)=105.19µs p(95)=121.91µs p(99.9)=1ms    
     http_req_sending...............: avg=29.11µs min=5.13µs  med=12.7µs  max=108.64ms p(90)=19.81µs  p(95)=23.82µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.13ms min=2ms     med=39.73ms max=293.02ms p(90)=55.86ms  p(95)=60.69ms  p(99.9)=84.44ms
     http_reqs......................: 148240  1232.41988/s
     iteration_duration.............: avg=40.49ms min=4.05ms  med=40.05ms max=309.54ms p(90)=56.19ms  p(95)=61.02ms  p(99.9)=85.34ms
     iterations.....................: 148140  1231.588512/s
     success_rate...................: 100.00% ✓ 148140      ✗ 0     
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

     checks.........................: 100.00% ✓ 206802     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   688 kB/s
     http_req_blocked...............: avg=4.2µs   min=1.04µs  med=2.63µs  max=3.38ms   p(90)=4.06µs   p(95)=4.66µs   p(99.9)=47.4µs  
     http_req_connecting............: avg=1.33µs  min=0s      med=0s      max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.68ms min=3.92ms  med=84.01ms max=331.7ms  p(90)=106.84ms p(95)=118.63ms p(99.9)=205.24ms
       { expected_response:true }...: avg=86.68ms min=3.92ms  med=84.01ms max=331.7ms  p(90)=106.84ms p(95)=118.63ms p(99.9)=205.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69034
     http_req_receiving.............: avg=78.1µs  min=29.49µs med=71.2µs  max=7.65ms   p(90)=106.49µs p(95)=119.49µs p(99.9)=601.34µs
     http_req_sending...............: avg=23.45µs min=5.18µs  med=12.76µs max=118.7ms  p(90)=19.39µs  p(95)=21.49µs  p(99.9)=580.36µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.58ms min=3.84ms  med=83.9ms  max=331.23ms p(90)=106.73ms p(95)=118.52ms p(99.9)=205.16ms
     http_reqs......................: 69034   572.777076/s
     iteration_duration.............: avg=87.05ms min=19.19ms med=84.26ms max=340.15ms p(90)=107.09ms p(95)=118.87ms p(99.9)=206.45ms
     iterations.....................: 68934   571.947373/s
     success_rate...................: 100.00% ✓ 68934      ✗ 0    
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

     checks.........................: 100.00% ✓ 161367     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   536 kB/s
     http_req_blocked...............: avg=5.41µs   min=1.27µs  med=3.6µs    max=3.42ms   p(90)=5.14µs   p(95)=5.75µs   p(99.9)=83.38µs 
     http_req_connecting............: avg=1.56µs   min=0s      med=0s       max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.09ms min=5.33ms  med=109.01ms max=329.04ms p(90)=147.16ms p(95)=158.24ms p(99.9)=202.83ms
       { expected_response:true }...: avg=111.09ms min=5.33ms  med=109.01ms max=329.04ms p(90)=147.16ms p(95)=158.24ms p(99.9)=202.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53889
     http_req_receiving.............: avg=87.62µs  min=32.23µs med=84.13µs  max=10.86ms  p(90)=115.59µs p(95)=128.28µs p(99.9)=568.88µs
     http_req_sending...............: avg=27.57µs  min=5.72µs  med=18.2µs   max=109.76ms p(90)=23.81µs  p(95)=25.89µs  p(99.9)=553.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.98ms min=5.18ms  med=108.88ms max=328.48ms p(90)=147.02ms p(95)=158.13ms p(99.9)=202.73ms
     http_reqs......................: 53889   446.603165/s
     iteration_duration.............: avg=111.57ms min=32.65ms med=109.34ms max=337.26ms p(90)=147.46ms p(95)=158.54ms p(99.9)=203.83ms
     iterations.....................: 53789   445.774418/s
     success_rate...................: 100.00% ✓ 53789      ✗ 0    
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

     checks.........................: 100.00% ✓ 97074      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   322 kB/s
     http_req_blocked...............: avg=7.17µs   min=1.47µs  med=3.93µs   max=3.57ms   p(90)=5.46µs   p(95)=6.12µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=2.85µs   min=0s      med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=184.65ms min=6.23ms  med=169.55ms max=628.47ms p(90)=215.02ms p(95)=263.27ms p(99.9)=540.48ms
       { expected_response:true }...: avg=184.65ms min=6.23ms  med=169.55ms max=628.47ms p(90)=215.02ms p(95)=263.27ms p(99.9)=540.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32458
     http_req_receiving.............: avg=106.25µs min=38.75µs med=92.68µs  max=149.61ms p(90)=124.73µs p(95)=137.39µs p(99.9)=910.82µs
     http_req_sending...............: avg=32.73µs  min=7.19µs  med=19.26µs  max=137.29ms p(90)=24.25µs  p(95)=26.33µs  p(99.9)=603.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.51ms min=6.1ms   med=169.43ms max=628.36ms p(90)=214.88ms p(95)=262.96ms p(99.9)=540.3ms 
     http_reqs......................: 32458   268.321649/s
     iteration_duration.............: avg=185.51ms min=38.42ms med=169.91ms max=628.73ms p(90)=215.52ms p(95)=265.51ms p(99.9)=540.84ms
     iterations.....................: 32358   267.494975/s
     success_rate...................: 100.00% ✓ 32358      ✗ 0    
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

     checks.........................: 100.00% ✓ 96549      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.04µs   min=1.06µs  med=3.1µs    max=3.95ms   p(90)=4.42µs   p(95)=4.96µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=2.72µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.12ms  
     http_req_duration..............: avg=185.68ms min=7.8ms   med=188.53ms max=377.74ms p(90)=201.84ms p(95)=207.75ms p(99.9)=273.26ms
       { expected_response:true }...: avg=185.68ms min=7.8ms   med=188.53ms max=377.74ms p(90)=201.84ms p(95)=207.75ms p(99.9)=273.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32283
     http_req_receiving.............: avg=92.9µs   min=30.98µs med=89.01µs  max=52.05ms  p(90)=118.48µs p(95)=129.16µs p(99.9)=455.74µs
     http_req_sending...............: avg=33.09µs  min=5.17µs  med=17.61µs  max=107.7ms  p(90)=21.9µs   p(95)=23.64µs  p(99.9)=480.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.56ms min=7.65ms  med=188.42ms max=377.36ms p(90)=201.73ms p(95)=207.62ms p(99.9)=273.1ms 
     http_reqs......................: 32283   266.880437/s
     iteration_duration.............: avg=186.53ms min=22.42ms med=188.83ms max=388.93ms p(90)=202.12ms p(95)=208.01ms p(99.9)=276.21ms
     iterations.....................: 32183   266.053747/s
     success_rate...................: 100.00% ✓ 32183      ✗ 0    
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

     checks.........................: 100.00% ✓ 6735      ✗ 0   
     data_received..................: 224 MB  1.8 MB/s
     data_sent......................: 2.8 MB  22 kB/s
     http_req_blocked...............: avg=100.82µs min=1.25µs  med=3.15µs  max=9.09ms  p(90)=4.68µs   p(95)=5.7µs    p(99.9)=8.8ms 
     http_req_connecting............: avg=93.5µs   min=0s      med=0s      max=8.96ms  p(90)=0s       p(95)=0s       p(99.9)=8.59ms
     http_req_duration..............: avg=2.59s    min=37.47ms med=2.67s   max=4.79s   p(90)=3.37s    p(95)=3.56s    p(99.9)=4.36s 
       { expected_response:true }...: avg=2.59s    min=37.47ms med=2.67s   max=4.79s   p(90)=3.37s    p(95)=3.56s    p(99.9)=4.36s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2345
     http_req_receiving.............: avg=109.24µs min=31.41µs med=90.17µs max=16.14ms p(90)=132.94µs p(95)=148.66µs p(99.9)=5.89ms
     http_req_sending...............: avg=66.04µs  min=5.92µs  med=17.97µs max=9.49ms  p(90)=22.89µs  p(95)=28.38µs  p(99.9)=3.59ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.59s    min=37.27ms med=2.67s   max=4.79s   p(90)=3.37s    p(95)=3.56s    p(99.9)=4.36s 
     http_reqs......................: 2345    18.48149/s
     iteration_duration.............: avg=2.7s     min=1.01s   med=2.69s   max=4.79s   p(90)=3.38s    p(95)=3.58s    p(99.9)=4.37s 
     iterations.....................: 2245    17.693367/s
     success_rate...................: 100.00% ✓ 2245      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

