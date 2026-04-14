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
| hive-router | v0.0.43 | 2,877 | 2,984 | 2,849 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.2 | 2,093 | 2,131 | 2,065 | 1.1% |  |
| cosmo | 0.298.0 | 1,193 | 1,211 | 1,188 | 1.0% | non-compatible response (15 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 578 | 584 | 574 | 0.6% |  |
| hive-gateway | 2.5.14 | 253 | 255 | 251 | 0.6% |  |
| apollo-gateway | 2.13.3 | 206 | 209 | 203 | 1.0% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (41454 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (483457 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,223 | 2,342 | 2,187 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,876 | 1,925 | 1,859 | 1.2% |  |
| cosmo | 0.298.0 | 1,110 | 1,135 | 1,105 | 1.2% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 543 | 553 | 538 | 1.1% |  |
| hive-gateway | 2.5.14 | 250 | 253 | 246 | 0.9% |  |
| apollo-gateway | 2.13.3 | 209 | 211 | 207 | 0.5% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (30338 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (371691 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 531588      ✗ 0     
     data_received..................: 16 GB   252 MB/s
     data_sent......................: 214 MB  3.5 MB/s
     http_req_blocked...............: avg=39.09µs  min=1.01µs  med=2.72µs  max=105.14ms p(90)=4.37µs   p(95)=5.52µs   p(99.9)=10.39ms 
     http_req_connecting............: avg=35.05µs  min=0s      med=0s      max=105.06ms p(90)=0s       p(95)=0s       p(99.9)=9.83ms  
     http_req_duration..............: avg=79.58ms  min=1.65ms  med=71.27ms max=349.38ms p(90)=158.02ms p(95)=179.48ms p(99.9)=236.41ms
       { expected_response:true }...: avg=79.58ms  min=1.65ms  med=71.27ms max=349.38ms p(90)=158.02ms p(95)=179.48ms p(99.9)=236.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178196
     http_req_receiving.............: avg=498.76µs min=28.23µs med=55.9µs  max=111.57ms p(90)=252.34µs p(95)=439.21µs p(99.9)=60.41ms 
     http_req_sending...............: avg=104.52µs min=5.34µs  med=10.39µs max=125.26ms p(90)=19.91µs  p(95)=138.72µs p(99.9)=17.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.97ms  min=1.57ms  med=70.87ms max=348.5ms  p(90)=156.98ms p(95)=176.99ms p(99.9)=232.11ms
     http_reqs......................: 178196  2877.444726/s
     iteration_duration.............: avg=80.44ms  min=2.52ms  med=72.25ms max=393.77ms p(90)=158.72ms p(95)=180.39ms p(99.9)=238.82ms
     iterations.....................: 177196  2861.297087/s
     success_rate...................: 100.00% ✓ 177196      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 391686      ✗ 0     
     data_received..................: 12 GB   184 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=16.01µs  min=1.04µs  med=2.56µs   max=55.58ms  p(90)=3.97µs   p(95)=4.95µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=12.72µs  min=0s      med=0s       max=55.51ms  p(90)=0s       p(95)=0s       p(99.9)=1.91ms  
     http_req_duration..............: avg=108.15ms min=2.42ms  med=104.05ms max=519.17ms p(90)=205.82ms p(95)=229.05ms p(99.9)=352.74ms
       { expected_response:true }...: avg=108.15ms min=2.42ms  med=104.05ms max=519.17ms p(90)=205.82ms p(95)=229.05ms p(99.9)=352.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131562
     http_req_receiving.............: avg=1.19ms   min=51.28µs med=144.4µs  max=220.11ms p(90)=1.26ms   p(95)=3.04ms   p(99.9)=95.12ms 
     http_req_sending...............: avg=65.15µs  min=5.4µs   med=10.28µs  max=118.8ms  p(90)=18.95µs  p(95)=126.48µs p(99.9)=8.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.9ms  min=2.31ms  med=102.9ms  max=518.74ms p(90)=203.9ms  p(95)=226.15ms p(99.9)=346.73ms
     http_reqs......................: 131562  2093.743709/s
     iteration_duration.............: avg=109.24ms min=3.68ms  med=105.22ms max=519.37ms p(90)=206.39ms p(95)=229.68ms p(99.9)=353.66ms
     iterations.....................: 130562  2077.829207/s
     success_rate...................: 100.00% ✓ 130562      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 220818      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.47µs   min=1.12µs  med=2.56µs   max=8.28ms   p(90)=4.11µs   p(95)=5.01µs   p(99.9)=693.69µs
     http_req_connecting............: avg=3.22µs   min=0s      med=0s       max=8.13ms   p(90)=0s       p(95)=0s       p(99.9)=614.23µs
     http_req_duration..............: avg=191.23ms min=2.08ms  med=191.35ms max=604.98ms p(90)=355.06ms p(95)=380.51ms p(99.9)=494.32ms
       { expected_response:true }...: avg=191.23ms min=2.08ms  med=191.35ms max=604.98ms p(90)=355.06ms p(95)=380.51ms p(99.9)=494.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74606
     http_req_receiving.............: avg=83.91µs  min=29.34µs med=62.25µs  max=199.68ms p(90)=97.46µs  p(95)=112.52µs p(99.9)=2.05ms  
     http_req_sending...............: avg=30.68µs  min=5.08µs  med=11.02µs  max=40.96ms  p(90)=17.14µs  p(95)=20.94µs  p(99.9)=4.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.11ms min=2ms     med=191.23ms max=604.89ms p(90)=354.91ms p(95)=380.4ms  p(99.9)=494.24ms
     http_reqs......................: 74606   1193.701875/s
     iteration_duration.............: avg=194.06ms min=3.91ms  med=194.42ms max=605.21ms p(90)=356.01ms p(95)=381.14ms p(99.9)=494.55ms
     iterations.....................: 73606   1177.701796/s
     success_rate...................: 100.00% ✓ 73606       ✗ 0    
     vus............................: 84      min=0         max=494
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

     checks.........................: 100.00% ✓ 108762     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 45 MB   695 kB/s
     http_req_blocked...............: avg=9.53µs   min=1.12µs  med=3.04µs   max=9.61ms   p(90)=4.89µs   p(95)=6µs      p(99.9)=1.11ms  
     http_req_connecting............: avg=5.32µs   min=0s      med=0s       max=9.55ms   p(90)=0s       p(95)=0s       p(99.9)=988.04µs
     http_req_duration..............: avg=384.85ms min=3.62ms  med=357.53ms max=1.6s     p(90)=758.25ms p(95)=827.26ms p(99.9)=1.19s   
       { expected_response:true }...: avg=384.85ms min=3.62ms  med=357.53ms max=1.6s     p(90)=758.25ms p(95)=827.26ms p(99.9)=1.19s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 37254
     http_req_receiving.............: avg=119.71µs min=31.63µs med=77.61µs  max=224.2ms  p(90)=114.75µs p(95)=129.89µs p(99.9)=2.93ms  
     http_req_sending...............: avg=34.9µs   min=5.76µs  med=13.7µs   max=215.86ms p(90)=21.34µs  p(95)=24.99µs  p(99.9)=3.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=384.7ms  min=3.52ms  med=357.4ms  max=1.6s     p(90)=758.08ms p(95)=827.17ms p(99.9)=1.19s   
     http_reqs......................: 37254   578.519511/s
     iteration_duration.............: avg=395.72ms min=10.73ms med=371.19ms max=1.6s     p(90)=761.85ms p(95)=830.08ms p(99.9)=1.2s    
     iterations.....................: 36254   562.990454/s
     success_rate...................: 100.00% ✓ 36254      ✗ 0    
     vus............................: 75      min=0        max=497
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

     checks.........................: 100.00% ✓ 48438      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   305 kB/s
     http_req_blocked...............: avg=12.25µs  min=1.23µs  med=3.79µs   max=2.78ms  p(90)=5.74µs   p(95)=7.35µs   p(99.9)=1.48ms
     http_req_connecting............: avg=6.7µs    min=0s      med=0s       max=2.74ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms
     http_req_duration..............: avg=841.72ms min=5.57ms  med=729.45ms max=17.78s  p(90)=1.43s    p(95)=1.57s    p(99.9)=16.04s
       { expected_response:true }...: avg=841.72ms min=5.57ms  med=729.45ms max=17.78s  p(90)=1.43s    p(95)=1.57s    p(99.9)=16.04s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17146
     http_req_receiving.............: avg=113.31µs min=35.27µs med=100.85µs max=59.77ms p(90)=139.02µs p(95)=153.26µs p(99.9)=1.09ms
     http_req_sending...............: avg=37.9µs   min=6.05µs  med=18.53µs  max=72.24ms p(90)=24.78µs  p(95)=29.72µs  p(99.9)=3.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=841.57ms min=5.48ms  med=729.34ms max=17.78s  p(90)=1.43s    p(95)=1.57s    p(99.9)=16.04s
     http_reqs......................: 17146   253.413315/s
     iteration_duration.............: avg=893.94ms min=32.01ms med=783.56ms max=17.79s  p(90)=1.44s    p(95)=1.59s    p(99.9)=16.49s
     iterations.....................: 16146   238.633581/s
     success_rate...................: 100.00% ✓ 16146      ✗ 0    
     vus............................: 89      min=0        max=500
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

     checks.........................: 100.00% ✓ 42963      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   253 kB/s
     http_req_blocked...............: avg=16.81µs  min=1.29µs  med=3.5µs    max=16.15ms  p(90)=5.22µs   p(95)=6.73µs   p(99.9)=2.7ms 
     http_req_connecting............: avg=11.51µs  min=0s      med=0s       max=15.87ms  p(90)=0s       p(95)=0s       p(99.9)=2.67ms
     http_req_duration..............: avg=456.48ms min=8.37ms  med=501.47ms max=1.38s    p(90)=796.53ms p(95)=844.28ms p(99.9)=1.17s 
       { expected_response:true }...: avg=456.48ms min=8.37ms  med=501.47ms max=1.38s    p(90)=796.53ms p(95)=844.28ms p(99.9)=1.17s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15321
     http_req_receiving.............: avg=111.61µs min=36.12µs med=93.92µs  max=107.77ms p(90)=132.98µs p(95)=146.13µs p(99.9)=1.13ms
     http_req_sending...............: avg=45.21µs  min=6.03µs  med=17.76µs  max=129.64ms p(90)=23.63µs  p(95)=28.72µs  p(99.9)=3.17ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=456.32ms min=8.26ms  med=501.36ms max=1.38s    p(90)=796.4ms  p(95)=844.18ms p(99.9)=1.17s 
     http_reqs......................: 15321   206.118765/s
     iteration_duration.............: avg=488.33ms min=14.24ms med=533.2ms  max=1.39s    p(90)=802.66ms p(95)=850.1ms  p(99.9)=1.19s 
     iterations.....................: 14321   192.665416/s
     success_rate...................: 100.00% ✓ 14321      ✗ 0    
     vus............................: 65      min=0        max=494
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

     checks.........................: 100.00% ✓ 411126      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=22.73µs  min=1.06µs  med=2.96µs  max=71.64ms  p(90)=4.72µs   p(95)=5.97µs   p(99.9)=3.43ms  
     http_req_connecting............: avg=19.05µs  min=0s      med=0s      max=71.49ms  p(90)=0s       p(95)=0s       p(99.9)=3.38ms  
     http_req_duration..............: avg=103.02ms min=1.66ms  med=96.97ms max=354.39ms p(90)=200.42ms p(95)=217.58ms p(99.9)=267.26ms
       { expected_response:true }...: avg=103.02ms min=1.66ms  med=96.97ms max=354.39ms p(90)=200.42ms p(95)=217.58ms p(99.9)=267.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138042
     http_req_receiving.............: avg=224.19µs min=29.63µs med=63.41µs max=236.33ms p(90)=183.23µs p(95)=426.77µs p(99.9)=24.4ms  
     http_req_sending...............: avg=79.71µs  min=5.46µs  med=11.58µs max=161.9ms  p(90)=21.73µs  p(95)=142.06µs p(99.9)=10.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.71ms min=1.61ms  med=96.68ms max=353.57ms p(90)=199.94ms p(95)=217ms    p(99.9)=265.61ms
     http_reqs......................: 138042  2223.27153/s
     iteration_duration.............: avg=104.07ms min=4.14ms  med=98.16ms max=377ms    p(90)=201.04ms p(95)=218.1ms  p(99.9)=268.49ms
     iterations.....................: 137042  2207.165769/s
     success_rate...................: 100.00% ✓ 137042      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 347379      ✗ 0     
     data_received..................: 10 GB   165 MB/s
     data_sent......................: 140 MB  2.3 MB/s
     http_req_blocked...............: avg=13.17µs  min=1.06µs  med=2.75µs   max=59.42ms  p(90)=4.33µs   p(95)=5.37µs   p(99.9)=1.52ms  
     http_req_connecting............: avg=9.76µs   min=0s      med=0s       max=59.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=121.89ms min=1.82ms  med=115.29ms max=894.7ms  p(90)=231ms    p(95)=255.4ms  p(99.9)=582.26ms
       { expected_response:true }...: avg=121.89ms min=1.82ms  med=115.29ms max=894.7ms  p(90)=231ms    p(95)=255.4ms  p(99.9)=582.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 116793
     http_req_receiving.............: avg=1.22ms   min=52.63µs med=153.03µs max=203.1ms  p(90)=1.61ms   p(95)=3.49ms   p(99.9)=94.53ms 
     http_req_sending...............: avg=60.26µs  min=5.23µs  med=10.89µs  max=45.8ms   p(90)=19.62µs  p(95)=124.09µs p(99.9)=8.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.61ms min=1.72ms  med=114.07ms max=893.42ms p(90)=229.33ms p(95)=252.43ms p(99.9)=581.44ms
     http_reqs......................: 116793  1876.501398/s
     iteration_duration.............: avg=123.21ms min=3.25ms  med=116.89ms max=894.88ms p(90)=231.62ms p(95)=256.08ms p(99.9)=582.74ms
     iterations.....................: 115793  1860.434498/s
     success_rate...................: 100.00% ✓ 115793      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 205584      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=5.72µs   min=1.07µs  med=2.43µs   max=16.66ms  p(90)=4.1µs    p(95)=5.02µs   p(99.9)=478.61µs
     http_req_connecting............: avg=2.56µs   min=0s      med=0s       max=16.52ms  p(90)=0s       p(95)=0s       p(99.9)=397.24µs
     http_req_duration..............: avg=205.33ms min=2.13ms  med=206.27ms max=532.93ms p(90)=378.38ms p(95)=406.55ms p(99.9)=486.47ms
       { expected_response:true }...: avg=205.33ms min=2.13ms  med=206.27ms max=532.93ms p(90)=378.38ms p(95)=406.55ms p(99.9)=486.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69528
     http_req_receiving.............: avg=113.85µs min=30.13µs med=64.6µs   max=196.13ms p(90)=101.24µs p(95)=116.61µs p(99.9)=1.84ms  
     http_req_sending...............: avg=29.77µs  min=5.31µs  med=11.26µs  max=73.83ms  p(90)=17.72µs  p(95)=21.18µs  p(99.9)=3.61ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.19ms min=2.04ms  med=206.08ms max=532.85ms p(90)=378.29ms p(95)=406.42ms p(99.9)=486.33ms
     http_reqs......................: 69528   1110.247881/s
     iteration_duration.............: avg=208.59ms min=4.15ms  med=209.78ms max=533.16ms p(90)=379.2ms  p(95)=407.22ms p(99.9)=487.05ms
     iterations.....................: 68528   1094.279524/s
     success_rate...................: 100.00% ✓ 68528       ✗ 0    
     vus............................: 85      min=0         max=498
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

     checks.........................: 100.00% ✓ 102663     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   653 kB/s
     http_req_blocked...............: avg=7.78µs   min=1.1µs   med=3.13µs   max=7.82ms   p(90)=4.98µs   p(95)=5.99µs   p(99.9)=717.1µs 
     http_req_connecting............: avg=3.69µs   min=0s      med=0s       max=7.75ms   p(90)=0s       p(95)=0s       p(99.9)=663.56µs
     http_req_duration..............: avg=407.33ms min=3.74ms  med=379.53ms max=1.58s    p(90)=800.17ms p(95)=872.72ms p(99.9)=1.29s   
       { expected_response:true }...: avg=407.33ms min=3.74ms  med=379.53ms max=1.58s    p(90)=800.17ms p(95)=872.72ms p(99.9)=1.29s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35221
     http_req_receiving.............: avg=93.81µs  min=31.53µs med=81.41µs  max=110.64ms p(90)=117.92µs p(95)=131.82µs p(99.9)=1.32ms  
     http_req_sending...............: avg=38.09µs  min=5.55µs  med=14.62µs  max=171.62ms p(90)=21.74µs  p(95)=25.4µs   p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=407.2ms  min=3.68ms  med=379.48ms max=1.58s    p(90)=800.11ms p(95)=872.61ms p(99.9)=1.29s   
     http_reqs......................: 35221   543.887785/s
     iteration_duration.............: avg=419.5ms  min=15ms    med=394.94ms max=1.59s    p(90)=804.89ms p(95)=875.32ms p(99.9)=1.29s   
     iterations.....................: 34221   528.44564/s
     success_rate...................: 100.00% ✓ 34221      ✗ 0    
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

     checks.........................: 100.00% ✓ 48003      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=14.99µs  min=1.34µs  med=3.78µs   max=25.6ms  p(90)=5.71µs   p(95)=7.27µs   p(99.9)=2.02ms
     http_req_connecting............: avg=9.35µs   min=0s      med=0s       max=25.54ms p(90)=0s       p(95)=0s       p(99.9)=1.97ms
     http_req_duration..............: avg=855.45ms min=5.87ms  med=779.87ms max=4.74s   p(90)=1.67s    p(95)=1.9s     p(99.9)=3.79s 
       { expected_response:true }...: avg=855.45ms min=5.87ms  med=779.87ms max=4.74s   p(90)=1.67s    p(95)=1.9s     p(99.9)=3.79s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 17001
     http_req_receiving.............: avg=109.64µs min=35.91µs med=99.47µs  max=58.03ms p(90)=137.86µs p(95)=150.38µs p(99.9)=1.03ms
     http_req_sending...............: avg=33.01µs  min=6.53µs  med=18.42µs  max=29.26ms p(90)=24.69µs  p(95)=29.72µs  p(99.9)=3.18ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=855.31ms min=5.77ms  med=779.75ms max=4.74s   p(90)=1.67s    p(95)=1.9s     p(99.9)=3.79s 
     http_reqs......................: 17001   250.905211/s
     iteration_duration.............: avg=908.99ms min=29.21ms med=838.96ms max=4.76s   p(90)=1.7s     p(95)=1.92s    p(99.9)=3.8s  
     iterations.....................: 16001   236.146949/s
     success_rate...................: 100.00% ✓ 16001      ✗ 0    
     vus............................: 82      min=0        max=500
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

     checks.........................: 100.00% ✓ 40968      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=16.06µs  min=1.25µs  med=3.71µs   max=20.1ms  p(90)=5.55µs   p(95)=7.14µs   p(99.9)=2.3ms   
     http_req_connecting............: avg=10.51µs  min=0s      med=0s       max=19.84ms p(90)=0s       p(95)=0s       p(99.9)=2.27ms  
     http_req_duration..............: avg=994.64ms min=8.85ms  med=894.12ms max=4.04s   p(90)=2.02s    p(95)=2.15s    p(99.9)=3.61s   
       { expected_response:true }...: avg=994.64ms min=8.85ms  med=894.12ms max=4.04s   p(90)=2.02s    p(95)=2.15s    p(99.9)=3.61s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14656
     http_req_receiving.............: avg=104.67µs min=32.86µs med=99.04µs  max=5.9ms   p(90)=139.65µs p(95)=151.85µs p(99.9)=618.09µs
     http_req_sending...............: avg=30.93µs  min=6.02µs  med=18.3µs   max=13.98ms p(90)=24.24µs  p(95)=29.55µs  p(99.9)=4.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=994.5ms  min=8.76ms  med=894.03ms max=4.04s   p(90)=2.02s    p(95)=2.15s    p(99.9)=3.61s   
     http_reqs......................: 14656   209.009964/s
     iteration_duration.............: avg=1.06s    min=46.4ms  med=1.01s    max=4.05s   p(90)=2.04s    p(95)=2.16s    p(99.9)=3.67s   
     iterations.....................: 13656   194.748913/s
     success_rate...................: 100.00% ✓ 13656      ✗ 0    
     vus............................: 64      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

