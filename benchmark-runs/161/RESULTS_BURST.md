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
| hive-router | v0.0.49 | 2,814 | 2,934 | 2,768 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,120 | 2,167 | 2,100 | 1.1% |  |
| cosmo | 0.307.0 | 1,207 | 1,207 | 1,200 | 0.4% | non-compatible response (10 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 493 | 500 | 487 | 0.9% |  |
| hive-gateway | 2.5.25 | 227 | 230 | 225 | 0.7% |  |
| apollo-gateway | 2.13.3 | 199 | 203 | 197 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (35795 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (484056 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,199 | 2,315 | 2,152 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,912 | 1,951 | 1,877 | 1.2% |  |
| cosmo | 0.307.0 | 1,039 | 1,074 | 1,033 | 1.8% | non-compatible response (10 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 475 | 485 | 469 | 1.0% |  |
| hive-gateway | 2.5.25 | 226 | 229 | 223 | 0.8% |  |
| apollo-gateway | 2.13.3 | 210 | 214 | 208 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (27268 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (265363 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 519876      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=34.37µs min=962ns   med=2.68µs  max=85.35ms  p(90)=4.37µs   p(95)=5.61µs   p(99.9)=7.43ms  
     http_req_connecting............: avg=30.87µs min=0s      med=0s      max=85.15ms  p(90)=0s       p(95)=0s       p(99.9)=7.28ms  
     http_req_duration..............: avg=81.37ms min=1.57ms  med=75.51ms max=321.59ms p(90)=157.3ms  p(95)=177.26ms p(99.9)=247.45ms
       { expected_response:true }...: avg=81.37ms min=1.57ms  med=75.51ms max=321.59ms p(90)=157.3ms  p(95)=177.26ms p(99.9)=247.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174292
     http_req_receiving.............: avg=472.3µs min=28.02µs med=56.63µs max=170.67ms p(90)=266.4µs  p(95)=443.3µs  p(99.9)=52.39ms 
     http_req_sending...............: avg=98.67µs min=5.46µs  med=10.39µs max=107.28ms p(90)=20.12µs  p(95)=140.75µs p(99.9)=16.8ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.8ms  min=1.52ms  med=75.15ms max=313.57ms p(90)=156.32ms p(95)=175.17ms p(99.9)=240.53ms
     http_reqs......................: 174292  2814.817276/s
     iteration_duration.............: avg=82.26ms min=2.26ms  med=76.45ms max=409.58ms p(90)=158.19ms p(95)=178.58ms p(99.9)=250.48ms
     iterations.....................: 173292  2798.667267/s
     success_rate...................: 100.00% ✓ 173292      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 395856      ✗ 0     
     data_received..................: 12 GB   186 MB/s
     data_sent......................: 160 MB  2.5 MB/s
     http_req_blocked...............: avg=16.57µs  min=982ns   med=2.38µs   max=54.86ms  p(90)=3.86µs   p(95)=4.81µs   p(99.9)=2.09ms  
     http_req_connecting............: avg=13.41µs  min=0s      med=0s       max=54.78ms  p(90)=0s       p(95)=0s       p(99.9)=2.03ms  
     http_req_duration..............: avg=107.04ms min=2.37ms  med=98.7ms   max=734.11ms p(90)=206.26ms p(95)=240.37ms p(99.9)=435.4ms 
       { expected_response:true }...: avg=107.04ms min=2.37ms  med=98.7ms   max=734.11ms p(90)=206.26ms p(95)=240.37ms p(99.9)=435.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 132952
     http_req_receiving.............: avg=2.01ms   min=51.14µs med=112.06µs max=526.04ms p(90)=1.41ms   p(95)=5.37ms   p(99.9)=147.3ms 
     http_req_sending...............: avg=67.08µs  min=5.19µs  med=9.9µs    max=185.04ms p(90)=18.13µs  p(95)=123.97µs p(99.9)=9.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.96ms min=2.27ms  med=97.56ms  max=681.35ms p(90)=202.82ms p(95)=232.88ms p(99.9)=399.46ms
     http_reqs......................: 132952  2120.673709/s
     iteration_duration.............: avg=108.12ms min=3.88ms  med=99.93ms  max=734.32ms p(90)=206.95ms p(95)=241.23ms p(99.9)=436.99ms
     iterations.....................: 131952  2104.723037/s
     success_rate...................: 100.00% ✓ 131952      ✗ 0     
     vus............................: 90      min=0         max=498 
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

     checks.........................: 100.00% ✓ 223539      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 91 MB   1.4 MB/s
     http_req_blocked...............: avg=7.23µs   min=1.06µs  med=2.49µs   max=17.55ms  p(90)=4.09µs   p(95)=4.99µs   p(99.9)=701.32µs
     http_req_connecting............: avg=4.02µs   min=0s      med=0s       max=17.49ms  p(90)=0s       p(95)=0s       p(99.9)=631.49µs
     http_req_duration..............: avg=188.95ms min=2.09ms  med=190.02ms max=503.05ms p(90)=351.27ms p(95)=377.64ms p(99.9)=456.39ms
       { expected_response:true }...: avg=188.95ms min=2.09ms  med=190.02ms max=503.05ms p(90)=351.27ms p(95)=377.64ms p(99.9)=456.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75513
     http_req_receiving.............: avg=127.34µs min=29.94µs med=60.94µs  max=230.64ms p(90)=96.05µs  p(95)=110.95µs p(99.9)=4.57ms  
     http_req_sending...............: avg=28.23µs  min=5.52µs  med=11µs     max=16.15ms  p(90)=17.17µs  p(95)=20.96µs  p(99.9)=3.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.79ms min=2.02ms  med=189.8ms  max=502.98ms p(90)=351.13ms p(95)=377.49ms p(99.9)=456.06ms
     http_reqs......................: 75513   1207.376807/s
     iteration_duration.............: avg=191.74ms min=3.8ms   med=192.96ms max=503.23ms p(90)=352.11ms p(95)=378.34ms p(99.9)=456.75ms
     iterations.....................: 74513   1191.387814/s
     success_rate...................: 100.00% ✓ 74513       ✗ 0    
     vus............................: 82      min=0         max=492
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

     checks.........................: 100.00% ✓ 93132      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   593 kB/s
     http_req_blocked...............: avg=9.88µs   min=1.15µs  med=3.06µs   max=9.96ms   p(90)=4.86µs   p(95)=5.92µs   p(99.9)=1.82ms 
     http_req_connecting............: avg=5.79µs   min=0s      med=0s       max=9.84ms   p(90)=0s       p(95)=0s       p(99.9)=1.78ms 
     http_req_duration..............: avg=448.27ms min=4.03ms  med=412.78ms max=1.86s    p(90)=888.75ms p(95)=970.32ms p(99.9)=1.43s  
       { expected_response:true }...: avg=448.27ms min=4.03ms  med=412.78ms max=1.86s    p(90)=888.75ms p(95)=970.32ms p(99.9)=1.43s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 32044
     http_req_receiving.............: avg=94.21µs  min=31.01µs med=77.29µs  max=132.32ms p(90)=114.07µs p(95)=127.74µs p(99.9)=871.4µs
     http_req_sending...............: avg=28.95µs  min=5.84µs  med=13.36µs  max=39.46ms  p(90)=20.79µs  p(95)=24.34µs  p(99.9)=3.11ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=448.15ms min=3.94ms  med=412.71ms max=1.86s    p(90)=888.65ms p(95)=970.24ms p(99.9)=1.43s  
     http_reqs......................: 32044   493.753751/s
     iteration_duration.............: avg=462.95ms min=18.93ms med=431.94ms max=1.86s    p(90)=893.6ms  p(95)=973.05ms p(99.9)=1.44s  
     iterations.....................: 31044   478.345133/s
     success_rate...................: 100.00% ✓ 31044      ✗ 0    
     vus............................: 38      min=0        max=500
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

     checks.........................: 100.00% ✓ 43424      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=13.74µs  min=1.36µs  med=3.77µs   max=12.66ms p(90)=5.66µs   p(95)=7.36µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=8.33µs   min=0s      med=0s       max=12.59ms p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=913.94ms min=6ms     med=795.96ms max=19.58s  p(90)=1.59s    p(95)=1.75s    p(99.9)=18.26s  
       { expected_response:true }...: avg=913.94ms min=6ms     med=795.96ms max=19.58s  p(90)=1.59s    p(95)=1.75s    p(99.9)=18.26s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15475
     http_req_receiving.............: avg=121.11µs min=39.92µs med=99.94µs  max=68.59ms p(90)=139.79µs p(95)=152.14µs p(99.9)=970.78µs
     http_req_sending...............: avg=37.14µs  min=6.61µs  med=18.25µs  max=65.92ms p(90)=24.37µs  p(95)=29.12µs  p(99.9)=2.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=913.79ms min=5.91ms  med=795.86ms max=19.58s  p(90)=1.59s    p(95)=1.75s    p(99.9)=18.26s  
     http_reqs......................: 15475   227.624523/s
     iteration_duration.............: avg=975.97ms min=56.81ms med=856.63ms max=19.59s  p(90)=1.61s    p(95)=1.76s    p(99.9)=18.28s  
     iterations.....................: 14474   212.900637/s
     success_rate...................: 100.00% ✓ 14474      ✗ 0    
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

     checks.........................: 100.00% ✓ 41538      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   245 kB/s
     http_req_blocked...............: avg=17.37µs  min=1.3µs   med=3.5µs    max=6.68ms   p(90)=5.29µs   p(95)=7.09µs   p(99.9)=2.78ms
     http_req_connecting............: avg=11.73µs  min=0s      med=0s       max=6.63ms   p(90)=0s       p(95)=0s       p(99.9)=2.65ms
     http_req_duration..............: avg=467.65ms min=8.43ms  med=552.15ms max=1.37s    p(90)=768.71ms p(95)=824.55ms p(99.9)=1.18s 
       { expected_response:true }...: avg=467.65ms min=8.43ms  med=552.15ms max=1.37s    p(90)=768.71ms p(95)=824.55ms p(99.9)=1.18s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14846
     http_req_receiving.............: avg=123.97µs min=34.78µs med=92.83µs  max=184.88ms p(90)=133.58µs p(95)=147.45µs p(99.9)=1.26ms
     http_req_sending...............: avg=51.98µs  min=5.58µs  med=17.05µs  max=99.82ms  p(90)=23.02µs  p(95)=28.4µs   p(99.9)=5.77ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=467.47ms min=8.3ms   med=552.01ms max=1.37s    p(90)=768.61ms p(95)=824.41ms p(99.9)=1.18s 
     http_reqs......................: 14846   199.901703/s
     iteration_duration.............: avg=501.34ms min=14.5ms  med=577.79ms max=1.38s    p(90)=774.82ms p(95)=830.33ms p(99.9)=1.19s 
     iterations.....................: 13846   186.436682/s
     success_rate...................: 100.00% ✓ 13846      ✗ 0    
     vus............................: 55      min=0        max=495
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

     checks.........................: 100.00% ✓ 407598      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=20.3µs   min=952ns  med=2.44µs  max=65.63ms  p(90)=4.1µs    p(95)=5.29µs   p(99.9)=2.15ms  
     http_req_connecting............: avg=16.94µs  min=0s     med=0s      max=62.62ms  p(90)=0s       p(95)=0s       p(99.9)=2.11ms  
     http_req_duration..............: avg=103.94ms min=1.71ms med=98.35ms max=349.42ms p(90)=199.87ms p(95)=215.69ms p(99.9)=274ms   
       { expected_response:true }...: avg=103.94ms min=1.71ms med=98.35ms max=349.42ms p(90)=199.87ms p(95)=215.69ms p(99.9)=274ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 136866
     http_req_receiving.............: avg=213.1µs  min=30.1µs med=60.22µs max=161.62ms p(90)=172.4µs  p(95)=411.4µs  p(99.9)=29.28ms 
     http_req_sending...............: avg=72.57µs  min=5.57µs med=10.85µs max=53.1ms   p(90)=20.55µs  p(95)=137.85µs p(99.9)=10.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.65ms min=1.65ms med=98.15ms max=331.26ms p(90)=199.46ms p(95)=215.11ms p(99.9)=270.32ms
     http_reqs......................: 136866  2199.5642/s
     iteration_duration.............: avg=104.97ms min=5.24ms med=99.46ms max=369.02ms p(90)=200.48ms p(95)=216.21ms p(99.9)=274.8ms 
     iterations.....................: 135866  2183.493267/s
     success_rate...................: 100.00% ✓ 135866      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 353712      ✗ 0     
     data_received..................: 10 GB   168 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=17.67µs  min=1µs     med=2.79µs   max=66.32ms  p(90)=4.48µs   p(95)=5.62µs   p(99.9)=2.31ms  
     http_req_connecting............: avg=14.1µs   min=0s      med=0s       max=66.27ms  p(90)=0s       p(95)=0s       p(99.9)=2.16ms  
     http_req_duration..............: avg=119.72ms min=1.72ms  med=109.38ms max=808.14ms p(90)=229.05ms p(95)=261.91ms p(99.9)=643.03ms
       { expected_response:true }...: avg=119.72ms min=1.72ms  med=109.38ms max=808.14ms p(90)=229.05ms p(95)=261.91ms p(99.9)=643.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118904
     http_req_receiving.............: avg=1.67ms   min=53.22µs med=118.74µs max=294.5ms  p(90)=1.83ms   p(95)=5.03ms   p(99.9)=126.91ms
     http_req_sending...............: avg=67.15µs  min=5.38µs  med=10.98µs  max=151.68ms p(90)=20.63µs  p(95)=128.18µs p(99.9)=9.57ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.98ms min=1.64ms  med=108.26ms max=808.03ms p(90)=226.52ms p(95)=256.3ms  p(99.9)=641.98ms
     http_reqs......................: 118904  1912.206643/s
     iteration_duration.............: avg=121.02ms min=2.8ms   med=110.56ms max=808.3ms  p(90)=229.86ms p(95)=262.81ms p(99.9)=643.32ms
     iterations.....................: 117904  1896.124706/s
     success_rate...................: 100.00% ✓ 117904      ✗ 0     
     vus............................: 65      min=0         max=496 
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

     checks.........................: 100.00% ✓ 205443      ✗ 0    
     data_received..................: 6.1 GB  91 MB/s
     data_sent......................: 83 MB   1.2 MB/s
     http_req_blocked...............: avg=7.84µs   min=1.11µs  med=2.82µs   max=32.37ms  p(90)=4.56µs   p(95)=5.53µs   p(99.9)=603.02µs
     http_req_connecting............: avg=4.31µs   min=0s      med=0s       max=32.32ms  p(90)=0s       p(95)=0s       p(99.9)=522.19µs
     http_req_duration..............: avg=204.86ms min=2.06ms  med=206.79ms max=579.49ms p(90)=380.5ms  p(95)=409.65ms p(99.9)=506.49ms
       { expected_response:true }...: avg=204.86ms min=2.06ms  med=206.79ms max=579.49ms p(90)=380.5ms  p(95)=409.65ms p(99.9)=506.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69481
     http_req_receiving.............: avg=94.85µs  min=30.07µs med=67µs     max=168.67ms p(90)=105.68µs p(95)=122.28µs p(99.9)=2.31ms  
     http_req_sending...............: avg=32.53µs  min=5.15µs  med=11.94µs  max=64.87ms  p(90)=18.86µs  p(95)=22.85µs  p(99.9)=3.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.73ms min=2ms     med=206.66ms max=579.43ms p(90)=380.35ms p(95)=409.53ms p(99.9)=506.41ms
     http_reqs......................: 69481   1039.771432/s
     iteration_duration.............: avg=208.1ms  min=6.51ms  med=210.29ms max=579.65ms p(90)=381.54ms p(95)=410.47ms p(99.9)=506.86ms
     iterations.....................: 68481   1024.806601/s
     success_rate...................: 100.00% ✓ 68481       ✗ 0    
     vus............................: 1       min=0         max=498
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

     checks.........................: 100.00% ✓ 90165      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   571 kB/s
     http_req_blocked...............: avg=11.13µs  min=1.19µs  med=3.4µs    max=20.14ms  p(90)=5.26µs   p(95)=6.33µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=6.62µs   min=0s      med=0s       max=19.96ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=462.64ms min=4.15ms  med=429.62ms max=2.09s    p(90)=909.7ms  p(95)=989.98ms p(99.9)=1.51s   
       { expected_response:true }...: avg=462.64ms min=4.15ms  med=429.62ms max=2.09s    p(90)=909.7ms  p(95)=989.98ms p(99.9)=1.51s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31055
     http_req_receiving.............: avg=98.55µs  min=34.09µs med=84.86µs  max=179.68ms p(90)=123.21µs p(95)=138.59µs p(99.9)=832.81µs
     http_req_sending...............: avg=37.29µs  min=5.94µs  med=15.74µs  max=112.32ms p(90)=23.06µs  p(95)=26.47µs  p(99.9)=2.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=462.5ms  min=4.08ms  med=429.51ms max=2.09s    p(90)=909.5ms  p(95)=989.89ms p(99.9)=1.51s   
     http_reqs......................: 31055   475.359302/s
     iteration_duration.............: avg=478.25ms min=28.89ms med=450.55ms max=2.09s    p(90)=913.86ms p(95)=993.61ms p(99.9)=1.52s   
     iterations.....................: 30055   460.052288/s
     success_rate...................: 100.00% ✓ 30055      ✗ 0    
     vus............................: 71      min=0        max=499
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

     checks.........................: 100.00% ✓ 43401      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   272 kB/s
     http_req_blocked...............: avg=16.26µs  min=1.14µs  med=3.8µs    max=5.63ms  p(90)=5.8µs    p(95)=7.59µs   p(99.9)=2.76ms  
     http_req_connecting............: avg=10.38µs  min=0s      med=0s       max=5.56ms  p(90)=0s       p(95)=0s       p(99.9)=2.74ms  
     http_req_duration..............: avg=943.28ms min=6.27ms  med=851.3ms  max=5.56s   p(90)=1.88s    p(95)=2.06s    p(99.9)=4.88s   
       { expected_response:true }...: avg=943.28ms min=6.27ms  med=851.3ms  max=5.56s   p(90)=1.88s    p(95)=2.06s    p(99.9)=4.88s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15467
     http_req_receiving.............: avg=112.34µs min=38.84µs med=101.44µs max=89.05ms p(90)=139.95µs p(95)=152.57µs p(99.9)=831.18µs
     http_req_sending...............: avg=36.5µs   min=6.6µs   med=18.46µs  max=76.36ms p(90)=24.75µs  p(95)=30.22µs  p(99.9)=2.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=943.13ms min=6.17ms  med=851.15ms max=5.56s   p(90)=1.88s    p(95)=2.06s    p(99.9)=4.88s   
     http_reqs......................: 15467   226.595402/s
     iteration_duration.............: avg=1s       min=32.5ms  med=929.02ms max=5.56s   p(90)=1.89s    p(95)=2.08s    p(99.9)=4.91s   
     iterations.....................: 14467   211.945153/s
     success_rate...................: 100.00% ✓ 14467      ✗ 0    
     vus............................: 63      min=0        max=500
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

     checks.........................: 100.00% ✓ 41127      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   253 kB/s
     http_req_blocked...............: avg=16.95µs  min=1.21µs  med=3.59µs   max=33.32ms p(90)=5.43µs   p(95)=7.08µs   p(99.9)=2.22ms
     http_req_connecting............: avg=11.61µs  min=0s      med=0s       max=33.26ms p(90)=0s       p(95)=0s       p(99.9)=2.19ms
     http_req_duration..............: avg=991.2ms  min=8.65ms  med=889.77ms max=4s      p(90)=2.02s    p(95)=2.15s    p(99.9)=3.46s 
       { expected_response:true }...: avg=991.2ms  min=8.65ms  med=889.77ms max=4s      p(90)=2.02s    p(95)=2.15s    p(99.9)=3.46s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14709
     http_req_receiving.............: avg=117.05µs min=33.4µs  med=97.21µs  max=45.88ms p(90)=137.17µs p(95)=149.64µs p(99.9)=1.04ms
     http_req_sending...............: avg=29.63µs  min=5.72µs  med=18.09µs  max=37.51ms p(90)=24.09µs  p(95)=29.29µs  p(99.9)=2.49ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=991.05ms min=8.55ms  med=889.63ms max=4s      p(90)=2.02s    p(95)=2.15s    p(99.9)=3.46s 
     http_reqs......................: 14709   210.409505/s
     iteration_duration.............: avg=1.06s    min=36.82ms med=972.16ms max=4.01s   p(90)=2.04s    p(95)=2.17s    p(99.9)=3.48s 
     iterations.....................: 13709   196.104691/s
     success_rate...................: 100.00% ✓ 13709      ✗ 0    
     vus............................: 23      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

