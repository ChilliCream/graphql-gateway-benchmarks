## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| grafbase | 0.53.3 | 2,037 | 2,063 | 1,989 | 1.4% |  |
| apollo-gateway | — | — | — | — | — | benchmark run failed |
| apollo-router | — | — | — | — | — | benchmark run failed |
| cosmo | — | — | — | — | — | benchmark run failed |
| hive-gateway | — | — | — | — | — | benchmark run failed |
| hive-gateway-router-runtime | — | — | — | — | — | benchmark run failed |
| hive-router | — | — | — | — | — | benchmark run failed |
| hotchocolate | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,411 | 2,452 | 2,394 | 1.2% |  |
| cosmo | 0.307.0 | 1,175 | 1,188 | 1,161 | 1.1% |  |
| hive-gateway-router-runtime | 2.5.25 | 519 | 519 | 519 | 0.0% |  |
| apollo-router | v2.13.1 | 396 | 396 | 396 | 0.0% |  |
| apollo-gateway | — | — | — | — | — | benchmark run failed |
| grafbase | — | — | — | — | — | benchmark run failed |
| hive-gateway | — | — | — | — | — | benchmark run failed |
| hotchocolate | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 734775      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=3.04µs   min=942ns   med=2.26µs  max=15.87ms  p(90)=3.71µs  p(95)=4.45µs   p(99.9)=39.67µs
     http_req_connecting............: avg=178ns    min=0s      med=0s      max=2.38ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.25ms  min=1.94ms  med=23.99ms max=353.65ms p(90)=29.37ms p(95)=31.9ms   p(99.9)=55.97ms
       { expected_response:true }...: avg=24.25ms  min=1.94ms  med=23.99ms max=353.65ms p(90)=29.37ms p(95)=31.9ms   p(99.9)=55.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245025
     http_req_receiving.............: avg=136.35µs min=29.12µs med=55.88µs max=258.83ms p(90)=99.81µs p(95)=214.92µs p(99.9)=11.7ms 
     http_req_sending...............: avg=47.14µs  min=5.1µs   med=9.58µs  max=56.62ms  p(90)=16.67µs p(95)=115.74µs p(99.9)=4.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.07ms  min=1.86ms  med=23.88ms max=165.72ms p(90)=29.18ms p(95)=31.58ms  p(99.9)=54.52ms
     http_reqs......................: 245025  2037.71688/s
     iteration_duration.............: avg=24.48ms  min=3.34ms  med=24.2ms  max=363.36ms p(90)=29.59ms p(95)=32.14ms  p(99.9)=56.42ms
     iterations.....................: 244925  2036.885244/s
     success_rate...................: 100.00% ✓ 244925      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 869487      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=3.32µs   min=1µs     med=2.45µs  max=9.19ms   p(90)=3.87µs   p(95)=4.62µs   p(99.9)=39.62µs
     http_req_connecting............: avg=359ns    min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.46ms  min=1.73ms  med=19.87ms max=322.57ms p(90)=28.54ms  p(95)=31.92ms  p(99.9)=55.61ms
       { expected_response:true }...: avg=20.46ms  min=1.73ms  med=19.87ms max=322.57ms p(90)=28.54ms  p(95)=31.92ms  p(99.9)=55.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289929
     http_req_receiving.............: avg=143.01µs min=28.24µs med=52.96µs max=284.31ms p(90)=102.09µs p(95)=261.32µs p(99.9)=12.34ms
     http_req_sending...............: avg=52.81µs  min=5.31µs  med=9.94µs  max=31.17ms  p(90)=18.11µs  p(95)=124.57µs p(99.9)=6.03ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.26ms  min=1.62ms  med=19.73ms max=125.06ms p(90)=28.32ms  p(95)=31.59ms  p(99.9)=54.13ms
     http_reqs......................: 289929  2411.277173/s
     iteration_duration.............: avg=20.69ms  min=3.33ms  med=20.09ms max=357.45ms p(90)=28.77ms  p(95)=32.16ms  p(99.9)=56.16ms
     iterations.....................: 289829  2410.445494/s
     success_rate...................: 100.00% ✓ 289829      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 424029      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.42µs  min=1.03µs  med=2.6µs   max=3.54ms   p(90)=4.04µs   p(95)=4.69µs   p(99.9)=36.19µs
     http_req_connecting............: avg=482ns   min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.19ms min=2.11ms  med=41.64ms max=321.74ms p(90)=59.31ms  p(95)=64.61ms  p(99.9)=91.9ms 
       { expected_response:true }...: avg=42.19ms min=2.11ms  med=41.64ms max=321.74ms p(90)=59.31ms  p(95)=64.61ms  p(99.9)=91.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141443
     http_req_receiving.............: avg=89.07µs min=29.62µs med=66.51µs max=63.73ms  p(90)=104.84µs p(95)=124.43µs p(99.9)=2.05ms 
     http_req_sending...............: avg=31.9µs  min=5.39µs  med=11.72µs max=209.58ms p(90)=18.06µs  p(95)=22.23µs  p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.07ms min=2.02ms  med=41.53ms max=321.35ms p(90)=59.19ms  p(95)=64.48ms  p(99.9)=91.43ms
     http_reqs......................: 141443  1175.844035/s
     iteration_duration.............: avg=42.44ms min=3.84ms  med=41.86ms max=352.61ms p(90)=59.53ms  p(95)=64.84ms  p(99.9)=92.39ms
     iterations.....................: 141343  1175.012714/s
     success_rate...................: 100.00% ✓ 141343      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 187689     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 75 MB   624 kB/s
     http_req_blocked...............: avg=4.39µs  min=1.21µs  med=2.88µs  max=3.54ms   p(90)=4.32µs   p(95)=4.89µs   p(99.9)=47.46µs 
     http_req_connecting............: avg=1.26µs  min=0s      med=0s      max=3.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.53ms min=4.47ms  med=92.85ms max=329.45ms p(90)=115.15ms p(95)=127.03ms p(99.9)=223.09ms
       { expected_response:true }...: avg=95.53ms min=4.47ms  med=92.85ms max=329.45ms p(90)=115.15ms p(95)=127.03ms p(99.9)=223.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62663
     http_req_receiving.............: avg=88.85µs min=31.19µs med=77.47µs max=144.91ms p(90)=110.31µs p(95)=122.68µs p(99.9)=955.88µs
     http_req_sending...............: avg=26.21µs min=5.54µs  med=13.43µs max=163.2ms  p(90)=19.51µs  p(95)=21.47µs  p(99.9)=647.07µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.41ms min=4.33ms  med=92.74ms max=324.75ms p(90)=115.05ms p(95)=126.86ms p(99.9)=222.34ms
     http_reqs......................: 62663   519.563023/s
     iteration_duration.............: avg=95.92ms min=21.14ms med=93.08ms max=339.33ms p(90)=115.42ms p(95)=127.4ms  p(99.9)=226.36ms
     iterations.....................: 62563   518.733885/s
     success_rate...................: 100.00% ✓ 62563      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 143322     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   476 kB/s
     http_req_blocked...............: avg=5.78µs   min=1.1µs   med=3.38µs   max=4.2ms    p(90)=4.8µs    p(95)=5.35µs   p(99.9)=220.14µs
     http_req_connecting............: avg=2.16µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=111.38µs
     http_req_duration..............: avg=125.1ms  min=5.85ms  med=122.61ms max=341.18ms p(90)=166.21ms p(95)=178.69ms p(99.9)=231.89ms
       { expected_response:true }...: avg=125.1ms  min=5.85ms  med=122.61ms max=341.18ms p(90)=166.21ms p(95)=178.69ms p(99.9)=231.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47874
     http_req_receiving.............: avg=177.49µs min=31.26µs med=84.41µs  max=243.37ms p(90)=114.11µs p(95)=125.15µs p(99.9)=1.27ms  
     http_req_sending...............: avg=26.44µs  min=5.67µs  med=16.22µs  max=193.32ms p(90)=21.06µs  p(95)=22.72µs  p(99.9)=579.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.9ms  min=5.71ms  med=122.5ms  max=254.99ms p(90)=165.98ms p(95)=178.39ms p(99.9)=226.48ms
     http_reqs......................: 47874   396.574955/s
     iteration_duration.............: avg=125.62ms min=15.8ms  med=122.92ms max=383.52ms p(90)=166.5ms  p(95)=179ms    p(99.9)=234.3ms 
     iterations.....................: 47774   395.746582/s
     success_rate...................: 100.00% ✓ 47774      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

