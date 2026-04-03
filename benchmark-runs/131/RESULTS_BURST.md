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
| hive-router | v0.0.43 | 2,737 | 2,826 | 2,663 | 2.0% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,978 | 2,021 | 1,966 | 0.9% |  |
| cosmo | 0.298.0 | 1,212 | 1,215 | 1,203 | 0.5% | non-compatible response (7 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 559 | 563 | 554 | 0.6% |  |
| hive-gateway | 2.5.14 | 249 | 251 | 247 | 0.7% |  |
| apollo-gateway | 2.13.3 | 203 | 207 | 200 | 1.1% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (41589 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (493793 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,340 | 2,441 | 2,313 | 1.9% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,839 | 1,878 | 1,820 | 1.1% |  |
| cosmo | 0.298.0 | 1,120 | 1,131 | 1,106 | 1.1% | non-compatible response (8 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 530 | 539 | 524 | 1.0% |  |
| hive-gateway | 2.5.14 | 241 | 244 | 240 | 0.5% |  |
| apollo-gateway | 2.13.3 | 206 | 210 | 204 | 0.8% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (40106 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (305146 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 504888      ✗ 0     
     data_received..................: 15 GB   240 MB/s
     data_sent......................: 203 MB  3.3 MB/s
     http_req_blocked...............: avg=37.16µs  min=1.06µs  med=2.62µs  max=87.03ms  p(90)=4.28µs   p(95)=5.46µs   p(99.9)=7.85ms  
     http_req_connecting............: avg=33.09µs  min=0s      med=0s      max=86.96ms  p(90)=0s       p(95)=0s       p(99.9)=6.79ms  
     http_req_duration..............: avg=83.76ms  min=1.55ms  med=76.65ms max=299.03ms p(90)=163.04ms p(95)=186.02ms p(99.9)=258.29ms
       { expected_response:true }...: avg=83.76ms  min=1.55ms  med=76.65ms max=299.03ms p(90)=163.04ms p(95)=186.02ms p(99.9)=258.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 169296
     http_req_receiving.............: avg=502.49µs min=29.02µs med=57.65µs max=89.84ms  p(90)=241.71µs p(95)=442.61µs p(99.9)=63.49ms 
     http_req_sending...............: avg=102.24µs min=5.38µs  med=10.46µs max=178.18ms p(90)=19.66µs  p(95)=140.78µs p(99.9)=17.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.16ms  min=1.49ms  med=76.26ms max=295.58ms p(90)=162.05ms p(95)=183.78ms p(99.9)=248.97ms
     http_reqs......................: 169296  2737.075071/s
     iteration_duration.............: avg=84.71ms  min=2.14ms  med=77.56ms max=416.97ms p(90)=163.87ms p(95)=187.16ms p(99.9)=261.97ms
     iterations.....................: 168296  2720.907677/s
     success_rate...................: 100.00% ✓ 168296      ✗ 0     
     vus............................: 52      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 369978      ✗ 0     
     data_received..................: 11 GB   173 MB/s
     data_sent......................: 149 MB  2.4 MB/s
     http_req_blocked...............: avg=10.77µs  min=1.02µs  med=2.15µs   max=69.93ms  p(90)=3.37µs   p(95)=4.22µs   p(99.9)=813.21µs
     http_req_connecting............: avg=8.08µs   min=0s      med=0s       max=69.87ms  p(90)=0s       p(95)=0s       p(99.9)=753.87µs
     http_req_duration..............: avg=114.5ms  min=2.41ms  med=109.8ms  max=582.19ms p(90)=216.76ms p(95)=237.51ms p(99.9)=387ms   
       { expected_response:true }...: avg=114.5ms  min=2.41ms  med=109.8ms  max=582.19ms p(90)=216.76ms p(95)=237.51ms p(99.9)=387ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 124326
     http_req_receiving.............: avg=1.21ms   min=52.52µs med=165.68µs max=227.27ms p(90)=1.4ms    p(95)=3.3ms    p(99.9)=94.81ms 
     http_req_sending...............: avg=56.45µs  min=5.44µs  med=9.6µs    max=147.81ms p(90)=16.92µs  p(95)=117.84µs p(99.9)=7.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.23ms min=2.32ms  med=108.56ms max=554.93ms p(90)=214.98ms p(95)=234.7ms  p(99.9)=377.05ms
     http_reqs......................: 124326  1978.675053/s
     iteration_duration.............: avg=115.68ms min=3.43ms  med=111.16ms max=582.4ms  p(90)=217.28ms p(95)=238.1ms  p(99.9)=387.92ms
     iterations.....................: 123326  1962.759838/s
     success_rate...................: 100.00% ✓ 123326      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 224526      ✗ 0    
     data_received..................: 6.7 GB  106 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=6.41µs   min=1.07µs  med=2.18µs   max=23ms     p(90)=3.66µs   p(95)=4.51µs   p(99.9)=617.49µs
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=22.92ms  p(90)=0s       p(95)=0s       p(99.9)=589.16µs
     http_req_duration..............: avg=188.11ms min=2.1ms   med=187.25ms max=614.2ms  p(90)=349.4ms  p(95)=377.23ms p(99.9)=536.07ms
       { expected_response:true }...: avg=188.11ms min=2.1ms   med=187.25ms max=614.2ms  p(90)=349.4ms  p(95)=377.23ms p(99.9)=536.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75842
     http_req_receiving.............: avg=103.8µs  min=28.87µs med=60.69µs  max=143.2ms  p(90)=94.84µs  p(95)=108.88µs p(99.9)=2.15ms  
     http_req_sending...............: avg=29.44µs  min=5.27µs  med=10.47µs  max=114.81ms p(90)=16.38µs  p(95)=19.9µs   p(99.9)=3.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.98ms min=2.02ms  med=187.02ms max=614.14ms p(90)=349.32ms p(95)=377.12ms p(99.9)=535.98ms
     http_reqs......................: 75842   1212.744717/s
     iteration_duration.............: avg=190.88ms min=2.94ms  med=190.23ms max=614.41ms p(90)=350.25ms p(95)=377.84ms p(99.9)=536.59ms
     iterations.....................: 74842   1196.754306/s
     success_rate...................: 100.00% ✓ 74842       ✗ 0    
     vus............................: 82      min=0         max=495
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

     checks.........................: 100.00% ✓ 105159     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   671 kB/s
     http_req_blocked...............: avg=12µs     min=1.13µs  med=2.85µs   max=11.6ms   p(90)=4.66µs   p(95)=5.69µs   p(99.9)=3.21ms  
     http_req_connecting............: avg=8.03µs   min=0s      med=0s       max=11.55ms  p(90)=0s       p(95)=0s       p(99.9)=2.99ms  
     http_req_duration..............: avg=397.89ms min=3.72ms  med=368.02ms max=1.48s    p(90)=787.45ms p(95)=854.82ms p(99.9)=1.23s   
       { expected_response:true }...: avg=397.89ms min=3.72ms  med=368.02ms max=1.48s    p(90)=787.45ms p(95)=854.82ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36053
     http_req_receiving.............: avg=90.45µs  min=32.39µs med=75.12µs  max=179.16ms p(90)=110.58µs p(95)=123.61µs p(99.9)=841.42µs
     http_req_sending...............: avg=25.18µs  min=5.62µs  med=12.83µs  max=8.57ms   p(90)=20.2µs   p(95)=23.54µs  p(99.9)=3.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=397.77ms min=3.66ms  med=367.9ms  max=1.48s    p(90)=787.36ms p(95)=854.58ms p(99.9)=1.23s   
     http_reqs......................: 36053   559.232568/s
     iteration_duration.............: avg=409.46ms min=24.16ms med=382.19ms max=1.48s    p(90)=791.37ms p(95)=857.89ms p(99.9)=1.23s   
     iterations.....................: 35053   543.721167/s
     success_rate...................: 100.00% ✓ 35053      ✗ 0    
     vus............................: 79      min=0        max=499
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

     checks.........................: 100.00% ✓ 47598      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=14.48µs  min=1.27µs  med=3.62µs   max=4.06ms   p(90)=5.49µs   p(95)=6.92µs   p(99.9)=2.61ms 
     http_req_connecting............: avg=9.28µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=2.57ms 
     http_req_duration..............: avg=847.7ms  min=5.66ms  med=752.47ms max=18.4s    p(90)=1.46s    p(95)=1.66s    p(99.9)=16.77s 
       { expected_response:true }...: avg=847.7ms  min=5.66ms  med=752.47ms max=18.4s    p(90)=1.46s    p(95)=1.66s    p(99.9)=16.77s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16866
     http_req_receiving.............: avg=255.03µs min=35.7µs  med=98.09µs  max=150.38ms p(90)=137.63µs p(95)=151.94µs p(99.9)=85.94ms
     http_req_sending...............: avg=30.8µs   min=6.15µs  med=17.87µs  max=37.45ms  p(90)=24.45µs  p(95)=29.22µs  p(99.9)=2.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=847.42ms min=5.52ms  med=752.32ms max=18.4s    p(90)=1.46s    p(95)=1.66s    p(99.9)=16.77s 
     http_reqs......................: 16866   249.723264/s
     iteration_duration.............: avg=901.24ms min=14.17ms med=815.7ms  max=18.41s   p(90)=1.49s    p(95)=1.67s    p(99.9)=16.79s 
     iterations.....................: 15866   234.916952/s
     success_rate...................: 100.00% ✓ 15866      ✗ 0    
     vus............................: 83      min=0        max=500
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

     checks.........................: 100.00% ✓ 42534      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   250 kB/s
     http_req_blocked...............: avg=16.32µs  min=1.32µs  med=3.35µs   max=5.89ms   p(90)=5.06µs   p(95)=6.64µs   p(99.9)=2.58ms  
     http_req_connecting............: avg=11.3µs   min=0s      med=0s       max=5.83ms   p(90)=0s       p(95)=0s       p(99.9)=2.55ms  
     http_req_duration..............: avg=483.17ms min=8.4ms   med=530.21ms max=1.44s    p(90)=852.06ms p(95)=905.43ms p(99.9)=1.23s   
       { expected_response:true }...: avg=483.17ms min=8.4ms   med=530.21ms max=1.44s    p(90)=852.06ms p(95)=905.43ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15178
     http_req_receiving.............: avg=110.97µs min=34.45µs med=93µs     max=105.42ms p(90)=132.92µs p(95)=146.35µs p(99.9)=759.84µs
     http_req_sending...............: avg=42.67µs  min=5.88µs  med=17.1µs   max=103.93ms p(90)=22.99µs  p(95)=27.97µs  p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=483.01ms min=8.27ms  med=529.92ms max=1.44s    p(90)=851.94ms p(95)=905.3ms  p(99.9)=1.23s   
     http_reqs......................: 15178   203.93333/s
     iteration_duration.............: avg=517.13ms min=13.98ms med=558.3ms  max=1.44s    p(90)=857.35ms p(95)=910.28ms p(99.9)=1.24s   
     iterations.....................: 14178   190.497216/s
     success_rate...................: 100.00% ✓ 14178      ✗ 0    
     vus............................: 69      min=0        max=498
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

     checks.........................: 100.00% ✓ 433572      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=24.01µs  min=1.05µs  med=2.42µs  max=66.37ms  p(90)=4.18µs   p(95)=5.5µs    p(99.9)=4.54ms  
     http_req_connecting............: avg=20.6µs   min=0s      med=0s      max=66.16ms  p(90)=0s       p(95)=0s       p(99.9)=4.39ms  
     http_req_duration..............: avg=97.69ms  min=1.67ms  med=91.42ms max=402.76ms p(90)=188.76ms p(95)=204.25ms p(99.9)=259.31ms
       { expected_response:true }...: avg=97.69ms  min=1.67ms  med=91.42ms max=402.76ms p(90)=188.76ms p(95)=204.25ms p(99.9)=259.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145524
     http_req_receiving.............: avg=308.56µs min=27.51µs med=59.99µs max=249.37ms p(90)=203.7µs  p(95)=435.93µs p(99.9)=28.89ms 
     http_req_sending...............: avg=84.82µs  min=5.34µs  med=10.84µs max=330.05ms p(90)=21.76µs  p(95)=140.42µs p(99.9)=11.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.29ms  min=1.62ms  med=91.08ms max=284.51ms p(90)=188.17ms p(95)=203.5ms  p(99.9)=256.3ms 
     http_reqs......................: 145524  2340.535869/s
     iteration_duration.............: avg=98.65ms  min=4ms     med=92.53ms max=421.26ms p(90)=189.26ms p(95)=204.79ms p(99.9)=260.77ms
     iterations.....................: 144524  2324.452364/s
     success_rate...................: 100.00% ✓ 144524      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 340584      ✗ 0     
     data_received..................: 10 GB   161 MB/s
     data_sent......................: 138 MB  2.2 MB/s
     http_req_blocked...............: avg=11.59µs  min=1.02µs  med=2.56µs   max=66.82ms  p(90)=4.11µs   p(95)=5.13µs   p(99.9)=976.7µs 
     http_req_connecting............: avg=8.32µs   min=0s      med=0s       max=66.76ms  p(90)=0s       p(95)=0s       p(99.9)=843.29µs
     http_req_duration..............: avg=124.34ms min=1.82ms  med=118.42ms max=779.47ms p(90)=234.75ms p(95)=260.55ms p(99.9)=532.78ms
       { expected_response:true }...: avg=124.34ms min=1.82ms  med=118.42ms max=779.47ms p(90)=234.75ms p(95)=260.55ms p(99.9)=532.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 114528
     http_req_receiving.............: avg=1.28ms   min=53.31µs med=156.74µs max=236.24ms p(90)=1.64ms   p(95)=3.5ms    p(99.9)=92.05ms 
     http_req_sending...............: avg=54.31µs  min=5.22µs  med=10.5µs   max=227.68ms p(90)=18.92µs  p(95)=120.2µs  p(99.9)=6.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123ms    min=1.7ms   med=117.06ms max=779.01ms p(90)=232.71ms p(95)=257.91ms p(99.9)=530.09ms
     http_reqs......................: 114528  1839.443219/s
     iteration_duration.............: avg=125.71ms min=2.72ms  med=120.11ms max=779.72ms p(90)=235.38ms p(95)=261.21ms p(99.9)=533.75ms
     iterations.....................: 113528  1823.38214/s
     success_rate...................: 100.00% ✓ 113528      ✗ 0     
     vus............................: 70      min=0         max=495 
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

     checks.........................: 100.00% ✓ 207180      ✗ 0    
     data_received..................: 6.1 GB  98 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=8.34µs   min=1.08µs  med=2.59µs   max=33.02ms  p(90)=4.21µs   p(95)=5.11µs   p(99.9)=896.53µs
     http_req_connecting............: avg=5.06µs   min=0s      med=0s       max=32.97ms  p(90)=0s       p(95)=0s       p(99.9)=794.26µs
     http_req_duration..............: avg=203.72ms min=2.08ms  med=202.77ms max=625.06ms p(90)=378.44ms p(95)=406.68ms p(99.9)=506.64ms
       { expected_response:true }...: avg=203.72ms min=2.08ms  med=202.77ms max=625.06ms p(90)=378.44ms p(95)=406.68ms p(99.9)=506.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70060
     http_req_receiving.............: avg=80.96µs  min=29.76µs med=65.22µs  max=23.69ms  p(90)=100.15µs p(95)=115.43µs p(99.9)=1.76ms  
     http_req_sending...............: avg=33.07µs  min=5.42µs  med=11.32µs  max=118.2ms  p(90)=17.78µs  p(95)=21.51µs  p(99.9)=4.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.61ms min=2.02ms  med=202.66ms max=625ms    p(90)=378.34ms p(95)=406.61ms p(99.9)=506.57ms
     http_reqs......................: 70060   1120.228898/s
     iteration_duration.............: avg=206.93ms min=4.94ms  med=206.31ms max=625.27ms p(90)=379.42ms p(95)=407.4ms  p(99.9)=507.51ms
     iterations.....................: 69060   1104.239334/s
     success_rate...................: 100.00% ✓ 69060       ✗ 0    
     vus............................: 83      min=0         max=497
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

     checks.........................: 100.00% ✓ 100203     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   637 kB/s
     http_req_blocked...............: avg=9.2µs    min=1.08µs  med=2.96µs   max=4.53ms   p(90)=4.76µs   p(95)=5.78µs   p(99.9)=1.58ms 
     http_req_connecting............: avg=5.27µs   min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms 
     http_req_duration..............: avg=417.09ms min=3.8ms   med=386.76ms max=1.69s    p(90)=829.24ms p(95)=901.56ms p(99.9)=1.33s  
       { expected_response:true }...: avg=417.09ms min=3.8ms   med=386.76ms max=1.69s    p(90)=829.24ms p(95)=901.56ms p(99.9)=1.33s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 34401
     http_req_receiving.............: avg=161.94µs min=32.92µs med=78.41µs  max=181.71ms p(90)=115.01µs p(95)=128.76µs p(99.9)=12.27ms
     http_req_sending...............: avg=24.45µs  min=5.94µs  med=13.71µs  max=13.03ms  p(90)=20.87µs  p(95)=24.1µs   p(99.9)=2.37ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=416.9ms  min=3.74ms  med=386.66ms max=1.69s    p(90)=829.03ms p(95)=901.49ms p(99.9)=1.33s  
     http_reqs......................: 34401   530.830291/s
     iteration_duration.............: avg=429.82ms min=6.3ms   med=403.29ms max=1.69s    p(90)=833.52ms p(95)=904.79ms p(99.9)=1.34s  
     iterations.....................: 33401   515.399627/s
     success_rate...................: 100.00% ✓ 33401      ✗ 0    
     vus............................: 94      min=0        max=500
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

     checks.........................: 100.00% ✓ 46014      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   290 kB/s
     http_req_blocked...............: avg=13.67µs  min=1.28µs  med=3.69µs   max=17.6ms   p(90)=5.52µs   p(95)=7.08µs   p(99.9)=1.64ms
     http_req_connecting............: avg=8.15µs   min=0s      med=0s       max=17.53ms  p(90)=0s       p(95)=0s       p(99.9)=1.51ms
     http_req_duration..............: avg=891.49ms min=5.94ms  med=809.09ms max=5.04s    p(90)=1.78s    p(95)=1.99s    p(99.9)=4.21s 
       { expected_response:true }...: avg=891.49ms min=5.94ms  med=809.09ms max=5.04s    p(90)=1.78s    p(95)=1.99s    p(99.9)=4.21s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16338
     http_req_receiving.............: avg=115.46µs min=38.66µs med=97.91µs  max=103.6ms  p(90)=138.34µs p(95)=151.18µs p(99.9)=1.45ms
     http_req_sending...............: avg=48.63µs  min=6.18µs  med=18.04µs  max=166.78ms p(90)=24.29µs  p(95)=29.2µs   p(99.9)=3.11ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=891.33ms min=5.83ms  med=808.99ms max=5.04s    p(90)=1.78s    p(95)=1.99s    p(99.9)=4.21s 
     http_reqs......................: 16338   241.200539/s
     iteration_duration.............: avg=949.7ms  min=48.17ms med=884.4ms  max=5.05s    p(90)=1.79s    p(95)=2s       p(99.9)=4.23s 
     iterations.....................: 15338   226.437377/s
     success_rate...................: 100.00% ✓ 15338      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 40371      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   248 kB/s
     http_req_blocked...............: avg=15.34µs  min=1.18µs  med=3.58µs   max=3.81ms  p(90)=5.31µs   p(95)=7.04µs   p(99.9)=2.43ms
     http_req_connecting............: avg=9.95µs   min=0s      med=0s       max=3.78ms  p(90)=0s       p(95)=0s       p(99.9)=2.39ms
     http_req_duration..............: avg=1s       min=8.77ms  med=921.42ms max=4.2s    p(90)=2.06s    p(95)=2.2s     p(99.9)=3.58s 
       { expected_response:true }...: avg=1s       min=8.77ms  med=921.42ms max=4.2s    p(90)=2.06s    p(95)=2.2s     p(99.9)=3.58s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14457
     http_req_receiving.............: avg=118.92µs min=34.14µs med=97.04µs  max=53.61ms p(90)=136.97µs p(95)=148.89µs p(99.9)=1.4ms 
     http_req_sending...............: avg=27.69µs  min=6.33µs  med=18µs     max=9.8ms   p(90)=23.77µs  p(95)=28.73µs  p(99.9)=2.5ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1s       min=8.64ms  med=921.33ms max=4.2s    p(90)=2.06s    p(95)=2.2s     p(99.9)=3.58s 
     http_reqs......................: 14457   206.604321/s
     iteration_duration.............: avg=1.08s    min=27.03ms med=1.01s    max=4.2s    p(90)=2.08s    p(95)=2.21s    p(99.9)=3.61s 
     iterations.....................: 13457   192.313368/s
     success_rate...................: 100.00% ✓ 13457      ✗ 0    
     vus............................: 52      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

