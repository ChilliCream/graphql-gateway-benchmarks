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
| hive-router | v0.0.49 | 3,045 | 3,237 | 3,000 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,137 | 2,153 | 2,105 | 0.7% |  |
| grafbase | 0.53.3 | 2,059 | 2,114 | 2,030 | 1.5% |  |
| cosmo | 0.307.0 | 1,258 | 1,281 | 1,251 | 1.0% | non-compatible response (5 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 535 | 547 | 529 | 1.2% |  |
| apollo-router | v2.13.1 | 399 | 411 | 393 | 1.6% |  |
| hive-gateway | 2.5.25 | 248 | 252 | 245 | 1.1% |  |
| apollo-gateway | 2.13.3 | 242 | 243 | 239 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,462 | 2,577 | 2,451 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,949 | 2,001 | 1,778 | 3.3% |  |
| grafbase | 0.53.3 | 1,553 | 1,573 | 1,539 | 0.7% |  |
| cosmo | 0.307.0 | 1,207 | 1,220 | 1,200 | 0.6% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 506 | 521 | 500 | 1.4% |  |
| apollo-router | v2.13.1 | 369 | 382 | 364 | 1.7% |  |
| hive-gateway | 2.5.25 | 238 | 243 | 235 | 1.1% |  |
| apollo-gateway | 2.13.3 | 236 | 239 | 233 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1097913     ✗ 0     
     data_received..................: 32 GB   267 MB/s
     data_sent......................: 440 MB  3.7 MB/s
     http_req_blocked...............: avg=2.81µs   min=972ns   med=2.08µs  max=24.69ms  p(90)=3.26µs  p(95)=3.93µs   p(99.9)=32.43µs
     http_req_connecting............: avg=275ns    min=0s      med=0s      max=3.81ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.15ms  min=1.64ms  med=15.29ms max=368.47ms p(90)=23.61ms p(95)=27.24ms  p(99.9)=50.11ms
       { expected_response:true }...: avg=16.15ms  min=1.64ms  med=15.29ms max=368.47ms p(90)=23.61ms p(95)=27.24ms  p(99.9)=50.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 366071
     http_req_receiving.............: avg=137.86µs min=27.56µs med=49.87µs max=226.77ms p(90)=102.8µs p(95)=279.49µs p(99.9)=13.1ms 
     http_req_sending...............: avg=59.3µs   min=5.08µs  med=9.21µs  max=215.46ms p(90)=16.23µs p(95)=124.19µs p(99.9)=7.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.96ms  min=1.57ms  med=15.15ms max=248.2ms  p(90)=23.34ms p(95)=26.83ms  p(99.9)=48.66ms
     http_reqs......................: 366071  3045.558305/s
     iteration_duration.............: avg=16.38ms  min=2.15ms  med=15.5ms  max=386.06ms p(90)=23.83ms p(95)=27.49ms  p(99.9)=51.3ms 
     iterations.....................: 365971  3044.726347/s
     success_rate...................: 100.00% ✓ 365971      ✗ 0     
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

     checks.........................: 100.00% ✓ 771270      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=2.47µs   min=972ns   med=1.96µs   max=7.65ms   p(90)=2.93µs   p(95)=3.48µs   p(99.9)=31.03µs 
     http_req_connecting............: avg=137ns    min=0s      med=0s       max=2.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.1ms   min=2.42ms  med=14.47ms  max=387.73ms p(90)=52.45ms  p(95)=70ms     p(99.9)=166.51ms
       { expected_response:true }...: avg=23.1ms   min=2.42ms  med=14.47ms  max=387.73ms p(90)=52.45ms  p(95)=70ms     p(99.9)=166.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257190
     http_req_receiving.............: avg=634.33µs min=50.37µs med=106.54µs max=286.39ms p(90)=924.33µs p(95)=1.41ms   p(99.9)=57.32ms 
     http_req_sending...............: avg=41.27µs  min=5µs     med=8.79µs   max=133.73ms p(90)=14.3µs   p(95)=100.67µs p(99.9)=2.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.43ms  min=2.33ms  med=13.97ms  max=387.09ms p(90)=51.09ms  p(95)=68.69ms  p(99.9)=164.87ms
     http_reqs......................: 257190  2137.986529/s
     iteration_duration.............: avg=23.32ms  min=3.27ms  med=14.68ms  max=387.96ms p(90)=52.69ms  p(95)=70.21ms  p(99.9)=167.56ms
     iterations.....................: 257090  2137.155242/s
     success_rate...................: 100.00% ✓ 257090      ✗ 0     
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

     checks.........................: 100.00% ✓ 742812      ✗ 0     
     data_received..................: 22 GB   181 MB/s
     data_sent......................: 298 MB  2.5 MB/s
     http_req_blocked...............: avg=4.8µs    min=992ns  med=2.25µs  max=16.83ms  p(90)=3.73µs   p(95)=4.55µs   p(99.9)=40.26µs
     http_req_connecting............: avg=1.96µs   min=0s     med=0s      max=16.79ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.98ms  min=2.01ms med=23.73ms max=320.09ms p(90)=28.75ms  p(95)=31ms     p(99.9)=52.95ms
       { expected_response:true }...: avg=23.98ms  min=2.01ms med=23.73ms max=320.09ms p(90)=28.75ms  p(95)=31ms     p(99.9)=52.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 247704
     http_req_receiving.............: avg=106.63µs min=29.3µs med=57.45µs max=101.64ms p(90)=100.43µs p(95)=181.2µs  p(99.9)=8.86ms 
     http_req_sending...............: avg=49.05µs  min=4.75µs med=10.09µs max=281.42ms p(90)=17.2µs   p(95)=112.77µs p(99.9)=4.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.83ms  min=1.91ms med=23.61ms max=313.41ms p(90)=28.57ms  p(95)=30.74ms  p(99.9)=51.76ms
     http_reqs......................: 247704  2059.734033/s
     iteration_duration.............: avg=24.22ms  min=4.01ms med=23.94ms max=338.06ms p(90)=28.97ms  p(95)=31.24ms  p(99.9)=53.51ms
     iterations.....................: 247604  2058.902503/s
     success_rate...................: 100.00% ✓ 247604      ✗ 0     
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

     checks.........................: 100.00% ✓ 453939      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 182 MB  1.5 MB/s
     http_req_blocked...............: avg=2.86µs  min=1.01µs  med=2.08µs  max=3.52ms   p(90)=3.4µs   p(95)=4.06µs   p(99.9)=32.51µs
     http_req_connecting............: avg=453ns   min=0s      med=0s      max=3.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.41ms min=2.12ms  med=38.83ms max=296.79ms p(90)=55.69ms p(95)=60.84ms  p(99.9)=86.07ms
       { expected_response:true }...: avg=39.41ms min=2.12ms  med=38.83ms max=296.79ms p(90)=55.69ms p(95)=60.84ms  p(99.9)=86.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151413
     http_req_receiving.............: avg=77.58µs min=28.41µs med=58.06µs max=47.55ms  p(90)=93.93µs p(95)=112.45µs p(99.9)=1.69ms 
     http_req_sending...............: avg=26.93µs min=5.11µs  med=9.94µs  max=227.11ms p(90)=15.51µs p(95)=19.81µs  p(99.9)=1.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.3ms  min=2.03ms  med=38.73ms max=289.2ms  p(90)=55.58ms p(95)=60.72ms  p(99.9)=85.81ms
     http_reqs......................: 151413  1258.89151/s
     iteration_duration.............: avg=39.64ms min=4.14ms  med=39.04ms max=332.29ms p(90)=55.89ms p(95)=61.04ms  p(99.9)=86.6ms 
     iterations.....................: 151313  1258.060081/s
     success_rate...................: 100.00% ✓ 151313      ✗ 0     
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

     checks.........................: 100.00% ✓ 193455     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   643 kB/s
     http_req_blocked...............: avg=4.34µs  min=1.07µs med=2.49µs  max=3.82ms   p(90)=3.98µs   p(95)=4.54µs   p(99.9)=43.5µs  
     http_req_connecting............: avg=1.51µs  min=0s     med=0s      max=3.78ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.65ms min=4.09ms med=90.08ms max=246.52ms p(90)=112.77ms p(95)=125.35ms p(99.9)=215.89ms
       { expected_response:true }...: avg=92.65ms min=4.09ms med=90.08ms max=246.52ms p(90)=112.77ms p(95)=125.35ms p(99.9)=215.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64585
     http_req_receiving.............: avg=81.62µs min=30.5µs med=72.67µs max=32.16ms  p(90)=106.67µs p(95)=119.1µs  p(99.9)=857.81µs
     http_req_sending...............: avg=20.21µs min=5.46µs med=12.14µs max=60.69ms  p(90)=18.47µs  p(95)=20.49µs  p(99.9)=654.84µs
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.55ms min=3.99ms med=89.98ms max=246.42ms p(90)=112.67ms p(95)=125.25ms p(99.9)=215.78ms
     http_reqs......................: 64585   535.759835/s
     iteration_duration.............: avg=93.06ms min=8.64ms med=90.31ms max=384.98ms p(90)=113.01ms p(95)=125.66ms p(99.9)=219.57ms
     iterations.....................: 64485   534.930293/s
     success_rate...................: 100.00% ✓ 64485      ✗ 0    
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

     checks.........................: 100.00% ✓ 144396     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   480 kB/s
     http_req_blocked...............: avg=5.88µs   min=1.05µs  med=2.97µs   max=32.12ms  p(90)=4.34µs   p(95)=4.87µs   p(99.9)=321.43µs
     http_req_connecting............: avg=2.05µs   min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=114.11µs
     http_req_duration..............: avg=124.17ms min=5.42ms  med=123.88ms max=349.9ms  p(90)=150.34ms p(95)=157.93ms p(99.9)=193.32ms
       { expected_response:true }...: avg=124.17ms min=5.42ms  med=123.88ms max=349.9ms  p(90)=150.34ms p(95)=157.93ms p(99.9)=193.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48232
     http_req_receiving.............: avg=85.36µs  min=30.57µs med=80.52µs  max=4.72ms   p(90)=112.42µs p(95)=124.01µs p(99.9)=627.59µs
     http_req_sending...............: avg=25µs     min=6.07µs  med=14.28µs  max=161.37ms p(90)=19.46µs  p(95)=21.22µs  p(99.9)=560.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.06ms min=5.29ms  med=123.78ms max=349.34ms p(90)=150.24ms p(95)=157.82ms p(99.9)=193.16ms
     http_reqs......................: 48232   399.625985/s
     iteration_duration.............: avg=124.69ms min=16.07ms med=124.16ms max=375.69ms p(90)=150.62ms p(95)=158.19ms p(99.9)=196.99ms
     iterations.....................: 48132   398.797435/s
     success_rate...................: 100.00% ✓ 48132      ✗ 0    
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

     checks.........................: 100.00% ✓ 90066      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   299 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.23µs  med=3.21µs   max=3.2ms    p(90)=4.49µs   p(95)=5.06µs   p(99.9)=896.71µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=3.17ms   p(90)=0s       p(95)=0s       p(99.9)=852.79µs
     http_req_duration..............: avg=199.06ms min=6.18ms  med=183.33ms max=636.98ms p(90)=236.91ms p(95)=399.09ms p(99.9)=534.51ms
       { expected_response:true }...: avg=199.06ms min=6.18ms  med=183.33ms max=636.98ms p(90)=236.91ms p(95)=399.09ms p(99.9)=534.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30122
     http_req_receiving.............: avg=94.08µs  min=32.8µs  med=90.28µs  max=2.21ms   p(90)=122.21µs p(95)=134.77µs p(99.9)=483.43µs
     http_req_sending...............: avg=23.36µs  min=5.97µs  med=15.91µs  max=49.08ms  p(90)=21.01µs  p(95)=22.97µs  p(99.9)=816.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.94ms min=6.09ms  med=183.2ms  max=636.93ms p(90)=236.78ms p(95)=398.98ms p(99.9)=534.41ms
     http_reqs......................: 30122   248.905801/s
     iteration_duration.............: avg=199.96ms min=55.03ms med=183.74ms max=637.22ms p(90)=237.42ms p(95)=400.03ms p(99.9)=535.03ms
     iterations.....................: 30022   248.079476/s
     success_rate...................: 100.00% ✓ 30022      ✗ 0    
     vus............................: 11      min=11       max=50 
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

     checks.........................: 100.00% ✓ 87675      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=6.91µs   min=1.18µs  med=3.16µs   max=4.29ms   p(90)=4.35µs   p(95)=4.84µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.62µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=204.45ms min=8.36ms  med=234.44ms max=427.52ms p(90)=260.69ms p(95)=271.97ms p(99.9)=339.35ms
       { expected_response:true }...: avg=204.45ms min=8.36ms  med=234.44ms max=427.52ms p(90)=260.69ms p(95)=271.97ms p(99.9)=339.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29325
     http_req_receiving.............: avg=97.53µs  min=33.61µs med=89.86µs  max=94.5ms   p(90)=120.97µs p(95)=133.15µs p(99.9)=570.64µs
     http_req_sending...............: avg=29.19µs  min=6.01µs  med=16.11µs  max=65.53ms  p(90)=20.71µs  p(95)=22.56µs  p(99.9)=791.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.33ms min=8.24ms  med=234.33ms max=426.45ms p(90)=260.56ms p(95)=271.83ms p(99.9)=339.25ms
     http_reqs......................: 29325   242.216878/s
     iteration_duration.............: avg=205.41ms min=37.13ms med=234.72ms max=463.2ms  p(90)=261.03ms p(95)=272.43ms p(99.9)=340.66ms
     iterations.....................: 29225   241.390904/s
     success_rate...................: 100.00% ✓ 29225      ✗ 0    
     vus............................: 29      min=29       max=50 
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

     checks.........................: 100.00% ✓ 887976      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 356 MB  3.0 MB/s
     http_req_blocked...............: avg=3.05µs   min=992ns   med=2.11µs  max=24.58ms  p(90)=3.52µs   p(95)=4.35µs   p(99.9)=34.18µs
     http_req_connecting............: avg=136ns    min=0s      med=0s      max=1.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.03ms  min=1.85ms  med=19.44ms max=308.1ms  p(90)=27.82ms  p(95)=31.1ms   p(99.9)=53.85ms
       { expected_response:true }...: avg=20.03ms  min=1.85ms  med=19.44ms max=308.1ms  p(90)=27.82ms  p(95)=31.1ms   p(99.9)=53.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 296092
     http_req_receiving.............: avg=118.92µs min=27.32µs med=51.31µs max=200.5ms  p(90)=102.04µs p(95)=264.76µs p(99.9)=10.22ms
     http_req_sending...............: avg=53.29µs  min=5.09µs  med=9.37µs  max=184ms    p(90)=17.88µs  p(95)=122.67µs p(99.9)=5.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.85ms  min=1.75ms  med=19.3ms  max=307.86ms p(90)=27.61ms  p(95)=30.79ms  p(99.9)=53.04ms
     http_reqs......................: 296092  2462.605774/s
     iteration_duration.............: avg=20.26ms  min=3.38ms  med=19.65ms max=318.1ms  p(90)=28.04ms  p(95)=31.34ms  p(99.9)=54.68ms
     iterations.....................: 295992  2461.774071/s
     success_rate...................: 100.00% ✓ 295992      ✗ 0     
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

     checks.........................: 100.00% ✓ 702921      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 282 MB  2.3 MB/s
     http_req_blocked...............: avg=2.99µs  min=1µs     med=2.16µs   max=6.68ms   p(90)=3.56µs  p(95)=4.31µs  p(99.9)=32.15µs 
     http_req_connecting............: avg=425ns   min=0s      med=0s       max=4.43ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.36ms min=1.88ms  med=17.36ms  max=554.32ms p(90)=54.46ms p(95)=71.29ms p(99.9)=178.63ms
       { expected_response:true }...: avg=25.36ms min=1.88ms  med=17.36ms  max=554.32ms p(90)=54.46ms p(95)=71.29ms p(99.9)=178.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 234407
     http_req_receiving.............: avg=710.1µs min=52.41µs med=110.74µs max=165.56ms p(90)=1.13ms  p(95)=1.79ms  p(99.9)=58.16ms 
     http_req_sending...............: avg=39.34µs min=5.2µs   med=9.62µs   max=150.92ms p(90)=17.87µs p(95)=104.5µs p(99.9)=2.31ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.61ms min=1.74ms  med=16.79ms  max=553.54ms p(90)=53.07ms p(95)=69.88ms p(99.9)=175.17ms
     http_reqs......................: 234407  1949.497391/s
     iteration_duration.............: avg=25.59ms min=2.72ms  med=17.58ms  max=554.54ms p(90)=54.69ms p(95)=71.54ms p(99.9)=180.75ms
     iterations.....................: 234307  1948.665719/s
     success_rate...................: 100.00% ✓ 234307      ✗ 0     
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

     checks.........................: 100.00% ✓ 560382      ✗ 0     
     data_received..................: 16 GB   136 MB/s
     data_sent......................: 225 MB  1.9 MB/s
     http_req_blocked...............: avg=3.42µs   min=982ns   med=2.38µs  max=10.81ms  p(90)=4.81µs   p(95)=5.99µs   p(99.9)=44.57µs
     http_req_connecting............: avg=293ns    min=0s      med=0s      max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.84ms  min=2.22ms  med=30.93ms max=339.18ms p(90)=42.45ms  p(95)=47.07ms  p(99.9)=83.37ms
       { expected_response:true }...: avg=31.84ms  min=2.22ms  med=30.93ms max=339.18ms p(90)=42.45ms  p(95)=47.07ms  p(99.9)=83.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 186894
     http_req_receiving.............: avg=115.07µs min=30.44µs med=61.43µs max=221.46ms p(90)=134.05µs p(95)=274.56µs p(99.9)=5.66ms 
     http_req_sending...............: avg=47.39µs  min=5.56µs  med=10.56µs max=64.26ms  p(90)=24.28µs  p(95)=134.01µs p(99.9)=3.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.68ms  min=2.16ms  med=30.79ms max=338.11ms p(90)=42.26ms  p(95)=46.83ms  p(99.9)=82.95ms
     http_reqs......................: 186894  1553.562489/s
     iteration_duration.............: avg=32.11ms  min=4.38ms  med=31.17ms max=359.04ms p(90)=42.69ms  p(95)=47.32ms  p(99.9)=84.5ms 
     iterations.....................: 186794  1552.731236/s
     success_rate...................: 100.00% ✓ 186794      ✗ 0     
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

     checks.........................: 100.00% ✓ 435393      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.43µs  min=1.04µs  med=2.34µs  max=3.93ms   p(90)=3.92µs   p(95)=4.61µs   p(99.9)=32.69µs
     http_req_connecting............: avg=725ns   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.08ms min=2.23ms  med=40.53ms max=331.51ms p(90)=57.65ms  p(95)=62.78ms  p(99.9)=89.07ms
       { expected_response:true }...: avg=41.08ms min=2.23ms  med=40.53ms max=331.51ms p(90)=57.65ms  p(95)=62.78ms  p(99.9)=89.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145231
     http_req_receiving.............: avg=84.6µs  min=30.07µs med=65.23µs max=72.47ms  p(90)=105.09µs p(95)=125.08µs p(99.9)=1.69ms 
     http_req_sending...............: avg=28.93µs min=5.34µs  med=11.21µs max=150.47ms p(90)=17.94µs  p(95)=21.77µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.97ms min=2.16ms  med=40.42ms max=328.65ms p(90)=57.54ms  p(95)=62.67ms  p(99.9)=88.74ms
     http_reqs......................: 145231  1207.363203/s
     iteration_duration.............: avg=41.33ms min=4.57ms  med=40.74ms max=347.19ms p(90)=57.88ms  p(95)=63ms     p(99.9)=89.67ms
     iterations.....................: 145131  1206.531863/s
     success_rate...................: 100.00% ✓ 145131      ✗ 0     
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

     checks.........................: 100.00% ✓ 182793     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   608 kB/s
     http_req_blocked...............: avg=4.51µs  min=1.03µs  med=2.56µs  max=5.05ms   p(90)=4.01µs   p(95)=4.56µs   p(99.9)=50.79µs 
     http_req_connecting............: avg=1.63µs  min=0s      med=0s      max=4.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.1ms  min=4.12ms  med=95.31ms max=368.68ms p(90)=118.35ms p(95)=130.25ms p(99.9)=228.54ms
       { expected_response:true }...: avg=98.1ms  min=4.12ms  med=95.31ms max=368.68ms p(90)=118.35ms p(95)=130.25ms p(99.9)=228.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61031
     http_req_receiving.............: avg=87.52µs min=31.25µs med=77.35µs max=146.02ms p(90)=111.81µs p(95)=124.33µs p(99.9)=891.02µs
     http_req_sending...............: avg=26.58µs min=5.56µs  med=12.86µs max=204.06ms p(90)=19.18µs  p(95)=21.2µs   p(99.9)=656.87µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.98ms min=4.02ms  med=95.2ms  max=367.96ms p(90)=118.24ms p(95)=130.13ms p(99.9)=228.2ms 
     http_reqs......................: 61031   506.112069/s
     iteration_duration.............: avg=98.49ms min=37.91ms med=95.54ms max=384.68ms p(90)=118.6ms  p(95)=130.64ms p(99.9)=230.04ms
     iterations.....................: 60931   505.282799/s
     success_rate...................: 100.00% ✓ 60931      ✗ 0    
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

     checks.........................: 100.00% ✓ 133575     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   444 kB/s
     http_req_blocked...............: avg=5.65µs   min=1.08µs  med=3.07µs   max=4.46ms   p(90)=4.41µs   p(95)=4.93µs   p(99.9)=971.91µs
     http_req_connecting............: avg=2.4µs    min=0s      med=0s       max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=944.31µs
     http_req_duration..............: avg=134.24ms min=5.91ms  med=131.53ms max=333.54ms p(90)=178.34ms p(95)=191.75ms p(99.9)=249.54ms
       { expected_response:true }...: avg=134.24ms min=5.91ms  med=131.53ms max=333.54ms p(90)=178.34ms p(95)=191.75ms p(99.9)=249.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44625
     http_req_receiving.............: avg=147.94µs min=33.31µs med=84.2µs   max=205.89ms p(90)=115.44µs p(95)=126.92µs p(99.9)=822.73µs
     http_req_sending...............: avg=22.85µs  min=5.7µs   med=14.95µs  max=97.38ms  p(90)=20.1µs   p(95)=21.96µs  p(99.9)=485.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.07ms min=5.73ms  med=131.39ms max=270.69ms p(90)=178.17ms p(95)=191.49ms p(99.9)=243.31ms
     http_reqs......................: 44625   369.545731/s
     iteration_duration.............: avg=134.79ms min=18.85ms med=131.84ms max=356.34ms p(90)=178.62ms p(95)=192.09ms p(99.9)=250.79ms
     iterations.....................: 44525   368.717617/s
     success_rate...................: 100.00% ✓ 44525      ✗ 0    
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

     checks.........................: 100.00% ✓ 86415      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=5.3µs    min=1.2µs   med=3.29µs   max=3.65ms   p(90)=4.52µs   p(95)=5.02µs   p(99.9)=656.93µs
     http_req_connecting............: avg=1.74µs   min=0s      med=0s       max=2.83ms   p(90)=0s       p(95)=0s       p(99.9)=607.73µs
     http_req_duration..............: avg=207.46ms min=6.44ms  med=191.64ms max=668.03ms p(90)=254.05ms p(95)=404.78ms p(99.9)=550.83ms
       { expected_response:true }...: avg=207.46ms min=6.44ms  med=191.64ms max=668.03ms p(90)=254.05ms p(95)=404.78ms p(99.9)=550.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28905
     http_req_receiving.............: avg=118.79µs min=33.01µs med=92.64µs  max=141.2ms  p(90)=123.49µs p(95)=135.91µs p(99.9)=780.19µs
     http_req_sending...............: avg=27.55µs  min=6.01µs  med=16.15µs  max=90.74ms  p(90)=20.77µs  p(95)=22.54µs  p(99.9)=749.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.31ms min=6.28ms  med=191.51ms max=667.89ms p(90)=253.87ms p(95)=404.66ms p(99.9)=550.7ms 
     http_reqs......................: 28905   238.870979/s
     iteration_duration.............: avg=208.42ms min=66.75ms med=192.05ms max=668.3ms  p(90)=254.47ms p(95)=405.65ms p(99.9)=551.28ms
     iterations.....................: 28805   238.044579/s
     success_rate...................: 100.00% ✓ 28805      ✗ 0    
     vus............................: 10      min=10       max=50 
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

     checks.........................: 100.00% ✓ 85515      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.17µs  med=3.3µs    max=4.17ms   p(90)=4.59µs   p(95)=5.1µs    p(99.9)=2.04ms  
     http_req_connecting............: avg=3.76µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=209.6ms  min=8.88ms  med=210.09ms max=413.65ms p(90)=239.31ms p(95)=247.11ms p(99.9)=310.3ms 
       { expected_response:true }...: avg=209.6ms  min=8.88ms  med=210.09ms max=413.65ms p(90)=239.31ms p(95)=247.11ms p(99.9)=310.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28605
     http_req_receiving.............: avg=103.78µs min=35.55µs med=94.83µs  max=89.34ms  p(90)=126.26µs p(95)=139.66µs p(99.9)=724.43µs
     http_req_sending...............: avg=35.97µs  min=6.16µs  med=17.04µs  max=137.42ms p(90)=21.82µs  p(95)=23.72µs  p(99.9)=732.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.46ms min=8.73ms  med=209.92ms max=412.93ms p(90)=239.17ms p(95)=246.96ms p(99.9)=310.19ms
     http_reqs......................: 28605   236.130591/s
     iteration_duration.............: avg=210.63ms min=54.47ms med=211.49ms max=460.16ms p(90)=239.61ms p(95)=247.5ms  p(99.9)=316.14ms
     iterations.....................: 28505   235.305104/s
     success_rate...................: 100.00% ✓ 28505      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

