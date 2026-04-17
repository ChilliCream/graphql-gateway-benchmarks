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
| hive-router | v0.0.43 | 1,584 | 1,607 | 1,578 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,451 | 1,462 | 1,439 | 0.5% |  |
| cosmo | 0.298.0 | 1,165 | 1,182 | 1,158 | 0.7% | non-compatible response (1 across 1/9 runs) |
| grafbase | 0.53.2 | 1,125 | 1,140 | 1,118 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.14 | 590 | 604 | 570 | 1.6% |  |
| apollo-router | v2.12.1 | 374 | 382 | 355 | 2.8% |  |
| hive-gateway | 2.5.14 | 261 | 264 | 258 | 0.7% |  |
| apollo-gateway | 2.13.3 | 235 | 236 | 233 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579690      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=2.84µs  min=982ns   med=2.07µs  max=5.89ms   p(90)=3.78µs   p(95)=4.72µs  p(99.9)=29.49µs
     http_req_connecting............: avg=276ns   min=0s      med=0s      max=2.77ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.81ms min=14.06ms med=30.53ms max=338.44ms p(90)=36.67ms  p(95)=38.59ms p(99.9)=56.51ms
       { expected_response:true }...: avg=30.81ms min=14.06ms med=30.53ms max=338.44ms p(90)=36.67ms  p(95)=38.59ms p(99.9)=56.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193330
     http_req_receiving.............: avg=86.81µs min=27.87µs med=51.33µs max=292.39ms p(90)=102.06µs p(95)=146µs   p(99.9)=2.41ms 
     http_req_sending...............: avg=32.99µs min=4.98µs  med=9.11µs  max=184.4ms  p(90)=19.41µs  p(95)=35.71µs p(99.9)=1.68ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.69ms min=13.95ms med=30.42ms max=315.32ms p(90)=36.55ms  p(95)=38.46ms p(99.9)=55.45ms
     http_reqs......................: 193330  1584.987614/s
     iteration_duration.............: avg=31.04ms min=14.27ms med=30.75ms max=346.71ms p(90)=36.88ms  p(95)=38.8ms  p(99.9)=56.85ms
     iterations.....................: 193230  1584.167779/s
     success_rate...................: 100.00% ✓ 193230      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 530958      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=2.77µs  min=1µs     med=2µs      max=2.82ms   p(90)=3.63µs  p(95)=4.47µs   p(99.9)=32.23µs
     http_req_connecting............: avg=295ns   min=0s      med=0s       max=2.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.65ms min=14.81ms med=32.38ms  max=672.63ms p(90)=41.21ms p(95)=44.88ms  p(99.9)=86.8ms 
       { expected_response:true }...: avg=33.65ms min=14.81ms med=32.38ms  max=672.63ms p(90)=41.21ms p(95)=44.88ms  p(99.9)=86.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 177086
     http_req_receiving.............: avg=765.8µs min=50.16µs med=109.24µs max=178.56ms p(90)=2.18ms  p(95)=3.34ms   p(99.9)=18.73ms
     http_req_sending...............: avg=39.18µs min=4.96µs  med=8.82µs   max=207.62ms p(90)=19.31µs p(95)=104.07µs p(99.9)=2.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.84ms min=14.72ms med=31.63ms  max=671.29ms p(90)=40.14ms p(95)=43.64ms  p(99.9)=85.19ms
     http_reqs......................: 177086  1451.826085/s
     iteration_duration.............: avg=33.89ms min=15.03ms med=32.6ms   max=672.84ms p(90)=41.42ms p(95)=45.09ms  p(99.9)=89.4ms 
     iterations.....................: 176986  1451.006243/s
     success_rate...................: 100.00% ✓ 176986      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 426249      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.14µs   min=1.02µs  med=2.21µs  max=7.09ms   p(90)=3.9µs    p(95)=4.65µs   p(99.9)=36.12µs
     http_req_connecting............: avg=429ns    min=0s      med=0s      max=3.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.98ms  min=15.62ms med=41.36ms max=353.69ms p(90)=51.12ms  p(95)=54.22ms  p(99.9)=71.01ms
       { expected_response:true }...: avg=41.98ms  min=15.62ms med=41.36ms max=353.69ms p(90)=51.12ms  p(95)=54.22ms  p(99.9)=71.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142183
     http_req_receiving.............: avg=115.33µs min=27.65µs med=62.07µs max=301.56ms p(90)=107.62µs p(95)=133.52µs p(99.9)=2.29ms 
     http_req_sending...............: avg=26.85µs  min=5.08µs  med=10.16µs max=157.16ms p(90)=17.98µs  p(95)=22.87µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.84ms  min=15.52ms med=41.26ms max=282.73ms p(90)=51ms     p(95)=54.09ms  p(99.9)=69.14ms
     http_reqs......................: 142183  1165.14864/s
     iteration_duration.............: avg=42.22ms  min=15.81ms med=41.57ms max=362.69ms p(90)=51.32ms  p(95)=54.43ms  p(99.9)=71.48ms
     iterations.....................: 142083  1164.329168/s
     success_rate...................: 100.00% ✓ 142083      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 411693      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.12µs  min=1µs     med=2.22µs  max=2.82ms   p(90)=4.57µs  p(95)=5.74µs   p(99.9)=41.87µs
     http_req_connecting............: avg=266ns   min=0s      med=0s      max=1.66ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.43ms min=15.66ms med=42.92ms max=321.83ms p(90)=52.83ms p(95)=56.11ms  p(99.9)=82.32ms
       { expected_response:true }...: avg=43.43ms min=15.66ms med=42.92ms max=321.83ms p(90)=52.83ms p(95)=56.11ms  p(99.9)=82.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137331
     http_req_receiving.............: avg=94.95µs min=28.43µs med=59.06µs max=68.97ms  p(90)=129µs   p(95)=197.59µs p(99.9)=3.11ms 
     http_req_sending...............: avg=40.31µs min=5.21µs  med=9.9µs   max=248.04ms p(90)=23.19µs p(95)=105.95µs p(99.9)=2.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.3ms  min=15.59ms med=42.8ms  max=321.43ms p(90)=52.69ms p(95)=55.94ms  p(99.9)=82.03ms
     http_reqs......................: 137331  1125.494877/s
     iteration_duration.............: avg=43.71ms min=15.88ms med=43.16ms max=366.11ms p(90)=53.06ms p(95)=56.34ms  p(99.9)=82.85ms
     iterations.....................: 137231  1124.675328/s
     success_rate...................: 100.00% ✓ 137231      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 216477     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 87 MB   710 kB/s
     http_req_blocked...............: avg=4.66µs  min=1.09µs  med=2.96µs  max=4.09ms   p(90)=4.62µs  p(95)=5.29µs   p(99.9)=48.34µs 
     http_req_connecting............: avg=1.41µs  min=0s      med=0s      max=4.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=82.83ms min=18.18ms med=80.66ms max=363.42ms p(90)=98.24ms p(95)=104.89ms p(99.9)=208.12ms
       { expected_response:true }...: avg=82.83ms min=18.18ms med=80.66ms max=363.42ms p(90)=98.24ms p(95)=104.89ms p(99.9)=208.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 72259
     http_req_receiving.............: avg=85.08µs min=31.53µs med=75.84µs max=13.82ms  p(90)=113.4µs p(95)=127.99µs p(99.9)=968.6µs 
     http_req_sending...............: avg=22.44µs min=5.74µs  med=13.15µs max=62.31ms  p(90)=19.97µs p(95)=22.6µs   p(99.9)=766.09µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.72ms min=18.06ms med=80.56ms max=362.74ms p(90)=98.11ms p(95)=104.78ms p(99.9)=208.02ms
     http_reqs......................: 72259   590.725318/s
     iteration_duration.............: avg=83.16ms min=28.7ms  med=80.89ms max=383.08ms p(90)=98.47ms p(95)=105.14ms p(99.9)=209.49ms
     iterations.....................: 72159   589.907807/s
     success_rate...................: 100.00% ✓ 72159      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 137232     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   449 kB/s
     http_req_blocked...............: avg=5.75µs   min=1.21µs  med=3.32µs  max=3.96ms   p(90)=4.84µs   p(95)=5.46µs   p(99.9)=396µs   
     http_req_connecting............: avg=2.19µs   min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=334.07µs
     http_req_duration..............: avg=130.69ms min=21.01ms med=128.5ms max=381.7ms  p(90)=163.78ms p(95)=174.85ms p(99.9)=221.94ms
       { expected_response:true }...: avg=130.69ms min=21.01ms med=128.5ms max=381.7ms  p(90)=163.78ms p(95)=174.85ms p(99.9)=221.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45844
     http_req_receiving.............: avg=98.2µs   min=31.36µs med=84.55µs max=190.6ms  p(90)=118.51µs p(95)=131.85µs p(99.9)=827.65µs
     http_req_sending...............: avg=28.42µs  min=5.72µs  med=15.53µs max=138.4ms  p(90)=21.49µs  p(95)=23.62µs  p(99.9)=627.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.56ms min=20.89ms med=128.4ms max=381.03ms p(90)=163.65ms p(95)=174.72ms p(99.9)=220.62ms
     http_reqs......................: 45844   374.239813/s
     iteration_duration.............: avg=131.2ms  min=45.08ms med=128.8ms max=393.37ms p(90)=164.07ms p(95)=175.15ms p(99.9)=227.07ms
     iterations.....................: 45744   373.42348/s
     success_rate...................: 100.00% ✓ 45744      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95568      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=5.59µs   min=1.3µs   med=3.64µs   max=3.04ms   p(90)=5.2µs    p(95)=5.83µs   p(99.9)=622.84µs
     http_req_connecting............: avg=1.68µs   min=0s      med=0s       max=2.98ms   p(90)=0s       p(95)=0s       p(99.9)=587.51µs
     http_req_duration..............: avg=187.62ms min=18.79ms med=173.3ms  max=578.88ms p(90)=225.15ms p(95)=385.89ms p(99.9)=520.65ms
       { expected_response:true }...: avg=187.62ms min=18.79ms med=173.3ms  max=578.88ms p(90)=225.15ms p(95)=385.89ms p(99.9)=520.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31956
     http_req_receiving.............: avg=113.96µs min=32.85µs med=97.15µs  max=159.73ms p(90)=131.18µs p(95)=144.85µs p(99.9)=714.95µs
     http_req_sending...............: avg=32.48µs  min=6.21µs  med=17.65µs  max=132.8ms  p(90)=23µs     p(95)=24.99µs  p(99.9)=912.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.47ms min=18.66ms med=173.17ms max=578.75ms p(90)=224.97ms p(95)=385.79ms p(99.9)=520.56ms
     http_reqs......................: 31956   261.308565/s
     iteration_duration.............: avg=188.44ms min=45.51ms med=173.67ms max=579.14ms p(90)=225.62ms p(95)=386.38ms p(99.9)=520.94ms
     iterations.....................: 31856   260.490851/s
     success_rate...................: 100.00% ✓ 31856      ✗ 0    
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

     checks.........................: 100.00% ✓ 86292      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   282 kB/s
     http_req_blocked...............: avg=6.73µs   min=1.25µs  med=3.39µs   max=4.17ms   p(90)=4.8µs    p(95)=5.43µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=3.1µs    min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=207.73ms min=21.29ms med=206.07ms max=418.69ms p(90)=226.72ms p(95)=240.13ms p(99.9)=301.81ms
       { expected_response:true }...: avg=207.73ms min=21.29ms med=206.07ms max=418.69ms p(90)=226.72ms p(95)=240.13ms p(99.9)=301.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28864
     http_req_receiving.............: avg=163.8µs  min=35.75µs med=92.85µs  max=135.84ms p(90)=126.86µs p(95)=140.78µs p(99.9)=1.34ms  
     http_req_sending...............: avg=21.98µs  min=5.9µs   med=16.91µs  max=21.97ms  p(90)=22.35µs  p(95)=24.45µs  p(99.9)=510.59µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.55ms min=21.17ms med=205.94ms max=319.05ms p(90)=226.55ms p(95)=239.88ms p(99.9)=298.12ms
     http_reqs......................: 28864   235.004546/s
     iteration_duration.............: avg=208.67ms min=53.2ms  med=206.43ms max=426.82ms p(90)=227.05ms p(95)=240.55ms p(99.9)=307.1ms 
     iterations.....................: 28764   234.190367/s
     success_rate...................: 100.00% ✓ 28764      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

