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
| hive-router | v0.0.49 | 1,575 | 1,606 | 1,565 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,435 | 1,454 | 1,432 | 0.5% |  |
| cosmo | 0.307.0 | 1,146 | 1,164 | 1,138 | 0.9% | non-compatible response (2 across 1/9 runs) |
| grafbase | 0.53.3 | 1,120 | 1,143 | 1,113 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 510 | 519 | 502 | 1.0% |  |
| apollo-router | v2.13.1 | 364 | 375 | 361 | 1.3% |  |
| hive-gateway | 2.5.25 | 246 | 250 | 243 | 1.0% |  |
| apollo-gateway | 2.13.3 | 239 | 241 | 237 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 576372      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.5µs   min=982ns   med=2.47µs  max=4.08ms   p(90)=4.36µs   p(95)=5.33µs   p(99.9)=37.07µs
     http_req_connecting............: avg=502ns   min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.98ms min=14.39ms med=30.71ms max=344ms    p(90)=36.84ms  p(95)=38.81ms  p(99.9)=57.82ms
       { expected_response:true }...: avg=30.98ms min=14.39ms med=30.71ms max=344ms    p(90)=36.84ms  p(95)=38.81ms  p(99.9)=57.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192224
     http_req_receiving.............: avg=85.85µs min=27.93µs med=55.02µs max=74.13ms  p(90)=108.01µs p(95)=152.76µs p(99.9)=2.41ms 
     http_req_sending...............: avg=36.91µs min=4.85µs  med=10.12µs max=179.9ms  p(90)=20.58µs  p(95)=40.37µs  p(99.9)=1.85ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.86ms min=14.31ms med=30.6ms  max=343.38ms p(90)=36.71ms  p(95)=38.68ms  p(99.9)=56.51ms
     http_reqs......................: 192224  1575.004657/s
     iteration_duration.............: avg=31.22ms min=14.6ms  med=30.94ms max=355.45ms p(90)=37.06ms  p(95)=39.03ms  p(99.9)=58.33ms
     iterations.....................: 192124  1574.185298/s
     success_rate...................: 100.00% ✓ 192124      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 525141      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 210 MB  1.7 MB/s
     http_req_blocked...............: avg=3.34µs   min=1.01µs  med=2.3µs    max=4.12ms   p(90)=4.12µs  p(95)=5.07µs   p(99.9)=32.04µs
     http_req_connecting............: avg=582ns    min=0s      med=0s       max=4.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=34.02ms  min=14.61ms med=32.85ms  max=487.48ms p(90)=41.68ms p(95)=45.38ms  p(99.9)=88.45ms
       { expected_response:true }...: avg=34.02ms  min=14.61ms med=32.85ms  max=487.48ms p(90)=41.68ms p(95)=45.38ms  p(99.9)=88.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175147
     http_req_receiving.............: avg=822.76µs min=51.52µs med=120.31µs max=289.7ms  p(90)=2.35ms  p(95)=3.51ms   p(99.9)=16.51ms
     http_req_sending...............: avg=39.19µs  min=5.01µs  med=9.54µs   max=189.54ms p(90)=20.58µs p(95)=106.68µs p(99.9)=2.16ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.16ms  min=13.41ms med=32.02ms  max=481.98ms p(90)=40.53ms p(95)=44.05ms  p(99.9)=86.64ms
     http_reqs......................: 175147  1435.770305/s
     iteration_duration.............: avg=34.27ms  min=14.82ms med=33.08ms  max=487.72ms p(90)=41.91ms p(95)=45.6ms   p(99.9)=89.42ms
     iterations.....................: 175047  1434.950554/s
     success_rate...................: 100.00% ✓ 175047      ✗ 0     
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

     checks.........................: 100.00% ✓ 419298      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.74µs  min=1.08µs  med=2.63µs  max=4.02ms   p(90)=4.33µs   p(95)=5.14µs   p(99.9)=40.85µs
     http_req_connecting............: avg=729ns   min=0s      med=0s      max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.67ms min=15.45ms med=42.04ms max=350.09ms p(90)=52.05ms  p(95)=55.21ms  p(99.9)=73.22ms
       { expected_response:true }...: avg=42.67ms min=15.45ms med=42.04ms max=350.09ms p(90)=52.05ms  p(95)=55.21ms  p(99.9)=73.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139866
     http_req_receiving.............: avg=88.68µs min=28.67µs med=65.67µs max=89.69ms  p(90)=111.48µs p(95)=138.06µs p(99.9)=1.95ms 
     http_req_sending...............: avg=28.9µs  min=5.37µs  med=11.25µs max=236.48ms p(90)=19.24µs  p(95)=24.31µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.56ms min=15.36ms med=41.94ms max=349.46ms p(90)=51.93ms  p(95)=55.07ms  p(99.9)=72.94ms
     http_reqs......................: 139866  1146.173168/s
     iteration_duration.............: avg=42.92ms min=18.11ms med=42.26ms max=362.1ms  p(90)=52.25ms  p(95)=55.41ms  p(99.9)=73.74ms
     iterations.....................: 139766  1145.353689/s
     success_rate...................: 100.00% ✓ 139766      ✗ 0     
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

     checks.........................: 100.00% ✓ 409812      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 164 MB  1.3 MB/s
     http_req_blocked...............: avg=3.38µs   min=982ns   med=2.35µs  max=2.9ms    p(90)=4.88µs   p(95)=6.1µs    p(99.9)=44µs   
     http_req_connecting............: avg=399ns    min=0s      med=0s      max=2.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.64ms  min=17.39ms med=43.14ms max=318.48ms p(90)=53.08ms  p(95)=56.3ms   p(99.9)=80.11ms
       { expected_response:true }...: avg=43.64ms  min=17.39ms med=43.14ms max=318.48ms p(90)=53.08ms  p(95)=56.3ms   p(99.9)=80.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136704
     http_req_receiving.............: avg=101.51µs min=28.95µs med=61.87µs max=222.18ms p(90)=134.37µs p(95)=207.43µs p(99.9)=3.28ms 
     http_req_sending...............: avg=39.26µs  min=4.95µs  med=9.97µs  max=235.83ms p(90)=23.85µs  p(95)=109.84µs p(99.9)=2.32ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.5ms   min=17.25ms med=43.01ms max=317.61ms p(90)=52.93ms  p(95)=56.13ms  p(99.9)=79.52ms
     http_reqs......................: 136704  1120.171106/s
     iteration_duration.............: avg=43.92ms  min=18.03ms med=43.38ms max=359.96ms p(90)=53.32ms  p(95)=56.55ms  p(99.9)=80.73ms
     iterations.....................: 136604  1119.351693/s
     success_rate...................: 100.00% ✓ 136604      ✗ 0     
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

     checks.........................: 100.00% ✓ 187281     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   613 kB/s
     http_req_blocked...............: avg=5.38µs   min=1.17µs  med=3.35µs  max=4.58ms   p(90)=5.01µs   p(95)=5.69µs   p(99.9)=51.62µs 
     http_req_connecting............: avg=1.78µs   min=0s      med=0s      max=4.53ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.75ms  min=18.89ms med=92.09ms max=369.06ms p(90)=118.75ms p(95)=128.63ms p(99.9)=229.81ms
       { expected_response:true }...: avg=95.75ms  min=18.89ms med=92.09ms max=369.06ms p(90)=118.75ms p(95)=128.63ms p(99.9)=229.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62527
     http_req_receiving.............: avg=158.86µs min=33.13µs med=81.17µs max=260.18ms p(90)=118.49µs p(95)=133.85µs p(99.9)=1.39ms  
     http_req_sending...............: avg=36.82µs  min=5.6µs   med=14.59µs max=239.4ms  p(90)=21.53µs  p(95)=23.95µs  p(99.9)=774.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.55ms  min=18.77ms med=91.97ms max=262.13ms p(90)=118.63ms p(95)=128.45ms p(99.9)=226.3ms 
     http_reqs......................: 62527   510.556317/s
     iteration_duration.............: avg=96.12ms  min=24.28ms med=92.35ms max=396.13ms p(90)=118.99ms p(95)=128.9ms  p(99.9)=230.66ms
     iterations.....................: 62427   509.73978/s
     success_rate...................: 100.00% ✓ 62427      ✗ 0    
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

     checks.........................: 100.00% ✓ 133623     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   438 kB/s
     http_req_blocked...............: avg=5.9µs    min=1.22µs  med=3.37µs   max=4.11ms   p(90)=4.95µs   p(95)=5.58µs   p(99.9)=451µs   
     http_req_connecting............: avg=2.32µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=427.1µs 
     http_req_duration..............: avg=134.23ms min=20.45ms med=132.1ms  max=380.66ms p(90)=168.76ms p(95)=179.45ms p(99.9)=232.51ms
       { expected_response:true }...: avg=134.23ms min=20.45ms med=132.1ms  max=380.66ms p(90)=168.76ms p(95)=179.45ms p(99.9)=232.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44641
     http_req_receiving.............: avg=96.34µs  min=30.81µs med=85.86µs  max=168.25ms p(90)=118.92µs p(95)=131.7µs  p(99.9)=874.76µs
     http_req_sending...............: avg=30.39µs  min=5.85µs  med=16.32µs  max=171.5ms  p(90)=22.34µs  p(95)=24.38µs  p(99.9)=660.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=134.1ms  min=20.33ms med=131.97ms max=380.12ms p(90)=168.64ms p(95)=179.33ms p(99.9)=231.85ms
     http_reqs......................: 44641   364.441304/s
     iteration_duration.............: avg=134.76ms min=47.95ms med=132.41ms max=391.98ms p(90)=169.09ms p(95)=179.78ms p(99.9)=237.38ms
     iterations.....................: 44541   363.624922/s
     success_rate...................: 100.00% ✓ 44541      ✗ 0    
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

     checks.........................: 100.00% ✓ 90030      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=7.63µs   min=1.31µs  med=3.79µs   max=3.94ms   p(90)=5.44µs   p(95)=6.09µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=199.14ms min=18.83ms med=182.59ms max=599.62ms p(90)=258.63ms p(95)=398.13ms p(99.9)=531.49ms
       { expected_response:true }...: avg=199.14ms min=18.83ms med=182.59ms max=599.62ms p(90)=258.63ms p(95)=398.13ms p(99.9)=531.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30110
     http_req_receiving.............: avg=112.93µs min=36.44µs med=101.41µs max=151.82ms p(90)=135.92µs p(95)=149.56µs p(99.9)=726.22µs
     http_req_sending...............: avg=28.61µs  min=6.51µs  med=18.74µs  max=50.89ms  p(90)=24.03µs  p(95)=25.98µs  p(99.9)=618.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.99ms min=18.71ms med=182.45ms max=599.5ms  p(90)=258.45ms p(95)=397.86ms p(99.9)=531.38ms
     http_reqs......................: 30110   246.145423/s
     iteration_duration.............: avg=200.06ms min=53.28ms med=183.04ms max=599.92ms p(90)=259.09ms p(95)=399.55ms p(99.9)=531.81ms
     iterations.....................: 30010   245.327935/s
     success_rate...................: 100.00% ✓ 30010      ✗ 0    
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

     checks.........................: 100.00% ✓ 87936      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.44µs   min=1.31µs  med=3.37µs   max=4.69ms   p(90)=4.78µs   p(95)=5.36µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.79µs   min=0s      med=0s       max=4.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=203.9ms  min=20.52ms med=204.08ms max=427.66ms p(90)=227.04ms p(95)=233.49ms p(99.9)=299.34ms
       { expected_response:true }...: avg=203.9ms  min=20.52ms med=204.08ms max=427.66ms p(90)=227.04ms p(95)=233.49ms p(99.9)=299.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29412
     http_req_receiving.............: avg=103.01µs min=35.62µs med=90.86µs  max=153.04ms p(90)=123.57µs p(95)=136.05µs p(99.9)=596.05µs
     http_req_sending...............: avg=42.64µs  min=6.2µs   med=16.78µs  max=138.47ms p(90)=22.01µs  p(95)=23.94µs  p(99.9)=900.17µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.76ms min=20.4ms  med=203.96ms max=427.04ms p(90)=226.91ms p(95)=233.37ms p(99.9)=298.11ms
     http_reqs......................: 29412   239.388952/s
     iteration_duration.............: avg=204.81ms min=58.02ms med=204.42ms max=444.3ms  p(90)=227.35ms p(95)=233.83ms p(99.9)=305.59ms
     iterations.....................: 29312   238.575036/s
     success_rate...................: 100.00% ✓ 29312      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

