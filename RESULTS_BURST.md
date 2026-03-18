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
| hotchocolate | 16.0.0-p.11.47 | 9,314 | 9,463 | 1,465 | 41.6% | non-compatible response (3000288 across 6/9 runs) |
| hive-router | v0.0.41 | 2,689 | 2,795 | 2,646 | 1.8% |  |
| grafbase | 0.53.2 | 2,093 | 2,191 | 2,030 | 2.4% | non-compatible response (450300 across 9/9 runs) |
| cosmo | 0.291.0 | 1,174 | 1,186 | 1,153 | 1.1% | non-compatible response (25 across 9/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 485 | 493 | 482 | 0.8% |  |
| apollo-router | v2.12.0 | 370 | 388 | 355 | 3.0% | non-compatible response (40084 across 9/9 runs) |
| hive-gateway | 2.5.6 | 248 | 252 | 246 | 0.8% |  |
| apollo-gateway | 2.13.2 | 215 | 220 | 213 | 1.1% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,110 | 2,219 | 2,082 | 2.2% |  |
| grafbase | 0.53.2 | 1,602 | 1,714 | 1,520 | 4.3% | non-compatible response (200077 across 9/9 runs) |
| hotchocolate | 16.0.0-p.11.47 | 1,506 | 5,656 | 1,490 | 91.8% | non-compatible response (312839 across 2/9 runs) |
| cosmo | 0.291.0 | 1,104 | 1,116 | 1,083 | 1.0% | non-compatible response (20 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 450 | 459 | 445 | 1.0% |  |
| apollo-router | v2.12.0 | 361 | 385 | 345 | 3.0% | non-compatible response (27985 across 9/9 runs) |
| hive-gateway | 2.5.6 | 236 | 240 | 234 | 0.8% |  |
| apollo-gateway | 2.13.2 | 199 | 203 | 197 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✗ response code was 200
      ↳  0% — ✓ 0 / ✗ 559163
     ✓ no graphql errors
     ✗ valid response structure
      ↳  99% — ✓ 558663 / ✗ 500

     checks.....................: 66.63%  ✓ 1117826     ✗ 559663
     data_received..............: 0 B     0 B/s
     data_sent..................: 0 B     0 B/s
     http_req_blocked...........: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_connecting........: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..........: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_failed............: 100.00% ✓ 560184      ✗ 0     
     http_req_receiving.........: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_sending...........: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_tls_handshaking...: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...........: avg=0s      min=0s       med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_reqs..................: 560184  9314.989368/s
     iteration_duration.........: avg=25.47ms min=115.91µs med=19.87ms max=726.89ms p(90)=51.13ms p(95)=68.11ms p(99.9)=543.55ms
     iterations.................: 559163  9298.011725/s
     success_rate...............: 0.00%   ✓ 0           ✗ 558663
     vus........................: 64      min=50        max=496 
     vus_max....................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 495342      ✗ 0     
     data_received..................: 15 GB   236 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=27.94µs  min=1.02µs  med=2.22µs  max=62.94ms  p(90)=3.68µs   p(95)=4.78µs   p(99.9)=9.42ms  
     http_req_connecting............: avg=24.65µs  min=0s      med=0s      max=62.89ms  p(90)=0s       p(95)=0s       p(99.9)=8.87ms  
     http_req_duration..............: avg=85.52ms  min=1.52ms  med=80.45ms max=310.42ms p(90)=165.45ms p(95)=181.91ms p(99.9)=240.7ms 
       { expected_response:true }...: avg=85.52ms  min=1.52ms  med=80.45ms max=310.42ms p(90)=165.45ms p(95)=181.91ms p(99.9)=240.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 166114
     http_req_receiving.............: avg=305.55µs min=27.23µs med=55.24µs max=258.52ms p(90)=234.29µs p(95)=413.2µs  p(99.9)=33.98ms 
     http_req_sending...............: avg=88.45µs  min=5.1µs   med=9.86µs  max=117.54ms p(90)=18.57µs  p(95)=132µs    p(99.9)=14.92ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.12ms  min=1.44ms  med=80.14ms max=279.13ms p(90)=164.69ms p(95)=181.13ms p(99.9)=234.37ms
     http_reqs......................: 166114  2689.148172/s
     iteration_duration.............: avg=86.33ms  min=2.03ms  med=81.31ms max=352.09ms p(90)=166.01ms p(95)=182.47ms p(99.9)=242.5ms 
     iterations.....................: 165114  2672.959601/s
     success_rate...................: 100.00% ✓ 165114      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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
     ✗ no graphql errors
      ↳  59% — ✓ 77485 / ✗ 52081
     ✗ valid response structure
      ↳  99% — ✓ 129461 / ✗ 105

     checks.........................: 86.57% ✓ 336512      ✗ 52186 
     data_received..................: 10 GB  161 MB/s
     data_sent......................: 157 MB 2.5 MB/s
     http_req_blocked...............: avg=10.28µs  min=1.03µs   med=2.37µs   max=111.78ms p(90)=3.92µs   p(95)=4.96µs   p(99.9)=402.81µs
     http_req_connecting............: avg=7.13µs   min=0s       med=0s       max=111.67ms p(90)=0s       p(95)=0s       p(99.9)=338.81µs
     http_req_duration..............: avg=105.37ms min=300.65µs med=106.68ms max=10.65s   p(90)=175.56ms p(95)=190.66ms p(99.9)=2.23s   
       { expected_response:true }...: avg=105.37ms min=300.65µs med=106.68ms max=10.65s   p(90)=175.56ms p(95)=190.66ms p(99.9)=2.23s   
     http_req_failed................: 0.00%  ✓ 0           ✗ 130566
     http_req_receiving.............: avg=144.55µs min=10.92µs  med=60.23µs  max=126.73ms p(90)=115.2µs  p(95)=338.48µs p(99.9)=14.86ms 
     http_req_sending...............: avg=58.98µs  min=5.12µs   med=10.84µs  max=201.53ms p(90)=18.85µs  p(95)=128.32µs p(99.9)=7.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.17ms min=261.69µs med=106.49ms max=10.65s   p(90)=175.23ms p(95)=190.3ms  p(99.9)=2.23s   
     http_reqs......................: 130566 2093.477685/s
     iteration_duration.............: avg=106.47ms min=368.56µs med=107.79ms max=10.65s   p(90)=175.96ms p(95)=191.16ms p(99.9)=2.32s   
     iterations.....................: 129566 2077.443819/s
     success_rate...................: 59.80% ✓ 77485       ✗ 52081 
     vus............................: 75     min=0         max=500 
     vus_max........................: 500    min=500       max=500
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
     ✗ no graphql errors
      ↳  99% — ✓ 72465 / ✗ 3
     ✓ valid response structure

     checks.........................: 99.99% ✓ 217401      ✗ 3    
     data_received..................: 6.4 GB 103 MB/s
     data_sent......................: 88 MB  1.4 MB/s
     http_req_blocked...............: avg=7.6µs    min=1.04µs  med=2.26µs   max=53.14ms  p(90)=3.85µs   p(95)=4.84µs   p(99.9)=645.35µs
     http_req_connecting............: avg=4.62µs   min=0s      med=0s       max=53.07ms  p(90)=0s       p(95)=0s       p(99.9)=540.33µs
     http_req_duration..............: avg=194.16ms min=2.06ms  med=195.26ms max=482.5ms  p(90)=356.5ms  p(95)=380.19ms p(99.9)=447.09ms
       { expected_response:true }...: avg=194.16ms min=2.06ms  med=195.26ms max=482.5ms  p(90)=356.5ms  p(95)=380.19ms p(99.9)=447.09ms
     http_req_failed................: 0.00%  ✓ 0           ✗ 73468
     http_req_receiving.............: avg=81.58µs  min=29.72µs med=61.01µs  max=113.66ms p(90)=97.78µs  p(95)=113.9µs  p(99.9)=1.79ms  
     http_req_sending...............: avg=30.26µs  min=5.3µs   med=10.63µs  max=73.96ms  p(90)=17.25µs  p(95)=21.05µs  p(99.9)=3.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.05ms min=2ms     med=195.11ms max=482.39ms p(90)=356.42ms p(95)=380.07ms p(99.9)=447.03ms
     http_reqs......................: 73468  1174.500372/s
     iteration_duration.............: avg=197.08ms min=4.97ms  med=198.51ms max=482.65ms p(90)=357.31ms p(95)=380.95ms p(99.9)=447.45ms
     iterations.....................: 72468  1158.513815/s
     success_rate...................: 99.99% ✓ 72465       ✗ 3    
     vus............................: 83     min=0         max=496
     vus_max........................: 500    min=500       max=500
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

     checks.........................: 100.00% ✓ 91776      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   584 kB/s
     http_req_blocked...............: avg=9.79µs   min=1.17µs  med=2.87µs   max=45.69ms  p(90)=4.6µs    p(95)=5.68µs   p(99.9)=1.11ms 
     http_req_connecting............: avg=5.87µs   min=0s      med=0s       max=45.58ms  p(90)=0s       p(95)=0s       p(99.9)=1.03ms 
     http_req_duration..............: avg=454.36ms min=4.31ms  med=422.32ms max=1.68s    p(90)=892.63ms p(95)=976.62ms p(99.9)=1.43s  
       { expected_response:true }...: avg=454.36ms min=4.31ms  med=422.32ms max=1.68s    p(90)=892.63ms p(95)=976.62ms p(99.9)=1.43s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31592
     http_req_receiving.............: avg=101.57µs min=31.79µs med=76.82µs  max=188.31ms p(90)=112.47µs p(95)=125.66µs p(99.9)=864.1µs
     http_req_sending...............: avg=31.1µs   min=5.64µs  med=13.27µs  max=182.36ms p(90)=20.62µs  p(95)=24.05µs  p(99.9)=2.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=454.22ms min=4.25ms  med=422.22ms max=1.68s    p(90)=892.49ms p(95)=976.51ms p(99.9)=1.43s  
     http_reqs......................: 31592   485.593944/s
     iteration_duration.............: avg=469.46ms min=23.59ms med=442.85ms max=1.69s    p(90)=897.37ms p(95)=981.19ms p(99.9)=1.44s  
     iterations.....................: 30592   470.223156/s
     success_rate...................: 100.00% ✓ 30592      ✗ 0    
     vus............................: 61      min=0        max=497
     vus_max........................: 500     min=500      max=500
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
     ✗ no graphql errors
      ↳  82% — ✓ 19369 / ✗ 4235
     ✗ valid response structure
      ↳  99% — ✓ 23559 / ✗ 45

     checks.........................: 93.95% ✓ 66532      ✗ 4280 
     data_received..................: 2.0 GB 31 MB/s
     data_sent......................: 30 MB  449 kB/s
     http_req_blocked...............: avg=23.07µs  min=1.3µs   med=3.35µs   max=97.47ms  p(90)=4.98µs   p(95)=5.9µs    p(99.9)=1.88ms
     http_req_connecting............: avg=18.73µs  min=0s      med=0s       max=97.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.83ms
     http_req_duration..............: avg=543.05ms min=5.35ms  med=518.81ms max=14.3s    p(90)=792.08ms p(95)=887.82ms p(99.9)=13.01s
       { expected_response:true }...: avg=543.05ms min=5.35ms  med=518.81ms max=14.3s    p(90)=792.08ms p(95)=887.82ms p(99.9)=13.01s
     http_req_failed................: 0.00%  ✓ 0          ✗ 24604
     http_req_receiving.............: avg=99.92µs  min=21.8µs  med=82.46µs  max=152.73ms p(90)=120µs    p(95)=132.87µs p(99.9)=1.04ms
     http_req_sending...............: avg=58.61µs  min=6.2µs   med=15.72µs  max=123.44ms p(90)=22.15µs  p(95)=24.89µs  p(99.9)=7.03ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=542.89ms min=5.27ms  med=518.73ms max=14.3s    p(90)=791.94ms p(95)=887.46ms p(99.9)=13.01s
     http_reqs......................: 24604  370.87262/s
     iteration_duration.............: avg=566.25ms min=19.37ms med=533.37ms max=14.31s   p(90)=797.14ms p(95)=895.53ms p(99.9)=13.05s
     iterations.....................: 23604  355.798949/s
     success_rate...................: 82.05% ✓ 19369      ✗ 4235 
     vus............................: 78     min=0        max=500
     vus_max........................: 500    min=500      max=500
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

     checks.........................: 100.00% ✓ 47295      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=11.73µs  min=1.18µs  med=3.72µs   max=2.59ms  p(90)=5.72µs   p(95)=7.4µs    p(99.9)=1.33ms
     http_req_connecting............: avg=6.46µs   min=0s      med=0s       max=2.56ms  p(90)=0s       p(95)=0s       p(99.9)=1.3ms 
     http_req_duration..............: avg=822.54ms min=5.75ms  med=739.8ms  max=17.6s   p(90)=1.49s    p(95)=1.64s    p(99.9)=12.63s
       { expected_response:true }...: avg=822.54ms min=5.75ms  med=739.8ms  max=17.6s   p(90)=1.49s    p(95)=1.64s    p(99.9)=12.63s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16765
     http_req_receiving.............: avg=109.1µs  min=35.18µs med=99.92µs  max=41.86ms p(90)=139.93µs p(95)=153.05µs p(99.9)=1.13ms
     http_req_sending...............: avg=36.92µs  min=5.96µs  med=18.37µs  max=47.83ms p(90)=24.83µs  p(95)=30.03µs  p(99.9)=3.74ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=822.4ms  min=5.62ms  med=739.7ms  max=17.6s   p(90)=1.48s    p(95)=1.64s    p(99.9)=12.63s
     http_reqs......................: 16765   248.621277/s
     iteration_duration.............: avg=874.74ms min=47.3ms  med=818.95ms max=17.6s   p(90)=1.5s     p(95)=1.66s    p(99.9)=13s   
     iterations.....................: 15765   233.791496/s
     success_rate...................: 100.00% ✓ 15765      ✗ 0    
     vus............................: 85      min=0        max=500
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

     checks.........................: 100.00% ✓ 41853      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   265 kB/s
     http_req_blocked...............: avg=15.47µs  min=1.24µs  med=3.35µs   max=17.7ms   p(90)=5.03µs   p(95)=6.73µs   p(99.9)=1.95ms
     http_req_connecting............: avg=10.3µs   min=0s      med=0s       max=17.54ms  p(90)=0s       p(95)=0s       p(99.9)=1.78ms
     http_req_duration..............: avg=482.22ms min=8.34ms  med=547.97ms max=1.41s    p(90)=844.6ms  p(95)=938.7ms  p(99.9)=1.3s  
       { expected_response:true }...: avg=482.22ms min=8.34ms  med=547.97ms max=1.41s    p(90)=844.6ms  p(95)=938.7ms  p(99.9)=1.3s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14951
     http_req_receiving.............: avg=111.04µs min=33.67µs med=89.19µs  max=194.76ms p(90)=129.3µs  p(95)=143.14µs p(99.9)=1.3ms 
     http_req_sending...............: avg=54.24µs  min=6.27µs  med=16.16µs  max=149.72ms p(90)=22.37µs  p(95)=27.31µs  p(99.9)=3.63ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=482.05ms min=8.21ms  med=547.85ms max=1.41s    p(90)=844.43ms p(95)=938.63ms p(99.9)=1.3s  
     http_reqs......................: 14951   215.706227/s
     iteration_duration.............: avg=516.7ms  min=14.89ms med=577.79ms max=1.42s    p(90)=857.16ms p(95)=948.51ms p(99.9)=1.3s  
     iterations.....................: 13951   201.278681/s
     success_rate...................: 100.00% ✓ 13951      ✗ 0    
     vus............................: 114     min=0        max=495
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

     checks.........................: 100.00% ✓ 389520      ✗ 0     
     data_received..................: 11 GB   185 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=16µs     min=1.07µs  med=2.31µs   max=40.65ms  p(90)=3.81µs   p(95)=4.92µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=12.98µs  min=0s      med=0s       max=40.56ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=108.73ms min=1.58ms  med=103.68ms max=316.38ms p(90)=207.6ms  p(95)=224.45ms p(99.9)=277.66ms
       { expected_response:true }...: avg=108.73ms min=1.58ms  med=103.68ms max=316.38ms p(90)=207.6ms  p(95)=224.45ms p(99.9)=277.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130840
     http_req_receiving.............: avg=142.56µs min=30.31µs med=60.43µs  max=144.29ms p(90)=143.94µs p(95)=389.86µs p(99.9)=13.9ms  
     http_req_sending...............: avg=65.32µs  min=5.37µs  med=10.44µs  max=198.99ms p(90)=19.08µs  p(95)=132.94µs p(99.9)=8.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.52ms min=1.52ms  med=103.51ms max=298.13ms p(90)=207.31ms p(95)=224.18ms p(99.9)=276.21ms
     http_reqs......................: 130840  2110.775042/s
     iteration_duration.............: avg=109.84ms min=3.94ms  med=104.98ms max=364.78ms p(90)=208.13ms p(95)=225.03ms p(99.9)=278.46ms
     iterations.....................: 129840  2094.642552/s
     success_rate...................: 100.00% ✓ 129840      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
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
     ✗ no graphql errors
      ↳  80% — ✓ 79673 / ✗ 19883
     ✗ valid response structure
      ↳  99% — ✓ 99522 / ✗ 34

     checks.........................: 93.33% ✓ 278751      ✗ 19917 
     data_received..................: 7.8 GB 124 MB/s
     data_sent......................: 121 MB 1.9 MB/s
     http_req_blocked...............: avg=5.96µs   min=1.01µs   med=2.47µs  max=23.44ms  p(90)=4.76µs   p(95)=6.17µs   p(99.9)=259.82µs
     http_req_connecting............: avg=2.69µs   min=0s       med=0s      max=23.37ms  p(90)=0s       p(95)=0s       p(99.9)=164.99µs
     http_req_duration..............: avg=103.54ms min=521.54µs med=71.28ms max=29.68s   p(90)=131.08ms p(95)=152.7ms  p(99.9)=16.72s  
       { expected_response:true }...: avg=103.54ms min=521.54µs med=71.28ms max=29.68s   p(90)=131.08ms p(95)=152.7ms  p(99.9)=16.72s  
     http_req_failed................: 0.00%  ✓ 0           ✗ 100556
     http_req_receiving.............: avg=139.97µs min=15.4µs   med=63.02µs max=242.98ms p(90)=120.4µs  p(95)=192.52µs p(99.9)=7.05ms  
     http_req_sending...............: avg=50.91µs  min=5.32µs   med=11.02µs max=170.18ms p(90)=21.4µs   p(95)=31.64µs  p(99.9)=5.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.35ms min=495.96µs med=71.13ms max=29.68s   p(90)=130.87ms p(95)=152.39ms p(99.9)=16.72s  
     http_reqs......................: 100556 1602.179321/s
     iteration_duration.............: avg=104.82ms min=649.63µs med=71.92ms max=29.69s   p(90)=131.63ms p(95)=153.35ms p(99.9)=16.84s  
     iterations.....................: 99556  1586.246117/s
     success_rate...................: 80.02% ✓ 79673       ✗ 19883 
     vus............................: 94     min=0         max=500 
     vus_max........................: 500    min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 279618      ✗ 0    
     data_received..................: 8.3 GB  132 MB/s
     data_sent......................: 113 MB  1.8 MB/s
     http_req_blocked...............: avg=9.57µs   min=982ns   med=2.4µs   max=79.84ms p(90)=3.96µs   p(95)=4.86µs   p(99.9)=940.23µs
     http_req_connecting............: avg=6.47µs   min=0s      med=0s      max=79.78ms p(90)=0s       p(95)=0s       p(99.9)=862.33µs
     http_req_duration..............: avg=151.66ms min=1.85ms  med=75.82ms max=4.68s   p(90)=372.91ms p(95)=517.32ms p(99.9)=2.69s   
       { expected_response:true }...: avg=151.66ms min=1.85ms  med=75.82ms max=4.68s   p(90)=372.91ms p(95)=517.32ms p(99.9)=2.69s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 94206
     http_req_receiving.............: avg=3.93ms   min=52.48µs med=112.6µs max=1s      p(90)=2.62ms   p(95)=7.22ms   p(99.9)=469.3ms 
     http_req_sending...............: avg=46.72µs  min=5.53µs  med=10.32µs max=65.02ms p(90)=17.87µs  p(95)=24.09µs  p(99.9)=6.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=147.67ms min=1.77ms  med=74.45ms max=4.68s   p(90)=360ms    p(95)=501.65ms p(99.9)=2.68s   
     http_reqs......................: 94206   1506.362746/s
     iteration_duration.............: avg=153.54ms min=3.39ms  med=77.69ms max=4.68s   p(90)=375.75ms p(95)=519.72ms p(99.9)=2.7s    
     iterations.....................: 93206   1490.372652/s
     success_rate...................: 100.00% ✓ 93206       ✗ 0    
     vus............................: 84      min=0         max=499
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

     checks.........................: 100.00% ✓ 204699      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=6.47µs   min=1.1µs   med=2.74µs   max=21.16ms  p(90)=4.52µs   p(95)=5.49µs   p(99.9)=480.98µs
     http_req_connecting............: avg=3.03µs   min=0s      med=0s       max=21.09ms  p(90)=0s       p(95)=0s       p(99.9)=419.77µs
     http_req_duration..............: avg=205.57ms min=2.11ms  med=202.14ms max=578.48ms p(90)=382.8ms  p(95)=411.43ms p(99.9)=520.45ms
       { expected_response:true }...: avg=205.57ms min=2.11ms  med=202.14ms max=578.48ms p(90)=382.8ms  p(95)=411.43ms p(99.9)=520.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69233
     http_req_receiving.............: avg=86.92µs  min=31.18µs med=68.2µs   max=207.02ms p(90)=106.91µs p(95)=123.61µs p(99.9)=1.87ms  
     http_req_sending...............: avg=30.87µs  min=5.67µs  med=12.15µs  max=94.48ms  p(90)=19.2µs   p(95)=22.96µs  p(99.9)=3.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.45ms min=2.01ms  med=202.01ms max=578.41ms p(90)=382.66ms p(95)=411.33ms p(99.9)=520.34ms
     http_reqs......................: 69233   1104.646216/s
     iteration_duration.............: avg=208.84ms min=4.82ms  med=205.89ms max=578.64ms p(90)=383.86ms p(95)=412.2ms  p(99.9)=520.78ms
     iterations.....................: 68233   1088.690729/s
     success_rate...................: 100.00% ✓ 68233       ✗ 0    
     vus............................: 90      min=0         max=499
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

     checks.........................: 100.00% ✓ 85371      ✗ 0    
     data_received..................: 2.6 GB  39 MB/s
     data_sent......................: 35 MB   542 kB/s
     http_req_blocked...............: avg=10.96µs  min=1.15µs  med=2.8µs    max=34.44ms p(90)=4.55µs   p(95)=5.47µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=7.14µs   min=0s      med=0s       max=34.38ms p(90)=0s       p(95)=0s       p(99.9)=1.89ms  
     http_req_duration..............: avg=487.47ms min=4.38ms  med=453.76ms max=1.81s   p(90)=970.02ms p(95)=1.05s    p(99.9)=1.51s   
       { expected_response:true }...: avg=487.47ms min=4.38ms  med=453.76ms max=1.81s   p(90)=970.02ms p(95)=1.05s    p(99.9)=1.51s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 29457
     http_req_receiving.............: avg=88.95µs  min=31.89µs med=78.57µs  max=82.97ms p(90)=115.35µs p(95)=128.47µs p(99.9)=860.13µs
     http_req_sending...............: avg=25.87µs  min=5.87µs  med=13.35µs  max=54.1ms  p(90)=20.6µs   p(95)=23.67µs  p(99.9)=2.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=487.36ms min=4.32ms  med=453.64ms max=1.81s   p(90)=969.94ms p(95)=1.05s    p(99.9)=1.51s   
     http_reqs......................: 29457   450.510868/s
     iteration_duration.............: avg=504.81ms min=22.87ms med=476.01ms max=1.82s   p(90)=975.79ms p(95)=1.05s    p(99.9)=1.52s   
     iterations.....................: 28457   435.217021/s
     success_rate...................: 100.00% ✓ 28457      ✗ 0    
     vus............................: 79      min=0        max=498
     vus_max........................: 500     min=500      max=500
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
     ✗ no graphql errors
      ↳  82% — ✓ 18969 / ✗ 4140
     ✗ valid response structure
      ↳  99% — ✓ 23084 / ✗ 25

     checks.........................: 93.99% ✓ 65162      ✗ 4165 
     data_received..................: 2.0 GB 30 MB/s
     data_sent......................: 29 MB  437 kB/s
     http_req_blocked...............: avg=22.12µs  min=1.21µs  med=3.7µs    max=85.17ms  p(90)=5.47µs   p(95)=6.4µs    p(99.9)=2.62ms 
     http_req_connecting............: avg=17.37µs  min=0s      med=0s       max=84.96ms  p(90)=0s       p(95)=0s       p(99.9)=2.59ms 
     http_req_duration..............: avg=548.88ms min=5.88ms  med=537.94ms max=16.66s   p(90)=907.7ms  p(95)=984.88ms p(99.9)=14.78s 
       { expected_response:true }...: avg=548.88ms min=5.88ms  med=537.94ms max=16.66s   p(90)=907.7ms  p(95)=984.88ms p(99.9)=14.78s 
     http_req_failed................: 0.00%  ✓ 0          ✗ 24109
     http_req_receiving.............: avg=203.15µs min=15.77µs med=91.49µs  max=182.06ms p(90)=128.92µs p(95)=143.01µs p(99.9)=16.03ms
     http_req_sending...............: avg=63.48µs  min=5.96µs  med=17.72µs  max=221.59ms p(90)=23.55µs  p(95)=26.35µs  p(99.9)=5.76ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=548.62ms min=5.77ms  med=537.85ms max=16.66s   p(90)=907.47ms p(95)=984.8ms  p(99.9)=14.78s 
     http_reqs......................: 24109  361.173761/s
     iteration_duration.............: avg=572.86ms min=20.85ms med=561.01ms max=16.66s   p(90)=913.06ms p(95)=988.87ms p(99.9)=15.03s 
     iterations.....................: 23109  346.192893/s
     success_rate...................: 82.08% ✓ 18969      ✗ 4140 
     vus............................: 97     min=0        max=500
     vus_max........................: 500    min=500      max=500
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

     checks.........................: 100.00% ✓ 44995      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   287 kB/s
     http_req_blocked...............: avg=15.55µs  min=1.17µs  med=3.58µs   max=3.92ms  p(90)=5.41µs   p(95)=6.85µs  p(99.9)=2.66ms  
     http_req_connecting............: avg=10.27µs  min=0s      med=0s       max=3.87ms  p(90)=0s       p(95)=0s      p(99.9)=2.61ms  
     http_req_duration..............: avg=893.14ms min=5.89ms  med=816.91ms max=5.05s   p(90)=1.77s    p(95)=1.95s   p(99.9)=3.51s   
       { expected_response:true }...: avg=893.14ms min=5.89ms  med=816.91ms max=5.05s   p(90)=1.77s    p(95)=1.95s   p(99.9)=3.51s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15999
     http_req_receiving.............: avg=102.8µs  min=36.96µs med=95.42µs  max=26.61ms p(90)=135.18µs p(95)=147.3µs p(99.9)=937.28µs
     http_req_sending...............: avg=31.99µs  min=6.08µs  med=17.26µs  max=18.48ms p(90)=23.37µs  p(95)=27.91µs p(99.9)=4.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=893ms    min=5.77ms  med=816.82ms max=5.05s   p(90)=1.77s    p(95)=1.95s   p(99.9)=3.51s   
     http_reqs......................: 15999   236.515966/s
     iteration_duration.............: avg=952.74ms min=38.29ms med=892.45ms max=5.06s   p(90)=1.79s    p(95)=1.97s   p(99.9)=3.59s   
     iterations.....................: 14998   221.718011/s
     success_rate...................: 100.00% ✓ 14998      ✗ 0    
     vus............................: 97      min=0        max=500
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

     checks.........................: 100.00% ✓ 38700      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   243 kB/s
     http_req_blocked...............: avg=18.95µs  min=1.24µs  med=3.48µs   max=37.92ms p(90)=5.24µs   p(95)=6.81µs   p(99.9)=2.68ms 
     http_req_connecting............: avg=13.68µs  min=0s      med=0s       max=37.86ms p(90)=0s       p(95)=0s       p(99.9)=2.66ms 
     http_req_duration..............: avg=1.02s    min=8.51ms  med=932.52ms max=4.06s   p(90)=2.08s    p(95)=2.21s    p(99.9)=3.58s  
       { expected_response:true }...: avg=1.02s    min=8.51ms  med=932.52ms max=4.06s   p(90)=2.08s    p(95)=2.21s    p(99.9)=3.58s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 13900
     http_req_receiving.............: avg=288.03µs min=34.17µs med=94.87µs  max=182.1ms p(90)=136.96µs p(95)=149.93µs p(99.9)=71.45ms
     http_req_sending...............: avg=30.27µs  min=6.05µs  med=17.55µs  max=12.79ms p(90)=23.64µs  p(95)=28.54µs  p(99.9)=3.41ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=1.02s    min=8.42ms  med=932.4ms  max=4.06s   p(90)=2.08s    p(95)=2.21s    p(99.9)=3.58s  
     http_reqs......................: 13900   199.787318/s
     iteration_duration.............: avg=1.1s     min=12.39ms med=1.05s    max=4.06s   p(90)=2.1s     p(95)=2.22s    p(99.9)=3.59s  
     iterations.....................: 12900   185.41413/s
     success_rate...................: 100.00% ✓ 12900      ✗ 0    
     vus............................: 91      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

