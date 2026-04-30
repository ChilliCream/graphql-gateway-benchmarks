## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 1,573 | 1,598 | 1,565 | 0.6% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,455 | 1,475 | 1,445 | 0.7% |  |
| cosmo | 0.307.0 | 1,132 | 1,146 | 1,123 | 0.7% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.3 | 1,128 | 1,145 | 1,123 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 497 | 509 | 493 | 1.1% |  |
| apollo-router | v2.13.1 | 387 | 393 | 382 | 1.0% |  |
| hive-gateway | 2.5.25 | 239 | 243 | 236 | 1.0% |  |
| apollo-gateway | 2.13.3 | 238 | 240 | 236 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 575766      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.26µs  min=1µs     med=2.27µs  max=8.03ms   p(90)=4.09µs  p(95)=5.03µs   p(99.9)=34.74µs
     http_req_connecting............: avg=458ns   min=0s      med=0s      max=4.12ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.01ms min=14.16ms med=30.72ms max=324.46ms p(90)=36.89ms p(95)=38.9ms   p(99.9)=59.13ms
       { expected_response:true }...: avg=31.01ms min=14.16ms med=30.72ms max=324.46ms p(90)=36.89ms p(95)=38.9ms   p(99.9)=59.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192022
     http_req_receiving.............: avg=86.21µs min=27.71µs med=52.73µs max=73.78ms  p(90)=104.7µs p(95)=156.07µs p(99.9)=2.75ms 
     http_req_sending...............: avg=35.21µs min=5.12µs  med=9.59µs  max=98.13ms  p(90)=20.03µs p(95)=69.48µs  p(99.9)=1.84ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.88ms min=13.52ms med=30.61ms max=310.22ms p(90)=36.76ms p(95)=38.75ms  p(99.9)=57.74ms
     http_reqs......................: 192022  1573.456802/s
     iteration_duration.............: avg=31.25ms min=14.41ms med=30.94ms max=346.68ms p(90)=37.11ms p(95)=39.11ms  p(99.9)=59.42ms
     iterations.....................: 191922  1572.637387/s
     success_rate...................: 100.00% ✓ 191922      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 532317      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.14µs  min=1µs     med=2.08µs   max=4.03ms   p(90)=3.83µs  p(95)=4.67µs  p(99.9)=31.86µs
     http_req_connecting............: avg=578ns   min=0s      med=0s       max=3.98ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=33.56ms min=14.53ms med=32.45ms  max=472.03ms p(90)=41.17ms p(95)=44.72ms p(99.9)=80.86ms
       { expected_response:true }...: avg=33.56ms min=14.53ms med=32.45ms  max=472.03ms p(90)=41.17ms p(95)=44.72ms p(99.9)=80.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177539
     http_req_receiving.............: avg=756µs   min=49.75µs med=113.54µs max=125.07ms p(90)=2.19ms  p(95)=3.27ms  p(99.9)=15.06ms
     http_req_sending...............: avg=36.52µs min=5.17µs  med=9.11µs   max=81.1ms   p(90)=20.19µs p(95)=107.7µs p(99.9)=2.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=32.77ms min=14.33ms med=31.68ms  max=471.59ms p(90)=40.14ms p(95)=43.57ms p(99.9)=79.71ms
     http_reqs......................: 177539  1455.033432/s
     iteration_duration.............: avg=33.8ms  min=14.78ms med=32.67ms  max=472.27ms p(90)=41.39ms p(95)=44.95ms p(99.9)=81.59ms
     iterations.....................: 177439  1454.213874/s
     success_rate...................: 100.00% ✓ 177439      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 414213      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.59µs   min=992ns   med=2.45µs  max=4.07ms   p(90)=4.08µs   p(95)=4.83µs   p(99.9)=38.21µs
     http_req_connecting............: avg=751ns    min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.21ms  min=15.91ms med=42.63ms max=340.2ms  p(90)=52.58ms  p(95)=55.77ms  p(99.9)=73.78ms
       { expected_response:true }...: avg=43.21ms  min=15.91ms med=42.63ms max=340.2ms  p(90)=52.58ms  p(95)=55.77ms  p(99.9)=73.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138171
     http_req_receiving.............: avg=105.56µs min=29.26µs med=64.64µs max=155.62ms p(90)=108.51µs p(95)=134.79µs p(99.9)=2.23ms 
     http_req_sending...............: avg=28.31µs  min=5.27µs  med=10.81µs max=245.94ms p(90)=18.29µs  p(95)=23.02µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.08ms  min=15.8ms  med=42.52ms max=184.17ms p(90)=52.46ms  p(95)=55.63ms  p(99.9)=73.03ms
     http_reqs......................: 138171  1132.220052/s
     iteration_duration.............: avg=43.44ms  min=19.34ms med=42.84ms max=354.46ms p(90)=52.79ms  p(95)=55.98ms  p(99.9)=74.13ms
     iterations.....................: 138071  1131.400618/s
     success_rate...................: 100.00% ✓ 138071      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 412959      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.6µs   min=982ns   med=2.21µs  max=3.79ms   p(90)=4.54µs   p(95)=5.67µs   p(99.9)=41.39µs
     http_req_connecting............: avg=722ns   min=0s      med=0s      max=3.76ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.32ms min=15.39ms med=42.81ms max=348.39ms p(90)=52.78ms  p(95)=56.11ms  p(99.9)=79.5ms 
       { expected_response:true }...: avg=43.32ms min=15.39ms med=42.81ms max=348.39ms p(90)=52.78ms  p(95)=56.11ms  p(99.9)=79.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 137753
     http_req_receiving.............: avg=94.35µs min=29.24µs med=58.65µs max=99.64ms  p(90)=129.22µs p(95)=203.61µs p(99.9)=2.97ms 
     http_req_sending...............: avg=36.69µs min=5.07µs  med=9.67µs  max=104.92ms p(90)=23.3µs   p(95)=109.86µs p(99.9)=2.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.19ms min=15.34ms med=42.68ms max=347.81ms p(90)=52.63ms  p(95)=55.95ms  p(99.9)=78.7ms 
     http_reqs......................: 137753  1128.949536/s
     iteration_duration.............: avg=43.58ms min=15.6ms  med=43.05ms max=372.49ms p(90)=53.02ms  p(95)=56.34ms  p(99.9)=80.77ms
     iterations.....................: 137653  1128.12999/s
     success_rate...................: 100.00% ✓ 137653      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 182472     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   597 kB/s
     http_req_blocked...............: avg=4.91µs  min=1.18µs  med=2.91µs  max=4.56ms   p(90)=4.46µs   p(95)=5.11µs   p(99.9)=51.21µs 
     http_req_connecting............: avg=1.71µs  min=0s      med=0s      max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.29ms min=22.42ms med=91.91ms max=371.08ms p(90)=134.92ms p(95)=145.59ms p(99.9)=245.92ms
       { expected_response:true }...: avg=98.29ms min=22.42ms med=91.91ms max=371.08ms p(90)=134.92ms p(95)=145.59ms p(99.9)=245.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60924
     http_req_receiving.............: avg=91.12µs min=33.11µs med=78.49µs max=169.47ms p(90)=114.02µs p(95)=127.53µs p(99.9)=874.28µs
     http_req_sending...............: avg=23.24µs min=5.6µs   med=13.83µs max=108.29ms p(90)=20.32µs  p(95)=22.61µs  p(99.9)=654.37µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.18ms min=22.29ms med=91.79ms max=370.6ms  p(90)=134.8ms  p(95)=145.45ms p(99.9)=245.56ms
     http_reqs......................: 60924   497.426407/s
     iteration_duration.............: avg=98.66ms min=33.16ms med=92.23ms max=378.68ms p(90)=135.15ms p(95)=145.92ms p(99.9)=248.3ms 
     iterations.....................: 60824   496.609936/s
     success_rate...................: 100.00% ✓ 60824      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 142026     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 57 MB   465 kB/s
     http_req_blocked...............: avg=5.92µs   min=1.23µs  med=3.5µs    max=3.83ms   p(90)=5.08µs   p(95)=5.73µs   p(99.9)=284.81µs
     http_req_connecting............: avg=2.2µs    min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=194.63µs
     http_req_duration..............: avg=126.25ms min=22.21ms med=124.56ms max=383.04ms p(90)=157.15ms p(95)=167.76ms p(99.9)=215.33ms
       { expected_response:true }...: avg=126.25ms min=22.21ms med=124.56ms max=383.04ms p(90)=157.15ms p(95)=167.76ms p(99.9)=215.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47442
     http_req_receiving.............: avg=97.14µs  min=31.9µs  med=88.22µs  max=102.91ms p(90)=121.93µs p(95)=135.82µs p(99.9)=845.65µs
     http_req_sending...............: avg=32.92µs  min=5.83µs  med=16.82µs  max=146.31ms p(90)=22.71µs  p(95)=24.91µs  p(99.9)=651.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=126.12ms min=22.07ms med=124.44ms max=382.55ms p(90)=157ms    p(95)=167.63ms p(99.9)=214.73ms
     http_reqs......................: 47442   387.200081/s
     iteration_duration.............: avg=126.77ms min=38.48ms med=124.87ms max=397.22ms p(90)=157.44ms p(95)=168.06ms p(99.9)=219.33ms
     iterations.....................: 47342   386.383926/s
     success_rate...................: 100.00% ✓ 47342      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 87438      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.43µs   min=1.27µs  med=3.49µs   max=4.58ms   p(90)=4.95µs   p(95)=5.57µs   p(99.9)=1.63ms  
     http_req_connecting............: avg=3.74µs   min=0s      med=0s       max=4.53ms   p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=205.03ms min=18.96ms med=190.84ms max=645.19ms p(90)=249.41ms p(95)=395.06ms p(99.9)=571.11ms
       { expected_response:true }...: avg=205.03ms min=18.96ms med=190.84ms max=645.19ms p(90)=249.41ms p(95)=395.06ms p(99.9)=571.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29246
     http_req_receiving.............: avg=105.25µs min=34.72µs med=96.03µs  max=84.2ms   p(90)=129.11µs p(95)=142.44µs p(99.9)=686.85µs
     http_req_sending...............: avg=33.32µs  min=6.26µs  med=17.89µs  max=169.38ms p(90)=23.16µs  p(95)=25.11µs  p(99.9)=488.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.89ms min=18.83ms med=190.71ms max=645.06ms p(90)=249.28ms p(95)=394.92ms p(99.9)=571.01ms
     http_reqs......................: 29246   239.06404/s
     iteration_duration.............: avg=205.98ms min=42.18ms med=191.27ms max=645.45ms p(90)=249.89ms p(95)=395.86ms p(99.9)=571.4ms 
     iterations.....................: 29146   238.246616/s
     success_rate...................: 100.00% ✓ 29146      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 87747      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=5.34µs   min=1.25µs  med=3.5µs    max=2.22ms   p(90)=5.02µs   p(95)=5.64µs   p(99.9)=662.01µs
     http_req_connecting............: avg=1.52µs   min=0s      med=0s       max=2.19ms   p(90)=0s       p(95)=0s       p(99.9)=549.62µs
     http_req_duration..............: avg=204.35ms min=22.16ms med=204.01ms max=382.33ms p(90)=219.04ms p(95)=225ms    p(99.9)=291.08ms
       { expected_response:true }...: avg=204.35ms min=22.16ms med=204.01ms max=382.33ms p(90)=219.04ms p(95)=225ms    p(99.9)=291.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29349
     http_req_receiving.............: avg=105.72µs min=31.01µs med=95.8µs   max=98.62ms  p(90)=129.76µs p(95)=143.85µs p(99.9)=474.23µs
     http_req_sending...............: avg=25.04µs  min=5.67µs  med=17.99µs  max=31.75ms  p(90)=23.36µs  p(95)=25.32µs  p(99.9)=520.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.22ms min=22.01ms med=203.88ms max=380.96ms p(90)=218.93ms p(95)=224.86ms p(99.9)=290.79ms
     http_reqs......................: 29349   238.806686/s
     iteration_duration.............: avg=205.28ms min=81.3ms  med=204.38ms max=413.68ms p(90)=219.33ms p(95)=225.33ms p(99.9)=293.17ms
     iterations.....................: 29249   237.993007/s
     success_rate...................: 100.00% ✓ 29249      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

