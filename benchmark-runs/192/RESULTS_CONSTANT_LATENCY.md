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
| hive-router | v0.0.49 | 1,583 | 1,602 | 1,569 | 0.8% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,464 | 1,482 | 1,450 | 0.7% |  |
| cosmo | 0.307.0 | 1,162 | 1,179 | 1,158 | 0.7% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.3 | 1,127 | 1,151 | 1,117 | 1.0% |  |
| hive-gateway-router-runtime | 2.5.25 | 513 | 525 | 507 | 1.2% |  |
| apollo-router | v2.13.1 | 396 | 405 | 392 | 1.1% |  |
| hive-gateway | 2.5.25 | 241 | 245 | 239 | 0.9% |  |
| apollo-gateway | 2.13.3 | 235 | 237 | 233 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579573      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.85µs  min=992ns   med=2.07µs  max=10.2ms   p(90)=3.95µs   p(95)=4.92µs  p(99.9)=30.19µs
     http_req_connecting............: avg=1.23µs  min=0s      med=0s      max=10.01ms  p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=30.81ms min=13.55ms med=30.57ms max=249.09ms p(90)=36.58ms  p(95)=38.48ms p(99.9)=54.39ms
       { expected_response:true }...: avg=30.81ms min=13.55ms med=30.57ms max=249.09ms p(90)=36.58ms  p(95)=38.48ms p(99.9)=54.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193291
     http_req_receiving.............: avg=82.16µs min=27.23µs med=52.07µs max=37.86ms  p(90)=102.62µs p(95)=147.3µs p(99.9)=2.45ms 
     http_req_sending...............: avg=33.06µs min=5.05µs  med=9.02µs  max=161.2ms  p(90)=19.28µs  p(95)=33.4µs  p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=30.69ms min=13.46ms med=30.47ms max=247.09ms p(90)=36.46ms  p(95)=38.34ms p(99.9)=52.53ms
     http_reqs......................: 193291  1583.923077/s
     iteration_duration.............: avg=31.05ms min=13.82ms med=30.79ms max=377.74ms p(90)=36.79ms  p(95)=38.69ms p(99.9)=54.79ms
     iterations.....................: 193191  1583.103627/s
     success_rate...................: 100.00% ✓ 193191      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 535749      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 215 MB  1.8 MB/s
     http_req_blocked...............: avg=2.91µs   min=972ns   med=2.09µs   max=8ms      p(90)=3.91µs  p(95)=4.8µs   p(99.9)=33.26µs
     http_req_connecting............: avg=303ns    min=0s      med=0s       max=2.86ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=33.34ms  min=13.87ms med=32.37ms  max=492.09ms p(90)=40.75ms p(95)=43.67ms p(99.9)=96.48ms
       { expected_response:true }...: avg=33.34ms  min=13.87ms med=32.37ms  max=492.09ms p(90)=40.75ms p(95)=43.67ms p(99.9)=96.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178683
     http_req_receiving.............: avg=779.16µs min=50.03µs med=111.82µs max=120.57ms p(90)=2.24ms  p(95)=3.43ms  p(99.9)=17.05ms
     http_req_sending...............: avg=37.58µs  min=5.09µs  med=9.13µs   max=101.56ms p(90)=20.21µs p(95)=106.5µs p(99.9)=2.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=32.53ms  min=13.78ms med=31.59ms  max=491.97ms p(90)=39.67ms p(95)=42.44ms p(99.9)=95.58ms
     http_reqs......................: 178683  1464.519976/s
     iteration_duration.............: avg=33.59ms  min=14.07ms med=32.59ms  max=492.27ms p(90)=40.98ms p(95)=43.89ms p(99.9)=97.17ms
     iterations.....................: 178583  1463.700357/s
     success_rate...................: 100.00% ✓ 178583      ✗ 0     
     vus............................: 47      min=0         max=50  
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

     checks.........................: 100.00% ✓ 425436      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.44µs  min=1.03µs  med=2.33µs  max=3.75ms   p(90)=4.06µs   p(95)=4.85µs   p(99.9)=37.28µs
     http_req_connecting............: avg=711ns   min=0s      med=0s      max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.06ms min=18.69ms med=41.45ms max=328.42ms p(90)=51.18ms  p(95)=54.33ms  p(99.9)=71.78ms
       { expected_response:true }...: avg=42.06ms min=18.69ms med=41.45ms max=328.42ms p(90)=51.18ms  p(95)=54.33ms  p(99.9)=71.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141912
     http_req_receiving.............: avg=82.54µs min=27.91µs med=62.08µs max=29.71ms  p(90)=107.92µs p(95)=134.81µs p(99.9)=1.45ms 
     http_req_sending...............: avg=28.17µs min=5.1µs   med=10.49µs max=233.02ms p(90)=18.76µs  p(95)=23.79µs  p(99.9)=1.25ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.95ms min=18.63ms med=41.35ms max=327.89ms p(90)=51.05ms  p(95)=54.21ms  p(99.9)=71.16ms
     http_reqs......................: 141912  1162.971863/s
     iteration_duration.............: avg=42.3ms  min=18.9ms  med=41.66ms max=365.24ms p(90)=51.39ms  p(95)=54.53ms  p(99.9)=72.37ms
     iterations.....................: 141812  1162.152361/s
     success_rate...................: 100.00% ✓ 141812      ✗ 0     
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

     checks.........................: 100.00% ✓ 412329      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.4µs    min=982ns   med=2.19µs  max=3.3ms    p(90)=4.61µs   p(95)=5.8µs    p(99.9)=45.32µs
     http_req_connecting............: avg=590ns    min=0s      med=0s      max=3.27ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.37ms  min=16.99ms med=42.98ms max=353.55ms p(90)=52.67ms  p(95)=55.86ms  p(99.9)=80.76ms
       { expected_response:true }...: avg=43.37ms  min=16.99ms med=42.98ms max=353.55ms p(90)=52.67ms  p(95)=55.86ms  p(99.9)=80.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137543
     http_req_receiving.............: avg=122.18µs min=29.02µs med=58.92µs max=223.83ms p(90)=130.41µs p(95)=204.32µs p(99.9)=3.56ms 
     http_req_sending...............: avg=37.01µs  min=5.05µs  med=9.7µs   max=207.01ms p(90)=23.56µs  p(95)=109.36µs p(99.9)=2.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.22ms  min=16.85ms med=42.87ms max=133.36ms p(90)=52.52ms  p(95)=55.69ms  p(99.9)=80.11ms
     http_reqs......................: 137543  1127.299188/s
     iteration_duration.............: avg=43.64ms  min=17.5ms  med=43.23ms max=369.74ms p(90)=52.89ms  p(95)=56.08ms  p(99.9)=81.28ms
     iterations.....................: 137443  1126.47959/s
     success_rate...................: 100.00% ✓ 137443      ✗ 0     
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

     checks.........................: 100.00% ✓ 188430     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   617 kB/s
     http_req_blocked...............: avg=5.17µs  min=1.1µs   med=3.16µs  max=4.48ms   p(90)=4.82µs   p(95)=5.49µs   p(99.9)=49.72µs 
     http_req_connecting............: avg=1.76µs  min=0s      med=0s      max=4.44ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.17ms min=19.52ms med=92.95ms max=375.44ms p(90)=112.59ms p(95)=122.92ms p(99.9)=223.14ms
       { expected_response:true }...: avg=95.17ms min=19.52ms med=92.95ms max=375.44ms p(90)=112.59ms p(95)=122.92ms p(99.9)=223.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62910
     http_req_receiving.............: avg=89.45µs min=31.52µs med=80.11µs max=54.57ms  p(90)=116.49µs p(95)=130.96µs p(99.9)=929.51µs
     http_req_sending...............: avg=23.57µs min=5.51µs  med=14.15µs max=115.97ms p(90)=20.95µs  p(95)=23.4µs   p(99.9)=709.35µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.05ms min=19.34ms med=92.85ms max=375.17ms p(90)=112.49ms p(95)=122.84ms p(99.9)=223.05ms
     http_reqs......................: 62910   513.875869/s
     iteration_duration.............: avg=95.54ms min=28.85ms med=93.2ms  max=386.19ms p(90)=112.86ms p(95)=123.29ms p(99.9)=224.7ms 
     iterations.....................: 62810   513.059026/s
     success_rate...................: 100.00% ✓ 62810      ✗ 0    
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

     checks.........................: 100.00% ✓ 145263     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=5.33µs   min=1.12µs  med=3.4µs    max=3.82ms   p(90)=5.02µs   p(95)=5.65µs   p(99.9)=184.46µs
     http_req_connecting............: avg=1.69µs   min=0s      med=0s       max=3.79ms   p(90)=0s       p(95)=0s       p(99.9)=108.38µs
     http_req_duration..............: avg=123.46ms min=19.8ms  med=121.43ms max=363ms    p(90)=154.15ms p(95)=164.21ms p(99.9)=211.92ms
       { expected_response:true }...: avg=123.46ms min=19.8ms  med=121.43ms max=363ms    p(90)=154.15ms p(95)=164.21ms p(99.9)=211.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48521
     http_req_receiving.............: avg=93.31µs  min=30.92µs med=84.32µs  max=168.62ms p(90)=117.99µs p(95)=131.07µs p(99.9)=707.41µs
     http_req_sending...............: avg=34.73µs  min=5.64µs  med=15.89µs  max=197.04ms p(90)=21.91µs  p(95)=24.06µs  p(99.9)=787.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.33ms min=19.62ms med=121.32ms max=362.76ms p(90)=154.02ms p(95)=164.1ms  p(99.9)=210.83ms
     http_reqs......................: 48521   396.104592/s
     iteration_duration.............: avg=123.95ms min=41.3ms  med=121.73ms max=379.16ms p(90)=154.43ms p(95)=164.52ms p(99.9)=220.07ms
     iterations.....................: 48421   395.288235/s
     success_rate...................: 100.00% ✓ 48421      ✗ 0    
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

     checks.........................: 100.00% ✓ 88245      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.22µs   min=1.26µs  med=3.46µs   max=4.29ms   p(90)=4.91µs   p(95)=5.49µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=1.59ms  
     http_req_duration..............: avg=203.17ms min=18.89ms med=189.41ms max=642.89ms p(90)=247.31ms p(95)=387.94ms p(99.9)=553.26ms
       { expected_response:true }...: avg=203.17ms min=18.89ms med=189.41ms max=642.89ms p(90)=247.31ms p(95)=387.94ms p(99.9)=553.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29515
     http_req_receiving.............: avg=147.5µs  min=34.82µs med=93.73µs  max=186.56ms p(90)=127.33µs p(95)=141.14µs p(99.9)=984.4µs 
     http_req_sending...............: avg=30.24µs  min=5.93µs  med=17.07µs  max=104.71ms p(90)=22.42µs  p(95)=24.3µs   p(99.9)=577.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.99ms min=18.76ms med=189.22ms max=642.75ms p(90)=247.09ms p(95)=387.82ms p(99.9)=553.15ms
     http_reqs......................: 29515   241.503371/s
     iteration_duration.............: avg=204.1ms  min=51.55ms med=189.86ms max=643.16ms p(90)=247.76ms p(95)=391.38ms p(99.9)=553.48ms
     iterations.....................: 29415   240.685132/s
     success_rate...................: 100.00% ✓ 29415      ✗ 0    
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

     checks.........................: 100.00% ✓ 86478      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   283 kB/s
     http_req_blocked...............: avg=8.1µs    min=1.2µs   med=3.37µs   max=4.85ms   p(90)=4.77µs   p(95)=5.37µs   p(99.9)=2.34ms  
     http_req_connecting............: avg=4.52µs   min=0s      med=0s       max=4.8ms    p(90)=0s       p(95)=0s       p(99.9)=2.32ms  
     http_req_duration..............: avg=207.37ms min=23.54ms med=198.37ms max=422.31ms p(90)=269.77ms p(95)=275.57ms p(99.9)=344.21ms
       { expected_response:true }...: avg=207.37ms min=23.54ms med=198.37ms max=422.31ms p(90)=269.77ms p(95)=275.57ms p(99.9)=344.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28926
     http_req_receiving.............: avg=101.2µs  min=32.12µs med=91.26µs  max=108.54ms p(90)=124.59µs p(95)=137.12µs p(99.9)=639.6µs 
     http_req_sending...............: avg=30.77µs  min=5.88µs  med=16.42µs  max=136.67ms p(90)=21.9µs   p(95)=23.93µs  p(99.9)=689.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.24ms min=23.4ms  med=198.16ms max=420.89ms p(90)=269.64ms p(95)=275.45ms p(99.9)=344.11ms
     http_reqs......................: 28926   235.430557/s
     iteration_duration.............: avg=208.29ms min=44.49ms med=201.56ms max=432.39ms p(90)=270.09ms p(95)=275.89ms p(99.9)=346.02ms
     iterations.....................: 28826   234.616651/s
     success_rate...................: 100.00% ✓ 28826      ✗ 0    
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

