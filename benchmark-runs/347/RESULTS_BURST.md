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
| hive-router | v0.0.84 | 2,748 | 2,883 | 2,669 | 2.7% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,569 | 2,670 | 2,556 | 1.5% |  |
| fusion-nightly | 16.7.0-p.6 | 2,515 | 2,624 | 2,505 | 1.6% |  |
| fusion | 16.6.6 | 2,509 | 2,606 | 2,492 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,269 | 2,364 | 2,253 | 1.8% |  |
| cosmo | 0.334.0 | 1,193 | 1,232 | 1,185 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 565 | 575 | 561 | 0.8% |  |
| hive-gateway | 2.10.8 | 250 | 256 | 248 | 1.0% |  |
| apollo-gateway | 2.14.3 | 233 | 240 | 230 | 1.2% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (4287 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (494067 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.84 | 2,380 | 2,518 | 2,349 | 2.3% |  |
| fusion-nightly | 16.7.0-p.6 | 2,368 | 2,448 | 2,356 | 1.2% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 2,359 | 2,452 | 2,343 | 1.6% |  |
| fusion | 16.6.6 | 2,326 | 2,424 | 2,308 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 2,234 | 2,294 | 2,223 | 1.0% |  |
| cosmo | 0.334.0 | 1,165 | 1,201 | 1,155 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 526 | 541 | 519 | 1.6% |  |
| hive-gateway | 2.10.8 | 238 | 243 | 235 | 1.1% |  |
| apollo-gateway | 2.14.3 | 231 | 236 | 231 | 0.7% |  |
| apollo-router | v2.16.1 | — | — | — | — | non-compatible response (27143 across 9/9 runs) |
| feddi | — | — | — | — | — | not run |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (405034 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 505299      ✗ 0     
     data_received..................: 15 GB   241 MB/s
     data_sent......................: 204 MB  3.3 MB/s
     http_req_blocked...............: avg=12.38µs  min=872ns   med=2.11µs  max=45.38ms  p(90)=3.53µs   p(95)=4.54µs   p(99.9)=769.92µs
     http_req_connecting............: avg=9.68µs   min=0s      med=0s      max=45.22ms  p(90)=0s       p(95)=0s       p(99.9)=704.9µs 
     http_req_duration..............: avg=83.93ms  min=1.38ms  med=78.39ms max=313.62ms p(90)=163.3ms  p(95)=174.62ms p(99.9)=207.86ms
       { expected_response:true }...: avg=83.93ms  min=1.38ms  med=78.39ms max=313.62ms p(90)=163.3ms  p(95)=174.62ms p(99.9)=207.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 169433
     http_req_receiving.............: avg=111.78µs min=25.58µs med=49.93µs max=36.82ms  p(90)=120.05µs p(95)=306.61µs p(99.9)=9.62ms  
     http_req_sending...............: avg=58.12µs  min=4.51µs  med=9.05µs  max=181.24ms p(90)=16.34µs  p(95)=105.47µs p(99.9)=7.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.76ms  min=1.31ms  med=78.22ms max=313.08ms p(90)=163.12ms p(95)=174.42ms p(99.9)=207.4ms 
     http_reqs......................: 169433  2748.196918/s
     iteration_duration.............: avg=84.65ms  min=1.99ms  med=79.27ms max=339.79ms p(90)=163.69ms p(95)=174.98ms p(99.9)=208.72ms
     iterations.....................: 168433  2731.976955/s
     success_rate...................: 100.00% ✓ 168433      ✗ 0     
     vus............................: 84      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 476328      ✗ 0     
     data_received..................: 14 GB   225 MB/s
     data_sent......................: 192 MB  3.1 MB/s
     http_req_blocked...............: avg=17.12µs min=901ns   med=2.17µs  max=61.56ms  p(90)=3.7µs    p(95)=4.85µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=14.05µs min=0s      med=0s      max=49.97ms  p(90)=0s       p(95)=0s       p(99.9)=1.1ms   
     http_req_duration..............: avg=88.98ms min=1.89ms  med=84.28ms max=350.8ms  p(90)=169.82ms p(95)=186.07ms p(99.9)=247.53ms
       { expected_response:true }...: avg=88.98ms min=1.89ms  med=84.28ms max=350.8ms  p(90)=169.82ms p(95)=186.07ms p(99.9)=247.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159776
     http_req_receiving.............: avg=1.43ms  min=53.33µs med=198.3µs max=95.45ms  p(90)=3.44ms   p(95)=5.22ms   p(99.9)=34.26ms 
     http_req_sending...............: avg=66.48µs min=4.35µs  med=9.05µs  max=138.44ms p(90)=19.55µs  p(95)=106.78µs p(99.9)=8.68ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.48ms min=1.79ms  med=82.82ms max=350.66ms p(90)=167.97ms p(95)=184.29ms p(99.9)=245.24ms
     http_reqs......................: 159776  2569.874324/s
     iteration_duration.............: avg=89.79ms min=4.17ms  med=85.2ms  max=351.01ms p(90)=170.25ms p(95)=186.55ms p(99.9)=248.72ms
     iterations.....................: 158776  2553.790091/s
     success_rate...................: 100.00% ✓ 158776      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 467439      ✗ 0     
     data_received..................: 14 GB   221 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=16.13µs min=882ns   med=2.13µs  max=60.76ms  p(90)=3.68µs   p(95)=4.76µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=13.23µs min=0s      med=0s      max=60.61ms  p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=90.69ms min=1.94ms  med=78.92ms max=1.34s    p(90)=173.37ms p(95)=202.64ms p(99.9)=632.45ms
       { expected_response:true }...: avg=90.69ms min=1.94ms  med=78.92ms max=1.34s    p(90)=173.37ms p(95)=202.64ms p(99.9)=632.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156813
     http_req_receiving.............: avg=1.63ms  min=51.74µs med=96.4µs  max=689.49ms p(90)=1.6ms    p(95)=4.6ms    p(99.9)=115.35ms
     http_req_sending...............: avg=65.15µs min=4.5µs   med=8.71µs  max=136.04ms p(90)=17.23µs  p(95)=101.67µs p(99.9)=9.5ms   
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.99ms min=1.85ms  med=77.9ms  max=1.34s    p(90)=170.59ms p(95)=197.39ms p(99.9)=626.67ms
     http_reqs......................: 156813  2515.67153/s
     iteration_duration.............: avg=91.54ms min=3.21ms  med=79.81ms max=1.34s    p(90)=174.03ms p(95)=203.35ms p(99.9)=633.1ms 
     iterations.....................: 155813  2499.629036/s
     success_rate...................: 100.00% ✓ 155813      ✗ 0     
     vus............................: 71      min=0         max=494 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 467013      ✗ 0     
     data_received..................: 14 GB   220 MB/s
     data_sent......................: 188 MB  3.0 MB/s
     http_req_blocked...............: avg=23.04µs min=1.02µs  med=2.52µs   max=112ms    p(90)=4.01µs   p(95)=5.06µs   p(99.9)=2.33ms  
     http_req_connecting............: avg=19.87µs min=0s      med=0s       max=111.68ms p(90)=0s       p(95)=0s       p(99.9)=2.29ms  
     http_req_duration..............: avg=90.73ms min=2ms     med=77.22ms  max=1s       p(90)=175.05ms p(95)=201.4ms  p(99.9)=614.26ms
       { expected_response:true }...: avg=90.73ms min=2ms     med=77.22ms  max=1s       p(90)=175.05ms p(95)=201.4ms  p(99.9)=614.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156671
     http_req_receiving.............: avg=1.27ms  min=53.92µs med=100.08µs max=761.55ms p(90)=1.57ms   p(95)=4.16ms   p(99.9)=82.12ms 
     http_req_sending...............: avg=71.91µs min=4.85µs  med=9.41µs   max=181.6ms  p(90)=17.12µs  p(95)=112.93µs p(99.9)=9.78ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.38ms min=1.89ms  med=75.98ms  max=1s       p(90)=173.3ms  p(95)=198.98ms p(99.9)=594.94ms
     http_reqs......................: 156671  2509.341482/s
     iteration_duration.............: avg=91.61ms min=3.24ms  med=78.23ms  max=1s       p(90)=175.6ms  p(95)=202.11ms p(99.9)=615ms   
     iterations.....................: 155671  2493.324851/s
     success_rate...................: 100.00% ✓ 155671      ✗ 0     
     vus............................: 77      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 419442      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=11.91µs  min=901ns   med=2.11µs   max=66.23ms  p(90)=3.5µs    p(95)=4.51µs   p(99.9)=1.35ms  
     http_req_connecting............: avg=9.2µs    min=0s      med=0s       max=66.04ms  p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=101.12ms min=1.62ms  med=84.88ms  max=1.65s    p(90)=192.21ms p(95)=227.01ms p(99.9)=848.79ms
       { expected_response:true }...: avg=101.12ms min=1.62ms  med=84.88ms  max=1.65s    p(90)=192.21ms p(95)=227.01ms p(99.9)=848.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 140814
     http_req_receiving.............: avg=1.81ms   min=49.13µs med=104.64µs max=795.77ms p(90)=1.99ms   p(95)=5.06ms   p(99.9)=86.7ms  
     http_req_sending...............: avg=58.66µs  min=4.45µs  med=8.92µs   max=273.54ms p(90)=16.52µs  p(95)=94.17µs  p(99.9)=7.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.25ms  min=1.55ms  med=83.7ms   max=1.61s    p(90)=189.91ms p(95)=223.09ms p(99.9)=794.25ms
     http_reqs......................: 140814  2269.599175/s
     iteration_duration.............: avg=102.08ms min=2.96ms  med=86.04ms  max=1.65s    p(90)=192.81ms p(95)=227.76ms p(99.9)=849.32ms
     iterations.....................: 139814  2253.481466/s
     success_rate...................: 100.00% ✓ 139814      ✗ 0     
     vus............................: 60      min=0         max=498 
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

     checks.........................: 100.00% ✓ 220635      ✗ 0    
     data_received..................: 6.5 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=4.77µs   min=952ns   med=1.97µs   max=6.83ms   p(90)=3.43µs   p(95)=4.29µs   p(99.9)=384.52µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=6.67ms   p(90)=0s       p(95)=0s       p(99.9)=305.51µs
     http_req_duration..............: avg=191.42ms min=1.84ms  med=192.04ms max=610.61ms p(90)=354.84ms p(95)=380.19ms p(99.9)=509.84ms
       { expected_response:true }...: avg=191.42ms min=1.84ms  med=192.04ms max=610.61ms p(90)=354.84ms p(95)=380.19ms p(99.9)=509.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 74545
     http_req_receiving.............: avg=76.12µs  min=28.33µs med=58.46µs  max=184.9ms  p(90)=94.1µs   p(95)=108.95µs p(99.9)=975.07µs
     http_req_sending...............: avg=26.4µs   min=4.83µs  med=9.56µs   max=171.4ms  p(90)=15.42µs  p(95)=19.27µs  p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.31ms min=1.79ms  med=191.92ms max=610.55ms p(90)=354.75ms p(95)=380.12ms p(99.9)=509.76ms
     http_reqs......................: 74545   1193.166914/s
     iteration_duration.............: avg=194.24ms min=5.45ms  med=195.35ms max=610.75ms p(90)=355.68ms p(95)=380.93ms p(99.9)=510.41ms
     iterations.....................: 73545   1177.160918/s
     success_rate...................: 100.00% ✓ 73545       ✗ 0    
     vus............................: 80      min=0         max=493
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

     checks.........................: 100.00% ✓ 106035     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   679 kB/s
     http_req_blocked...............: avg=8.08µs   min=1.11µs  med=2.93µs   max=3.51ms   p(90)=4.59µs   p(95)=5.62µs   p(99.9)=1.53ms
     http_req_connecting............: avg=4.2µs    min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.51ms
     http_req_duration..............: avg=394.42ms min=3.59ms  med=371.51ms max=1.56s    p(90)=768.69ms p(95)=837.14ms p(99.9)=1.27s 
       { expected_response:true }...: avg=394.42ms min=3.59ms  med=371.51ms max=1.56s    p(90)=768.69ms p(95)=837.14ms p(99.9)=1.27s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 36345
     http_req_receiving.............: avg=83.72µs  min=30.19µs med=69.12µs  max=136.04ms p(90)=107.04µs p(95)=122.26µs p(99.9)=1ms   
     http_req_sending...............: avg=29.95µs  min=5.47µs  med=13.39µs  max=88.98ms  p(90)=20.56µs  p(95)=23.7µs   p(99.9)=2.2ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=394.31ms min=3.51ms  med=371.42ms max=1.56s    p(90)=768.61ms p(95)=837ms    p(99.9)=1.27s 
     http_reqs......................: 36345   565.358157/s
     iteration_duration.............: avg=405.81ms min=28.1ms  med=385.28ms max=1.56s    p(90)=771.82ms p(95)=840.28ms p(99.9)=1.28s 
     iterations.....................: 35345   549.802835/s
     success_rate...................: 100.00% ✓ 35345      ✗ 0    
     vus............................: 70      min=0        max=495
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

     checks.........................: 100.00% ✓ 47709      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=12.32µs  min=1.15µs  med=3.13µs   max=3.35ms p(90)=4.77µs   p(95)=6.25µs   p(99.9)=2.28ms  
     http_req_connecting............: avg=7.68µs   min=0s      med=0s       max=3.32ms p(90)=0s       p(95)=0s       p(99.9)=2.26ms  
     http_req_duration..............: avg=851.39ms min=5.72ms  med=745.7ms  max=16.32s p(90)=1.5s     p(95)=1.67s    p(99.9)=15.13s  
       { expected_response:true }...: avg=851.39ms min=5.72ms  med=745.7ms  max=16.32s p(90)=1.5s     p(95)=1.67s    p(99.9)=15.13s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16903
     http_req_receiving.............: avg=90.64µs  min=32.19µs med=83.85µs  max=7.3ms  p(90)=120.05µs p(95)=135.02µs p(99.9)=971.92µs
     http_req_sending...............: avg=23.64µs  min=5.78µs  med=16.31µs  max=7.94ms p(90)=21.93µs  p(95)=25.69µs  p(99.9)=1.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=851.27ms min=5.64ms  med=745.59ms max=16.32s p(90)=1.5s     p(95)=1.67s    p(99.9)=15.13s  
     http_reqs......................: 16903   250.658191/s
     iteration_duration.............: avg=904.9ms  min=25.72ms med=802.15ms max=16.32s p(90)=1.52s    p(95)=1.68s    p(99.9)=15.2s   
     iterations.....................: 15903   235.828978/s
     success_rate...................: 100.00% ✓ 15903      ✗ 0    
     vus............................: 68      min=0        max=498
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

     checks.........................: 100.00% ✓ 48135      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   286 kB/s
     http_req_blocked...............: avg=14.36µs  min=1.36µs  med=3.43µs   max=6.12ms p(90)=5.11µs   p(95)=6.46µs   p(99.9)=2.39ms  
     http_req_connecting............: avg=9.3µs    min=0s      med=0s       max=5.93ms p(90)=0s       p(95)=0s       p(99.9)=2.36ms  
     http_req_duration..............: avg=344.97ms min=7.55ms  med=399.86ms max=1s     p(90)=580.96ms p(95)=629.85ms p(99.9)=874.04ms
       { expected_response:true }...: avg=344.97ms min=7.55ms  med=399.86ms max=1s     p(90)=580.96ms p(95)=629.85ms p(99.9)=874.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17045
     http_req_receiving.............: avg=96.6µs   min=33.67µs med=83.68µs  max=71.2ms p(90)=122.68µs p(95)=138.46µs p(99.9)=1ms     
     http_req_sending...............: avg=32.54µs  min=6.05µs  med=16.33µs  max=58.5ms p(90)=21.73µs  p(95)=26.2µs   p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=344.84ms min=7.47ms  med=399.74ms max=1s     p(90)=580.85ms p(95)=629.75ms p(99.9)=873.92ms
     http_reqs......................: 17045   233.040204/s
     iteration_duration.............: avg=366.45ms min=8.45ms  med=413.8ms  max=1.01s  p(90)=587.25ms p(95)=633.72ms p(99.9)=886.95ms
     iterations.....................: 16045   219.368148/s
     success_rate...................: 100.00% ✓ 16045      ✗ 0    
     vus............................: 56      min=0        max=496
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 439929      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=23.77µs  min=1.07µs  med=3.16µs  max=62.58ms  p(90)=5.23µs   p(95)=6.56µs   p(99.9)=2.35ms  
     http_req_connecting............: avg=19.74µs  min=0s      med=0s      max=62.4ms   p(90)=0s       p(95)=0s       p(99.9)=2.27ms  
     http_req_duration..............: avg=96.3ms   min=1.57ms  med=90.95ms max=320.9ms  p(90)=185.96ms p(95)=202.76ms p(99.9)=260.39ms
       { expected_response:true }...: avg=96.3ms   min=1.57ms  med=90.95ms max=320.9ms  p(90)=185.96ms p(95)=202.76ms p(99.9)=260.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147643
     http_req_receiving.............: avg=159.35µs min=25.75µs med=60.13µs max=57.26ms  p(90)=162.27µs p(95)=393.09µs p(99.9)=16.17ms 
     http_req_sending...............: avg=81.14µs  min=5.2µs   med=12.18µs max=242.21ms p(90)=23.96µs  p(95)=141.21µs p(99.9)=10.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.06ms  min=1.5ms   med=90.73ms max=320.54ms p(90)=185.53ms p(95)=202.29ms p(99.9)=259.35ms
     http_reqs......................: 147643  2380.763237/s
     iteration_duration.............: avg=97.24ms  min=4.62ms  med=92.03ms max=350.19ms p(90)=186.49ms p(95)=203.27ms p(99.9)=261.36ms
     iterations.....................: 146643  2364.638103/s
     success_rate...................: 100.00% ✓ 146643      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 436800      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 176 MB  2.8 MB/s
     http_req_blocked...............: avg=19.05µs min=972ns   med=2.81µs   max=74.88ms  p(90)=4.53µs   p(95)=5.72µs   p(99.9)=2.08ms  
     http_req_connecting............: avg=15.54µs min=0s      med=0s       max=74.79ms  p(90)=0s       p(95)=0s       p(99.9)=1.98ms  
     http_req_duration..............: avg=97.01ms min=1.46ms  med=84.76ms  max=1.63s    p(90)=186.28ms p(95)=217.48ms p(99.9)=699.33ms
       { expected_response:true }...: avg=97.01ms min=1.46ms  med=84.76ms  max=1.63s    p(90)=186.28ms p(95)=217.48ms p(99.9)=699.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146600
     http_req_receiving.............: avg=1.58ms  min=53.52µs med=108.99µs max=583.14ms p(90)=1.9ms    p(95)=5.07ms   p(99.9)=136.46ms
     http_req_sending...............: avg=73.24µs min=4.69µs  med=10.59µs  max=217.74ms p(90)=20.37µs  p(95)=121.05µs p(99.9)=10.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.36ms min=1.38ms  med=83.37ms  max=1.62s    p(90)=183.9ms  p(95)=213.99ms p(99.9)=661ms   
     http_reqs......................: 146600  2368.6722/s
     iteration_duration.............: avg=97.98ms min=2.89ms  med=85.86ms  max=1.63s    p(90)=186.96ms p(95)=218.35ms p(99.9)=699.84ms
     iterations.....................: 145600  2352.514818/s
     success_rate...................: 100.00% ✓ 145600      ✗ 0     
     vus............................: 52      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 434277      ✗ 0     
     data_received..................: 13 GB   207 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=21.46µs min=1.09µs med=2.92µs  max=76.57ms  p(90)=4.73µs   p(95)=5.98µs   p(99.9)=1.92ms  
     http_req_connecting............: avg=17.17µs min=0s     med=0s      max=76.49ms  p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=97.55ms min=1.5ms  med=92.56ms max=464.35ms p(90)=187.08ms p(95)=206.98ms p(99.9)=294.68ms
       { expected_response:true }...: avg=97.55ms min=1.5ms  med=92.56ms max=464.35ms p(90)=187.08ms p(95)=206.98ms p(99.9)=294.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145759
     http_req_receiving.............: avg=1.4ms   min=52.7µs med=141.3µs max=154.04ms p(90)=3.26ms   p(95)=5.27ms   p(99.9)=42.81ms 
     http_req_sending...............: avg=77.2µs  min=5.22µs med=10.83µs max=295.14ms p(90)=22.41µs  p(95)=128.94µs p(99.9)=10.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.07ms min=1.38ms med=91.01ms max=464.23ms p(90)=185.46ms p(95)=205.36ms p(99.9)=292.87ms
     http_reqs......................: 145759  2359.40019/s
     iteration_duration.............: avg=98.5ms  min=4.69ms med=93.57ms max=464.57ms p(90)=187.64ms p(95)=207.52ms p(99.9)=296.28ms
     iterations.....................: 144759  2343.213195/s
     success_rate...................: 100.00% ✓ 144759      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429483      ✗ 0     
     data_received..................: 13 GB   204 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=23.23µs min=1.08µs  med=2.91µs   max=110.18ms p(90)=4.63µs   p(95)=5.83µs   p(99.9)=2.18ms  
     http_req_connecting............: avg=19.46µs min=0s      med=0s       max=110.12ms p(90)=0s       p(95)=0s       p(99.9)=2.13ms  
     http_req_duration..............: avg=98.67ms min=1.54ms  med=86.7ms   max=1.43s    p(90)=185.06ms p(95)=216.45ms p(99.9)=751.76ms
       { expected_response:true }...: avg=98.67ms min=1.54ms  med=86.7ms   max=1.43s    p(90)=185.06ms p(95)=216.45ms p(99.9)=751.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144161
     http_req_receiving.............: avg=1.87ms  min=53.36µs med=111.65µs max=831.82ms p(90)=1.89ms   p(95)=5.19ms   p(99.9)=139.18ms
     http_req_sending...............: avg=73.54µs min=5.13µs  med=10.73µs  max=192.1ms  p(90)=20.49µs  p(95)=119.94µs p(99.9)=9.95ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.73ms min=1.46ms  med=85.26ms  max=1.43s    p(90)=182.61ms p(95)=212.68ms p(99.9)=720.46ms
     http_reqs......................: 144161  2326.195845/s
     iteration_duration.............: avg=99.65ms min=2.87ms  med=87.84ms  max=1.43s    p(90)=185.64ms p(95)=217.39ms p(99.9)=752.06ms
     iterations.....................: 143161  2310.059748/s
     success_rate...................: 100.00% ✓ 143161      ✗ 0     
     vus............................: 55      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413853      ✗ 0     
     data_received..................: 12 GB   196 MB/s
     data_sent......................: 167 MB  2.7 MB/s
     http_req_blocked...............: avg=18.97µs  min=861ns  med=2.41µs   max=82.87ms  p(90)=4.26µs   p(95)=5.49µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=15.73µs  min=0s     med=0s       max=82.81ms  p(90)=0s       p(95)=0s       p(99.9)=1.02ms  
     http_req_duration..............: avg=102.5ms  min=1.79ms med=86.86ms  max=2.08s    p(90)=189.95ms p(95)=226.35ms p(99.9)=970.06ms
       { expected_response:true }...: avg=102.5ms  min=1.79ms med=86.86ms  max=2.08s    p(90)=189.95ms p(95)=226.35ms p(99.9)=970.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138951
     http_req_receiving.............: avg=1.95ms   min=52.3µs med=107.69µs max=1.38s    p(90)=1.87ms   p(95)=5.13ms   p(99.9)=164.47ms
     http_req_sending...............: avg=68µs     min=4.95µs med=10.14µs  max=140.58ms p(90)=21.24µs  p(95)=109.13µs p(99.9)=8.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.48ms min=1.7ms  med=85.69ms  max=2.08s    p(90)=187.76ms p(95)=222.78ms p(99.9)=925.66ms
     http_reqs......................: 138951  2234.577612/s
     iteration_duration.............: avg=103.51ms min=3.21ms med=87.84ms  max=2.08s    p(90)=190.58ms p(95)=227.52ms p(99.9)=972.12ms
     iterations.....................: 137951  2218.495845/s
     success_rate...................: 100.00% ✓ 137951      ✗ 0     
     vus............................: 66      min=0         max=496 
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

     checks.........................: 100.00% ✓ 215877      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=9.11µs   min=1.1µs   med=3.16µs   max=45.82ms  p(90)=5.02µs   p(95)=6.07µs   p(99.9)=601.69µs
     http_req_connecting............: avg=5.1µs    min=0s      med=0s       max=45.77ms  p(90)=0s       p(95)=0s       p(99.9)=540.67µs
     http_req_duration..............: avg=195.56ms min=2.09ms  med=195.78ms max=517.99ms p(90)=362.01ms p(95)=387.35ms p(99.9)=457.53ms
       { expected_response:true }...: avg=195.56ms min=2.09ms  med=195.78ms max=517.99ms p(90)=362.01ms p(95)=387.35ms p(99.9)=457.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72959
     http_req_receiving.............: avg=85.83µs  min=27.13µs med=66.68µs  max=175.07ms p(90)=108.68µs p(95)=123.65µs p(99.9)=1.6ms   
     http_req_sending...............: avg=33.21µs  min=4.95µs  med=12.94µs  max=205.03ms p(90)=20.85µs  p(95)=24.55µs  p(99.9)=3.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.44ms min=2.01ms  med=195.6ms  max=517.39ms p(90)=361.88ms p(95)=387.23ms p(99.9)=457.45ms
     http_reqs......................: 72959   1165.246602/s
     iteration_duration.............: avg=198.53ms min=3.99ms  med=199.22ms max=518.26ms p(90)=362.87ms p(95)=388.06ms p(99.9)=457.94ms
     iterations.....................: 71959   1149.27535/s
     success_rate...................: 100.00% ✓ 71959       ✗ 0    
     vus............................: 86      min=0         max=495
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

     checks.........................: 100.00% ✓ 99327      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   632 kB/s
     http_req_blocked...............: avg=7.09µs   min=971ns   med=2.81µs   max=6.43ms   p(90)=4.58µs   p(95)=5.58µs   p(99.9)=845.94µs
     http_req_connecting............: avg=3.35µs   min=0s      med=0s       max=6.37ms   p(90)=0s       p(95)=0s       p(99.9)=796.66µs
     http_req_duration..............: avg=420.9ms  min=3.86ms  med=385.26ms max=1.7s     p(90)=837.46ms p(95)=910.29ms p(99.9)=1.4s    
       { expected_response:true }...: avg=420.9ms  min=3.86ms  med=385.26ms max=1.7s     p(90)=837.46ms p(95)=910.29ms p(99.9)=1.4s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 34109
     http_req_receiving.............: avg=95.64µs  min=29.91µs med=74.13µs  max=153.15ms p(90)=113.17µs p(95)=128.15µs p(99.9)=1.13ms  
     http_req_sending...............: avg=33.83µs  min=5.01µs  med=13.58µs  max=145.68ms p(90)=21.01µs  p(95)=23.93µs  p(99.9)=2.08ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=420.77ms min=3.77ms  med=385.16ms max=1.7s     p(90)=837.34ms p(95)=910.19ms p(99.9)=1.4s    
     http_reqs......................: 34109   526.238906/s
     iteration_duration.............: avg=433.82ms min=20.27ms med=400.19ms max=1.7s     p(90)=841.29ms p(95)=914.27ms p(99.9)=1.4s    
     iterations.....................: 33109   510.810752/s
     success_rate...................: 100.00% ✓ 33109      ✗ 0    
     vus............................: 97      min=0        max=500
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

     checks.........................: 100.00% ✓ 45420      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   286 kB/s
     http_req_blocked...............: avg=24.44µs  min=1.15µs  med=3.86µs   max=9.1ms   p(90)=5.67µs   p(95)=7.36µs   p(99.9)=6.4ms   
     http_req_connecting............: avg=18.56µs  min=0s      med=0s       max=8.91ms  p(90)=0s       p(95)=0s       p(99.9)=6.29ms  
     http_req_duration..............: avg=903.3ms  min=5.94ms  med=813.08ms max=4.88s   p(90)=1.8s     p(95)=2.05s    p(99.9)=4.28s   
       { expected_response:true }...: avg=903.3ms  min=5.94ms  med=813.08ms max=4.88s   p(90)=1.8s     p(95)=2.05s    p(99.9)=4.28s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 16140
     http_req_receiving.............: avg=110.51µs min=32.86µs med=94.87µs  max=69.44ms p(90)=134.85µs p(95)=151.21µs p(99.9)=724.33µs
     http_req_sending...............: avg=35.95µs  min=6.01µs  med=18.4µs   max=86.83ms p(90)=24µs     p(95)=28.57µs  p(99.9)=2.45ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=903.15ms min=5.8ms   med=812.96ms max=4.88s   p(90)=1.8s     p(95)=2.05s    p(99.9)=4.28s   
     http_reqs......................: 16140   238.255434/s
     iteration_duration.............: avg=963.01ms min=39.49ms med=885.69ms max=4.89s   p(90)=1.82s    p(95)=2.07s    p(99.9)=4.3s    
     iterations.....................: 15140   223.493635/s
     success_rate...................: 100.00% ✓ 15140      ✗ 0    
     vus............................: 92      min=0        max=500
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

     checks.........................: 100.00% ✓ 44934      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   278 kB/s
     http_req_blocked...............: avg=29.03µs  min=1.44µs  med=3.69µs   max=10.36ms p(90)=5.56µs  p(95)=7.16µs  p(99.9)=7.9ms   
     http_req_connecting............: avg=22.58µs  min=0s      med=0s       max=10.32ms p(90)=0s      p(95)=0s      p(99.9)=7.88ms  
     http_req_duration..............: avg=909.7ms  min=7.88ms  med=829.55ms max=3.17s   p(90)=1.85s   p(95)=1.98s   p(99.9)=2.87s   
       { expected_response:true }...: avg=909.7ms  min=7.88ms  med=829.55ms max=3.17s   p(90)=1.85s   p(95)=1.98s   p(99.9)=2.87s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15978
     http_req_receiving.............: avg=108.29µs min=37.44µs med=90.44µs  max=96.83ms p(90)=129.3µs p(95)=145.1µs p(99.9)=958.09µs
     http_req_sending...............: avg=33.43µs  min=5.96µs  med=17.41µs  max=32.76ms p(90)=23.57µs p(95)=28.48µs p(99.9)=2.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=909.55ms min=7.74ms  med=829.46ms max=3.17s   p(90)=1.85s   p(95)=1.98s   p(99.9)=2.87s   
     http_reqs......................: 15978   231.872169/s
     iteration_duration.............: avg=970.43ms min=26.59ms med=914.82ms max=3.18s   p(90)=1.88s   p(95)=1.99s   p(99.9)=2.87s   
     iterations.....................: 14978   217.360205/s
     success_rate...................: 100.00% ✓ 14978      ✗ 0    
     vus............................: 14      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

