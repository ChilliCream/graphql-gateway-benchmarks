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
| hive-router | v0.0.49 | 1,598 | 1,617 | 1,585 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,454 | 1,469 | 1,439 | 0.6% |  |
| cosmo | 0.307.0 | 1,160 | 1,178 | 1,150 | 0.9% | non-compatible response (2 across 2/9 runs) |
| grafbase | 0.53.3 | 1,156 | 1,172 | 1,148 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 502 | 512 | 493 | 1.2% |  |
| apollo-gateway | 2.13.3 | 234 | 238 | 232 | 0.9% |  |
| hive-gateway | 2.5.25 | 232 | 238 | 231 | 1.1% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 584811      ✗ 0     
     data_received..................: 17 GB   140 MB/s
     data_sent......................: 234 MB  1.9 MB/s
     http_req_blocked...............: avg=3.12µs  min=1µs     med=2.09µs  max=4.07ms   p(90)=4.03µs   p(95)=4.89µs   p(99.9)=33.12µs
     http_req_connecting............: avg=520ns   min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.53ms min=14.05ms med=30.26ms max=329.13ms p(90)=36.24ms  p(95)=38.18ms  p(99.9)=56.66ms
       { expected_response:true }...: avg=30.53ms min=14.05ms med=30.26ms max=329.13ms p(90)=36.24ms  p(95)=38.18ms  p(99.9)=56.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195037
     http_req_receiving.............: avg=82.5µs  min=25.98µs med=49.9µs  max=78.49ms  p(90)=101.89µs p(95)=150.38µs p(99.9)=2.86ms 
     http_req_sending...............: avg=36.22µs min=5.18µs  med=9.28µs  max=299.37ms p(90)=19.57µs  p(95)=58.66µs  p(99.9)=1.89ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.41ms min=13.97ms med=30.16ms max=328.58ms p(90)=36.12ms  p(95)=38.05ms  p(99.9)=54.86ms
     http_reqs......................: 195037  1598.367954/s
     iteration_duration.............: avg=30.77ms min=14.29ms med=30.48ms max=344.82ms p(90)=36.45ms  p(95)=38.4ms   p(99.9)=57.09ms
     iterations.....................: 194937  1597.548434/s
     success_rate...................: 100.00% ✓ 194937      ✗ 0     
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

     checks.........................: 100.00% ✓ 532170      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 213 MB  1.7 MB/s
     http_req_blocked...............: avg=3.06µs   min=982ns   med=2µs      max=4.53ms   p(90)=3.73µs  p(95)=4.61µs   p(99.9)=28.55µs
     http_req_connecting............: avg=600ns    min=0s      med=0s       max=4.48ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.57ms  min=14.09ms med=32.35ms  max=484.62ms p(90)=41.13ms p(95)=44.74ms  p(99.9)=86.55ms
       { expected_response:true }...: avg=33.57ms  min=14.09ms med=32.35ms  max=484.62ms p(90)=41.13ms p(95)=44.74ms  p(99.9)=86.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 177490
     http_req_receiving.............: avg=795.02µs min=50.26µs med=111.05µs max=281.58ms p(90)=2.31ms  p(95)=3.46ms   p(99.9)=16.23ms
     http_req_sending...............: avg=37.26µs  min=5.02µs  med=8.85µs   max=182.54ms p(90)=19.39µs p(95)=105.17µs p(99.9)=2.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.73ms  min=13.97ms med=31.56ms  max=482.02ms p(90)=40.04ms p(95)=43.46ms  p(99.9)=84.23ms
     http_reqs......................: 177490  1454.820463/s
     iteration_duration.............: avg=33.81ms  min=14.33ms med=32.57ms  max=484.82ms p(90)=41.35ms p(95)=44.96ms  p(99.9)=88.41ms
     iterations.....................: 177390  1454.000799/s
     success_rate...................: 100.00% ✓ 177390      ✗ 0     
     vus............................: 22      min=0         max=50  
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

     checks.........................: 100.00% ✓ 424731      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.31µs   min=1.05µs  med=2.19µs  max=4.17ms   p(90)=3.82µs   p(95)=4.59µs   p(99.9)=36.6µs 
     http_req_connecting............: avg=719ns    min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.13ms  min=18.57ms med=41.52ms max=327.05ms p(90)=51.3ms   p(95)=54.43ms  p(99.9)=72.07ms
       { expected_response:true }...: avg=42.13ms  min=18.57ms med=41.52ms max=327.05ms p(90)=51.3ms   p(95)=54.43ms  p(99.9)=72.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141677
     http_req_receiving.............: avg=100.64µs min=27.27µs med=60.59µs max=197.42ms p(90)=105.31µs p(95)=131.83µs p(99.9)=2.14ms 
     http_req_sending...............: avg=30.69µs  min=5.09µs  med=10.29µs max=283.23ms p(90)=18.17µs  p(95)=23.16µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42ms     min=18.48ms med=41.41ms max=312.26ms p(90)=51.19ms  p(95)=54.31ms  p(99.9)=71.25ms
     http_reqs......................: 141677  1160.824111/s
     iteration_duration.............: avg=42.37ms  min=18.85ms med=41.72ms max=350.93ms p(90)=51.5ms   p(95)=54.64ms  p(99.9)=72.54ms
     iterations.....................: 141577  1160.004765/s
     success_rate...................: 100.00% ✓ 141577      ✗ 0     
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

     checks.........................: 100.00% ✓ 422958      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.58µs  min=982ns   med=2.22µs  max=4.63ms   p(90)=4.68µs   p(95)=5.79µs   p(99.9)=42.34µs
     http_req_connecting............: avg=724ns   min=0s      med=0s      max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.27ms min=16.03ms med=41.81ms max=360.09ms p(90)=51.5ms   p(95)=54.73ms  p(99.9)=78.62ms
       { expected_response:true }...: avg=42.27ms min=16.03ms med=41.81ms max=360.09ms p(90)=51.5ms   p(95)=54.73ms  p(99.9)=78.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141086
     http_req_receiving.............: avg=119.5µs min=29.25µs med=57.8µs  max=217.74ms p(90)=129.42µs p(95)=190.12µs p(99.9)=4.07ms 
     http_req_sending...............: avg=38.63µs min=4.91µs  med=9.71µs  max=255.85ms p(90)=23.15µs  p(95)=99.68µs  p(99.9)=2.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.11ms min=15.97ms med=41.69ms max=142.51ms p(90)=51.37ms  p(95)=54.56ms  p(99.9)=77.97ms
     http_reqs......................: 141086  1156.278088/s
     iteration_duration.............: avg=42.54ms min=16.23ms med=42.05ms max=370.79ms p(90)=51.74ms  p(95)=54.97ms  p(99.9)=79.17ms
     iterations.....................: 140986  1155.458533/s
     success_rate...................: 100.00% ✓ 140986      ✗ 0     
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

     checks.........................: 100.00% ✓ 184320     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   604 kB/s
     http_req_blocked...............: avg=5.05µs  min=1.1µs   med=2.73µs  max=4.67ms   p(90)=4.28µs   p(95)=4.86µs   p(99.9)=48.01µs 
     http_req_connecting............: avg=2.05µs  min=0s      med=0s      max=4.62ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.31ms min=18.55ms med=95.03ms max=346.1ms  p(90)=115.36ms p(95)=125.98ms p(99.9)=223.75ms
       { expected_response:true }...: avg=97.31ms min=18.55ms med=95.03ms max=346.1ms  p(90)=115.36ms p(95)=125.98ms p(99.9)=223.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61540
     http_req_receiving.............: avg=87.41µs min=31.63µs med=77.15µs max=90.18ms  p(90)=114.65µs p(95)=128.85µs p(99.9)=924.34µs
     http_req_sending...............: avg=26.58µs min=5.64µs  med=13.29µs max=101.49ms p(90)=19.96µs  p(95)=22.2µs   p(99.9)=766.79µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.19ms min=18.42ms med=94.93ms max=334.48ms p(90)=115.23ms p(95)=125.88ms p(99.9)=223.67ms
     http_reqs......................: 61540   502.60307/s
     iteration_duration.............: avg=97.67ms min=28.34ms med=95.28ms max=381.73ms p(90)=115.59ms p(95)=126.27ms p(99.9)=225.99ms
     iterations.....................: 61440   501.786361/s
     success_rate...................: 100.00% ✓ 61440      ✗ 0    
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

     checks.........................: 100.00% ✓ 85980      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=7.26µs   min=1.3µs   med=3.32µs   max=4.11ms   p(90)=4.67µs   p(95)=5.27µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=208.49ms min=23.25ms med=214.9ms  max=425.38ms p(90)=238.62ms p(95)=243.99ms p(99.9)=314.57ms
       { expected_response:true }...: avg=208.49ms min=23.25ms med=214.9ms  max=425.38ms p(90)=238.62ms p(95)=243.99ms p(99.9)=314.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28760
     http_req_receiving.............: avg=215.06µs min=33.05µs med=93.43µs  max=167.79ms p(90)=126.66µs p(95)=140.83µs p(99.9)=36.9ms  
     http_req_sending...............: avg=29.18µs  min=5.97µs  med=16.75µs  max=187.73ms p(90)=21.88µs  p(95)=23.85µs  p(99.9)=522.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.25ms min=23.07ms med=214.75ms max=324.64ms p(90)=238.49ms p(95)=243.86ms p(99.9)=310.14ms
     http_reqs......................: 28760   234.037799/s
     iteration_duration.............: avg=209.44ms min=36.95ms med=215.72ms max=449.02ms p(90)=238.89ms p(95)=244.3ms  p(99.9)=318.38ms
     iterations.....................: 28660   233.224038/s
     success_rate...................: 100.00% ✓ 28660      ✗ 0    
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

     checks.........................: 100.00% ✓ 85047      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=7.13µs   min=1.21µs  med=3.27µs   max=4.28ms   p(90)=4.64µs   p(95)=5.22µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=3.68µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=210.79ms min=18.93ms med=197.54ms max=587.57ms p(90)=250.39ms p(95)=415.71ms p(99.9)=527.39ms
       { expected_response:true }...: avg=210.79ms min=18.93ms med=197.54ms max=587.57ms p(90)=250.39ms p(95)=415.71ms p(99.9)=527.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28449
     http_req_receiving.............: avg=100.89µs min=32.04µs med=95.63µs  max=17.85ms  p(90)=128.06µs p(95)=142.1µs  p(99.9)=704.87µs
     http_req_sending...............: avg=28.8µs   min=5.79µs  med=17.23µs  max=75.22ms  p(90)=22.01µs  p(95)=23.93µs  p(99.9)=805.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.66ms min=18.82ms med=197.41ms max=587.43ms p(90)=250.27ms p(95)=415.57ms p(99.9)=527.24ms
     http_reqs......................: 28449   232.726602/s
     iteration_duration.............: avg=211.76ms min=54.8ms  med=198ms    max=587.82ms p(90)=250.83ms p(95)=416.31ms p(99.9)=527.71ms
     iterations.....................: 28349   231.908554/s
     success_rate...................: 100.00% ✓ 28349      ✗ 0    
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

