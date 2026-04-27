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
| hive-router | v0.0.49 | 2,926 | 3,090 | 2,860 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,118 | 2,176 | 2,093 | 1.2% |  |
| grafbase | 0.53.3 | 2,071 | 2,129 | 2,055 | 1.2% |  |
| cosmo | 0.307.0 | 1,222 | 1,246 | 1,215 | 1.0% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 540 | 550 | 536 | 0.9% |  |
| apollo-router | v2.13.1 | 428 | 430 | 414 | 1.2% |  |
| hive-gateway | 2.5.25 | 249 | 254 | 247 | 1.1% |  |
| apollo-gateway | 2.13.3 | 243 | 246 | 242 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,383 | 2,515 | 2,354 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,972 | 2,023 | 1,947 | 1.2% |  |
| grafbase | 0.53.3 | 1,516 | 1,558 | 1,504 | 1.2% |  |
| cosmo | 0.307.0 | 1,177 | 1,189 | 1,170 | 0.6% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 528 | 541 | 524 | 1.2% |  |
| apollo-router | v2.13.1 | 399 | 409 | 396 | 1.1% |  |
| hive-gateway | 2.5.25 | 245 | 252 | 244 | 1.2% |  |
| apollo-gateway | 2.13.3 | 239 | 240 | 236 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1055058     ✗ 0     
     data_received..................: 31 GB   257 MB/s
     data_sent......................: 423 MB  3.5 MB/s
     http_req_blocked...............: avg=2.85µs   min=942ns   med=1.97µs  max=21.03ms  p(90)=3.08µs  p(95)=3.69µs   p(99.9)=29.14µs
     http_req_connecting............: avg=354ns    min=0s      med=0s      max=4.82ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.82ms  min=1.55ms  med=15.9ms  max=332.63ms p(90)=24.82ms p(95)=28.76ms  p(99.9)=51.39ms
       { expected_response:true }...: avg=16.82ms  min=1.55ms  med=15.9ms  max=332.63ms p(90)=24.82ms p(95)=28.76ms  p(99.9)=51.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 351786
     http_req_receiving.............: avg=126.71µs min=27.43µs med=47.3µs  max=143.29ms p(90)=91.8µs  p(95)=257.62µs p(99.9)=13.98ms
     http_req_sending...............: avg=59.12µs  min=5.1µs   med=8.61µs  max=203.33ms p(90)=14.46µs p(95)=115.43µs p(99.9)=10.09ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.63ms  min=1.47ms  med=15.76ms max=309.59ms p(90)=24.55ms p(95)=28.34ms  p(99.9)=49.76ms
     http_reqs......................: 351786  2926.797917/s
     iteration_duration.............: avg=17.05ms  min=2.05ms  med=16.1ms  max=344.76ms p(90)=25.05ms p(95)=29.03ms  p(99.9)=52.66ms
     iterations.....................: 351686  2925.965934/s
     success_rate...................: 100.00% ✓ 351686      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 764079      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=4.33µs   min=1.01µs  med=2.02µs   max=21.38ms  p(90)=3.04µs   p(95)=3.58µs  p(99.9)=30.24µs 
     http_req_connecting............: avg=1.93µs   min=0s      med=0s       max=21.34ms  p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.32ms  min=2.46ms  med=14.55ms  max=433.37ms p(90)=53.03ms  p(95)=71.8ms  p(99.9)=171.73ms
       { expected_response:true }...: avg=23.32ms  min=2.46ms  med=14.55ms  max=433.37ms p(90)=53.03ms  p(95)=71.8ms  p(99.9)=171.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 254793
     http_req_receiving.............: avg=681.96µs min=51.23µs med=109.36µs max=239.7ms  p(90)=963.57µs p(95)=1.49ms  p(99.9)=64.95ms 
     http_req_sending...............: avg=41.63µs  min=5.2µs   med=8.95µs   max=80.45ms  p(90)=14.29µs  p(95)=87.92µs p(99.9)=3.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.6ms   min=2.34ms  med=14.03ms  max=432.98ms p(90)=51.65ms  p(95)=70.18ms p(99.9)=169.71ms
     http_reqs......................: 254793  2118.045437/s
     iteration_duration.............: avg=23.54ms  min=3.25ms  med=14.76ms  max=433.57ms p(90)=53.26ms  p(95)=72.03ms p(99.9)=173.39ms
     iterations.....................: 254693  2117.214156/s
     success_rate...................: 100.00% ✓ 254693      ✗ 0     
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

     checks.........................: 100.00% ✓ 746973      ✗ 0     
     data_received..................: 22 GB   182 MB/s
     data_sent......................: 299 MB  2.5 MB/s
     http_req_blocked...............: avg=3.23µs   min=922ns   med=2.19µs  max=18.64ms  p(90)=3.65µs  p(95)=4.46µs   p(99.9)=42.55µs
     http_req_connecting............: avg=492ns    min=0s      med=0s      max=5.31ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.85ms  min=1.94ms  med=23.61ms max=350.18ms p(90)=28.66ms p(95)=30.99ms  p(99.9)=52.74ms
       { expected_response:true }...: avg=23.85ms  min=1.94ms  med=23.61ms max=350.18ms p(90)=28.66ms p(95)=30.99ms  p(99.9)=52.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 249091
     http_req_receiving.............: avg=122.41µs min=28.77µs med=55.76µs max=242.03ms p(90)=98.87µs p(95)=187.02µs p(99.9)=9.98ms 
     http_req_sending...............: avg=48.38µs  min=4.93µs  med=9.94µs  max=184.13ms p(90)=17.98µs p(95)=115.14µs p(99.9)=3.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.68ms  min=1.83ms  med=23.5ms  max=188.49ms p(90)=28.49ms p(95)=30.71ms  p(99.9)=51.45ms
     http_reqs......................: 249091  2071.451638/s
     iteration_duration.............: avg=24.08ms  min=3.55ms  med=23.82ms max=378.39ms p(90)=28.88ms p(95)=31.23ms  p(99.9)=53.36ms
     iterations.....................: 248991  2070.620034/s
     success_rate...................: 100.00% ✓ 248991      ✗ 0     
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

     checks.........................: 100.00% ✓ 440640      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3.05µs  min=1.05µs  med=2.04µs  max=4.22ms   p(90)=3.21µs  p(95)=3.79µs   p(99.9)=34.26µs
     http_req_connecting............: avg=732ns   min=0s      med=0s      max=4.18ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.61ms min=2.17ms  med=40.07ms max=352.77ms p(90)=57.37ms p(95)=62.72ms  p(99.9)=87.65ms
       { expected_response:true }...: avg=40.61ms min=2.17ms  med=40.07ms max=352.77ms p(90)=57.37ms p(95)=62.72ms  p(99.9)=87.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146980
     http_req_receiving.............: avg=91.91µs min=28.63µs med=58.43µs max=142.66ms p(90)=90.91µs p(95)=107.87µs p(99.9)=1.97ms 
     http_req_sending...............: avg=24.09µs min=5.32µs  med=9.76µs  max=136.61ms p(90)=14.46µs p(95)=18.39µs  p(99.9)=1.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.5ms  min=2.08ms  med=39.98ms max=218.49ms p(90)=57.25ms p(95)=62.6ms   p(99.9)=86.71ms
     http_reqs......................: 146980  1222.012931/s
     iteration_duration.............: avg=40.84ms min=3.96ms  med=40.27ms max=368.57ms p(90)=57.57ms p(95)=62.9ms   p(99.9)=88.21ms
     iterations.....................: 146880  1221.181517/s
     success_rate...................: 100.00% ✓ 146880      ✗ 0     
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

     checks.........................: 100.00% ✓ 195057     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   649 kB/s
     http_req_blocked...............: avg=4.7µs   min=1.11µs  med=2.63µs  max=4.4ms    p(90)=4.23µs   p(95)=4.79µs   p(99.9)=47.14µs 
     http_req_connecting............: avg=1.74µs  min=0s      med=0s      max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.91ms min=4.09ms  med=89.04ms max=369.84ms p(90)=113.41ms p(95)=126.47ms p(99.9)=218.41ms
       { expected_response:true }...: avg=91.91ms min=4.09ms  med=89.04ms max=369.84ms p(90)=113.41ms p(95)=126.47ms p(99.9)=218.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65119
     http_req_receiving.............: avg=87.45µs min=31.28µs med=75.56µs max=98.7ms   p(90)=110.39µs p(95)=123.27µs p(99.9)=814.55µs
     http_req_sending...............: avg=27.18µs min=5.42µs  med=13.01µs max=146.09ms p(90)=19.81µs  p(95)=22.01µs  p(99.9)=716.13µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.8ms  min=4.04ms  med=88.94ms max=334.44ms p(90)=113.3ms  p(95)=126.34ms p(99.9)=217.91ms
     http_reqs......................: 65119   540.126544/s
     iteration_duration.............: avg=92.29ms min=21.64ms med=89.28ms max=387.36ms p(90)=113.65ms p(95)=126.77ms p(99.9)=220.4ms 
     iterations.....................: 65019   539.297099/s
     success_rate...................: 100.00% ✓ 65019      ✗ 0    
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

     checks.........................: 100.00% ✓ 154896     ✗ 0    
     data_received..................: 4.5 GB  38 MB/s
     data_sent......................: 62 MB   515 kB/s
     http_req_blocked...............: avg=5.28µs   min=1.2µs   med=2.95µs   max=4.1ms    p(90)=4.28µs   p(95)=4.79µs   p(99.9)=90.92µs 
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.76ms min=5.33ms  med=115.47ms max=361.06ms p(90)=140.21ms p(95)=147.35ms p(99.9)=180.79ms
       { expected_response:true }...: avg=115.76ms min=5.33ms  med=115.47ms max=361.06ms p(90)=140.21ms p(95)=147.35ms p(99.9)=180.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51732
     http_req_receiving.............: avg=84.98µs  min=31.75µs med=78.78µs  max=68.64ms  p(90)=109.5µs  p(95)=121.09µs p(99.9)=742.26µs
     http_req_sending...............: avg=27.13µs  min=5.84µs  med=14.27µs  max=148.19ms p(90)=19.31µs  p(95)=21.08µs  p(99.9)=637.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.65ms min=5.23ms  med=115.37ms max=339.11ms p(90)=140.1ms  p(95)=147.23ms p(99.9)=180.36ms
     http_reqs......................: 51732   428.701513/s
     iteration_duration.............: avg=116.24ms min=18.44ms med=115.74ms max=379.88ms p(90)=140.47ms p(95)=147.59ms p(99.9)=183.95ms
     iterations.....................: 51632   427.872816/s
     success_rate...................: 100.00% ✓ 51632      ✗ 0    
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

     checks.........................: 100.00% ✓ 90315      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   300 kB/s
     http_req_blocked...............: avg=6.88µs   min=1.22µs  med=3.34µs   max=4.09ms   p(90)=4.7µs    p(95)=5.31µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.39µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=198.46ms min=6.32ms  med=182.04ms max=657.13ms p(90)=240.1ms  p(95)=398.26ms p(99.9)=544.16ms
       { expected_response:true }...: avg=198.46ms min=6.32ms  med=182.04ms max=657.13ms p(90)=240.1ms  p(95)=398.26ms p(99.9)=544.16ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30205
     http_req_receiving.............: avg=99.75µs  min=32.66µs med=94.29µs  max=25.98ms  p(90)=126.7µs  p(95)=139.81µs p(99.9)=451.47µs
     http_req_sending...............: avg=31.06µs  min=5.82µs  med=17.32µs  max=108.36ms p(90)=22.52µs  p(95)=24.45µs  p(99.9)=553.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.32ms min=6.18ms  med=181.9ms  max=657.03ms p(90)=239.99ms p(95)=398.13ms p(99.9)=544.05ms
     http_reqs......................: 30205   249.867588/s
     iteration_duration.............: avg=199.41ms min=23.69ms med=182.42ms max=657.34ms p(90)=240.6ms  p(95)=398.94ms p(99.9)=544.4ms 
     iterations.....................: 30105   249.040349/s
     success_rate...................: 100.00% ✓ 30105      ✗ 0    
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

     checks.........................: 100.00% ✓ 88191      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=6.72µs   min=1.24µs  med=3.07µs   max=4.16ms   p(90)=4.26µs   p(95)=4.75µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=3.5µs    min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=203.3ms  min=8.52ms  med=198.46ms max=399.18ms p(90)=262.22ms p(95)=270.66ms p(99.9)=346.42ms
       { expected_response:true }...: avg=203.3ms  min=8.52ms  med=198.46ms max=399.18ms p(90)=262.22ms p(95)=270.66ms p(99.9)=346.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29497
     http_req_receiving.............: avg=92.71µs  min=33.76µs med=86.56µs  max=27.19ms  p(90)=118.51µs p(95)=130.22µs p(99.9)=567.26µs
     http_req_sending...............: avg=27.12µs  min=6.2µs   med=15.52µs  max=84.94ms  p(90)=20.58µs  p(95)=22.49µs  p(99.9)=550.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.18ms min=8.42ms  med=198.33ms max=398.57ms p(90)=262.13ms p(95)=270.55ms p(99.9)=345.91ms
     http_reqs......................: 29497   243.5729/s
     iteration_duration.............: avg=204.23ms min=55.28ms med=199.81ms max=408.99ms p(90)=262.53ms p(95)=271.01ms p(99.9)=349.03ms
     iterations.....................: 29397   242.747145/s
     success_rate...................: 100.00% ✓ 29397      ✗ 0    
     vus............................: 39      min=39       max=50 
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

     checks.........................: 100.00% ✓ 859578      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=3.86µs   min=972ns  med=2.15µs  max=11.14ms  p(90)=3.5µs    p(95)=4.29µs   p(99.9)=31.4µs 
     http_req_connecting............: avg=1.23µs   min=0s     med=0s      max=10.9ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.7ms   min=1.8ms  med=20.25ms max=315.91ms p(90)=28.57ms  p(95)=31.61ms  p(99.9)=52.62ms
       { expected_response:true }...: avg=20.7ms   min=1.8ms  med=20.25ms max=315.91ms p(90)=28.57ms  p(95)=31.61ms  p(99.9)=52.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286626
     http_req_receiving.............: avg=109.91µs min=27.4µs med=52.95µs max=126.6ms  p(90)=100.04µs p(95)=246.95µs p(99.9)=8.4ms  
     http_req_sending...............: avg=51.98µs  min=5.12µs med=9.56µs  max=87.54ms  p(90)=17.31µs  p(95)=120.77µs p(99.9)=5.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.54ms  min=1.74ms med=20.12ms max=314.75ms p(90)=28.37ms  p(95)=31.32ms  p(99.9)=51.63ms
     http_reqs......................: 286626  2383.901583/s
     iteration_duration.............: avg=20.93ms  min=3.22ms med=20.46ms max=332.37ms p(90)=28.79ms  p(95)=31.85ms  p(99.9)=53.31ms
     iterations.....................: 286526  2383.069871/s
     success_rate...................: 100.00% ✓ 286526      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 711309      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=2.9µs    min=1.01µs  med=2.12µs   max=5.63ms   p(90)=3.42µs  p(95)=4.1µs    p(99.9)=30.42µs 
     http_req_connecting............: avg=419ns    min=0s      med=0s       max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.06ms  min=1.87ms  med=17.04ms  max=499.53ms p(90)=53.66ms p(95)=70.62ms  p(99.9)=189.34ms
       { expected_response:true }...: avg=25.06ms  min=1.87ms  med=17.04ms  max=499.53ms p(90)=53.66ms p(95)=70.62ms  p(99.9)=189.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237203
     http_req_receiving.............: avg=676.35µs min=51.08µs med=108.07µs max=154.87ms p(90)=1.12ms  p(95)=1.77ms   p(99.9)=56.21ms 
     http_req_sending...............: avg=42.77µs  min=5.3µs   med=9.5µs    max=205.77ms p(90)=17.37µs p(95)=106.02µs p(99.9)=2.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.34ms  min=1.76ms  med=16.49ms  max=499.42ms p(90)=52.4ms  p(95)=69.07ms  p(99.9)=186.36ms
     http_reqs......................: 237203  1972.746372/s
     iteration_duration.............: avg=25.29ms  min=2.72ms  med=17.26ms  max=499.74ms p(90)=53.9ms  p(95)=70.87ms  p(99.9)=191.32ms
     iterations.....................: 237103  1971.914702/s
     success_rate...................: 100.00% ✓ 237103      ✗ 0     
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

     checks.........................: 100.00% ✓ 547173      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.81µs   min=992ns   med=2.3µs   max=8.32ms   p(90)=4.49µs   p(95)=5.74µs   p(99.9)=45.15µs
     http_req_connecting............: avg=852ns    min=0s      med=0s      max=7.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.61ms  min=2.45ms  med=31.75ms max=333.61ms p(90)=43.23ms  p(95)=47.89ms  p(99.9)=87.63ms
       { expected_response:true }...: avg=32.61ms  min=2.45ms  med=31.75ms max=333.61ms p(90)=43.23ms  p(95)=47.89ms  p(99.9)=87.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182491
     http_req_receiving.............: avg=110.26µs min=30.09µs med=61.7µs  max=95.7ms   p(90)=135.27µs p(95)=286.02µs p(99.9)=5.54ms 
     http_req_sending...............: avg=49.44µs  min=5.11µs  med=10.35µs max=218.92ms p(90)=24.53µs  p(95)=136.57µs p(99.9)=3.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.45ms  min=2.33ms  med=31.61ms max=330.74ms p(90)=43.05ms  p(95)=47.66ms  p(99.9)=87.05ms
     http_reqs......................: 182491  1516.947395/s
     iteration_duration.............: avg=32.88ms  min=3.85ms  med=31.98ms max=350.98ms p(90)=43.47ms  p(95)=48.13ms  p(99.9)=88.56ms
     iterations.....................: 182391  1516.11615/s
     success_rate...................: 100.00% ✓ 182391      ✗ 0     
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

     checks.........................: 100.00% ✓ 424665      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.05µs  min=1.09µs  med=2.21µs  max=3.44ms   p(90)=3.7µs    p(95)=4.38µs   p(99.9)=37.1µs 
     http_req_connecting............: avg=474ns   min=0s      med=0s      max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.13ms min=2.36ms  med=41.64ms max=323ms    p(90)=59.24ms  p(95)=64.59ms  p(99.9)=91.58ms
       { expected_response:true }...: avg=42.13ms min=2.36ms  med=41.64ms max=323ms    p(90)=59.24ms  p(95)=64.59ms  p(99.9)=91.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141655
     http_req_receiving.............: avg=84.32µs min=28.43µs med=64.98µs max=230.04ms p(90)=102.96µs p(95)=122.75µs p(99.9)=1.72ms 
     http_req_sending...............: avg=26.88µs min=5.07µs  med=10.68µs max=63.46ms  p(90)=17µs     p(95)=20.9µs   p(99.9)=1.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.02ms min=2.25ms  med=41.53ms max=296.94ms p(90)=59.13ms  p(95)=64.48ms  p(99.9)=91.02ms
     http_reqs......................: 141655  1177.576657/s
     iteration_duration.............: avg=42.37ms min=3.99ms  med=41.85ms max=338.14ms p(90)=59.44ms  p(95)=64.8ms   p(99.9)=92.09ms
     iterations.....................: 141555  1176.745357/s
     success_rate...................: 100.00% ✓ 141555      ✗ 0     
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

     checks.........................: 100.00% ✓ 191064     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   635 kB/s
     http_req_blocked...............: avg=4.28µs  min=1.15µs  med=2.7µs   max=3.55ms   p(90)=4.28µs   p(95)=4.85µs   p(99.9)=51.32µs 
     http_req_connecting............: avg=1.3µs   min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.83ms min=4.27ms  med=91.44ms max=334.25ms p(90)=113.8ms  p(95)=125.74ms p(99.9)=223.19ms
       { expected_response:true }...: avg=93.83ms min=4.27ms  med=91.44ms max=334.25ms p(90)=113.8ms  p(95)=125.74ms p(99.9)=223.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63788
     http_req_receiving.............: avg=90.35µs min=30.33µs med=78.01µs max=181.16ms p(90)=112.85µs p(95)=125.42µs p(99.9)=967.44µs
     http_req_sending...............: avg=22.27µs min=5.64µs  med=13.27µs max=57.1ms   p(90)=19.99µs  p(95)=22.23µs  p(99.9)=733.2µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.72ms min=4.15ms  med=91.33ms max=325.24ms p(90)=113.67ms p(95)=125.6ms  p(99.9)=222.81ms
     http_reqs......................: 63788   528.905812/s
     iteration_duration.............: avg=94.22ms min=19.47ms med=91.68ms max=358.1ms  p(90)=114.05ms p(95)=126.07ms p(99.9)=225.23ms
     iterations.....................: 63688   528.07665/s
     success_rate...................: 100.00% ✓ 63688      ✗ 0    
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

     checks.........................: 100.00% ✓ 144432     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   480 kB/s
     http_req_blocked...............: avg=5.31µs   min=1.16µs  med=3.25µs   max=4.17ms   p(90)=4.66µs   p(95)=5.21µs   p(99.9)=161.48µs
     http_req_connecting............: avg=1.84µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=101.3µs 
     http_req_duration..............: avg=124.14ms min=5.93ms  med=121.57ms max=340.34ms p(90)=164.73ms p(95)=176.49ms p(99.9)=225.09ms
       { expected_response:true }...: avg=124.14ms min=5.93ms  med=121.57ms max=340.34ms p(90)=164.73ms p(95)=176.49ms p(99.9)=225.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48244
     http_req_receiving.............: avg=94.15µs  min=31.53µs med=85.53µs  max=97.39ms  p(90)=117.37µs p(95)=129.34µs p(99.9)=669.47µs
     http_req_sending...............: avg=29.33µs  min=5.66µs  med=16.18µs  max=166.69ms p(90)=21.18µs  p(95)=22.96µs  p(99.9)=623.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.02ms min=5.74ms  med=121.44ms max=312.87ms p(90)=164.6ms  p(95)=176.36ms p(99.9)=224.33ms
     http_reqs......................: 48244   399.580446/s
     iteration_duration.............: avg=124.65ms min=16.93ms med=121.88ms max=355.04ms p(90)=165.02ms p(95)=176.79ms p(99.9)=228.17ms
     iterations.....................: 48144   398.752197/s
     success_rate...................: 100.00% ✓ 48144      ✗ 0    
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

     checks.........................: 100.00% ✓ 88806      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.34µs  med=3.38µs   max=3.8ms    p(90)=4.78µs   p(95)=5.35µs   p(99.9)=638.39µs
     http_req_connecting............: avg=1.67µs   min=0s      med=0s       max=2.49ms   p(90)=0s       p(95)=0s       p(99.9)=579.5µs 
     http_req_duration..............: avg=201.88ms min=6.52ms  med=184.81ms max=622.4ms  p(90)=238.96ms p(95)=411.21ms p(99.9)=547.3ms 
       { expected_response:true }...: avg=201.88ms min=6.52ms  med=184.81ms max=622.4ms  p(90)=238.96ms p(95)=411.21ms p(99.9)=547.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29702
     http_req_receiving.............: avg=99.92µs  min=34.81µs med=95.62µs  max=6.07ms   p(90)=128.1µs  p(95)=141.12µs p(99.9)=641.58µs
     http_req_sending...............: avg=38.46µs  min=6.29µs  med=17.81µs  max=92.32ms  p(90)=22.75µs  p(95)=24.46µs  p(99.9)=724.7µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.74ms min=6.37ms  med=184.69ms max=622.29ms p(90)=238.78ms p(95)=411.13ms p(99.9)=547.18ms
     http_reqs......................: 29702   245.321768/s
     iteration_duration.............: avg=202.84ms min=56.4ms  med=185.17ms max=622.66ms p(90)=239.51ms p(95)=411.76ms p(99.9)=547.58ms
     iterations.....................: 29602   244.495824/s
     success_rate...................: 100.00% ✓ 29602      ✗ 0    
     vus............................: 20      min=20       max=50 
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

     checks.........................: 100.00% ✓ 86547      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=6.43µs   min=1.32µs  med=3.27µs   max=4.1ms    p(90)=4.48µs   p(95)=4.97µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=2.93µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=207.15ms min=8.68ms  med=205.91ms max=383.33ms p(90)=219.62ms p(95)=225.93ms p(99.9)=294.15ms
       { expected_response:true }...: avg=207.15ms min=8.68ms  med=205.91ms max=383.33ms p(90)=219.62ms p(95)=225.93ms p(99.9)=294.15ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28949
     http_req_receiving.............: avg=95.84µs  min=34.37µs med=91.82µs  max=8.3ms    p(90)=122.69µs p(95)=135.6µs  p(99.9)=586.42µs
     http_req_sending...............: avg=21.3µs   min=6.05µs  med=16.55µs  max=23.62ms  p(90)=21.06µs  p(95)=22.89µs  p(99.9)=596.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.03ms min=8.53ms  med=205.8ms  max=383.05ms p(90)=219.51ms p(95)=225.81ms p(99.9)=294.04ms
     http_reqs......................: 28949   239.030847/s
     iteration_duration.............: avg=208.1ms  min=28.48ms med=206.28ms max=392.29ms p(90)=219.88ms p(95)=226.2ms  p(99.9)=295.09ms
     iterations.....................: 28849   238.20515/s
     success_rate...................: 100.00% ✓ 28849      ✗ 0    
     vus............................: 47      min=47       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

