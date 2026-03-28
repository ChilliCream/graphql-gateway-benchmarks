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
| hive-router | v0.0.42 | 1,588 | 1,608 | 1,581 | 0.6% |  |
| hotchocolate | 16.0.0-rc.1.19 | 1,425 | 1,440 | 1,416 | 0.5% |  |
| cosmo | 0.295.0 | 1,166 | 1,176 | 1,159 | 0.6% | non-compatible response (7 across 4/9 runs) |
| grafbase | 0.53.2 | 1,137 | 1,154 | 1,129 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.11 | 570 | 586 | 567 | 1.1% |  |
| apollo-router | v2.12.0 | 397 | 405 | 394 | 0.9% |  |
| hive-gateway | 2.5.11 | 253 | 258 | 250 | 1.0% |  |
| apollo-gateway | 2.13.3 | 237 | 240 | 236 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 581181      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.19µs  min=952ns   med=2.09µs  max=4.07ms   p(90)=4.1µs    p(95)=5.09µs   p(99.9)=31.12µs
     http_req_connecting............: avg=576ns   min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.72ms min=13.89ms med=30.47ms max=309.62ms p(90)=36.47ms  p(95)=38.4ms   p(99.9)=57.69ms
       { expected_response:true }...: avg=30.72ms min=13.89ms med=30.47ms max=309.62ms p(90)=36.47ms  p(95)=38.4ms   p(99.9)=57.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193827
     http_req_receiving.............: avg=83.84µs min=27.7µs  med=52.57µs max=144.42ms p(90)=104.59µs p(95)=151.85µs p(99.9)=2.27ms 
     http_req_sending...............: avg=33.44µs min=5.08µs  med=9.2µs   max=134.1ms  p(90)=19.62µs  p(95)=49.59µs  p(99.9)=1.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.61ms min=13.6ms  med=30.36ms max=295.98ms p(90)=36.35ms  p(95)=38.26ms  p(99.9)=55.9ms 
     http_reqs......................: 193827  1588.347916/s
     iteration_duration.............: avg=30.96ms min=14.19ms med=30.68ms max=329.72ms p(90)=36.69ms  p(95)=38.61ms  p(99.9)=58.1ms 
     iterations.....................: 193727  1587.528449/s
     success_rate...................: 100.00% ✓ 193727      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.19)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 521343      ✗ 0     
     data_received..................: 15 GB   125 MB/s
     data_sent......................: 209 MB  1.7 MB/s
     http_req_blocked...............: avg=3.2µs    min=982ns   med=2.07µs   max=4.52ms   p(90)=3.88µs  p(95)=4.77µs   p(99.9)=33.13µs
     http_req_connecting............: avg=623ns    min=0s      med=0s       max=4.48ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=34.27ms  min=14.34ms med=33.04ms  max=675.16ms p(90)=41.96ms p(95)=45.47ms  p(99.9)=88.53ms
       { expected_response:true }...: avg=34.27ms  min=14.34ms med=33.04ms  max=675.16ms p(90)=41.96ms p(95)=45.47ms  p(99.9)=88.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173881
     http_req_receiving.............: avg=753.83µs min=50.87µs med=112.69µs max=202.85ms p(90)=2.18ms  p(95)=3.29ms   p(99.9)=15.54ms
     http_req_sending...............: avg=35.4µs   min=5.12µs  med=9.04µs   max=159.62ms p(90)=20.03µs p(95)=106.05µs p(99.9)=1.93ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.48ms  min=14.15ms med=32.25ms  max=675.08ms p(90)=40.93ms p(95)=44.42ms  p(99.9)=85.46ms
     http_reqs......................: 173881  1425.167106/s
     iteration_duration.............: avg=34.52ms  min=14.62ms med=33.26ms  max=675.36ms p(90)=42.17ms p(95)=45.69ms  p(99.9)=94.4ms 
     iterations.....................: 173781  1424.347484/s
     success_rate...................: 100.00% ✓ 173781      ✗ 0     
     vus............................: 34      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 426723      ✗ 0     
     data_received..................: 13 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.3µs   min=1.01µs  med=2.13µs  max=4.2ms    p(90)=3.79µs   p(95)=4.59µs   p(99.9)=37.63µs
     http_req_connecting............: avg=771ns   min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.94ms min=15.91ms med=41.35ms max=336.45ms p(90)=51.01ms  p(95)=54.04ms  p(99.9)=71.93ms
       { expected_response:true }...: avg=41.94ms min=15.91ms med=41.35ms max=336.45ms p(90)=51.01ms  p(95)=54.04ms  p(99.9)=71.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142341
     http_req_receiving.............: avg=83.26µs min=28.3µs  med=61.57µs max=26.71ms  p(90)=107.64µs p(95)=134.14µs p(99.9)=1.73ms 
     http_req_sending...............: avg=26.95µs min=5.03µs  med=10.09µs max=198.25ms p(90)=17.92µs  p(95)=22.88µs  p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.83ms min=15.76ms med=41.24ms max=336.04ms p(90)=50.89ms  p(95)=53.92ms  p(99.9)=71.52ms
     http_reqs......................: 142341  1166.404864/s
     iteration_duration.............: avg=42.18ms min=18.56ms med=41.55ms max=354.65ms p(90)=51.2ms   p(95)=54.24ms  p(99.9)=72.65ms
     iterations.....................: 142241  1165.58542/s
     success_rate...................: 100.00% ✓ 142241      ✗ 0     
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

     checks.........................: 100.00% ✓ 415962      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.59µs  min=952ns   med=2.19µs  max=4.15ms   p(90)=4.64µs   p(95)=5.83µs   p(99.9)=46.05µs
     http_req_connecting............: avg=741ns   min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43ms    min=17.5ms  med=42.52ms max=344.66ms p(90)=52.42ms  p(95)=55.61ms  p(99.9)=80.55ms
       { expected_response:true }...: avg=43ms    min=17.5ms  med=42.52ms max=344.66ms p(90)=52.42ms  p(95)=55.61ms  p(99.9)=80.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138754
     http_req_receiving.............: avg=94µs    min=29.04µs med=58.6µs  max=27.43ms  p(90)=130.33µs p(95)=209.3µs  p(99.9)=2.76ms 
     http_req_sending...............: avg=36.48µs min=5.02µs  med=9.71µs  max=120.89ms p(90)=23.29µs  p(95)=111.58µs p(99.9)=2.05ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.87ms min=17.35ms med=42.4ms  max=343.68ms p(90)=52.29ms  p(95)=55.44ms  p(99.9)=80.06ms
     http_reqs......................: 138754  1137.171662/s
     iteration_duration.............: avg=43.26ms min=17.78ms med=42.76ms max=373.56ms p(90)=52.65ms  p(95)=55.84ms  p(99.9)=81.76ms
     iterations.....................: 138654  1136.352102/s
     success_rate...................: 100.00% ✓ 138654      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 209454     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 84 MB   686 kB/s
     http_req_blocked...............: avg=4.94µs  min=1.15µs  med=2.99µs  max=4.73ms   p(90)=4.61µs   p(95)=5.23µs   p(99.9)=50.01µs 
     http_req_connecting............: avg=1.68µs  min=0s      med=0s      max=4.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.61ms min=21.87ms med=82.22ms max=346.1ms  p(90)=108.48ms p(95)=118.46ms p(99.9)=215.35ms
       { expected_response:true }...: avg=85.61ms min=21.87ms med=82.22ms max=346.1ms  p(90)=108.48ms p(95)=118.46ms p(99.9)=215.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69918
     http_req_receiving.............: avg=88.94µs min=31.34µs med=77.29µs max=174.14ms p(90)=112.9µs  p(95)=126.53µs p(99.9)=919.77µs
     http_req_sending...............: avg=22.91µs min=5.52µs  med=13.53µs max=67.75ms  p(90)=19.75µs  p(95)=22.09µs  p(99.9)=733.56µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.5ms  min=21.71ms med=82.12ms max=345.44ms p(90)=108.38ms p(95)=118.34ms p(99.9)=215.06ms
     http_reqs......................: 69918   570.892325/s
     iteration_duration.............: avg=85.94ms min=23.9ms  med=82.46ms max=361.67ms p(90)=108.73ms p(95)=118.72ms p(99.9)=217.4ms 
     iterations.....................: 69818   570.075808/s
     success_rate...................: 100.00% ✓ 69818      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 145845     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   478 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.11µs  med=3.27µs   max=4.04ms   p(90)=4.85µs   p(95)=5.46µs   p(99.9)=157.62µs
     http_req_connecting............: avg=2.12µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=91.3µs  
     http_req_duration..............: avg=122.95ms min=19.69ms med=121.16ms max=374.87ms p(90)=152.74ms p(95)=163.08ms p(99.9)=205.13ms
       { expected_response:true }...: avg=122.95ms min=19.69ms med=121.16ms max=374.87ms p(90)=152.74ms p(95)=163.08ms p(99.9)=205.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48715
     http_req_receiving.............: avg=91.37µs  min=30.55µs med=84.31µs  max=73.24ms  p(90)=117.8µs  p(95)=130.48µs p(99.9)=715.06µs
     http_req_sending...............: avg=29.95µs  min=5.57µs  med=15.54µs  max=154.74ms p(90)=21.62µs  p(95)=23.83µs  p(99.9)=676.56µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.83ms min=19.56ms med=121.06ms max=374.16ms p(90)=152.63ms p(95)=162.93ms p(99.9)=204.65ms
     http_reqs......................: 48715   397.727847/s
     iteration_duration.............: avg=123.44ms min=26.66ms med=121.47ms max=395.83ms p(90)=153.04ms p(95)=163.42ms p(99.9)=209.11ms
     iterations.....................: 48615   396.911409/s
     success_rate...................: 100.00% ✓ 48615      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 92760      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.27µs  med=3.51µs   max=4.27ms   p(90)=4.99µs   p(95)=5.64µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=3.39µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=193.33ms min=18.89ms med=179.95ms max=596.44ms p(90)=226.2ms  p(95)=396.1ms  p(99.9)=545.9ms 
       { expected_response:true }...: avg=193.33ms min=18.89ms med=179.95ms max=596.44ms p(90)=226.2ms  p(95)=396.1ms  p(99.9)=545.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31020
     http_req_receiving.............: avg=190.14µs min=35.75µs med=93.35µs  max=201.94ms p(90)=125.99µs p(95)=139.04µs p(99.9)=8.07ms  
     http_req_sending...............: avg=37.78µs  min=6.16µs  med=17.07µs  max=227.58ms p(90)=22.43µs  p(95)=24.38µs  p(99.9)=538.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.1ms  min=18.76ms med=179.83ms max=596.34ms p(90)=225.93ms p(95)=395.87ms p(99.9)=545.79ms
     http_reqs......................: 31020   253.759519/s
     iteration_duration.............: avg=194.18ms min=43.42ms med=180.33ms max=596.69ms p(90)=226.58ms p(95)=397.4ms  p(99.9)=546.33ms
     iterations.....................: 30920   252.941468/s
     success_rate...................: 100.00% ✓ 30920      ✗ 0    
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

     checks.........................: 100.00% ✓ 87189      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=6.82µs   min=1.22µs  med=3.57µs   max=4.07ms   p(90)=5.06µs   p(95)=5.67µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=205.66ms min=21.24ms med=229.01ms max=410.42ms p(90)=250.34ms p(95)=256.77ms p(99.9)=333.34ms
       { expected_response:true }...: avg=205.66ms min=21.24ms med=229.01ms max=410.42ms p(90)=250.34ms p(95)=256.77ms p(99.9)=333.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29163
     http_req_receiving.............: avg=102.03µs min=34.47µs med=95.56µs  max=54.69ms  p(90)=129.51µs p(95)=143µs    p(99.9)=574.26µs
     http_req_sending...............: avg=29.19µs  min=6.31µs  med=17.45µs  max=74.5ms   p(90)=22.88µs  p(95)=24.92µs  p(99.9)=851.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.53ms min=21.07ms med=228.89ms max=409.43ms p(90)=250.22ms p(95)=256.64ms p(99.9)=333.23ms
     http_reqs......................: 29163   237.421997/s
     iteration_duration.............: avg=206.58ms min=40.06ms med=229.32ms max=429.2ms  p(90)=250.63ms p(95)=257.08ms p(99.9)=336.52ms
     iterations.....................: 29063   236.607877/s
     success_rate...................: 100.00% ✓ 29063      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

