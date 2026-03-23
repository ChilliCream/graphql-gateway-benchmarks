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
| hive-router | v0.0.42 | 3,110 | 3,291 | 3,080 | 2.2% |  |
| grafbase | 0.53.2 | 2,077 | 2,133 | 2,062 | 1.2% |  |
| hotchocolate | 16.0.0-rc.1.1 | 1,934 | 1,972 | 1,921 | 0.8% |  |
| cosmo | 0.295.0 | 1,271 | 1,288 | 1,267 | 0.6% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 607 | 621 | 604 | 1.0% |  |
| apollo-router | v2.12.0 | 432 | 442 | 427 | 1.2% |  |
| hive-gateway | 2.5.11 | 276 | 283 | 273 | 1.4% |  |
| apollo-gateway | 2.13.3 | 240 | 242 | 238 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.42 | 2,515 | 2,642 | 2,477 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.1 | 1,824 | 1,854 | 1,806 | 1.0% |  |
| grafbase | 0.53.2 | 1,552 | 1,572 | 1,537 | 0.8% |  |
| cosmo | 0.295.0 | 1,217 | 1,222 | 1,206 | 0.6% | non-compatible response (5 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 585 | 601 | 580 | 1.2% |  |
| apollo-router | v2.12.0 | 374 | 385 | 369 | 1.4% |  |
| hive-gateway | 2.5.11 | 266 | 272 | 264 | 1.1% |  |
| apollo-gateway | 2.13.3 | 238 | 242 | 236 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1121490     ✗ 0     
     data_received..................: 33 GB   273 MB/s
     data_sent......................: 449 MB  3.7 MB/s
     http_req_blocked...............: avg=2.85µs   min=972ns   med=2µs     max=19.35ms  p(90)=3.17µs  p(95)=3.81µs   p(99.9)=29.92µs
     http_req_connecting............: avg=295ns    min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.8ms   min=1.68ms  med=14.75ms max=306.89ms p(90)=23.52ms p(95)=27.92ms  p(99.9)=51.14ms
       { expected_response:true }...: avg=15.8ms   min=1.68ms  med=14.75ms max=306.89ms p(90)=23.52ms p(95)=27.92ms  p(99.9)=51.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 373930
     http_req_receiving.............: avg=147.78µs min=26.69µs med=46.74µs max=51.44ms  p(90)=95.91µs p(95)=278.96µs p(99.9)=17.07ms
     http_req_sending...............: avg=63.91µs  min=5.2µs   med=8.87µs  max=180.4ms  p(90)=15.06µs p(95)=118.76µs p(99.9)=16.12ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.59ms  min=1.63ms  med=14.59ms max=288.27ms p(90)=23.18ms p(95)=27.37ms  p(99.9)=49.28ms
     http_reqs......................: 373930  3110.639273/s
     iteration_duration.............: avg=16.04ms  min=2.05ms  med=14.95ms max=340.89ms p(90)=23.75ms p(95)=28.19ms  p(99.9)=52.77ms
     iterations.....................: 373830  3109.807395/s
     success_rate...................: 100.00% ✓ 373830      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 749439      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 300 MB  2.5 MB/s
     http_req_blocked...............: avg=3µs      min=1.01µs  med=2.18µs  max=10.37ms  p(90)=3.61µs  p(95)=4.4µs    p(99.9)=42.23µs
     http_req_connecting............: avg=282ns    min=0s      med=0s      max=3.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.77ms  min=1.98ms  med=23.54ms max=353.34ms p(90)=28.5ms  p(95)=30.69ms  p(99.9)=52.79ms
       { expected_response:true }...: avg=23.77ms  min=1.98ms  med=23.54ms max=353.34ms p(90)=28.5ms  p(95)=30.69ms  p(99.9)=52.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 249913
     http_req_receiving.............: avg=126.77µs min=28.74µs med=56.54µs max=276.12ms p(90)=98.87µs p(95)=182.06µs p(99.9)=10.06ms
     http_req_sending...............: avg=43.31µs  min=5.17µs  med=9.92µs  max=306.17ms p(90)=17.69µs p(95)=112.89µs p(99.9)=3ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.6ms   min=1.9ms   med=23.43ms max=107.41ms p(90)=28.33ms p(95)=30.45ms  p(99.9)=51.23ms
     http_reqs......................: 249913  2077.99052/s
     iteration_duration.............: avg=24.01ms  min=3.37ms  med=23.75ms max=368.48ms p(90)=28.71ms p(95)=30.93ms  p(99.9)=53.3ms 
     iterations.....................: 249813  2077.159035/s
     success_rate...................: 100.00% ✓ 249813      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 698076      ✗ 0     
     data_received..................: 20 GB   170 MB/s
     data_sent......................: 280 MB  2.3 MB/s
     http_req_blocked...............: avg=2.57µs   min=1µs     med=2µs      max=9.85ms   p(90)=3.05µs   p(95)=3.6µs   p(99.9)=29.48µs 
     http_req_connecting............: avg=196ns    min=0s      med=0s       max=1.99ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.54ms  min=2.7ms   med=16.11ms  max=348.63ms p(90)=57.92ms  p(95)=76.02ms p(99.9)=170.84ms
       { expected_response:true }...: avg=25.54ms  min=2.7ms   med=16.11ms  max=348.63ms p(90)=57.92ms  p(95)=76.02ms p(99.9)=170.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232792
     http_req_receiving.............: avg=618.63µs min=51.16µs med=106.71µs max=204.02ms p(90)=970.79µs p(95)=1.47ms  p(99.9)=56.84ms 
     http_req_sending...............: avg=38.25µs  min=5.22µs  med=9µs      max=156.36ms p(90)=14.55µs  p(95)=54.34µs p(99.9)=2.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.89ms  min=2.56ms  med=15.61ms  max=348.2ms  p(90)=56.72ms  p(95)=74.84ms p(99.9)=169.75ms
     http_reqs......................: 232792  1934.733645/s
     iteration_duration.............: avg=25.77ms  min=3.72ms  med=16.32ms  max=357.2ms  p(90)=58.15ms  p(95)=76.26ms p(99.9)=172.15ms
     iterations.....................: 232692  1933.902546/s
     success_rate...................: 100.00% ✓ 232692      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458502      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3µs      min=1.02µs  med=2.07µs  max=4.27ms   p(90)=3.36µs  p(95)=3.98µs   p(99.9)=33.66µs
     http_req_connecting............: avg=603ns    min=0s      med=0s      max=4.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.02ms  min=2.18ms  med=38.5ms  max=354.32ms p(90)=54.98ms p(95)=59.97ms  p(99.9)=84.57ms
       { expected_response:true }...: avg=39.02ms  min=2.18ms  med=38.5ms  max=354.32ms p(90)=54.98ms p(95)=59.97ms  p(99.9)=84.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152934
     http_req_receiving.............: avg=107.69µs min=28.05µs med=58.19µs max=260.63ms p(90)=94.07µs p(95)=112.32µs p(99.9)=2.37ms 
     http_req_sending...............: avg=25.59µs  min=5.31µs  med=10.01µs max=213.79ms p(90)=15.72µs p(95)=19.67µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.88ms  min=2.07ms  med=38.4ms  max=107.74ms p(90)=54.87ms p(95)=59.85ms  p(99.9)=84.08ms
     http_reqs......................: 152934  1271.567793/s
     iteration_duration.............: avg=39.25ms  min=3.67ms  med=38.7ms  max=361.11ms p(90)=55.18ms p(95)=60.16ms  p(99.9)=85.14ms
     iterations.....................: 152834  1270.736344/s
     success_rate...................: 100.00% ✓ 152834      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 219456     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 88 MB   730 kB/s
     http_req_blocked...............: avg=3.85µs  min=1.13µs  med=2.35µs  max=3.44ms   p(90)=3.87µs   p(95)=4.45µs   p(99.9)=41.71µs 
     http_req_connecting............: avg=1.16µs  min=0s      med=0s      max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.69ms min=3.64ms  med=78.98ms max=348.83ms p(90)=98.95ms  p(95)=108.77ms p(99.9)=206.78ms
       { expected_response:true }...: avg=81.69ms min=3.64ms  med=78.98ms max=348.83ms p(90)=98.95ms  p(95)=108.77ms p(99.9)=206.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73252
     http_req_receiving.............: avg=83.03µs min=30.04µs med=72.4µs  max=185.9ms  p(90)=106.97µs p(95)=119.54µs p(99.9)=811.23µs
     http_req_sending...............: avg=20.56µs min=5.33µs  med=11.86µs max=106.45ms p(90)=18.72µs  p(95)=20.78µs  p(99.9)=755.75µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.58ms min=3.59ms  med=78.89ms max=347.88ms p(90)=98.84ms  p(95)=108.65ms p(99.9)=206.58ms
     http_reqs......................: 73252   607.923869/s
     iteration_duration.............: avg=82.03ms min=26.11ms med=79.2ms  max=365.68ms p(90)=99.17ms  p(95)=109ms    p(99.9)=209.05ms
     iterations.....................: 73152   607.093962/s
     success_rate...................: 100.00% ✓ 73152      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 156120     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   519 kB/s
     http_req_blocked...............: avg=3.95µs   min=1.11µs  med=2.9µs    max=2.15ms   p(90)=4.3µs    p(95)=4.82µs   p(99.9)=95.17µs 
     http_req_connecting............: avg=849ns    min=0s      med=0s       max=2.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.86ms min=5.3ms   med=114.73ms max=360.65ms p(90)=138.41ms p(95)=145.54ms p(99.9)=180.08ms
       { expected_response:true }...: avg=114.86ms min=5.3ms   med=114.73ms max=360.65ms p(90)=138.41ms p(95)=145.54ms p(99.9)=180.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52140
     http_req_receiving.............: avg=147.79µs min=31.69µs med=81.21µs  max=156.51ms p(90)=112.41µs p(95)=124.49µs p(99.9)=1.03ms  
     http_req_sending...............: avg=25.75µs  min=5.76µs  med=14.58µs  max=172.98ms p(90)=20.07µs  p(95)=21.94µs  p(99.9)=580.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.69ms min=5.23ms  med=114.61ms max=217.28ms p(90)=138.27ms p(95)=145.4ms  p(99.9)=178.21ms
     http_reqs......................: 52140   432.012711/s
     iteration_duration.............: avg=115.33ms min=8.49ms  med=115ms    max=376.2ms  p(90)=138.68ms p(95)=145.83ms p(99.9)=182.23ms
     iterations.....................: 52040   431.184148/s
     success_rate...................: 100.00% ✓ 52040      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100089     ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   332 kB/s
     http_req_blocked...............: avg=6.06µs   min=1.21µs  med=3.24µs   max=3.93ms   p(90)=4.68µs   p(95)=5.26µs   p(99.9)=933.97µs
     http_req_connecting............: avg=2.61µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=907.49µs
     http_req_duration..............: avg=179.12ms min=5.67ms  med=163.84ms max=658.34ms p(90)=211.67ms p(95)=292.3ms  p(99.9)=543.57ms
       { expected_response:true }...: avg=179.12ms min=5.67ms  med=163.84ms max=658.34ms p(90)=211.67ms p(95)=292.3ms  p(99.9)=543.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33463
     http_req_receiving.............: avg=108.33µs min=35.11µs med=96.19µs  max=152.25ms p(90)=128.38µs p(95)=141.99µs p(99.9)=655.94µs
     http_req_sending...............: avg=32.23µs  min=6.14µs  med=17.28µs  max=149.58ms p(90)=22.1µs   p(95)=24.05µs  p(99.9)=895.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.98ms min=5.53ms  med=163.71ms max=658.22ms p(90)=211.48ms p(95)=291.76ms p(99.9)=543.44ms
     http_reqs......................: 33463   276.759117/s
     iteration_duration.............: avg=179.94ms min=28.48ms med=164.22ms max=658.58ms p(90)=212.07ms p(95)=308.35ms p(99.9)=543.81ms
     iterations.....................: 33363   275.932056/s
     success_rate...................: 100.00% ✓ 33363      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87141      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=7µs      min=1.22µs  med=3.03µs   max=4.78ms   p(90)=4.23µs   p(95)=4.73µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.79µs   min=0s      med=0s       max=4.74ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=205.75ms min=8.42ms  med=201.54ms max=356.1ms  p(90)=226.91ms p(95)=237.29ms p(99.9)=291.48ms
       { expected_response:true }...: avg=205.75ms min=8.42ms  med=201.54ms max=356.1ms  p(90)=226.91ms p(95)=237.29ms p(99.9)=291.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29147
     http_req_receiving.............: avg=97.49µs  min=33.59µs med=89.78µs  max=50.78ms  p(90)=121.16µs p(95)=132.85µs p(99.9)=676.07µs
     http_req_sending...............: avg=22.9µs   min=5.96µs  med=16.36µs  max=34.72ms  p(90)=20.8µs   p(95)=22.66µs  p(99.9)=557.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.63ms min=8.29ms  med=201.43ms max=355.6ms  p(90)=226.78ms p(95)=237.13ms p(99.9)=291.29ms
     http_reqs......................: 29147   240.696957/s
     iteration_duration.............: avg=206.7ms  min=47ms    med=201.83ms max=366.25ms p(90)=227.33ms p(95)=237.62ms p(99.9)=291.86ms
     iterations.....................: 29047   239.871154/s
     success_rate...................: 100.00% ✓ 29047      ✗ 0    
     vus............................: 44      min=44       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 907092      ✗ 0     
     data_received..................: 26 GB   220 MB/s
     data_sent......................: 364 MB  3.0 MB/s
     http_req_blocked...............: avg=3.18µs   min=1µs     med=2.17µs  max=10.66ms  p(90)=3.63µs   p(95)=4.47µs   p(99.9)=33.62µs
     http_req_connecting............: avg=485ns    min=0s      med=0s      max=5.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.6ms   min=1.76ms  med=18.98ms max=298.05ms p(90)=27.17ms  p(95)=30.49ms  p(99.9)=53.28ms
       { expected_response:true }...: avg=19.6ms   min=1.76ms  med=18.98ms max=298.05ms p(90)=27.17ms  p(95)=30.49ms  p(99.9)=53.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 302464
     http_req_receiving.............: avg=120.35µs min=27.73µs med=51.58µs max=132.55ms p(90)=102.86µs p(95)=271.9µs  p(99.9)=10.33ms
     http_req_sending...............: avg=56.51µs  min=5.14µs  med=9.53µs  max=209.4ms  p(90)=18.24µs  p(95)=125.43µs p(99.9)=7.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.42ms  min=1.67ms  med=18.83ms max=297.56ms p(90)=26.95ms  p(95)=30.16ms  p(99.9)=52.23ms
     http_reqs......................: 302464  2515.958509/s
     iteration_duration.............: avg=19.83ms  min=3.45ms  med=19.19ms max=334.17ms p(90)=27.39ms  p(95)=30.75ms  p(99.9)=53.84ms
     iterations.....................: 302364  2515.126689/s
     success_rate...................: 100.00% ✓ 302364      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 657969      ✗ 0     
     data_received..................: 19 GB   160 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=2.8µs    min=992ns   med=2.14µs   max=10.36ms  p(90)=3.52µs  p(95)=4.22µs  p(99.9)=32.59µs 
     http_req_connecting............: avg=250ns    min=0s      med=0s       max=3.08ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=27.11ms  min=2.06ms  med=17.53ms  max=678.78ms p(90)=59.93ms p(95)=78.65ms p(99.9)=203.13ms
       { expected_response:true }...: avg=27.11ms  min=2.06ms  med=17.53ms  max=678.78ms p(90)=59.93ms p(95)=78.65ms p(99.9)=203.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219423
     http_req_receiving.............: avg=652.69µs min=50.65µs med=108.86µs max=167.8ms  p(90)=1.06ms  p(95)=1.66ms  p(99.9)=61.22ms 
     http_req_sending...............: avg=37.94µs  min=5.13µs  med=9.47µs   max=173.79ms p(90)=17.17µs p(95)=41.17µs p(99.9)=1.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=26.42ms  min=1.92ms  med=17.01ms  max=678.71ms p(90)=58.7ms  p(95)=77.32ms p(99.9)=200.76ms
     http_reqs......................: 219423  1824.683841/s
     iteration_duration.............: avg=27.34ms  min=2.75ms  med=17.74ms  max=678.92ms p(90)=60.16ms p(95)=78.88ms p(99.9)=205.92ms
     iterations.....................: 219323  1823.852258/s
     success_rate...................: 100.00% ✓ 219323      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 559833      ✗ 0     
     data_received..................: 16 GB   136 MB/s
     data_sent......................: 224 MB  1.9 MB/s
     http_req_blocked...............: avg=3.29µs   min=932ns   med=2.37µs  max=10.47ms  p(90)=4.64µs   p(95)=5.8µs    p(99.9)=44.59µs
     http_req_connecting............: avg=262ns    min=0s      med=0s      max=2.68ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.87ms  min=2.31ms  med=31.02ms max=324.07ms p(90)=42.5ms   p(95)=47.05ms  p(99.9)=85.4ms 
       { expected_response:true }...: avg=31.87ms  min=2.31ms  med=31.02ms max=324.07ms p(90)=42.5ms   p(95)=47.05ms  p(99.9)=85.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 186711
     http_req_receiving.............: avg=114.29µs min=29.03µs med=60.7µs  max=223.13ms p(90)=136.04µs p(95)=292.55µs p(99.9)=5.75ms 
     http_req_sending...............: avg=48.9µs   min=5.27µs  med=10.22µs max=262.68ms p(90)=24.45µs  p(95)=137.11µs p(99.9)=3.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.71ms  min=2.23ms  med=30.88ms max=284.75ms p(90)=42.29ms  p(95)=46.82ms  p(99.9)=84.6ms 
     http_reqs......................: 186711  1552.02677/s
     iteration_duration.............: avg=32.14ms  min=3.89ms  med=31.26ms max=332.74ms p(90)=42.74ms  p(95)=47.31ms  p(99.9)=86.05ms
     iterations.....................: 186611  1551.195525/s
     success_rate...................: 100.00% ✓ 186611      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 439011      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 176 MB  1.5 MB/s
     http_req_blocked...............: avg=3.16µs  min=992ns   med=2.27µs  max=3.95ms   p(90)=3.75µs   p(95)=4.42µs   p(99.9)=36.72µs
     http_req_connecting............: avg=545ns   min=0s      med=0s      max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.75ms min=2.11ms  med=40.22ms max=308.04ms p(90)=57.33ms  p(95)=62.56ms  p(99.9)=88.15ms
       { expected_response:true }...: avg=40.75ms min=2.11ms  med=40.22ms max=308.04ms p(90)=57.33ms  p(95)=62.56ms  p(99.9)=88.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146437
     http_req_receiving.............: avg=81.74µs min=27.76µs med=62.87µs max=68.6ms   p(90)=100.65µs p(95)=119.02µs p(99.9)=1.68ms 
     http_req_sending...............: avg=26.56µs min=5.42µs  med=10.92µs max=151.02ms p(90)=17.69µs  p(95)=21.31µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.64ms min=2.04ms  med=40.12ms max=306.66ms p(90)=57.21ms  p(95)=62.44ms  p(99.9)=87.66ms
     http_reqs......................: 146437  1217.485433/s
     iteration_duration.............: avg=40.99ms min=3.7ms   med=40.43ms max=344.45ms p(90)=57.54ms  p(95)=62.76ms  p(99.9)=89.16ms
     iterations.....................: 146337  1216.654028/s
     success_rate...................: 100.00% ✓ 146337      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 211497     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   703 kB/s
     http_req_blocked...............: avg=4.03µs  min=1.16µs  med=2.67µs  max=3.45ms   p(90)=4.25µs   p(95)=4.8µs    p(99.9)=47.19µs 
     http_req_connecting............: avg=1.07µs  min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.76ms min=4.07ms  med=81.88ms max=338.65ms p(90)=104.48ms p(95)=115.24ms p(99.9)=212.37ms
       { expected_response:true }...: avg=84.76ms min=4.07ms  med=81.88ms max=338.65ms p(90)=104.48ms p(95)=115.24ms p(99.9)=212.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70599
     http_req_receiving.............: avg=87.57µs min=31.06µs med=77.8µs  max=98.37ms  p(90)=112.15µs p(95)=124.95µs p(99.9)=943.46µs
     http_req_sending...............: avg=24.35µs min=5.42µs  med=13.14µs max=107.85ms p(90)=19.83µs  p(95)=21.91µs  p(99.9)=682.68µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.65ms min=3.94ms  med=81.77ms max=338.03ms p(90)=104.37ms p(95)=115.1ms  p(99.9)=211.76ms
     http_reqs......................: 70599   585.669061/s
     iteration_duration.............: avg=85.11ms min=14.74ms med=82.11ms max=347.75ms p(90)=104.73ms p(95)=115.51ms p(99.9)=213.93ms
     iterations.....................: 70499   584.83949/s
     success_rate...................: 100.00% ✓ 70499      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 135465     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 54 MB   450 kB/s
     http_req_blocked...............: avg=5.49µs   min=1.25µs  med=3.14µs   max=4.41ms   p(90)=4.56µs   p(95)=5.07µs   p(99.9)=292.56µs
     http_req_connecting............: avg=2.15µs   min=0s      med=0s       max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=211.27µs
     http_req_duration..............: avg=132.36ms min=5.93ms  med=129.82ms max=360.43ms p(90)=175.21ms p(95)=188.37ms p(99.9)=239.95ms
       { expected_response:true }...: avg=132.36ms min=5.93ms  med=129.82ms max=360.43ms p(90)=175.21ms p(95)=188.37ms p(99.9)=239.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45255
     http_req_receiving.............: avg=110.96µs min=33.01µs med=87.11µs  max=205.45ms p(90)=118.72µs p(95)=130.22µs p(99.9)=763.55µs
     http_req_sending...............: avg=29.57µs  min=6.11µs  med=16.01µs  max=129.76ms p(90)=20.94µs  p(95)=22.72µs  p(99.9)=718.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.21ms min=5.75ms  med=129.69ms max=359.38ms p(90)=175.09ms p(95)=188.25ms p(99.9)=238.42ms
     http_reqs......................: 45255   374.776172/s
     iteration_duration.............: avg=132.91ms min=40.27ms med=130.13ms max=372.63ms p(90)=175.59ms p(95)=188.71ms p(99.9)=243.16ms
     iterations.....................: 45155   373.948029/s
     success_rate...................: 100.00% ✓ 45155      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 96228      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=6.95µs   min=1.29µs  med=3.32µs   max=4.07ms   p(90)=4.72µs   p(95)=5.28µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=186.29ms min=6.05ms  med=169.88ms max=648.52ms p(90)=218.24ms p(95)=390.4ms  p(99.9)=533.96ms
       { expected_response:true }...: avg=186.29ms min=6.05ms  med=169.88ms max=648.52ms p(90)=218.24ms p(95)=390.4ms  p(99.9)=533.96ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32176
     http_req_receiving.............: avg=101.62µs min=35.56µs med=96.72µs  max=26.3ms   p(90)=128.62µs p(95)=141.92µs p(99.9)=562.45µs
     http_req_sending...............: avg=27.72µs  min=6.15µs  med=17.45µs  max=54.51ms  p(90)=22.02µs  p(95)=23.74µs  p(99.9)=567.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.16ms min=5.95ms  med=169.74ms max=648.43ms p(90)=218.1ms  p(95)=390.22ms p(99.9)=533.86ms
     http_reqs......................: 32176   266.255846/s
     iteration_duration.............: avg=187.13ms min=26.36ms med=170.21ms max=648.71ms p(90)=218.77ms p(95)=390.85ms p(99.9)=534.46ms
     iterations.....................: 32076   265.428347/s
     success_rate...................: 100.00% ✓ 32076      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 86385      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.02µs   min=1.27µs  med=3.22µs   max=4.04ms   p(90)=4.53µs   p(95)=5.09µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=3.59µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=207.5ms  min=8.89ms  med=206.87ms max=465.29ms p(90)=218.24ms p(95)=228.37ms p(99.9)=293.07ms
       { expected_response:true }...: avg=207.5ms  min=8.89ms  med=206.87ms max=465.29ms p(90)=218.24ms p(95)=228.37ms p(99.9)=293.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28895
     http_req_receiving.............: avg=268.28µs min=33.89µs med=94.27µs  max=262.32ms p(90)=126.01µs p(95)=139µs    p(99.9)=58.2ms  
     http_req_sending...............: avg=29.72µs  min=6.23µs  med=17.41µs  max=97.6ms   p(90)=21.91µs  p(95)=23.67µs  p(99.9)=591.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.21ms min=8.77ms  med=206.72ms max=294.46ms p(90)=217.95ms p(95)=227.51ms p(99.9)=288.04ms
     http_reqs......................: 28895   238.569705/s
     iteration_duration.............: avg=208.48ms min=34.23ms med=207.17ms max=475.51ms p(90)=218.56ms p(95)=228.83ms p(99.9)=308ms   
     iterations.....................: 28795   237.744062/s
     success_rate...................: 100.00% ✓ 28795      ✗ 0    
     vus............................: 46      min=46       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

