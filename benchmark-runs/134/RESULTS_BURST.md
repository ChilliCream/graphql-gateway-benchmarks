## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,705 | 2,797 | 2,648 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,025 | 2,077 | 2,014 | 1.1% |  |
| cosmo | 0.298.0 | 1,153 | 1,153 | 1,150 | 0.2% | non-compatible response (15 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 571 | 574 | 565 | 0.6% |  |
| hive-gateway | 2.5.14 | 255 | 258 | 251 | 0.8% |  |
| apollo-gateway | 2.13.3 | 202 | 205 | 198 | 1.0% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (30892 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (472302 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,285 | 2,357 | 2,253 | 1.4% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,846 | 1,888 | 1,832 | 1.0% |  |
| cosmo | 0.298.0 | 1,059 | 1,059 | 1,059 | 0.0% | non-compatible response (17 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 540 | 550 | 537 | 0.9% |  |
| hive-gateway | 2.5.14 | 247 | 248 | 246 | 0.3% |  |
| apollo-gateway | 2.13.3 | 208 | 211 | 206 | 0.7% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (28129 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (241567 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 498642      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 201 MB  3.2 MB/s
     http_req_blocked...............: avg=29.55µs  min=1.06µs  med=2.25µs  max=76.56ms  p(90)=3.7µs    p(95)=4.79µs   p(99.9)=4.03ms  
     http_req_connecting............: avg=26.31µs  min=0s      med=0s      max=76.37ms  p(90)=0s       p(95)=0s       p(99.9)=3.8ms   
     http_req_duration..............: avg=84.94ms  min=1.56ms  med=79.38ms max=383.18ms p(90)=163.22ms p(95)=182.99ms p(99.9)=252.39ms
       { expected_response:true }...: avg=84.94ms  min=1.56ms  med=79.38ms max=383.18ms p(90)=163.22ms p(95)=182.99ms p(99.9)=252.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167214
     http_req_receiving.............: avg=426.38µs min=27.89µs med=55.2µs  max=316.64ms p(90)=238.05µs p(95)=418.57µs p(99.9)=53.11ms 
     http_req_sending...............: avg=89.37µs  min=5.31µs  med=9.74µs  max=331.43ms p(90)=18.72µs  p(95)=134.36µs p(99.9)=13.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.43ms  min=1.51ms  med=79.07ms max=292.2ms  p(90)=162.35ms p(95)=181.36ms p(99.9)=242.76ms
     http_reqs......................: 167214  2705.00872/s
     iteration_duration.............: avg=85.76ms  min=2.2ms   med=80.25ms max=408.88ms p(90)=163.78ms p(95)=183.72ms p(99.9)=255.56ms
     iterations.....................: 166214  2688.831792/s
     success_rate...................: 100.00% ✓ 166214      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 379131      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=13.44µs  min=1.04µs  med=2.3µs    max=84.58ms  p(90)=3.64µs   p(95)=4.56µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=10.53µs  min=0s      med=0s       max=84.41ms  p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=111.74ms min=2.43ms  med=106.77ms max=559.63ms p(90)=213.07ms p(95)=235.23ms p(99.9)=369.88ms
       { expected_response:true }...: avg=111.74ms min=2.43ms  med=106.77ms max=559.63ms p(90)=213.07ms p(95)=235.23ms p(99.9)=369.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127377
     http_req_receiving.............: avg=1.24ms   min=51.92µs med=149.97µs max=211.03ms p(90)=1.32ms   p(95)=3.09ms   p(99.9)=100.19ms
     http_req_sending...............: avg=61.21µs  min=5.23µs  med=9.8µs    max=225.36ms p(90)=18.34µs  p(95)=123.31µs p(99.9)=7.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.44ms min=2.33ms  med=105.55ms max=558.63ms p(90)=211.12ms p(95)=232.28ms p(99.9)=367.09ms
     http_reqs......................: 127377  2025.644739/s
     iteration_duration.............: avg=112.88ms min=3.42ms  med=107.99ms max=559.79ms p(90)=213.63ms p(95)=235.87ms p(99.9)=370.76ms
     iterations.....................: 126377  2009.741988/s
     success_rate...................: 100.00% ✓ 126377      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 213402      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.39µs   min=1.07µs  med=2.57µs   max=16.99ms  p(90)=4.08µs   p(95)=4.93µs   p(99.9)=487.69µs
     http_req_connecting............: avg=3.04µs   min=0s      med=0s       max=16.95ms  p(90)=0s       p(95)=0s       p(99.9)=426.97µs
     http_req_duration..............: avg=197.86ms min=2.03ms  med=195.49ms max=552.52ms p(90)=369.19ms p(95)=394.52ms p(99.9)=472.04ms
       { expected_response:true }...: avg=197.86ms min=2.03ms  med=195.49ms max=552.52ms p(90)=369.19ms p(95)=394.52ms p(99.9)=472.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72134
     http_req_receiving.............: avg=78.05µs  min=30.73µs med=62.01µs  max=67.9ms   p(90)=95.39µs  p(95)=108.97µs p(99.9)=1.57ms  
     http_req_sending...............: avg=31.14µs  min=5.49µs  med=10.95µs  max=198.39ms p(90)=16.72µs  p(95)=20.16µs  p(99.9)=3.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.75ms min=1.98ms  med=195.33ms max=552.43ms p(90)=369.11ms p(95)=394.39ms p(99.9)=471.97ms
     http_reqs......................: 72134   1153.282615/s
     iteration_duration.............: avg=200.88ms min=4.54ms  med=198.94ms max=552.69ms p(90)=370.13ms p(95)=395.19ms p(99.9)=473.02ms
     iterations.....................: 71134   1137.294557/s
     success_rate...................: 100.00% ✓ 71134       ✗ 0    
     vus............................: 83      min=0         max=494
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 107454     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   686 kB/s
     http_req_blocked...............: avg=10.16µs  min=1.13µs  med=2.73µs   max=31.9ms  p(90)=4.5µs    p(95)=5.5µs    p(99.9)=1.53ms  
     http_req_connecting............: avg=6.46µs   min=0s      med=0s       max=31.85ms p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=389.41ms min=3.57ms  med=363.37ms max=1.51s   p(90)=768.89ms p(95)=833.46ms p(99.9)=1.21s   
       { expected_response:true }...: avg=389.41ms min=3.57ms  med=363.37ms max=1.51s   p(90)=768.89ms p(95)=833.46ms p(99.9)=1.21s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36818
     http_req_receiving.............: avg=85.56µs  min=33.44µs med=75.48µs  max=32.03ms p(90)=112.75µs p(95)=126.72µs p(99.9)=907.51µs
     http_req_sending...............: avg=22.66µs  min=5.87µs  med=12.75µs  max=18.69ms p(90)=20.22µs  p(95)=23.61µs  p(99.9)=2.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=389.3ms  min=3.52ms  med=363.32ms max=1.51s   p(90)=768.8ms  p(95)=833.28ms p(99.9)=1.21s   
     http_reqs......................: 36818   571.736293/s
     iteration_duration.............: avg=400.52ms min=18.54ms med=377.38ms max=1.51s   p(90)=772.81ms p(95)=836.4ms  p(99.9)=1.21s   
     iterations.....................: 35818   556.207577/s
     success_rate...................: 100.00% ✓ 35818      ✗ 0    
     vus............................: 73      min=0        max=495
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 48549      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=21.72µs  min=1.3µs   med=3.73µs   max=9.68ms   p(90)=5.66µs   p(95)=7.23µs   p(99.9)=4.93ms 
     http_req_connecting............: avg=15.98µs  min=0s      med=0s       max=9.63ms   p(90)=0s       p(95)=0s       p(99.9)=4.82ms 
     http_req_duration..............: avg=835.51ms min=5.69ms  med=726.89ms max=13.8s    p(90)=1.53s    p(95)=1.71s    p(99.9)=12.36s 
       { expected_response:true }...: avg=835.51ms min=5.69ms  med=726.89ms max=13.8s    p(90)=1.53s    p(95)=1.71s    p(99.9)=12.36s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17183
     http_req_receiving.............: avg=229.37µs min=34.93µs med=99.12µs  max=152.17ms p(90)=139.02µs p(95)=153.63µs p(99.9)=57.57ms
     http_req_sending...............: avg=42.95µs  min=5.55µs  med=18.36µs  max=56.39ms  p(90)=24.73µs  p(95)=29µs     p(99.9)=5.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=835.24ms min=5.57ms  med=726.71ms max=13.8s    p(90)=1.53s    p(95)=1.71s    p(99.9)=12.36s 
     http_reqs......................: 17183   255.097319/s
     iteration_duration.............: avg=887.23ms min=7.88ms  med=789.25ms max=13.8s    p(90)=1.55s    p(95)=1.72s    p(99.9)=12.37s 
     iterations.....................: 16183   240.251406/s
     success_rate...................: 100.00% ✓ 16183      ✗ 0    
     vus............................: 72      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 42225     ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   248 kB/s
     http_req_blocked...............: avg=13.38µs  min=1.22µs  med=3.17µs   max=14.02ms p(90)=4.81µs   p(95)=6.13µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=8.22µs   min=0s      med=0s       max=13.97ms p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=448.98ms min=8.61ms  med=515.54ms max=1.24s   p(90)=773.81ms p(95)=820.16ms p(99.9)=1.13s   
       { expected_response:true }...: avg=448.98ms min=8.61ms  med=515.54ms max=1.24s   p(90)=773.81ms p(95)=820.16ms p(99.9)=1.13s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 15075
     http_req_receiving.............: avg=97.08µs  min=33.27µs med=85.96µs  max=73.55ms p(90)=126.71µs p(95)=140.38µs p(99.9)=702.66µs
     http_req_sending...............: avg=45.25µs  min=5.9µs   med=15.32µs  max=148.7ms p(90)=21.71µs  p(95)=26.04µs  p(99.9)=4.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.84ms min=8.51ms  med=515.46ms max=1.24s   p(90)=773.72ms p(95)=820.06ms p(99.9)=1.13s   
     http_reqs......................: 15075   202.24168/s
     iteration_duration.............: avg=480.78ms min=14.71ms med=546.43ms max=1.25s   p(90)=779.96ms p(95)=824.29ms p(99.9)=1.14s   
     iterations.....................: 14075   188.82598/s
     success_rate...................: 100.00% ✓ 14075     ✗ 0    
     vus............................: 75      min=0       max=500
     vus_max........................: 500     min=500     max=500
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

     checks.........................: 100.00% ✓ 421866      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=20.58µs  min=1.07µs  med=2.43µs  max=50.48ms  p(90)=4.05µs   p(95)=5.25µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=17.41µs  min=0s      med=0s      max=50.42ms  p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=100.42ms min=1.57ms  med=95.06ms max=330.76ms p(90)=192.71ms p(95)=209.75ms p(99.9)=259.56ms
       { expected_response:true }...: avg=100.42ms min=1.57ms  med=95.06ms max=330.76ms p(90)=192.71ms p(95)=209.75ms p(99.9)=259.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141622
     http_req_receiving.............: avg=215.5µs  min=29.11µs med=59.74µs max=53.55ms  p(90)=179.99µs p(95)=414.48µs p(99.9)=26.52ms 
     http_req_sending...............: avg=78.13µs  min=5.43µs  med=10.75µs max=254.52ms p(90)=20.98µs  p(95)=137.35µs p(99.9)=10.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.12ms min=1.53ms  med=94.82ms max=303.36ms p(90)=192.23ms p(95)=209.14ms p(99.9)=258.55ms
     http_reqs......................: 141622  2285.975539/s
     iteration_duration.............: avg=101.41ms min=4.17ms  med=96.21ms max=367.19ms p(90)=193.21ms p(95)=210.27ms p(99.9)=260.41ms
     iterations.....................: 140622  2269.834152/s
     success_rate...................: 100.00% ✓ 140622      ✗ 0     
     vus............................: 55      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 341940      ✗ 0     
     data_received..................: 10 GB   162 MB/s
     data_sent......................: 138 MB  2.2 MB/s
     http_req_blocked...............: avg=9.89µs   min=1.03µs  med=2.31µs   max=33.12ms  p(90)=3.78µs   p(95)=4.78µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=6.92µs   min=0s      med=0s       max=32.97ms  p(90)=0s       p(95)=0s       p(99.9)=973.97µs
     http_req_duration..............: avg=123.84ms min=1.79ms  med=116.86ms max=896.4ms  p(90)=231.72ms p(95)=257.02ms p(99.9)=687.92ms
       { expected_response:true }...: avg=123.84ms min=1.79ms  med=116.86ms max=896.4ms  p(90)=231.72ms p(95)=257.02ms p(99.9)=687.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 114980
     http_req_receiving.............: avg=1.38ms   min=53.49µs med=165.72µs max=199.2ms  p(90)=1.74ms   p(95)=3.92ms   p(99.9)=114.06ms
     http_req_sending...............: avg=55.63µs  min=5.27µs  med=9.89µs   max=166.92ms p(90)=18.37µs  p(95)=117.61µs p(99.9)=7.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.4ms  min=1.7ms   med=115.42ms max=896.3ms  p(90)=229.52ms p(95)=254.15ms p(99.9)=685.13ms
     http_reqs......................: 114980  1846.704044/s
     iteration_duration.............: avg=125.19ms min=3.13ms  med=118.39ms max=896.61ms p(90)=232.37ms p(95)=257.72ms p(99.9)=688.7ms 
     iterations.....................: 113980  1830.642954/s
     success_rate...................: 100.00% ✓ 113980      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 209745      ✗ 0    
     data_received..................: 6.2 GB  93 MB/s
     data_sent......................: 85 MB   1.3 MB/s
     http_req_blocked...............: avg=6.65µs   min=1.01µs  med=2.63µs   max=8.24ms   p(90)=4.41µs   p(95)=5.41µs   p(99.9)=704.66µs
     http_req_connecting............: avg=3.27µs   min=0s      med=0s       max=8.2ms    p(90)=0s       p(95)=0s       p(99.9)=648.03µs
     http_req_duration..............: avg=200.73ms min=2.12ms  med=200.29ms max=539.06ms p(90)=374.17ms p(95)=400.83ms p(99.9)=480.92ms
       { expected_response:true }...: avg=200.73ms min=2.12ms  med=200.29ms max=539.06ms p(90)=374.17ms p(95)=400.83ms p(99.9)=480.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70915
     http_req_receiving.............: avg=85.69µs  min=29.55µs med=66.7µs   max=108.11ms p(90)=105.34µs p(95)=121.69µs p(99.9)=1.54ms  
     http_req_sending...............: avg=33.76µs  min=5.44µs  med=11.74µs  max=188.83ms p(90)=18.91µs  p(95)=22.76µs  p(99.9)=3.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.61ms min=2.05ms  med=200.17ms max=538.99ms p(90)=374.06ms p(95)=400.68ms p(99.9)=480.76ms
     http_reqs......................: 70915   1059.22065/s
     iteration_duration.............: avg=203.86ms min=5.88ms  med=203.49ms max=539.22ms p(90)=375.21ms p(95)=401.77ms p(99.9)=481.33ms
     iterations.....................: 69915   1044.284168/s
     success_rate...................: 100.00% ✓ 69915       ✗ 0    
     vus............................: 1       min=0         max=497
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 102009     ✗ 0    
     data_received..................: 3.1 GB  47 MB/s
     data_sent......................: 42 MB   649 kB/s
     http_req_blocked...............: avg=8.08µs   min=1.24µs  med=3.22µs   max=5.69ms   p(90)=5.01µs   p(95)=5.93µs   p(99.9)=732.7µs 
     http_req_connecting............: avg=3.87µs   min=0s      med=0s       max=5.61ms   p(90)=0s       p(95)=0s       p(99.9)=673.03µs
     http_req_duration..............: avg=409.95ms min=3.86ms  med=381ms    max=1.66s    p(90)=817.01ms p(95)=887.43ms p(99.9)=1.27s   
       { expected_response:true }...: avg=409.95ms min=3.86ms  med=381ms    max=1.66s    p(90)=817.01ms p(95)=887.43ms p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35003
     http_req_receiving.............: avg=92.87µs  min=33.73µs med=80.35µs  max=95.19ms  p(90)=117.34µs p(95)=131.56µs p(99.9)=947.34µs
     http_req_sending...............: avg=32.99µs  min=5.85µs  med=14.88µs  max=109.68ms p(90)=22.16µs  p(95)=25.44µs  p(99.9)=2.81ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=409.83ms min=3.74ms  med=380.87ms max=1.66s    p(90)=816.91ms p(95)=887.37ms p(99.9)=1.27s   
     http_reqs......................: 35003   540.801521/s
     iteration_duration.............: avg=422.24ms min=33.51ms med=395.25ms max=1.67s    p(90)=821.58ms p(95)=890.3ms  p(99.9)=1.27s   
     iterations.....................: 34003   525.351374/s
     success_rate...................: 100.00% ✓ 34003      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 47292      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   298 kB/s
     http_req_blocked...............: avg=14.48µs  min=1.25µs  med=3.72µs   max=3.76ms  p(90)=5.69µs   p(95)=7.28µs   p(99.9)=2.46ms
     http_req_connecting............: avg=8.96µs   min=0s      med=0s       max=3.73ms  p(90)=0s       p(95)=0s       p(99.9)=2.43ms
     http_req_duration..............: avg=867.4ms  min=5.95ms  med=788.89ms max=4.78s   p(90)=1.74s    p(95)=1.93s    p(99.9)=4.03s 
       { expected_response:true }...: avg=867.4ms  min=5.95ms  med=788.89ms max=4.78s   p(90)=1.74s    p(95)=1.93s    p(99.9)=4.03s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16764
     http_req_receiving.............: avg=116.69µs min=37.19µs med=100.37µs max=80.52ms p(90)=141.02µs p(95)=154.23µs p(99.9)=1.31ms
     http_req_sending...............: avg=39.8µs   min=6.3µs   med=18.5µs   max=39.71ms p(90)=24.64µs  p(95)=29.24µs  p(99.9)=5.4ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=867.24ms min=5.83ms  med=788.74ms max=4.78s   p(90)=1.74s    p(95)=1.93s    p(99.9)=4.03s 
     http_reqs......................: 16764   247.897901/s
     iteration_duration.............: avg=922.49ms min=23.31ms med=854.35ms max=4.8s    p(90)=1.76s    p(95)=1.94s    p(99.9)=4.05s 
     iterations.....................: 15764   233.110386/s
     success_rate...................: 100.00% ✓ 15764      ✗ 0    
     vus............................: 80      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40641      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   250 kB/s
     http_req_blocked...............: avg=14.19µs min=1.19µs  med=3.41µs   max=3.44ms  p(90)=5.09µs   p(95)=6.7µs    p(99.9)=2.16ms  
     http_req_connecting............: avg=9µs     min=0s      med=0s       max=3.41ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=1s      min=8.63ms  med=914.88ms max=3.96s   p(90)=2.02s    p(95)=2.16s    p(99.9)=3.62s   
       { expected_response:true }...: avg=1s      min=8.63ms  med=914.88ms max=3.96s   p(90)=2.02s    p(95)=2.16s    p(99.9)=3.62s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14547
     http_req_receiving.............: avg=99.26µs min=33.33µs med=92.62µs  max=8.91ms  p(90)=133.35µs p(95)=144.55µs p(99.9)=901.98µs
     http_req_sending...............: avg=26.22µs min=5.66µs  med=16.98µs  max=16.97ms p(90)=22.53µs  p(95)=27.76µs  p(99.9)=2.25ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s      min=8.51ms  med=914.78ms max=3.96s   p(90)=2.02s    p(95)=2.16s    p(99.9)=3.62s   
     http_reqs......................: 14547   208.66832/s
     iteration_duration.............: avg=1.07s   min=29.15ms med=1s       max=3.97s   p(90)=2.04s    p(95)=2.17s    p(99.9)=3.64s   
     iterations.....................: 13547   194.323897/s
     success_rate...................: 100.00% ✓ 13547      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

