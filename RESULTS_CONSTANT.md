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
| hive-router | v0.0.84 | 3,077 | 3,363 | 3,045 | 3.4% |  |
| fusion | 16.6.0 | 2,541 | 2,659 | 2,522 | 1.9% |  |
| grafbase | 0.53.5 | 2,148 | 2,268 | 2,136 | 2.1% |  |
| cosmo | 0.334.0 | 1,328 | 1,365 | 1,323 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.8 | 613 | 631 | 611 | 1.0% |  |
| apollo-router | v2.16.1 | 468 | 489 | 453 | 2.4% |  |
| apollo-gateway | 2.14.3 | 285 | 289 | 285 | 0.5% |  |
| hive-gateway | 2.10.8 | 285 | 292 | 283 | 1.1% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1037 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,485 | 2,755 | 2,440 | 4.8% |  |
| fusion | 16.6.0 | 2,379 | 2,496 | 2,374 | 1.8% |  |
| grafbase | 0.53.5 | 1,587 | 1,654 | 1,582 | 1.6% |  |
| cosmo | 0.334.0 | 1,182 | 1,230 | 1,177 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 596 | 615 | 593 | 1.2% |  |
| apollo-router | v2.16.1 | 448 | 465 | 446 | 1.6% |  |
| hive-gateway | 2.10.8 | 271 | 277 | 270 | 0.9% |  |
| apollo-gateway | 2.14.3 | 269 | 274 | 267 | 0.7% |  |
| feddi | 5ff8b6165878 | 23 | 24 | 22 | 3.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1109118     ✗ 0     
     data_received..................: 32 GB   270 MB/s
     data_sent......................: 444 MB  3.7 MB/s
     http_req_blocked...............: avg=2.69µs  min=902ns   med=2.06µs  max=12.43ms  p(90)=3.32µs  p(95)=3.9µs    p(99.9)=30.61µs
     http_req_connecting............: avg=255ns   min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.01ms min=1.4ms   med=15.26ms max=282.16ms p(90)=23.89ms p(95)=27.17ms  p(99.9)=47.28ms
       { expected_response:true }...: avg=16.01ms min=1.4ms   med=15.26ms max=282.16ms p(90)=23.89ms p(95)=27.17ms  p(99.9)=47.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 369806
     http_req_receiving.............: avg=88.85µs min=24.53µs med=44.57µs max=139.3ms  p(90)=81.81µs p(95)=148.12µs p(99.9)=7.82ms 
     http_req_sending...............: avg=45.84µs min=4.6µs   med=8.26µs  max=60.48ms  p(90)=14.45µs p(95)=89.82µs  p(99.9)=6.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.88ms min=1.32ms  med=15.15ms max=278.84ms p(90)=23.72ms p(95)=26.91ms  p(99.9)=46.07ms
     http_reqs......................: 369806  3077.168127/s
     iteration_duration.............: avg=16.22ms min=1.82ms  med=15.45ms max=290.79ms p(90)=24.09ms p(95)=27.4ms   p(99.9)=48.09ms
     iterations.....................: 369706  3076.336024/s
     success_rate...................: 100.00% ✓ 369706      ✗ 0     
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

     checks.........................: 100.00% ✓ 916707      ✗ 0     
     data_received..................: 27 GB   223 MB/s
     data_sent......................: 367 MB  3.1 MB/s
     http_req_blocked...............: avg=3.05µs   min=992ns   med=2.28µs  max=18.16ms  p(90)=3.43µs  p(95)=3.95µs  p(99.9)=33.24µs 
     http_req_connecting............: avg=295ns    min=0s      med=0s      max=3.87ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.41ms  min=2.04ms  med=16.6ms  max=292.5ms  p(90)=31.64ms p(95)=38.34ms p(99.9)=125.09ms
       { expected_response:true }...: avg=19.41ms  min=2.04ms  med=16.6ms  max=292.5ms  p(90)=31.64ms p(95)=38.34ms p(99.9)=125.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 305669
     http_req_receiving.............: avg=611.88µs min=52.02µs med=94.17µs max=251.61ms p(90)=1.1ms   p(95)=2ms     p(99.9)=28.16ms 
     http_req_sending...............: avg=41.22µs  min=4.58µs  med=8.64µs  max=58.79ms  p(90)=14.29µs p(95)=82.18µs p(99.9)=3.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.76ms  min=1.92ms  med=16.04ms max=292.43ms p(90)=30.67ms p(95)=37.12ms p(99.9)=120.98ms
     http_reqs......................: 305669  2541.828721/s
     iteration_duration.............: avg=19.62ms  min=3.17ms  med=16.79ms max=295.65ms p(90)=31.86ms p(95)=38.57ms p(99.9)=125.74ms
     iterations.....................: 305569  2540.997158/s
     success_rate...................: 100.00% ✓ 305569      ✗ 0     
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

     checks.........................: 100.00% ✓ 774540      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=2.94µs  min=952ns   med=2.09µs  max=12.36ms  p(90)=3.39µs  p(95)=4.04µs   p(99.9)=35.12µs
     http_req_connecting............: avg=357ns   min=0s      med=0s      max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.02ms min=1.73ms  med=22.8ms  max=297.06ms p(90)=27.17ms p(95)=28.77ms  p(99.9)=46.89ms
       { expected_response:true }...: avg=23.02ms min=1.73ms  med=22.8ms  max=297.06ms p(90)=27.17ms p(95)=28.77ms  p(99.9)=46.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258280
     http_req_receiving.............: avg=80.75µs min=27.74µs med=53.29µs max=141.78ms p(90)=88.62µs p(95)=111.71µs p(99.9)=4.15ms 
     http_req_sending...............: avg=32.97µs min=4.66µs  med=9.05µs  max=213.45ms p(90)=14.74µs p(95)=22.39µs  p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.91ms min=1.64ms  med=22.71ms max=296.34ms p(90)=27.05ms p(95)=28.63ms  p(99.9)=45.4ms 
     http_reqs......................: 258280  2148.320594/s
     iteration_duration.............: avg=23.23ms min=6.87ms  med=22.99ms max=319.13ms p(90)=27.36ms p(95)=28.97ms  p(99.9)=47.31ms
     iterations.....................: 258180  2147.488815/s
     success_rate...................: 100.00% ✓ 258180      ✗ 0     
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

     checks.........................: 100.00% ✓ 479073      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=2.96µs  min=922ns   med=2.07µs  max=4.02ms   p(90)=3.53µs  p(95)=4.16µs   p(99.9)=32.37µs 
     http_req_connecting............: avg=565ns   min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.34ms min=1.93ms  med=36.93ms max=299.72ms p(90)=52.13ms p(95)=56.79ms  p(99.9)=79.05ms 
       { expected_response:true }...: avg=37.34ms min=1.93ms  med=36.93ms max=299.72ms p(90)=52.13ms p(95)=56.79ms  p(99.9)=79.05ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159791
     http_req_receiving.............: avg=71.46µs min=25.54µs med=55.77µs max=153.41ms p(90)=90.93µs p(95)=106.02µs p(99.9)=850.95µs
     http_req_sending...............: avg=25.81µs min=4.67µs  med=9.58µs  max=172.15ms p(90)=16.47µs p(95)=20.35µs  p(99.9)=975.32µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.25ms min=1.87ms  med=36.84ms max=279.82ms p(90)=52.04ms p(95)=56.69ms  p(99.9)=78.44ms 
     http_reqs......................: 159791  1328.676509/s
     iteration_duration.............: avg=37.56ms min=3.58ms  med=37.12ms max=308.1ms  p(90)=52.33ms p(95)=56.98ms  p(99.9)=79.47ms 
     iterations.....................: 159691  1327.845/s
     success_rate...................: 100.00% ✓ 159691      ✗ 0     
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

     checks.........................: 100.00% ✓ 221616     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   737 kB/s
     http_req_blocked...............: avg=4.3µs   min=1.05µs  med=2.92µs  max=3.7ms    p(90)=4.41µs   p(95)=5.05µs   p(99.9)=44.53µs 
     http_req_connecting............: avg=1.09µs  min=0s      med=0s      max=3.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.88ms min=3.68ms  med=79.2ms  max=317.36ms p(90)=104.4ms  p(95)=115.34ms p(99.9)=198.7ms 
       { expected_response:true }...: avg=80.88ms min=3.68ms  med=79.2ms  max=317.36ms p(90)=104.4ms  p(95)=115.34ms p(99.9)=198.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 73972
     http_req_receiving.............: avg=80.66µs min=29.71µs med=70.66µs max=80.33ms  p(90)=106.69µs p(95)=119.71µs p(99.9)=622.14µs
     http_req_sending...............: avg=23.64µs min=5µs     med=13.35µs max=113.14ms p(90)=20.02µs  p(95)=22.36µs  p(99.9)=680.21µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.78ms min=3.57ms  med=79.1ms  max=306.2ms  p(90)=104.3ms  p(95)=115.22ms p(99.9)=198.45ms
     http_reqs......................: 73972   613.893743/s
     iteration_duration.............: avg=81.22ms min=13.45ms med=79.46ms max=334.52ms p(90)=104.64ms p(95)=115.6ms  p(99.9)=199.93ms
     iterations.....................: 73872   613.063843/s
     success_rate...................: 100.00% ✓ 73872      ✗ 0    
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

     checks.........................: 100.00% ✓ 169197     ✗ 0    
     data_received..................: 5.0 GB  41 MB/s
     data_sent......................: 68 MB   563 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.19µs  med=3.49µs   max=3.67ms   p(90)=4.91µs   p(95)=5.49µs   p(99.9)=100.27µs
     http_req_connecting............: avg=1.62µs   min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=105.94ms min=4.78ms  med=105.68ms max=308.04ms p(90)=128.57ms p(95)=135.53ms p(99.9)=168.43ms
       { expected_response:true }...: avg=105.94ms min=4.78ms  med=105.68ms max=308.04ms p(90)=128.57ms p(95)=135.53ms p(99.9)=168.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 56499
     http_req_receiving.............: avg=84.21µs  min=32.75µs med=80.54µs  max=2.52ms   p(90)=111.4µs  p(95)=124.3µs  p(99.9)=551.51µs
     http_req_sending...............: avg=27.73µs  min=6.34µs  med=17.23µs  max=129.12ms p(90)=22.53µs  p(95)=24.38µs  p(99.9)=624.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.83ms min=4.67ms  med=105.58ms max=307.36ms p(90)=128.46ms p(95)=135.42ms p(99.9)=167.87ms
     http_reqs......................: 56499   468.451112/s
     iteration_duration.............: avg=106.42ms min=13.21ms med=105.98ms max=322.55ms p(90)=128.87ms p(95)=135.81ms p(99.9)=171.21ms
     iterations.....................: 56399   467.621981/s
     success_rate...................: 100.00% ✓ 56399      ✗ 0    
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

     checks.........................: 100.00% ✓ 103287     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   343 kB/s
     http_req_blocked...............: avg=5.19µs   min=1.25µs  med=3.3µs    max=4.27ms   p(90)=4.63µs   p(95)=5.17µs   p(99.9)=396.42µs
     http_req_connecting............: avg=1.51µs   min=0s      med=0s       max=3.12ms   p(90)=0s       p(95)=0s       p(99.9)=372.31µs
     http_req_duration..............: avg=173.57ms min=7.32ms  med=175.29ms max=352.06ms p(90)=183.78ms p(95)=188.32ms p(99.9)=252.1ms 
       { expected_response:true }...: avg=173.57ms min=7.32ms  med=175.29ms max=352.06ms p(90)=183.78ms p(95)=188.32ms p(99.9)=252.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 34529
     http_req_receiving.............: avg=98.03µs  min=34.13µs med=86.33µs  max=176.96ms p(90)=116.2µs  p(95)=127.5µs  p(99.9)=569µs   
     http_req_sending...............: avg=30.99µs  min=5.99µs  med=17.66µs  max=105.71ms p(90)=22.23µs  p(95)=24.06µs  p(99.9)=473.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.44ms min=7.19ms  med=175.17ms max=339.28ms p(90)=183.66ms p(95)=188.2ms  p(99.9)=251.88ms
     http_reqs......................: 34529   285.588002/s
     iteration_duration.............: avg=174.36ms min=51.98ms med=175.69ms max=357.78ms p(90)=184.09ms p(95)=188.62ms p(99.9)=253.21ms
     iterations.....................: 34429   284.760906/s
     success_rate...................: 100.00% ✓ 34429      ✗ 0    
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

     checks.........................: 100.00% ✓ 102984     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   342 kB/s
     http_req_blocked...............: avg=6.75µs   min=1.35µs  med=3.75µs   max=4.02ms   p(90)=5.29µs   p(95)=5.92µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=2.71µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=174.07ms min=5.5ms   med=158.85ms max=636.2ms  p(90)=201.7ms  p(95)=244.57ms p(99.9)=548.97ms
       { expected_response:true }...: avg=174.07ms min=5.5ms   med=158.85ms max=636.2ms  p(90)=201.7ms  p(95)=244.57ms p(99.9)=548.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34428
     http_req_receiving.............: avg=97.64µs  min=37.36µs med=90.44µs  max=111.92ms p(90)=120.81µs p(95)=132.62µs p(99.9)=742.66µs
     http_req_sending...............: avg=34.14µs  min=6.9µs   med=19.21µs  max=77.51ms  p(90)=24.07µs  p(95)=25.95µs  p(99.9)=525.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.94ms min=5.37ms  med=158.72ms max=636.09ms p(90)=201.56ms p(95)=244.39ms p(99.9)=548.85ms
     http_reqs......................: 34428   285.076969/s
     iteration_duration.............: avg=174.86ms min=48.25ms med=159.21ms max=636.47ms p(90)=202.15ms p(95)=245.65ms p(99.9)=549.23ms
     iterations.....................: 34328   284.248931/s
     success_rate...................: 100.00% ✓ 34328      ✗ 0    
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

     checks.........................: 100.00% ✓ 896202      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=3.58µs  min=962ns   med=2.76µs  max=15.84ms  p(90)=4.43µs  p(95)=5.22µs   p(99.9)=39.53µs
     http_req_connecting............: avg=288ns   min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.84ms min=1.69ms  med=19.38ms max=293.63ms p(90)=28.04ms p(95)=30.7ms   p(99.9)=50.32ms
       { expected_response:true }...: avg=19.84ms min=1.69ms  med=19.38ms max=293.63ms p(90)=28.04ms p(95)=30.7ms   p(99.9)=50.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298834
     http_req_receiving.............: avg=96.97µs min=25.94µs med=55.34µs max=201.31ms p(90)=98.93µs p(95)=155.59µs p(99.9)=6.92ms 
     http_req_sending...............: avg=46.66µs min=5.15µs  med=10.92µs max=120.83ms p(90)=18.82µs p(95)=102.05µs p(99.9)=3.46ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.7ms  min=1.64ms  med=19.26ms max=292.95ms p(90)=27.89ms p(95)=30.5ms   p(99.9)=49.36ms
     http_reqs......................: 298834  2485.830433/s
     iteration_duration.............: avg=20.07ms min=3.18ms  med=19.59ms max=306.11ms p(90)=28.26ms p(95)=30.94ms  p(99.9)=50.92ms
     iterations.....................: 298734  2484.998589/s
     success_rate...................: 100.00% ✓ 298734      ✗ 0     
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

     checks.........................: 100.00% ✓ 857745      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.12µs   min=851ns   med=2.41µs  max=16.25ms  p(90)=3.92µs  p(95)=4.6µs   p(99.9)=30.83µs 
     http_req_connecting............: avg=145ns    min=0s      med=0s      max=1.85ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.76ms  min=1.6ms   med=17.28ms max=349.63ms p(90)=34.06ms p(95)=42ms    p(99.9)=158.96ms
       { expected_response:true }...: avg=20.76ms  min=1.6ms   med=17.28ms max=349.63ms p(90)=34.06ms p(95)=42ms    p(99.9)=158.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286015
     http_req_receiving.............: avg=608.02µs min=51.61µs med=97.99µs max=187.78ms p(90)=1.11ms  p(95)=1.9ms   p(99.9)=28.99ms 
     http_req_sending...............: avg=41.87µs  min=4.63µs  med=9.27µs  max=153.55ms p(90)=16.93µs p(95)=72.56µs p(99.9)=3.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.11ms  min=1.52ms  med=16.74ms max=349.53ms p(90)=33.03ms p(95)=40.84ms p(99.9)=154.53ms
     http_reqs......................: 286015  2379.147986/s
     iteration_duration.............: avg=20.97ms  min=2.64ms  med=17.48ms max=349.87ms p(90)=34.28ms p(95)=42.23ms p(99.9)=159.38ms
     iterations.....................: 285915  2378.31616/s
     success_rate...................: 100.00% ✓ 285915      ✗ 0     
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

     checks.........................: 100.00% ✓ 572496      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.31µs  min=891ns   med=2.26µs  max=4.16ms   p(90)=4.4µs    p(95)=5.53µs   p(99.9)=39.92µs
     http_req_connecting............: avg=493ns   min=0s      med=0s      max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.19ms min=2.24ms  med=30.66ms max=312.77ms p(90)=41.08ms  p(95)=44.59ms  p(99.9)=64.98ms
       { expected_response:true }...: avg=31.19ms min=2.24ms  med=30.66ms max=312.77ms p(90)=41.08ms  p(95)=44.59ms  p(99.9)=64.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190932
     http_req_receiving.............: avg=94.35µs min=27.67µs med=55.44µs max=131.86ms p(90)=125.45µs p(95)=199.05µs p(99.9)=3.58ms 
     http_req_sending...............: avg=38.19µs min=4.75µs  med=9.53µs  max=69.21ms  p(90)=23.68µs  p(95)=102.4µs  p(99.9)=2.57ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.05ms min=2.16ms  med=30.54ms max=312.04ms p(90)=40.93ms  p(95)=44.42ms  p(99.9)=64.51ms
     http_reqs......................: 190932  1587.315566/s
     iteration_duration.............: avg=31.43ms min=6.13ms  med=30.88ms max=321.03ms p(90)=41.3ms   p(95)=44.81ms  p(99.9)=65.42ms
     iterations.....................: 190832  1586.484215/s
     success_rate...................: 100.00% ✓ 190832      ✗ 0     
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

     checks.........................: 100.00% ✓ 426282      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.95µs  min=1.07µs  med=2.92µs  max=3.84ms   p(90)=4.56µs   p(95)=5.3µs    p(99.9)=37.5µs  
     http_req_connecting............: avg=715ns   min=0s      med=0s      max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.95ms min=2.15ms  med=41.54ms max=328.25ms p(90)=58.32ms  p(95)=63.49ms  p(99.9)=86.92ms 
       { expected_response:true }...: avg=41.95ms min=2.15ms  med=41.54ms max=328.25ms p(90)=58.32ms  p(95)=63.49ms  p(99.9)=86.92ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142194
     http_req_receiving.............: avg=89.2µs  min=26.03µs med=73.34µs max=215.34ms p(90)=114.21µs p(95)=131.77µs p(99.9)=900.47µs
     http_req_sending...............: avg=28.06µs min=5.21µs  med=12.7µs  max=155.31ms p(90)=19.27µs  p(95)=23.06µs  p(99.9)=1.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.84ms min=2.04ms  med=41.43ms max=328ms    p(90)=58.2ms   p(95)=63.38ms  p(99.9)=86.38ms 
     http_reqs......................: 142194  1182.055137/s
     iteration_duration.............: avg=42.21ms min=4.52ms  med=41.77ms max=339.08ms p(90)=58.55ms  p(95)=63.72ms  p(99.9)=87.31ms 
     iterations.....................: 142094  1181.223839/s
     success_rate...................: 100.00% ✓ 142094      ✗ 0     
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

     checks.........................: 100.00% ✓ 215421     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   717 kB/s
     http_req_blocked...............: avg=3.56µs  min=1.03µs  med=2.79µs  max=1.7ms    p(90)=4.32µs   p(95)=4.95µs   p(99.9)=44.94µs 
     http_req_connecting............: avg=539ns   min=0s      med=0s      max=1.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.21ms min=4ms     med=82.59ms max=304.43ms p(90)=104.4ms  p(95)=114.6ms  p(99.9)=199.69ms
       { expected_response:true }...: avg=83.21ms min=4ms     med=82.59ms max=304.43ms p(90)=104.4ms  p(95)=114.6ms  p(99.9)=199.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71907
     http_req_receiving.............: avg=83.82µs min=28.73µs med=75.24µs max=90.76ms  p(90)=111.72µs p(95)=125.04µs p(99.9)=629.86µs
     http_req_sending...............: avg=23.01µs min=4.9µs   med=14.02µs max=77.82ms  p(90)=20.64µs  p(95)=22.87µs  p(99.9)=606.15µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.1ms  min=3.88ms  med=82.49ms max=304.22ms p(90)=104.3ms  p(95)=114.49ms p(99.9)=199.63ms
     http_reqs......................: 71907   596.651412/s
     iteration_duration.............: avg=83.56ms min=21.87ms med=82.85ms max=324.67ms p(90)=104.65ms p(95)=114.88ms p(99.9)=201.29ms
     iterations.....................: 71807   595.821658/s
     success_rate...................: 100.00% ✓ 71807      ✗ 0    
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

     checks.........................: 100.00% ✓ 162129     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=5.68µs   min=1.32µs  med=3.7µs    max=3.7ms    p(90)=5.24µs   p(95)=5.89µs   p(99.9)=138.03µs
     http_req_connecting............: avg=1.69µs   min=0s      med=0s       max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.56ms min=5.34ms  med=108.36ms max=319.31ms p(90)=145.75ms p(95)=156.68ms p(99.9)=200.21ms
       { expected_response:true }...: avg=110.56ms min=5.34ms  med=108.36ms max=319.31ms p(90)=145.75ms p(95)=156.68ms p(99.9)=200.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54143
     http_req_receiving.............: avg=87.75µs  min=31.36µs med=83.98µs  max=7.41ms   p(90)=115.38µs p(95)=127.72µs p(99.9)=633.87µs
     http_req_sending...............: avg=24.79µs  min=6.09µs  med=18.13µs  max=64.84ms  p(90)=23.53µs  p(95)=25.57µs  p(99.9)=547.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.44ms min=5.25ms  med=108.24ms max=318.98ms p(90)=145.63ms p(95)=156.57ms p(99.9)=200.1ms 
     http_reqs......................: 54143   448.710004/s
     iteration_duration.............: avg=111.04ms min=19.79ms med=108.69ms max=336.6ms  p(90)=146.07ms p(95)=157.01ms p(99.9)=201.87ms
     iterations.....................: 54043   447.881254/s
     success_rate...................: 100.00% ✓ 54043      ✗ 0    
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

     checks.........................: 100.00% ✓ 98337      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   326 kB/s
     http_req_blocked...............: avg=6.89µs   min=1.45µs  med=3.72µs   max=3.54ms   p(90)=5.16µs   p(95)=5.81µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=2.87µs   min=0s      med=0s       max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=182.33ms min=5.99ms  med=167.77ms max=642.25ms p(90)=212.15ms p(95)=256.8ms  p(99.9)=536.26ms
       { expected_response:true }...: avg=182.33ms min=5.99ms  med=167.77ms max=642.25ms p(90)=212.15ms p(95)=256.8ms  p(99.9)=536.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32879
     http_req_receiving.............: avg=96.58µs  min=36.5µs  med=92.78µs  max=13.93ms  p(90)=124.71µs p(95)=137.37µs p(99.9)=509.99µs
     http_req_sending...............: avg=25.73µs  min=6.22µs  med=19.24µs  max=49.19ms  p(90)=23.99µs  p(95)=25.86µs  p(99.9)=526.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.21ms min=5.89ms  med=167.66ms max=642.16ms p(90)=212.03ms p(95)=256.63ms p(99.9)=536.16ms
     http_reqs......................: 32879   271.807118/s
     iteration_duration.............: avg=183.15ms min=42.32ms med=168.14ms max=642.45ms p(90)=212.48ms p(95)=258.19ms p(99.9)=536.54ms
     iterations.....................: 32779   270.980429/s
     success_rate...................: 100.00% ✓ 32779      ✗ 0    
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

     checks.........................: 100.00% ✓ 97425      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   323 kB/s
     http_req_blocked...............: avg=6.82µs   min=1.34µs  med=3.65µs   max=4.05ms   p(90)=5.02µs   p(95)=5.59µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=184.02ms min=7.75ms  med=183.27ms max=371.57ms p(90)=194.68ms p(95)=198.66ms p(99.9)=262.94ms
       { expected_response:true }...: avg=184.02ms min=7.75ms  med=183.27ms max=371.57ms p(90)=194.68ms p(95)=198.66ms p(99.9)=262.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32575
     http_req_receiving.............: avg=98.15µs  min=34.79µs med=88.85µs  max=79.17ms  p(90)=121.14µs p(95)=134.4µs  p(99.9)=755.78µs
     http_req_sending...............: avg=27.77µs  min=6.04µs  med=18.25µs  max=54.24ms  p(90)=23.02µs  p(95)=24.83µs  p(99.9)=548.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.89ms min=7.62ms  med=183.16ms max=371.43ms p(90)=194.56ms p(95)=198.54ms p(99.9)=262.83ms
     http_reqs......................: 32575   269.280521/s
     iteration_duration.............: avg=184.86ms min=35.5ms  med=183.55ms max=377.64ms p(90)=194.98ms p(95)=199ms    p(99.9)=264.14ms
     iterations.....................: 32475   268.453873/s
     success_rate...................: 100.00% ✓ 32475      ✗ 0    
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

     checks.........................: 100.00% ✓ 8472      ✗ 0   
     data_received..................: 280 MB  2.2 MB/s
     data_sent......................: 3.5 MB  28 kB/s
     http_req_blocked...............: avg=109.09µs min=1.18µs   med=3.37µs  max=10.67ms p(90)=4.92µs   p(95)=5.58µs   p(99.9)=10.26ms 
     http_req_connecting............: avg=101.82µs min=0s       med=0s      max=10.62ms p(90)=0s       p(95)=0s       p(99.9)=10.23ms 
     http_req_duration..............: avg=2.06s    min=27.42ms  med=2.11s   max=4.25s   p(90)=2.73s    p(95)=2.99s    p(99.9)=3.98s   
       { expected_response:true }...: avg=2.06s    min=27.42ms  med=2.11s   max=4.25s   p(90)=2.73s    p(95)=2.99s    p(99.9)=3.98s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2924
     http_req_receiving.............: avg=106.19µs min=34.18µs  med=97.06µs max=12.34ms p(90)=137.18µs p(95)=152.38µs p(99.9)=664.07µs
     http_req_sending...............: avg=47.54µs  min=5.46µs   med=19.36µs max=8.91ms  p(90)=24.39µs  p(95)=27.38µs  p(99.9)=3.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.06s    min=27.32ms  med=2.11s   max=4.25s   p(90)=2.73s    p(95)=2.99s    p(99.9)=3.98s   
     http_reqs......................: 2924    23.28982/s
     iteration_duration.............: avg=2.14s    min=576.66ms med=2.13s   max=4.25s   p(90)=2.75s    p(95)=3s       p(99.9)=4s      
     iterations.....................: 2824    22.493314/s
     success_rate...................: 100.00% ✓ 2824      ✗ 0   
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

