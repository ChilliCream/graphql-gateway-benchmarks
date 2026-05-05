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
| hive-router | v0.0.49 | 2,666 | 2,802 | 2,627 | 2.2% |  |
| cosmo | 0.307.0 | 1,194 | 1,204 | 1,188 | 0.6% | non-compatible response (4 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 494 | 498 | 489 | 0.6% |  |
| hive-gateway | 2.5.25 | 236 | 238 | 235 | 0.5% |  |
| apollo-gateway | — | — | — | — | — | benchmark run failed |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (22124 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (440849 across 9/9 runs) |
| hotchocolate | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hotchocolate | 16.1.0-p.1.10 | 1,839 | 1,885 | 1,828 | 1.1% |  |
| cosmo | 0.307.0 | 1,115 | 1,119 | 1,113 | 0.3% | non-compatible response (11 across 6/9 runs) |
| hive-gateway | 2.5.25 | 230 | 232 | 228 | 0.6% |  |
| apollo-gateway | 2.13.3 | 208 | 210 | 206 | 0.5% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (17796 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (182781 across 9/9 runs) |
| hive-gateway-router-runtime | — | — | — | — | — | benchmark run failed |
| hive-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 491661      ✗ 0     
     data_received..................: 15 GB   234 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=31.42µs min=1.1µs   med=2.66µs  max=82.48ms  p(90)=4.18µs   p(95)=5.22µs   p(99.9)=9.72ms  
     http_req_connecting............: avg=27.7µs  min=0s      med=0s      max=82.42ms  p(90)=0s       p(95)=0s       p(99.9)=8.53ms  
     http_req_duration..............: avg=86.12ms min=1.54ms  med=80.36ms max=338.27ms p(90)=166.28ms p(95)=184.04ms p(99.9)=255.94ms
       { expected_response:true }...: avg=86.12ms min=1.54ms  med=80.36ms max=338.27ms p(90)=166.28ms p(95)=184.04ms p(99.9)=255.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164887
     http_req_receiving.............: avg=320.4µs min=28.46µs med=56.47µs max=138.08ms p(90)=200µs    p(95)=411.85µs p(99.9)=40.5ms  
     http_req_sending...............: avg=92.48µs min=5.37µs  med=10.26µs max=155.88ms p(90)=18.76µs  p(95)=134.03µs p(99.9)=14.52ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.71ms min=1.48ms  med=80.08ms max=319.95ms p(90)=165.55ms p(95)=183ms    p(99.9)=253.23ms
     http_reqs......................: 164887  2666.555241/s
     iteration_duration.............: avg=86.99ms min=2.22ms  med=81.29ms max=390.36ms p(90)=166.91ms p(95)=184.76ms p(99.9)=257.94ms
     iterations.....................: 163887  2650.383224/s
     success_rate...................: 100.00% ✓ 163887      ✗ 0     
     vus............................: 96      min=0         max=500 
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

     checks.........................: 100.00% ✓ 220926      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=7.1µs    min=1.1µs   med=2.61µs   max=47.27ms  p(90)=4.09µs   p(95)=4.96µs   p(99.9)=531.47µs
     http_req_connecting............: avg=3.84µs   min=0s      med=0s       max=47.2ms   p(90)=0s       p(95)=0s       p(99.9)=485.77µs
     http_req_duration..............: avg=191.18ms min=2.06ms  med=190.8ms  max=602.5ms  p(90)=349.85ms p(95)=376.27ms p(99.9)=518.18ms
       { expected_response:true }...: avg=191.18ms min=2.06ms  med=190.8ms  max=602.5ms  p(90)=349.85ms p(95)=376.27ms p(99.9)=518.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74642
     http_req_receiving.............: avg=81.3µs   min=28.36µs med=61.12µs  max=97.46ms  p(90)=96µs     p(95)=111.27µs p(99.9)=1.93ms  
     http_req_sending...............: avg=32.84µs  min=5.51µs  med=11.1µs   max=113.4ms  p(90)=17µs     p(95)=20.81µs  p(99.9)=4.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.06ms min=1.98ms  med=190.7ms  max=602.41ms p(90)=349.76ms p(95)=376.14ms p(99.9)=518.1ms 
     http_reqs......................: 74642   1194.297553/s
     iteration_duration.............: avg=194.02ms min=4.78ms  med=193.91ms max=602.71ms p(90)=350.65ms p(95)=376.96ms p(99.9)=518.44ms
     iterations.....................: 73642   1178.297211/s
     success_rate...................: 100.00% ✓ 73642       ✗ 0    
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

     checks.........................: 100.00% ✓ 93264      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 39 MB   593 kB/s
     http_req_blocked...............: avg=7.15µs   min=1.22µs  med=3µs      max=3.77ms  p(90)=4.79µs   p(95)=5.79µs   p(99.9)=616.39µs
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=3.72ms  p(90)=0s       p(95)=0s       p(99.9)=576.71µs
     http_req_duration..............: avg=447.53ms min=4.06ms  med=418.37ms max=1.83s   p(90)=876.25ms p(95)=955.41ms p(99.9)=1.43s   
       { expected_response:true }...: avg=447.53ms min=4.06ms  med=418.37ms max=1.83s   p(90)=876.25ms p(95)=955.41ms p(99.9)=1.43s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32088
     http_req_receiving.............: avg=83.61µs  min=31.92µs med=76.4µs   max=6.08ms  p(90)=111.7µs  p(95)=124.82µs p(99.9)=798.76µs
     http_req_sending...............: avg=28.19µs  min=5.81µs  med=13.37µs  max=70.69ms p(90)=20.56µs  p(95)=23.92µs  p(99.9)=2.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=447.42ms min=3.98ms  med=418.26ms max=1.83s   p(90)=876.17ms p(95)=955.29ms p(99.9)=1.43s   
     http_reqs......................: 32088   494.356099/s
     iteration_duration.............: avg=462.14ms min=20.9ms  med=434.97ms max=1.83s   p(90)=880.53ms p(95)=959.77ms p(99.9)=1.43s   
     iterations.....................: 31088   478.949838/s
     success_rate...................: 100.00% ✓ 31088      ✗ 0    
     vus............................: 35      min=0        max=500
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

     checks.........................: 100.00% ✓ 45273      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   285 kB/s
     http_req_blocked...............: avg=18µs     min=1.39µs  med=3.83µs   max=24.55ms p(90)=5.86µs   p(95)=7.53µs   p(99.9)=2.69ms
     http_req_connecting............: avg=12.38µs  min=0s      med=0s       max=24.48ms p(90)=0s       p(95)=0s       p(99.9)=2.66ms
     http_req_duration..............: avg=886.66ms min=6.22ms  med=750.13ms max=22.16s  p(90)=1.43s    p(95)=1.58s    p(99.9)=19.52s
       { expected_response:true }...: avg=886.66ms min=6.22ms  med=750.13ms max=22.16s  p(90)=1.43s    p(95)=1.58s    p(99.9)=19.52s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16091
     http_req_receiving.............: avg=116.65µs min=38.61µs med=102.1µs  max=67.16ms p(90)=142.38µs p(95)=156.87µs p(99.9)=1.06ms
     http_req_sending...............: avg=31.5µs   min=5.51µs  med=19.02µs  max=35.55ms p(90)=25.31µs  p(95)=30.2µs   p(99.9)=2.09ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=886.51ms min=6.13ms  med=750.02ms max=22.16s  p(90)=1.43s    p(95)=1.58s    p(99.9)=19.52s
     http_reqs......................: 16091   236.294372/s
     iteration_duration.............: avg=945.42ms min=38.02ms med=813.25ms max=22.17s  p(90)=1.44s    p(95)=1.59s    p(99.9)=19.54s
     iterations.....................: 15091   221.609494/s
     success_rate...................: 100.00% ✓ 15091      ✗ 0    
     vus............................: 64      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 340461      ✗ 0     
     data_received..................: 10 GB   161 MB/s
     data_sent......................: 138 MB  2.2 MB/s
     http_req_blocked...............: avg=16.5µs   min=1.05µs  med=2.81µs   max=62.98ms  p(90)=4.45µs   p(95)=5.49µs   p(99.9)=1.97ms  
     http_req_connecting............: avg=12.96µs  min=0s      med=0s       max=62.83ms  p(90)=0s       p(95)=0s       p(99.9)=1.92ms  
     http_req_duration..............: avg=124.4ms  min=1.78ms  med=116.45ms max=640.36ms p(90)=240.12ms p(95)=274.67ms p(99.9)=524.05ms
       { expected_response:true }...: avg=124.4ms  min=1.78ms  med=116.45ms max=640.36ms p(90)=240.12ms p(95)=274.67ms p(99.9)=524.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 114487
     http_req_receiving.............: avg=1.8ms    min=52.82µs med=120.74µs max=386.77ms p(90)=1.62ms   p(95)=4.4ms    p(99.9)=162.01ms
     http_req_sending...............: avg=64.21µs  min=5.48µs  med=10.91µs  max=67.04ms  p(90)=20.01µs  p(95)=124.43µs p(99.9)=8.82ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.54ms min=1.69ms  med=115.25ms max=638.04ms p(90)=236.63ms p(95)=268.46ms p(99.9)=515.29ms
     http_reqs......................: 114487  1839.339998/s
     iteration_duration.............: avg=125.78ms min=3.38ms  med=118.1ms  max=647.08ms p(90)=240.78ms p(95)=275.47ms p(99.9)=524.85ms
     iterations.....................: 113487  1823.274069/s
     success_rate...................: 100.00% ✓ 113487      ✗ 0     
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

     checks.........................: 100.00% ✓ 206460      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=8.1µs    min=1.09µs  med=2.78µs   max=56.11ms  p(90)=4.47µs   p(95)=5.45µs   p(99.9)=619.7µs 
     http_req_connecting............: avg=4.61µs   min=0s      med=0s       max=56.05ms  p(90)=0s       p(95)=0s       p(99.9)=551.81µs
     http_req_duration..............: avg=204.39ms min=2.09ms  med=204.08ms max=641.2ms  p(90)=379.77ms p(95)=409.35ms p(99.9)=511.44ms
       { expected_response:true }...: avg=204.39ms min=2.09ms  med=204.08ms max=641.2ms  p(90)=379.77ms p(95)=409.35ms p(99.9)=511.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69820
     http_req_receiving.............: avg=90.61µs  min=31.61µs med=66.52µs  max=125.32ms p(90)=104.78µs p(95)=122.4µs  p(99.9)=2.03ms  
     http_req_sending...............: avg=36.1µs   min=5.73µs  med=12.2µs   max=98.43ms  p(90)=19.11µs  p(95)=23.25µs  p(99.9)=4.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.26ms min=2.03ms  med=203.93ms max=641.13ms p(90)=379.66ms p(95)=409.22ms p(99.9)=511.35ms
     http_reqs......................: 69820   1115.106093/s
     iteration_duration.............: avg=207.62ms min=5.56ms  med=207.51ms max=641.45ms p(90)=380.75ms p(95)=410.09ms p(99.9)=512.26ms
     iterations.....................: 68820   1099.134937/s
     success_rate...................: 100.00% ✓ 68820       ✗ 0    
     vus............................: 85      min=0         max=498
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 44220      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   277 kB/s
     http_req_blocked...............: avg=20.47µs  min=1.31µs  med=3.88µs   max=16.29ms p(90)=5.93µs   p(95)=7.93µs   p(99.9)=3.51ms  
     http_req_connecting............: avg=14.4µs   min=0s      med=0s       max=16.24ms p(90)=0s       p(95)=0s       p(99.9)=3.44ms  
     http_req_duration..............: avg=925.27ms min=6.36ms  med=847.29ms max=5.1s    p(90)=1.82s    p(95)=2.03s    p(99.9)=4.66s   
       { expected_response:true }...: avg=925.27ms min=6.36ms  med=847.29ms max=5.1s    p(90)=1.82s    p(95)=2.03s    p(99.9)=4.66s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15740
     http_req_receiving.............: avg=107.69µs min=35.26µs med=102.67µs max=5.47ms  p(90)=142.82µs p(95)=155.85µs p(99.9)=758.21µs
     http_req_sending...............: avg=30.82µs  min=6.07µs  med=19.17µs  max=12.83ms p(90)=25.51µs  p(95)=31.05µs  p(99.9)=2.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=925.13ms min=6.26ms  med=847.16ms max=5.1s    p(90)=1.82s    p(95)=2.03s    p(99.9)=4.66s   
     http_reqs......................: 15740   230.769734/s
     iteration_duration.............: avg=988.01ms min=58.47ms med=916.22ms max=5.1s    p(90)=1.84s    p(95)=2.05s    p(99.9)=4.68s   
     iterations.....................: 14740   216.108379/s
     success_rate...................: 100.00% ✓ 14740      ✗ 0    
     vus............................: 68      min=0        max=500
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

     checks.........................: 100.00% ✓ 40794      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=17.33µs  min=1.2µs   med=3.55µs   max=15.94ms  p(90)=5.37µs   p(95)=7.21µs   p(99.9)=2.62ms 
     http_req_connecting............: avg=11.94µs  min=0s      med=0s       max=15.88ms  p(90)=0s       p(95)=0s       p(99.9)=2.59ms 
     http_req_duration..............: avg=997.95ms min=8.64ms  med=902.54ms max=4.29s    p(90)=2.03s    p(95)=2.18s    p(99.9)=3.57s  
       { expected_response:true }...: avg=997.95ms min=8.64ms  med=902.54ms max=4.29s    p(90)=2.03s    p(95)=2.18s    p(99.9)=3.57s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14598
     http_req_receiving.............: avg=294.34µs min=33.27µs med=96.03µs  max=171.46ms p(90)=136.73µs p(95)=150.53µs p(99.9)=96.84ms
     http_req_sending...............: avg=27.83µs  min=6.18µs  med=17.88µs  max=9.83ms   p(90)=23.91µs  p(95)=29.06µs  p(99.9)=2.93ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=997.63ms min=8.54ms  med=902.41ms max=4.29s    p(90)=2.03s    p(95)=2.18s    p(99.9)=3.57s  
     http_reqs......................: 14598   208.943494/s
     iteration_duration.............: avg=1.07s    min=11.72ms med=1s       max=4.3s     p(90)=2.05s    p(95)=2.19s    p(99.9)=3.62s  
     iterations.....................: 13598   194.630335/s
     success_rate...................: 100.00% ✓ 13598      ✗ 0    
     vus............................: 16      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

