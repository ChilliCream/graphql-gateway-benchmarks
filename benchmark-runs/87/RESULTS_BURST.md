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
| hive-router | v0.0.41 | 2,699 | 2,794 | 2,656 | 1.7% |  |
| hotchocolate | 16.0.0-p.11.53 | 1,645 | 1,691 | 1,609 | 2.0% | non-compatible response (1397921 across 3/9 runs) |
| cosmo | 0.291.0 | 1,147 | 1,147 | 1,147 | 0.0% | non-compatible response (26 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 492 | 498 | 487 | 0.7% |  |
| hive-gateway | 2.5.6 | 248 | 250 | 244 | 0.7% |  |
| apollo-gateway | 2.13.2 | 219 | 223 | 215 | 1.3% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (47326 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (482660 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,113 | 2,215 | 2,058 | 2.4% |  |
| hotchocolate | 16.0.0-p.11.53 | 1,574 | 1,599 | 1,567 | 0.9% | non-compatible response (2438479 across 5/9 runs) |
| cosmo | 0.291.0 | 1,141 | 1,141 | 1,141 | 0.0% | non-compatible response (16 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 459 | 469 | 454 | 1.1% |  |
| hive-gateway | 2.5.6 | 241 | 244 | 238 | 0.9% |  |
| apollo-gateway | 2.13.2 | 204 | 207 | 202 | 0.8% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (33959 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (271240 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 497112      ✗ 0     
     data_received..................: 15 GB   237 MB/s
     data_sent......................: 200 MB  3.2 MB/s
     http_req_blocked...............: avg=23.03µs  min=1µs     med=2.24µs  max=66ms     p(90)=3.64µs   p(95)=4.69µs   p(99.9)=2.73ms  
     http_req_connecting............: avg=19.79µs  min=0s      med=0s      max=65.85ms  p(90)=0s       p(95)=0s       p(99.9)=2.6ms   
     http_req_duration..............: avg=85.21ms  min=1.49ms  med=79.95ms max=343.98ms p(90)=164.99ms p(95)=180.25ms p(99.9)=226.55ms
       { expected_response:true }...: avg=85.21ms  min=1.49ms  med=79.95ms max=343.98ms p(90)=164.99ms p(95)=180.25ms p(99.9)=226.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 166704
     http_req_receiving.............: avg=247.98µs min=27.53µs med=54.71µs max=199.68ms p(90)=213.32µs p(95)=403.51µs p(99.9)=27.42ms 
     http_req_sending...............: avg=79.38µs  min=5.39µs  med=9.8µs   max=155.72ms p(90)=18.38µs  p(95)=130.58µs p(99.9)=11.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.89ms  min=1.44ms  med=79.67ms max=254.51ms p(90)=164.45ms p(95)=179.46ms p(99.9)=224.01ms
     http_reqs......................: 166704  2699.377082/s
     iteration_duration.............: avg=86.02ms  min=2.09ms  med=80.84ms max=392.28ms p(90)=165.48ms p(95)=180.71ms p(99.9)=227.81ms
     iterations.....................: 165704  2683.184446/s
     success_rate...................: 100.00% ✓ 165704      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.53)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 308808      ✗ 0     
     data_received..................: 9.1 GB  144 MB/s
     data_sent......................: 125 MB  2.0 MB/s
     http_req_blocked...............: avg=14.59µs  min=1.05µs  med=2.13µs   max=83.19ms  p(90)=3.29µs   p(95)=4.06µs   p(99.9)=797.87µs
     http_req_connecting............: avg=11.87µs  min=0s      med=0s       max=83.14ms  p(90)=0s       p(95)=0s       p(99.9)=700.18µs
     http_req_duration..............: avg=121.09ms min=2.73ms  med=54.86ms  max=2.68s    p(90)=322.45ms p(95)=452.58ms p(99.9)=1.34s   
       { expected_response:true }...: avg=121.09ms min=2.73ms  med=54.86ms  max=2.68s    p(90)=322.45ms p(95)=452.58ms p(99.9)=1.34s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 103936
     http_req_receiving.............: avg=5.59ms   min=52.61µs med=108.14µs max=826.23ms p(90)=2.19ms   p(95)=10.6ms   p(99.9)=407.43ms
     http_req_sending...............: avg=51.26µs  min=5.27µs  med=9.39µs   max=172.03ms p(90)=14.94µs  p(95)=22.7µs   p(99.9)=6.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.44ms min=2.64ms  med=53.74ms  max=2.68s    p(90)=304.66ms p(95)=424.02ms p(99.9)=1.31s   
     http_reqs......................: 103936  1645.861722/s
     iteration_duration.............: avg=122.56ms min=3.57ms  med=56.4ms   max=2.68s    p(90)=324.68ms p(95)=454.8ms  p(99.9)=1.35s   
     iterations.....................: 102936  1630.026384/s
     success_rate...................: 100.00% ✓ 102936      ✗ 0     
     vus............................: 97      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 212376      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=6.55µs   min=1.07µs  med=2.49µs   max=43.99ms  p(90)=4.13µs   p(95)=5.06µs   p(99.9)=482.65µs
     http_req_connecting............: avg=3.3µs    min=0s      med=0s       max=43.94ms  p(90)=0s       p(95)=0s       p(99.9)=431.43µs
     http_req_duration..............: avg=198.75ms min=2.06ms  med=199.24ms max=564.15ms p(90)=364.94ms p(95)=391.93ms p(99.9)=483.54ms
       { expected_response:true }...: avg=198.75ms min=2.06ms  med=199.24ms max=564.15ms p(90)=364.94ms p(95)=391.93ms p(99.9)=483.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71792
     http_req_receiving.............: avg=114.93µs min=28.82µs med=61.37µs  max=136.8ms  p(90)=97.86µs  p(95)=113.73µs p(99.9)=3.71ms  
     http_req_sending...............: avg=29.65µs  min=5.34µs  med=10.8µs   max=103.43ms p(90)=17.29µs  p(95)=21.13µs  p(99.9)=4.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.61ms min=2ms     med=199.02ms max=564.09ms p(90)=364.85ms p(95)=391.79ms p(99.9)=483.45ms
     http_reqs......................: 71792   1147.645751/s
     iteration_duration.............: avg=201.82ms min=3.83ms  med=203.21ms max=564.33ms p(90)=365.77ms p(95)=392.57ms p(99.9)=484.32ms
     iterations.....................: 70792   1131.660045/s
     success_rate...................: 100.00% ✓ 70792       ✗ 0    
     vus............................: 84      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92937      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   592 kB/s
     http_req_blocked...............: avg=10.22µs  min=1.08µs  med=3.14µs   max=9.98ms  p(90)=4.99µs   p(95)=6.11µs   p(99.9)=2.06ms  
     http_req_connecting............: avg=5.98µs   min=0s      med=0s       max=9.93ms  p(90)=0s       p(95)=0s       p(99.9)=1.98ms  
     http_req_duration..............: avg=448.61ms min=4.16ms  med=415.39ms max=1.71s   p(90)=881.46ms p(95)=958.23ms p(99.9)=1.47s   
       { expected_response:true }...: avg=448.61ms min=4.16ms  med=415.39ms max=1.71s   p(90)=881.46ms p(95)=958.23ms p(99.9)=1.47s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31979
     http_req_receiving.............: avg=92.21µs  min=33.17µs med=79.59µs  max=148.4ms p(90)=115.83µs p(95)=129.5µs  p(99.9)=876.84µs
     http_req_sending...............: avg=27.94µs  min=6.13µs  med=14.28µs  max=91.28ms p(90)=21.82µs  p(95)=25.1µs   p(99.9)=2.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.49ms min=4.09ms  med=415.29ms max=1.71s   p(90)=881.31ms p(95)=958.16ms p(99.9)=1.47s   
     http_reqs......................: 31979   492.38103/s
     iteration_duration.............: avg=463.32ms min=38.14ms med=432.87ms max=1.71s   p(90)=886.52ms p(95)=961.86ms p(99.9)=1.47s   
     iterations.....................: 30979   476.984018/s
     success_rate...................: 100.00% ✓ 30979      ✗ 0    
     vus............................: 57      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47390      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   302 kB/s
     http_req_blocked...............: avg=11.89µs  min=1.25µs  med=3.66µs   max=4.39ms   p(90)=5.54µs   p(95)=7.23µs   p(99.9)=1.42ms 
     http_req_connecting............: avg=6.63µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms  
     http_req_duration..............: avg=832.16ms min=5.74ms  med=766.14ms max=14.01s   p(90)=1.56s    p(95)=1.71s    p(99.9)=10.8s  
       { expected_response:true }...: avg=832.16ms min=5.74ms  med=766.14ms max=14.01s   p(90)=1.56s    p(95)=1.71s    p(99.9)=10.8s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16797
     http_req_receiving.............: avg=208.4µs  min=37.27µs med=96.98µs  max=186.26ms p(90)=136.38µs p(95)=149.17µs p(99.9)=30.12ms
     http_req_sending...............: avg=28.96µs  min=6.51µs  med=17.85µs  max=9.95ms   p(90)=24.13µs  p(95)=28.67µs  p(99.9)=2.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=831.92ms min=5.6ms   med=766.05ms max=14.01s   p(90)=1.56s    p(95)=1.71s    p(99.9)=10.8s  
     http_reqs......................: 16797   248.900747/s
     iteration_duration.............: avg=884.75ms min=20.66ms med=817.52ms max=14.01s   p(90)=1.58s    p(95)=1.72s    p(99.9)=10.83s 
     iterations.....................: 15796   234.067762/s
     success_rate...................: 100.00% ✓ 15796      ✗ 0    
     vus............................: 88      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 42591      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 19 MB   269 kB/s
     http_req_blocked...............: avg=16.01µs  min=1.29µs  med=3.4µs    max=6.78ms  p(90)=5.09µs   p(95)=6.54µs   p(99.9)=2.74ms  
     http_req_connecting............: avg=10.95µs  min=0s      med=0s       max=6.7ms   p(90)=0s       p(95)=0s       p(99.9)=2.6ms   
     http_req_duration..............: avg=493.67ms min=8.35ms  med=520.88ms max=1.4s    p(90)=867.34ms p(95)=935.68ms p(99.9)=1.25s   
       { expected_response:true }...: avg=493.67ms min=8.35ms  med=520.88ms max=1.4s    p(90)=867.34ms p(95)=935.68ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15198
     http_req_receiving.............: avg=102.75µs min=34.35µs med=93.74µs  max=38.08ms p(90)=133.45µs p(95)=145.62µs p(99.9)=859.92µs
     http_req_sending...............: avg=31.43µs  min=5.85µs  med=17.26µs  max=74.7ms  p(90)=23.03µs  p(95)=27.68µs  p(99.9)=1.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=493.53ms min=8.22ms  med=520.73ms max=1.4s    p(90)=867.22ms p(95)=935.59ms p(99.9)=1.25s   
     http_reqs......................: 15198   219.051569/s
     iteration_duration.............: avg=528.37ms min=13.28ms med=565.61ms max=1.41s   p(90)=879.54ms p(95)=943.05ms p(99.9)=1.26s   
     iterations.....................: 14197   204.623972/s
     success_rate...................: 100.00% ✓ 14197      ✗ 0    
     vus............................: 113     min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 390336      ✗ 0     
     data_received..................: 12 GB   185 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=15.78µs  min=1.06µs  med=2.51µs   max=41.77ms  p(90)=4.13µs   p(95)=5.25µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=12.54µs  min=0s      med=0s       max=41.56ms  p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=108.51ms min=1.65ms  med=104.26ms max=319.83ms p(90)=208.74ms p(95)=224.84ms p(99.9)=270.78ms
       { expected_response:true }...: avg=108.51ms min=1.65ms  med=104.26ms max=319.83ms p(90)=208.74ms p(95)=224.84ms p(99.9)=270.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131112
     http_req_receiving.............: avg=136.38µs min=29.14µs med=60.2µs   max=84.15ms  p(90)=151.99µs p(95)=396.47µs p(99.9)=10.26ms 
     http_req_sending...............: avg=65.45µs  min=5.5µs   med=10.76µs  max=134.3ms  p(90)=19.85µs  p(95)=133.15µs p(99.9)=7.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.31ms min=1.59ms  med=104.05ms max=319.49ms p(90)=208.5ms  p(95)=224.61ms p(99.9)=270.1ms 
     http_reqs......................: 131112  2113.26002/s
     iteration_duration.............: avg=109.61ms min=4.17ms  med=105.54ms max=362.92ms p(90)=209.3ms  p(95)=225.33ms p(99.9)=271.82ms
     iterations.....................: 130112  2097.142044/s
     success_rate...................: 100.00% ✓ 130112      ✗ 0     
     vus............................: 59      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.53)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 292638      ✗ 0    
     data_received..................: 8.6 GB  138 MB/s
     data_sent......................: 118 MB  1.9 MB/s
     http_req_blocked...............: avg=11.79µs  min=1µs     med=2.34µs   max=71.13ms  p(90)=3.96µs   p(95)=4.97µs   p(99.9)=722.89µs
     http_req_connecting............: avg=8.66µs   min=0s      med=0s       max=71.08ms  p(90)=0s       p(95)=0s       p(99.9)=633.3µs 
     http_req_duration..............: avg=144.82ms min=2.04ms  med=84.73ms  max=3.46s    p(90)=351.03ms p(95)=475.01ms p(99.9)=1.65s   
       { expected_response:true }...: avg=144.82ms min=2.04ms  med=84.73ms  max=3.46s    p(90)=351.03ms p(95)=475.01ms p(99.9)=1.65s   
     http_req_failed................: 0.00%   ✓ 0           ✗ 98546
     http_req_receiving.............: avg=6.43ms   min=51.92µs med=109.82µs max=863.95ms p(90)=2.59ms   p(95)=10.34ms  p(99.9)=443.11ms
     http_req_sending...............: avg=51.35µs  min=5.23µs  med=10.18µs  max=59.76ms  p(90)=18.29µs  p(95)=25.47µs  p(99.9)=7.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=138.33ms min=1.94ms  med=82.9ms   max=3.46s    p(90)=328.44ms p(95)=442.67ms p(99.9)=1.63s   
     http_reqs......................: 98546   1574.575497/s
     iteration_duration.............: avg=146.57ms min=3.48ms  med=86.41ms  max=3.46s    p(90)=353.55ms p(95)=476.91ms p(99.9)=1.66s   
     iterations.....................: 97546   1558.597421/s
     success_rate...................: 100.00% ✓ 97546       ✗ 0    
     vus............................: 85      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 211536      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=8.23µs   min=1.16µs  med=2.85µs   max=30.21ms  p(90)=4.67µs   p(95)=5.72µs   p(99.9)=699.6µs 
     http_req_connecting............: avg=4.6µs    min=0s      med=0s       max=30.14ms  p(90)=0s       p(95)=0s       p(99.9)=575.84µs
     http_req_duration..............: avg=199.51ms min=2.03ms  med=200.71ms max=533.93ms p(90)=368.13ms p(95)=394.1ms  p(99.9)=472.56ms
       { expected_response:true }...: avg=199.51ms min=2.03ms  med=200.71ms max=533.93ms p(90)=368.13ms p(95)=394.1ms  p(99.9)=472.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71512
     http_req_receiving.............: avg=84.79µs  min=30.25µs med=67.74µs  max=11.33ms  p(90)=107.2µs  p(95)=124.09µs p(99.9)=2.01ms  
     http_req_sending...............: avg=38.66µs  min=5.66µs  med=12.36µs  max=152.71ms p(90)=19.84µs  p(95)=23.88µs  p(99.9)=4.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.38ms min=1.97ms  med=200.61ms max=533.85ms p(90)=368.04ms p(95)=393.99ms p(99.9)=472.47ms
     http_reqs......................: 71512   1141.796681/s
     iteration_duration.............: avg=202.59ms min=4.48ms  med=204.58ms max=534.14ms p(90)=369.02ms p(95)=394.91ms p(99.9)=472.89ms
     iterations.....................: 70512   1125.830177/s
     success_rate...................: 100.00% ✓ 70512       ✗ 0    
     vus............................: 87      min=0         max=498
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86962      ✗ 0    
     data_received..................: 2.6 GB  40 MB/s
     data_sent......................: 36 MB   552 kB/s
     http_req_blocked...............: avg=9.57µs   min=1.18µs  med=3.22µs   max=6.06ms   p(90)=4.98µs   p(95)=6.01µs   p(99.9)=1.36ms 
     http_req_connecting............: avg=5.26µs   min=0s      med=0s       max=5.88ms   p(90)=0s       p(95)=0s       p(99.9)=1.33ms 
     http_req_duration..............: avg=478.74ms min=4.28ms  med=443.47ms max=1.91s    p(90)=944.58ms p(95)=1.02s    p(99.9)=1.52s  
       { expected_response:true }...: avg=478.74ms min=4.28ms  med=443.47ms max=1.91s    p(90)=944.58ms p(95)=1.02s    p(99.9)=1.52s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 29988
     http_req_receiving.............: avg=92.99µs  min=28.96µs med=81.43µs  max=90.49ms  p(90)=118.65µs p(95)=131.94µs p(99.9)=850.5µs
     http_req_sending...............: avg=32.52µs  min=5.45µs  med=14.52µs  max=127.55ms p(90)=21.5µs   p(95)=24.75µs  p(99.9)=2.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=478.61ms min=4.22ms  med=443.37ms max=1.91s    p(90)=944.47ms p(95)=1.02s    p(99.9)=1.52s  
     http_reqs......................: 29988   459.078909/s
     iteration_duration.............: avg=495.47ms min=18.72ms med=463.6ms  max=1.91s    p(90)=948.94ms p(95)=1.03s    p(99.9)=1.53s  
     iterations.....................: 28987   443.754847/s
     success_rate...................: 100.00% ✓ 28987      ✗ 0    
     vus............................: 78      min=0        max=498
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46005      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   293 kB/s
     http_req_blocked...............: avg=12.75µs  min=1.36µs  med=3.69µs   max=2.98ms  p(90)=5.59µs  p(95)=7.14µs   p(99.9)=1.64ms
     http_req_connecting............: avg=7.14µs   min=0s      med=0s       max=2.95ms  p(90)=0s      p(95)=0s       p(99.9)=1.54ms
     http_req_duration..............: avg=875.71ms min=5.85ms  med=791.22ms max=4.21s   p(90)=1.74s   p(95)=1.98s    p(99.9)=3.48s 
       { expected_response:true }...: avg=875.71ms min=5.85ms  med=791.22ms max=4.21s   p(90)=1.74s   p(95)=1.98s    p(99.9)=3.48s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16335
     http_req_receiving.............: avg=117.47µs min=38.94µs med=100.38µs max=23.66ms p(90)=140.6µs p(95)=152.82µs p(99.9)=1.24ms
     http_req_sending...............: avg=27.08µs  min=6.71µs  med=18.79µs  max=10.69ms p(90)=24.87µs p(95)=29.13µs  p(99.9)=2.21ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=875.57ms min=5.75ms  med=791.12ms max=4.21s   p(90)=1.74s   p(95)=1.98s    p(99.9)=3.48s 
     http_reqs......................: 16335   241.917485/s
     iteration_duration.............: avg=932.82ms min=48.92ms med=848.02ms max=4.22s   p(90)=1.76s   p(95)=2s       p(99.9)=3.49s 
     iterations.....................: 15335   227.107722/s
     success_rate...................: 100.00% ✓ 15335      ✗ 0    
     vus............................: 92      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 39744      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=13.43µs  min=1.25µs  med=3.52µs   max=3.69ms   p(90)=5.32µs   p(95)=7.07µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=8.13µs   min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=1s       min=8.67ms  med=921.69ms max=3.69s    p(90)=2.04s    p(95)=2.18s    p(99.9)=3.26s   
       { expected_response:true }...: avg=1s       min=8.67ms  med=921.69ms max=3.69s    p(90)=2.04s    p(95)=2.18s    p(99.9)=3.26s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14248
     http_req_receiving.............: avg=341.05µs min=34.45µs med=95.49µs  max=192.73ms p(90)=136.03µs p(95)=149.97µs p(99.9)=108.81ms
     http_req_sending...............: avg=30.39µs  min=6.09µs  med=17.94µs  max=17.66ms  p(90)=23.78µs  p(95)=29.08µs  p(99.9)=2.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s       min=8.55ms  med=921.56ms max=3.69s    p(90)=2.04s    p(95)=2.18s    p(99.9)=3.26s   
     http_reqs......................: 14248   204.525234/s
     iteration_duration.............: avg=1.07s    min=11.31ms med=1.01s    max=3.7s     p(90)=2.06s    p(95)=2.2s     p(99.9)=3.29s   
     iterations.....................: 13248   190.170571/s
     success_rate...................: 100.00% ✓ 13248      ✗ 0    
     vus............................: 96      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

