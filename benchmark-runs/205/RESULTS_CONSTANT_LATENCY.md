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
| hive-router | v0.0.49 | 1,591 | 1,606 | 1,575 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,459 | 1,466 | 1,453 | 0.3% |  |
| cosmo | 0.307.0 | 1,142 | 1,156 | 1,132 | 0.7% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.3 | 1,124 | 1,145 | 1,114 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 506 | 519 | 500 | 1.3% |  |
| apollo-router | v2.13.1 | 396 | 405 | 392 | 1.1% |  |
| apollo-gateway | 2.13.3 | 236 | 240 | 234 | 0.9% |  |
| hive-gateway | 2.5.25 | 227 | 230 | 225 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 582369      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.52µs  min=1.01µs  med=2.47µs  max=4.91ms   p(90)=4.39µs   p(95)=5.39µs   p(99.9)=37.78µs
     http_req_connecting............: avg=544ns   min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.66ms min=14.03ms med=30.41ms max=339.39ms p(90)=36.39ms  p(95)=38.29ms  p(99.9)=56.21ms
       { expected_response:true }...: avg=30.66ms min=14.03ms med=30.41ms max=339.39ms p(90)=36.39ms  p(95)=38.29ms  p(99.9)=56.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194223
     http_req_receiving.............: avg=85.33µs min=27.38µs med=54.18µs max=75.63ms  p(90)=105.69µs p(95)=152.82µs p(99.9)=2.52ms 
     http_req_sending...............: avg=34.57µs min=5.26µs  med=9.87µs  max=61.91ms  p(90)=20.1µs   p(95)=49.95µs  p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.54ms min=13.91ms med=30.3ms  max=338.78ms p(90)=36.27ms  p(95)=38.14ms  p(99.9)=55.06ms
     http_reqs......................: 194223  1591.913559/s
     iteration_duration.............: avg=30.9ms  min=14.22ms med=30.63ms max=351.36ms p(90)=36.61ms  p(95)=38.51ms  p(99.9)=56.64ms
     iterations.....................: 194123  1591.093927/s
     success_rate...................: 100.00% ✓ 194123      ✗ 0     
     vus............................: 47      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 534000      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.11µs   min=931ns   med=2.01µs   max=4.39ms   p(90)=3.75µs  p(95)=4.65µs   p(99.9)=31.21µs
     http_req_connecting............: avg=616ns    min=0s      med=0s       max=4.35ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.46ms  min=14.18ms med=32.42ms  max=529.65ms p(90)=41ms    p(95)=44.3ms   p(99.9)=82.81ms
       { expected_response:true }...: avg=33.46ms  min=14.18ms med=32.42ms  max=529.65ms p(90)=41ms    p(95)=44.3ms   p(99.9)=82.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178100
     http_req_receiving.............: avg=820.31µs min=50.97µs med=111.39µs max=280.43ms p(90)=2.3ms   p(95)=3.42ms   p(99.9)=20.29ms
     http_req_sending...............: avg=35.09µs  min=4.94µs  med=8.77µs   max=47.45ms  p(90)=19.55µs p(95)=100.55µs p(99.9)=2.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.6ms   min=14.02ms med=31.61ms  max=527.93ms p(90)=39.94ms p(95)=43.08ms  p(99.9)=81.53ms
     http_reqs......................: 178100  1459.997497/s
     iteration_duration.............: avg=33.7ms   min=14.4ms  med=32.64ms  max=529.85ms p(90)=41.22ms p(95)=44.53ms  p(99.9)=83.47ms
     iterations.....................: 178000  1459.177734/s
     success_rate...................: 100.00% ✓ 178000      ✗ 0     
     vus............................: 1       min=0         max=50  
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

     checks.........................: 100.00% ✓ 418098      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.25µs  min=1.09µs  med=2.13µs  max=4.04ms   p(90)=3.6µs    p(95)=4.4µs    p(99.9)=37.03µs
     http_req_connecting............: avg=758ns   min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.79ms min=19.46ms med=42.2ms  max=333.17ms p(90)=52ms     p(95)=55.11ms  p(99.9)=72.7ms 
       { expected_response:true }...: avg=42.79ms min=19.46ms med=42.2ms  max=333.17ms p(90)=52ms     p(95)=55.11ms  p(99.9)=72.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 139466
     http_req_receiving.............: avg=81.53µs min=27.8µs  med=60.1µs  max=87.71ms  p(90)=102.69µs p(95)=127.68µs p(99.9)=1.82ms 
     http_req_sending...............: avg=26.08µs min=5µs     med=9.96µs  max=59.6ms   p(90)=17.16µs  p(95)=21.98µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.68ms min=19.33ms med=42.1ms  max=332.56ms p(90)=51.89ms  p(95)=54.99ms  p(99.9)=72.27ms
     http_reqs......................: 139466  1142.935582/s
     iteration_duration.............: avg=43.04ms min=20.52ms med=42.42ms max=361.99ms p(90)=52.22ms  p(95)=55.33ms  p(99.9)=73.28ms
     iterations.....................: 139366  1142.116073/s
     success_rate...................: 100.00% ✓ 139366      ✗ 0     
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

     checks.........................: 100.00% ✓ 411276      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.57µs  min=1µs     med=2.2µs   max=4.41ms   p(90)=4.6µs   p(95)=5.8µs    p(99.9)=39.98µs
     http_req_connecting............: avg=724ns   min=0s      med=0s      max=4.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.49ms min=16.92ms med=43ms    max=347.51ms p(90)=52.86ms p(95)=56.19ms  p(99.9)=79.85ms
       { expected_response:true }...: avg=43.49ms min=16.92ms med=43ms    max=347.51ms p(90)=52.86ms p(95)=56.19ms  p(99.9)=79.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137192
     http_req_receiving.............: avg=127.5µs min=28.95µs med=59.56µs max=224.15ms p(90)=129.7µs p(95)=198.01µs p(99.9)=3.89ms 
     http_req_sending...............: avg=36µs    min=4.99µs  med=9.72µs  max=101.43ms p(90)=23.56µs p(95)=108.19µs p(99.9)=2.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.32ms min=16.87ms med=42.88ms max=133.66ms p(90)=52.71ms p(95)=56.03ms  p(99.9)=78.85ms
     http_reqs......................: 137192  1124.44219/s
     iteration_duration.............: avg=43.76ms min=17.13ms med=43.24ms max=360.28ms p(90)=53.1ms  p(95)=56.44ms  p(99.9)=80.69ms
     iterations.....................: 137092  1123.622578/s
     success_rate...................: 100.00% ✓ 137092      ✗ 0     
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

     checks.........................: 100.00% ✓ 185988     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 75 MB   609 kB/s
     http_req_blocked...............: avg=5.04µs  min=1.13µs  med=3.03µs  max=4.66ms   p(90)=4.62µs   p(95)=5.26µs   p(99.9)=53.26µs 
     http_req_connecting............: avg=1.74µs  min=0s      med=0s      max=4.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.45ms min=19.26ms med=93.18ms max=363.21ms p(90)=119.77ms p(95)=130.75ms p(99.9)=231.86ms
       { expected_response:true }...: avg=96.45ms min=19.26ms med=93.18ms max=363.21ms p(90)=119.77ms p(95)=130.75ms p(99.9)=231.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62096
     http_req_receiving.............: avg=83.8µs  min=30.24µs med=76.25µs max=7.3ms    p(90)=111.25µs p(95)=124.11µs p(99.9)=858.25µs
     http_req_sending...............: avg=23.73µs min=5.71µs  med=13.63µs max=95.1ms   p(90)=20.24µs  p(95)=22.57µs  p(99.9)=619.63µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.34ms min=19.1ms  med=93.08ms max=362.93ms p(90)=119.65ms p(95)=130.62ms p(99.9)=231.75ms
     http_reqs......................: 62096   506.997896/s
     iteration_duration.............: avg=96.8ms  min=25.52ms med=93.43ms max=375.6ms  p(90)=120ms    p(95)=131.04ms p(99.9)=232.84ms
     iterations.....................: 61996   506.181422/s
     success_rate...................: 100.00% ✓ 61996      ✗ 0    
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

     checks.........................: 100.00% ✓ 145242     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=4.6µs    min=1.18µs  med=3.38µs   max=2.92ms   p(90)=4.99µs   p(95)=5.63µs   p(99.9)=167.49µs
     http_req_connecting............: avg=928ns    min=0s      med=0s       max=2.44ms   p(90)=0s       p(95)=0s       p(99.9)=83.27µs 
     http_req_duration..............: avg=123.4ms  min=19.86ms med=121.68ms max=229.96ms p(90)=153.31ms p(95)=163.46ms p(99.9)=203.68ms
       { expected_response:true }...: avg=123.4ms  min=19.86ms med=121.68ms max=229.96ms p(90)=153.31ms p(95)=163.46ms p(99.9)=203.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48514
     http_req_receiving.............: avg=92.52µs  min=30.73µs med=85.44µs  max=76.27ms  p(90)=118.56µs p(95)=131.28µs p(99.9)=765.21µs
     http_req_sending...............: avg=24.82µs  min=5.8µs   med=16.56µs  max=67.72ms  p(90)=22.32µs  p(95)=24.45µs  p(99.9)=630.4µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.28ms min=19.67ms med=121.56ms max=229.82ms p(90)=153.2ms  p(95)=163.34ms p(99.9)=203.57ms
     http_reqs......................: 48514   396.148246/s
     iteration_duration.............: avg=123.95ms min=36.29ms med=121.99ms max=388.27ms p(90)=153.71ms p(95)=163.92ms p(99.9)=209.98ms
     iterations.....................: 48414   395.331681/s
     success_rate...................: 100.00% ✓ 48414      ✗ 0    
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

     checks.........................: 100.00% ✓ 86739      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=7.41µs   min=1.18µs  med=3.32µs   max=4.44ms   p(90)=4.71µs   p(95)=5.28µs   p(99.9)=1.87ms  
     http_req_connecting............: avg=3.89µs   min=0s      med=0s       max=4.39ms   p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=206.72ms min=23.53ms med=206.44ms max=449.79ms p(90)=221.41ms p(95)=227.25ms p(99.9)=299.96ms
       { expected_response:true }...: avg=206.72ms min=23.53ms med=206.44ms max=449.79ms p(90)=221.41ms p(95)=227.25ms p(99.9)=299.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29013
     http_req_receiving.............: avg=100.7µs  min=34.01µs med=89.8µs   max=85.91ms  p(90)=123.2µs  p(95)=136.5µs  p(99.9)=866.57µs
     http_req_sending...............: avg=33.17µs  min=5.62µs  med=16.44µs  max=175.98ms p(90)=21.79µs  p(95)=23.78µs  p(99.9)=614.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.58ms min=23.37ms med=206.33ms max=449.35ms p(90)=221.29ms p(95)=227.14ms p(99.9)=299.73ms
     http_reqs......................: 29013   236.145351/s
     iteration_duration.............: avg=207.65ms min=51.95ms med=206.78ms max=471.34ms p(90)=221.68ms p(95)=227.56ms p(99.9)=319.02ms
     iterations.....................: 28913   235.331422/s
     success_rate...................: 100.00% ✓ 28913      ✗ 0    
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

     checks.........................: 100.00% ✓ 83250      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   273 kB/s
     http_req_blocked...............: avg=7.51µs   min=1.31µs  med=3.48µs   max=4.38ms   p(90)=4.9µs    p(95)=5.49µs   p(99.9)=1.72ms  
     http_req_connecting............: avg=3.82µs   min=0s      med=0s       max=4.34ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=215.35ms min=19.4ms  med=194.09ms max=707.66ms p(90)=282.84ms p(95)=470.41ms p(99.9)=600.09ms
       { expected_response:true }...: avg=215.35ms min=19.4ms  med=194.09ms max=707.66ms p(90)=282.84ms p(95)=470.41ms p(99.9)=600.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27850
     http_req_receiving.............: avg=100.78µs min=33.25µs med=94.4µs   max=29.81ms  p(90)=126.55µs p(95)=140.58µs p(99.9)=641.06µs
     http_req_sending...............: avg=33.79µs  min=6.21µs  med=17.77µs  max=99.97ms  p(90)=22.79µs  p(95)=24.63µs  p(99.9)=546.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.22ms min=19.24ms med=193.97ms max=707.55ms p(90)=282.73ms p(95)=470.32ms p(99.9)=599.96ms
     http_reqs......................: 27850   227.508644/s
     iteration_duration.............: avg=216.35ms min=40.23ms med=194.66ms max=707.87ms p(90)=283.36ms p(95)=471.11ms p(99.9)=600.55ms
     iterations.....................: 27750   226.691737/s
     success_rate...................: 100.00% ✓ 27750      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

