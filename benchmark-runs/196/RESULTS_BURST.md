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
| hive-router | v0.0.49 | 2,682 | 2,811 | 2,656 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,061 | 2,090 | 2,037 | 0.9% |  |
| cosmo | 0.307.0 | 1,197 | 1,205 | 1,181 | 0.8% | non-compatible response (7 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 493 | 498 | 489 | 0.7% |  |
| hive-gateway | 2.5.25 | 231 | 234 | 228 | 0.8% |  |
| apollo-gateway | 2.13.3 | 202 | 206 | 201 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (15838 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (480115 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,327 | 2,406 | 2,262 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,880 | 1,916 | 1,738 | 2.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 470 | 476 | 463 | 1.0% |  |
| hive-gateway | 2.5.25 | 227 | 230 | 225 | 0.8% |  |
| apollo-gateway | 2.13.3 | 209 | 212 | 207 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (21559 across 9/9 runs) |
| cosmo | — | — | — | — | — | benchmark run failed |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (206143 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 494685      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=24.05µs  min=972ns   med=2.2µs   max=75.77ms  p(90)=3.5µs    p(95)=4.48µs   p(99.9)=3.98ms  
     http_req_connecting............: avg=20.77µs  min=0s      med=0s      max=75.71ms  p(90)=0s       p(95)=0s       p(99.9)=3.84ms  
     http_req_duration..............: avg=85.64ms  min=1.61ms  med=79.92ms max=273.19ms p(90)=165.59ms p(95)=179.36ms p(99.9)=224.93ms
       { expected_response:true }...: avg=85.64ms  min=1.61ms  med=79.92ms max=273.19ms p(90)=165.59ms p(95)=179.36ms p(99.9)=224.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165895
     http_req_receiving.............: avg=332.13µs min=28.42µs med=55.06µs max=165.11ms p(90)=234.51µs p(95)=407.11µs p(99.9)=35.92ms 
     http_req_sending...............: avg=80.89µs  min=5.33µs  med=9.77µs  max=187.35ms p(90)=17.89µs  p(95)=130.56µs p(99.9)=12.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.23ms  min=1.53ms  med=79.59ms max=252.57ms p(90)=164.99ms p(95)=178.58ms p(99.9)=222.13ms
     http_reqs......................: 165895  2682.118726/s
     iteration_duration.............: avg=86.46ms  min=2.24ms  med=80.79ms max=412.06ms p(90)=166.07ms p(95)=179.84ms p(99.9)=226.44ms
     iterations.....................: 164895  2665.951158/s
     success_rate...................: 100.00% ✓ 164895      ✗ 0     
     vus............................: 23      min=0         max=500 
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

     checks.........................: 100.00% ✓ 384444      ✗ 0     
     data_received..................: 11 GB   181 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=16.68µs  min=1µs     med=2.55µs   max=51.73ms  p(90)=3.93µs   p(95)=4.82µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=13.36µs  min=0s      med=0s       max=51.57ms  p(90)=0s       p(95)=0s       p(99.9)=1.94ms  
     http_req_duration..............: avg=110.19ms min=2.33ms  med=101.88ms max=643.84ms p(90)=216.78ms p(95)=250.67ms p(99.9)=422.08ms
       { expected_response:true }...: avg=110.19ms min=2.33ms  med=101.88ms max=643.84ms p(90)=216.78ms p(95)=250.67ms p(99.9)=422.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129148
     http_req_receiving.............: avg=1.88ms   min=52.82µs med=114.2µs  max=416.62ms p(90)=1.28ms   p(95)=4.6ms    p(99.9)=131.94ms
     http_req_sending...............: avg=67.29µs  min=5.3µs   med=10.04µs  max=162.2ms  p(90)=17.72µs  p(95)=123.34µs p(99.9)=8.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.24ms min=2.25ms  med=100.73ms max=571.15ms p(90)=213.21ms p(95)=244.2ms  p(99.9)=401.04ms
     http_reqs......................: 129148  2061.282455/s
     iteration_duration.............: avg=111.33ms min=3.84ms  med=103.35ms max=644.01ms p(90)=217.48ms p(95)=251.34ms p(99.9)=422.46ms
     iterations.....................: 128148  2045.321832/s
     success_rate...................: 100.00% ✓ 128148      ✗ 0     
     vus............................: 86      min=0         max=497 
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

     checks.........................: 100.00% ✓ 221544      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.08µs   min=1.08µs  med=2.45µs   max=21.21ms  p(90)=4.03µs   p(95)=4.96µs   p(99.9)=486.62µs
     http_req_connecting............: avg=2.87µs   min=0s      med=0s       max=19.07ms  p(90)=0s       p(95)=0s       p(99.9)=364.43µs
     http_req_duration..............: avg=190.6ms  min=2.08ms  med=191.6ms  max=551.19ms p(90)=355.34ms p(95)=381.77ms p(99.9)=482.05ms
       { expected_response:true }...: avg=190.6ms  min=2.08ms  med=191.6ms  max=551.19ms p(90)=355.34ms p(95)=381.77ms p(99.9)=482.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74848
     http_req_receiving.............: avg=79.9µs   min=30.43µs med=60.69µs  max=52.31ms  p(90)=95.22µs  p(95)=109.87µs p(99.9)=2.03ms  
     http_req_sending...............: avg=30.36µs  min=5.29µs  med=10.68µs  max=143.91ms p(90)=16.57µs  p(95)=20.54µs  p(99.9)=3.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.49ms min=2.01ms  med=191.49ms max=551.11ms p(90)=355.26ms p(95)=381.7ms  p(99.9)=481.99ms
     http_reqs......................: 74848   1197.408476/s
     iteration_duration.............: avg=193.43ms min=4.35ms  med=194.49ms max=551.42ms p(90)=356.26ms p(95)=382.43ms p(99.9)=482.45ms
     iterations.....................: 73848   1181.410608/s
     success_rate...................: 100.00% ✓ 73848       ✗ 0    
     vus............................: 80      min=0         max=492
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

     checks.........................: 100.00% ✓ 93165      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   592 kB/s
     http_req_blocked...............: avg=9.36µs   min=1.19µs  med=3.12µs   max=4.61ms   p(90)=4.89µs   p(95)=5.95µs   p(99.9)=1.85ms 
     http_req_connecting............: avg=5.18µs   min=0s      med=0s       max=4.53ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms 
     http_req_duration..............: avg=447.75ms min=4.07ms  med=418.65ms max=2.06s    p(90)=885.72ms p(95)=959.11ms p(99.9)=1.47s  
       { expected_response:true }...: avg=447.75ms min=4.07ms  med=418.65ms max=2.06s    p(90)=885.72ms p(95)=959.11ms p(99.9)=1.47s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 32055
     http_req_receiving.............: avg=91.07µs  min=32.55µs med=78.1µs   max=155.56ms p(90)=114.59µs p(95)=128.14µs p(99.9)=876.5µs
     http_req_sending...............: avg=23.31µs  min=5.77µs  med=13.81µs  max=8.17ms   p(90)=21.4µs   p(95)=24.86µs  p(99.9)=2.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=447.64ms min=4ms     med=418.54ms max=2.06s    p(90)=885.62ms p(95)=959.01ms p(99.9)=1.47s  
     http_reqs......................: 32055   493.488672/s
     iteration_duration.............: avg=462.39ms min=21.23ms med=437.47ms max=2.06s    p(90)=890.43ms p(95)=963ms    p(99.9)=1.48s  
     iterations.....................: 31055   478.093611/s
     success_rate...................: 100.00% ✓ 31055      ✗ 0    
     vus............................: 54      min=0        max=499
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

     checks.........................: 100.00% ✓ 44544      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=13.6µs   min=1.29µs  med=3.47µs   max=3.32ms  p(90)=5.36µs   p(95)=6.91µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=8.34µs   min=0s      med=0s       max=3.28ms  p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=901.71ms min=6.18ms  med=785.79ms max=18.16s  p(90)=1.56s    p(95)=1.67s    p(99.9)=16.08s  
       { expected_response:true }...: avg=901.71ms min=6.18ms  med=785.79ms max=18.16s  p(90)=1.56s    p(95)=1.67s    p(99.9)=16.08s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15848
     http_req_receiving.............: avg=105.28µs min=37.94µs med=96.5µs   max=36.58ms p(90)=137.15µs p(95)=150.84µs p(99.9)=770.21µs
     http_req_sending...............: avg=30.84µs  min=6.6µs   med=17.9µs   max=64.22ms p(90)=24.03µs  p(95)=28.6µs   p(99.9)=2.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=901.57ms min=6.09ms  med=785.67ms max=18.16s  p(90)=1.56s    p(95)=1.67s    p(99.9)=16.08s  
     http_reqs......................: 15848   231.99514/s
     iteration_duration.............: avg=962.46ms min=51.58ms med=858.82ms max=18.16s  p(90)=1.57s    p(95)=1.69s    p(99.9)=16.09s  
     iterations.....................: 14848   217.356375/s
     success_rate...................: 100.00% ✓ 14848      ✗ 0    
     vus............................: 74      min=0        max=498
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

     checks.........................: 100.00% ✓ 42312      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=12.2µs   min=1.25µs  med=3.4µs    max=2.73ms   p(90)=5.1µs    p(95)=6.64µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=7.07µs   min=0s      med=0s       max=2.7ms    p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=454.69ms min=8.46ms  med=492.26ms max=1.37s    p(90)=784.4ms  p(95)=903.18ms p(99.9)=1.26s   
       { expected_response:true }...: avg=454.69ms min=8.46ms  med=492.26ms max=1.37s    p(90)=784.4ms  p(95)=903.18ms p(99.9)=1.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15104
     http_req_receiving.............: avg=116.19µs min=34.09µs med=90.22µs  max=103.61ms p(90)=130.55µs p(95)=144.34µs p(99.9)=951.94µs
     http_req_sending...............: avg=39.68µs  min=6.06µs  med=16.56µs  max=140.14ms p(90)=22.84µs  p(95)=27.91µs  p(99.9)=3.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=454.53ms min=8.37ms  med=492.12ms max=1.37s    p(90)=784.29ms p(95)=903.07ms p(99.9)=1.25s   
     http_reqs......................: 15104   202.55309/s
     iteration_duration.............: avg=486.83ms min=14.68ms med=518.75ms max=1.38s    p(90)=799.26ms p(95)=909.45ms p(99.9)=1.26s   
     iterations.....................: 14104   189.142531/s
     success_rate...................: 100.00% ✓ 14104      ✗ 0    
     vus............................: 70      min=0        max=500
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

     checks.........................: 100.00% ✓ 430380      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=27.65µs  min=1.05µs  med=3.01µs  max=66.53ms  p(90)=4.91µs   p(95)=6.27µs   p(99.9)=2.98ms  
     http_req_connecting............: avg=23.54µs  min=0s      med=0s      max=66.45ms  p(90)=0s       p(95)=0s       p(99.9)=2.92ms  
     http_req_duration..............: avg=98.42ms  min=1.63ms  med=92.5ms  max=314.24ms p(90)=190.98ms p(95)=208.94ms p(99.9)=260.72ms
       { expected_response:true }...: avg=98.42ms  min=1.63ms  med=92.5ms  max=314.24ms p(90)=190.98ms p(95)=208.94ms p(99.9)=260.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144460
     http_req_receiving.............: avg=289.85µs min=27.55µs med=62.2µs  max=87.1ms   p(90)=198.59µs p(95)=446.52µs p(99.9)=32.1ms  
     http_req_sending...............: avg=87.4µs   min=5.48µs  med=11.66µs max=202.42ms p(90)=22.67µs  p(95)=146.09µs p(99.9)=12.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.05ms  min=1.55ms  med=92.23ms max=313.59ms p(90)=190.2ms  p(95)=207.81ms p(99.9)=257.7ms 
     http_reqs......................: 144460  2327.275818/s
     iteration_duration.............: avg=99.41ms  min=5.12ms  med=93.64ms max=349.74ms p(90)=191.61ms p(95)=209.52ms p(99.9)=261.99ms
     iterations.....................: 143460  2311.165644/s
     success_rate...................: 100.00% ✓ 143460      ✗ 0     
     vus............................: 62      min=0         max=497 
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

     checks.........................: 100.00% ✓ 348183      ✗ 0     
     data_received..................: 10 GB   165 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=12.43µs  min=1.01µs  med=2.25µs   max=70.74ms  p(90)=3.7µs    p(95)=4.71µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=9.54µs   min=0s      med=0s       max=70.7ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=121.71ms min=1.8ms   med=111.44ms max=916.36ms p(90)=233.19ms p(95)=265.8ms  p(99.9)=641.72ms
       { expected_response:true }...: avg=121.71ms min=1.8ms   med=111.44ms max=916.36ms p(90)=233.19ms p(95)=265.8ms  p(99.9)=641.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117061
     http_req_receiving.............: avg=1.6ms    min=52.82µs med=113.52µs max=648.06ms p(90)=1.61ms   p(95)=4.13ms   p(99.9)=156.75ms
     http_req_sending...............: avg=51.92µs  min=5.23µs  med=9.76µs   max=85.31ms  p(90)=17.73µs  p(95)=79.59µs  p(99.9)=7.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.05ms min=1.67ms  med=110.38ms max=916.22ms p(90)=230.69ms p(95)=260.47ms p(99.9)=637.62ms
     http_reqs......................: 117061  1880.515197/s
     iteration_duration.............: avg=123.01ms min=3.05ms  med=112.92ms max=916.6ms  p(90)=233.93ms p(95)=266.52ms p(99.9)=642.04ms
     iterations.....................: 116061  1864.450793/s
     success_rate...................: 100.00% ✓ 116061      ✗ 0     
     vus............................: 69      min=0         max=495 
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

     checks.........................: 100.00% ✓ 88953      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   564 kB/s
     http_req_blocked...............: avg=9.76µs   min=1.11µs  med=3.15µs   max=11.95ms  p(90)=4.93µs   p(95)=5.9µs    p(99.9)=1.71ms  
     http_req_connecting............: avg=5.43µs   min=0s      med=0s       max=11.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=468.84ms min=4.14ms  med=433.03ms max=1.83s    p(90)=924.78ms p(95)=1s       p(99.9)=1.49s   
       { expected_response:true }...: avg=468.84ms min=4.14ms  med=433.03ms max=1.83s    p(90)=924.78ms p(95)=1s       p(99.9)=1.49s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30651
     http_req_receiving.............: avg=94.56µs  min=32.63µs med=81.95µs  max=115.04ms p(90)=118.65µs p(95)=132.41µs p(99.9)=709.49µs
     http_req_sending...............: avg=26.29µs  min=5.44µs  med=14.64µs  max=64.07ms  p(90)=21.92µs  p(95)=25.05µs  p(99.9)=2.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=468.72ms min=4.05ms  med=432.89ms max=1.83s    p(90)=924.7ms  p(95)=1s       p(99.9)=1.49s   
     http_reqs......................: 30651   470.074109/s
     iteration_duration.............: avg=484.87ms min=21.9ms  med=452.48ms max=1.84s    p(90)=930.88ms p(95)=1.01s    p(99.9)=1.49s   
     iterations.....................: 29651   454.73777/s
     success_rate...................: 100.00% ✓ 29651      ✗ 0    
     vus............................: 66      min=0        max=496
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

     checks.........................: 100.00% ✓ 43818      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=16.33µs  min=1.28µs  med=3.73µs   max=5.72ms  p(90)=5.7µs    p(95)=7.45µs  p(99.9)=2.56ms 
     http_req_connecting............: avg=10.81µs  min=0s      med=0s       max=5.65ms  p(90)=0s       p(95)=0s      p(99.9)=2.52ms 
     http_req_duration..............: avg=934.39ms min=6.38ms  med=841.27ms max=5.37s   p(90)=1.86s    p(95)=2.04s   p(99.9)=4.72s  
       { expected_response:true }...: avg=934.39ms min=6.38ms  med=841.27ms max=5.37s   p(90)=1.86s    p(95)=2.04s   p(99.9)=4.72s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15606
     http_req_receiving.............: avg=114.5µs  min=33.49µs med=102.27µs max=42.75ms p(90)=143.08µs p(95)=156.4µs p(99.9)=944.6µs
     http_req_sending...............: avg=37.08µs  min=6.42µs  med=18.99µs  max=66.13ms p(90)=25.35µs  p(95)=30.6µs  p(99.9)=2.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=934.24ms min=6.27ms  med=841.13ms max=5.37s   p(90)=1.86s    p(95)=2.04s   p(99.9)=4.72s  
     http_reqs......................: 15606   227.940279/s
     iteration_duration.............: avg=998.4ms  min=62.28ms med=934.23ms max=5.37s   p(90)=1.88s    p(95)=2.06s   p(99.9)=4.74s  
     iterations.....................: 14606   213.33434/s
     success_rate...................: 100.00% ✓ 14606      ✗ 0    
     vus............................: 73      min=0        max=500
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

     checks.........................: 100.00% ✓ 40872      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=16.34µs  min=1.2µs   med=3.52µs   max=21.7ms  p(90)=5.38µs   p(95)=7.37µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=10.61µs  min=0s      med=0s       max=21.63ms p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=997.2ms  min=8.61ms  med=912.71ms max=4.02s   p(90)=2.02s    p(95)=2.14s    p(99.9)=3.48s   
       { expected_response:true }...: avg=997.2ms  min=8.61ms  med=912.71ms max=4.02s   p(90)=2.02s    p(95)=2.14s    p(99.9)=3.48s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14624
     http_req_receiving.............: avg=105.39µs min=35.27µs med=96.86µs  max=42.92ms p(90)=137.48µs p(95)=150.57µs p(99.9)=752.51µs
     http_req_sending...............: avg=30.36µs  min=5.89µs  med=17.88µs  max=54.59ms p(90)=23.98µs  p(95)=28.86µs  p(99.9)=3.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=997.07ms min=8.51ms  med=912.6ms  max=4.02s   p(90)=2.02s    p(95)=2.14s    p(99.9)=3.48s   
     http_reqs......................: 14624   209.299577/s
     iteration_duration.............: avg=1.07s    min=61.07ms med=1s       max=4.02s   p(90)=2.03s    p(95)=2.15s    p(99.9)=3.51s   
     iterations.....................: 13624   194.987516/s
     success_rate...................: 100.00% ✓ 13624      ✗ 0    
     vus............................: 27      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

