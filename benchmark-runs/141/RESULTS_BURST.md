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
| hive-router | v0.0.43 | 2,686 | 2,817 | 2,647 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.29 | 2,042 | 2,080 | 2,007 | 1.2% |  |
| cosmo | 0.298.0 | 1,187 | 1,187 | 1,174 | 0.8% | non-compatible response (7 across 3/5 runs) |
| hive-gateway-router-runtime | 2.5.14 | 550 | 557 | 546 | 0.8% |  |
| hive-gateway | 2.5.14 | 244 | 248 | 242 | 0.8% |  |
| apollo-gateway | 2.13.3 | 199 | 205 | 195 | 1.5% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (38415 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (457059 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,202 | 2,321 | 2,167 | 2.4% |  |
| hotchocolate | 16.0.0-rc.1.29 | 1,870 | 1,908 | 1,850 | 1.1% |  |
| cosmo | 0.298.0 | 1,119 | 1,119 | 1,111 | 0.5% | non-compatible response (16 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 537 | 542 | 528 | 0.9% |  |
| hive-gateway | 2.5.14 | 238 | 242 | 235 | 0.8% |  |
| apollo-gateway | 2.13.3 | 203 | 206 | 203 | 0.5% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (31108 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (307801 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 495384      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=23.79µs  min=971ns   med=2.2µs   max=75.02ms  p(90)=3.58µs   p(95)=4.63µs   p(99.9)=2.62ms  
     http_req_connecting............: avg=20.78µs  min=0s      med=0s      max=74.95ms  p(90)=0s       p(95)=0s       p(99.9)=2.54ms  
     http_req_duration..............: avg=85.54ms  min=1.59ms  med=80.21ms max=299.65ms p(90)=164.44ms p(95)=180.13ms p(99.9)=239.16ms
       { expected_response:true }...: avg=85.54ms  min=1.59ms  med=80.21ms max=299.65ms p(90)=164.44ms p(95)=180.13ms p(99.9)=239.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166128
     http_req_receiving.............: avg=330.96µs min=29.52µs med=56.06µs max=134.36ms p(90)=216.39µs p(95)=406.49µs p(99.9)=35.65ms 
     http_req_sending...............: avg=81.76µs  min=5.11µs  med=9.65µs  max=200.66ms p(90)=18.05µs  p(95)=129.67µs p(99.9)=11.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.13ms  min=1.52ms  med=79.81ms max=298.94ms p(90)=163.77ms p(95)=179.02ms p(99.9)=235.53ms
     http_reqs......................: 166128  2686.929714/s
     iteration_duration.............: avg=86.35ms  min=2.64ms  med=81.1ms  max=338.54ms p(90)=164.95ms p(95)=180.68ms p(99.9)=240.84ms
     iterations.....................: 165128  2670.755862/s
     success_rate...................: 100.00% ✓ 165128      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 382089      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=26.83µs  min=1.09µs  med=2.65µs   max=95ms     p(90)=4.1µs    p(95)=5.07µs   p(99.9)=3.31ms  
     http_req_connecting............: avg=23.44µs  min=0s      med=0s       max=94.82ms  p(90)=0s       p(95)=0s       p(99.9)=2.99ms  
     http_req_duration..............: avg=110.85ms min=2.43ms  med=105.61ms max=537.09ms p(90)=211.06ms p(95)=236.19ms p(99.9)=365.53ms
       { expected_response:true }...: avg=110.85ms min=2.43ms  med=105.61ms max=537.09ms p(90)=211.06ms p(95)=236.19ms p(99.9)=365.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128363
     http_req_receiving.............: avg=1.3ms    min=52.11µs med=142.15µs max=309.1ms  p(90)=1.37ms   p(95)=3.45ms   p(99.9)=97.38ms 
     http_req_sending...............: avg=76.62µs  min=5.05µs  med=10.23µs  max=156.61ms p(90)=18.4µs   p(95)=124.28µs p(99.9)=9.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.47ms min=2.35ms  med=104.38ms max=536.95ms p(90)=209.25ms p(95)=233.05ms p(99.9)=358.73ms
     http_reqs......................: 128363  2042.351266/s
     iteration_duration.............: avg=112ms    min=3.77ms  med=107.06ms max=537.31ms p(90)=211.7ms  p(95)=236.81ms p(99.9)=365.97ms
     iterations.....................: 127363  2026.440518/s
     success_rate...................: 100.00% ✓ 127363      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 219636      ✗ 0    
     data_received..................: 6.5 GB  104 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=10.84µs  min=1.07µs  med=2.4µs    max=23.2ms   p(90)=3.8µs    p(95)=4.56µs   p(99.9)=463.17µs
     http_req_connecting............: avg=7.83µs   min=0s      med=0s       max=23.15ms  p(90)=0s       p(95)=0s       p(99.9)=406.62µs
     http_req_duration..............: avg=192.26ms min=2.04ms  med=191.05ms max=636.35ms p(90)=356.53ms p(95)=382.86ms p(99.9)=484.72ms
       { expected_response:true }...: avg=192.26ms min=2.04ms  med=191.05ms max=636.35ms p(90)=356.53ms p(95)=382.86ms p(99.9)=484.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74212
     http_req_receiving.............: avg=110.19µs min=29.78µs med=59.68µs  max=259.65ms p(90)=90.85µs  p(95)=103.34µs p(99.9)=2.89ms  
     http_req_sending...............: avg=30.1µs   min=5.57µs  med=10.47µs  max=47.52ms  p(90)=15.49µs  p(95)=18.84µs  p(99.9)=4.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.12ms min=1.98ms  med=190.77ms max=636.28ms p(90)=356.38ms p(95)=382.78ms p(99.9)=484.67ms
     http_reqs......................: 74212   1187.376322/s
     iteration_duration.............: avg=195.16ms min=3.78ms  med=194.33ms max=636.54ms p(90)=357.45ms p(95)=383.64ms p(99.9)=485.27ms
     iterations.....................: 73212   1171.376533/s
     success_rate...................: 100.00% ✓ 73212       ✗ 0    
     vus............................: 80      min=0         max=493
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103428     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 43 MB   660 kB/s
     http_req_blocked...............: avg=10.59µs  min=1.23µs  med=2.91µs   max=21.42ms  p(90)=4.65µs   p(95)=5.71µs   p(99.9)=2.12ms
     http_req_connecting............: avg=6.46µs   min=0s      med=0s       max=21.2ms   p(90)=0s       p(95)=0s       p(99.9)=1.9ms 
     http_req_duration..............: avg=404.54ms min=3.76ms  med=373.45ms max=1.96s    p(90)=795.77ms p(95)=863.74ms p(99.9)=1.33s 
       { expected_response:true }...: avg=404.54ms min=3.76ms  med=373.45ms max=1.96s    p(90)=795.77ms p(95)=863.74ms p(99.9)=1.33s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35476
     http_req_receiving.............: avg=170.76µs min=31.83µs med=74.2µs   max=167.96ms p(90)=110.58µs p(95)=123.7µs  p(99.9)=3.06ms
     http_req_sending...............: avg=29.3µs   min=5.79µs  med=12.86µs  max=176.25ms p(90)=19.85µs  p(95)=23.31µs  p(99.9)=3.18ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=404.34ms min=3.66ms  med=373.36ms max=1.96s    p(90)=795.68ms p(95)=863.61ms p(99.9)=1.33s 
     http_reqs......................: 35476   550.105208/s
     iteration_duration.............: avg=416.5ms  min=12.9ms  med=388.77ms max=1.96s    p(90)=799.72ms p(95)=866.52ms p(99.9)=1.33s 
     iterations.....................: 34476   534.598804/s
     success_rate...................: 100.00% ✓ 34476      ✗ 0    
     vus............................: 77      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46619      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   294 kB/s
     http_req_blocked...............: avg=20.54µs  min=1.28µs  med=3.41µs   max=8.93ms  p(90)=5.12µs  p(95)=6.5µs    p(99.9)=5.11ms
     http_req_connecting............: avg=15.15µs  min=0s      med=0s       max=8.88ms  p(90)=0s      p(95)=0s       p(99.9)=4.57ms
     http_req_duration..............: avg=861.28ms min=5.75ms  med=753.97ms max=19.33s  p(90)=1.49s   p(95)=1.67s    p(99.9)=17.22s
       { expected_response:true }...: avg=861.28ms min=5.75ms  med=753.97ms max=19.33s  p(90)=1.49s   p(95)=1.67s    p(99.9)=17.22s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16540
     http_req_receiving.............: avg=118.31µs min=36.93µs med=91.61µs  max=64.57ms p(90)=131.5µs p(95)=144.34µs p(99.9)=1.96ms
     http_req_sending...............: avg=28.27µs  min=6.3µs   med=16.52µs  max=12.97ms p(90)=22.93µs p(95)=27.29µs  p(99.9)=3.28ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=861.13ms min=5.64ms  med=753.88ms max=19.33s  p(90)=1.49s   p(95)=1.67s    p(99.9)=17.22s
     http_reqs......................: 16540   244.323372/s
     iteration_duration.............: avg=915.59ms min=36.02ms med=824.22ms max=19.33s  p(90)=1.51s   p(95)=1.68s    p(99.9)=17.22s
     iterations.....................: 15539   229.536934/s
     success_rate...................: 100.00% ✓ 15539      ✗ 0    
     vus............................: 82      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 41772      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   245 kB/s
     http_req_blocked...............: avg=13.97µs  min=1.14µs  med=3.4µs    max=8.65ms   p(90)=5.11µs   p(95)=6.7µs    p(99.9)=1.99ms 
     http_req_connecting............: avg=8.71µs   min=0s      med=0s       max=8.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.8ms  
     http_req_duration..............: avg=545.5ms  min=8.49ms  med=567.11ms max=1.65s    p(90)=958.77ms p(95)=1.02s    p(99.9)=1.41s  
       { expected_response:true }...: avg=545.5ms  min=8.49ms  med=567.11ms max=1.65s    p(90)=958.77ms p(95)=1.02s    p(99.9)=1.41s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14924
     http_req_receiving.............: avg=213.91µs min=31.15µs med=92.15µs  max=157.61ms p(90)=130.68µs p(95)=143.57µs p(99.9)=47.91ms
     http_req_sending...............: avg=33.43µs  min=5.62µs  med=16.78µs  max=62.28ms  p(90)=22.84µs  p(95)=27.44µs  p(99.9)=3.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=545.26ms min=8.35ms  med=566.88ms max=1.64s    p(90)=958.67ms p(95)=1.02s    p(99.9)=1.41s  
     http_reqs......................: 14924   199.699449/s
     iteration_duration.............: avg=584.51ms min=16.43ms med=601.68ms max=1.65s    p(90)=964.67ms p(95)=1.03s    p(99.9)=1.42s  
     iterations.....................: 13924   186.318355/s
     success_rate...................: 100.00% ✓ 13924      ✗ 0    
     vus............................: 69      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 406713      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=18.34µs  min=1.02µs  med=2.44µs   max=56.66ms  p(90)=4.13µs   p(95)=5.36µs   p(99.9)=2.05ms  
     http_req_connecting............: avg=15.09µs  min=0s      med=0s       max=56.59ms  p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=104.16ms min=1.65ms  med=98.85ms  max=343.17ms p(90)=200.7ms  p(95)=217.03ms p(99.9)=278.22ms
       { expected_response:true }...: avg=104.16ms min=1.65ms  med=98.85ms  max=343.17ms p(90)=200.7ms  p(95)=217.03ms p(99.9)=278.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136571
     http_req_receiving.............: avg=174.61µs min=29.53µs med=61.25µs  max=95.67ms  p(90)=163.83µs p(95)=404.49µs p(99.9)=18.3ms  
     http_req_sending...............: avg=72.36µs  min=5.31µs  med=10.64µs  max=202.72ms p(90)=20.4µs   p(95)=135.1µs  p(99.9)=9.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.91ms min=1.6ms   med=98.61ms  max=331.48ms p(90)=200.33ms p(95)=216.54ms p(99.9)=276.92ms
     http_reqs......................: 136571  2202.454913/s
     iteration_duration.............: avg=105.19ms min=3.97ms  med=100.08ms max=379.59ms p(90)=201.21ms p(95)=217.49ms p(99.9)=279.1ms 
     iterations.....................: 135571  2186.3281/s
     success_rate...................: 100.00% ✓ 135571      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 346341      ✗ 0     
     data_received..................: 10 GB   164 MB/s
     data_sent......................: 140 MB  2.2 MB/s
     http_req_blocked...............: avg=18.91µs  min=1.06µs  med=2.78µs   max=125.41ms p(90)=4.35µs   p(95)=5.39µs   p(99.9)=2.46ms  
     http_req_connecting............: avg=15.42µs  min=0s      med=0s       max=125.21ms p(90)=0s       p(95)=0s       p(99.9)=2.36ms  
     http_req_duration..............: avg=122.25ms min=1.83ms  med=118.42ms max=673.56ms p(90)=229.02ms p(95)=255.69ms p(99.9)=409.85ms
       { expected_response:true }...: avg=122.25ms min=1.83ms  med=118.42ms max=673.56ms p(90)=229.02ms p(95)=255.69ms p(99.9)=409.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 116447
     http_req_receiving.............: avg=1.38ms   min=53.91µs med=151.08µs max=245.8ms  p(90)=1.59ms   p(95)=3.39ms   p(99.9)=116.78ms
     http_req_sending...............: avg=65.94µs  min=5.39µs  med=10.84µs  max=103.8ms  p(90)=19.63µs  p(95)=122.82µs p(99.9)=8.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.8ms  min=1.73ms  med=117.01ms max=673.1ms  p(90)=227.08ms p(95)=253.03ms p(99.9)=403.03ms
     http_reqs......................: 116447  1870.770552/s
     iteration_duration.............: avg=123.58ms min=3.28ms  med=119.75ms max=673.8ms  p(90)=229.68ms p(95)=256.48ms p(99.9)=410.17ms
     iterations.....................: 115447  1854.705127/s
     success_rate...................: 100.00% ✓ 115447      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 207354      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.56µs   min=1.17µs  med=2.77µs   max=10.91ms  p(90)=4.51µs   p(95)=5.45µs   p(99.9)=663.55µs
     http_req_connecting............: avg=4.08µs   min=0s      med=0s       max=10.85ms  p(90)=0s       p(95)=0s       p(99.9)=587.33µs
     http_req_duration..............: avg=203.57ms min=2.11ms  med=204.13ms max=576.23ms p(90)=373.25ms p(95)=401.15ms p(99.9)=505.48ms
       { expected_response:true }...: avg=203.57ms min=2.11ms  med=204.13ms max=576.23ms p(90)=373.25ms p(95)=401.15ms p(99.9)=505.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70118
     http_req_receiving.............: avg=83.86µs  min=30.79µs med=67.22µs  max=156.38ms p(90)=103.22µs p(95)=117.63µs p(99.9)=1.45ms  
     http_req_sending...............: avg=29.94µs  min=5.53µs  med=11.65µs  max=95.15ms  p(90)=18.43µs  p(95)=21.96µs  p(99.9)=3.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.45ms min=2.04ms  med=204.01ms max=576.13ms p(90)=373.16ms p(95)=401.06ms p(99.9)=505.4ms 
     http_reqs......................: 70118   1119.992251/s
     iteration_duration.............: avg=206.76ms min=5.16ms  med=207.55ms max=576.44ms p(90)=374.13ms p(95)=401.92ms p(99.9)=506.35ms
     iterations.....................: 69118   1104.019288/s
     success_rate...................: 100.00% ✓ 69118       ✗ 0    
     vus............................: 86      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 101295     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   645 kB/s
     http_req_blocked...............: avg=10.14µs  min=1.14µs  med=3.17µs   max=40.97ms  p(90)=4.99µs   p(95)=6µs      p(99.9)=1.05ms  
     http_req_connecting............: avg=6.02µs   min=0s      med=0s       max=40.88ms  p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=412.69ms min=3.79ms  med=382.04ms max=2.14s    p(90)=811.87ms p(95)=888.74ms p(99.9)=1.33s   
       { expected_response:true }...: avg=412.69ms min=3.79ms  med=382.04ms max=2.14s    p(90)=811.87ms p(95)=888.74ms p(99.9)=1.33s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34765
     http_req_receiving.............: avg=88.24µs  min=32.8µs  med=80.06µs  max=17.66ms  p(90)=116.76µs p(95)=129.67µs p(99.9)=846.02µs
     http_req_sending...............: avg=32.15µs  min=5.53µs  med=14.23µs  max=179.11ms p(90)=21.57µs  p(95)=24.68µs  p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=412.57ms min=3.71ms  med=381.96ms max=2.14s    p(90)=811.76ms p(95)=888.63ms p(99.9)=1.33s   
     http_reqs......................: 34765   537.137392/s
     iteration_duration.............: avg=425.15ms min=12.18ms med=398.16ms max=2.16s    p(90)=816.44ms p(95)=891.24ms p(99.9)=1.33s   
     iterations.....................: 33765   521.68687/s
     success_rate...................: 100.00% ✓ 33765      ✗ 0    
     vus............................: 89      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45432      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   287 kB/s
     http_req_blocked...............: avg=15.32µs  min=1.31µs  med=3.74µs   max=4.04ms   p(90)=5.64µs   p(95)=7.15µs   p(99.9)=2.45ms  
     http_req_connecting............: avg=9.75µs   min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=2.42ms  
     http_req_duration..............: avg=901.69ms min=5.89ms  med=811.7ms  max=5.15s    p(90)=1.79s    p(95)=2.01s    p(99.9)=4.36s   
       { expected_response:true }...: avg=901.69ms min=5.89ms  med=811.7ms  max=5.15s    p(90)=1.79s    p(95)=2.01s    p(99.9)=4.36s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16144
     http_req_receiving.............: avg=117.51µs min=34.22µs med=97.92µs  max=142.98ms p(90)=138.43µs p(95)=150.94µs p(99.9)=950.93µs
     http_req_sending...............: avg=46.54µs  min=6.34µs  med=17.73µs  max=171.43ms p(90)=24.18µs  p(95)=29.13µs  p(99.9)=2.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=901.53ms min=5.8ms   med=811.53ms max=5.15s    p(90)=1.79s    p(95)=2.01s    p(99.9)=4.36s   
     http_reqs......................: 16144   238.833419/s
     iteration_duration.............: avg=961.32ms min=16.08ms med=903.37ms max=5.15s    p(90)=1.8s     p(95)=2.04s    p(99.9)=4.38s   
     iterations.....................: 15144   224.039475/s
     success_rate...................: 100.00% ✓ 15144      ✗ 0    
     vus............................: 89      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 39678      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   244 kB/s
     http_req_blocked...............: avg=15.37µs  min=1.24µs  med=3.54µs   max=31.21ms p(90)=5.35µs   p(95)=7.15µs   p(99.9)=1.57ms
     http_req_connecting............: avg=10.11µs  min=0s      med=0s       max=31.15ms p(90)=0s       p(95)=0s       p(99.9)=1.54ms
     http_req_duration..............: avg=1.02s    min=8.63ms  med=933.24ms max=4.49s   p(90)=2.09s    p(95)=2.21s    p(99.9)=3.93s 
       { expected_response:true }...: avg=1.02s    min=8.63ms  med=933.24ms max=4.49s   p(90)=2.09s    p(95)=2.21s    p(99.9)=3.93s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14226
     http_req_receiving.............: avg=103.79µs min=37.01µs med=96.13µs  max=6.81ms  p(90)=137.75µs p(95)=150.09µs p(99.9)=1.2ms 
     http_req_sending...............: avg=49.36µs  min=6.22µs  med=17.43µs  max=88.49ms p(90)=23.76µs  p(95)=29.12µs  p(99.9)=4.01ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.02s    min=8.52ms  med=933.14ms max=4.49s   p(90)=2.09s    p(95)=2.21s    p(99.9)=3.93s 
     http_reqs......................: 14226   203.6114/s
     iteration_duration.............: avg=1.1s     min=47.73ms med=1.02s    max=4.5s    p(90)=2.1s     p(95)=2.22s    p(99.9)=3.95s 
     iterations.....................: 13226   189.298775/s
     success_rate...................: 100.00% ✓ 13226      ✗ 0    
     vus............................: 20      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

