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
| hive-router | v0.0.49 | 2,652 | 2,785 | 2,595 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,083 | 2,132 | 2,067 | 1.0% |  |
| cosmo | 0.307.0 | 1,190 | 1,190 | 1,180 | 0.6% | non-compatible response (12 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 486 | 492 | 483 | 0.7% |  |
| hive-gateway | 2.5.25 | 233 | 239 | 227 | 1.5% |  |
| apollo-gateway | 2.13.3 | 203 | 208 | 201 | 1.0% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (15771 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (529371 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,224 | 2,330 | 2,179 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,857 | 1,902 | 1,850 | 1.0% |  |
| cosmo | 0.307.0 | 1,107 | 1,107 | 1,107 | 0.0% | non-compatible response (18 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 460 | 470 | 456 | 1.2% |  |
| hive-gateway | 2.5.25 | 227 | 231 | 225 | 0.9% |  |
| apollo-gateway | 2.13.3 | 206 | 210 | 205 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16353 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (266491 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 489873      ✗ 0     
     data_received..................: 14 GB   233 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=30.15µs  min=1.08µs  med=2.73µs  max=62.86ms  p(90)=4.3µs    p(95)=5.47µs   p(99.9)=6.07ms  
     http_req_connecting............: avg=25.88µs  min=0s      med=0s      max=62.8ms   p(90)=0s       p(95)=0s       p(99.9)=5.16ms  
     http_req_duration..............: avg=86.47ms  min=1.56ms  med=79.81ms max=297.19ms p(90)=166.83ms p(95)=183.61ms p(99.9)=247.26ms
       { expected_response:true }...: avg=86.47ms  min=1.56ms  med=79.81ms max=297.19ms p(90)=166.83ms p(95)=183.61ms p(99.9)=247.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164291
     http_req_receiving.............: avg=357.27µs min=28.96µs med=57.36µs max=131.78ms p(90)=211.52µs p(95)=424.07µs p(99.9)=42.83ms 
     http_req_sending...............: avg=86.58µs  min=5.46µs  med=10.51µs max=148.61ms p(90)=18.99µs  p(95)=136.68µs p(99.9)=12.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.03ms  min=1.49ms  med=79.41ms max=275.52ms p(90)=166.22ms p(95)=182.69ms p(99.9)=244.63ms
     http_reqs......................: 164291  2652.210247/s
     iteration_duration.............: avg=87.31ms  min=2.29ms  med=80.77ms max=378.52ms p(90)=167.32ms p(95)=184.2ms  p(99.9)=248.93ms
     iterations.....................: 163291  2636.066878/s
     success_rate...................: 100.00% ✓ 163291      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 389094      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=21.61µs  min=1.03µs  med=2.71µs   max=101.81ms p(90)=4.23µs   p(95)=5.25µs   p(99.9)=2.31ms  
     http_req_connecting............: avg=18.27µs  min=0s      med=0s       max=101.72ms p(90)=0s       p(95)=0s       p(99.9)=2.26ms  
     http_req_duration..............: avg=108.85ms min=2.38ms  med=95.73ms  max=697.07ms p(90)=215.65ms p(95)=252.62ms p(99.9)=448.44ms
       { expected_response:true }...: avg=108.85ms min=2.38ms  med=95.73ms  max=697.07ms p(90)=215.65ms p(95)=252.62ms p(99.9)=448.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130698
     http_req_receiving.............: avg=2.56ms   min=52.08µs med=113.59µs max=357.36ms p(90)=1.37ms   p(95)=5.08ms   p(99.9)=204.31ms
     http_req_sending...............: avg=74.68µs  min=5.42µs  med=10.49µs  max=133.15ms p(90)=19.34µs  p(95)=129.3µs  p(99.9)=9.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.21ms min=2.26ms  med=94.55ms  max=656.13ms p(90)=210.94ms p(95)=241.72ms p(99.9)=395.94ms
     http_reqs......................: 130698  2083.892394/s
     iteration_duration.............: avg=109.99ms min=3.69ms  med=97.02ms  max=697.26ms p(90)=216.44ms p(95)=253.65ms p(99.9)=450.25ms
     iterations.....................: 129698  2067.948061/s
     success_rate...................: 100.00% ✓ 129698      ✗ 0     
     vus............................: 92      min=0         max=499 
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

     checks.........................: 100.00% ✓ 220149      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 89 MB   1.4 MB/s
     http_req_blocked...............: avg=6.84µs   min=1.15µs  med=2.56µs   max=32.11ms  p(90)=4.1µs    p(95)=5.02µs   p(99.9)=595.75µs
     http_req_connecting............: avg=3.61µs   min=0s      med=0s       max=31.94ms  p(90)=0s       p(95)=0s       p(99.9)=513.25µs
     http_req_duration..............: avg=191.83ms min=2.08ms  med=193.67ms max=502.58ms p(90)=354.81ms p(95)=379.97ms p(99.9)=453.83ms
       { expected_response:true }...: avg=191.83ms min=2.08ms  med=193.67ms max=502.58ms p(90)=354.81ms p(95)=379.97ms p(99.9)=453.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74383
     http_req_receiving.............: avg=76.8µs   min=29.91µs med=61.67µs  max=40.81ms  p(90)=96.09µs  p(95)=110.84µs p(99.9)=1.55ms  
     http_req_sending...............: avg=35.83µs  min=5.53µs  med=10.97µs  max=271.96ms p(90)=17.04µs  p(95)=20.69µs  p(99.9)=3.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.72ms min=2ms     med=193.57ms max=502.49ms p(90)=354.72ms p(95)=379.84ms p(99.9)=453.77ms
     http_reqs......................: 74383   1190.349256/s
     iteration_duration.............: avg=194.68ms min=5.01ms  med=196.68ms max=502.79ms p(90)=355.71ms p(95)=380.54ms p(99.9)=454.32ms
     iterations.....................: 73383   1174.346282/s
     success_rate...................: 100.00% ✓ 73383       ✗ 0    
     vus............................: 81      min=0         max=493
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

     checks.........................: 100.00% ✓ 91677      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   584 kB/s
     http_req_blocked...............: avg=8.44µs   min=1.18µs  med=2.92µs   max=7.53ms   p(90)=4.59µs   p(95)=5.63µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=4.36µs   min=0s      med=0s       max=7.47ms   p(90)=0s       p(95)=0s       p(99.9)=913.97µs
     http_req_duration..............: avg=455.16ms min=3.98ms  med=427.12ms max=1.97s    p(90)=892.98ms p(95)=976.12ms p(99.9)=1.48s   
       { expected_response:true }...: avg=455.16ms min=3.98ms  med=427.12ms max=1.97s    p(90)=892.98ms p(95)=976.12ms p(99.9)=1.48s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31559
     http_req_receiving.............: avg=89.35µs  min=32.95µs med=77.01µs  max=119.82ms p(90)=112.46µs p(95)=124.76µs p(99.9)=894.15µs
     http_req_sending...............: avg=30.15µs  min=5.64µs  med=13µs     max=94.81ms  p(90)=20.06µs  p(95)=23.45µs  p(99.9)=3.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=455.05ms min=3.88ms  med=427.03ms max=1.97s    p(90)=892.86ms p(95)=976.02ms p(99.9)=1.48s   
     http_reqs......................: 31559   486.575907/s
     iteration_duration.............: avg=470.28ms min=25.81ms med=446.01ms max=1.98s    p(90)=898.04ms p(95)=979.39ms p(99.9)=1.48s   
     iterations.....................: 30559   471.157931/s
     success_rate...................: 100.00% ✓ 30559      ✗ 0    
     vus............................: 25      min=0        max=500
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

     checks.........................: 100.00% ✓ 44598      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   281 kB/s
     http_req_blocked...............: avg=15.03µs  min=1.15µs  med=3.62µs   max=27.48ms  p(90)=5.44µs   p(95)=7.06µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=9.78µs   min=0s      med=0s       max=27.42ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=897.15ms min=6.03ms  med=769.09ms max=20.44s   p(90)=1.53s    p(95)=1.69s    p(99.9)=18.17s  
       { expected_response:true }...: avg=897.15ms min=6.03ms  med=769.09ms max=20.44s   p(90)=1.53s    p(95)=1.69s    p(99.9)=18.17s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15866
     http_req_receiving.............: avg=112.29µs min=34.01µs med=97.61µs  max=102.46ms p(90)=136.88µs p(95)=150.21µs p(99.9)=842.01µs
     http_req_sending...............: avg=34.93µs  min=6.1µs   med=17.53µs  max=76.23ms  p(90)=23.9µs   p(95)=28.85µs  p(99.9)=2.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=897ms    min=5.94ms  med=768.98ms max=20.44s   p(90)=1.53s    p(95)=1.69s    p(99.9)=18.17s  
     http_reqs......................: 15866   233.378326/s
     iteration_duration.............: avg=957.55ms min=33.58ms med=842.72ms max=20.45s   p(90)=1.56s    p(95)=1.71s    p(99.9)=18.17s  
     iterations.....................: 14866   218.66899/s
     success_rate...................: 100.00% ✓ 14866      ✗ 0    
     vus............................: 35      min=0        max=500
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
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=13.43µs  min=1.28µs  med=3.33µs   max=10.52ms  p(90)=4.9µs    p(95)=6.42µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=8.3µs    min=0s      med=0s       max=10.16ms  p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=472.4ms  min=8.34ms  med=551.98ms max=1.33s    p(90)=797.38ms p(95)=853.12ms p(99.9)=1.19s   
       { expected_response:true }...: avg=472.4ms  min=8.34ms  med=551.98ms max=1.33s    p(90)=797.38ms p(95)=853.12ms p(99.9)=1.19s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15097
     http_req_receiving.............: avg=96.52µs  min=35.56µs med=89.53µs  max=3.95ms   p(90)=129.98µs p(95)=143.83µs p(99.9)=991.25µs
     http_req_sending...............: avg=35.13µs  min=6.21µs  med=15.52µs  max=104.06ms p(90)=21.87µs  p(95)=26.75µs  p(99.9)=2.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=472.27ms min=8.22ms  med=551.81ms max=1.33s    p(90)=797.28ms p(95)=853.04ms p(99.9)=1.19s   
     http_reqs......................: 15097   203.298199/s
     iteration_duration.............: avg=505.83ms min=9.23ms  med=591.84ms max=1.34s    p(90)=803.46ms p(95)=858ms    p(99.9)=1.2s    
     iterations.....................: 14097   189.832067/s
     success_rate...................: 100.00% ✓ 14097      ✗ 0    
     vus............................: 63      min=0        max=495
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

     checks.........................: 100.00% ✓ 411696      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=24.33µs  min=1.06µs  med=3.07µs  max=57.83ms  p(90)=4.89µs   p(95)=6.19µs   p(99.9)=2.95ms  
     http_req_connecting............: avg=20.52µs  min=0s      med=0s      max=57.65ms  p(90)=0s       p(95)=0s       p(99.9)=2.84ms  
     http_req_duration..............: avg=102.87ms min=1.67ms  med=96.47ms max=364.99ms p(90)=200.13ms p(95)=218.02ms p(99.9)=265.85ms
       { expected_response:true }...: avg=102.87ms min=1.67ms  med=96.47ms max=364.99ms p(90)=200.13ms p(95)=218.02ms p(99.9)=265.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138232
     http_req_receiving.............: avg=221.71µs min=28.95µs med=62.81µs max=58.24ms  p(90)=184.28µs p(95)=437.04µs p(99.9)=27.69ms 
     http_req_sending...............: avg=82.84µs  min=5.11µs  med=11.81µs max=154.44ms p(90)=21.93µs  p(95)=146µs    p(99.9)=11.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.57ms min=1.62ms  med=96.22ms max=364.36ms p(90)=199.56ms p(95)=217.23ms p(99.9)=264.5ms 
     http_reqs......................: 138232  2224.812973/s
     iteration_duration.............: avg=103.91ms min=3.37ms  med=97.7ms  max=400.34ms p(90)=200.69ms p(95)=218.51ms p(99.9)=267.46ms
     iterations.....................: 137232  2208.718197/s
     success_rate...................: 100.00% ✓ 137232      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 343896      ✗ 0     
     data_received..................: 10 GB   163 MB/s
     data_sent......................: 139 MB  2.2 MB/s
     http_req_blocked...............: avg=16.38µs  min=1µs     med=2.79µs   max=69.73ms  p(90)=4.36µs   p(95)=5.41µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=12.92µs  min=0s      med=0s       max=69.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.95ms  
     http_req_duration..............: avg=123.12ms min=1.83ms  med=113.9ms  max=706.51ms p(90)=236.24ms p(95)=270.4ms  p(99.9)=564.15ms
       { expected_response:true }...: avg=123.12ms min=1.83ms  med=113.9ms  max=706.51ms p(90)=236.24ms p(95)=270.4ms  p(99.9)=564.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 115632
     http_req_receiving.............: avg=1.72ms   min=53.51µs med=118.53µs max=349.71ms p(90)=1.66ms   p(95)=4.27ms   p(99.9)=160.19ms
     http_req_sending...............: avg=65.5µs   min=5.33µs  med=10.76µs  max=179.48ms p(90)=19.62µs  p(95)=124.35µs p(99.9)=8.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.33ms min=1.69ms  med=112.74ms max=676.92ms p(90)=233.81ms p(95)=265.35ms p(99.9)=512.01ms
     http_reqs......................: 115632  1857.408731/s
     iteration_duration.............: avg=124.48ms min=3.13ms  med=115.42ms max=728.26ms p(90)=236.94ms p(95)=271.26ms p(99.9)=565.46ms
     iterations.....................: 114632  1841.345628/s
     success_rate...................: 100.00% ✓ 114632      ✗ 0     
     vus............................: 69      min=0         max=495 
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

     checks.........................: 100.00% ✓ 205101      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=6.94µs   min=1.12µs  med=2.76µs   max=19.85ms  p(90)=4.4µs    p(95)=5.35µs   p(99.9)=621.91µs
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=19.79ms  p(90)=0s       p(95)=0s       p(99.9)=523µs   
     http_req_duration..............: avg=205.8ms  min=2.09ms  med=206.5ms  max=759.15ms p(90)=381.33ms p(95)=410.42ms p(99.9)=544.09ms
       { expected_response:true }...: avg=205.8ms  min=2.09ms  med=206.5ms  max=759.15ms p(90)=381.33ms p(95)=410.42ms p(99.9)=544.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69367
     http_req_receiving.............: avg=87.12µs  min=29.47µs med=65.73µs  max=195.62ms p(90)=102.32µs p(95)=117.54µs p(99.9)=1.77ms  
     http_req_sending...............: avg=31.59µs  min=5.63µs  med=11.86µs  max=128.48ms p(90)=18.32µs  p(95)=21.87µs  p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.69ms min=2.02ms  med=206.37ms max=759.06ms p(90)=381.23ms p(95)=410.32ms p(99.9)=544.01ms
     http_reqs......................: 69367   1107.31114/s
     iteration_duration.............: avg=209.07ms min=4.38ms  med=209.85ms max=759.35ms p(90)=382.4ms  p(95)=411.28ms p(99.9)=544.76ms
     iterations.....................: 68367   1091.348058/s
     success_rate...................: 100.00% ✓ 68367       ✗ 0    
     vus............................: 86      min=0         max=498
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

     checks.........................: 100.00% ✓ 87294      ✗ 0    
     data_received..................: 2.6 GB  40 MB/s
     data_sent......................: 36 MB   553 kB/s
     http_req_blocked...............: avg=11.96µs  min=1.15µs  med=3.16µs   max=34.32ms  p(90)=4.86µs   p(95)=5.91µs   p(99.9)=1.81ms
     http_req_connecting............: avg=7.59µs   min=0s      med=0s       max=34.14ms  p(90)=0s       p(95)=0s       p(99.9)=1.74ms
     http_req_duration..............: avg=477.55ms min=4.18ms  med=441.57ms max=2.52s    p(90)=942.93ms p(95)=1.01s    p(99.9)=1.56s 
       { expected_response:true }...: avg=477.55ms min=4.18ms  med=441.57ms max=2.52s    p(90)=942.93ms p(95)=1.01s    p(99.9)=1.56s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30098
     http_req_receiving.............: avg=103.81µs min=31.6µs  med=81.71µs  max=130.45ms p(90)=118.35µs p(95)=132.35µs p(99.9)=1.25ms
     http_req_sending...............: avg=30.37µs  min=5.19µs  med=14.21µs  max=109.54ms p(90)=21.16µs  p(95)=24.51µs  p(99.9)=3.71ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=477.41ms min=4.1ms   med=441.39ms max=2.51s    p(90)=942.77ms p(95)=1.01s    p(99.9)=1.56s 
     http_reqs......................: 30098   460.898924/s
     iteration_duration.............: avg=494.17ms min=33.63ms med=463.96ms max=2.52s    p(90)=947.72ms p(95)=1.02s    p(99.9)=1.58s 
     iterations.....................: 29098   445.58565/s
     success_rate...................: 100.00% ✓ 29098      ✗ 0    
     vus............................: 72      min=0        max=495
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

     checks.........................: 100.00% ✓ 43659      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   273 kB/s
     http_req_blocked...............: avg=16.25µs  min=1.27µs  med=3.69µs   max=4.7ms    p(90)=5.61µs   p(95)=7.38µs  p(99.9)=2.63ms
     http_req_connecting............: avg=10.54µs  min=0s      med=0s       max=4.65ms   p(90)=0s       p(95)=0s      p(99.9)=2.52ms
     http_req_duration..............: avg=938.28ms min=6.31ms  med=844.13ms max=5.08s    p(90)=1.85s    p(95)=2.07s   p(99.9)=4.7s  
       { expected_response:true }...: avg=938.28ms min=6.31ms  med=844.13ms max=5.08s    p(90)=1.85s    p(95)=2.07s   p(99.9)=4.7s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15553
     http_req_receiving.............: avg=119.41µs min=36µs    med=98.09µs  max=115.68ms p(90)=138.17µs p(95)=151.5µs p(99.9)=1.08ms
     http_req_sending...............: avg=46.28µs  min=6.24µs  med=17.82µs  max=140.53ms p(90)=24.19µs  p(95)=29.53µs p(99.9)=2.73ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=938.12ms min=6.21ms  med=844.02ms max=5.08s    p(90)=1.85s    p(95)=2.07s   p(99.9)=4.7s  
     http_reqs......................: 15553   227.409714/s
     iteration_duration.............: avg=1s       min=58.73ms med=920.01ms max=5.09s    p(90)=1.86s    p(95)=2.08s   p(99.9)=4.71s 
     iterations.....................: 14553   212.788116/s
     success_rate...................: 100.00% ✓ 14553      ✗ 0    
     vus............................: 69      min=0        max=500
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

     checks.........................: 100.00% ✓ 40179      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=15.98µs  min=1.13µs  med=3.66µs   max=3.56ms  p(90)=5.54µs  p(95)=7.44µs   p(99.9)=2.79ms
     http_req_connecting............: avg=10.28µs  min=0s      med=0s       max=3.54ms  p(90)=0s      p(95)=0s       p(99.9)=2.77ms
     http_req_duration..............: avg=1.01s    min=8.61ms  med=924.05ms max=4.19s   p(90)=2.06s   p(95)=2.17s    p(99.9)=3.92s 
       { expected_response:true }...: avg=1.01s    min=8.61ms  med=924.05ms max=4.19s   p(90)=2.06s   p(95)=2.17s    p(99.9)=3.92s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14393
     http_req_receiving.............: avg=106.05µs min=34.14µs med=98.11µs  max=19.23ms p(90)=138.6µs p(95)=151.11µs p(99.9)=1.04ms
     http_req_sending...............: avg=35.34µs  min=5.56µs  med=17.73µs  max=41.22ms p(90)=23.76µs p(95)=29.15µs  p(99.9)=3.68ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.52ms  med=923.89ms max=4.19s   p(90)=2.06s   p(95)=2.17s    p(99.9)=3.92s 
     http_reqs......................: 14393   206.000076/s
     iteration_duration.............: avg=1.08s    min=39.18ms med=1.01s    max=4.2s    p(90)=2.07s   p(95)=2.18s    p(99.9)=3.93s 
     iterations.....................: 13393   191.687558/s
     success_rate...................: 100.00% ✓ 13393      ✗ 0    
     vus............................: 22      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

