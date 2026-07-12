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
| hive-router | v0.0.78 | 2,963 | 3,188 | 2,907 | 3.2% |  |
| fusion-nightly-net11 | 16.5.0-p.12 | 2,549 | 2,663 | 2,542 | 1.7% |  |
| fusion-nightly | 16.5.0-p.12 | 2,504 | 2,608 | 2,489 | 1.6% |  |
| fusion | 16.4.0 | 2,386 | 2,469 | 2,378 | 1.4% |  |
| grafbase | 0.53.5 | 2,153 | 2,268 | 2,145 | 2.0% |  |
| cosmo | 0.329.0 | 1,299 | 1,342 | 1,293 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.2 | 630 | 645 | 628 | 0.9% |  |
| apollo-router | v2.16.0 | 490 | 507 | 486 | 1.6% |  |
| apollo-gateway | 2.14.2 | 280 | 284 | 279 | 0.6% |  |
| hive-gateway | 2.10.2 | 276 | 283 | 275 | 1.0% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1265 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.78 | 2,417 | 2,617 | 2,401 | 3.1% |  |
| fusion-nightly-net11 | 16.5.0-p.12 | 2,414 | 2,518 | 2,406 | 1.6% |  |
| fusion-nightly | 16.5.0-p.12 | 2,381 | 2,426 | 2,359 | 1.1% |  |
| fusion | 16.4.0 | 2,263 | 2,347 | 2,253 | 1.4% |  |
| fusion-nightly-fed | 16.5.0-p.12 | 2,126 | 2,271 | 2,116 | 2.5% |  |
| grafbase | 0.53.5 | 1,685 | 1,745 | 1,680 | 1.3% |  |
| cosmo | 0.329.0 | 1,173 | 1,220 | 1,165 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.2 | 586 | 603 | 582 | 1.1% |  |
| apollo-router | v2.16.0 | 448 | 466 | 444 | 1.5% |  |
| hive-gateway | 2.10.2 | 267 | 275 | 266 | 1.0% |  |
| apollo-gateway | 2.14.2 | 264 | 267 | 263 | 0.5% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 2.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1068204     ✗ 0     
     data_received..................: 31 GB   260 MB/s
     data_sent......................: 428 MB  3.6 MB/s
     http_req_blocked...............: avg=2.96µs  min=992ns   med=2.28µs  max=15.01ms  p(90)=3.59µs  p(95)=4.2µs    p(99.9)=36.16µs
     http_req_connecting............: avg=254ns   min=0s      med=0s      max=4ms      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.63ms min=1.44ms  med=15.91ms max=276.88ms p(90)=24.38ms p(95)=27.66ms  p(99.9)=47.28ms
       { expected_response:true }...: avg=16.63ms min=1.44ms  med=15.91ms max=276.88ms p(90)=24.38ms p(95)=27.66ms  p(99.9)=47.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 356168
     http_req_receiving.............: avg=93.43µs min=26.32µs med=47.45µs max=125.13ms p(90)=86.7µs  p(95)=160.87µs p(99.9)=7.44ms 
     http_req_sending...............: avg=49.02µs min=4.68µs  med=8.65µs  max=144.17ms p(90)=15.12µs p(95)=97.98µs  p(99.9)=7.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.49ms min=1.36ms  med=15.79ms max=276.07ms p(90)=24.2ms  p(95)=27.38ms  p(99.9)=46.32ms
     http_reqs......................: 356168  2963.296494/s
     iteration_duration.............: avg=16.84ms min=2.08ms  med=16.1ms  max=299.43ms p(90)=24.58ms p(95)=27.89ms  p(99.9)=47.86ms
     iterations.....................: 356068  2962.4645/s
     success_rate...................: 100.00% ✓ 356068      ✗ 0     
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

     checks.........................: 100.00% ✓ 919389      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 368 MB  3.1 MB/s
     http_req_blocked...............: avg=3.11µs   min=1.03µs  med=2.38µs   max=8.45ms   p(90)=3.72µs  p(95)=4.34µs  p(99.9)=35.85µs
     http_req_connecting............: avg=272ns    min=0s      med=0s       max=3.34ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.35ms  min=1.96ms  med=18.46ms  max=286.99ms p(90)=27.89ms p(95)=31.49ms p(99.9)=53.36ms
       { expected_response:true }...: avg=19.35ms  min=1.96ms  med=18.46ms  max=286.99ms p(90)=27.89ms p(95)=31.49ms p(99.9)=53.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306563
     http_req_receiving.............: avg=714.97µs min=52.11µs med=111.52µs max=43.24ms  p(90)=1.78ms  p(95)=2.7ms   p(99.9)=20.91ms
     http_req_sending...............: avg=43.69µs  min=4.61µs  med=9.02µs   max=76.18ms  p(90)=16.8µs  p(95)=90.07µs p(99.9)=4.39ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.59ms  min=1.87ms  med=17.7ms   max=286.41ms p(90)=26.97ms p(95)=30.5ms  p(99.9)=51.68ms
     http_reqs......................: 306563  2549.296743/s
     iteration_duration.............: avg=19.56ms  min=2.91ms  med=18.66ms  max=299.98ms p(90)=28.11ms p(95)=31.71ms p(99.9)=53.69ms
     iterations.....................: 306463  2548.465169/s
     success_rate...................: 100.00% ✓ 306463      ✗ 0     
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

     checks.........................: 100.00% ✓ 903438      ✗ 0     
     data_received..................: 26 GB   220 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=2.76µs   min=881ns   med=2.02µs  max=14.08ms  p(90)=3.3µs   p(95)=3.93µs  p(99.9)=31.39µs 
     http_req_connecting............: avg=286ns    min=0s      med=0s      max=3.39ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.71ms  min=2.04ms  med=16.89ms max=283.77ms p(90)=32.04ms p(95)=38.73ms p(99.9)=134.56ms
       { expected_response:true }...: avg=19.71ms  min=2.04ms  med=16.89ms max=283.77ms p(90)=32.04ms p(95)=38.73ms p(99.9)=134.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301246
     http_req_receiving.............: avg=667.89µs min=50.88µs med=93.06µs max=246.24ms p(90)=1.13ms  p(95)=2.22ms  p(99.9)=28.89ms 
     http_req_sending...............: avg=41.09µs  min=4.68µs  med=8.44µs  max=169.04ms p(90)=15.16µs p(95)=77.46µs p(99.9)=3.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19ms     min=1.96ms  med=16.29ms max=283.24ms p(90)=30.87ms p(95)=37.36ms p(99.9)=132.4ms 
     http_reqs......................: 301246  2504.51542/s
     iteration_duration.............: avg=19.91ms  min=3ms     med=17.09ms max=300.98ms p(90)=32.26ms p(95)=38.97ms p(99.9)=135.99ms
     iterations.....................: 301146  2503.684035/s
     success_rate...................: 100.00% ✓ 301146      ✗ 0     
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

     checks.........................: 100.00% ✓ 860802      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=2.83µs   min=871ns   med=1.9µs   max=15.96ms  p(90)=3.06µs  p(95)=3.63µs  p(99.9)=29.51µs 
     http_req_connecting............: avg=322ns    min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.69ms  min=2.07ms  med=17.67ms max=340.81ms p(90)=33.54ms p(95)=40.8ms  p(99.9)=137.38ms
       { expected_response:true }...: avg=20.69ms  min=2.07ms  med=17.67ms max=340.81ms p(90)=33.54ms p(95)=40.8ms  p(99.9)=137.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287034
     http_req_receiving.............: avg=593.95µs min=50.84µs med=90.43µs max=246.67ms p(90)=1.09ms  p(95)=1.91ms  p(99.9)=28.13ms 
     http_req_sending...............: avg=38.64µs  min=4.61µs  med=8.25µs  max=136.58ms p(90)=14.16µs p(95)=66.5µs  p(99.9)=3.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.06ms  min=1.94ms  med=17.13ms max=340.08ms p(90)=32.56ms p(95)=39.63ms p(99.9)=135.39ms
     http_reqs......................: 287034  2386.82451/s
     iteration_duration.............: avg=20.9ms   min=3.27ms  med=17.86ms max=340.97ms p(90)=33.74ms p(95)=41.01ms p(99.9)=138.8ms 
     iterations.....................: 286934  2385.992962/s
     success_rate...................: 100.00% ✓ 286934      ✗ 0     
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

     checks.........................: 100.00% ✓ 776379      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=3.38µs  min=1.07µs med=2.57µs  max=12.46ms  p(90)=4.11µs  p(95)=4.85µs   p(99.9)=37.71µs
     http_req_connecting............: avg=351ns   min=0s     med=0s      max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.95ms min=1.75ms med=22.72ms max=282.19ms p(90)=27.4ms  p(95)=29.31ms  p(99.9)=49.32ms
       { expected_response:true }...: avg=22.95ms min=1.75ms med=22.72ms max=282.19ms p(90)=27.4ms  p(95)=29.31ms  p(99.9)=49.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258893
     http_req_receiving.............: avg=91.39µs min=28.8µs med=56.79µs max=168.86ms p(90)=94.05µs p(95)=120.67µs p(99.9)=6.18ms 
     http_req_sending...............: avg=38.9µs  min=4.93µs med=10.56µs max=76.07ms  p(90)=17.33µs p(95)=29.74µs  p(99.9)=2.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.82ms min=1.67ms med=22.62ms max=281.76ms p(90)=27.27ms p(95)=29.13ms  p(99.9)=48.29ms
     http_reqs......................: 258893  2153.221074/s
     iteration_duration.............: avg=23.17ms min=3.48ms med=22.91ms max=307.67ms p(90)=27.61ms p(95)=29.53ms  p(99.9)=49.66ms
     iterations.....................: 258793  2152.389371/s
     success_rate...................: 100.00% ✓ 258793      ✗ 0     
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

     checks.........................: 100.00% ✓ 468570      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 188 MB  1.6 MB/s
     http_req_blocked...............: avg=3.22µs  min=972ns   med=2.37µs  max=3.53ms   p(90)=3.83µs  p(95)=4.47µs   p(99.9)=33.23µs 
     http_req_connecting............: avg=555ns   min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.17ms min=2.04ms  med=37.81ms max=310.64ms p(90)=53.38ms p(95)=58.04ms  p(99.9)=80.92ms 
       { expected_response:true }...: avg=38.17ms min=2.04ms  med=37.81ms max=310.64ms p(90)=53.38ms p(95)=58.04ms  p(99.9)=80.92ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 156290
     http_req_receiving.............: avg=71.74µs min=26.69µs med=58.99µs max=126.56ms p(90)=94.32µs p(95)=109.15µs p(99.9)=757.46µs
     http_req_sending...............: avg=23.69µs min=4.83µs  med=10.2µs  max=179.57ms p(90)=16.38µs p(95)=20.2µs   p(99.9)=886.96µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.08ms min=1.98ms  med=37.72ms max=310.09ms p(90)=53.29ms p(95)=57.95ms  p(99.9)=80.65ms 
     http_reqs......................: 156290  1299.447367/s
     iteration_duration.............: avg=38.4ms  min=3.65ms  med=38.01ms max=326.11ms p(90)=53.58ms p(95)=58.25ms  p(99.9)=81.59ms 
     iterations.....................: 156190  1298.615934/s
     success_rate...................: 100.00% ✓ 156190      ✗ 0     
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

     checks.........................: 100.00% ✓ 227712     ✗ 0    
     data_received..................: 6.7 GB  55 MB/s
     data_sent......................: 91 MB   758 kB/s
     http_req_blocked...............: avg=4.68µs  min=1.17µs  med=3.16µs  max=3.92ms   p(90)=4.73µs   p(95)=5.41µs   p(99.9)=46.12µs 
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=78.71ms min=3.53ms  med=76.67ms max=325.72ms p(90)=98.32ms  p(95)=108.53ms p(99.9)=185.78ms
       { expected_response:true }...: avg=78.71ms min=3.53ms  med=76.67ms max=325.72ms p(90)=98.32ms  p(95)=108.53ms p(99.9)=185.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 76004
     http_req_receiving.............: avg=84.3µs  min=30.73µs med=71.67µs max=107.46ms p(90)=109.29µs p(95)=123.11µs p(99.9)=721.47µs
     http_req_sending...............: avg=25.68µs min=4.66µs  med=13.82µs max=153.33ms p(90)=20.84µs  p(95)=23.18µs  p(99.9)=629.76µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.6ms  min=3.47ms  med=76.57ms max=325.33ms p(90)=98.21ms  p(95)=108.41ms p(99.9)=185.39ms
     http_reqs......................: 76004   630.782786/s
     iteration_duration.............: avg=79.06ms min=18.82ms med=76.93ms max=340.09ms p(90)=98.58ms  p(95)=108.81ms p(99.9)=188.36ms
     iterations.....................: 75904   629.952852/s
     success_rate...................: 100.00% ✓ 75904      ✗ 0    
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

     checks.........................: 100.00% ✓ 177030    ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   589 kB/s
     http_req_blocked...............: avg=4.15µs   min=1.07µs  med=2.84µs   max=2.77ms   p(90)=4.25µs   p(95)=4.77µs   p(99.9)=54.52µs 
     http_req_connecting............: avg=1.05µs   min=0s      med=0s       max=2.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.27ms min=4.64ms  med=101.1ms  max=304.06ms p(90)=122.06ms p(95)=128.51ms p(99.9)=158.31ms
       { expected_response:true }...: avg=101.27ms min=4.64ms  med=101.1ms  max=304.06ms p(90)=122.06ms p(95)=128.51ms p(99.9)=158.31ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 59110
     http_req_receiving.............: avg=79.76µs  min=27.74µs med=73.04µs  max=47.61ms  p(90)=105.12µs p(95)=118.59µs p(99.9)=532.32µs
     http_req_sending...............: avg=27.24µs  min=4.97µs  med=14.6µs   max=165.85ms p(90)=20.18µs  p(95)=21.88µs  p(99.9)=639.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.17ms min=4.55ms  med=101ms    max=296.41ms p(90)=121.97ms p(95)=128.42ms p(99.9)=157.83ms
     http_reqs......................: 59110   490.22866/s
     iteration_duration.............: avg=101.69ms min=21.34ms med=101.37ms max=319.45ms p(90)=122.32ms p(95)=128.78ms p(99.9)=159.1ms 
     iterations.....................: 59010   489.39931/s
     success_rate...................: 100.00% ✓ 59010     ✗ 0    
     vus............................: 50      min=50      max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 101286     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.16µs  med=3.3µs    max=4.36ms   p(90)=4.53µs   p(95)=5.06µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.98µs   min=0s      med=0s       max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=177.03ms min=7.39ms  med=177.38ms max=351.8ms  p(90)=242.87ms p(95)=246.32ms p(99.9)=311.68ms
       { expected_response:true }...: avg=177.03ms min=7.39ms  med=177.38ms max=351.8ms  p(90)=242.87ms p(95)=246.32ms p(99.9)=311.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33862
     http_req_receiving.............: avg=87.71µs  min=33.35µs med=81.83µs  max=36.03ms  p(90)=111.79µs p(95)=122.11µs p(99.9)=486.76µs
     http_req_sending...............: avg=24.86µs  min=5.26µs  med=16.35µs  max=69.01ms  p(90)=20.69µs  p(95)=22.43µs  p(99.9)=465.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.92ms min=7.3ms   med=177.27ms max=351.56ms p(90)=242.77ms p(95)=246.21ms p(99.9)=311.58ms
     http_reqs......................: 33862   280.018833/s
     iteration_duration.............: avg=177.81ms min=47.14ms med=178.32ms max=360.72ms p(90)=243.15ms p(95)=246.61ms p(99.9)=312.95ms
     iterations.....................: 33762   279.191892/s
     success_rate...................: 100.00% ✓ 33762      ✗ 0    
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

     checks.........................: 100.00% ✓ 100140     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   332 kB/s
     http_req_blocked...............: avg=7.14µs   min=1.34µs  med=3.68µs   max=3.86ms   p(90)=5.12µs   p(95)=5.74µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=179.07ms min=5.95ms  med=163.8ms  max=638.72ms p(90)=208.74ms p(95)=244.29ms p(99.9)=561.56ms
       { expected_response:true }...: avg=179.07ms min=5.95ms  med=163.8ms  max=638.72ms p(90)=208.74ms p(95)=244.29ms p(99.9)=561.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33480
     http_req_receiving.............: avg=95.08µs  min=36.46µs med=88.07µs  max=52.9ms   p(90)=118.18µs p(95)=130.03µs p(99.9)=633.56µs
     http_req_sending...............: avg=30.04µs  min=6.13µs  med=18.01µs  max=84.22ms  p(90)=22.69µs  p(95)=24.53µs  p(99.9)=537.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.94ms min=5.83ms  med=163.69ms max=638.57ms p(90)=208.56ms p(95)=244.2ms  p(99.9)=561.46ms
     http_reqs......................: 33480   276.669675/s
     iteration_duration.............: avg=179.86ms min=45.8ms  med=164.17ms max=639.01ms p(90)=209.18ms p(95)=245.08ms p(99.9)=561.83ms
     iterations.....................: 33380   275.843302/s
     success_rate...................: 100.00% ✓ 33380      ✗ 0    
     vus............................: 5       min=5        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 871719      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=3.33µs  min=1µs     med=2.6µs   max=11.43ms  p(90)=4.11µs  p(95)=4.81µs   p(99.9)=37.29µs
     http_req_connecting............: avg=311ns   min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.42ms min=1.74ms  med=20.22ms max=296.49ms p(90)=28.37ms p(95)=30.76ms  p(99.9)=50.1ms 
       { expected_response:true }...: avg=20.42ms min=1.74ms  med=20.22ms max=296.49ms p(90)=28.37ms p(95)=30.76ms  p(99.9)=50.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 290673
     http_req_receiving.............: avg=90.1µs  min=25.42µs med=52.83µs max=145.54ms p(90)=91.98µs p(95)=129.25µs p(99.9)=6.19ms 
     http_req_sending...............: avg=44.43µs min=4.91µs  med=10.24µs max=175.74ms p(90)=16.9µs  p(95)=77.11µs  p(99.9)=3.62ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.28ms min=1.65ms  med=20.1ms  max=296.27ms p(90)=28.23ms p(95)=30.58ms  p(99.9)=49.29ms
     http_reqs......................: 290673  2417.843678/s
     iteration_duration.............: avg=20.63ms min=2.72ms  med=20.42ms max=308.96ms p(90)=28.58ms p(95)=30.99ms  p(99.9)=50.48ms
     iterations.....................: 290573  2417.011869/s
     success_rate...................: 100.00% ✓ 290573      ✗ 0     
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

     checks.........................: 100.00% ✓ 870228      ✗ 0     
     data_received..................: 25 GB   212 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=3.04µs   min=802ns   med=2.04µs   max=18.12ms  p(90)=3.69µs  p(95)=4.43µs  p(99.9)=33.6µs 
     http_req_connecting............: avg=317ns    min=0s      med=0s       max=3.87ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.45ms  min=1.55ms  med=19.62ms  max=296.52ms p(90)=29.39ms p(95)=32.92ms p(99.9)=53.38ms
       { expected_response:true }...: avg=20.45ms  min=1.55ms  med=19.62ms  max=296.52ms p(90)=29.39ms p(95)=32.92ms p(99.9)=53.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 290176
     http_req_receiving.............: avg=804.11µs min=50.38µs med=127.28µs max=241.34ms p(90)=2.02ms  p(95)=3.04ms  p(99.9)=20.12ms
     http_req_sending...............: avg=42.78µs  min=4.64µs  med=8.69µs   max=161.3ms  p(90)=18.45µs p(95)=79.94µs p(99.9)=4.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.61ms  min=1.47ms  med=18.76ms  max=295.99ms p(90)=28.38ms p(95)=31.87ms p(99.9)=51.68ms
     http_reqs......................: 290176  2414.027017/s
     iteration_duration.............: avg=20.67ms  min=3.23ms  med=19.82ms  max=312.81ms p(90)=29.61ms p(95)=33.15ms p(99.9)=53.89ms
     iterations.....................: 290076  2413.195099/s
     success_rate...................: 100.00% ✓ 290076      ✗ 0     
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

     checks.........................: 100.00% ✓ 858543      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.32µs  min=1.05µs  med=2.65µs   max=7.17ms   p(90)=4.12µs  p(95)=4.79µs  p(99.9)=35.4µs  
     http_req_connecting............: avg=312ns   min=0s      med=0s       max=3.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.74ms min=1.59ms  med=17.16ms  max=340.13ms p(90)=34.18ms p(95)=42.25ms p(99.9)=157.14ms
       { expected_response:true }...: avg=20.74ms min=1.59ms  med=17.16ms  max=340.13ms p(90)=34.18ms p(95)=42.25ms p(99.9)=157.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286281
     http_req_receiving.............: avg=685.7µs min=52.44µs med=103.86µs max=198.01ms p(90)=1.16ms  p(95)=2.06ms  p(99.9)=31.44ms 
     http_req_sending...............: avg=39.11µs min=5µs     med=10.01µs  max=159.99ms p(90)=17.66µs p(95)=87.03µs p(99.9)=2.13ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.01ms min=1.46ms  med=16.57ms  max=340.03ms p(90)=32.97ms p(95)=40.77ms p(99.9)=155.75ms
     http_reqs......................: 286281  2381.687258/s
     iteration_duration.............: avg=20.95ms min=2.66ms  med=17.37ms  max=340.32ms p(90)=34.4ms  p(95)=42.48ms p(99.9)=157.82ms
     iterations.....................: 286181  2380.855317/s
     success_rate...................: 100.00% ✓ 286181      ✗ 0     
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

     checks.........................: 100.00% ✓ 815841      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 327 MB  2.7 MB/s
     http_req_blocked...............: avg=2.96µs   min=892ns   med=2.15µs  max=12.45ms  p(90)=3.84µs  p(95)=4.54µs  p(99.9)=30.98µs 
     http_req_connecting............: avg=325ns    min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.83ms  min=1.63ms  med=17.82ms max=494.07ms p(90)=35.86ms p(95)=44.58ms p(99.9)=179.72ms
       { expected_response:true }...: avg=21.83ms  min=1.63ms  med=17.82ms max=494.07ms p(90)=35.86ms p(95)=44.58ms p(99.9)=179.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 272047
     http_req_receiving.............: avg=620.95µs min=50.13µs med=97.91µs max=231.95ms p(90)=1.14ms  p(95)=1.92ms  p(99.9)=29.47ms 
     http_req_sending...............: avg=38.62µs  min=4.65µs  med=8.98µs  max=153.13ms p(90)=18.08µs p(95)=39.15µs p(99.9)=2.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.17ms  min=1.53ms  med=17.26ms max=492.33ms p(90)=34.77ms p(95)=43.35ms p(99.9)=177.59ms
     http_reqs......................: 272047  2263.108619/s
     iteration_duration.............: avg=22.05ms  min=2.71ms  med=18.02ms max=494.41ms p(90)=36.09ms p(95)=44.81ms p(99.9)=181.14ms
     iterations.....................: 271947  2262.276738/s
     success_rate...................: 100.00% ✓ 271947      ✗ 0     
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

     checks.........................: 100.00% ✓ 766824      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 307 MB  2.6 MB/s
     http_req_blocked...............: avg=2.98µs   min=872ns   med=2.14µs   max=19.01ms  p(90)=3.74µs  p(95)=4.46µs  p(99.9)=33.93µs 
     http_req_connecting............: avg=366ns    min=0s      med=0s       max=4.09ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.23ms  min=2.07ms  med=19.32ms  max=418.39ms p(90)=37.7ms  p(95)=46.77ms p(99.9)=181.16ms
       { expected_response:true }...: avg=23.23ms  min=2.07ms  med=19.32ms  max=418.39ms p(90)=37.7ms  p(95)=46.77ms p(99.9)=181.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 255708
     http_req_receiving.............: avg=680.55µs min=51.47µs med=103.64µs max=395.2ms  p(90)=1.21ms  p(95)=2.14ms  p(99.9)=31.91ms 
     http_req_sending...............: avg=39.4µs   min=4.78µs  med=9.16µs   max=212.23ms p(90)=18.48µs p(95)=54.05µs p(99.9)=2.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.51ms  min=1.93ms  med=18.71ms  max=390.87ms p(90)=36.5ms  p(95)=45.28ms p(99.9)=178.38ms
     http_reqs......................: 255708  2126.316493/s
     iteration_duration.............: avg=23.46ms  min=3.32ms  med=19.53ms  max=418.56ms p(90)=37.92ms p(95)=47ms    p(99.9)=183.4ms 
     iterations.....................: 255608  2125.484953/s
     success_rate...................: 100.00% ✓ 255608      ✗ 0     
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

     checks.........................: 100.00% ✓ 607827      ✗ 0     
     data_received..................: 18 GB   148 MB/s
     data_sent......................: 244 MB  2.0 MB/s
     http_req_blocked...............: avg=4.2µs    min=1.11µs  med=3.11µs  max=8.96ms   p(90)=5.49µs   p(95)=6.61µs   p(99.9)=50.32µs
     http_req_connecting............: avg=464ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.35ms  min=2.23ms  med=28.75ms max=315.16ms p(90)=38.62ms  p(95)=41.93ms  p(99.9)=65.41ms
       { expected_response:true }...: avg=29.35ms  min=2.23ms  med=28.75ms max=315.16ms p(90)=38.62ms  p(95)=41.93ms  p(99.9)=65.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 202709
     http_req_receiving.............: avg=106.18µs min=29.18µs med=62.02µs max=33.83ms  p(90)=134.49µs p(95)=228.19µs p(99.9)=5.27ms 
     http_req_sending...............: avg=45.69µs  min=5.07µs  med=11.66µs max=50.85ms  p(90)=26.48µs  p(95)=122.29µs p(99.9)=3.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.2ms   min=2.1ms   med=28.61ms max=298.5ms  p(90)=38.45ms  p(95)=41.74ms  p(99.9)=64.54ms
     http_reqs......................: 202709  1685.161832/s
     iteration_duration.............: avg=29.6ms   min=4.7ms   med=28.98ms max=334.53ms p(90)=38.85ms  p(95)=42.17ms  p(99.9)=65.96ms
     iterations.....................: 202609  1684.330511/s
     success_rate...................: 100.00% ✓ 202609      ✗ 0     
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

     checks.........................: 100.00% ✓ 423090      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.9µs   min=1.16µs med=2.96µs  max=3.57ms   p(90)=4.59µs   p(95)=5.31µs  p(99.9)=38.51µs
     http_req_connecting............: avg=617ns   min=0s     med=0s      max=3.53ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=42.27ms min=2.11ms med=41.78ms max=290.03ms p(90)=58.94ms  p(95)=64.14ms p(99.9)=88.99ms
       { expected_response:true }...: avg=42.27ms min=2.11ms med=41.78ms max=290.03ms p(90)=58.94ms  p(95)=64.14ms p(99.9)=88.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141130
     http_req_receiving.............: avg=85.44µs min=28.6µs med=71.75µs max=104.74ms p(90)=113.21µs p(95)=131.2µs p(99.9)=899.5µs
     http_req_sending...............: avg=29.49µs min=5.35µs med=13.05µs max=183.92ms p(90)=19.79µs  p(95)=23.6µs  p(99.9)=1.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=42.16ms min=2ms    med=41.67ms max=289.38ms p(90)=58.83ms  p(95)=64.03ms p(99.9)=88.62ms
     http_reqs......................: 141130  1173.272672/s
     iteration_duration.............: avg=42.53ms min=4.29ms med=42.01ms max=315.54ms p(90)=59.16ms  p(95)=64.37ms p(99.9)=89.49ms
     iterations.....................: 141030  1172.44133/s
     success_rate...................: 100.00% ✓ 141030      ✗ 0     
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

     checks.........................: 100.00% ✓ 211788     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   705 kB/s
     http_req_blocked...............: avg=4.97µs  min=1.15µs  med=3.35µs  max=3.81ms   p(90)=4.94µs   p(95)=5.64µs   p(99.9)=47.31µs 
     http_req_connecting............: avg=1.35µs  min=0s      med=0s      max=3.76ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.61ms min=3.75ms  med=82.42ms max=331.93ms p(90)=104.11ms p(95)=114.69ms p(99.9)=203.11ms
       { expected_response:true }...: avg=84.61ms min=3.75ms  med=82.42ms max=331.93ms p(90)=104.11ms p(95)=114.69ms p(99.9)=203.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70696
     http_req_receiving.............: avg=86.34µs min=29.84µs med=73.57µs max=131.81ms p(90)=110.76µs p(95)=124.09µs p(99.9)=699.53µs
     http_req_sending...............: avg=27.71µs min=5.64µs  med=15.01µs max=165.89ms p(90)=21.72µs  p(95)=23.96µs  p(99.9)=656.33µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.5ms  min=3.68ms  med=82.32ms max=331.5ms  p(90)=103.99ms p(95)=114.58ms p(99.9)=202.24ms
     http_reqs......................: 70696   586.662394/s
     iteration_duration.............: avg=84.99ms min=26.43ms med=82.66ms max=341.87ms p(90)=104.38ms p(95)=115ms    p(99.9)=204.54ms
     iterations.....................: 70596   585.832556/s
     success_rate...................: 100.00% ✓ 70596      ✗ 0    
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

     checks.........................: 100.00% ✓ 161862     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   538 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.43µs  med=3.7µs    max=3.55ms   p(90)=5.29µs   p(95)=5.95µs   p(99.9)=63.57µs 
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.75ms min=5.23ms  med=108.4ms  max=340.89ms p(90)=146.85ms p(95)=157.98ms p(99.9)=202.29ms
       { expected_response:true }...: avg=110.75ms min=5.23ms  med=108.4ms  max=340.89ms p(90)=146.85ms p(95)=157.98ms p(99.9)=202.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54054
     http_req_receiving.............: avg=93.46µs  min=30.09µs med=85.9µs   max=82.29ms  p(90)=117.38µs p(95)=130.48µs p(99.9)=523.93µs
     http_req_sending...............: avg=28.27µs  min=6.24µs  med=17.99µs  max=114.06ms p(90)=23.46µs  p(95)=25.54µs  p(99.9)=606.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.62ms min=5.07ms  med=108.29ms max=305.89ms p(90)=146.73ms p(95)=157.87ms p(99.9)=201.9ms 
     http_reqs......................: 54054   448.02174/s
     iteration_duration.............: avg=111.23ms min=15.81ms med=108.75ms max=349.1ms  p(90)=147.16ms p(95)=158.3ms  p(99.9)=203.9ms 
     iterations.....................: 53954   447.192899/s
     success_rate...................: 100.00% ✓ 53954      ✗ 0    
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

     checks.........................: 100.00% ✓ 96585      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=5.33µs   min=1.1µs   med=3.2µs    max=2.72ms   p(90)=4.56µs   p(95)=5.14µs   p(99.9)=878.7µs 
     http_req_connecting............: avg=1.89µs   min=0s      med=0s       max=2.67ms   p(90)=0s       p(95)=0s       p(99.9)=774.99µs
     http_req_duration..............: avg=185.61ms min=5.86ms  med=171.11ms max=625.41ms p(90)=214.27ms p(95)=265.51ms p(99.9)=534.68ms
       { expected_response:true }...: avg=185.61ms min=5.86ms  med=171.11ms max=625.41ms p(90)=214.27ms p(95)=265.51ms p(99.9)=534.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32295
     http_req_receiving.............: avg=94.99µs  min=32.64µs med=89.82µs  max=55.86ms  p(90)=120.88µs p(95)=133µs    p(99.9)=620.05µs
     http_req_sending...............: avg=26.57µs  min=4.98µs  med=18µs     max=66.29ms  p(90)=22.41µs  p(95)=24.12µs  p(99.9)=925.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.49ms min=5.78ms  med=170.99ms max=625.24ms p(90)=214.15ms p(95)=265.43ms p(99.9)=534.52ms
     http_reqs......................: 32295   267.264081/s
     iteration_duration.............: avg=186.45ms min=54.33ms med=171.42ms max=625.7ms  p(90)=214.77ms p(95)=266.76ms p(99.9)=535.19ms
     iterations.....................: 32195   266.43651/s
     success_rate...................: 100.00% ✓ 32195      ✗ 0    
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

     checks.........................: 100.00% ✓ 95769      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   318 kB/s
     http_req_blocked...............: avg=5.05µs   min=1.35µs  med=3.48µs   max=2.09ms   p(90)=4.86µs   p(95)=5.45µs   p(99.9)=502.79µs
     http_req_connecting............: avg=1.29µs   min=0s      med=0s       max=2.05ms   p(90)=0s       p(95)=0s       p(99.9)=455.18µs
     http_req_duration..............: avg=187.19ms min=7.85ms  med=186.39ms max=349.21ms p(90)=198.57ms p(95)=203.89ms p(99.9)=273.02ms
       { expected_response:true }...: avg=187.19ms min=7.85ms  med=186.39ms max=349.21ms p(90)=198.57ms p(95)=203.89ms p(99.9)=273.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32023
     http_req_receiving.............: avg=93.22µs  min=34.02µs med=87.09µs  max=38.83ms  p(90)=118.72µs p(95)=130.94µs p(99.9)=554.49µs
     http_req_sending...............: avg=40.43µs  min=5.92µs  med=17.48µs  max=98.59ms  p(90)=22.15µs  p(95)=23.9µs   p(99.9)=631.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.06ms min=7.71ms  med=186.28ms max=348.96ms p(90)=198.45ms p(95)=203.74ms p(99.9)=272.65ms
     http_reqs......................: 32023   264.666676/s
     iteration_duration.............: avg=188.04ms min=46.87ms med=186.8ms  max=371.72ms p(90)=198.88ms p(95)=204.18ms p(99.9)=273.65ms
     iterations.....................: 31923   263.840187/s
     success_rate...................: 100.00% ✓ 31923      ✗ 0    
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

     checks.........................: 100.00% ✓ 7038      ✗ 0   
     data_received..................: 234 MB  1.9 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=42.3µs   min=1.28µs   med=3.76µs  max=4ms     p(90)=5.36µs   p(95)=6.32µs   p(99.9)=3.71ms  
     http_req_connecting............: avg=36.18µs  min=0s       med=0s      max=3.95ms  p(90)=0s       p(95)=0s       p(99.9)=3.68ms  
     http_req_duration..............: avg=2.47s    min=25.17ms  med=2.53s   max=4.82s   p(90)=3.47s    p(95)=3.74s    p(99.9)=4.69s   
       { expected_response:true }...: avg=2.47s    min=25.17ms  med=2.53s   max=4.82s   p(90)=3.47s    p(95)=3.74s    p(99.9)=4.69s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2446
     http_req_receiving.............: avg=103.86µs min=39.77µs  med=97.34µs max=1.89ms  p(90)=143.34µs p(95)=166.13µs p(99.9)=351.14µs
     http_req_sending...............: avg=86.12µs  min=7.47µs   med=19.28µs max=74.44ms p(90)=24.96µs  p(95)=29.46µs  p(99.9)=17.14ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.47s    min=25.08ms  med=2.53s   max=4.82s   p(90)=3.47s    p(95)=3.74s    p(99.9)=4.69s   
     http_reqs......................: 2446    19.457391/s
     iteration_duration.............: avg=2.57s    min=292.24ms med=2.57s   max=4.82s   p(90)=3.49s    p(95)=3.75s    p(99.9)=4.7s    
     iterations.....................: 2346    18.661913/s
     success_rate...................: 100.00% ✓ 2346      ✗ 0   
     vus............................: 38      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

