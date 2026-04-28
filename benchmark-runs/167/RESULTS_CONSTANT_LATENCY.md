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
| hive-router | v0.0.49 | 1,577 | 1,607 | 1,568 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,454 | 1,475 | 1,449 | 0.6% |  |
| cosmo | 0.307.0 | 1,141 | 1,157 | 1,129 | 0.8% | non-compatible response (2 across 1/9 runs) |
| grafbase | 0.53.3 | 1,137 | 1,153 | 1,122 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 497 | 510 | 492 | 1.2% |  |
| apollo-router | v2.13.1 | 396 | 405 | 392 | 1.1% |  |
| hive-gateway | 2.5.25 | 240 | 245 | 238 | 1.0% |  |
| apollo-gateway | 2.13.3 | 236 | 238 | 234 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577089      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.36µs  min=942ns   med=2.36µs  max=4.1ms    p(90)=4.24µs   p(95)=5.19µs  p(99.9)=36.26µs
     http_req_connecting............: avg=530ns   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.94ms min=14.13ms med=30.64ms max=319.89ms p(90)=36.87ms  p(95)=38.82ms p(99.9)=57.14ms
       { expected_response:true }...: avg=30.94ms min=14.13ms med=30.64ms max=319.89ms p(90)=36.87ms  p(95)=38.82ms p(99.9)=57.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192463
     http_req_receiving.............: avg=86.52µs min=27.37µs med=53.73µs max=80.69ms  p(90)=106.01µs p(95)=155.9µs p(99.9)=2.84ms 
     http_req_sending...............: avg=35.22µs min=5.13µs  med=9.87µs  max=67.02ms  p(90)=20.32µs  p(95)=73.83µs p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.82ms min=14.06ms med=30.54ms max=319.23ms p(90)=36.74ms  p(95)=38.67ms p(99.9)=55.77ms
     http_reqs......................: 192463  1577.383117/s
     iteration_duration.............: avg=31.18ms min=14.37ms med=30.87ms max=349.19ms p(90)=37.09ms  p(95)=39.04ms p(99.9)=57.63ms
     iterations.....................: 192363  1576.56354/s
     success_rate...................: 100.00% ✓ 192363      ✗ 0     
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

     checks.........................: 100.00% ✓ 532080      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=2.78µs   min=962ns   med=2.04µs   max=3.29ms   p(90)=3.71µs  p(95)=4.59µs   p(99.9)=31.33µs
     http_req_connecting............: avg=241ns    min=0s      med=0s       max=2.22ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.57ms  min=14.3ms  med=32.35ms  max=478.42ms p(90)=41.07ms p(95)=44.62ms  p(99.9)=89.72ms
       { expected_response:true }...: avg=33.57ms  min=14.3ms  med=32.35ms  max=478.42ms p(90)=41.07ms p(95)=44.62ms  p(99.9)=89.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177460
     http_req_receiving.............: avg=762.03µs min=51.48µs med=111.89µs max=293.72ms p(90)=2.17ms  p(95)=3.33ms   p(99.9)=16.28ms
     http_req_sending...............: avg=38.57µs  min=5µs     med=9.12µs   max=154.08ms p(90)=19.92µs p(95)=106.95µs p(99.9)=2.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.77ms  min=14.16ms med=31.58ms  max=465.38ms p(90)=40ms    p(95)=43.51ms  p(99.9)=84.5ms 
     http_reqs......................: 177460  1454.123549/s
     iteration_duration.............: avg=33.82ms  min=14.6ms  med=32.57ms  max=478.63ms p(90)=41.28ms p(95)=44.85ms  p(99.9)=91.12ms
     iterations.....................: 177360  1453.30414/s
     success_rate...................: 100.00% ✓ 177360      ✗ 0     
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

     checks.........................: 100.00% ✓ 417423      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.32µs  min=1.06µs  med=2.56µs  max=2.83ms   p(90)=4.22µs   p(95)=4.99µs   p(99.9)=36.23µs
     http_req_connecting............: avg=379ns   min=0s      med=0s      max=2.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.87ms min=17.68ms med=42.26ms max=324.87ms p(90)=52.22ms  p(95)=55.34ms  p(99.9)=72.54ms
       { expected_response:true }...: avg=42.87ms min=17.68ms med=42.26ms max=324.87ms p(90)=52.22ms  p(95)=55.34ms  p(99.9)=72.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139241
     http_req_receiving.............: avg=87.36µs min=28.17µs med=64.94µs max=45.21ms  p(90)=109.71µs p(95)=137.21µs p(99.9)=1.94ms 
     http_req_sending...............: avg=29.4µs  min=5.42µs  med=10.96µs max=169.6ms  p(90)=18.64µs  p(95)=23.97µs  p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.76ms min=17.56ms med=42.15ms max=304.47ms p(90)=52.09ms  p(95)=55.21ms  p(99.9)=71.91ms
     http_reqs......................: 139241  1141.068222/s
     iteration_duration.............: avg=43.11ms min=20.48ms med=42.47ms max=360.39ms p(90)=52.42ms  p(95)=55.55ms  p(99.9)=72.86ms
     iterations.....................: 139141  1140.24873/s
     success_rate...................: 100.00% ✓ 139141      ✗ 0     
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

     checks.........................: 100.00% ✓ 416016      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.66µs  min=932ns   med=2.24µs  max=4.43ms   p(90)=4.62µs   p(95)=5.73µs   p(99.9)=42.66µs
     http_req_connecting............: avg=753ns   min=0s      med=0s      max=4.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.98ms min=17.95ms med=42.57ms max=346.43ms p(90)=52.12ms  p(95)=55.36ms  p(99.9)=80.24ms
       { expected_response:true }...: avg=42.98ms min=17.95ms med=42.57ms max=346.43ms p(90)=52.12ms  p(95)=55.36ms  p(99.9)=80.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138772
     http_req_receiving.............: avg=93.63µs min=29.56µs med=59.19µs max=26.34ms  p(90)=130.15µs p(95)=194.96µs p(99.9)=2.93ms 
     http_req_sending...............: avg=35.78µs min=5.22µs  med=9.91µs  max=41.3ms   p(90)=23.55µs  p(95)=109.31µs p(99.9)=2.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.85ms min=17.86ms med=42.45ms max=346.22ms p(90)=51.97ms  p(95)=55.2ms   p(99.9)=79.97ms
     http_reqs......................: 138772  1137.312002/s
     iteration_duration.............: avg=43.25ms min=18.17ms med=42.81ms max=368.95ms p(90)=52.35ms  p(95)=55.59ms  p(99.9)=80.88ms
     iterations.....................: 138672  1136.492447/s
     success_rate...................: 100.00% ✓ 138672      ✗ 0     
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

     checks.........................: 100.00% ✓ 182481     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   597 kB/s
     http_req_blocked...............: avg=5.17µs   min=1.04µs  med=3.15µs  max=4.07ms   p(90)=4.72µs   p(95)=5.34µs   p(99.9)=52.55µs 
     http_req_connecting............: avg=1.76µs   min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.28ms  min=21.68ms med=96.4ms  max=364.26ms p(90)=115.11ms p(95)=124.36ms p(99.9)=224.74ms
       { expected_response:true }...: avg=98.28ms  min=21.68ms med=96.4ms  max=364.26ms p(90)=115.11ms p(95)=124.36ms p(99.9)=224.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60927
     http_req_receiving.............: avg=184.75µs min=32.26µs med=79.18µs max=258.13ms p(90)=114.06µs p(95)=127.17µs p(99.9)=1.34ms  
     http_req_sending...............: avg=24.8µs   min=5.88µs  med=14.03µs max=170.51ms p(90)=20.6µs   p(95)=22.82µs  p(99.9)=629.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.07ms  min=21.5ms  med=96.27ms max=239.71ms p(90)=114.94ms p(95)=124.01ms p(99.9)=220.45ms
     http_reqs......................: 60927   497.349736/s
     iteration_duration.............: avg=98.66ms  min=35.17ms med=96.64ms max=380.33ms p(90)=115.35ms p(95)=124.62ms p(99.9)=226.03ms
     iterations.....................: 60827   496.533432/s
     success_rate...................: 100.00% ✓ 60827      ✗ 0    
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

     checks.........................: 100.00% ✓ 145455     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=4.63µs   min=1.22µs  med=3.56µs   max=2.2ms    p(90)=5.14µs   p(95)=5.75µs   p(99.9)=144.03µs
     http_req_connecting............: avg=859ns    min=0s      med=0s       max=2.15ms   p(90)=0s       p(95)=0s       p(99.9)=104.57µs
     http_req_duration..............: avg=123.31ms min=22.02ms med=121.44ms max=371.81ms p(90)=153.08ms p(95)=163.1ms  p(99.9)=209.86ms
       { expected_response:true }...: avg=123.31ms min=22.02ms med=121.44ms max=371.81ms p(90)=153.08ms p(95)=163.1ms  p(99.9)=209.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48585
     http_req_receiving.............: avg=181.23µs min=32.15µs med=85.99µs  max=253.26ms p(90)=118.86µs p(95)=131.47µs p(99.9)=873.83µs
     http_req_sending...............: avg=24.51µs  min=5.6µs   med=16.62µs  max=66.43ms  p(90)=22.46µs  p(95)=24.62µs  p(99.9)=540.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.1ms  min=21.88ms med=121.3ms  max=238.09ms p(90)=152.88ms p(95)=162.85ms p(99.9)=204.42ms
     http_reqs......................: 48585   396.587644/s
     iteration_duration.............: avg=123.79ms min=48.39ms med=121.74ms max=387.79ms p(90)=153.37ms p(95)=163.4ms  p(99.9)=211.31ms
     iterations.....................: 48485   395.771368/s
     success_rate...................: 100.00% ✓ 48485      ✗ 0    
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

     checks.........................: 100.00% ✓ 87945      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=5.52µs   min=1.34µs  med=3.67µs   max=3.05ms   p(90)=5.2µs    p(95)=5.84µs   p(99.9)=553.24µs
     http_req_connecting............: avg=1.53µs   min=0s      med=0s       max=2.64ms   p(90)=0s       p(95)=0s       p(99.9)=474.89µs
     http_req_duration..............: avg=203.85ms min=19.15ms med=189.57ms max=625.36ms p(90)=249.17ms p(95)=397.27ms p(99.9)=556.04ms
       { expected_response:true }...: avg=203.85ms min=19.15ms med=189.57ms max=625.36ms p(90)=249.17ms p(95)=397.27ms p(99.9)=556.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29415
     http_req_receiving.............: avg=119.77µs min=35.08µs med=96.72µs  max=204.4ms  p(90)=129.59µs p(95)=143.3µs  p(99.9)=622.46µs
     http_req_sending...............: avg=25.46µs  min=6.46µs  med=18.09µs  max=94.17ms  p(90)=23.11µs  p(95)=24.94µs  p(99.9)=688.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.7ms  min=18.99ms med=189.44ms max=625.25ms p(90)=249.03ms p(95)=397.15ms p(99.9)=555.93ms
     http_reqs......................: 29415   240.561778/s
     iteration_duration.............: avg=204.78ms min=58.81ms med=190.06ms max=625.57ms p(90)=249.66ms p(95)=398.46ms p(99.9)=556.27ms
     iterations.....................: 29315   239.743958/s
     success_rate...................: 100.00% ✓ 29315      ✗ 0    
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

     checks.........................: 100.00% ✓ 86997      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=6.15µs   min=1.08µs  med=3.62µs   max=3.45ms   p(90)=5.15µs   p(95)=5.79µs   p(99.9)=708.06µs
     http_req_connecting............: avg=2.29µs   min=0s      med=0s       max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=675.57µs
     http_req_duration..............: avg=206.09ms min=22.83ms med=208.76ms max=379.92ms p(90)=221.15ms p(95)=228.29ms p(99.9)=290.37ms
       { expected_response:true }...: avg=206.09ms min=22.83ms med=208.76ms max=379.92ms p(90)=221.15ms p(95)=228.29ms p(99.9)=290.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29099
     http_req_receiving.............: avg=101.61µs min=31.8µs  med=95.51µs  max=23.3ms   p(90)=129.32µs p(95)=143.33µs p(99.9)=737.92µs
     http_req_sending...............: avg=31.46µs  min=5.97µs  med=17.84µs  max=143.04ms p(90)=23.28µs  p(95)=25.31µs  p(99.9)=601.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.96ms min=22.66ms med=208.64ms max=378.52ms p(90)=221.03ms p(95)=228.13ms p(99.9)=290.26ms
     http_reqs......................: 29099   236.787721/s
     iteration_duration.............: avg=207.03ms min=60.25ms med=209.05ms max=400.9ms  p(90)=221.44ms p(95)=228.66ms p(99.9)=293.08ms
     iterations.....................: 28999   235.97399/s
     success_rate...................: 100.00% ✓ 28999      ✗ 0    
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

