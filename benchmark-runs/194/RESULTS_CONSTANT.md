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
| hive-router | v0.0.49 | 3,072 | 3,272 | 3,020 | 2.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,162 | 2,216 | 2,138 | 1.1% |  |
| grafbase | 0.53.3 | 2,107 | 2,170 | 2,077 | 1.4% |  |
| cosmo | 0.307.0 | 1,269 | 1,281 | 1,260 | 0.6% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 532 | 543 | 528 | 1.0% |  |
| apollo-router | v2.13.1 | 401 | 411 | 397 | 1.4% |  |
| hive-gateway | 2.5.25 | 246 | 251 | 244 | 1.0% |  |
| apollo-gateway | 2.13.3 | 245 | 249 | 244 | 0.8% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,348 | 2,497 | 2,317 | 2.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,991 | 2,032 | 1,961 | 1.1% |  |
| grafbase | 0.53.3 | 1,511 | 1,539 | 1,488 | 1.0% |  |
| cosmo | 0.307.0 | 1,213 | 1,224 | 1,200 | 0.8% | non-compatible response (7 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 501 | 516 | 496 | 1.4% |  |
| apollo-router | v2.13.1 | 385 | 395 | 379 | 1.4% |  |
| hive-gateway | 2.5.25 | 244 | 249 | 242 | 1.0% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 233 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1107660     ✗ 0     
     data_received..................: 32 GB   270 MB/s
     data_sent......................: 444 MB  3.7 MB/s
     http_req_blocked...............: avg=2.88µs   min=992ns   med=2.04µs  max=16.04ms  p(90)=3.21µs  p(95)=3.84µs   p(99.9)=31.13µs
     http_req_connecting............: avg=290ns    min=0s      med=0s      max=4.3ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16ms     min=1.64ms  med=14.92ms max=310.28ms p(90)=23.77ms p(95)=28.12ms  p(99.9)=51.82ms
       { expected_response:true }...: avg=16ms     min=1.64ms  med=14.92ms max=310.28ms p(90)=23.77ms p(95)=28.12ms  p(99.9)=51.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 369320
     http_req_receiving.............: avg=147.54µs min=26.89µs med=47.71µs max=165.92ms p(90)=97.3µs  p(95)=284.26µs p(99.9)=16.73ms
     http_req_sending...............: avg=58.77µs  min=5.27µs  med=9.03µs  max=225.12ms p(90)=15.24µs p(95)=120.35µs p(99.9)=7.87ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.8ms   min=1.59ms  med=14.77ms max=306.66ms p(90)=23.45ms p(95)=27.62ms  p(99.9)=49.94ms
     http_reqs......................: 369320  3072.669578/s
     iteration_duration.............: avg=16.24ms  min=2.11ms  med=15.12ms max=322.99ms p(90)=24.01ms p(95)=28.4ms   p(99.9)=53.27ms
     iterations.....................: 369220  3071.837597/s
     success_rate...................: 100.00% ✓ 369220      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 780390      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=2.99µs   min=1µs     med=2.11µs  max=9.06ms   p(90)=3.3µs    p(95)=3.92µs   p(99.9)=32.67µs 
     http_req_connecting............: avg=467ns    min=0s      med=0s      max=4.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.82ms  min=2.46ms  med=14.69ms max=325.14ms p(90)=50.5ms   p(95)=68.58ms  p(99.9)=164.61ms
       { expected_response:true }...: avg=22.82ms  min=2.46ms  med=14.69ms max=325.14ms p(90)=50.5ms   p(95)=68.58ms  p(99.9)=164.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260230
     http_req_receiving.............: avg=645.88µs min=50.64µs med=104.2µs max=213.4ms  p(90)=959.02µs p(95)=1.48ms   p(99.9)=57.32ms 
     http_req_sending...............: avg=44.03µs  min=5.21µs  med=9.24µs  max=181.62ms p(90)=15.61µs  p(95)=111.62µs p(99.9)=2.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.13ms  min=2.33ms  med=14.18ms max=324.32ms p(90)=49.14ms  p(95)=67.25ms  p(99.9)=162.55ms
     http_reqs......................: 260230  2162.966987/s
     iteration_duration.............: avg=23.05ms  min=3.19ms  med=14.9ms  max=343ms    p(90)=50.74ms  p(95)=68.83ms  p(99.9)=165.94ms
     iterations.....................: 260130  2162.135812/s
     success_rate...................: 100.00% ✓ 260130      ✗ 0     
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

     checks.........................: 100.00% ✓ 760116      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=3.36µs  min=951ns   med=2.47µs  max=11.64ms  p(90)=4.09µs  p(95)=4.94µs   p(99.9)=45.52µs
     http_req_connecting............: avg=215ns   min=0s      med=0s      max=3.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.42ms min=1.96ms  med=23.18ms max=338.58ms p(90)=28.22ms p(95)=30.75ms  p(99.9)=54.04ms
       { expected_response:true }...: avg=23.42ms min=1.96ms  med=23.18ms max=338.58ms p(90)=28.22ms p(95)=30.75ms  p(99.9)=54.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253472
     http_req_receiving.............: avg=134µs   min=29.17µs med=58.09µs max=256.94ms p(90)=104.4µs p(95)=240.89µs p(99.9)=10.19ms
     http_req_sending...............: avg=51.9µs  min=5.17µs  med=10.48µs max=248.36ms p(90)=18.98µs p(95)=126.23µs p(99.9)=5.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.24ms min=1.85ms  med=23.06ms max=134.31ms p(90)=28.04ms p(95)=30.45ms  p(99.9)=52.45ms
     http_reqs......................: 253472  2107.870351/s
     iteration_duration.............: avg=23.67ms min=3.33ms  med=23.39ms max=348.02ms p(90)=28.45ms p(95)=31.02ms  p(99.9)=54.87ms
     iterations.....................: 253372  2107.038753/s
     success_rate...................: 100.00% ✓ 253372      ✗ 0     
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

     checks.........................: 100.00% ✓ 457905      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.03µs  min=992ns   med=2.12µs  max=4.57ms   p(90)=3.4µs   p(95)=3.99µs   p(99.9)=34.83µs
     http_req_connecting............: avg=566ns   min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.07ms min=2.15ms  med=38.53ms max=341.66ms p(90)=55.21ms p(95)=60.24ms  p(99.9)=84.2ms 
       { expected_response:true }...: avg=39.07ms min=2.15ms  med=38.53ms max=341.66ms p(90)=55.21ms p(95)=60.24ms  p(99.9)=84.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 152735
     http_req_receiving.............: avg=79.53µs min=28.43µs med=59.13µs max=112.23ms p(90)=93.93µs p(95)=111.42µs p(99.9)=1.98ms 
     http_req_sending...............: avg=26.51µs min=5.33µs  med=9.99µs  max=198.73ms p(90)=15.21µs p(95)=19.24µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.96ms min=2.06ms  med=38.43ms max=338.79ms p(90)=55.09ms p(95)=60.11ms  p(99.9)=83.82ms
     http_reqs......................: 152735  1269.870055/s
     iteration_duration.............: avg=39.3ms  min=3.93ms  med=38.73ms max=351.25ms p(90)=55.41ms p(95)=60.44ms  p(99.9)=84.94ms
     iterations.....................: 152635  1269.038634/s
     success_rate...................: 100.00% ✓ 152635      ✗ 0     
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

     checks.........................: 100.00% ✓ 192444     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   640 kB/s
     http_req_blocked...............: avg=3.92µs  min=1.09µs  med=2.8µs   max=4.67ms   p(90)=4.26µs   p(95)=4.86µs   p(99.9)=84.08µs 
     http_req_connecting............: avg=774ns   min=0s      med=0s      max=2.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.16ms min=4.27ms  med=90.19ms max=329.87ms p(90)=115.57ms p(95)=129.03ms p(99.9)=221.09ms
       { expected_response:true }...: avg=93.16ms min=4.27ms  med=90.19ms max=329.87ms p(90)=115.57ms p(95)=129.03ms p(99.9)=221.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64248
     http_req_receiving.............: avg=94.32µs min=30.46µs med=76.56µs max=187.34ms p(90)=111.22µs p(95)=123.76µs p(99.9)=983.22µs
     http_req_sending...............: avg=20.52µs min=5.71µs  med=13.33µs max=67.57ms  p(90)=20.01µs  p(95)=22.27µs  p(99.9)=757.89µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.05ms min=4.2ms   med=90.09ms max=329.54ms p(90)=115.45ms p(95)=128.89ms p(99.9)=220.9ms 
     http_reqs......................: 64248   532.881489/s
     iteration_duration.............: avg=93.54ms min=22.2ms  med=90.45ms max=350.15ms p(90)=115.82ms p(95)=129.42ms p(99.9)=222.69ms
     iterations.....................: 64148   532.052076/s
     success_rate...................: 100.00% ✓ 64148      ✗ 0    
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

     checks.........................: 100.00% ✓ 144921     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   482 kB/s
     http_req_blocked...............: avg=5.47µs   min=1.17µs  med=3.07µs   max=3.94ms   p(90)=4.43µs   p(95)=4.95µs   p(99.9)=239.6µs 
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=128.49µs
     http_req_duration..............: avg=123.75ms min=5.43ms  med=123.43ms max=352.19ms p(90)=149.75ms p(95)=157.43ms p(99.9)=196.45ms
       { expected_response:true }...: avg=123.75ms min=5.43ms  med=123.43ms max=352.19ms p(90)=149.75ms p(95)=157.43ms p(99.9)=196.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48407
     http_req_receiving.............: avg=86.77µs  min=30.56µs med=81.8µs   max=8.99ms   p(90)=113.24µs p(95)=124.96µs p(99.9)=649.59µs
     http_req_sending...............: avg=23.51µs  min=6.11µs  med=14.71µs  max=115.34ms p(90)=20.41µs  p(95)=22.23µs  p(99.9)=568.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.64ms min=5.33ms  med=123.32ms max=351.67ms p(90)=149.66ms p(95)=157.31ms p(99.9)=195.03ms
     http_reqs......................: 48407   401.007283/s
     iteration_duration.............: avg=124.25ms min=28.54ms med=123.71ms max=365.59ms p(90)=150.01ms p(95)=157.7ms  p(99.9)=199.44ms
     iterations.....................: 48307   400.178876/s
     success_rate...................: 100.00% ✓ 48307      ✗ 0    
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

     checks.........................: 100.00% ✓ 88974      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=5.22µs   min=1.23µs  med=3.21µs   max=2.96ms   p(90)=4.54µs   p(95)=5.14µs   p(99.9)=581.3µs 
     http_req_connecting............: avg=1.82µs   min=0s      med=0s       max=2.93ms   p(90)=0s       p(95)=0s       p(99.9)=557.58µs
     http_req_duration..............: avg=201.5ms  min=6.09ms  med=183.55ms max=598.42ms p(90)=240.53ms p(95)=412.55ms p(99.9)=527.98ms
       { expected_response:true }...: avg=201.5ms  min=6.09ms  med=183.55ms max=598.42ms p(90)=240.53ms p(95)=412.55ms p(99.9)=527.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29758
     http_req_receiving.............: avg=98.19µs  min=33.76µs med=91.75µs  max=43.63ms  p(90)=124.34µs p(95)=136.91µs p(99.9)=596.01µs
     http_req_sending...............: avg=24.21µs  min=6.33µs  med=16.57µs  max=51.14ms  p(90)=21.94µs  p(95)=23.95µs  p(99.9)=634.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.37ms min=5.92ms  med=183.43ms max=598.34ms p(90)=240.43ms p(95)=412.35ms p(99.9)=527.89ms
     http_reqs......................: 29758   246.211532/s
     iteration_duration.............: avg=202.42ms min=29.25ms med=183.91ms max=598.63ms p(90)=240.97ms p(95)=413.17ms p(99.9)=528.18ms
     iterations.....................: 29658   245.384153/s
     success_rate...................: 100.00% ✓ 29658      ✗ 0    
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

     checks.........................: 100.00% ✓ 88899      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=6.64µs   min=1.19µs  med=2.99µs   max=4.18ms   p(90)=4.16µs   p(95)=4.66µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=201.68ms min=8.42ms  med=214.15ms max=429.79ms p(90)=243.04ms p(95)=250.22ms p(99.9)=316.93ms
       { expected_response:true }...: avg=201.68ms min=8.42ms  med=214.15ms max=429.79ms p(90)=243.04ms p(95)=250.22ms p(99.9)=316.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29733
     http_req_receiving.............: avg=93.34µs  min=35.4µs  med=87.97µs  max=29.04ms  p(90)=119.25µs p(95)=130.71µs p(99.9)=679.27µs
     http_req_sending...............: avg=34.18µs  min=6.24µs  med=15.65µs  max=127.04ms p(90)=20.56µs  p(95)=22.33µs  p(99.9)=582.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.55ms min=8.31ms  med=214ms    max=429.23ms p(90)=242.93ms p(95)=250.06ms p(99.9)=316.82ms
     http_reqs......................: 29733   245.560172/s
     iteration_duration.............: avg=202.61ms min=46.52ms med=214.79ms max=442.08ms p(90)=243.36ms p(95)=250.52ms p(99.9)=324.47ms
     iterations.....................: 29633   244.734288/s
     success_rate...................: 100.00% ✓ 29633      ✗ 0    
     vus............................: 40      min=40       max=50 
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

     checks.........................: 100.00% ✓ 846777      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 339 MB  2.8 MB/s
     http_req_blocked...............: avg=2.84µs   min=1.01µs  med=2.16µs  max=13.7ms   p(90)=3.5µs   p(95)=4.27µs   p(99.9)=36.24µs
     http_req_connecting............: avg=145ns    min=0s      med=0s      max=1.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.02ms  min=1.79ms  med=20.56ms max=355.7ms  p(90)=29.13ms p(95)=32.18ms  p(99.9)=54.22ms
       { expected_response:true }...: avg=21.02ms  min=1.79ms  med=20.56ms max=355.7ms  p(90)=29.13ms p(95)=32.18ms  p(99.9)=54.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282359
     http_req_receiving.............: avg=135.21µs min=28.32µs med=54.45µs max=324.47ms p(90)=99.74µs p(95)=244.37µs p(99.9)=10.08ms
     http_req_sending...............: avg=50.19µs  min=5.29µs  med=9.76µs  max=53.94ms  p(90)=17.54µs p(95)=121.81µs p(99.9)=5.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.83ms  min=1.7ms   med=20.43ms max=113.68ms p(90)=28.93ms p(95)=31.89ms  p(99.9)=52.62ms
     http_reqs......................: 282359  2348.583897/s
     iteration_duration.............: avg=21.24ms  min=2.54ms  med=20.77ms max=375.33ms p(90)=29.35ms p(95)=32.42ms  p(99.9)=54.89ms
     iterations.....................: 282259  2347.752124/s
     success_rate...................: 100.00% ✓ 282259      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 718020      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.01µs   min=992ns   med=2.17µs   max=16.15ms  p(90)=3.59µs  p(95)=4.3µs    p(99.9)=34.99µs 
     http_req_connecting............: avg=363ns    min=0s      med=0s       max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.82ms  min=1.97ms  med=17.3ms   max=551.11ms p(90)=51.64ms p(95)=68.06ms  p(99.9)=193.69ms
       { expected_response:true }...: avg=24.82ms  min=1.97ms  med=17.3ms   max=551.11ms p(90)=51.64ms p(95)=68.06ms  p(99.9)=193.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239440
     http_req_receiving.............: avg=668.04µs min=50.59µs med=103.68µs max=255.87ms p(90)=1.11ms  p(95)=1.79ms   p(99.9)=55.02ms 
     http_req_sending...............: avg=44.91µs  min=5.32µs  med=9.53µs   max=267.8ms  p(90)=18.15µs p(95)=112.32µs p(99.9)=3.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.11ms  min=1.84ms  med=16.74ms  max=551ms    p(90)=50.29ms p(95)=66.64ms  p(99.9)=193ms   
     http_reqs......................: 239440  1991.327784/s
     iteration_duration.............: avg=25.05ms  min=2.79ms  med=17.52ms  max=551.3ms  p(90)=51.87ms p(95)=68.28ms  p(99.9)=195.9ms 
     iterations.....................: 239340  1990.496123/s
     success_rate...................: 100.00% ✓ 239340      ✗ 0     
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

     checks.........................: 100.00% ✓ 545220      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.29µs   min=962ns   med=2.36µs  max=4.14ms   p(90)=4.55µs   p(95)=5.72µs   p(99.9)=42.66µs
     http_req_connecting............: avg=357ns    min=0s      med=0s      max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.74ms  min=2.33ms  med=31.82ms max=320.46ms p(90)=43.46ms  p(95)=48.19ms  p(99.9)=90.27ms
       { expected_response:true }...: avg=32.74ms  min=2.33ms  med=31.82ms max=320.46ms p(90)=43.46ms  p(95)=48.19ms  p(99.9)=90.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181840
     http_req_receiving.............: avg=113.57µs min=30.39µs med=63.01µs max=162.55ms p(90)=135.35µs p(95)=277.4µs  p(99.9)=5.7ms  
     http_req_sending...............: avg=50.53µs  min=5.37µs  med=10.51µs max=245.02ms p(90)=24.28µs  p(95)=133.48µs p(99.9)=4.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.57ms  min=2.25ms  med=31.67ms max=319.49ms p(90)=43.26ms  p(95)=47.96ms  p(99.9)=89.74ms
     http_reqs......................: 181840  1511.361565/s
     iteration_duration.............: avg=33ms     min=3.76ms  med=32.06ms max=330.18ms p(90)=43.7ms   p(95)=48.43ms  p(99.9)=91.39ms
     iterations.....................: 181740  1510.530416/s
     success_rate...................: 100.00% ✓ 181740      ✗ 0     
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

     checks.........................: 100.00% ✓ 437523      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=4.12µs  min=1.07µs  med=2.73µs  max=45.35ms  p(90)=4.32µs   p(95)=5.01µs   p(99.9)=39.38µs
     http_req_connecting............: avg=761ns   min=0s      med=0s      max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.87ms min=2.18ms  med=40.3ms  max=321.01ms p(90)=57.5ms   p(95)=62.73ms  p(99.9)=89.28ms
       { expected_response:true }...: avg=40.87ms min=2.18ms  med=40.3ms  max=321.01ms p(90)=57.5ms   p(95)=62.73ms  p(99.9)=89.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145941
     http_req_receiving.............: avg=87.29µs min=29.01µs med=67.51µs max=26.36ms  p(90)=106.64µs p(95)=125.88µs p(99.9)=2.05ms 
     http_req_sending...............: avg=31.12µs min=5.67µs  med=12.28µs max=241.85ms p(90)=19.24µs  p(95)=23.17µs  p(99.9)=1.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.75ms min=2.11ms  med=40.2ms  max=320.66ms p(90)=57.38ms  p(95)=62.61ms  p(99.9)=88.37ms
     http_reqs......................: 145941  1213.207153/s
     iteration_duration.............: avg=41.13ms min=4.25ms  med=40.53ms max=332.66ms p(90)=57.73ms  p(95)=62.96ms  p(99.9)=90.35ms
     iterations.....................: 145841  1212.375853/s
     success_rate...................: 100.00% ✓ 145841      ✗ 0     
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

     checks.........................: 100.00% ✓ 181095     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   602 kB/s
     http_req_blocked...............: avg=4.84µs   min=1.16µs  med=2.79µs  max=4.33ms   p(90)=4.29µs   p(95)=4.85µs   p(99.9)=67.4µs  
     http_req_connecting............: avg=1.71µs   min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.01ms  min=4.54ms  med=98.14ms max=366.5ms  p(90)=127.61ms p(95)=141.1ms  p(99.9)=236.71ms
       { expected_response:true }...: avg=99.01ms  min=4.54ms  med=98.14ms max=366.5ms  p(90)=127.61ms p(95)=141.1ms  p(99.9)=236.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60465
     http_req_receiving.............: avg=132.03µs min=30.49µs med=79.49µs max=258.12ms p(90)=113.98µs p(95)=127.04µs p(99.9)=849.92µs
     http_req_sending...............: avg=23.67µs  min=5.68µs  med=13.43µs max=193.1ms  p(90)=19.85µs  p(95)=21.91µs  p(99.9)=626.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.85ms  min=4.42ms  med=98.03ms max=354.29ms p(90)=127.45ms p(95)=140.81ms p(99.9)=234.98ms
     http_reqs......................: 60465   501.264001/s
     iteration_duration.............: avg=99.42ms  min=31.08ms med=98.38ms max=387ms    p(90)=127.86ms p(95)=141.43ms p(99.9)=239.68ms
     iterations.....................: 60365   500.434986/s
     success_rate...................: 100.00% ✓ 60365      ✗ 0    
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

     checks.........................: 100.00% ✓ 139506     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 56 MB   463 kB/s
     http_req_blocked...............: avg=4.42µs   min=1.16µs  med=3.4µs    max=2.14ms   p(90)=4.82µs   p(95)=5.4µs    p(99.9)=165.03µs
     http_req_connecting............: avg=825ns    min=0s      med=0s       max=2.11ms   p(90)=0s       p(95)=0s       p(99.9)=112.67µs
     http_req_duration..............: avg=128.52ms min=5.98ms  med=125.94ms max=346.4ms  p(90)=169.94ms p(95)=182.77ms p(99.9)=236.58ms
       { expected_response:true }...: avg=128.52ms min=5.98ms  med=125.94ms max=346.4ms  p(90)=169.94ms p(95)=182.77ms p(99.9)=236.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46602
     http_req_receiving.............: avg=93.47µs  min=32.48µs med=87.06µs  max=61.41ms  p(90)=118.72µs p(95)=130.86µs p(99.9)=679.08µs
     http_req_sending...............: avg=24.51µs  min=5.82µs  med=16.71µs  max=55.27ms  p(90)=22.01µs  p(95)=23.89µs  p(99.9)=612.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.41ms min=5.83ms  med=125.82ms max=345.66ms p(90)=169.83ms p(95)=182.67ms p(99.9)=236.47ms
     http_reqs......................: 46602   385.901465/s
     iteration_duration.............: avg=129.06ms min=31.65ms med=126.26ms max=354.24ms p(90)=170.25ms p(95)=183.08ms p(99.9)=238.09ms
     iterations.....................: 46502   385.073386/s
     success_rate...................: 100.00% ✓ 46502      ✗ 0    
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

     checks.........................: 100.00% ✓ 88521      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=6.31µs   min=1.31µs  med=3.49µs   max=4.51ms   p(90)=4.94µs   p(95)=5.54µs   p(99.9)=1.14ms  
     http_req_connecting............: avg=2.46µs   min=0s      med=0s       max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=202.47ms min=6.45ms  med=185.79ms max=616.82ms p(90)=234.15ms p(95)=405.77ms p(99.9)=538.58ms
       { expected_response:true }...: avg=202.47ms min=6.45ms  med=185.79ms max=616.82ms p(90)=234.15ms p(95)=405.77ms p(99.9)=538.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29607
     http_req_receiving.............: avg=131.54µs min=34.88µs med=99.08µs  max=178.48ms p(90)=130.42µs p(95)=143.42µs p(99.9)=792.57µs
     http_req_sending...............: avg=50.12µs  min=6.08µs  med=18.3µs   max=193.97ms p(90)=23.28µs  p(95)=24.98µs  p(99.9)=904.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.28ms min=6.31ms  med=185.67ms max=616.72ms p(90)=233.91ms p(95)=405.67ms p(99.9)=538.47ms
     http_reqs......................: 29607   244.661407/s
     iteration_duration.............: avg=203.46ms min=26.11ms med=186.14ms max=617.05ms p(90)=234.71ms p(95)=406.43ms p(99.9)=538.86ms
     iterations.....................: 29507   243.835043/s
     success_rate...................: 100.00% ✓ 29507      ✗ 0    
     vus............................: 16      min=16       max=50 
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

     checks.........................: 100.00% ✓ 85332      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=6.95µs   min=1.27µs  med=3.15µs   max=4.18ms   p(90)=4.38µs   p(95)=4.9µs    p(99.9)=1.89ms  
     http_req_connecting............: avg=3.59µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=210.09ms min=8.79ms  med=210.66ms max=453.25ms p(90)=239.03ms p(95)=248.53ms p(99.9)=314.62ms
       { expected_response:true }...: avg=210.09ms min=8.79ms  med=210.66ms max=453.25ms p(90)=239.03ms p(95)=248.53ms p(99.9)=314.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28544
     http_req_receiving.............: avg=249.33µs min=34.25µs med=92.26µs  max=198.34ms p(90)=124.26µs p(95)=137.1µs  p(99.9)=58.21ms 
     http_req_sending...............: avg=36.17µs  min=5.96µs  med=16.75µs  max=230.3ms  p(90)=21.35µs  p(95)=23.17µs  p(99.9)=572.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.8ms  min=8.64ms  med=210.51ms max=321.84ms p(90)=238.9ms  p(95)=248.34ms p(99.9)=309.72ms
     http_reqs......................: 28544   235.661288/s
     iteration_duration.............: avg=211.09ms min=17.49ms med=211.03ms max=465.1ms  p(90)=239.29ms p(95)=248.86ms p(99.9)=325.21ms
     iterations.....................: 28444   234.835681/s
     success_rate...................: 100.00% ✓ 28444      ✗ 0    
     vus............................: 45      min=45       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

