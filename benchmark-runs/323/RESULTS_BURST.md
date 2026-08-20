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
| hive-router | v0.0.84 | 2,896 | 3,050 | 2,855 | 2.2% |  |
| fusion | 16.6.1 | 2,562 | 2,650 | 2,548 | 1.4% |  |
| fusion-nightly | 16.6.2-p.4 | 2,559 | 2,663 | 2,548 | 1.6% |  |
| fusion-nightly-net11 | 16.6.2-p.4 | 2,538 | 2,639 | 2,520 | 1.6% |  |
| fusion-nightly-fed | 16.6.2-p.4 | 2,302 | 2,401 | 2,292 | 1.6% |  |
| cosmo | 0.334.0 | 1,177 | 1,229 | 1,171 | 1.7% |  |
| hive-gateway-router-runtime | 2.10.8 | 566 | 578 | 563 | 1.0% |  |
| hive-gateway | 2.10.8 | 256 | 262 | 255 | 1.0% |  |
| apollo-gateway | 2.14.3 | 231 | 239 | 227 | 1.4% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (17276 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (473049 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly | 16.6.2-p.4 | 2,417 | 2,503 | 2,410 | 1.4% |  |
| fusion-nightly-net11 | 16.6.2-p.4 | 2,390 | 2,487 | 2,372 | 1.6% |  |
| fusion | 16.6.1 | 2,325 | 2,436 | 2,311 | 1.8% |  |
| hive-router | v0.0.84 | 2,282 | 2,415 | 2,243 | 2.7% |  |
| fusion-nightly-fed | 16.6.2-p.4 | 2,171 | 2,253 | 2,145 | 1.5% |  |
| cosmo | 0.334.0 | 1,115 | 1,155 | 1,106 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 549 | 562 | 545 | 1.0% |  |
| hive-gateway | 2.10.8 | 238 | 244 | 236 | 1.1% |  |
| apollo-gateway | 2.14.3 | 233 | 237 | 233 | 0.6% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (34727 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (378668 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 533952      ✗ 0     
     data_received..................: 16 GB   254 MB/s
     data_sent......................: 215 MB  3.5 MB/s
     http_req_blocked...............: avg=27.19µs  min=962ns   med=2.6µs   max=59.69ms  p(90)=4.32µs   p(95)=5.55µs   p(99.9)=2.66ms  
     http_req_connecting............: avg=23.59µs  min=0s      med=0s      max=59.49ms  p(90)=0s       p(95)=0s       p(99.9)=2.49ms  
     http_req_duration..............: avg=79.36ms  min=1.46ms  med=74.31ms max=280.18ms p(90)=153.86ms p(95)=171.98ms p(99.9)=234.87ms
       { expected_response:true }...: avg=79.36ms  min=1.46ms  med=74.31ms max=280.18ms p(90)=153.86ms p(95)=171.98ms p(99.9)=234.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178984
     http_req_receiving.............: avg=181.27µs min=27.55µs med=53.46µs max=70.18ms  p(90)=163.1µs  p(95)=363.36µs p(99.9)=24.54ms 
     http_req_sending...............: avg=81.6µs   min=4.64µs  med=9.81µs  max=51.22ms  p(90)=19.29µs  p(95)=126.37µs p(99.9)=12.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.1ms   min=1.41ms  med=74.08ms max=280.1ms  p(90)=153.57ms p(95)=171.49ms p(99.9)=233.19ms
     http_reqs......................: 178984  2896.061801/s
     iteration_duration.............: avg=80.09ms  min=2.24ms  med=75.09ms max=307.98ms p(90)=154.37ms p(95)=172.51ms p(99.9)=238.14ms
     iterations.....................: 177984  2879.881239/s
     success_rate...................: 100.00% ✓ 177984      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 475665      ✗ 0     
     data_received..................: 14 GB   225 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=17.56µs min=862ns   med=2.07µs  max=67.55ms  p(90)=3.51µs   p(95)=4.6µs    p(99.9)=1.9ms   
     http_req_connecting............: avg=14.54µs min=0s      med=0s      max=67.33ms  p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=89.12ms min=1.96ms  med=78.26ms max=1.54s    p(90)=169.77ms p(95)=194.17ms p(99.9)=530.56ms
       { expected_response:true }...: avg=89.12ms min=1.96ms  med=78.26ms max=1.54s    p(90)=169.77ms p(95)=194.17ms p(99.9)=530.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159555
     http_req_receiving.............: avg=1.42ms  min=52.54µs med=94.83µs max=581.83ms p(90)=1.53ms   p(95)=4.33ms   p(99.9)=109.57ms
     http_req_sending...............: avg=64.46µs min=4.54µs  med=8.69µs  max=287.41ms p(90)=16.65µs  p(95)=104.02µs p(99.9)=8.7ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.63ms min=1.85ms  med=77.14ms max=1.54s    p(90)=167.79ms p(95)=191.05ms p(99.9)=512.96ms
     http_reqs......................: 159555  2562.136724/s
     iteration_duration.............: avg=89.95ms min=3.02ms  med=79.22ms max=1.54s    p(90)=170.28ms p(95)=194.79ms p(99.9)=532.45ms
     iterations.....................: 158555  2546.078708/s
     success_rate...................: 100.00% ✓ 158555      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 476040      ✗ 0     
     data_received..................: 14 GB   224 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=17.34µs min=842ns   med=2.03µs  max=102.7ms  p(90)=3.43µs   p(95)=4.49µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=14.52µs min=0s      med=0s      max=102.57ms p(90)=0s       p(95)=0s       p(99.9)=1.51ms  
     http_req_duration..............: avg=89.09ms min=1.94ms  med=79.64ms max=800.14ms p(90)=169.17ms p(95)=194.66ms p(99.9)=534.13ms
       { expected_response:true }...: avg=89.09ms min=1.94ms  med=79.64ms max=800.14ms p(90)=169.17ms p(95)=194.66ms p(99.9)=534.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159680
     http_req_receiving.............: avg=1.21ms  min=49.88µs med=94.36µs max=413.65ms p(90)=1.37ms   p(95)=3.71ms   p(99.9)=86.02ms 
     http_req_sending...............: avg=67.99µs min=4.43µs  med=8.59µs  max=233.72ms p(90)=16.75µs  p(95)=102.63µs p(99.9)=8.74ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.81ms min=1.86ms  med=78.6ms  max=738.93ms p(90)=167.6ms  p(95)=192.11ms p(99.9)=510.63ms
     http_reqs......................: 159680  2559.757678/s
     iteration_duration.............: avg=89.89ms min=2.96ms  med=80.55ms max=800.32ms p(90)=169.68ms p(95)=195.29ms p(99.9)=535.13ms
     iterations.....................: 158680  2543.727132/s
     success_rate...................: 100.00% ✓ 158680      ✗ 0     
     vus............................: 73      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 469965      ✗ 0     
     data_received..................: 14 GB   223 MB/s
     data_sent......................: 189 MB  3.0 MB/s
     http_req_blocked...............: avg=15µs     min=862ns  med=2.07µs   max=71ms     p(90)=3.42µs   p(95)=4.43µs   p(99.9)=910.41µs
     http_req_connecting............: avg=12.07µs  min=0s     med=0s       max=70.94ms  p(90)=0s       p(95)=0s       p(99.9)=843.94µs
     http_req_duration..............: avg=90.2ms   min=1.86ms med=85.87ms  max=333.73ms p(90)=172.49ms p(95)=187.26ms p(99.9)=247.04ms
       { expected_response:true }...: avg=90.2ms   min=1.86ms med=85.87ms  max=333.73ms p(90)=172.49ms p(95)=187.26ms p(99.9)=247.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157655
     http_req_receiving.............: avg=617.83µs min=52.8µs med=105.11µs max=128.55ms p(90)=1.19ms   p(95)=2.09ms   p(99.9)=26.26ms 
     http_req_sending...............: avg=56.69µs  min=4.52µs med=8.8µs    max=142.1ms  p(90)=17.28µs  p(95)=105.74µs p(99.9)=7.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.53ms  min=1.77ms med=85.13ms  max=333.65ms p(90)=171.74ms p(95)=186.6ms  p(99.9)=246.09ms
     http_reqs......................: 157655  2538.773604/s
     iteration_duration.............: avg=91.02ms  min=3.61ms med=86.84ms  max=343.11ms p(90)=172.94ms p(95)=187.72ms p(99.9)=248.17ms
     iterations.....................: 156655  2522.670254/s
     success_rate...................: 100.00% ✓ 156655      ✗ 0     
     vus............................: 61      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 425583      ✗ 0     
     data_received..................: 13 GB   202 MB/s
     data_sent......................: 172 MB  2.8 MB/s
     http_req_blocked...............: avg=16.1µs   min=912ns   med=2.43µs   max=56.43ms  p(90)=3.99µs   p(95)=5.02µs   p(99.9)=1.06ms  
     http_req_connecting............: avg=12.62µs  min=0s      med=0s       max=56.37ms  p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=99.62ms  min=1.65ms  med=87.1ms   max=1.39s    p(90)=192.98ms p(95)=222.95ms p(99.9)=630.45ms
       { expected_response:true }...: avg=99.62ms  min=1.65ms  med=87.1ms   max=1.39s    p(90)=192.98ms p(95)=222.95ms p(99.9)=630.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142861
     http_req_receiving.............: avg=1.46ms   min=51.85µs med=104.13µs max=588.36ms p(90)=1.86ms   p(95)=4.79ms   p(99.9)=81.04ms 
     http_req_sending...............: avg=63.37µs  min=4.83µs  med=9.41µs   max=140.42ms p(90)=17.11µs  p(95)=106.77µs p(99.9)=8.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.09ms  min=1.58ms  med=86ms     max=1.39s    p(90)=190.6ms  p(95)=219.99ms p(99.9)=618.3ms 
     http_reqs......................: 142861  2302.285451/s
     iteration_duration.............: avg=100.58ms min=2.62ms  med=88.2ms   max=1.39s    p(90)=193.57ms p(95)=223.79ms p(99.9)=630.97ms
     iterations.....................: 141861  2286.169888/s
     success_rate...................: 100.00% ✓ 141861      ✗ 0     
     vus............................: 60      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 217890      ✗ 0    
     data_received..................: 6.5 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=4.48µs   min=1µs     med=2.09µs   max=5.62ms   p(90)=3.55µs   p(95)=4.41µs   p(99.9)=362.53µs
     http_req_connecting............: avg=1.75µs   min=0s      med=0s       max=5.32ms   p(90)=0s       p(95)=0s       p(99.9)=318.63µs
     http_req_duration..............: avg=193.8ms  min=1.97ms  med=194.11ms max=657.05ms p(90)=358.75ms p(95)=385.27ms p(99.9)=557.69ms
       { expected_response:true }...: avg=193.8ms  min=1.97ms  med=194.11ms max=657.05ms p(90)=358.75ms p(95)=385.27ms p(99.9)=557.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73630
     http_req_receiving.............: avg=72.62µs  min=27.38µs med=58.99µs  max=140.59ms p(90)=97.18µs  p(95)=113.54µs p(99.9)=1.01ms  
     http_req_sending...............: avg=24.75µs  min=4.86µs  med=9.81µs   max=107.71ms p(90)=16.47µs  p(95)=20.26µs  p(99.9)=2.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.7ms  min=1.89ms  med=193.99ms max=656.99ms p(90)=358.66ms p(95)=385.17ms p(99.9)=557.63ms
     http_reqs......................: 73630   1177.229438/s
     iteration_duration.............: avg=196.69ms min=4.54ms  med=197.11ms max=657.24ms p(90)=359.58ms p(95)=385.95ms p(99.9)=558.44ms
     iterations.....................: 72630   1161.24099/s
     success_rate...................: 100.00% ✓ 72630       ✗ 0    
     vus............................: 83      min=0         max=492
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 106056     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   680 kB/s
     http_req_blocked...............: avg=9.07µs   min=1.09µs  med=3.18µs   max=13.76ms p(90)=4.99µs   p(95)=6.07µs   p(99.9)=1.69ms
     http_req_connecting............: avg=4.9µs    min=0s      med=0s       max=13.7ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms
     http_req_duration..............: avg=394.75ms min=3.56ms  med=363.62ms max=1.83s   p(90)=770.26ms p(95)=834.16ms p(99.9)=1.24s 
       { expected_response:true }...: avg=394.75ms min=3.56ms  med=363.62ms max=1.83s   p(90)=770.26ms p(95)=834.16ms p(99.9)=1.24s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36352
     http_req_receiving.............: avg=88.2µs   min=28.51µs med=71.82µs  max=97.9ms  p(90)=110.51µs p(95)=125.79µs p(99.9)=1.39ms
     http_req_sending...............: avg=30.52µs  min=5.73µs  med=14.13µs  max=54.98ms p(90)=21.65µs  p(95)=25.02µs  p(99.9)=2.84ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=394.63ms min=3.5ms   med=363.53ms max=1.83s   p(90)=770.13ms p(95)=834.08ms p(99.9)=1.24s 
     http_reqs......................: 36352   566.089048/s
     iteration_duration.............: avg=406.18ms min=11.41ms med=378.27ms max=1.83s   p(90)=773.76ms p(95)=836.87ms p(99.9)=1.25s 
     iterations.....................: 35352   550.516616/s
     success_rate...................: 100.00% ✓ 35352      ✗ 0    
     vus............................: 67      min=0        max=496
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48825      ✗ 0    
     data_received..................: 1.5 GB  23 MB/s
     data_sent......................: 21 MB   309 kB/s
     http_req_blocked...............: avg=18.06µs  min=1.08µs  med=3.25µs   max=8.64ms  p(90)=5.02µs   p(95)=6.47µs   p(99.9)=3.67ms
     http_req_connecting............: avg=12.71µs  min=0s      med=0s       max=8.58ms  p(90)=0s       p(95)=0s       p(99.9)=3.48ms
     http_req_duration..............: avg=834.54ms min=5.48ms  med=727.01ms max=14.55s  p(90)=1.55s    p(95)=1.74s    p(99.9)=13.07s
       { expected_response:true }...: avg=834.54ms min=5.48ms  med=727.01ms max=14.55s  p(90)=1.55s    p(95)=1.74s    p(99.9)=13.07s
     http_req_failed................: 0.00%   ✓ 0          ✗ 17275
     http_req_receiving.............: avg=99.39µs  min=31.5µs  med=91.16µs  max=9.06ms  p(90)=128.32µs p(95)=144.52µs p(99.9)=1.46ms
     http_req_sending...............: avg=35.8µs   min=5.77µs  med=17.21µs  max=47.64ms p(90)=23.29µs  p(95)=27.37µs  p(99.9)=4.68ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=834.4ms  min=5.4ms   med=726.88ms max=14.55s  p(90)=1.55s    p(95)=1.74s    p(99.9)=13.07s
     http_reqs......................: 17275   256.837439/s
     iteration_duration.............: avg=885.9ms  min=20.26ms med=778.9ms  max=14.55s  p(90)=1.57s    p(95)=1.76s    p(99.9)=13.1s 
     iterations.....................: 16275   241.96986/s
     success_rate...................: 100.00% ✓ 16275      ✗ 0    
     vus............................: 71      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47871      ✗ 0    
     data_received..................: 1.5 GB  20 MB/s
     data_sent......................: 21 MB   284 kB/s
     http_req_blocked...............: avg=10.26µs  min=1.14µs  med=3.03µs   max=2.67ms  p(90)=4.65µs   p(95)=5.98µs   p(99.9)=1.08ms  
     http_req_connecting............: avg=5.72µs   min=0s      med=0s       max=2.63ms  p(90)=0s       p(95)=0s       p(99.9)=1.06ms  
     http_req_duration..............: avg=382.85ms min=7.61ms  med=446.18ms max=1.15s   p(90)=630.1ms  p(95)=701.43ms p(99.9)=999.72ms
       { expected_response:true }...: avg=382.85ms min=7.61ms  med=446.18ms max=1.15s   p(90)=630.1ms  p(95)=701.43ms p(99.9)=999.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 16957
     http_req_receiving.............: avg=93.42µs  min=31.47µs med=83.84µs  max=58.82ms p(90)=121.45µs p(95)=135.47µs p(99.9)=693.77µs
     http_req_sending...............: avg=38.52µs  min=5.28µs  med=16.13µs  max=87.39ms p(90)=21.1µs   p(95)=25.47µs  p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=382.72ms min=7.48ms  med=446.11ms max=1.15s   p(90)=630.03ms p(95)=701.29ms p(99.9)=999.59ms
     http_reqs......................: 16957   231.572592/s
     iteration_duration.............: avg=406.81ms min=8.72ms  med=470.83ms max=1.15s   p(90)=640.52ms p(95)=705.19ms p(99.9)=1s      
     iterations.....................: 15957   217.916132/s
     success_rate...................: 100.00% ✓ 15957      ✗ 0    
     vus............................: 59      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 445881      ✗ 0     
     data_received..................: 13 GB   212 MB/s
     data_sent......................: 180 MB  2.9 MB/s
     http_req_blocked...............: avg=22.54µs min=1.04µs  med=2.94µs   max=74.7ms  p(90)=4.8µs    p(95)=6.05µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=18.79µs min=0s      med=0s       max=74.5ms  p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=95.05ms min=1.5ms   med=80.63ms  max=2.26s   p(90)=181.19ms p(95)=215.7ms  p(99.9)=700.52ms
       { expected_response:true }...: avg=95.05ms min=1.5ms   med=80.63ms  max=2.26s   p(90)=181.19ms p(95)=215.7ms  p(99.9)=700.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149627
     http_req_receiving.............: avg=1.69ms  min=51.77µs med=105.93µs max=1.41s   p(90)=1.57ms   p(95)=4.5ms    p(99.9)=170.4ms 
     http_req_sending...............: avg=76.11µs min=5.02µs  med=11.01µs  max=284.5ms p(90)=21.26µs  p(95)=122.42µs p(99.9)=10.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.28ms min=1.42ms  med=79.52ms  max=2.26s   p(90)=178.85ms p(95)=212.35ms p(99.9)=681.28ms
     http_reqs......................: 149627  2417.703613/s
     iteration_duration.............: avg=96ms    min=2.13ms  med=81.63ms  max=2.27s   p(90)=181.95ms p(95)=216.87ms p(99.9)=705.99ms
     iterations.....................: 148627  2401.545409/s
     success_rate...................: 100.00% ✓ 148627      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 439887      ✗ 0     
     data_received..................: 13 GB   210 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=18.92µs  min=892ns   med=2.59µs   max=60.24ms  p(90)=4.28µs   p(95)=5.36µs   p(99.9)=1.61ms  
     http_req_connecting............: avg=15.43µs  min=0s      med=0s       max=60.15ms  p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=96.34ms  min=1.36ms  med=91.35ms  max=383.36ms p(90)=184.36ms p(95)=201.87ms p(99.9)=263.97ms
       { expected_response:true }...: avg=96.34ms  min=1.36ms  med=91.35ms  max=383.36ms p(90)=184.36ms p(95)=201.87ms p(99.9)=263.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147629
     http_req_receiving.............: avg=710.07µs min=51.78µs med=109.61µs max=186.69ms p(90)=1.32ms   p(95)=2.44ms   p(99.9)=30.34ms 
     http_req_sending...............: avg=68.38µs  min=4.85µs  med=10.09µs  max=147.06ms p(90)=19.29µs  p(95)=117.91µs p(99.9)=8.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.56ms  min=1.28ms  med=90.5ms   max=383.27ms p(90)=183.47ms p(95)=200.95ms p(99.9)=262.37ms
     http_reqs......................: 147629  2390.508964/s
     iteration_duration.............: avg=97.25ms  min=2.76ms  med=92.34ms  max=383.53ms p(90)=184.85ms p(95)=202.44ms p(99.9)=265.09ms
     iterations.....................: 146629  2374.316285/s
     success_rate...................: 100.00% ✓ 146629      ✗ 0     
     vus............................: 92      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 428766      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=14.13µs min=902ns   med=2.18µs   max=93.49ms  p(90)=3.66µs   p(95)=4.72µs   p(99.9)=887.32µs
     http_req_connecting............: avg=11.31µs min=0s      med=0s       max=93.44ms  p(90)=0s       p(95)=0s       p(99.9)=864.8µs 
     http_req_duration..............: avg=98.92ms min=1.55ms  med=84.75ms  max=1.53s    p(90)=186.89ms p(95)=218.41ms p(99.9)=779ms   
       { expected_response:true }...: avg=98.92ms min=1.55ms  med=84.75ms  max=1.53s    p(90)=186.89ms p(95)=218.41ms p(99.9)=779ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 143922
     http_req_receiving.............: avg=1.91ms  min=52.14µs med=107.89µs max=959.19ms p(90)=1.79ms   p(95)=4.74ms   p(99.9)=146.03ms
     http_req_sending...............: avg=62.4µs  min=5.01µs  med=9.37µs   max=147.39ms p(90)=18.44µs  p(95)=99.7µs   p(99.9)=8.17ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.94ms min=1.48ms  med=83.48ms  max=1.52s    p(90)=184.58ms p(95)=213.48ms p(99.9)=724.92ms
     http_reqs......................: 143922  2325.116836/s
     iteration_duration.............: avg=99.86ms min=2.81ms  med=85.83ms  max=1.53s    p(90)=187.53ms p(95)=219.34ms p(99.9)=782.38ms
     iterations.....................: 142922  2308.961441/s
     success_rate...................: 100.00% ✓ 142922      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 420891      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=17.09µs  min=932ns   med=2.79µs  max=52.65ms  p(90)=4.68µs   p(95)=5.92µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=13.61µs  min=0s      med=0s      max=52.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=100.67ms min=1.51ms  med=95.95ms max=304.76ms p(90)=195.02ms p(95)=211.98ms p(99.9)=264.49ms
       { expected_response:true }...: avg=100.67ms min=1.51ms  med=95.95ms max=304.76ms p(90)=195.02ms p(95)=211.98ms p(99.9)=264.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141297
     http_req_receiving.............: avg=137.99µs min=26.52µs med=58.89µs max=42.29ms  p(90)=144.31µs p(95)=374.73µs p(99.9)=13.09ms 
     http_req_sending...............: avg=72.1µs   min=5.16µs  med=11.72µs max=175.56ms p(90)=22.66µs  p(95)=136.13µs p(99.9)=9.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.46ms min=1.47ms  med=95.7ms  max=303.01ms p(90)=194.77ms p(95)=211.65ms p(99.9)=263.65ms
     http_reqs......................: 141297  2282.955799/s
     iteration_duration.............: avg=101.65ms min=3.86ms  med=97.03ms max=332.53ms p(90)=195.58ms p(95)=212.48ms p(99.9)=265.53ms
     iterations.....................: 140297  2266.798657/s
     success_rate...................: 100.00% ✓ 140297      ✗ 0     
     vus............................: 52      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 402456      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=19.18µs  min=1µs     med=2.97µs   max=75.42ms  p(90)=4.83µs   p(95)=6.05µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=15.29µs  min=0s      med=0s       max=75.35ms  p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=105.32ms min=1.8ms   med=91.45ms  max=1.35s    p(90)=195.85ms p(95)=228.68ms p(99.9)=960.54ms
       { expected_response:true }...: avg=105.32ms min=1.8ms   med=91.45ms  max=1.35s    p(90)=195.85ms p(95)=228.68ms p(99.9)=960.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135152
     http_req_receiving.............: avg=1.81ms   min=52.05µs med=115.27µs max=1.02s    p(90)=1.85ms   p(95)=4.61ms   p(99.9)=245.46ms
     http_req_sending...............: avg=68.67µs  min=4.95µs  med=11.36µs  max=188.95ms p(90)=22.08µs  p(95)=121.52µs p(99.9)=9.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.43ms min=1.7ms   med=90.27ms  max=1.28s    p(90)=194.06ms p(95)=226.16ms p(99.9)=734.89ms
     http_reqs......................: 135152  2171.86185/s
     iteration_duration.............: avg=106.37ms min=3.19ms  med=92.73ms  max=1.35s    p(90)=196.53ms p(95)=229.79ms p(99.9)=963.25ms
     iterations.....................: 134152  2155.792078/s
     success_rate...................: 100.00% ✓ 134152      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 206496      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=5.53µs  min=982ns   med=2.23µs   max=15.39ms  p(90)=3.9µs    p(95)=4.84µs   p(99.9)=346.64µs
     http_req_connecting............: avg=2.62µs  min=0s      med=0s       max=15.34ms  p(90)=0s       p(95)=0s       p(99.9)=307.03µs
     http_req_duration..............: avg=204.4ms min=1.88ms  med=205.81ms max=600.39ms p(90)=375.07ms p(95)=402.26ms p(99.9)=520.49ms
       { expected_response:true }...: avg=204.4ms min=1.88ms  med=205.81ms max=600.39ms p(90)=375.07ms p(95)=402.26ms p(99.9)=520.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69832
     http_req_receiving.............: avg=77.35µs min=29.79µs med=63.4µs   max=85.32ms  p(90)=104.45µs p(95)=121.22µs p(99.9)=1.11ms  
     http_req_sending...............: avg=28.07µs min=5.18µs  med=10.85µs  max=125.2ms  p(90)=17.93µs  p(95)=21.53µs  p(99.9)=2.54ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.3ms min=1.8ms   med=205.72ms max=600.32ms p(90)=374.98ms p(95)=402.17ms p(99.9)=520.41ms
     http_reqs......................: 69832   1115.789485/s
     iteration_duration.............: avg=207.6ms min=5.82ms  med=208.8ms  max=600.54ms p(90)=376.02ms p(95)=403.18ms p(99.9)=520.87ms
     iterations.....................: 68832   1099.811288/s
     success_rate...................: 100.00% ✓ 68832       ✗ 0    
     vus............................: 83      min=0         max=494
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103407     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 43 MB   659 kB/s
     http_req_blocked...............: avg=8µs      min=1.05µs  med=2.73µs   max=4.77ms   p(90)=4.51µs   p(95)=5.57µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=4.32µs   min=0s      med=0s       max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=404.54ms min=3.78ms  med=377.49ms max=1.67s    p(90)=793.46ms p(95)=858.87ms p(99.9)=1.29s   
       { expected_response:true }...: avg=404.54ms min=3.78ms  med=377.49ms max=1.67s    p(90)=793.46ms p(95)=858.87ms p(99.9)=1.29s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35469
     http_req_receiving.............: avg=83.3µs   min=29.13µs med=72.94µs  max=9.27ms   p(90)=112.57µs p(95)=126.96µs p(99.9)=940.22µs
     http_req_sending...............: avg=31.23µs  min=5.15µs  med=13.7µs   max=144.31ms p(90)=21.3µs   p(95)=24.27µs  p(99.9)=2.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=404.43ms min=3.67ms  med=377.42ms max=1.67s    p(90)=793.37ms p(95)=858.76ms p(99.9)=1.29s   
     http_reqs......................: 35469   549.10355/s
     iteration_duration.............: avg=416.52ms min=20.5ms  med=392.29ms max=1.68s    p(90)=796.94ms p(95)=861.51ms p(99.9)=1.3s    
     iterations.....................: 34469   533.622326/s
     success_rate...................: 100.00% ✓ 34469      ✗ 0    
     vus............................: 83      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45507      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   286 kB/s
     http_req_blocked...............: avg=16.81µs  min=1.51µs  med=3.74µs   max=18.04ms p(90)=5.51µs   p(95)=7.26µs   p(99.9)=2.38ms
     http_req_connecting............: avg=11.2µs   min=0s      med=0s       max=17.97ms p(90)=0s       p(95)=0s       p(99.9)=2.32ms
     http_req_duration..............: avg=901.55ms min=5.79ms  med=807.17ms max=5.15s   p(90)=1.79s    p(95)=2.02s    p(99.9)=4.5s  
       { expected_response:true }...: avg=901.55ms min=5.79ms  med=807.17ms max=5.15s   p(90)=1.79s    p(95)=2.02s    p(99.9)=4.5s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16169
     http_req_receiving.............: avg=100.79µs min=38.79µs med=91.32µs  max=11.3ms  p(90)=127.86µs p(95)=143.81µs p(99.9)=1.08ms
     http_req_sending...............: avg=31.97µs  min=6.93µs  med=18.06µs  max=24.96ms p(90)=23.92µs  p(95)=29.32µs  p(99.9)=4.67ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=901.42ms min=5.71ms  med=806.67ms max=5.15s   p(90)=1.79s    p(95)=2.02s    p(99.9)=4.5s  
     http_reqs......................: 16169   238.31207/s
     iteration_duration.............: avg=960.99ms min=32.07ms med=886.34ms max=5.16s   p(90)=1.8s     p(95)=2.04s    p(99.9)=4.54s 
     iterations.....................: 15169   223.573244/s
     success_rate...................: 100.00% ✓ 15169      ✗ 0    
     vus............................: 96      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45219      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   280 kB/s
     http_req_blocked...............: avg=13.89µs  min=1.31µs  med=3.62µs   max=16.4ms  p(90)=5.43µs   p(95)=7.37µs   p(99.9)=1.67ms
     http_req_connecting............: avg=8.36µs   min=0s      med=0s       max=16.35ms p(90)=0s       p(95)=0s       p(99.9)=1.64ms
     http_req_duration..............: avg=903.95ms min=7.78ms  med=817ms    max=3.04s   p(90)=1.84s    p(95)=1.95s    p(99.9)=2.88s 
       { expected_response:true }...: avg=903.95ms min=7.78ms  med=817ms    max=3.04s   p(90)=1.84s    p(95)=1.95s    p(99.9)=2.88s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16073
     http_req_receiving.............: avg=103.1µs  min=36.27µs med=90.52µs  max=51.52ms p(90)=132.19µs p(95)=150.12µs p(99.9)=1.47ms
     http_req_sending...............: avg=28.47µs  min=6.34µs  med=17.87µs  max=13.24ms p(90)=23.84µs  p(95)=28.4µs   p(99.9)=2.44ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=903.81ms min=7.65ms  med=816.93ms max=3.04s   p(90)=1.84s    p(95)=1.95s    p(99.9)=2.88s 
     http_reqs......................: 16073   233.629692/s
     iteration_duration.............: avg=963.89ms min=37.36ms med=909.97ms max=3.05s   p(90)=1.85s    p(95)=1.96s    p(99.9)=2.9s  
     iterations.....................: 15073   219.094155/s
     success_rate...................: 100.00% ✓ 15073      ✗ 0    
     vus............................: 99      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

