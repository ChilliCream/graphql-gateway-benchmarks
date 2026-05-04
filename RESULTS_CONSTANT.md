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
| hive-router | v0.0.49 | 2,875 | 3,064 | 2,820 | 2.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,129 | 2,193 | 2,108 | 1.3% |  |
| grafbase | 0.53.3 | 2,055 | 2,118 | 2,021 | 1.5% |  |
| cosmo | 0.307.0 | 1,262 | 1,277 | 1,235 | 1.3% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 530 | 546 | 526 | 1.3% |  |
| apollo-router | v2.13.1 | 425 | 429 | 415 | 1.2% |  |
| hive-gateway | 2.5.25 | 252 | 258 | 250 | 1.2% |  |
| apollo-gateway | 2.13.3 | 242 | 246 | 240 | 0.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,350 | 2,492 | 2,315 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,912 | 1,971 | 1,889 | 1.4% |  |
| grafbase | 0.53.3 | 1,531 | 1,562 | 1,517 | 1.0% |  |
| cosmo | 0.307.0 | 1,173 | 1,199 | 1,164 | 1.1% |  |
| hive-gateway-router-runtime | 2.5.25 | 503 | 517 | 499 | 1.2% |  |
| apollo-router | v2.13.1 | 368 | 380 | 363 | 1.6% |  |
| hive-gateway | 2.5.25 | 243 | 248 | 241 | 1.0% |  |
| apollo-gateway | 2.13.3 | 238 | 241 | 234 | 0.9% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1036473     ✗ 0     
     data_received..................: 30 GB   252 MB/s
     data_sent......................: 415 MB  3.5 MB/s
     http_req_blocked...............: avg=2.77µs   min=972ns  med=1.99µs  max=12.63ms  p(90)=3.1µs   p(95)=3.75µs   p(99.9)=32.81µs
     http_req_connecting............: avg=298ns    min=0s     med=0s      max=4.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.13ms  min=1.65ms med=16.32ms max=316.81ms p(90)=24.91ms p(95)=28.42ms  p(99.9)=50.55ms
       { expected_response:true }...: avg=17.13ms  min=1.65ms med=16.32ms max=316.81ms p(90)=24.91ms p(95)=28.42ms  p(99.9)=50.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 345591
     http_req_receiving.............: avg=120.75µs min=27.5µs med=50.56µs max=42.06ms  p(90)=98.52µs p(95)=266.46µs p(99.9)=10.85ms
     http_req_sending...............: avg=56µs     min=5.02µs med=8.95µs  max=74.69ms  p(90)=15.7µs  p(95)=120.52µs p(99.9)=7.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.95ms  min=1.57ms med=16.17ms max=316.07ms p(90)=24.67ms p(95)=28.08ms  p(99.9)=49.43ms
     http_reqs......................: 345591  2875.176511/s
     iteration_duration.............: avg=17.35ms  min=2.26ms med=16.52ms max=335ms    p(90)=25.13ms p(95)=28.67ms  p(99.9)=51.4ms 
     iterations.....................: 345491  2874.344551/s
     success_rate...................: 100.00% ✓ 345491      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 768069      ✗ 0     
     data_received..................: 22 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=2.76µs   min=962ns   med=2µs      max=10.44ms  p(90)=3.1µs    p(95)=3.69µs   p(99.9)=32.34µs 
     http_req_connecting............: avg=394ns    min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.19ms  min=2.44ms  med=14.65ms  max=290.99ms p(90)=52.51ms  p(95)=70.73ms  p(99.9)=167.52ms
       { expected_response:true }...: avg=23.19ms  min=2.44ms  med=14.65ms  max=290.99ms p(90)=52.51ms  p(95)=70.73ms  p(99.9)=167.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256123
     http_req_receiving.............: avg=691.41µs min=49.84µs med=108.35µs max=214.99ms p(90)=965.86µs p(95)=1.49ms   p(99.9)=63.16ms 
     http_req_sending...............: avg=40.12µs  min=5.31µs  med=9.07µs   max=38.06ms  p(90)=15.17µs  p(95)=100.16µs p(99.9)=2.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.46ms  min=2.32ms  med=14.13ms  max=290.46ms p(90)=51.03ms  p(95)=69.21ms  p(99.9)=163.17ms
     http_reqs......................: 256123  2129.234824/s
     iteration_duration.............: avg=23.42ms  min=3.18ms  med=14.86ms  max=349.11ms p(90)=52.75ms  p(95)=70.97ms  p(99.9)=168.45ms
     iterations.....................: 256023  2128.403491/s
     success_rate...................: 100.00% ✓ 256023      ✗ 0     
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

     checks.........................: 100.00% ✓ 741420      ✗ 0     
     data_received..................: 22 GB   181 MB/s
     data_sent......................: 297 MB  2.5 MB/s
     http_req_blocked...............: avg=3.05µs   min=1µs     med=2.13µs  max=13.17ms  p(90)=3.55µs  p(95)=4.3µs   p(99.9)=40.77µs
     http_req_connecting............: avg=392ns    min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=24.03ms  min=1.9ms   med=23.79ms max=341.43ms p(90)=28.8ms  p(95)=30.99ms p(99.9)=53.5ms 
       { expected_response:true }...: avg=24.03ms  min=1.9ms   med=23.79ms max=341.43ms p(90)=28.8ms  p(95)=30.99ms p(99.9)=53.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 247240
     http_req_receiving.............: avg=105.51µs min=28.65µs med=55.96µs max=240.58ms p(90)=98.56µs p(95)=187.2µs p(99.9)=7.89ms 
     http_req_sending...............: avg=46.77µs  min=4.84µs  med=9.77µs  max=214.76ms p(90)=17.16µs p(95)=113.5µs p(99.9)=3.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=23.88ms  min=1.82ms  med=23.68ms max=296.76ms p(90)=28.63ms p(95)=30.75ms p(99.9)=52.67ms
     http_reqs......................: 247240  2055.979285/s
     iteration_duration.............: avg=24.26ms  min=4.21ms  med=23.99ms max=354.43ms p(90)=29.01ms p(95)=31.23ms p(99.9)=53.93ms
     iterations.....................: 247140  2055.147713/s
     success_rate...................: 100.00% ✓ 247140      ✗ 0     
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

     checks.........................: 100.00% ✓ 455499      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=2.78µs  min=1.02µs  med=2.06µs  max=2.8ms    p(90)=3.37µs  p(95)=4µs      p(99.9)=33.89µs
     http_req_connecting............: avg=373ns   min=0s      med=0s      max=2.76ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.27ms min=2.2ms   med=38.71ms max=294.51ms p(90)=55.29ms p(95)=60.32ms  p(99.9)=84.8ms 
       { expected_response:true }...: avg=39.27ms min=2.2ms   med=38.71ms max=294.51ms p(90)=55.29ms p(95)=60.32ms  p(99.9)=84.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 151933
     http_req_receiving.............: avg=80.32µs min=28.68µs med=60.12µs max=95.23ms  p(90)=96.33µs p(95)=114.78µs p(99.9)=1.75ms 
     http_req_sending...............: avg=25.37µs min=5.2µs   med=9.98µs  max=156.87ms p(90)=15.7µs  p(95)=19.76µs  p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.17ms min=2.08ms  med=38.61ms max=294.17ms p(90)=55.18ms p(95)=60.2ms   p(99.9)=84.28ms
     http_reqs......................: 151933  1262.962645/s
     iteration_duration.............: avg=39.51ms min=3.71ms  med=38.91ms max=350.81ms p(90)=55.48ms p(95)=60.53ms  p(99.9)=85.6ms 
     iterations.....................: 151833  1262.131383/s
     success_rate...................: 100.00% ✓ 151833      ✗ 0     
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

     checks.........................: 100.00% ✓ 191721     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   638 kB/s
     http_req_blocked...............: avg=4.67µs  min=1.11µs  med=2.8µs    max=4.52ms   p(90)=4.32µs   p(95)=4.91µs   p(99.9)=52.64µs 
     http_req_connecting............: avg=1.6µs   min=0s      med=0s       max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.51ms min=4.38ms  med=99.83ms  max=340.59ms p(90)=127ms    p(95)=139.47ms p(99.9)=233.76ms
       { expected_response:true }...: avg=93.51ms min=4.38ms  med=99.83ms  max=340.59ms p(90)=127ms    p(95)=139.47ms p(99.9)=233.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64007
     http_req_receiving.............: avg=87.7µs  min=31.1µs  med=77.01µs  max=149.96ms p(90)=112.64µs p(95)=125.67µs p(99.9)=880.03µs
     http_req_sending...............: avg=21.28µs min=5.76µs  med=13.01µs  max=59.8ms   p(90)=20.01µs  p(95)=22.31µs  p(99.9)=669.31µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.4ms  min=4.27ms  med=99.73ms  max=339.76ms p(90)=126.9ms  p(95)=139.37ms p(99.9)=233.66ms
     http_reqs......................: 64007   530.888536/s
     iteration_duration.............: avg=93.9ms  min=15.45ms med=100.11ms max=359.05ms p(90)=127.25ms p(95)=139.79ms p(99.9)=236.5ms 
     iterations.....................: 63907   530.059114/s
     success_rate...................: 100.00% ✓ 63907      ✗ 0    
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

     checks.........................: 100.00% ✓ 153825     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   511 kB/s
     http_req_blocked...............: avg=4.41µs   min=1.25µs  med=3.37µs   max=1.94ms   p(90)=4.83µs   p(95)=5.41µs   p(99.9)=106.97µs
     http_req_connecting............: avg=850ns    min=0s      med=0s       max=1.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.56ms min=5.4ms   med=116.31ms max=364.18ms p(90)=140.78ms p(95)=148.13ms p(99.9)=180.08ms
       { expected_response:true }...: avg=116.56ms min=5.4ms   med=116.31ms max=364.18ms p(90)=140.78ms p(95)=148.13ms p(99.9)=180.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51375
     http_req_receiving.............: avg=90.9µs   min=32.01µs med=86.13µs  max=6.79ms   p(90)=118.69µs p(95)=131.34µs p(99.9)=731.23µs
     http_req_sending...............: avg=25.04µs  min=5.92µs  med=16.06µs  max=92.02ms  p(90)=21.9µs   p(95)=23.88µs  p(99.9)=642.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.44ms min=5.29ms  med=116.2ms  max=363.88ms p(90)=140.66ms p(95)=147.99ms p(99.9)=179.84ms
     http_reqs......................: 51375   425.595776/s
     iteration_duration.............: avg=117.05ms min=35.74ms med=116.6ms  max=373.45ms p(90)=141.05ms p(95)=148.43ms p(99.9)=183.87ms
     iterations.....................: 51275   424.767366/s
     success_rate...................: 100.00% ✓ 51275      ✗ 0    
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

     checks.........................: 100.00% ✓ 91524      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=7.59µs   min=1.21µs med=3.47µs   max=4.37ms   p(90)=4.98µs   p(95)=5.62µs   p(99.9)=2.01ms  
     http_req_connecting............: avg=3.87µs   min=0s     med=0s       max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=1.98ms  
     http_req_duration..............: avg=195.87ms min=6.16ms med=180.65ms max=688.99ms p(90)=248.46ms p(95)=396.42ms p(99.9)=534.51ms
       { expected_response:true }...: avg=195.87ms min=6.16ms med=180.65ms max=688.99ms p(90)=248.46ms p(95)=396.42ms p(99.9)=534.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30608
     http_req_receiving.............: avg=102.59µs min=35.9µs med=97.68µs  max=15.14ms  p(90)=129.46µs p(95)=143.17µs p(99.9)=582.36µs
     http_req_sending...............: avg=23.05µs  min=6.38µs med=18.07µs  max=23.42ms  p(90)=23.28µs  p(95)=25.29µs  p(99.9)=536.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.74ms min=6.03ms med=180.54ms max=688.9ms  p(90)=248.33ms p(95)=396.29ms p(99.9)=534.38ms
     http_reqs......................: 30608   252.926163/s
     iteration_duration.............: avg=196.8ms  min=45.4ms med=181.16ms max=689.18ms p(90)=248.99ms p(95)=396.98ms p(99.9)=534.92ms
     iterations.....................: 30508   252.099823/s
     success_rate...................: 100.00% ✓ 30508      ✗ 0    
     vus............................: 5       min=5        max=50 
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

     checks.........................: 100.00% ✓ 87702      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=10.99µs  min=1.25µs  med=3.1µs    max=9.41ms   p(90)=4.31µs   p(95)=4.82µs   p(99.9)=3.31ms  
     http_req_connecting............: avg=7.62µs   min=0s      med=0s       max=9.37ms   p(90)=0s       p(95)=0s       p(99.9)=3.19ms  
     http_req_duration..............: avg=204.46ms min=8.55ms  med=187.74ms max=418.4ms  p(90)=267.35ms p(95)=276.94ms p(99.9)=339.88ms
       { expected_response:true }...: avg=204.46ms min=8.55ms  med=187.74ms max=418.4ms  p(90)=267.35ms p(95)=276.94ms p(99.9)=339.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29334
     http_req_receiving.............: avg=94.55µs  min=35.61µs med=88.88µs  max=41.78ms  p(90)=119.53µs p(95)=131.16µs p(99.9)=605.09µs
     http_req_sending...............: avg=25.21µs  min=6.14µs  med=15.95µs  max=34.8ms   p(90)=20.85µs  p(95)=22.57µs  p(99.9)=2.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.34ms min=8.4ms   med=187.63ms max=418.16ms p(90)=267.22ms p(95)=276.83ms p(99.9)=339.81ms
     http_reqs......................: 29334   242.233198/s
     iteration_duration.............: avg=205.39ms min=27.37ms med=188.12ms max=426.35ms p(90)=267.67ms p(95)=277.27ms p(99.9)=341.44ms
     iterations.....................: 29234   241.407422/s
     success_rate...................: 100.00% ✓ 29234      ✗ 0    
     vus............................: 43      min=43       max=50 
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

     checks.........................: 100.00% ✓ 847524      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 340 MB  2.8 MB/s
     http_req_blocked...............: avg=3.03µs   min=1µs     med=2.13µs  max=13.54ms  p(90)=3.57µs   p(95)=4.38µs   p(99.9)=37.75µs
     http_req_connecting............: avg=360ns    min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.99ms  min=1.78ms  med=20.54ms max=321.74ms p(90)=29.13ms  p(95)=32.25ms  p(99.9)=53.65ms
       { expected_response:true }...: avg=20.99ms  min=1.78ms  med=20.54ms max=321.74ms p(90)=29.13ms  p(95)=32.25ms  p(99.9)=53.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282608
     http_req_receiving.............: avg=114.11µs min=27.66µs med=53.94µs max=168.31ms p(90)=101.09µs p(95)=243.36µs p(99.9)=9.06ms 
     http_req_sending...............: avg=53.87µs  min=5.2µs   med=9.5µs   max=290.02ms p(90)=17.24µs  p(95)=119.93µs p(99.9)=6.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.83ms  min=1.69ms  med=20.41ms max=303.65ms p(90)=28.92ms  p(95)=31.95ms  p(99.9)=52.82ms
     http_reqs......................: 282608  2350.686248/s
     iteration_duration.............: avg=21.22ms  min=3.52ms  med=20.75ms max=344.69ms p(90)=29.35ms  p(95)=32.48ms  p(99.9)=54.4ms 
     iterations.....................: 282508  2349.854465/s
     success_rate...................: 100.00% ✓ 282508      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689442      ✗ 0     
     data_received..................: 20 GB   168 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.77µs  min=992ns   med=2.12µs   max=11.32ms  p(90)=3.45µs  p(95)=4.12µs  p(99.9)=32.27µs 
     http_req_connecting............: avg=190ns   min=0s      med=0s       max=2.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.86ms min=1.94ms  med=17.69ms  max=581.28ms p(90)=54.69ms p(95)=72.2ms  p(99.9)=192.16ms
       { expected_response:true }...: avg=25.86ms min=1.94ms  med=17.69ms  max=581.28ms p(90)=54.69ms p(95)=72.2ms  p(99.9)=192.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229914
     http_req_receiving.............: avg=708.9µs min=51.03µs med=109.17µs max=276.59ms p(90)=1.16ms  p(95)=1.83ms  p(99.9)=60.37ms 
     http_req_sending...............: avg=41.5µs  min=5.14µs  med=9.32µs   max=226.81ms p(90)=17.34µs p(95)=97.52µs p(99.9)=2.47ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.11ms min=1.79ms  med=17.12ms  max=581.19ms p(90)=53.45ms p(95)=70.7ms  p(99.9)=189.63ms
     http_reqs......................: 229914  1912.023381/s
     iteration_duration.............: avg=26.09ms min=2.67ms  med=17.9ms   max=581.51ms p(90)=54.93ms p(95)=72.47ms p(99.9)=193.65ms
     iterations.....................: 229814  1911.191755/s
     success_rate...................: 100.00% ✓ 229814      ✗ 0     
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

     checks.........................: 100.00% ✓ 552363      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.66µs   min=992ns  med=2.35µs  max=13.08ms  p(90)=4.73µs   p(95)=5.87µs   p(99.9)=44.83µs
     http_req_connecting............: avg=572ns    min=0s     med=0s      max=4.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.31ms  min=2.4ms  med=31.43ms max=319.95ms p(90)=42.73ms  p(95)=47.45ms  p(99.9)=90.1ms 
       { expected_response:true }...: avg=32.31ms  min=2.4ms  med=31.43ms max=319.95ms p(90)=42.73ms  p(95)=47.45ms  p(99.9)=90.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 184221
     http_req_receiving.............: avg=116.11µs min=30.8µs med=63.12µs max=259.2ms  p(90)=134.22µs p(95)=272.86µs p(99.9)=5.88ms 
     http_req_sending...............: avg=48.23µs  min=5.33µs med=10.57µs max=239.19ms p(90)=24.18µs  p(95)=134.08µs p(99.9)=3.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.14ms  min=2.28ms med=31.29ms max=309.85ms p(90)=42.54ms  p(95)=47.21ms  p(99.9)=88.65ms
     http_reqs......................: 184221  1531.239127/s
     iteration_duration.............: avg=32.57ms  min=4.81ms med=31.66ms max=371.15ms p(90)=42.97ms  p(95)=47.7ms   p(99.9)=90.99ms
     iterations.....................: 184121  1530.40793/s
     success_rate...................: 100.00% ✓ 184121      ✗ 0     
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

     checks.........................: 100.00% ✓ 423021      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.33µs  min=1.03µs  med=2.34µs  max=3.61ms   p(90)=3.9µs    p(95)=4.54µs   p(99.9)=35.53µs
     http_req_connecting............: avg=639ns   min=0s      med=0s      max=3.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.29ms min=2.32ms  med=41.74ms max=342.76ms p(90)=59.5ms   p(95)=64.86ms  p(99.9)=91.79ms
       { expected_response:true }...: avg=42.29ms min=2.32ms  med=41.74ms max=342.76ms p(90)=59.5ms   p(95)=64.86ms  p(99.9)=91.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141107
     http_req_receiving.............: avg=85.77µs min=29.49µs med=65.2µs  max=203.89ms p(90)=103.17µs p(95)=122.29µs p(99.9)=1.81ms 
     http_req_sending...............: avg=30.14µs min=5.15µs  med=10.95µs max=252.16ms p(90)=17.58µs  p(95)=21.18µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.17ms min=2.19ms  med=41.64ms max=298.58ms p(90)=59.39ms  p(95)=64.73ms  p(99.9)=91.25ms
     http_reqs......................: 141107  1173.021931/s
     iteration_duration.............: avg=42.54ms min=3.97ms  med=41.95ms max=352.66ms p(90)=59.71ms  p(95)=65.06ms  p(99.9)=92.19ms
     iterations.....................: 141007  1172.190631/s
     success_rate...................: 100.00% ✓ 141007      ✗ 0     
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

     checks.........................: 100.00% ✓ 181758     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   604 kB/s
     http_req_blocked...............: avg=3.86µs   min=1.13µs med=2.85µs  max=2.22ms   p(90)=4.33µs   p(95)=4.91µs   p(99.9)=54.34µs 
     http_req_connecting............: avg=756ns    min=0s     med=0s      max=2.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.64ms  min=4.47ms med=95.89ms max=346.81ms p(90)=119.24ms p(95)=132.06ms p(99.9)=233.93ms
       { expected_response:true }...: avg=98.64ms  min=4.47ms med=95.89ms max=346.81ms p(90)=119.24ms p(95)=132.06ms p(99.9)=233.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60686
     http_req_receiving.............: avg=137.05µs min=32.3µs med=80.35µs max=247.41ms p(90)=114.45µs p(95)=127.31µs p(99.9)=1.04ms  
     http_req_sending...............: avg=24.84µs  min=5.33µs med=13.59µs max=96.44ms  p(90)=20.04µs  p(95)=22.13µs  p(99.9)=659.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.48ms  min=4.35ms med=95.77ms max=346.46ms p(90)=119.09ms p(95)=131.82ms p(99.9)=231.89ms
     http_reqs......................: 60686   503.110029/s
     iteration_duration.............: avg=99.05ms  min=24.7ms med=96.13ms max=357.18ms p(90)=119.5ms  p(95)=132.38ms p(99.9)=237.05ms
     iterations.....................: 60586   502.280991/s
     success_rate...................: 100.00% ✓ 60586      ✗ 0    
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

     checks.........................: 100.00% ✓ 133194     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   442 kB/s
     http_req_blocked...............: avg=5.31µs   min=1.2µs   med=3.41µs   max=3.21ms   p(90)=4.81µs   p(95)=5.39µs   p(99.9)=354.22µs
     http_req_connecting............: avg=1.66µs   min=0s      med=0s       max=3.18ms   p(90)=0s       p(95)=0s       p(99.9)=325.91µs
     http_req_duration..............: avg=134.62ms min=5.82ms  med=131.97ms max=353.56ms p(90)=178.94ms p(95)=192.62ms p(99.9)=243.97ms
       { expected_response:true }...: avg=134.62ms min=5.82ms  med=131.97ms max=353.56ms p(90)=178.94ms p(95)=192.62ms p(99.9)=243.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44498
     http_req_receiving.............: avg=92.76µs  min=33.04µs med=87.89µs  max=12.28ms  p(90)=119.36µs p(95)=131.56µs p(99.9)=732.66µs
     http_req_sending...............: avg=26.98µs  min=5.93µs  med=16.6µs   max=100.84ms p(90)=21.95µs  p(95)=23.78µs  p(99.9)=816.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.5ms  min=5.74ms  med=131.84ms max=353.16ms p(90)=178.86ms p(95)=192.48ms p(99.9)=243.88ms
     http_reqs......................: 44498   368.430662/s
     iteration_duration.............: avg=135.19ms min=24.94ms med=132.28ms max=368.96ms p(90)=179.31ms p(95)=192.94ms p(99.9)=247.01ms
     iterations.....................: 44398   367.60269/s
     success_rate...................: 100.00% ✓ 44398      ✗ 0    
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

     checks.........................: 100.00% ✓ 88185      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   293 kB/s
     http_req_blocked...............: avg=7.2µs    min=1.24µs  med=3.39µs   max=4.73ms   p(90)=4.75µs   p(95)=5.33µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.63µs   min=0s      med=0s       max=4.69ms   p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=203.24ms min=6.55ms  med=186.42ms max=574.43ms p(90)=241.28ms p(95)=402.78ms p(99.9)=530.81ms
       { expected_response:true }...: avg=203.24ms min=6.55ms  med=186.42ms max=574.43ms p(90)=241.28ms p(95)=402.78ms p(99.9)=530.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29495
     http_req_receiving.............: avg=102.85µs min=35.65µs med=96.4µs   max=66.83ms  p(90)=128.26µs p(95)=140.97µs p(99.9)=574.53µs
     http_req_sending...............: avg=23.98µs  min=6.02µs  med=17.46µs  max=47.51ms  p(90)=22.16µs  p(95)=23.9µs   p(99.9)=556.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.12ms min=6.4ms   med=186.31ms max=574.25ms p(90)=241.15ms p(95)=402.69ms p(99.9)=530.71ms
     http_reqs......................: 29495   243.713983/s
     iteration_duration.............: avg=204.23ms min=56.61ms med=186.78ms max=574.69ms p(90)=241.93ms p(95)=403.64ms p(99.9)=531.18ms
     iterations.....................: 29395   242.887694/s
     success_rate...................: 100.00% ✓ 29395      ✗ 0    
     vus............................: 19      min=19       max=50 
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

     checks.........................: 100.00% ✓ 86193      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=6.2µs    min=1.25µs  med=3.39µs   max=3.75ms   p(90)=4.7µs    p(95)=5.24µs   p(99.9)=906.05µs
     http_req_connecting............: avg=2.66µs   min=0s      med=0s       max=3.72ms   p(90)=0s       p(95)=0s       p(99.9)=875.55µs
     http_req_duration..............: avg=208ms    min=8.72ms  med=208.96ms max=423.34ms p(90)=220.62ms p(95)=225.93ms p(99.9)=295.2ms 
       { expected_response:true }...: avg=208ms    min=8.72ms  med=208.96ms max=423.34ms p(90)=220.62ms p(95)=225.93ms p(99.9)=295.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28831
     http_req_receiving.............: avg=98.62µs  min=34.49µs med=94.72µs  max=1.55ms   p(90)=125.34µs p(95)=137.84µs p(99.9)=619.62µs
     http_req_sending...............: avg=22.07µs  min=5.86µs  med=17.64µs  max=17.1ms   p(90)=22.19µs  p(95)=23.9µs   p(99.9)=648.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.88ms min=8.57ms  med=208.84ms max=423.17ms p(90)=220.49ms p(95)=225.79ms p(99.9)=295.09ms
     http_reqs......................: 28831   238.06585/s
     iteration_duration.............: avg=208.95ms min=41.49ms med=209.35ms max=428.69ms p(90)=220.87ms p(95)=226.21ms p(99.9)=295.72ms
     iterations.....................: 28731   237.240121/s
     success_rate...................: 100.00% ✓ 28731      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

