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
| hive-router | v0.0.65 | 2,831 | 3,033 | 2,748 | 3.3% |  |
| hotchocolate | 16.1.3 | 2,128 | 2,206 | 2,104 | 1.6% |  |
| grafbase | 0.53.5 | 2,097 | 2,158 | 2,069 | 1.4% |  |
| cosmo | 0.321.1 | 1,181 | 1,209 | 1,172 | 1.3% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 559 | 572 | 552 | 1.2% |  |
| apollo-router | v2.15.0 | 441 | 452 | 436 | 1.3% |  |
| hive-gateway | 2.8.2 | 247 | 253 | 245 | 1.2% |  |
| apollo-gateway | 2.14.1 | 243 | 247 | 241 | 0.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,306 | 2,459 | 2,280 | 2.6% |  |
| hotchocolate | 16.1.3 | 1,925 | 1,980 | 1,901 | 1.3% |  |
| grafbase | 0.53.5 | 1,520 | 1,557 | 1,505 | 1.2% |  |
| cosmo | 0.321.1 | 1,135 | 1,156 | 1,131 | 0.9% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 525 | 540 | 517 | 1.5% |  |
| apollo-router | v2.15.0 | 379 | 392 | 373 | 1.7% |  |
| apollo-gateway | 2.14.1 | 238 | 241 | 235 | 0.8% |  |
| hive-gateway | 2.8.2 | 237 | 241 | 235 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1020861     ✗ 0     
     data_received..................: 30 GB   248 MB/s
     data_sent......................: 409 MB  3.4 MB/s
     http_req_blocked...............: avg=3.33µs   min=1.09µs  med=2.49µs  max=24.85ms  p(90)=3.77µs   p(95)=4.45µs   p(99.9)=35.95µs
     http_req_connecting............: avg=304ns    min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.38ms  min=1.77ms  med=16.48ms max=319.05ms p(90)=25.53ms  p(95)=29.27ms  p(99.9)=53.18ms
       { expected_response:true }...: avg=17.38ms  min=1.77ms  med=16.48ms max=319.05ms p(90)=25.53ms  p(95)=29.27ms  p(99.9)=53.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 340387
     http_req_receiving.............: avg=136.88µs min=29.07µs med=54.22µs max=260.64ms p(90)=107.78µs p(95)=290.84µs p(99.9)=12.96ms
     http_req_sending...............: avg=59.31µs  min=5.53µs  med=9.91µs  max=151.2ms  p(90)=17.39µs  p(95)=130.75µs p(99.9)=7.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.19ms  min=1.7ms   med=16.33ms max=295.76ms p(90)=25.26ms  p(95)=28.88ms  p(99.9)=51.74ms
     http_reqs......................: 340387  2831.429304/s
     iteration_duration.............: avg=17.62ms  min=2.23ms  med=16.7ms  max=331.98ms p(90)=25.76ms  p(95)=29.53ms  p(99.9)=54.48ms
     iterations.....................: 340287  2830.597478/s
     success_rate...................: 100.00% ✓ 340287      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 767775      ✗ 0     
     data_received..................: 22 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=3.31µs   min=1.1µs   med=2.44µs   max=9.07ms   p(90)=3.63µs   p(95)=4.23µs   p(99.9)=36.02µs 
     http_req_connecting............: avg=424ns    min=0s      med=0s       max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.2ms   min=2.43ms  med=14.83ms  max=302.84ms p(90)=51.45ms  p(95)=70.2ms   p(99.9)=166.2ms 
       { expected_response:true }...: avg=23.2ms   min=2.43ms  med=14.83ms  max=302.84ms p(90)=51.45ms  p(95)=70.2ms   p(99.9)=166.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 256025
     http_req_receiving.............: avg=646.68µs min=51.67µs med=107.96µs max=194.17ms p(90)=965.08µs p(95)=1.5ms    p(99.9)=59.91ms 
     http_req_sending...............: avg=45.95µs  min=5.31µs  med=9.61µs   max=126.6ms  p(90)=16.02µs  p(95)=109.82µs p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.5ms   min=2.35ms  med=14.3ms   max=302.28ms p(90)=50.09ms  p(95)=68.78ms  p(99.9)=163.86ms
     http_reqs......................: 256025  2128.164966/s
     iteration_duration.............: avg=23.43ms  min=2.84ms  med=15.05ms  max=351.86ms p(90)=51.7ms   p(95)=70.44ms  p(99.9)=167.57ms
     iterations.....................: 255925  2127.333733/s
     success_rate...................: 100.00% ✓ 255925      ✗ 0     
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

     checks.........................: 100.00% ✓ 756411      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=4.14µs   min=1.09µs med=2.79µs  max=65.96ms  p(90)=4.4µs    p(95)=5.23µs   p(99.9)=46.71µs
     http_req_connecting............: avg=411ns    min=0s     med=0s      max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.54ms  min=1.99ms med=23.29ms max=327.58ms p(90)=28.46ms  p(95)=31.07ms  p(99.9)=53.9ms 
       { expected_response:true }...: avg=23.54ms  min=1.99ms med=23.29ms max=327.58ms p(90)=28.46ms  p(95)=31.07ms  p(99.9)=53.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 252237
     http_req_receiving.............: avg=121.53µs min=29.7µs med=59.56µs max=133.22ms p(90)=106.38µs p(95)=240.7µs  p(99.9)=10.54ms
     http_req_sending...............: avg=49.71µs  min=4.93µs med=10.97µs max=125.48ms p(90)=19.39µs  p(95)=128.72µs p(99.9)=4.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.37ms  min=1.88ms med=23.16ms max=326.79ms p(90)=28.26ms  p(95)=30.76ms  p(99.9)=52.32ms
     http_reqs......................: 252237  2097.325728/s
     iteration_duration.............: avg=23.79ms  min=3.71ms med=23.5ms  max=342.96ms p(90)=28.69ms  p(95)=31.33ms  p(99.9)=54.89ms
     iterations.....................: 252137  2096.494238/s
     success_rate...................: 100.00% ✓ 252137      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 425907      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.11µs  min=1.03µs  med=2.47µs  max=3.2ms    p(90)=3.73µs  p(95)=4.32µs   p(99.9)=36.35µs
     http_req_connecting............: avg=320ns   min=0s      med=0s      max=2.42ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.02ms min=2.08ms  med=41.45ms max=340.7ms  p(90)=59.3ms  p(95)=64.63ms  p(99.9)=91.81ms
       { expected_response:true }...: avg=42.02ms min=2.08ms  med=41.45ms max=340.7ms  p(90)=59.3ms  p(95)=64.63ms  p(99.9)=91.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142069
     http_req_receiving.............: avg=80.7µs  min=28.75µs med=61.99µs max=27.53ms  p(90)=95.89µs p(95)=112.31µs p(99.9)=2.08ms 
     http_req_sending...............: avg=26.81µs min=5.34µs  med=10.55µs max=174.62ms p(90)=15.41µs p(95)=19.22µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.91ms min=2.02ms  med=41.35ms max=340.29ms p(90)=59.18ms p(95)=64.5ms   p(99.9)=91.46ms
     http_reqs......................: 142069  1181.159409/s
     iteration_duration.............: avg=42.25ms min=4.04ms  med=41.65ms max=351.6ms  p(90)=59.5ms  p(95)=64.84ms  p(99.9)=92.49ms
     iterations.....................: 141969  1180.328011/s
     success_rate...................: 100.00% ✓ 141969      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 202125     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   672 kB/s
     http_req_blocked...............: avg=5.14µs  min=1.21µs  med=3.24µs  max=4.04ms   p(90)=4.76µs   p(95)=5.39µs   p(99.9)=43.16µs 
     http_req_connecting............: avg=1.63µs  min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.69ms min=3.99ms  med=86.55ms max=351.29ms p(90)=107.79ms p(95)=118.53ms p(99.9)=219.07ms
       { expected_response:true }...: avg=88.69ms min=3.99ms  med=86.55ms max=351.29ms p(90)=107.79ms p(95)=118.53ms p(99.9)=219.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67475
     http_req_receiving.............: avg=90.32µs min=32.55µs med=78.29µs max=115.74ms p(90)=113.51µs p(95)=126.56µs p(99.9)=916.39µs
     http_req_sending...............: avg=22.15µs min=5.67µs  med=13.69µs max=66.75ms  p(90)=20.51µs  p(95)=22.86µs  p(99.9)=651.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.57ms min=3.93ms  med=86.44ms max=350.71ms p(90)=107.67ms p(95)=118.4ms  p(99.9)=218.91ms
     http_reqs......................: 67475   559.795799/s
     iteration_duration.............: avg=89.06ms min=22.39ms med=86.79ms max=368.27ms p(90)=108.04ms p(95)=118.82ms p(99.9)=221.72ms
     iterations.....................: 67375   558.966164/s
     success_rate...................: 100.00% ✓ 67375      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 159468     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   530 kB/s
     http_req_blocked...............: avg=5.71µs   min=1.27µs  med=3.46µs   max=4.06ms   p(90)=4.87µs   p(95)=5.44µs   p(99.9)=104.98µs
     http_req_connecting............: avg=2.06µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.43ms min=5.18ms  med=112.18ms max=373.74ms p(90)=135.58ms p(95)=142.76ms p(99.9)=180.81ms
       { expected_response:true }...: avg=112.43ms min=5.18ms  med=112.18ms max=373.74ms p(90)=135.58ms p(95)=142.76ms p(99.9)=180.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53256
     http_req_receiving.............: avg=108.4µs  min=30.71µs med=84.03µs  max=135.41ms p(90)=115.74µs p(95)=127.9µs  p(99.9)=852.85µs
     http_req_sending...............: avg=30.88µs  min=6.09µs  med=15.73µs  max=148.06ms p(90)=21.36µs  p(95)=23.2µs   p(99.9)=613.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.29ms min=5.06ms  med=112.07ms max=373.27ms p(90)=135.44ms p(95)=142.59ms p(99.9)=177.94ms
     http_reqs......................: 53256   441.319524/s
     iteration_duration.............: avg=112.9ms  min=25.63ms med=112.45ms max=384.55ms p(90)=135.86ms p(95)=143.02ms p(99.9)=184.1ms 
     iterations.....................: 53156   440.490848/s
     success_rate...................: 100.00% ✓ 53156      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89652      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=5.41µs   min=1.24µs  med=3.63µs   max=2.01ms   p(90)=5.03µs   p(95)=5.61µs   p(99.9)=797.22µs
     http_req_connecting............: avg=1.6µs    min=0s      med=0s       max=1.99ms   p(90)=0s       p(95)=0s       p(99.9)=775.97µs
     http_req_duration..............: avg=200.03ms min=6.4ms   med=203.83ms max=789.43ms p(90)=265.78ms p(95)=335.09ms p(99.9)=651.77ms
       { expected_response:true }...: avg=200.03ms min=6.4ms   med=203.83ms max=789.43ms p(90)=265.78ms p(95)=335.09ms p(99.9)=651.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29984
     http_req_receiving.............: avg=103.66µs min=35.61µs med=95.7µs   max=56.59ms  p(90)=127.33µs p(95)=141.28µs p(99.9)=667.12µs
     http_req_sending...............: avg=23.17µs  min=5.96µs  med=18.12µs  max=33.17ms  p(90)=23.01µs  p(95)=24.96µs  p(99.9)=536.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.9ms  min=6.26ms  med=203.72ms max=789.29ms p(90)=265.66ms p(95)=335.01ms p(99.9)=651.67ms
     http_reqs......................: 29984   247.69666/s
     iteration_duration.............: avg=200.95ms min=46.68ms med=204.38ms max=789.69ms p(90)=266.12ms p(95)=336.82ms p(99.9)=652.08ms
     iterations.....................: 29884   246.870564/s
     success_rate...................: 100.00% ✓ 29884      ✗ 0    
     vus............................: 11      min=11       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88290      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=6.83µs   min=1.28µs  med=3.3µs    max=4.03ms   p(90)=4.54µs   p(95)=5.04µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.29µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=203.04ms min=8.56ms  med=218.01ms max=417.39ms p(90)=244.73ms p(95)=250.24ms p(99.9)=326.06ms
       { expected_response:true }...: avg=203.04ms min=8.56ms  med=218.01ms max=417.39ms p(90)=244.73ms p(95)=250.24ms p(99.9)=326.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29530
     http_req_receiving.............: avg=100.54µs min=31.11µs med=88.8µs   max=107.94ms p(90)=120.4µs  p(95)=132.52µs p(99.9)=814.02µs
     http_req_sending...............: avg=29.26µs  min=6.09µs  med=16.02µs  max=66.95ms  p(90)=20.65µs  p(95)=22.48µs  p(99.9)=633.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.92ms min=8.43ms  med=217.9ms  max=416.64ms p(90)=244.62ms p(95)=250.12ms p(99.9)=325.85ms
     http_reqs......................: 29530   243.866297/s
     iteration_duration.............: avg=204.01ms min=43.04ms med=218.47ms max=444.91ms p(90)=244.99ms p(95)=250.53ms p(99.9)=328.35ms
     iterations.....................: 29430   243.040472/s
     success_rate...................: 100.00% ✓ 29430      ✗ 0    
     vus............................: 39      min=39       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 831633      ✗ 0     
     data_received..................: 24 GB   202 MB/s
     data_sent......................: 333 MB  2.8 MB/s
     http_req_blocked...............: avg=3.55µs   min=1.07µs  med=2.7µs   max=14.45ms  p(90)=4.24µs   p(95)=5.04µs   p(99.9)=36.58µs
     http_req_connecting............: avg=217ns    min=0s      med=0s      max=3.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.39ms  min=1.75ms  med=20.92ms max=332.33ms p(90)=29.75ms  p(95)=32.92ms  p(99.9)=55.88ms
       { expected_response:true }...: avg=21.39ms  min=1.75ms  med=20.92ms max=332.33ms p(90)=29.75ms  p(95)=32.92ms  p(99.9)=55.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 277311
     http_req_receiving.............: avg=123.12µs min=29.77µs med=58.84µs max=91.89ms  p(90)=111.24µs p(95)=276.07µs p(99.9)=10.09ms
     http_req_sending...............: avg=55.07µs  min=5.32µs  med=10.72µs max=107.95ms p(90)=19.42µs  p(95)=130.88µs p(99.9)=5.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.21ms  min=1.65ms  med=20.77ms max=297.8ms  p(90)=29.54ms  p(95)=32.62ms  p(99.9)=54.55ms
     http_reqs......................: 277311  2306.669758/s
     iteration_duration.............: avg=21.63ms  min=3.84ms  med=21.14ms max=341.97ms p(90)=29.98ms  p(95)=33.17ms  p(99.9)=56.87ms
     iterations.....................: 277211  2305.837959/s
     success_rate...................: 100.00% ✓ 277211      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 694314      ✗ 0     
     data_received..................: 20 GB   169 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=3.36µs   min=1.07µs  med=2.67µs   max=11.72ms  p(90)=4.12µs  p(95)=4.85µs   p(99.9)=37.94µs 
     http_req_connecting............: avg=225ns    min=0s      med=0s       max=2.28ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.67ms  min=1.96ms  med=17.66ms  max=625.32ms p(90)=54.04ms p(95)=71.5ms   p(99.9)=192.16ms
       { expected_response:true }...: avg=25.67ms  min=1.96ms  med=17.66ms  max=625.32ms p(90)=54.04ms p(95)=71.5ms   p(99.9)=192.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231538
     http_req_receiving.............: avg=691.83µs min=52.81µs med=110.97µs max=271.97ms p(90)=1.15ms  p(95)=1.85ms   p(99.9)=57.61ms 
     http_req_sending...............: avg=44.86µs  min=5.44µs  med=10.37µs  max=130.12ms p(90)=18.67µs p(95)=112.72µs p(99.9)=3.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.93ms  min=1.82ms  med=17.08ms  max=624.32ms p(90)=52.71ms p(95)=70.02ms  p(99.9)=190.18ms
     http_reqs......................: 231538  1925.387072/s
     iteration_duration.............: avg=25.91ms  min=2.75ms  med=17.89ms  max=625.55ms p(90)=54.29ms p(95)=71.78ms  p(99.9)=195.51ms
     iterations.....................: 231438  1924.555508/s
     success_rate...................: 100.00% ✓ 231438      ✗ 0     
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

     checks.........................: 100.00% ✓ 548610      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.96µs   min=1µs    med=2.92µs  max=4.07ms   p(90)=5.27µs   p(95)=6.36µs   p(99.9)=47µs   
     http_req_connecting............: avg=478ns    min=0s     med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.52ms  min=2.51ms med=31.59ms max=316.94ms p(90)=43.17ms  p(95)=48.1ms   p(99.9)=84.32ms
       { expected_response:true }...: avg=32.52ms  min=2.51ms med=31.59ms max=316.94ms p(90)=43.17ms  p(95)=48.1ms   p(99.9)=84.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182970
     http_req_receiving.............: avg=116.44µs min=31.6µs med=66.52µs max=34.41ms  p(90)=138.92µs p(95)=284.25µs p(99.9)=5.39ms 
     http_req_sending...............: avg=50.28µs  min=5.41µs med=11.65µs max=172.5ms  p(90)=25.58µs  p(95)=138.18µs p(99.9)=3.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.36ms  min=2.39ms med=31.45ms max=315.77ms p(90)=42.98ms  p(95)=47.85ms  p(99.9)=84ms   
     http_reqs......................: 182970  1520.764194/s
     iteration_duration.............: avg=32.8ms   min=3.46ms med=31.84ms max=346.88ms p(90)=43.42ms  p(95)=48.36ms  p(99.9)=85.07ms
     iterations.....................: 182870  1519.933039/s
     success_rate...................: 100.00% ✓ 182870      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 409689      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 164 MB  1.4 MB/s
     http_req_blocked...............: avg=4.04µs  min=1.03µs  med=2.79µs  max=5.98ms   p(90)=4.3µs    p(95)=4.96µs   p(99.9)=38.44µs
     http_req_connecting............: avg=919ns   min=0s      med=0s      max=5.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.66ms min=2.4ms   med=43.13ms max=310.12ms p(90)=61.4ms   p(95)=66.91ms  p(99.9)=94.38ms
       { expected_response:true }...: avg=43.66ms min=2.4ms   med=43.13ms max=310.12ms p(90)=61.4ms   p(95)=66.91ms  p(99.9)=94.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136663
     http_req_receiving.............: avg=89.29µs min=29.81µs med=69.27µs max=139.13ms p(90)=108.23µs p(95)=126.98µs p(99.9)=1.62ms 
     http_req_sending...............: avg=30.69µs min=5.31µs  med=12.18µs max=283.24ms p(90)=18.93µs  p(95)=22.7µs   p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.54ms min=2.28ms  med=43.02ms max=309.24ms p(90)=61.28ms  p(95)=66.79ms  p(99.9)=93.88ms
     http_reqs......................: 136663  1135.992287/s
     iteration_duration.............: avg=43.92ms min=3.97ms  med=43.35ms max=345.52ms p(90)=61.62ms  p(95)=67.12ms  p(99.9)=94.91ms
     iterations.....................: 136563  1135.16105/s
     success_rate...................: 100.00% ✓ 136563      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 189711     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   631 kB/s
     http_req_blocked...............: avg=5.27µs  min=1.2µs   med=3.21µs  max=4.39ms   p(90)=4.69µs   p(95)=5.29µs   p(99.9)=45.74µs 
     http_req_connecting............: avg=1.78µs  min=0s      med=0s      max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.5ms  min=4.29ms  med=91.03ms max=357.05ms p(90)=115.55ms p(95)=128.17ms p(99.9)=228.25ms
       { expected_response:true }...: avg=94.5ms  min=4.29ms  med=91.03ms max=357.05ms p(90)=115.55ms p(95)=128.17ms p(99.9)=228.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63337
     http_req_receiving.............: avg=90.14µs min=32.03µs med=82.5µs  max=16.64ms  p(90)=116.51µs p(95)=129.74µs p(99.9)=948.41µs
     http_req_sending...............: avg=27.81µs min=5.44µs  med=14.09µs max=202.15ms p(90)=20.55µs  p(95)=22.69µs  p(99.9)=689.47µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.39ms min=4.17ms  med=90.92ms max=356.55ms p(90)=115.43ms p(95)=128.02ms p(99.9)=227.94ms
     http_reqs......................: 63337   525.254265/s
     iteration_duration.............: avg=94.9ms  min=10.84ms med=91.28ms max=373.59ms p(90)=115.82ms p(95)=128.54ms p(99.9)=230.54ms
     iterations.....................: 63237   524.424964/s
     success_rate...................: 100.00% ✓ 63237      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 137175     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   456 kB/s
     http_req_blocked...............: avg=5.99µs   min=1.27µs  med=3.48µs   max=4.33ms   p(90)=4.87µs   p(95)=5.41µs   p(99.9)=317.7µs 
     http_req_connecting............: avg=2.32µs   min=0s      med=0s       max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=281.27µs
     http_req_duration..............: avg=130.71ms min=5.68ms  med=128.44ms max=334.93ms p(90)=173.17ms p(95)=185.94ms p(99.9)=240.33ms
       { expected_response:true }...: avg=130.71ms min=5.68ms  med=128.44ms max=334.93ms p(90)=173.17ms p(95)=185.94ms p(99.9)=240.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45825
     http_req_receiving.............: avg=94.53µs  min=33.2µs  med=86.88µs  max=77.69ms  p(90)=118.72µs p(95)=130.96µs p(99.9)=786.39µs
     http_req_sending...............: avg=23.8µs   min=5.97µs  med=16.4µs   max=47.93ms  p(90)=22.04µs  p(95)=23.86µs  p(99.9)=610.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.59ms min=5.52ms  med=128.32ms max=332.54ms p(90)=173.04ms p(95)=185.81ms p(99.9)=240.24ms
     http_reqs......................: 45825   379.533808/s
     iteration_duration.............: avg=131.26ms min=28.59ms med=128.77ms max=360.4ms  p(90)=173.47ms p(95)=186.28ms p(99.9)=242.46ms
     iterations.....................: 45725   378.705584/s
     success_rate...................: 100.00% ✓ 45725      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86499      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.65µs   min=1.35µs  med=3.48µs   max=4.2ms    p(90)=4.8µs    p(95)=5.35µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=3.91µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=2.15ms  
     http_req_duration..............: avg=207.22ms min=8.76ms  med=206.71ms max=448.74ms p(90)=224.63ms p(95)=228.16ms p(99.9)=307.23ms
       { expected_response:true }...: avg=207.22ms min=8.76ms  med=206.71ms max=448.74ms p(90)=224.63ms p(95)=228.16ms p(99.9)=307.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28933
     http_req_receiving.............: avg=104.54µs min=34.69µs med=94.66µs  max=95.67ms  p(90)=126.77µs p(95)=139.8µs  p(99.9)=458.46µs
     http_req_sending...............: avg=29.33µs  min=5.94µs  med=17.61µs  max=86.13ms  p(90)=22.33µs  p(95)=24.09µs  p(99.9)=440.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.09ms min=8.64ms  med=206.59ms max=444.1ms  p(90)=224.51ms p(95)=228.03ms p(99.9)=307.12ms
     http_reqs......................: 28933   238.894159/s
     iteration_duration.............: avg=208.22ms min=48.37ms med=207.02ms max=455.97ms p(90)=224.92ms p(95)=228.45ms p(99.9)=311.06ms
     iterations.....................: 28833   238.068479/s
     success_rate...................: 100.00% ✓ 28833      ✗ 0    
     vus............................: 45      min=45       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85911      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.54µs   min=1.3µs   med=3.66µs   max=4.35ms   p(90)=5.08µs   p(95)=5.66µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=3.7µs    min=0s      med=0s       max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=208.64ms min=6.99ms  med=182.85ms max=825.23ms p(90)=274.06ms p(95)=324.56ms p(99.9)=657.4ms 
       { expected_response:true }...: avg=208.64ms min=6.99ms  med=182.85ms max=825.23ms p(90)=274.06ms p(95)=324.56ms p(99.9)=657.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28737
     http_req_receiving.............: avg=107.18µs min=32.95µs med=97.28µs  max=133.58ms p(90)=128.88µs p(95)=141.82µs p(99.9)=624.24µs
     http_req_sending...............: avg=39.45µs  min=6.01µs  med=18.49µs  max=115.77ms p(90)=23.3µs   p(95)=25.12µs  p(99.9)=829.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.5ms  min=6.85ms  med=182.74ms max=825.1ms  p(90)=273.9ms  p(95)=324.47ms p(99.9)=657.27ms
     http_reqs......................: 28737   237.47913/s
     iteration_duration.............: avg=209.67ms min=49.19ms med=183.36ms max=825.49ms p(90)=274.59ms p(95)=326.92ms p(99.9)=657.68ms
     iterations.....................: 28637   236.652742/s
     success_rate...................: 100.00% ✓ 28637      ✗ 0    
     vus............................: 5       min=5        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

