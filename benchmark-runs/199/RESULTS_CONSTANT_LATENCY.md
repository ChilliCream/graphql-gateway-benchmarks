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
| hive-router | v0.0.49 | 1,580 | 1,605 | 1,569 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,442 | 1,464 | 1,431 | 0.6% |  |
| cosmo | 0.307.0 | 1,142 | 1,149 | 1,134 | 0.6% | non-compatible response (5 across 3/9 runs) |
| grafbase | 0.53.3 | 1,130 | 1,147 | 1,122 | 0.6% |  |
| hive-gateway-router-runtime | 2.5.25 | 503 | 511 | 436 | 4.5% |  |
| apollo-router | v2.13.1 | 377 | 381 | 362 | 1.7% |  |
| hive-gateway | 2.5.25 | 240 | 243 | 238 | 0.8% |  |
| apollo-gateway | 2.13.3 | 233 | 236 | 231 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578172      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.4µs   min=982ns   med=2.38µs  max=4.35ms   p(90)=4.31µs   p(95)=5.29µs   p(99.9)=36.55µs
     http_req_connecting............: avg=508ns   min=0s      med=0s      max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.88ms min=14.36ms med=30.62ms max=337.77ms p(90)=36.68ms  p(95)=38.62ms  p(99.9)=58.54ms
       { expected_response:true }...: avg=30.88ms min=14.36ms med=30.62ms max=337.77ms p(90)=36.68ms  p(95)=38.62ms  p(99.9)=58.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192824
     http_req_receiving.............: avg=87.68µs min=27.35µs med=54.15µs max=240.38ms p(90)=106.19µs p(95)=154.79µs p(99.9)=2.87ms 
     http_req_sending...............: avg=35.09µs min=5.25µs  med=9.79µs  max=128.72ms p(90)=20µs     p(95)=65.39µs  p(99.9)=1.84ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.76ms min=14.3ms  med=30.52ms max=313.66ms p(90)=36.55ms  p(95)=38.47ms  p(99.9)=57.07ms
     http_reqs......................: 192824  1580.393592/s
     iteration_duration.............: avg=31.12ms min=14.57ms med=30.85ms max=348.37ms p(90)=36.9ms   p(95)=38.84ms  p(99.9)=58.92ms
     iterations.....................: 192724  1579.573988/s
     success_rate...................: 100.00% ✓ 192724      ✗ 0     
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

     checks.........................: 100.00% ✓ 527799      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.2µs   min=962ns   med=2.12µs   max=4.49ms   p(90)=3.86µs  p(95)=4.74µs  p(99.9)=33.75µs
     http_req_connecting............: avg=612ns   min=0s      med=0s       max=4.44ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=33.85ms min=13.96ms med=32.72ms  max=482.28ms p(90)=41.63ms p(95)=45.21ms p(99.9)=87.05ms
       { expected_response:true }...: avg=33.85ms min=13.96ms med=32.72ms  max=482.28ms p(90)=41.63ms p(95)=45.21ms p(99.9)=87.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176033
     http_req_receiving.............: avg=820.9µs min=51.75µs med=117.44µs max=272.58ms p(90)=2.35ms  p(95)=3.52ms  p(99.9)=17.15ms
     http_req_sending...............: avg=38.06µs min=5.22µs  med=9.17µs   max=271.89ms p(90)=19.78µs p(95)=105.8µs p(99.9)=2.72ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=32.99ms min=13.82ms med=31.87ms  max=482.07ms p(90)=40.54ms p(95)=44.02ms p(99.9)=83.05ms
     http_reqs......................: 176033  1442.104411/s
     iteration_duration.............: avg=34.09ms min=14.28ms med=32.94ms  max=482.46ms p(90)=41.84ms p(95)=45.44ms p(99.9)=87.94ms
     iterations.....................: 175933  1441.285187/s
     success_rate...................: 100.00% ✓ 175933      ✗ 0     
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

     checks.........................: 100.00% ✓ 417864      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.7µs   min=1.07µs  med=2.53µs  max=4.21ms   p(90)=4.17µs  p(95)=4.96µs  p(99.9)=38.79µs
     http_req_connecting............: avg=745ns   min=0s      med=0s      max=4.16ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=42.83ms min=17.86ms med=42.18ms max=322.04ms p(90)=52.14ms p(95)=55.3ms  p(99.9)=72.74ms
       { expected_response:true }...: avg=42.83ms min=17.86ms med=42.18ms max=322.04ms p(90)=52.14ms p(95)=55.3ms  p(99.9)=72.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139388
     http_req_receiving.............: avg=88.16µs min=28.88µs med=63.79µs max=202.14ms p(90)=108.2µs p(95)=135.3µs p(99.9)=2.21ms 
     http_req_sending...............: avg=32.51µs min=5.35µs  med=10.9µs  max=164.03ms p(90)=18.55µs p(95)=23.93µs p(99.9)=1.45ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=42.71ms min=17.79ms med=42.08ms max=321.31ms p(90)=52.02ms p(95)=55.15ms p(99.9)=72.29ms
     http_reqs......................: 139388  1142.223756/s
     iteration_duration.............: avg=43.07ms min=20.5ms  med=42.4ms  max=354.28ms p(90)=52.35ms p(95)=55.51ms p(99.9)=73.17ms
     iterations.....................: 139288  1141.404299/s
     success_rate...................: 100.00% ✓ 139288      ✗ 0     
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

     checks.........................: 100.00% ✓ 413484      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.6µs   min=982ns   med=2.2µs   max=6.71ms   p(90)=4.64µs   p(95)=5.77µs   p(99.9)=47.24µs
     http_req_connecting............: avg=744ns   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.25ms min=16.36ms med=42.83ms max=353.57ms p(90)=52.54ms  p(95)=55.75ms  p(99.9)=82.71ms
       { expected_response:true }...: avg=43.25ms min=16.36ms med=42.83ms max=353.57ms p(90)=52.54ms  p(95)=55.75ms  p(99.9)=82.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137928
     http_req_receiving.............: avg=99.36µs min=29.38µs med=58.02µs max=280.23ms p(90)=130.88µs p(95)=210.85µs p(99.9)=3.23ms 
     http_req_sending...............: avg=40.96µs min=5.14µs  med=9.84µs  max=283.37ms p(90)=23.59µs  p(95)=111.99µs p(99.9)=2.68ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.11ms min=16.28ms med=42.71ms max=351.65ms p(90)=52.4ms   p(95)=55.58ms  p(99.9)=81.8ms 
     http_reqs......................: 137928  1130.509397/s
     iteration_duration.............: avg=43.52ms min=16.61ms med=43.07ms max=375.3ms  p(90)=52.78ms  p(95)=55.98ms  p(99.9)=83.64ms
     iterations.....................: 137828  1129.68976/s
     success_rate...................: 100.00% ✓ 137828      ✗ 0     
     vus............................: 22      min=0         max=50  
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

     checks.........................: 100.00% ✓ 184587     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   605 kB/s
     http_req_blocked...............: avg=4.98µs  min=1.11µs  med=3.07µs  max=4.18ms   p(90)=4.66µs   p(95)=5.26µs   p(99.9)=54.99µs 
     http_req_connecting............: avg=1.66µs  min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.15ms min=22.35ms med=95.25ms max=374.65ms p(90)=113.83ms p(95)=123.13ms p(99.9)=220.62ms
       { expected_response:true }...: avg=97.15ms min=22.35ms med=95.25ms max=374.65ms p(90)=113.83ms p(95)=123.13ms p(99.9)=220.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61629
     http_req_receiving.............: avg=94.96µs min=31.59µs med=77.15µs max=285.62ms p(90)=112.61µs p(95)=126.29µs p(99.9)=816.41µs
     http_req_sending...............: avg=35.75µs min=5.67µs  med=13.44µs max=249.91ms p(90)=19.81µs  p(95)=22.1µs   p(99.9)=760.14µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.02ms min=22.18ms med=95.14ms max=347.33ms p(90)=113.72ms p(95)=122.96ms p(99.9)=219.66ms
     http_reqs......................: 61629   503.433797/s
     iteration_duration.............: avg=97.52ms min=36.35ms med=95.51ms max=382.88ms p(90)=114.08ms p(95)=123.41ms p(99.9)=223.28ms
     iterations.....................: 61529   502.616919/s
     success_rate...................: 100.00% ✓ 61529      ✗ 0    
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

     checks.........................: 100.00% ✓ 138357     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 56 MB   453 kB/s
     http_req_blocked...............: avg=5.4µs    min=1.22µs  med=3.51µs   max=3.37ms   p(90)=5.06µs   p(95)=5.67µs   p(99.9)=281.52µs
     http_req_connecting............: avg=1.69µs   min=0s      med=0s       max=3.35ms   p(90)=0s       p(95)=0s       p(99.9)=251.57µs
     http_req_duration..............: avg=129.62ms min=21.24ms med=127.65ms max=359.57ms p(90)=162ms    p(95)=172.62ms p(99.9)=216.22ms
       { expected_response:true }...: avg=129.62ms min=21.24ms med=127.65ms max=359.57ms p(90)=162ms    p(95)=172.62ms p(99.9)=216.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46219
     http_req_receiving.............: avg=95.58µs  min=32.85µs med=86.68µs  max=116.46ms p(90)=119.97µs p(95)=132.26µs p(99.9)=788.99µs
     http_req_sending...............: avg=23.15µs  min=6.21µs  med=16.13µs  max=66.16ms  p(90)=21.89µs  p(95)=24.06µs  p(99.9)=956.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.5ms  min=21.09ms med=127.54ms max=358.35ms p(90)=161.89ms p(95)=172.48ms p(99.9)=215.21ms
     http_reqs......................: 46219   377.327035/s
     iteration_duration.............: avg=130.13ms min=35.63ms med=127.97ms max=379.02ms p(90)=162.29ms p(95)=172.95ms p(99.9)=219.44ms
     iterations.....................: 46119   376.510645/s
     success_rate...................: 100.00% ✓ 46119      ✗ 0    
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

     checks.........................: 100.00% ✓ 87942      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=6.98µs   min=1.27µs  med=3.77µs   max=3.94ms   p(90)=5.35µs   p(95)=5.96µs   p(99.9)=1.17ms  
     http_req_connecting............: avg=2.75µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=966.15µs
     http_req_duration..............: avg=203.87ms min=19.27ms med=190.94ms max=612.28ms p(90)=241.2ms  p(95)=403.52ms p(99.9)=518.48ms
       { expected_response:true }...: avg=203.87ms min=19.27ms med=190.94ms max=612.28ms p(90)=241.2ms  p(95)=403.52ms p(99.9)=518.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29414
     http_req_receiving.............: avg=104µs    min=35.84µs med=98.85µs  max=13.72ms  p(90)=133.33µs p(95)=147.4µs  p(99.9)=617.15µs
     http_req_sending...............: avg=36.66µs  min=6.26µs  med=18.17µs  max=107.47ms p(90)=23.46µs  p(95)=25.43µs  p(99.9)=850.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.73ms min=19.11ms med=190.81ms max=612.1ms  p(90)=241.05ms p(95)=403.39ms p(99.9)=518.38ms
     http_reqs......................: 29414   240.437446/s
     iteration_duration.............: avg=204.81ms min=52.53ms med=191.35ms max=612.58ms p(90)=241.64ms p(95)=404.4ms  p(99.9)=518.72ms
     iterations.....................: 29314   239.62002/s
     success_rate...................: 100.00% ✓ 29314      ✗ 0    
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

     checks.........................: 100.00% ✓ 85872      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   281 kB/s
     http_req_blocked...............: avg=7.55µs   min=1.29µs  med=3.67µs   max=3.99ms   p(90)=5.16µs   p(95)=5.77µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=3.5µs    min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=208.8ms  min=21.92ms med=213ms    max=468.41ms p(90)=227.13ms p(95)=233.76ms p(99.9)=308.41ms
       { expected_response:true }...: avg=208.8ms  min=21.92ms med=213ms    max=468.41ms p(90)=227.13ms p(95)=233.76ms p(99.9)=308.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28724
     http_req_receiving.............: avg=164.48µs min=34.03µs med=95.76µs  max=147.13ms p(90)=129.99µs p(95)=143.74µs p(99.9)=10.34ms 
     http_req_sending...............: avg=36.03µs  min=6.05µs  med=17.83µs  max=171.95ms p(90)=23.22µs  p(95)=25.25µs  p(99.9)=589.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.6ms  min=21.8ms  med=212.87ms max=325.88ms p(90)=226.99ms p(95)=233.63ms p(99.9)=307.63ms
     http_reqs......................: 28724   233.832726/s
     iteration_duration.............: avg=209.74ms min=51.32ms med=213.29ms max=477.42ms p(90)=227.43ms p(95)=234.16ms p(99.9)=333.82ms
     iterations.....................: 28624   233.018659/s
     success_rate...................: 100.00% ✓ 28624      ✗ 0    
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

