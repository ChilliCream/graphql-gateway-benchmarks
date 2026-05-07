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
| hive-router | v0.0.49 | 2,954 | 3,069 | 2,914 | 1.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,101 | 2,167 | 2,082 | 1.3% |  |
| grafbase | 0.53.3 | 2,015 | 2,102 | 2,008 | 1.6% |  |
| cosmo | 0.307.0 | 1,275 | 1,287 | 1,271 | 0.6% | non-compatible response (7 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 531 | 545 | 527 | 1.1% |  |
| apollo-router | v2.13.1 | 399 | 410 | 394 | 1.4% |  |
| hive-gateway | 2.5.25 | 252 | 252 | 252 | 0.0% |  |
| apollo-gateway | 2.13.3 | 243 | 245 | 241 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,351 | 2,506 | 2,327 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,925 | 1,977 | 1,904 | 1.2% |  |
| grafbase | 0.53.3 | 1,503 | 1,541 | 1,496 | 1.1% |  |
| cosmo | 0.307.0 | 1,171 | 1,191 | 1,167 | 0.8% | non-compatible response (8 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 503 | 517 | 499 | 1.2% |  |
| apollo-router | v2.13.1 | 372 | 383 | 368 | 1.4% |  |
| hive-gateway | 2.5.25 | 247 | 251 | 245 | 0.8% |  |
| apollo-gateway | 2.13.3 | 237 | 240 | 235 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1065057     ✗ 0     
     data_received..................: 31 GB   259 MB/s
     data_sent......................: 427 MB  3.6 MB/s
     http_req_blocked...............: avg=2.99µs   min=1µs     med=1.92µs  max=26.89ms  p(90)=3.08µs  p(95)=3.69µs   p(99.9)=28.98µs
     http_req_connecting............: avg=346ns    min=0s      med=0s      max=4.73ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.66ms  min=1.67ms  med=15.7ms  max=323.75ms p(90)=24.92ms p(95)=29.06ms  p(99.9)=52.14ms
       { expected_response:true }...: avg=16.66ms  min=1.67ms  med=15.7ms  max=323.75ms p(90)=24.92ms p(95)=29.06ms  p(99.9)=52.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 355119
     http_req_receiving.............: avg=147.93µs min=27.49µs med=46.45µs max=258.47ms p(90)=90.41µs p(95)=260.83µs p(99.9)=16.5ms 
     http_req_sending...............: avg=57.84µs  min=5.09µs  med=8.78µs  max=78.44ms  p(90)=14.82µs p(95)=116.58µs p(99.9)=12.26ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.45ms  min=1.61ms  med=15.55ms max=112.06ms p(90)=24.63ms p(95)=28.6ms   p(99.9)=50.79ms
     http_reqs......................: 355119  2954.309053/s
     iteration_duration.............: avg=16.89ms  min=2.05ms  med=15.9ms  max=376.11ms p(90)=25.15ms p(95)=29.33ms  p(99.9)=52.91ms
     iterations.....................: 355019  2953.477132/s
     success_rate...................: 100.00% ✓ 355019      ✗ 0     
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

     checks.........................: 100.00% ✓ 758007      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 304 MB  2.5 MB/s
     http_req_blocked...............: avg=3.14µs   min=1µs    med=2.36µs   max=7.33ms   p(90)=3.55µs   p(95)=4.15µs   p(99.9)=33.73µs 
     http_req_connecting............: avg=429ns    min=0s     med=0s       max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.5ms   min=2.48ms med=14.89ms  max=322.87ms p(90)=52.95ms  p(95)=71.45ms  p(99.9)=170.28ms
       { expected_response:true }...: avg=23.5ms   min=2.48ms med=14.89ms  max=322.87ms p(90)=52.95ms  p(95)=71.45ms  p(99.9)=170.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252769
     http_req_receiving.............: avg=676.11µs min=51.7µs med=112.23µs max=203.65ms p(90)=960.64µs p(95)=1.48ms   p(99.9)=64.01ms 
     http_req_sending...............: avg=44.95µs  min=5.29µs med=9.71µs   max=82.25ms  p(90)=16.04µs  p(95)=109.52µs p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.78ms  min=2.39ms med=14.37ms  max=304.05ms p(90)=51.58ms  p(95)=70.01ms  p(99.9)=168.36ms
     http_reqs......................: 252769  2101.034785/s
     iteration_duration.............: avg=23.73ms  min=3.53ms med=15.11ms  max=347.65ms p(90)=53.2ms   p(95)=71.68ms  p(99.9)=171.5ms 
     iterations.....................: 252669  2100.203577/s
     success_rate...................: 100.00% ✓ 252669      ✗ 0     
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

     checks.........................: 100.00% ✓ 726639      ✗ 0     
     data_received..................: 21 GB   177 MB/s
     data_sent......................: 291 MB  2.4 MB/s
     http_req_blocked...............: avg=2.85µs  min=722ns   med=2.14µs  max=4.1ms    p(90)=3.47µs  p(95)=4.18µs  p(99.9)=36.32µs
     http_req_connecting............: avg=288ns   min=0s      med=0s      max=3.21ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=24.53ms min=2ms     med=24.28ms max=314.21ms p(90)=29.29ms p(95)=31.43ms p(99.9)=53.42ms
       { expected_response:true }...: avg=24.53ms min=2ms     med=24.28ms max=314.21ms p(90)=29.29ms p(95)=31.43ms p(99.9)=53.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 242313
     http_req_receiving.............: avg=106µs   min=29.94µs med=57.69µs max=270.41ms p(90)=97.53µs p(95)=158.9µs p(99.9)=8.4ms  
     http_req_sending...............: avg=42.23µs min=5.06µs  med=9.94µs  max=226.23ms p(90)=16.39µs p(95)=88.23µs p(99.9)=2.7ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=24.38ms min=1.9ms   med=24.17ms max=313.4ms  p(90)=29.13ms p(95)=31.19ms p(99.9)=52.26ms
     http_reqs......................: 242313  2015.060832/s
     iteration_duration.............: avg=24.76ms min=3.41ms  med=24.48ms max=346.64ms p(90)=29.51ms p(95)=31.67ms p(99.9)=53.91ms
     iterations.....................: 242213  2014.229238/s
     success_rate...................: 100.00% ✓ 242213      ✗ 0     
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

     checks.........................: 100.00% ✓ 459978      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.34µs  min=962ns   med=2.39µs  max=3.95ms   p(90)=3.8µs   p(95)=4.43µs   p(99.9)=34.12µs
     http_req_connecting............: avg=643ns   min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.89ms min=2.16ms  med=38.37ms max=337.81ms p(90)=54.83ms p(95)=59.76ms  p(99.9)=82.42ms
       { expected_response:true }...: avg=38.89ms min=2.16ms  med=38.37ms max=337.81ms p(90)=54.83ms p(95)=59.76ms  p(99.9)=82.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153426
     http_req_receiving.............: avg=115.9µs min=28.95µs med=60.97µs max=266.03ms p(90)=97.04µs p(95)=115.48µs p(99.9)=2.14ms 
     http_req_sending...............: avg=25.04µs min=5.2µs   med=10.61µs max=67.33ms  p(90)=16.24µs p(95)=20.38µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.75ms min=2.04ms  med=38.27ms max=103.81ms p(90)=54.73ms p(95)=59.63ms  p(99.9)=82.12ms
     http_reqs......................: 153426  1275.568836/s
     iteration_duration.............: avg=39.12ms min=3.32ms  med=38.57ms max=353.62ms p(90)=55.04ms p(95)=59.97ms  p(99.9)=82.82ms
     iterations.....................: 153326  1274.737446/s
     success_rate...................: 100.00% ✓ 153326      ✗ 0     
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

     checks.........................: 100.00% ✓ 191895     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   638 kB/s
     http_req_blocked...............: avg=4.83µs  min=1.18µs  med=2.82µs  max=4.45ms   p(90)=4.26µs   p(95)=4.85µs   p(99.9)=45.34µs 
     http_req_connecting............: avg=1.74µs  min=0s      med=0s      max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.43ms min=4.04ms  med=90.64ms max=349.64ms p(90)=115.42ms p(95)=129.05ms p(99.9)=223.22ms
       { expected_response:true }...: avg=93.43ms min=4.04ms  med=90.64ms max=349.64ms p(90)=115.42ms p(95)=129.05ms p(99.9)=223.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64065
     http_req_receiving.............: avg=85.63µs min=31.06µs med=74.91µs max=133.71ms p(90)=108.14µs p(95)=120.14µs p(99.9)=904.12µs
     http_req_sending...............: avg=28.49µs min=5.61µs  med=12.78µs max=149.07ms p(90)=19.01µs  p(95)=21.27µs  p(99.9)=670.17µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.32ms min=3.98ms  med=90.53ms max=349.11ms p(90)=115.29ms p(95)=128.91ms p(99.9)=222.23ms
     http_reqs......................: 64065   531.421097/s
     iteration_duration.............: avg=93.81ms min=38.78ms med=90.88ms max=373.13ms p(90)=115.66ms p(95)=129.34ms p(99.9)=225.36ms
     iterations.....................: 63965   530.591594/s
     success_rate...................: 100.00% ✓ 63965      ✗ 0    
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

     checks.........................: 100.00% ✓ 144270     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   479 kB/s
     http_req_blocked...............: avg=5.49µs   min=1.14µs  med=3.06µs   max=4.41ms   p(90)=4.38µs   p(95)=4.89µs   p(99.9)=813.84µs
     http_req_connecting............: avg=2.18µs   min=0s      med=0s       max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=690.78µs
     http_req_duration..............: avg=124.3ms  min=5.47ms  med=124.08ms max=353.24ms p(90)=150.25ms p(95)=157.95ms p(99.9)=194.4ms 
       { expected_response:true }...: avg=124.3ms  min=5.47ms  med=124.08ms max=353.24ms p(90)=150.25ms p(95)=157.95ms p(99.9)=194.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48190
     http_req_receiving.............: avg=87.01µs  min=31.39µs med=79.36µs  max=85.72ms  p(90)=110.59µs p(95)=122.77µs p(99.9)=780.02µs
     http_req_sending...............: avg=27.62µs  min=5.34µs  med=14.15µs  max=109.13ms p(90)=19.68µs  p(95)=21.56µs  p(99.9)=586.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.18ms min=5.36ms  med=123.97ms max=353ms    p(90)=150.14ms p(95)=157.85ms p(99.9)=193.75ms
     http_reqs......................: 48190   399.278732/s
     iteration_duration.............: avg=124.8ms  min=19.34ms med=124.35ms max=375.82ms p(90)=150.5ms  p(95)=158.21ms p(99.9)=198.36ms
     iterations.....................: 48090   398.450181/s
     success_rate...................: 100.00% ✓ 48090      ✗ 0    
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

     checks.........................: 100.00% ✓ 91491      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=6.47µs   min=1.27µs  med=3.11µs   max=4.38ms   p(90)=4.34µs   p(95)=4.89µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=3.19µs   min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=195.95ms min=6.29ms  med=180.02ms max=572.55ms p(90)=229.7ms  p(95)=393.09ms p(99.9)=528.77ms
       { expected_response:true }...: avg=195.95ms min=6.29ms  med=180.02ms max=572.55ms p(90)=229.7ms  p(95)=393.09ms p(99.9)=528.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30597
     http_req_receiving.............: avg=94.2µs   min=36.11µs med=86.45µs  max=71.58ms  p(90)=118.11µs p(95)=128.92µs p(99.9)=642.39µs
     http_req_sending...............: avg=28.29µs  min=6.06µs  med=15.63µs  max=104.11ms p(90)=20.74µs  p(95)=22.68µs  p(99.9)=595.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.83ms min=6.16ms  med=179.91ms max=572.46ms p(90)=229.58ms p(95)=392.61ms p(99.9)=528.66ms
     http_reqs......................: 30597   252.905931/s
     iteration_duration.............: avg=196.86ms min=45.52ms med=180.38ms max=572.75ms p(90)=230.18ms p(95)=396.24ms p(99.9)=529.03ms
     iterations.....................: 30497   252.07936/s
     success_rate...................: 100.00% ✓ 30497      ✗ 0    
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

     checks.........................: 100.00% ✓ 88254      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   293 kB/s
     http_req_blocked...............: avg=4.84µs   min=1.15µs  med=3.07µs   max=2.68ms   p(90)=4.27µs   p(95)=4.78µs   p(99.9)=642.5µs 
     http_req_connecting............: avg=1.65µs   min=0s      med=0s       max=2.62ms   p(90)=0s       p(95)=0s       p(99.9)=615.21µs
     http_req_duration..............: avg=203.13ms min=8.62ms  med=202.59ms max=387ms    p(90)=212.47ms p(95)=221.26ms p(99.9)=285.4ms 
       { expected_response:true }...: avg=203.13ms min=8.62ms  med=202.59ms max=387ms    p(90)=212.47ms p(95)=221.26ms p(99.9)=285.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29518
     http_req_receiving.............: avg=113.53µs min=34.1µs  med=86.74µs  max=106.38ms p(90)=117.46µs p(95)=129.42µs p(99.9)=770.87µs
     http_req_sending...............: avg=28.7µs   min=6.23µs  med=15.46µs  max=117.47ms p(90)=20.31µs  p(95)=22.04µs  p(99.9)=682.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.99ms min=8.48ms  med=202.48ms max=386.87ms p(90)=212.35ms p(95)=221.15ms p(99.9)=285.29ms
     http_reqs......................: 29518   243.810228/s
     iteration_duration.............: avg=204.07ms min=57.15ms med=202.86ms max=400.08ms p(90)=212.73ms p(95)=221.6ms  p(99.9)=287.77ms
     iterations.....................: 29418   242.984256/s
     success_rate...................: 100.00% ✓ 29418      ✗ 0    
     vus............................: 35      min=35       max=50 
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

     checks.........................: 100.00% ✓ 847671      ✗ 0     
     data_received..................: 25 GB   206 MB/s
     data_sent......................: 340 MB  2.8 MB/s
     http_req_blocked...............: avg=2.89µs  min=992ns   med=2.1µs   max=21.96ms  p(90)=3.47µs  p(95)=4.24µs   p(99.9)=32.36µs
     http_req_connecting............: avg=164ns   min=0s      med=0s      max=2.7ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.99ms min=1.79ms  med=20.52ms max=300.37ms p(90)=29.01ms p(95)=32ms     p(99.9)=52.57ms
       { expected_response:true }...: avg=20.99ms min=1.79ms  med=20.52ms max=300.37ms p(90)=29.01ms p(95)=32ms     p(99.9)=52.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 282657
     http_req_receiving.............: avg=110.3µs min=28.32µs med=53.12µs max=212.57ms p(90)=99.11µs p(95)=238.75µs p(99.9)=8.3ms  
     http_req_sending...............: avg=49.36µs min=5.02µs  med=9.56µs  max=149.9ms  p(90)=17.15µs p(95)=119.21µs p(99.9)=4.6ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.83ms min=1.72ms  med=20.39ms max=289.23ms p(90)=28.82ms p(95)=31.72ms  p(99.9)=51.61ms
     http_reqs......................: 282657  2351.080816/s
     iteration_duration.............: avg=21.22ms min=3.69ms  med=20.73ms max=340.83ms p(90)=29.23ms p(95)=32.24ms  p(99.9)=53.24ms
     iterations.....................: 282557  2350.249037/s
     success_rate...................: 100.00% ✓ 282557      ✗ 0     
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

     checks.........................: 100.00% ✓ 694248      ✗ 0     
     data_received..................: 20 GB   169 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.96µs   min=992ns   med=2.09µs   max=8.2ms    p(90)=3.41µs  p(95)=4.09µs   p(99.9)=35.99µs 
     http_req_connecting............: avg=453ns    min=0s      med=0s       max=3.88ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.68ms  min=1.92ms  med=17.52ms  max=636.01ms p(90)=54.37ms p(95)=72.14ms  p(99.9)=187.58ms
       { expected_response:true }...: avg=25.68ms  min=1.92ms  med=17.52ms  max=636.01ms p(90)=54.37ms p(95)=72.14ms  p(99.9)=187.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231516
     http_req_receiving.............: avg=686.31µs min=50.98µs med=108.76µs max=161.87ms p(90)=1.13ms  p(95)=1.78ms   p(99.9)=60.3ms  
     http_req_sending...............: avg=39.98µs  min=4.98µs  med=9.44µs   max=138.88ms p(90)=17.35µs p(95)=101.06µs p(99.9)=2.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.95ms  min=1.78ms  med=16.95ms  max=635.81ms p(90)=53.11ms p(95)=70.65ms  p(99.9)=185.76ms
     http_reqs......................: 231516  1925.388297/s
     iteration_duration.............: avg=25.91ms  min=2.68ms  med=17.73ms  max=636.22ms p(90)=54.61ms p(95)=72.37ms  p(99.9)=190.98ms
     iterations.....................: 231416  1924.556653/s
     success_rate...................: 100.00% ✓ 231416      ✗ 0     
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

     checks.........................: 100.00% ✓ 542502      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 217 MB  1.8 MB/s
     http_req_blocked...............: avg=3.56µs   min=972ns   med=2.36µs  max=5.24ms   p(90)=4.75µs   p(95)=5.91µs   p(99.9)=46.14µs
     http_req_connecting............: avg=571ns    min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.9ms   min=2.36ms  med=32.04ms max=338.24ms p(90)=43.58ms  p(95)=48.33ms  p(99.9)=88.69ms
       { expected_response:true }...: avg=32.9ms   min=2.36ms  med=32.04ms max=338.24ms p(90)=43.58ms  p(95)=48.33ms  p(99.9)=88.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180934
     http_req_receiving.............: avg=114.13µs min=29.89µs med=62.19µs max=152.15ms p(90)=138.18µs p(95)=296.3µs  p(99.9)=5.58ms 
     http_req_sending...............: avg=48.08µs  min=5.31µs  med=10.45µs max=137.53ms p(90)=24.47µs  p(95)=138.73µs p(99.9)=3.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.74ms  min=2.25ms  med=31.9ms  max=337.57ms p(90)=43.38ms  p(95)=48.11ms  p(99.9)=88.23ms
     http_reqs......................: 180934  1503.91023/s
     iteration_duration.............: avg=33.17ms  min=4.71ms  med=32.27ms max=354.1ms  p(90)=43.83ms  p(95)=48.58ms  p(99.9)=89.76ms
     iterations.....................: 180834  1503.079037/s
     success_rate...................: 100.00% ✓ 180834      ✗ 0     
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

     checks.........................: 100.00% ✓ 422493      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.81µs  min=1.04µs  med=2.69µs  max=4.62ms   p(90)=4.25µs   p(95)=4.9µs    p(99.9)=35.93µs
     http_req_connecting............: avg=791ns   min=0s      med=0s      max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.34ms min=2.33ms  med=41.81ms max=314.32ms p(90)=59.59ms  p(95)=64.94ms  p(99.9)=92.52ms
       { expected_response:true }...: avg=42.34ms min=2.33ms  med=41.81ms max=314.32ms p(90)=59.59ms  p(95)=64.94ms  p(99.9)=92.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140931
     http_req_receiving.............: avg=84.48µs min=29.64µs med=66.27µs max=81.59ms  p(90)=104.03µs p(95)=122.59µs p(99.9)=1.67ms 
     http_req_sending...............: avg=27.46µs min=5.29µs  med=11.67µs max=130.63ms p(90)=17.92µs  p(95)=21.69µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.23ms min=2.21ms  med=41.71ms max=314ms    p(90)=59.47ms  p(95)=64.8ms   p(99.9)=92.05ms
     http_reqs......................: 140931  1171.579596/s
     iteration_duration.............: avg=42.59ms min=3.99ms  med=42.03ms max=353.32ms p(90)=59.79ms  p(95)=65.16ms  p(99.9)=92.94ms
     iterations.....................: 140831  1170.748282/s
     success_rate...................: 100.00% ✓ 140831      ✗ 0     
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

     checks.........................: 100.00% ✓ 182016     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   605 kB/s
     http_req_blocked...............: avg=4.15µs  min=1.16µs  med=2.92µs  max=3.03ms   p(90)=4.39µs   p(95)=4.96µs   p(99.9)=55.98µs 
     http_req_connecting............: avg=989ns   min=0s      med=0s      max=2.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.51ms min=4.43ms  med=96.08ms max=335.85ms p(90)=119.82ms p(95)=132.9ms  p(99.9)=235.09ms
       { expected_response:true }...: avg=98.51ms min=4.43ms  med=96.08ms max=335.85ms p(90)=119.82ms p(95)=132.9ms  p(99.9)=235.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60772
     http_req_receiving.............: avg=89.67µs min=30.63µs med=79.66µs max=219.43ms p(90)=113.43µs p(95)=125.5µs  p(99.9)=849.35µs
     http_req_sending...............: avg=26.01µs min=5.8µs   med=13.76µs max=147.93ms p(90)=19.85µs  p(95)=21.81µs  p(99.9)=654.51µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.39ms min=4.31ms  med=95.96ms max=335.57ms p(90)=119.69ms p(95)=132.77ms p(99.9)=234.8ms 
     http_reqs......................: 60772   503.965861/s
     iteration_duration.............: avg=98.91ms min=20.11ms med=96.32ms max=366.77ms p(90)=120.06ms p(95)=133.19ms p(99.9)=237.35ms
     iterations.....................: 60672   503.136588/s
     success_rate...................: 100.00% ✓ 60672      ✗ 0    
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

     checks.........................: 100.00% ✓ 134811     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   448 kB/s
     http_req_blocked...............: avg=6.12µs   min=1.21µs  med=3.48µs   max=4.88ms   p(90)=4.87µs   p(95)=5.42µs   p(99.9)=632.46µs
     http_req_connecting............: avg=2.47µs   min=0s      med=0s       max=4.85ms   p(90)=0s       p(95)=0s       p(99.9)=608.34µs
     http_req_duration..............: avg=132.99ms min=5.96ms  med=130.25ms max=323.58ms p(90)=175.96ms p(95)=189.5ms  p(99.9)=242.78ms
       { expected_response:true }...: avg=132.99ms min=5.96ms  med=130.25ms max=323.58ms p(90)=175.96ms p(95)=189.5ms  p(99.9)=242.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45037
     http_req_receiving.............: avg=96.68µs  min=32.87µs med=87.97µs  max=160.45ms p(90)=119.28µs p(95)=131.92µs p(99.9)=841.72µs
     http_req_sending...............: avg=35.02µs  min=5.46µs  med=16.55µs  max=233.94ms p(90)=21.69µs  p(95)=23.48µs  p(99.9)=612.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.85ms min=5.82ms  med=130.13ms max=323.14ms p(90)=175.81ms p(95)=189.37ms p(99.9)=242.17ms
     http_reqs......................: 45037   372.941855/s
     iteration_duration.............: avg=133.56ms min=35.92ms med=130.57ms max=378.54ms p(90)=176.29ms p(95)=189.85ms p(99.9)=248.17ms
     iterations.....................: 44937   372.113776/s
     success_rate...................: 100.00% ✓ 44937      ✗ 0    
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

     checks.........................: 100.00% ✓ 89631      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=7.14µs   min=1.23µs  med=3.54µs   max=4.05ms   p(90)=4.91µs   p(95)=5.51µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.36µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=200.07ms min=6.43ms  med=184.01ms max=704.99ms p(90)=242.9ms  p(95)=390.4ms  p(99.9)=538.11ms
       { expected_response:true }...: avg=200.07ms min=6.43ms  med=184.01ms max=704.99ms p(90)=242.9ms  p(95)=390.4ms  p(99.9)=538.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29977
     http_req_receiving.............: avg=100.62µs min=31.21µs med=96.42µs  max=2.81ms   p(90)=128.69µs p(95)=142.21µs p(99.9)=621.47µs
     http_req_sending...............: avg=26.09µs  min=6.12µs  med=17.64µs  max=69.11ms  p(90)=22.56µs  p(95)=24.27µs  p(99.9)=611.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.94ms min=6.29ms  med=183.88ms max=704.7ms  p(90)=242.8ms  p(95)=390.25ms p(99.9)=538.02ms
     http_reqs......................: 29977   247.519838/s
     iteration_duration.............: avg=201.01ms min=60.4ms  med=184.4ms  max=705.42ms p(90)=243.34ms p(95)=391.52ms p(99.9)=538.53ms
     iterations.....................: 29877   246.694139/s
     success_rate...................: 100.00% ✓ 29877      ✗ 0    
     vus............................: 18      min=18       max=50 
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

     checks.........................: 100.00% ✓ 86097      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=4.96µs   min=1.25µs  med=3.33µs   max=2.37ms   p(90)=4.58µs   p(95)=5.09µs   p(99.9)=607.74µs
     http_req_connecting............: avg=1.5µs    min=0s      med=0s       max=2.34ms   p(90)=0s       p(95)=0s       p(99.9)=583.92µs
     http_req_duration..............: avg=208.21ms min=8.72ms  med=208.62ms max=343.09ms p(90)=220.36ms p(95)=228.31ms p(99.9)=295.21ms
       { expected_response:true }...: avg=208.21ms min=8.72ms  med=208.62ms max=343.09ms p(90)=220.36ms p(95)=228.31ms p(99.9)=295.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28799
     http_req_receiving.............: avg=100.78µs min=34.92µs med=92.7µs   max=101.81ms p(90)=124.79µs p(95)=137.39µs p(99.9)=520.21µs
     http_req_sending...............: avg=26.91µs  min=6.17µs  med=16.62µs  max=80.89ms  p(90)=21.27µs  p(95)=23.13µs  p(99.9)=594.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.08ms min=8.61ms  med=208.44ms max=342.56ms p(90)=220.22ms p(95)=228.16ms p(99.9)=295.11ms
     http_reqs......................: 28799   237.834073/s
     iteration_duration.............: avg=209.19ms min=60.88ms med=209.84ms max=378.65ms p(90)=220.62ms p(95)=228.58ms p(99.9)=297.57ms
     iterations.....................: 28699   237.008232/s
     success_rate...................: 100.00% ✓ 28699      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

