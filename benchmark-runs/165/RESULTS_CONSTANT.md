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
| hive-router | v0.0.49 | 2,924 | 3,120 | 2,889 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,132 | 2,186 | 2,116 | 1.1% |  |
| grafbase | 0.53.3 | 2,030 | 2,099 | 2,008 | 1.5% |  |
| cosmo | 0.307.0 | 1,243 | 1,266 | 1,235 | 0.8% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 540 | 550 | 534 | 1.0% |  |
| apollo-router | v2.13.1 | 432 | 441 | 429 | 1.0% |  |
| hive-gateway | 2.5.25 | 251 | 255 | 248 | 0.9% |  |
| apollo-gateway | 2.13.3 | 244 | 245 | 242 | 0.4% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,385 | 2,503 | 2,332 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,979 | 2,027 | 1,953 | 1.3% |  |
| grafbase | 0.53.3 | 1,518 | 1,562 | 1,506 | 1.4% |  |
| cosmo | 0.307.0 | 1,203 | 1,209 | 1,199 | 0.3% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 517 | 529 | 511 | 1.1% |  |
| apollo-router | v2.13.1 | 370 | 381 | 365 | 1.4% |  |
| hive-gateway | 2.5.25 | 239 | 243 | 236 | 1.0% |  |
| apollo-gateway | 2.13.3 | 235 | 239 | 232 | 0.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1054113     ✗ 0     
     data_received..................: 31 GB   257 MB/s
     data_sent......................: 422 MB  3.5 MB/s
     http_req_blocked...............: avg=2.96µs   min=972ns   med=2.36µs  max=15.18ms  p(90)=3.5µs   p(95)=4.11µs   p(99.9)=34.55µs
     http_req_connecting............: avg=121ns    min=0s      med=0s      max=2.16ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.83ms  min=1.65ms  med=15.84ms max=384.97ms p(90)=25.05ms p(95)=29.14ms  p(99.9)=52.17ms
       { expected_response:true }...: avg=16.83ms  min=1.65ms  med=15.84ms max=384.97ms p(90)=25.05ms p(95)=29.14ms  p(99.9)=52.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 351471
     http_req_receiving.............: avg=139.38µs min=27.97µs med=48.91µs max=195.88ms p(90)=95.65µs p(95)=272.74µs p(99.9)=16.11ms
     http_req_sending...............: avg=59.51µs  min=5.25µs  med=9.37µs  max=155.25ms p(90)=15.71µs p(95)=121.92µs p(99.9)=10.77ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.63ms  min=1.58ms  med=15.69ms max=189.97ms p(90)=24.76ms p(95)=28.71ms  p(99.9)=50.48ms
     http_reqs......................: 351471  2924.064981/s
     iteration_duration.............: avg=17.06ms  min=2.13ms  med=16.05ms max=394.07ms p(90)=25.28ms p(95)=29.41ms  p(99.9)=53.25ms
     iterations.....................: 351371  2923.23303/s
     success_rate...................: 100.00% ✓ 351371      ✗ 0     
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

     checks.........................: 100.00% ✓ 769317      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=3.16µs   min=1.02µs  med=2.4µs    max=4.09ms   p(90)=3.57µs   p(95)=4.16µs   p(99.9)=34.01µs 
     http_req_connecting............: avg=420ns    min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.15ms  min=2.43ms  med=14.83ms  max=352.34ms p(90)=51.76ms  p(95)=69.82ms  p(99.9)=167.9ms 
       { expected_response:true }...: avg=23.15ms  min=2.43ms  med=14.83ms  max=352.34ms p(90)=51.76ms  p(95)=69.82ms  p(99.9)=167.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 256539
     http_req_receiving.............: avg=649.43µs min=51.92µs med=108.12µs max=337.47ms p(90)=967.73µs p(95)=1.52ms   p(99.9)=58.72ms 
     http_req_sending...............: avg=46.97µs  min=5.5µs   med=9.76µs   max=124.82ms p(90)=15.95µs  p(95)=108.91µs p(99.9)=3.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.45ms  min=2.31ms  med=14.33ms  max=293.63ms p(90)=50.37ms  p(95)=68.39ms  p(99.9)=165.02ms
     http_reqs......................: 256539  2132.599467/s
     iteration_duration.............: avg=23.38ms  min=3.13ms  med=15.06ms  max=361.67ms p(90)=52ms     p(95)=70.08ms  p(99.9)=169.74ms
     iterations.....................: 256439  2131.76817/s
     success_rate...................: 100.00% ✓ 256439      ✗ 0     
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

     checks.........................: 100.00% ✓ 732198      ✗ 0     
     data_received..................: 22 GB   178 MB/s
     data_sent......................: 293 MB  2.4 MB/s
     http_req_blocked...............: avg=3.5µs    min=1.1µs   med=2.66µs  max=13.2ms   p(90)=4.14µs   p(95)=4.89µs   p(99.9)=42.35µs
     http_req_connecting............: avg=323ns    min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.33ms  min=2.04ms  med=24.09ms max=296.85ms p(90)=29.25ms  p(95)=31.51ms  p(99.9)=53.02ms
       { expected_response:true }...: avg=24.33ms  min=2.04ms  med=24.09ms max=296.85ms p(90)=29.25ms  p(95)=31.51ms  p(99.9)=53.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244166
     http_req_receiving.............: avg=111.11µs min=30.67µs med=60.38µs max=141.87ms p(90)=102.82µs p(95)=195.08µs p(99.9)=8.32ms 
     http_req_sending...............: avg=45.8µs   min=5.18µs  med=10.84µs max=145.35ms p(90)=17.9µs   p(95)=117.97µs p(99.9)=3.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.17ms  min=1.91ms  med=23.97ms max=280.35ms p(90)=29.07ms  p(95)=31.27ms  p(99.9)=51.91ms
     http_reqs......................: 244166  2030.386919/s
     iteration_duration.............: avg=24.57ms  min=3.31ms  med=24.31ms max=333.6ms  p(90)=29.47ms  p(95)=31.76ms  p(99.9)=53.62ms
     iterations.....................: 244066  2029.555359/s
     success_rate...................: 100.00% ✓ 244066      ✗ 0     
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

     checks.........................: 100.00% ✓ 448527      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.2µs   min=1µs     med=2.43µs  max=6.77ms   p(90)=3.67µs  p(95)=4.26µs   p(99.9)=36.93µs
     http_req_connecting............: avg=398ns   min=0s      med=0s      max=2.82ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.89ms min=2.18ms  med=39.37ms max=328.55ms p(90)=56.22ms p(95)=61.32ms  p(99.9)=86.04ms
       { expected_response:true }...: avg=39.89ms min=2.18ms  med=39.37ms max=328.55ms p(90)=56.22ms p(95)=61.32ms  p(99.9)=86.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149609
     http_req_receiving.............: avg=82.27µs min=29.11µs med=61.59µs max=27.26ms  p(90)=95.89µs p(95)=113.52µs p(99.9)=2ms    
     http_req_sending...............: avg=26.27µs min=5.34µs  med=10.58µs max=160.39ms p(90)=15.79µs p(95)=19.86µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.78ms min=2.09ms  med=39.27ms max=328.34ms p(90)=56.11ms p(95)=61.19ms  p(99.9)=85.73ms
     http_reqs......................: 149609  1243.823493/s
     iteration_duration.............: avg=40.12ms min=4.3ms   med=39.58ms max=335.43ms p(90)=56.42ms p(95)=61.52ms  p(99.9)=86.78ms
     iterations.....................: 149509  1242.99211/s
     success_rate...................: 100.00% ✓ 149509      ✗ 0     
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

     checks.........................: 100.00% ✓ 194988     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   649 kB/s
     http_req_blocked...............: avg=4.1µs    min=1.18µs  med=2.85µs  max=3.34ms   p(90)=4.33µs   p(95)=4.93µs   p(99.9)=44.57µs 
     http_req_connecting............: avg=956ns    min=0s      med=0s      max=3.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.95ms  min=4.16ms  med=88.55ms max=353.04ms p(90)=116.29ms p(95)=130.62ms p(99.9)=224.74ms
       { expected_response:true }...: avg=91.95ms  min=4.16ms  med=88.55ms max=353.04ms p(90)=116.29ms p(95)=130.62ms p(99.9)=224.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65096
     http_req_receiving.............: avg=138.25µs min=29.43µs med=75.41µs max=246.58ms p(90)=109.08µs p(95)=121.47µs p(99.9)=1.09ms  
     http_req_sending...............: avg=19.46µs  min=5.57µs  med=13.15µs max=21.04ms  p(90)=19.45µs  p(95)=21.69µs  p(99.9)=650.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.8ms   min=4.06ms  med=88.44ms max=259.12ms p(90)=116.13ms p(95)=130.43ms p(99.9)=221.66ms
     http_reqs......................: 65096   540.041551/s
     iteration_duration.............: avg=92.32ms  min=21.61ms med=88.79ms max=360.54ms p(90)=116.54ms p(95)=130.92ms p(99.9)=226.26ms
     iterations.....................: 64996   539.211943/s
     success_rate...................: 100.00% ✓ 64996      ✗ 0    
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

     checks.........................: 100.00% ✓ 156348     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   520 kB/s
     http_req_blocked...............: avg=5.19µs   min=1.23µs  med=3.42µs   max=9.05ms   p(90)=4.84µs   p(95)=5.41µs   p(99.9)=64.15µs 
     http_req_connecting............: avg=1.48µs   min=0s      med=0s       max=8.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.69ms min=5.34ms  med=114.4ms  max=346.53ms p(90)=138.45ms p(95)=145.73ms p(99.9)=176.94ms
       { expected_response:true }...: avg=114.69ms min=5.34ms  med=114.4ms  max=346.53ms p(90)=138.45ms p(95)=145.73ms p(99.9)=176.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52216
     http_req_receiving.............: avg=92.15µs  min=31.95µs med=84.67µs  max=87.78ms  p(90)=115.63µs p(95)=127.93µs p(99.9)=726.84µs
     http_req_sending...............: avg=29.34µs  min=6.06µs  med=16.22µs  max=179.65ms p(90)=21.44µs  p(95)=23.17µs  p(99.9)=673.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.57ms min=5.22ms  med=114.28ms max=346.36ms p(90)=138.34ms p(95)=145.62ms p(99.9)=176.07ms
     http_reqs......................: 52216   432.679011/s
     iteration_duration.............: avg=115.16ms min=17ms    med=114.69ms max=354.96ms p(90)=138.7ms  p(95)=145.98ms p(99.9)=181.35ms
     iterations.....................: 52116   431.850378/s
     success_rate...................: 100.00% ✓ 52116      ✗ 0    
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

     checks.........................: 100.00% ✓ 90837      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   302 kB/s
     http_req_blocked...............: avg=7.05µs   min=1.29µs  med=3.46µs   max=4.08ms   p(90)=4.87µs   p(95)=5.51µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.32µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=197.36ms min=6.31ms  med=179.83ms max=650.92ms p(90)=235.05ms p(95)=411.82ms p(99.9)=545.09ms
       { expected_response:true }...: avg=197.36ms min=6.31ms  med=179.83ms max=650.92ms p(90)=235.05ms p(95)=411.82ms p(99.9)=545.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30379
     http_req_receiving.............: avg=172.66µs min=32.83µs med=94.69µs  max=241.67ms p(90)=128.5µs  p(95)=142.03µs p(99.9)=1.25ms  
     http_req_sending...............: avg=24.45µs  min=6.46µs  med=17.48µs  max=40.74ms  p(90)=22.86µs  p(95)=24.81µs  p(99.9)=536.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.16ms min=6.18ms  med=179.68ms max=650.79ms p(90)=234.81ms p(95)=411.72ms p(99.9)=544.98ms
     http_reqs......................: 30379   251.264209/s
     iteration_duration.............: avg=198.28ms min=44.72ms med=180.17ms max=651.23ms p(90)=235.48ms p(95)=412.46ms p(99.9)=545.35ms
     iterations.....................: 30279   250.43711/s
     success_rate...................: 100.00% ✓ 30279      ✗ 0    
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

     checks.........................: 100.00% ✓ 88431      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=6.94µs   min=1.26µs  med=3.27µs   max=4.09ms   p(90)=4.52µs   p(95)=5.06µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.49µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=202.74ms min=8.46ms  med=222.27ms max=413.05ms p(90)=233.39ms p(95)=239.13ms p(99.9)=301.4ms 
       { expected_response:true }...: avg=202.74ms min=8.46ms  med=222.27ms max=413.05ms p(90)=233.39ms p(95)=239.13ms p(99.9)=301.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29577
     http_req_receiving.............: avg=99.75µs  min=33.11µs med=90.39µs  max=161.38ms p(90)=121.64µs p(95)=134.36µs p(99.9)=489.65µs
     http_req_sending...............: avg=23.65µs  min=6.4µs   med=16.43µs  max=56.17ms  p(90)=21.17µs  p(95)=22.94µs  p(99.9)=523.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.61ms min=8.36ms  med=222.17ms max=410.78ms p(90)=233.28ms p(95)=239ms    p(99.9)=301.16ms
     http_reqs......................: 29577   244.270788/s
     iteration_duration.............: avg=203.68ms min=54.95ms med=222.53ms max=424.47ms p(90)=233.65ms p(95)=239.61ms p(99.9)=305.97ms
     iterations.....................: 29477   243.444907/s
     success_rate...................: 100.00% ✓ 29477      ✗ 0    
     vus............................: 44      min=44       max=50 
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

     checks.........................: 100.00% ✓ 859884      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=3.57µs   min=1.09µs  med=2.62µs  max=18.5ms   p(90)=4.08µs   p(95)=4.9µs    p(99.9)=37.37µs
     http_req_connecting............: avg=249ns    min=0s      med=0s      max=3.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.69ms  min=1.8ms   med=20.18ms max=345.23ms p(90)=28.71ms  p(95)=31.78ms  p(99.9)=53.93ms
       { expected_response:true }...: avg=20.69ms  min=1.8ms   med=20.18ms max=345.23ms p(90)=28.71ms  p(95)=31.78ms  p(99.9)=53.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286728
     http_req_receiving.............: avg=143.97µs min=28.12µs med=56.92µs max=307.05ms p(90)=106.69µs p(95)=267.56µs p(99.9)=9.75ms 
     http_req_sending...............: avg=56.58µs  min=5.4µs   med=10.62µs max=300.99ms p(90)=19.08µs  p(95)=127.88µs p(99.9)=6.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.49ms  min=1.73ms  med=20.04ms max=84.91ms  p(90)=28.51ms  p(95)=31.49ms  p(99.9)=51.78ms
     http_reqs......................: 286728  2385.030144/s
     iteration_duration.............: avg=20.92ms  min=3.58ms  med=20.4ms  max=359.94ms p(90)=28.94ms  p(95)=32.02ms  p(99.9)=54.55ms
     iterations.....................: 286628  2384.198334/s
     success_rate...................: 100.00% ✓ 286628      ✗ 0     
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

     checks.........................: 100.00% ✓ 713742      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 286 MB  2.4 MB/s
     http_req_blocked...............: avg=3.09µs   min=1.02µs  med=2.5µs    max=6.7ms    p(90)=3.87µs  p(95)=4.57µs   p(99.9)=36.5µs  
     http_req_connecting............: avg=194ns    min=0s      med=0s       max=2.41ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.97ms  min=1.96ms  med=17.19ms  max=568.15ms p(90)=52.49ms p(95)=68.77ms  p(99.9)=187.17ms
       { expected_response:true }...: avg=24.97ms  min=1.96ms  med=17.19ms  max=568.15ms p(90)=52.49ms p(95)=68.77ms  p(99.9)=187.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 238014
     http_req_receiving.............: avg=733.52µs min=51.89µs med=109.05µs max=205.96ms p(90)=1.17ms  p(95)=1.88ms   p(99.9)=60.06ms 
     http_req_sending...............: avg=47.66µs  min=5.33µs  med=10.17µs  max=162.15ms p(90)=18.32µs p(95)=114.01µs p(99.9)=3.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.19ms  min=1.83ms  med=16.61ms  max=568.08ms p(90)=51.01ms p(95)=67.2ms   p(99.9)=185.07ms
     http_reqs......................: 238014  1979.385421/s
     iteration_duration.............: avg=25.21ms  min=2.89ms  med=17.41ms  max=568.34ms p(90)=52.72ms p(95)=69.01ms  p(99.9)=189.8ms 
     iterations.....................: 237914  1978.553796/s
     success_rate...................: 100.00% ✓ 237914      ✗ 0     
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

     checks.........................: 100.00% ✓ 547686      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.58µs   min=1µs     med=2.57µs  max=6.26ms   p(90)=4.85µs   p(95)=6µs      p(99.9)=46.34µs
     http_req_connecting............: avg=281ns    min=0s      med=0s      max=2.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.59ms  min=2.39ms  med=31.69ms max=330.14ms p(90)=43.25ms  p(95)=48.12ms  p(99.9)=89.45ms
       { expected_response:true }...: avg=32.59ms  min=2.39ms  med=31.69ms max=330.14ms p(90)=43.25ms  p(95)=48.12ms  p(99.9)=89.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182662
     http_req_receiving.............: avg=113.53µs min=28.96µs med=63.13µs max=129.26ms p(90)=137.93µs p(95)=287.97µs p(99.9)=5.47ms 
     http_req_sending...............: avg=50.28µs  min=5.05µs  med=10.79µs max=179.52ms p(90)=24.75µs  p(95)=136.42µs p(99.9)=3.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.42ms  min=2.3ms   med=31.55ms max=329.14ms p(90)=43.05ms  p(95)=47.86ms  p(99.9)=89.1ms 
     http_reqs......................: 182662  1518.458525/s
     iteration_duration.............: avg=32.85ms  min=4.71ms  med=31.93ms max=364.82ms p(90)=43.49ms  p(95)=48.37ms  p(99.9)=89.78ms
     iterations.....................: 182562  1517.627231/s
     success_rate...................: 100.00% ✓ 182562      ✗ 0     
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

     checks.........................: 100.00% ✓ 434106      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.78µs  min=1.01µs  med=2.75µs  max=4.42ms   p(90)=4.3µs   p(95)=5.01µs  p(99.9)=38.97µs
     http_req_connecting............: avg=679ns   min=0s      med=0s      max=4.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=41.2ms  min=2.26ms  med=40.64ms max=335.62ms p(90)=57.92ms p(95)=63.18ms p(99.9)=89.81ms
       { expected_response:true }...: avg=41.2ms  min=2.26ms  med=40.64ms max=335.62ms p(90)=57.92ms p(95)=63.18ms p(99.9)=89.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144802
     http_req_receiving.............: avg=89.74µs min=29.63µs med=68.63µs max=162.1ms  p(90)=108.1µs p(95)=127.3µs p(99.9)=1.84ms 
     http_req_sending...............: avg=31.37µs min=5.54µs  med=12.32µs max=200.14ms p(90)=19.2µs  p(95)=23.2µs  p(99.9)=1.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.08ms min=2.15ms  med=40.53ms max=335.12ms p(90)=57.79ms p(95)=63.05ms p(99.9)=89.14ms
     http_reqs......................: 144802  1203.689256/s
     iteration_duration.............: avg=41.45ms min=4.21ms  med=40.85ms max=355.83ms p(90)=58.14ms p(95)=63.4ms  p(99.9)=90.27ms
     iterations.....................: 144702  1202.85799/s
     success_rate...................: 100.00% ✓ 144702      ✗ 0     
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

     checks.........................: 100.00% ✓ 187023     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   622 kB/s
     http_req_blocked...............: avg=4.96µs  min=1.21µs  med=3.08µs  max=3.78ms   p(90)=4.6µs    p(95)=5.2µs    p(99.9)=48.19µs 
     http_req_connecting............: avg=1.64µs  min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.87ms min=4.21ms  med=99.04ms max=340.39ms p(90)=140.53ms p(95)=154.4ms  p(99.9)=254.22ms
       { expected_response:true }...: avg=95.87ms min=4.21ms  med=99.04ms max=340.39ms p(90)=140.53ms p(95)=154.4ms  p(99.9)=254.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62441
     http_req_receiving.............: avg=91.19µs min=30.92µs med=81.5µs  max=102.93ms p(90)=115.61µs p(95)=128.91µs p(99.9)=866.59µs
     http_req_sending...............: avg=28.65µs min=5.53µs  med=14.62µs max=232.38ms p(90)=20.93µs  p(95)=23.15µs  p(99.9)=680.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.75ms min=4.13ms  med=98.93ms max=339.8ms  p(90)=140.4ms  p(95)=154.27ms p(99.9)=253.02ms
     http_reqs......................: 62441   517.797515/s
     iteration_duration.............: avg=96.26ms min=14.09ms med=99.49ms max=360.77ms p(90)=140.81ms p(95)=154.74ms p(99.9)=256.45ms
     iterations.....................: 62341   516.968256/s
     success_rate...................: 100.00% ✓ 62341      ✗ 0    
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

     checks.........................: 100.00% ✓ 133923     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   445 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.22µs  med=3.42µs   max=4.76ms   p(90)=4.78µs   p(95)=5.33µs   p(99.9)=579.69µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=431.57µs
     http_req_duration..............: avg=133.87ms min=5.87ms  med=131.74ms max=331.57ms p(90)=177.2ms  p(95)=190.22ms p(99.9)=243.56ms
       { expected_response:true }...: avg=133.87ms min=5.87ms  med=131.74ms max=331.57ms p(90)=177.2ms  p(95)=190.22ms p(99.9)=243.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44741
     http_req_receiving.............: avg=100.97µs min=33.53µs med=86.69µs  max=128.69ms p(90)=117.59µs p(95)=129.76µs p(99.9)=1.01ms  
     http_req_sending...............: avg=22.33µs  min=5.75µs  med=16.2µs   max=55.9ms   p(90)=21.6µs   p(95)=23.38µs  p(99.9)=576.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.75ms min=5.75ms  med=131.63ms max=298.55ms p(90)=177.09ms p(95)=190.1ms  p(99.9)=243.43ms
     http_reqs......................: 44741   370.519229/s
     iteration_duration.............: avg=134.44ms min=20.63ms med=132.06ms max=347.45ms p(90)=177.53ms p(95)=190.56ms p(99.9)=246.33ms
     iterations.....................: 44641   369.691087/s
     success_rate...................: 100.00% ✓ 44641      ✗ 0    
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

     checks.........................: 100.00% ✓ 86475      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.41µs   min=1.33µs  med=3.44µs   max=4.58ms   p(90)=4.82µs   p(95)=5.41µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.78µs   min=0s      med=0s       max=4.53ms   p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=207.3ms  min=6.57ms  med=175.33ms max=839.26ms p(90)=364.27ms p(95)=427.21ms p(99.9)=677.47ms
       { expected_response:true }...: avg=207.3ms  min=6.57ms  med=175.33ms max=839.26ms p(90)=364.27ms p(95)=427.21ms p(99.9)=677.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28925
     http_req_receiving.............: avg=99.65µs  min=35.34µs med=95.07µs  max=4.41ms   p(90)=127.45µs p(95)=140.78µs p(99.9)=613.05µs
     http_req_sending...............: avg=26.56µs  min=6.26µs  med=17.37µs  max=51.25ms  p(90)=22.33µs  p(95)=24.08µs  p(99.9)=994.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.18ms min=6.4ms   med=175.22ms max=839.15ms p(90)=364.15ms p(95)=427.09ms p(99.9)=677.39ms
     http_reqs......................: 28925   239.006557/s
     iteration_duration.............: avg=208.26ms min=30.08ms med=175.85ms max=839.56ms p(90)=364.93ms p(95)=427.74ms p(99.9)=677.99ms
     iterations.....................: 28825   238.180259/s
     success_rate...................: 100.00% ✓ 28825      ✗ 0    
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

     checks.........................: 100.00% ✓ 85263      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=7.1µs    min=1.24µs  med=3.27µs   max=3.82ms   p(90)=4.49µs   p(95)=4.98µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=3.61µs   min=0s      med=0s       max=3.78ms   p(90)=0s       p(95)=0s       p(99.9)=1.87ms  
     http_req_duration..............: avg=210.24ms min=8.73ms  med=213.63ms max=453.88ms p(90)=222.09ms p(95)=227.17ms p(99.9)=299.55ms
       { expected_response:true }...: avg=210.24ms min=8.73ms  med=213.63ms max=453.88ms p(90)=222.09ms p(95)=227.17ms p(99.9)=299.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28521
     http_req_receiving.............: avg=101.42µs min=36.42µs med=91.12µs  max=92.2ms   p(90)=121.45µs p(95)=133.58µs p(99.9)=598.91µs
     http_req_sending...............: avg=47.28µs  min=6.34µs  med=16.99µs  max=179.03ms p(90)=21.43µs  p(95)=23.08µs  p(99.9)=497.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.09ms min=8.58ms  med=213.52ms max=453.31ms p(90)=221.96ms p(95)=227.05ms p(99.9)=299.25ms
     http_reqs......................: 28521   235.469233/s
     iteration_duration.............: avg=211.26ms min=45.8ms  med=213.89ms max=464.6ms  p(90)=222.36ms p(95)=227.51ms p(99.9)=308.47ms
     iterations.....................: 28421   234.643633/s
     success_rate...................: 100.00% ✓ 28421      ✗ 0    
     vus............................: 46      min=46       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

