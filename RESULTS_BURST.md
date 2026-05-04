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
| hive-router | v0.0.49 | 2,820 | 2,932 | 2,789 | 1.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,021 | 2,058 | 2,006 | 1.0% |  |
| cosmo | 0.307.0 | 1,192 | 1,192 | 1,188 | 0.2% | non-compatible response (16 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 492 | 499 | 487 | 0.8% |  |
| hive-gateway | 2.5.25 | 232 | 234 | 226 | 1.2% |  |
| apollo-gateway | 2.13.3 | 200 | 206 | 198 | 1.2% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (19716 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (499804 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,153 | 2,263 | 2,123 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,896 | 1,933 | 1,689 | 3.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 463 | 476 | 459 | 1.3% |  |
| hive-gateway | 2.5.25 | 223 | 227 | 221 | 1.0% |  |
| apollo-gateway | 2.13.3 | 204 | 210 | 203 | 1.1% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (14194 across 9/9 runs) |
| cosmo | 0.307.0 | — | — | — | — | non-compatible response (20 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (266424 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 521517      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 210 MB  3.4 MB/s
     http_req_blocked...............: avg=33.3µs   min=972ns   med=2.21µs  max=84.35ms  p(90)=3.72µs   p(95)=4.85µs   p(99.9)=8.51ms  
     http_req_connecting............: avg=30.05µs  min=0s      med=0s      max=84.2ms   p(90)=0s       p(95)=0s       p(99.9)=8.16ms  
     http_req_duration..............: avg=81.09ms  min=1.63ms  med=74.94ms max=362.27ms p(90)=157.43ms p(95)=175.72ms p(99.9)=239.52ms
       { expected_response:true }...: avg=81.09ms  min=1.63ms  med=74.94ms max=362.27ms p(90)=157.43ms p(95)=175.72ms p(99.9)=239.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174839
     http_req_receiving.............: avg=464.52µs min=27.77µs med=54.69µs max=106ms    p(90)=257µs    p(95)=419.79µs p(99.9)=47.88ms 
     http_req_sending...............: avg=92.54µs  min=5.27µs  med=9.66µs  max=94.06ms  p(90)=18.42µs  p(95)=131.42µs p(99.9)=15.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.54ms  min=1.58ms  med=74.54ms max=358.71ms p(90)=156.35ms p(95)=174.07ms p(99.9)=233.77ms
     http_reqs......................: 174839  2820.547283/s
     iteration_duration.............: avg=82ms     min=2.27ms  med=76.05ms max=398.5ms  p(90)=158.09ms p(95)=176.49ms p(99.9)=243.01ms
     iterations.....................: 173839  2804.415029/s
     success_rate...................: 100.00% ✓ 173839      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 377085      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 152 MB  2.4 MB/s
     http_req_blocked...............: avg=18.47µs  min=992ns   med=2.24µs   max=91.51ms  p(90)=3.63µs   p(95)=4.58µs   p(99.9)=2.49ms  
     http_req_connecting............: avg=14.9µs   min=0s      med=0s       max=91.47ms  p(90)=0s       p(95)=0s       p(99.9)=2.36ms  
     http_req_duration..............: avg=112.35ms min=2.38ms  med=103.53ms max=844.12ms p(90)=220.26ms p(95)=258.2ms  p(99.9)=484.02ms
       { expected_response:true }...: avg=112.35ms min=2.38ms  med=103.53ms max=844.12ms p(90)=220.26ms p(95)=258.2ms  p(99.9)=484.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126695
     http_req_receiving.............: avg=2.23ms   min=50.76µs med=114.24µs max=595.58ms p(90)=1.48ms   p(95)=5.6ms    p(99.9)=170.4ms 
     http_req_sending...............: avg=66.05µs  min=5.22µs  med=9.74µs   max=154.66ms p(90)=18.22µs  p(95)=119.4µs  p(99.9)=8.96ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.06ms min=2.28ms  med=102.38ms max=742.74ms p(90)=216.38ms p(95)=250.81ms p(99.9)=422.81ms
     http_reqs......................: 126695  2021.00745/s
     iteration_duration.............: avg=113.53ms min=3.68ms  med=104.93ms max=844.35ms p(90)=220.96ms p(95)=259.08ms p(99.9)=485.18ms
     iterations.....................: 125695  2005.055696/s
     success_rate...................: 100.00% ✓ 125695      ✗ 0     
     vus............................: 89      min=0         max=498 
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

     checks.........................: 100.00% ✓ 220692      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=7.23µs   min=1.04µs med=2.28µs   max=66.05ms  p(90)=3.86µs   p(95)=4.76µs   p(99.9)=569.85µs
     http_req_connecting............: avg=4.17µs   min=0s     med=0s       max=66ms     p(90)=0s       p(95)=0s       p(99.9)=509.11µs
     http_req_duration..............: avg=191.33ms min=2.08ms med=193.4ms  max=587.17ms p(90)=354.13ms p(95)=381.74ms p(99.9)=512.81ms
       { expected_response:true }...: avg=191.33ms min=2.08ms med=193.4ms  max=587.17ms p(90)=354.13ms p(95)=381.74ms p(99.9)=512.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74564
     http_req_receiving.............: avg=159.31µs min=28.1µs med=61µs     max=297.52ms p(90)=96.57µs  p(95)=110.99µs p(99.9)=3.52ms  
     http_req_sending...............: avg=28.26µs  min=5.27µs med=10.51µs  max=14.46ms  p(90)=16.69µs  p(95)=20.42µs  p(99.9)=3.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.15ms min=2.01ms med=193.17ms max=587.11ms p(90)=353.93ms p(95)=381.63ms p(99.9)=512.59ms
     http_reqs......................: 74564   1192.710202/s
     iteration_duration.............: avg=194.17ms min=3.91ms med=196.29ms max=587.33ms p(90)=355.12ms p(95)=382.5ms  p(99.9)=513.3ms 
     iterations.....................: 73564   1176.714411/s
     success_rate...................: 100.00% ✓ 73564       ✗ 0    
     vus............................: 83      min=0         max=493
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

     checks.........................: 100.00% ✓ 92910      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   591 kB/s
     http_req_blocked...............: avg=11.15µs  min=1.14µs  med=3.01µs   max=43.25ms p(90)=4.82µs   p(95)=5.85µs   p(99.9)=1.86ms
     http_req_connecting............: avg=6.94µs   min=0s      med=0s       max=43.18ms p(90)=0s       p(95)=0s       p(99.9)=1.77ms
     http_req_duration..............: avg=449.16ms min=4ms     med=418.26ms max=1.86s   p(90)=888.09ms p(95)=965.67ms p(99.9)=1.4s  
       { expected_response:true }...: avg=449.16ms min=4ms     med=418.26ms max=1.86s   p(90)=888.09ms p(95)=965.67ms p(99.9)=1.4s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31970
     http_req_receiving.............: avg=90.24µs  min=31.71µs med=78.76µs  max=31.67ms p(90)=116.08µs p(95)=129.96µs p(99.9)=1.15ms
     http_req_sending...............: avg=28.7µs   min=5.25µs  med=13.74µs  max=82.29ms p(90)=21.37µs  p(95)=24.77µs  p(99.9)=2.82ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=449.04ms min=3.91ms  med=418.18ms max=1.86s   p(90)=887.98ms p(95)=965.58ms p(99.9)=1.4s  
     http_reqs......................: 31970   492.589403/s
     iteration_duration.............: avg=463.87ms min=30.84ms med=437.41ms max=1.86s   p(90)=891.7ms  p(95)=968.86ms p(99.9)=1.4s  
     iterations.....................: 30970   477.18154/s
     success_rate...................: 100.00% ✓ 30970      ✗ 0    
     vus............................: 52      min=0        max=499
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

     checks.........................: 100.00% ✓ 44391      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=15.2µs   min=1.19µs  med=3.27µs   max=3.9ms    p(90)=4.98µs   p(95)=6.7µs    p(99.9)=2.63ms  
     http_req_connecting............: avg=10.39µs  min=0s      med=0s       max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=2.6ms   
     http_req_duration..............: avg=903.4ms  min=6.16ms  med=795.21ms max=20.32s   p(90)=1.52s    p(95)=1.71s    p(99.9)=18.72s  
       { expected_response:true }...: avg=903.4ms  min=6.16ms  med=795.21ms max=20.32s   p(90)=1.52s    p(95)=1.71s    p(99.9)=18.72s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15797
     http_req_receiving.............: avg=99.95µs  min=34.58µs med=91.29µs  max=41.55ms  p(90)=128.44µs p(95)=142.07µs p(99.9)=760.93µs
     http_req_sending...............: avg=42.02µs  min=6.24µs  med=16.17µs  max=124.98ms p(90)=22.97µs  p(95)=27.83µs  p(99.9)=3.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=903.26ms min=6.07ms  med=795.1ms  max=20.32s   p(90)=1.52s    p(95)=1.71s    p(99.9)=18.72s  
     http_reqs......................: 15797   232.329079/s
     iteration_duration.............: avg=964.51ms min=46.05ms med=865.85ms max=20.32s   p(90)=1.54s    p(95)=1.72s    p(99.9)=18.74s  
     iterations.....................: 14797   217.621915/s
     success_rate...................: 100.00% ✓ 14797      ✗ 0    
     vus............................: 15      min=0        max=500
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

     checks.........................: 100.00% ✓ 41805      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=18.86µs  min=1.21µs  med=3.33µs   max=16.15ms  p(90)=4.94µs   p(95)=6.55µs   p(99.9)=3.09ms 
     http_req_connecting............: avg=13.83µs  min=0s      med=0s       max=16.08ms  p(90)=0s       p(95)=0s       p(99.9)=3.06ms 
     http_req_duration..............: avg=431.69ms min=8.48ms  med=454.29ms max=1.29s    p(90)=757.95ms p(95)=805.77ms p(99.9)=1.14s  
       { expected_response:true }...: avg=431.69ms min=8.48ms  med=454.29ms max=1.29s    p(90)=757.95ms p(95)=805.77ms p(99.9)=1.14s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14935
     http_req_receiving.............: avg=269.58µs min=37.82µs med=90.88µs  max=200.75ms p(90)=131.36µs p(95)=144.09µs p(99.9)=80.28ms
     http_req_sending...............: avg=26.31µs  min=6.24µs  med=16.29µs  max=17.65ms  p(90)=22.25µs  p(95)=27.4µs   p(99.9)=2.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=431.4ms  min=8.35ms  med=453.99ms max=1.29s    p(90)=757.87ms p(95)=805.64ms p(99.9)=1.14s  
     http_reqs......................: 14935   200.371495/s
     iteration_duration.............: avg=462.57ms min=11.22ms med=496.46ms max=1.31s    p(90)=765.92ms p(95)=809.04ms p(99.9)=1.14s  
     iterations.....................: 13935   186.955258/s
     success_rate...................: 100.00% ✓ 13935      ✗ 0    
     vus............................: 69      min=0        max=499
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

     checks.........................: 100.00% ✓ 398496      ✗ 0     
     data_received..................: 12 GB   188 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=17.26µs  min=1.03µs  med=2.41µs   max=56.42ms  p(90)=4.09µs   p(95)=5.27µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=13.99µs  min=0s      med=0s       max=56.26ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=106.3ms  min=1.64ms  med=100.44ms max=356.55ms p(90)=204.62ms p(95)=222.14ms p(99.9)=282.14ms
       { expected_response:true }...: avg=106.3ms  min=1.64ms  med=100.44ms max=356.55ms p(90)=204.62ms p(95)=222.14ms p(99.9)=282.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133832
     http_req_receiving.............: avg=196.76µs min=30.06µs med=61.88µs  max=139.54ms p(90)=167.34µs p(95)=405.95µs p(99.9)=22.94ms 
     http_req_sending...............: avg=72.28µs  min=5.42µs  med=10.85µs  max=162.05ms p(90)=21.12µs  p(95)=135.07µs p(99.9)=9.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.03ms min=1.59ms  med=100.18ms max=356.36ms p(90)=204.2ms  p(95)=221.54ms p(99.9)=280.13ms
     http_reqs......................: 133832  2153.657203/s
     iteration_duration.............: avg=107.38ms min=4.42ms  med=101.71ms max=389.12ms p(90)=205.17ms p(95)=222.67ms p(99.9)=282.98ms
     iterations.....................: 132832  2137.564959/s
     success_rate...................: 100.00% ✓ 132832      ✗ 0     
     vus............................: 63      min=0         max=497 
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

     checks.........................: 100.00% ✓ 351477      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=15.25µs  min=1.01µs med=2.41µs   max=53.34ms  p(90)=4.1µs    p(95)=5.15µs   p(99.9)=2.04ms  
     http_req_connecting............: avg=12.1µs   min=0s     med=0s       max=53.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.97ms  
     http_req_duration..............: avg=120.47ms min=1.82ms med=110.2ms  max=969.95ms p(90)=230.17ms p(95)=263.53ms p(99.9)=623.71ms
       { expected_response:true }...: avg=120.47ms min=1.82ms med=110.2ms  max=969.95ms p(90)=230.17ms p(95)=263.53ms p(99.9)=623.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118159
     http_req_receiving.............: avg=1.49ms   min=52.2µs med=114.62µs max=395.54ms p(90)=1.56ms   p(95)=3.88ms   p(99.9)=126.07ms
     http_req_sending...............: avg=60.6µs   min=5.26µs med=10.35µs  max=259.21ms p(90)=20.46µs  p(95)=119.83µs p(99.9)=7.8ms   
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.91ms min=1.71ms med=108.98ms max=969.85ms p(90)=227.44ms p(95)=259.72ms p(99.9)=620.3ms 
     http_reqs......................: 118159  1896.221607/s
     iteration_duration.............: avg=121.78ms min=2.73ms med=111.82ms max=970.16ms p(90)=230.96ms p(95)=264.25ms p(99.9)=624.74ms
     iterations.....................: 117159  1880.173556/s
     success_rate...................: 100.00% ✓ 117159      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 87882      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 36 MB   556 kB/s
     http_req_blocked...............: avg=8.11µs   min=1.17µs  med=3.19µs   max=2.93ms   p(90)=5µs      p(95)=5.97µs   p(99.9)=682.08µs
     http_req_connecting............: avg=3.93µs   min=0s      med=0s       max=2.87ms   p(90)=0s       p(95)=0s       p(99.9)=651.17µs
     http_req_duration..............: avg=474.33ms min=4.17ms  med=440.54ms max=1.97s    p(90)=931ms    p(95)=1.02s    p(99.9)=1.52s   
       { expected_response:true }...: avg=474.33ms min=4.17ms  med=440.54ms max=1.97s    p(90)=931ms    p(95)=1.02s    p(99.9)=1.52s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30294
     http_req_receiving.............: avg=100.26µs min=29.82µs med=83.37µs  max=173.39ms p(90)=121.06µs p(95)=134.71µs p(99.9)=1.02ms  
     http_req_sending...............: avg=35.44µs  min=5.49µs  med=14.99µs  max=106.1ms  p(90)=22.38µs  p(95)=25.85µs  p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=474.19ms min=4.08ms  med=440.45ms max=1.97s    p(90)=930.85ms p(95)=1.02s    p(99.9)=1.52s   
     http_reqs......................: 30294   463.479173/s
     iteration_duration.............: avg=490.73ms min=22.34ms med=459.58ms max=1.98s    p(90)=936.05ms p(95)=1.02s    p(99.9)=1.52s   
     iterations.....................: 29294   448.179801/s
     success_rate...................: 100.00% ✓ 29294      ✗ 0    
     vus............................: 73      min=0        max=496
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

     checks.........................: 100.00% ✓ 42711      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   268 kB/s
     http_req_blocked...............: avg=14.5µs   min=1.28µs  med=3.55µs   max=14.63ms p(90)=5.41µs   p(95)=7.24µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=8.94µs   min=0s      med=0s       max=14.57ms p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=958.78ms min=6.24ms  med=853.2ms  max=5.72s   p(90)=1.89s    p(95)=2.1s     p(99.9)=5s      
       { expected_response:true }...: avg=958.78ms min=6.24ms  med=853.2ms  max=5.72s   p(90)=1.89s    p(95)=2.1s     p(99.9)=5s      
     http_req_failed................: 0.00%   ✓ 0          ✗ 15237
     http_req_receiving.............: avg=114.28µs min=35.83µs med=99.14µs  max=62.37ms p(90)=138.66µs p(95)=150.91µs p(99.9)=837.07µs
     http_req_sending...............: avg=30.85µs  min=6.41µs  med=17.91µs  max=50.5ms  p(90)=24.01µs  p(95)=28.57µs  p(99.9)=2.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=958.64ms min=6.13ms  med=853.08ms max=5.72s   p(90)=1.89s    p(95)=2.1s     p(99.9)=5s      
     http_reqs......................: 15237   223.131257/s
     iteration_duration.............: avg=1.02s    min=56.39ms med=953.23ms max=5.73s   p(90)=1.91s    p(95)=2.11s    p(99.9)=5.04s   
     iterations.....................: 14237   208.487216/s
     success_rate...................: 100.00% ✓ 14237      ✗ 0    
     vus............................: 65      min=0        max=500
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

     checks.........................: 100.00% ✓ 40014      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=16.29µs  min=1.31µs  med=3.55µs   max=4.19ms   p(90)=5.31µs   p(95)=7.03µs   p(99.9)=2.77ms  
     http_req_connecting............: avg=10.81µs  min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=2.74ms  
     http_req_duration..............: avg=1.01s    min=8.73ms  med=924.37ms max=4.16s    p(90)=2.07s    p(95)=2.21s    p(99.9)=3.68s   
       { expected_response:true }...: avg=1.01s    min=8.73ms  med=924.37ms max=4.16s    p(90)=2.07s    p(95)=2.21s    p(99.9)=3.68s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14338
     http_req_receiving.............: avg=116.19µs min=37.12µs med=97.9µs   max=103.1ms  p(90)=138.21µs p(95)=150.98µs p(99.9)=883.21µs
     http_req_sending...............: avg=49.08µs  min=6.28µs  med=17.86µs  max=137.47ms p(90)=23.74µs  p(95)=28.48µs  p(99.9)=5.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.01s    min=8.59ms  med=924.1ms  max=4.16s    p(90)=2.07s    p(95)=2.21s    p(99.9)=3.68s   
     http_reqs......................: 14338   204.721668/s
     iteration_duration.............: avg=1.09s    min=31.82ms med=1.02s    max=4.17s    p(90)=2.09s    p(95)=2.22s    p(99.9)=3.72s   
     iterations.....................: 13338   190.44341/s
     success_rate...................: 100.00% ✓ 13338      ✗ 0    
     vus............................: 60      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

