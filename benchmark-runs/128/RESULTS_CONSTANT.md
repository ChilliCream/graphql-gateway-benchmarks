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
| hive-router | v0.0.43 | 2,931 | 3,146 | 2,844 | 3.1% |  |
| hotchocolate | 16.0.0-rc.1.21 | 2,129 | 2,170 | 2,118 | 0.8% |  |
| grafbase | 0.53.2 | 2,042 | 2,105 | 2,021 | 1.4% |  |
| cosmo | 0.298.0 | 1,265 | 1,286 | 1,251 | 1.0% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 609 | 624 | 604 | 1.1% |  |
| apollo-router | v2.12.1 | 422 | 433 | 415 | 1.4% |  |
| hive-gateway | 2.5.14 | 278 | 284 | 276 | 1.1% |  |
| apollo-gateway | 2.13.3 | 240 | 243 | 239 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,408 | 2,540 | 2,371 | 2.2% |  |
| hotchocolate | 16.0.0-rc.1.21 | 1,944 | 1,973 | 1,919 | 1.1% |  |
| grafbase | 0.53.2 | 1,518 | 1,542 | 1,500 | 0.9% |  |
| cosmo | 0.298.0 | 1,175 | 1,193 | 1,163 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 590 | 607 | 584 | 1.2% |  |
| apollo-router | v2.12.1 | 396 | 407 | 393 | 1.2% |  |
| hive-gateway | 2.5.14 | 267 | 272 | 264 | 1.0% |  |
| apollo-gateway | 2.13.3 | 235 | 238 | 233 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1057056     ✗ 0     
     data_received..................: 31 GB   257 MB/s
     data_sent......................: 424 MB  3.5 MB/s
     http_req_blocked...............: avg=3.07µs  min=1.06µs  med=2.4µs   max=9.55ms   p(90)=3.6µs   p(95)=4.24µs   p(99.9)=34.61µs
     http_req_connecting............: avg=200ns   min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.78ms min=1.69ms  med=15.75ms max=281.96ms p(90)=25.01ms p(95)=29.28ms  p(99.9)=53.04ms
       { expected_response:true }...: avg=16.78ms min=1.69ms  med=15.75ms max=281.96ms p(90)=25.01ms p(95)=29.28ms  p(99.9)=53.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 352452
     http_req_receiving.............: avg=153.6µs min=27.85µs med=50.07µs max=196.83ms p(90)=98.62µs p(95)=283.08µs p(99.9)=15.02ms
     http_req_sending...............: avg=62.62µs min=5.4µs   med=9.39µs  max=215.02ms p(90)=15.67µs p(95)=122.32µs p(99.9)=15.06ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.57ms min=1.61ms  med=15.59ms max=149.18ms p(90)=24.7ms  p(95)=28.82ms  p(99.9)=51.28ms
     http_reqs......................: 352452  2931.819974/s
     iteration_duration.............: avg=17.01ms min=2.06ms  med=15.95ms max=336.02ms p(90)=25.25ms p(95)=29.56ms  p(99.9)=54.28ms
     iterations.....................: 352352  2930.988139/s
     success_rate...................: 100.00% ✓ 352352      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 768378      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=3.14µs   min=992ns   med=2.39µs   max=3.95ms   p(90)=3.59µs  p(95)=4.21µs   p(99.9)=37.86µs 
     http_req_connecting............: avg=415ns    min=0s      med=0s       max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.17ms  min=2.51ms  med=15.12ms  max=333.63ms p(90)=50.9ms  p(95)=69.7ms   p(99.9)=169.11ms
       { expected_response:true }...: avg=23.17ms  min=2.51ms  med=15.12ms  max=333.63ms p(90)=50.9ms  p(95)=69.7ms   p(99.9)=169.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256226
     http_req_receiving.............: avg=696.84µs min=51.64µs med=105.84µs max=162.29ms p(90)=1ms     p(95)=1.61ms   p(99.9)=60.97ms 
     http_req_sending...............: avg=46.15µs  min=5.29µs  med=9.54µs   max=163.43ms p(90)=15.92µs p(95)=112.62µs p(99.9)=3.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.43ms  min=2.39ms  med=14.58ms  max=333.18ms p(90)=49.37ms p(95)=68.13ms  p(99.9)=167.28ms
     http_reqs......................: 256226  2129.811692/s
     iteration_duration.............: avg=23.41ms  min=3.44ms  med=15.34ms  max=347.96ms p(90)=51.15ms p(95)=69.96ms  p(99.9)=170.03ms
     iterations.....................: 256126  2128.980468/s
     success_rate...................: 100.00% ✓ 256126      ✗ 0     
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

     checks.........................: 100.00% ✓ 736596      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 295 MB  2.5 MB/s
     http_req_blocked...............: avg=3.36µs   min=1.11µs  med=2.67µs  max=11.83ms  p(90)=4.14µs   p(95)=4.92µs   p(99.9)=42.4µs 
     http_req_connecting............: avg=210ns    min=0s      med=0s      max=2.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.18ms  min=1.92ms  med=23.92ms max=325.64ms p(90)=29.2ms   p(95)=31.7ms   p(99.9)=54.07ms
       { expected_response:true }...: avg=24.18ms  min=1.92ms  med=23.92ms max=325.64ms p(90)=29.2ms   p(95)=31.7ms   p(99.9)=54.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245632
     http_req_receiving.............: avg=120.32µs min=30.05µs med=60.84µs max=193.63ms p(90)=105.14µs p(95)=200.63µs p(99.9)=10.72ms
     http_req_sending...............: avg=49.48µs  min=5.17µs  med=10.68µs max=180.75ms p(90)=18.18µs  p(95)=117.31µs p(99.9)=3.98ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.01ms  min=1.82ms  med=23.8ms  max=324.67ms p(90)=29.01ms  p(95)=31.41ms  p(99.9)=52.76ms
     http_reqs......................: 245632  2042.551357/s
     iteration_duration.............: avg=24.42ms  min=3.7ms   med=24.13ms max=336.75ms p(90)=29.43ms  p(95)=31.96ms  p(99.9)=54.69ms
     iterations.....................: 245532  2041.719808/s
     success_rate...................: 100.00% ✓ 245532      ✗ 0     
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

     checks.........................: 100.00% ✓ 456270      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.29µs  min=1.04µs  med=2.5µs   max=5.21ms   p(90)=3.93µs  p(95)=4.58µs   p(99.9)=35.83µs
     http_req_connecting............: avg=413ns   min=0s      med=0s      max=3.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.2ms  min=2.17ms  med=38.64ms max=326.51ms p(90)=55.38ms p(95)=60.5ms   p(99.9)=86.27ms
       { expected_response:true }...: avg=39.2ms  min=2.17ms  med=38.64ms max=326.51ms p(90)=55.38ms p(95)=60.5ms   p(99.9)=86.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152190
     http_req_receiving.............: avg=81.77µs min=28.76µs med=62.17µs max=46.81ms  p(90)=98.58µs p(95)=117.35µs p(99.9)=1.81ms 
     http_req_sending...............: avg=27.8µs  min=5.36µs  med=10.49µs max=172.52ms p(90)=16.02µs p(95)=20.23µs  p(99.9)=1.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.09ms min=2.07ms  med=38.53ms max=326.24ms p(90)=55.27ms p(95)=60.38ms  p(99.9)=85.96ms
     http_reqs......................: 152190  1265.323132/s
     iteration_duration.............: avg=39.44ms min=3.86ms  med=38.84ms max=341.78ms p(90)=55.58ms p(95)=60.72ms  p(99.9)=87.1ms 
     iterations.....................: 152090  1264.491722/s
     success_rate...................: 100.00% ✓ 152090      ✗ 0     
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

     checks.........................: 100.00% ✓ 219918     ✗ 0    
     data_received..................: 6.4 GB  54 MB/s
     data_sent......................: 88 MB   732 kB/s
     http_req_blocked...............: avg=4.19µs  min=1.18µs  med=2.83µs  max=3.59ms   p(90)=4.34µs   p(95)=4.97µs   p(99.9)=46.21µs 
     http_req_connecting............: avg=1.04µs  min=0s      med=0s      max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.51ms min=3.59ms  med=79.03ms max=327.3ms  p(90)=98.41ms  p(95)=107.61ms p(99.9)=203.96ms
       { expected_response:true }...: avg=81.51ms min=3.59ms  med=79.03ms max=327.3ms  p(90)=98.41ms  p(95)=107.61ms p(99.9)=203.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73406
     http_req_receiving.............: avg=85.79µs min=31.38µs med=75.27µs max=117.75ms p(90)=109.42µs p(95)=122.88µs p(99.9)=962.02µs
     http_req_sending...............: avg=21.77µs min=5.8µs   med=12.53µs max=154.62ms p(90)=18.77µs  p(95)=21.18µs  p(99.9)=668.39µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.41ms min=3.53ms  med=78.93ms max=326.71ms p(90)=98.31ms  p(95)=107.51ms p(99.9)=203.73ms
     http_reqs......................: 73406   609.269487/s
     iteration_duration.............: avg=81.85ms min=11.92ms med=79.25ms max=346.54ms p(90)=98.65ms  p(95)=107.86ms p(99.9)=205.17ms
     iterations.....................: 73306   608.439488/s
     success_rate...................: 100.00% ✓ 73306      ✗ 0    
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

     checks.........................: 100.00% ✓ 152811     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 61 MB   508 kB/s
     http_req_blocked...............: avg=6.22µs   min=1.19µs  med=3.49µs   max=4.93ms   p(90)=4.94µs   p(95)=5.53µs   p(99.9)=198.1µs 
     http_req_connecting............: avg=2.48µs   min=0s      med=0s       max=4.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=117.32ms min=5.59ms  med=117.07ms max=370.54ms p(90)=141.57ms p(95)=148.6ms  p(99.9)=183.09ms
       { expected_response:true }...: avg=117.32ms min=5.59ms  med=117.07ms max=370.54ms p(90)=141.57ms p(95)=148.6ms  p(99.9)=183.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51037
     http_req_receiving.............: avg=94.6µs   min=31.42µs med=85.73µs  max=123.63ms p(90)=117.42µs p(95)=129.72µs p(99.9)=707.67µs
     http_req_sending...............: avg=25.92µs  min=6.04µs  med=16.04µs  max=128.76ms p(90)=21.65µs  p(95)=23.49µs  p(99.9)=639.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.2ms  min=5.48ms  med=116.96ms max=370.16ms p(90)=141.46ms p(95)=148.49ms p(99.9)=182.98ms
     http_reqs......................: 51037   422.805141/s
     iteration_duration.............: avg=117.82ms min=22.43ms med=117.37ms max=390.23ms p(90)=141.82ms p(95)=148.89ms p(99.9)=185.9ms 
     iterations.....................: 50937   421.976713/s
     success_rate...................: 100.00% ✓ 50937      ✗ 0    
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

     checks.........................: 100.00% ✓ 100668     ✗ 0    
     data_received..................: 3.0 GB  24 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=6.93µs   min=1.34µs  med=3.73µs   max=4.07ms   p(90)=5.28µs   p(95)=5.92µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=2.89µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=178.08ms min=5.92ms  med=161.76ms max=593.54ms p(90)=201.74ms p(95)=280.64ms p(99.9)=527.14ms
       { expected_response:true }...: avg=178.08ms min=5.92ms  med=161.76ms max=593.54ms p(90)=201.74ms p(95)=280.64ms p(99.9)=527.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33656
     http_req_receiving.............: avg=110.16µs min=35.26µs med=98.08µs  max=65.73ms  p(90)=131.04µs p(95)=145.08µs p(99.9)=583.03µs
     http_req_sending...............: avg=26.05µs  min=6.38µs  med=18.15µs  max=61.89ms  p(90)=23.44µs  p(95)=25.32µs  p(99.9)=582.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=177.94ms min=5.78ms  med=161.62ms max=593.44ms p(90)=201.6ms  p(95)=278.58ms p(99.9)=527.06ms
     http_reqs......................: 33656   278.303312/s
     iteration_duration.............: avg=178.9ms  min=34.23ms med=162.1ms  max=593.73ms p(90)=202.22ms p(95)=286.3ms  p(99.9)=527.49ms
     iterations.....................: 33556   277.476406/s
     success_rate...................: 100.00% ✓ 33556      ✗ 0    
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

     checks.........................: 100.00% ✓ 87117      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=7.25µs   min=1.21µs  med=3.32µs   max=4.14ms   p(90)=4.6µs    p(95)=5.11µs   p(99.9)=1.95ms  
     http_req_connecting............: avg=3.73µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=205.76ms min=8.46ms  med=208.05ms max=451.92ms p(90)=219.26ms p(95)=231.43ms p(99.9)=291.6ms 
       { expected_response:true }...: avg=205.76ms min=8.46ms  med=208.05ms max=451.92ms p(90)=219.26ms p(95)=231.43ms p(99.9)=291.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29139
     http_req_receiving.............: avg=95.64µs  min=33.55µs med=89.61µs  max=38.58ms  p(90)=121.3µs  p(95)=133.09µs p(99.9)=548.57µs
     http_req_sending...............: avg=31.62µs  min=5.96µs  med=16.34µs  max=191.21ms p(90)=21.37µs  p(95)=23.14µs  p(99.9)=497.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.63ms min=8.33ms  med=207.93ms max=443.2ms  p(90)=219.16ms p(95)=231.3ms  p(99.9)=291.47ms
     http_reqs......................: 29139   240.649435/s
     iteration_duration.............: avg=206.75ms min=70.69ms med=208.31ms max=458.38ms p(90)=219.58ms p(95)=231.87ms p(99.9)=314.83ms
     iterations.....................: 29039   239.823568/s
     success_rate...................: 100.00% ✓ 29039      ✗ 0    
     vus............................: 45      min=45       max=50 
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

     checks.........................: 100.00% ✓ 868530      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=3.19µs   min=1.08µs  med=2.62µs  max=3.94ms   p(90)=4.13µs   p(95)=4.98µs   p(99.9)=41.39µs
     http_req_connecting............: avg=168ns    min=0s      med=0s      max=2.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.48ms  min=1.85ms  med=19.95ms max=345.2ms  p(90)=28.36ms  p(95)=31.49ms  p(99.9)=55.03ms
       { expected_response:true }...: avg=20.48ms  min=1.85ms  med=19.95ms max=345.2ms  p(90)=28.36ms  p(95)=31.49ms  p(99.9)=55.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289610
     http_req_receiving.............: avg=141.83µs min=28.05µs med=57.43µs max=262.18ms p(90)=110.93µs p(95)=276.97µs p(99.9)=10.01ms
     http_req_sending...............: avg=53.93µs  min=5.33µs  med=10.7µs  max=42.77ms  p(90)=19.47µs  p(95)=130.72µs p(99.9)=4.96ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.28ms  min=1.75ms  med=19.8ms  max=83.86ms  p(90)=28.15ms  p(95)=31.2ms   p(99.9)=53.86ms
     http_reqs......................: 289610  2408.791576/s
     iteration_duration.............: avg=20.71ms  min=3.22ms  med=20.17ms max=369.69ms p(90)=28.58ms  p(95)=31.74ms  p(99.9)=55.47ms
     iterations.....................: 289510  2407.95984/s
     success_rate...................: 100.00% ✓ 289510      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 701370      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 281 MB  2.3 MB/s
     http_req_blocked...............: avg=3.6µs    min=990ns   med=2.59µs   max=12.48ms  p(90)=4.02µs  p(95)=4.76µs   p(99.9)=39.36µs 
     http_req_connecting............: avg=471ns    min=0s      med=0s       max=4.16ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.41ms  min=1.94ms  med=17.5ms   max=731.74ms p(90)=53.63ms p(95)=70.85ms  p(99.9)=180.36ms
       { expected_response:true }...: avg=25.41ms  min=1.94ms  med=17.5ms   max=731.74ms p(90)=53.63ms p(95)=70.85ms  p(99.9)=180.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 233890
     http_req_receiving.............: avg=722.53µs min=51.44µs med=109.38µs max=211.84ms p(90)=1.16ms  p(95)=1.88ms   p(99.9)=61.88ms 
     http_req_sending...............: avg=49.14µs  min=5.31µs  med=10.2µs   max=243.89ms p(90)=18.1µs  p(95)=113.78µs p(99.9)=3.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.64ms  min=1.84ms  med=16.92ms  max=731.39ms p(90)=52.18ms p(95)=69.33ms  p(99.9)=178.05ms
     http_reqs......................: 233890  1944.985212/s
     iteration_duration.............: avg=25.65ms  min=2.81ms  med=17.73ms  max=731.95ms p(90)=53.87ms p(95)=71.11ms  p(99.9)=182.55ms
     iterations.....................: 233790  1944.15363/s
     success_rate...................: 100.00% ✓ 233790      ✗ 0     
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

     checks.........................: 100.00% ✓ 547947      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.84µs   min=962ns  med=2.59µs  max=10.78ms  p(90)=4.85µs  p(95)=6.03µs   p(99.9)=48.92µs
     http_req_connecting............: avg=608ns    min=0s     med=0s      max=4.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.57ms  min=2.22ms med=31.59ms max=382.24ms p(90)=43.55ms p(95)=48.44ms  p(99.9)=86.48ms
       { expected_response:true }...: avg=32.57ms  min=2.22ms med=31.59ms max=382.24ms p(90)=43.55ms p(95)=48.44ms  p(99.9)=86.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182749
     http_req_receiving.............: avg=119.98µs min=29.4µs med=62.01µs max=157.18ms p(90)=133.8µs p(95)=275.57µs p(99.9)=5.52ms 
     http_req_sending...............: avg=49.58µs  min=5.45µs med=10.73µs max=263.04ms p(90)=24.82µs p(95)=135.15µs p(99.9)=3.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.4ms   min=2.15ms med=31.46ms max=224.87ms p(90)=43.36ms p(95)=48.21ms  p(99.9)=85.04ms
     http_reqs......................: 182749  1518.931641/s
     iteration_duration.............: avg=32.84ms  min=4.72ms med=31.83ms max=392.91ms p(90)=43.8ms  p(95)=48.68ms  p(99.9)=87.18ms
     iterations.....................: 182649  1518.100484/s
     success_rate...................: 100.00% ✓ 182649      ✗ 0     
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

     checks.........................: 100.00% ✓ 423900      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.45µs   min=1µs     med=2.73µs  max=5.73ms   p(90)=4.19µs   p(95)=4.86µs  p(99.9)=38.6µs 
     http_req_connecting............: avg=336ns    min=0s      med=0s      max=2.39ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=42.2ms   min=2.27ms  med=41.65ms max=302.9ms  p(90)=59.38ms  p(95)=64.79ms p(99.9)=92.03ms
       { expected_response:true }...: avg=42.2ms   min=2.27ms  med=41.65ms max=302.9ms  p(90)=59.38ms  p(95)=64.79ms p(99.9)=92.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141400
     http_req_receiving.............: avg=113.37µs min=29.49µs med=68.74µs max=257.9ms  p(90)=106.46µs p(95)=124.9µs p(99.9)=1.91ms 
     http_req_sending...............: avg=29.07µs  min=5.54µs  med=11.97µs max=150.83ms p(90)=18.31µs  p(95)=22.13µs p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=42.06ms  min=2.19ms  med=41.55ms max=277.1ms  p(90)=59.25ms  p(95)=64.65ms p(99.9)=90.11ms
     http_reqs......................: 141400  1175.430476/s
     iteration_duration.............: avg=42.45ms  min=4.33ms  med=41.87ms max=357ms    p(90)=59.6ms   p(95)=65.01ms p(99.9)=92.73ms
     iterations.....................: 141300  1174.599196/s
     success_rate...................: 100.00% ✓ 141300      ✗ 0     
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

     checks.........................: 100.00% ✓ 213072     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 85 MB   709 kB/s
     http_req_blocked...............: avg=4.89µs   min=1.25µs  med=3.36µs  max=4.16ms   p(90)=4.88µs   p(95)=5.5µs    p(99.9)=46µs    
     http_req_connecting............: avg=1.22µs   min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.11ms  min=3.87ms  med=80.8ms  max=363.87ms p(90)=105.66ms p(95)=117.74ms p(99.9)=217.73ms
       { expected_response:true }...: avg=84.11ms  min=3.87ms  med=80.8ms  max=363.87ms p(90)=105.66ms p(95)=117.74ms p(99.9)=217.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71124
     http_req_receiving.............: avg=102.63µs min=31.66µs med=82.11µs max=178.98ms p(90)=116.19µs p(95)=129.62µs p(99.9)=1.15ms  
     http_req_sending...............: avg=32.16µs  min=5.64µs  med=14.51µs max=256.96ms p(90)=21.13µs  p(95)=23.39µs  p(99.9)=886.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.98ms  min=3.75ms  med=80.68ms max=337.55ms p(90)=105.53ms p(95)=117.57ms p(99.9)=217.5ms 
     http_reqs......................: 71124   590.065482/s
     iteration_duration.............: avg=84.48ms  min=12.29ms med=81.05ms max=374.11ms p(90)=105.92ms p(95)=118.05ms p(99.9)=220.89ms
     iterations.....................: 71024   589.235853/s
     success_rate...................: 100.00% ✓ 71024      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 143394     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=5.13µs   min=1.23µs  med=3.69µs   max=4.06ms   p(90)=5.25µs   p(95)=5.83µs   p(99.9)=154.12µs
     http_req_connecting............: avg=1.13µs   min=0s      med=0s       max=2.99ms   p(90)=0s       p(95)=0s       p(99.9)=86.01µs 
     http_req_duration..............: avg=125.02ms min=5.96ms  med=122.7ms  max=346.7ms  p(90)=165.13ms p(95)=177.47ms p(99.9)=225.29ms
       { expected_response:true }...: avg=125.02ms min=5.96ms  med=122.7ms  max=346.7ms  p(90)=165.13ms p(95)=177.47ms p(99.9)=225.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47898
     http_req_receiving.............: avg=96.39µs  min=31.02µs med=89.63µs  max=55.25ms  p(90)=121.19µs p(95)=133.83µs p(99.9)=673.79µs
     http_req_sending...............: avg=33.04µs  min=6.09µs  med=18.08µs  max=88.43ms  p(90)=23.45µs  p(95)=25.39µs  p(99.9)=808.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.89ms min=5.8ms   med=122.58ms max=339.79ms p(90)=165.01ms p(95)=177.33ms p(99.9)=225.15ms
     http_reqs......................: 47898   396.662606/s
     iteration_duration.............: avg=125.56ms min=21.95ms med=123.02ms max=360.18ms p(90)=165.43ms p(95)=177.81ms p(99.9)=228.57ms
     iterations.....................: 47798   395.834466/s
     success_rate...................: 100.00% ✓ 47798      ✗ 0    
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

     checks.........................: 100.00% ✓ 96669      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=6.48µs   min=1.29µs  med=3.69µs   max=3.55ms   p(90)=5.21µs   p(95)=5.85µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=2.56µs   min=0s      med=0s       max=3.52ms   p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=185.48ms min=5.99ms  med=169.67ms max=614.98ms p(90)=210.22ms p(95)=370ms    p(99.9)=527.17ms
       { expected_response:true }...: avg=185.48ms min=5.99ms  med=169.67ms max=614.98ms p(90)=210.22ms p(95)=370ms    p(99.9)=527.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32323
     http_req_receiving.............: avg=105.99µs min=35.06µs med=98.77µs  max=50.28ms  p(90)=130.76µs p(95)=144.38µs p(99.9)=533.57µs
     http_req_sending...............: avg=32µs     min=6.32µs  med=18.67µs  max=161.29ms p(90)=23.6µs   p(95)=25.31µs  p(99.9)=528.51µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.34ms min=5.85ms  med=169.55ms max=614.85ms p(90)=210.07ms p(95)=369.89ms p(99.9)=527.07ms
     http_reqs......................: 32323   267.029167/s
     iteration_duration.............: avg=186.33ms min=48.89ms med=170.02ms max=615.25ms p(90)=210.68ms p(95)=372.36ms p(99.9)=527.48ms
     iterations.....................: 32223   266.203039/s
     success_rate...................: 100.00% ✓ 32223      ✗ 0    
     vus............................: 8       min=8        max=50 
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

     checks.........................: 100.00% ✓ 85272      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=7.06µs   min=1.29µs  med=3.48µs   max=3.9ms    p(90)=4.76µs   p(95)=5.3µs    p(99.9)=1.74ms  
     http_req_connecting............: avg=3.39µs   min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=210.22ms min=8.84ms  med=221.79ms max=439.81ms p(90)=302.9ms  p(95)=308ms    p(99.9)=385.3ms 
       { expected_response:true }...: avg=210.22ms min=8.84ms  med=221.79ms max=439.81ms p(90)=302.9ms  p(95)=308ms    p(99.9)=385.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28524
     http_req_receiving.............: avg=99.31µs  min=36.01µs med=93.06µs  max=46.78ms  p(90)=124.53µs p(95)=137.51µs p(99.9)=708.05µs
     http_req_sending...............: avg=27.59µs  min=6.1µs   med=16.97µs  max=64.17ms  p(90)=21.77µs  p(95)=23.58µs  p(99.9)=576.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.09ms min=8.69ms  med=221.62ms max=439.26ms p(90)=302.78ms p(95)=307.87ms p(99.9)=385.15ms
     http_reqs......................: 28524   235.534958/s
     iteration_duration.............: avg=211.22ms min=39.68ms med=224.79ms max=446.84ms p(90)=303.2ms  p(95)=308.32ms p(99.9)=386.41ms
     iterations.....................: 28424   234.709215/s
     success_rate...................: 100.00% ✓ 28424      ✗ 0    
     vus............................: 44      min=44       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

