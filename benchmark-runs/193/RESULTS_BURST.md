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
| hive-router | v0.0.49 | 2,817 | 2,930 | 2,809 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,024 | 2,080 | 2,008 | 1.3% |  |
| cosmo | 0.307.0 | 1,214 | 1,215 | 1,200 | 0.6% | non-compatible response (12 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 491 | 495 | 486 | 0.6% |  |
| hive-gateway | 2.5.25 | 234 | 236 | 223 | 1.7% |  |
| apollo-gateway | 2.13.3 | 201 | 205 | 199 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (7440 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (460241 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,256 | 2,333 | 2,219 | 1.5% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,900 | 1,924 | 1,798 | 2.0% |  |
| cosmo | 0.307.0 | 1,158 | 1,167 | 1,148 | 0.8% | non-compatible response (11 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 475 | 481 | 470 | 0.6% |  |
| hive-gateway | 2.5.25 | 232 | 236 | 231 | 0.6% |  |
| apollo-gateway | 2.13.3 | 207 | 211 | 206 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (14260 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (313704 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 519909      ✗ 0     
     data_received..................: 15 GB   247 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=32.15µs  min=942ns   med=2.19µs  max=73.66ms  p(90)=3.68µs   p(95)=4.85µs   p(99.9)=5.9ms   
     http_req_connecting............: avg=28.82µs  min=0s      med=0s      max=73.47ms  p(90)=0s       p(95)=0s       p(99.9)=5.56ms  
     http_req_duration..............: avg=81.46ms  min=1.66ms  med=75.63ms max=277.46ms p(90)=157.86ms p(95)=177.43ms p(99.9)=242.71ms
       { expected_response:true }...: avg=81.46ms  min=1.66ms  med=75.63ms max=277.46ms p(90)=157.86ms p(95)=177.43ms p(99.9)=242.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 174303
     http_req_receiving.............: avg=507.19µs min=28.42µs med=55.26µs max=151.81ms p(90)=261.61µs p(95)=423.96µs p(99.9)=51.3ms  
     http_req_sending...............: avg=93.77µs  min=5.32µs  med=9.8µs   max=138.39ms p(90)=18.93µs  p(95)=132.71µs p(99.9)=15.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.86ms  min=1.59ms  med=75.31ms max=272.9ms  p(90)=156.77ms p(95)=174.89ms p(99.9)=237.62ms
     http_reqs......................: 174303  2817.0576/s
     iteration_duration.............: avg=82.25ms  min=2.23ms  med=76.5ms  max=347.17ms p(90)=158.4ms  p(95)=178.1ms  p(99.9)=244.48ms
     iterations.....................: 173303  2800.895757/s
     success_rate...................: 100.00% ✓ 173303      ✗ 0     
     vus............................: 52      min=0         max=499 
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

     checks.........................: 100.00% ✓ 377505      ✗ 0     
     data_received..................: 11 GB   177 MB/s
     data_sent......................: 152 MB  2.4 MB/s
     http_req_blocked...............: avg=15.69µs  min=982ns   med=2.16µs   max=77.36ms  p(90)=3.4µs    p(95)=4.29µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=12.94µs  min=0s      med=0s       max=77.32ms  p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=112.21ms min=2.34ms  med=101.06ms max=684.38ms p(90)=220.03ms p(95)=259.36ms p(99.9)=472.43ms
       { expected_response:true }...: avg=112.21ms min=2.34ms  med=101.06ms max=684.38ms p(90)=220.03ms p(95)=259.36ms p(99.9)=472.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126835
     http_req_receiving.............: avg=2.35ms   min=52.16µs med=114.21µs max=351.46ms p(90)=1.49ms   p(95)=5.6ms    p(99.9)=151.72ms
     http_req_sending...............: avg=58.29µs  min=5.34µs  med=9.6µs    max=112.13ms p(90)=16.6µs   p(95)=114.31µs p(99.9)=8.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.8ms  min=2.25ms  med=99.83ms  max=565.16ms p(90)=216.38ms p(95)=250.51ms p(99.9)=422.66ms
     http_reqs......................: 126835  2024.068186/s
     iteration_duration.............: avg=113.38ms min=3.7ms   med=102.62ms max=684.6ms  p(90)=220.8ms  p(95)=260.22ms p(99.9)=476.42ms
     iterations.....................: 125835  2008.109908/s
     success_rate...................: 100.00% ✓ 125835      ✗ 0     
     vus............................: 86      min=0         max=498 
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

     checks.........................: 100.00% ✓ 224607      ✗ 0    
     data_received..................: 6.7 GB  107 MB/s
     data_sent......................: 91 MB   1.5 MB/s
     http_req_blocked...............: avg=5µs      min=1.02µs  med=2.21µs   max=5.18ms   p(90)=3.71µs   p(95)=4.62µs   p(99.9)=299.28µs
     http_req_connecting............: avg=1.93µs   min=0s      med=0s       max=4.91ms   p(90)=0s       p(95)=0s       p(99.9)=243.07µs
     http_req_duration..............: avg=188.06ms min=2.05ms  med=188.27ms max=563.41ms p(90)=350.28ms p(95)=375.91ms p(99.9)=474.33ms
       { expected_response:true }...: avg=188.06ms min=2.05ms  med=188.27ms max=563.41ms p(90)=350.28ms p(95)=375.91ms p(99.9)=474.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75869
     http_req_receiving.............: avg=123.53µs min=29.02µs med=60.91µs  max=247.42ms p(90)=95.9µs   p(95)=110.52µs p(99.9)=2.68ms  
     http_req_sending...............: avg=28.77µs  min=5.5µs   med=10.37µs  max=84.24ms  p(90)=16.52µs  p(95)=20.11µs  p(99.9)=3.6ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.91ms min=2ms     med=188.06ms max=563.32ms p(90)=350.17ms p(95)=375.76ms p(99.9)=474.23ms
     http_reqs......................: 75869   1214.365693/s
     iteration_duration.............: avg=190.82ms min=4.47ms  med=191.16ms max=563.63ms p(90)=351.17ms p(95)=376.52ms p(99.9)=474.8ms 
     iterations.....................: 74869   1198.359607/s
     success_rate...................: 100.00% ✓ 74869       ✗ 0    
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

     checks.........................: 100.00% ✓ 92631      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   590 kB/s
     http_req_blocked...............: avg=9.95µs   min=1.16µs  med=2.61µs   max=49.45ms  p(90)=4.43µs   p(95)=5.41µs   p(99.9)=1.17ms
     http_req_connecting............: avg=6.06µs   min=0s      med=0s       max=49.39ms  p(90)=0s       p(95)=0s       p(99.9)=1ms   
     http_req_duration..............: avg=450.67ms min=4.04ms  med=417.58ms max=1.86s    p(90)=897.64ms p(95)=973.3ms  p(99.9)=1.4s  
       { expected_response:true }...: avg=450.67ms min=4.04ms  med=417.58ms max=1.86s    p(90)=897.64ms p(95)=973.3ms  p(99.9)=1.4s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31877
     http_req_receiving.............: avg=116.76µs min=32.08µs med=74.3µs   max=145.12ms p(90)=111.28µs p(95)=124.76µs p(99.9)=8.66ms
     http_req_sending...............: avg=25.82µs  min=5.7µs   med=12.49µs  max=71.14ms  p(90)=20.27µs  p(95)=23.67µs  p(99.9)=2.57ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=450.53ms min=3.96ms  med=417.48ms max=1.86s    p(90)=897.48ms p(95)=973.18ms p(99.9)=1.4s  
     http_reqs......................: 31877   491.45955/s
     iteration_duration.............: avg=465.5ms  min=9.38ms  med=434.47ms max=1.9s     p(90)=902.38ms p(95)=977.04ms p(99.9)=1.41s 
     iterations.....................: 30877   476.042179/s
     success_rate...................: 100.00% ✓ 30877      ✗ 0    
     vus............................: 14      min=0        max=500
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

     checks.........................: 100.00% ✓ 44943      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   283 kB/s
     http_req_blocked...............: avg=14.31µs  min=1.28µs  med=3.6µs    max=15.36ms p(90)=5.45µs   p(95)=7.07µs   p(99.9)=2.15ms  
     http_req_connecting............: avg=9.08µs   min=0s      med=0s       max=15.3ms  p(90)=0s       p(95)=0s       p(99.9)=2.12ms  
     http_req_duration..............: avg=892.69ms min=6.13ms  med=783.17ms max=18.43s  p(90)=1.55s    p(95)=1.7s     p(99.9)=16.25s  
       { expected_response:true }...: avg=892.69ms min=6.13ms  med=783.17ms max=18.43s  p(90)=1.55s    p(95)=1.7s     p(99.9)=16.25s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 15981
     http_req_receiving.............: avg=105.75µs min=36.25µs med=99.09µs  max=20.16ms p(90)=137.34µs p(95)=149.99µs p(99.9)=931.35µs
     http_req_sending...............: avg=30.18µs  min=6.27µs  med=18.33µs  max=36.49ms p(90)=24.51µs  p(95)=28.86µs  p(99.9)=2.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=892.55ms min=6.04ms  med=782.92ms max=18.43s  p(90)=1.55s    p(95)=1.7s     p(99.9)=16.25s  
     http_reqs......................: 15981   234.523126/s
     iteration_duration.............: avg=952.24ms min=35.26ms med=847.19ms max=18.43s  p(90)=1.57s    p(95)=1.71s    p(99.9)=16.34s  
     iterations.....................: 14981   219.848004/s
     success_rate...................: 100.00% ✓ 14981      ✗ 0    
     vus............................: 56      min=0        max=500
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

     checks.........................: 100.00% ✓ 42093      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   248 kB/s
     http_req_blocked...............: avg=13.71µs  min=1.14µs  med=3.05µs   max=3.19ms  p(90)=4.63µs   p(95)=6.12µs   p(99.9)=2.16ms  
     http_req_connecting............: avg=8.97µs   min=0s      med=0s       max=3.1ms   p(90)=0s       p(95)=0s       p(99.9)=2.13ms  
     http_req_duration..............: avg=442.4ms  min=8.49ms  med=480.32ms max=1.35s   p(90)=795.67ms p(95)=856.79ms p(99.9)=1.23s   
       { expected_response:true }...: avg=442.4ms  min=8.49ms  med=480.32ms max=1.35s   p(90)=795.67ms p(95)=856.79ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15031
     http_req_receiving.............: avg=96.42µs  min=34.59µs med=85.93µs  max=30.41ms p(90)=123.96µs p(95)=138.27µs p(99.9)=988.39µs
     http_req_sending...............: avg=28.82µs  min=5.38µs  med=14.9µs   max=18.82ms p(90)=21.27µs  p(95)=26.12µs  p(99.9)=2.88ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=442.28ms min=8.4ms   med=480.25ms max=1.35s   p(90)=795.59ms p(95)=856.7ms  p(99.9)=1.23s   
     http_reqs......................: 15031   201.78264/s
     iteration_duration.............: avg=473.78ms min=8.84ms  med=503.49ms max=1.35s   p(90)=800.99ms p(95)=861.77ms p(99.9)=1.24s   
     iterations.....................: 14031   188.358208/s
     success_rate...................: 100.00% ✓ 14031      ✗ 0    
     vus............................: 69      min=0        max=496
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

     checks.........................: 100.00% ✓ 417663      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=25.26µs  min=1.06µs  med=2.48µs  max=78.31ms  p(90)=4.24µs   p(95)=5.53µs   p(99.9)=4.36ms  
     http_req_connecting............: avg=21.96µs  min=0s      med=0s      max=78.23ms  p(90)=0s       p(95)=0s       p(99.9)=4.32ms  
     http_req_duration..............: avg=101.42ms min=1.76ms  med=95.04ms max=331.74ms p(90)=196.04ms p(95)=214.58ms p(99.9)=282.73ms
       { expected_response:true }...: avg=101.42ms min=1.76ms  med=95.04ms max=331.74ms p(90)=196.04ms p(95)=214.58ms p(99.9)=282.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140221
     http_req_receiving.............: avg=214.44µs min=29.59µs med=61.55µs max=215.51ms p(90)=186.72µs p(95)=426.47µs p(99.9)=24.18ms 
     http_req_sending...............: avg=84µs     min=5.64µs  med=11.14µs max=87.32ms  p(90)=21.91µs  p(95)=141.44µs p(99.9)=11.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.12ms min=1.66ms  med=94.73ms max=320.14ms p(90)=195.58ms p(95)=214.06ms p(99.9)=281.03ms
     http_reqs......................: 140221  2256.196193/s
     iteration_duration.............: avg=102.43ms min=4.16ms  med=96.23ms max=355.12ms p(90)=196.64ms p(95)=215.16ms p(99.9)=283.67ms
     iterations.....................: 139221  2240.105905/s
     success_rate...................: 100.00% ✓ 139221      ✗ 0     
     vus............................: 64      min=0         max=496 
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

     checks.........................: 100.00% ✓ 351624      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=18.23µs  min=952ns   med=2.3µs    max=98.35ms  p(90)=3.83µs   p(95)=4.86µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=14.9µs   min=0s      med=0s       max=57.12ms  p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=120.44ms min=1.74ms  med=113.12ms max=669.26ms p(90)=228.8ms  p(95)=264.5ms  p(99.9)=494.01ms
       { expected_response:true }...: avg=120.44ms min=1.74ms  med=113.12ms max=669.26ms p(90)=228.8ms  p(95)=264.5ms  p(99.9)=494.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118208
     http_req_receiving.............: avg=2.2ms    min=52.81µs med=116.23µs max=316.5ms  p(90)=1.71ms   p(95)=4.96ms   p(99.9)=205.79ms
     http_req_sending...............: avg=64.93µs  min=5.28µs  med=10.01µs  max=60.28ms  p(90)=18.56µs  p(95)=114.56µs p(99.9)=9.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.18ms min=1.65ms  med=111.8ms  max=616.01ms p(90)=225.38ms p(95)=257.83ms p(99.9)=459.67ms
     http_reqs......................: 118208  1900.527103/s
     iteration_duration.............: avg=121.76ms min=3.13ms  med=114.69ms max=669.48ms p(90)=229.61ms p(95)=265.54ms p(99.9)=495.18ms
     iterations.....................: 117208  1884.449282/s
     success_rate...................: 100.00% ✓ 117208      ✗ 0     
     vus............................: 66      min=0         max=496 
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

     checks.........................: 100.00% ✓ 214476      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=6.59µs   min=1.06µs  med=2.32µs   max=15.49ms  p(90)=3.98µs   p(95)=4.91µs   p(99.9)=732.74µs
     http_req_connecting............: avg=3.6µs    min=0s      med=0s       max=15.43ms  p(90)=0s       p(95)=0s       p(99.9)=682.73µs
     http_req_duration..............: avg=196.86ms min=2.1ms   med=198.07ms max=549.76ms p(90)=362.67ms p(95)=387.71ms p(99.9)=471.96ms
       { expected_response:true }...: avg=196.86ms min=2.1ms   med=198.07ms max=549.76ms p(90)=362.67ms p(95)=387.71ms p(99.9)=471.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72492
     http_req_receiving.............: avg=81.03µs  min=29.99µs med=63.07µs  max=84.94ms  p(90)=101.59µs p(95)=119.17µs p(99.9)=1.92ms  
     http_req_sending...............: avg=33.65µs  min=5.02µs  med=11.11µs  max=118.17ms p(90)=18.33µs  p(95)=22.32µs  p(99.9)=3.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.75ms min=2.03ms  med=197.94ms max=549.64ms p(90)=362.58ms p(95)=387.61ms p(99.9)=471.89ms
     http_reqs......................: 72492   1158.800546/s
     iteration_duration.............: avg=199.86ms min=5.2ms   med=201.44ms max=549.93ms p(90)=363.52ms p(95)=388.52ms p(99.9)=472.27ms
     iterations.....................: 71492   1142.815327/s
     success_rate...................: 100.00% ✓ 71492       ✗ 0    
     vus............................: 84      min=0         max=493
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

     checks.........................: 100.00% ✓ 90150      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   571 kB/s
     http_req_blocked...............: avg=11.72µs  min=1.05µs  med=2.85µs   max=38.15ms  p(90)=4.6µs    p(95)=5.55µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=7.82µs   min=0s      med=0s       max=38.09ms  p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=462.68ms min=4.19ms  med=430.96ms max=2.1s     p(90)=916.06ms p(95)=996.84ms p(99.9)=1.45s   
       { expected_response:true }...: avg=462.68ms min=4.19ms  med=430.96ms max=2.1s     p(90)=916.06ms p(95)=996.84ms p(99.9)=1.45s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31050
     http_req_receiving.............: avg=90.98µs  min=31.25µs med=78.94µs  max=84.74ms  p(90)=115.45µs p(95)=128.63µs p(99.9)=801.28µs
     http_req_sending...............: avg=32.74µs  min=5.55µs  med=13.32µs  max=159.55ms p(90)=20.39µs  p(95)=23.72µs  p(99.9)=2.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=462.56ms min=4.09ms  med=430.87ms max=2.1s     p(90)=915.98ms p(95)=996.74ms p(99.9)=1.45s   
     http_reqs......................: 31050   475.912558/s
     iteration_duration.............: avg=478.28ms min=31.3ms  med=448.6ms  max=2.1s     p(90)=920.37ms p(95)=1s       p(99.9)=1.45s   
     iterations.....................: 30050   460.585262/s
     success_rate...................: 100.00% ✓ 30050      ✗ 0    
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

     checks.........................: 100.00% ✓ 44607      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   279 kB/s
     http_req_blocked...............: avg=15.67µs  min=1.17µs  med=3.64µs   max=3.92ms   p(90)=5.55µs   p(95)=7.25µs   p(99.9)=2.49ms  
     http_req_connecting............: avg=10.24µs  min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=2.47ms  
     http_req_duration..............: avg=918.81ms min=6.29ms  med=823.67ms max=4.81s    p(90)=1.83s    p(95)=2.05s    p(99.9)=4.35s   
       { expected_response:true }...: avg=918.81ms min=6.29ms  med=823.67ms max=4.81s    p(90)=1.83s    p(95)=2.05s    p(99.9)=4.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15869
     http_req_receiving.............: avg=116.27µs min=33.21µs med=101.41µs max=123.28ms p(90)=140.41µs p(95)=153.94µs p(99.9)=798.43µs
     http_req_sending...............: avg=53.65µs  min=5.76µs  med=18.21µs  max=118.5ms  p(90)=24.35µs  p(95)=29.09µs  p(99.9)=5.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=918.64ms min=6.18ms  med=823.53ms max=4.81s    p(90)=1.83s    p(95)=2.05s    p(99.9)=4.35s   
     http_reqs......................: 15869   232.581248/s
     iteration_duration.............: avg=980.73ms min=46.51ms med=895.52ms max=4.82s    p(90)=1.86s    p(95)=2.06s    p(99.9)=4.39s   
     iterations.....................: 14869   217.924922/s
     success_rate...................: 100.00% ✓ 14869      ✗ 0    
     vus............................: 67      min=0        max=499
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

     checks.........................: 100.00% ✓ 40557      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=17.63µs  min=1.22µs  med=3.49µs   max=18.36ms p(90)=5.29µs   p(95)=6.87µs   p(99.9)=2.76ms  
     http_req_connecting............: avg=12.26µs  min=0s      med=0s       max=18.25ms p(90)=0s       p(95)=0s       p(99.9)=2.73ms  
     http_req_duration..............: avg=1s       min=8.76ms  med=916.08ms max=4.38s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.74s   
       { expected_response:true }...: avg=1s       min=8.76ms  med=916.08ms max=4.38s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.74s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14519
     http_req_receiving.............: avg=103.09µs min=34.62µs med=97.71µs  max=4.8ms   p(90)=137.72µs p(95)=151.12µs p(99.9)=866.24µs
     http_req_sending...............: avg=32.94µs  min=5.92µs  med=17.96µs  max=23.87ms p(90)=24.17µs  p(95)=29.37µs  p(99.9)=3.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1s       min=8.64ms  med=915.91ms max=4.38s   p(90)=2.04s    p(95)=2.18s    p(99.9)=3.74s   
     http_reqs......................: 14519   207.367774/s
     iteration_duration.............: avg=1.07s    min=38.93ms med=1s       max=4.38s   p(90)=2.06s    p(95)=2.19s    p(99.9)=3.77s   
     iterations.....................: 13519   193.085264/s
     success_rate...................: 100.00% ✓ 13519      ✗ 0    
     vus............................: 59      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

