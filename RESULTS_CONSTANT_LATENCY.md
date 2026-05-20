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
| hive-router | v0.0.49 | 1,584 | 1,605 | 1,573 | 0.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,445 | 1,462 | 1,440 | 0.5% |  |
| cosmo | 0.307.0 | 1,138 | 1,150 | 1,134 | 0.5% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.3 | 1,131 | 1,153 | 1,124 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 514 | 525 | 511 | 0.9% |  |
| apollo-router | v2.13.1 | 392 | 395 | 388 | 0.6% |  |
| hive-gateway | 2.5.25 | 238 | 242 | 235 | 0.9% |  |
| apollo-gateway | 2.13.3 | 236 | 237 | 232 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 579864      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=2.84µs  min=1µs     med=2.09µs  max=3.13ms   p(90)=3.9µs    p(95)=4.87µs   p(99.9)=34.28µs
     http_req_connecting............: avg=285ns   min=0s      med=0s      max=3.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.79ms min=14.03ms med=30.54ms max=330.53ms p(90)=36.63ms  p(95)=38.57ms  p(99.9)=58.28ms
       { expected_response:true }...: avg=30.79ms min=14.03ms med=30.54ms max=330.53ms p(90)=36.63ms  p(95)=38.57ms  p(99.9)=58.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193388
     http_req_receiving.............: avg=83.87µs min=27.4µs  med=52.63µs max=89.05ms  p(90)=102.93µs p(95)=146.05µs p(99.9)=2.39ms 
     http_req_sending...............: avg=35.06µs min=5.14µs  med=9.25µs  max=203.9ms  p(90)=19.32µs  p(95)=33.74µs  p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.67ms min=13.97ms med=30.44ms max=329.67ms p(90)=36.51ms  p(95)=38.42ms  p(99.9)=56.74ms
     http_reqs......................: 193388  1584.778878/s
     iteration_duration.............: avg=31.03ms min=14.22ms med=30.76ms max=346.23ms p(90)=36.84ms  p(95)=38.79ms  p(99.9)=58.93ms
     iterations.....................: 193288  1583.959397/s
     success_rate...................: 100.00% ✓ 193288      ✗ 0     
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

     checks.........................: 100.00% ✓ 528840      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=2.78µs   min=971ns   med=2.01µs   max=6.38ms   p(90)=3.6µs   p(95)=4.46µs   p(99.9)=30.63µs
     http_req_connecting............: avg=265ns    min=0s      med=0s       max=2.23ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.75ms  min=13.55ms med=32.49ms  max=712.84ms p(90)=41.44ms p(95)=45.03ms  p(99.9)=85.02ms
       { expected_response:true }...: avg=33.75ms  min=13.55ms med=32.49ms  max=712.84ms p(90)=41.44ms p(95)=45.03ms  p(99.9)=85.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176380
     http_req_receiving.............: avg=789.53µs min=50.26µs med=108.21µs max=53.95ms  p(90)=2.34ms  p(95)=3.54ms   p(99.9)=15.61ms
     http_req_sending...............: avg=39.75µs  min=5µs     med=8.8µs    max=163.53ms p(90)=19.22µs p(95)=107.42µs p(99.9)=2.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.92ms  min=13.47ms med=31.69ms  max=711.5ms  p(90)=40.35ms p(95)=43.9ms   p(99.9)=84.86ms
     http_reqs......................: 176380  1445.613664/s
     iteration_duration.............: avg=34.02ms  min=13.79ms med=32.74ms  max=713.08ms p(90)=41.69ms p(95)=45.28ms  p(99.9)=87.78ms
     iterations.....................: 176280  1444.794062/s
     success_rate...................: 100.00% ✓ 176280      ✗ 0     
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

     checks.........................: 100.00% ✓ 416514      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.22µs  min=952ns   med=2.11µs  max=4.1ms    p(90)=3.61µs   p(95)=4.37µs   p(99.9)=36.59µs
     http_req_connecting............: avg=739ns   min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.97ms min=19.41ms med=42.39ms max=344.64ms p(90)=52.24ms  p(95)=55.33ms  p(99.9)=71.18ms
       { expected_response:true }...: avg=42.97ms min=19.41ms med=42.39ms max=344.64ms p(90)=52.24ms  p(95)=55.33ms  p(99.9)=71.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138938
     http_req_receiving.............: avg=81.98µs min=28.61µs med=61.88µs max=98.4ms   p(90)=104.29µs p(95)=128.91µs p(99.9)=1.49ms 
     http_req_sending...............: avg=24.29µs min=5.14µs  med=10.16µs max=71.43ms  p(90)=17.59µs  p(95)=21.98µs  p(99.9)=1.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.87ms min=19.29ms med=42.3ms  max=343.99ms p(90)=52.14ms  p(95)=55.2ms   p(99.9)=70.59ms
     http_reqs......................: 138938  1138.550437/s
     iteration_duration.............: avg=43.21ms min=21.04ms med=42.6ms  max=363.46ms p(90)=52.44ms  p(95)=55.52ms  p(99.9)=71.72ms
     iterations.....................: 138838  1137.73097/s
     success_rate...................: 100.00% ✓ 138838      ✗ 0     
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

     checks.........................: 100.00% ✓ 414024      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.56µs  min=981ns   med=2.21µs  max=3.85ms   p(90)=4.56µs   p(95)=5.73µs   p(99.9)=46.64µs
     http_req_connecting............: avg=715ns   min=0s      med=0s      max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.19ms min=14.78ms med=42.69ms max=314.34ms p(90)=52.59ms  p(95)=55.95ms  p(99.9)=78.16ms
       { expected_response:true }...: avg=43.19ms min=14.78ms med=42.69ms max=314.34ms p(90)=52.59ms  p(95)=55.95ms  p(99.9)=78.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138108
     http_req_receiving.............: avg=99.6µs  min=29.34µs med=59.9µs  max=101.35ms p(90)=132.38µs p(95)=209.35µs p(99.9)=3.05ms 
     http_req_sending...............: avg=39.75µs min=5.29µs  med=9.88µs  max=166.67ms p(90)=23.89µs  p(95)=112.22µs p(99.9)=2.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.05ms min=14.69ms med=42.56ms max=313.69ms p(90)=52.44ms  p(95)=55.76ms  p(99.9)=77.29ms
     http_reqs......................: 138108  1131.963984/s
     iteration_duration.............: avg=43.46ms min=15.01ms med=42.93ms max=372.23ms p(90)=52.83ms  p(95)=56.18ms  p(99.9)=78.69ms
     iterations.....................: 138008  1131.144362/s
     success_rate...................: 100.00% ✓ 138008      ✗ 0     
     vus............................: 42      min=0         max=50  
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

     checks.........................: 100.00% ✓ 188898     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 76 MB   618 kB/s
     http_req_blocked...............: avg=7.43µs  min=1.08µs  med=2.71µs  max=9.52ms   p(90)=4.3µs    p(95)=4.9µs    p(99.9)=63.49µs 
     http_req_connecting............: avg=4.21µs  min=0s      med=0s      max=9.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.92ms min=19.49ms med=93.03ms max=230.46ms p(90)=111.21ms p(95)=120.3ms  p(99.9)=211.75ms
       { expected_response:true }...: avg=94.92ms min=19.49ms med=93.03ms max=230.46ms p(90)=111.21ms p(95)=120.3ms  p(99.9)=211.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63066
     http_req_receiving.............: avg=83.93µs min=30.74µs med=76.23µs max=14.38ms  p(90)=112.44µs p(95)=125.61µs p(99.9)=890.72µs
     http_req_sending...............: avg=22.1µs  min=5.44µs  med=12.96µs max=77.79ms  p(90)=19.78µs  p(95)=22.06µs  p(99.9)=957.33µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.81ms min=19.27ms med=92.93ms max=230.36ms p(90)=111.1ms  p(95)=120.19ms p(99.9)=211.53ms
     http_reqs......................: 63066   514.902656/s
     iteration_duration.............: avg=95.31ms min=43.18ms med=93.27ms max=395.53ms p(90)=111.45ms p(95)=120.58ms p(99.9)=215.12ms
     iterations.....................: 62966   514.086205/s
     success_rate...................: 100.00% ✓ 62966      ✗ 0    
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

     checks.........................: 100.00% ✓ 143877     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   471 kB/s
     http_req_blocked...............: avg=5.44µs   min=1.21µs  med=3.17µs   max=3.74ms   p(90)=4.67µs   p(95)=5.28µs   p(99.9)=188.11µs
     http_req_connecting............: avg=2.08µs   min=0s      med=0s       max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=108.75µs
     http_req_duration..............: avg=124.65ms min=21.36ms med=122.68ms max=378.65ms p(90)=155.63ms p(95)=166.16ms p(99.9)=213.52ms
       { expected_response:true }...: avg=124.65ms min=21.36ms med=122.68ms max=378.65ms p(90)=155.63ms p(95)=166.16ms p(99.9)=213.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48059
     http_req_receiving.............: avg=92.01µs  min=31.29µs med=85.22µs  max=81.91ms  p(90)=118.23µs p(95)=131.35µs p(99.9)=751.69µs
     http_req_sending...............: avg=29.03µs  min=5.96µs  med=15.95µs  max=160.2ms  p(90)=21.54µs  p(95)=23.67µs  p(99.9)=744.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.53ms min=21.25ms med=122.57ms max=349.63ms p(90)=155.51ms p(95)=166.03ms p(99.9)=213.23ms
     http_reqs......................: 48059   392.303389/s
     iteration_duration.............: avg=125.14ms min=40.54ms med=122.98ms max=392.24ms p(90)=155.9ms  p(95)=166.46ms p(99.9)=216.79ms
     iterations.....................: 47959   391.487094/s
     success_rate...................: 100.00% ✓ 47959      ✗ 0    
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

     checks.........................: 100.00% ✓ 87141      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=5.73µs   min=1.24µs  med=3.32µs   max=3.92ms   p(90)=4.7µs    p(95)=5.26µs   p(99.9)=720.71µs
     http_req_connecting............: avg=2.08µs   min=0s      med=0s       max=3.31ms   p(90)=0s       p(95)=0s       p(99.9)=626.31µs
     http_req_duration..............: avg=205.74ms min=18.17ms med=193.31ms max=604.19ms p(90)=240.21ms p(95)=410.26ms p(99.9)=552.4ms 
       { expected_response:true }...: avg=205.74ms min=18.17ms med=193.31ms max=604.19ms p(90)=240.21ms p(95)=410.26ms p(99.9)=552.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29147
     http_req_receiving.............: avg=100.64µs min=32.78µs med=93.61µs  max=43.97ms  p(90)=126.75µs p(95)=140.15µs p(99.9)=565.43µs
     http_req_sending...............: avg=27.38µs  min=5.83µs  med=17µs     max=64.89ms  p(90)=22.18µs  p(95)=24.08µs  p(99.9)=579.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.61ms min=17.99ms med=193.19ms max=604.1ms  p(90)=240.08ms p(95)=410.1ms  p(99.9)=552.21ms
     http_reqs......................: 29147   238.345877/s
     iteration_duration.............: avg=206.67ms min=67.54ms med=193.73ms max=604.37ms p(90)=240.61ms p(95)=411.18ms p(99.9)=552.73ms
     iterations.....................: 29047   237.52814/s
     success_rate...................: 100.00% ✓ 29047      ✗ 0    
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

     checks.........................: 100.00% ✓ 86928      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=13.8µs   min=1.23µs  med=3.31µs   max=9.83ms   p(90)=4.72µs   p(95)=5.29µs   p(99.9)=5.66ms  
     http_req_connecting............: avg=9.89µs   min=0s      med=0s       max=9.67ms   p(90)=0s       p(95)=0s       p(99.9)=5.24ms  
     http_req_duration..............: avg=206.25ms min=21.19ms med=205.63ms max=446.24ms p(90)=219.59ms p(95)=225.64ms p(99.9)=292.42ms
       { expected_response:true }...: avg=206.25ms min=21.19ms med=205.63ms max=446.24ms p(90)=219.59ms p(95)=225.64ms p(99.9)=292.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29076
     http_req_receiving.............: avg=97.74µs  min=32.34µs med=93.02µs  max=4.15ms   p(90)=127.13µs p(95)=140.97µs p(99.9)=562.8µs 
     http_req_sending...............: avg=33.99µs  min=6.31µs  med=17.18µs  max=121.59ms p(90)=22.45µs  p(95)=24.41µs  p(99.9)=1.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.11ms min=21.03ms med=205.52ms max=445.1ms  p(90)=219.47ms p(95)=225.5ms  p(99.9)=291.68ms
     http_reqs......................: 29076   236.754667/s
     iteration_duration.............: avg=207.2ms  min=50.74ms med=205.93ms max=464.79ms p(90)=219.86ms p(95)=225.97ms p(99.9)=312.56ms
     iterations.....................: 28976   235.940406/s
     success_rate...................: 100.00% ✓ 28976      ✗ 0    
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

