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
| hive-router | v0.0.84 | 2,901 | 3,203 | 2,870 | 3.9% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,776 | 2,884 | 2,748 | 1.6% |  |
| fusion | 16.6.3 | 2,606 | 2,746 | 2,587 | 2.2% |  |
| fusion-nightly | 16.7.0-p.2 | 2,592 | 2,730 | 2,585 | 2.0% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,394 | 2,494 | 2,381 | 1.6% |  |
| grafbase | 0.53.5 | 2,155 | 2,256 | 2,126 | 2.0% |  |
| cosmo | 0.334.0 | 1,301 | 1,349 | 1,293 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 625 | 642 | 623 | 1.2% |  |
| apollo-router | v2.16.1 | 484 | 492 | 479 | 0.9% |  |
| apollo-gateway | 2.14.3 | 285 | 289 | 285 | 0.5% |  |
| hive-gateway | 2.10.8 | 279 | 286 | 276 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1145 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,534 | 2,676 | 2,476 | 2.5% |  |
| fusion | 16.6.3 | 2,502 | 2,619 | 2,495 | 1.7% |  |
| fusion-nightly-net11 | 16.7.0-p.2 | 2,466 | 2,584 | 2,461 | 1.8% |  |
| fusion-nightly | 16.7.0-p.2 | 2,463 | 2,592 | 2,399 | 2.4% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 2,248 | 2,433 | 2,233 | 3.3% |  |
| grafbase | 0.53.5 | 1,647 | 1,704 | 1,644 | 1.2% |  |
| cosmo | 0.334.0 | 1,231 | 1,277 | 1,222 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.8 | 593 | 613 | 590 | 1.3% |  |
| apollo-router | v2.16.1 | 450 | 467 | 448 | 1.6% |  |
| hive-gateway | 2.10.8 | 270 | 277 | 269 | 0.9% |  |
| apollo-gateway | 2.14.3 | 264 | 269 | 263 | 0.7% |  |
| feddi | 5ff8b6165878 | 21 | 23 | 21 | 3.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1045842     ✗ 0     
     data_received..................: 31 GB   255 MB/s
     data_sent......................: 419 MB  3.5 MB/s
     http_req_blocked...............: avg=2.57µs  min=911ns   med=1.88µs  max=17.19ms  p(90)=3.07µs  p(95)=3.66µs   p(99.9)=30.12µs
     http_req_connecting............: avg=244ns   min=0s      med=0s      max=3.61ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17ms    min=1.41ms  med=16.34ms max=284.31ms p(90)=24.88ms p(95)=27.95ms  p(99.9)=46.87ms
       { expected_response:true }...: avg=17ms    min=1.41ms  med=16.34ms max=284.31ms p(90)=24.88ms p(95)=27.95ms  p(99.9)=46.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 348714
     http_req_receiving.............: avg=82.26µs min=26.32µs med=46.04µs max=159.6ms  p(90)=81.81µs p(95)=127.33µs p(99.9)=6.45ms 
     http_req_sending...............: avg=45.19µs min=4.34µs  med=8.13µs  max=108.58ms p(90)=14.43µs p(95)=82.78µs  p(99.9)=6.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.87ms min=1.34ms  med=16.23ms max=283.39ms p(90)=24.71ms p(95)=27.72ms  p(99.9)=46.1ms 
     http_reqs......................: 348714  2901.689247/s
     iteration_duration.............: avg=17.2ms  min=1.83ms  med=16.52ms max=292.36ms p(90)=25.07ms p(95)=28.17ms  p(99.9)=47.5ms 
     iterations.....................: 348614  2900.857136/s
     success_rate...................: 100.00% ✓ 348614      ✗ 0     
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

     checks.........................: 100.00% ✓ 1001361     ✗ 0     
     data_received..................: 29 GB   243 MB/s
     data_sent......................: 401 MB  3.3 MB/s
     http_req_blocked...............: avg=2.5µs    min=861ns   med=1.83µs  max=16.76ms  p(90)=3.02µs  p(95)=3.63µs  p(99.9)=27.32µs
     http_req_connecting............: avg=264ns    min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.76ms  min=1.93ms  med=16.86ms max=296.49ms p(90)=25.86ms p(95)=29.41ms p(99.9)=49.62ms
       { expected_response:true }...: avg=17.76ms  min=1.93ms  med=16.86ms max=296.49ms p(90)=25.86ms p(95)=29.41ms p(99.9)=49.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 333887
     http_req_receiving.............: avg=458.61µs min=50.53µs med=88.75µs max=160.69ms p(90)=1.11ms  p(95)=1.75ms  p(99.9)=17.81ms
     http_req_sending...............: avg=44.08µs  min=4.39µs  med=7.96µs  max=137.42ms p(90)=14.42µs p(95)=83.67µs p(99.9)=5.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.25ms  min=1.85ms  med=16.37ms max=282.97ms p(90)=25.21ms p(95)=28.71ms p(99.9)=47.97ms
     http_reqs......................: 333887  2776.8127/s
     iteration_duration.............: avg=17.96ms  min=3.26ms  med=17.05ms max=305.7ms  p(90)=26.06ms p(95)=29.62ms p(99.9)=50.09ms
     iterations.....................: 333787  2775.981038/s
     success_rate...................: 100.00% ✓ 333787      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 940182      ✗ 0     
     data_received..................: 28 GB   229 MB/s
     data_sent......................: 377 MB  3.1 MB/s
     http_req_blocked...............: avg=2.9µs    min=852ns   med=1.97µs  max=16.68ms  p(90)=3.32µs  p(95)=3.98µs  p(99.9)=29.61µs 
     http_req_connecting............: avg=281ns    min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.92ms  min=1.88ms  med=16.38ms max=285.4ms  p(90)=30.7ms  p(95)=36.89ms p(99.9)=115.93ms
       { expected_response:true }...: avg=18.92ms  min=1.88ms  med=16.38ms max=285.4ms  p(90)=30.7ms  p(95)=36.89ms p(99.9)=115.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 313494
     http_req_receiving.............: avg=556.55µs min=50.18µs med=90.37µs max=192.56ms p(90)=1.06ms  p(95)=1.91ms  p(99.9)=25.16ms 
     http_req_sending...............: avg=42.88µs  min=4.58µs  med=8.35µs  max=178.4ms  p(90)=15.32µs p(95)=78.69µs p(99.9)=4.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.32ms  min=1.81ms  med=15.85ms max=265.61ms p(90)=29.78ms p(95)=35.89ms p(99.9)=114.57ms
     http_reqs......................: 313494  2606.86109/s
     iteration_duration.............: avg=19.13ms  min=2.96ms  med=16.58ms max=303.01ms p(90)=30.92ms p(95)=37.13ms p(99.9)=116.89ms
     iterations.....................: 313394  2606.029539/s
     success_rate...................: 100.00% ✓ 313394      ✗ 0     
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

     checks.........................: 100.00% ✓ 934896      ✗ 0     
     data_received..................: 27 GB   227 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=3.06µs  min=871ns  med=2.26µs  max=17.47ms  p(90)=3.6µs   p(95)=4.23µs  p(99.9)=33.94µs 
     http_req_connecting............: avg=294ns   min=0s     med=0s      max=4.01ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.03ms min=2.08ms med=16.45ms max=325.22ms p(90)=30.77ms p(95)=37.22ms p(99.9)=117.51ms
       { expected_response:true }...: avg=19.03ms min=2.08ms med=16.45ms max=325.22ms p(90)=30.77ms p(95)=37.22ms p(99.9)=117.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 311732
     http_req_receiving.............: avg=548.8µs min=50.7µs med=92.5µs  max=241.9ms  p(90)=1.05ms  p(95)=1.88ms  p(99.9)=24.99ms 
     http_req_sending...............: avg=42.95µs min=4.46µs med=8.76µs  max=156.58ms p(90)=15.53µs p(95)=87.06µs p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.44ms min=1.95ms med=15.92ms max=325.14ms p(90)=29.89ms p(95)=36.22ms p(99.9)=115.59ms
     http_reqs......................: 311732  2592.093013/s
     iteration_duration.............: avg=19.24ms min=2.45ms med=16.64ms max=325.39ms p(90)=31ms    p(95)=37.46ms p(99.9)=117.99ms
     iterations.....................: 311632  2591.2615/s
     success_rate...................: 100.00% ✓ 311632      ✗ 0     
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

     checks.........................: 100.00% ✓ 863199      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.66µs   min=892ns   med=1.98µs  max=12.43ms  p(90)=3.14µs  p(95)=3.69µs  p(99.9)=28.54µs 
     http_req_connecting............: avg=332ns    min=0s      med=0s      max=3.86ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.63ms  min=1.71ms  med=16.63ms max=508.22ms p(90)=34.73ms p(95)=43.96ms p(99.9)=179.48ms
       { expected_response:true }...: avg=20.63ms  min=1.71ms  med=16.63ms max=508.22ms p(90)=34.73ms p(95)=43.96ms p(99.9)=179.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287833
     http_req_receiving.............: avg=590.62µs min=50.74µs med=93.74µs max=255.66ms p(90)=1.05ms  p(95)=1.87ms  p(99.9)=28.23ms 
     http_req_sending...............: avg=34.95µs  min=4.53µs  med=8.39µs  max=81.91ms  p(90)=13.8µs  p(95)=51.99µs p(99.9)=2.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.01ms  min=1.6ms   med=16.09ms max=508.14ms p(90)=33.75ms p(95)=42.81ms p(99.9)=178.6ms 
     http_reqs......................: 287833  2394.23393/s
     iteration_duration.............: avg=20.84ms  min=2.52ms  med=16.82ms max=508.39ms p(90)=34.95ms p(95)=44.17ms p(99.9)=181.1ms 
     iterations.....................: 287733  2393.402117/s
     success_rate...................: 100.00% ✓ 287733      ✗ 0     
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

     checks.........................: 100.00% ✓ 777288      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=3.87µs  min=992ns   med=2.54µs  max=154.29ms p(90)=4.12µs  p(95)=4.88µs   p(99.9)=39.49µs
     http_req_connecting............: avg=305ns   min=0s      med=0s      max=3.52ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.93ms min=1.72ms  med=22.69ms max=309.44ms p(90)=27.26ms p(95)=29.1ms   p(99.9)=48.19ms
       { expected_response:true }...: avg=22.93ms min=1.72ms  med=22.69ms max=309.44ms p(90)=27.26ms p(95)=29.1ms   p(99.9)=48.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259196
     http_req_receiving.............: avg=91.52µs min=28.64µs med=56.68µs max=139.5ms  p(90)=94.97µs p(95)=123.28µs p(99.9)=6.5ms  
     http_req_sending...............: avg=36.33µs min=4.5µs   med=10.59µs max=98.96ms  p(90)=17.69µs p(95)=28.84µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.8ms  min=1.67ms  med=22.59ms max=308.36ms p(90)=27.13ms p(95)=28.91ms  p(99.9)=47ms   
     http_reqs......................: 259196  2155.909509/s
     iteration_duration.............: avg=23.14ms min=3.73ms  med=22.89ms max=328.74ms p(90)=27.47ms p(95)=29.32ms  p(99.9)=48.84ms
     iterations.....................: 259096  2155.077741/s
     success_rate...................: 100.00% ✓ 259096      ✗ 0     
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

     checks.........................: 100.00% ✓ 469443      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 188 MB  1.6 MB/s
     http_req_blocked...............: avg=3.27µs  min=961ns   med=2.38µs  max=4.1ms    p(90)=3.83µs  p(95)=4.47µs   p(99.9)=36.82µs 
     http_req_connecting............: avg=581ns   min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.11ms min=2.04ms  med=37.71ms max=297.47ms p(90)=53.24ms p(95)=58.06ms  p(99.9)=80.62ms 
       { expected_response:true }...: avg=38.11ms min=2.04ms  med=37.71ms max=297.47ms p(90)=53.24ms p(95)=58.06ms  p(99.9)=80.62ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 156581
     http_req_receiving.............: avg=71.59µs min=25.58µs med=58.56µs max=42.94ms  p(90)=93.65µs p(95)=109.11µs p(99.9)=817.77µs
     http_req_sending...............: avg=22.8µs  min=4.87µs  med=10.11µs max=156.3ms  p(90)=16.15µs p(95)=20.02µs  p(99.9)=945.15µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.01ms min=1.94ms  med=37.62ms max=288.18ms p(90)=53.14ms p(95)=57.96ms  p(99.9)=80.29ms 
     http_reqs......................: 156581  1301.918063/s
     iteration_duration.............: avg=38.33ms min=3.83ms  med=37.91ms max=308.83ms p(90)=53.43ms p(95)=58.26ms  p(99.9)=80.95ms 
     iterations.....................: 156481  1301.086597/s
     success_rate...................: 100.00% ✓ 156481      ✗ 0     
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

     checks.........................: 100.00% ✓ 225828     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   751 kB/s
     http_req_blocked...............: avg=4.1µs   min=1.05µs  med=2.57µs  max=3.51ms   p(90)=4.08µs  p(95)=4.7µs    p(99.9)=43.13µs 
     http_req_connecting............: avg=1.26µs  min=0s      med=0s      max=3.46ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.38ms min=3.52ms  med=77.68ms max=286.75ms p(90)=98.44ms p(95)=107.86ms p(99.9)=188.08ms
       { expected_response:true }...: avg=79.38ms min=3.52ms  med=77.68ms max=286.75ms p(90)=98.44ms p(95)=107.86ms p(99.9)=188.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75376
     http_req_receiving.............: avg=78.91µs min=28.09µs med=66.46µs max=157.8ms  p(90)=104.6µs p(95)=118.11µs p(99.9)=614.35µs
     http_req_sending...............: avg=23.72µs min=4.84µs  med=12.69µs max=200.8ms  p(90)=20.09µs p(95)=22.22µs  p(99.9)=580.84µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.28ms min=3.41ms  med=77.58ms max=286.23ms p(90)=98.35ms p(95)=107.74ms p(99.9)=187.51ms
     http_reqs......................: 75376   625.583708/s
     iteration_duration.............: avg=79.72ms min=17.58ms med=77.92ms max=329.21ms p(90)=98.69ms p(95)=108.14ms p(99.9)=189.63ms
     iterations.....................: 75276   624.753758/s
     success_rate...................: 100.00% ✓ 75276      ✗ 0    
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

     checks.........................: 100.00% ✓ 174960     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   582 kB/s
     http_req_blocked...............: avg=4.91µs   min=1.09µs  med=3.36µs   max=3.23ms   p(90)=4.76µs   p(95)=5.34µs   p(99.9)=52.44µs 
     http_req_connecting............: avg=1.34µs   min=0s      med=0s       max=3.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.46ms min=4.69ms  med=102.18ms max=320.32ms p(90)=123.7ms  p(95)=129.98ms p(99.9)=161.53ms
       { expected_response:true }...: avg=102.46ms min=4.69ms  med=102.18ms max=320.32ms p(90)=123.7ms  p(95)=129.98ms p(99.9)=161.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58420
     http_req_receiving.............: avg=85.88µs  min=29.37µs med=79.31µs  max=37.43ms  p(90)=112.58µs p(95)=126.05µs p(99.9)=560.91µs
     http_req_sending...............: avg=25.25µs  min=5.25µs  med=15.58µs  max=85.06ms  p(90)=21.5µs   p(95)=23.42µs  p(99.9)=725.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.35ms min=4.54ms  med=102.08ms max=319.05ms p(90)=123.6ms  p(95)=129.87ms p(99.9)=160.72ms
     http_reqs......................: 58420   484.438424/s
     iteration_duration.............: avg=102.9ms  min=32.96ms med=102.46ms max=350.12ms p(90)=123.97ms p(95)=130.24ms p(99.9)=162.7ms 
     iterations.....................: 58320   483.60919/s
     success_rate...................: 100.00% ✓ 58320      ✗ 0    
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

     checks.........................: 100.00% ✓ 103152     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=5.04µs   min=1.23µs  med=3.5µs    max=2.16ms   p(90)=4.84µs   p(95)=5.4µs    p(99.9)=441.9µs 
     http_req_connecting............: avg=1.31µs   min=0s      med=0s       max=2.13ms   p(90)=0s       p(95)=0s       p(99.9)=414.05µs
     http_req_duration..............: avg=173.8ms  min=7.34ms  med=174.5ms  max=355.68ms p(90)=183.4ms  p(95)=187.87ms p(99.9)=255.44ms
       { expected_response:true }...: avg=173.8ms  min=7.34ms  med=174.5ms  max=355.68ms p(90)=183.4ms  p(95)=187.87ms p(99.9)=255.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34484
     http_req_receiving.............: avg=93.49µs  min=35.18µs med=86.31µs  max=140.67ms p(90)=116.78µs p(95)=127.64µs p(99.9)=447µs   
     http_req_sending...............: avg=32.34µs  min=5.86µs  med=17.44µs  max=110.47ms p(90)=21.81µs  p(95)=23.55µs  p(99.9)=554.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.68ms min=7.25ms  med=174.39ms max=355.61ms p(90)=183.28ms p(95)=187.74ms p(99.9)=253.74ms
     http_reqs......................: 34484   285.188598/s
     iteration_duration.............: avg=174.58ms min=51.02ms med=174.87ms max=360.6ms  p(90)=183.67ms p(95)=188.18ms p(99.9)=259.45ms
     iterations.....................: 34384   284.361581/s
     success_rate...................: 100.00% ✓ 34384      ✗ 0    
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

     checks.........................: 100.00% ✓ 100998     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   335 kB/s
     http_req_blocked...............: avg=6.41µs   min=1.47µs  med=3.6µs    max=3.54ms   p(90)=5.04µs   p(95)=5.67µs   p(99.9)=1.13ms  
     http_req_connecting............: avg=2.57µs   min=0s      med=0s       max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.11ms  
     http_req_duration..............: avg=177.55ms min=5.33ms  med=163.3ms  max=713.12ms p(90)=210.08ms p(95)=249.55ms p(99.9)=609.15ms
       { expected_response:true }...: avg=177.55ms min=5.33ms  med=163.3ms  max=713.12ms p(90)=210.08ms p(95)=249.55ms p(99.9)=609.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33766
     http_req_receiving.............: avg=98.91µs  min=37.12µs med=89.11µs  max=125.39ms p(90)=119.61µs p(95)=131.82µs p(99.9)=808.38µs
     http_req_sending...............: avg=36.29µs  min=5.61µs  med=18µs     max=160.18ms p(90)=22.88µs  p(95)=24.67µs  p(99.9)=545.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.41ms min=5.26ms  med=163.18ms max=712.96ms p(90)=209.91ms p(95)=249.24ms p(99.9)=609.06ms
     http_reqs......................: 33766   279.291615/s
     iteration_duration.............: avg=178.34ms min=45.47ms med=163.64ms max=713.36ms p(90)=210.56ms p(95)=251.38ms p(99.9)=609.51ms
     iterations.....................: 33666   278.464476/s
     success_rate...................: 100.00% ✓ 33666      ✗ 0    
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

     checks.........................: 100.00% ✓ 913659      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 366 MB  3.0 MB/s
     http_req_blocked...............: avg=2.89µs  min=901ns   med=2.17µs  max=4.23ms   p(90)=3.78µs  p(95)=4.56µs   p(99.9)=35.42µs
     http_req_connecting............: avg=327ns   min=0s      med=0s      max=4.19ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.48ms min=1.74ms  med=19.19ms max=299.61ms p(90)=26.98ms p(95)=29.38ms  p(99.9)=47.75ms
       { expected_response:true }...: avg=19.48ms min=1.74ms  med=19.19ms max=299.61ms p(90)=26.98ms p(95)=29.38ms  p(99.9)=47.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 304653
     http_req_receiving.............: avg=86.24µs min=26.18µs med=50.31µs max=164.23ms p(90)=90.79µs p(95)=127.21µs p(99.9)=6.07ms 
     http_req_sending...............: avg=42.23µs min=4.78µs  med=9.61µs  max=138.21ms p(90)=17.91µs p(95)=73.48µs  p(99.9)=3.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.35ms min=1.67ms  med=19.07ms max=281.48ms p(90)=26.83ms p(95)=29.2ms   p(99.9)=46.83ms
     http_reqs......................: 304653  2534.121016/s
     iteration_duration.............: avg=19.69ms min=3.53ms  med=19.38ms max=309.75ms p(90)=27.18ms p(95)=29.59ms  p(99.9)=48.28ms
     iterations.....................: 304553  2533.28921/s
     success_rate...................: 100.00% ✓ 304553      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 901998      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=3.03µs  min=892ns   med=2.35µs  max=11.56ms  p(90)=3.85µs  p(95)=4.53µs  p(99.9)=31.76µs 
     http_req_connecting............: avg=299ns   min=0s      med=0s      max=4.03ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.72ms min=1.61ms  med=16.57ms max=378.61ms p(90)=32.43ms p(95)=39.57ms p(99.9)=136.72ms
       { expected_response:true }...: avg=19.72ms min=1.61ms  med=16.57ms max=378.61ms p(90)=32.43ms p(95)=39.57ms p(99.9)=136.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300766
     http_req_receiving.............: avg=567.9µs min=51.13µs med=95.28µs max=149.67ms p(90)=1.08ms  p(95)=1.9ms   p(99.9)=26.83ms 
     http_req_sending...............: avg=44.61µs min=4.91µs  med=9.27µs  max=162.88ms p(90)=16.58µs p(95)=91.29µs p(99.9)=3.61ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.11ms min=1.52ms  med=16.04ms max=378.53ms p(90)=31.45ms p(95)=38.44ms p(99.9)=135.61ms
     http_reqs......................: 300766  2502.069314/s
     iteration_duration.............: avg=19.94ms min=2.67ms  med=16.78ms max=378.83ms p(90)=32.65ms p(95)=39.81ms p(99.9)=137.68ms
     iterations.....................: 300666  2501.237415/s
     success_rate...................: 100.00% ✓ 300666      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 888963      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=3.33µs   min=992ns   med=2.53µs   max=11.92ms  p(90)=4.04µs  p(95)=4.73µs  p(99.9)=36.41µs
     http_req_connecting............: avg=289ns    min=0s      med=0s       max=3.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.01ms  min=1.54ms  med=19.12ms  max=301.84ms p(90)=29.13ms p(95)=32.92ms p(99.9)=54.33ms
       { expected_response:true }...: avg=20.01ms  min=1.54ms  med=19.12ms  max=301.84ms p(90)=29.13ms p(95)=32.92ms p(99.9)=54.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296421
     http_req_receiving.............: avg=564.51µs min=53.78µs med=102.83µs max=171.7ms  p(90)=1.4ms   p(95)=2.23ms  p(99.9)=19.18ms
     http_req_sending...............: avg=46.62µs  min=4.77µs  med=9.4µs    max=183.06ms p(90)=18.03µs p(95)=94.81µs p(99.9)=4.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.4ms   min=1.43ms  med=18.51ms  max=301.24ms p(90)=28.39ms p(95)=32.12ms p(99.9)=53.01ms
     http_reqs......................: 296421  2466.026565/s
     iteration_duration.............: avg=20.23ms  min=3ms     med=19.33ms  max=316.5ms  p(90)=29.35ms p(95)=33.16ms p(99.9)=54.72ms
     iterations.....................: 296321  2465.194632/s
     success_rate...................: 100.00% ✓ 296321      ✗ 0     
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

     checks.........................: 100.00% ✓ 888159      ✗ 0     
     data_received..................: 26 GB   216 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=3.81µs   min=882ns   med=2.08µs  max=99.39ms  p(90)=3.6µs   p(95)=4.35µs  p(99.9)=33.76µs 
     http_req_connecting............: avg=869ns    min=0s      med=0s      max=8.03ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.04ms  min=1.55ms  med=16.92ms max=299.32ms p(90)=32.85ms p(95)=40.05ms p(99.9)=133.86ms
       { expected_response:true }...: avg=20.04ms  min=1.55ms  med=16.92ms max=299.32ms p(90)=32.85ms p(95)=40.05ms p(99.9)=133.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296153
     http_req_receiving.............: avg=569.03µs min=52.01µs med=92.85µs max=150.17ms p(90)=1.08ms  p(95)=1.92ms  p(99.9)=26ms    
     http_req_sending...............: avg=42.39µs  min=4.65µs  med=8.61µs  max=140.43ms p(90)=16.81µs p(95)=81.18µs p(99.9)=3.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.43ms  min=1.43ms  med=16.4ms  max=298.16ms p(90)=31.88ms p(95)=38.91ms p(99.9)=132.14ms
     http_reqs......................: 296153  2463.76417/s
     iteration_duration.............: avg=20.25ms  min=2.7ms   med=17.12ms max=302.01ms p(90)=33.07ms p(95)=40.28ms p(99.9)=134.32ms
     iterations.....................: 296053  2462.932247/s
     success_rate...................: 100.00% ✓ 296053      ✗ 0     
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

     checks.........................: 100.00% ✓ 810633      ✗ 0     
     data_received..................: 24 GB   197 MB/s
     data_sent......................: 325 MB  2.7 MB/s
     http_req_blocked...............: avg=8.48µs   min=971ns  med=2.66µs   max=178.19ms p(90)=4.18µs  p(95)=4.9µs   p(99.9)=37.71µs 
     http_req_connecting............: avg=5.24µs   min=0s     med=0s       max=178.16ms p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.96ms  min=1.83ms med=18.48ms  max=330.49ms p(90)=35.96ms p(95)=44.3ms  p(99.9)=157.97ms
       { expected_response:true }...: avg=21.96ms  min=1.83ms med=18.48ms  max=330.49ms p(90)=35.96ms p(95)=44.3ms  p(99.9)=157.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 270311
     http_req_receiving.............: avg=627.35µs min=52.8µs med=104.21µs max=200.68ms p(90)=1.16ms  p(95)=2.06ms  p(99.9)=30.2ms  
     http_req_sending...............: avg=47.26µs  min=5.08µs med=10.13µs  max=155.67ms p(90)=17.69µs p(95)=88.47µs p(99.9)=3.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.28ms  min=1.74ms med=17.9ms   max=330.36ms p(90)=34.91ms p(95)=43.03ms p(99.9)=155.46ms
     http_reqs......................: 270311  2248.256101/s
     iteration_duration.............: avg=22.19ms  min=2.31ms med=18.69ms  max=330.72ms p(90)=36.18ms p(95)=44.55ms p(99.9)=160.16ms
     iterations.....................: 270211  2247.424372/s
     success_rate...................: 100.00% ✓ 270211      ✗ 0     
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

     checks.........................: 100.00% ✓ 594270      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=3.3µs   min=891ns   med=2.21µs  max=12.56ms  p(90)=4.37µs  p(95)=5.46µs   p(99.9)=34.79µs
     http_req_connecting............: avg=419ns   min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.03ms min=2.18ms  med=29.55ms max=294.01ms p(90)=40ms    p(95)=43.39ms  p(99.9)=63.8ms 
       { expected_response:true }...: avg=30.03ms min=2.18ms  med=29.55ms max=294.01ms p(90)=40ms    p(95)=43.39ms  p(99.9)=63.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 198190
     http_req_receiving.............: avg=94.5µs  min=28.21µs med=54.37µs max=26.17ms  p(90)=125.3µs p(95)=204.5µs  p(99.9)=4.59ms 
     http_req_sending...............: avg=42.65µs min=4.68µs  med=9.28µs  max=108.43ms p(90)=24.17µs p(95)=107.91µs p(99.9)=3.52ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.89ms min=2.11ms  med=29.43ms max=289.58ms p(90)=39.83ms p(95)=43.22ms  p(99.9)=63.36ms
     http_reqs......................: 198190  1647.822634/s
     iteration_duration.............: avg=30.27ms min=6.51ms  med=29.77ms max=304.32ms p(90)=40.22ms p(95)=43.62ms  p(99.9)=64.16ms
     iterations.....................: 198090  1646.991198/s
     success_rate...................: 100.00% ✓ 198090      ✗ 0     
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

     checks.........................: 100.00% ✓ 444078      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=4µs     min=1.1µs   med=3.07µs  max=4.04ms   p(90)=4.7µs    p(95)=5.4µs    p(99.9)=39.69µs
     http_req_connecting............: avg=636ns   min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.26ms min=2.15ms  med=39.85ms max=290.7ms  p(90)=55.9ms   p(95)=60.86ms  p(99.9)=84.15ms
       { expected_response:true }...: avg=40.26ms min=2.15ms  med=39.85ms max=290.7ms  p(90)=55.9ms   p(95)=60.86ms  p(99.9)=84.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148126
     http_req_receiving.............: avg=83.68µs min=25.02µs med=70.51µs max=73.46ms  p(90)=109.93µs p(95)=127.13µs p(99.9)=1.12ms 
     http_req_sending...............: avg=28.91µs min=5.22µs  med=12.78µs max=116.89ms p(90)=19.82µs  p(95)=23.67µs  p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.15ms min=2.02ms  med=39.74ms max=290.19ms p(90)=55.78ms  p(95)=60.74ms  p(99.9)=83.96ms
     http_reqs......................: 148126  1231.508536/s
     iteration_duration.............: avg=40.52ms min=4.13ms  med=40.07ms max=320.91ms p(90)=56.12ms  p(95)=61.09ms  p(99.9)=85.33ms
     iterations.....................: 148026  1230.677144/s
     success_rate...................: 100.00% ✓ 148026      ✗ 0     
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

     checks.........................: 100.00% ✓ 214233     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   713 kB/s
     http_req_blocked...............: avg=4.79µs  min=1.09µs  med=3.32µs  max=3.79ms   p(90)=4.91µs   p(95)=5.57µs   p(99.9)=47.11µs 
     http_req_connecting............: avg=1.22µs  min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.67ms min=3.91ms  med=81.66ms max=349.35ms p(90)=101.88ms p(95)=111.81ms p(99.9)=196ms   
       { expected_response:true }...: avg=83.67ms min=3.91ms  med=81.66ms max=349.35ms p(90)=101.88ms p(95)=111.81ms p(99.9)=196ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 71511
     http_req_receiving.............: avg=86.71µs min=27.43µs med=75.09µs max=169.5ms  p(90)=111.42µs p(95)=125.09µs p(99.9)=600.61µs
     http_req_sending...............: avg=22.52µs min=4.85µs  med=15.61µs max=50.38ms  p(90)=22.35µs  p(95)=24.66µs  p(99.9)=615.4µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.56ms min=3.82ms  med=81.56ms max=337.93ms p(90)=101.77ms p(95)=111.69ms p(99.9)=195.74ms
     http_reqs......................: 71511   593.205313/s
     iteration_duration.............: avg=84.03ms min=24.67ms med=81.91ms max=362.4ms  p(90)=102.14ms p(95)=112.07ms p(99.9)=196.71ms
     iterations.....................: 71411   592.375783/s
     success_rate...................: 100.00% ✓ 71411      ✗ 0    
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

     checks.........................: 100.00% ✓ 162747     ✗ 0    
     data_received..................: 4.8 GB  39 MB/s
     data_sent......................: 65 MB   541 kB/s
     http_req_blocked...............: avg=5.46µs   min=1.1µs   med=3.57µs   max=3.81ms   p(90)=5.18µs   p(95)=5.78µs   p(99.9)=109.32µs
     http_req_connecting............: avg=1.66µs   min=0s      med=0s       max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.15ms min=5.22ms  med=107.99ms max=303.54ms p(90)=145.32ms p(95)=156.14ms p(99.9)=201.75ms
       { expected_response:true }...: avg=110.15ms min=5.22ms  med=107.99ms max=303.54ms p(90)=145.32ms p(95)=156.14ms p(99.9)=201.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54349
     http_req_receiving.............: avg=90.94µs  min=27.78µs med=83.12µs  max=166.51ms p(90)=115.25µs p(95)=128.43µs p(99.9)=587.94µs
     http_req_sending...............: avg=29.07µs  min=5.19µs  med=17.36µs  max=101.16ms p(90)=22.82µs  p(95)=24.93µs  p(99.9)=590.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.03ms min=5.05ms  med=107.89ms max=303.13ms p(90)=145.18ms p(95)=156.02ms p(99.9)=201.1ms 
     http_reqs......................: 54349   450.517934/s
     iteration_duration.............: avg=110.62ms min=30.12ms med=108.33ms max=320.43ms p(90)=145.58ms p(95)=156.46ms p(99.9)=202.42ms
     iterations.....................: 54249   449.688999/s
     success_rate...................: 100.00% ✓ 54249      ✗ 0    
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

     checks.........................: 100.00% ✓ 97797      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=10.3µs   min=1.08µs  med=3.32µs   max=8.75ms   p(90)=4.73µs   p(95)=5.32µs   p(99.9)=3.17ms  
     http_req_connecting............: avg=6.63µs   min=0s      med=0s       max=8.58ms   p(90)=0s       p(95)=0s       p(99.9)=3.11ms  
     http_req_duration..............: avg=183.29ms min=5.88ms  med=168.12ms max=733.51ms p(90)=210.93ms p(95)=251.46ms p(99.9)=615.66ms
       { expected_response:true }...: avg=183.29ms min=5.88ms  med=168.12ms max=733.51ms p(90)=210.93ms p(95)=251.46ms p(99.9)=615.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32699
     http_req_receiving.............: avg=97.04µs  min=32.98µs med=91.87µs  max=79.3ms   p(90)=122.82µs p(95)=134.81µs p(99.9)=705.63µs
     http_req_sending...............: avg=27.95µs  min=5.79µs  med=18.34µs  max=93.54ms  p(90)=22.85µs  p(95)=24.67µs  p(99.9)=1.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.17ms min=5.77ms  med=168.02ms max=733.4ms  p(90)=210.82ms p(95)=251.27ms p(99.9)=615.56ms
     http_reqs......................: 32699   270.637599/s
     iteration_duration.............: avg=184.13ms min=47.44ms med=168.47ms max=733.75ms p(90)=211.41ms p(95)=252.93ms p(99.9)=616.1ms 
     iterations.....................: 32599   269.809936/s
     success_rate...................: 100.00% ✓ 32599      ✗ 0    
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

     checks.........................: 100.00% ✓ 95532      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=6µs      min=1.16µs  med=3.03µs   max=3.59ms   p(90)=4.32µs   p(95)=4.83µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=2.8µs    min=0s      med=0s       max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=187.66ms min=7.98ms  med=188.23ms max=403ms    p(90)=197.8ms  p(95)=201.8ms  p(99.9)=277.58ms
       { expected_response:true }...: avg=187.66ms min=7.98ms  med=188.23ms max=403ms    p(90)=197.8ms  p(95)=201.8ms  p(99.9)=277.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31944
     http_req_receiving.............: avg=93.03µs  min=31.71µs med=86.51µs  max=131.8ms  p(90)=116.54µs p(95)=127.8µs  p(99.9)=407.66µs
     http_req_sending...............: avg=37.8µs   min=5.53µs  med=16.37µs  max=177.09ms p(90)=20.7µs   p(95)=22.44µs  p(99.9)=670.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.52ms min=7.84ms  med=188.12ms max=402.26ms p(90)=197.7ms  p(95)=201.68ms p(99.9)=272.97ms
     http_reqs......................: 31944   264.027178/s
     iteration_duration.............: avg=188.51ms min=32.6ms  med=188.65ms max=412.04ms p(90)=198.09ms p(95)=202.1ms  p(99.9)=282.79ms
     iterations.....................: 31844   263.200646/s
     success_rate...................: 100.00% ✓ 31844      ✗ 0    
     vus............................: 1       min=1        max=50 
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

     checks.........................: 100.00% ✓ 7941      ✗ 0   
     data_received..................: 263 MB  2.1 MB/s
     data_sent......................: 3.3 MB  26 kB/s
     http_req_blocked...............: avg=73.72µs  min=1.28µs   med=3.67µs  max=8.08ms  p(90)=5.34µs   p(95)=6.09µs   p(99.9)=6.87ms  
     http_req_connecting............: avg=65.78µs  min=0s       med=0s      max=8.04ms  p(90)=0s       p(95)=0s       p(99.9)=6.54ms  
     http_req_duration..............: avg=2.2s     min=26.33ms  med=2.23s   max=4.49s   p(90)=3.11s    p(95)=3.37s    p(99.9)=4.31s   
       { expected_response:true }...: avg=2.2s     min=26.33ms  med=2.23s   max=4.49s   p(90)=3.11s    p(95)=3.37s    p(99.9)=4.31s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2747
     http_req_receiving.............: avg=103.99µs min=30.79µs  med=94.93µs max=10.57ms p(90)=135.91µs p(95)=152.42µs p(99.9)=472.73µs
     http_req_sending...............: avg=102.23µs min=5.71µs   med=19.37µs max=27.6ms  p(90)=24.91µs  p(95)=28.1µs   p(99.9)=6.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.2s     min=26.13ms  med=2.23s   max=4.49s   p(90)=3.11s    p(95)=3.37s    p(99.9)=4.31s   
     http_reqs......................: 2747    21.906084/s
     iteration_duration.............: avg=2.28s    min=114.67ms med=2.26s   max=4.49s   p(90)=3.13s    p(95)=3.38s    p(99.9)=4.31s   
     iterations.....................: 2647    21.108629/s
     success_rate...................: 100.00% ✓ 2647      ✗ 0   
     vus............................: 31      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

