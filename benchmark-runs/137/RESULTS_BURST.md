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
| hive-router | v0.0.43 | 2,804 | 2,905 | 2,747 | 1.9% |  |
| hotchocolate | 16.0.0-rc.1.27 | 2,034 | 2,089 | 2,013 | 1.2% |  |
| cosmo | 0.298.0 | 1,192 | 1,211 | 1,181 | 1.1% | non-compatible response (7 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 570 | 580 | 567 | 0.8% |  |
| hive-gateway | 2.5.14 | 254 | 256 | 250 | 0.9% |  |
| apollo-gateway | 2.13.3 | 204 | 209 | 202 | 1.1% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (24443 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (481318 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,264 | 2,347 | 2,235 | 1.9% |  |
| hotchocolate | 16.0.0-rc.1.27 | 1,924 | 1,957 | 1,907 | 0.9% |  |
| cosmo | 0.298.0 | 1,153 | 1,159 | 1,137 | 1.0% | non-compatible response (7 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 540 | 549 | 536 | 0.9% |  |
| hive-gateway | 2.5.14 | 249 | 251 | 245 | 0.8% |  |
| apollo-gateway | 2.13.3 | 209 | 210 | 208 | 0.2% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (30948 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (297656 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 517734      ✗ 0     
     data_received..................: 15 GB   246 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=25.81µs  min=971ns  med=2.17µs  max=77.61ms  p(90)=3.59µs   p(95)=4.77µs   p(99.9)=7.48ms  
     http_req_connecting............: avg=22.85µs  min=0s     med=0s      max=54.33ms  p(90)=0s       p(95)=0s       p(99.9)=7.21ms  
     http_req_duration..............: avg=81.84ms  min=1.57ms med=75.48ms max=407.97ms p(90)=159.8ms  p(95)=174.86ms p(99.9)=224.9ms 
       { expected_response:true }...: avg=81.84ms  min=1.57ms med=75.48ms max=407.97ms p(90)=159.8ms  p(95)=174.86ms p(99.9)=224.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 173578
     http_req_receiving.............: avg=391.03µs min=28.4µs med=55.55µs max=259.12ms p(90)=246.52µs p(95)=415.25µs p(99.9)=40.78ms 
     http_req_sending...............: avg=90.1µs   min=5.25µs med=9.76µs  max=380.45ms p(90)=18.59µs  p(95)=130.73µs p(99.9)=13.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.36ms  min=1.51ms med=75.07ms max=245.4ms  p(90)=159.15ms p(95)=173.7ms  p(99.9)=217.34ms
     http_reqs......................: 173578  2804.687309/s
     iteration_duration.............: avg=82.6ms   min=2.03ms med=76.3ms  max=423.1ms  p(90)=160.33ms p(95)=175.46ms p(99.9)=226.41ms
     iterations.....................: 172578  2788.529228/s
     success_rate...................: 100.00% ✓ 172578      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.27)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 380805      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 154 MB  2.4 MB/s
     http_req_blocked...............: avg=13.25µs  min=942ns   med=2.21µs   max=50.97ms  p(90)=3.56µs   p(95)=4.55µs   p(99.9)=1.05ms  
     http_req_connecting............: avg=10.08µs  min=0s      med=0s       max=50.83ms  p(90)=0s       p(95)=0s       p(99.9)=909.65µs
     http_req_duration..............: avg=111.26ms min=2.45ms  med=106.2ms  max=485.02ms p(90)=211.16ms p(95)=234.93ms p(99.9)=359.85ms
       { expected_response:true }...: avg=111.26ms min=2.45ms  med=106.2ms  max=485.02ms p(90)=211.16ms p(95)=234.93ms p(99.9)=359.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127935
     http_req_receiving.............: avg=1.15ms   min=52.26µs med=148.59µs max=205.72ms p(90)=1.34ms   p(95)=3.27ms   p(99.9)=86.82ms 
     http_req_sending...............: avg=60.54µs  min=5.08µs  med=9.84µs   max=75.65ms  p(90)=18.79µs  p(95)=121.48µs p(99.9)=8.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.04ms min=2.35ms  med=104.94ms max=483.57ms p(90)=209.64ms p(95)=232.19ms p(99.9)=355.41ms
     http_reqs......................: 127935  2034.86285/s
     iteration_duration.............: avg=112.4ms  min=3.62ms  med=107.54ms max=485.3ms  p(90)=211.75ms p(95)=235.58ms p(99.9)=362.77ms
     iterations.....................: 126935  2018.957407/s
     success_rate...................: 100.00% ✓ 126935      ✗ 0     
     vus............................: 19      min=0         max=500 
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

     checks.........................: 100.00% ✓ 220614      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.11µs   min=1.04µs  med=2.17µs   max=39.83ms  p(90)=3.64µs   p(95)=4.54µs   p(99.9)=499.55µs
     http_req_connecting............: avg=3.23µs   min=0s      med=0s       max=39.75ms  p(90)=0s       p(95)=0s       p(99.9)=424.45µs
     http_req_duration..............: avg=191.42ms min=2.06ms  med=191.55ms max=671.39ms p(90)=353.58ms p(95)=381.21ms p(99.9)=550ms   
       { expected_response:true }...: avg=191.42ms min=2.06ms  med=191.55ms max=671.39ms p(90)=353.58ms p(95)=381.21ms p(99.9)=550ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 74538
     http_req_receiving.............: avg=75.68µs  min=30.39µs med=60.62µs  max=32.71ms  p(90)=95.32µs  p(95)=109.61µs p(99.9)=1.87ms  
     http_req_sending...............: avg=26.14µs  min=5.25µs  med=10.45µs  max=13.94ms  p(90)=16.8µs   p(95)=20.24µs  p(99.9)=3.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.32ms min=2.01ms  med=191.45ms max=671.34ms p(90)=353.41ms p(95)=381.09ms p(99.9)=549.94ms
     http_reqs......................: 74538   1192.125284/s
     iteration_duration.............: avg=194.26ms min=4.65ms  med=194.85ms max=671.6ms  p(90)=354.45ms p(95)=382.03ms p(99.9)=550.8ms 
     iterations.....................: 73538   1176.13176/s
     success_rate...................: 100.00% ✓ 73538       ✗ 0    
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

     checks.........................: 100.00% ✓ 107238     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   685 kB/s
     http_req_blocked...............: avg=9.4µs    min=1.17µs  med=2.64µs   max=62.41ms  p(90)=4.47µs   p(95)=5.4µs    p(99.9)=1.07ms  
     http_req_connecting............: avg=5.72µs   min=0s      med=0s       max=62.32ms  p(90)=0s       p(95)=0s       p(99.9)=963.07µs
     http_req_duration..............: avg=390.34ms min=3.61ms  med=363.69ms max=1.55s    p(90)=773.15ms p(95)=840.48ms p(99.9)=1.22s   
       { expected_response:true }...: avg=390.34ms min=3.61ms  med=363.69ms max=1.55s    p(90)=773.15ms p(95)=840.48ms p(99.9)=1.22s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36746
     http_req_receiving.............: avg=92.04µs  min=31.83µs med=75.6µs   max=151.64ms p(90)=112.51µs p(95)=125.72µs p(99.9)=887.28µs
     http_req_sending...............: avg=28.89µs  min=5.46µs  med=13.05µs  max=105.93ms p(90)=20.8µs   p(95)=23.89µs  p(99.9)=2.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=390.22ms min=3.56ms  med=363.59ms max=1.55s    p(90)=773.03ms p(95)=840.35ms p(99.9)=1.21s   
     http_reqs......................: 36746   570.443218/s
     iteration_duration.............: avg=401.5ms  min=21.24ms med=376.66ms max=1.56s    p(90)=776.38ms p(95)=843.4ms  p(99.9)=1.22s   
     iterations.....................: 35746   554.919264/s
     success_rate...................: 100.00% ✓ 35746      ✗ 0    
     vus............................: 76      min=0        max=498
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

     checks.........................: 100.00% ✓ 48690      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   307 kB/s
     http_req_blocked...............: avg=12.7µs   min=1.01µs  med=3.58µs   max=3.34ms  p(90)=5.46µs   p(95)=6.9µs    p(99.9)=1.88ms
     http_req_connecting............: avg=7.65µs   min=0s      med=0s       max=3.31ms  p(90)=0s       p(95)=0s       p(99.9)=1.85ms
     http_req_duration..............: avg=826.43ms min=5.63ms  med=719.28ms max=19.68s  p(90)=1.38s    p(95)=1.55s    p(99.9)=18.93s
       { expected_response:true }...: avg=826.43ms min=5.63ms  med=719.28ms max=19.68s  p(90)=1.38s    p(95)=1.55s    p(99.9)=18.93s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17230
     http_req_receiving.............: avg=136.01µs min=33.5µs  med=99.24µs  max=44.78ms p(90)=137.89µs p(95)=150.72µs p(99.9)=8.74ms
     http_req_sending...............: avg=32.74µs  min=6µs     med=18.64µs  max=34.02ms p(90)=24.72µs  p(95)=29.57µs  p(99.9)=3.02ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=826.26ms min=5.54ms  med=719.17ms max=19.68s  p(90)=1.38s    p(95)=1.55s    p(99.9)=18.93s
     http_reqs......................: 17230   254.981809/s
     iteration_duration.............: avg=877.39ms min=20.98ms med=778.84ms max=19.69s  p(90)=1.39s    p(95)=1.56s    p(99.9)=18.97s
     iterations.....................: 16230   240.183097/s
     success_rate...................: 100.00% ✓ 16230      ✗ 0    
     vus............................: 84      min=0        max=500
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

     checks.........................: 100.00% ✓ 42528      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=15.47µs  min=1.23µs  med=3.3µs    max=26.9ms   p(90)=4.97µs   p(95)=6.53µs   p(99.9)=1.92ms
     http_req_connecting............: avg=10.46µs  min=0s      med=0s       max=26.85ms  p(90)=0s       p(95)=0s       p(99.9)=1.89ms
     http_req_duration..............: avg=436.73ms min=8.42ms  med=497.1ms  max=1.2s     p(90)=751.18ms p(95)=797.46ms p(99.9)=1.09s 
       { expected_response:true }...: avg=436.73ms min=8.42ms  med=497.1ms  max=1.2s     p(90)=751.18ms p(95)=797.46ms p(99.9)=1.09s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15176
     http_req_receiving.............: avg=108.51µs min=35.38µs med=93.28µs  max=106.78ms p(90)=133.6µs  p(95)=146.4µs  p(99.9)=1.18ms
     http_req_sending...............: avg=42.39µs  min=5.98µs  med=17.23µs  max=132.13ms p(90)=23.02µs  p(95)=27.8µs   p(99.9)=2.98ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=436.58ms min=8.31ms  med=497.01ms max=1.2s     p(90)=751.05ms p(95)=797.36ms p(99.9)=1.09s 
     http_reqs......................: 15176   204.141526/s
     iteration_duration.............: avg=467.49ms min=8.96ms  med=518.75ms max=1.21s    p(90)=755.01ms p(95)=803.6ms  p(99.9)=1.1s  
     iterations.....................: 14176   190.689923/s
     success_rate...................: 100.00% ✓ 14176      ✗ 0    
     vus............................: 67      min=0        max=494
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

     checks.........................: 100.00% ✓ 419580      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=20.9µs   min=1.02µs med=2.42µs  max=139.7ms  p(90)=4.16µs   p(95)=5.48µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=17.55µs  min=0s     med=0s      max=139.65ms p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=100.96ms min=1.7ms  med=95.51ms max=354.7ms  p(90)=193.74ms p(95)=211.51ms p(99.9)=266.85ms
       { expected_response:true }...: avg=100.96ms min=1.7ms  med=95.51ms max=354.7ms  p(90)=193.74ms p(95)=211.51ms p(99.9)=266.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140860
     http_req_receiving.............: avg=193.58µs min=28.7µs med=60.76µs max=98.29ms  p(90)=169.27µs p(95)=408.56µs p(99.9)=23.42ms 
     http_req_sending...............: avg=76.32µs  min=5.39µs med=10.88µs max=108.13ms p(90)=21.52µs  p(95)=138.08µs p(99.9)=10.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.69ms min=1.65ms med=95.3ms  max=353.96ms p(90)=193.36ms p(95)=211.03ms p(99.9)=265.85ms
     http_reqs......................: 140860  2264.873672/s
     iteration_duration.............: avg=101.97ms min=3.76ms med=96.65ms max=390.46ms p(90)=194.34ms p(95)=211.98ms p(99.9)=267.71ms
     iterations.....................: 139860  2248.794773/s
     success_rate...................: 100.00% ✓ 139860      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.27)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 356553      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=13.43µs  min=972ns  med=2.34µs   max=48.86ms  p(90)=3.96µs   p(95)=5.07µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=10.25µs  min=0s     med=0s       max=48.79ms  p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=118.79ms min=1.84ms med=111.73ms max=827.26ms p(90)=223.25ms p(95)=249.38ms p(99.9)=618.26ms
       { expected_response:true }...: avg=118.79ms min=1.84ms med=111.73ms max=827.26ms p(90)=223.25ms p(95)=249.38ms p(99.9)=618.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119851
     http_req_receiving.............: avg=1.42ms   min=52.4µs med=141.63µs max=231.51ms p(90)=1.52ms   p(95)=3.39ms   p(99.9)=113.2ms 
     http_req_sending...............: avg=55.18µs  min=5.32µs med=10.15µs  max=114.38ms p(90)=19.72µs  p(95)=118.26µs p(99.9)=7.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.31ms min=1.74ms med=110.26ms max=825.69ms p(90)=221.13ms p(95)=245.99ms p(99.9)=617.57ms
     http_reqs......................: 119851  1924.486468/s
     iteration_duration.............: avg=120.06ms min=3.11ms med=112.98ms max=827.47ms p(90)=223.89ms p(95)=250.01ms p(99.9)=618.57ms
     iterations.....................: 118851  1908.429143/s
     success_rate...................: 100.00% ✓ 118851      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 213588      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.71µs   min=1.03µs  med=2.28µs   max=22.88ms  p(90)=3.89µs   p(95)=4.81µs   p(99.9)=683.12µs
     http_req_connecting............: avg=3.74µs   min=0s      med=0s       max=22.74ms  p(90)=0s       p(95)=0s       p(99.9)=573.28µs
     http_req_duration..............: avg=197.64ms min=2.08ms  med=199.71ms max=602.48ms p(90)=364.63ms p(95)=391.05ms p(99.9)=517.75ms
       { expected_response:true }...: avg=197.64ms min=2.08ms  med=199.71ms max=602.48ms p(90)=364.63ms p(95)=391.05ms p(99.9)=517.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72196
     http_req_receiving.............: avg=80.93µs  min=29.82µs med=64.04µs  max=41.08ms  p(90)=101.98µs p(95)=117.75µs p(99.9)=1.66ms  
     http_req_sending...............: avg=34.28µs  min=5.41µs  med=11.2µs   max=139.09ms p(90)=18.22µs  p(95)=21.69µs  p(99.9)=3.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.53ms min=2.01ms  med=199.58ms max=602.42ms p(90)=364.49ms p(95)=390.91ms p(99.9)=517.63ms
     http_reqs......................: 72196   1153.614909/s
     iteration_duration.............: avg=200.66ms min=5.47ms  med=202.84ms max=602.63ms p(90)=365.49ms p(95)=391.76ms p(99.9)=518.95ms
     iterations.....................: 71196   1137.635978/s
     success_rate...................: 100.00% ✓ 71196       ✗ 0    
     vus............................: 84      min=0         max=495
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

     checks.........................: 100.00% ✓ 102129     ✗ 0    
     data_received..................: 3.1 GB  47 MB/s
     data_sent......................: 42 MB   649 kB/s
     http_req_blocked...............: avg=8.83µs   min=1.11µs  med=2.95µs   max=6.37ms   p(90)=4.71µs   p(95)=5.67µs   p(99.9)=1.32ms
     http_req_connecting............: avg=4.68µs   min=0s      med=0s       max=6.29ms   p(90)=0s       p(95)=0s       p(99.9)=1.13ms
     http_req_duration..............: avg=409.4ms  min=3.81ms  med=377.27ms max=1.67s    p(90)=808.58ms p(95)=878.71ms p(99.9)=1.27s 
       { expected_response:true }...: avg=409.4ms  min=3.81ms  med=377.27ms max=1.67s    p(90)=808.58ms p(95)=878.71ms p(99.9)=1.27s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 35043
     http_req_receiving.............: avg=163.14µs min=30.15µs med=79.18µs  max=173.44ms p(90)=116.1µs  p(95)=130.16µs p(99.9)=8.1ms 
     http_req_sending...............: avg=33.04µs  min=5.6µs   med=14.12µs  max=285.69ms p(90)=21.23µs  p(95)=24.37µs  p(99.9)=2.47ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=409.21ms min=3.73ms  med=377.12ms max=1.67s    p(90)=808.47ms p(95)=878.61ms p(99.9)=1.27s 
     http_reqs......................: 35043   540.644369/s
     iteration_duration.............: avg=421.68ms min=7.7ms   med=393.51ms max=1.68s    p(90)=812ms    p(95)=881.97ms p(99.9)=1.28s 
     iterations.....................: 34043   525.216341/s
     success_rate...................: 100.00% ✓ 34043      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 47685      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   300 kB/s
     http_req_blocked...............: avg=15.93µs  min=1.31µs  med=3.61µs   max=18.81ms p(90)=5.5µs    p(95)=7.02µs   p(99.9)=2.86ms 
     http_req_connecting............: avg=10.69µs  min=0s      med=0s       max=18.55ms p(90)=0s       p(95)=0s       p(99.9)=2.82ms 
     http_req_duration..............: avg=860.03ms min=5.96ms  med=789.55ms max=4.61s   p(90)=1.7s     p(95)=1.9s     p(99.9)=3.95s  
       { expected_response:true }...: avg=860.03ms min=5.96ms  med=789.55ms max=4.61s   p(90)=1.7s     p(95)=1.9s     p(99.9)=3.95s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16895
     http_req_receiving.............: avg=110.21µs min=37.44µs med=100.32µs max=36.57ms p(90)=139.98µs p(95)=152.62µs p(99.9)=995.4µs
     http_req_sending...............: avg=42µs     min=6.34µs  med=18.75µs  max=63.39ms p(90)=24.53µs  p(95)=29.1µs   p(99.9)=3.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=859.88ms min=5.86ms  med=789.43ms max=4.61s   p(90)=1.7s     p(95)=1.9s     p(99.9)=3.95s  
     http_reqs......................: 16895   249.536017/s
     iteration_duration.............: avg=914.2ms  min=38.64ms med=852.02ms max=4.62s   p(90)=1.72s    p(95)=1.91s    p(99.9)=3.97s  
     iterations.....................: 15895   234.766202/s
     success_rate...................: 100.00% ✓ 15895      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 40998      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   252 kB/s
     http_req_blocked...............: avg=19.71µs  min=1.22µs  med=3.47µs   max=22.11ms p(90)=5.29µs   p(95)=6.94µs   p(99.9)=3.06ms  
     http_req_connecting............: avg=13.93µs  min=0s      med=0s       max=22.06ms p(90)=0s       p(95)=0s       p(99.9)=2.95ms  
     http_req_duration..............: avg=994.39ms min=8.67ms  med=908.97ms max=4.02s   p(90)=2.02s    p(95)=2.15s    p(99.9)=3.57s   
       { expected_response:true }...: avg=994.39ms min=8.67ms  med=908.97ms max=4.02s   p(90)=2.02s    p(95)=2.15s    p(99.9)=3.57s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14666
     http_req_receiving.............: avg=106.07µs min=31.28µs med=97.61µs  max=42.66ms p(90)=137.18µs p(95)=149.62µs p(99.9)=968.02µs
     http_req_sending...............: avg=34.04µs  min=5.74µs  med=18.31µs  max=33.64ms p(90)=24.28µs  p(95)=29.54µs  p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=994.25ms min=8.54ms  med=908.83ms max=4.02s   p(90)=2.02s    p(95)=2.15s    p(99.9)=3.57s   
     http_reqs......................: 14666   209.620118/s
     iteration_duration.............: avg=1.06s    min=96.01ms med=987.43ms max=4.03s   p(90)=2.04s    p(95)=2.16s    p(99.9)=3.59s   
     iterations.....................: 13666   195.327188/s
     success_rate...................: 100.00% ✓ 13666      ✗ 0    
     vus............................: 42      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

