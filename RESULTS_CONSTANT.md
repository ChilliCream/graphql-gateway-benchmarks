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
| hive-router | v0.0.41 | 2,875 | 3,093 | 2,843 | 2.8% |  |
| grafbase | 0.53.2 | 2,087 | 2,143 | 2,062 | 1.3% |  |
| hotchocolate | 16.0.0-p.11.53 | 1,809 | 1,833 | 1,791 | 0.8% |  |
| cosmo | 0.291.0 | 1,282 | 1,304 | 1,273 | 0.8% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 525 | 537 | 520 | 1.2% |  |
| apollo-router | v2.12.0 | 432 | 443 | 428 | 1.2% |  |
| hive-gateway | 2.5.6 | 263 | 265 | 259 | 0.9% |  |
| apollo-gateway | 2.13.2 | 244 | 247 | 243 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,301 | 2,427 | 2,275 | 2.2% |  |
| hotchocolate | 16.0.0-p.11.53 | 1,678 | 1,713 | 1,668 | 1.0% |  |
| grafbase | 0.53.2 | 1,544 | 1,584 | 1,529 | 1.1% |  |
| cosmo | 0.291.0 | 1,221 | 1,244 | 1,215 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.6 | 499 | 514 | 495 | 1.2% |  |
| apollo-router | v2.12.0 | 398 | 408 | 390 | 1.3% |  |
| hive-gateway | 2.5.6 | 272 | 277 | 270 | 0.9% |  |
| apollo-gateway | 2.13.2 | 239 | 243 | 238 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1036443     ✗ 0     
     data_received..................: 30 GB   252 MB/s
     data_sent......................: 415 MB  3.5 MB/s
     http_req_blocked...............: avg=2.7µs    min=1.01µs  med=2.11µs  max=13.69ms  p(90)=3.24µs  p(95)=3.88µs   p(99.9)=28.92µs
     http_req_connecting............: avg=150ns    min=0s      med=0s      max=2.72ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.13ms  min=1.57ms  med=16.42ms max=340.76ms p(90)=24.72ms p(95)=28.09ms  p(99.9)=50.31ms
       { expected_response:true }...: avg=17.13ms  min=1.57ms  med=16.42ms max=340.76ms p(90)=24.72ms p(95)=28.09ms  p(99.9)=50.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 345581
     http_req_receiving.............: avg=116.95µs min=26.64µs med=49.91µs max=95.86ms  p(90)=97.93µs p(95)=266.13µs p(99.9)=10.46ms
     http_req_sending...............: avg=56.67µs  min=5.24µs  med=9.21µs  max=197.35ms p(90)=16.24µs p(95)=122.04µs p(99.9)=6.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.96ms  min=1.5ms   med=16.29ms max=339.73ms p(90)=24.49ms p(95)=27.76ms  p(99.9)=48.92ms
     http_reqs......................: 345581  2875.194006/s
     iteration_duration.............: avg=17.35ms  min=1.95ms  med=16.63ms max=351.42ms p(90)=24.94ms p(95)=28.33ms  p(99.9)=51.45ms
     iterations.....................: 345481  2874.362018/s
     success_rate...................: 100.00% ✓ 345481      ✗ 0     
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

     checks.........................: 100.00% ✓ 752787      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 302 MB  2.5 MB/s
     http_req_blocked...............: avg=3.23µs   min=1µs     med=2.2µs   max=18.79ms  p(90)=3.55µs  p(95)=4.3µs    p(99.9)=42.86µs
     http_req_connecting............: avg=359ns    min=0s      med=0s      max=3.86ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.66ms  min=1.99ms  med=23.42ms max=317.89ms p(90)=28.44ms p(95)=30.74ms  p(99.9)=53.41ms
       { expected_response:true }...: avg=23.66ms  min=1.99ms  med=23.42ms max=317.89ms p(90)=28.44ms p(95)=30.74ms  p(99.9)=53.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 251029
     http_req_receiving.............: avg=107.87µs min=29.16µs med=56.18µs max=36.8ms   p(90)=99.04µs p(95)=190.93µs p(99.9)=9.14ms 
     http_req_sending...............: avg=47.13µs  min=4.56µs  med=9.89µs  max=174.2ms  p(90)=17.11µs p(95)=115.86µs p(99.9)=3.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.51ms  min=1.88ms  med=23.3ms  max=316.72ms p(90)=28.26ms p(95)=30.48ms  p(99.9)=52.48ms
     http_reqs......................: 251029  2087.383895/s
     iteration_duration.............: avg=23.9ms   min=3.83ms  med=23.62ms max=340.47ms p(90)=28.66ms p(95)=30.98ms  p(99.9)=53.77ms
     iterations.....................: 250929  2086.552364/s
     success_rate...................: 100.00% ✓ 250929      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.53)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 653091      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 262 MB  2.2 MB/s
     http_req_blocked...............: avg=3.28µs   min=1.1µs   med=2.42µs   max=15.05ms  p(90)=3.54µs   p(95)=4.08µs  p(99.9)=34.76µs 
     http_req_connecting............: avg=463ns    min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=27.32ms  min=2.84ms  med=15.32ms  max=418.15ms p(90)=66.81ms  p(95)=87.24ms p(99.9)=193.8ms 
       { expected_response:true }...: avg=27.32ms  min=2.84ms  med=15.32ms  max=418.15ms p(90)=66.81ms  p(95)=87.24ms p(99.9)=193.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 217797
     http_req_receiving.............: avg=613.08µs min=51.86µs med=113.81µs max=201.65ms p(90)=743.92µs p(95)=1.12ms  p(99.9)=70.38ms 
     http_req_sending...............: avg=32.52µs  min=5.32µs  med=9.82µs   max=36.22ms  p(90)=14.88µs  p(95)=22.64µs p(99.9)=1.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=26.67ms  min=2.7ms   med=14.82ms  max=417.81ms p(90)=65.62ms  p(95)=86.07ms p(99.9)=190.83ms
     http_reqs......................: 217797  1809.804844/s
     iteration_duration.............: avg=27.55ms  min=3.51ms  med=15.53ms  max=418.3ms  p(90)=67.04ms  p(95)=87.49ms p(99.9)=196.19ms
     iterations.....................: 217697  1808.973884/s
     success_rate...................: 100.00% ✓ 217697      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 462615      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=3.07µs  min=1.08µs  med=2.11µs  max=4.26ms   p(90)=3.33µs  p(95)=3.92µs   p(99.9)=30.47µs
     http_req_connecting............: avg=671ns   min=0s      med=0s      max=4.21ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.67ms min=2.13ms  med=38.18ms max=327.67ms p(90)=54.57ms p(95)=59.53ms  p(99.9)=84.03ms
       { expected_response:true }...: avg=38.67ms min=2.13ms  med=38.18ms max=327.67ms p(90)=54.57ms p(95)=59.53ms  p(99.9)=84.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154305
     http_req_receiving.............: avg=76.88µs min=28.46µs med=59.17µs max=105.05ms p(90)=93.74µs p(95)=110.91µs p(99.9)=1.78ms 
     http_req_sending...............: avg=26.63µs min=5.14µs  med=9.95µs  max=198.1ms  p(90)=15.4µs  p(95)=19.23µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.57ms min=2.01ms  med=38.09ms max=307.1ms  p(90)=54.47ms p(95)=59.41ms  p(99.9)=83.75ms
     http_reqs......................: 154305  1282.946561/s
     iteration_duration.............: avg=38.9ms  min=3.65ms  med=38.38ms max=353ms    p(90)=54.77ms p(95)=59.72ms  p(99.9)=84.59ms
     iterations.....................: 154205  1282.115125/s
     success_rate...................: 100.00% ✓ 154205      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 189648     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 76 MB   631 kB/s
     http_req_blocked...............: avg=4.78µs   min=1.25µs  med=2.84µs  max=4.27ms   p(90)=4.3µs    p(95)=4.9µs    p(99.9)=55.72µs 
     http_req_connecting............: avg=1.66µs   min=0s      med=0s      max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.56ms  min=4.32ms  med=90.32ms max=359.3ms  p(90)=126.41ms p(95)=140.54ms p(99.9)=245.27ms
       { expected_response:true }...: avg=94.56ms  min=4.32ms  med=90.32ms max=359.3ms  p(90)=126.41ms p(95)=140.54ms p(99.9)=245.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63316
     http_req_receiving.............: avg=142.65µs min=31.48µs med=75.55µs max=211.06ms p(90)=109.36µs p(95)=121.75µs p(99.9)=1.17ms  
     http_req_sending...............: avg=26.04µs  min=5.85µs  med=12.95µs max=248.72ms p(90)=19.36µs  p(95)=21.65µs  p(99.9)=658.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.39ms  min=4.22ms  med=90.21ms max=271.26ms p(90)=126.29ms p(95)=140.43ms p(99.9)=239.36ms
     http_reqs......................: 63316   525.002589/s
     iteration_duration.............: avg=94.94ms  min=8.37ms  med=90.57ms max=376.17ms p(90)=126.67ms p(95)=140.85ms p(99.9)=246.44ms
     iterations.....................: 63216   524.173411/s
     success_rate...................: 100.00% ✓ 63216      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 156435     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   520 kB/s
     http_req_blocked...............: avg=5.33µs   min=1.19µs  med=3.43µs   max=3.81ms   p(90)=4.85µs   p(95)=5.41µs   p(99.9)=85.45µs 
     http_req_connecting............: avg=1.6µs    min=0s      med=0s       max=3.77ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.61ms min=5.41ms  med=114.43ms max=351.47ms p(90)=138.3ms  p(95)=145.55ms p(99.9)=181.43ms
       { expected_response:true }...: avg=114.61ms min=5.41ms  med=114.43ms max=351.47ms p(90)=138.3ms  p(95)=145.55ms p(99.9)=181.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52245
     http_req_receiving.............: avg=129.38µs min=33.13µs med=85.1µs   max=93.68ms  p(90)=116.06µs p(95)=128.01µs p(99.9)=1.17ms  
     http_req_sending...............: avg=28.06µs  min=5.77µs  med=15.81µs  max=109.27ms p(90)=21.21µs  p(95)=22.97µs  p(99.9)=883.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.45ms min=5.3ms   med=114.31ms max=276.49ms p(90)=138.15ms p(95)=145.38ms p(99.9)=179.31ms
     http_reqs......................: 52245   432.840934/s
     iteration_duration.............: avg=115.09ms min=8.61ms  med=114.71ms max=373.59ms p(90)=138.55ms p(95)=145.82ms p(99.9)=183.44ms
     iterations.....................: 52145   432.012451/s
     success_rate...................: 100.00% ✓ 52145      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95244      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.64µs   min=1.27µs  med=3.48µs   max=3.52ms   p(90)=4.93µs   p(95)=5.58µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=2.96µs   min=0s      med=0s       max=3.49ms   p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=188.18ms min=5.81ms  med=171.14ms max=643.04ms p(90)=246.25ms p(95)=405.93ms p(99.9)=548.04ms
       { expected_response:true }...: avg=188.18ms min=5.81ms  med=171.14ms max=643.04ms p(90)=246.25ms p(95)=405.93ms p(99.9)=548.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31848
     http_req_receiving.............: avg=101.85µs min=35.63µs med=94.8µs   max=96.61ms  p(90)=126.79µs p(95)=140.6µs  p(99.9)=577.74µs
     http_req_sending...............: avg=31.76µs  min=6.25µs  med=17.44µs  max=140.89ms p(90)=22.64µs  p(95)=24.5µs   p(99.9)=833.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.05ms min=5.65ms  med=171.01ms max=642.96ms p(90)=246.15ms p(95)=405.83ms p(99.9)=547.94ms
     http_reqs......................: 31848   263.403302/s
     iteration_duration.............: avg=189.07ms min=26.69ms med=171.64ms max=643.24ms p(90)=246.92ms p(95)=406.79ms p(99.9)=548.44ms
     iterations.....................: 31748   262.576238/s
     success_rate...................: 100.00% ✓ 31748      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88551      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=6.93µs   min=1.23µs  med=3.41µs   max=4.12ms   p(90)=4.68µs   p(95)=5.23µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=3.3µs    min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=202.43ms min=8.5ms   med=204.97ms max=429.55ms p(90)=221.28ms p(95)=230.7ms  p(99.9)=301.94ms
       { expected_response:true }...: avg=202.43ms min=8.5ms   med=204.97ms max=429.55ms p(90)=221.28ms p(95)=230.7ms  p(99.9)=301.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29617
     http_req_receiving.............: avg=99.28µs  min=31.64µs med=92.5µs   max=54.92ms  p(90)=124.09µs p(95)=137.2µs  p(99.9)=533.89µs
     http_req_sending...............: avg=35.75µs  min=5.9µs   med=16.96µs  max=218.76ms p(90)=21.69µs  p(95)=23.43µs  p(99.9)=756.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.3ms  min=8.35ms  med=204.86ms max=428.67ms p(90)=221.16ms p(95)=230.58ms p(99.9)=299.62ms
     http_reqs......................: 29617   244.590368/s
     iteration_duration.............: avg=203.39ms min=37.19ms med=205.27ms max=445.51ms p(90)=221.56ms p(95)=231.1ms  p(99.9)=318.98ms
     iterations.....................: 29517   243.764524/s
     success_rate...................: 100.00% ✓ 29517      ✗ 0    
     vus............................: 39      min=39       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 829848      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 333 MB  2.8 MB/s
     http_req_blocked...............: avg=3.32µs   min=1µs     med=2.46µs  max=12.62ms  p(90)=4.01µs   p(95)=4.79µs   p(99.9)=37.32µs
     http_req_connecting............: avg=358ns    min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.45ms  min=1.69ms  med=20.95ms max=345.26ms p(90)=29.21ms  p(95)=32.2ms   p(99.9)=53.96ms
       { expected_response:true }...: avg=21.45ms  min=1.69ms  med=20.95ms max=345.26ms p(90)=29.21ms  p(95)=32.2ms   p(99.9)=53.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 276716
     http_req_receiving.............: avg=128.01µs min=28.82µs med=55.22µs max=212.29ms p(90)=103.21µs p(95)=253.58µs p(99.9)=9.33ms 
     http_req_sending...............: avg=51.35µs  min=5.32µs  med=10.03µs max=85.71ms  p(90)=18.02µs  p(95)=124µs    p(99.9)=5.39ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.27ms  min=1.59ms  med=20.81ms max=191.66ms p(90)=29.02ms  p(95)=31.92ms  p(99.9)=52.72ms
     http_reqs......................: 276716  2301.839775/s
     iteration_duration.............: avg=21.68ms  min=3.09ms  med=21.16ms max=354.77ms p(90)=29.44ms  p(95)=32.45ms  p(99.9)=54.54ms
     iterations.....................: 276616  2301.007933/s
     success_rate...................: 100.00% ✓ 276616      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.53)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 605478      ✗ 0     
     data_received..................: 18 GB   147 MB/s
     data_sent......................: 243 MB  2.0 MB/s
     http_req_blocked...............: avg=3.55µs  min=1.06µs  med=2.63µs   max=5.56ms   p(90)=4.04µs   p(95)=4.72µs  p(99.9)=39.12µs 
     http_req_connecting............: avg=584ns   min=0s      med=0s       max=5.53ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=29.48ms min=2.39ms  med=18.91ms  max=581.87ms p(90)=65.71ms  p(95)=86.22ms p(99.9)=230.57ms
       { expected_response:true }...: avg=29.48ms min=2.39ms  med=18.91ms  max=581.87ms p(90)=65.71ms  p(95)=86.22ms p(99.9)=230.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 201926
     http_req_receiving.............: avg=560.6µs min=52.38µs med=113.74µs max=199.64ms p(90)=790.29µs p(95)=1.24ms  p(99.9)=62.93ms 
     http_req_sending...............: avg=36.67µs min=5.56µs  med=11.09µs  max=168.16ms p(90)=18.45µs  p(95)=28.33µs p(99.9)=1.9ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=28.88ms min=2.25ms  med=18.44ms  max=581.74ms p(90)=64.62ms  p(95)=84.95ms p(99.9)=227.84ms
     http_reqs......................: 201926  1678.576544/s
     iteration_duration.............: avg=29.71ms min=2.94ms  med=19.14ms  max=582.05ms p(90)=65.96ms  p(95)=86.47ms p(99.9)=233.55ms
     iterations.....................: 201826  1677.745261/s
     success_rate...................: 100.00% ✓ 201826      ✗ 0     
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

     checks.........................: 100.00% ✓ 557172      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.9 MB/s
     http_req_blocked...............: avg=3.74µs  min=992ns  med=2.48µs  max=5ms      p(90)=4.87µs   p(95)=5.98µs   p(99.9)=46.55µs
     http_req_connecting............: avg=620ns   min=0s     med=0s      max=4.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.02ms min=2.46ms med=31.11ms max=320.45ms p(90)=42.58ms  p(95)=47.27ms  p(99.9)=84.65ms
       { expected_response:true }...: avg=32.02ms min=2.46ms med=31.11ms max=320.45ms p(90)=42.58ms  p(95)=47.27ms  p(99.9)=84.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185824
     http_req_receiving.............: avg=118µs   min=30.1µs med=63.05µs max=186.19ms p(90)=137.96µs p(95)=296.55µs p(99.9)=5.97ms 
     http_req_sending...............: avg=49.1µs  min=5.18µs med=10.79µs max=174.42ms p(90)=24.86µs  p(95)=140.22µs p(99.9)=3.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.85ms min=2.38ms med=30.97ms max=320.31ms p(90)=42.38ms  p(95)=47.01ms  p(99.9)=84.19ms
     http_reqs......................: 185824  1544.550819/s
     iteration_duration.............: avg=32.29ms min=5.84ms med=31.35ms max=363.02ms p(90)=42.83ms  p(95)=47.53ms  p(99.9)=85.57ms
     iterations.....................: 185724  1543.719629/s
     success_rate...................: 100.00% ✓ 185724      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 440634      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3.87µs  min=1.07µs  med=2.8µs   max=4.34ms   p(90)=4.35µs   p(95)=5.04µs   p(99.9)=38.1µs 
     http_req_connecting............: avg=716ns   min=0s      med=0s      max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.58ms min=2.26ms  med=40.02ms max=338.04ms p(90)=57.1ms   p(95)=62.3ms   p(99.9)=88.07ms
       { expected_response:true }...: avg=40.58ms min=2.26ms  med=40.02ms max=338.04ms p(90)=57.1ms   p(95)=62.3ms   p(99.9)=88.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146978
     http_req_receiving.............: avg=88.63µs min=28.21µs med=67.08µs max=52.52ms  p(90)=107.39µs p(95)=129.06µs p(99.9)=1.91ms 
     http_req_sending...............: avg=28.94µs min=5.49µs  med=12.11µs max=92.34ms  p(90)=18.79µs  p(95)=23.25µs  p(99.9)=1.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.47ms min=2.18ms  med=39.91ms max=337.38ms p(90)=56.98ms  p(95)=62.16ms  p(99.9)=87.85ms
     http_reqs......................: 146978  1221.766454/s
     iteration_duration.............: avg=40.84ms min=4.01ms  med=40.25ms max=358.18ms p(90)=57.33ms  p(95)=62.52ms  p(99.9)=88.49ms
     iterations.....................: 146878  1220.935196/s
     success_rate...................: 100.00% ✓ 146878      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 180282    ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 72 MB   599 kB/s
     http_req_blocked...............: avg=4.09µs  min=1.17µs  med=3.09µs  max=4.75ms   p(90)=4.6µs    p(95)=5.18µs   p(99.9)=59.62µs 
     http_req_connecting............: avg=702ns   min=0s      med=0s      max=2.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.46ms min=4.7ms   med=96.29ms max=330.21ms p(90)=118.66ms p(95)=130.46ms p(99.9)=231.15ms
       { expected_response:true }...: avg=99.46ms min=4.7ms   med=96.29ms max=330.21ms p(90)=118.66ms p(95)=130.46ms p(99.9)=231.15ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 60194
     http_req_receiving.............: avg=89.86µs min=30.58µs med=81.47µs max=35.13ms  p(90)=114.23µs p(95)=126.84µs p(99.9)=883.09µs
     http_req_sending...............: avg=23.91µs min=5.54µs  med=14.07µs max=81.06ms  p(90)=20.47µs  p(95)=22.58µs  p(99.9)=668.75µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.35ms min=4.57ms  med=96.19ms max=329.83ms p(90)=118.55ms p(95)=130.36ms p(99.9)=230.82ms
     http_reqs......................: 60194   499.06867/s
     iteration_duration.............: avg=99.86ms min=26.18ms med=96.53ms max=358.64ms p(90)=118.93ms p(95)=130.77ms p(99.9)=232.76ms
     iterations.....................: 60094   498.23957/s
     success_rate...................: 100.00% ✓ 60094     ✗ 0    
     vus............................: 50      min=50      max=50 
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 143940     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   478 kB/s
     http_req_blocked...............: avg=5.78µs   min=1.21µs  med=3.27µs   max=4.57ms   p(90)=4.67µs   p(95)=5.21µs   p(99.9)=833.5µs 
     http_req_connecting............: avg=2.32µs   min=0s      med=0s       max=4.53ms   p(90)=0s       p(95)=0s       p(99.9)=803.16µs
     http_req_duration..............: avg=124.56ms min=5.91ms  med=121.98ms max=373.04ms p(90)=165.03ms p(95)=177.7ms  p(99.9)=228.8ms 
       { expected_response:true }...: avg=124.56ms min=5.91ms  med=121.98ms max=373.04ms p(90)=165.03ms p(95)=177.7ms  p(99.9)=228.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48080
     http_req_receiving.............: avg=90.19µs  min=30.46µs med=83.36µs  max=89.09ms  p(90)=113.98µs p(95)=125.22µs p(99.9)=767.16µs
     http_req_sending...............: avg=28.36µs  min=5.85µs  med=15.48µs  max=158.13ms p(90)=20.59µs  p(95)=22.45µs  p(99.9)=584.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.44ms min=5.78ms  med=121.87ms max=334.51ms p(90)=164.9ms  p(95)=177.6ms  p(99.9)=228.16ms
     http_reqs......................: 48080   398.229303/s
     iteration_duration.............: avg=125.09ms min=36.71ms med=122.32ms max=384.9ms  p(90)=165.35ms p(95)=178.02ms p(99.9)=232.13ms
     iterations.....................: 47980   397.401039/s
     success_rate...................: 100.00% ✓ 47980      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98448      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.27µs  med=3.73µs   max=4.77ms   p(90)=5.26µs   p(95)=5.88µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=3.42µs   min=0s      med=0s       max=4.73ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=182.07ms min=5.98ms  med=166.18ms max=707.78ms p(90)=209.13ms p(95)=266.36ms p(99.9)=539.64ms
       { expected_response:true }...: avg=182.07ms min=5.98ms  med=166.18ms max=707.78ms p(90)=209.13ms p(95)=266.36ms p(99.9)=539.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32916
     http_req_receiving.............: avg=108.11µs min=36.71µs med=99.47µs  max=112.33ms p(90)=132.41µs p(95)=146.43µs p(99.9)=733.72µs
     http_req_sending...............: avg=36.58µs  min=6.16µs  med=18.52µs  max=254.73ms p(90)=23.52µs  p(95)=25.22µs  p(99.9)=596.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.93ms min=5.83ms  med=166.05ms max=707.66ms p(90)=208.99ms p(95)=266.01ms p(99.9)=539.5ms 
     http_reqs......................: 32916   272.099449/s
     iteration_duration.............: avg=182.93ms min=53.72ms med=166.54ms max=708.13ms p(90)=209.52ms p(95)=270.86ms p(99.9)=539.92ms
     iterations.....................: 32816   271.272801/s
     success_rate...................: 100.00% ✓ 32816      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86817      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=5.17µs   min=1.18µs  med=3.38µs   max=3.84ms   p(90)=4.7µs    p(95)=5.25µs   p(99.9)=638.53µs
     http_req_connecting............: avg=1.37µs   min=0s      med=0s       max=1.88ms   p(90)=0s       p(95)=0s       p(99.9)=552.54µs
     http_req_duration..............: avg=206.47ms min=8.55ms  med=206.46ms max=372.67ms p(90)=215.81ms p(95)=222.07ms p(99.9)=289.88ms
       { expected_response:true }...: avg=206.47ms min=8.55ms  med=206.46ms max=372.67ms p(90)=215.81ms p(95)=222.07ms p(99.9)=289.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29039
     http_req_receiving.............: avg=128.65µs min=35.04µs med=93.18µs  max=97.08ms  p(90)=124.84µs p(95)=137.4µs  p(99.9)=1.19ms  
     http_req_sending...............: avg=24.08µs  min=5.96µs  med=17µs     max=40.92ms  p(90)=21.56µs  p(95)=23.31µs  p(99.9)=535.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.32ms min=8.46ms  med=206.34ms max=323.36ms p(90)=215.68ms p(95)=221.96ms p(99.9)=288.14ms
     http_reqs......................: 29039   239.833449/s
     iteration_duration.............: avg=207.46ms min=86.48ms med=206.74ms max=384.01ms p(90)=216.1ms  p(95)=222.43ms p(99.9)=295.12ms
     iterations.....................: 28939   239.007548/s
     success_rate...................: 100.00% ✓ 28939      ✗ 0    
     vus............................: 37      min=37       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

