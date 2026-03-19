## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,728 | 2,831 | 2,655 | 2.1% |  |
| hotchocolate | 16.0.0-p.11.49 | 1,432 | 1,432 | 1,432 | 0.0% | non-compatible response (3943519 across 8/9 runs) |
| cosmo | 0.291.0 | 1,188 | 1,188 | 1,161 | 1.6% | non-compatible response (3244492 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 487 | 492 | 481 | 0.9% |  |
| hive-gateway | 2.5.6 | 245 | 247 | 241 | 0.9% |  |
| apollo-gateway | 2.13.2 | 212 | 216 | 207 | 1.4% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (34750 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (465600 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,249 | 2,340 | 2,208 | 1.9% |  |
| hotchocolate | 16.0.0-p.11.49 | 1,592 | 1,602 | 1,555 | 1.6% | non-compatible response (2443880 across 6/9 runs) |
| cosmo | 0.291.0 | 1,112 | 1,112 | 1,112 | 0.0% | non-compatible response (22 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 458 | 468 | 454 | 1.2% |  |
| hive-gateway | 2.5.6 | 241 | 245 | 238 | 0.9% |  |
| apollo-gateway | 2.13.2 | 206 | 209 | 205 | 0.6% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (39299 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (327631 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 502473      ✗ 0     
     data_received..................: 15 GB   239 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=28.75µs  min=962ns   med=2.28µs  max=83.12ms  p(90)=3.79µs   p(95)=4.93µs   p(99.9)=6.03ms  
     http_req_connecting............: avg=25.52µs  min=0s      med=0s      max=83.02ms  p(90)=0s       p(95)=0s       p(99.9)=5.91ms  
     http_req_duration..............: avg=84.3ms   min=1.52ms  med=78.29ms max=303.47ms p(90)=163.27ms p(95)=179.53ms p(99.9)=256.35ms
       { expected_response:true }...: avg=84.3ms   min=1.52ms  med=78.29ms max=303.47ms p(90)=163.27ms p(95)=179.53ms p(99.9)=256.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 168491
     http_req_receiving.............: avg=357.07µs min=27.98µs med=56.06µs max=107.82ms p(90)=229.55µs p(95)=420.89µs p(99.9)=34.88ms 
     http_req_sending...............: avg=88.1µs   min=5.26µs  med=10.02µs max=117.97ms p(90)=18.7µs   p(95)=133.55µs p(99.9)=14.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.86ms  min=1.47ms  med=77.98ms max=296.65ms p(90)=162.53ms p(95)=178.5ms  p(99.9)=251.05ms
     http_reqs......................: 168491  2728.06899/s
     iteration_duration.............: avg=85.11ms  min=2.28ms  med=79.2ms  max=343.49ms p(90)=163.79ms p(95)=180.17ms p(99.9)=258.24ms
     iterations.....................: 167491  2711.877805/s
     success_rate...................: 100.00% ✓ 167491      ✗ 0     
     vus............................: 92      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 268293      ✗ 0    
     data_received..................: 7.9 GB  126 MB/s
     data_sent......................: 109 MB  1.7 MB/s
     http_req_blocked...............: avg=13.46µs  min=992ns   med=2.3µs    max=83.6ms   p(90)=3.66µs   p(95)=4.5µs    p(99.9)=1.25ms  
     http_req_connecting............: avg=10.54µs  min=0s      med=0s       max=83.44ms  p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=129.28ms min=2.74ms  med=66.9ms   max=3.89s    p(90)=328.41ms p(95)=456.36ms p(99.9)=1.8s    
       { expected_response:true }...: avg=129.28ms min=2.74ms  med=66.9ms   max=3.89s    p(90)=328.41ms p(95)=456.36ms p(99.9)=1.8s    
     http_req_failed................: 0.00%   ✓ 0           ✗ 90431
     http_req_receiving.............: avg=3.72ms   min=50.85µs med=107.95µs max=958.2ms  p(90)=2.04ms   p(95)=6.67ms   p(99.9)=321.33ms
     http_req_sending...............: avg=53.42µs  min=5.1µs   med=9.8µs    max=102.41ms p(90)=16.52µs  p(95)=25.69µs  p(99.9)=6.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.5ms  min=2.64ms  med=65.46ms  max=3.89s    p(90)=315.77ms p(95)=438.89ms p(99.9)=1.8s    
     http_reqs......................: 90431   1432.18131/s
     iteration_duration.............: avg=131ms    min=3.9ms   med=68.7ms   max=3.89s    p(90)=330.95ms p(95)=458.48ms p(99.9)=1.8s    
     iterations.....................: 89431   1416.344027/s
     success_rate...................: 100.00% ✓ 89431       ✗ 0    
     vus............................: 109     min=0         max=496
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 219795      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=6.05µs   min=1.11µs  med=2.21µs   max=15.94ms  p(90)=3.5µs    p(95)=4.23µs   p(99.9)=619.87µs
     http_req_connecting............: avg=3.19µs   min=0s      med=0s       max=15.78ms  p(90)=0s       p(95)=0s       p(99.9)=506.86µs
     http_req_duration..............: avg=192.13ms min=2.04ms  med=192.08ms max=598.91ms p(90)=355.94ms p(95)=383.65ms p(99.9)=515.85ms
       { expected_response:true }...: avg=192.13ms min=2.04ms  med=192.08ms max=598.91ms p(90)=355.94ms p(95)=383.65ms p(99.9)=515.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74265
     http_req_receiving.............: avg=76.23µs  min=28.72µs med=58.97µs  max=179.7ms  p(90)=89.76µs  p(95)=102.42µs p(99.9)=1.44ms  
     http_req_sending...............: avg=26.52µs  min=5.45µs  med=10.07µs  max=41.91ms  p(90)=14.89µs  p(95)=18.16µs  p(99.9)=3.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.03ms min=1.98ms  med=191.96ms max=598.83ms p(90)=355.84ms p(95)=383.57ms p(99.9)=515.78ms
     http_reqs......................: 74265   1188.961238/s
     iteration_duration.............: avg=194.98ms min=4.48ms  med=195.04ms max=599.05ms p(90)=356.86ms p(95)=384.54ms p(99.9)=516.26ms
     iterations.....................: 73265   1172.951526/s
     success_rate...................: 100.00% ✓ 73265       ✗ 0    
     vus............................: 80      min=0         max=493
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 92010      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   587 kB/s
     http_req_blocked...............: avg=12.06µs  min=1.16µs  med=3.04µs   max=8.5ms   p(90)=4.88µs   p(95)=5.96µs   p(99.9)=2.68ms  
     http_req_connecting............: avg=7.67µs   min=0s      med=0s       max=8.45ms  p(90)=0s       p(95)=0s       p(99.9)=2.11ms  
     http_req_duration..............: avg=453.2ms  min=4.18ms  med=422.77ms max=1.87s   p(90)=890.64ms p(95)=966.12ms p(99.9)=1.41s   
       { expected_response:true }...: avg=453.2ms  min=4.18ms  med=422.77ms max=1.87s   p(90)=890.64ms p(95)=966.12ms p(99.9)=1.41s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31670
     http_req_receiving.............: avg=89.39µs  min=31.53µs med=79.47µs  max=50.73ms p(90)=116.5µs  p(95)=130.93µs p(99.9)=832.41µs
     http_req_sending...............: avg=32.05µs  min=5.74µs  med=13.74µs  max=56.02ms p(90)=21.26µs  p(95)=24.81µs  p(99.9)=4.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=453.08ms min=4.11ms  med=422.66ms max=1.87s   p(90)=890.51ms p(95)=966.03ms p(99.9)=1.41s   
     http_reqs......................: 31670   487.764418/s
     iteration_duration.............: avg=468.19ms min=20.07ms med=441.39ms max=1.88s   p(90)=894.59ms p(95)=969.68ms p(99.9)=1.42s   
     iterations.....................: 30670   472.362953/s
     success_rate...................: 100.00% ✓ 30670      ✗ 0    
     vus............................: 58      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 46716      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   297 kB/s
     http_req_blocked...............: avg=12.46µs  min=1.3µs   med=3.71µs   max=3.94ms  p(90)=5.67µs   p(95)=7.14µs   p(99.9)=1.6ms  
     http_req_connecting............: avg=6.96µs   min=0s      med=0s       max=3.66ms  p(90)=0s       p(95)=0s       p(99.9)=1.55ms 
     http_req_duration..............: avg=839.13ms min=5.76ms  med=759.34ms max=15.49s  p(90)=1.57s    p(95)=1.75s    p(99.9)=12.75s 
       { expected_response:true }...: avg=839.13ms min=5.76ms  med=759.34ms max=15.49s  p(90)=1.57s    p(95)=1.75s    p(99.9)=12.75s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16572
     http_req_receiving.............: avg=105.28µs min=36.18µs med=100.29µs max=3.21ms  p(90)=140.06µs p(95)=152.54µs p(99.9)=894.8µs
     http_req_sending...............: avg=40.07µs  min=6.4µs   med=18.19µs  max=80.04ms p(90)=24.46µs  p(95)=29.55µs  p(99.9)=3.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=838.99ms min=5.62ms  med=759.14ms max=15.49s  p(90)=1.57s    p(95)=1.75s    p(99.9)=12.75s 
     http_reqs......................: 16572   245.050168/s
     iteration_duration.............: avg=893.08ms min=50.29ms med=822.66ms max=15.49s  p(90)=1.59s    p(95)=1.76s    p(99.9)=12.79s 
     iterations.....................: 15572   230.263168/s
     success_rate...................: 100.00% ✓ 15572      ✗ 0    
     vus............................: 98      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 41343      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   261 kB/s
     http_req_blocked...............: avg=19.94µs  min=1.22µs  med=3.48µs   max=50.03ms  p(90)=5.26µs   p(95)=6.85µs   p(99.9)=2.73ms 
     http_req_connecting............: avg=14.75µs  min=0s      med=0s       max=49.95ms  p(90)=0s       p(95)=0s       p(99.9)=2.71ms 
     http_req_duration..............: avg=448.69ms min=8.53ms  med=483.45ms max=1.27s    p(90)=770.19ms p(95)=849.03ms p(99.9)=1.18s  
       { expected_response:true }...: avg=448.69ms min=8.53ms  med=483.45ms max=1.27s    p(90)=770.19ms p(95)=849.03ms p(99.9)=1.18s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14781
     http_req_receiving.............: avg=275.84µs min=35.23µs med=95.06µs  max=160.25ms p(90)=134.72µs p(95)=147.76µs p(99.9)=77.98ms
     http_req_sending...............: avg=36.42µs  min=5.99µs  med=17.56µs  max=117.6ms  p(90)=23.4µs   p(95)=28.55µs  p(99.9)=2.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=448.38ms min=8.4ms   med=483.36ms max=1.27s    p(90)=770.1ms  p(95)=848.92ms p(99.9)=1.18s  
     http_reqs......................: 14781   212.182631/s
     iteration_duration.............: avg=481.16ms min=9.07ms  med=515.74ms max=1.28s    p(90)=778.1ms  p(95)=855.54ms p(99.9)=1.2s   
     iterations.....................: 13781   197.827538/s
     success_rate...................: 100.00% ✓ 13781      ✗ 0    
     vus............................: 124     min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 415495      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=21.27µs  min=1.02µs  med=2.48µs  max=66.25ms  p(90)=4.25µs   p(95)=5.52µs   p(99.9)=2.96ms  
     http_req_connecting............: avg=17.89µs  min=0s      med=0s      max=66.09ms  p(90)=0s       p(95)=0s       p(99.9)=2.94ms  
     http_req_duration..............: avg=101.94ms min=1.53ms  med=97.54ms max=330.93ms p(90)=194.89ms p(95)=210.66ms p(99.9)=259.15ms
       { expected_response:true }...: avg=101.94ms min=1.53ms  med=97.54ms max=330.93ms p(90)=194.89ms p(95)=210.66ms p(99.9)=259.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139499
     http_req_receiving.............: avg=195.54µs min=29.31µs med=60.02µs max=229.82ms p(90)=171.86µs p(95)=403.66µs p(99.9)=22.38ms 
     http_req_sending...............: avg=75.33µs  min=5.24µs  med=11µs    max=101.81ms p(90)=21.24µs  p(95)=136.39µs p(99.9)=9.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.67ms min=1.47ms  med=97.34ms max=294.12ms p(90)=194.51ms p(95)=210.32ms p(99.9)=257.14ms
     http_reqs......................: 139499  2249.780721/s
     iteration_duration.............: avg=102.96ms min=3.44ms  med=98.78ms max=395.38ms p(90)=195.41ms p(95)=211.11ms p(99.9)=260.24ms
     iterations.....................: 138498  2233.637017/s
     success_rate...................: 100.00% ✓ 138498      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 295578      ✗ 0    
     data_received..................: 8.7 GB  140 MB/s
     data_sent......................: 120 MB  1.9 MB/s
     http_req_blocked...............: avg=16.66µs  min=982ns   med=2.48µs   max=108.44ms p(90)=4.11µs   p(95)=5.06µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=13.18µs  min=0s      med=0s       max=108.36ms p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=143.36ms min=1.94ms  med=79.1ms   max=4.09s    p(90)=351.38ms p(95)=489.74ms p(99.9)=2s      
       { expected_response:true }...: avg=143.36ms min=1.94ms  med=79.1ms   max=4.09s    p(90)=351.38ms p(95)=489.74ms p(99.9)=2s      
     http_req_failed................: 0.00%   ✓ 0           ✗ 99526
     http_req_receiving.............: avg=6.36ms   min=53.58µs med=112.64µs max=1.17s    p(90)=3.29ms   p(95)=10.46ms  p(99.9)=476.68ms
     http_req_sending...............: avg=52.53µs  min=5.43µs  med=10.37µs  max=84.02ms  p(90)=18.35µs  p(95)=25.04µs  p(99.9)=6.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=136.94ms min=1.85ms  med=77.5ms   max=4.09s    p(90)=330.54ms p(95)=450.53ms p(99.9)=2s      
     http_reqs......................: 99526   1592.230848/s
     iteration_duration.............: avg=145.09ms min=3.34ms  med=80.75ms  max=4.09s    p(90)=353.86ms p(95)=492.27ms p(99.9)=2.01s   
     iterations.....................: 98526   1576.232708/s
     success_rate...................: 100.00% ✓ 98526       ✗ 0    
     vus............................: 83      min=0         max=494
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 206457      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.28µs   min=1.09µs  med=2.64µs   max=41.62ms  p(90)=4.49µs   p(95)=5.51µs   p(99.9)=696.81µs
     http_req_connecting............: avg=3.87µs   min=0s      med=0s       max=41.54ms  p(90)=0s       p(95)=0s       p(99.9)=566.64µs
     http_req_duration..............: avg=204.34ms min=2.13ms  med=202.16ms max=532.24ms p(90)=376.48ms p(95)=403.58ms p(99.9)=479ms   
       { expected_response:true }...: avg=204.34ms min=2.13ms  med=202.16ms max=532.24ms p(90)=376.48ms p(95)=403.58ms p(99.9)=479ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 69819
     http_req_receiving.............: avg=125.9µs  min=29.32µs med=68.14µs  max=237.6ms  p(90)=108.31µs p(95)=125.09µs p(99.9)=2.79ms  
     http_req_sending...............: avg=31.38µs  min=5.37µs  med=12.05µs  max=57.98ms  p(90)=19.51µs  p(95)=23.36µs  p(99.9)=4.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.19ms min=2.03ms  med=201.88ms max=532.17ms p(90)=376.38ms p(95)=403.48ms p(99.9)=478.91ms
     http_reqs......................: 69819   1112.519392/s
     iteration_duration.............: avg=207.59ms min=4.76ms  med=205.73ms max=532.44ms p(90)=377.47ms p(95)=404.36ms p(99.9)=479.66ms
     iterations.....................: 68819   1096.585056/s
     success_rate...................: 100.00% ✓ 68819       ✗ 0    
     vus............................: 95      min=0         max=500
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 86862      ✗ 0    
     data_received..................: 2.6 GB  40 MB/s
     data_sent......................: 36 MB   551 kB/s
     http_req_blocked...............: avg=11.26µs  min=1.23µs  med=3.2µs    max=34ms    p(90)=5.01µs   p(95)=6.1µs    p(99.9)=1.49ms  
     http_req_connecting............: avg=6.82µs   min=0s      med=0s       max=33.94ms p(90)=0s       p(95)=0s       p(99.9)=1.3ms   
     http_req_duration..............: avg=479.28ms min=4.3ms   med=444.62ms max=2.26s   p(90)=948.46ms p(95)=1.02s    p(99.9)=1.54s   
       { expected_response:true }...: avg=479.28ms min=4.3ms   med=444.62ms max=2.26s   p(90)=948.46ms p(95)=1.02s    p(99.9)=1.54s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 29954
     http_req_receiving.............: avg=98.03µs  min=33.25µs med=84.28µs  max=65.22ms p(90)=120.61µs p(95)=134.52µs p(99.9)=991.85µs
     http_req_sending...............: avg=26.56µs  min=5.82µs  med=14.94µs  max=22.79ms p(90)=22.07µs  p(95)=25.44µs  p(99.9)=2.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=479.16ms min=4.23ms  med=444.52ms max=2.26s   p(90)=948.35ms p(95)=1.02s    p(99.9)=1.54s   
     http_reqs......................: 29954   458.244151/s
     iteration_duration.............: avg=496.05ms min=25.21ms med=463.35ms max=2.26s   p(90)=953.04ms p(95)=1.02s    p(99.9)=1.54s   
     iterations.....................: 28954   442.945889/s
     success_rate...................: 100.00% ✓ 28954      ✗ 0    
     vus............................: 75      min=0        max=498
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 45921      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   293 kB/s
     http_req_blocked...............: avg=12.94µs  min=1.22µs  med=3.71µs   max=9.27ms p(90)=5.56µs   p(95)=6.88µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=7.63µs   min=0s      med=0s       max=9.2ms  p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=876.18ms min=5.78ms  med=790.9ms  max=4.21s  p(90)=1.74s    p(95)=1.96s    p(99.9)=3.55s   
       { expected_response:true }...: avg=876.18ms min=5.78ms  med=790.9ms  max=4.21s  p(90)=1.74s    p(95)=1.96s    p(99.9)=3.55s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16307
     http_req_receiving.............: avg=104.66µs min=36.2µs  med=99.9µs   max=5.02ms p(90)=139.65µs p(95)=152.93µs p(99.9)=854.43µs
     http_req_sending...............: avg=25.84µs  min=6.68µs  med=18.22µs  max=9.12ms p(90)=24.36µs  p(95)=28.45µs  p(99.9)=1.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=876.05ms min=5.67ms  med=790.76ms max=4.21s  p(90)=1.73s    p(95)=1.96s    p(99.9)=3.55s   
     http_reqs......................: 16307   241.700669/s
     iteration_duration.............: avg=933.42ms min=79.12ms med=863.32ms max=4.22s  p(90)=1.75s    p(95)=1.98s    p(99.9)=3.6s    
     iterations.....................: 15307   226.878773/s
     success_rate...................: 100.00% ✓ 15307      ✗ 0    
     vus............................: 91      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40290      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=15.16µs  min=1.21µs  med=3.66µs   max=9.57ms  p(90)=5.51µs   p(95)=7.34µs   p(99.9)=2.13ms
     http_req_connecting............: avg=9.72µs   min=0s      med=0s       max=9.3ms   p(90)=0s       p(95)=0s       p(99.9)=2.1ms 
     http_req_duration..............: avg=989.48ms min=8.72ms  med=884.78ms max=3.73s   p(90)=2.05s    p(95)=2.15s    p(99.9)=3.31s 
       { expected_response:true }...: avg=989.48ms min=8.72ms  med=884.78ms max=3.73s   p(90)=2.05s    p(95)=2.15s    p(99.9)=3.31s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14430
     http_req_receiving.............: avg=110.26µs min=32.82µs med=99.6µs   max=20.88ms p(90)=140.55µs p(95)=153.95µs p(99.9)=1.34ms
     http_req_sending...............: avg=38.75µs  min=6.21µs  med=18.24µs  max=63.18ms p(90)=24.21µs  p(95)=29.27µs  p(99.9)=2.6ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=989.33ms min=8.59ms  med=884.64ms max=3.73s   p(90)=2.05s    p(95)=2.15s    p(99.9)=3.31s 
     http_reqs......................: 14430   206.490744/s
     iteration_duration.............: avg=1.06s    min=18.1ms  med=995.8ms  max=3.74s   p(90)=2.07s    p(95)=2.16s    p(99.9)=3.34s 
     iterations.....................: 13430   192.180921/s
     success_rate...................: 100.00% ✓ 13430      ✗ 0    
     vus............................: 58      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

