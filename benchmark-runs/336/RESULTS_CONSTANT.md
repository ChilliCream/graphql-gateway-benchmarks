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
| hive-router | v0.0.84 | 3,074 | 3,356 | 3,043 | 3.6% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,753 | 2,883 | 2,738 | 1.8% |  |
| fusion-nightly | 16.7.0-p.2 | 2,608 | 2,689 | 2,578 | 1.4% |  |
| fusion | 16.6.2 | 2,572 | 2,692 | 2,562 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,433 | 2,511 | 2,424 | 1.2% |  |
| grafbase | 0.53.5 | 2,134 | 2,257 | 2,121 | 2.2% |  |
| cosmo | 0.334.0 | 1,317 | 1,363 | 1,309 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 615 | 634 | 610 | 1.3% |  |
| apollo-router | v2.16.1 | 454 | 466 | 442 | 1.7% |  |
| apollo-gateway | 2.14.3 | 281 | 287 | 279 | 0.9% |  |
| hive-gateway | 2.10.8 | 275 | 281 | 273 | 0.9% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1364 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,468 | 2,596 | 2,462 | 1.9% |  |
| fusion-nightly | 16.7.0-p.2 | 2,463 | 2,576 | 2,459 | 1.7% |  |
| hive-router | v0.0.84 | 2,424 | 2,630 | 2,400 | 3.1% |  |
| fusion | 16.6.2 | 2,394 | 2,512 | 2,382 | 1.8% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,220 | 2,333 | 2,214 | 1.9% |  |
| grafbase | 0.53.5 | 1,626 | 1,685 | 1,623 | 1.3% |  |
| cosmo | 0.334.0 | 1,215 | 1,254 | 1,204 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 581 | 607 | 579 | 1.8% |  |
| apollo-router | v2.16.1 | 446 | 463 | 440 | 1.6% |  |
| apollo-gateway | 2.14.3 | 268 | 273 | 268 | 0.8% |  |
| hive-gateway | 2.10.8 | 257 | 267 | 256 | 1.5% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 21 | 2.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1108404     ✗ 0     
     data_received..................: 32 GB   270 MB/s
     data_sent......................: 444 MB  3.7 MB/s
     http_req_blocked...............: avg=3.23µs  min=922ns   med=2.37µs  max=22.11ms  p(90)=3.79µs  p(95)=4.46µs   p(99.9)=37.88µs
     http_req_connecting............: avg=237ns   min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.02ms min=1.47ms  med=15.3ms  max=282.34ms p(90)=23.52ms p(95)=26.96ms  p(99.9)=47.97ms
       { expected_response:true }...: avg=16.02ms min=1.47ms  med=15.3ms  max=282.34ms p(90)=23.52ms p(95)=26.96ms  p(99.9)=47.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 369568
     http_req_receiving.............: avg=95.68µs min=25.03µs med=46.05µs max=34.23ms  p(90)=88.27µs p(95)=174.94µs p(99.9)=8.42ms 
     http_req_sending...............: avg=50.96µs min=4.52µs  med=8.89µs  max=103.31ms p(90)=16.08µs p(95)=103.34µs p(99.9)=7.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.87ms min=1.4ms   med=15.18ms max=261.88ms p(90)=23.33ms p(95)=26.66ms  p(99.9)=46.94ms
     http_reqs......................: 369568  3074.617691/s
     iteration_duration.............: avg=16.23ms min=1.93ms  med=15.5ms  max=294.25ms p(90)=23.73ms p(95)=27.2ms   p(99.9)=48.71ms
     iterations.....................: 369468  3073.785741/s
     success_rate...................: 100.00% ✓ 369468      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 992937      ✗ 0     
     data_received..................: 29 GB   241 MB/s
     data_sent......................: 398 MB  3.3 MB/s
     http_req_blocked...............: avg=2.55µs   min=861ns   med=1.82µs  max=16.51ms  p(90)=2.88µs  p(95)=3.39µs  p(99.9)=28.09µs
     http_req_connecting............: avg=282ns    min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.91ms  min=1.95ms  med=17.07ms max=320.62ms p(90)=25.87ms p(95)=29.33ms p(99.9)=50.04ms
       { expected_response:true }...: avg=17.91ms  min=1.95ms  med=17.07ms max=320.62ms p(90)=25.87ms p(95)=29.33ms p(99.9)=50.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 331079
     http_req_receiving.............: avg=482.51µs min=51.43µs med=89.63µs max=290.08ms p(90)=1.13ms  p(95)=1.75ms  p(99.9)=18ms   
     http_req_sending...............: avg=40.32µs  min=4.57µs  med=7.92µs  max=66.09ms  p(90)=13.6µs  p(95)=80.65µs p(99.9)=3.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.39ms  min=1.82ms  med=16.58ms max=103.17ms p(90)=25.25ms p(95)=28.62ms p(99.9)=47.79ms
     http_reqs......................: 331079  2753.407779/s
     iteration_duration.............: avg=18.11ms  min=2.98ms  med=17.26ms max=337.88ms p(90)=26.07ms p(95)=29.55ms p(99.9)=50.55ms
     iterations.....................: 330979  2752.576132/s
     success_rate...................: 100.00% ✓ 330979      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 940923      ✗ 0     
     data_received..................: 28 GB   229 MB/s
     data_sent......................: 377 MB  3.1 MB/s
     http_req_blocked...............: avg=2.94µs   min=892ns   med=2.23µs  max=17ms     p(90)=3.47µs  p(95)=4.01µs  p(99.9)=32.37µs 
     http_req_connecting............: avg=302ns    min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.91ms  min=1.98ms  med=16.28ms max=319.07ms p(90)=30.66ms p(95)=37.19ms p(99.9)=119.6ms 
       { expected_response:true }...: avg=18.91ms  min=1.98ms  med=16.28ms max=319.07ms p(90)=30.66ms p(95)=37.19ms p(99.9)=119.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 313741
     http_req_receiving.............: avg=567.59µs min=50.11µs med=92.95µs max=191.09ms p(90)=1.06ms  p(95)=1.89ms  p(99.9)=25.47ms 
     http_req_sending...............: avg=41.95µs  min=4.61µs  med=8.55µs  max=106.08ms p(90)=14.56µs p(95)=86.28µs p(99.9)=3.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.3ms   min=1.89ms  med=15.76ms max=318.98ms p(90)=29.7ms  p(95)=36.09ms p(99.9)=118.1ms 
     http_reqs......................: 313741  2608.892932/s
     iteration_duration.............: avg=19.12ms  min=2.93ms  med=16.48ms max=319.3ms  p(90)=30.87ms p(95)=37.41ms p(99.9)=120.49ms
     iterations.....................: 313641  2608.061389/s
     success_rate...................: 100.00% ✓ 313641      ✗ 0     
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

     checks.........................: 100.00% ✓ 927840      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 372 MB  3.1 MB/s
     http_req_blocked...............: avg=2.52µs   min=902ns   med=1.89µs  max=21.65ms  p(90)=2.99µs  p(95)=3.52µs  p(99.9)=27.47µs 
     http_req_connecting............: avg=262ns    min=0s      med=0s      max=3.27ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.19ms  min=1.98ms  med=16.45ms max=336.08ms p(90)=31.12ms p(95)=37.83ms p(99.9)=125.48ms
       { expected_response:true }...: avg=19.19ms  min=1.98ms  med=16.45ms max=336.08ms p(90)=31.12ms p(95)=37.83ms p(99.9)=125.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309380
     http_req_receiving.............: avg=591.39µs min=50.94µs med=89.74µs max=278.38ms p(90)=1.08ms  p(95)=1.93ms  p(99.9)=26.66ms 
     http_req_sending...............: avg=40.41µs  min=4.67µs  med=8.34µs  max=63.93ms  p(90)=14.17µs p(95)=64.45µs p(99.9)=3.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.55ms  min=1.85ms  med=15.91ms max=335.44ms p(90)=30.14ms p(95)=36.61ms p(99.9)=121.2ms 
     http_reqs......................: 309380  2572.713547/s
     iteration_duration.............: avg=19.39ms  min=3.17ms  med=16.64ms max=336.28ms p(90)=31.33ms p(95)=38.05ms p(99.9)=126.1ms 
     iterations.....................: 309280  2571.881976/s
     success_rate...................: 100.00% ✓ 309280      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 877488      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=3.13µs   min=1µs     med=2.35µs  max=14.54ms  p(90)=3.59µs  p(95)=4.15µs  p(99.9)=32.98µs 
     http_req_connecting............: avg=314ns    min=0s      med=0s      max=4.07ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.29ms  min=1.71ms  med=16.43ms max=343.02ms p(90)=35ms    p(95)=44.16ms p(99.9)=157.33ms
       { expected_response:true }...: avg=20.29ms  min=1.71ms  med=16.43ms max=343.02ms p(90)=35ms    p(95)=44.16ms p(99.9)=157.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292596
     http_req_receiving.............: avg=594.62µs min=51.54µs med=93.89µs max=180.59ms p(90)=1.06ms  p(95)=1.92ms  p(99.9)=29.24ms 
     http_req_sending...............: avg=40.25µs  min=4.78µs  med=8.88µs  max=186.18ms p(90)=14.33µs p(95)=64.23µs p(99.9)=3.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.65ms  min=1.61ms  med=15.89ms max=342.25ms p(90)=33.99ms p(95)=43ms    p(99.9)=155.7ms 
     http_reqs......................: 292596  2433.935843/s
     iteration_duration.............: avg=20.5ms   min=2.61ms  med=16.63ms max=343.15ms p(90)=35.22ms p(95)=44.4ms  p(99.9)=158.07ms
     iterations.....................: 292496  2433.104002/s
     success_rate...................: 100.00% ✓ 292496      ✗ 0     
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

     checks.........................: 100.00% ✓ 769548      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=2.9µs   min=912ns   med=2.08µs  max=12.47ms  p(90)=3.47µs  p(95)=4.16µs   p(99.9)=31.96µs
     http_req_connecting............: avg=333ns   min=0s      med=0s      max=3.26ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.17ms min=1.7ms   med=22.93ms max=291.33ms p(90)=27.46ms p(95)=29.18ms  p(99.9)=47.85ms
       { expected_response:true }...: avg=23.17ms min=1.7ms   med=22.93ms max=291.33ms p(90)=27.46ms p(95)=29.18ms  p(99.9)=47.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256616
     http_req_receiving.............: avg=86.72µs min=27.51µs med=53.15µs max=178.32ms p(90)=90.42µs p(95)=115.27µs p(99.9)=5.61ms 
     http_req_sending...............: avg=34.79µs min=4.61µs  med=9.24µs  max=169.96ms p(90)=15.68µs p(95)=24.66µs  p(99.9)=1.59ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.05ms min=1.64ms  med=22.83ms max=290.76ms p(90)=27.34ms p(95)=29.01ms  p(99.9)=46.53ms
     http_reqs......................: 256616  2134.514699/s
     iteration_duration.............: avg=23.38ms min=3.61ms  med=23.12ms max=308.71ms p(90)=27.66ms p(95)=29.38ms  p(99.9)=48.24ms
     iterations.....................: 256516  2133.682905/s
     success_rate...................: 100.00% ✓ 256516      ✗ 0     
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

     checks.........................: 100.00% ✓ 474978      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=2.79µs  min=932ns   med=1.98µs  max=3.53ms   p(90)=3.32µs  p(95)=3.95µs   p(99.9)=30.66µs 
     http_req_connecting............: avg=493ns   min=0s      med=0s      max=3.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.66ms min=2.08ms  med=37.29ms max=303.08ms p(90)=52.67ms p(95)=57.34ms  p(99.9)=78.2ms  
       { expected_response:true }...: avg=37.66ms min=2.08ms  med=37.29ms max=303.08ms p(90)=52.67ms p(95)=57.34ms  p(99.9)=78.2ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 158426
     http_req_receiving.............: avg=82.13µs min=26.86µs med=58.07µs max=190.34ms p(90)=93.35µs p(95)=108.94µs p(99.9)=978.31µs
     http_req_sending...............: avg=21.71µs min=4.77µs  med=9.69µs  max=47.91ms  p(90)=16.16µs p(95)=20.08µs  p(99.9)=935.03µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.56ms min=1.98ms  med=37.2ms  max=302.26ms p(90)=52.58ms p(95)=57.23ms  p(99.9)=77.14ms 
     http_reqs......................: 158426  1317.201102/s
     iteration_duration.............: avg=37.89ms min=3.53ms  med=37.49ms max=310.18ms p(90)=52.87ms p(95)=57.53ms  p(99.9)=78.53ms 
     iterations.....................: 158326  1316.369673/s
     success_rate...................: 100.00% ✓ 158326      ✗ 0     
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

     checks.........................: 100.00% ✓ 222156     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   739 kB/s
     http_req_blocked...............: avg=4.63µs  min=1.24µs  med=3.06µs  max=3.81ms   p(90)=4.6µs    p(95)=5.3µs    p(99.9)=45.46µs 
     http_req_connecting............: avg=1.26µs  min=0s      med=0s      max=3.78ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.67ms min=3.68ms  med=78.36ms max=322.13ms p(90)=104.08ms p(95)=115.21ms p(99.9)=193.58ms
       { expected_response:true }...: avg=80.67ms min=3.68ms  med=78.36ms max=322.13ms p(90)=104.08ms p(95)=115.21ms p(99.9)=193.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74152
     http_req_receiving.............: avg=81.83µs min=28.5µs  med=71.75µs max=66.74ms  p(90)=109.34µs p(95)=123.82µs p(99.9)=676.47µs
     http_req_sending...............: avg=30.81µs min=5.48µs  med=14.31µs max=150.56ms p(90)=21.02µs  p(95)=23.24µs  p(99.9)=660.34µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.56ms min=3.63ms  med=78.25ms max=321.12ms p(90)=103.95ms p(95)=115.1ms  p(99.9)=193.29ms
     http_reqs......................: 74152   615.389541/s
     iteration_duration.............: avg=81.03ms min=20.65ms med=78.64ms max=330.6ms  p(90)=104.35ms p(95)=115.48ms p(99.9)=196.23ms
     iterations.....................: 74052   614.559638/s
     success_rate...................: 100.00% ✓ 74052      ✗ 0    
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

     checks.........................: 100.00% ✓ 164268     ✗ 0    
     data_received..................: 4.8 GB  40 MB/s
     data_sent......................: 66 MB   546 kB/s
     http_req_blocked...............: avg=5.28µs   min=1.14µs  med=3.34µs   max=3.9ms    p(90)=4.76µs   p(95)=5.34µs   p(99.9)=111.98µs
     http_req_connecting............: avg=1.73µs   min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=109.14ms min=4.75ms  med=108.84ms max=330.25ms p(90)=131.89ms p(95)=138.9ms  p(99.9)=175.16ms
       { expected_response:true }...: avg=109.14ms min=4.75ms  med=108.84ms max=330.25ms p(90)=131.89ms p(95)=138.9ms  p(99.9)=175.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54856
     http_req_receiving.............: avg=85.98µs  min=27.25µs med=76.24µs  max=159.31ms p(90)=108.43µs p(95)=120.76µs p(99.9)=528.85µs
     http_req_sending...............: avg=30.67µs  min=5.45µs  med=15.34µs  max=155.11ms p(90)=20.52µs  p(95)=22.5µs   p(99.9)=593.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.03ms min=4.64ms  med=108.73ms max=329.91ms p(90)=131.79ms p(95)=138.77ms p(99.9)=173.81ms
     http_reqs......................: 54856   454.911059/s
     iteration_duration.............: avg=109.59ms min=34.09ms med=109.13ms max=355ms    p(90)=132.15ms p(95)=139.17ms p(99.9)=178.14ms
     iterations.....................: 54756   454.081777/s
     success_rate...................: 100.00% ✓ 54756      ✗ 0    
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

     checks.........................: 100.00% ✓ 101880     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   338 kB/s
     http_req_blocked...............: avg=6.25µs   min=1.33µs  med=3.37µs   max=3.48ms   p(90)=4.62µs   p(95)=5.14µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=2.51µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=175.98ms min=7.39ms  med=176.57ms max=384.3ms  p(90)=199.5ms  p(95)=204.52ms p(99.9)=269.2ms 
       { expected_response:true }...: avg=175.98ms min=7.39ms  med=176.57ms max=384.3ms  p(90)=199.5ms  p(95)=204.52ms p(99.9)=269.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34060
     http_req_receiving.............: avg=87.02µs  min=34.35µs med=82.74µs  max=27.26ms  p(90)=112.4µs  p(95)=123.59µs p(99.9)=519.6µs 
     http_req_sending...............: avg=30.84µs  min=5.85µs  med=17.27µs  max=110.14ms p(90)=21.98µs  p(95)=23.74µs  p(99.9)=575µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=175.86ms min=7.3ms   med=176.46ms max=383.57ms p(90)=199.39ms p(95)=204.42ms p(99.9)=269.04ms
     http_reqs......................: 34060   281.683315/s
     iteration_duration.............: avg=176.77ms min=50.01ms med=177.01ms max=405.03ms p(90)=199.77ms p(95)=204.8ms  p(99.9)=279.81ms
     iterations.....................: 33960   280.856294/s
     success_rate...................: 100.00% ✓ 33960      ✗ 0    
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

     checks.........................: 100.00% ✓ 99720      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   331 kB/s
     http_req_blocked...............: avg=5.98µs   min=1.51µs  med=3.73µs   max=2.94ms   p(90)=5.14µs   p(95)=5.75µs   p(99.9)=926.81µs
     http_req_connecting............: avg=1.98µs   min=0s      med=0s       max=2.9ms    p(90)=0s       p(95)=0s       p(99.9)=824.16µs
     http_req_duration..............: avg=179.79ms min=5.5ms   med=167.36ms max=679.2ms  p(90)=215.84ms p(95)=265.09ms p(99.9)=570.53ms
       { expected_response:true }...: avg=179.79ms min=5.5ms   med=167.36ms max=679.2ms  p(90)=215.84ms p(95)=265.09ms p(99.9)=570.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33340
     http_req_receiving.............: avg=91.33µs  min=34.77µs med=87.4µs   max=10.94ms  p(90)=117.62µs p(95)=129.7µs  p(99.9)=539.03µs
     http_req_sending...............: avg=29.95µs  min=7.06µs  med=18.34µs  max=84.24ms  p(90)=23.21µs  p(95)=25.11µs  p(99.9)=853.17µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.66ms min=5.37ms  med=167.24ms max=679.07ms p(90)=215.73ms p(95)=265.02ms p(99.9)=570.44ms
     http_reqs......................: 33340   275.999481/s
     iteration_duration.............: avg=180.6ms  min=35.32ms med=167.73ms max=679.45ms p(90)=216.27ms p(95)=266.98ms p(99.9)=570.87ms
     iterations.....................: 33240   275.171648/s
     success_rate...................: 100.00% ✓ 33240      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 889983      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 357 MB  3.0 MB/s
     http_req_blocked...............: avg=3.52µs   min=1.04µs  med=2.59µs   max=20.95ms  p(90)=4.07µs  p(95)=4.76µs  p(99.9)=37.58µs
     http_req_connecting............: avg=321ns    min=0s      med=0s       max=3.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.99ms  min=1.55ms  med=19.12ms  max=308.28ms p(90)=29.13ms p(95)=32.79ms p(99.9)=54.04ms
       { expected_response:true }...: avg=19.99ms  min=1.55ms  med=19.12ms  max=308.28ms p(90)=29.13ms p(95)=32.79ms p(99.9)=54.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296761
     http_req_receiving.............: avg=565.48µs min=52.17µs med=104.02µs max=221.54ms p(90)=1.4ms   p(95)=2.22ms  p(99.9)=18.98ms
     http_req_sending...............: avg=45.14µs  min=4.89µs  med=9.8µs    max=132.67ms p(90)=17.91µs p(95)=92.18µs p(99.9)=3.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.38ms  min=1.47ms  med=18.51ms  max=307.62ms p(90)=28.41ms p(95)=32.03ms p(99.9)=52.37ms
     http_reqs......................: 296761  2468.732812/s
     iteration_duration.............: avg=20.21ms  min=2.95ms  med=19.33ms  max=322.67ms p(90)=29.35ms p(95)=33.02ms p(99.9)=54.6ms 
     iterations.....................: 296661  2467.90092/s
     success_rate...................: 100.00% ✓ 296661      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 888081      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=3.68µs   min=1.01µs  med=2.66µs  max=26.22ms  p(90)=4.2µs   p(95)=4.91µs  p(99.9)=38.92µs 
     http_req_connecting............: avg=316ns    min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.03ms  min=1.53ms  med=16.89ms max=335.74ms p(90)=32.87ms p(95)=40.14ms p(99.9)=135.36ms
       { expected_response:true }...: avg=20.03ms  min=1.53ms  med=16.89ms max=335.74ms p(90)=32.87ms p(95)=40.14ms p(99.9)=135.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296127
     http_req_receiving.............: avg=571.64µs min=50.72µs med=97.18µs max=147.98ms p(90)=1.09ms  p(95)=1.94ms  p(99.9)=27.54ms 
     http_req_sending...............: avg=45.85µs  min=4.94µs  med=10.03µs max=192.2ms  p(90)=18.69µs p(95)=93.07µs p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.41ms  min=1.45ms  med=16.35ms max=335.54ms p(90)=31.85ms p(95)=39ms    p(99.9)=134.45ms
     http_reqs......................: 296127  2463.581564/s
     iteration_duration.............: avg=20.25ms  min=2.26ms  med=17.1ms  max=335.96ms p(90)=33.11ms p(95)=40.39ms p(99.9)=136.31ms
     iterations.....................: 296027  2462.74963/s
     success_rate...................: 100.00% ✓ 296027      ✗ 0     
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

     checks.........................: 100.00% ✓ 873798      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=3.17µs  min=911ns   med=2.01µs  max=9.01ms   p(90)=3.3µs   p(95)=3.94µs   p(99.9)=35.25µs
     http_req_connecting............: avg=800ns   min=0s      med=0s      max=8.76ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.38ms min=1.63ms  med=20.24ms max=288.9ms  p(90)=28.33ms p(95)=30.62ms  p(99.9)=48.45ms
       { expected_response:true }...: avg=20.38ms min=1.63ms  med=20.24ms max=288.9ms  p(90)=28.33ms p(95)=30.62ms  p(99.9)=48.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291366
     http_req_receiving.............: avg=82.78µs min=25.31µs med=48.85µs max=149.36ms p(90)=85.37µs p(95)=113.54µs p(99.9)=5.88ms 
     http_req_sending...............: avg=36.58µs min=4.72µs  med=9.07µs  max=118.55ms p(90)=15.35µs p(95)=28.16µs  p(99.9)=2.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.26ms min=1.53ms  med=20.13ms max=288.65ms p(90)=28.19ms p(95)=30.46ms  p(99.9)=47.13ms
     http_reqs......................: 291366  2424.008706/s
     iteration_duration.............: avg=20.59ms min=3.21ms  med=20.43ms max=301.77ms p(90)=28.53ms p(95)=30.83ms  p(99.9)=48.97ms
     iterations.....................: 291266  2423.17676/s
     success_rate...................: 100.00% ✓ 291266      ✗ 0     
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

     checks.........................: 100.00% ✓ 863316      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.55µs   min=982ns   med=2.6µs    max=22.33ms  p(90)=4.03µs  p(95)=4.68µs  p(99.9)=38.44µs 
     http_req_connecting............: avg=351ns    min=0s      med=0s       max=3.9ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.62ms  min=1.54ms  med=17.21ms  max=373.87ms p(90)=33.99ms p(95)=41.7ms  p(99.9)=146.76ms
       { expected_response:true }...: avg=20.62ms  min=1.54ms  med=17.21ms  max=373.87ms p(90)=33.99ms p(95)=41.7ms  p(99.9)=146.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287872
     http_req_receiving.............: avg=615.19µs min=52.78µs med=100.11µs max=170.95ms p(90)=1.13ms  p(95)=2.01ms  p(99.9)=28.69ms 
     http_req_sending...............: avg=43.99µs  min=4.83µs  med=9.74µs   max=186.24ms p(90)=16.74µs p(95)=91.28µs p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.96ms  min=1.42ms  med=16.64ms  max=373.73ms p(90)=32.94ms p(95)=40.48ms p(99.9)=145.86ms
     http_reqs......................: 287872  2394.824614/s
     iteration_duration.............: avg=20.84ms  min=2.6ms   med=17.42ms  max=374.07ms p(90)=34.22ms p(95)=41.93ms p(99.9)=147.03ms
     iterations.....................: 287772  2393.992708/s
     success_rate...................: 100.00% ✓ 287772      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 800757      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=3.33µs   min=891ns   med=2.33µs   max=14.91ms  p(90)=3.99µs  p(95)=4.72µs  p(99.9)=31.95µs 
     http_req_connecting............: avg=372ns    min=0s      med=0s       max=3.52ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.24ms  min=1.85ms  med=18.63ms  max=353.53ms p(90)=36.33ms p(95)=44.87ms p(99.9)=160.31ms
       { expected_response:true }...: avg=22.24ms  min=1.85ms  med=18.63ms  max=353.53ms p(90)=36.33ms p(95)=44.87ms p(99.9)=160.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267019
     http_req_receiving.............: avg=618.23µs min=51.72µs med=102.71µs max=157.11ms p(90)=1.15ms  p(95)=1.98ms  p(99.9)=29.84ms 
     http_req_sending...............: avg=39.05µs  min=4.57µs  med=9.32µs   max=151.54ms p(90)=17.59µs p(95)=73.62µs p(99.9)=2.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.59ms  min=1.74ms  med=18.06ms  max=353.46ms p(90)=35.31ms p(95)=43.68ms p(99.9)=158.62ms
     http_reqs......................: 267019  2220.791053/s
     iteration_duration.............: avg=22.46ms  min=2.96ms  med=18.83ms  max=353.71ms p(90)=36.55ms p(95)=45.09ms p(99.9)=161.21ms
     iterations.....................: 266919  2219.959355/s
     success_rate...................: 100.00% ✓ 266919      ✗ 0     
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

     checks.........................: 100.00% ✓ 586539      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 235 MB  2.0 MB/s
     http_req_blocked...............: avg=3.16µs  min=821ns   med=2.09µs  max=11.07ms  p(90)=4.11µs   p(95)=5.24µs   p(99.9)=42.67µs
     http_req_connecting............: avg=422ns   min=0s      med=0s      max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.44ms min=2.23ms  med=29.92ms max=313.3ms  p(90)=40.22ms  p(95)=43.53ms  p(99.9)=63.75ms
       { expected_response:true }...: avg=30.44ms min=2.23ms  med=29.92ms max=313.3ms  p(90)=40.22ms  p(95)=43.53ms  p(99.9)=63.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195613
     http_req_receiving.............: avg=92.57µs min=26.97µs med=54.12µs max=229.15ms p(90)=122.68µs p(95)=195.71µs p(99.9)=3.39ms 
     http_req_sending...............: avg=37.99µs min=4.52µs  med=9.1µs   max=106.81ms p(90)=23.23µs  p(95)=101.15µs p(99.9)=2.68ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.31ms min=2.12ms  med=29.81ms max=293.8ms  p(90)=40.08ms  p(95)=43.37ms  p(99.9)=63.04ms
     http_reqs......................: 195613  1626.184818/s
     iteration_duration.............: avg=30.68ms min=5.52ms  med=30.14ms max=330.22ms p(90)=40.43ms  p(95)=43.75ms  p(99.9)=64.3ms 
     iterations.....................: 195513  1625.35349/s
     success_rate...................: 100.00% ✓ 195513      ✗ 0     
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

     checks.........................: 100.00% ✓ 438144      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 176 MB  1.5 MB/s
     http_req_blocked...............: avg=3.45µs  min=1.03µs  med=2.49µs  max=4.08ms   p(90)=4.17µs   p(95)=4.87µs   p(99.9)=34.86µs 
     http_req_connecting............: avg=616ns   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.82ms min=2.1ms   med=40.45ms max=301.14ms p(90)=56.74ms  p(95)=61.65ms  p(99.9)=85.06ms 
       { expected_response:true }...: avg=40.82ms min=2.1ms   med=40.45ms max=301.14ms p(90)=56.74ms  p(95)=61.65ms  p(99.9)=85.06ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 146148
     http_req_receiving.............: avg=77.26µs min=28.22µs med=65.7µs  max=55.26ms  p(90)=105.23µs p(95)=122.07µs p(99.9)=757.33µs
     http_req_sending...............: avg=25.69µs min=4.89µs  med=11.33µs max=125.8ms  p(90)=18.91µs  p(95)=22.53µs  p(99.9)=918.64µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.72ms min=2.05ms  med=40.36ms max=300.82ms p(90)=56.63ms  p(95)=61.55ms  p(99.9)=84.66ms 
     http_reqs......................: 146148  1215.057844/s
     iteration_duration.............: avg=41.07ms min=4.03ms  med=40.67ms max=311.18ms p(90)=56.96ms  p(95)=61.86ms  p(99.9)=85.61ms 
     iterations.....................: 146048  1214.226455/s
     success_rate...................: 100.00% ✓ 146048      ✗ 0     
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

     checks.........................: 100.00% ✓ 209967     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   699 kB/s
     http_req_blocked...............: avg=3.71µs  min=1.04µs  med=2.56µs  max=3.07ms   p(90)=4.03µs   p(95)=4.64µs   p(99.9)=46.57µs 
     http_req_connecting............: avg=878ns   min=0s      med=0s      max=3.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.37ms min=3.99ms  med=83.74ms max=315.79ms p(90)=108.3ms  p(95)=119.8ms  p(99.9)=196.1ms 
       { expected_response:true }...: avg=85.37ms min=3.99ms  med=83.74ms max=315.79ms p(90)=108.3ms  p(95)=119.8ms  p(99.9)=196.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 70089
     http_req_receiving.............: avg=78.06µs min=28.15µs med=70.01µs max=59.12ms  p(90)=105.67µs p(95)=119.01µs p(99.9)=591.96µs
     http_req_sending...............: avg=21.18µs min=4.87µs  med=12.75µs max=119.03ms p(90)=19.59µs  p(95)=21.64µs  p(99.9)=547.55µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.27ms min=3.9ms   med=83.65ms max=315.39ms p(90)=108.2ms  p(95)=119.69ms p(99.9)=195.98ms
     http_reqs......................: 70089   581.570039/s
     iteration_duration.............: avg=85.73ms min=15.2ms  med=83.99ms max=327.31ms p(90)=108.54ms p(95)=120.08ms p(99.9)=198.13ms
     iterations.....................: 69989   580.74028/s
     success_rate...................: 100.00% ✓ 69989      ✗ 0    
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

     checks.........................: 100.00% ✓ 161181     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   536 kB/s
     http_req_blocked...............: avg=5.64µs   min=1.41µs  med=3.69µs   max=3.9ms    p(90)=5.24µs   p(95)=5.86µs   p(99.9)=54.55µs 
     http_req_connecting............: avg=1.7µs    min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.21ms min=5.25ms  med=109.11ms max=336.54ms p(90)=146.75ms p(95)=157.75ms p(99.9)=202.35ms
       { expected_response:true }...: avg=111.21ms min=5.25ms  med=109.11ms max=336.54ms p(90)=146.75ms p(95)=157.75ms p(99.9)=202.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53827
     http_req_receiving.............: avg=92.93µs  min=33.37µs med=86.19µs  max=147.71ms p(90)=117.9µs  p(95)=130.77µs p(99.9)=510.32µs
     http_req_sending...............: avg=23.51µs  min=6.35µs  med=18.13µs  max=40.91ms  p(90)=23.56µs  p(95)=25.61µs  p(99.9)=585.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.09ms min=5.07ms  med=109ms    max=318.2ms  p(90)=146.64ms p(95)=157.64ms p(99.9)=202.2ms 
     http_reqs......................: 53827   446.072782/s
     iteration_duration.............: avg=111.69ms min=33.34ms med=109.42ms max=347.86ms p(90)=147.07ms p(95)=158.11ms p(99.9)=205.76ms
     iterations.....................: 53727   445.244066/s
     success_rate...................: 100.00% ✓ 53727      ✗ 0    
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

     checks.........................: 100.00% ✓ 97269      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=6.12µs   min=1.09µs  med=3.26µs   max=3.46ms   p(90)=4.68µs   p(95)=5.28µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=2.64µs   min=0s      med=0s       max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=184.29ms min=7.74ms  med=185.53ms max=405.05ms p(90)=205.05ms p(95)=209.82ms p(99.9)=279.05ms
       { expected_response:true }...: avg=184.29ms min=7.74ms  med=185.53ms max=405.05ms p(90)=205.05ms p(95)=209.82ms p(99.9)=279.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32523
     http_req_receiving.............: avg=106.74µs min=30.44µs med=90.3µs   max=196.09ms p(90)=120.24µs p(95)=131.56µs p(99.9)=589.64µs
     http_req_sending...............: avg=24.54µs  min=5.78µs  med=17.7µs   max=56.68ms  p(90)=22.32µs  p(95)=24.17µs  p(99.9)=595.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.16ms min=7.61ms  med=185.41ms max=390.07ms p(90)=204.92ms p(95)=209.68ms p(99.9)=278.41ms
     http_reqs......................: 32523   268.832422/s
     iteration_duration.............: avg=185.16ms min=33.89ms med=186.04ms max=410.08ms p(90)=205.34ms p(95)=210.09ms p(99.9)=285.08ms
     iterations.....................: 32423   268.00583/s
     success_rate...................: 100.00% ✓ 32423      ✗ 0    
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

     checks.........................: 100.00% ✓ 93351      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=6.32µs   min=1.15µs  med=3.14µs   max=3.42ms   p(90)=4.39µs   p(95)=4.91µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=2.99µs   min=0s      med=0s       max=3.38ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=192.06ms min=6.79ms  med=179.68ms max=640.19ms p(90)=226.05ms p(95)=278.33ms p(99.9)=582.9ms 
       { expected_response:true }...: avg=192.06ms min=6.79ms  med=179.68ms max=640.19ms p(90)=226.05ms p(95)=278.33ms p(99.9)=582.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31217
     http_req_receiving.............: avg=94.6µs   min=31.66µs med=88.22µs  max=77.38ms  p(90)=117.14µs p(95)=128.24µs p(99.9)=513.81µs
     http_req_sending...............: avg=27.48µs  min=5.2µs   med=17.16µs  max=108.95ms p(90)=21.17µs  p(95)=22.8µs   p(99.9)=386.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.94ms min=6.48ms  med=179.57ms max=640.11ms p(90)=225.89ms p(95)=277.91ms p(99.9)=582.82ms
     http_reqs......................: 31217   257.88803/s
     iteration_duration.............: avg=192.93ms min=28.6ms  med=180.07ms max=640.37ms p(90)=226.49ms p(95)=279.83ms p(99.9)=583.16ms
     iterations.....................: 31117   257.061916/s
     success_rate...................: 100.00% ✓ 31117      ✗ 0    
     vus............................: 24      min=24       max=50 
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

     checks.........................: 100.00% ✓ 8295      ✗ 0   
     data_received..................: 274 MB  2.2 MB/s
     data_sent......................: 3.4 MB  28 kB/s
     http_req_blocked...............: avg=105.48µs min=1.43µs  med=3.91µs  max=9.36ms p(90)=5.64µs   p(95)=6.51µs   p(99.9)=8.88ms  
     http_req_connecting............: avg=98.25µs  min=0s      med=0s      max=9.29ms p(90)=0s       p(95)=0s       p(99.9)=8.85ms  
     http_req_duration..............: avg=2.1s     min=26.29ms med=2.16s   max=4.05s  p(90)=2.85s    p(95)=3.1s     p(99.9)=3.69s   
       { expected_response:true }...: avg=2.1s     min=26.29ms med=2.16s   max=4.05s  p(90)=2.85s    p(95)=3.1s     p(99.9)=3.69s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2865
     http_req_receiving.............: avg=109.19µs min=37.01µs med=98.46µs max=5.55ms p(90)=144.86µs p(95)=165.06µs p(99.9)=928.14µs
     http_req_sending...............: avg=49.74µs  min=6.71µs  med=20.41µs max=8.44ms p(90)=26.28µs  p(95)=31.23µs  p(99.9)=2.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.1s     min=26.18ms med=2.16s   max=4.05s  p(90)=2.85s    p(95)=3.1s     p(99.9)=3.69s   
     http_reqs......................: 2865    22.883356/s
     iteration_duration.............: avg=2.18s    min=73.52ms med=2.2s    max=4.05s  p(90)=2.86s    p(95)=3.1s     p(99.9)=3.69s   
     iterations.....................: 2765    22.084635/s
     success_rate...................: 100.00% ✓ 2765      ✗ 0   
     vus............................: 21      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

