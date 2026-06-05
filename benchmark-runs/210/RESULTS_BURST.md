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
| hive-router | v0.0.49 | 2,696 | 2,808 | 2,645 | 2.1% |  |
| hotchocolate | 16.1.2-p.2 | 2,077 | 2,103 | 2,027 | 1.4% |  |
| cosmo | 0.307.0 | 1,193 | 1,196 | 1,187 | 0.3% | non-compatible response (8 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 498 | 504 | 495 | 0.6% |  |
| hive-gateway | 2.5.25 | 217 | 218 | 215 | 0.5% |  |
| apollo-gateway | 2.13.3 | 202 | 207 | 202 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (29810 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (471470 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,320 | 2,391 | 2,269 | 1.9% |  |
| hotchocolate | 16.1.2-p.2 | 1,957 | 1,971 | 1,854 | 1.8% |  |
| cosmo | 0.307.0 | 1,125 | 1,140 | 1,118 | 0.9% | non-compatible response (11 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 476 | 485 | 471 | 1.0% |  |
| hive-gateway | 2.5.25 | 213 | 217 | 212 | 0.7% |  |
| apollo-gateway | 2.13.3 | 209 | 211 | 207 | 0.6% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (7046 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (327568 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 496917      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=23.04µs  min=1µs     med=2.26µs  max=76.74ms  p(90)=3.62µs   p(95)=4.64µs   p(99.9)=2.18ms  
     http_req_connecting............: avg=19.71µs  min=0s      med=0s      max=76.67ms  p(90)=0s       p(95)=0s       p(99.9)=1.99ms  
     http_req_duration..............: avg=85.26ms  min=1.57ms  med=80.44ms max=369.71ms p(90)=164.78ms p(95)=178.46ms p(99.9)=226.71ms
       { expected_response:true }...: avg=85.26ms  min=1.57ms  med=80.44ms max=369.71ms p(90)=164.78ms p(95)=178.46ms p(99.9)=226.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166639
     http_req_receiving.............: avg=350.78µs min=29.47µs med=55.51µs max=216.93ms p(90)=214.64µs p(95)=406.79µs p(99.9)=38.1ms  
     http_req_sending...............: avg=83.47µs  min=5.21µs  med=9.77µs  max=159.6ms  p(90)=17.87µs  p(95)=130.27µs p(99.9)=12.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.83ms  min=1.52ms  med=80.17ms max=368.9ms  p(90)=164.01ms p(95)=177.45ms p(99.9)=221.46ms
     http_reqs......................: 166639  2696.619835/s
     iteration_duration.............: avg=86.06ms  min=2.26ms  med=81.36ms max=380.4ms  p(90)=165.23ms p(95)=178.9ms  p(99.9)=227.81ms
     iterations.....................: 165639  2680.43743/s
     success_rate...................: 100.00% ✓ 165639      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.2-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 388245      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=14.73µs  min=981ns   med=2.21µs   max=97.25ms  p(90)=3.43µs   p(95)=4.3µs    p(99.9)=1.8ms   
     http_req_connecting............: avg=11.8µs   min=0s      med=0s       max=97.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=109.12ms min=2.4ms   med=102.34ms max=1.67s    p(90)=210.96ms p(95)=242.35ms p(99.9)=422.2ms 
       { expected_response:true }...: avg=109.12ms min=2.4ms   med=102.34ms max=1.67s    p(90)=210.96ms p(95)=242.35ms p(99.9)=422.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 130415
     http_req_receiving.............: avg=1.43ms   min=52.13µs med=113.52µs max=340.46ms p(90)=1.18ms   p(95)=3.52ms   p(99.9)=113ms   
     http_req_sending...............: avg=59.31µs  min=5.41µs  med=9.53µs   max=60.04ms  p(90)=17.44µs  p(95)=120.49µs p(99.9)=8.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.63ms min=2.29ms  med=101.25ms max=1.67s    p(90)=209.2ms  p(95)=237.75ms p(99.9)=403.79ms
     http_reqs......................: 130415  2077.030864/s
     iteration_duration.............: avg=110.22ms min=3.19ms  med=103.62ms max=1.67s    p(90)=211.6ms  p(95)=243.16ms p(99.9)=423.01ms
     iterations.....................: 129415  2061.104545/s
     success_rate...................: 100.00% ✓ 129415      ✗ 0     
     vus............................: 95      min=0         max=499 
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

     checks.........................: 100.00% ✓ 220629      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=8.05µs   min=1.11µs  med=2.42µs   max=15.46ms  p(90)=4.02µs   p(95)=4.93µs   p(99.9)=607.47µs
     http_req_connecting............: avg=4.82µs   min=0s      med=0s       max=15.3ms   p(90)=0s       p(95)=0s       p(99.9)=507.92µs
     http_req_duration..............: avg=191.45ms min=2.03ms  med=192.23ms max=582.93ms p(90)=355.83ms p(95)=382.6ms  p(99.9)=515.54ms
       { expected_response:true }...: avg=191.45ms min=2.03ms  med=192.23ms max=582.93ms p(90)=355.83ms p(95)=382.6ms  p(99.9)=515.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74543
     http_req_receiving.............: avg=111.4µs  min=30.01µs med=61.07µs  max=148.72ms p(90)=94.14µs  p(95)=107.92µs p(99.9)=2.33ms  
     http_req_sending...............: avg=30.38µs  min=5.38µs  med=10.55µs  max=32.72ms  p(90)=16.29µs  p(95)=20.05µs  p(99.9)=4.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.31ms min=1.98ms  med=192.07ms max=582.84ms p(90)=355.74ms p(95)=382.51ms p(99.9)=515.45ms
     http_reqs......................: 74543   1193.114849/s
     iteration_duration.............: avg=194.3ms  min=3.1ms   med=195.22ms max=583.08ms p(90)=356.8ms  p(95)=383.22ms p(99.9)=516.12ms
     iterations.....................: 73543   1177.109122/s
     success_rate...................: 100.00% ✓ 73543       ✗ 0    
     vus............................: 78      min=0         max=493
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

     checks.........................: 100.00% ✓ 93927      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   598 kB/s
     http_req_blocked...............: avg=9µs      min=1.15µs  med=2.97µs   max=6.59ms  p(90)=4.86µs   p(95)=6.03µs   p(99.9)=1.36ms  
     http_req_connecting............: avg=4.82µs   min=0s      med=0s       max=6.09ms  p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=444.51ms min=4ms     med=414.27ms max=1.96s   p(90)=875.06ms p(95)=954.9ms  p(99.9)=1.37s   
       { expected_response:true }...: avg=444.51ms min=4ms     med=414.27ms max=1.96s   p(90)=875.06ms p(95)=954.9ms  p(99.9)=1.37s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32309
     http_req_receiving.............: avg=96.22µs  min=33.01µs med=76.95µs  max=172.1ms p(90)=113.59µs p(95)=127.33µs p(99.9)=882.88µs
     http_req_sending...............: avg=32.51µs  min=5.88µs  med=13.07µs  max=91.42ms p(90)=20.43µs  p(95)=23.77µs  p(99.9)=2.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=444.39ms min=3.94ms  med=414.12ms max=1.96s   p(90)=874.91ms p(95)=954.76ms p(99.9)=1.37s   
     http_reqs......................: 32309   498.051727/s
     iteration_duration.............: avg=458.93ms min=21.32ms med=432.22ms max=1.96s   p(90)=880.5ms  p(95)=958.78ms p(99.9)=1.38s   
     iterations.....................: 31309   482.636465/s
     success_rate...................: 100.00% ✓ 31309      ✗ 0    
     vus............................: 30      min=0        max=500
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

     checks.........................: 100.00% ✓ 41694      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   263 kB/s
     http_req_blocked...............: avg=15.41µs  min=1.36µs  med=3.58µs   max=4.18ms  p(90)=5.44µs   p(95)=7.38µs   p(99.9)=2.84ms
     http_req_connecting............: avg=10.16µs  min=0s      med=0s       max=4.14ms  p(90)=0s       p(95)=0s       p(99.9)=2.81ms
     http_req_duration..............: avg=951.65ms min=6.15ms  med=819.22ms max=20.74s  p(90)=1.62s    p(95)=1.8s     p(99.9)=19.11s
       { expected_response:true }...: avg=951.65ms min=6.15ms  med=819.22ms max=20.74s  p(90)=1.62s    p(95)=1.8s     p(99.9)=19.11s
     http_req_failed................: 0.00%   ✓ 0          ✗ 14898
     http_req_receiving.............: avg=107.78µs min=38.6µs  med=95.78µs  max=52.75ms p(90)=137.84µs p(95)=152.21µs p(99.9)=1.15ms
     http_req_sending...............: avg=33.36µs  min=6.25µs  med=16.58µs  max=90.72ms p(90)=23.15µs  p(95)=28.46µs  p(99.9)=2.23ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=951.51ms min=6.08ms  med=819.07ms max=20.74s  p(90)=1.62s    p(95)=1.8s     p(99.9)=19.11s
     http_reqs......................: 14898   217.956095/s
     iteration_duration.............: avg=1.02s    min=53.29ms med=885.38ms max=20.74s  p(90)=1.64s    p(95)=1.83s    p(99.9)=19.13s
     iterations.....................: 13898   203.326206/s
     success_rate...................: 100.00% ✓ 13898      ✗ 0    
     vus............................: 64      min=0        max=498
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

     checks.........................: 100.00% ✓ 42246      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   248 kB/s
     http_req_blocked...............: avg=12.41µs  min=1.32µs  med=3.35µs   max=2.75ms   p(90)=5.1µs    p(95)=6.73µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=7.41µs   min=0s      med=0s       max=2.73ms   p(90)=0s       p(95)=0s       p(99.9)=1.54ms  
     http_req_duration..............: avg=462.23ms min=8.47ms  med=536.86ms max=1.26s    p(90)=788.79ms p(95)=847.4ms  p(99.9)=1.16s   
       { expected_response:true }...: avg=462.23ms min=8.47ms  med=536.86ms max=1.26s    p(90)=788.79ms p(95)=847.4ms  p(99.9)=1.16s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15082
     http_req_receiving.............: avg=115.09µs min=36.14µs med=91.63µs  max=131.61ms p(90)=131.63µs p(95)=145.36µs p(99.9)=915.76µs
     http_req_sending...............: avg=46.21µs  min=6.12µs  med=16.75µs  max=116.7ms  p(90)=22.77µs  p(95)=27.89µs  p(99.9)=2.49ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=462.07ms min=8.35ms  med=536.73ms max=1.26s    p(90)=788.69ms p(95)=847.27ms p(99.9)=1.16s   
     http_reqs......................: 15082   202.238722/s
     iteration_duration.............: avg=494.92ms min=8.97ms  med=569.52ms max=1.27s    p(90)=795.77ms p(95)=853.77ms p(99.9)=1.18s   
     iterations.....................: 14082   188.829444/s
     success_rate...................: 100.00% ✓ 14082      ✗ 0    
     vus............................: 79      min=0        max=500
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

     checks.........................: 100.00% ✓ 429573      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=28.11µs  min=1.06µs  med=2.85µs  max=77.15ms  p(90)=4.69µs   p(95)=6.03µs   p(99.9)=4.44ms  
     http_req_connecting............: avg=24.45µs  min=0s      med=0s      max=77.06ms  p(90)=0s       p(95)=0s       p(99.9)=4.19ms  
     http_req_duration..............: avg=98.6ms   min=1.67ms  med=91.99ms max=340.59ms p(90)=193.35ms p(95)=214.2ms  p(99.9)=282.87ms
       { expected_response:true }...: avg=98.6ms   min=1.67ms  med=91.99ms max=340.59ms p(90)=193.35ms p(95)=214.2ms  p(99.9)=282.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144191
     http_req_receiving.............: avg=229.59µs min=28.48µs med=61.49µs max=68.79ms  p(90)=185.54µs p(95)=419.95µs p(99.9)=32.32ms 
     http_req_sending...............: avg=85.88µs  min=5.33µs  med=11.39µs max=212.66ms p(90)=21.88µs  p(95)=141.6µs  p(99.9)=12.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.28ms  min=1.61ms  med=91.72ms max=340.52ms p(90)=192.88ms p(95)=213.49ms p(99.9)=281.44ms
     http_reqs......................: 144191  2320.362055/s
     iteration_duration.............: avg=99.58ms  min=4.29ms  med=93.07ms max=384.41ms p(90)=194.01ms p(95)=214.89ms p(99.9)=285.52ms
     iterations.....................: 143191  2304.269774/s
     success_rate...................: 100.00% ✓ 143191      ✗ 0     
     vus............................: 63      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.2-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 362211      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 146 MB  2.4 MB/s
     http_req_blocked...............: avg=14.56µs  min=1µs     med=2.3µs    max=53.89ms  p(90)=3.86µs   p(95)=4.96µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=11.57µs  min=0s      med=0s       max=53.83ms  p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=116.94ms min=1.77ms  med=108.62ms max=773.35ms p(90)=227.17ms p(95)=256.4ms  p(99.9)=548.73ms
       { expected_response:true }...: avg=116.94ms min=1.77ms  med=108.62ms max=773.35ms p(90)=227.17ms p(95)=256.4ms  p(99.9)=548.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 121737
     http_req_receiving.............: avg=1.69ms   min=51.76µs med=112.4µs  max=313.16ms p(90)=1.61ms   p(95)=4.15ms   p(99.9)=150.35ms
     http_req_sending...............: avg=59.66µs  min=5.21µs  med=9.86µs   max=206.4ms  p(90)=19.37µs  p(95)=121.06µs p(99.9)=8.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.18ms min=1.69ms  med=107.39ms max=772.99ms p(90)=224.76ms p(95)=251.6ms  p(99.9)=530.84ms
     http_reqs......................: 121737  1957.761115/s
     iteration_duration.............: avg=118.17ms min=3.27ms  med=109.94ms max=773.66ms p(90)=227.89ms p(95)=257.06ms p(99.9)=550.16ms
     iterations.....................: 120737  1941.679224/s
     success_rate...................: 100.00% ✓ 120737      ✗ 0     
     vus............................: 67      min=0         max=496 
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

     checks.........................: 100.00% ✓ 208389      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=8.73µs   min=1.13µs  med=2.7µs    max=14.01ms  p(90)=4.47µs   p(95)=5.47µs   p(99.9)=908.65µs
     http_req_connecting............: avg=5.03µs   min=0s      med=0s       max=13.88ms  p(90)=0s       p(95)=0s       p(99.9)=703.85µs
     http_req_duration..............: avg=202.53ms min=2.08ms  med=202.04ms max=552.83ms p(90)=375.66ms p(95)=402.98ms p(99.9)=492.72ms
       { expected_response:true }...: avg=202.53ms min=2.08ms  med=202.04ms max=552.83ms p(90)=375.66ms p(95)=402.98ms p(99.9)=492.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70463
     http_req_receiving.............: avg=168.46µs min=30.42µs med=66.83µs  max=292.36ms p(90)=104.26µs p(95)=120.56µs p(99.9)=3.44ms  
     http_req_sending...............: avg=31.61µs  min=5.27µs  med=11.74µs  max=32.83ms  p(90)=18.45µs  p(95)=22.3µs   p(99.9)=3.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.33ms min=2.02ms  med=201.78ms max=552.68ms p(90)=375.49ms p(95)=402.89ms p(99.9)=492.46ms
     http_reqs......................: 70463   1125.6562/s
     iteration_duration.............: avg=205.69ms min=5.01ms  med=205.76ms max=553.12ms p(90)=376.67ms p(95)=403.82ms p(99.9)=493.19ms
     iterations.....................: 69463   1109.681061/s
     success_rate...................: 100.00% ✓ 69463       ✗ 0    
     vus............................: 87      min=0         max=496
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

     checks.........................: 100.00% ✓ 90297      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   573 kB/s
     http_req_blocked...............: avg=9.5µs    min=1.18µs  med=3.26µs   max=13.16ms  p(90)=5.19µs   p(95)=6.24µs   p(99.9)=1.26ms 
     http_req_connecting............: avg=5.21µs   min=0s      med=0s       max=12.8ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms  
     http_req_duration..............: avg=461.62ms min=4.1ms   med=431.33ms max=1.91s    p(90)=907.77ms p(95)=992.96ms p(99.9)=1.51s  
       { expected_response:true }...: avg=461.62ms min=4.1ms   med=431.33ms max=1.91s    p(90)=907.77ms p(95)=992.96ms p(99.9)=1.51s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31099
     http_req_receiving.............: avg=181.82µs min=32.37µs med=81.17µs  max=198.14ms p(90)=118.75µs p(95)=132.88µs p(99.9)=27.81ms
     http_req_sending...............: avg=29.64µs  min=5.86µs  med=14.58µs  max=89.2ms   p(90)=21.81µs  p(95)=25.17µs  p(99.9)=3.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=461.4ms  min=4.04ms  med=431.23ms max=1.91s    p(90)=907.63ms p(95)=992.84ms p(99.9)=1.51s  
     http_reqs......................: 31099   476.973267/s
     iteration_duration.............: avg=477.19ms min=6.71ms  med=449.21ms max=1.91s    p(90)=912.96ms p(95)=997.93ms p(99.9)=1.51s  
     iterations.....................: 30099   461.636013/s
     success_rate...................: 100.00% ✓ 30099      ✗ 0    
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

     checks.........................: 100.00% ✓ 40872      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   256 kB/s
     http_req_blocked...............: avg=15.31µs  min=1.25µs  med=3.67µs   max=32.96ms p(90)=5.57µs   p(95)=7.46µs  p(99.9)=1.58ms 
     http_req_connecting............: avg=9.88µs   min=0s      med=0s       max=32.9ms  p(90)=0s       p(95)=0s      p(99.9)=1.56ms 
     http_req_duration..............: avg=998.37ms min=6.5ms   med=898.08ms max=6.01s   p(90)=2s       p(95)=2.17s   p(99.9)=5.53s  
       { expected_response:true }...: avg=998.37ms min=6.5ms   med=898.08ms max=6.01s   p(90)=2s       p(95)=2.17s   p(99.9)=5.53s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14624
     http_req_receiving.............: avg=112µs    min=38.82µs med=98.52µs  max=63.47ms p(90)=139.33µs p(95)=151.5µs p(99.9)=825.6µs
     http_req_sending...............: avg=29.6µs   min=6.34µs  med=17.61µs  max=19.42ms p(90)=23.82µs  p(95)=28.8µs  p(99.9)=3.05ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=998.23ms min=6.36ms  med=897.94ms max=6.01s   p(90)=2s       p(95)=2.17s   p(99.9)=5.53s  
     http_reqs......................: 14624   213.246701/s
     iteration_duration.............: avg=1.07s    min=38.26ms med=1s       max=6.01s   p(90)=2.03s    p(95)=2.2s    p(99.9)=5.55s  
     iterations.....................: 13624   198.664733/s
     success_rate...................: 100.00% ✓ 13624      ✗ 0    
     vus............................: 78      min=0        max=500
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

     checks.........................: 100.00% ✓ 40839      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=25.46µs  min=1.27µs  med=3.45µs   max=9.63ms  p(90)=5.21µs  p(95)=6.84µs   p(99.9)=6.58ms  
     http_req_connecting............: avg=19.85µs  min=0s      med=0s       max=9.58ms  p(90)=0s      p(95)=0s       p(99.9)=6.54ms  
     http_req_duration..............: avg=997.87ms min=8.63ms  med=901.03ms max=4.02s   p(90)=2.04s   p(95)=2.19s    p(99.9)=3.55s   
       { expected_response:true }...: avg=997.87ms min=8.63ms  med=901.03ms max=4.02s   p(90)=2.04s   p(95)=2.19s    p(99.9)=3.55s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14613
     http_req_receiving.............: avg=103.92µs min=34.29µs med=95µs     max=17.86ms p(90)=134.5µs p(95)=147.36µs p(99.9)=960.93µs
     http_req_sending...............: avg=31.1µs   min=5.86µs  med=17.06µs  max=8.37ms  p(90)=22.99µs p(95)=28.28µs  p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=997.73ms min=8.52ms  med=900.87ms max=4.02s   p(90)=2.04s   p(95)=2.19s    p(99.9)=3.55s   
     http_reqs......................: 14613   209.270044/s
     iteration_duration.............: avg=1.07s    min=24.62ms med=992.59ms max=4.03s   p(90)=2.06s   p(95)=2.21s    p(99.9)=3.59s   
     iterations.....................: 13613   194.949231/s
     success_rate...................: 100.00% ✓ 13613      ✗ 0    
     vus............................: 93      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

