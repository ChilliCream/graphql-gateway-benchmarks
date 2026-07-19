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
| hive-router | v0.0.83 | 2,889 | 3,164 | 2,809 | 4.1% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,650 | 2,756 | 2,640 | 1.5% |  |
| fusion-nightly | 16.5.1-p.2 | 2,475 | 2,615 | 2,459 | 2.1% |  |
| fusion | 16.5.0 | 2,461 | 2,569 | 2,444 | 1.8% |  |
| grafbase | 0.53.5 | 2,048 | 2,194 | 2,035 | 2.8% |  |
| cosmo | 0.331.1 | 1,330 | 1,376 | 1,325 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.4 | 628 | 647 | 625 | 1.1% |  |
| apollo-router | v2.16.0 | 450 | 472 | 445 | 2.3% |  |
| apollo-gateway | 2.14.2 | 284 | 287 | 282 | 0.6% |  |
| hive-gateway | 2.10.4 | 273 | 281 | 272 | 1.2% |  |
| feddi | 5ff8b6165878 | 1 | 1 | 1 | 0.0% |  |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,556 | 2,752 | 2,548 | 2.8% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,480 | 2,586 | 2,471 | 1.6% |  |
| fusion | 16.5.0 | 2,312 | 2,413 | 2,306 | 1.6% |  |
| fusion-nightly | 16.5.1-p.2 | 2,304 | 2,416 | 2,293 | 1.8% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 2,240 | 2,335 | 2,237 | 1.6% |  |
| grafbase | 0.53.5 | 1,643 | 1,705 | 1,639 | 1.4% |  |
| cosmo | 0.331.1 | 1,237 | 1,280 | 1,232 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.4 | 594 | 611 | 589 | 1.1% |  |
| apollo-router | v2.16.0 | 406 | 428 | 404 | 2.2% |  |
| apollo-gateway | 2.14.2 | 269 | 272 | 268 | 0.6% |  |
| hive-gateway | 2.10.4 | 267 | 274 | 265 | 1.0% |  |
| feddi | 5ff8b6165878 | 24 | 24 | 22 | 3.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1041546     ✗ 0     
     data_received..................: 31 GB   254 MB/s
     data_sent......................: 417 MB  3.5 MB/s
     http_req_blocked...............: avg=3.02µs  min=822ns   med=1.85µs  max=17.38ms  p(90)=3.02µs  p(95)=3.59µs   p(99.9)=30.33µs
     http_req_connecting............: avg=676ns   min=0s      med=0s      max=8.26ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.07ms min=1.43ms  med=16.4ms  max=272.55ms p(90)=25.03ms p(95)=28.14ms  p(99.9)=47.39ms
       { expected_response:true }...: avg=17.07ms min=1.43ms  med=16.4ms  max=272.55ms p(90)=25.03ms p(95)=28.14ms  p(99.9)=47.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 347282
     http_req_receiving.............: avg=82.49µs min=24.57µs med=43.83µs max=112.26ms p(90)=78.11µs p(95)=121.79µs p(99.9)=7.08ms 
     http_req_sending...............: avg=42.32µs min=4.48µs  med=7.96µs  max=180.41ms p(90)=13.75µs p(95)=75.98µs  p(99.9)=4.91ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.95ms min=1.33ms  med=16.3ms  max=272.02ms p(90)=24.87ms p(95)=27.9ms   p(99.9)=45.98ms
     http_reqs......................: 347282  2889.656537/s
     iteration_duration.............: avg=17.27ms min=2ms     med=16.59ms max=289.87ms p(90)=25.23ms p(95)=28.36ms  p(99.9)=48ms   
     iterations.....................: 347182  2888.824459/s
     success_rate...................: 100.00% ✓ 347182      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 955521      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 383 MB  3.2 MB/s
     http_req_blocked...............: avg=2.81µs   min=802ns   med=1.91µs   max=16.71ms  p(90)=3.27µs  p(95)=3.96µs  p(99.9)=28.77µs
     http_req_connecting............: avg=312ns    min=0s      med=0s       max=3.74ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.62ms  min=1.89ms  med=17.75ms  max=279.58ms p(90)=26.87ms p(95)=30.48ms p(99.9)=50.82ms
       { expected_response:true }...: avg=18.62ms  min=1.89ms  med=17.75ms  max=279.58ms p(90)=26.87ms p(95)=30.48ms p(99.9)=50.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 318607
     http_req_receiving.............: avg=659.54µs min=50.22µs med=102.92µs max=72.47ms  p(90)=1.67ms  p(95)=2.45ms  p(99.9)=19.42ms
     http_req_sending...............: avg=42.76µs  min=4.29µs  med=8.02µs   max=114.51ms p(90)=15.44µs p(95)=80.73µs p(99.9)=4.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.91ms  min=1.8ms   med=17.05ms  max=279.04ms p(90)=26.04ms p(95)=29.56ms p(99.9)=49.14ms
     http_reqs......................: 318607  2650.027597/s
     iteration_duration.............: avg=18.82ms  min=2.9ms   med=17.94ms  max=303.18ms p(90)=27.08ms p(95)=30.7ms  p(99.9)=51.3ms 
     iterations.....................: 318507  2649.195843/s
     success_rate...................: 100.00% ✓ 318507      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 892992      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=4.18µs   min=851ns   med=1.86µs  max=48.4ms   p(90)=3.01µs  p(95)=3.55µs  p(99.9)=25.19µs 
     http_req_connecting............: avg=1.85µs   min=0s      med=0s      max=48.37ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.94ms  min=2.12ms  med=16.99ms max=288.64ms p(90)=32.34ms p(95)=39.42ms p(99.9)=131.97ms
       { expected_response:true }...: avg=19.94ms  min=2.12ms  med=16.99ms max=288.64ms p(90)=32.34ms p(95)=39.42ms p(99.9)=131.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297764
     http_req_receiving.............: avg=579.62µs min=52.38µs med=92.2µs  max=169.97ms p(90)=1.08ms  p(95)=1.91ms  p(99.9)=25.32ms 
     http_req_sending...............: avg=47.3µs   min=4.51µs  med=7.9µs   max=206.28ms p(90)=13.32µs p(95)=49.62µs p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.32ms  min=1.99ms  med=16.46ms max=232.23ms p(90)=31.36ms p(95)=38.3ms  p(99.9)=129.65ms
     http_reqs......................: 297764  2475.747757/s
     iteration_duration.............: avg=20.14ms  min=3.02ms  med=17.18ms max=330.06ms p(90)=32.55ms p(95)=39.66ms p(99.9)=132.36ms
     iterations.....................: 297664  2474.916311/s
     success_rate...................: 100.00% ✓ 297664      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 887859      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=3.16µs   min=1.01µs  med=2.34µs  max=16.86ms  p(90)=3.61µs  p(95)=4.19µs  p(99.9)=35.79µs 
     http_req_connecting............: avg=308ns    min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.05ms  min=2.1ms   med=17.24ms max=298.97ms p(90)=32.59ms p(95)=39.4ms  p(99.9)=128.4ms 
       { expected_response:true }...: avg=20.05ms  min=2.1ms   med=17.24ms max=298.97ms p(90)=32.59ms p(95)=39.4ms  p(99.9)=128.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 296053
     http_req_receiving.............: avg=609.06µs min=51.75µs med=95.94µs max=254.62ms p(90)=1.12ms  p(95)=2.01ms  p(99.9)=27.06ms 
     http_req_sending...............: avg=42.72µs  min=4.71µs  med=8.84µs  max=130.7ms  p(90)=15.46µs p(95)=81.34µs p(99.9)=3.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.4ms   min=1.95ms  med=16.68ms max=298.37ms p(90)=31.61ms p(95)=38.22ms p(99.9)=125.97ms
     http_reqs......................: 296053  2461.778408/s
     iteration_duration.............: avg=20.26ms  min=3.17ms  med=17.43ms max=310.69ms p(90)=32.81ms p(95)=39.63ms p(99.9)=129.72ms
     iterations.....................: 295953  2460.946875/s
     success_rate...................: 100.00% ✓ 295953      ✗ 0     
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

     checks.........................: 100.00% ✓ 738471      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 296 MB  2.5 MB/s
     http_req_blocked...............: avg=3.37µs  min=992ns  med=2.61µs  max=9.49ms   p(90)=4.06µs  p(95)=4.76µs   p(99.9)=39.28µs
     http_req_connecting............: avg=352ns   min=0s     med=0s      max=3.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.15ms min=1.68ms med=23.91ms max=293.53ms p(90)=28.62ms p(95)=30.4ms   p(99.9)=50.3ms 
       { expected_response:true }...: avg=24.15ms min=1.68ms med=23.91ms max=293.53ms p(90)=28.62ms p(95)=30.4ms   p(99.9)=50.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 246257
     http_req_receiving.............: avg=91.36µs min=27.4µs med=56.08µs max=151.09ms p(90)=93.15µs p(95)=118.55µs p(99.9)=6.79ms 
     http_req_sending...............: avg=37.18µs min=4.91µs med=10.6µs  max=185.51ms p(90)=16.77µs p(95)=25.23µs  p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.02ms min=1.63ms med=23.81ms max=274.38ms p(90)=28.49ms p(95)=30.22ms  p(99.9)=48.27ms
     http_reqs......................: 246257  2048.373494/s
     iteration_duration.............: avg=24.36ms min=3.29ms med=24.11ms max=315.59ms p(90)=28.82ms p(95)=30.61ms  p(99.9)=50.8ms 
     iterations.....................: 246157  2047.541691/s
     success_rate...................: 100.00% ✓ 246157      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 479829      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=2.99µs  min=931ns   med=2.08µs  max=4.05ms   p(90)=3.51µs  p(95)=4.15µs   p(99.9)=34.85µs 
     http_req_connecting............: avg=581ns   min=0s      med=0s      max=3.99ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.28ms min=2.02ms  med=36.92ms max=278.4ms  p(90)=52.09ms p(95)=56.67ms  p(99.9)=77.93ms 
       { expected_response:true }...: avg=37.28ms min=2.02ms  med=36.92ms max=278.4ms  p(90)=52.09ms p(95)=56.67ms  p(99.9)=77.93ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 160043
     http_req_receiving.............: avg=70.71µs min=24.75µs med=55.92µs max=179.74ms p(90)=91.47µs p(95)=106.86µs p(99.9)=977.08µs
     http_req_sending...............: avg=21.41µs min=4.71µs  med=9.61µs  max=86.38ms  p(90)=16.53µs p(95)=20.38µs  p(99.9)=969.2µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.19ms min=1.92ms  med=36.83ms max=278.15ms p(90)=51.99ms p(95)=56.57ms  p(99.9)=77.76ms 
     http_reqs......................: 160043  1330.656839/s
     iteration_duration.............: avg=37.5ms  min=3.48ms  med=37.12ms max=298.28ms p(90)=52.28ms p(95)=56.86ms  p(99.9)=78.25ms 
     iterations.....................: 159943  1329.825401/s
     success_rate...................: 100.00% ✓ 159943      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 226956     ✗ 0    
     data_received..................: 6.7 GB  55 MB/s
     data_sent......................: 91 MB   755 kB/s
     http_req_blocked...............: avg=4.64µs  min=1.17µs  med=3.09µs  max=4.17ms   p(90)=4.61µs   p(95)=5.3µs    p(99.9)=45.37µs 
     http_req_connecting............: avg=1.27µs  min=0s      med=0s      max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=78.96ms min=3.65ms  med=77.07ms max=316.6ms  p(90)=96.45ms  p(95)=105.46ms p(99.9)=178.26ms
       { expected_response:true }...: avg=78.96ms min=3.65ms  med=77.07ms max=316.6ms  p(90)=96.45ms  p(95)=105.46ms p(99.9)=178.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75752
     http_req_receiving.............: avg=82.07µs min=27.76µs med=68.03µs max=157.59ms p(90)=104.47µs p(95)=118.06µs p(99.9)=671.58µs
     http_req_sending...............: avg=26.66µs min=5.5µs   med=13.87µs max=157.27ms p(90)=20.67µs  p(95)=23µs     p(99.9)=631.76µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.85ms min=3.54ms  med=76.98ms max=316.35ms p(90)=96.36ms  p(95)=105.34ms p(99.9)=177.62ms
     http_reqs......................: 75752   628.760265/s
     iteration_duration.............: avg=79.31ms min=14.63ms med=77.32ms max=326.92ms p(90)=96.7ms   p(95)=105.74ms p(99.9)=179.67ms
     iterations.....................: 75652   627.930241/s
     success_rate...................: 100.00% ✓ 75652      ✗ 0    
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

     checks.........................: 100.00% ✓ 162648     ✗ 0    
     data_received..................: 4.8 GB  40 MB/s
     data_sent......................: 65 MB   541 kB/s
     http_req_blocked...............: avg=6.96µs   min=1.14µs  med=2.49µs   max=8.24ms   p(90)=3.86µs   p(95)=4.39µs   p(99.9)=124.2µs 
     http_req_connecting............: avg=4.11µs   min=0s      med=0s       max=8.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.26ms min=4.68ms  med=110.08ms max=310.07ms p(90)=133.33ms p(95)=140.42ms p(99.9)=173.12ms
       { expected_response:true }...: avg=110.26ms min=4.68ms  med=110.08ms max=310.07ms p(90)=133.33ms p(95)=140.42ms p(99.9)=173.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54316
     http_req_receiving.............: avg=75.62µs  min=28.7µs  med=67.07µs  max=59.53ms  p(90)=99.23µs  p(95)=111.09µs p(99.9)=519.38µs
     http_req_sending...............: avg=25.78µs  min=5.13µs  med=12.9µs   max=145.72ms p(90)=18.97µs  p(95)=20.79µs  p(99.9)=536.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.16ms min=4.6ms   med=109.99ms max=309.33ms p(90)=133.24ms p(95)=140.32ms p(99.9)=172.92ms
     http_reqs......................: 54316   450.400934/s
     iteration_duration.............: avg=110.7ms  min=15.79ms med=110.33ms max=331.4ms  p(90)=133.58ms p(95)=140.66ms p(99.9)=174.15ms
     iterations.....................: 54216   449.571711/s
     success_rate...................: 100.00% ✓ 54216      ✗ 0    
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

     checks.........................: 100.00% ✓ 103059     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=6.66µs   min=1.37µs  med=3.52µs   max=3.69ms   p(90)=4.92µs   p(95)=5.48µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=2.88µs   min=0s      med=0s       max=3.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=173.95ms min=7.38ms  med=167.45ms max=359.32ms p(90)=223.02ms p(95)=227.53ms p(99.9)=285.52ms
       { expected_response:true }...: avg=173.95ms min=7.38ms  med=167.45ms max=359.32ms p(90)=223.02ms p(95)=227.53ms p(99.9)=285.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34453
     http_req_receiving.............: avg=94.22µs  min=35.13µs med=86.22µs  max=90.01ms  p(90)=116.36µs p(95)=127.65µs p(99.9)=411.04µs
     http_req_sending...............: avg=25.48µs  min=6.23µs  med=17.94µs  max=49.41ms  p(90)=22.27µs  p(95)=24.03µs  p(99.9)=414.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.83ms min=7.25ms  med=167.34ms max=359.05ms p(90)=222.92ms p(95)=227.41ms p(99.9)=285.2ms 
     http_reqs......................: 34453   284.951682/s
     iteration_duration.............: avg=174.73ms min=22.52ms med=167.72ms max=367.05ms p(90)=223.31ms p(95)=227.83ms p(99.9)=287.27ms
     iterations.....................: 34353   284.124608/s
     success_rate...................: 100.00% ✓ 34353      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98931      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=6.09µs   min=1.1µs   med=2.91µs   max=4.09ms   p(90)=4.19µs   p(95)=4.73µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.89µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=181.25ms min=5.39ms  med=165.88ms max=674.94ms p(90)=209.42ms p(95)=248.58ms p(99.9)=573.4ms 
       { expected_response:true }...: avg=181.25ms min=5.39ms  med=165.88ms max=674.94ms p(90)=209.42ms p(95)=248.58ms p(99.9)=573.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33077
     http_req_receiving.............: avg=84.41µs  min=31.03µs med=81.68µs  max=16.93ms  p(90)=111.57µs p(95)=122.91µs p(99.9)=487.42µs
     http_req_sending...............: avg=21.44µs  min=5.3µs   med=16.06µs  max=35.73ms  p(90)=20.43µs  p(95)=22.02µs  p(99.9)=457.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.14ms min=5.32ms  med=165.78ms max=674.87ms p(90)=209.31ms p(95)=248.45ms p(99.9)=573.31ms
     http_reqs......................: 33077   273.887354/s
     iteration_duration.............: avg=182.04ms min=41.98ms med=166.2ms  max=675.15ms p(90)=209.78ms p(95)=249.33ms p(99.9)=573.79ms
     iterations.....................: 32977   273.059325/s
     success_rate...................: 100.00% ✓ 32977      ✗ 0    
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
data_received..................: 6.6 MB 110 kB/s
     data_sent......................: 84 kB  1.4 kB/s
     http_req_blocked...............: avg=9.37µs   min=2.44µs  med=3.1µs   max=417.35µs p(90)=4.34µs  p(95)=4.59µs   p(99.9)=389.34µs
     http_req_connecting............: avg=1.45µs   min=0s      med=0s      max=100.08µs p(90)=0s      p(95)=0s       p(99.9)=93.28µs 
     http_req_duration..............: avg=468.46ms min=23.34ms med=32.19ms max=30.03s   p(90)=41.99ms p(95)=47.33ms  p(99.9)=27.99s  
       { expected_response:true }...: avg=468.46ms min=23.34ms med=32.19ms max=30.03s   p(90)=41.99ms p(95)=47.33ms  p(99.9)=27.99s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 69  
     http_req_receiving.............: avg=115.88µs min=69.38µs med=88.41µs max=361.02µs p(90)=178.2µs p(95)=213.96µs p(99.9)=358.1µs 
     http_req_sending...............: avg=19.95µs  min=12.71µs med=17.31µs max=119.57µs p(90)=20.62µs p(95)=25.58µs  p(99.9)=115.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=468.32ms min=23.24ms med=32.09ms max=30.03s   p(90)=41.84ms p(95)=47.21ms  p(99.9)=27.99s  
     http_reqs......................: 69     1.149991/s
     vus............................: 0      min=0      max=0 
     vus_max........................: 50     min=50     max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 921765      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=3.66µs  min=1.1µs   med=2.87µs  max=13.15ms  p(90)=4.56µs  p(95)=5.38µs   p(99.9)=41.28µs
     http_req_connecting............: avg=326ns   min=0s      med=0s      max=3.74ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.29ms min=1.89ms  med=18.89ms max=289.75ms p(90)=26.8ms  p(95)=29.47ms  p(99.9)=49.56ms
       { expected_response:true }...: avg=19.29ms min=1.89ms  med=18.89ms max=289.75ms p(90)=26.8ms  p(95)=29.47ms  p(99.9)=49.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307355
     http_req_receiving.............: avg=98.29µs min=24.82µs med=51.81µs max=109.12ms p(90)=96.58µs p(95)=160.37µs p(99.9)=7.91ms 
     http_req_sending...............: avg=48.96µs min=4.87µs  med=10.56µs max=107.74ms p(90)=18.9µs  p(95)=104.6µs  p(99.9)=5.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.14ms min=1.83ms  med=18.77ms max=275.08ms p(90)=26.64ms p(95)=29.23ms  p(99.9)=48.4ms 
     http_reqs......................: 307355  2556.277307/s
     iteration_duration.............: avg=19.51ms min=3ms     med=19.1ms  max=300.79ms p(90)=27.02ms p(95)=29.71ms  p(99.9)=50.23ms
     iterations.....................: 307255  2555.445605/s
     success_rate...................: 100.00% ✓ 307255      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 894264      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=5.99µs   min=792ns   med=2.02µs   max=90.32ms  p(90)=3.69µs  p(95)=4.46µs  p(99.9)=31.47µs
     http_req_connecting............: avg=3.36µs   min=0s      med=0s       max=90.2ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.89ms  min=1.48ms  med=19.05ms  max=247.12ms p(90)=28.68ms p(95)=32.28ms p(99.9)=53.3ms 
       { expected_response:true }...: avg=19.89ms  min=1.48ms  med=19.05ms  max=247.12ms p(90)=28.68ms p(95)=32.28ms p(99.9)=53.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 298188
     http_req_receiving.............: avg=761.21µs min=50.07µs med=117.68µs max=57.38ms  p(90)=1.93ms  p(95)=2.84ms  p(99.9)=20.81ms
     http_req_sending...............: avg=45.18µs  min=4.33µs  med=8.54µs   max=148.5ms  p(90)=18.85µs p(95)=83.7µs  p(99.9)=4.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.09ms  min=1.41ms  med=18.24ms  max=244.15ms p(90)=27.73ms p(95)=31.22ms p(99.9)=51.45ms
     http_reqs......................: 298188  2480.923578/s
     iteration_duration.............: avg=20.11ms  min=2.89ms  med=19.25ms  max=295.98ms p(90)=28.9ms  p(95)=32.51ms p(99.9)=53.78ms
     iterations.....................: 298088  2480.091578/s
     success_rate...................: 100.00% ✓ 298088      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 833754      ✗ 0     
     data_received..................: 24 GB   203 MB/s
     data_sent......................: 334 MB  2.8 MB/s
     http_req_blocked...............: avg=2.78µs   min=912ns   med=2.04µs  max=12.89ms  p(90)=3.44µs  p(95)=4.11µs  p(99.9)=30.37µs 
     http_req_connecting............: avg=301ns    min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.36ms  min=1.63ms  med=17.71ms max=459.36ms p(90)=35.22ms p(95)=43.37ms p(99.9)=157.86ms
       { expected_response:true }...: avg=21.36ms  min=1.63ms  med=17.71ms max=459.36ms p(90)=35.22ms p(95)=43.37ms p(99.9)=157.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 278018
     http_req_receiving.............: avg=626.09µs min=51.09µs med=97.15µs max=228.77ms p(90)=1.12ms  p(95)=1.89ms  p(99.9)=31.9ms  
     http_req_sending...............: avg=38.85µs  min=4.68µs  med=8.74µs  max=245.99ms p(90)=16.37µs p(95)=48.02µs p(99.9)=2.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.7ms   min=1.51ms  med=17.16ms max=458.86ms p(90)=34.15ms p(95)=42.1ms  p(99.9)=153.25ms
     http_reqs......................: 278018  2312.711069/s
     iteration_duration.............: avg=21.58ms  min=2.63ms  med=17.91ms max=459.82ms p(90)=35.44ms p(95)=43.59ms p(99.9)=158.33ms
     iterations.....................: 277918  2311.879212/s
     success_rate...................: 100.00% ✓ 277918      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 830664      ✗ 0     
     data_received..................: 24 GB   202 MB/s
     data_sent......................: 333 MB  2.8 MB/s
     http_req_blocked...............: avg=3.25µs   min=862ns   med=2.39µs  max=18ms     p(90)=4.03µs  p(95)=4.72µs  p(99.9)=36.2µs  
     http_req_connecting............: avg=354ns    min=0s      med=0s      max=3.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.44ms  min=1.59ms  med=17.88ms max=407.56ms p(90)=35.15ms p(95)=43.12ms p(99.9)=155.32ms
       { expected_response:true }...: avg=21.44ms  min=1.59ms  med=17.88ms max=407.56ms p(90)=35.15ms p(95)=43.12ms p(99.9)=155.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 276988
     http_req_receiving.............: avg=624.49µs min=50.72µs med=99.76µs max=157.68ms p(90)=1.16ms  p(95)=2.01ms  p(99.9)=28.15ms 
     http_req_sending...............: avg=39.41µs  min=4.36µs  med=9.2µs   max=128.9ms  p(90)=17.61µs p(95)=72.03µs p(99.9)=2.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.77ms  min=1.51ms  med=17.31ms max=407.49ms p(90)=34.1ms  p(95)=41.88ms p(99.9)=154.28ms
     http_reqs......................: 276988  2304.219877/s
     iteration_duration.............: avg=21.65ms  min=2.59ms  med=18.09ms max=407.74ms p(90)=35.37ms p(95)=43.35ms p(99.9)=156.84ms
     iterations.....................: 276888  2303.387992/s
     success_rate...................: 100.00% ✓ 276888      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 807924      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 324 MB  2.7 MB/s
     http_req_blocked...............: avg=4.24µs   min=882ns   med=2.59µs   max=15.4ms   p(90)=4.3µs   p(95)=5.06µs  p(99.9)=39.72µs 
     http_req_connecting............: avg=1.06µs   min=0s      med=0s       max=9.28ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.03ms  min=2.02ms  med=18.89ms  max=369.5ms  p(90)=35.15ms p(95)=43ms    p(99.9)=141.73ms
       { expected_response:true }...: avg=22.03ms  min=2.02ms  med=18.89ms  max=369.5ms  p(90)=35.15ms p(95)=43ms    p(99.9)=141.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 269408
     http_req_receiving.............: avg=577.89µs min=51.37µs med=101.44µs max=196.07ms p(90)=1.11ms  p(95)=1.92ms  p(99.9)=27.27ms 
     http_req_sending...............: avg=42.54µs  min=4.65µs  med=10.22µs  max=108.38ms p(90)=20.08µs p(95)=93.46µs p(99.9)=3ms     
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.41ms  min=1.84ms  med=18.35ms  max=369.35ms p(90)=34.16ms p(95)=41.84ms p(99.9)=139.75ms
     http_reqs......................: 269408  2240.424871/s
     iteration_duration.............: avg=22.26ms  min=3.23ms  med=19.1ms   max=369.76ms p(90)=35.38ms p(95)=43.26ms p(99.9)=143.1ms 
     iterations.....................: 269308  2239.59326/s
     success_rate...................: 100.00% ✓ 269308      ✗ 0     
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

     checks.........................: 100.00% ✓ 592839      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=3.13µs  min=851ns   med=2.31µs  max=11.66ms  p(90)=4.51µs   p(95)=5.54µs   p(99.9)=47.58µs
     http_req_connecting............: avg=201ns   min=0s      med=0s      max=1.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.11ms min=2.26ms  med=29.67ms max=310.03ms p(90)=39.93ms  p(95)=43.29ms  p(99.9)=64.85ms
       { expected_response:true }...: avg=30.11ms min=2.26ms  med=29.67ms max=310.03ms p(90)=39.93ms  p(95)=43.29ms  p(99.9)=64.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 197713
     http_req_receiving.............: avg=97.18µs min=26.95µs med=55.04µs max=205.61ms p(90)=127.58µs p(95)=214.55µs p(99.9)=4.09ms 
     http_req_sending...............: avg=42.87µs min=4.61µs  med=9.39µs  max=209.63ms p(90)=24.57µs  p(95)=112.21µs p(99.9)=3.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.97ms min=2.13ms  med=29.55ms max=293.87ms p(90)=39.77ms  p(95)=43.1ms   p(99.9)=64.04ms
     http_reqs......................: 197713  1643.544657/s
     iteration_duration.............: avg=30.35ms min=6.43ms  med=29.9ms  max=318.53ms p(90)=40.15ms  p(95)=43.51ms  p(99.9)=65.28ms
     iterations.....................: 197613  1642.713379/s
     success_rate...................: 100.00% ✓ 197613      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 446211      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.35µs  min=972ns   med=2.36µs  max=3.76ms   p(90)=3.97µs  p(95)=4.66µs   p(99.9)=36.33µs 
     http_req_connecting............: avg=653ns   min=0s      med=0s      max=3.72ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.09ms min=2.08ms  med=39.68ms max=298.72ms p(90)=55.58ms p(95)=60.44ms  p(99.9)=82.99ms 
       { expected_response:true }...: avg=40.09ms min=2.08ms  med=39.68ms max=298.72ms p(90)=55.58ms p(95)=60.44ms  p(99.9)=82.99ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148837
     http_req_receiving.............: avg=75.5µs  min=25.95µs med=61.48µs max=195.42ms p(90)=99.29µs p(95)=114.79µs p(99.9)=811.66µs
     http_req_sending...............: avg=24.06µs min=4.9µs   med=11.39µs max=86.13ms  p(90)=18.83µs p(95)=22.44µs  p(99.9)=872.52µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.99ms min=1.97ms  med=39.59ms max=298.48ms p(90)=55.49ms p(95)=60.35ms  p(99.9)=82.63ms 
     http_reqs......................: 148837  1237.435819/s
     iteration_duration.............: avg=40.33ms min=4.12ms  med=39.89ms max=322.41ms p(90)=55.78ms p(95)=60.65ms  p(99.9)=83.27ms 
     iterations.....................: 148737  1236.604416/s
     success_rate...................: 100.00% ✓ 148737      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214725     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   714 kB/s
     http_req_blocked...............: avg=4.19µs  min=992ns   med=2.73µs  max=3.96ms   p(90)=4.26µs   p(95)=4.88µs   p(99.9)=47.78µs 
     http_req_connecting............: avg=1.21µs  min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.48ms min=4.13ms  med=81.34ms max=326.23ms p(90)=101.85ms p(95)=111.37ms p(99.9)=197.3ms 
       { expected_response:true }...: avg=83.48ms min=4.13ms  med=81.34ms max=326.23ms p(90)=101.85ms p(95)=111.37ms p(99.9)=197.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 71675
     http_req_receiving.............: avg=81.31µs min=29.03µs med=72.02µs max=121.64ms p(90)=108.38µs p(95)=121.9µs  p(99.9)=630.72µs
     http_req_sending...............: avg=27.96µs min=5.1µs   med=13.74µs max=157.77ms p(90)=20.47µs  p(95)=22.61µs  p(99.9)=588.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.37ms min=4.04ms  med=81.25ms max=325.58ms p(90)=101.74ms p(95)=111.26ms p(99.9)=196.87ms
     http_reqs......................: 71675   594.682248/s
     iteration_duration.............: avg=83.83ms min=18.51ms med=81.58ms max=337.04ms p(90)=102.1ms  p(95)=111.67ms p(99.9)=198.66ms
     iterations.....................: 71575   593.852555/s
     success_rate...................: 100.00% ✓ 71575      ✗ 0    
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

     checks.........................: 100.00% ✓ 147006     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   489 kB/s
     http_req_blocked...............: avg=5.62µs   min=1.3µs   med=3.6µs    max=3.76ms   p(90)=5.08µs   p(95)=5.67µs   p(99.9)=225.87µs
     http_req_connecting............: avg=1.68µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=96.75µs 
     http_req_duration..............: avg=121.96ms min=5.45ms  med=119.82ms max=402.08ms p(90)=161.37ms p(95)=173.5ms  p(99.9)=223.38ms
       { expected_response:true }...: avg=121.96ms min=5.45ms  med=119.82ms max=402.08ms p(90)=161.37ms p(95)=173.5ms  p(99.9)=223.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49102
     http_req_receiving.............: avg=178.95µs min=34.1µs  med=83.73µs  max=239.85ms p(90)=115.89µs p(95)=128.51µs p(99.9)=961.85µs
     http_req_sending...............: avg=28.54µs  min=6.49µs  med=17.37µs  max=270.84ms p(90)=22.8µs   p(95)=24.68µs  p(99.9)=696.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.75ms min=5.31ms  med=119.69ms max=249.37ms p(90)=161.12ms p(95)=173.19ms p(99.9)=219.93ms
     http_reqs......................: 49102   406.876726/s
     iteration_duration.............: avg=122.47ms min=15.24ms med=120.14ms max=402.34ms p(90)=161.68ms p(95)=173.83ms p(99.9)=224.69ms
     iterations.....................: 49002   406.04809/s
     success_rate...................: 100.00% ✓ 49002      ✗ 0    
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

     checks.........................: 100.00% ✓ 97341      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=6.2µs    min=1.09µs  med=3.12µs   max=4.06ms   p(90)=4.5µs    p(95)=5.04µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.84µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=184.18ms min=7.82ms  med=184.27ms max=422.16ms p(90)=196.4ms  p(95)=199.97ms p(99.9)=277.83ms
       { expected_response:true }...: avg=184.18ms min=7.82ms  med=184.27ms max=422.16ms p(90)=196.4ms  p(95)=199.97ms p(99.9)=277.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32547
     http_req_receiving.............: avg=212.88µs min=29.37µs med=86.11µs  max=202.23ms p(90)=115.92µs p(95)=127.12µs p(99.9)=53.69ms 
     http_req_sending...............: avg=31.42µs  min=5.21µs  med=16.97µs  max=185.38ms p(90)=21.48µs  p(95)=23.25µs  p(99.9)=563.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.94ms min=7.67ms  med=184.16ms max=278.27ms p(90)=196.28ms p(95)=199.85ms p(99.9)=264.76ms
     http_reqs......................: 32547   269.01647/s
     iteration_duration.............: avg=185.01ms min=16.84ms med=184.55ms max=429.2ms  p(90)=196.66ms p(95)=200.27ms p(99.9)=278.43ms
     iterations.....................: 32447   268.189922/s
     success_rate...................: 100.00% ✓ 32447      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96642      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.1µs    min=1.14µs  med=3.18µs   max=3.49ms   p(90)=4.56µs   p(95)=5.12µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=185.49ms min=5.73ms  med=170.37ms max=668.37ms p(90)=218.34ms p(95)=268.94ms p(99.9)=559.75ms
       { expected_response:true }...: avg=185.49ms min=5.73ms  med=170.37ms max=668.37ms p(90)=218.34ms p(95)=268.94ms p(99.9)=559.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32314
     http_req_receiving.............: avg=98.3µs   min=30.86µs med=91.99µs  max=74.68ms  p(90)=122.51µs p(95)=135.03µs p(99.9)=773.69µs
     http_req_sending...............: avg=32.97µs  min=5.42µs  med=17.75µs  max=94.02ms  p(90)=22.04µs  p(95)=23.87µs  p(99.9)=530.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.36ms min=5.64ms  med=170.24ms max=668.3ms  p(90)=218.23ms p(95)=268.75ms p(99.9)=559.64ms
     http_reqs......................: 32314   267.460242/s
     iteration_duration.............: avg=186.34ms min=40.96ms med=170.73ms max=668.57ms p(90)=218.77ms p(95)=271.7ms  p(99.9)=560ms   
     iterations.....................: 32214   266.63255/s
     success_rate...................: 100.00% ✓ 32214      ✗ 0    
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

     checks.........................: 100.00% ✓ 8733      ✗ 0   
     data_received..................: 288 MB  2.3 MB/s
     data_sent......................: 3.6 MB  29 kB/s
     http_req_blocked...............: avg=101.56µs min=1.67µs  med=3.82µs  max=8.41ms  p(90)=5.38µs   p(95)=6.12µs   p(99.9)=8.24ms
     http_req_connecting............: avg=95.08µs  min=0s      med=0s      max=8.37ms  p(90)=0s       p(95)=0s       p(99.9)=7.95ms
     http_req_duration..............: avg=2s       min=24.52ms med=2.02s   max=4.23s   p(90)=2.8s     p(95)=2.99s    p(99.9)=3.66s 
       { expected_response:true }...: avg=2s       min=24.52ms med=2.02s   max=4.23s   p(90)=2.8s     p(95)=2.99s    p(99.9)=3.66s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 3011
     http_req_receiving.............: avg=118.54µs min=36.49µs med=97.73µs max=40.14ms p(90)=141.71µs p(95)=161.56µs p(99.9)=1.36ms
     http_req_sending...............: avg=58.62µs  min=6.38µs  med=19.52µs max=16.51ms p(90)=24.85µs  p(95)=27.9µs   p(99.9)=8.47ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2s       min=24.41ms med=2.02s   max=4.23s   p(90)=2.8s     p(95)=2.99s    p(99.9)=3.66s 
     http_reqs......................: 3011    24.093787/s
     iteration_duration.............: avg=2.07s    min=91.55ms med=2.05s   max=4.23s   p(90)=2.82s    p(95)=3s       p(99.9)=3.67s 
     iterations.....................: 2911    23.293595/s
     success_rate...................: 100.00% ✓ 2911      ✗ 0   
     vus............................: 44      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

