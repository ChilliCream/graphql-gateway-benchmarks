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
| hive-router | v0.0.49 | 1,579 | 1,605 | 1,572 | 0.7% |  |
| hotchocolate | 16.1.2-p.2 | 1,445 | 1,465 | 1,437 | 0.6% |  |
| cosmo | 0.307.0 | 1,167 | 1,181 | 1,158 | 0.7% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.3 | 1,132 | 1,153 | 1,126 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 513 | 524 | 510 | 0.9% |  |
| apollo-router | v2.13.1 | 395 | 404 | 392 | 1.0% |  |
| apollo-gateway | 2.13.3 | 239 | 241 | 238 | 0.6% |  |
| hive-gateway | 2.5.25 | 225 | 229 | 223 | 1.0% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577593      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=2.81µs   min=992ns   med=2.07µs  max=2.97ms   p(90)=3.78µs   p(95)=4.75µs   p(99.9)=35.05µs
     http_req_connecting............: avg=280ns    min=0s      med=0s      max=2.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.92ms  min=13.79ms med=30.65ms max=341.41ms p(90)=36.75ms  p(95)=38.73ms  p(99.9)=57.57ms
       { expected_response:true }...: avg=30.92ms  min=13.79ms med=30.65ms max=341.41ms p(90)=36.75ms  p(95)=38.73ms  p(99.9)=57.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192631
     http_req_receiving.............: avg=104.77µs min=27.16µs med=52.42µs max=241.52ms p(90)=102.45µs p(95)=146.97µs p(99.9)=2.72ms 
     http_req_sending...............: avg=32.06µs  min=5.03µs  med=9.27µs  max=49.57ms  p(90)=19.36µs  p(95)=35.56µs  p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.79ms  min=13.71ms med=30.54ms max=124.22ms p(90)=36.64ms  p(95)=38.58ms  p(99.9)=55.97ms
     http_reqs......................: 192631  1579.014324/s
     iteration_duration.............: avg=31.15ms  min=14.03ms med=30.86ms max=369.03ms p(90)=36.96ms  p(95)=38.94ms  p(99.9)=57.96ms
     iterations.....................: 192531  1578.194615/s
     success_rate...................: 100.00% ✓ 192531      ✗ 0     
     vus............................: 30      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.2-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 528927      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.04µs   min=982ns   med=2.01µs   max=3.94ms   p(90)=3.64µs  p(95)=4.55µs   p(99.9)=33.93µs 
     http_req_connecting............: avg=558ns    min=0s      med=0s       max=3.89ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=33.78ms  min=14.41ms med=32.52ms  max=481.48ms p(90)=41.35ms p(95)=44.89ms  p(99.9)=99.6ms  
       { expected_response:true }...: avg=33.78ms  min=14.41ms med=32.52ms  max=481.48ms p(90)=41.35ms p(95)=44.89ms  p(99.9)=99.6ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 176409
     http_req_receiving.............: avg=797.49µs min=48.87µs med=112.15µs max=214.06ms p(90)=2.24ms  p(95)=3.42ms   p(99.9)=16.56ms 
     http_req_sending...............: avg=38.22µs  min=5.12µs  med=8.74µs   max=237.36ms p(90)=19.08µs p(95)=100.69µs p(99.9)=2.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=32.95ms  min=14.31ms med=31.74ms  max=481.38ms p(90)=40.28ms p(95)=43.73ms  p(99.9)=92.82ms 
     http_reqs......................: 176409  1445.808549/s
     iteration_duration.............: avg=34.02ms  min=14.65ms med=32.74ms  max=481.8ms  p(90)=41.57ms p(95)=45.11ms  p(99.9)=102.15ms
     iterations.....................: 176309  1444.988971/s
     success_rate...................: 100.00% ✓ 176309      ✗ 0     
     vus............................: 39      min=0         max=50  
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

     checks.........................: 100.00% ✓ 427107      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.35µs   min=1.01µs  med=2.23µs  max=4.76ms   p(90)=3.92µs   p(95)=4.67µs   p(99.9)=34.29µs
     http_req_connecting............: avg=707ns    min=0s      med=0s      max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.91ms  min=19.35ms med=41.34ms max=341.75ms p(90)=50.96ms  p(95)=54.07ms  p(99.9)=72.9ms 
       { expected_response:true }...: avg=41.91ms  min=19.35ms med=41.34ms max=341.75ms p(90)=50.96ms  p(95)=54.07ms  p(99.9)=72.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142469
     http_req_receiving.............: avg=121.98µs min=28.4µs  med=61.72µs max=254.46ms p(90)=107.34µs p(95)=133.64µs p(99.9)=2.12ms 
     http_req_sending...............: avg=26.09µs  min=5.23µs  med=10.36µs max=63.87ms  p(90)=18.35µs  p(95)=23.08µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.76ms  min=19.25ms med=41.23ms max=163.63ms p(90)=50.85ms  p(95)=53.92ms  p(99.9)=72.07ms
     http_reqs......................: 142469  1167.531946/s
     iteration_duration.............: avg=42.13ms  min=19.59ms med=41.54ms max=350.81ms p(90)=51.16ms  p(95)=54.27ms  p(99.9)=73.31ms
     iterations.....................: 142369  1166.712448/s
     success_rate...................: 100.00% ✓ 142369      ✗ 0     
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

     checks.........................: 100.00% ✓ 414276      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.63µs  min=1µs     med=2.23µs  max=4.54ms   p(90)=4.64µs   p(95)=5.8µs   p(99.9)=45.93µs
     http_req_connecting............: avg=762ns   min=0s      med=0s      max=4.5ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=43.17ms min=15.45ms med=42.67ms max=353.73ms p(90)=52.39ms  p(95)=55.68ms p(99.9)=77.56ms
       { expected_response:true }...: avg=43.17ms min=15.45ms med=42.67ms max=353.73ms p(90)=52.39ms  p(95)=55.68ms p(99.9)=77.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138192
     http_req_receiving.............: avg=97.66µs min=29.59µs med=59.56µs max=152.68ms p(90)=132.69µs p(95)=206.2µs p(99.9)=2.98ms 
     http_req_sending...............: avg=37.99µs min=5.07µs  med=9.79µs  max=160.09ms p(90)=23.77µs  p(95)=109.4µs p(99.9)=2.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=43.04ms min=15.23ms med=42.55ms max=305.06ms p(90)=52.25ms  p(95)=55.5ms  p(99.9)=76.89ms
     http_reqs......................: 138192  1132.281939/s
     iteration_duration.............: avg=43.45ms min=15.67ms med=42.92ms max=367.38ms p(90)=52.63ms  p(95)=55.9ms  p(99.9)=78.18ms
     iterations.....................: 138092  1131.462585/s
     success_rate...................: 100.00% ✓ 138092      ✗ 0     
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

     checks.........................: 100.00% ✓ 188238     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   617 kB/s
     http_req_blocked...............: avg=5.05µs  min=1.11µs  med=3.11µs  max=4.33ms   p(90)=4.77µs   p(95)=5.45µs   p(99.9)=48.98µs 
     http_req_connecting............: avg=1.67µs  min=0s      med=0s      max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.26ms min=21.26ms med=92.84ms max=371.87ms p(90)=113.65ms p(95)=124.33ms p(99.9)=221.6ms 
       { expected_response:true }...: avg=95.26ms min=21.26ms med=92.84ms max=371.87ms p(90)=113.65ms p(95)=124.33ms p(99.9)=221.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 62846
     http_req_receiving.............: avg=88.41µs min=31.09µs med=80.06µs max=21.7ms   p(90)=116.33µs p(95)=130.51µs p(99.9)=899.52µs
     http_req_sending...............: avg=24.47µs min=5.58µs  med=14.44µs max=108.43ms p(90)=21.38µs  p(95)=23.91µs  p(99.9)=682.87µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.14ms min=21.14ms med=92.74ms max=358.47ms p(90)=113.54ms p(95)=124.18ms p(99.9)=221.31ms
     http_reqs......................: 62846   513.38304/s
     iteration_duration.............: avg=95.63ms min=29.91ms med=93.09ms max=382.75ms p(90)=113.9ms  p(95)=124.62ms p(99.9)=223.65ms
     iterations.....................: 62746   512.566149/s
     success_rate...................: 100.00% ✓ 62746      ✗ 0    
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

     checks.........................: 100.00% ✓ 144960     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   475 kB/s
     http_req_blocked...............: avg=7.09µs   min=1.22µs  med=3.33µs   max=56.81ms  p(90)=4.91µs   p(95)=5.51µs   p(99.9)=595.54µs
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=56.75ms  p(90)=0s       p(95)=0s       p(99.9)=569.7µs 
     http_req_duration..............: avg=123.72ms min=21.79ms med=121.91ms max=376.77ms p(90)=153.89ms p(95)=163.99ms p(99.9)=209.06ms
       { expected_response:true }...: avg=123.72ms min=21.79ms med=121.91ms max=376.77ms p(90)=153.89ms p(95)=163.99ms p(99.9)=209.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48420
     http_req_receiving.............: avg=97.27µs  min=31.95µs med=84.1µs   max=69.85ms  p(90)=117.28µs p(95)=130.28µs p(99.9)=770.53µs
     http_req_sending...............: avg=31.73µs  min=5.72µs  med=15.6µs   max=162.87ms p(90)=21.62µs  p(95)=23.77µs  p(99.9)=588.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.59ms min=21.64ms med=121.79ms max=376.51ms p(90)=153.76ms p(95)=163.86ms p(99.9)=208.47ms
     http_reqs......................: 48420   395.29984/s
     iteration_duration.............: avg=124.2ms  min=35.09ms med=122.2ms  max=388.31ms p(90)=154.15ms p(95)=164.27ms p(99.9)=211.67ms
     iterations.....................: 48320   394.483442/s
     success_rate...................: 100.00% ✓ 48320      ✗ 0    
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

     checks.........................: 100.00% ✓ 87912      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.28µs   min=1.28µs  med=3.52µs   max=4.09ms   p(90)=5.04µs   p(95)=5.68µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=3.53µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=203.95ms min=21.45ms med=211.31ms max=448.39ms p(90)=233.99ms p(95)=240.02ms p(99.9)=313.4ms 
       { expected_response:true }...: avg=203.95ms min=21.45ms med=211.31ms max=448.39ms p(90)=233.99ms p(95)=240.02ms p(99.9)=313.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29404
     http_req_receiving.............: avg=102.38µs min=34.52µs med=94.67µs  max=61.6ms   p(90)=128.59µs p(95)=142.24µs p(99.9)=572.17µs
     http_req_sending...............: avg=42.19µs  min=5.65µs  med=17.49µs  max=140.97ms p(90)=23.04µs  p(95)=25.07µs  p(99.9)=640.31µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.8ms  min=21.29ms med=211.19ms max=447.75ms p(90)=233.87ms p(95)=239.89ms p(99.9)=313.28ms
     http_reqs......................: 29404   239.399943/s
     iteration_duration.............: avg=204.88ms min=62.1ms  med=211.63ms max=456.01ms p(90)=234.29ms p(95)=240.37ms p(99.9)=318.91ms
     iterations.....................: 29304   238.585768/s
     success_rate...................: 100.00% ✓ 29304      ✗ 0    
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

     checks.........................: 100.00% ✓ 82362      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   270 kB/s
     http_req_blocked...............: avg=7.39µs   min=1.24µs  med=3.43µs   max=3.99ms   p(90)=4.86µs   p(95)=5.48µs   p(99.9)=1.95ms  
     http_req_connecting............: avg=3.7µs    min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=217.67ms min=19.66ms med=201.29ms max=652.82ms p(90)=265.59ms p(95)=451.94ms p(99.9)=598.11ms
       { expected_response:true }...: avg=217.67ms min=19.66ms med=201.29ms max=652.82ms p(90)=265.59ms p(95)=451.94ms p(99.9)=598.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27554
     http_req_receiving.............: avg=105.02µs min=35.43µs med=94.85µs  max=74.98ms  p(90)=127.61µs p(95)=141.73µs p(99.9)=702.88µs
     http_req_sending...............: avg=34.65µs  min=6.16µs  med=17.4µs   max=97.94ms  p(90)=22.53µs  p(95)=24.4µs   p(99.9)=618.58µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=217.53ms min=19.52ms med=201.16ms max=652.7ms  p(90)=265.48ms p(95)=451.8ms  p(99.9)=597.87ms
     http_reqs......................: 27554   225.11048/s
     iteration_duration.............: avg=218.7ms  min=62.58ms med=201.71ms max=653.05ms p(90)=266.18ms p(95)=453.04ms p(99.9)=598.43ms
     iterations.....................: 27454   224.293501/s
     success_rate...................: 100.00% ✓ 27454      ✗ 0    
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

