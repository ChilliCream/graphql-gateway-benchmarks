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
| hive-router | v0.0.43 | 2,863 | 2,962 | 2,831 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.2 | 2,049 | 2,084 | 2,034 | 0.9% |  |
| cosmo | 0.298.0 | 1,204 | 1,207 | 1,192 | 0.5% | non-compatible response (8 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 575 | 579 | 571 | 0.5% |  |
| hive-gateway | 2.5.14 | 247 | 249 | 244 | 0.7% |  |
| apollo-gateway | 2.13.3 | 204 | 207 | 200 | 1.2% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (43444 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (500675 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,374 | 2,461 | 2,348 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,912 | 1,945 | 1,897 | 0.7% |  |
| cosmo | 0.298.0 | 1,158 | 1,160 | 1,134 | 1.2% | non-compatible response (10 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 544 | 552 | 536 | 0.9% |  |
| hive-gateway | 2.5.14 | 249 | 252 | 246 | 0.7% |  |
| apollo-gateway | 2.13.3 | 206 | 209 | 205 | 0.7% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (35309 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (360571 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 528081      ✗ 0     
     data_received..................: 16 GB   251 MB/s
     data_sent......................: 213 MB  3.4 MB/s
     http_req_blocked...............: avg=36.08µs  min=982ns   med=2.27µs  max=86.81ms  p(90)=3.79µs   p(95)=4.89µs   p(99.9)=8.32ms  
     http_req_connecting............: avg=32.49µs  min=0s      med=0s      max=86.71ms  p(90)=0s       p(95)=0s       p(99.9)=7.31ms  
     http_req_duration..............: avg=80.11ms  min=1.56ms  med=72.96ms max=320.7ms  p(90)=156.81ms p(95)=179.2ms  p(99.9)=248.43ms
       { expected_response:true }...: avg=80.11ms  min=1.56ms  med=72.96ms max=320.7ms  p(90)=156.81ms p(95)=179.2ms  p(99.9)=248.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177027
     http_req_receiving.............: avg=545.57µs min=28.21µs med=55.44µs max=90.89ms  p(90)=256.68µs p(95)=432.04µs p(99.9)=59.81ms 
     http_req_sending...............: avg=101.74µs min=5.35µs  med=9.91µs  max=233.08ms p(90)=18.68µs  p(95)=134.29µs p(99.9)=18.03ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.47ms  min=1.51ms  med=72.53ms max=297.73ms p(90)=155.58ms p(95)=176.39ms p(99.9)=243.8ms 
     http_reqs......................: 177027  2863.685115/s
     iteration_duration.............: avg=80.98ms  min=2.15ms  med=73.84ms max=408.67ms p(90)=157.52ms p(95)=180.15ms p(99.9)=251.04ms
     iterations.....................: 176027  2847.50857/s
     success_rate...................: 100.00% ✓ 176027      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 382206      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=15.33µs  min=922ns   med=2.18µs   max=59.28ms  p(90)=3.46µs   p(95)=4.39µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=12.51µs  min=0s      med=0s       max=59.24ms  p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=110.85ms min=2.35ms  med=106.32ms max=552.06ms p(90)=210.52ms p(95)=232.14ms p(99.9)=362.64ms
       { expected_response:true }...: avg=110.85ms min=2.35ms  med=106.32ms max=552.06ms p(90)=210.52ms p(95)=232.14ms p(99.9)=362.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128402
     http_req_receiving.............: avg=1.14ms   min=51.42µs med=148.3µs  max=195.61ms p(90)=1.28ms   p(95)=2.94ms   p(99.9)=100.07ms
     http_req_sending...............: avg=56.88µs  min=5.11µs  med=9.6µs    max=141.21ms p(90)=17.81µs  p(95)=120.04µs p(99.9)=7.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.64ms min=2.27ms  med=105.07ms max=551.63ms p(90)=209.03ms p(95)=229.79ms p(99.9)=359.88ms
     http_reqs......................: 128402  2049.189459/s
     iteration_duration.............: avg=111.98ms min=3.6ms   med=107.48ms max=552.24ms p(90)=211.04ms p(95)=232.72ms p(99.9)=363.84ms
     iterations.....................: 127402  2033.230289/s
     success_rate...................: 100.00% ✓ 127402      ✗ 0     
     vus............................: 88      min=0         max=498 
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

     checks.........................: 100.00% ✓ 222741      ✗ 0    
     data_received..................: 6.6 GB  106 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=5.54µs   min=1.13µs  med=2.17µs   max=10.04ms  p(90)=3.57µs   p(95)=4.44µs   p(99.9)=536.05µs
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=9.98ms   p(90)=0s       p(95)=0s       p(99.9)=429.09µs
     http_req_duration..............: avg=189.64ms min=2.05ms  med=191.86ms max=588.13ms p(90)=350.68ms p(95)=379.64ms p(99.9)=514.35ms
       { expected_response:true }...: avg=189.64ms min=2.05ms  med=191.86ms max=588.13ms p(90)=350.68ms p(95)=379.64ms p(99.9)=514.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75247
     http_req_receiving.............: avg=82.68µs  min=29.27µs med=58.9µs   max=203.04ms p(90)=93.19µs  p(95)=107.99µs p(99.9)=2.18ms  
     http_req_sending...............: avg=30.94µs  min=5.49µs  med=10.27µs  max=76.23ms  p(90)=16.08µs  p(95)=19.69µs  p(99.9)=4.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.52ms min=1.99ms  med=191.77ms max=588.04ms p(90)=350.51ms p(95)=379.54ms p(99.9)=514.26ms
     http_reqs......................: 75247   1204.58218/s
     iteration_duration.............: avg=192.44ms min=4.13ms  med=194.94ms max=588.36ms p(90)=351.63ms p(95)=380.35ms p(99.9)=514.62ms
     iterations.....................: 74247   1188.573806/s
     success_rate...................: 100.00% ✓ 74247       ✗ 0    
     vus............................: 78      min=0         max=493
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

     checks.........................: 100.00% ✓ 108057     ✗ 0    
     data_received..................: 3.3 GB  51 MB/s
     data_sent......................: 44 MB   691 kB/s
     http_req_blocked...............: avg=8.3µs    min=1.19µs  med=2.97µs   max=13.94ms  p(90)=4.8µs    p(95)=5.88µs   p(99.9)=885.85µs
     http_req_connecting............: avg=4.35µs   min=0s      med=0s       max=13.77ms  p(90)=0s       p(95)=0s       p(99.9)=818.48µs
     http_req_duration..............: avg=387.29ms min=3.62ms  med=359.87ms max=1.58s    p(90)=765.87ms p(95)=829.62ms p(99.9)=1.18s   
       { expected_response:true }...: avg=387.29ms min=3.62ms  med=359.87ms max=1.58s    p(90)=765.87ms p(95)=829.62ms p(99.9)=1.18s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 37019
     http_req_receiving.............: avg=102.31µs min=32.45µs med=76.4µs   max=174.42ms p(90)=113.04µs p(95)=126.62µs p(99.9)=1.23ms  
     http_req_sending...............: avg=27.58µs  min=5.86µs  med=13.26µs  max=42.57ms  p(90)=20.69µs  p(95)=24.16µs  p(99.9)=3.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=387.16ms min=3.51ms  med=359.77ms max=1.58s    p(90)=765.81ms p(95)=829.55ms p(99.9)=1.18s   
     http_reqs......................: 37019   575.394618/s
     iteration_duration.............: avg=398.29ms min=19.59ms med=374.1ms  max=1.59s    p(90)=769.66ms p(95)=832.35ms p(99.9)=1.19s   
     iterations.....................: 36019   559.851394/s
     success_rate...................: 100.00% ✓ 36019      ✗ 0    
     vus............................: 73      min=0        max=495
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

     checks.........................: 100.00% ✓ 47262      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   298 kB/s
     http_req_blocked...............: avg=18.27µs  min=1.15µs  med=3.63µs   max=47.64ms p(90)=5.49µs   p(95)=7.12µs   p(99.9)=2.7ms 
     http_req_connecting............: avg=12.96µs  min=0s      med=0s       max=47.58ms p(90)=0s       p(95)=0s       p(99.9)=2.62ms
     http_req_duration..............: avg=857.72ms min=5.8ms   med=740.3ms  max=17.46s  p(90)=1.45s    p(95)=1.61s    p(99.9)=16.58s
       { expected_response:true }...: avg=857.72ms min=5.8ms   med=740.3ms  max=17.46s  p(90)=1.45s    p(95)=1.61s    p(99.9)=16.58s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16754
     http_req_receiving.............: avg=107.01µs min=32.45µs med=96.71µs  max=55.86ms p(90)=136.29µs p(95)=149.93µs p(99.9)=1.04ms
     http_req_sending...............: avg=35.29µs  min=5.79µs  med=16.98µs  max=87.54ms p(90)=23.57µs  p(95)=28.29µs  p(99.9)=3.42ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=857.58ms min=5.68ms  med=740.16ms max=17.46s  p(90)=1.45s    p(95)=1.61s    p(99.9)=16.58s
     http_reqs......................: 16754   247.486104/s
     iteration_duration.............: avg=912.25ms min=61.08ms med=808.19ms max=17.46s  p(90)=1.46s    p(95)=1.63s    p(99.9)=16.6s 
     iterations.....................: 15754   232.714342/s
     success_rate...................: 100.00% ✓ 15754      ✗ 0    
     vus............................: 90      min=0        max=500
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

     checks.........................: 100.00% ✓ 42573      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   251 kB/s
     http_req_blocked...............: avg=18.12µs  min=1.23µs  med=3.34µs   max=43.45ms p(90)=5.02µs   p(95)=6.69µs   p(99.9)=2.37ms
     http_req_connecting............: avg=13µs     min=0s      med=0s       max=43.39ms p(90)=0s       p(95)=0s       p(99.9)=2.33ms
     http_req_duration..............: avg=516.77ms min=8.3ms   med=590.53ms max=1.35s   p(90)=875.13ms p(95)=933.84ms p(99.9)=1.24s 
       { expected_response:true }...: avg=516.77ms min=8.3ms   med=590.53ms max=1.35s   p(90)=875.13ms p(95)=933.84ms p(99.9)=1.24s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15191
     http_req_receiving.............: avg=98.87µs  min=35.17µs med=91.59µs  max=3.42ms  p(90)=131.68µs p(95)=145.35µs p(99.9)=1.12ms
     http_req_sending...............: avg=26.19µs  min=6.16µs  med=16.54µs  max=7.57ms  p(90)=22.49µs  p(95)=26.83µs  p(99.9)=3.06ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=516.65ms min=8.19ms  med=590.44ms max=1.35s   p(90)=874.96ms p(95)=933.73ms p(99.9)=1.24s 
     http_reqs......................: 15191   204.800765/s
     iteration_duration.............: avg=553.03ms min=28.17ms med=635.17ms max=1.36s   p(90)=880.46ms p(95)=940.01ms p(99.9)=1.25s 
     iterations.....................: 14191   191.319048/s
     success_rate...................: 100.00% ✓ 14191      ✗ 0    
     vus............................: 49      min=0        max=496
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

     checks.........................: 100.00% ✓ 439410      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=23.77µs  min=1.07µs  med=2.49µs  max=70.68ms  p(90)=4.28µs   p(95)=5.58µs   p(99.9)=2.64ms  
     http_req_connecting............: avg=20.46µs  min=0s      med=0s      max=70.61ms  p(90)=0s       p(95)=0s       p(99.9)=2.51ms  
     http_req_duration..............: avg=96.4ms   min=1.7ms   med=90.39ms max=286.04ms p(90)=186.22ms p(95)=203.23ms p(99.9)=251.81ms
       { expected_response:true }...: avg=96.4ms   min=1.7ms   med=90.39ms max=286.04ms p(90)=186.22ms p(95)=203.23ms p(99.9)=251.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147470
     http_req_receiving.............: avg=261.75µs min=29.57µs med=60.81µs max=52.79ms  p(90)=202.47µs p(95)=429.72µs p(99.9)=27.3ms  
     http_req_sending...............: avg=83.7µs   min=5.39µs  med=10.79µs max=231.04ms p(90)=21.69µs  p(95)=139.7µs  p(99.9)=11.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.05ms  min=1.6ms   med=90.08ms max=284.96ms p(90)=185.75ms p(95)=202.47ms p(99.9)=249.69ms
     http_reqs......................: 147470  2374.791751/s
     iteration_duration.............: avg=97.34ms  min=4.51ms  med=91.45ms max=340.9ms  p(90)=186.84ms p(95)=203.71ms p(99.9)=252.56ms
     iterations.....................: 146470  2358.688192/s
     success_rate...................: 100.00% ✓ 146470      ✗ 0     
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

     checks.........................: 100.00% ✓ 353895      ✗ 0     
     data_received..................: 10 GB   168 MB/s
     data_sent......................: 143 MB  2.3 MB/s
     http_req_blocked...............: avg=10.19µs  min=1µs     med=2.3µs    max=38.99ms  p(90)=3.91µs   p(95)=5µs      p(99.9)=1.01ms  
     http_req_connecting............: avg=7.19µs   min=0s      med=0s       max=38.95ms  p(90)=0s       p(95)=0s       p(99.9)=904.23µs
     http_req_duration..............: avg=119.65ms min=1.76ms  med=112.62ms max=900.75ms p(90)=224.02ms p(95)=249.04ms p(99.9)=659.71ms
       { expected_response:true }...: avg=119.65ms min=1.76ms  med=112.62ms max=900.75ms p(90)=224.02ms p(95)=249.04ms p(99.9)=659.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118965
     http_req_receiving.............: avg=1.31ms   min=52.38µs med=142.81µs max=181.69ms p(90)=1.66ms   p(95)=3.69ms   p(99.9)=97.51ms 
     http_req_sending...............: avg=57.2µs   min=5.12µs  med=9.94µs   max=273.9ms  p(90)=19.1µs   p(95)=116.83µs p(99.9)=7.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.28ms min=1.68ms  med=111.28ms max=900.66ms p(90)=222.17ms p(95)=245.78ms p(99.9)=658.96ms
     http_reqs......................: 118965  1912.424477/s
     iteration_duration.............: avg=120.93ms min=2.52ms  med=114.08ms max=900.97ms p(90)=224.61ms p(95)=249.65ms p(99.9)=660.58ms
     iterations.....................: 117965  1896.348955/s
     success_rate...................: 100.00% ✓ 117965      ✗ 0     
     vus............................: 67      min=0         max=496 
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

     checks.........................: 100.00% ✓ 214692      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.74µs   min=1.15µs  med=2.35µs   max=22.07ms  p(90)=4.05µs   p(95)=5.04µs   p(99.9)=622.17µs
     http_req_connecting............: avg=3.7µs    min=0s      med=0s       max=22.01ms  p(90)=0s       p(95)=0s       p(99.9)=543.41µs
     http_req_duration..............: avg=196.66ms min=2.13ms  med=194.99ms max=564.14ms p(90)=365.77ms p(95)=391.81ms p(99.9)=471.97ms
       { expected_response:true }...: avg=196.66ms min=2.13ms  med=194.99ms max=564.14ms p(90)=365.77ms p(95)=391.81ms p(99.9)=471.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72564
     http_req_receiving.............: avg=86.11µs  min=29.81µs med=65.5µs   max=121.79ms p(90)=104.13µs p(95)=120.38µs p(99.9)=1.73ms  
     http_req_sending...............: avg=35.5µs   min=5.35µs  med=11.04µs  max=232.01ms p(90)=17.94µs  p(95)=21.82µs  p(99.9)=4.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.54ms min=2.06ms  med=194.85ms max=564.02ms p(90)=365.66ms p(95)=391.67ms p(99.9)=471.9ms 
     http_reqs......................: 72564   1158.640947/s
     iteration_duration.............: avg=199.66ms min=3.65ms  med=198.3ms  max=564.38ms p(90)=366.65ms p(95)=392.57ms p(99.9)=472.42ms
     iterations.....................: 71564   1142.673787/s
     success_rate...................: 100.00% ✓ 71564       ✗ 0    
     vus............................: 86      min=0         max=498
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

     checks.........................: 100.00% ✓ 102591     ✗ 0    
     data_received..................: 3.1 GB  48 MB/s
     data_sent......................: 42 MB   654 kB/s
     http_req_blocked...............: avg=7.23µs   min=1.2µs   med=2.85µs   max=5.95ms   p(90)=4.6µs    p(95)=5.5µs    p(99.9)=746.47µs
     http_req_connecting............: avg=3.38µs   min=0s      med=0s       max=5.91ms   p(90)=0s       p(95)=0s       p(99.9)=716.23µs
     http_req_duration..............: avg=407.58ms min=3.7ms   med=379.32ms max=1.66s    p(90)=803.05ms p(95)=873.57ms p(99.9)=1.28s   
       { expected_response:true }...: avg=407.58ms min=3.7ms   med=379.32ms max=1.66s    p(90)=803.05ms p(95)=873.57ms p(99.9)=1.28s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35197
     http_req_receiving.............: avg=91.51µs  min=32.23µs med=77.97µs  max=122.87ms p(90)=114.31µs p(95)=127.61µs p(99.9)=838.93µs
     http_req_sending...............: avg=29.66µs  min=5.95µs  med=13.26µs  max=79.52ms  p(90)=20.22µs  p(95)=23.46µs  p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=407.46ms min=3.62ms  med=379.08ms max=1.66s    p(90)=802.94ms p(95)=873.49ms p(99.9)=1.28s   
     http_reqs......................: 35197   544.686454/s
     iteration_duration.............: avg=419.73ms min=20.2ms  med=394.95ms max=1.67s    p(90)=806.51ms p(95)=876ms    p(99.9)=1.28s   
     iterations.....................: 34197   529.211088/s
     success_rate...................: 100.00% ✓ 34197      ✗ 0    
     vus............................: 88      min=0        max=500
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

     checks.........................: 100.00% ✓ 47496      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=15.45µs  min=1.19µs  med=3.45µs   max=6.14ms  p(90)=5.21µs   p(95)=6.71µs   p(99.9)=2.61ms  
     http_req_connecting............: avg=10.03µs  min=0s      med=0s       max=4.6ms   p(90)=0s       p(95)=0s       p(99.9)=2.43ms  
     http_req_duration..............: avg=864.23ms min=5.88ms  med=788.3ms  max=4.7s    p(90)=1.73s    p(95)=1.96s    p(99.9)=3.97s   
       { expected_response:true }...: avg=864.23ms min=5.88ms  med=788.3ms  max=4.7s    p(90)=1.73s    p(95)=1.96s    p(99.9)=3.97s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16832
     http_req_receiving.............: avg=103.96µs min=37.36µs med=95.71µs  max=38.5ms  p(90)=134.86µs p(95)=147.58µs p(99.9)=791.29µs
     http_req_sending...............: avg=32.71µs  min=5.78µs  med=17.09µs  max=51.64ms p(90)=22.98µs  p(95)=27.55µs  p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=864.1ms  min=5.78ms  med=788.19ms max=4.7s    p(90)=1.73s    p(95)=1.96s    p(99.9)=3.97s   
     http_reqs......................: 16832   249.224567/s
     iteration_duration.............: avg=918.86ms min=16.96ms med=875.94ms max=4.71s   p(90)=1.74s    p(95)=1.97s    p(99.9)=3.98s   
     iterations.....................: 15832   234.417974/s
     success_rate...................: 100.00% ✓ 15832      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 40338      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=13.52µs min=1.28µs  med=3.44µs   max=3.88ms   p(90)=5.12µs   p(95)=6.72µs   p(99.9)=1.7ms 
     http_req_connecting............: avg=8µs     min=0s      med=0s       max=2.78ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms
     http_req_duration..............: avg=1.01s   min=8.64ms  med=921.67ms max=4.03s    p(90)=2.03s    p(95)=2.19s    p(99.9)=3.51s 
       { expected_response:true }...: avg=1.01s   min=8.64ms  med=921.67ms max=4.03s    p(90)=2.03s    p(95)=2.19s    p(99.9)=3.51s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14446
     http_req_receiving.............: avg=102.8µs min=33.81µs med=94.58µs  max=11.69ms  p(90)=135.38µs p(95)=147.75µs p(99.9)=1.12ms
     http_req_sending...............: avg=38.44µs min=6.21µs  med=17.01µs  max=103.63ms p(90)=22.76µs  p(95)=27.82µs  p(99.9)=3.58ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s      min=8.51ms  med=921.56ms max=4.03s    p(90)=2.03s    p(95)=2.19s    p(99.9)=3.51s 
     http_reqs......................: 14446   206.327008/s
     iteration_duration.............: avg=1.08s   min=61.19ms med=1.01s    max=4.04s    p(90)=2.06s    p(95)=2.2s     p(99.9)=3.54s 
     iterations.....................: 13446   192.044368/s
     success_rate...................: 100.00% ✓ 13446      ✗ 0    
     vus............................: 59      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

