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
| hive-router | v0.0.42 | 2,843 | 2,947 | 2,801 | 1.8% |  |
| hotchocolate | 16.0.0-rc.1.1 | 1,728 | 1,728 | 1,685 | 1.8% | non-compatible response (3554591 across 7/9 runs) |
| cosmo | 0.295.0 | 1,139 | 1,139 | 1,135 | 0.2% | non-compatible response (25 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 559 | 567 | 553 | 0.9% |  |
| hive-gateway | 2.5.11 | 248 | 250 | 246 | 0.6% |  |
| apollo-gateway | 2.13.3 | 217 | 222 | 214 | 1.2% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (39516 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (473461 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.42 | 2,371 | 2,474 | 2,334 | 1.9% |  |
| hotchocolate | 16.0.0-rc.1.1 | 1,676 | 1,692 | 1,629 | 1.2% | non-compatible response (295056 across 1/9 runs) |
| cosmo | 0.295.0 | 1,119 | 1,137 | 1,095 | 1.9% | non-compatible response (15 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 529 | 538 | 526 | 0.8% |  |
| hive-gateway | 2.5.11 | 244 | 248 | 241 | 0.8% |  |
| apollo-gateway | 2.13.3 | 207 | 210 | 206 | 0.5% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (35237 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (197362 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 524832      ✗ 0     
     data_received..................: 15 GB   249 MB/s
     data_sent......................: 211 MB  3.4 MB/s
     http_req_blocked...............: avg=30.12µs  min=981ns   med=2.18µs  max=84.35ms  p(90)=3.61µs   p(95)=4.72µs   p(99.9)=4.47ms  
     http_req_connecting............: avg=27.25µs  min=0s      med=0s      max=84.11ms  p(90)=0s       p(95)=0s       p(99.9)=4.41ms  
     http_req_duration..............: avg=80.65ms  min=1.62ms  med=74.06ms max=297.6ms  p(90)=156.68ms p(95)=174.24ms p(99.9)=235.7ms 
       { expected_response:true }...: avg=80.65ms  min=1.62ms  med=74.06ms max=297.6ms  p(90)=156.68ms p(95)=174.24ms p(99.9)=235.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 175944
     http_req_receiving.............: avg=378.51µs min=27.53µs med=54.44µs max=112.11ms p(90)=242.93µs p(95)=416.14µs p(99.9)=43.13ms 
     http_req_sending...............: avg=90.62µs  min=5.29µs  med=9.6µs   max=218.14ms p(90)=18.26µs  p(95)=130.38µs p(99.9)=13.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.18ms  min=1.57ms  med=73.68ms max=283.92ms p(90)=155.98ms p(95)=172.95ms p(99.9)=232.52ms
     http_reqs......................: 175944  2843.65111/s
     iteration_duration.............: avg=81.47ms  min=2.17ms  med=74.94ms max=337.7ms  p(90)=157.42ms p(95)=175.21ms p(99.9)=239.13ms
     iterations.....................: 174944  2827.488859/s
     success_rate...................: 100.00% ✓ 174944      ✗ 0     
     vus............................: 97      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 323730      ✗ 0     
     data_received..................: 9.5 GB  152 MB/s
     data_sent......................: 131 MB  2.1 MB/s
     http_req_blocked...............: avg=14.71µs  min=1.02µs med=2.13µs   max=104.94ms p(90)=3.43µs   p(95)=4.34µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=11.94µs  min=0s     med=0s       max=104.81ms p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=130.91ms min=2.58ms med=40.95ms  max=27.82s   p(90)=284.06ms p(95)=416.62ms p(99.9)=8.81s   
       { expected_response:true }...: avg=130.91ms min=2.58ms med=40.95ms  max=27.82s   p(90)=284.06ms p(95)=416.62ms p(99.9)=8.81s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 108910
     http_req_receiving.............: avg=5.33ms   min=52µs   med=109.55µs max=1.01s    p(90)=3.15ms   p(95)=11.93ms  p(99.9)=373.86ms
     http_req_sending...............: avg=49.93µs  min=5.07µs med=9.29µs   max=70.82ms  p(90)=15.42µs  p(95)=22.48µs  p(99.9)=7.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.52ms min=2.46ms med=40.01ms  max=27.82s   p(90)=272.19ms p(95)=383.49ms p(99.9)=8.81s   
     http_reqs......................: 108910  1728.842034/s
     iteration_duration.............: avg=132.46ms min=3.53ms med=42.54ms  max=27.83s   p(90)=286.19ms p(95)=419.68ms p(99.9)=8.82s   
     iterations.....................: 107910  1712.967991/s
     success_rate...................: 100.00% ✓ 107910      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 210756      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=7.78µs   min=1.05µs  med=2.13µs   max=45.37ms  p(90)=3.58µs   p(95)=4.49µs   p(99.9)=511.71µs
     http_req_connecting............: avg=4.93µs   min=0s      med=0s       max=45.32ms  p(90)=0s       p(95)=0s       p(99.9)=453.96µs
     http_req_duration..............: avg=200.29ms min=2.09ms  med=200.66ms max=683.82ms p(90)=371.65ms p(95)=399.96ms p(99.9)=532.97ms
       { expected_response:true }...: avg=200.29ms min=2.09ms  med=200.66ms max=683.82ms p(90)=371.65ms p(95)=399.96ms p(99.9)=532.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71252
     http_req_receiving.............: avg=95.27µs  min=29.47µs med=60.18µs  max=266.12ms p(90)=96.07µs  p(95)=111.8µs  p(99.9)=2.4ms   
     http_req_sending...............: avg=34.45µs  min=5.25µs  med=10.15µs  max=174.17ms p(90)=16.22µs  p(95)=19.98µs  p(99.9)=4.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.16ms min=2.02ms  med=200.48ms max=683.69ms p(90)=371.57ms p(95)=399.86ms p(99.9)=532.91ms
     http_reqs......................: 71252   1139.506438/s
     iteration_duration.............: avg=203.38ms min=4.41ms  med=204.05ms max=684.01ms p(90)=372.56ms p(95)=400.86ms p(99.9)=533.6ms 
     iterations.....................: 70252   1123.513814/s
     success_rate...................: 100.00% ✓ 70252       ✗ 0    
     vus............................: 83      min=0         max=496
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 105041     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   673 kB/s
     http_req_blocked...............: avg=8.47µs   min=1.15µs  med=2.49µs   max=20.78ms  p(90)=4.21µs   p(95)=5.18µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=4.93µs   min=0s      med=0s       max=20.72ms  p(90)=0s       p(95)=0s       p(99.9)=1.06ms  
     http_req_duration..............: avg=398.1ms  min=3.61ms  med=367.16ms max=1.56s    p(90)=783.98ms p(95)=855.2ms  p(99.9)=1.26s   
       { expected_response:true }...: avg=398.1ms  min=3.61ms  med=367.16ms max=1.56s    p(90)=783.98ms p(95)=855.2ms  p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36014
     http_req_receiving.............: avg=88.85µs  min=31.77µs med=73.29µs  max=129.15ms p(90)=109.87µs p(95)=123.06µs p(99.9)=946.72µs
     http_req_sending...............: avg=39.17µs  min=5.58µs  med=12.36µs  max=219.57ms p(90)=19.69µs  p(95)=22.82µs  p(99.9)=3.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=397.97ms min=3.55ms  med=367.08ms max=1.56s    p(90)=783.84ms p(95)=855.09ms p(99.9)=1.26s   
     http_reqs......................: 36014   559.907567/s
     iteration_duration.............: avg=409.68ms min=21.3ms  med=380.81ms max=1.56s    p(90)=788.06ms p(95)=858.63ms p(99.9)=1.26s   
     iterations.....................: 35013   544.345078/s
     success_rate...................: 100.00% ✓ 35013      ✗ 0    
     vus............................: 75      min=0        max=495
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 47310      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=13.38µs  min=1.29µs  med=3.14µs   max=4.13ms   p(90)=4.82µs   p(95)=6.13µs   p(99.9)=2.55ms
     http_req_connecting............: avg=8.68µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=2.53ms
     http_req_duration..............: avg=803.31ms min=5.85ms  med=734.7ms  max=17.47s   p(90)=1.43s    p(95)=1.57s    p(99.9)=15.75s
       { expected_response:true }...: avg=803.31ms min=5.85ms  med=734.7ms  max=17.47s   p(90)=1.43s    p(95)=1.57s    p(99.9)=15.75s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16770
     http_req_receiving.............: avg=110.03µs min=34.83µs med=91.31µs  max=153.57ms p(90)=129.97µs p(95)=144.22µs p(99.9)=1ms   
     http_req_sending...............: avg=45.51µs  min=5.92µs  med=15.93µs  max=212.41ms p(90)=22.24µs  p(95)=26.35µs  p(99.9)=2.18ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=803.16ms min=5.74ms  med=734.61ms max=17.47s   p(90)=1.43s    p(95)=1.57s    p(99.9)=15.75s
     http_reqs......................: 16770   248.395548/s
     iteration_duration.............: avg=854.3ms  min=36.05ms med=796.82ms max=17.47s   p(90)=1.45s    p(95)=1.58s    p(99.9)=15.77s
     iterations.....................: 15770   233.583649/s
     success_rate...................: 100.00% ✓ 15770      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 42291      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 19 MB   267 kB/s
     http_req_blocked...............: avg=16.05µs  min=1.19µs  med=3.19µs   max=4.78ms   p(90)=4.88µs   p(95)=6.37µs   p(99.9)=2.92ms 
     http_req_connecting............: avg=11.1µs   min=0s      med=0s       max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=2.87ms 
     http_req_duration..............: avg=500.56ms min=8.32ms  med=570.15ms max=1.51s    p(90)=876.73ms p(95)=953.1ms  p(99.9)=1.32s  
       { expected_response:true }...: avg=500.56ms min=8.32ms  med=570.15ms max=1.51s    p(90)=876.73ms p(95)=953.1ms  p(99.9)=1.32s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15097
     http_req_receiving.............: avg=286µs    min=34.76µs med=91.3µs   max=144.79ms p(90)=130.59µs p(95)=143.3µs  p(99.9)=78.44ms
     http_req_sending...............: avg=26.47µs  min=6.06µs  med=16.49µs  max=16.22ms  p(90)=22.32µs  p(95)=26.9µs   p(99.9)=2.29ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=500.25ms min=8.22ms  med=570.06ms max=1.5s     p(90)=876.62ms p(95)=952.99ms p(99.9)=1.32s  
     http_reqs......................: 15097   217.834394/s
     iteration_duration.............: avg=535.99ms min=14.94ms med=597.69ms max=1.51s    p(90)=889.4ms  p(95)=957.76ms p(99.9)=1.34s  
     iterations.....................: 14097   203.405409/s
     success_rate...................: 100.00% ✓ 14097      ✗ 0    
     vus............................: 107     min=0        max=495
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 438291      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 177 MB  2.8 MB/s
     http_req_blocked...............: avg=25.19µs  min=1.04µs  med=2.44µs  max=90.8ms   p(90)=4.14µs   p(95)=5.4µs    p(99.9)=3.93ms  
     http_req_connecting............: avg=21.99µs  min=0s      med=0s      max=90.71ms  p(90)=0s       p(95)=0s       p(99.9)=3.9ms   
     http_req_duration..............: avg=96.65ms  min=1.63ms  med=90.67ms max=324.61ms p(90)=186.31ms p(95)=202.55ms p(99.9)=255.46ms
       { expected_response:true }...: avg=96.65ms  min=1.63ms  med=90.67ms max=324.61ms p(90)=186.31ms p(95)=202.55ms p(99.9)=255.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147097
     http_req_receiving.............: avg=283.56µs min=28.17µs med=58.63µs max=98.36ms  p(90)=192.36µs p(95)=424.71µs p(99.9)=33.3ms  
     http_req_sending...............: avg=85.19µs  min=5.34µs  med=10.69µs max=212.98ms p(90)=20.86µs  p(95)=137.49µs p(99.9)=13.02ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.28ms  min=1.56ms  med=90.38ms max=307.28ms p(90)=185.78ms p(95)=201.74ms p(99.9)=252.59ms
     http_reqs......................: 147097  2371.479136/s
     iteration_duration.............: avg=97.59ms  min=4.29ms  med=91.77ms max=366.82ms p(90)=186.87ms p(95)=203.06ms p(99.9)=256.29ms
     iterations.....................: 146097  2355.357263/s
     success_rate...................: 100.00% ✓ 146097      ✗ 0     
     vus............................: 60      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 310815      ✗ 0     
     data_received..................: 9.2 GB  147 MB/s
     data_sent......................: 126 MB  2.0 MB/s
     http_req_blocked...............: avg=23.2µs   min=942ns   med=2.24µs   max=112.42ms p(90)=3.97µs   p(95)=5.1µs    p(99.9)=2.83ms  
     http_req_connecting............: avg=20.23µs  min=0s      med=0s       max=112.36ms p(90)=0s       p(95)=0s       p(99.9)=2.79ms  
     http_req_duration..............: avg=136.15ms min=1.93ms  med=83.44ms  max=2.06s    p(90)=322.05ms p(95)=461.21ms p(99.9)=1.15s   
       { expected_response:true }...: avg=136.15ms min=1.93ms  med=83.44ms  max=2.06s    p(90)=322.05ms p(95)=461.21ms p(99.9)=1.15s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 104605
     http_req_receiving.............: avg=7.97ms   min=51.15µs med=113.36µs max=1.33s    p(90)=5.24ms   p(95)=23.4ms   p(99.9)=464.15ms
     http_req_sending...............: avg=62.74µs  min=5.35µs  med=9.74µs   max=120.45ms p(90)=18.6µs   p(95)=29.02µs  p(99.9)=9.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.12ms min=1.83ms  med=81.53ms  max=1.75s    p(90)=297.86ms p(95)=412.36ms p(99.9)=1.03s   
     http_reqs......................: 104605  1676.947479/s
     iteration_duration.............: avg=137.9ms  min=3.06ms  med=85.36ms  max=2.06s    p(90)=324.36ms p(95)=463.24ms p(99.9)=1.15s   
     iterations.....................: 103605  1660.916242/s
     success_rate...................: 100.00% ✓ 103605      ✗ 0     
     vus............................: 76      min=0         max=494 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 207333      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=6.92µs   min=1.07µs  med=2.32µs   max=71.13ms  p(90)=4.04µs   p(95)=5.11µs   p(99.9)=373.61µs
     http_req_connecting............: avg=3.86µs   min=0s      med=0s       max=70.93ms  p(90)=0s       p(95)=0s       p(99.9)=317.9µs 
     http_req_duration..............: avg=203.58ms min=2.09ms  med=206.75ms max=527.96ms p(90)=374.82ms p(95)=402.69ms p(99.9)=481.74ms
       { expected_response:true }...: avg=203.58ms min=2.09ms  med=206.75ms max=527.96ms p(90)=374.82ms p(95)=402.69ms p(99.9)=481.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70111
     http_req_receiving.............: avg=81.81µs  min=29.48µs med=66.39µs  max=44.51ms  p(90)=105.87µs p(95)=121.72µs p(99.9)=1.69ms  
     http_req_sending...............: avg=35.2µs   min=5.37µs  med=11.16µs  max=140.83ms p(90)=18.53µs  p(95)=22.14µs  p(99.9)=4.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.47ms min=2.01ms  med=206.6ms  max=526.23ms p(90)=374.74ms p(95)=402.59ms p(99.9)=481.51ms
     http_reqs......................: 70111   1119.382894/s
     iteration_duration.............: avg=206.78ms min=4.54ms  med=210.19ms max=528.2ms  p(90)=375.69ms p(95)=403.52ms p(99.9)=481.97ms
     iterations.....................: 69111   1103.417027/s
     success_rate...................: 100.00% ✓ 69111       ✗ 0    
     vus............................: 88      min=0         max=498
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 99945      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   637 kB/s
     http_req_blocked...............: avg=8.23µs   min=1.12µs  med=2.96µs   max=3.95ms  p(90)=4.75µs   p(95)=5.75µs   p(99.9)=916.61µs
     http_req_connecting............: avg=4.22µs   min=0s      med=0s       max=3.45ms  p(90)=0s       p(95)=0s       p(99.9)=859.11µs
     http_req_duration..............: avg=417.86ms min=3.79ms  med=388.9ms  max=1.56s   p(90)=825.28ms p(95)=900.7ms  p(99.9)=1.35s   
       { expected_response:true }...: avg=417.86ms min=3.79ms  med=388.9ms  max=1.56s   p(90)=825.28ms p(95)=900.7ms  p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34315
     http_req_receiving.............: avg=91.21µs  min=31.05µs med=80.47µs  max=71.58ms p(90)=117.05µs p(95)=130.64µs p(99.9)=916.98µs
     http_req_sending...............: avg=34.05µs  min=5.79µs  med=13.89µs  max=98.11ms p(90)=21.19µs  p(95)=24.5µs   p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=417.74ms min=3.72ms  med=388.67ms max=1.56s   p(90)=825.17ms p(95)=900.59ms p(99.9)=1.35s   
     http_reqs......................: 34315   529.367799/s
     iteration_duration.............: avg=430.64ms min=29.56ms med=404.05ms max=1.57s   p(90)=829.58ms p(95)=903.15ms p(99.9)=1.35s   
     iterations.....................: 33315   513.941082/s
     success_rate...................: 100.00% ✓ 33315      ✗ 0    
     vus............................: 100     min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 46521      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   296 kB/s
     http_req_blocked...............: avg=15.52µs  min=1.16µs  med=3.61µs   max=40.54ms p(90)=5.51µs   p(95)=6.9µs    p(99.9)=1.81ms  
     http_req_connecting............: avg=10.32µs  min=0s      med=0s       max=40.48ms p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=866.47ms min=5.93ms  med=779.82ms max=4.2s    p(90)=1.74s    p(95)=1.93s    p(99.9)=3.53s   
       { expected_response:true }...: avg=866.47ms min=5.93ms  med=779.82ms max=4.2s    p(90)=1.74s    p(95)=1.93s    p(99.9)=3.53s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16507
     http_req_receiving.............: avg=107.48µs min=34.98µs med=102.2µs  max=7.77ms  p(90)=141.58µs p(95)=153.42µs p(99.9)=846.35µs
     http_req_sending...............: avg=33.75µs  min=6.16µs  med=18.46µs  max=18.72ms p(90)=24.27µs  p(95)=28.99µs  p(99.9)=3.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=866.33ms min=5.82ms  med=779.59ms max=4.2s    p(90)=1.74s    p(95)=1.93s    p(99.9)=3.53s   
     http_reqs......................: 16507   244.288499/s
     iteration_duration.............: avg=922.35ms min=45.71ms med=854.94ms max=4.2s    p(90)=1.75s    p(95)=1.95s    p(99.9)=3.55s   
     iterations.....................: 15507   229.489413/s
     success_rate...................: 100.00% ✓ 15507      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 40425      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   252 kB/s
     http_req_blocked...............: avg=16.7µs   min=1.17µs  med=3.48µs   max=35.38ms p(90)=5.32µs   p(95)=6.99µs  p(99.9)=2.14ms
     http_req_connecting............: avg=11.51µs  min=0s      med=0s       max=35.31ms p(90)=0s       p(95)=0s      p(99.9)=2.12ms
     http_req_duration..............: avg=986.61ms min=8.65ms  med=888.36ms max=3.63s   p(90)=2.02s    p(95)=2.16s   p(99.9)=3.22s 
       { expected_response:true }...: avg=986.61ms min=8.65ms  med=888.36ms max=3.63s   p(90)=2.02s    p(95)=2.16s   p(99.9)=3.22s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14475
     http_req_receiving.............: avg=107.09µs min=34.51µs med=98.73µs  max=13.87ms p(90)=139.51µs p(95)=152.7µs p(99.9)=1.38ms
     http_req_sending...............: avg=31.54µs  min=6.3µs   med=18.11µs  max=57.8ms  p(90)=24.11µs  p(95)=29.03µs p(99.9)=1.76ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=986.47ms min=8.56ms  med=888.23ms max=3.63s   p(90)=2.02s    p(95)=2.16s   p(99.9)=3.22s 
     http_reqs......................: 14475   207.635933/s
     iteration_duration.............: avg=1.05s    min=28.34ms med=994.69ms max=3.63s   p(90)=2.03s    p(95)=2.18s   p(99.9)=3.24s 
     iterations.....................: 13475   193.291481/s
     success_rate...................: 100.00% ✓ 13475      ✗ 0    
     vus............................: 99      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

