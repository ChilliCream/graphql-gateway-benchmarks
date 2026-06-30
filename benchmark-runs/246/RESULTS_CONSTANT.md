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
| hive-router | v0.0.74 | 2,835 | 3,005 | 2,787 | 2.6% |  |
| fusion-nightly | 16.4.0-p.9 | 2,220 | 2,281 | 2,208 | 1.0% |  |
| fusion | 16.3.0 | 2,127 | 2,187 | 2,112 | 1.2% |  |
| grafbase | 0.53.5 | 2,058 | 2,119 | 2,045 | 1.2% |  |
| cosmo | 0.326.1 | 1,193 | 1,213 | 1,187 | 0.7% |  |
| hive-gateway-router-runtime | 2.10.0 | 558 | 571 | 555 | 1.0% |  |
| apollo-router | v2.15.1 | 443 | 454 | 440 | 1.2% |  |
| hive-gateway | 2.10.0 | 245 | 249 | 242 | 0.9% |  |
| apollo-gateway | 2.14.2 | 244 | 247 | 243 | 0.6% |  |
| feddi | 77271dc84a06 | — | — | — | — | non-compatible response (1608 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,260 | 2,377 | 2,231 | 2.2% |  |
| fusion-nightly | 16.4.0-p.9 | 2,062 | 2,111 | 2,042 | 1.1% |  |
| fusion | 16.3.0 | 1,992 | 2,038 | 1,975 | 1.1% |  |
| grafbase | 0.53.5 | 1,495 | 1,524 | 1,479 | 1.1% |  |
| cosmo | 0.326.1 | 1,093 | 1,117 | 1,086 | 1.0% |  |
| hive-gateway-router-runtime | 2.10.0 | 524 | 540 | 518 | 1.3% |  |
| apollo-router | v2.15.1 | 411 | 422 | 406 | 1.2% |  |
| apollo-gateway | 2.14.2 | 234 | 237 | 232 | 0.7% |  |
| hive-gateway | 2.10.0 | 234 | 239 | 232 | 1.2% |  |
| feddi | 77271dc84a06 | 15 | 16 | 15 | 2.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1022142     ✗ 0     
     data_received..................: 30 GB   249 MB/s
     data_sent......................: 410 MB  3.4 MB/s
     http_req_blocked...............: avg=3.35µs  min=1.05µs  med=2.41µs  max=25.2ms   p(90)=3.61µs   p(95)=4.25µs   p(99.9)=36.07µs
     http_req_connecting............: avg=305ns   min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.37ms min=1.64ms  med=16.56ms max=315.42ms p(90)=25.69ms  p(95)=29.29ms  p(99.9)=51.64ms
       { expected_response:true }...: avg=17.37ms min=1.64ms  med=16.56ms max=315.42ms p(90)=25.69ms  p(95)=29.29ms  p(99.9)=51.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 340814
     http_req_receiving.............: avg=125.7µs min=27.47µs med=52.81µs max=159.23ms p(90)=102.41µs p(95)=277.97µs p(99.9)=10.62ms
     http_req_sending...............: avg=60.83µs min=5.05µs  med=9.64µs  max=255.55ms p(90)=16.57µs  p(95)=125.81µs p(99.9)=8.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.18ms min=1.59ms  med=16.4ms  max=309.77ms p(90)=25.44ms  p(95)=28.94ms  p(99.9)=50.2ms 
     http_reqs......................: 340814  2835.345576/s
     iteration_duration.............: avg=17.6ms  min=2.13ms  med=16.76ms max=346.34ms p(90)=25.92ms  p(95)=29.54ms  p(99.9)=52.86ms
     iterations.....................: 340714  2834.513643/s
     success_rate...................: 100.00% ✓ 340714      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 800778      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=3.25µs  min=912ns   med=2.33µs   max=15.07ms  p(90)=3.55µs  p(95)=4.19µs   p(99.9)=35.02µs 
     http_req_connecting............: avg=377ns   min=0s      med=0s       max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.22ms min=2.29ms  med=18.91ms  max=318.94ms p(90)=38.15ms p(95)=47.87ms  p(99.9)=113.31ms
       { expected_response:true }...: avg=22.22ms min=2.29ms  med=18.91ms  max=318.94ms p(90)=38.15ms p(95)=47.87ms  p(99.9)=113.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267026
     http_req_receiving.............: avg=1.05ms  min=51.95µs med=332.03µs max=297.2ms  p(90)=2.15ms  p(95)=3.23ms   p(99.9)=39.77ms 
     http_req_sending...............: avg=45.19µs min=5.08µs  med=9.59µs   max=101.92ms p(90)=17.39µs p(95)=114.83µs p(99.9)=3.58ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.12ms min=2.15ms  med=17.84ms  max=318.24ms p(90)=36.58ms p(95)=46.03ms  p(99.9)=110.79ms
     http_reqs......................: 267026  2220.269945/s
     iteration_duration.............: avg=22.46ms min=2.97ms  med=19.14ms  max=344.28ms p(90)=38.4ms  p(95)=48.12ms  p(99.9)=114.19ms
     iterations.....................: 266926  2219.438465/s
     success_rate...................: 100.00% ✓ 266926      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 767511      ✗ 0     
     data_received..................: 22 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=3.2µs    min=1.05µs  med=2.31µs   max=16.02ms  p(90)=3.41µs  p(95)=3.98µs   p(99.9)=35.74µs 
     http_req_connecting............: avg=423ns    min=0s      med=0s       max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.2ms   min=2.5ms   med=15.37ms  max=315.28ms p(90)=50.47ms p(95)=68.11ms  p(99.9)=168.45ms
       { expected_response:true }...: avg=23.2ms   min=2.5ms   med=15.37ms  max=315.28ms p(90)=50.47ms p(95)=68.11ms  p(99.9)=168.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 255937
     http_req_receiving.............: avg=970.71µs min=52.47µs med=136.23µs max=304.07ms p(90)=1.4ms   p(95)=2.31ms   p(99.9)=65.44ms 
     http_req_sending...............: avg=43.78µs  min=5.21µs  med=9.41µs   max=109.64ms p(90)=15.76µs p(95)=108.28µs p(99.9)=3.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.19ms  min=2.36ms  med=14.57ms  max=292.78ms p(90)=48.66ms p(95)=66.16ms  p(99.9)=164.51ms
     http_reqs......................: 255937  2127.523405/s
     iteration_duration.............: avg=23.44ms  min=3.29ms  med=15.59ms  max=337.51ms p(90)=50.71ms p(95)=68.36ms  p(99.9)=169.72ms
     iterations.....................: 255837  2126.692137/s
     success_rate...................: 100.00% ✓ 255837      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 742353      ✗ 0     
     data_received..................: 22 GB   181 MB/s
     data_sent......................: 298 MB  2.5 MB/s
     http_req_blocked...............: avg=3.44µs   min=1.02µs  med=2.64µs  max=15.26ms  p(90)=4.16µs   p(95)=4.96µs   p(99.9)=44.32µs
     http_req_connecting............: avg=199ns    min=0s      med=0s      max=2.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.99ms  min=1.9ms   med=23.74ms max=312.02ms p(90)=28.83ms  p(95)=31.18ms  p(99.9)=54.74ms
       { expected_response:true }...: avg=23.99ms  min=1.9ms   med=23.74ms max=312.02ms p(90)=28.83ms  p(95)=31.18ms  p(99.9)=54.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 247551
     http_req_receiving.............: avg=114.87µs min=29.55µs med=60.08µs max=210.88ms p(90)=105.64µs p(95)=219.72µs p(99.9)=9.48ms 
     http_req_sending...............: avg=48.34µs  min=4.93µs  med=10.86µs max=224.27ms p(90)=18.63µs  p(95)=123.24µs p(99.9)=3.11ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.83ms  min=1.82ms  med=23.62ms max=300.04ms p(90)=28.65ms  p(95)=30.93ms  p(99.9)=52.93ms
     http_reqs......................: 247551  2058.682545/s
     iteration_duration.............: avg=24.23ms  min=3.77ms  med=23.96ms max=334.03ms p(90)=29.06ms  p(95)=31.44ms  p(99.9)=55.22ms
     iterations.....................: 247451  2057.850925/s
     success_rate...................: 100.00% ✓ 247451      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 430218      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.57µs  min=1.11µs  med=2.43µs  max=4.86ms   p(90)=3.78µs   p(95)=4.4µs    p(99.9)=35.4µs 
     http_req_connecting............: avg=824ns   min=0s      med=0s      max=4.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.59ms min=2.16ms  med=41.04ms max=305.59ms p(90)=58.85ms  p(95)=64.19ms  p(99.9)=91.11ms
       { expected_response:true }...: avg=41.59ms min=2.16ms  med=41.04ms max=305.59ms p(90)=58.85ms  p(95)=64.19ms  p(99.9)=91.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143506
     http_req_receiving.............: avg=82.08µs min=28.83µs med=64.59µs max=25.56ms  p(90)=101.25µs p(95)=119.21µs p(99.9)=1.91ms 
     http_req_sending...............: avg=25.47µs min=5.19µs  med=11.03µs max=102.44ms p(90)=16.59µs  p(95)=20.34µs  p(99.9)=1.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.48ms min=2.06ms  med=40.94ms max=304.64ms p(90)=58.73ms  p(95)=64.07ms  p(99.9)=90.89ms
     http_reqs......................: 143506  1193.075287/s
     iteration_duration.............: avg=41.83ms min=3.97ms  med=41.24ms max=345.89ms p(90)=59.06ms  p(95)=64.41ms  p(99.9)=91.62ms
     iterations.....................: 143406  1192.243911/s
     success_rate...................: 100.00% ✓ 143406      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 201549     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   670 kB/s
     http_req_blocked...............: avg=4.64µs  min=1.08µs  med=2.91µs  max=3.9ms    p(90)=4.42µs   p(95)=5.04µs   p(99.9)=47.6µs  
     http_req_connecting............: avg=1.44µs  min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.94ms min=4.06ms  med=85.42ms max=349.57ms p(90)=114.36ms p(95)=127.3ms  p(99.9)=228.83ms
       { expected_response:true }...: avg=88.94ms min=4.06ms  med=85.42ms max=349.57ms p(90)=114.36ms p(95)=127.3ms  p(99.9)=228.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67283
     http_req_receiving.............: avg=86.36µs min=30.89µs med=77.95µs max=22.84ms  p(90)=112.78µs p(95)=125.59µs p(99.9)=944.35µs
     http_req_sending...............: avg=22.29µs min=5.63µs  med=13.52µs max=76.27ms  p(90)=19.81µs  p(95)=22.11µs  p(99.9)=733.73µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.83ms min=3.94ms  med=85.31ms max=349.05ms p(90)=114.24ms p(95)=127.18ms p(99.9)=228.76ms
     http_reqs......................: 67283   558.212407/s
     iteration_duration.............: avg=89.32ms min=27.18ms med=85.67ms max=373.19ms p(90)=114.62ms p(95)=127.58ms p(99.9)=231.28ms
     iterations.....................: 67183   557.382759/s
     success_rate...................: 100.00% ✓ 67183      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 160419     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   533 kB/s
     http_req_blocked...............: avg=6.23µs   min=1.28µs  med=3.31µs   max=6.15ms   p(90)=4.74µs   p(95)=5.29µs   p(99.9)=59.56µs 
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=6.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.76ms min=5.23ms  med=111.5ms  max=370.82ms p(90)=134.82ms p(95)=141.79ms p(99.9)=173.89ms
       { expected_response:true }...: avg=111.76ms min=5.23ms  med=111.5ms  max=370.82ms p(90)=134.82ms p(95)=141.79ms p(99.9)=173.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53573
     http_req_receiving.............: avg=90.46µs  min=32.3µs  med=83.37µs  max=114.21ms p(90)=114.93µs p(95)=126.99µs p(99.9)=647.24µs
     http_req_sending...............: avg=26.1µs   min=5.94µs  med=15.16µs  max=117.68ms p(90)=20.61µs  p(95)=22.48µs  p(99.9)=715.57µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.65ms min=5.15ms  med=111.39ms max=370.01ms p(90)=134.71ms p(95)=141.67ms p(99.9)=173.04ms
     http_reqs......................: 53573   443.985722/s
     iteration_duration.............: avg=112.23ms min=18.36ms med=111.78ms max=382.83ms p(90)=135.07ms p(95)=142.07ms p(99.9)=175.72ms
     iterations.....................: 53473   443.156973/s
     success_rate...................: 100.00% ✓ 53473      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88557      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=10.9µs   min=1.31µs  med=3.5µs    max=9.26ms   p(90)=4.91µs   p(95)=5.49µs   p(99.9)=2.97ms  
     http_req_connecting............: avg=6.93µs   min=0s      med=0s       max=9.21ms   p(90)=0s       p(95)=0s       p(99.9)=2.69ms  
     http_req_duration..............: avg=202.43ms min=6.16ms  med=184.77ms max=806.98ms p(90)=237.79ms p(95)=290.21ms p(99.9)=675.98ms
       { expected_response:true }...: avg=202.43ms min=6.16ms  med=184.77ms max=806.98ms p(90)=237.79ms p(95)=290.21ms p(99.9)=675.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29619
     http_req_receiving.............: avg=98.85µs  min=36.95µs med=94.54µs  max=3.91ms   p(90)=126.6µs  p(95)=139.73µs p(99.9)=476.47µs
     http_req_sending...............: avg=25.78µs  min=5.81µs  med=16.65µs  max=54.96ms  p(90)=21.75µs  p(95)=23.66µs  p(99.9)=2.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.3ms  min=6.04ms  med=184.66ms max=806.89ms p(90)=237.66ms p(95)=290.03ms p(99.9)=675.74ms
     http_reqs......................: 29619   245.051471/s
     iteration_duration.............: avg=203.36ms min=28.91ms med=185.16ms max=813.68ms p(90)=238.14ms p(95)=291.1ms  p(99.9)=676.28ms
     iterations.....................: 29519   244.224126/s
     success_rate...................: 100.00% ✓ 29519      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88365      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=7.46µs   min=1.27µs  med=3.37µs   max=4.31ms   p(90)=4.59µs   p(95)=5.12µs   p(99.9)=2.19ms  
     http_req_connecting............: avg=3.87µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=2.16ms  
     http_req_duration..............: avg=202.9ms  min=8.54ms  med=198.13ms max=417.76ms p(90)=252.99ms p(95)=257.78ms p(99.9)=343.43ms
       { expected_response:true }...: avg=202.9ms  min=8.54ms  med=198.13ms max=417.76ms p(90)=252.99ms p(95)=257.78ms p(99.9)=343.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29555
     http_req_receiving.............: avg=100.93µs min=34.98µs med=91.56µs  max=140.87ms p(90)=122.4µs  p(95)=135.2µs  p(99.9)=680.42µs
     http_req_sending...............: avg=36.73µs  min=6.09µs  med=16.37µs  max=177.21ms p(90)=20.92µs  p(95)=22.61µs  p(99.9)=565.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.76ms min=8.41ms  med=197.86ms max=416.31ms p(90)=252.86ms p(95)=257.67ms p(99.9)=342.42ms
     http_reqs......................: 29555   244.022443/s
     iteration_duration.............: avg=203.86ms min=39.07ms med=203.32ms max=446.51ms p(90)=253.28ms p(95)=258.06ms p(99.9)=345.91ms
     iterations.....................: 29455   243.196788/s
     success_rate...................: 100.00% ✓ 29455      ✗ 0    
     vus............................: 43      min=43       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 814947      ✗ 0     
     data_received..................: 24 GB   198 MB/s
     data_sent......................: 327 MB  2.7 MB/s
     http_req_blocked...............: avg=3.17µs   min=992ns   med=2.58µs  max=4.23ms   p(90)=4.05µs   p(95)=4.82µs   p(99.9)=35.97µs
     http_req_connecting............: avg=198ns    min=0s      med=0s      max=3.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.84ms  min=1.75ms  med=21.43ms max=306.6ms  p(90)=30.4ms   p(95)=33.39ms  p(99.9)=55.31ms
       { expected_response:true }...: avg=21.84ms  min=1.75ms  med=21.43ms max=306.6ms  p(90)=30.4ms   p(95)=33.39ms  p(99.9)=55.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 271749
     http_req_receiving.............: avg=116.53µs min=28.07µs med=58.59µs max=41.44ms  p(90)=108.02µs p(95)=266.29µs p(99.9)=8.36ms 
     http_req_sending...............: avg=51.69µs  min=5.04µs  med=10.5µs  max=231.43ms p(90)=18.26µs  p(95)=128.71µs p(99.9)=4.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.67ms  min=1.66ms  med=21.28ms max=305.71ms p(90)=30.19ms  p(95)=33.12ms  p(99.9)=54.48ms
     http_reqs......................: 271749  2260.205086/s
     iteration_duration.............: avg=22.07ms  min=3.55ms  med=21.65ms max=341.55ms p(90)=30.62ms  p(95)=33.63ms  p(99.9)=56.03ms
     iterations.....................: 271649  2259.373361/s
     success_rate...................: 100.00% ✓ 271649      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 743520     ✗ 0     
     data_received..................: 22 GB   181 MB/s
     data_sent......................: 298 MB  2.5 MB/s
     http_req_blocked...............: avg=2.81µs  min=942ns   med=2.1µs    max=8.46ms   p(90)=3.54µs  p(95)=4.3µs    p(99.9)=32.97µs 
     http_req_connecting............: avg=205ns   min=0s      med=0s       max=2.24ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.95ms min=1.81ms  med=21.11ms  max=366.47ms p(90)=40.14ms p(95)=48.92ms  p(99.9)=110.57ms
       { expected_response:true }...: avg=23.95ms min=1.81ms  med=21.11ms  max=366.47ms p(90)=40.14ms p(95)=48.92ms  p(99.9)=110.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 247940
     http_req_receiving.............: avg=1.13ms  min=52.29µs med=377.12µs max=230.44ms p(90)=2.4ms   p(95)=3.56ms   p(99.9)=38.83ms 
     http_req_sending...............: avg=43.87µs min=4.93µs  med=9.24µs   max=31.82ms  p(90)=18.3µs  p(95)=113.93µs p(99.9)=3.55ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.78ms min=1.69ms  med=19.94ms  max=203.24ms p(90)=38.62ms p(95)=47.19ms  p(99.9)=107.15ms
     http_reqs......................: 247940  2062.1899/s
     iteration_duration.............: avg=24.19ms min=2.27ms  med=21.34ms  max=375.63ms p(90)=40.39ms p(95)=49.17ms  p(99.9)=111.9ms 
     iterations.....................: 247840  2061.35817/s
     success_rate...................: 100.00% ✓ 247840     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 718416      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.03µs   min=982ns   med=2.08µs   max=12.07ms  p(90)=3.48µs  p(95)=4.2µs    p(99.9)=30.61µs 
     http_req_connecting............: avg=454ns    min=0s      med=0s       max=4.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.8ms   min=1.81ms  med=17.98ms  max=327.89ms p(90)=50.19ms p(95)=67.48ms  p(99.9)=166.67ms
       { expected_response:true }...: avg=24.8ms   min=1.81ms  med=17.98ms  max=327.89ms p(90)=50.19ms p(95)=67.48ms  p(99.9)=166.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239572
     http_req_receiving.............: avg=983.14µs min=52.11µs med=129.28µs max=245.96ms p(90)=1.61ms  p(95)=2.61ms   p(99.9)=62.4ms  
     http_req_sending...............: avg=42.24µs  min=5.21µs  med=9.34µs   max=136.48ms p(90)=17.51µs p(95)=104.07µs p(99.9)=2.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.78ms  min=1.7ms   med=17.15ms  max=327.3ms  p(90)=48.36ms p(95)=65.4ms   p(99.9)=163.85ms
     http_reqs......................: 239572  1992.641204/s
     iteration_duration.............: avg=25.04ms  min=2.47ms  med=18.2ms   max=339.55ms p(90)=50.44ms p(95)=67.73ms  p(99.9)=167.98ms
     iterations.....................: 239472  1991.809454/s
     success_rate...................: 100.00% ✓ 239472      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 539559      ✗ 0     
     data_received..................: 16 GB   131 MB/s
     data_sent......................: 216 MB  1.8 MB/s
     http_req_blocked...............: avg=3.34µs   min=1.01µs  med=2.46µs  max=5.66ms   p(90)=4.7µs    p(95)=5.87µs   p(99.9)=41.68µs
     http_req_connecting............: avg=249ns    min=0s      med=0s      max=2.34ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.08ms  min=2.44ms  med=32.26ms max=339.32ms p(90)=43.88ms  p(95)=48.52ms  p(99.9)=86.2ms 
       { expected_response:true }...: avg=33.08ms  min=2.44ms  med=32.26ms max=339.32ms p(90)=43.88ms  p(95)=48.52ms  p(99.9)=86.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 179953
     http_req_receiving.............: avg=109.96µs min=30.69µs med=62.2µs  max=34.05ms  p(90)=135.99µs p(95)=282.78µs p(99.9)=4.78ms 
     http_req_sending...............: avg=46.15µs  min=5.13µs  med=10.41µs max=206.42ms p(90)=23.94µs  p(95)=135.96µs p(99.9)=3.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.92ms  min=2.33ms  med=32.12ms max=339.04ms p(90)=43.7ms   p(95)=48.3ms   p(99.9)=85.75ms
     http_reqs......................: 179953  1495.631633/s
     iteration_duration.............: avg=33.35ms  min=4.41ms  med=32.5ms  max=369.55ms p(90)=44.12ms  p(95)=48.76ms  p(99.9)=86.83ms
     iterations.....................: 179853  1494.800509/s
     success_rate...................: 100.00% ✓ 179853      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 394455      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 158 MB  1.3 MB/s
     http_req_blocked...............: avg=4.19µs  min=1.05µs  med=2.62µs  max=6.57ms   p(90)=4.19µs   p(95)=4.88µs   p(99.9)=40.33µs
     http_req_connecting............: avg=1.24µs  min=0s      med=0s      max=6.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=45.36ms min=2.37ms  med=44.82ms max=326.64ms p(90)=63.77ms  p(95)=69.55ms  p(99.9)=98.2ms 
       { expected_response:true }...: avg=45.36ms min=2.37ms  med=44.82ms max=326.64ms p(90)=63.77ms  p(95)=69.55ms  p(99.9)=98.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 131585
     http_req_receiving.............: avg=89.54µs min=30.53µs med=72.45µs max=63.01ms  p(90)=113.18µs p(95)=132.67µs p(99.9)=1.74ms 
     http_req_sending...............: avg=28.94µs min=5.16µs  med=11.69µs max=133.73ms p(90)=17.95µs  p(95)=21.68µs  p(99.9)=1.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45.24ms min=2.24ms  med=44.71ms max=325.83ms p(90)=63.65ms  p(95)=69.41ms  p(99.9)=97.82ms
     http_reqs......................: 131585  1093.803178/s
     iteration_duration.............: avg=45.62ms min=4.64ms  med=45.05ms max=355.2ms  p(90)=63.99ms  p(95)=69.77ms  p(99.9)=99ms   
     iterations.....................: 131485  1092.971926/s
     success_rate...................: 100.00% ✓ 131485      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 189459     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   630 kB/s
     http_req_blocked...............: avg=3.88µs   min=1.11µs  med=3.07µs  max=1.97ms   p(90)=4.56µs   p(95)=5.14µs   p(99.9)=49.57µs 
     http_req_connecting............: avg=567ns    min=0s      med=0s      max=1.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.63ms  min=4.39ms  med=92.37ms max=352.77ms p(90)=114.06ms p(95)=124.7ms  p(99.9)=227.44ms
       { expected_response:true }...: avg=94.63ms  min=4.39ms  med=92.37ms max=352.77ms p(90)=114.06ms p(95)=124.7ms  p(99.9)=227.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63253
     http_req_receiving.............: avg=163.23µs min=33.15µs med=82.14µs max=272.1ms  p(90)=115.9µs  p(95)=128.58µs p(99.9)=1.2ms   
     http_req_sending...............: avg=21.98µs  min=5.67µs  med=14.12µs max=47.71ms  p(90)=20.23µs  p(95)=22.36µs  p(99.9)=698.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.44ms  min=4.27ms  med=92.25ms max=254.76ms p(90)=113.86ms p(95)=124.45ms p(99.9)=225.17ms
     http_reqs......................: 63253   524.553252/s
     iteration_duration.............: avg=95.02ms  min=17.76ms med=92.62ms max=361.2ms  p(90)=114.32ms p(95)=125.01ms p(99.9)=228.87ms
     iterations.....................: 63153   523.723958/s
     success_rate...................: 100.00% ✓ 63153      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 148776     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   494 kB/s
     http_req_blocked...............: avg=5.93µs   min=1.12µs  med=3.47µs   max=4.27ms   p(90)=4.98µs   p(95)=5.58µs   p(99.9)=334.06µs
     http_req_connecting............: avg=2.24µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=200.41µs
     http_req_duration..............: avg=120.5ms  min=5.71ms  med=118.01ms max=332.68ms p(90)=159.86ms p(95)=171.89ms p(99.9)=220.29ms
       { expected_response:true }...: avg=120.5ms  min=5.71ms  med=118.01ms max=332.68ms p(90)=159.86ms p(95)=171.89ms p(99.9)=220.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49692
     http_req_receiving.............: avg=95.51µs  min=32.18µs med=89.38µs  max=58.6ms   p(90)=121.82µs p(95)=134.84µs p(99.9)=718.31µs
     http_req_sending...............: avg=29.73µs  min=5.36µs  med=16.61µs  max=105.76ms p(90)=21.9µs   p(95)=23.88µs  p(99.9)=572.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.37ms min=5.63ms  med=117.88ms max=306.46ms p(90)=159.74ms p(95)=171.76ms p(99.9)=220.05ms
     http_reqs......................: 49692   411.589888/s
     iteration_duration.............: avg=121.02ms min=26.6ms  med=118.3ms  max=361.52ms p(90)=160.18ms p(95)=172.18ms p(99.9)=225.07ms
     iterations.....................: 49592   410.761606/s
     success_rate...................: 100.00% ✓ 49592      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84996      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   282 kB/s
     http_req_blocked...............: avg=7.1µs    min=1.2µs   med=3.33µs   max=4.12ms   p(90)=4.58µs   p(95)=5.09µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.56µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=210.9ms  min=8.66ms  med=210.92ms max=434.44ms p(90)=235.64ms p(95)=243.55ms p(99.9)=322.59ms
       { expected_response:true }...: avg=210.9ms  min=8.66ms  med=210.92ms max=434.44ms p(90)=235.64ms p(95)=243.55ms p(99.9)=322.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28432
     http_req_receiving.............: avg=211.83µs min=33.78µs med=92.71µs  max=140.71ms p(90)=123.91µs p(95)=136.93µs p(99.9)=32.96ms 
     http_req_sending...............: avg=36.04µs  min=6.28µs  med=16.39µs  max=168.76ms p(90)=21.07µs  p(95)=22.94µs  p(99.9)=612.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.65ms min=8.52ms  med=210.78ms max=347.85ms p(90)=235.5ms  p(95)=243.4ms  p(99.9)=313.41ms
     http_reqs......................: 28432   234.749435/s
     iteration_duration.............: avg=211.91ms min=30.42ms med=211.29ms max=460.73ms p(90)=235.93ms p(95)=243.83ms p(99.9)=324.39ms
     iterations.....................: 28332   233.923783/s
     success_rate...................: 100.00% ✓ 28332      ✗ 0    
     vus............................: 47      min=47       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84714      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=7.79µs   min=1.28µs  med=3.56µs   max=4.46ms   p(90)=4.92µs   p(95)=5.52µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=3.92µs   min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=211.6ms  min=6.94ms  med=193.64ms max=834.97ms p(90)=244.82ms p(95)=308.8ms  p(99.9)=645.62ms
       { expected_response:true }...: avg=211.6ms  min=6.94ms  med=193.64ms max=834.97ms p(90)=244.82ms p(95)=308.8ms  p(99.9)=645.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28338
     http_req_receiving.............: avg=107.53µs min=35.32µs med=98.12µs  max=82.02ms  p(90)=129.3µs  p(95)=142.71µs p(99.9)=717.83µs
     http_req_sending...............: avg=34.51µs  min=6.4µs   med=17.55µs  max=85.22ms  p(90)=22.3µs   p(95)=24.09µs  p(99.9)=606.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.46ms min=6.83ms  med=193.51ms max=834.87ms p(90)=244.69ms p(95)=308.53ms p(99.9)=645.51ms
     http_reqs......................: 28338   234.033006/s
     iteration_duration.............: avg=212.63ms min=48.25ms med=194.02ms max=835.19ms p(90)=245.39ms p(95)=312.63ms p(99.9)=646.02ms
     iterations.....................: 28238   233.207143/s
     success_rate...................: 100.00% ✓ 28238      ✗ 0    
     vus............................: 36      min=36       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 5568      ✗ 0   
     data_received..................: 187 MB  1.5 MB/s
     data_sent......................: 2.3 MB  18 kB/s
     http_req_blocked...............: avg=31.34µs  min=1.37µs  med=3.39µs  max=2.96ms  p(90)=4.75µs   p(95)=5.8µs   p(99.9)=2.77ms  
     http_req_connecting............: avg=27.11µs  min=0s      med=0s      max=2.93ms  p(90)=0s       p(95)=0s      p(99.9)=2.75ms  
     http_req_duration..............: avg=3.09s    min=48.89ms med=3.21s   max=5.4s    p(90)=4.01s    p(95)=4.18s   p(99.9)=5.36s   
       { expected_response:true }...: avg=3.09s    min=48.89ms med=3.21s   max=5.4s    p(90)=4.01s    p(95)=4.18s   p(99.9)=5.36s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 1956
     http_req_receiving.............: avg=104.04µs min=36.39µs med=96.29µs max=9.49ms  p(90)=139.01µs p(95)=154.1µs p(99.9)=439.84µs
     http_req_sending...............: avg=44.85µs  min=6.48µs  med=17.57µs max=18.23ms p(90)=23.27µs  p(95)=27.55µs p(99.9)=2.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=3.09s    min=48.71ms med=3.21s   max=5.4s    p(90)=4.01s    p(95)=4.18s   p(99.9)=5.36s   
     http_reqs......................: 1956    15.345699/s
     iteration_duration.............: avg=3.26s    min=1.57s   med=3.26s   max=5.4s    p(90)=4.03s    p(95)=4.19s   p(99.9)=5.36s   
     iterations.....................: 1856    14.561154/s
     success_rate...................: 100.00% ✓ 1856      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

