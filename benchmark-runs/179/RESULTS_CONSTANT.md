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
| hive-router | v0.0.49 | 2,913 | 3,093 | 2,859 | 2.6% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,101 | 2,150 | 2,088 | 1.0% |  |
| grafbase | 0.53.3 | 2,043 | 2,099 | 2,022 | 1.3% |  |
| cosmo | 0.307.0 | 1,242 | 1,267 | 1,235 | 0.9% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 535 | 546 | 531 | 0.9% |  |
| apollo-router | v2.13.1 | 399 | 412 | 394 | 1.5% |  |
| hive-gateway | 2.5.25 | 245 | 248 | 243 | 0.7% |  |
| apollo-gateway | 2.13.3 | 242 | 245 | 242 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,369 | 2,504 | 2,338 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,933 | 1,968 | 1,912 | 1.1% |  |
| grafbase | 0.53.3 | 1,510 | 1,537 | 1,490 | 1.1% |  |
| cosmo | 0.307.0 | 1,209 | 1,226 | 1,200 | 0.8% | non-compatible response (2 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 515 | 528 | 509 | 1.2% |  |
| apollo-router | v2.13.1 | 369 | 381 | 364 | 1.5% |  |
| hive-gateway | 2.5.25 | 248 | 252 | 246 | 0.8% |  |
| apollo-gateway | 2.13.3 | 235 | 239 | 232 | 0.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1050291     ✗ 0     
     data_received..................: 31 GB   256 MB/s
     data_sent......................: 421 MB  3.5 MB/s
     http_req_blocked...............: avg=2.85µs   min=972ns   med=1.98µs  max=17.4ms   p(90)=3.06µs  p(95)=3.66µs   p(99.9)=30.33µs
     http_req_connecting............: avg=361ns    min=0s      med=0s      max=5.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.9ms   min=1.67ms  med=15.95ms max=334.73ms p(90)=25.22ms p(95)=29.08ms  p(99.9)=52.21ms
       { expected_response:true }...: avg=16.9ms   min=1.67ms  med=15.95ms max=334.73ms p(90)=25.22ms p(95)=29.08ms  p(99.9)=52.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 350197
     http_req_receiving.............: avg=123.77µs min=27.91µs med=48.11µs max=176.24ms p(90)=92.48µs p(95)=262.07µs p(99.9)=12.86ms
     http_req_sending...............: avg=61.47µs  min=5.26µs  med=8.84µs  max=197.08ms p(90)=14.82µs p(95)=118.01µs p(99.9)=14.4ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.71ms  min=1.59ms  med=15.8ms  max=334.5ms  p(90)=24.95ms p(95)=28.7ms   p(99.9)=50.81ms
     http_reqs......................: 350197  2913.327267/s
     iteration_duration.............: avg=17.12ms  min=2.08ms  med=16.15ms max=356.11ms p(90)=25.44ms p(95)=29.34ms  p(99.9)=53.16ms
     iterations.....................: 350097  2912.495356/s
     success_rate...................: 100.00% ✓ 350097      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 757998      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 304 MB  2.5 MB/s
     http_req_blocked...............: avg=2.73µs   min=972ns   med=2.01µs   max=9.73ms   p(90)=3.03µs   p(95)=3.57µs  p(99.9)=25.2µs  
     http_req_connecting............: avg=405ns    min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.51ms  min=2.41ms  med=14.74ms  max=300.99ms p(90)=53.33ms  p(95)=71.58ms p(99.9)=166.29ms
       { expected_response:true }...: avg=23.51ms  min=2.41ms  med=14.74ms  max=300.99ms p(90)=53.33ms  p(95)=71.58ms p(99.9)=166.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252766
     http_req_receiving.............: avg=650.97µs min=51.62µs med=108.12µs max=174.9ms  p(90)=943.61µs p(95)=1.44ms  p(99.9)=60.36ms 
     http_req_sending...............: avg=41.63µs  min=5.21µs  med=8.95µs   max=151.6ms  p(90)=14.48µs  p(95)=98.46µs p(99.9)=2.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.81ms  min=2.32ms  med=14.22ms  max=300.42ms p(90)=51.94ms  p(95)=70.19ms p(99.9)=164.05ms
     http_reqs......................: 252766  2101.324696/s
     iteration_duration.............: avg=23.73ms  min=3.41ms  med=14.96ms  max=337.71ms p(90)=53.54ms  p(95)=71.82ms p(99.9)=167.35ms
     iterations.....................: 252666  2100.493364/s
     success_rate...................: 100.00% ✓ 252666      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 737001      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 295 MB  2.5 MB/s
     http_req_blocked...............: avg=3.18µs   min=962ns   med=2.19µs  max=15.81ms  p(90)=3.5µs   p(95)=4.23µs   p(99.9)=41.68µs
     http_req_connecting............: avg=411ns    min=0s      med=0s      max=4.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.18ms  min=1.97ms  med=23.93ms max=322.52ms p(90)=28.92ms p(95)=31.04ms  p(99.9)=52.85ms
       { expected_response:true }...: avg=24.18ms  min=1.97ms  med=23.93ms max=322.52ms p(90)=28.92ms p(95)=31.04ms  p(99.9)=52.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245767
     http_req_receiving.............: avg=106.55µs min=29.88µs med=58.82µs max=69.75ms  p(90)=100µs   p(95)=172.55µs p(99.9)=8.47ms 
     http_req_sending...............: avg=42.44µs  min=4.88µs  med=9.85µs  max=174.91ms p(90)=16.65µs p(95)=107.28µs p(99.9)=2.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.03ms  min=1.87ms  med=23.81ms max=313.12ms p(90)=28.76ms p(95)=30.8ms   p(99.9)=51.65ms
     http_reqs......................: 245767  2043.770891/s
     iteration_duration.............: avg=24.41ms  min=3.78ms  med=24.14ms max=335.2ms  p(90)=29.14ms p(95)=31.27ms  p(99.9)=53.4ms 
     iterations.....................: 245667  2042.939303/s
     success_rate...................: 100.00% ✓ 245667      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 447999      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=2.86µs   min=1.03µs  med=2.07µs  max=3.86ms   p(90)=3.21µs  p(95)=3.79µs  p(99.9)=33.01µs
     http_req_connecting............: avg=517ns    min=0s      med=0s      max=3.82ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=39.95ms  min=2.14ms  med=39.33ms max=319.3ms  p(90)=56.48ms p(95)=61.56ms p(99.9)=85.62ms
       { expected_response:true }...: avg=39.95ms  min=2.14ms  med=39.33ms max=319.3ms  p(90)=56.48ms p(95)=61.56ms p(99.9)=85.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149433
     http_req_receiving.............: avg=125.34µs min=28.12µs med=58.47µs max=255.4ms  p(90)=91.19µs p(95)=107.4µs p(99.9)=2.16ms 
     http_req_sending...............: avg=23.23µs  min=4.87µs  med=9.79µs  max=106.55ms p(90)=14.63µs p(95)=18.48µs p(99.9)=1.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=39.8ms   min=2.06ms  med=39.24ms max=103.45ms p(90)=56.36ms p(95)=61.43ms p(99.9)=82.41ms
     http_reqs......................: 149433  1242.421121/s
     iteration_duration.............: avg=40.17ms  min=3.37ms  med=39.53ms max=339.57ms p(90)=56.67ms p(95)=61.75ms p(99.9)=86.04ms
     iterations.....................: 149333  1241.589698/s
     success_rate...................: 100.00% ✓ 149333      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 193287     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   643 kB/s
     http_req_blocked...............: avg=4.69µs  min=1.14µs  med=2.5µs   max=4.71ms   p(90)=4.01µs   p(95)=4.57µs   p(99.9)=45.4µs  
     http_req_connecting............: avg=1.85µs  min=0s      med=0s      max=4.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.77ms min=4.09ms  med=88.94ms max=341.42ms p(90)=116.4ms  p(95)=131.42ms p(99.9)=226.2ms 
       { expected_response:true }...: avg=92.77ms min=4.09ms  med=88.94ms max=341.42ms p(90)=116.4ms  p(95)=131.42ms p(99.9)=226.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 64529
     http_req_receiving.............: avg=89.46µs min=31.5µs  med=71.45µs max=270.05ms p(90)=106.03µs p(95)=118.74µs p(99.9)=828.14µs
     http_req_sending...............: avg=26.76µs min=5.59µs  med=11.87µs max=150.51ms p(90)=18.44µs  p(95)=20.48µs  p(99.9)=661.21µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.65ms min=3.98ms  med=88.84ms max=341.11ms p(90)=116.28ms p(95)=131.23ms p(99.9)=225.86ms
     http_reqs......................: 64529   535.356544/s
     iteration_duration.............: avg=93.14ms min=39.91ms med=89.18ms max=367.36ms p(90)=116.63ms p(95)=131.7ms  p(99.9)=229.14ms
     iterations.....................: 64429   534.526907/s
     success_rate...................: 100.00% ✓ 64429      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 144435     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   480 kB/s
     http_req_blocked...............: avg=4.38µs   min=1.13µs  med=3.12µs   max=2.71ms   p(90)=4.49µs   p(95)=5.04µs   p(99.9)=167.95µs
     http_req_connecting............: avg=1.05µs   min=0s      med=0s       max=2.66ms   p(90)=0s       p(95)=0s       p(99.9)=84.92µs 
     http_req_duration..............: avg=124.16ms min=5.35ms  med=123.88ms max=326.03ms p(90)=150.32ms p(95)=158.03ms p(99.9)=193.51ms
       { expected_response:true }...: avg=124.16ms min=5.35ms  med=123.88ms max=326.03ms p(90)=150.32ms p(95)=158.03ms p(99.9)=193.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48245
     http_req_receiving.............: avg=146.48µs min=32.09µs med=79.59µs  max=137.06ms p(90)=111.36µs p(95)=123.27µs p(99.9)=1.66ms  
     http_req_sending...............: avg=27.32µs  min=6.04µs  med=14.15µs  max=177.82ms p(90)=19.65µs  p(95)=21.55µs  p(99.9)=593.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.98ms min=5.25ms  med=123.76ms max=214.78ms p(90)=150.16ms p(95)=157.85ms p(99.9)=191.41ms
     http_reqs......................: 48245   399.716899/s
     iteration_duration.............: avg=124.65ms min=8.35ms  med=124.15ms max=354.69ms p(90)=150.58ms p(95)=158.27ms p(99.9)=198.7ms 
     iterations.....................: 48145   398.888385/s
     success_rate...................: 100.00% ✓ 48145      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88611      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=7.37µs   min=1.21µs  med=3.42µs   max=4.25ms   p(90)=4.8µs    p(95)=5.4µs    p(99.9)=2ms     
     http_req_connecting............: avg=3.76µs   min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=1.97ms  
     http_req_duration..............: avg=202.29ms min=6.35ms  med=185.22ms max=695.81ms p(90)=254.83ms p(95)=378.29ms p(99.9)=573.7ms 
       { expected_response:true }...: avg=202.29ms min=6.35ms  med=185.22ms max=695.81ms p(90)=254.83ms p(95)=378.29ms p(99.9)=573.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29637
     http_req_receiving.............: avg=97.83µs  min=36.32µs med=92.81µs  max=10.43ms  p(90)=125.32µs p(95)=138.68µs p(99.9)=669.42µs
     http_req_sending...............: avg=28.37µs  min=6.36µs  med=16.29µs  max=114.66ms p(90)=21.54µs  p(95)=23.55µs  p(99.9)=496.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.17ms min=6.22ms  med=185.11ms max=695.73ms p(90)=254.69ms p(95)=378.18ms p(99.9)=573.6ms 
     http_reqs......................: 29637   245.147975/s
     iteration_duration.............: avg=203.25ms min=56.99ms med=185.73ms max=695.99ms p(90)=255.26ms p(95)=378.97ms p(99.9)=574ms   
     iterations.....................: 29537   244.320806/s
     success_rate...................: 100.00% ✓ 29537      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87882      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7.14µs   min=1.18µs  med=3.25µs   max=4.05ms   p(90)=4.51µs   p(95)=5.01µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=203.98ms min=8.52ms  med=203.79ms max=427.27ms p(90)=213.26ms p(95)=220.71ms p(99.9)=287.69ms
       { expected_response:true }...: avg=203.98ms min=8.52ms  med=203.79ms max=427.27ms p(90)=213.26ms p(95)=220.71ms p(99.9)=287.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29394
     http_req_receiving.............: avg=199.79µs min=32.29µs med=87.54µs  max=248.74ms p(90)=118.41µs p(95)=129.86µs p(99.9)=1.46ms  
     http_req_sending...............: avg=21.95µs  min=6.09µs  med=15.55µs  max=34.03ms  p(90)=20.35µs  p(95)=22.01µs  p(99.9)=495.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.76ms min=8.38ms  med=203.65ms max=368.81ms p(90)=213.07ms p(95)=220.5ms  p(99.9)=284.66ms
     http_reqs......................: 29394   242.787324/s
     iteration_duration.............: avg=204.94ms min=51.71ms med=204.07ms max=444.85ms p(90)=213.53ms p(95)=221.1ms  p(99.9)=292.83ms
     iterations.....................: 29294   241.961348/s
     success_rate...................: 100.00% ✓ 29294      ✗ 0    
     vus............................: 34      min=34       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 854226      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=2.89µs   min=951ns   med=2.11µs  max=11.1ms   p(90)=3.42µs  p(95)=4.19µs   p(99.9)=32.66µs
     http_req_connecting............: avg=360ns    min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.83ms  min=1.74ms  med=20.36ms max=343.03ms p(90)=28.86ms p(95)=31.96ms  p(99.9)=53.48ms
       { expected_response:true }...: avg=20.83ms  min=1.74ms  med=20.36ms max=343.03ms p(90)=28.86ms p(95)=31.96ms  p(99.9)=53.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284842
     http_req_receiving.............: avg=144.69µs min=28.51µs med=53.63µs max=303.69ms p(90)=100.4µs p(95)=250.09µs p(99.9)=11.74ms
     http_req_sending...............: avg=50.25µs  min=5.04µs  med=9.54µs  max=76.61ms  p(90)=17.4µs  p(95)=121.26µs p(99.9)=4.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.64ms  min=1.65ms  med=20.22ms max=108.1ms  p(90)=28.66ms p(95)=31.66ms  p(99.9)=51.18ms
     http_reqs......................: 284842  2369.203954/s
     iteration_duration.............: avg=21.06ms  min=3.11ms  med=20.57ms max=354.03ms p(90)=29.08ms p(95)=32.2ms   p(99.9)=54.18ms
     iterations.....................: 284742  2368.372193/s
     success_rate...................: 100.00% ✓ 284742      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 699219      ✗ 0     
     data_received..................: 20 GB   170 MB/s
     data_sent......................: 280 MB  2.3 MB/s
     http_req_blocked...............: avg=3µs      min=942ns   med=2.15µs   max=7.63ms   p(90)=3.5µs   p(95)=4.19µs   p(99.9)=33.55µs 
     http_req_connecting............: avg=429ns    min=0s      med=0s       max=4.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.5ms   min=1.99ms  med=17.25ms  max=596.71ms p(90)=54.45ms p(95)=72.12ms  p(99.9)=189.38ms
       { expected_response:true }...: avg=25.5ms   min=1.99ms  med=17.25ms  max=596.71ms p(90)=54.45ms p(95)=72.12ms  p(99.9)=189.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 233173
     http_req_receiving.............: avg=700.88µs min=50.44µs med=105.53µs max=238.23ms p(90)=1.12ms  p(95)=1.81ms   p(99.9)=60.67ms 
     http_req_sending...............: avg=44.5µs   min=5.33µs  med=9.34µs   max=169.88ms p(90)=17.31µs p(95)=106.87µs p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.75ms  min=1.87ms  med=16.7ms   max=596.61ms p(90)=53.08ms p(95)=70.55ms  p(99.9)=184.12ms
     http_reqs......................: 233173  1933.3215/s
     iteration_duration.............: avg=25.73ms  min=2.76ms  med=17.47ms  max=596.91ms p(90)=54.68ms p(95)=72.36ms  p(99.9)=192.77ms
     iterations.....................: 233073  1932.492364/s
     success_rate...................: 100.00% ✓ 233073      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 544710      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 218 MB  1.8 MB/s
     http_req_blocked...............: avg=3.47µs   min=982ns   med=2.31µs  max=4.23ms   p(90)=4.56µs   p(95)=5.72µs   p(99.9)=47.88µs
     http_req_connecting............: avg=540ns    min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.77ms  min=2.43ms  med=31.91ms max=345.69ms p(90)=43.36ms  p(95)=48.05ms  p(99.9)=89.74ms
       { expected_response:true }...: avg=32.77ms  min=2.43ms  med=31.91ms max=345.69ms p(90)=43.36ms  p(95)=48.05ms  p(99.9)=89.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181670
     http_req_receiving.............: avg=114.56µs min=30.37µs med=61.58µs max=267.3ms  p(90)=134.76µs p(95)=281.62µs p(99.9)=5.51ms 
     http_req_sending...............: avg=48.88µs  min=5.43µs  med=10.43µs max=274.23ms p(90)=23.97µs  p(95)=134.61µs p(99.9)=3.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.61ms  min=2.31ms  med=31.78ms max=291.52ms p(90)=43.17ms  p(95)=47.8ms   p(99.9)=88.86ms
     http_reqs......................: 181670  1510.025856/s
     iteration_duration.............: avg=33.03ms  min=3.86ms  med=32.14ms max=357.08ms p(90)=43.6ms   p(95)=48.29ms  p(99.9)=90.67ms
     iterations.....................: 181570  1509.194665/s
     success_rate...................: 100.00% ✓ 181570      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436014      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.52µs  min=1.03µs  med=2.54µs  max=3.89ms   p(90)=4.05µs   p(95)=4.71µs   p(99.9)=37.22µs
     http_req_connecting............: avg=669ns   min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.03ms min=2.12ms  med=40.47ms max=326.97ms p(90)=57.74ms  p(95)=63.01ms  p(99.9)=87.83ms
       { expected_response:true }...: avg=41.03ms min=2.12ms  med=40.47ms max=326.97ms p(90)=57.74ms  p(95)=63.01ms  p(99.9)=87.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145438
     http_req_receiving.............: avg=86.64µs min=28.74µs med=66.04µs max=142.45ms p(90)=105.48µs p(95)=125.05µs p(99.9)=1.8ms  
     http_req_sending...............: avg=27.85µs min=5.3µs   med=11.37µs max=142.43ms p(90)=18.14µs  p(95)=22.13µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.91ms min=2.06ms  med=40.37ms max=326.37ms p(90)=57.62ms  p(95)=62.89ms  p(99.9)=87.69ms
     http_reqs......................: 145438  1209.103793/s
     iteration_duration.............: avg=41.27ms min=4.33ms  med=40.69ms max=338.34ms p(90)=57.95ms  p(95)=63.23ms  p(99.9)=88.14ms
     iterations.....................: 145338  1208.27244/s
     success_rate...................: 100.00% ✓ 145338      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 186081     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   619 kB/s
     http_req_blocked...............: avg=5.29µs  min=1.16µs  med=3.22µs  max=4.56ms   p(90)=4.76µs   p(95)=5.36µs   p(99.9)=52.49µs 
     http_req_connecting............: avg=1.81µs  min=0s      med=0s      max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.34ms min=4.28ms  med=93.98ms max=356.51ms p(90)=121.89ms p(95)=136.4ms  p(99.9)=236.74ms
       { expected_response:true }...: avg=96.34ms min=4.28ms  med=93.98ms max=356.51ms p(90)=121.89ms p(95)=136.4ms  p(99.9)=236.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62127
     http_req_receiving.............: avg=88.29µs min=29.92µs med=82.08µs max=9.89ms   p(90)=115.7µs  p(95)=128.53µs p(99.9)=793.64µs
     http_req_sending...............: avg=24.31µs min=5.48µs  med=14.18µs max=149.82ms p(90)=20.77µs  p(95)=22.9µs   p(99.9)=666.07µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.22ms min=4.13ms  med=93.86ms max=356.31ms p(90)=121.77ms p(95)=136.26ms p(99.9)=236.11ms
     http_reqs......................: 62127   515.157219/s
     iteration_duration.............: avg=96.74ms min=21.81ms med=94.24ms max=376.83ms p(90)=122.15ms p(95)=136.77ms p(99.9)=239.97ms
     iterations.....................: 62027   514.328019/s
     success_rate...................: 100.00% ✓ 62027      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 133650     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   444 kB/s
     http_req_blocked...............: avg=5.72µs   min=1.11µs  med=3.2µs    max=4.19ms   p(90)=4.66µs   p(95)=5.19µs   p(99.9)=493.44µs
     http_req_connecting............: avg=2.33µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=466.76µs
     http_req_duration..............: avg=134.16ms min=5.78ms  med=131.3ms  max=343.36ms p(90)=178.48ms p(95)=192.23ms p(99.9)=249.11ms
       { expected_response:true }...: avg=134.16ms min=5.78ms  med=131.3ms  max=343.36ms p(90)=178.48ms p(95)=192.23ms p(99.9)=249.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44650
     http_req_receiving.............: avg=90.53µs  min=31.64µs med=85.25µs  max=36.52ms  p(90)=116.42µs p(95)=128.73µs p(99.9)=584.2µs 
     http_req_sending...............: avg=27.52µs  min=5.82µs  med=15.79µs  max=159.38ms p(90)=21.02µs  p(95)=22.88µs  p(99.9)=554.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.04ms min=5.66ms  med=131.19ms max=342.48ms p(90)=178.36ms p(95)=192.12ms p(99.9)=248.99ms
     http_reqs......................: 44650   369.740111/s
     iteration_duration.............: avg=134.72ms min=26.44ms med=131.63ms max=363.26ms p(90)=178.8ms  p(95)=192.59ms p(99.9)=255.04ms
     iterations.....................: 44550   368.912026/s
     success_rate...................: 100.00% ✓ 44550      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89805      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   298 kB/s
     http_req_blocked...............: avg=6.84µs   min=1.24µs  med=3.6µs    max=4.28ms   p(90)=5.08µs   p(95)=5.66µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=3.04µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=199.64ms min=6.46ms  med=183.13ms max=684.04ms p(90)=233.16ms p(95)=407.12ms p(99.9)=536.33ms
       { expected_response:true }...: avg=199.64ms min=6.46ms  med=183.13ms max=684.04ms p(90)=233.16ms p(95)=407.12ms p(99.9)=536.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30035
     http_req_receiving.............: avg=103µs    min=35.65µs med=97.9µs   max=17.4ms   p(90)=129.61µs p(95)=142.69µs p(99.9)=612.8µs 
     http_req_sending...............: avg=23.51µs  min=6.44µs  med=18.25µs  max=22.61ms  p(90)=23.03µs  p(95)=24.8µs   p(99.9)=586.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.52ms min=6.32ms  med=183ms    max=683.89ms p(90)=233.04ms p(95)=407ms    p(99.9)=536.2ms 
     http_reqs......................: 30035   248.216748/s
     iteration_duration.............: avg=200.55ms min=28.02ms med=183.48ms max=684.3ms  p(90)=233.51ms p(95)=408.3ms  p(99.9)=536.66ms
     iterations.....................: 29935   247.390323/s
     success_rate...................: 100.00% ✓ 29935      ✗ 0    
     vus............................: 11      min=11       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85182      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=7.23µs   min=1.28µs  med=3.37µs   max=4.17ms   p(90)=4.66µs   p(95)=5.19µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=210.4ms  min=8.51ms  med=207.28ms max=427.91ms p(90)=225.56ms p(95)=232.7ms  p(99.9)=305.95ms
       { expected_response:true }...: avg=210.4ms  min=8.51ms  med=207.28ms max=427.91ms p(90)=225.56ms p(95)=232.7ms  p(99.9)=305.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28494
     http_req_receiving.............: avg=180.9µs  min=34.54µs med=91.89µs  max=235.66ms p(90)=122.79µs p(95)=135.04µs p(99.9)=966.02µs
     http_req_sending...............: avg=47.37µs  min=5.8µs   med=16.69µs  max=169.45ms p(90)=21.29µs  p(95)=23.13µs  p(99.9)=577.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.17ms min=8.42ms  med=207.05ms max=427.28ms p(90)=225.41ms p(95)=232.45ms p(99.9)=301.94ms
     http_reqs......................: 28494   235.337324/s
     iteration_duration.............: avg=211.42ms min=45.59ms med=207.97ms max=439.01ms p(90)=225.83ms p(95)=233.02ms p(99.9)=317.35ms
     iterations.....................: 28394   234.511405/s
     success_rate...................: 100.00% ✓ 28394      ✗ 0    
     vus............................: 33      min=33       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

