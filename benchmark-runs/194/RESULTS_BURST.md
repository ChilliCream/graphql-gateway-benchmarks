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
| hive-router | v0.0.49 | 2,677 | 2,813 | 2,625 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,051 | 2,092 | 2,025 | 1.1% |  |
| cosmo | 0.307.0 | 1,200 | 1,200 | 1,199 | 0.1% | non-compatible response (11 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 488 | 494 | 482 | 0.7% |  |
| hive-gateway | 2.5.25 | 235 | 238 | 222 | 2.0% |  |
| apollo-gateway | 2.13.3 | 202 | 207 | 200 | 1.0% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (20111 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (478036 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,213 | 2,319 | 2,172 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,917 | 1,950 | 1,887 | 1.4% |  |
| cosmo | 0.307.0 | 1,098 | 1,126 | 1,097 | 1.3% | non-compatible response (10 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 466 | 478 | 463 | 1.2% |  |
| hive-gateway | 2.5.25 | 225 | 228 | 222 | 0.9% |  |
| apollo-gateway | 2.13.3 | 202 | 207 | 201 | 0.9% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (10801 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (382147 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 494244      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=25.59µs min=971ns   med=2.21µs  max=88.19ms  p(90)=3.57µs   p(95)=4.64µs   p(99.9)=4.93ms  
     http_req_connecting............: avg=22.45µs min=0s      med=0s      max=88.05ms  p(90)=0s       p(95)=0s       p(99.9)=4.56ms  
     http_req_duration..............: avg=85.71ms min=1.6ms   med=79.97ms max=299.61ms p(90)=165.46ms p(95)=181.58ms p(99.9)=234.46ms
       { expected_response:true }...: avg=85.71ms min=1.6ms   med=79.97ms max=299.61ms p(90)=165.46ms p(95)=181.58ms p(99.9)=234.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165748
     http_req_receiving.............: avg=296.6µs min=28.19µs med=56.07µs max=47.87ms  p(90)=210.53µs p(95)=406.35µs p(99.9)=29.58ms 
     http_req_sending...............: avg=81.79µs min=5.4µs   med=9.9µs   max=198.63ms p(90)=18.39µs  p(95)=130.34µs p(99.9)=11.69ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.33ms min=1.55ms  med=79.69ms max=292ms    p(90)=164.88ms p(95)=180.7ms  p(99.9)=232.83ms
     http_reqs......................: 165748  2677.764907/s
     iteration_duration.............: avg=86.52ms min=2.39ms  med=80.89ms max=395.6ms  p(90)=165.98ms p(95)=182.06ms p(99.9)=236.81ms
     iterations.....................: 164748  2661.609268/s
     success_rate...................: 100.00% ✓ 164748      ✗ 0     
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

     checks.........................: 100.00% ✓ 382794      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=19.14µs  min=1.02µs  med=2.65µs   max=71.2ms   p(90)=4.13µs   p(95)=5.13µs   p(99.9)=2.24ms  
     http_req_connecting............: avg=15.71µs  min=0s      med=0s       max=71.09ms  p(90)=0s       p(95)=0s       p(99.9)=2.1ms   
     http_req_duration..............: avg=110.68ms min=2.38ms  med=102.05ms max=631.36ms p(90)=215.78ms p(95)=255.76ms p(99.9)=450.49ms
       { expected_response:true }...: avg=110.68ms min=2.38ms  med=102.05ms max=631.36ms p(90)=215.78ms p(95)=255.76ms p(99.9)=450.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128598
     http_req_receiving.............: avg=1.99ms   min=54.13µs med=117.81µs max=352.22ms p(90)=1.44ms   p(95)=5.33ms   p(99.9)=129.64ms
     http_req_sending...............: avg=67.13µs  min=5.39µs  med=10.45µs  max=204.33ms p(90)=18.47µs  p(95)=125.7µs  p(99.9)=9.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.62ms min=2.3ms   med=101ms    max=585.83ms p(90)=212.37ms p(95)=247.78ms p(99.9)=409.36ms
     http_reqs......................: 128598  2051.862113/s
     iteration_duration.............: avg=111.82ms min=3.52ms  med=103.38ms max=631.55ms p(90)=216.65ms p(95)=256.64ms p(99.9)=450.86ms
     iterations.....................: 127598  2035.906483/s
     success_rate...................: 100.00% ✓ 127598      ✗ 0     
     vus............................: 90      min=0         max=499 
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
     http_req_blocked...............: avg=5.81µs   min=1.06µs  med=2.23µs   max=9.89ms   p(90)=3.74µs   p(95)=4.68µs   p(99.9)=545.3µs 
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=9.82ms   p(90)=0s       p(95)=0s       p(99.9)=503.07µs
     http_req_duration..............: avg=190.32ms min=2.06ms  med=188.85ms max=553ms    p(90)=354.81ms p(95)=379.55ms p(99.9)=456.68ms
       { expected_response:true }...: avg=190.32ms min=2.06ms  med=188.85ms max=553ms    p(90)=354.81ms p(95)=379.55ms p(99.9)=456.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74982
     http_req_receiving.............: avg=126.77µs min=29.51µs med=61.04µs  max=304.15ms p(90)=96.93µs  p(95)=113.91µs p(99.9)=3.13ms  
     http_req_sending...............: avg=28.7µs   min=5.45µs  med=10.45µs  max=27.13ms  p(90)=16.7µs   p(95)=20.48µs  p(99.9)=3.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.16ms min=2.01ms  med=188.62ms max=552.94ms p(90)=354.63ms p(95)=379.43ms p(99.9)=456.61ms
     http_reqs......................: 74982   1200.111011/s
     iteration_duration.............: avg=193.13ms min=5.11ms  med=192.3ms  max=553.23ms p(90)=355.57ms p(95)=380.27ms p(99.9)=456.96ms
     iterations.....................: 73982   1184.10569/s
     success_rate...................: 100.00% ✓ 73982       ✗ 0    
     vus............................: 81      min=0         max=495
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

     checks.........................: 100.00% ✓ 92292      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   587 kB/s
     http_req_blocked...............: avg=8.71µs   min=1.22µs  med=3.04µs   max=4.94ms  p(90)=4.79µs   p(95)=5.87µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=4.51µs   min=0s      med=0s       max=3.22ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=452.1ms  min=4.07ms  med=417.74ms max=1.71s   p(90)=897.58ms p(95)=973.48ms p(99.9)=1.46s   
       { expected_response:true }...: avg=452.1ms  min=4.07ms  med=417.74ms max=1.71s   p(90)=897.58ms p(95)=973.48ms p(99.9)=1.46s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31764
     http_req_receiving.............: avg=86.7µs   min=30.85µs med=78.71µs  max=13.34ms p(90)=115.8µs  p(95)=129.2µs  p(99.9)=757.79µs
     http_req_sending...............: avg=28.44µs  min=5.86µs  med=14.04µs  max=35.52ms p(90)=21.67µs  p(95)=25.21µs  p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=451.99ms min=4.01ms  med=417.65ms max=1.71s   p(90)=897.44ms p(95)=973.4ms  p(99.9)=1.46s   
     http_reqs......................: 31764   488.847162/s
     iteration_duration.............: avg=467.02ms min=22.41ms med=435.25ms max=1.72s   p(90)=901.58ms p(95)=976.18ms p(99.9)=1.47s   
     iterations.....................: 30764   473.457187/s
     success_rate...................: 100.00% ✓ 30764      ✗ 0    
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

     checks.........................: 100.00% ✓ 44997      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   284 kB/s
     http_req_blocked...............: avg=12.41µs  min=1.21µs  med=3.58µs   max=5.04ms  p(90)=5.49µs  p(95)=7.13µs  p(99.9)=1.64ms  
     http_req_connecting............: avg=6.91µs   min=0s      med=0s       max=4.22ms  p(90)=0s      p(95)=0s      p(99.9)=1.47ms  
     http_req_duration..............: avg=887.13ms min=6.03ms  med=768.38ms max=19.63s  p(90)=1.54s   p(95)=1.69s   p(99.9)=17.3s   
       { expected_response:true }...: avg=887.13ms min=6.03ms  med=768.38ms max=19.63s  p(90)=1.54s   p(95)=1.69s   p(99.9)=17.3s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15999
     http_req_receiving.............: avg=109.09µs min=34.32µs med=99.33µs  max=35.52ms p(90)=138.8µs p(95)=152.4µs p(99.9)=801.44µs
     http_req_sending...............: avg=28.16µs  min=6.42µs  med=18.25µs  max=21.43ms p(90)=24.36µs p(95)=28.91µs p(99.9)=2.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=886.99ms min=5.95ms  med=768.23ms max=19.63s  p(90)=1.54s   p(95)=1.69s   p(99.9)=17.3s   
     http_reqs......................: 15999   235.785357/s
     iteration_duration.............: avg=946.24ms min=83.79ms med=831.24ms max=19.63s  p(90)=1.57s   p(95)=1.7s    p(99.9)=17.71s  
     iterations.....................: 14999   221.047852/s
     success_rate...................: 100.00% ✓ 14999      ✗ 0    
     vus............................: 1       min=0        max=500
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

     checks.........................: 100.00% ✓ 42075      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   248 kB/s
     http_req_blocked...............: avg=13.56µs  min=1.3µs   med=3.21µs   max=27.23ms p(90)=4.88µs   p(95)=6.46µs   p(99.9)=1.32ms
     http_req_connecting............: avg=8.76µs   min=0s      med=0s       max=27.15ms p(90)=0s       p(95)=0s       p(99.9)=1.29ms
     http_req_duration..............: avg=438.28ms min=8.28ms  med=451.76ms max=1.53s   p(90)=777.45ms p(95)=844.97ms p(99.9)=1.18s 
       { expected_response:true }...: avg=438.28ms min=8.28ms  med=451.76ms max=1.53s   p(90)=777.45ms p(95)=844.97ms p(99.9)=1.18s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15025
     http_req_receiving.............: avg=101.92µs min=34.56µs med=90.88µs  max=48.83ms p(90)=130.96µs p(95)=144.64µs p(99.9)=1.02ms
     http_req_sending...............: avg=35.12µs  min=5.73µs  med=16.47µs  max=59.26ms p(90)=22.44µs  p(95)=27.13µs  p(99.9)=3.24ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=438.14ms min=8.19ms  med=451.66ms max=1.53s   p(90)=777.33ms p(95)=844.87ms p(99.9)=1.18s 
     http_reqs......................: 15025   202.088981/s
     iteration_duration.............: avg=469.4ms  min=8.91ms  med=496.07ms max=1.54s   p(90)=783.14ms p(95)=855.28ms p(99.9)=1.19s 
     iterations.....................: 14025   188.638799/s
     success_rate...................: 100.00% ✓ 14025      ✗ 0    
     vus............................: 65      min=0        max=494
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

     checks.........................: 100.00% ✓ 409503      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=22.08µs  min=1.05µs  med=2.51µs  max=79.17ms  p(90)=4.27µs   p(95)=5.52µs   p(99.9)=4.65ms  
     http_req_connecting............: avg=18.68µs  min=0s      med=0s      max=78.99ms  p(90)=0s       p(95)=0s       p(99.9)=4.24ms  
     http_req_duration..............: avg=103.44ms min=1.62ms  med=97.23ms max=379.04ms p(90)=201.29ms p(95)=219.49ms p(99.9)=266.93ms
       { expected_response:true }...: avg=103.44ms min=1.62ms  med=97.23ms max=379.04ms p(90)=201.29ms p(95)=219.49ms p(99.9)=266.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137501
     http_req_receiving.............: avg=238.48µs min=28.58µs med=61.88µs max=226.83ms p(90)=174.46µs p(95)=415.31µs p(99.9)=25.67ms 
     http_req_sending...............: avg=75.79µs  min=5.42µs  med=10.84µs max=61.87ms  p(90)=20.93µs  p(95)=136.41µs p(99.9)=9.91ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.13ms min=1.57ms  med=97ms    max=298.02ms p(90)=200.68ms p(95)=218.86ms p(99.9)=265.02ms
     http_reqs......................: 137501  2213.522884/s
     iteration_duration.............: avg=104.47ms min=3.53ms  med=98.44ms max=415.98ms p(90)=201.91ms p(95)=219.93ms p(99.9)=268.07ms
     iterations.....................: 136501  2197.424653/s
     success_rate...................: 100.00% ✓ 136501      ✗ 0     
     vus............................: 63      min=0         max=497 
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

     checks.........................: 100.00% ✓ 355392      ✗ 0     
     data_received..................: 11 GB   168 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=15.67µs  min=1.02µs  med=2.74µs   max=56.35ms  p(90)=4.46µs   p(95)=5.55µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=12.09µs  min=0s      med=0s       max=56.3ms   p(90)=0s       p(95)=0s       p(99.9)=1.53ms  
     http_req_duration..............: avg=119.17ms min=1.8ms   med=111.78ms max=716.32ms p(90)=230.58ms p(95)=263.22ms p(99.9)=490.06ms
       { expected_response:true }...: avg=119.17ms min=1.8ms   med=111.78ms max=716.32ms p(90)=230.58ms p(95)=263.22ms p(99.9)=490.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119464
     http_req_receiving.............: avg=2.04ms   min=52.45µs med=119.33µs max=441.16ms p(90)=1.77ms   p(95)=5.51ms   p(99.9)=134.6ms 
     http_req_sending...............: avg=64.76µs  min=5.45µs  med=10.94µs  max=49.67ms  p(90)=20.77µs  p(95)=128.06µs p(99.9)=8.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.06ms min=1.69ms  med=110.3ms  max=606.75ms p(90)=226.84ms p(95)=256.65ms p(99.9)=441.33ms
     http_reqs......................: 119464  1917.636019/s
     iteration_duration.............: avg=120.46ms min=2.92ms  med=113.15ms max=716.53ms p(90)=231.36ms p(95)=264.01ms p(99.9)=490.57ms
     iterations.....................: 118464  1901.58402/s
     success_rate...................: 100.00% ✓ 118464      ✗ 0     
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

     checks.........................: 100.00% ✓ 203565      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=8.7µs    min=1.08µs  med=2.67µs   max=84.9ms   p(90)=4.38µs   p(95)=5.35µs   p(99.9)=837.87µs
     http_req_connecting............: avg=5.17µs   min=0s      med=0s       max=84.85ms  p(90)=0s       p(95)=0s       p(99.9)=730.49µs
     http_req_duration..............: avg=207.29ms min=2.15ms  med=207.28ms max=586.09ms p(90)=385.06ms p(95)=414.85ms p(99.9)=506.5ms 
       { expected_response:true }...: avg=207.29ms min=2.15ms  med=207.28ms max=586.09ms p(90)=385.06ms p(95)=414.85ms p(99.9)=506.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 68855
     http_req_receiving.............: avg=90.62µs  min=29.59µs med=69.46µs  max=219.28ms p(90)=107.79µs p(95)=124.67µs p(99.9)=1.91ms  
     http_req_sending...............: avg=35.67µs  min=5.42µs  med=11.9µs   max=132.37ms p(90)=19.21µs  p(95)=23.42µs  p(99.9)=4.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.17ms min=2.06ms  med=207.15ms max=586.04ms p(90)=384.94ms p(95)=414.75ms p(99.9)=506.41ms
     http_reqs......................: 68855   1098.866848/s
     iteration_duration.............: avg=210.6ms  min=5.77ms  med=210.79ms max=586.29ms p(90)=385.95ms p(95)=415.67ms p(99.9)=507.12ms
     iterations.....................: 67855   1082.907704/s
     success_rate...................: 100.00% ✓ 67855       ✗ 0    
     vus............................: 89      min=0         max=497
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

     checks.........................: 100.00% ✓ 88503      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 37 MB   560 kB/s
     http_req_blocked...............: avg=10.2µs   min=1.14µs med=3.13µs   max=7.54ms   p(90)=4.84µs   p(95)=5.84µs   p(99.9)=1.82ms 
     http_req_connecting............: avg=6.02µs   min=0s     med=0s       max=7.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.74ms 
     http_req_duration..............: avg=471.02ms min=4.25ms med=438.94ms max=2s       p(90)=924.09ms p(95)=1s       p(99.9)=1.52s  
       { expected_response:true }...: avg=471.02ms min=4.25ms med=438.94ms max=2s       p(90)=924.09ms p(95)=1s       p(99.9)=1.52s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 30501
     http_req_receiving.............: avg=155.58µs min=32.3µs med=82.31µs  max=153.92ms p(90)=118.69µs p(95)=132.14µs p(99.9)=20.33ms
     http_req_sending...............: avg=32.14µs  min=5.81µs med=14.16µs  max=267.38ms p(90)=21.22µs  p(95)=24.43µs  p(99.9)=2.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=470.83ms min=4.17ms med=438.83ms max=2s       p(90)=923.97ms p(95)=1s       p(99.9)=1.52s  
     http_reqs......................: 30501   466.685354/s
     iteration_duration.............: avg=487.19ms min=8.81ms med=457.48ms max=2.01s    p(90)=928.79ms p(95)=1.01s    p(99.9)=1.52s  
     iterations.....................: 29501   451.384696/s
     success_rate...................: 100.00% ✓ 29501      ✗ 0    
     vus............................: 73      min=0        max=496
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

     checks.........................: 100.00% ✓ 43328      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   271 kB/s
     http_req_blocked...............: avg=13.52µs  min=1.33µs  med=3.46µs   max=8.5ms    p(90)=5.3µs    p(95)=6.99µs   p(99.9)=1.61ms 
     http_req_connecting............: avg=7.94µs   min=0s      med=0s       max=8.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms 
     http_req_duration..............: avg=945.16ms min=6.49ms  med=849.84ms max=5.49s    p(90)=1.88s    p(95)=2.07s    p(99.9)=5s     
       { expected_response:true }...: avg=945.16ms min=6.49ms  med=849.84ms max=5.49s    p(90)=1.88s    p(95)=2.07s    p(99.9)=5s     
     http_req_failed................: 0.00%   ✓ 0          ✗ 15443
     http_req_receiving.............: avg=276.74µs min=36.1µs  med=98.19µs  max=174.09ms p(90)=138.34µs p(95)=151.15µs p(99.9)=74.73ms
     http_req_sending...............: avg=28.56µs  min=5.92µs  med=17.77µs  max=8.34ms   p(90)=23.83µs  p(95)=29.14µs  p(99.9)=2.98ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=944.85ms min=6.36ms  med=849.78ms max=5.49s    p(90)=1.88s    p(95)=2.07s    p(99.9)=5s     
     http_reqs......................: 15443   225.424388/s
     iteration_duration.............: avg=1.01s    min=15.59ms med=940.19ms max=5.5s     p(90)=1.92s    p(95)=2.08s    p(99.9)=5.02s  
     iterations.....................: 14442   210.812602/s
     success_rate...................: 100.00% ✓ 14442      ✗ 0    
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

     checks.........................: 100.00% ✓ 39594      ✗ 0    
     data_received..................: 1.2 GB  18 MB/s
     data_sent......................: 17 MB   243 kB/s
     http_req_blocked...............: avg=13.46µs  min=1.17µs  med=3.41µs   max=3.42ms   p(90)=5.18µs  p(95)=6.87µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=8.03µs   min=0s      med=0s       max=3.26ms   p(90)=0s      p(95)=0s       p(99.9)=1.39ms  
     http_req_duration..............: avg=1.02s    min=8.73ms  med=946.18ms max=4.23s    p(90)=2.07s   p(95)=2.18s    p(99.9)=3.88s   
       { expected_response:true }...: avg=1.02s    min=8.73ms  med=946.18ms max=4.23s    p(90)=2.07s   p(95)=2.18s    p(99.9)=3.88s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14198
     http_req_receiving.............: avg=120.58µs min=41.21µs med=96.18µs  max=104.04ms p(90)=137.5µs p(95)=150.07µs p(99.9)=969.76µs
     http_req_sending...............: avg=35.67µs  min=5.85µs  med=17.62µs  max=59.59ms  p(90)=23.31µs p(95)=28.35µs  p(99.9)=3.12ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.02s    min=8.6ms   med=946.08ms max=4.23s    p(90)=2.07s   p(95)=2.18s    p(99.9)=3.88s   
     http_reqs......................: 14198   202.302541/s
     iteration_duration.............: avg=1.1s     min=82.38ms med=1.03s    max=4.24s    p(90)=2.1s    p(95)=2.19s    p(99.9)=3.9s    
     iterations.....................: 13198   188.053876/s
     success_rate...................: 100.00% ✓ 13198      ✗ 0    
     vus............................: 63      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

