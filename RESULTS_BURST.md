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
| hive-router | v0.0.49 | 2,651 | 2,779 | 2,609 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,040 | 2,089 | 2,023 | 1.0% |  |
| cosmo | 0.307.0 | 1,197 | 1,197 | 1,197 | 0.0% | non-compatible response (16 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 510 | 514 | 505 | 0.6% |  |
| hive-gateway | 2.5.25 | 226 | 228 | 223 | 0.8% |  |
| apollo-gateway | 2.13.3 | 204 | 209 | 203 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (18331 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (480514 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,336 | 2,437 | 2,297 | 1.9% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,866 | 1,907 | 1,845 | 1.1% |  |
| cosmo | 0.307.0 | 1,144 | 1,144 | 1,142 | 0.1% | non-compatible response (18 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 478 | 484 | 473 | 0.8% |  |
| hive-gateway | 2.5.25 | 227 | 230 | 225 | 0.7% |  |
| apollo-gateway | 2.13.3 | 206 | 209 | 205 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (20653 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (274438 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 489357      ✗ 0     
     data_received..................: 14 GB   233 MB/s
     data_sent......................: 197 MB  3.2 MB/s
     http_req_blocked...............: avg=26.35µs  min=931ns   med=2.16µs  max=82.52ms  p(90)=3.5µs    p(95)=4.52µs   p(99.9)=7.53ms  
     http_req_connecting............: avg=23.16µs  min=0s      med=0s      max=82.42ms  p(90)=0s       p(95)=0s       p(99.9)=7.26ms  
     http_req_duration..............: avg=86.52ms  min=1.66ms  med=81.79ms max=286.49ms p(90)=167.18ms p(95)=180.95ms p(99.9)=227.78ms
       { expected_response:true }...: avg=86.52ms  min=1.66ms  med=81.79ms max=286.49ms p(90)=167.18ms p(95)=180.95ms p(99.9)=227.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164119
     http_req_receiving.............: avg=250.02µs min=28.99µs med=56.12µs max=128.08ms p(90)=179.29µs p(95)=388.42µs p(99.9)=27.15ms 
     http_req_sending...............: avg=79.46µs  min=5.22µs  med=9.64µs  max=68.3ms   p(90)=17.76µs  p(95)=126.11µs p(99.9)=11.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.19ms  min=1.6ms   med=81.49ms max=274.71ms p(90)=166.71ms p(95)=180.39ms p(99.9)=225.75ms
     http_reqs......................: 164119  2651.483134/s
     iteration_duration.............: avg=87.39ms  min=2.53ms  med=82.7ms  max=400.1ms  p(90)=167.77ms p(95)=181.51ms p(99.9)=233.16ms
     iterations.....................: 163119  2635.327277/s
     success_rate...................: 100.00% ✓ 163119      ✗ 0     
     vus............................: 53      min=0         max=499 
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

     checks.........................: 100.00% ✓ 381243      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=15.79µs  min=992ns   med=2.15µs   max=147.39ms p(90)=3.36µs   p(95)=4.24µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=13.01µs  min=0s      med=0s       max=147.33ms p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=111.11ms min=2.35ms  med=99.91ms  max=822.41ms p(90)=215.2ms  p(95)=256.55ms p(99.9)=484.69ms
       { expected_response:true }...: avg=111.11ms min=2.35ms  med=99.91ms  max=822.41ms p(90)=215.2ms  p(95)=256.55ms p(99.9)=484.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128081
     http_req_receiving.............: avg=2ms      min=52.15µs med=114.82µs max=601.59ms p(90)=1.39ms   p(95)=4.85ms   p(99.9)=193.1ms 
     http_req_sending...............: avg=60.45µs  min=5.17µs  med=9.4µs    max=68.8ms   p(90)=16.74µs  p(95)=116.19µs p(99.9)=8.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.05ms min=2.27ms  med=98.78ms  max=815.02ms p(90)=211.56ms p(95)=249.42ms p(99.9)=446.72ms
     http_reqs......................: 128081  2040.31824/s
     iteration_duration.............: avg=112.27ms min=3.66ms  med=101.29ms max=822.63ms p(90)=215.97ms p(95)=257.81ms p(99.9)=484.91ms
     iterations.....................: 127081  2024.388334/s
     success_rate...................: 100.00% ✓ 127081      ✗ 0     
     vus............................: 93      min=0         max=500 
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

     checks.........................: 100.00% ✓ 221517      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.09µs   min=1.08µs med=2.38µs   max=16.97ms  p(90)=3.98µs   p(95)=4.91µs   p(99.9)=457.84µs
     http_req_connecting............: avg=3.02µs   min=0s     med=0s       max=16.92ms  p(90)=0s       p(95)=0s       p(99.9)=385.39µs
     http_req_duration..............: avg=190.67ms min=2.09ms med=192.45ms max=700.98ms p(90)=351.4ms  p(95)=378.02ms p(99.9)=527.14ms
       { expected_response:true }...: avg=190.67ms min=2.09ms med=192.45ms max=700.98ms p(90)=351.4ms  p(95)=378.02ms p(99.9)=527.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74839
     http_req_receiving.............: avg=117.89µs min=29.2µs med=61.42µs  max=223.47ms p(90)=96.2µs   p(95)=111.07µs p(99.9)=2.94ms  
     http_req_sending...............: avg=29.04µs  min=5.41µs med=10.62µs  max=23.51ms  p(90)=16.93µs  p(95)=20.79µs  p(99.9)=3.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.53ms min=1.98ms med=192.25ms max=700.88ms p(90)=351.28ms p(95)=377.9ms  p(99.9)=527.03ms
     http_reqs......................: 74839   1197.903395/s
     iteration_duration.............: avg=193.49ms min=4.64ms med=195.43ms max=701.2ms  p(90)=352.32ms p(95)=378.68ms p(99.9)=528.06ms
     iterations.....................: 73839   1181.896989/s
     success_rate...................: 100.00% ✓ 73839       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 96144      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   613 kB/s
     http_req_blocked...............: avg=10.18µs  min=1.15µs  med=2.95µs   max=40.64ms p(90)=4.8µs    p(95)=5.87µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=6.11µs   min=0s      med=0s       max=40.57ms p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=434.48ms min=3.87ms  med=404.45ms max=1.83s   p(90)=860.8ms  p(95)=928.24ms p(99.9)=1.37s   
       { expected_response:true }...: avg=434.48ms min=3.87ms  med=404.45ms max=1.83s   p(90)=860.8ms  p(95)=928.24ms p(99.9)=1.37s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33048
     http_req_receiving.............: avg=89.58µs  min=32.16µs med=78.22µs  max=82.25ms p(90)=115.41µs p(95)=129.89µs p(99.9)=773.03µs
     http_req_sending...............: avg=34.23µs  min=5.78µs  med=13.81µs  max=94.11ms p(90)=21.65µs  p(95)=24.93µs  p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=434.36ms min=3.77ms  med=404.35ms max=1.83s   p(90)=860.7ms  p(95)=928.14ms p(99.9)=1.37s   
     http_reqs......................: 33048   510.795756/s
     iteration_duration.............: avg=448.25ms min=18.4ms  med=420.15ms max=1.84s   p(90)=864.4ms  p(95)=931.32ms p(99.9)=1.37s   
     iterations.....................: 32048   495.339579/s
     success_rate...................: 100.00% ✓ 32048      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 43470      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   273 kB/s
     http_req_blocked...............: avg=21µs     min=1.32µs  med=3.59µs   max=17.37ms p(90)=5.57µs   p(95)=7.44µs   p(99.9)=3.96ms  
     http_req_connecting............: avg=14.94µs  min=0s      med=0s       max=17.31ms p(90)=0s       p(95)=0s       p(99.9)=3.65ms  
     http_req_duration..............: avg=935.04ms min=6.32ms  med=838.15ms max=11.53s  p(90)=1.79s    p(95)=1.96s    p(99.9)=10.39s  
       { expected_response:true }...: avg=935.04ms min=6.32ms  med=838.15ms max=11.53s  p(90)=1.79s    p(95)=1.96s    p(99.9)=10.39s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15490
     http_req_receiving.............: avg=110.49µs min=36.59µs med=100.31µs max=62.28ms p(90)=140.53µs p(95)=153.38µs p(99.9)=783.72µs
     http_req_sending...............: avg=36.39µs  min=6.03µs  med=18.05µs  max=21.32ms p(90)=24.41µs  p(95)=29.54µs  p(99.9)=4.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=934.89ms min=6.22ms  med=838.05ms max=11.53s  p(90)=1.79s    p(95)=1.96s    p(99.9)=10.39s  
     http_reqs......................: 15490   226.823571/s
     iteration_duration.............: avg=999.52ms min=34.06ms med=914.41ms max=11.53s  p(90)=1.81s    p(95)=1.97s    p(99.9)=10.41s  
     iterations.....................: 14490   212.180345/s
     success_rate...................: 100.00% ✓ 14490      ✗ 0    
     vus............................: 73      min=0        max=500
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

     checks.........................: 100.00% ✓ 42561      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=15.89µs  min=1.25µs  med=3.33µs   max=26.91ms  p(90)=5.08µs   p(95)=6.69µs   p(99.9)=2.29ms
     http_req_connecting............: avg=10.82µs  min=0s      med=0s       max=26.73ms  p(90)=0s       p(95)=0s       p(99.9)=2.26ms
     http_req_duration..............: avg=482.94ms min=8.49ms  med=540.93ms max=1.42s    p(90)=826.51ms p(95)=896.66ms p(99.9)=1.27s 
       { expected_response:true }...: avg=482.94ms min=8.49ms  med=540.93ms max=1.42s    p(90)=826.51ms p(95)=896.66ms p(99.9)=1.27s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15187
     http_req_receiving.............: avg=111.87µs min=34.12µs med=93.5µs   max=112.29ms p(90)=134.42µs p(95)=147.8µs  p(99.9)=1.09ms
     http_req_sending...............: avg=39.9µs   min=6.03µs  med=16.8µs   max=81.32ms  p(90)=22.97µs  p(95)=27.81µs  p(99.9)=3.21ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=482.79ms min=8.33ms  med=540.86ms max=1.42s    p(90)=826.35ms p(95)=896.53ms p(99.9)=1.27s 
     http_reqs......................: 15187   204.154942/s
     iteration_duration.............: avg=516.91ms min=14.69ms med=574.21ms max=1.42s    p(90)=834.31ms p(95)=904.16ms p(99.9)=1.28s 
     iterations.....................: 14187   190.712198/s
     success_rate...................: 100.00% ✓ 14187      ✗ 0    
     vus............................: 58      min=0        max=496
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

     checks.........................: 100.00% ✓ 431700      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 174 MB  2.8 MB/s
     http_req_blocked...............: avg=22.74µs min=952ns   med=2.39µs  max=56.91ms  p(90)=4.11µs   p(95)=5.43µs   p(99.9)=2.75ms 
     http_req_connecting............: avg=19.18µs min=0s      med=0s      max=56.86ms  p(90)=0s       p(95)=0s       p(99.9)=2.64ms 
     http_req_duration..............: avg=98.12ms min=1.6ms   med=92.29ms max=292.77ms p(90)=190.28ms p(95)=207.09ms p(99.9)=253.3ms
       { expected_response:true }...: avg=98.12ms min=1.6ms   med=92.29ms max=292.77ms p(90)=190.28ms p(95)=207.09ms p(99.9)=253.3ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144900
     http_req_receiving.............: avg=274.4µs min=29.39µs med=59.81µs max=115.2ms  p(90)=192.16µs p(95)=424.54µs p(99.9)=31.88ms
     http_req_sending...............: avg=80.78µs min=5.26µs  med=10.62µs max=186.7ms  p(90)=21.46µs  p(95)=138.54µs p(99.9)=11.69ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=97.77ms min=1.56ms  med=91.99ms max=292.33ms p(90)=189.72ms p(95)=206.31ms p(99.9)=250.5ms
     http_reqs......................: 144900  2336.808088/s
     iteration_duration.............: avg=99.1ms  min=3.45ms  med=93.38ms max=408.2ms  p(90)=190.82ms p(95)=207.54ms p(99.9)=254.5ms
     iterations.....................: 143900  2320.681048/s
     success_rate...................: 100.00% ✓ 143900      ✗ 0     
     vus............................: 56      min=0         max=498 
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

     checks.........................: 100.00% ✓ 345495      ✗ 0     
     data_received..................: 10 GB   164 MB/s
     data_sent......................: 140 MB  2.2 MB/s
     http_req_blocked...............: avg=12.65µs  min=1.01µs  med=2.29µs   max=47.25ms  p(90)=3.81µs   p(95)=4.83µs   p(99.9)=984.91µs
     http_req_connecting............: avg=9.75µs   min=0s      med=0s       max=47.16ms  p(90)=0s       p(95)=0s       p(99.9)=933.94µs
     http_req_duration..............: avg=122.61ms min=1.78ms  med=114.13ms max=1.03s    p(90)=234.15ms p(95)=266.25ms p(99.9)=693.27ms
       { expected_response:true }...: avg=122.61ms min=1.78ms  med=114.13ms max=1.03s    p(90)=234.15ms p(95)=266.25ms p(99.9)=693.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 116165
     http_req_receiving.............: avg=1.61ms   min=53.44µs med=117.3µs  max=377.26ms p(90)=1.72ms   p(95)=4.39ms   p(99.9)=125.04ms
     http_req_sending...............: avg=53.99µs  min=5.21µs  med=9.72µs   max=86.34ms  p(90)=18.57µs  p(95)=113.77µs p(99.9)=7.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.94ms min=1.7ms   med=112.96ms max=1.03s    p(90)=231.56ms p(95)=261.85ms p(99.9)=690.39ms
     http_reqs......................: 116165  1866.401889/s
     iteration_duration.............: avg=123.94ms min=3ms     med=115.75ms max=1.03s    p(90)=234.79ms p(95)=267.05ms p(99.9)=693.61ms
     iterations.....................: 115165  1850.335071/s
     success_rate...................: 100.00% ✓ 115165      ✗ 0     
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

     checks.........................: 100.00% ✓ 212013      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=9.4µs    min=1.1µs   med=2.81µs   max=17.25ms  p(90)=4.59µs   p(95)=5.6µs    p(99.9)=629.51µs
     http_req_connecting............: avg=5.89µs   min=0s      med=0s       max=17.19ms  p(90)=0s       p(95)=0s       p(99.9)=576.18µs
     http_req_duration..............: avg=199.1ms  min=2.13ms  med=198.16ms max=589.66ms p(90)=369.24ms p(95)=398.02ms p(99.9)=508.86ms
       { expected_response:true }...: avg=199.1ms  min=2.13ms  med=198.16ms max=589.66ms p(90)=369.24ms p(95)=398.02ms p(99.9)=508.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71671
     http_req_receiving.............: avg=117.32µs min=30.26µs med=68.62µs  max=126.3ms  p(90)=108.45µs p(95)=126.14µs p(99.9)=3.63ms  
     http_req_sending...............: avg=33.54µs  min=5.45µs  med=12.32µs  max=28.18ms  p(90)=19.71µs  p(95)=23.67µs  p(99.9)=4.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.95ms min=2.04ms  med=197.92ms max=589.55ms p(90)=369.14ms p(95)=397.91ms p(99.9)=508.77ms
     http_reqs......................: 71671   1144.603122/s
     iteration_duration.............: avg=202.19ms min=4.46ms  med=201.49ms max=589.97ms p(90)=370.3ms  p(95)=398.82ms p(99.9)=509.29ms
     iterations.....................: 70671   1128.632881/s
     success_rate...................: 100.00% ✓ 70671       ✗ 0    
     vus............................: 87      min=0         max=498
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

     checks.........................: 100.00% ✓ 90693      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 38 MB   575 kB/s
     http_req_blocked...............: avg=12.37µs  min=1.23µs  med=3.21µs   max=51.74ms  p(90)=5.1µs    p(95)=6.13µs   p(99.9)=1.95ms 
     http_req_connecting............: avg=8.11µs   min=0s      med=0s       max=51.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.93ms 
     http_req_duration..............: avg=459.85ms min=4.13ms  med=428.27ms max=1.78s    p(90)=908.49ms p(95)=985.38ms p(99.9)=1.45s  
       { expected_response:true }...: avg=459.85ms min=4.13ms  med=428.27ms max=1.78s    p(90)=908.49ms p(95)=985.38ms p(99.9)=1.45s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31231
     http_req_receiving.............: avg=168.16µs min=33.16µs med=83.98µs  max=187.46ms p(90)=121.27µs p(95)=135.74µs p(99.9)=22.46ms
     http_req_sending...............: avg=27.67µs  min=5.99µs  med=15.07µs  max=26.59ms  p(90)=22.34µs  p(95)=25.59µs  p(99.9)=3.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=459.65ms min=4.06ms  med=428.19ms max=1.78s    p(90)=908.4ms  p(95)=985.26ms p(99.9)=1.45s  
     http_reqs......................: 31231   478.80367/s
     iteration_duration.............: avg=475.31ms min=8.67ms  med=449.37ms max=1.78s    p(90)=912.11ms p(95)=989.13ms p(99.9)=1.46s  
     iterations.....................: 30231   463.472631/s
     success_rate...................: 100.00% ✓ 30231      ✗ 0    
     vus............................: 69      min=0        max=496
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

     checks.........................: 100.00% ✓ 43623      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   274 kB/s
     http_req_blocked...............: avg=19.59µs  min=1.17µs  med=3.5µs    max=25.96ms p(90)=5.36µs   p(95)=7.2µs    p(99.9)=3.15ms
     http_req_connecting............: avg=14.28µs  min=0s      med=0s       max=25.9ms  p(90)=0s       p(95)=0s       p(99.9)=3.11ms
     http_req_duration..............: avg=938.95ms min=6.35ms  med=835.18ms max=5.86s   p(90)=1.85s    p(95)=2.05s    p(99.9)=4.8s  
       { expected_response:true }...: avg=938.95ms min=6.35ms  med=835.18ms max=5.86s   p(90)=1.85s    p(95)=2.05s    p(99.9)=4.8s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15541
     http_req_receiving.............: avg=105.33µs min=33.27µs med=96.98µs  max=53.1ms  p(90)=134.53µs p(95)=146.55µs p(99.9)=1.13ms
     http_req_sending...............: avg=30.65µs  min=5.49µs  med=18.1µs   max=32.66ms p(90)=24.09µs  p(95)=29.07µs  p(99.9)=2.89ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=938.81ms min=6.25ms  med=835.1ms  max=5.86s   p(90)=1.85s    p(95)=2.05s    p(99.9)=4.8s  
     http_reqs......................: 15541   227.990272/s
     iteration_duration.............: avg=1s       min=45.05ms med=904.5ms  max=5.87s   p(90)=1.87s    p(95)=2.06s    p(99.9)=4.82s 
     iterations.....................: 14541   213.320027/s
     success_rate...................: 100.00% ✓ 14541      ✗ 0    
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

     checks.........................: 100.00% ✓ 40383      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   247 kB/s
     http_req_blocked...............: avg=20.45µs  min=1.27µs  med=3.62µs   max=44.81ms  p(90)=5.47µs   p(95)=7.07µs   p(99.9)=2.76ms  
     http_req_connecting............: avg=14.97µs  min=0s      med=0s       max=44.75ms  p(90)=0s       p(95)=0s       p(99.9)=2.74ms  
     http_req_duration..............: avg=1s       min=8.82ms  med=915.48ms max=4.11s    p(90)=2.07s    p(95)=2.16s    p(99.9)=3.78s   
       { expected_response:true }...: avg=1s       min=8.82ms  med=915.48ms max=4.11s    p(90)=2.07s    p(95)=2.16s    p(99.9)=3.78s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14461
     http_req_receiving.............: avg=112.64µs min=35.8µs  med=98.55µs  max=116.59ms p(90)=139.14µs p(95)=151.19µs p(99.9)=956.41µs
     http_req_sending...............: avg=32.92µs  min=6.08µs  med=17.8µs   max=85.54ms  p(90)=23.8µs   p(95)=28.94µs  p(99.9)=2.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s       min=8.7ms   med=915.37ms max=4.11s    p(90)=2.07s    p(95)=2.16s    p(99.9)=3.78s   
     http_reqs......................: 14461   206.165679/s
     iteration_duration.............: avg=1.08s    min=64.83ms med=1.01s    max=4.12s    p(90)=2.08s    p(95)=2.16s    p(99.9)=3.8s    
     iterations.....................: 13461   191.90901/s
     success_rate...................: 100.00% ✓ 13461      ✗ 0    
     vus............................: 61      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

