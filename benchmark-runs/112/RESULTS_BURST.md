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
| hive-router | v0.0.42 | 2,661 | 2,807 | 2,626 | 2.4% |  |
| cosmo | 0.295.0 | 1,149 | 1,189 | 1,144 | 2.1% | non-compatible response (16 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 558 | 562 | 553 | 0.6% |  |
| hive-gateway | 2.5.11 | 255 | 258 | 253 | 0.7% |  |
| apollo-gateway | 2.13.3 | 220 | 224 | 218 | 1.0% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (41779 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (505135 across 9/9 runs) |
| hotchocolate | 16.0.0-rc.1.19 | — | — | — | — | non-compatible response (74 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.42 | 2,251 | 2,358 | 2,216 | 2.0% |  |
| cosmo | 0.295.0 | 1,099 | 1,099 | 1,099 | 0.0% | non-compatible response (15 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 535 | 544 | 531 | 0.9% |  |
| hive-gateway | 2.5.11 | 245 | 248 | 241 | 0.9% |  |
| apollo-gateway | 2.13.3 | 205 | 209 | 203 | 0.9% |  |
| apollo-router | v2.12.0 | — | — | — | — | non-compatible response (34111 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (311953 across 9/9 runs) |
| hotchocolate | 16.0.0-rc.1.19 | — | — | — | — | non-compatible response (59 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 491214      ✗ 0     
     data_received..................: 14 GB   233 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=26.44µs  min=962ns   med=2.19µs  max=74.31ms  p(90)=3.56µs   p(95)=4.65µs   p(99.9)=5.62ms  
     http_req_connecting............: avg=23.59µs  min=0s      med=0s      max=74.1ms   p(90)=0s       p(95)=0s       p(99.9)=5.32ms  
     http_req_duration..............: avg=86.22ms  min=1.63ms  med=80.47ms max=333.46ms p(90)=166.32ms p(95)=181.7ms  p(99.9)=240.13ms
       { expected_response:true }...: avg=86.22ms  min=1.63ms  med=80.47ms max=333.46ms p(90)=166.32ms p(95)=181.7ms  p(99.9)=240.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 164738
     http_req_receiving.............: avg=276.15µs min=29.23µs med=56.27µs max=137.53ms p(90)=207.68µs p(95)=398.76µs p(99.9)=38.02ms 
     http_req_sending...............: avg=82.96µs  min=5.17µs  med=9.71µs  max=148.8ms  p(90)=18µs     p(95)=129.34µs p(99.9)=11.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.86ms  min=1.55ms  med=80.16ms max=333.34ms p(90)=165.86ms p(95)=181ms    p(99.9)=238.68ms
     http_reqs......................: 164738  2661.310765/s
     iteration_duration.............: avg=87.06ms  min=2.75ms  med=81.48ms max=400.02ms p(90)=166.84ms p(95)=182.35ms p(99.9)=241.64ms
     iterations.....................: 163738  2645.155957/s
     success_rate...................: 100.00% ✓ 163738      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 212715      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=7.13µs   min=1.11µs  med=2.58µs   max=27.54ms  p(90)=4.26µs   p(95)=5.24µs   p(99.9)=606.88µs
     http_req_connecting............: avg=3.84µs   min=0s      med=0s       max=27.48ms  p(90)=0s       p(95)=0s       p(99.9)=537.86µs
     http_req_duration..............: avg=198.44ms min=2.1ms   med=199.83ms max=604.42ms p(90)=366.11ms p(95)=393.41ms p(99.9)=512.86ms
       { expected_response:true }...: avg=198.44ms min=2.1ms   med=199.83ms max=604.42ms p(90)=366.11ms p(95)=393.41ms p(99.9)=512.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71905
     http_req_receiving.............: avg=83.65µs  min=29.54µs med=63.12µs  max=99.93ms  p(90)=100.77µs p(95)=117.49µs p(99.9)=1.98ms  
     http_req_sending...............: avg=32.63µs  min=5.67µs  med=11.11µs  max=78.45ms  p(90)=17.96µs  p(95)=22.09µs  p(99.9)=4.23ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.32ms min=2.04ms  med=199.69ms max=604.3ms  p(90)=366.01ms p(95)=393.33ms p(99.9)=512.79ms
     http_reqs......................: 71905   1149.610854/s
     iteration_duration.............: avg=201.49ms min=4.87ms  med=203.2ms  max=604.6ms  p(90)=367.05ms p(95)=394.09ms p(99.9)=513.91ms
     iterations.....................: 70905   1133.622941/s
     success_rate...................: 100.00% ✓ 70905       ✗ 0    
     vus............................: 84      min=0         max=496
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 104761     ✗ 0    
     data_received..................: 3.2 GB  49 MB/s
     data_sent......................: 43 MB   671 kB/s
     http_req_blocked...............: avg=8.5µs    min=1.19µs  med=2.82µs   max=6.87ms   p(90)=4.6µs    p(95)=5.59µs   p(99.9)=1.2ms   
     http_req_connecting............: avg=4.58µs   min=0s      med=0s       max=6.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.01ms  
     http_req_duration..............: avg=399.21ms min=3.66ms  med=370.79ms max=1.59s    p(90)=785.33ms p(95)=848.21ms p(99.9)=1.27s   
       { expected_response:true }...: avg=399.21ms min=3.66ms  med=370.79ms max=1.59s    p(90)=785.33ms p(95)=848.21ms p(99.9)=1.27s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 35921
     http_req_receiving.............: avg=87.66µs  min=33.55µs med=75.1µs   max=97.83ms  p(90)=111.38µs p(95)=124.41µs p(99.9)=979.34µs
     http_req_sending...............: avg=33.71µs  min=5.57µs  med=13.09µs  max=197.79ms p(90)=20.37µs  p(95)=23.76µs  p(99.9)=3.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=399.09ms min=3.6ms   med=370.68ms max=1.59s    p(90)=785.24ms p(95)=848.13ms p(99.9)=1.27s   
     http_reqs......................: 35921   558.049036/s
     iteration_duration.............: avg=410.88ms min=19.54ms med=385.27ms max=1.6s     p(90)=789.27ms p(95)=851.15ms p(99.9)=1.27s   
     iterations.....................: 34920   542.498047/s
     success_rate...................: 100.00% ✓ 34920      ✗ 0    
     vus............................: 77      min=0        max=497
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48591      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 21 MB   310 kB/s
     http_req_blocked...............: avg=11.47µs  min=1.38µs  med=3.73µs   max=4.88ms  p(90)=5.67µs   p(95)=7.19µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=6.06µs   min=0s      med=0s       max=4.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=793.85ms min=5.68ms  med=722.12ms max=18.12s  p(90)=1.45s    p(95)=1.64s    p(99.9)=12.61s  
       { expected_response:true }...: avg=793.85ms min=5.68ms  med=722.12ms max=18.12s  p(90)=1.45s    p(95)=1.64s    p(99.9)=12.61s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 17197
     http_req_receiving.............: avg=108.63µs min=41.27µs med=101.19µs max=27.29ms p(90)=140.85µs p(95)=154.33µs p(99.9)=835.35µs
     http_req_sending...............: avg=46.62µs  min=6.71µs  med=18.49µs  max=81.39ms p(90)=24.69µs  p(95)=29.23µs  p(99.9)=5.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=793.69ms min=5.58ms  med=722ms    max=18.12s  p(90)=1.45s    p(95)=1.64s    p(99.9)=12.61s  
     http_reqs......................: 17197   255.443342/s
     iteration_duration.............: avg=842.95ms min=44.73ms med=787.32ms max=18.12s  p(90)=1.46s    p(95)=1.65s    p(99.9)=13s     
     iterations.....................: 16197   240.589394/s
     success_rate...................: 100.00% ✓ 16197      ✗ 0    
     vus............................: 77      min=0        max=498
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

     checks.........................: 100.00% ✓ 42786      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 19 MB   270 kB/s
     http_req_blocked...............: avg=14.84µs  min=1.29µs  med=3.34µs   max=6.43ms  p(90)=5.04µs   p(95)=6.64µs   p(99.9)=2.66ms  
     http_req_connecting............: avg=9.55µs   min=0s      med=0s       max=4.14ms  p(90)=0s       p(95)=0s       p(99.9)=2.51ms  
     http_req_duration..............: avg=480.24ms min=8.36ms  med=507.43ms max=1.4s    p(90)=857.91ms p(95)=898.82ms p(99.9)=1.23s   
       { expected_response:true }...: avg=480.24ms min=8.36ms  med=507.43ms max=1.4s    p(90)=857.91ms p(95)=898.82ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15262
     http_req_receiving.............: avg=98.71µs  min=33.59µs med=91.44µs  max=7.41ms  p(90)=131.51µs p(95)=144.3µs  p(99.9)=860.77µs
     http_req_sending...............: avg=30.01µs  min=6.11µs  med=15.88µs  max=17.87ms p(90)=22.11µs  p(95)=26.89µs  p(99.9)=4.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=480.11ms min=8.27ms  med=507.35ms max=1.4s    p(90)=857.81ms p(95)=898.71ms p(99.9)=1.23s   
     http_reqs......................: 15262   220.190048/s
     iteration_duration.............: avg=513.74ms min=14.08ms med=542.34ms max=1.4s    p(90)=863.25ms p(95)=903.56ms p(99.9)=1.26s   
     iterations.....................: 14262   205.762709/s
     success_rate...................: 100.00% ✓ 14262      ✗ 0    
     vus............................: 112     min=0        max=494
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 416472      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=27.08µs  min=1.06µs  med=2.9µs   max=71.05ms  p(90)=4.64µs   p(95)=5.92µs   p(99.9)=5.83ms  
     http_req_connecting............: avg=23.26µs  min=0s      med=0s      max=70.97ms  p(90)=0s       p(95)=0s       p(99.9)=5.65ms  
     http_req_duration..............: avg=101.66ms min=1.62ms  med=96.03ms max=307.43ms p(90)=196.2ms  p(95)=215.03ms p(99.9)=269.1ms 
       { expected_response:true }...: avg=101.66ms min=1.62ms  med=96.03ms max=307.43ms p(90)=196.2ms  p(95)=215.03ms p(99.9)=269.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139824
     http_req_receiving.............: avg=280.9µs  min=28.57µs med=62.73µs max=61.5ms   p(90)=202.05µs p(95)=438.87µs p(99.9)=32.87ms 
     http_req_sending...............: avg=86.06µs  min=5.42µs  med=11.45µs max=160.44ms p(90)=22.3µs   p(95)=144.18µs p(99.9)=13.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.3ms  min=1.57ms  med=95.73ms max=301.09ms p(90)=195.48ms p(95)=214.37ms p(99.9)=266.31ms
     http_reqs......................: 139824  2251.434271/s
     iteration_duration.............: avg=102.72ms min=3.14ms  med=97.17ms max=410.23ms p(90)=196.81ms p(95)=215.6ms  p(99.9)=272.49ms
     iterations.....................: 138824  2235.332355/s
     success_rate...................: 100.00% ✓ 138824      ✗ 0     
     vus............................: 63      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 203574      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=10.31µs  min=1.09µs  med=2.4µs    max=62.69ms  p(90)=4.21µs   p(95)=5.26µs   p(99.9)=494.77µs
     http_req_connecting............: avg=7.18µs   min=0s      med=0s       max=62.6ms   p(90)=0s       p(95)=0s       p(99.9)=446.95µs
     http_req_duration..............: avg=207.31ms min=2.12ms  med=205.54ms max=641.16ms p(90)=387.7ms  p(95)=420.81ms p(99.9)=562.83ms
       { expected_response:true }...: avg=207.31ms min=2.12ms  med=205.54ms max=641.16ms p(90)=387.7ms  p(95)=420.81ms p(99.9)=562.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68858
     http_req_receiving.............: avg=87.26µs  min=30.86µs med=66µs     max=111.76ms p(90)=105.62µs p(95)=121.38µs p(99.9)=1.7ms   
     http_req_sending...............: avg=33.15µs  min=5.51µs  med=11.24µs  max=119.03ms p(90)=18.18µs  p(95)=21.85µs  p(99.9)=3.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.19ms min=2.05ms  med=205.41ms max=641.1ms  p(90)=387.6ms  p(95)=420.73ms p(99.9)=562.75ms
     http_reqs......................: 68858   1099.218362/s
     iteration_duration.............: avg=210.61ms min=5.23ms  med=209.12ms max=641.39ms p(90)=388.78ms p(95)=421.68ms p(99.9)=564.35ms
     iterations.....................: 67858   1083.254809/s
     success_rate...................: 100.00% ✓ 67858       ✗ 0    
     vus............................: 87      min=0         max=499
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100794     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 42 MB   644 kB/s
     http_req_blocked...............: avg=9.88µs   min=1.18µs  med=3.06µs   max=18.83ms  p(90)=4.89µs   p(95)=5.91µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=5.83µs   min=0s      med=0s       max=18.79ms  p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=414.57ms min=3.73ms  med=386.65ms max=1.7s     p(90)=816.34ms p(95)=887.37ms p(99.9)=1.29s   
       { expected_response:true }...: avg=414.57ms min=3.73ms  med=386.65ms max=1.7s     p(90)=816.34ms p(95)=887.37ms p(99.9)=1.29s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34598
     http_req_receiving.............: avg=93.61µs  min=33.57µs med=80.2µs   max=145.5ms  p(90)=116.33µs p(95)=130.21µs p(99.9)=905.45µs
     http_req_sending...............: avg=35.99µs  min=5.7µs   med=13.86µs  max=121.91ms p(90)=21µs     p(95)=24.37µs  p(99.9)=3.06ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=414.44ms min=3.65ms  med=386.52ms max=1.7s     p(90)=816.22ms p(95)=887.28ms p(99.9)=1.29s   
     http_reqs......................: 34598   535.53627/s
     iteration_duration.............: avg=427.15ms min=22.6ms  med=402.16ms max=1.7s     p(90)=819.96ms p(95)=890.24ms p(99.9)=1.3s    
     iterations.....................: 33598   520.057448/s
     success_rate...................: 100.00% ✓ 33598      ✗ 0    
     vus............................: 89      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46725      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   297 kB/s
     http_req_blocked...............: avg=14.96µs  min=1.32µs  med=3.7µs    max=4.34ms  p(90)=5.67µs   p(95)=7.26µs   p(99.9)=2.6ms  
     http_req_connecting............: avg=9.58µs   min=0s      med=0s       max=4.27ms  p(90)=0s       p(95)=0s       p(99.9)=2.57ms 
     http_req_duration..............: avg=863.76ms min=5.89ms  med=796.44ms max=4.14s   p(90)=1.71s    p(95)=1.9s     p(99.9)=3.31s  
       { expected_response:true }...: avg=863.76ms min=5.89ms  med=796.44ms max=4.14s   p(90)=1.71s    p(95)=1.9s     p(99.9)=3.31s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16575
     http_req_receiving.............: avg=170.78µs min=39µs    med=101.06µs max=80.62ms p(90)=141.12µs p(95)=154.28µs p(99.9)=35.43ms
     http_req_sending...............: avg=32.75µs  min=6.04µs  med=18.47µs  max=29.25ms p(90)=24.68µs  p(95)=29.42µs  p(99.9)=3.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=863.55ms min=5.77ms  med=796.35ms max=4.14s   p(90)=1.71s    p(95)=1.9s     p(99.9)=3.31s  
     http_reqs......................: 16575   245.232904/s
     iteration_duration.............: avg=919.25ms min=13.28ms med=874.04ms max=4.15s   p(90)=1.73s    p(95)=1.91s    p(99.9)=3.35s  
     iterations.....................: 15575   230.437555/s
     success_rate...................: 100.00% ✓ 15575      ✗ 0    
     vus............................: 94      min=0        max=500
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

     checks.........................: 100.00% ✓ 40119      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   250 kB/s
     http_req_blocked...............: avg=13.02µs  min=1.18µs  med=3.4µs    max=4.63ms   p(90)=5.1µs    p(95)=6.62µs   p(99.9)=1.53ms 
     http_req_connecting............: avg=7.76µs   min=0s      med=0s       max=2.59ms   p(90)=0s       p(95)=0s       p(99.9)=1.5ms  
     http_req_duration..............: avg=994.25ms min=8.7ms   med=900.65ms max=3.54s    p(90)=2.02s    p(95)=2.15s    p(99.9)=3.14s  
       { expected_response:true }...: avg=994.25ms min=8.7ms   med=900.65ms max=3.54s    p(90)=2.02s    p(95)=2.15s    p(99.9)=3.14s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14373
     http_req_receiving.............: avg=254.6µs  min=33.61µs med=95.16µs  max=162.34ms p(90)=136.01µs p(95)=148.63µs p(99.9)=68.26ms
     http_req_sending...............: avg=24.35µs  min=6.17µs  med=17.39µs  max=6.01ms   p(90)=23.2µs   p(95)=27.68µs  p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=993.97ms min=8.56ms  med=900.53ms max=3.54s    p(90)=2.02s    p(95)=2.15s    p(99.9)=3.14s  
     http_reqs......................: 14373   205.674715/s
     iteration_duration.............: avg=1.06s    min=17.28ms med=999.78ms max=3.55s    p(90)=2.04s    p(95)=2.16s    p(99.9)=3.15s  
     iterations.....................: 13373   191.364918/s
     success_rate...................: 100.00% ✓ 13373      ✗ 0    
     vus............................: 58      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

