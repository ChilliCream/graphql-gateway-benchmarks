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
| hive-router | v0.0.49 | 2,674 | 2,777 | 2,635 | 1.9% |  |
| hotchocolate | 16.1.3-p.1 | 2,036 | 2,074 | 2,026 | 0.9% |  |
| cosmo | 0.307.0 | 1,165 | 1,187 | 1,159 | 1.0% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 513 | 518 | 512 | 0.4% |  |
| hive-gateway | 2.5.25 | 220 | 222 | 219 | 0.5% |  |
| apollo-gateway | 2.13.3 | 201 | 204 | 200 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (24321 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (532637 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,233 | 2,325 | 2,173 | 2.2% |  |
| hotchocolate | 16.1.3-p.1 | 1,926 | 1,944 | 1,865 | 1.4% |  |
| cosmo | 0.307.0 | 1,142 | 1,144 | 1,137 | 0.3% | non-compatible response (5 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 481 | 489 | 477 | 0.8% |  |
| hive-gateway | 2.5.25 | 224 | 226 | 222 | 0.6% |  |
| apollo-gateway | 2.13.3 | 204 | 207 | 202 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (24822 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (312710 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 493173      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=26.49µs  min=992ns   med=2.63µs  max=79.4ms   p(90)=4.18µs   p(95)=5.31µs   p(99.9)=3.18ms  
     http_req_connecting............: avg=22.64µs  min=0s      med=0s      max=79.33ms  p(90)=0s       p(95)=0s       p(99.9)=2.53ms  
     http_req_duration..............: avg=85.87ms  min=1.56ms  med=79.34ms max=378.88ms p(90)=167.34ms p(95)=183.86ms p(99.9)=239.79ms
       { expected_response:true }...: avg=85.87ms  min=1.56ms  med=79.34ms max=378.88ms p(90)=167.34ms p(95)=183.86ms p(99.9)=239.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165391
     http_req_receiving.............: avg=452.68µs min=29.84µs med=58.51µs max=78.31ms  p(90)=259.97µs p(95)=436.71µs p(99.9)=44.28ms 
     http_req_sending...............: avg=89.46µs  min=5.22µs  med=10.26µs max=75.43ms  p(90)=18.98µs  p(95)=137.48µs p(99.9)=13.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.33ms  min=1.5ms   med=79.03ms max=347.56ms p(90)=166.16ms p(95)=182.17ms p(99.9)=232.94ms
     http_reqs......................: 165391  2674.489179/s
     iteration_duration.............: avg=86.72ms  min=2.47ms  med=80.34ms max=387.82ms p(90)=167.9ms  p(95)=184.48ms p(99.9)=241.55ms
     iterations.....................: 164391  2658.318474/s
     success_rate...................: 100.00% ✓ 164391      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 380634      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.4 MB/s
     http_req_blocked...............: avg=18.52µs  min=990ns   med=2.57µs   max=56.82ms  p(90)=3.94µs   p(95)=4.83µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=15.16µs  min=0s      med=0s       max=56.77ms  p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=111.28ms min=2.38ms  med=101.04ms max=963.18ms p(90)=216.02ms p(95)=255.3ms  p(99.9)=544.42ms
       { expected_response:true }...: avg=111.28ms min=2.38ms  med=101.04ms max=963.18ms p(90)=216.02ms p(95)=255.3ms  p(99.9)=544.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127878
     http_req_receiving.............: avg=2.6ms    min=53.29µs med=118.55µs max=702.58ms p(90)=1.47ms   p(95)=5.72ms   p(99.9)=166.87ms
     http_req_sending...............: avg=71.25µs  min=5.5µs   med=10.23µs  max=196.22ms p(90)=18.25µs  p(95)=127.17µs p(99.9)=9.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.61ms min=2.3ms   med=100.01ms max=900.81ms p(90)=210.94ms p(95)=244.4ms  p(99.9)=444.76ms
     http_reqs......................: 127878  2036.234658/s
     iteration_duration.............: avg=112.43ms min=3.7ms   med=102.3ms  max=963.4ms  p(90)=216.73ms p(95)=256.11ms p(99.9)=545.64ms
     iterations.....................: 126878  2020.311397/s
     success_rate...................: 100.00% ✓ 126878      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 215619      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=8.48µs   min=1.05µs  med=2.6µs    max=46.96ms  p(90)=4.12µs   p(95)=4.96µs   p(99.9)=543.65µs
     http_req_connecting............: avg=4.59µs   min=0s      med=0s       max=46.91ms  p(90)=0s       p(95)=0s       p(99.9)=478.42µs
     http_req_duration..............: avg=195.8ms  min=2.04ms  med=196.81ms max=625.8ms  p(90)=361.33ms p(95)=388.01ms p(99.9)=517.57ms
       { expected_response:true }...: avg=195.8ms  min=2.04ms  med=196.81ms max=625.8ms  p(90)=361.33ms p(95)=388.01ms p(99.9)=517.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72873
     http_req_receiving.............: avg=80.91µs  min=30.51µs med=62.91µs  max=33.37ms  p(90)=96.47µs  p(95)=112.03µs p(99.9)=2.12ms  
     http_req_sending...............: avg=34.94µs  min=5.69µs  med=10.84µs  max=80.84ms  p(90)=16.77µs  p(95)=20.73µs  p(99.9)=4.2ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.68ms min=1.97ms  med=196.72ms max=625.73ms p(90)=361.22ms p(95)=387.9ms  p(99.9)=517.49ms
     http_reqs......................: 72873   1165.877841/s
     iteration_duration.............: avg=198.79ms min=3.51ms  med=200.21ms max=626.03ms p(90)=362.24ms p(95)=388.81ms p(99.9)=517.98ms
     iterations.....................: 71873   1149.879079/s
     success_rate...................: 100.00% ✓ 71873       ✗ 0    
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

     checks.........................: 100.00% ✓ 96846      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   617 kB/s
     http_req_blocked...............: avg=9.06µs   min=1.14µs  med=3.31µs   max=5.44ms   p(90)=5.19µs   p(95)=6.34µs   p(99.9)=1.27ms  
     http_req_connecting............: avg=4.76µs   min=0s      med=0s       max=5.39ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=431.24ms min=3.99ms  med=400.77ms max=1.58s    p(90)=841.93ms p(95)=925.91ms p(99.9)=1.32s   
       { expected_response:true }...: avg=431.24ms min=3.99ms  med=400.77ms max=1.58s    p(90)=841.93ms p(95)=925.91ms p(99.9)=1.32s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33282
     http_req_receiving.............: avg=93.54µs  min=34.29µs med=79.03µs  max=130.38ms p(90)=115.5µs  p(95)=129.35µs p(99.9)=955.26µs
     http_req_sending...............: avg=32.69µs  min=5.79µs  med=14.19µs  max=66.11ms  p(90)=22µs     p(95)=25.62µs  p(99.9)=3.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=431.11ms min=3.93ms  med=400.68ms max=1.58s    p(90)=841.78ms p(95)=925.79ms p(99.9)=1.32s   
     http_reqs......................: 33282   513.645165/s
     iteration_duration.............: avg=444.85ms min=23.65ms med=416.49ms max=1.58s    p(90)=845.83ms p(95)=929.32ms p(99.9)=1.32s   
     iterations.....................: 32282   498.212043/s
     success_rate...................: 100.00% ✓ 32282      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 42239      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   265 kB/s
     http_req_blocked...............: avg=16.53µs  min=1.23µs  med=3.59µs   max=14.52ms p(90)=5.42µs   p(95)=7.15µs   p(99.9)=2.82ms  
     http_req_connecting............: avg=11.22µs  min=0s      med=0s       max=14.47ms p(90)=0s       p(95)=0s       p(99.9)=2.8ms   
     http_req_duration..............: avg=951.41ms min=6.3ms   med=845.28ms max=17.66s  p(90)=1.76s    p(95)=1.87s    p(99.9)=14.75s  
       { expected_response:true }...: avg=951.41ms min=6.3ms   med=845.28ms max=17.66s  p(90)=1.76s    p(95)=1.87s    p(99.9)=14.75s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15080
     http_req_receiving.............: avg=101.08µs min=36.09µs med=94.25µs  max=5.28ms  p(90)=132.67µs p(95)=147.24µs p(99.9)=940.81µs
     http_req_sending...............: avg=25.48µs  min=5.82µs  med=16.97µs  max=6.51ms  p(90)=23.31µs  p(95)=28.53µs  p(99.9)=2.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=951.28ms min=6.21ms  med=845.2ms  max=17.66s  p(90)=1.76s    p(95)=1.87s    p(99.9)=14.75s  
     http_reqs......................: 15080   220.452367/s
     iteration_duration.............: avg=1.01s    min=26.4ms  med=922.35ms max=17.66s  p(90)=1.77s    p(95)=1.88s    p(99.9)=14.79s  
     iterations.....................: 14079   205.818891/s
     success_rate...................: 100.00% ✓ 14079      ✗ 0    
     vus............................: 79      min=0        max=500
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

     checks.........................: 100.00% ✓ 41808      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   247 kB/s
     http_req_blocked...............: avg=16.13µs  min=1.3µs   med=3.5µs    max=7.49ms   p(90)=5.21µs   p(95)=6.78µs   p(99.9)=2.54ms  
     http_req_connecting............: avg=10.92µs  min=0s      med=0s       max=7.41ms   p(90)=0s       p(95)=0s       p(99.9)=2.52ms  
     http_req_duration..............: avg=482.02ms min=8.39ms  med=547.45ms max=1.43s    p(90)=896.82ms p(95)=955.47ms p(99.9)=1.31s   
       { expected_response:true }...: avg=482.02ms min=8.39ms  med=547.45ms max=1.43s    p(90)=896.82ms p(95)=955.47ms p(99.9)=1.31s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14936
     http_req_receiving.............: avg=107.03µs min=35.92µs med=91.26µs  max=139.87ms p(90)=130.56µs p(95)=143.88µs p(99.9)=932.82µs
     http_req_sending...............: avg=42.73µs  min=6.36µs  med=16.56µs  max=200.34ms p(90)=22.82µs  p(95)=27.37µs  p(99.9)=3.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=481.87ms min=8.26ms  med=547.33ms max=1.43s    p(90)=896.7ms  p(95)=955.33ms p(99.9)=1.31s   
     http_reqs......................: 14936   201.109188/s
     iteration_duration.............: avg=516.54ms min=8.89ms  med=575.84ms max=1.43s    p(90)=908.11ms p(95)=958.37ms p(99.9)=1.32s   
     iterations.....................: 13936   187.64446/s
     success_rate...................: 100.00% ✓ 13936      ✗ 0    
     vus............................: 59      min=0        max=495
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

     checks.........................: 100.00% ✓ 412356      ✗ 0     
     data_received..................: 12 GB   195 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=24.37µs  min=1.16µs  med=2.97µs  max=70.69ms  p(90)=4.79µs   p(95)=6.07µs   p(99.9)=3.57ms  
     http_req_connecting............: avg=20.48µs  min=0s      med=0s      max=70.62ms  p(90)=0s       p(95)=0s       p(99.9)=3.42ms  
     http_req_duration..............: avg=102.71ms min=1.65ms  med=97.88ms max=348.43ms p(90)=196.34ms p(95)=216.36ms p(99.9)=283.52ms
       { expected_response:true }...: avg=102.71ms min=1.65ms  med=97.88ms max=348.43ms p(90)=196.34ms p(95)=216.36ms p(99.9)=283.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138452
     http_req_receiving.............: avg=235.65µs min=29.21µs med=63.56µs max=58.59ms  p(90)=189.52µs p(95)=436.4µs  p(99.9)=26.85ms 
     http_req_sending...............: avg=79.65µs  min=5.72µs  med=11.73µs max=83.98ms  p(90)=22.07µs  p(95)=143.75µs p(99.9)=10.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.4ms  min=1.56ms  med=97.62ms max=338.25ms p(90)=196.01ms p(95)=215.7ms  p(99.9)=280.42ms
     http_reqs......................: 138452  2233.886534/s
     iteration_duration.............: avg=103.75ms min=4.52ms  med=99.22ms max=380.27ms p(90)=196.93ms p(95)=216.97ms p(99.9)=284.85ms
     iterations.....................: 137452  2217.751797/s
     success_rate...................: 100.00% ✓ 137452      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 356643      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=17.11µs  min=1.1µs   med=2.85µs   max=63.07ms  p(90)=4.48µs   p(95)=5.59µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=13.51µs  min=0s      med=0s       max=63ms     p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=118.75ms min=1.79ms  med=110.68ms max=702.41ms p(90)=227.67ms p(95)=261.59ms p(99.9)=462.34ms
       { expected_response:true }...: avg=118.75ms min=1.79ms  med=110.68ms max=702.41ms p(90)=227.67ms p(95)=261.59ms p(99.9)=462.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119881
     http_req_receiving.............: avg=1.82ms   min=52.63µs med=120.41µs max=552.03ms p(90)=1.68ms   p(95)=4.93ms   p(99.9)=151.65ms
     http_req_sending...............: avg=66.17µs  min=5.28µs  med=11.12µs  max=87.77ms  p(90)=20.32µs  p(95)=128.13µs p(99.9)=8.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.85ms min=1.71ms  med=109.25ms max=614.35ms p(90)=225.28ms p(95)=256.88ms p(99.9)=425.41ms
     http_reqs......................: 119881  1926.074224/s
     iteration_duration.............: avg=120.04ms min=2.89ms  med=112.27ms max=702.67ms p(90)=228.39ms p(95)=262.38ms p(99.9)=462.92ms
     iterations.....................: 118881  1910.007673/s
     success_rate...................: 100.00% ✓ 118881      ✗ 0     
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

     checks.........................: 100.00% ✓ 211605      ✗ 0    
     data_received..................: 6.3 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=8.2µs    min=1.13µs  med=2.85µs   max=27.27ms  p(90)=4.56µs   p(95)=5.52µs   p(99.9)=955.17µs
     http_req_connecting............: avg=4.62µs   min=0s      med=0s       max=27.22ms  p(90)=0s       p(95)=0s       p(99.9)=867.11µs
     http_req_duration..............: avg=199.5ms  min=2.13ms  med=200.2ms  max=677.36ms p(90)=366.31ms p(95)=395.63ms p(99.9)=586.26ms
       { expected_response:true }...: avg=199.5ms  min=2.13ms  med=200.2ms  max=677.36ms p(90)=366.31ms p(95)=395.63ms p(99.9)=586.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71535
     http_req_receiving.............: avg=87.07µs  min=29.96µs med=68.48µs  max=172.85ms p(90)=106.3µs  p(95)=122.48µs p(99.9)=1.78ms  
     http_req_sending...............: avg=31.91µs  min=5.56µs  med=12.2µs   max=77.51ms  p(90)=19.33µs  p(95)=23.15µs  p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.38ms min=2.03ms  med=200.06ms max=677.3ms  p(90)=366.23ms p(95)=395.54ms p(99.9)=586.17ms
     http_reqs......................: 71535   1142.291317/s
     iteration_duration.............: avg=202.58ms min=5.17ms  med=203.7ms  max=677.56ms p(90)=367.3ms  p(95)=396.42ms p(99.9)=587.17ms
     iterations.....................: 70535   1126.323032/s
     success_rate...................: 100.00% ✓ 70535       ✗ 0    
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

     checks.........................: 100.00% ✓ 91236      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   578 kB/s
     http_req_blocked...............: avg=10.72µs  min=1.15µs  med=3.3µs    max=35.79ms  p(90)=5.11µs   p(95)=6.09µs   p(99.9)=1.52ms 
     http_req_connecting............: avg=6.36µs   min=0s      med=0s       max=35.74ms  p(90)=0s       p(95)=0s       p(99.9)=1.49ms 
     http_req_duration..............: avg=457.18ms min=4.19ms  med=425.21ms max=1.97s    p(90)=907.73ms p(95)=988.7ms  p(99.9)=1.47s  
       { expected_response:true }...: avg=457.18ms min=4.19ms  med=425.21ms max=1.97s    p(90)=907.73ms p(95)=988.7ms  p(99.9)=1.47s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31412
     http_req_receiving.............: avg=102.23µs min=31.71µs med=81.38µs  max=168.8ms  p(90)=117.29µs p(95)=131.36µs p(99.9)=987.1µs
     http_req_sending...............: avg=32.95µs  min=5.72µs  med=14.73µs  max=141.46ms p(90)=21.62µs  p(95)=24.94µs  p(99.9)=2.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=457.04ms min=4.1ms   med=425.09ms max=1.97s    p(90)=907.64ms p(95)=988.62ms p(99.9)=1.47s  
     http_reqs......................: 31412   481.847665/s
     iteration_duration.............: avg=472.43ms min=21.07ms med=443.44ms max=1.98s    p(90)=913.73ms p(95)=992.74ms p(99.9)=1.48s  
     iterations.....................: 30412   466.50806/s
     success_rate...................: 100.00% ✓ 30412      ✗ 0    
     vus............................: 66      min=0        max=496
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

     checks.........................: 100.00% ✓ 43110      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   270 kB/s
     http_req_blocked...............: avg=15.26µs  min=1.35µs  med=3.85µs   max=18.87ms  p(90)=5.88µs  p(95)=7.54µs   p(99.9)=1.84ms
     http_req_connecting............: avg=9.5µs    min=0s      med=0s       max=18.67ms  p(90)=0s      p(95)=0s       p(99.9)=1.74ms
     http_req_duration..............: avg=948.54ms min=6.52ms  med=863.86ms max=5.79s    p(90)=1.89s   p(95)=2.09s    p(99.9)=4.87s 
       { expected_response:true }...: avg=948.54ms min=6.52ms  med=863.86ms max=5.79s    p(90)=1.89s   p(95)=2.09s    p(99.9)=4.87s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15370
     http_req_receiving.............: avg=128.06µs min=37.35µs med=102.04µs max=112.54ms p(90)=140.2µs p(95)=153.36µs p(99.9)=1.18ms
     http_req_sending...............: avg=56.14µs  min=6.25µs  med=18.55µs  max=164.21ms p(90)=24.95µs p(95)=30.27µs  p(99.9)=2.58ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=948.35ms min=6.43ms  med=863.76ms max=5.79s    p(90)=1.89s   p(95)=2.09s    p(99.9)=4.87s 
     http_reqs......................: 15370   224.845045/s
     iteration_duration.............: avg=1.01s    min=44.43ms med=941.33ms max=5.79s    p(90)=1.91s   p(95)=2.1s     p(99.9)=4.92s 
     iterations.....................: 14370   210.21622/s
     success_rate...................: 100.00% ✓ 14370      ✗ 0    
     vus............................: 76      min=0        max=500
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

     checks.........................: 100.00% ✓ 40113      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=17.27µs  min=1.35µs  med=3.53µs   max=31.97ms  p(90)=5.26µs   p(95)=6.93µs   p(99.9)=2.3ms   
     http_req_connecting............: avg=11.84µs  min=0s      med=0s       max=31.92ms  p(90)=0s       p(95)=0s       p(99.9)=2.19ms  
     http_req_duration..............: avg=1.01s    min=8.8ms   med=927.25ms max=4.01s    p(90)=2.03s    p(95)=2.18s    p(99.9)=3.56s   
       { expected_response:true }...: avg=1.01s    min=8.8ms   med=927.25ms max=4.01s    p(90)=2.03s    p(95)=2.18s    p(99.9)=3.56s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14371
     http_req_receiving.............: avg=116.43µs min=35.92µs med=94.58µs  max=136.42ms p(90)=134.31µs p(95)=146.72µs p(99.9)=816.62µs
     http_req_sending...............: avg=41.1µs   min=6.2µs   med=17.66µs  max=77.12ms  p(90)=23.83µs  p(95)=28.84µs  p(99.9)=3.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.01s    min=8.68ms  med=927.15ms max=4.01s    p(90)=2.03s    p(95)=2.18s    p(99.9)=3.56s   
     http_reqs......................: 14371   204.938919/s
     iteration_duration.............: avg=1.09s    min=36.51ms med=1.02s    max=4.02s    p(90)=2.05s    p(95)=2.2s     p(99.9)=3.57s   
     iterations.....................: 13371   190.67833/s
     success_rate...................: 100.00% ✓ 13371      ✗ 0    
     vus............................: 64      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

