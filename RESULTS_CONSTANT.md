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
| hive-router | v0.0.84 | 2,877 | 3,165 | 2,810 | 4.0% |  |
| fusion-nightly-net11 | 16.6.0-p.15 | 2,613 | 2,735 | 2,600 | 1.8% |  |
| fusion-nightly | 16.6.0-p.15 | 2,611 | 2,752 | 2,597 | 2.1% |  |
| fusion | 16.5.1 | 2,508 | 2,670 | 2,485 | 2.8% |  |
| fusion-nightly-fed | 16.6.0-p.15 | 2,336 | 2,446 | 2,326 | 1.7% |  |
| grafbase | 0.53.5 | 2,165 | 2,269 | 2,152 | 1.9% |  |
| cosmo | 0.334.0 | 1,284 | 1,321 | 1,274 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 605 | 625 | 603 | 1.4% |  |
| apollo-router | v2.16.1 | 489 | 503 | 469 | 1.8% |  |
| apollo-gateway | 2.14.3 | 280 | 285 | 279 | 0.7% |  |
| hive-gateway | 2.10.8 | 273 | 281 | 272 | 1.4% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1263 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,561 | 2,757 | 2,536 | 3.0% |  |
| fusion-nightly-net11 | 16.6.0-p.15 | 2,412 | 2,527 | 2,399 | 1.9% |  |
| fusion | 16.5.1 | 2,406 | 2,503 | 2,400 | 1.5% |  |
| fusion-nightly | 16.6.0-p.15 | 2,353 | 2,486 | 2,340 | 2.2% |  |
| fusion-nightly-fed | 16.6.0-p.15 | 2,317 | 2,387 | 2,294 | 1.2% |  |
| grafbase | 0.53.5 | 1,667 | 1,729 | 1,664 | 1.4% |  |
| cosmo | 0.334.0 | 1,231 | 1,272 | 1,227 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 590 | 611 | 589 | 1.4% |  |
| apollo-router | v2.16.1 | 445 | 462 | 441 | 1.5% |  |
| apollo-gateway | 2.14.3 | 270 | 274 | 270 | 0.5% |  |
| hive-gateway | 2.10.8 | 264 | 271 | 264 | 0.9% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 2.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1037262     ✗ 0     
     data_received..................: 30 GB   252 MB/s
     data_sent......................: 416 MB  3.5 MB/s
     http_req_blocked...............: avg=3.03µs   min=972ns   med=2.33µs  max=16.85ms  p(90)=3.68µs  p(95)=4.31µs  p(99.9)=34.87µs
     http_req_connecting............: avg=264ns    min=0s      med=0s      max=4.23ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=17.13ms  min=1.42ms  med=16.38ms max=286.74ms p(90)=25.38ms p(95)=28.67ms p(99.9)=48.76ms
       { expected_response:true }...: avg=17.13ms  min=1.42ms  med=16.38ms max=286.74ms p(90)=25.38ms p(95)=28.67ms p(99.9)=48.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 345854
     http_req_receiving.............: avg=101.96µs min=25.63µs med=46.45µs max=205.45ms p(90)=84.58µs p(95)=148.8µs p(99.9)=8.54ms 
     http_req_sending...............: avg=48.02µs  min=4.84µs  med=8.9µs   max=37.8ms   p(90)=15.33µs p(95)=94.37µs p(99.9)=6.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=16.98ms  min=1.37ms  med=16.26ms max=212.48ms p(90)=25.2ms  p(95)=28.41ms p(99.9)=47.49ms
     http_reqs......................: 345854  2877.726901/s
     iteration_duration.............: avg=17.34ms  min=1.98ms  med=16.57ms max=314.52ms p(90)=25.58ms p(95)=28.9ms  p(99.9)=49.41ms
     iterations.....................: 345754  2876.894837/s
     success_rate...................: 100.00% ✓ 345754      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 942627      ✗ 0     
     data_received..................: 28 GB   229 MB/s
     data_sent......................: 378 MB  3.1 MB/s
     http_req_blocked...............: avg=2.68µs   min=872ns   med=1.83µs   max=17.68ms  p(90)=2.91µs  p(95)=3.43µs  p(99.9)=27.46µs
     http_req_connecting............: avg=297ns    min=0s      med=0s       max=3.93ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.88ms  min=1.93ms  med=18.01ms  max=282.91ms p(90)=27.18ms p(95)=30.71ms p(99.9)=50.98ms
       { expected_response:true }...: avg=18.88ms  min=1.93ms  med=18.01ms  max=282.91ms p(90)=27.18ms p(95)=30.71ms p(99.9)=50.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 314309
     http_req_receiving.............: avg=679.52µs min=51.13µs med=102.01µs max=73.98ms  p(90)=1.72ms  p(95)=2.54ms  p(99.9)=19.41ms
     http_req_sending...............: avg=42.95µs  min=4.67µs  med=7.91µs   max=199.63ms p(90)=14.27µs p(95)=77.54µs p(99.9)=4.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.15ms  min=1.84ms  med=17.29ms  max=282.68ms p(90)=26.33ms p(95)=29.8ms  p(99.9)=49.35ms
     http_reqs......................: 314309  2613.954599/s
     iteration_duration.............: avg=19.08ms  min=2.82ms  med=18.2ms   max=299.84ms p(90)=27.39ms p(95)=30.93ms p(99.9)=51.55ms
     iterations.....................: 314209  2613.122948/s
     success_rate...................: 100.00% ✓ 314209      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 941844      ✗ 0     
     data_received..................: 28 GB   229 MB/s
     data_sent......................: 377 MB  3.1 MB/s
     http_req_blocked...............: avg=2.65µs   min=882ns   med=1.97µs  max=9.53ms   p(90)=3.15µs  p(95)=3.74µs  p(99.9)=27.4µs  
     http_req_connecting............: avg=294ns    min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.89ms  min=2.03ms  med=16.35ms max=288.22ms p(90)=30.54ms p(95)=36.95ms p(99.9)=116.48ms
       { expected_response:true }...: avg=18.89ms  min=2.03ms  med=16.35ms max=288.22ms p(90)=30.54ms p(95)=36.95ms p(99.9)=116.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 314048
     http_req_receiving.............: avg=542.59µs min=50.84µs med=88.74µs max=174.31ms p(90)=1.05ms  p(95)=1.88ms  p(99.9)=24.53ms 
     http_req_sending...............: avg=43.44µs  min=4.47µs  med=8.24µs  max=177.14ms p(90)=14.43µs p(95)=79.03µs p(99.9)=4.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.3ms   min=1.93ms  med=15.84ms max=287.69ms p(90)=29.65ms p(95)=35.92ms p(99.9)=114.86ms
     http_reqs......................: 314048  2611.379309/s
     iteration_duration.............: avg=19.1ms   min=2.96ms  med=16.54ms max=308.85ms p(90)=30.76ms p(95)=37.19ms p(99.9)=117.04ms
     iterations.....................: 313948  2610.547787/s
     success_rate...................: 100.00% ✓ 313948      ✗ 0     
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

     checks.........................: 100.00% ✓ 904632      ✗ 0     
     data_received..................: 26 GB   220 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=2.63µs   min=882ns   med=1.84µs  max=14.79ms  p(90)=2.96µs  p(95)=3.5µs   p(99.9)=25.95µs 
     http_req_connecting............: avg=303ns    min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.68ms  min=2.05ms  med=16.85ms max=285.03ms p(90)=32.05ms p(95)=38.87ms p(99.9)=129.81ms
       { expected_response:true }...: avg=19.68ms  min=2.05ms  med=16.85ms max=285.03ms p(90)=32.05ms p(95)=38.87ms p(99.9)=129.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301644
     http_req_receiving.............: avg=582.39µs min=51.53µs med=91.26µs max=165.98ms p(90)=1.08ms  p(95)=1.94ms  p(99.9)=26.37ms 
     http_req_sending...............: avg=41.6µs   min=4.57µs  med=8.06µs  max=202.76ms p(90)=13.57µs p(95)=64.49µs p(99.9)=3.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.06ms  min=1.95ms  med=16.31ms max=284.47ms p(90)=31.04ms p(95)=37.72ms p(99.9)=127.19ms
     http_reqs......................: 301644  2508.117055/s
     iteration_duration.............: avg=19.88ms  min=3.22ms  med=17.04ms max=300.19ms p(90)=32.26ms p(95)=39.09ms p(99.9)=130.81ms
     iterations.....................: 301544  2507.285573/s
     success_rate...................: 100.00% ✓ 301544      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 842253      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 338 MB  2.8 MB/s
     http_req_blocked...............: avg=3.31µs   min=942ns   med=2.38µs  max=9.56ms   p(90)=3.69µs  p(95)=4.29µs  p(99.9)=37.69µs 
     http_req_connecting............: avg=607ns    min=0s      med=0s      max=9.51ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.14ms  min=1.74ms  med=17.21ms max=395.33ms p(90)=35.56ms p(95)=44.79ms p(99.9)=172.67ms
       { expected_response:true }...: avg=21.14ms  min=1.74ms  med=17.21ms max=395.33ms p(90)=35.56ms p(95)=44.79ms p(99.9)=172.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280851
     http_req_receiving.............: avg=619.17µs min=52.14µs med=97.65µs max=196.69ms p(90)=1.09ms  p(95)=1.93ms  p(99.9)=30.42ms 
     http_req_sending...............: avg=39.72µs  min=4.8µs   med=9.15µs  max=114.43ms p(90)=15.55µs p(95)=53.25µs p(99.9)=2.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.48ms  min=1.61ms  med=16.66ms max=395.26ms p(90)=34.51ms p(95)=43.49ms p(99.9)=171.28ms
     http_reqs......................: 280851  2336.035709/s
     iteration_duration.............: avg=21.36ms  min=2.8ms   med=17.41ms max=395.5ms  p(90)=35.78ms p(95)=45.02ms p(99.9)=173.99ms
     iterations.....................: 280751  2335.203939/s
     success_rate...................: 100.00% ✓ 280751      ✗ 0     
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

     checks.........................: 100.00% ✓ 780609      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.08µs  min=882ns   med=2.15µs  max=13.81ms  p(90)=3.63µs  p(95)=4.39µs  p(99.9)=33.05µs
     http_req_connecting............: avg=345ns   min=0s      med=0s      max=3.51ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=22.83ms min=1.77ms  med=22.58ms max=306.02ms p(90)=27.08ms p(95)=28.84ms p(99.9)=48.03ms
       { expected_response:true }...: avg=22.83ms min=1.77ms  med=22.58ms max=306.02ms p(90)=27.08ms p(95)=28.84ms p(99.9)=48.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260303
     http_req_receiving.............: avg=85.14µs min=26.65µs med=53.41µs max=156.35ms p(90)=91.76µs p(95)=117µs   p(99.9)=5.36ms 
     http_req_sending...............: avg=36.05µs min=4.66µs  med=9.31µs  max=163.48ms p(90)=16.04µs p(95)=25.34µs p(99.9)=1.74ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=22.71ms min=1.67ms  med=22.49ms max=287.91ms p(90)=26.96ms p(95)=28.68ms p(99.9)=46.85ms
     http_reqs......................: 260303  2165.082083/s
     iteration_duration.............: avg=23.04ms min=3.73ms  med=22.77ms max=316.88ms p(90)=27.28ms p(95)=29.04ms p(99.9)=48.37ms
     iterations.....................: 260203  2164.250328/s
     success_rate...................: 100.00% ✓ 260203      ✗ 0     
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

     checks.........................: 100.00% ✓ 463029      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=2.92µs  min=922ns   med=2.02µs  max=4ms      p(90)=3.39µs  p(95)=4.01µs   p(99.9)=35.34µs 
     http_req_connecting............: avg=576ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=38.64ms min=2.1ms   med=38.26ms max=295.53ms p(90)=53.94ms p(95)=58.72ms  p(99.9)=80.53ms 
       { expected_response:true }...: avg=38.64ms min=2.1ms   med=38.26ms max=295.53ms p(90)=53.94ms p(95)=58.72ms  p(99.9)=80.53ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 154443
     http_req_receiving.............: avg=71.08µs min=25.97µs med=57.3µs  max=124.56ms p(90)=92.62µs p(95)=107.68µs p(99.9)=756.65µs
     http_req_sending...............: avg=19.69µs min=4.6µs   med=9.37µs  max=74.06ms  p(90)=15.26µs p(95)=18.83µs  p(99.9)=826.99µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=38.55ms min=1.99ms  med=38.17ms max=274.47ms p(90)=53.85ms p(95)=58.63ms  p(99.9)=80.3ms  
     http_reqs......................: 154443  1284.036704/s
     iteration_duration.............: avg=38.86ms min=3.13ms  med=38.46ms max=305.34ms p(90)=54.13ms p(95)=58.92ms  p(99.9)=81.19ms 
     iterations.....................: 154343  1283.205305/s
     success_rate...................: 100.00% ✓ 154343      ✗ 0     
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

     checks.........................: 100.00% ✓ 218664     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 88 MB   728 kB/s
     http_req_blocked...............: avg=4.61µs  min=1.17µs  med=3µs     max=3.54ms   p(90)=4.51µs   p(95)=5.17µs   p(99.9)=46µs    
     http_req_connecting............: avg=1.34µs  min=0s      med=0s      max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.98ms min=3.63ms  med=80.3ms  max=335.71ms p(90)=100.46ms p(95)=110.5ms  p(99.9)=190.6ms 
       { expected_response:true }...: avg=81.98ms min=3.63ms  med=80.3ms  max=335.71ms p(90)=100.46ms p(95)=110.5ms  p(99.9)=190.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 72988
     http_req_receiving.............: avg=77.56µs min=30.18µs med=67.28µs max=137.15ms p(90)=102.52µs p(95)=115.42µs p(99.9)=649.97µs
     http_req_sending...............: avg=25.35µs min=5.22µs  med=13.33µs max=166.46ms p(90)=19.89µs  p(95)=22.28µs  p(99.9)=627.35µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.88ms min=3.56ms  med=80.21ms max=335.28ms p(90)=100.35ms p(95)=110.36ms p(99.9)=189.82ms
     http_reqs......................: 72988   605.774898/s
     iteration_duration.............: avg=82.33ms min=19.37ms med=80.55ms max=343.34ms p(90)=100.71ms p(95)=110.78ms p(99.9)=191.93ms
     iterations.....................: 72888   604.944933/s
     success_rate...................: 100.00% ✓ 72888      ✗ 0    
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

     checks.........................: 100.00% ✓ 176604     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   587 kB/s
     http_req_blocked...............: avg=5.32µs   min=1.36µs  med=3.52µs   max=3.65ms   p(90)=4.97µs   p(95)=5.56µs   p(99.9)=54µs    
     http_req_connecting............: avg=1.56µs   min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.5ms  min=4.63ms  med=101.18ms max=331ms    p(90)=122.36ms p(95)=128.49ms p(99.9)=157.19ms
       { expected_response:true }...: avg=101.5ms  min=4.63ms  med=101.18ms max=331ms    p(90)=122.36ms p(95)=128.49ms p(99.9)=157.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58968
     http_req_receiving.............: avg=85.48µs  min=32.85µs med=79.34µs  max=98.1ms   p(90)=110.77µs p(95)=123.45µs p(99.9)=554.01µs
     http_req_sending...............: avg=25.85µs  min=6.22µs  med=16.53µs  max=74.37ms  p(90)=21.98µs  p(95)=24µs     p(99.9)=621.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.39ms min=4.55ms  med=101.07ms max=330.38ms p(90)=122.25ms p(95)=128.38ms p(99.9)=156.82ms
     http_reqs......................: 58968   489.071347/s
     iteration_duration.............: avg=101.94ms min=26.46ms med=101.46ms max=345.4ms  p(90)=122.65ms p(95)=128.76ms p(99.9)=158.72ms
     iterations.....................: 58868   488.241962/s
     success_rate...................: 100.00% ✓ 58868      ✗ 0    
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

     checks.........................: 100.00% ✓ 101313     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   336 kB/s
     http_req_blocked...............: avg=6.53µs   min=1.27µs  med=3.46µs   max=4.14ms   p(90)=4.75µs   p(95)=5.32µs   p(99.9)=1.34ms  
     http_req_connecting............: avg=2.82µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=176.95ms min=7.56ms  med=177.97ms max=383.09ms p(90)=197.22ms p(95)=200.41ms p(99.9)=270.16ms
       { expected_response:true }...: avg=176.95ms min=7.56ms  med=177.97ms max=383.09ms p(90)=197.22ms p(95)=200.41ms p(99.9)=270.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33871
     http_req_receiving.............: avg=100.88µs min=33.37µs med=84.9µs   max=132.62ms p(90)=114.99µs p(95)=126.05µs p(99.9)=634.06µs
     http_req_sending...............: avg=30.76µs  min=5.68µs  med=17.05µs  max=90.76ms  p(90)=21.58µs  p(95)=23.39µs  p(99.9)=537.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=176.81ms min=7.48ms  med=177.86ms max=382.9ms  p(90)=197.11ms p(95)=200.28ms p(99.9)=269.88ms
     http_reqs......................: 33871   280.087617/s
     iteration_duration.............: avg=177.75ms min=34.84ms med=178.27ms max=389.4ms  p(90)=197.5ms  p(95)=200.7ms  p(99.9)=271.08ms
     iterations.....................: 33771   279.260692/s
     success_rate...................: 100.00% ✓ 33771      ✗ 0    
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

     checks.........................: 100.00% ✓ 98673      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   328 kB/s
     http_req_blocked...............: avg=6.48µs   min=1.41µs  med=3.38µs   max=4.05ms   p(90)=4.71µs   p(95)=5.3µs    p(99.9)=1.18ms  
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.01ms  
     http_req_duration..............: avg=181.71ms min=5.87ms  med=166.74ms max=608.65ms p(90)=209.74ms p(95)=248.42ms p(99.9)=546.47ms
       { expected_response:true }...: avg=181.71ms min=5.87ms  med=166.74ms max=608.65ms p(90)=209.74ms p(95)=248.42ms p(99.9)=546.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32991
     http_req_receiving.............: avg=88.74µs  min=36.36µs med=84.12µs  max=16.46ms  p(90)=114.92µs p(95)=125.8µs  p(99.9)=645µs   
     http_req_sending...............: avg=29.15µs  min=6.34µs  med=17.32µs  max=56.86ms  p(90)=22.05µs  p(95)=23.81µs  p(99.9)=562.88µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.6ms  min=5.8ms   med=166.62ms max=608.53ms p(90)=209.63ms p(95)=248.26ms p(99.9)=546.33ms
     http_reqs......................: 32991   273.043281/s
     iteration_duration.............: avg=182.52ms min=26.12ms med=167.07ms max=608.95ms p(90)=210.09ms p(95)=249.08ms p(99.9)=546.79ms
     iterations.....................: 32891   272.215652/s
     success_rate...................: 100.00% ✓ 32891      ✗ 0    
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

     checks.........................: 100.00% ✓ 923505      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 370 MB  3.1 MB/s
     http_req_blocked...............: avg=3.92µs  min=912ns   med=2.08µs  max=74.01ms  p(90)=3.65µs  p(95)=4.41µs   p(99.9)=35.41µs
     http_req_connecting............: avg=937ns   min=0s      med=0s      max=9.2ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.27ms min=1.66ms  med=18.93ms max=276.42ms p(90)=26.73ms p(95)=29.22ms  p(99.9)=48.22ms
       { expected_response:true }...: avg=19.27ms min=1.66ms  med=18.93ms max=276.42ms p(90)=26.73ms p(95)=29.22ms  p(99.9)=48.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 307935
     http_req_receiving.............: avg=90.38µs min=25.65µs med=47.97µs max=130.5ms  p(90)=89.86µs p(95)=129.59µs p(99.9)=8.02ms 
     http_req_sending...............: avg=41.61µs min=4.56µs  med=8.75µs  max=98.45ms  p(90)=16.79µs p(95)=76.5µs   p(99.9)=3.66ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.14ms min=1.58ms  med=18.81ms max=268.16ms p(90)=26.58ms p(95)=29.01ms  p(99.9)=46.92ms
     http_reqs......................: 307935  2561.467228/s
     iteration_duration.............: avg=19.48ms min=3.08ms  med=19.12ms max=296.6ms  p(90)=26.93ms p(95)=29.44ms  p(99.9)=48.74ms
     iterations.....................: 307835  2560.635408/s
     success_rate...................: 100.00% ✓ 307835      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 869646      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 349 MB  2.9 MB/s
     http_req_blocked...............: avg=3.47µs   min=942ns   med=2.67µs   max=14.47ms  p(90)=4.3µs   p(95)=5.01µs  p(99.9)=36.14µs
     http_req_connecting............: avg=298ns    min=0s      med=0s       max=3.5ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.45ms  min=1.57ms  med=19.58ms  max=302.53ms p(90)=29.53ms p(95)=33.26ms p(99.9)=55.53ms
       { expected_response:true }...: avg=20.45ms  min=1.57ms  med=19.58ms  max=302.53ms p(90)=29.53ms p(95)=33.26ms p(99.9)=55.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289982
     http_req_receiving.............: avg=806.64µs min=53.41µs med=127.42µs max=180.95ms p(90)=2.01ms  p(95)=3.02ms  p(99.9)=21.75ms
     http_req_sending...............: avg=46.53µs  min=4.94µs  med=9.89µs   max=187.71ms p(90)=19.06µs p(95)=95.85µs p(99.9)=3.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=19.6ms   min=1.44ms  med=18.71ms  max=301.73ms p(90)=28.51ms p(95)=32.16ms p(99.9)=53.12ms
     http_reqs......................: 289982  2412.408245/s
     iteration_duration.............: avg=20.68ms  min=2.86ms  med=19.79ms  max=315.19ms p(90)=29.76ms p(95)=33.5ms  p(99.9)=56.41ms
     iterations.....................: 289882  2411.576329/s
     success_rate...................: 100.00% ✓ 289882      ✗ 0     
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

     checks.........................: 100.00% ✓ 867381      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=2.75µs   min=851ns  med=2µs     max=15.69ms  p(90)=3.52µs  p(95)=4.25µs  p(99.9)=32.33µs 
     http_req_connecting............: avg=297ns    min=0s     med=0s      max=3.34ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.53ms  min=1.54ms med=17.13ms max=303.79ms p(90)=33.64ms p(95)=41.33ms p(99.9)=153.26ms
       { expected_response:true }...: avg=20.53ms  min=1.54ms med=17.13ms max=303.79ms p(90)=33.64ms p(95)=41.33ms p(99.9)=153.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289227
     http_req_receiving.............: avg=575.18µs min=48.4µs med=93.43µs max=211.37ms p(90)=1.08ms  p(95)=1.85ms  p(99.9)=27.61ms 
     http_req_sending...............: avg=40.92µs  min=4.39µs med=8.48µs  max=171.98ms p(90)=16.92µs p(95)=70.85µs p(99.9)=3.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.91ms  min=1.42ms med=16.61ms max=303.3ms  p(90)=32.62ms p(95)=40.18ms p(99.9)=151.54ms
     http_reqs......................: 289227  2406.188782/s
     iteration_duration.............: avg=20.74ms  min=2.6ms  med=17.33ms max=304ms    p(90)=33.85ms p(95)=41.57ms p(99.9)=154.63ms
     iterations.....................: 289127  2405.356844/s
     success_rate...................: 100.00% ✓ 289127      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 848427      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 340 MB  2.8 MB/s
     http_req_blocked...............: avg=3.29µs   min=842ns   med=2.26µs  max=58.58ms  p(90)=3.8µs   p(95)=4.53µs  p(99.9)=30.82µs 
     http_req_connecting............: avg=503ns    min=0s      med=0s      max=57.02ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.98ms  min=1.59ms  med=17.4ms  max=294.85ms p(90)=34.52ms p(95)=42.67ms p(99.9)=155.02ms
       { expected_response:true }...: avg=20.98ms  min=1.59ms  med=17.4ms  max=294.85ms p(90)=34.52ms p(95)=42.67ms p(99.9)=155.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282909
     http_req_receiving.............: avg=605.31µs min=51.17µs med=97.83µs max=144.54ms p(90)=1.12ms  p(95)=1.93ms  p(99.9)=28.21ms 
     http_req_sending...............: avg=43.54µs  min=4.66µs  med=9.21µs  max=193.51ms p(90)=17.07µs p(95)=70.29µs p(99.9)=3.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.33ms  min=1.48ms  med=16.83ms max=294.74ms p(90)=33.5ms  p(95)=41.45ms p(99.9)=153.24ms
     http_reqs......................: 282909  2353.584172/s
     iteration_duration.............: avg=21.2ms   min=2.72ms  med=17.61ms max=295.04ms p(90)=34.74ms p(95)=42.9ms  p(99.9)=156.36ms
     iterations.....................: 282809  2352.752249/s
     success_rate...................: 100.00% ✓ 282809      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 835680      ✗ 0     
     data_received..................: 24 GB   203 MB/s
     data_sent......................: 335 MB  2.8 MB/s
     http_req_blocked...............: avg=3.6µs    min=1.08µs med=2.81µs   max=13.22ms  p(90)=4.51µs  p(95)=5.3µs   p(99.9)=37.21µs 
     http_req_connecting............: avg=307ns    min=0s     med=0s       max=3.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=21.3ms   min=1.79ms med=17.91ms  max=394.2ms  p(90)=34.9ms  p(95)=43.31ms p(99.9)=141.69ms
       { expected_response:true }...: avg=21.3ms   min=1.79ms med=17.91ms  max=394.2ms  p(90)=34.9ms  p(95)=43.31ms p(99.9)=141.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 278660
     http_req_receiving.............: avg=581.29µs min=51.5µs med=101.92µs max=176.86ms p(90)=1.09ms  p(95)=1.89ms  p(99.9)=28.93ms 
     http_req_sending...............: avg=43.02µs  min=4.71µs med=10.47µs  max=142.11ms p(90)=19.87µs p(95)=96.65µs p(99.9)=2.83ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.67ms  min=1.66ms med=17.39ms  max=394.06ms p(90)=33.9ms  p(95)=42.1ms  p(99.9)=139.98ms
     http_reqs......................: 278660  2317.456006/s
     iteration_duration.............: avg=21.52ms  min=2.88ms med=18.12ms  max=394.36ms p(90)=35.13ms p(95)=43.57ms p(99.9)=142.4ms 
     iterations.....................: 278560  2316.624363/s
     success_rate...................: 100.00% ✓ 278560      ✗ 0     
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

     checks.........................: 100.00% ✓ 601566      ✗ 0     
     data_received..................: 18 GB   146 MB/s
     data_sent......................: 241 MB  2.0 MB/s
     http_req_blocked...............: avg=4.03µs  min=852ns   med=2.15µs  max=9.75ms   p(90)=4.42µs   p(95)=5.49µs   p(99.9)=41.92µs
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=9.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=29.67ms min=2.28ms  med=29.1ms  max=281.04ms p(90)=39.07ms  p(95)=42.45ms  p(99.9)=65.21ms
       { expected_response:true }...: avg=29.67ms min=2.28ms  med=29.1ms  max=281.04ms p(90)=39.07ms  p(95)=42.45ms  p(99.9)=65.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 200622
     http_req_receiving.............: avg=93.82µs min=26.95µs med=55.46µs max=88.55ms  p(90)=125.48µs p(95)=198.63µs p(99.9)=3.6ms  
     http_req_sending...............: avg=42.31µs min=4.66µs  med=9.43µs  max=153.63ms p(90)=24.38µs  p(95)=103.97µs p(99.9)=3.59ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=29.53ms min=2.13ms  med=28.98ms max=280.32ms p(90)=38.92ms  p(95)=42.28ms  p(99.9)=64.48ms
     http_reqs......................: 200622  1667.878373/s
     iteration_duration.............: avg=29.91ms min=7.1ms   med=29.32ms max=312.33ms p(90)=39.29ms  p(95)=42.67ms  p(99.9)=65.64ms
     iterations.....................: 200522  1667.047019/s
     success_rate...................: 100.00% ✓ 200522      ✗ 0     
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

     checks.........................: 100.00% ✓ 443949      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=4.34µs  min=942ns   med=2.43µs  max=8.26ms   p(90)=4.02µs  p(95)=4.69µs   p(99.9)=37.74µs 
     http_req_connecting............: avg=1.54µs  min=0s      med=0s      max=8.2ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.3ms  min=2.1ms   med=39.93ms max=296.42ms p(90)=56ms    p(95)=60.74ms  p(99.9)=82.85ms 
       { expected_response:true }...: avg=40.3ms  min=2.1ms   med=39.93ms max=296.42ms p(90)=56ms    p(95)=60.74ms  p(99.9)=82.85ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148083
     http_req_receiving.............: avg=74.58µs min=26.94µs med=61.21µs max=111.25ms p(90)=99.66µs p(95)=115.85µs p(99.9)=840.79µs
     http_req_sending...............: avg=24.67µs min=4.99µs  med=11.48µs max=44.91ms  p(90)=18.97µs p(95)=22.53µs  p(99.9)=1.11ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.2ms  min=1.99ms  med=39.84ms max=295.08ms p(90)=55.9ms  p(95)=60.64ms  p(99.9)=82.73ms 
     http_reqs......................: 148083  1231.178905/s
     iteration_duration.............: avg=40.53ms min=3.78ms  med=40.15ms max=313.07ms p(90)=56.21ms p(95)=60.96ms  p(99.9)=83.16ms 
     iterations.....................: 147983  1230.347493/s
     success_rate...................: 100.00% ✓ 147983      ✗ 0     
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

     checks.........................: 100.00% ✓ 213084     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 85 MB   709 kB/s
     http_req_blocked...............: avg=4.26µs  min=1.07µs  med=2.75µs  max=3.93ms   p(90)=4.28µs   p(95)=4.93µs   p(99.9)=43.83µs 
     http_req_connecting............: avg=1.25µs  min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.12ms min=3.93ms  med=82.59ms max=320.35ms p(90)=103.37ms p(95)=113.14ms p(99.9)=197.28ms
       { expected_response:true }...: avg=84.12ms min=3.93ms  med=82.59ms max=320.35ms p(90)=103.37ms p(95)=113.14ms p(99.9)=197.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71128
     http_req_receiving.............: avg=81.02µs min=27.92µs med=71.91µs max=118.99ms p(90)=108.39µs p(95)=121.32µs p(99.9)=668.28µs
     http_req_sending...............: avg=24.82µs min=4.97µs  med=14µs    max=220.1ms  p(90)=20.83µs  p(95)=22.95µs  p(99.9)=602.5µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.02ms min=3.83ms  med=82.5ms  max=319.97ms p(90)=103.27ms p(95)=113.04ms p(99.9)=196.66ms
     http_reqs......................: 71128   590.206189/s
     iteration_duration.............: avg=84.48ms min=17.84ms med=82.84ms max=330.08ms p(90)=103.61ms p(95)=113.43ms p(99.9)=198.4ms 
     iterations.....................: 71028   589.376409/s
     success_rate...................: 100.00% ✓ 71028      ✗ 0    
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

     checks.........................: 100.00% ✓ 161025     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   535 kB/s
     http_req_blocked...............: avg=5.08µs   min=1.34µs  med=3.82µs   max=3.43ms   p(90)=5.39µs   p(95)=5.99µs   p(99.9)=76.11µs 
     http_req_connecting............: avg=941ns    min=0s      med=0s       max=2.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.31ms min=5.44ms  med=109.18ms max=327.41ms p(90)=146.98ms p(95)=158.85ms p(99.9)=202.59ms
       { expected_response:true }...: avg=111.31ms min=5.44ms  med=109.18ms max=327.41ms p(90)=146.98ms p(95)=158.85ms p(99.9)=202.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53775
     http_req_receiving.............: avg=88.85µs  min=29.07µs med=82.4µs   max=96.59ms  p(90)=113.13µs p(95)=125.47µs p(99.9)=604.88µs
     http_req_sending...............: avg=24.29µs  min=5.68µs  med=17.96µs  max=59ms     p(90)=23.56µs  p(95)=25.53µs  p(99.9)=597.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.19ms min=5.33ms  med=109.07ms max=304.62ms p(90)=146.89ms p(95)=158.72ms p(99.9)=202.48ms
     http_reqs......................: 53775   445.689564/s
     iteration_duration.............: avg=111.79ms min=35.39ms med=109.52ms max=335.78ms p(90)=147.29ms p(95)=159.16ms p(99.9)=204.76ms
     iterations.....................: 53675   444.860759/s
     success_rate...................: 100.00% ✓ 53675      ✗ 0    
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

     checks.........................: 100.00% ✓ 97887      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=5.12µs   min=1.43µs  med=3.65µs   max=1.9ms    p(90)=5.1µs    p(95)=5.72µs   p(99.9)=466.61µs
     http_req_connecting............: avg=1.19µs   min=0s      med=0s       max=1.86ms   p(90)=0s       p(95)=0s       p(99.9)=440.27µs
     http_req_duration..............: avg=183.14ms min=7.85ms  med=186.17ms max=343.58ms p(90)=204.21ms p(95)=209.29ms p(99.9)=279.11ms
       { expected_response:true }...: avg=183.14ms min=7.85ms  med=186.17ms max=343.58ms p(90)=204.21ms p(95)=209.29ms p(99.9)=279.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32729
     http_req_receiving.............: avg=98.31µs  min=33.1µs  med=90.87µs  max=51.71ms  p(90)=121.99µs p(95)=133.86µs p(99.9)=489.35µs
     http_req_sending...............: avg=29.84µs  min=6.06µs  med=18.44µs  max=84.7ms   p(90)=23.24µs  p(95)=25.29µs  p(99.9)=493µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.01ms min=7.72ms  med=186.05ms max=343.28ms p(90)=204.1ms  p(95)=209.17ms p(99.9)=278.92ms
     http_reqs......................: 32729   270.544547/s
     iteration_duration.............: avg=183.98ms min=72.46ms med=186.59ms max=355.78ms p(90)=204.51ms p(95)=209.58ms p(99.9)=280.19ms
     iterations.....................: 32629   269.717927/s
     success_rate...................: 100.00% ✓ 32629      ✗ 0    
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

     checks.........................: 100.00% ✓ 95676      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   318 kB/s
     http_req_blocked...............: avg=6.61µs   min=1.18µs  med=3.16µs   max=4.22ms   p(90)=4.5µs    p(95)=5.07µs   p(99.9)=1.44ms  
     http_req_connecting............: avg=3.19µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=187.41ms min=6.18ms  med=173.16ms max=656.03ms p(90)=218.93ms p(95)=270.11ms p(99.9)=559.79ms
       { expected_response:true }...: avg=187.41ms min=6.18ms  med=173.16ms max=656.03ms p(90)=218.93ms p(95)=270.11ms p(99.9)=559.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31992
     http_req_receiving.............: avg=92.13µs  min=32.05µs med=89.87µs  max=6.04ms   p(90)=120.16µs p(95)=131.65µs p(99.9)=479.82µs
     http_req_sending...............: avg=21.12µs  min=5.51µs  med=17.48µs  max=27.66ms  p(90)=21.88µs  p(95)=23.68µs  p(99.9)=417.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.3ms  min=6.05ms  med=173.04ms max=655.92ms p(90)=218.84ms p(95)=270ms    p(99.9)=559.69ms
     http_reqs......................: 31992   264.690204/s
     iteration_duration.............: avg=188.24ms min=35.46ms med=173.51ms max=656.27ms p(90)=219.26ms p(95)=270.67ms p(99.9)=560.1ms 
     iterations.....................: 31892   263.86284/s
     success_rate...................: 100.00% ✓ 31892      ✗ 0    
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

     checks.........................: 100.00% ✓ 7278      ✗ 0   
     data_received..................: 242 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=56.84µs min=1.22µs   med=3.07µs  max=4.86ms  p(90)=4.48µs   p(95)=5.4µs    p(99.9)=4.13ms  
     http_req_connecting............: avg=52.36µs min=0s       med=0s      max=4.56ms  p(90)=0s       p(95)=0s       p(99.9)=4.06ms  
     http_req_duration..............: avg=2.4s    min=26.29ms  med=2.46s   max=4.84s   p(90)=3.19s    p(95)=3.48s    p(99.9)=4.44s   
       { expected_response:true }...: avg=2.4s    min=26.29ms  med=2.46s   max=4.84s   p(90)=3.19s    p(95)=3.48s    p(99.9)=4.44s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2526
     http_req_receiving.............: avg=93.07µs min=30.73µs  med=89.16µs max=5.04ms  p(90)=125.63µs p(95)=140.82µs p(99.9)=418.87µs
     http_req_sending...............: avg=76.79µs min=5.6µs    med=17.94µs max=25.12ms p(90)=22.58µs  p(95)=27.37µs  p(99.9)=6.47ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.4s    min=26.13ms  med=2.46s   max=4.84s   p(90)=3.19s    p(95)=3.48s    p(99.9)=4.44s   
     http_reqs......................: 2526    19.961599/s
     iteration_duration.............: avg=2.5s    min=684.09ms med=2.48s   max=4.84s   p(90)=3.2s     p(95)=3.5s     p(99.9)=4.44s   
     iterations.....................: 2426    19.171354/s
     success_rate...................: 100.00% ✓ 2426      ✗ 0   
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

