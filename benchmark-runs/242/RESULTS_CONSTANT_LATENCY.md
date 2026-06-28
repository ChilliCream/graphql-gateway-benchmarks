## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.4.0-p.5 | 1,560 | 1,580 | 1,552 | 0.5% |  |
| hive-router | v0.0.72 | 1,558 | 1,588 | 1,549 | 0.9% |  |
| fusion | 16.3.0 | 1,544 | 1,561 | 1,541 | 0.4% |  |
| grafbase | 0.53.5 | 1,111 | 1,133 | 1,101 | 0.9% |  |
| cosmo | 0.326.0 | 1,098 | 1,117 | 1,091 | 0.7% |  |
| hive-gateway-router-runtime | 2.9.0 | 519 | 536 | 516 | 1.3% |  |
| apollo-router | v2.15.1 | 408 | 418 | 406 | 1.0% |  |
| hive-gateway | 2.9.0 | 236 | 241 | 234 | 1.0% |  |
| apollo-gateway | 2.14.1 | 233 | 236 | 231 | 0.7% |  |
| feddi | 77271dc84a06 | 12 | 12 | 12 | 0.0% | non-compatible response (1 across 1/9 runs) |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 570930      ✗ 0     
     data_received..................: 17 GB   137 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.12µs   min=982ns   med=2.05µs  max=8.76ms   p(90)=3.82µs  p(95)=4.7µs    p(99.9)=40.03µs
     http_req_connecting............: avg=518ns    min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.27ms  min=14.49ms med=30.75ms max=317.69ms p(90)=38.4ms  p(95)=40.94ms  p(99.9)=58.9ms 
       { expected_response:true }...: avg=31.27ms  min=14.49ms med=30.75ms max=317.69ms p(90)=38.4ms  p(95)=40.94ms  p(99.9)=58.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 190410
     http_req_receiving.............: avg=606.45µs min=50.95µs med=110.2µs max=110.96ms p(90)=1.74ms  p(95)=2.66ms   p(99.9)=12.56ms
     http_req_sending...............: avg=34.6µs   min=5.11µs  med=9.09µs  max=114.96ms p(90)=19.74µs p(95)=101.21µs p(99.9)=1.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.63ms  min=13.65ms med=30.13ms max=316.89ms p(90)=37.58ms p(95)=40.04ms  p(99.9)=56.85ms
     http_reqs......................: 190410  1560.840963/s
     iteration_duration.............: avg=31.52ms  min=14.69ms med=30.97ms max=357.42ms p(90)=38.62ms p(95)=41.16ms  p(99.9)=59.32ms
     iterations.....................: 190310  1560.021236/s
     success_rate...................: 100.00% ✓ 190310      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 570252      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 229 MB  1.9 MB/s
     http_req_blocked...............: avg=3.31µs  min=942ns   med=2.33µs  max=4.09ms   p(90)=4.25µs   p(95)=5.15µs   p(99.9)=37.82µs
     http_req_connecting............: avg=489ns   min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.31ms min=13.87ms med=31.03ms max=315.89ms p(90)=37.31ms  p(95)=39.28ms  p(99.9)=57.92ms
       { expected_response:true }...: avg=31.31ms min=13.87ms med=31.03ms max=315.89ms p(90)=37.31ms  p(95)=39.28ms  p(99.9)=57.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 190184
     http_req_receiving.............: avg=84.88µs min=27.87µs med=54.26µs max=185.94ms p(90)=105.21µs p(95)=148.41µs p(99.9)=2.28ms 
     http_req_sending...............: avg=33.84µs min=5.18µs  med=9.73µs  max=168.32ms p(90)=19.74µs  p(95)=31.77µs  p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.19ms min=13.8ms  med=30.92ms max=315.22ms p(90)=37.2ms   p(95)=39.15ms  p(99.9)=56.76ms
     http_reqs......................: 190184  1558.729215/s
     iteration_duration.............: avg=31.55ms min=14.11ms med=31.25ms max=349.98ms p(90)=37.53ms  p(95)=39.49ms  p(99.9)=58.36ms
     iterations.....................: 190084  1557.909625/s
     success_rate...................: 100.00% ✓ 190084      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 565149      ✗ 0     
     data_received..................: 17 GB   135 MB/s
     data_sent......................: 227 MB  1.9 MB/s
     http_req_blocked...............: avg=3.31µs   min=962ns   med=2.33µs   max=3.83ms   p(90)=4.21µs  p(95)=5.08µs   p(99.9)=36.19µs
     http_req_connecting............: avg=508ns    min=0s      med=0s       max=3.77ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.59ms  min=14.17ms med=31.04ms  max=345.31ms p(90)=38.79ms p(95)=41.42ms  p(99.9)=61.97ms
       { expected_response:true }...: avg=31.59ms  min=14.17ms med=31.04ms  max=345.31ms p(90)=38.79ms p(95)=41.42ms  p(99.9)=61.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 188483
     http_req_receiving.............: avg=614.52µs min=50.57µs med=112.83µs max=36.28ms  p(90)=1.73ms  p(95)=2.69ms   p(99.9)=15.14ms
     http_req_sending...............: avg=41.27µs  min=5.2µs   med=9.7µs    max=162.5ms  p(90)=20.62µs p(95)=106.31µs p(99.9)=2.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.94ms  min=14.04ms med=30.42ms  max=344.54ms p(90)=37.92ms p(95)=40.45ms  p(99.9)=60ms   
     http_reqs......................: 188483  1544.767466/s
     iteration_duration.............: avg=31.84ms  min=14.47ms med=31.27ms  max=355.81ms p(90)=39.01ms p(95)=41.65ms  p(99.9)=62.59ms
     iterations.....................: 188383  1543.947887/s
     success_rate...................: 100.00% ✓ 188383      ✗ 0     
     vus............................: 48      min=0         max=50  
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

     checks.........................: 100.00% ✓ 406782      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=3.58µs  min=981ns   med=2.25µs  max=4.03ms   p(90)=4.75µs   p(95)=5.96µs   p(99.9)=46.9µs 
     http_req_connecting............: avg=675ns   min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.96ms min=16.94ms med=43.48ms max=327.67ms p(90)=53.39ms  p(95)=56.69ms  p(99.9)=83.08ms
       { expected_response:true }...: avg=43.96ms min=16.94ms med=43.48ms max=327.67ms p(90)=53.39ms  p(95)=56.69ms  p(99.9)=83.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135694
     http_req_receiving.............: avg=95.06µs min=30.07µs med=60.33µs max=26.48ms  p(90)=133.08µs p(95)=204.7µs  p(99.9)=2.69ms 
     http_req_sending...............: avg=36.9µs  min=5.41µs  med=10.06µs max=93.02ms  p(90)=24.14µs  p(95)=111.28µs p(99.9)=2.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.83ms min=16.62ms med=43.36ms max=326.7ms  p(90)=53.25ms  p(95)=56.53ms  p(99.9)=82.51ms
     http_reqs......................: 135694  1111.963002/s
     iteration_duration.............: avg=44.24ms min=17.2ms  med=43.73ms max=352.94ms p(90)=53.63ms  p(95)=56.92ms  p(99.9)=83.65ms
     iterations.....................: 135594  1111.143539/s
     success_rate...................: 100.00% ✓ 135594      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 401940      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 161 MB  1.3 MB/s
     http_req_blocked...............: avg=3.76µs  min=1.04µs  med=2.62µs  max=3.98ms   p(90)=4.4µs   p(95)=5.15µs   p(99.9)=38.29µs
     http_req_connecting............: avg=750ns   min=0s      med=0s      max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.52ms min=19.53ms med=43.92ms max=333.42ms p(90)=54.15ms p(95)=57.45ms  p(99.9)=74.79ms
       { expected_response:true }...: avg=44.52ms min=19.53ms med=43.92ms max=333.42ms p(90)=54.15ms p(95)=57.45ms  p(99.9)=74.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134080
     http_req_receiving.............: avg=92.68µs min=29.11µs med=69.41µs max=264.18ms p(90)=116.2µs p(95)=142.89µs p(99.9)=1.85ms 
     http_req_sending...............: avg=28.55µs min=5.33µs  med=11.37µs max=151.93ms p(90)=19.21µs p(95)=24.2µs   p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=44.4ms  min=19.42ms med=43.8ms  max=332.84ms p(90)=54.03ms p(95)=57.31ms  p(99.9)=74.33ms
     http_reqs......................: 134080  1098.66431/s
     iteration_duration.............: avg=44.77ms min=21.79ms med=44.14ms max=361.32ms p(90)=54.36ms p(95)=57.66ms  p(99.9)=75.48ms
     iterations.....................: 133980  1097.844901/s
     success_rate...................: 100.00% ✓ 133980      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 190614     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 76 MB   624 kB/s
     http_req_blocked...............: avg=4.47µs  min=1.13µs  med=3.12µs  max=3.62ms   p(90)=4.72µs   p(95)=5.37µs   p(99.9)=48.11µs 
     http_req_connecting............: avg=1.1µs   min=0s      med=0s      max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.1ms  min=19.46ms med=90.11ms max=355.23ms p(90)=119ms    p(95)=128.34ms p(99.9)=236.68ms
       { expected_response:true }...: avg=94.1ms  min=19.46ms med=90.11ms max=355.23ms p(90)=119ms    p(95)=128.34ms p(99.9)=236.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63638
     http_req_receiving.............: avg=88.39µs min=29.7µs  med=78.71µs max=48.55ms  p(90)=115.1µs  p(95)=129.61µs p(99.9)=830.68µs
     http_req_sending...............: avg=25.79µs min=5.68µs  med=13.97µs max=98.79ms  p(90)=20.89µs  p(95)=23.42µs  p(99.9)=763.46µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.98ms min=19.29ms med=90ms    max=345.17ms p(90)=118.89ms p(95)=128.23ms p(99.9)=236.56ms
     http_reqs......................: 63638   519.727973/s
     iteration_duration.............: avg=94.45ms min=37.21ms med=90.37ms max=376.3ms  p(90)=119.24ms p(95)=128.6ms  p(99.9)=238.22ms
     iterations.....................: 63538   518.911278/s
     success_rate...................: 100.00% ✓ 63538      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 149922     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   491 kB/s
     http_req_blocked...............: avg=4.96µs   min=1.09µs  med=3.54µs   max=3.22ms   p(90)=5.1µs    p(95)=5.71µs   p(99.9)=93.21µs 
     http_req_connecting............: avg=1.21µs   min=0s      med=0s       max=3.19ms   p(90)=0s       p(95)=0s       p(99.9)=53.67µs 
     http_req_duration..............: avg=119.61ms min=21.09ms med=117.82ms max=349.52ms p(90)=148.91ms p(95)=158.66ms p(99.9)=207.63ms
       { expected_response:true }...: avg=119.61ms min=21.09ms med=117.82ms max=349.52ms p(90)=148.91ms p(95)=158.66ms p(99.9)=207.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50074
     http_req_receiving.............: avg=96.79µs  min=30.6µs  med=85.35µs  max=150.85ms p(90)=119.41µs p(95)=132.43µs p(99.9)=820.18µs
     http_req_sending...............: avg=21.92µs  min=5.96µs  med=16.27µs  max=37.43ms  p(90)=22.23µs  p(95)=24.35µs  p(99.9)=630.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.49ms min=20.99ms med=117.72ms max=349.34ms p(90)=148.78ms p(95)=158.54ms p(99.9)=205.49ms
     http_reqs......................: 50074   408.957788/s
     iteration_duration.............: avg=120.09ms min=48.4ms  med=118.12ms max=360.13ms p(90)=149.17ms p(95)=158.96ms p(99.9)=210.69ms
     iterations.....................: 49974   408.141081/s
     success_rate...................: 100.00% ✓ 49974      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86502      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=7.74µs   min=1.26µs  med=3.63µs   max=4.18ms   p(90)=5.13µs   p(95)=5.75µs   p(99.9)=2.05ms  
     http_req_connecting............: avg=3.86µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=2.02ms  
     http_req_duration..............: avg=207.27ms min=19.34ms med=193.57ms max=672.96ms p(90)=236.69ms p(95)=276.84ms p(99.9)=627.63ms
       { expected_response:true }...: avg=207.27ms min=19.34ms med=193.57ms max=672.96ms p(90)=236.69ms p(95)=276.84ms p(99.9)=627.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28934
     http_req_receiving.............: avg=105.1µs  min=34.02µs med=96.93µs  max=67.41ms  p(90)=130.81µs p(95)=144.85µs p(99.9)=675.1µs 
     http_req_sending...............: avg=29.23µs  min=5.85µs  med=17.76µs  max=105.1ms  p(90)=23µs     p(95)=24.87µs  p(99.9)=502.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.14ms min=19.17ms med=193.46ms max=672.86ms p(90)=236.58ms p(95)=275.26ms p(99.9)=627.55ms
     http_reqs......................: 28934   236.630874/s
     iteration_duration.............: avg=208.23ms min=53.77ms med=194ms    max=673.14ms p(90)=237.08ms p(95)=280.41ms p(99.9)=627.87ms
     iterations.....................: 28834   235.813044/s
     success_rate...................: 100.00% ✓ 28834      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 85854      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=7.59µs   min=1.32µs  med=3.54µs   max=4.84ms   p(90)=4.93µs   p(95)=5.55µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.8µs    min=0s      med=0s       max=4.79ms   p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=208.91ms min=23.78ms med=208.92ms max=433.6ms  p(90)=223.27ms p(95)=228.38ms p(99.9)=307.68ms
       { expected_response:true }...: avg=208.91ms min=23.78ms med=208.92ms max=433.6ms  p(90)=223.27ms p(95)=228.38ms p(99.9)=307.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28718
     http_req_receiving.............: avg=193.03µs min=32.81µs med=91.31µs  max=238.77ms p(90)=125.23µs p(95)=138µs    p(99.9)=23.45ms 
     http_req_sending...............: avg=30.45µs  min=6.2µs   med=17.03µs  max=208.22ms p(90)=22.43µs  p(95)=24.53µs  p(99.9)=627.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.69ms min=23.62ms med=208.81ms max=317.4ms  p(90)=223.15ms p(95)=228.23ms p(99.9)=306.54ms
     http_reqs......................: 28718   233.735133/s
     iteration_duration.............: avg=209.85ms min=36.47ms med=209.23ms max=469.58ms p(90)=223.53ms p(95)=228.66ms p(99.9)=318.73ms
     iterations.....................: 28618   232.921235/s
     success_rate...................: 100.00% ✓ 28618      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 4566      ✗ 0   
     data_received..................: 155 MB  1.2 MB/s
     data_sent......................: 1.9 MB  15 kB/s
     http_req_blocked...............: avg=57.65µs min=1.47µs  med=3.45µs   max=4.1ms  p(90)=4.89µs   p(95)=6.41µs   p(99.9)=3.93ms 
     http_req_connecting............: avg=53.28µs min=0s      med=0s       max=4.08ms p(90)=0s       p(95)=0s       p(99.9)=3.9ms  
     http_req_duration..............: avg=3.75s   min=60.25ms med=3.89s    max=6.1s   p(90)=4.73s    p(95)=5.03s    p(99.9)=5.97s  
       { expected_response:true }...: avg=3.75s   min=60.25ms med=3.89s    max=6.1s   p(90)=4.73s    p(95)=5.03s    p(99.9)=5.97s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 1622
     http_req_receiving.............: avg=105µs   min=43.64µs med=100.41µs max=2.22ms p(90)=144.45µs p(95)=158.44µs p(99.9)=876.3µs
     http_req_sending...............: avg=60.14µs min=7.06µs  med=18.7µs   max=8.91ms p(90)=23.83µs  p(95)=30.13µs  p(99.9)=6.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=3.75s   min=60.09ms med=3.89s    max=6.1s   p(90)=4.73s    p(95)=5.03s    p(99.9)=5.97s  
     http_reqs......................: 1622    12.566702/s
     iteration_duration.............: avg=4s      min=2.12s   med=3.94s    max=6.1s   p(90)=4.77s    p(95)=5.05s    p(99.9)=5.98s  
     iterations.....................: 1522    11.791936/s
     success_rate...................: 100.00% ✓ 1522      ✗ 0   
     vus............................: 9       min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

