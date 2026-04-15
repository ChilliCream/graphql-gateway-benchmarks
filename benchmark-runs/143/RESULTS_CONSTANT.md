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
| hive-router | v0.0.43 | 3,043 | 3,222 | 3,022 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.2 | 2,131 | 2,185 | 2,121 | 1.0% |  |
| grafbase | 0.53.2 | 2,073 | 2,137 | 2,053 | 1.3% |  |
| cosmo | 0.298.0 | 1,269 | 1,291 | 1,263 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 614 | 630 | 608 | 1.2% |  |
| apollo-router | v2.12.1 | 426 | 437 | 422 | 1.2% |  |
| hive-gateway | 2.5.14 | 275 | 280 | 272 | 1.0% |  |
| apollo-gateway | 2.13.3 | 241 | 245 | 240 | 0.8% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,334 | 2,470 | 2,295 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,913 | 1,972 | 1,890 | 1.4% |  |
| grafbase | 0.53.2 | 1,521 | 1,561 | 1,498 | 1.3% |  |
| cosmo | 0.298.0 | 1,175 | 1,201 | 1,172 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.14 | 593 | 607 | 587 | 1.2% |  |
| apollo-router | v2.12.1 | 367 | 379 | 362 | 1.6% |  |
| hive-gateway | 2.5.14 | 265 | 271 | 263 | 1.1% |  |
| apollo-gateway | 2.13.3 | 231 | 234 | 230 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1097145     ✗ 0     
     data_received..................: 32 GB   267 MB/s
     data_sent......................: 440 MB  3.7 MB/s
     http_req_blocked...............: avg=3.4µs    min=1.01µs  med=2.36µs  max=24.81ms  p(90)=3.66µs  p(95)=4.32µs   p(99.9)=37.53µs
     http_req_connecting............: avg=247ns    min=0s      med=0s      max=4.16ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.15ms  min=1.69ms  med=15.09ms max=340.09ms p(90)=24.04ms p(95)=28.7ms   p(99.9)=53.09ms
       { expected_response:true }...: avg=16.15ms  min=1.69ms  med=15.09ms max=340.09ms p(90)=24.04ms p(95)=28.7ms   p(99.9)=53.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 365815
     http_req_receiving.............: avg=158.45µs min=27.58µs med=47.63µs max=195.7ms  p(90)=98.72µs p(95)=290.44µs p(99.9)=19.31ms
     http_req_sending...............: avg=62.51µs  min=5.22µs  med=9.26µs  max=311ms    p(90)=15.92µs p(95)=122.48µs p(99.9)=10.94ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.93ms  min=1.63ms  med=14.93ms max=322.95ms p(90)=23.69ms p(95)=28.12ms  p(99.9)=51.22ms
     http_reqs......................: 365815  3043.296554/s
     iteration_duration.............: avg=16.39ms  min=2ms     med=15.3ms  max=351.33ms p(90)=24.28ms p(95)=28.98ms  p(99.9)=54.81ms
     iterations.....................: 365715  3042.464631/s
     success_rate...................: 100.00% ✓ 365715      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 768993      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=2.95µs  min=1.01µs  med=2.1µs    max=12.2ms   p(90)=3.42µs  p(95)=4.08µs   p(99.9)=32.38µs 
     http_req_connecting............: avg=352ns   min=0s      med=0s       max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.16ms min=2.52ms  med=14.73ms  max=449.61ms p(90)=51.94ms p(95)=70.42ms  p(99.9)=168.36ms
       { expected_response:true }...: avg=23.16ms min=2.52ms  med=14.73ms  max=449.61ms p(90)=51.94ms p(95)=70.42ms  p(99.9)=168.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256431
     http_req_receiving.............: avg=646.2µs min=50.38µs med=104.43µs max=192.7ms  p(90)=967.9µs p(95)=1.51ms   p(99.9)=58.5ms  
     http_req_sending...............: avg=44.27µs min=5.19µs  med=9.16µs   max=149.36ms p(90)=16.09µs p(95)=106.35µs p(99.9)=3.13ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.47ms min=2.38ms  med=14.21ms  max=449.54ms p(90)=50.59ms p(95)=69.05ms  p(99.9)=166.43ms
     http_reqs......................: 256431  2131.484836/s
     iteration_duration.............: avg=23.39ms min=3.42ms  med=14.94ms  max=449.8ms  p(90)=52.18ms p(95)=70.68ms  p(99.9)=169.63ms
     iterations.....................: 256331  2130.653624/s
     success_rate...................: 100.00% ✓ 256331      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 747909      ✗ 0     
     data_received..................: 22 GB   182 MB/s
     data_sent......................: 300 MB  2.5 MB/s
     http_req_blocked...............: avg=3.42µs   min=971ns  med=2.44µs  max=11.16ms  p(90)=4.04µs   p(95)=4.83µs   p(99.9)=47.53µs
     http_req_connecting............: avg=406ns    min=0s     med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.81ms  min=1.94ms med=23.53ms max=294.31ms p(90)=28.8ms   p(95)=31.36ms  p(99.9)=54.3ms 
       { expected_response:true }...: avg=23.81ms  min=1.94ms med=23.53ms max=294.31ms p(90)=28.8ms   p(95)=31.36ms  p(99.9)=54.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 249403
     http_req_receiving.............: avg=118.46µs min=29.6µs med=58.34µs max=93.18ms  p(90)=105.27µs p(95)=222.1µs  p(99.9)=10.96ms
     http_req_sending...............: avg=48.61µs  min=4.57µs med=10.21µs max=191.52ms p(90)=18.68µs  p(95)=122.11µs p(99.9)=3.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.64ms  min=1.84ms med=23.41ms max=293.74ms p(90)=28.61ms  p(95)=31.05ms  p(99.9)=52.91ms
     http_reqs......................: 249403  2073.914577/s
     iteration_duration.............: avg=24.05ms  min=3.89ms med=23.75ms max=337.12ms p(90)=29.02ms  p(95)=31.63ms  p(99.9)=54.81ms
     iterations.....................: 249303  2073.083025/s
     success_rate...................: 100.00% ✓ 249303      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 457932      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.34µs  min=992ns   med=2.54µs  max=4.05ms   p(90)=3.92µs  p(95)=4.55µs   p(99.9)=38.2µs 
     http_req_connecting............: avg=448ns   min=0s      med=0s      max=3.66ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.05ms min=2.07ms  med=38.5ms  max=327.3ms  p(90)=55.12ms p(95)=60.15ms  p(99.9)=86.17ms
       { expected_response:true }...: avg=39.05ms min=2.07ms  med=38.5ms  max=327.3ms  p(90)=55.12ms p(95)=60.15ms  p(99.9)=86.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152744
     http_req_receiving.............: avg=81.45µs min=28.91µs med=60.72µs max=132.45ms p(90)=97.69µs p(95)=115.98µs p(99.9)=1.79ms 
     http_req_sending...............: avg=26.24µs min=5.4µs   med=10.98µs max=152.01ms p(90)=16.95µs p(95)=21.05µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.94ms min=2.02ms  med=38.39ms max=325.66ms p(90)=55.01ms p(95)=60.03ms  p(99.9)=85.68ms
     http_reqs......................: 152744  1269.912256/s
     iteration_duration.............: avg=39.3ms  min=3.85ms  med=38.7ms  max=346.36ms p(90)=55.33ms p(95)=60.36ms  p(99.9)=86.58ms
     iterations.....................: 152644  1269.080857/s
     success_rate...................: 100.00% ✓ 152644      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 221724     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   738 kB/s
     http_req_blocked...............: avg=4.48µs   min=1.11µs  med=2.79µs  max=4.07ms   p(90)=4.35µs  p(95)=4.96µs   p(99.9)=47.88µs 
     http_req_connecting............: avg=1.37µs   min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.85ms  min=3.83ms  med=78.41ms max=358.43ms p(90)=99.16ms p(95)=109.55ms p(99.9)=208.06ms
       { expected_response:true }...: avg=80.85ms  min=3.83ms  med=78.41ms max=358.43ms p(90)=99.16ms p(95)=109.55ms p(99.9)=208.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74008
     http_req_receiving.............: avg=175.65µs min=30.85µs med=75.22µs max=285.69ms p(90)=110.3µs p(95)=123.24µs p(99.9)=1.35ms  
     http_req_sending...............: avg=27.31µs  min=5.23µs  med=12.66µs max=253.79ms p(90)=19.34µs p(95)=21.7µs   p(99.9)=661.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.65ms  min=3.72ms  med=78.3ms  max=232.03ms p(90)=98.96ms p(95)=109.19ms p(99.9)=203.69ms
     http_reqs......................: 74008   614.209292/s
     iteration_duration.............: avg=81.19ms  min=7.56ms  med=78.65ms max=378.14ms p(90)=99.4ms  p(95)=109.8ms  p(99.9)=208.96ms
     iterations.....................: 73908   613.37937/s
     success_rate...................: 100.00% ✓ 73908      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 154161     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   512 kB/s
     http_req_blocked...............: avg=5.62µs   min=1.2µs   med=3.22µs   max=4.13ms   p(90)=4.66µs   p(95)=5.22µs   p(99.9)=126.26µs
     http_req_connecting............: avg=2.2µs    min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.28ms min=5.27ms  med=115.99ms max=352.5ms  p(90)=140.68ms p(95)=147.97ms p(99.9)=181.2ms 
       { expected_response:true }...: avg=116.28ms min=5.27ms  med=115.99ms max=352.5ms  p(90)=140.68ms p(95)=147.97ms p(99.9)=181.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 51487
     http_req_receiving.............: avg=136.58µs min=31.07µs med=83.13µs  max=232.26ms p(90)=114.83µs p(95)=127µs    p(99.9)=774.98µs
     http_req_sending...............: avg=24.7µs   min=5.7µs   med=15.67µs  max=97.02ms  p(90)=21.34µs  p(95)=23.12µs  p(99.9)=568.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.12ms min=5.2ms   med=115.87ms max=352.27ms p(90)=140.54ms p(95)=147.81ms p(99.9)=178.16ms
     http_reqs......................: 51487   426.637788/s
     iteration_duration.............: avg=116.78ms min=18.71ms med=116.28ms max=385.73ms p(90)=140.94ms p(95)=148.23ms p(99.9)=182.54ms
     iterations.....................: 51387   425.809156/s
     success_rate...................: 100.00% ✓ 51387      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 99501      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   331 kB/s
     http_req_blocked...............: avg=6.66µs   min=1.26µs  med=3.45µs   max=4.13ms   p(90)=4.92µs   p(95)=5.52µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=2.98µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=180.17ms min=5.82ms  med=163.12ms max=641.4ms  p(90)=209.63ms p(95)=326.14ms p(99.9)=554.19ms
       { expected_response:true }...: avg=180.17ms min=5.82ms  med=163.12ms max=641.4ms  p(90)=209.63ms p(95)=326.14ms p(99.9)=554.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33267
     http_req_receiving.............: avg=104.07µs min=32.38µs med=96.76µs  max=80.97ms  p(90)=129.65µs p(95)=143.1µs  p(99.9)=807.05µs
     http_req_sending...............: avg=25.51µs  min=6.25µs  med=17.99µs  max=47.62ms  p(90)=22.9µs   p(95)=24.79µs  p(99.9)=528.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.04ms min=5.74ms  med=162.99ms max=641.29ms p(90)=209.47ms p(95)=326.04ms p(99.9)=554.09ms
     http_reqs......................: 33267   275.329452/s
     iteration_duration.............: avg=181ms    min=24.98ms med=163.49ms max=641.63ms p(90)=210.06ms p(95)=343.91ms p(99.9)=554.42ms
     iterations.....................: 33167   274.501817/s
     success_rate...................: 100.00% ✓ 33167      ✗ 0    
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

     checks.........................: 100.00% ✓ 87354      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=5.13µs   min=1.17µs  med=3.14µs   max=3.1ms    p(90)=4.36µs   p(95)=4.89µs   p(99.9)=853.49µs
     http_req_connecting............: avg=1.73µs   min=0s      med=0s       max=2.54ms   p(90)=0s       p(95)=0s       p(99.9)=805.82µs
     http_req_duration..............: avg=205.25ms min=8.58ms  med=199.61ms max=420.75ms p(90)=224.67ms p(95)=231.87ms p(99.9)=298.3ms 
       { expected_response:true }...: avg=205.25ms min=8.58ms  med=199.61ms max=420.75ms p(90)=224.67ms p(95)=231.87ms p(99.9)=298.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29218
     http_req_receiving.............: avg=92.3µs   min=32.96µs med=88.47µs  max=3.4ms    p(90)=119.67µs p(95)=131.46µs p(99.9)=612.56µs
     http_req_sending...............: avg=19.3µs   min=5.84µs  med=15.58µs  max=18.36ms  p(90)=20.45µs  p(95)=22.17µs  p(99.9)=479.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.14ms min=8.39ms  med=199.5ms  max=420.53ms p(90)=224.56ms p(95)=231.76ms p(99.9)=298.17ms
     http_reqs......................: 29218   241.313828/s
     iteration_duration.............: avg=206.17ms min=18.59ms med=199.89ms max=426.73ms p(90)=224.91ms p(95)=232.13ms p(99.9)=298.76ms
     iterations.....................: 29118   240.48792/s
     success_rate...................: 100.00% ✓ 29118      ✗ 0    
     vus............................: 37      min=37       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 841821      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 337 MB  2.8 MB/s
     http_req_blocked...............: avg=3.24µs   min=1.01µs  med=2.49µs  max=21.93ms  p(90)=4.01µs   p(95)=4.8µs    p(99.9)=39.42µs
     http_req_connecting............: avg=154ns    min=0s      med=0s      max=2.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.13ms  min=1.79ms  med=20.68ms max=342.35ms p(90)=29.31ms  p(95)=32.41ms  p(99.9)=54.28ms
       { expected_response:true }...: avg=21.13ms  min=1.79ms  med=20.68ms max=342.35ms p(90)=29.31ms  p(95)=32.41ms  p(99.9)=54.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280707
     http_req_receiving.............: avg=120.32µs min=27.91µs med=55.47µs max=78.43ms  p(90)=105.82µs p(95)=259.76µs p(99.9)=9.95ms 
     http_req_sending...............: avg=52.97µs  min=5.17µs  med=10.14µs max=254.15ms p(90)=18.42µs  p(95)=125.54µs p(99.9)=5.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.96ms  min=1.69ms  med=20.53ms max=263.3ms  p(90)=29.1ms   p(95)=32.13ms  p(99.9)=53.25ms
     http_reqs......................: 280707  2334.824026/s
     iteration_duration.............: avg=21.37ms  min=2.88ms  med=20.89ms max=352.49ms p(90)=29.54ms  p(95)=32.66ms  p(99.9)=54.94ms
     iterations.....................: 280607  2333.992261/s
     success_rate...................: 100.00% ✓ 280607      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 690063      ✗ 0     
     data_received..................: 20 GB   168 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=3.26µs   min=962ns   med=2.29µs  max=12.86ms  p(90)=3.69µs  p(95)=4.38µs   p(99.9)=38.13µs 
     http_req_connecting............: avg=465ns    min=0s      med=0s      max=4.18ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.83ms  min=1.92ms  med=17.37ms max=571.54ms p(90)=55.32ms p(95)=73.3ms   p(99.9)=193.47ms
       { expected_response:true }...: avg=25.83ms  min=1.92ms  med=17.37ms max=571.54ms p(90)=55.32ms p(95)=73.3ms   p(99.9)=193.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230121
     http_req_receiving.............: avg=692.95µs min=50.47µs med=111.7µs max=490.95ms p(90)=1.12ms  p(95)=1.76ms   p(99.9)=60.8ms  
     http_req_sending...............: avg=43.55µs  min=5.25µs  med=9.93µs  max=211.88ms p(90)=18.05µs p(95)=100.64µs p(99.9)=2.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=25.1ms   min=1.78ms  med=16.83ms max=571.47ms p(90)=54.06ms p(95)=71.83ms  p(99.9)=190.7ms 
     http_reqs......................: 230121  1913.704609/s
     iteration_duration.............: avg=26.07ms  min=2.8ms   med=17.59ms max=571.73ms p(90)=55.55ms p(95)=73.55ms  p(99.9)=201.52ms
     iterations.....................: 230021  1912.873001/s
     success_rate...................: 100.00% ✓ 230021      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 548781      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.57µs   min=942ns   med=2.65µs  max=12.33ms  p(90)=4.95µs   p(95)=6.06µs   p(99.9)=44.54µs
     http_req_connecting............: avg=278ns    min=0s      med=0s      max=2.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.51ms  min=2.34ms  med=31.44ms max=321.98ms p(90)=43.59ms  p(95)=48.87ms  p(99.9)=90.4ms 
       { expected_response:true }...: avg=32.51ms  min=2.34ms  med=31.44ms max=321.98ms p(90)=43.59ms  p(95)=48.87ms  p(99.9)=90.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 183027
     http_req_receiving.............: avg=122.95µs min=29.82µs med=63.21µs max=98.48ms  p(90)=139.41µs p(95)=308.64µs p(99.9)=7.05ms 
     http_req_sending...............: avg=53.29µs  min=5.43µs  med=10.99µs max=196.82ms p(90)=25.36µs  p(95)=148.04µs p(99.9)=4.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.34ms  min=2.2ms   med=31.29ms max=312.54ms p(90)=43.38ms  p(95)=48.6ms   p(99.9)=89.85ms
     http_reqs......................: 183027  1521.301856/s
     iteration_duration.............: avg=32.79ms  min=4.88ms  med=31.69ms max=341.61ms p(90)=43.84ms  p(95)=49.12ms  p(99.9)=91.87ms
     iterations.....................: 182927  1520.470666/s
     success_rate...................: 100.00% ✓ 182927      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423909      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.91µs  min=992ns   med=2.86µs  max=4.02ms   p(90)=4.43µs   p(95)=5.1µs    p(99.9)=39.32µs
     http_req_connecting............: avg=710ns   min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.19ms min=2.31ms  med=41.66ms max=321.73ms p(90)=59.28ms  p(95)=64.5ms   p(99.9)=91.22ms
       { expected_response:true }...: avg=42.19ms min=2.31ms  med=41.66ms max=321.73ms p(90)=59.28ms  p(95)=64.5ms   p(99.9)=91.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141403
     http_req_receiving.............: avg=89.44µs min=28.99µs med=68.42µs max=167.76ms p(90)=108.02µs p(95)=127.32µs p(99.9)=2.04ms 
     http_req_sending...............: avg=29.37µs min=5.41µs  med=12.13µs max=245.77ms p(90)=18.8µs   p(95)=22.69µs  p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.07ms min=2.16ms  med=41.54ms max=321.06ms p(90)=59.16ms  p(95)=64.37ms  p(99.9)=90.96ms
     http_reqs......................: 141403  1175.415617/s
     iteration_duration.............: avg=42.45ms min=4.68ms  med=41.87ms max=348.08ms p(90)=59.5ms   p(95)=64.72ms  p(99.9)=91.9ms 
     iterations.....................: 141303  1174.584365/s
     success_rate...................: 100.00% ✓ 141303      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 214494    ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   713 kB/s
     http_req_blocked...............: avg=5.06µs   min=1.16µs  med=3.29µs  max=4.79ms   p(90)=4.86µs   p(95)=5.5µs    p(99.9)=44.88µs 
     http_req_connecting............: avg=1.53µs   min=0s      med=0s      max=4.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.57ms  min=3.9ms   med=80.14ms max=371.82ms p(90)=104.94ms p(95)=116.99ms p(99.9)=216.33ms
       { expected_response:true }...: avg=83.57ms  min=3.9ms   med=80.14ms max=371.82ms p(90)=104.94ms p(95)=116.99ms p(99.9)=216.33ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 71598
     http_req_receiving.............: avg=170.13µs min=32.11µs med=81.14µs max=256.47ms p(90)=115.35µs p(95)=129.12µs p(99.9)=1.62ms  
     http_req_sending...............: avg=25.04µs  min=6.06µs  med=14.68µs max=243.78ms p(90)=21.38µs  p(95)=23.59µs  p(99.9)=750.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.37ms  min=3.83ms  med=80.04ms max=242.44ms p(90)=104.82ms p(95)=116.65ms p(99.9)=212.9ms 
     http_reqs......................: 71598   593.9413/s
     iteration_duration.............: avg=83.92ms  min=7.49ms  med=80.41ms max=387.59ms p(90)=105.2ms  p(95)=117.3ms  p(99.9)=217.85ms
     iterations.....................: 71498   593.11175/s
     success_rate...................: 100.00% ✓ 71498     ✗ 0    
     vus............................: 50      min=50      max=50 
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 132993     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   442 kB/s
     http_req_blocked...............: avg=6.16µs   min=1.22µs  med=3.43µs   max=4.42ms   p(90)=4.87µs   p(95)=5.45µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=2.43µs   min=0s      med=0s       max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=945.73µs
     http_req_duration..............: avg=134.82ms min=6.16ms  med=132.24ms max=362.87ms p(90)=179.12ms p(95)=192.34ms p(99.9)=247.62ms
       { expected_response:true }...: avg=134.82ms min=6.16ms  med=132.24ms max=362.87ms p(90)=179.12ms p(95)=192.34ms p(99.9)=247.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44431
     http_req_receiving.............: avg=102.4µs  min=32.63µs med=88.05µs  max=67.88ms  p(90)=119.58µs p(95)=131.71µs p(99.9)=860.64µs
     http_req_sending...............: avg=30.37µs  min=5.87µs  med=16.87µs  max=131.98ms p(90)=21.95µs  p(95)=23.75µs  p(99.9)=514.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.69ms min=6.02ms  med=132.11ms max=342.77ms p(90)=178.99ms p(95)=192.2ms  p(99.9)=246.72ms
     http_reqs......................: 44431   367.893924/s
     iteration_duration.............: avg=135.38ms min=29.49ms med=132.57ms max=372.91ms p(90)=179.44ms p(95)=192.69ms p(99.9)=250.07ms
     iterations.....................: 44331   367.065912/s
     success_rate...................: 100.00% ✓ 44331      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96111      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.43µs   min=1.16µs  med=3.36µs   max=4.09ms   p(90)=4.77µs   p(95)=5.35µs   p(99.9)=1.08ms  
     http_req_connecting............: avg=2.8µs    min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=927.47µs
     http_req_duration..............: avg=186.55ms min=5.94ms  med=169.4ms  max=605.34ms p(90)=220.88ms p(95)=383.4ms  p(99.9)=529.31ms
       { expected_response:true }...: avg=186.55ms min=5.94ms  med=169.4ms  max=605.34ms p(90)=220.88ms p(95)=383.4ms  p(99.9)=529.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32137
     http_req_receiving.............: avg=104.68µs min=33.18µs med=97.13µs  max=117.9ms  p(90)=128.7µs  p(95)=142.06µs p(99.9)=574.14µs
     http_req_sending...............: avg=31.67µs  min=6.08µs  med=18.07µs  max=139.27ms p(90)=22.8µs   p(95)=24.51µs  p(99.9)=808.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.41ms min=5.8ms   med=169.27ms max=605.25ms p(90)=220.76ms p(95)=382.28ms p(99.9)=529.19ms
     http_reqs......................: 32137   265.494862/s
     iteration_duration.............: avg=187.41ms min=43.73ms med=169.75ms max=605.52ms p(90)=221.38ms p(95)=386.59ms p(99.9)=529.63ms
     iterations.....................: 32037   264.668728/s
     success_rate...................: 100.00% ✓ 32037      ✗ 0    
     vus............................: 7       min=7        max=50 
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

     checks.........................: 100.00% ✓ 83772      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   278 kB/s
     http_req_blocked...............: avg=7.4µs    min=1.26µs  med=3.43µs   max=4.18ms   p(90)=4.78µs   p(95)=5.32µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=3.71µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=213.97ms min=8.89ms  med=214.01ms max=443.67ms p(90)=231.21ms p(95)=243.39ms p(99.9)=307.09ms
       { expected_response:true }...: avg=213.97ms min=8.89ms  med=214.01ms max=443.67ms p(90)=231.21ms p(95)=243.39ms p(99.9)=307.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28024
     http_req_receiving.............: avg=102.1µs  min=34.16µs med=96.61µs  max=15.07ms  p(90)=130.05µs p(95)=143.21µs p(99.9)=636.15µs
     http_req_sending...............: avg=32.89µs  min=6.31µs  med=17.54µs  max=103.74ms p(90)=22.08µs  p(95)=23.98µs  p(99.9)=537.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.84ms min=8.71ms  med=213.89ms max=443.04ms p(90)=231.09ms p(95)=243.21ms p(99.9)=306.46ms
     http_reqs......................: 28024   231.316671/s
     iteration_duration.............: avg=215.04ms min=50.78ms med=214.3ms  max=468.06ms p(90)=231.53ms p(95)=243.88ms p(99.9)=318.66ms
     iterations.....................: 27924   230.491247/s
     success_rate...................: 100.00% ✓ 27924      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

