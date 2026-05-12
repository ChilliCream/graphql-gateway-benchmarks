## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,909 | 3,113 | 2,883 | 2.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,161 | 2,212 | 2,150 | 1.0% |  |
| grafbase | 0.53.3 | 2,041 | 2,111 | 2,031 | 1.4% |  |
| cosmo | 0.307.0 | 1,265 | 1,297 | 1,259 | 1.0% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 533 | 544 | 528 | 1.1% |  |
| hive-gateway | 2.5.25 | 249 | 256 | 247 | 1.2% |  |
| apollo-gateway | 2.13.3 | 241 | 243 | 239 | 0.6% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,363 | 2,495 | 2,323 | 2.6% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,976 | 2,029 | 1,957 | 1.2% |  |
| grafbase | 0.53.3 | 1,544 | 1,565 | 1,537 | 0.7% |  |
| cosmo | 0.307.0 | 1,200 | 1,218 | 1,185 | 0.9% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 507 | 521 | 502 | 1.3% |  |
| apollo-router | v2.13.1 | 401 | 411 | 397 | 1.2% |  |
| hive-gateway | 2.5.25 | 240 | 245 | 237 | 1.1% |  |
| apollo-gateway | 2.13.3 | 233 | 237 | 232 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1049025     ✗ 0     
     data_received..................: 31 GB   255 MB/s
     data_sent......................: 420 MB  3.5 MB/s
     http_req_blocked...............: avg=2.91µs   min=1µs     med=1.97µs  max=23.91ms  p(90)=3.01µs  p(95)=3.61µs   p(99.9)=31.49µs
     http_req_connecting............: avg=301ns    min=0s      med=0s      max=4.76ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.92ms  min=1.67ms  med=15.99ms max=319.68ms p(90)=24.93ms p(95)=28.8ms   p(99.9)=51.39ms
       { expected_response:true }...: avg=16.92ms  min=1.67ms  med=15.99ms max=319.68ms p(90)=24.93ms p(95)=28.8ms   p(99.9)=51.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 349775
     http_req_receiving.............: avg=122.59µs min=26.87µs med=47.71µs max=150.09ms p(90)=91.12µs p(95)=257.95µs p(99.9)=11.72ms
     http_req_sending...............: avg=58.75µs  min=5.13µs  med=8.76µs  max=160.54ms p(90)=14.52µs p(95)=116.91µs p(99.9)=11.24ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.73ms  min=1.58ms  med=15.84ms max=319.37ms p(90)=24.68ms p(95)=28.42ms  p(99.9)=50.09ms
     http_reqs......................: 349775  2909.83502/s
     iteration_duration.............: avg=17.14ms  min=2.19ms  med=16.19ms max=354.6ms  p(90)=25.16ms p(95)=29.07ms  p(99.9)=52.78ms
     iterations.....................: 349675  2909.003104/s
     success_rate...................: 100.00% ✓ 349675      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 779625      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=2.77µs  min=981ns   med=2.07µs   max=15.48ms  p(90)=3.26µs   p(95)=3.91µs   p(99.9)=30.86µs 
     http_req_connecting............: avg=157ns   min=0s      med=0s       max=1.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.84ms min=2.44ms  med=14.59ms  max=308.59ms p(90)=50.85ms  p(95)=69.08ms  p(99.9)=164.45ms
       { expected_response:true }...: avg=22.84ms min=2.44ms  med=14.59ms  max=308.59ms p(90)=50.85ms  p(95)=69.08ms  p(99.9)=164.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259975
     http_req_receiving.............: avg=622µs   min=50.69µs med=103.05µs max=264.14ms p(90)=934.83µs p(95)=1.46ms   p(99.9)=57.32ms 
     http_req_sending...............: avg=46.21µs min=5.17µs  med=9.12µs   max=266.67ms p(90)=15.55µs  p(95)=103.83µs p(99.9)=3.49ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.18ms min=2.3ms   med=14.1ms   max=277.08ms p(90)=49.63ms  p(95)=67.83ms  p(99.9)=163.13ms
     http_reqs......................: 259975  2161.194685/s
     iteration_duration.............: avg=23.07ms min=3.2ms   med=14.8ms   max=353.74ms p(90)=51.09ms  p(95)=69.32ms  p(99.9)=165.75ms
     iterations.....................: 259875  2160.363377/s
     success_rate...................: 100.00% ✓ 259875      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 736362      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 295 MB  2.5 MB/s
     http_req_blocked...............: avg=3.12µs   min=911ns   med=2.15µs  max=13.41ms  p(90)=3.53µs  p(95)=4.27µs   p(99.9)=44.59µs
     http_req_connecting............: avg=402ns    min=0s      med=0s      max=4.41ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.2ms   min=1.96ms  med=23.94ms max=337.59ms p(90)=28.95ms p(95)=31.13ms  p(99.9)=53.33ms
       { expected_response:true }...: avg=24.2ms   min=1.96ms  med=23.94ms max=337.59ms p(90)=28.95ms p(95)=31.13ms  p(99.9)=53.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245554
     http_req_receiving.............: avg=126.71µs min=29.84µs med=57.86µs max=265.45ms p(90)=99.24µs p(95)=174.97µs p(99.9)=9.65ms 
     http_req_sending...............: avg=41.27µs  min=4.45µs  med=9.78µs  max=219.6ms  p(90)=17.04µs p(95)=106.47µs p(99.9)=2.16ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.03ms  min=1.86ms  med=23.83ms max=145.86ms p(90)=28.78ms p(95)=30.87ms  p(99.9)=51.71ms
     http_reqs......................: 245554  2041.987138/s
     iteration_duration.............: avg=24.43ms  min=3.97ms  med=24.15ms max=352.75ms p(90)=29.16ms p(95)=31.35ms  p(99.9)=53.98ms
     iterations.....................: 245454  2041.155554/s
     success_rate...................: 100.00% ✓ 245454      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 456177      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.17µs  min=1.02µs  med=2.4µs   max=3.1ms    p(90)=3.81µs  p(95)=4.45µs   p(99.9)=35.96µs
     http_req_connecting............: avg=439ns   min=0s      med=0s      max=3.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.21ms min=2.11ms  med=38.64ms max=316.73ms p(90)=55.43ms p(95)=60.47ms  p(99.9)=85.05ms
       { expected_response:true }...: avg=39.21ms min=2.11ms  med=38.64ms max=316.73ms p(90)=55.43ms p(95)=60.47ms  p(99.9)=85.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152159
     http_req_receiving.............: avg=86.33µs min=27.89µs med=61.3µs  max=132.72ms p(90)=97.49µs p(95)=117.05µs p(99.9)=2.66ms 
     http_req_sending...............: avg=25.74µs min=5.39µs  med=10.48µs max=91.85ms  p(90)=16.35µs p(95)=20.44µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.1ms  min=2.01ms  med=38.53ms max=308.56ms p(90)=55.31ms p(95)=60.35ms  p(99.9)=84.58ms
     http_reqs......................: 152159  1265.153405/s
     iteration_duration.............: avg=39.45ms min=3.74ms  med=38.84ms max=337.35ms p(90)=55.63ms p(95)=60.69ms  p(99.9)=85.61ms
     iterations.....................: 152059  1264.321937/s
     success_rate...................: 100.00% ✓ 152059      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 192606     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   641 kB/s
     http_req_blocked...............: avg=4.64µs  min=1.15µs  med=2.93µs  max=4.23ms   p(90)=4.5µs    p(95)=5.12µs   p(99.9)=46.14µs 
     http_req_connecting............: avg=1.44µs  min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.1ms  min=4.17ms  med=78.45ms max=337.87ms p(90)=151.02ms p(95)=164.22ms p(99.9)=263.65ms
       { expected_response:true }...: avg=93.1ms  min=4.17ms  med=78.45ms max=337.87ms p(90)=151.02ms p(95)=164.22ms p(99.9)=263.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64302
     http_req_receiving.............: avg=88.5µs  min=31.14µs med=75.47µs max=197.86ms p(90)=109.58µs p(95)=121.66µs p(99.9)=1.01ms  
     http_req_sending...............: avg=22.45µs min=5.9µs   med=13.17µs max=79.12ms  p(90)=19.81µs  p(95)=22.05µs  p(99.9)=831.17µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.98ms min=4.11ms  med=78.35ms max=337.64ms p(90)=150.91ms p(95)=164.1ms  p(99.9)=263.32ms
     http_reqs......................: 64302   533.280276/s
     iteration_duration.............: avg=93.47ms min=24.62ms med=78.74ms max=346.18ms p(90)=151.26ms p(95)=164.48ms p(99.9)=265.02ms
     iterations.....................: 64202   532.450939/s
     success_rate...................: 100.00% ✓ 64202      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 90084      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   299 kB/s
     http_req_blocked...............: avg=5.48µs   min=1.27µs  med=3.5µs    max=2.97ms   p(90)=4.92µs   p(95)=5.53µs   p(99.9)=654.61µs
     http_req_connecting............: avg=1.79µs   min=0s      med=0s       max=2.94ms   p(90)=0s       p(95)=0s       p(99.9)=629.52µs
     http_req_duration..............: avg=199.05ms min=6.39ms  med=186.83ms max=719.41ms p(90)=235.54ms p(95)=385.1ms  p(99.9)=564.02ms
       { expected_response:true }...: avg=199.05ms min=6.39ms  med=186.83ms max=719.41ms p(90)=235.54ms p(95)=385.1ms  p(99.9)=564.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30128
     http_req_receiving.............: avg=98.84µs  min=36.72µs med=92.6µs   max=29.9ms   p(90)=125.3µs  p(95)=138.17µs p(99.9)=653.6µs 
     http_req_sending...............: avg=22.31µs  min=5.95µs  med=16.96µs  max=48.79ms  p(90)=22.31µs  p(95)=24.22µs  p(99.9)=491.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.93ms min=6.27ms  med=186.72ms max=719.28ms p(90)=235.41ms p(95)=385.02ms p(99.9)=563.92ms
     http_reqs......................: 30128   249.085988/s
     iteration_duration.............: avg=199.97ms min=56.5ms  med=187.22ms max=719.71ms p(90)=235.87ms p(95)=387.42ms p(99.9)=564.34ms
     iterations.....................: 30028   248.259229/s
     success_rate...................: 100.00% ✓ 30028      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 87396      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=4.93µs   min=1.28µs  med=3.32µs   max=2.44ms   p(90)=4.58µs   p(95)=5.08µs   p(99.9)=573.3µs 
     http_req_connecting............: avg=1.47µs   min=0s      med=0s       max=2.36ms   p(90)=0s       p(95)=0s       p(99.9)=526.3µs 
     http_req_duration..............: avg=205.12ms min=8.58ms  med=207.33ms max=399.61ms p(90)=219.57ms p(95)=231.09ms p(99.9)=288.37ms
       { expected_response:true }...: avg=205.12ms min=8.58ms  med=207.33ms max=399.61ms p(90)=219.57ms p(95)=231.09ms p(99.9)=288.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29232
     http_req_receiving.............: avg=95.26µs  min=34.34µs med=87.64µs  max=52.96ms  p(90)=118.45µs p(95)=130.43µs p(99.9)=553.41µs
     http_req_sending...............: avg=28.34µs  min=6.04µs  med=15.47µs  max=94.58ms  p(90)=20.46µs  p(95)=22.12µs  p(99.9)=694.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205ms    min=8.42ms  med=207.22ms max=399.39ms p(90)=219.44ms p(95)=230.93ms p(99.9)=288.27ms
     http_reqs......................: 29232   241.408748/s
     iteration_duration.............: avg=206.09ms min=51.98ms med=207.59ms max=408.52ms p(90)=219.89ms p(95)=231.46ms p(99.9)=290.53ms
     iterations.....................: 29132   240.582911/s
     success_rate...................: 100.00% ✓ 29132      ✗ 0    
     vus............................: 39      min=39       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 852300      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=2.81µs   min=1.01µs med=2.15µs  max=10.7ms   p(90)=3.59µs   p(95)=4.44µs   p(99.9)=35.78µs
     http_req_connecting............: avg=166ns    min=0s     med=0s      max=2.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.88ms  min=1.72ms med=20.4ms  max=368.18ms p(90)=28.96ms  p(95)=32.03ms  p(99.9)=54.21ms
       { expected_response:true }...: avg=20.88ms  min=1.72ms med=20.4ms  max=368.18ms p(90)=28.96ms  p(95)=32.03ms  p(99.9)=54.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284200
     http_req_receiving.............: avg=128.98µs min=28.1µs med=54.04µs max=286.71ms p(90)=101.49µs p(95)=248.62µs p(99.9)=9.04ms 
     http_req_sending...............: avg=53µs     min=5.15µs med=9.57µs  max=173.37ms p(90)=17.8µs   p(95)=121.97µs p(99.9)=5.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.69ms  min=1.63ms med=20.27ms max=84.14ms  p(90)=28.76ms  p(95)=31.75ms  p(99.9)=53.28ms
     http_reqs......................: 284200  2363.785577/s
     iteration_duration.............: avg=21.1ms   min=2.91ms med=20.62ms max=389.15ms p(90)=29.19ms  p(95)=32.28ms  p(99.9)=54.62ms
     iterations.....................: 284100  2362.953844/s
     success_rate...................: 100.00% ✓ 284100      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 712917      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 286 MB  2.4 MB/s
     http_req_blocked...............: avg=3.16µs   min=1µs     med=2.16µs  max=21.32ms  p(90)=3.63µs  p(95)=4.4µs    p(99.9)=37.35µs 
     http_req_connecting............: avg=430ns    min=0s      med=0s      max=4.51ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25ms     min=1.98ms  med=17.3ms  max=584.24ms p(90)=52.64ms p(95)=69.46ms  p(99.9)=183.75ms
       { expected_response:true }...: avg=25ms     min=1.98ms  med=17.3ms  max=584.24ms p(90)=52.64ms p(95)=69.46ms  p(99.9)=183.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237739
     http_req_receiving.............: avg=696.62µs min=50.87µs med=104.4µs max=305.91ms p(90)=1.12ms  p(95)=1.79ms   p(99.9)=59.36ms 
     http_req_sending...............: avg=43.63µs  min=5.17µs  med=9.52µs  max=265.73ms p(90)=18µs    p(95)=109.89µs p(99.9)=3.18ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.26ms  min=1.86ms  med=16.74ms max=513.76ms p(90)=51.38ms p(95)=67.94ms  p(99.9)=180.28ms
     http_reqs......................: 237739  1976.996406/s
     iteration_duration.............: avg=25.23ms  min=2.67ms  med=17.52ms max=584.4ms  p(90)=52.89ms p(95)=69.72ms  p(99.9)=184.62ms
     iterations.....................: 237639  1976.164823/s
     success_rate...................: 100.00% ✓ 237639      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 557121      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.9 MB/s
     http_req_blocked...............: avg=3.51µs   min=962ns   med=2.37µs  max=3.89ms   p(90)=4.73µs   p(95)=5.93µs   p(99.9)=46.13µs
     http_req_connecting............: avg=525ns    min=0s      med=0s      max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.03ms  min=2.31ms  med=31.14ms max=353.11ms p(90)=42.59ms  p(95)=47.31ms  p(99.9)=87.65ms
       { expected_response:true }...: avg=32.03ms  min=2.31ms  med=31.14ms max=353.11ms p(90)=42.59ms  p(95)=47.31ms  p(99.9)=87.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185807
     http_req_receiving.............: avg=139.05µs min=30.53µs med=61.86µs max=263.61ms p(90)=135.73µs p(95)=284.18µs p(99.9)=6.24ms 
     http_req_sending...............: avg=46.24µs  min=5.27µs  med=10.35µs max=308.43ms p(90)=24.6µs   p(95)=135.63µs p(99.9)=3.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.84ms  min=2.19ms  med=30.99ms max=152.42ms p(90)=42.41ms  p(95)=47.07ms  p(99.9)=86.57ms
     http_reqs......................: 185807  1544.477689/s
     iteration_duration.............: avg=32.3ms   min=3.95ms  med=31.37ms max=390.09ms p(90)=42.83ms  p(95)=47.56ms  p(99.9)=88.65ms
     iterations.....................: 185707  1543.646463/s
     success_rate...................: 100.00% ✓ 185707      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 432822      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=2.91µs  min=1.01µs  med=2.23µs  max=6.01ms   p(90)=3.69µs   p(95)=4.35µs   p(99.9)=35.85µs
     http_req_connecting............: avg=295ns   min=0s      med=0s      max=1.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.33ms min=2.19ms  med=40.79ms max=327.78ms p(90)=58.12ms  p(95)=63.27ms  p(99.9)=90.59ms
       { expected_response:true }...: avg=41.33ms min=2.19ms  med=40.79ms max=327.78ms p(90)=58.12ms  p(95)=63.27ms  p(99.9)=90.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144374
     http_req_receiving.............: avg=82.69µs min=28.24µs med=63.95µs max=164.43ms p(90)=100.93µs p(95)=118.46µs p(99.9)=1.75ms 
     http_req_sending...............: avg=29.59µs min=5.42µs  med=10.85µs max=229.14ms p(90)=17.42µs  p(95)=21.04µs  p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.22ms min=2.12ms  med=40.69ms max=293.14ms p(90)=58ms     p(95)=63.16ms  p(99.9)=90.3ms 
     http_reqs......................: 144374  1200.153066/s
     iteration_duration.............: avg=41.58ms min=4.04ms  med=41ms    max=348.25ms p(90)=58.32ms  p(95)=63.47ms  p(99.9)=91.35ms
     iterations.....................: 144274  1199.321786/s
     success_rate...................: 100.00% ✓ 144274      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 183180     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 73 MB   609 kB/s
     http_req_blocked...............: avg=5.05µs  min=1.16µs  med=3.11µs  max=4.62ms   p(90)=4.66µs   p(95)=5.25µs   p(99.9)=51.14µs 
     http_req_connecting............: avg=1.71µs  min=0s      med=0s      max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.87ms min=4.25ms  med=95.45ms max=361.24ms p(90)=118.84ms p(95)=131.69ms p(99.9)=232.43ms
       { expected_response:true }...: avg=97.87ms min=4.25ms  med=95.45ms max=361.24ms p(90)=118.84ms p(95)=131.69ms p(99.9)=232.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61160
     http_req_receiving.............: avg=91.49µs min=32.34µs med=81.49µs max=169.37ms p(90)=114.95µs p(95)=127.22µs p(99.9)=834.68µs
     http_req_sending...............: avg=25.12µs min=5.87µs  med=14.07µs max=92.37ms  p(90)=20.68µs  p(95)=22.73µs  p(99.9)=656.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.76ms min=4.18ms  med=95.34ms max=351.87ms p(90)=118.73ms p(95)=131.57ms p(99.9)=231.88ms
     http_reqs......................: 61160   507.194744/s
     iteration_duration.............: avg=98.28ms min=20.56ms med=95.69ms max=370.4ms  p(90)=119.11ms p(95)=132.03ms p(99.9)=235.2ms 
     iterations.....................: 61060   506.365453/s
     success_rate...................: 100.00% ✓ 61060      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 145224     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   482 kB/s
     http_req_blocked...............: avg=6µs      min=1.17µs  med=3.65µs   max=4.07ms   p(90)=5.2µs    p(95)=5.79µs   p(99.9)=289.49µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=104.63µs
     http_req_duration..............: avg=123.45ms min=5.91ms  med=121ms    max=372.82ms p(90)=163.27ms p(95)=175.88ms p(99.9)=227.45ms
       { expected_response:true }...: avg=123.45ms min=5.91ms  med=121ms    max=372.82ms p(90)=163.27ms p(95)=175.88ms p(99.9)=227.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48508
     http_req_receiving.............: avg=172.18µs min=31.38µs med=88.24µs  max=218.28ms p(90)=120.57µs p(95)=133.55µs p(99.9)=1.13ms  
     http_req_sending...............: avg=28.78µs  min=5.97µs  med=17.09µs  max=246.56ms p(90)=22.39µs  p(95)=24.22µs  p(99.9)=643.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.25ms min=5.77ms  med=120.88ms max=252.08ms p(90)=163.05ms p(95)=175.56ms p(99.9)=221.57ms
     http_reqs......................: 48508   401.717842/s
     iteration_duration.............: avg=123.97ms min=18.44ms med=121.33ms max=382.07ms p(90)=163.54ms p(95)=176.18ms p(99.9)=229.02ms
     iterations.....................: 48408   400.889695/s
     success_rate...................: 100.00% ✓ 48408      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 86853      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=9.28µs   min=1.19µs  med=3.53µs   max=8.63ms   p(90)=4.87µs   p(95)=5.43µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=5.36µs   min=0s      med=0s       max=8.58ms   p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=206.39ms min=6.59ms  med=188.62ms max=674.89ms p(90)=244.78ms p(95)=408.16ms p(99.9)=544.46ms
       { expected_response:true }...: avg=206.39ms min=6.59ms  med=188.62ms max=674.89ms p(90)=244.78ms p(95)=408.16ms p(99.9)=544.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29051
     http_req_receiving.............: avg=101.07µs min=33.54µs med=94.67µs  max=78.63ms  p(90)=125.69µs p(95)=139.28µs p(99.9)=459.01µs
     http_req_sending...............: avg=33.03µs  min=6.17µs  med=17.34µs  max=112.41ms p(90)=22.2µs   p(95)=23.82µs  p(99.9)=4.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.26ms min=6.45ms  med=188.5ms  max=674.79ms p(90)=244.67ms p(95)=408.04ms p(99.9)=544.33ms
     http_reqs......................: 29051   240.171023/s
     iteration_duration.............: avg=207.38ms min=33.23ms med=189.01ms max=675.1ms  p(90)=245.24ms p(95)=408.64ms p(99.9)=544.79ms
     iterations.....................: 28951   239.344301/s
     success_rate...................: 100.00% ✓ 28951      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 84660      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=5.07µs   min=1.27µs  med=3.49µs   max=3.17ms   p(90)=4.81µs   p(95)=5.33µs   p(99.9)=572.95µs
     http_req_connecting............: avg=1.32µs   min=0s      med=0s       max=2.05ms   p(90)=0s       p(95)=0s       p(99.9)=513.27µs
     http_req_duration..............: avg=211.74ms min=8.65ms  med=210.62ms max=401.14ms p(90)=219.91ms p(95)=225.71ms p(99.9)=292.45ms
       { expected_response:true }...: avg=211.74ms min=8.65ms  med=210.62ms max=401.14ms p(90)=219.91ms p(95)=225.71ms p(99.9)=292.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28320
     http_req_receiving.............: avg=104.99µs min=32.5µs  med=92.87µs  max=87.42ms  p(90)=124.5µs  p(95)=137.33µs p(99.9)=542.66µs
     http_req_sending...............: avg=35.86µs  min=6.17µs  med=17.12µs  max=174.95ms p(90)=21.78µs  p(95)=23.4µs   p(99.9)=613.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.6ms  min=8.52ms  med=210.5ms  max=400.95ms p(90)=219.78ms p(95)=225.59ms p(99.9)=292.08ms
     http_reqs......................: 28320   233.814319/s
     iteration_duration.............: avg=212.76ms min=60.92ms med=210.91ms max=411.35ms p(90)=220.18ms p(95)=226.08ms p(99.9)=294.22ms
     iterations.....................: 28220   232.988704/s
     success_rate...................: 100.00% ✓ 28220      ✗ 0    
     vus............................: 46      min=46       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

