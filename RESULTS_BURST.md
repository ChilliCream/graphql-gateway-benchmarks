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
| hive-router | v0.0.49 | 2,712 | 2,830 | 2,654 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,067 | 2,079 | 2,046 | 0.5% |  |
| cosmo | 0.307.0 | 1,171 | 1,178 | 1,161 | 0.6% | non-compatible response (8 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 490 | 497 | 488 | 0.7% |  |
| hive-gateway | 2.5.25 | 221 | 223 | 219 | 0.7% |  |
| apollo-gateway | 2.13.3 | 203 | 208 | 202 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (29867 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (447767 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,241 | 2,349 | 2,192 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,953 | 1,986 | 1,922 | 1.2% |  |
| cosmo | 0.307.0 | 1,109 | 1,119 | 1,104 | 0.7% | non-compatible response (15 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 468 | 476 | 464 | 0.9% |  |
| hive-gateway | 2.5.25 | 212 | 215 | 210 | 0.7% |  |
| apollo-gateway | 2.13.3 | 207 | 210 | 207 | 0.5% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (18259 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (239067 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 500223      ✗ 0     
     data_received..................: 15 GB   238 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=21.35µs  min=982ns   med=2.15µs  max=62.32ms  p(90)=3.38µs   p(95)=4.36µs   p(99.9)=3.64ms  
     http_req_connecting............: avg=18.29µs  min=0s      med=0s      max=62.23ms  p(90)=0s       p(95)=0s       p(99.9)=3.44ms  
     http_req_duration..............: avg=84.72ms  min=1.6ms   med=79.44ms max=325.7ms  p(90)=164.03ms p(95)=177.64ms p(99.9)=234.12ms
       { expected_response:true }...: avg=84.72ms  min=1.6ms   med=79.44ms max=325.7ms  p(90)=164.03ms p(95)=177.64ms p(99.9)=234.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167741
     http_req_receiving.............: avg=294.24µs min=28.77µs med=54.68µs max=59.41ms  p(90)=182.75µs p(95)=389.61µs p(99.9)=35.94ms 
     http_req_sending...............: avg=77.78µs  min=5.24µs  med=9.41µs  max=200.53ms p(90)=16.52µs  p(95)=125µs    p(99.9)=11.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.35ms  min=1.55ms  med=79.16ms max=325.02ms p(90)=163.52ms p(95)=177.01ms p(99.9)=227.83ms
     http_reqs......................: 167741  2712.414298/s
     iteration_duration.............: avg=85.5ms   min=2.54ms  med=80.28ms max=353.63ms p(90)=164.5ms  p(95)=178.11ms p(99.9)=234.94ms
     iterations.....................: 166741  2696.244046/s
     success_rate...................: 100.00% ✓ 166741      ✗ 0     
     vus............................: 17      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 386574      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 156 MB  2.5 MB/s
     http_req_blocked...............: avg=14.65µs  min=1µs    med=2.24µs   max=61.69ms  p(90)=3.58µs   p(95)=4.56µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=11.83µs  min=0s     med=0s       max=61.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.21ms  
     http_req_duration..............: avg=109.59ms min=2.4ms  med=100.6ms  max=946.52ms p(90)=215.25ms p(95)=252.61ms p(99.9)=508.43ms
       { expected_response:true }...: avg=109.59ms min=2.4ms  med=100.6ms  max=946.52ms p(90)=215.25ms p(95)=252.61ms p(99.9)=508.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129858
     http_req_receiving.............: avg=2.48ms   min=51.9µs med=113.28µs max=526.58ms p(90)=1.44ms   p(95)=5.5ms    p(99.9)=180.07ms
     http_req_sending...............: avg=63.79µs  min=5.27µs med=9.59µs   max=195.3ms  p(90)=17.25µs  p(95)=115.94µs p(99.9)=8.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.05ms min=2.28ms med=99.32ms  max=946.45ms p(90)=210.73ms p(95)=243.68ms p(99.9)=445.57ms
     http_reqs......................: 129858  2067.467024/s
     iteration_duration.............: avg=110.73ms min=3.53ms med=101.9ms  max=946.68ms p(90)=216.05ms p(95)=253.61ms p(99.9)=508.73ms
     iterations.....................: 128858  2051.546041/s
     success_rate...................: 100.00% ✓ 128858      ✗ 0     
     vus............................: 95      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 216657      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.49µs   min=1.09µs  med=2.44µs   max=32.69ms  p(90)=3.83µs   p(95)=4.63µs   p(99.9)=589.05µs
     http_req_connecting............: avg=3.36µs   min=0s      med=0s       max=32.63ms  p(90)=0s       p(95)=0s       p(99.9)=506.61µs
     http_req_duration..............: avg=194.9ms  min=2.02ms  med=194.76ms max=525.9ms  p(90)=362.76ms p(95)=389.15ms p(99.9)=465.18ms
       { expected_response:true }...: avg=194.9ms  min=2.02ms  med=194.76ms max=525.9ms  p(90)=362.76ms p(95)=389.15ms p(99.9)=465.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73219
     http_req_receiving.............: avg=112.43µs min=29.85µs med=59.55µs  max=147.88ms p(90)=91.38µs  p(95)=104.32µs p(99.9)=2.85ms  
     http_req_sending...............: avg=27.28µs  min=5.47µs  med=10.59µs  max=40.08ms  p(90)=15.77µs  p(95)=19.2µs   p(99.9)=3.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.76ms min=1.97ms  med=194.54ms max=525.83ms p(90)=362.68ms p(95)=389.07ms p(99.9)=465.1ms 
     http_reqs......................: 73219   1171.916717/s
     iteration_duration.............: avg=197.85ms min=5.77ms  med=197.78ms max=526.06ms p(90)=363.65ms p(95)=389.88ms p(99.9)=466.33ms
     iterations.....................: 72219   1155.91108/s
     success_rate...................: 100.00% ✓ 72219       ✗ 0    
     vus............................: 80      min=0         max=493
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 92514      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   589 kB/s
     http_req_blocked...............: avg=8.64µs   min=1.15µs  med=2.98µs   max=21.66ms  p(90)=4.72µs   p(95)=5.77µs   p(99.9)=926.59µs
     http_req_connecting............: avg=4.66µs   min=0s      med=0s       max=21.6ms   p(90)=0s       p(95)=0s       p(99.9)=878.12µs
     http_req_duration..............: avg=451.15ms min=4.05ms  med=420.09ms max=1.89s    p(90)=893.32ms p(95)=970.55ms p(99.9)=1.46s   
       { expected_response:true }...: avg=451.15ms min=4.05ms  med=420.09ms max=1.89s    p(90)=893.32ms p(95)=970.55ms p(99.9)=1.46s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31838
     http_req_receiving.............: avg=83.73µs  min=33.4µs  med=75.29µs  max=14.52ms  p(90)=111.38µs p(95)=124.75µs p(99.9)=764.18µs
     http_req_sending...............: avg=31.16µs  min=5.86µs  med=13.21µs  max=175.06ms p(90)=20.39µs  p(95)=23.78µs  p(99.9)=2.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=451.04ms min=4ms     med=420.01ms max=1.89s    p(90)=893.24ms p(95)=970.46ms p(99.9)=1.46s   
     http_reqs......................: 31838   490.493609/s
     iteration_duration.............: avg=466.02ms min=22.62ms med=438.48ms max=1.9s     p(90)=897.6ms  p(95)=972.92ms p(99.9)=1.47s   
     iterations.....................: 30838   475.087692/s
     success_rate...................: 100.00% ✓ 30838      ✗ 0    
     vus............................: 51      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 42210      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   267 kB/s
     http_req_blocked...............: avg=16.1µs   min=1.3µs   med=3.62µs   max=52.26ms p(90)=5.43µs   p(95)=7.16µs   p(99.9)=1.58ms
     http_req_connecting............: avg=10.85µs  min=0s      med=0s       max=52.2ms  p(90)=0s       p(95)=0s       p(99.9)=1.55ms
     http_req_duration..............: avg=940.23ms min=6.2ms   med=812.08ms max=19s     p(90)=1.6s     p(95)=1.77s    p(99.9)=17.85s
       { expected_response:true }...: avg=940.23ms min=6.2ms   med=812.08ms max=19s     p(90)=1.6s     p(95)=1.77s    p(99.9)=17.85s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15070
     http_req_receiving.............: avg=146.14µs min=39.48µs med=95.12µs  max=73.78ms p(90)=134.61µs p(95)=149.35µs p(99.9)=6.11ms
     http_req_sending...............: avg=28.99µs  min=6.31µs  med=17.39µs  max=18.4ms  p(90)=23.44µs  p(95)=28.03µs  p(99.9)=3.12ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=940.06ms min=6.1ms   med=811.98ms max=19s     p(90)=1.6s     p(95)=1.77s    p(99.9)=17.85s
     http_reqs......................: 15070   221.24682/s
     iteration_duration.............: avg=1s       min=37.06ms med=905.72ms max=19.01s  p(90)=1.63s    p(95)=1.81s    p(99.9)=17.86s
     iterations.....................: 14070   206.565544/s
     success_rate...................: 100.00% ✓ 14070      ✗ 0    
     vus............................: 59      min=0        max=498
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

     checks.........................: 100.00% ✓ 42333      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=14.08µs  min=1.21µs  med=3.39µs   max=3.5ms    p(90)=5.1µs    p(95)=6.86µs   p(99.9)=2.11ms
     http_req_connecting............: avg=9.04µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=2.07ms
     http_req_duration..............: avg=470.45ms min=8.46ms  med=542.74ms max=1.34s    p(90)=811.12ms p(95)=869.17ms p(99.9)=1.2s  
       { expected_response:true }...: avg=470.45ms min=8.46ms  med=542.74ms max=1.34s    p(90)=811.12ms p(95)=869.17ms p(99.9)=1.2s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15111
     http_req_receiving.............: avg=98µs     min=33.47µs med=89.54µs  max=8.13ms   p(90)=130.25µs p(95)=143.5µs  p(99.9)=1.19ms
     http_req_sending...............: avg=44.41µs  min=5.96µs  med=16.47µs  max=159.91ms p(90)=22.85µs  p(95)=27.82µs  p(99.9)=4.33ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=470.3ms  min=8.33ms  med=541.75ms max=1.34s    p(90)=810.98ms p(95)=869.03ms p(99.9)=1.2s  
     http_reqs......................: 15111   203.473153/s
     iteration_duration.............: avg=503.69ms min=13.26ms med=577.97ms max=1.34s    p(90)=817.89ms p(95)=876.55ms p(99.9)=1.21s 
     iterations.....................: 14111   190.007919/s
     success_rate...................: 100.00% ✓ 14111      ✗ 0    
     vus............................: 59      min=0        max=495
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 413484      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=19.89µs  min=1.01µs  med=2.42µs  max=55.74ms  p(90)=4.02µs   p(95)=5.24µs   p(99.9)=2.35ms  
     http_req_connecting............: avg=16.7µs   min=0s      med=0s      max=55.67ms  p(90)=0s       p(95)=0s       p(99.9)=2.3ms   
     http_req_duration..............: avg=102.44ms min=1.57ms  med=97.17ms max=407.68ms p(90)=195.82ms p(95)=211.57ms p(99.9)=256.45ms
       { expected_response:true }...: avg=102.44ms min=1.57ms  med=97.17ms max=407.68ms p(90)=195.82ms p(95)=211.57ms p(99.9)=256.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138828
     http_req_receiving.............: avg=197.01µs min=29.56µs med=60.25µs max=250.43ms p(90)=151.93µs p(95)=396.42µs p(99.9)=20.24ms 
     http_req_sending...............: avg=72.2µs   min=5.39µs  med=10.57µs max=211.24ms p(90)=19.74µs  p(95)=133.6µs  p(99.9)=9.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.17ms min=1.52ms  med=96.94ms max=292.02ms p(90)=195.43ms p(95)=211.15ms p(99.9)=253.9ms 
     http_reqs......................: 138828  2241.361368/s
     iteration_duration.............: avg=103.46ms min=3.01ms  med=98.34ms max=428.4ms  p(90)=196.36ms p(95)=212.1ms  p(99.9)=258.26ms
     iterations.....................: 137828  2225.216488/s
     success_rate...................: 100.00% ✓ 137828      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 361581      ✗ 0     
     data_received..................: 11 GB   171 MB/s
     data_sent......................: 146 MB  2.3 MB/s
     http_req_blocked...............: avg=13.06µs  min=972ns   med=2.31µs   max=51.16ms  p(90)=3.86µs   p(95)=4.93µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=10.08µs  min=0s      med=0s       max=51.11ms  p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=117.15ms min=1.75ms  med=109.35ms max=758.24ms p(90)=226.55ms p(95)=256.43ms p(99.9)=531.5ms 
       { expected_response:true }...: avg=117.15ms min=1.75ms  med=109.35ms max=758.24ms p(90)=226.55ms p(95)=256.43ms p(99.9)=531.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 121527
     http_req_receiving.............: avg=1.89ms   min=52.56µs med=114.61µs max=334.33ms p(90)=1.75ms   p(95)=5.19ms   p(99.9)=154.15ms
     http_req_sending...............: avg=63.44µs  min=5.41µs  med=9.86µs   max=146.39ms p(90)=18.66µs  p(95)=116.35µs p(99.9)=8.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.18ms min=1.67ms  med=108.14ms max=755.65ms p(90)=223.13ms p(95)=251.3ms  p(99.9)=520.9ms 
     http_reqs......................: 121527  1953.251094/s
     iteration_duration.............: avg=118.38ms min=2.59ms  med=110.73ms max=758.43ms p(90)=227.19ms p(95)=257.19ms p(99.9)=532.22ms
     iterations.....................: 120527  1937.178525/s
     success_rate...................: 100.00% ✓ 120527      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 205389      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=15.67µs  min=1.11µs  med=2.67µs   max=144.18ms p(90)=4.31µs   p(95)=5.23µs   p(99.9)=711µs   
     http_req_connecting............: avg=12.12µs  min=0s      med=0s       max=144.13ms p(90)=0s       p(95)=0s       p(99.9)=597.64µs
     http_req_duration..............: avg=205.47ms min=2.06ms  med=206.31ms max=587.63ms p(90)=379.98ms p(95)=407.55ms p(99.9)=493.7ms 
       { expected_response:true }...: avg=205.47ms min=2.06ms  med=206.31ms max=587.63ms p(90)=379.98ms p(95)=407.55ms p(99.9)=493.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 69463
     http_req_receiving.............: avg=82.31µs  min=29.25µs med=65.92µs  max=43.58ms  p(90)=102.25µs p(95)=117.57µs p(99.9)=1.7ms   
     http_req_sending...............: avg=65.08µs  min=5.43µs  med=11.6µs   max=218.04ms p(90)=17.9µs   p(95)=21.65µs  p(99.9)=4.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.32ms min=2ms     med=206.15ms max=587.55ms p(90)=379.86ms p(95)=407.46ms p(99.9)=493.63ms
     http_reqs......................: 69463   1109.46018/s
     iteration_duration.............: avg=208.73ms min=4.69ms  med=210.21ms max=587.84ms p(90)=380.91ms p(95)=408.19ms p(99.9)=494.18ms
     iterations.....................: 68463   1093.488222/s
     success_rate...................: 100.00% ✓ 68463       ✗ 0    
     vus............................: 87      min=0         max=497
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 88569      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   562 kB/s
     http_req_blocked...............: avg=9.01µs   min=1.16µs  med=3.07µs   max=12.3ms  p(90)=4.8µs    p(95)=5.82µs   p(99.9)=1.07ms  
     http_req_connecting............: avg=4.87µs   min=0s      med=0s       max=12.24ms p(90)=0s       p(95)=0s       p(99.9)=974.87µs
     http_req_duration..............: avg=471.08ms min=4.07ms  med=440.73ms max=2.39s   p(90)=927.41ms p(95)=1.01s    p(99.9)=1.53s   
       { expected_response:true }...: avg=471.08ms min=4.07ms  med=440.73ms max=2.39s   p(90)=927.41ms p(95)=1.01s    p(99.9)=1.53s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30523
     http_req_receiving.............: avg=93.13µs  min=32.65µs med=79.18µs  max=93.56ms p(90)=114.96µs p(95)=127.84µs p(99.9)=1.16ms  
     http_req_sending...............: avg=28.58µs  min=5.75µs  med=14.04µs  max=69.88ms p(90)=21.2µs   p(95)=24.49µs  p(99.9)=2.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=470.96ms min=4.01ms  med=440.59ms max=2.39s   p(90)=927.32ms p(95)=1.01s    p(99.9)=1.53s   
     http_reqs......................: 30523   468.255139/s
     iteration_duration.............: avg=487.24ms min=16.71ms med=460.55ms max=2.4s    p(90)=932.15ms p(95)=1.01s    p(99.9)=1.53s   
     iterations.....................: 29523   452.91408/s
     success_rate...................: 100.00% ✓ 29523      ✗ 0    
     vus............................: 66      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40815      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   256 kB/s
     http_req_blocked...............: avg=16.77µs  min=1.3µs   med=3.69µs   max=28.35ms p(90)=5.59µs   p(95)=7.8µs    p(99.9)=1.96ms
     http_req_connecting............: avg=11.26µs  min=0s      med=0s       max=28.28ms p(90)=0s       p(95)=0s       p(99.9)=1.92ms
     http_req_duration..............: avg=1s       min=6.46ms  med=909.07ms max=6.13s   p(90)=1.96s    p(95)=2.2s     p(99.9)=5.56s 
       { expected_response:true }...: avg=1s       min=6.46ms  med=909.07ms max=6.13s   p(90)=1.96s    p(95)=2.2s     p(99.9)=5.56s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14605
     http_req_receiving.............: avg=143.88µs min=35.83µs med=97.44µs  max=92.61ms p(90)=138.98µs p(95)=152.48µs p(99.9)=3.19ms
     http_req_sending...............: avg=30.7µs   min=6.4µs   med=17.52µs  max=22.88ms p(90)=23.95µs  p(95)=29.42µs  p(99.9)=3.49ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=6.37ms  med=908.94ms max=6.13s   p(90)=1.96s    p(95)=2.2s     p(99.9)=5.56s 
     http_reqs......................: 14605   212.872955/s
     iteration_duration.............: avg=1.07s    min=42.39ms med=1s       max=6.14s   p(90)=2s       p(95)=2.21s    p(99.9)=5.59s 
     iterations.....................: 13605   198.297608/s
     success_rate...................: 100.00% ✓ 13605      ✗ 0    
     vus............................: 86      min=0        max=500
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

     checks.........................: 100.00% ✓ 40506      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=16.29µs  min=1.24µs  med=3.47µs   max=16.54ms p(90)=5.24µs   p(95)=6.86µs  p(99.9)=2.56ms
     http_req_connecting............: avg=10.93µs  min=0s      med=0s       max=16.48ms p(90)=0s       p(95)=0s      p(99.9)=2.53ms
     http_req_duration..............: avg=1s       min=8.64ms  med=918.43ms max=4.13s   p(90)=2.04s    p(95)=2.15s   p(99.9)=3.79s 
       { expected_response:true }...: avg=1s       min=8.64ms  med=918.43ms max=4.13s   p(90)=2.04s    p(95)=2.15s   p(99.9)=3.79s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14502
     http_req_receiving.............: avg=101.52µs min=32.36µs med=92.81µs  max=14.96ms p(90)=133.66µs p(95)=146.7µs p(99.9)=1.03ms
     http_req_sending...............: avg=29.05µs  min=6µs     med=17.13µs  max=12.18ms p(90)=23.35µs  p(95)=28.39µs p(99.9)=3.3ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=8.54ms  med=918.3ms  max=4.12s   p(90)=2.04s    p(95)=2.15s   p(99.9)=3.79s 
     http_reqs......................: 14502   207.639595/s
     iteration_duration.............: avg=1.07s    min=34.44ms med=1s       max=4.13s   p(90)=2.06s    p(95)=2.16s   p(99.9)=3.81s 
     iterations.....................: 13502   193.321597/s
     success_rate...................: 100.00% ✓ 13502      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

