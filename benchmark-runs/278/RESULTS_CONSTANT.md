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
| hive-router | v0.0.78 | 2,898 | 3,189 | 2,862 | 3.8% |  |
| fusion-nightly | 16.5.0-p.10 | 2,417 | 2,510 | 2,402 | 1.5% |  |
| fusion-nightly-net11 | 16.5.0-p.10 | 2,408 | 2,526 | 2,394 | 2.0% |  |
| fusion | 16.4.0 | 2,312 | 2,396 | 2,301 | 1.4% |  |
| grafbase | 0.53.5 | 2,117 | 2,233 | 2,104 | 2.1% |  |
| cosmo | 0.329.0 | 1,300 | 1,343 | 1,293 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 618 | 639 | 615 | 1.3% |  |
| apollo-router | v2.16.0 | 489 | 508 | 486 | 1.7% |  |
| hive-gateway | 2.10.2 | 279 | 285 | 278 | 0.9% |  |
| apollo-gateway | 2.14.2 | 277 | 283 | 276 | 1.0% |  |
| feddi | 77271dc84a06 | 1 | 1 | 1 | 0.0% | non-compatible response (149 across 1/2 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.5.0-p.10 | 2,380 | 2,473 | 2,365 | 1.6% |  |
| hive-router | v0.0.78 | 2,337 | 2,521 | 2,321 | 2.9% |  |
| fusion | 16.4.0 | 2,280 | 2,379 | 2,199 | 2.5% |  |
| fusion-nightly | 16.5.0-p.10 | 2,243 | 2,357 | 2,226 | 1.9% |  |
| fusion-nightly-fed | 16.5.0-p.10 | 2,207 | 2,296 | 2,200 | 1.5% |  |
| grafbase | 0.53.5 | 1,628 | 1,693 | 1,612 | 1.7% |  |
| cosmo | 0.329.0 | 1,235 | 1,274 | 1,233 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.2 | 582 | 601 | 579 | 1.3% |  |
| apollo-router | v2.16.0 | 443 | 453 | 432 | 1.7% |  |
| apollo-gateway | 2.14.2 | 273 | 276 | 271 | 0.6% |  |
| hive-gateway | 2.10.2 | 263 | 271 | 262 | 1.2% |  |
| feddi | 77271dc84a06 | 22 | 23 | 22 | 2.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1044792     ✗ 0     
     data_received..................: 31 GB   254 MB/s
     data_sent......................: 419 MB  3.5 MB/s
     http_req_blocked...............: avg=2.54µs  min=861ns   med=1.88µs  max=12.87ms  p(90)=3.02µs  p(95)=3.58µs   p(99.9)=30.04µs
     http_req_connecting............: avg=238ns   min=0s      med=0s      max=3.6ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.02ms min=1.4ms   med=16.32ms max=254.98ms p(90)=25.02ms p(95)=28.15ms  p(99.9)=47ms   
       { expected_response:true }...: avg=17.02ms min=1.4ms   med=16.32ms max=254.98ms p(90)=25.02ms p(95)=28.15ms  p(99.9)=47ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 348364
     http_req_receiving.............: avg=83.22µs min=24.28µs med=43.91µs max=100.22ms p(90)=77.84µs p(95)=120.65µs p(99.9)=7.62ms 
     http_req_sending...............: avg=44.75µs min=4.48µs  med=7.99µs  max=207.03ms p(90)=13.52µs p(95)=76.63µs  p(99.9)=6.03ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.89ms min=1.35ms  med=16.21ms max=254.37ms p(90)=24.85ms p(95)=27.91ms  p(99.9)=45.88ms
     http_reqs......................: 348364  2898.629056/s
     iteration_duration.............: avg=17.22ms min=1.97ms  med=16.5ms  max=344.81ms p(90)=25.22ms p(95)=28.37ms  p(99.9)=47.94ms
     iterations.....................: 348264  2897.796987/s
     success_rate...................: 100.00% ✓ 348264      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 871800      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=2.93µs   min=1.03µs  med=2.37µs  max=17.81ms  p(90)=3.61µs  p(95)=4.17µs  p(99.9)=33.58µs 
     http_req_connecting............: avg=135ns    min=0s      med=0s      max=1.79ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.42ms  min=2.01ms  med=17.39ms max=333.73ms p(90)=33.36ms p(95)=40.65ms p(99.9)=137.69ms
       { expected_response:true }...: avg=20.42ms  min=2.01ms  med=17.39ms max=333.73ms p(90)=33.36ms p(95)=40.65ms p(99.9)=137.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290700
     http_req_receiving.............: avg=629.85µs min=51.68µs med=96.26µs max=213.93ms p(90)=1.15ms  p(95)=2.08ms  p(99.9)=27.56ms 
     http_req_sending...............: avg=41.74µs  min=4.75µs  med=8.9µs   max=151.29ms p(90)=14.68µs p(95)=78.89µs p(99.9)=3.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.75ms  min=1.89ms  med=16.82ms max=331.8ms  p(90)=32.26ms p(95)=39.34ms p(99.9)=136.21ms
     http_reqs......................: 290700  2417.436436/s
     iteration_duration.............: avg=20.63ms  min=2.57ms  med=17.58ms max=333.98ms p(90)=33.58ms p(95)=40.88ms p(99.9)=138.84ms
     iterations.....................: 290600  2416.604845/s
     success_rate...................: 100.00% ✓ 290600      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 868707      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=3.15µs   min=1.04µs  med=2.34µs   max=12.68ms  p(90)=3.62µs  p(95)=4.19µs  p(99.9)=33.69µs
     http_req_connecting............: avg=315ns    min=0s      med=0s       max=3.9ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.49ms  min=2ms     med=19.61ms  max=297.38ms p(90)=29.7ms  p(95)=33.47ms p(99.9)=54.84ms
       { expected_response:true }...: avg=20.49ms  min=2ms     med=19.61ms  max=297.38ms p(90)=29.7ms  p(95)=33.47ms p(99.9)=54.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289669
     http_req_receiving.............: avg=749.31µs min=51.06µs med=129.84µs max=40.37ms  p(90)=1.82ms  p(95)=2.69ms  p(99.9)=20.58ms
     http_req_sending...............: avg=43.06µs  min=4.92µs  med=8.91µs   max=155.24ms p(90)=15.26µs p(95)=84.66µs p(99.9)=3.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.7ms   min=1.92ms  med=18.81ms  max=286.81ms p(90)=28.78ms p(95)=32.45ms p(99.9)=52.91ms
     http_reqs......................: 289669  2408.809659/s
     iteration_duration.............: avg=20.71ms  min=3.44ms  med=19.8ms   max=307.79ms p(90)=29.91ms p(95)=33.7ms  p(99.9)=55.33ms
     iterations.....................: 289569  2407.978086/s
     success_rate...................: 100.00% ✓ 289569      ✗ 0     
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

     checks.........................: 100.00% ✓ 834144      ✗ 0     
     data_received..................: 24 GB   203 MB/s
     data_sent......................: 334 MB  2.8 MB/s
     http_req_blocked...............: avg=2.52µs   min=812ns   med=1.79µs  max=12.03ms  p(90)=2.86µs  p(95)=3.35µs  p(99.9)=26.1µs  
     http_req_connecting............: avg=327ns    min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.36ms  min=2.09ms  med=18.09ms max=328.92ms p(90)=34.86ms p(95)=42.72ms p(99.9)=148.21ms
       { expected_response:true }...: avg=21.36ms  min=2.09ms  med=18.09ms max=328.92ms p(90)=34.86ms p(95)=42.72ms p(99.9)=148.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 278148
     http_req_receiving.............: avg=630.09µs min=48.23µs med=93.86µs max=274.78ms p(90)=1.12ms  p(95)=1.98ms  p(99.9)=27.74ms 
     http_req_sending...............: avg=35.42µs  min=4.42µs  med=7.89µs  max=175.77ms p(90)=13.13µs p(95)=26.4µs  p(99.9)=2.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.7ms   min=1.99ms  med=17.51ms max=328.84ms p(90)=33.81ms p(95)=41.48ms p(99.9)=146.26ms
     http_reqs......................: 278148  2312.810738/s
     iteration_duration.............: avg=21.57ms  min=3.15ms  med=18.28ms max=329.07ms p(90)=35.07ms p(95)=42.95ms p(99.9)=149.61ms
     iterations.....................: 278048  2311.979235/s
     success_rate...................: 100.00% ✓ 278048      ✗ 0     
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

     checks.........................: 100.00% ✓ 763329      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=2.88µs  min=832ns   med=2.06µs  max=10.54ms  p(90)=3.45µs  p(95)=4.17µs   p(99.9)=33.54µs
     http_req_connecting............: avg=380ns   min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.36ms min=1.67ms  med=23.11ms max=289.97ms p(90)=27.65ms p(95)=29.37ms  p(99.9)=47.4ms 
       { expected_response:true }...: avg=23.36ms min=1.67ms  med=23.11ms max=289.97ms p(90)=27.65ms p(95)=29.37ms  p(99.9)=47.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 254543
     http_req_receiving.............: avg=83.43µs min=25.59µs med=54.11µs max=29.53ms  p(90)=91.86µs p(95)=116.11µs p(99.9)=4.66ms 
     http_req_sending...............: avg=34.13µs min=4.6µs   med=9.22µs  max=98.15ms  p(90)=15.68µs p(95)=23.55µs  p(99.9)=1.66ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.24ms min=1.62ms  med=23.02ms max=289.7ms  p(90)=27.53ms p(95)=29.19ms  p(99.9)=46.44ms
     http_reqs......................: 254543  2117.274321/s
     iteration_duration.............: avg=23.57ms min=5.45ms  med=23.3ms  max=301.21ms p(90)=27.85ms p(95)=29.57ms  p(99.9)=47.8ms 
     iterations.....................: 254443  2116.442526/s
     success_rate...................: 100.00% ✓ 254443      ✗ 0     
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

     checks.........................: 100.00% ✓ 469128      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 188 MB  1.6 MB/s
     http_req_blocked...............: avg=2.91µs  min=901ns   med=1.98µs  max=3.93ms   p(90)=3.35µs  p(95)=3.99µs   p(99.9)=28.72µs 
     http_req_connecting............: avg=618ns   min=0s      med=0s      max=3.88ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.14ms min=2.07ms  med=37.76ms max=308.26ms p(90)=53.38ms p(95)=58.04ms  p(99.9)=80.5ms  
       { expected_response:true }...: avg=38.14ms min=2.07ms  med=37.76ms max=308.26ms p(90)=53.38ms p(95)=58.04ms  p(99.9)=80.5ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 156476
     http_req_receiving.............: avg=68.07µs min=25.98µs med=55.82µs max=109.43ms p(90)=90.4µs  p(95)=105.11µs p(99.9)=807.63µs
     http_req_sending...............: avg=22.45µs min=4.93µs  med=9.79µs  max=122.77ms p(90)=16.1µs  p(95)=19.91µs  p(99.9)=912.6µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.05ms min=1.93ms  med=37.68ms max=307.72ms p(90)=53.29ms p(95)=57.94ms  p(99.9)=80.3ms  
     http_reqs......................: 156476  1300.919646/s
     iteration_duration.............: avg=38.36ms min=3.02ms  med=37.96ms max=323.62ms p(90)=53.58ms p(95)=58.24ms  p(99.9)=81.03ms 
     iterations.....................: 156376  1300.08826/s
     success_rate...................: 100.00% ✓ 156376      ✗ 0     
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

     checks.........................: 100.00% ✓ 223266     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 90 MB   743 kB/s
     http_req_blocked...............: avg=6.83µs  min=1.16µs  med=3µs     max=8.43ms   p(90)=4.45µs   p(95)=5.09µs   p(99.9)=42.97µs 
     http_req_connecting............: avg=3.45µs  min=0s      med=0s      max=8.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.29ms min=3.57ms  med=78.57ms max=314.61ms p(90)=98.09ms  p(95)=107.28ms p(99.9)=188.6ms 
       { expected_response:true }...: avg=80.29ms min=3.57ms  med=78.57ms max=314.61ms p(90)=98.09ms  p(95)=107.28ms p(99.9)=188.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 74522
     http_req_receiving.............: avg=79.47µs min=28.96µs med=68.96µs max=105.24ms p(90)=104.02µs p(95)=116.7µs  p(99.9)=653.78µs
     http_req_sending...............: avg=23.96µs min=5.15µs  med=12.96µs max=93.37ms  p(90)=19.35µs  p(95)=21.62µs  p(99.9)=771.72µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.19ms min=3.5ms   med=78.47ms max=312.64ms p(90)=97.98ms  p(95)=107.16ms p(99.9)=188.04ms
     http_reqs......................: 74522   618.548211/s
     iteration_duration.............: avg=80.63ms min=19.75ms med=78.81ms max=327.74ms p(90)=98.33ms  p(95)=107.52ms p(99.9)=189.92ms
     iterations.....................: 74422   617.71819/s
     success_rate...................: 100.00% ✓ 74422      ✗ 0    
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

     checks.........................: 100.00% ✓ 176763     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   588 kB/s
     http_req_blocked...............: avg=4.69µs   min=1.11µs  med=2.99µs   max=3.92ms   p(90)=4.45µs   p(95)=4.99µs   p(99.9)=50.6µs  
     http_req_connecting............: avg=1.5µs    min=0s      med=0s       max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.43ms min=4.44ms  med=101.17ms max=328.64ms p(90)=122.28ms p(95)=128.52ms p(99.9)=157.52ms
       { expected_response:true }...: avg=101.43ms min=4.44ms  med=101.17ms max=328.64ms p(90)=122.28ms p(95)=128.52ms p(99.9)=157.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 59021
     http_req_receiving.............: avg=85.84µs  min=29.67µs med=75.72µs  max=186.59ms p(90)=108.33µs p(95)=121.89µs p(99.9)=577.84µs
     http_req_sending...............: avg=21.83µs  min=5.43µs  med=15.08µs  max=88.16ms  p(90)=20.87µs  p(95)=22.77µs  p(99.9)=556.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.33ms min=4.38ms  med=101.07ms max=328.25ms p(90)=122.18ms p(95)=128.41ms p(99.9)=157.25ms
     http_reqs......................: 59021   489.436013/s
     iteration_duration.............: avg=101.85ms min=31.32ms med=101.45ms max=343.64ms p(90)=122.55ms p(95)=128.78ms p(99.9)=158.7ms 
     iterations.....................: 58921   488.606755/s
     success_rate...................: 100.00% ✓ 58921      ✗ 0    
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

     checks.........................: 100.00% ✓ 101211     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=12.63µs  min=1.54µs  med=3.78µs   max=10.22ms  p(90)=5.28µs   p(95)=5.93µs   p(99.9)=5.04ms  
     http_req_connecting............: avg=8.41µs   min=0s      med=0s       max=10.15ms  p(90)=0s       p(95)=0s       p(99.9)=4.92ms  
     http_req_duration..............: avg=177.14ms min=5.47ms  med=162.35ms max=683.38ms p(90)=203.77ms p(95)=242.94ms p(99.9)=593.91ms
       { expected_response:true }...: avg=177.14ms min=5.47ms  med=162.35ms max=683.38ms p(90)=203.77ms p(95)=242.94ms p(99.9)=593.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33837
     http_req_receiving.............: avg=92.58µs  min=37.07µs med=88.51µs  max=22.13ms  p(90)=118.43µs p(95)=129.51µs p(99.9)=631.09µs
     http_req_sending...............: avg=30.24µs  min=6.46µs  med=18.55µs  max=90.32ms  p(90)=23.39µs  p(95)=25.26µs  p(99.9)=1.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.01ms min=5.39ms  med=162.24ms max=683.28ms p(90)=203.62ms p(95)=242.86ms p(99.9)=593.81ms
     http_reqs......................: 33837   279.894724/s
     iteration_duration.............: avg=177.94ms min=46.37ms med=162.68ms max=683.59ms p(90)=204.18ms p(95)=243.86ms p(99.9)=594.33ms
     iterations.....................: 33737   279.067538/s
     success_rate...................: 100.00% ✓ 33737      ✗ 0    
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

     checks.........................: 100.00% ✓ 100197     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   333 kB/s
     http_req_blocked...............: avg=6.64µs   min=1.41µs  med=3.38µs   max=4.16ms   p(90)=4.66µs   p(95)=5.2µs    p(99.9)=1.4ms   
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=178.92ms min=7.5ms   med=202.61ms max=377.88ms p(90)=218.01ms p(95)=221.06ms p(99.9)=293.16ms
       { expected_response:true }...: avg=178.92ms min=7.5ms   med=202.61ms max=377.88ms p(90)=218.01ms p(95)=221.06ms p(99.9)=293.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33499
     http_req_receiving.............: avg=89.77µs  min=34.23µs med=84.17µs  max=94.34ms  p(90)=114.59µs p(95)=125.35µs p(99.9)=405.54µs
     http_req_sending...............: avg=30.29µs  min=6.16µs  med=16.67µs  max=100.62ms p(90)=20.99µs  p(95)=22.74µs  p(99.9)=482.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.8ms  min=7.38ms  med=202.42ms max=377.34ms p(90)=217.91ms p(95)=220.95ms p(99.9)=293.07ms
     http_reqs......................: 33499   277.017511/s
     iteration_duration.............: avg=179.74ms min=14.58ms med=203.93ms max=391.43ms p(90)=218.29ms p(95)=221.36ms p(99.9)=297.82ms
     iterations.....................: 33399   276.190568/s
     success_rate...................: 100.00% ✓ 33399      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
data_received..................: 8.0 MB 134 kB/s
     data_sent......................: 102 kB 1.7 kB/s
     http_req_blocked...............: avg=34.63µs  min=2.6µs   med=3.57µs  max=2.57ms   p(90)=5.24µs   p(95)=6.04µs   p(99.9)=2.36ms  
     http_req_connecting............: avg=26.71µs  min=0s      med=0s      max=2.24ms   p(90)=0s       p(95)=0s       p(99.9)=2.05ms  
     http_req_duration..............: avg=387.9ms  min=21.4ms  med=30.18ms max=30.02s   p(90)=39.82ms  p(95)=40.53ms  p(99.9)=27.53s  
       { expected_response:true }...: avg=387.9ms  min=21.4ms  med=30.18ms max=30.02s   p(90)=39.82ms  p(95)=40.53ms  p(99.9)=27.53s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 84  
     http_req_receiving.............: avg=115.93µs min=69.25µs med=91.47µs max=360.8µs  p(90)=149.93µs p(95)=190.85µs p(99.9)=360.36µs
     http_req_sending...............: avg=20.12µs  min=13.75µs med=18.36µs max=111.74µs p(90)=20.8µs   p(95)=21.67µs  p(99.9)=108.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.76ms min=21.3ms  med=29.94ms max=30.02s   p(90)=39.69ms  p(95)=40.43ms  p(99.9)=27.53s  
     http_reqs......................: 84     1.399987/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 858264      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.97µs   min=862ns   med=2.09µs   max=14.79ms  p(90)=3.92µs  p(95)=4.71µs  p(99.9)=30.83µs
     http_req_connecting............: avg=336ns    min=0s      med=0s       max=3.72ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.74ms  min=1.51ms  med=19.93ms  max=286.06ms p(90)=29.71ms p(95)=33.26ms p(99.9)=53.61ms
       { expected_response:true }...: avg=20.74ms  min=1.51ms  med=19.93ms  max=286.06ms p(90)=29.71ms p(95)=33.26ms p(99.9)=53.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286188
     http_req_receiving.............: avg=821.49µs min=50.46µs med=141.44µs max=264.52ms p(90)=2.03ms  p(95)=2.99ms  p(99.9)=20.19ms
     http_req_sending...............: avg=40.52µs  min=4.44µs  med=8.68µs   max=135.65ms p(90)=18.43µs p(95)=78.9µs  p(99.9)=3.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.88ms  min=1.44ms  med=19.07ms  max=254.02ms p(90)=28.69ms p(95)=32.16ms p(99.9)=51.4ms 
     http_reqs......................: 286188  2380.879305/s
     iteration_duration.............: avg=20.96ms  min=2.95ms  med=20.14ms  max=295.83ms p(90)=29.92ms p(95)=33.48ms p(99.9)=54.09ms
     iterations.....................: 286088  2380.047377/s
     success_rate...................: 100.00% ✓ 286088      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 842802      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 338 MB  2.8 MB/s
     http_req_blocked...............: avg=3.48µs  min=1.03µs  med=2.71µs  max=12.83ms  p(90)=4.22µs  p(95)=4.93µs   p(99.9)=37.99µs
     http_req_connecting............: avg=327ns   min=0s      med=0s      max=3.51ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.13ms min=1.69ms  med=20.99ms max=295.73ms p(90)=29.41ms p(95)=31.86ms  p(99.9)=50.39ms
       { expected_response:true }...: avg=21.13ms min=1.69ms  med=20.99ms max=295.73ms p(90)=29.41ms p(95)=31.86ms  p(99.9)=50.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 281034
     http_req_receiving.............: avg=91.25µs min=27.18µs med=55.57µs max=34.84ms  p(90)=94.89µs p(95)=124.65µs p(99.9)=6.36ms 
     http_req_sending...............: avg=40.6µs  min=4.72µs  med=10.99µs max=132.39ms p(90)=18.3µs  p(95)=44.84µs  p(99.9)=2.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.99ms min=1.64ms  med=20.87ms max=295.1ms  p(90)=29.27ms p(95)=31.69ms  p(99.9)=49.42ms
     http_reqs......................: 281034  2337.490029/s
     iteration_duration.............: avg=21.34ms min=3.14ms  med=21.2ms  max=304.34ms p(90)=29.62ms p(95)=32.08ms  p(99.9)=50.72ms
     iterations.....................: 280934  2336.658282/s
     success_rate...................: 100.00% ✓ 280934      ✗ 0     
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

     checks.........................: 100.00% ✓ 822114      ✗ 0     
     data_received..................: 24 GB   200 MB/s
     data_sent......................: 329 MB  2.7 MB/s
     http_req_blocked...............: avg=2.81µs   min=891ns   med=1.94µs  max=15.86ms  p(90)=3.28µs  p(95)=3.93µs  p(99.9)=29.12µs 
     http_req_connecting............: avg=312ns    min=0s      med=0s      max=3.72ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.67ms  min=1.69ms  med=17.77ms max=367.61ms p(90)=35.8ms  p(95)=44.51ms p(99.9)=173.76ms
       { expected_response:true }...: avg=21.67ms  min=1.69ms  med=17.77ms max=367.61ms p(90)=35.8ms  p(95)=44.51ms p(99.9)=173.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 274138
     http_req_receiving.............: avg=654.23µs min=51.58µs med=99.49µs max=234.76ms p(90)=1.15ms  p(95)=1.97ms  p(99.9)=31.19ms 
     http_req_sending...............: avg=34.89µs  min=4.42µs  med=8.52µs  max=56.27ms  p(90)=15.69µs p(95)=37.03µs p(99.9)=2.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.98ms  min=1.58ms  med=17.21ms max=367.17ms p(90)=34.65ms p(95)=43.17ms p(99.9)=170.58ms
     http_reqs......................: 274138  2280.405511/s
     iteration_duration.............: avg=21.88ms  min=2.51ms  med=17.97ms max=367.8ms  p(90)=36.01ms p(95)=44.73ms p(99.9)=174.26ms
     iterations.....................: 274038  2279.573665/s
     success_rate...................: 100.00% ✓ 274038      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 808704      ✗ 0     
     data_received..................: 24 GB   197 MB/s
     data_sent......................: 324 MB  2.7 MB/s
     http_req_blocked...............: avg=2.74µs   min=852ns   med=2µs      max=15.36ms  p(90)=3.35µs  p(95)=4.01µs  p(99.9)=30.08µs 
     http_req_connecting............: avg=275ns    min=0s      med=0s       max=3.18ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.03ms  min=1.65ms  med=18.06ms  max=392.57ms p(90)=36.47ms p(95)=44.95ms p(99.9)=172.94ms
       { expected_response:true }...: avg=22.03ms  min=1.65ms  med=18.06ms  max=392.57ms p(90)=36.47ms p(95)=44.95ms p(99.9)=172.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 269668
     http_req_receiving.............: avg=672.35µs min=52.35µs med=100.07µs max=184.9ms  p(90)=1.19ms  p(95)=2.05ms  p(99.9)=31.29ms 
     http_req_sending...............: avg=35.75µs  min=4.69µs  med=8.6µs    max=40.36ms  p(90)=15.86µs p(95)=39.75µs p(99.9)=2.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.32ms  min=1.54ms  med=17.46ms  max=391.27ms p(90)=35.27ms p(95)=43.52ms p(99.9)=171.97ms
     http_reqs......................: 269668  2243.146848/s
     iteration_duration.............: avg=22.24ms  min=2.9ms   med=18.27ms  max=392.76ms p(90)=36.69ms p(95)=45.17ms p(99.9)=174.22ms
     iterations.....................: 269568  2242.31503/s
     success_rate...................: 100.00% ✓ 269568      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 796068      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 319 MB  2.7 MB/s
     http_req_blocked...............: avg=2.99µs   min=872ns   med=2.16µs   max=10.24ms  p(90)=3.86µs  p(95)=4.65µs  p(99.9)=32.88µs 
     http_req_connecting............: avg=361ns    min=0s      med=0s       max=4.02ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.38ms  min=1.94ms  med=18.74ms  max=362.66ms p(90)=36.22ms p(95)=44.83ms p(99.9)=163.07ms
       { expected_response:true }...: avg=22.38ms  min=1.94ms  med=18.74ms  max=362.66ms p(90)=36.22ms p(95)=44.83ms p(99.9)=163.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 265456
     http_req_receiving.............: avg=610.59µs min=50.45µs med=100.05µs max=164.21ms p(90)=1.16ms  p(95)=1.97ms  p(99.9)=29.16ms 
     http_req_sending...............: avg=38.32µs  min=4.84µs  med=9.3µs    max=36.1ms   p(90)=19.17µs p(95)=45.5µs  p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.73ms  min=1.81ms  med=18.18ms  max=362.58ms p(90)=35.13ms p(95)=43.62ms p(99.9)=161.57ms
     http_reqs......................: 265456  2207.518121/s
     iteration_duration.............: avg=22.6ms   min=3.12ms  med=18.95ms  max=362.84ms p(90)=36.45ms p(95)=45.06ms p(99.9)=163.59ms
     iterations.....................: 265356  2206.686526/s
     success_rate...................: 100.00% ✓ 265356      ✗ 0     
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

     checks.........................: 100.00% ✓ 587373      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 235 MB  2.0 MB/s
     http_req_blocked...............: avg=4.16µs   min=961ns   med=3.01µs  max=15.7ms   p(90)=5.28µs   p(95)=6.4µs    p(99.9)=49.17µs
     http_req_connecting............: avg=472ns    min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.37ms  min=2.17ms  med=29.78ms max=297.81ms p(90)=40.15ms  p(95)=43.69ms  p(99.9)=63.82ms
       { expected_response:true }...: avg=30.37ms  min=2.17ms  med=29.78ms max=297.81ms p(90)=40.15ms  p(95)=43.69ms  p(99.9)=63.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195891
     http_req_receiving.............: avg=105.75µs min=28.45µs med=61.84µs max=83.98ms  p(90)=134.11µs p(95)=222.91µs p(99.9)=4.75ms 
     http_req_sending...............: avg=45.9µs   min=4.89µs  med=11.43µs max=183.45ms p(90)=25.65µs  p(95)=117.94µs p(99.9)=3.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.22ms  min=2.09ms  med=29.64ms max=297.28ms p(90)=39.99ms  p(95)=43.51ms  p(99.9)=63.18ms
     http_reqs......................: 195891  1628.575138/s
     iteration_duration.............: avg=30.63ms  min=5.22ms  med=30.01ms max=316.72ms p(90)=40.39ms  p(95)=43.93ms  p(99.9)=64.55ms
     iterations.....................: 195791  1627.74377/s
     success_rate...................: 100.00% ✓ 195791      ✗ 0     
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

     checks.........................: 100.00% ✓ 445605      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=5.14µs  min=1.14µs med=3.13µs  max=7.63ms   p(90)=4.77µs   p(95)=5.51µs   p(99.9)=40.43µs
     http_req_connecting............: avg=1.6µs   min=0s     med=0s      max=7.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.12ms min=2.2ms  med=39.73ms max=293.73ms p(90)=55.48ms  p(95)=60.3ms   p(99.9)=82.95ms
       { expected_response:true }...: avg=40.12ms min=2.2ms  med=39.73ms max=293.73ms p(90)=55.48ms  p(95)=60.3ms   p(99.9)=82.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148635
     http_req_receiving.............: avg=85.51µs min=27.6µs med=69.72µs max=141.29ms p(90)=109.59µs p(95)=127.28µs p(99.9)=1.13ms 
     http_req_sending...............: avg=30.18µs min=5µs    med=13.36µs max=123.75ms p(90)=20.27µs  p(95)=24.26µs  p(99.9)=1.43ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.01ms min=2.08ms med=39.62ms max=291.76ms p(90)=55.36ms  p(95)=60.18ms  p(99.9)=82.64ms
     http_reqs......................: 148635  1235.576195/s
     iteration_duration.............: avg=40.38ms min=4.25ms med=39.96ms max=314.67ms p(90)=55.7ms   p(95)=60.53ms  p(99.9)=83.32ms
     iterations.....................: 148535  1234.744913/s
     success_rate...................: 100.00% ✓ 148535      ✗ 0     
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

     checks.........................: 100.00% ✓ 210156     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   699 kB/s
     http_req_blocked...............: avg=5.01µs  min=1.22µs  med=3.37µs  max=4.16ms   p(90)=4.91µs   p(95)=5.6µs    p(99.9)=48.41µs 
     http_req_connecting............: avg=1.36µs  min=0s      med=0s      max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.28ms min=3.93ms  med=83.1ms  max=312.98ms p(90)=105.03ms p(95)=115.49ms p(99.9)=205.84ms
       { expected_response:true }...: avg=85.28ms min=3.93ms  med=83.1ms  max=312.98ms p(90)=105.03ms p(95)=115.49ms p(99.9)=205.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70152
     http_req_receiving.............: avg=85.1µs  min=30.9µs  med=75.42µs max=90.59ms  p(90)=110.85µs p(95)=124.11µs p(99.9)=672.38µs
     http_req_sending...............: avg=21.26µs min=5.58µs  med=15.04µs max=52.28ms  p(90)=21.73µs  p(95)=24.08µs  p(99.9)=629.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.17ms min=3.85ms  med=83.01ms max=312.82ms p(90)=104.92ms p(95)=115.36ms p(99.9)=205.53ms
     http_reqs......................: 70152   582.033695/s
     iteration_duration.............: avg=85.65ms min=24.77ms med=83.35ms max=333.52ms p(90)=105.28ms p(95)=115.76ms p(99.9)=208.79ms
     iterations.....................: 70052   581.20402/s
     success_rate...................: 100.00% ✓ 70052      ✗ 0    
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

     checks.........................: 100.00% ✓ 160392     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   533 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.33µs  med=3.65µs   max=3.9ms    p(90)=5.19µs   p(95)=5.82µs   p(99.9)=85.85µs 
     http_req_connecting............: avg=1.69µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.76ms min=5.07ms  med=109.69ms max=312.8ms  p(90)=147.87ms p(95)=159.07ms p(99.9)=206.11ms
       { expected_response:true }...: avg=111.76ms min=5.07ms  med=109.69ms max=312.8ms  p(90)=147.87ms p(95)=159.07ms p(99.9)=206.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53564
     http_req_receiving.............: avg=87.67µs  min=31.19µs med=82.32µs  max=35.65ms  p(90)=113.81µs p(95)=126.02µs p(99.9)=587.83µs
     http_req_sending...............: avg=28.56µs  min=6.15µs  med=17.48µs  max=126.76ms p(90)=23.01µs  p(95)=25.01µs  p(99.9)=575.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.65ms min=4.93ms  med=109.58ms max=294.98ms p(90)=147.74ms p(95)=158.93ms p(99.9)=205.87ms
     http_reqs......................: 53564   443.985385/s
     iteration_duration.............: avg=112.25ms min=28.19ms med=110.02ms max=335.45ms p(90)=148.15ms p(95)=159.36ms p(99.9)=209.03ms
     iterations.....................: 53464   443.156497/s
     success_rate...................: 100.00% ✓ 53464      ✗ 0    
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

     checks.........................: 100.00% ✓ 98793      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=12.84µs  min=1.42µs  med=3.61µs   max=8.9ms    p(90)=5.05µs   p(95)=5.64µs   p(99.9)=5.29ms  
     http_req_connecting............: avg=8.65µs   min=0s      med=0s       max=8.84ms   p(90)=0s       p(95)=0s       p(99.9)=5.14ms  
     http_req_duration..............: avg=181.45ms min=7.91ms  med=182.45ms max=375.26ms p(90)=192.53ms p(95)=195.62ms p(99.9)=263.6ms 
       { expected_response:true }...: avg=181.45ms min=7.91ms  med=182.45ms max=375.26ms p(90)=192.53ms p(95)=195.62ms p(99.9)=263.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33031
     http_req_receiving.............: avg=98.3µs   min=35.37µs med=90.01µs  max=144.01ms p(90)=121.23µs p(95)=132.81µs p(99.9)=599.98µs
     http_req_sending...............: avg=26.3µs   min=6.16µs  med=18.31µs  max=53.78ms  p(90)=23.28µs  p(95)=25.3µs   p(99.9)=827.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.32ms min=7.73ms  med=182.34ms max=373.74ms p(90)=192.41ms p(95)=195.49ms p(99.9)=263.29ms
     http_reqs......................: 33031   273.04199/s
     iteration_duration.............: avg=182.28ms min=57.82ms med=182.79ms max=409.58ms p(90)=192.82ms p(95)=195.9ms  p(99.9)=264.41ms
     iterations.....................: 32931   272.215367/s
     success_rate...................: 100.00% ✓ 32931      ✗ 0    
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

     checks.........................: 100.00% ✓ 95238      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.39µs   min=1µs     med=3.2µs    max=4.21ms   p(90)=4.56µs   p(95)=5.14µs   p(99.9)=1.28ms  
     http_req_connecting............: avg=2.98µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=188.29ms min=5.96ms  med=173.32ms max=633.42ms p(90)=225.27ms p(95)=262.33ms p(99.9)=563.63ms
       { expected_response:true }...: avg=188.29ms min=5.96ms  med=173.32ms max=633.42ms p(90)=225.27ms p(95)=262.33ms p(99.9)=563.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31846
     http_req_receiving.............: avg=93.51µs  min=30.79µs med=91.2µs   max=10.06ms  p(90)=122.24µs p(95)=134.72µs p(99.9)=566.77µs
     http_req_sending...............: avg=24.48µs  min=5.46µs  med=17.28µs  max=73.87ms  p(90)=21.75µs  p(95)=23.53µs  p(99.9)=493.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.17ms min=5.84ms  med=173.2ms  max=633.33ms p(90)=225.13ms p(95)=262.21ms p(99.9)=563.54ms
     http_reqs......................: 31846   263.005174/s
     iteration_duration.............: avg=189.16ms min=22.07ms med=173.71ms max=633.62ms p(90)=225.69ms p(95)=264.22ms p(99.9)=564.04ms
     iterations.....................: 31746   262.179309/s
     success_rate...................: 100.00% ✓ 31746      ✗ 0    
     vus............................: 10      min=10       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 8142      ✗ 0   
     data_received..................: 269 MB  2.1 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=38.11µs  min=1.09µs  med=3.65µs  max=4.14ms  p(90)=5.29µs  p(95)=6.27µs   p(99.9)=3.76ms  
     http_req_connecting............: avg=33.08µs  min=0s      med=0s      max=4.1ms   p(90)=0s      p(95)=0s       p(99.9)=3.73ms  
     http_req_duration..............: avg=2.15s    min=25.62ms med=2.21s   max=4.01s   p(90)=2.91s   p(95)=3.14s    p(99.9)=3.92s   
       { expected_response:true }...: avg=2.15s    min=25.62ms med=2.21s   max=4.01s   p(90)=2.91s   p(95)=3.14s    p(99.9)=3.92s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2814
     http_req_receiving.............: avg=124.65µs min=38.19µs med=95.07µs max=69.24ms p(90)=140µs   p(95)=156.24µs p(99.9)=369.43µs
     http_req_sending...............: avg=50.01µs  min=5.89µs  med=19.26µs max=32.26ms p(90)=24.87µs p(95)=28.54µs  p(99.9)=3.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.15s    min=25.51ms med=2.21s   max=4.01s   p(90)=2.91s   p(95)=3.14s    p(99.9)=3.92s   
     http_reqs......................: 2814    22.424877/s
     iteration_duration.............: avg=2.22s    min=274.7ms med=2.23s   max=4.01s   p(90)=2.92s   p(95)=3.17s    p(99.9)=3.93s   
     iterations.....................: 2714    21.627973/s
     success_rate...................: 100.00% ✓ 2714      ✗ 0   
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

