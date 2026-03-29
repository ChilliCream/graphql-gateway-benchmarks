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
| hive-router | v0.0.42 | 3,112 | 3,302 | 3,030 | 2.6% |  |
| hotchocolate | 16.0.0-rc.1.21 | 2,117 | 2,162 | 2,111 | 0.8% |  |
| grafbase | 0.53.2 | 2,093 | 2,151 | 2,073 | 1.3% |  |
| cosmo | 0.295.0 | 1,249 | 1,273 | 1,242 | 1.0% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 605 | 620 | 599 | 1.1% |  |
| apollo-router | v2.12.0 | 401 | 413 | 396 | 1.4% |  |
| hive-gateway | 2.5.11 | 272 | 275 | 270 | 0.7% |  |
| apollo-gateway | 2.13.3 | 249 | 250 | 248 | 0.3% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.42 | 2,388 | 2,542 | 2,357 | 2.6% |  |
| hotchocolate | 16.0.0-rc.1.21 | 1,977 | 2,026 | 1,965 | 1.0% |  |
| grafbase | 0.53.2 | 1,528 | 1,553 | 1,513 | 0.8% |  |
| cosmo | 0.295.0 | 1,185 | 1,204 | 1,173 | 1.0% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 588 | 603 | 586 | 1.0% |  |
| apollo-router | v2.12.0 | 403 | 410 | 399 | 0.8% |  |
| hive-gateway | 2.5.11 | 264 | 270 | 262 | 1.0% |  |
| apollo-gateway | 2.13.3 | 240 | 242 | 237 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1122006     ✗ 0     
     data_received..................: 33 GB   273 MB/s
     data_sent......................: 450 MB  3.7 MB/s
     http_req_blocked...............: avg=3.67µs   min=1.06µs  med=2.42µs  max=24.81ms  p(90)=3.71µs   p(95)=4.41µs   p(99.9)=34.81µs
     http_req_connecting............: avg=571ns    min=0s      med=0s      max=10.29ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.79ms  min=1.65ms  med=14.74ms max=324.3ms  p(90)=23.35ms  p(95)=27.74ms  p(99.9)=52.33ms
       { expected_response:true }...: avg=15.79ms  min=1.65ms  med=14.74ms max=324.3ms  p(90)=23.35ms  p(95)=27.74ms  p(99.9)=52.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 374102
     http_req_receiving.............: avg=174.19µs min=28.17µs med=51.37µs max=280.31ms p(90)=106.01µs p(95)=299.95µs p(99.9)=17.7ms 
     http_req_sending...............: avg=65.24µs  min=5.24µs  med=9.65µs  max=212.88ms p(90)=16.79µs  p(95)=128.56µs p(99.9)=13.28ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.55ms  min=1.58ms  med=14.58ms max=78.87ms  p(90)=22.99ms  p(95)=27.17ms  p(99.9)=49.7ms 
     http_reqs......................: 374102  3112.388302/s
     iteration_duration.............: avg=16.03ms  min=1.92ms  med=14.95ms max=362.49ms p(90)=23.59ms  p(95)=28.02ms  p(99.9)=54.64ms
     iterations.....................: 374002  3111.55634/s
     success_rate...................: 100.00% ✓ 374002      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 763956      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=2.96µs   min=1.01µs  med=2.14µs   max=12.11ms  p(90)=3.34µs   p(95)=3.94µs   p(99.9)=35.75µs 
     http_req_connecting............: avg=390ns    min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.31ms  min=2.56ms  med=15.09ms  max=328.79ms p(90)=51.59ms  p(95)=70.13ms  p(99.9)=165.52ms
       { expected_response:true }...: avg=23.31ms  min=2.56ms  med=15.09ms  max=328.79ms p(90)=51.59ms  p(95)=70.13ms  p(99.9)=165.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 254752
     http_req_receiving.............: avg=642.55µs min=51.97µs med=104.06µs max=154.67ms p(90)=973.33µs p(95)=1.5ms    p(99.9)=57.73ms 
     http_req_sending...............: avg=48.27µs  min=5.09µs  med=9.31µs   max=235.63ms p(90)=16.11µs  p(95)=106.23µs p(99.9)=4.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.62ms  min=2.44ms  med=14.58ms  max=328.17ms p(90)=50.28ms  p(95)=68.68ms  p(99.9)=163.81ms
     http_reqs......................: 254752  2117.529244/s
     iteration_duration.............: avg=23.55ms  min=2.95ms  med=15.3ms   max=356.92ms p(90)=51.82ms  p(95)=70.36ms  p(99.9)=166.62ms
     iterations.....................: 254652  2116.698032/s
     success_rate...................: 100.00% ✓ 254652      ✗ 0     
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

     checks.........................: 100.00% ✓ 755079      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.33µs   min=1.05µs  med=2.63µs  max=10.09ms  p(90)=4.2µs    p(95)=5.03µs   p(99.9)=49.35µs
     http_req_connecting............: avg=165ns    min=0s      med=0s      max=1.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.58ms  min=1.92ms  med=23.32ms max=321.77ms p(90)=28.46ms  p(95)=31ms     p(99.9)=54.33ms
       { expected_response:true }...: avg=23.58ms  min=1.92ms  med=23.32ms max=321.77ms p(90)=28.46ms  p(95)=31ms     p(99.9)=54.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 251793
     http_req_receiving.............: avg=142.42µs min=29.29µs med=60.44µs max=278.3ms  p(90)=107.26µs p(95)=231.38µs p(99.9)=11.97ms
     http_req_sending...............: avg=47.62µs  min=4.61µs  med=10.81µs max=160.1ms  p(90)=19.06µs  p(95)=123.68µs p(99.9)=3.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.39ms  min=1.83ms  med=23.2ms  max=128.14ms p(90)=28.26ms  p(95)=30.7ms   p(99.9)=52.78ms
     http_reqs......................: 251793  2093.799604/s
     iteration_duration.............: avg=23.82ms  min=3.35ms  med=23.54ms max=366.11ms p(90)=28.69ms  p(95)=31.26ms  p(99.9)=54.9ms 
     iterations.....................: 251693  2092.968048/s
     success_rate...................: 100.00% ✓ 251693      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 450687      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 181 MB  1.5 MB/s
     http_req_blocked...............: avg=3.17µs  min=990ns   med=2.19µs  max=4.31ms   p(90)=3.36µs  p(95)=3.93µs   p(99.9)=31.14µs
     http_req_connecting............: avg=701ns   min=0s      med=0s      max=4.27ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.7ms  min=2.1ms   med=39.12ms max=343.4ms  p(90)=56.18ms p(95)=61.31ms  p(99.9)=86.21ms
       { expected_response:true }...: avg=39.7ms  min=2.1ms   med=39.12ms max=343.4ms  p(90)=56.18ms p(95)=61.31ms  p(99.9)=86.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150329
     http_req_receiving.............: avg=77.43µs min=29.29µs med=59.77µs max=43.08ms  p(90)=92.51µs p(95)=108.83µs p(99.9)=1.72ms 
     http_req_sending...............: avg=28.95µs min=5.2µs   med=10.07µs max=201.76ms p(90)=14.96µs p(95)=18.99µs  p(99.9)=1.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.59ms min=2.04ms  med=39.02ms max=342.68ms p(90)=56.08ms p(95)=61.2ms   p(99.9)=85.66ms
     http_reqs......................: 150329  1249.867864/s
     iteration_duration.............: avg=39.93ms min=4.37ms  med=39.32ms max=351.58ms p(90)=56.38ms p(95)=61.51ms  p(99.9)=86.84ms
     iterations.....................: 150229  1249.036442/s
     success_rate...................: 100.00% ✓ 150229      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 218733     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 88 MB   728 kB/s
     http_req_blocked...............: avg=4.04µs  min=1.18µs  med=2.85µs  max=3.71ms   p(90)=4.33µs   p(95)=4.92µs   p(99.9)=42.47µs 
     http_req_connecting............: avg=911ns   min=0s      med=0s      max=3.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.94ms min=3.8ms   med=79.43ms max=303.45ms p(90)=99.16ms  p(95)=108.72ms p(99.9)=201.01ms
       { expected_response:true }...: avg=81.94ms min=3.8ms   med=79.43ms max=303.45ms p(90)=99.16ms  p(95)=108.72ms p(99.9)=201.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73011
     http_req_receiving.............: avg=86.94µs min=31.8µs  med=75.83µs max=111.59ms p(90)=110.84µs p(95)=124.27µs p(99.9)=925.91µs
     http_req_sending...............: avg=23.21µs min=5.54µs  med=13.13µs max=72.39ms  p(90)=19.73µs  p(95)=22.1µs   p(99.9)=771.87µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.83ms min=3.66ms  med=79.33ms max=280.42ms p(90)=99.05ms  p(95)=108.62ms p(99.9)=200.8ms 
     http_reqs......................: 73011   605.987992/s
     iteration_duration.............: avg=82.29ms min=17.57ms med=79.66ms max=348.84ms p(90)=99.4ms   p(95)=108.99ms p(99.9)=202.41ms
     iterations.....................: 72911   605.157997/s
     success_rate...................: 100.00% ✓ 72911      ✗ 0    
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

     checks.........................: 100.00% ✓ 144978     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   482 kB/s
     http_req_blocked...............: avg=5.51µs   min=1.27µs  med=3.12µs   max=4.1ms    p(90)=4.46µs   p(95)=4.98µs   p(99.9)=611.33µs
     http_req_connecting............: avg=2.13µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=459.55µs
     http_req_duration..............: avg=123.68ms min=5.48ms  med=123.32ms max=383.52ms p(90)=149.72ms p(95)=157.34ms p(99.9)=192.81ms
       { expected_response:true }...: avg=123.68ms min=5.48ms  med=123.32ms max=383.52ms p(90)=149.72ms p(95)=157.34ms p(99.9)=192.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48426
     http_req_receiving.............: avg=88.65µs  min=32.52µs med=82.51µs  max=19.9ms   p(90)=114.39µs p(95)=126.16µs p(99.9)=730.3µs 
     http_req_sending...............: avg=28.03µs  min=5.72µs  med=15.48µs  max=155.21ms p(90)=20.96µs  p(95)=22.84µs  p(99.9)=520.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.57ms min=5.36ms  med=123.2ms  max=363.87ms p(90)=149.61ms p(95)=157.24ms p(99.9)=192.47ms
     http_reqs......................: 48426   401.196371/s
     iteration_duration.............: avg=124.19ms min=33.42ms med=123.6ms  max=392.07ms p(90)=149.99ms p(95)=157.61ms p(99.9)=197.34ms
     iterations.....................: 48326   400.367898/s
     success_rate...................: 100.00% ✓ 48326      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98631      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.78µs   min=1.24µs  med=3.59µs   max=5.39ms   p(90)=5.12µs   p(95)=5.79µs   p(99.9)=563.1µs 
     http_req_connecting............: avg=2.94µs   min=0s      med=0s       max=5.35ms   p(90)=0s       p(95)=0s       p(99.9)=540.33µs
     http_req_duration..............: avg=181.76ms min=5.94ms  med=164.05ms max=598.31ms p(90)=214.97ms p(95)=383.42ms p(99.9)=508.26ms
       { expected_response:true }...: avg=181.76ms min=5.94ms  med=164.05ms max=598.31ms p(90)=214.97ms p(95)=383.42ms p(99.9)=508.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32977
     http_req_receiving.............: avg=103.02µs min=34.74µs med=97.52µs  max=21.5ms   p(90)=130.64µs p(95)=144.68µs p(99.9)=601.22µs
     http_req_sending...............: avg=30.85µs  min=6.21µs  med=18.35µs  max=85.39ms  p(90)=23.39µs  p(95)=25.33µs  p(99.9)=2.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.63ms min=5.85ms  med=163.92ms max=598.14ms p(90)=214.81ms p(95)=383.31ms p(99.9)=508.16ms
     http_reqs......................: 32977   272.63503/s
     iteration_duration.............: avg=182.6ms  min=30.99ms med=164.4ms  max=598.59ms p(90)=215.4ms  p(95)=384.03ms p(99.9)=508.5ms 
     iterations.....................: 32877   271.808287/s
     success_rate...................: 100.00% ✓ 32877      ✗ 0    
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

     checks.........................: 100.00% ✓ 90165      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   299 kB/s
     http_req_blocked...............: avg=6.89µs   min=1.23µs  med=3.25µs   max=4.05ms   p(90)=4.56µs   p(95)=5.12µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.44µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=198.81ms min=8.57ms  med=204.2ms  max=435.94ms p(90)=211.92ms p(95)=217.69ms p(99.9)=285.69ms
       { expected_response:true }...: avg=198.81ms min=8.57ms  med=204.2ms  max=435.94ms p(90)=211.92ms p(95)=217.69ms p(99.9)=285.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30155
     http_req_receiving.............: avg=100.78µs min=35µs    med=92.5µs   max=80.54ms  p(90)=124.77µs p(95)=137.84µs p(99.9)=758.5µs 
     http_req_sending...............: avg=27.96µs  min=6.16µs  med=17.06µs  max=76.89ms  p(90)=21.69µs  p(95)=23.48µs  p(99.9)=622.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.69ms min=8.43ms  med=204.09ms max=435.19ms p(90)=211.79ms p(95)=217.58ms p(99.9)=285.17ms
     http_reqs......................: 30155   249.046952/s
     iteration_duration.............: avg=199.76ms min=51.27ms med=204.45ms max=459.21ms p(90)=212.23ms p(95)=218ms    p(99.9)=304.32ms
     iterations.....................: 30055   248.221063/s
     success_rate...................: 100.00% ✓ 30055      ✗ 0    
     vus............................: 36      min=36       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 861078      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=3.12µs   min=962ns   med=2.22µs  max=12.75ms  p(90)=3.63µs   p(95)=4.38µs   p(99.9)=36.73µs
     http_req_connecting............: avg=362ns    min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.66ms  min=1.64ms  med=20.22ms max=331.57ms p(90)=28.58ms  p(95)=31.57ms  p(99.9)=53.02ms
       { expected_response:true }...: avg=20.66ms  min=1.64ms  med=20.22ms max=331.57ms p(90)=28.58ms  p(95)=31.57ms  p(99.9)=53.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287126
     http_req_receiving.............: avg=114.99µs min=28.61µs med=55.83µs max=140.42ms p(90)=105.08µs p(95)=262.04µs p(99.9)=9.24ms 
     http_req_sending...............: avg=51.6µs   min=5.07µs  med=9.9µs   max=232.32ms p(90)=17.85µs  p(95)=125.66µs p(99.9)=4.43ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.49ms  min=1.57ms  med=20.08ms max=330.93ms p(90)=28.38ms  p(95)=31.31ms  p(99.9)=52.03ms
     http_reqs......................: 287126  2388.480487/s
     iteration_duration.............: avg=20.89ms  min=3.31ms  med=20.44ms max=351.44ms p(90)=28.8ms   p(95)=31.8ms   p(99.9)=53.73ms
     iterations.....................: 287026  2387.648629/s
     success_rate...................: 100.00% ✓ 287026      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.21)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 713100      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 286 MB  2.4 MB/s
     http_req_blocked...............: avg=3.01µs   min=972ns   med=2.12µs   max=11.47ms  p(90)=3.6µs   p(95)=4.33µs  p(99.9)=31.19µs 
     http_req_connecting............: avg=440ns    min=0s      med=0s       max=4.14ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=24.99ms  min=1.92ms  med=17.44ms  max=531.18ms p(90)=51.92ms p(95)=68.3ms  p(99.9)=182.94ms
       { expected_response:true }...: avg=24.99ms  min=1.92ms  med=17.44ms  max=531.18ms p(90)=51.92ms p(95)=68.3ms  p(99.9)=182.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237800
     http_req_receiving.............: avg=669.29µs min=49.33µs med=103.87µs max=263.97ms p(90)=1.14ms  p(95)=1.84ms  p(99.9)=53.85ms 
     http_req_sending...............: avg=44.03µs  min=4.98µs  med=9.36µs   max=254.57ms p(90)=17.78µs p(95)=105.9µs p(99.9)=2.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.28ms  min=1.82ms  med=16.88ms  max=530.78ms p(90)=50.7ms  p(95)=66.8ms  p(99.9)=181.39ms
     http_reqs......................: 237800  1977.465058/s
     iteration_duration.............: avg=25.23ms  min=2.69ms  med=17.66ms  max=531.39ms p(90)=52.15ms p(95)=68.55ms p(99.9)=186.32ms
     iterations.....................: 237700  1976.633492/s
     success_rate...................: 100.00% ✓ 237700      ✗ 0     
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

     checks.........................: 100.00% ✓ 551559      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.45µs   min=942ns   med=2.34µs  max=18.36ms  p(90)=4.63µs   p(95)=5.74µs   p(99.9)=39.16µs
     http_req_connecting............: avg=442ns    min=0s      med=0s      max=3.78ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.36ms  min=2.23ms  med=31.48ms max=333.94ms p(90)=43.01ms  p(95)=47.7ms   p(99.9)=89.59ms
       { expected_response:true }...: avg=32.36ms  min=2.23ms  med=31.48ms max=333.94ms p(90)=43.01ms  p(95)=47.7ms   p(99.9)=89.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183953
     http_req_receiving.............: avg=112.43µs min=30.55µs med=62.47µs max=76.24ms  p(90)=135.21µs p(95)=277.53µs p(99.9)=5.24ms 
     http_req_sending...............: avg=45.48µs  min=5.31µs  med=10.51µs max=128.21ms p(90)=24.51µs  p(95)=133.23µs p(99.9)=3.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.2ms   min=2.17ms  med=31.34ms max=333.54ms p(90)=42.82ms  p(95)=47.46ms  p(99.9)=89.26ms
     http_reqs......................: 183953  1528.964248/s
     iteration_duration.............: avg=32.62ms  min=5.28ms  med=31.72ms max=345.08ms p(90)=43.25ms  p(95)=47.95ms  p(99.9)=90.07ms
     iterations.....................: 183853  1528.133077/s
     success_rate...................: 100.00% ✓ 183853      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427605      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.65µs  min=1.07µs  med=2.62µs  max=4.19ms   p(90)=4.09µs   p(95)=4.74µs   p(99.9)=39.04µs
     http_req_connecting............: avg=719ns   min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.84ms min=2.07ms  med=41.29ms max=340.46ms p(90)=58.87ms  p(95)=64.2ms   p(99.9)=89.27ms
       { expected_response:true }...: avg=41.84ms min=2.07ms  med=41.29ms max=340.46ms p(90)=58.87ms  p(95)=64.2ms   p(99.9)=89.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142635
     http_req_receiving.............: avg=88.09µs min=29.26µs med=66.05µs max=111.29ms p(90)=104.02µs p(95)=123.19µs p(99.9)=2.22ms 
     http_req_sending...............: avg=27.28µs min=5.48µs  med=11.38µs max=183.86ms p(90)=17.91µs  p(95)=21.91µs  p(99.9)=1.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.72ms min=2.01ms  med=41.18ms max=339.94ms p(90)=58.74ms  p(95)=64.05ms  p(99.9)=88.78ms
     http_reqs......................: 142635  1185.849582/s
     iteration_duration.............: avg=42.08ms min=4.11ms  med=41.51ms max=365.25ms p(90)=59.08ms  p(95)=64.42ms  p(99.9)=89.82ms
     iterations.....................: 142535  1185.018195/s
     success_rate...................: 100.00% ✓ 142535      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 212688     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 85 MB   707 kB/s
     http_req_blocked...............: avg=3.97µs  min=1.19µs  med=3.13µs  max=2.11ms   p(90)=4.65µs   p(95)=5.24µs   p(99.9)=48.25µs 
     http_req_connecting............: avg=602ns   min=0s      med=0s      max=2.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.27ms min=3.98ms  med=81.86ms max=335.31ms p(90)=101.57ms p(95)=111.35ms p(99.9)=207.44ms
       { expected_response:true }...: avg=84.27ms min=3.98ms  med=81.86ms max=335.31ms p(90)=101.57ms p(95)=111.35ms p(99.9)=207.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70996
     http_req_receiving.............: avg=90.83µs min=32.3µs  med=81.68µs max=68.96ms  p(90)=116.14µs p(95)=129.87µs p(99.9)=927.78µs
     http_req_sending...............: avg=26.99µs min=5.56µs  med=14.57µs max=201.46ms p(90)=21.11µs  p(95)=23.37µs  p(99.9)=673.03µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.16ms min=3.86ms  med=81.75ms max=334.99ms p(90)=101.45ms p(95)=111.24ms p(99.9)=207.17ms
     http_reqs......................: 70996   588.990505/s
     iteration_duration.............: avg=84.64ms min=21.15ms med=82.11ms max=342.64ms p(90)=101.83ms p(95)=111.66ms p(99.9)=208.27ms
     iterations.....................: 70896   588.160894/s
     success_rate...................: 100.00% ✓ 70896      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 145746     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   484 kB/s
     http_req_blocked...............: avg=5.73µs   min=1.18µs  med=3.34µs   max=53.72ms  p(90)=4.86µs   p(95)=5.46µs   p(99.9)=157.45µs
     http_req_connecting............: avg=2.15µs   min=0s      med=0s       max=53.66ms  p(90)=0s       p(95)=0s       p(99.9)=84.43µs 
     http_req_duration..............: avg=123.01ms min=5.96ms  med=120.78ms max=357.23ms p(90)=162.55ms p(95)=174.72ms p(99.9)=222.35ms
       { expected_response:true }...: avg=123.01ms min=5.96ms  med=120.78ms max=357.23ms p(90)=162.55ms p(95)=174.72ms p(99.9)=222.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48682
     http_req_receiving.............: avg=94.33µs  min=30.19µs med=88.38µs  max=52ms     p(90)=119.78µs p(95)=132.75µs p(99.9)=731.12µs
     http_req_sending...............: avg=29.76µs  min=5.88µs  med=16.87µs  max=72.67ms  p(90)=22.18µs  p(95)=24.11µs  p(99.9)=768.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.89ms min=5.83ms  med=120.65ms max=357.08ms p(90)=162.44ms p(95)=174.61ms p(99.9)=222.27ms
     http_reqs......................: 48682   403.182419/s
     iteration_duration.............: avg=123.53ms min=23.18ms med=121.1ms  max=366.78ms p(90)=162.88ms p(95)=175.04ms p(99.9)=226.2ms 
     iterations.....................: 48582   402.354223/s
     success_rate...................: 100.00% ✓ 48582      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95652      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   317 kB/s
     http_req_blocked...............: avg=6.36µs   min=1.28µs  med=3.44µs   max=3.97ms   p(90)=4.87µs   p(95)=5.48µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=2.72µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.01ms  
     http_req_duration..............: avg=187.46ms min=5.95ms  med=168.3ms  max=620.3ms  p(90)=250.83ms p(95)=394.56ms p(99.9)=546.01ms
       { expected_response:true }...: avg=187.46ms min=5.95ms  med=168.3ms  max=620.3ms  p(90)=250.83ms p(95)=394.56ms p(99.9)=546.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31984
     http_req_receiving.............: avg=103.9µs  min=33.73µs med=94.72µs  max=66.27ms  p(90)=127.38µs p(95)=141.45µs p(99.9)=751.64µs
     http_req_sending...............: avg=33.2µs   min=5.9µs   med=17.29µs  max=190.03ms p(90)=22.43µs  p(95)=24.12µs  p(99.9)=951.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.32ms min=5.81ms  med=168.17ms max=620.13ms p(90)=250.71ms p(95)=394.46ms p(99.9)=545.9ms 
     http_reqs......................: 31984   264.373158/s
     iteration_duration.............: avg=188.34ms min=31.21ms med=168.72ms max=620.56ms p(90)=251.45ms p(95)=395.49ms p(99.9)=546.4ms 
     iterations.....................: 31884   263.546578/s
     success_rate...................: 100.00% ✓ 31884      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 86907      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.16µs   min=1.25µs  med=3.35µs   max=4.61ms   p(90)=4.66µs   p(95)=5.19µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=3.63µs   min=0s      med=0s       max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=206.26ms min=8.55ms  med=207.41ms max=442.32ms p(90)=300.35ms p(95)=308.85ms p(99.9)=395.41ms
       { expected_response:true }...: avg=206.26ms min=8.55ms  med=207.41ms max=442.32ms p(90)=300.35ms p(95)=308.85ms p(99.9)=395.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29069
     http_req_receiving.............: avg=195.96µs min=31.96µs med=93.94µs  max=154.55ms p(90)=125.56µs p(95)=138.35µs p(99.9)=31.57ms 
     http_req_sending...............: avg=36.5µs   min=6.1µs   med=17.01µs  max=180.95ms p(90)=21.8µs   p(95)=23.61µs  p(99.9)=528.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.03ms min=8.44ms  med=207.22ms max=442.19ms p(90)=300.13ms p(95)=308.47ms p(99.9)=385.93ms
     http_reqs......................: 29069   240.042506/s
     iteration_duration.............: avg=207.24ms min=20.84ms med=208.25ms max=452.46ms p(90)=300.68ms p(95)=309.25ms p(99.9)=398.32ms
     iterations.....................: 28969   239.216738/s
     success_rate...................: 100.00% ✓ 28969      ✗ 0    
     vus............................: 35      min=35       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

