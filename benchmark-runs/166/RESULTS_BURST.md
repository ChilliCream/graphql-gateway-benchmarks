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
| hive-router | v0.0.49 | 2,597 | 2,726 | 2,558 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,080 | 2,127 | 2,043 | 1.4% |  |
| cosmo | 0.307.0 | 1,200 | 1,200 | 1,200 | 0.0% | non-compatible response (15 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 495 | 500 | 490 | 0.6% |  |
| hive-gateway | 2.5.25 | 235 | 237 | 233 | 0.6% |  |
| apollo-gateway | 2.13.3 | 200 | 205 | 200 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (16873 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (483068 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,153 | 2,265 | 2,120 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,950 | 1,988 | 1,715 | 4.2% |  |
| cosmo | 0.307.0 | 1,147 | 1,147 | 1,147 | 0.0% | non-compatible response (13 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 472 | 477 | 466 | 0.8% |  |
| hive-gateway | 2.5.25 | 224 | 228 | 221 | 1.1% |  |
| apollo-gateway | 2.13.3 | 207 | 210 | 205 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (18484 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (194643 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 479322      ✗ 0     
     data_received..................: 14 GB   228 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=21.83µs  min=962ns   med=2.19µs  max=55.9ms   p(90)=3.5µs    p(95)=4.5µs    p(99.9)=2.19ms  
     http_req_connecting............: avg=18.83µs  min=0s      med=0s      max=55.83ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=88.41ms  min=1.61ms  med=84.54ms max=375.79ms p(90)=170.69ms p(95)=184.88ms p(99.9)=230.83ms
       { expected_response:true }...: avg=88.41ms  min=1.61ms  med=84.54ms max=375.79ms p(90)=170.69ms p(95)=184.88ms p(99.9)=230.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160774
     http_req_receiving.............: avg=235.86µs min=28.48µs med=56.44µs max=166.14ms p(90)=199.27µs p(95)=396.41µs p(99.9)=31.02ms 
     http_req_sending...............: avg=81.72µs  min=5.19µs  med=9.69µs  max=264.03ms p(90)=18µs     p(95)=129.42µs p(99.9)=11.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.09ms  min=1.56ms  med=84.27ms max=340.33ms p(90)=170.29ms p(95)=184.24ms p(99.9)=227.17ms
     http_reqs......................: 160774  2597.645728/s
     iteration_duration.............: avg=89.23ms  min=2.38ms  med=85.48ms max=384.94ms p(90)=171.17ms p(95)=185.3ms  p(99.9)=231.7ms 
     iterations.....................: 159774  2581.488603/s
     success_rate...................: 100.00% ✓ 159774      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 388305      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=18.13µs  min=1µs     med=2.2µs    max=86.47ms  p(90)=3.51µs   p(95)=4.46µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=15.34µs  min=0s      med=0s       max=86.38ms  p(90)=0s       p(95)=0s       p(99.9)=2.15ms  
     http_req_duration..............: avg=109.05ms min=2.37ms  med=99.91ms  max=731.1ms  p(90)=214.14ms p(95)=252.15ms p(99.9)=485.49ms
       { expected_response:true }...: avg=109.05ms min=2.37ms  med=99.91ms  max=731.1ms  p(90)=214.14ms p(95)=252.15ms p(99.9)=485.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130435
     http_req_receiving.............: avg=2.46ms   min=51.78µs med=112.02µs max=477.96ms p(90)=1.46ms   p(95)=5.55ms   p(99.9)=194.88ms
     http_req_sending...............: avg=69.28µs  min=5.25µs  med=9.64µs   max=204.65ms p(90)=17.73µs  p(95)=119.83µs p(99.9)=9.54ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.52ms min=2.29ms  med=98.6ms   max=728.38ms p(90)=209.91ms p(95)=242.44ms p(99.9)=455ms   
     http_reqs......................: 130435  2080.23033/s
     iteration_duration.............: avg=110.23ms min=3.71ms  med=101.29ms max=731.3ms  p(90)=215.14ms p(95)=253.15ms p(99.9)=486.01ms
     iterations.....................: 129435  2064.281924/s
     success_rate...................: 100.00% ✓ 129435      ✗ 0     
     vus............................: 90      min=0         max=496 
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

     checks.........................: 100.00% ✓ 221946      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.49µs   min=1.05µs  med=2.14µs   max=20.47ms  p(90)=3.55µs   p(95)=4.41µs   p(99.9)=508.84µs
     http_req_connecting............: avg=3.69µs   min=0s      med=0s       max=20.42ms  p(90)=0s       p(95)=0s       p(99.9)=440.03µs
     http_req_duration..............: avg=190.29ms min=2.05ms  med=191.85ms max=519.96ms p(90)=352.08ms p(95)=376.65ms p(99.9)=455.64ms
       { expected_response:true }...: avg=190.29ms min=2.05ms  med=191.85ms max=519.96ms p(90)=352.08ms p(95)=376.65ms p(99.9)=455.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74982
     http_req_receiving.............: avg=147.98µs min=30.22µs med=59.55µs  max=280.87ms p(90)=92.73µs  p(95)=106.62µs p(99.9)=2.96ms  
     http_req_sending...............: avg=27.12µs  min=5.34µs  med=10.03µs  max=29.52ms  p(90)=15.49µs  p(95)=19.25µs  p(99.9)=3.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.12ms min=1.96ms  med=191.62ms max=519.91ms p(90)=351.98ms p(95)=376.54ms p(99.9)=455.45ms
     http_reqs......................: 74982   1200.234655/s
     iteration_duration.............: avg=193.11ms min=4.76ms  med=194.88ms max=520.11ms p(90)=352.89ms p(95)=377.26ms p(99.9)=455.97ms
     iterations.....................: 73982   1184.227684/s
     success_rate...................: 100.00% ✓ 73982       ✗ 0    
     vus............................: 79      min=0         max=493
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

     checks.........................: 100.00% ✓ 93597      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   595 kB/s
     http_req_blocked...............: avg=8.55µs   min=1.18µs  med=2.72µs   max=4.61ms  p(90)=4.57µs   p(95)=5.58µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=4.69µs   min=0s      med=0s       max=4.54ms  p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=445.89ms min=4.12ms  med=415.61ms max=2.31s   p(90)=876.93ms p(95)=954.29ms p(99.9)=1.44s   
       { expected_response:true }...: avg=445.89ms min=4.12ms  med=415.61ms max=2.31s   p(90)=876.93ms p(95)=954.29ms p(99.9)=1.44s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32199
     http_req_receiving.............: avg=85.32µs  min=32.2µs  med=74.83µs  max=42.3ms  p(90)=111.85µs p(95)=125.41µs p(99.9)=843.76µs
     http_req_sending...............: avg=25.94µs  min=5.62µs  med=12.95µs  max=26.07ms p(90)=20.62µs  p(95)=23.91µs  p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=445.78ms min=4.03ms  med=415.51ms max=2.31s   p(90)=876.8ms  p(95)=954.2ms  p(99.9)=1.44s   
     http_reqs......................: 32199   495.726601/s
     iteration_duration.............: avg=460.4ms  min=20.86ms med=431.52ms max=2.31s   p(90)=881.43ms p(95)=957.99ms p(99.9)=1.45s   
     iterations.....................: 31199   480.330887/s
     success_rate...................: 100.00% ✓ 31199      ✗ 0    
     vus............................: 55      min=0        max=499
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

     checks.........................: 100.00% ✓ 44856      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   283 kB/s
     http_req_blocked...............: avg=15.28µs  min=1.29µs  med=3.56µs   max=3.89ms   p(90)=5.46µs   p(95)=7.1µs    p(99.9)=2.63ms
     http_req_connecting............: avg=10.07µs  min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=2.59ms
     http_req_duration..............: avg=894.53ms min=6.07ms  med=803.48ms max=16.36s   p(90)=1.67s    p(95)=1.84s    p(99.9)=12.57s
       { expected_response:true }...: avg=894.53ms min=6.07ms  med=803.48ms max=16.36s   p(90)=1.67s    p(95)=1.84s    p(99.9)=12.57s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15952
     http_req_receiving.............: avg=116.42µs min=35.01µs med=100.95µs max=47.65ms  p(90)=140.07µs p(95)=153.51µs p(99.9)=1.77ms
     http_req_sending...............: avg=54.34µs  min=5.98µs  med=18.51µs  max=145.65ms p(90)=24.98µs  p(95)=29.85µs  p(99.9)=3.1ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=894.36ms min=5.97ms  med=803.33ms max=16.36s   p(90)=1.67s    p(95)=1.83s    p(99.9)=12.57s
     http_reqs......................: 15952   235.061172/s
     iteration_duration.............: avg=954.42ms min=55.02ms med=867.5ms  max=16.36s   p(90)=1.69s    p(95)=1.84s    p(99.9)=13.79s
     iterations.....................: 14952   220.325642/s
     success_rate...................: 100.00% ✓ 14952      ✗ 0    
     vus............................: 5       min=0        max=500
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

     checks.........................: 100.00% ✓ 41895      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=15.85µs  min=1.3µs   med=3.27µs   max=4ms     p(90)=4.91µs   p(95)=6.3µs    p(99.9)=2.74ms
     http_req_connecting............: avg=10.84µs  min=0s      med=0s       max=3.96ms  p(90)=0s       p(95)=0s       p(99.9)=2.71ms
     http_req_duration..............: avg=433.97ms min=8.57ms  med=485.44ms max=1.35s   p(90)=747.58ms p(95)=781.51ms p(99.9)=1.12s 
       { expected_response:true }...: avg=433.97ms min=8.57ms  med=485.44ms max=1.35s   p(90)=747.58ms p(95)=781.51ms p(99.9)=1.12s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14965
     http_req_receiving.............: avg=100.99µs min=33.13µs med=89.7µs   max=22.39ms p(90)=129.54µs p(95)=143.06µs p(99.9)=1.19ms
     http_req_sending...............: avg=32.08µs  min=5.99µs  med=16.52µs  max=53.38ms p(90)=22.54µs  p(95)=27.15µs  p(99.9)=2.6ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=433.84ms min=8.45ms  med=485.29ms max=1.35s   p(90)=747.48ms p(95)=781.38ms p(99.9)=1.12s 
     http_reqs......................: 14965   200.493098/s
     iteration_duration.............: avg=464.89ms min=9.13ms  med=509.4ms  max=1.35s   p(90)=754.08ms p(95)=785.46ms p(99.9)=1.13s 
     iterations.....................: 13965   187.095631/s
     success_rate...................: 100.00% ✓ 13965      ✗ 0    
     vus............................: 80      min=0        max=499
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

     checks.........................: 100.00% ✓ 398403      ✗ 0     
     data_received..................: 12 GB   188 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=17.16µs  min=982ns   med=2.33µs   max=56.2ms   p(90)=3.8µs    p(95)=4.94µs   p(99.9)=2.31ms  
     http_req_connecting............: avg=13.96µs  min=0s      med=0s       max=55.99ms  p(90)=0s       p(95)=0s       p(99.9)=2.12ms  
     http_req_duration..............: avg=106.31ms min=1.62ms  med=101.42ms max=381.22ms p(90)=203.38ms p(95)=220.14ms p(99.9)=271.58ms
       { expected_response:true }...: avg=106.31ms min=1.62ms  med=101.42ms max=381.22ms p(90)=203.38ms p(95)=220.14ms p(99.9)=271.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133801
     http_req_receiving.............: avg=179.74µs min=28.88µs med=59.97µs  max=245.02ms p(90)=166.42µs p(95)=400.69µs p(99.9)=17.27ms 
     http_req_sending...............: avg=74.9µs   min=5.28µs  med=10.5µs   max=243.19ms p(90)=19.93µs  p(95)=132.18µs p(99.9)=10.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.06ms min=1.57ms  med=101.23ms max=313.27ms p(90)=203.08ms p(95)=219.75ms p(99.9)=269.58ms
     http_reqs......................: 133801  2153.706123/s
     iteration_duration.............: avg=107.39ms min=3.04ms  med=102.63ms max=406.55ms p(90)=203.99ms p(95)=220.56ms p(99.9)=273.01ms
     iterations.....................: 132801  2137.609785/s
     success_rate...................: 100.00% ✓ 132801      ✗ 0     
     vus............................: 63      min=0         max=497 
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

     checks.........................: 100.00% ✓ 361542      ✗ 0     
     data_received..................: 11 GB   171 MB/s
     data_sent......................: 146 MB  2.3 MB/s
     http_req_blocked...............: avg=14.76µs  min=1µs    med=2.33µs   max=67.94ms  p(90)=3.95µs   p(95)=5.05µs   p(99.9)=1.12ms  
     http_req_connecting............: avg=11.79µs  min=0s     med=0s       max=67.85ms  p(90)=0s       p(95)=0s       p(99.9)=1.04ms  
     http_req_duration..............: avg=117.16ms min=1.81ms med=107.65ms max=883.73ms p(90)=223.82ms p(95)=256.41ms p(99.9)=648.18ms
       { expected_response:true }...: avg=117.16ms min=1.81ms med=107.65ms max=883.73ms p(90)=223.82ms p(95)=256.41ms p(99.9)=648.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 121514
     http_req_receiving.............: avg=1.93ms   min=51.3µs med=113.4µs  max=388.07ms p(90)=1.75ms   p(95)=4.94ms   p(99.9)=184.3ms 
     http_req_sending...............: avg=61.13µs  min=5.4µs  med=9.86µs   max=224.06ms p(90)=19.45µs  p(95)=119.86µs p(99.9)=8.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.17ms min=1.72ms med=106.59ms max=883.59ms p(90)=220.93ms p(95)=250.28ms p(99.9)=639.5ms 
     http_reqs......................: 121514  1950.11449/s
     iteration_duration.............: avg=118.4ms  min=2.72ms med=108.88ms max=884.01ms p(90)=224.5ms  p(95)=257.16ms p(99.9)=648.74ms
     iterations.....................: 120514  1934.066014/s
     success_rate...................: 100.00% ✓ 120514      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 212490      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=5.92µs   min=1.11µs  med=2.36µs   max=9.76ms   p(90)=4.04µs   p(95)=5.02µs   p(99.9)=513.77µs
     http_req_connecting............: avg=2.88µs   min=0s      med=0s       max=9.7ms    p(90)=0s       p(95)=0s       p(99.9)=465.84µs
     http_req_duration..............: avg=198.69ms min=2.09ms  med=198.34ms max=626.52ms p(90)=365.06ms p(95)=393.44ms p(99.9)=522.58ms
       { expected_response:true }...: avg=198.69ms min=2.09ms  med=198.34ms max=626.52ms p(90)=365.06ms p(95)=393.44ms p(99.9)=522.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71830
     http_req_receiving.............: avg=80.86µs  min=30.43µs med=65.53µs  max=46.68ms  p(90)=103.46µs p(95)=118.86µs p(99.9)=1.68ms  
     http_req_sending...............: avg=35.22µs  min=5.49µs  med=10.89µs  max=142.2ms  p(90)=17.45µs  p(95)=20.92µs  p(99.9)=3.71ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.57ms min=2.02ms  med=198.24ms max=626.45ms p(90)=364.95ms p(95)=393.34ms p(99.9)=522.5ms 
     http_reqs......................: 71830   1147.413232/s
     iteration_duration.............: avg=201.75ms min=5.89ms  med=201.74ms max=626.7ms  p(90)=366.05ms p(95)=394.15ms p(99.9)=522.96ms
     iterations.....................: 70830   1131.439221/s
     success_rate...................: 100.00% ✓ 70830       ✗ 0    
     vus............................: 85      min=0         max=495
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

     checks.........................: 100.00% ✓ 89412      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   567 kB/s
     http_req_blocked...............: avg=11.15µs  min=1.11µs  med=2.9µs    max=17.03ms p(90)=4.67µs   p(95)=5.65µs   p(99.9)=2.4ms   
     http_req_connecting............: avg=6.99µs   min=0s      med=0s       max=16.97ms p(90)=0s       p(95)=0s       p(99.9)=2.26ms  
     http_req_duration..............: avg=466.36ms min=4.16ms  med=436.27ms max=2.1s    p(90)=919.19ms p(95)=1s       p(99.9)=1.53s   
       { expected_response:true }...: avg=466.36ms min=4.16ms  med=436.27ms max=2.1s    p(90)=919.19ms p(95)=1s       p(99.9)=1.53s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30804
     http_req_receiving.............: avg=89.65µs  min=33.19µs med=79.18µs  max=97.74ms p(90)=115.7µs  p(95)=128.87µs p(99.9)=764.32µs
     http_req_sending...............: avg=26.82µs  min=5.7µs   med=13.9µs   max=81.33ms p(90)=21.21µs  p(95)=24.45µs  p(99.9)=2.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=466.24ms min=4.07ms  med=436.2ms  max=2.1s    p(90)=919.11ms p(95)=1s       p(99.9)=1.53s   
     http_reqs......................: 30804   472.516054/s
     iteration_duration.............: avg=482.23ms min=28.41ms med=452.27ms max=2.11s   p(90)=923.52ms p(95)=1s       p(99.9)=1.54s   
     iterations.....................: 29804   457.176616/s
     success_rate...................: 100.00% ✓ 29804      ✗ 0    
     vus............................: 65      min=0        max=496
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

     checks.........................: 100.00% ✓ 42930      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   270 kB/s
     http_req_blocked...............: avg=16.86µs  min=1.25µs  med=3.56µs   max=30.84ms p(90)=5.37µs   p(95)=7.16µs   p(99.9)=2.36ms
     http_req_connecting............: avg=11.34µs  min=0s      med=0s       max=30.77ms p(90)=0s       p(95)=0s       p(99.9)=2.32ms
     http_req_duration..............: avg=952.98ms min=6.22ms  med=860.02ms max=5.58s   p(90)=1.92s    p(95)=2.08s    p(99.9)=5.18s 
       { expected_response:true }...: avg=952.98ms min=6.22ms  med=860.02ms max=5.58s   p(90)=1.92s    p(95)=2.08s    p(99.9)=5.18s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15310
     http_req_receiving.............: avg=104.72µs min=35.13µs med=97.72µs  max=19.93ms p(90)=136.81µs p(95)=148.99µs p(99.9)=1.08ms
     http_req_sending...............: avg=31.89µs  min=5.8µs   med=17.51µs  max=26.21ms p(90)=23.59µs  p(95)=28.54µs  p(99.9)=2.77ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=952.85ms min=6.1ms   med=859.88ms max=5.58s   p(90)=1.92s    p(95)=2.08s    p(99.9)=5.18s 
     http_reqs......................: 15310   224.708265/s
     iteration_duration.............: avg=1.01s    min=52.38ms med=949.32ms max=5.59s   p(90)=1.94s    p(95)=2.08s    p(99.9)=5.21s 
     iterations.....................: 14310   210.031044/s
     success_rate...................: 100.00% ✓ 14310      ✗ 0    
     vus............................: 62      min=0        max=500
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

     checks.........................: 100.00% ✓ 40512      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=12.89µs  min=1.24µs  med=3.35µs   max=2.69ms  p(90)=5µs      p(95)=6.91µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=7.81µs   min=0s      med=0s       max=2.67ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=1s       min=8.62ms  med=923.18ms max=4.1s    p(90)=2.06s    p(95)=2.16s    p(99.9)=3.7s    
       { expected_response:true }...: avg=1s       min=8.62ms  med=923.18ms max=4.1s    p(90)=2.06s    p(95)=2.16s    p(99.9)=3.7s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 14504
     http_req_receiving.............: avg=105.75µs min=33.41µs med=92.62µs  max=62.69ms p(90)=133.31µs p(95)=145.63µs p(99.9)=720.95µs
     http_req_sending...............: avg=33.72µs  min=6.25µs  med=17.12µs  max=51.33ms p(90)=23.15µs  p(95)=27.84µs  p(99.9)=3.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s       min=8.51ms  med=923.1ms  max=4.1s    p(90)=2.06s    p(95)=2.16s    p(99.9)=3.7s    
     http_reqs......................: 14504   207.637817/s
     iteration_duration.............: avg=1.07s    min=70.16ms med=1s       max=4.1s    p(90)=2.07s    p(95)=2.17s    p(99.9)=3.74s   
     iterations.....................: 13504   193.321917/s
     success_rate...................: 100.00% ✓ 13504      ✗ 0    
     vus............................: 12      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

