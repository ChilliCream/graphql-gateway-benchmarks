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
| hive-router | v0.0.49 | 1,578 | 1,609 | 1,573 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,440 | 1,457 | 1,429 | 0.6% |  |
| cosmo | 0.307.0 | 1,143 | 1,159 | 1,137 | 0.7% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.3 | 1,124 | 1,139 | 1,116 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 511 | 523 | 507 | 1.1% |  |
| apollo-router | v2.13.1 | 366 | 376 | 362 | 1.4% |  |
| hive-gateway | 2.5.25 | 244 | 246 | 241 | 0.7% |  |
| apollo-gateway | 2.13.3 | 235 | 236 | 234 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577584      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.02µs  min=971ns   med=2.24µs  max=4.89ms   p(90)=4.15µs   p(95)=5.15µs   p(99.9)=36.27µs
     http_req_connecting............: avg=235ns   min=0s      med=0s      max=2.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.91ms min=13.67ms med=30.64ms max=329.96ms p(90)=36.73ms  p(95)=38.61ms  p(99.9)=58.15ms
       { expected_response:true }...: avg=30.91ms min=13.67ms med=30.64ms max=329.96ms p(90)=36.73ms  p(95)=38.61ms  p(99.9)=58.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192628
     http_req_receiving.............: avg=84.37µs min=27.01µs med=53.24µs max=27.28ms  p(90)=104.88µs p(95)=155.98µs p(99.9)=2.63ms 
     http_req_sending...............: avg=34.09µs min=4.98µs  med=9.54µs  max=99.8ms   p(90)=19.7µs   p(95)=62.94µs  p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.8ms  min=13.6ms  med=30.53ms max=329.24ms p(90)=36.61ms  p(95)=38.48ms  p(99.9)=56.93ms
     http_reqs......................: 192628  1578.500732/s
     iteration_duration.............: avg=31.15ms min=13.88ms med=30.86ms max=358.43ms p(90)=36.94ms  p(95)=38.83ms  p(99.9)=58.66ms
     iterations.....................: 192528  1577.681276/s
     success_rate...................: 100.00% ✓ 192528      ✗ 0     
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

     checks.........................: 100.00% ✓ 526917      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.08µs   min=932ns   med=2.13µs   max=4ms      p(90)=4.01µs  p(95)=4.92µs  p(99.9)=32.62µs 
     http_req_connecting............: avg=451ns    min=0s      med=0s       max=3.47ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=33.91ms  min=14.78ms med=32.66ms  max=487.1ms  p(90)=41.41ms p(95)=45.03ms p(99.9)=179.43ms
       { expected_response:true }...: avg=33.91ms  min=14.78ms med=32.66ms  max=487.1ms  p(90)=41.41ms p(95)=45.03ms p(99.9)=179.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175739
     http_req_receiving.............: avg=808.11µs min=49.94µs med=119.04µs max=63.03ms  p(90)=2.31ms  p(95)=3.46ms  p(99.9)=14.63ms 
     http_req_sending...............: avg=35.51µs  min=5.08µs  med=9.17µs   max=95.39ms  p(90)=19.92µs p(95)=97.13µs p(99.9)=2.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=33.07ms  min=14.53ms med=31.85ms  max=486.99ms p(90)=40.33ms p(95)=43.81ms p(99.9)=175.93ms
     http_reqs......................: 175739  1440.476631/s
     iteration_duration.............: avg=34.15ms  min=15.05ms med=32.89ms  max=487.24ms p(90)=41.63ms p(95)=45.25ms p(99.9)=183.34ms
     iterations.....................: 175639  1439.656963/s
     success_rate...................: 100.00% ✓ 175639      ✗ 0     
     vus............................: 26      min=0         max=50  
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

     checks.........................: 100.00% ✓ 418440      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.61µs  min=1.04µs  med=2.48µs  max=4.55ms   p(90)=4.19µs   p(95)=4.97µs   p(99.9)=38.22µs
     http_req_connecting............: avg=744ns   min=0s      med=0s      max=4.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.77ms min=18.21ms med=42.19ms max=343.36ms p(90)=51.99ms  p(95)=55.12ms  p(99.9)=71.61ms
       { expected_response:true }...: avg=42.77ms min=18.21ms med=42.19ms max=343.36ms p(90)=51.99ms  p(95)=55.12ms  p(99.9)=71.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139580
     http_req_receiving.............: avg=86.65µs min=28.02µs med=64.61µs max=147.14ms p(90)=110.54µs p(95)=139.14µs p(99.9)=1.61ms 
     http_req_sending...............: avg=29.97µs min=5.16µs  med=10.78µs max=212.73ms p(90)=18.49µs  p(95)=23.72µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.65ms min=18.09ms med=42.08ms max=342.92ms p(90)=51.87ms  p(95)=54.98ms  p(99.9)=71.12ms
     http_reqs......................: 139580  1143.829482/s
     iteration_duration.............: avg=43.01ms min=18.41ms med=42.4ms  max=355.06ms p(90)=52.19ms  p(95)=55.32ms  p(99.9)=71.93ms
     iterations.....................: 139480  1143.010002/s
     success_rate...................: 100.00% ✓ 139480      ✗ 0     
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

     checks.........................: 100.00% ✓ 411321      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.57µs  min=952ns   med=2.19µs  max=4.13ms   p(90)=4.71µs   p(95)=5.84µs   p(99.9)=45.65µs
     http_req_connecting............: avg=745ns   min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.47ms min=16.21ms med=42.99ms max=341.81ms p(90)=52.86ms  p(95)=56.24ms  p(99.9)=80.29ms
       { expected_response:true }...: avg=43.47ms min=16.21ms med=42.99ms max=341.81ms p(90)=52.86ms  p(95)=56.24ms  p(99.9)=80.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137207
     http_req_receiving.............: avg=95.2µs  min=28.82µs med=59.05µs max=146.41ms p(90)=130.94µs p(95)=202.84µs p(99.9)=2.98ms 
     http_req_sending...............: avg=38.54µs min=5.02µs  med=9.81µs  max=119.79ms p(90)=23.85µs  p(95)=109.84µs p(99.9)=2.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.34ms min=16.09ms med=42.87ms max=341.21ms p(90)=52.71ms  p(95)=56.08ms  p(99.9)=79.62ms
     http_reqs......................: 137207  1124.680371/s
     iteration_duration.............: avg=43.75ms min=16.6ms  med=43.23ms max=360.97ms p(90)=53.09ms  p(95)=56.47ms  p(99.9)=80.94ms
     iterations.....................: 137107  1123.860675/s
     success_rate...................: 100.00% ✓ 137107      ✗ 0     
     vus............................: 23      min=0         max=50  
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

     checks.........................: 100.00% ✓ 187734     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   615 kB/s
     http_req_blocked...............: avg=5.23µs  min=1.15µs  med=2.98µs  max=4.64ms   p(90)=4.63µs   p(95)=5.29µs   p(99.9)=47.28µs 
     http_req_connecting............: avg=1.96µs  min=0s      med=0s      max=4.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.54ms min=19.32ms med=89.3ms  max=376.68ms p(90)=128.83ms p(95)=139.97ms p(99.9)=244.17ms
       { expected_response:true }...: avg=95.54ms min=19.32ms med=89.3ms  max=376.68ms p(90)=128.83ms p(95)=139.97ms p(99.9)=244.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62678
     http_req_receiving.............: avg=90.57µs min=30.53µs med=77.79µs max=98.35ms  p(90)=114.73µs p(95)=128.28µs p(99.9)=1ms     
     http_req_sending...............: avg=29.26µs min=5.42µs  med=13.57µs max=279.58ms p(90)=20.54µs  p(95)=23.06µs  p(99.9)=707.81µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.42ms min=19.17ms med=89.17ms max=350.36ms p(90)=128.7ms  p(95)=139.84ms p(99.9)=243.46ms
     http_reqs......................: 62678   511.8827/s
     iteration_duration.............: avg=95.89ms min=30.17ms med=89.59ms max=376.95ms p(90)=129.08ms p(95)=140.27ms p(99.9)=245.7ms 
     iterations.....................: 62578   511.066014/s
     success_rate...................: 100.00% ✓ 62578      ✗ 0    
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

     checks.........................: 100.00% ✓ 134505     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 54 MB   440 kB/s
     http_req_blocked...............: avg=5.76µs   min=1.12µs  med=3.39µs   max=4.23ms   p(90)=4.89µs   p(95)=5.48µs   p(99.9)=209.63µs
     http_req_connecting............: avg=2.17µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=159.29µs
     http_req_duration..............: avg=133.35ms min=20.47ms med=131.19ms max=372.23ms p(90)=166.78ms p(95)=178.28ms p(99.9)=231.55ms
       { expected_response:true }...: avg=133.35ms min=20.47ms med=131.19ms max=372.23ms p(90)=166.78ms p(95)=178.28ms p(99.9)=231.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44935
     http_req_receiving.............: avg=97.25µs  min=31.44µs med=85.26µs  max=110.64ms p(90)=118.81µs p(95)=131.77µs p(99.9)=778.08µs
     http_req_sending...............: avg=26.12µs  min=5.71µs  med=15.72µs  max=77.61ms  p(90)=21.49µs  p(95)=23.57µs  p(99.9)=608.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.23ms min=20.06ms med=131.07ms max=371.81ms p(90)=166.66ms p(95)=178.15ms p(99.9)=230.56ms
     http_reqs......................: 44935   366.798214/s
     iteration_duration.............: avg=133.87ms min=33.14ms med=131.51ms max=388.99ms p(90)=167.11ms p(95)=178.64ms p(99.9)=235.19ms
     iterations.....................: 44835   365.981928/s
     success_rate...................: 100.00% ✓ 44835      ✗ 0    
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

     checks.........................: 100.00% ✓ 89331      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=7.13µs   min=1.31µs  med=3.54µs   max=3.94ms   p(90)=5.01µs   p(95)=5.61µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.28µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=200.69ms min=17.74ms med=191.79ms max=596.2ms  p(90)=256.87ms p(95)=400ms    p(99.9)=524.26ms
       { expected_response:true }...: avg=200.69ms min=17.74ms med=191.79ms max=596.2ms  p(90)=256.87ms p(95)=400ms    p(99.9)=524.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29877
     http_req_receiving.............: avg=152.71µs min=34.43µs med=96.81µs  max=95.06ms  p(90)=130.45µs p(95)=144.2µs  p(99.9)=19.32ms 
     http_req_sending...............: avg=29.95µs  min=6.1µs   med=17.68µs  max=233.18ms p(90)=22.65µs  p(95)=24.57µs  p(99.9)=623.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.51ms min=17.57ms med=191.64ms max=596.09ms p(90)=256.69ms p(95)=399.87ms p(99.9)=524.14ms
     http_reqs......................: 29877   244.464051/s
     iteration_duration.............: avg=201.61ms min=25.8ms  med=192.32ms max=596.46ms p(90)=257.39ms p(95)=401.17ms p(99.9)=524.54ms
     iterations.....................: 29777   243.645816/s
     success_rate...................: 100.00% ✓ 29777      ✗ 0    
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

     checks.........................: 100.00% ✓ 86568      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=11.15µs  min=1.11µs  med=3.45µs   max=112.1ms  p(90)=4.83µs   p(95)=5.39µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.66µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=207.11ms min=23.62ms med=205.24ms max=430.08ms p(90)=231.67ms p(95)=238.75ms p(99.9)=307.77ms
       { expected_response:true }...: avg=207.11ms min=23.62ms med=205.24ms max=430.08ms p(90)=231.67ms p(95)=238.75ms p(99.9)=307.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28956
     http_req_receiving.............: avg=106.74µs min=30.98µs med=92.34µs  max=170.16ms p(90)=124.68µs p(95)=137.44µs p(99.9)=589.44µs
     http_req_sending...............: avg=29.66µs  min=5.51µs  med=17.1µs   max=86.07ms  p(90)=22.14µs  p(95)=24.16µs  p(99.9)=571.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.97ms min=23.5ms  med=205.11ms max=420.93ms p(90)=231.57ms p(95)=238.62ms p(99.9)=307.44ms
     http_reqs......................: 28956   235.714115/s
     iteration_duration.............: avg=208.04ms min=49.99ms med=205.59ms max=449.09ms p(90)=231.97ms p(95)=239.06ms p(99.9)=314ms   
     iterations.....................: 28856   234.900073/s
     success_rate...................: 100.00% ✓ 28856      ✗ 0    
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

