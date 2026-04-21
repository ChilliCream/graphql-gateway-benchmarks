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
| hive-router | v0.0.49 | 1,578 | 1,605 | 1,570 | 0.7% |  |
| hotchocolate | 16.1.0-p.1.7 | 1,461 | 1,478 | 1,455 | 0.5% |  |
| cosmo | 0.307.0 | 1,134 | 1,151 | 1,126 | 0.7% | non-compatible response (3 across 2/9 runs) |
| grafbase | 0.53.3 | 1,123 | 1,147 | 1,116 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 509 | 520 | 507 | 0.8% |  |
| apollo-router | v2.13.1 | 394 | 403 | 391 | 1.0% |  |
| hive-gateway | 2.5.25 | 249 | 252 | 245 | 0.9% |  |
| apollo-gateway | 2.13.3 | 239 | 240 | 237 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 577548      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 231 MB  1.9 MB/s
     http_req_blocked...............: avg=3.13µs  min=982ns   med=2.15µs  max=4ms      p(90)=3.97µs   p(95)=4.95µs   p(99.9)=30.89µs
     http_req_connecting............: avg=511ns   min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.92ms min=13.01ms med=30.65ms max=325.48ms p(90)=36.74ms  p(95)=38.69ms  p(99.9)=57.02ms
       { expected_response:true }...: avg=30.92ms min=13.01ms med=30.65ms max=325.48ms p(90)=36.74ms  p(95)=38.69ms  p(99.9)=57.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192616
     http_req_receiving.............: avg=83.66µs min=27.45µs med=52.57µs max=187.72ms p(90)=102.59µs p(95)=145.44µs p(99.9)=2.28ms 
     http_req_sending...............: avg=34.97µs min=5.04µs  med=9.19µs  max=170.32ms p(90)=19.44µs  p(95)=34.03µs  p(99.9)=1.91ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.8ms  min=12.91ms med=30.55ms max=324.85ms p(90)=36.62ms  p(95)=38.54ms  p(99.9)=55.72ms
     http_reqs......................: 192616  1578.8245/s
     iteration_duration.............: avg=31.15ms min=13.17ms med=30.87ms max=359.61ms p(90)=36.95ms  p(95)=38.91ms  p(99.9)=57.49ms
     iterations.....................: 192516  1578.004826/s
     success_rate...................: 100.00% ✓ 192516      ✗ 0     
     vus............................: 26      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 535122      ✗ 0     
     data_received..................: 16 GB   128 MB/s
     data_sent......................: 214 MB  1.8 MB/s
     http_req_blocked...............: avg=3.27µs   min=992ns   med=2.31µs   max=10.75ms  p(90)=4.06µs  p(95)=4.96µs   p(99.9)=31.61µs
     http_req_connecting............: avg=423ns    min=0s      med=0s       max=3.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.38ms  min=13.7ms  med=32.25ms  max=461.7ms  p(90)=40.84ms p(95)=44.34ms  p(99.9)=88.71ms
       { expected_response:true }...: avg=33.38ms  min=13.7ms  med=32.25ms  max=461.7ms  p(90)=40.84ms p(95)=44.34ms  p(99.9)=88.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 178474
     http_req_receiving.............: avg=757.51µs min=50.7µs  med=110.65µs max=33.47ms  p(90)=2.22ms  p(95)=3.37ms   p(99.9)=16.02ms
     http_req_sending...............: avg=36.82µs  min=5.18µs  med=9.34µs   max=86.64ms  p(90)=20.29µs p(95)=107.15µs p(99.9)=2.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.58ms  min=13.61ms med=31.46ms  max=461.6ms  p(90)=39.79ms p(95)=43.16ms  p(99.9)=87.72ms
     http_reqs......................: 178474  1461.976549/s
     iteration_duration.............: avg=33.62ms  min=13.9ms  med=32.47ms  max=461.89ms p(90)=41.06ms p(95)=44.57ms  p(99.9)=95.53ms
     iterations.....................: 178374  1461.157395/s
     success_rate...................: 100.00% ✓ 178374      ✗ 0     
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

     checks.........................: 100.00% ✓ 414942      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs  min=1.06µs  med=2.62µs  max=3.94ms   p(90)=4.25µs   p(95)=5.04µs   p(99.9)=39.77µs
     http_req_connecting............: avg=712ns   min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.14ms min=19.18ms med=42.51ms max=332.82ms p(90)=52.51ms  p(95)=55.71ms  p(99.9)=73.72ms
       { expected_response:true }...: avg=43.14ms min=19.18ms med=42.51ms max=332.82ms p(90)=52.51ms  p(95)=55.71ms  p(99.9)=73.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138414
     http_req_receiving.............: avg=86.61µs min=29.35µs med=64.93µs max=28.29ms  p(90)=108.34µs p(95)=133.55µs p(99.9)=1.93ms 
     http_req_sending...............: avg=27.54µs min=5.26µs  med=10.98µs max=270.49ms p(90)=18.48µs  p(95)=23.32µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.02ms min=19.11ms med=42.41ms max=331.74ms p(90)=52.39ms  p(95)=55.57ms  p(99.9)=73.31ms
     http_reqs......................: 138414  1134.210902/s
     iteration_duration.............: avg=43.37ms min=19.43ms med=42.72ms max=371.56ms p(90)=52.71ms  p(95)=55.92ms  p(99.9)=74.14ms
     iterations.....................: 138314  1133.391468/s
     success_rate...................: 100.00% ✓ 138314      ✗ 0     
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

     checks.........................: 100.00% ✓ 411030      ✗ 0     
     data_received..................: 12 GB   98 MB/s
     data_sent......................: 165 MB  1.4 MB/s
     http_req_blocked...............: avg=3.74µs  min=981ns   med=2.31µs  max=9.14ms   p(90)=4.81µs   p(95)=5.98µs   p(99.9)=43.64µs
     http_req_connecting............: avg=727ns   min=0s      med=0s      max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.5ms  min=15.66ms med=43.02ms max=336.8ms  p(90)=52.8ms   p(95)=56.05ms  p(99.9)=80.51ms
       { expected_response:true }...: avg=43.5ms  min=15.66ms med=43.02ms max=336.8ms  p(90)=52.8ms   p(95)=56.05ms  p(99.9)=80.51ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137110
     http_req_receiving.............: avg=97.07µs min=30.02µs med=60.94µs max=159.66ms p(90)=132.16µs p(95)=200.74µs p(99.9)=2.84ms 
     http_req_sending...............: avg=36.17µs min=5.19µs  med=10.06µs max=91.54ms  p(90)=24.37µs  p(95)=108.09µs p(99.9)=2.02ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.37ms min=15.59ms med=42.9ms  max=336.19ms p(90)=52.65ms  p(95)=55.88ms  p(99.9)=80.27ms
     http_reqs......................: 137110  1123.74977/s
     iteration_duration.............: avg=43.78ms min=15.89ms med=43.26ms max=371.86ms p(90)=53.04ms  p(95)=56.27ms  p(99.9)=81.07ms
     iterations.....................: 137010  1122.930173/s
     success_rate...................: 100.00% ✓ 137010      ✗ 0     
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

     checks.........................: 100.00% ✓ 187053     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   612 kB/s
     http_req_blocked...............: avg=4.61µs  min=1.23µs  med=3.25µs  max=3.3ms    p(90)=4.88µs   p(95)=5.56µs   p(99.9)=50.44µs 
     http_req_connecting............: avg=1.12µs  min=0s      med=0s      max=3.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.86ms min=19.45ms med=93.65ms max=372.69ms p(90)=113.3ms  p(95)=123.05ms p(99.9)=220.51ms
       { expected_response:true }...: avg=95.86ms min=19.45ms med=93.65ms max=372.69ms p(90)=113.3ms  p(95)=123.05ms p(99.9)=220.51ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62451
     http_req_receiving.............: avg=91.45µs min=32.88µs med=79.7µs  max=135.77ms p(90)=116.14µs p(95)=130.9µs  p(99.9)=942.86µs
     http_req_sending...............: avg=29.34µs min=5.55µs  med=14.5µs  max=204.15ms p(90)=21.42µs  p(95)=23.74µs  p(99.9)=875.49µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.74ms min=19.28ms med=93.54ms max=344.54ms p(90)=113.17ms p(95)=122.9ms  p(99.9)=219.79ms
     http_reqs......................: 62451   509.860871/s
     iteration_duration.............: avg=96.25ms min=39.63ms med=93.89ms max=383.62ms p(90)=113.54ms p(95)=123.37ms p(99.9)=223.22ms
     iterations.....................: 62351   509.044454/s
     success_rate...................: 100.00% ✓ 62351      ✗ 0    
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

     checks.........................: 100.00% ✓ 144741     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   474 kB/s
     http_req_blocked...............: avg=5.89µs   min=1.16µs  med=3.43µs   max=4.87ms   p(90)=5.04µs   p(95)=5.69µs   p(99.9)=207µs   
     http_req_connecting............: avg=2.23µs   min=0s      med=0s       max=4.82ms   p(90)=0s       p(95)=0s       p(99.9)=163.15µs
     http_req_duration..............: avg=123.93ms min=18.51ms med=122.11ms max=379.31ms p(90)=154.53ms p(95)=164.68ms p(99.9)=211.82ms
       { expected_response:true }...: avg=123.93ms min=18.51ms med=122.11ms max=379.31ms p(90)=154.53ms p(95)=164.68ms p(99.9)=211.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48347
     http_req_receiving.............: avg=190.07µs min=29.5µs  med=85.78µs  max=248.39ms p(90)=119.66µs p(95)=133.1µs  p(99.9)=1.89ms  
     http_req_sending...............: avg=27.39µs  min=5.86µs  med=16.16µs  max=233.93ms p(90)=22.23µs  p(95)=24.38µs  p(99.9)=666.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.71ms min=18.3ms  med=121.99ms max=233.33ms p(90)=154.29ms p(95)=164.38ms p(99.9)=205.13ms
     http_reqs......................: 48347   394.773112/s
     iteration_duration.............: avg=124.4ms  min=35.28ms med=122.41ms max=395.27ms p(90)=154.8ms  p(95)=164.96ms p(99.9)=213.48ms
     iterations.....................: 48247   393.956571/s
     success_rate...................: 100.00% ✓ 48247      ✗ 0    
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

     checks.........................: 100.00% ✓ 91101      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   299 kB/s
     http_req_blocked...............: avg=11µs     min=1.25µs  med=3.81µs   max=6.83ms   p(90)=5.48µs   p(95)=6.16µs   p(99.9)=3.8ms   
     http_req_connecting............: avg=6.9µs    min=0s      med=0s       max=6.79ms   p(90)=0s       p(95)=0s       p(99.9)=3.73ms  
     http_req_duration..............: avg=196.83ms min=18.54ms med=184.84ms max=626.04ms p(90)=242.89ms p(95)=374.02ms p(99.9)=558.21ms
       { expected_response:true }...: avg=196.83ms min=18.54ms med=184.84ms max=626.04ms p(90)=242.89ms p(95)=374.02ms p(99.9)=558.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30467
     http_req_receiving.............: avg=105.35µs min=35.33µs med=99.26µs  max=21.9ms   p(90)=133.19µs p(95)=147.14µs p(99.9)=885.03µs
     http_req_sending...............: avg=33.08µs  min=6.02µs  med=18.68µs  max=129.24ms p(90)=24.01µs  p(95)=25.95µs  p(99.9)=3.67ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.69ms min=18.36ms med=184.71ms max=625.91ms p(90)=242.75ms p(95)=373.93ms p(99.9)=558.08ms
     http_reqs......................: 30467   249.11324/s
     iteration_duration.............: avg=197.74ms min=54.1ms  med=185.3ms  max=626.34ms p(90)=243.28ms p(95)=379.02ms p(99.9)=558.44ms
     iterations.....................: 30367   248.295591/s
     success_rate...................: 100.00% ✓ 30367      ✗ 0    
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

     checks.........................: 100.00% ✓ 87918      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.32µs   min=1.26µs  med=3.7µs    max=4.18ms   p(90)=5.26µs   p(95)=5.84µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=3.39µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=203.91ms min=23.54ms med=209.1ms  max=421.71ms p(90)=220.18ms p(95)=225.45ms p(99.9)=296.8ms 
       { expected_response:true }...: avg=203.91ms min=23.54ms med=209.1ms  max=421.71ms p(90)=220.18ms p(95)=225.45ms p(99.9)=296.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29406
     http_req_receiving.............: avg=101.84µs min=34.7µs  med=94.74µs  max=50.49ms  p(90)=129.44µs p(95)=143.13µs p(99.9)=636.09µs
     http_req_sending...............: avg=37.55µs  min=6.08µs  med=18.03µs  max=97.69ms  p(90)=23.6µs   p(95)=25.57µs  p(99.9)=585.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.77ms min=23.42ms med=208.97ms max=421ms    p(90)=220.05ms p(95)=225.28ms p(99.9)=296.67ms
     http_reqs......................: 29406   239.296643/s
     iteration_duration.............: avg=204.85ms min=57.78ms med=209.38ms max=453.64ms p(90)=220.48ms p(95)=225.8ms  p(99.9)=307.4ms 
     iterations.....................: 29306   238.482875/s
     success_rate...................: 100.00% ✓ 29306      ✗ 0    
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

