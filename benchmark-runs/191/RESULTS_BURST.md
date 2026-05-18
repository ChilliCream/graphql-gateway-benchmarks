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
| hive-router | v0.0.49 | 2,769 | 2,860 | 2,721 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,089 | 2,124 | 2,069 | 0.9% |  |
| cosmo | 0.307.0 | 1,200 | 1,200 | 1,196 | 0.2% | non-compatible response (21 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 500 | 505 | 496 | 0.6% |  |
| hive-gateway | 2.5.25 | 238 | 241 | 235 | 0.8% |  |
| apollo-gateway | 2.13.3 | 204 | 208 | 202 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (14959 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (430382 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,178 | 2,290 | 2,144 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,907 | 1,952 | 1,889 | 1.2% |  |
| cosmo | 0.307.0 | 1,143 | 1,163 | 1,135 | 1.0% | non-compatible response (9 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 482 | 490 | 477 | 0.9% |  |
| hive-gateway | 2.5.25 | 229 | 231 | 226 | 0.8% |  |
| apollo-gateway | 2.13.3 | 211 | 215 | 210 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (14987 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (239986 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 511461      ✗ 0     
     data_received..................: 15 GB   243 MB/s
     data_sent......................: 206 MB  3.3 MB/s
     http_req_blocked...............: avg=32.79µs min=982ns   med=2.22µs  max=79.98ms  p(90)=3.76µs   p(95)=4.95µs   p(99.9)=6.08ms  
     http_req_connecting............: avg=29.9µs  min=0s      med=0s      max=79.8ms   p(90)=0s       p(95)=0s       p(99.9)=5.95ms  
     http_req_duration..............: avg=82.74ms min=1.63ms  med=75.88ms max=286.32ms p(90)=161.93ms p(95)=180.91ms p(99.9)=247.18ms
       { expected_response:true }...: avg=82.74ms min=1.63ms  med=75.88ms max=286.32ms p(90)=161.93ms p(95)=180.91ms p(99.9)=247.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 171487
     http_req_receiving.............: avg=423µs   min=27.14µs med=54.7µs  max=75.11ms  p(90)=229.42µs p(95)=414.04µs p(99.9)=53.87ms 
     http_req_sending...............: avg=93.21µs min=5.2µs   med=9.66µs  max=199.34ms p(90)=18.21µs  p(95)=131.84µs p(99.9)=14.61ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.23ms min=1.57ms  med=75.56ms max=278.64ms p(90)=161.09ms p(95)=179.48ms p(99.9)=242.83ms
     http_reqs......................: 171487  2769.735987/s
     iteration_duration.............: avg=83.62ms min=2.1ms   med=76.85ms max=324.59ms p(90)=162.68ms p(95)=182.04ms p(99.9)=250.28ms
     iterations.....................: 170487  2753.584699/s
     success_rate...................: 100.00% ✓ 170487      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 390681      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=17.05µs  min=1µs     med=2.23µs   max=110.11ms p(90)=3.58µs   p(95)=4.52µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=14.14µs  min=0s      med=0s       max=110.06ms p(90)=0s       p(95)=0s       p(99.9)=2.11ms  
     http_req_duration..............: avg=108.45ms min=2.38ms  med=98.94ms  max=664.42ms p(90)=208.39ms p(95)=244.58ms p(99.9)=455.17ms
       { expected_response:true }...: avg=108.45ms min=2.38ms  med=98.94ms  max=664.42ms p(90)=208.39ms p(95)=244.58ms p(99.9)=455.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131227
     http_req_receiving.............: avg=1.92ms   min=51.16µs med=110.95µs max=399.05ms p(90)=1.4ms    p(95)=4.87ms   p(99.9)=171.58ms
     http_req_sending...............: avg=64.27µs  min=5.27µs  med=9.63µs   max=270.57ms p(90)=17.83µs  p(95)=117.76µs p(99.9)=8.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.47ms min=2.28ms  med=97.94ms  max=664.3ms  p(90)=205.28ms p(95)=236.91ms p(99.9)=416.45ms
     http_reqs......................: 131227  2089.047512/s
     iteration_duration.............: avg=109.55ms min=3.45ms  med=100.3ms  max=664.59ms p(90)=209.15ms p(95)=245.4ms  p(99.9)=455.74ms
     iterations.....................: 130227  2073.12817/s
     success_rate...................: 100.00% ✓ 130227      ✗ 0     
     vus............................: 97      min=0         max=500 
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

     checks.........................: 100.00% ✓ 222117      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.34µs   min=1.09µs  med=2.47µs   max=12.28ms  p(90)=4.07µs   p(95)=4.98µs   p(99.9)=635.92µs
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=12.21ms  p(90)=0s       p(95)=0s       p(99.9)=572.6µs 
     http_req_duration..............: avg=190.11ms min=2.03ms  med=189.86ms max=605.5ms  p(90)=351.97ms p(95)=378.38ms p(99.9)=496.58ms
       { expected_response:true }...: avg=190.11ms min=2.03ms  med=189.86ms max=605.5ms  p(90)=351.97ms p(95)=378.38ms p(99.9)=496.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75039
     http_req_receiving.............: avg=77.27µs  min=29.44µs med=61.64µs  max=138.37ms p(90)=96.36µs  p(95)=110.68µs p(99.9)=1.27ms  
     http_req_sending...............: avg=28.66µs  min=5.4µs   med=10.72µs  max=60.89ms  p(90)=16.73µs  p(95)=20.23µs  p(99.9)=3.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.01ms min=1.97ms  med=189.74ms max=605.42ms p(90)=351.86ms p(95)=378.26ms p(99.9)=496.5ms 
     http_reqs......................: 75039   1200.660184/s
     iteration_duration.............: avg=192.93ms min=4.86ms  med=193.02ms max=605.71ms p(90)=352.86ms p(95)=379.12ms p(99.9)=497.34ms
     iterations.....................: 74039   1184.659702/s
     success_rate...................: 100.00% ✓ 74039       ✗ 0    
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

     checks.........................: 100.00% ✓ 94494      ✗ 0    
     data_received..................: 2.9 GB  44 MB/s
     data_sent......................: 39 MB   601 kB/s
     http_req_blocked...............: avg=8.92µs   min=1.15µs  med=3.18µs   max=4.1ms   p(90)=4.99µs   p(95)=6.1µs    p(99.9)=1.22ms  
     http_req_connecting............: avg=4.71µs   min=0s      med=0s       max=4.02ms  p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=441.86ms min=4.02ms  med=410.36ms max=1.93s   p(90)=869.32ms p(95)=949.77ms p(99.9)=1.43s   
       { expected_response:true }...: avg=441.86ms min=4.02ms  med=410.36ms max=1.93s   p(90)=869.32ms p(95)=949.77ms p(99.9)=1.43s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32498
     http_req_receiving.............: avg=88.89µs  min=33.24µs med=79.71µs  max=13.35ms p(90)=117.15µs p(95)=131.09µs p(99.9)=833.95µs
     http_req_sending...............: avg=33.8µs   min=5.76µs  med=14.16µs  max=87.01ms p(90)=21.67µs  p(95)=25.4µs   p(99.9)=3.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=441.74ms min=3.95ms  med=410.24ms max=1.93s   p(90)=869.17ms p(95)=949.67ms p(99.9)=1.43s   
     http_reqs......................: 32498   500.65943/s
     iteration_duration.............: avg=456.11ms min=19.38ms med=427.02ms max=1.93s   p(90)=874.18ms p(95)=953.45ms p(99.9)=1.44s   
     iterations.....................: 31498   485.253576/s
     success_rate...................: 100.00% ✓ 31498      ✗ 0    
     vus............................: 42      min=0        max=500
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

     checks.........................: 100.00% ✓ 45453      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   287 kB/s
     http_req_blocked...............: avg=17.77µs  min=1.19µs  med=3.7µs    max=36.06ms p(90)=5.64µs   p(95)=7.24µs   p(99.9)=2.97ms  
     http_req_connecting............: avg=12.42µs  min=0s      med=0s       max=36ms    p(90)=0s       p(95)=0s       p(99.9)=2.94ms  
     http_req_duration..............: avg=884.81ms min=6.06ms  med=769.63ms max=19.08s  p(90)=1.48s    p(95)=1.58s    p(99.9)=17.94s  
       { expected_response:true }...: avg=884.81ms min=6.06ms  med=769.63ms max=19.08s  p(90)=1.48s    p(95)=1.58s    p(99.9)=17.94s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16151
     http_req_receiving.............: avg=105.05µs min=35.96µs med=99.31µs  max=6.04ms  p(90)=137.96µs p(95)=152.01µs p(99.9)=741.89µs
     http_req_sending...............: avg=27.87µs  min=6.27µs  med=18.31µs  max=50.84ms p(90)=24.84µs  p(95)=29.87µs  p(99.9)=1.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=884.68ms min=5.97ms  med=769.5ms  max=19.08s  p(90)=1.48s    p(95)=1.58s    p(99.9)=17.94s  
     http_reqs......................: 16151   238.070041/s
     iteration_duration.............: avg=943.22ms min=38.72ms med=841.2ms  max=19.08s  p(90)=1.5s     p(95)=1.58s    p(99.9)=17.95s  
     iterations.....................: 15151   223.329775/s
     success_rate...................: 100.00% ✓ 15151      ✗ 0    
     vus............................: 100     min=0        max=500
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

     checks.........................: 100.00% ✓ 42684      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   251 kB/s
     http_req_blocked...............: avg=14.48µs  min=1.21µs  med=3.47µs   max=16.44ms  p(90)=5.26µs   p(95)=6.89µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=9.1µs    min=0s      med=0s       max=16.38ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=432ms    min=8.44ms  med=504.19ms max=1.34s    p(90)=730.42ms p(95)=776.47ms p(99.9)=1.08s   
       { expected_response:true }...: avg=432ms    min=8.44ms  med=504.19ms max=1.34s    p(90)=730.42ms p(95)=776.47ms p(99.9)=1.08s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15228
     http_req_receiving.............: avg=102.58µs min=34.73µs med=94.7µs   max=22.49ms  p(90)=135.84µs p(95)=148.42µs p(99.9)=820.43µs
     http_req_sending...............: avg=33.19µs  min=6.08µs  med=17.55µs  max=103.06ms p(90)=23.51µs  p(95)=28.55µs  p(99.9)=2.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=431.86ms min=8.31ms  med=504.06ms max=1.34s    p(90)=730.3ms  p(95)=776.37ms p(99.9)=1.08s   
     http_reqs......................: 15228   204.627489/s
     iteration_duration.............: avg=462.3ms  min=8.9ms   med=529.75ms max=1.34s    p(90)=735.1ms  p(95)=781.99ms p(99.9)=1.09s   
     iterations.....................: 14228   191.189908/s
     success_rate...................: 100.00% ✓ 14228      ✗ 0    
     vus............................: 68      min=0        max=497
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

     checks.........................: 100.00% ✓ 403320      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=20.05µs  min=1.05µs med=2.45µs   max=69.24ms  p(90)=4.06µs   p(95)=5.25µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=16.82µs  min=0s     med=0s       max=69.14ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=105.03ms min=1.7ms  med=99.47ms  max=319.71ms p(90)=200.99ms p(95)=218.88ms p(99.9)=273.03ms
       { expected_response:true }...: avg=105.03ms min=1.7ms  med=99.47ms  max=319.71ms p(90)=200.99ms p(95)=218.88ms p(99.9)=273.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135440
     http_req_receiving.............: avg=180.51µs min=29.3µs med=60.25µs  max=87.21ms  p(90)=155.89µs p(95)=398.14µs p(99.9)=22.38ms 
     http_req_sending...............: avg=69.6µs   min=5.43µs med=10.79µs  max=41.22ms  p(90)=19.96µs  p(95)=132.98µs p(99.9)=9.58ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.78ms min=1.64ms med=99.23ms  max=303.72ms p(90)=200.65ms p(95)=218.53ms p(99.9)=270.51ms
     http_reqs......................: 135440  2178.493001/s
     iteration_duration.............: avg=106.09ms min=4.42ms med=100.71ms max=366.99ms p(90)=201.56ms p(95)=219.5ms  p(99.9)=275.04ms
     iterations.....................: 134440  2162.40844/s
     success_rate...................: 100.00% ✓ 134440      ✗ 0     
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

     checks.........................: 100.00% ✓ 353124      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=16.2µs   min=992ns   med=2.41µs   max=51.66ms  p(90)=4.13µs   p(95)=5.26µs   p(99.9)=2.38ms  
     http_req_connecting............: avg=13.09µs  min=0s      med=0s       max=51.62ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=119.95ms min=1.81ms  med=106.52ms max=1.08s    p(90)=232.7ms  p(95)=267.04ms p(99.9)=799.28ms
       { expected_response:true }...: avg=119.95ms min=1.81ms  med=106.52ms max=1.08s    p(90)=232.7ms  p(95)=267.04ms p(99.9)=799.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118708
     http_req_receiving.............: avg=1.76ms   min=51.61µs med=111.83µs max=641.46ms p(90)=1.55ms   p(95)=3.96ms   p(99.9)=161.54ms
     http_req_sending...............: avg=62.51µs  min=5.32µs  med=10.15µs  max=62.8ms   p(90)=19.54µs  p(95)=116.99µs p(99.9)=9.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.12ms min=1.71ms  med=105.44ms max=975.84ms p(90)=230.12ms p(95)=262.08ms p(99.9)=700.71ms
     http_reqs......................: 118708  1907.100133/s
     iteration_duration.............: avg=121.24ms min=3.27ms  med=107.89ms max=1.08s    p(90)=233.43ms p(95)=267.81ms p(99.9)=799.73ms
     iterations.....................: 117708  1891.034661/s
     success_rate...................: 100.00% ✓ 117708      ✗ 0     
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

     checks.........................: 100.00% ✓ 211890      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=6.64µs   min=1.03µs  med=2.48µs   max=9.7ms    p(90)=4.19µs   p(95)=5.17µs   p(99.9)=635.87µs
     http_req_connecting............: avg=3.38µs   min=0s      med=0s       max=9.67ms   p(90)=0s       p(95)=0s       p(99.9)=571.95µs
     http_req_duration..............: avg=199.21ms min=2.1ms   med=199.37ms max=531.3ms  p(90)=368.32ms p(95)=394.93ms p(99.9)=475.94ms
       { expected_response:true }...: avg=199.21ms min=2.1ms   med=199.37ms max=531.3ms  p(90)=368.32ms p(95)=394.93ms p(99.9)=475.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71630
     http_req_receiving.............: avg=81.38µs  min=29.82µs med=65.48µs  max=45.53ms  p(90)=104.04µs p(95)=120.16µs p(99.9)=1.48ms  
     http_req_sending...............: avg=31.09µs  min=5.55µs  med=11.25µs  max=95.85ms  p(90)=18.41µs  p(95)=22.08µs  p(99.9)=3.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.09ms min=2.03ms  med=199.26ms max=531.24ms p(90)=368.23ms p(95)=394.83ms p(99.9)=475.85ms
     http_reqs......................: 71630   1143.228807/s
     iteration_duration.............: avg=202.27ms min=5.73ms  med=202.92ms max=531.46ms p(90)=369.18ms p(95)=395.52ms p(99.9)=476.23ms
     iterations.....................: 70630   1127.268612/s
     success_rate...................: 100.00% ✓ 70630       ✗ 0    
     vus............................: 87      min=0         max=499
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

     checks.........................: 100.00% ✓ 91632      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   580 kB/s
     http_req_blocked...............: avg=24µs     min=1.15µs  med=3.31µs   max=35.6ms  p(90)=5.21µs   p(95)=6.26µs   p(99.9)=7.17ms  
     http_req_connecting............: avg=19.41µs  min=0s      med=0s       max=35.53ms p(90)=0s       p(95)=0s       p(99.9)=7.12ms  
     http_req_duration..............: avg=455.33ms min=4.18ms  med=424.13ms max=1.82s   p(90)=894.88ms p(95)=973.91ms p(99.9)=1.47s   
       { expected_response:true }...: avg=455.33ms min=4.18ms  med=424.13ms max=1.82s   p(90)=894.88ms p(95)=973.91ms p(99.9)=1.47s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31544
     http_req_receiving.............: avg=93.47µs  min=32.12µs med=83.25µs  max=40.1ms  p(90)=120.4µs  p(95)=134.97µs p(99.9)=957.28µs
     http_req_sending...............: avg=30.31µs  min=5.73µs  med=14.95µs  max=34.64ms p(90)=22.27µs  p(95)=25.71µs  p(99.9)=3.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=455.21ms min=4.11ms  med=424ms    max=1.82s   p(90)=894.78ms p(95)=973.85ms p(99.9)=1.47s   
     http_reqs......................: 31544   482.900873/s
     iteration_duration.............: avg=470.47ms min=19.18ms med=441.03ms max=1.82s   p(90)=899.54ms p(95)=978.21ms p(99.9)=1.49s   
     iterations.....................: 30544   467.59207/s
     success_rate...................: 100.00% ✓ 30544      ✗ 0    
     vus............................: 73      min=0        max=495
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

     checks.........................: 100.00% ✓ 43968      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=14.47µs  min=1.26µs  med=3.61µs   max=5.38ms  p(90)=5.6µs    p(95)=7.33µs   p(99.9)=2.28ms
     http_req_connecting............: avg=8.85µs   min=0s      med=0s       max=5.24ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms
     http_req_duration..............: avg=932.54ms min=6.37ms  med=839.83ms max=5.53s   p(90)=1.86s    p(95)=2.03s    p(99.9)=4.74s 
       { expected_response:true }...: avg=932.54ms min=6.37ms  med=839.83ms max=5.53s   p(90)=1.86s    p(95)=2.03s    p(99.9)=4.74s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15656
     http_req_receiving.............: avg=127.79µs min=36.81µs med=99.77µs  max=78.78ms p(90)=138.51µs p(95)=151.31µs p(99.9)=1.55ms
     http_req_sending...............: avg=34.87µs  min=6.44µs  med=18.57µs  max=60.96ms p(90)=24.59µs  p(95)=29.67µs  p(99.9)=2.55ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=932.37ms min=6.26ms  med=839.64ms max=5.53s   p(90)=1.86s    p(95)=2.03s    p(99.9)=4.74s 
     http_reqs......................: 15656   229.783195/s
     iteration_duration.............: avg=996.19ms min=53.07ms med=918.82ms max=5.55s   p(90)=1.88s    p(95)=2.05s    p(99.9)=4.76s 
     iterations.....................: 14656   215.10619/s
     success_rate...................: 100.00% ✓ 14656      ✗ 0    
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

     checks.........................: 100.00% ✓ 41196      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   253 kB/s
     http_req_blocked...............: avg=21.4µs   min=1.3µs   med=3.66µs   max=8.39ms  p(90)=5.57µs  p(95)=7.25µs   p(99.9)=4.92ms 
     http_req_connecting............: avg=15.64µs  min=0s      med=0s       max=8.34ms  p(90)=0s      p(95)=0s       p(99.9)=4.83ms 
     http_req_duration..............: avg=988.94ms min=8.58ms  med=893.35ms max=4.01s   p(90)=2.02s   p(95)=2.14s    p(99.9)=3.63s  
       { expected_response:true }...: avg=988.94ms min=8.58ms  med=893.35ms max=4.01s   p(90)=2.02s   p(95)=2.14s    p(99.9)=3.63s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14732
     http_req_receiving.............: avg=113.13µs min=34.53µs med=100.86µs max=96.59ms p(90)=140.2µs p(95)=152.44µs p(99.9)=948.6µs
     http_req_sending...............: avg=41.54µs  min=6.17µs  med=18.05µs  max=9.27ms  p(90)=24.2µs  p(95)=29.48µs  p(99.9)=6.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=988.78ms min=8.45ms  med=893.22ms max=4.01s   p(90)=2.02s   p(95)=2.14s    p(99.9)=3.63s  
     http_reqs......................: 14732   211.021058/s
     iteration_duration.............: avg=1.06s    min=52.94ms med=991.09ms max=4.01s   p(90)=2.04s   p(95)=2.16s    p(99.9)=3.66s  
     iterations.....................: 13732   196.697065/s
     success_rate...................: 100.00% ✓ 13732      ✗ 0    
     vus............................: 103     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

