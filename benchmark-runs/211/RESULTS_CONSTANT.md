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
| hive-router | v0.0.49 | 3,093 | 3,240 | 3,047 | 2.1% |  |
| hotchocolate | 16.1.3-p.1 | 2,178 | 2,234 | 2,160 | 1.1% |  |
| grafbase | 0.53.3 | 2,078 | 2,135 | 2,057 | 1.3% |  |
| cosmo | 0.307.0 | 1,274 | 1,298 | 1,267 | 0.9% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 550 | 562 | 545 | 1.1% |  |
| apollo-router | v2.13.1 | 417 | 430 | 401 | 2.2% |  |
| apollo-gateway | 2.13.3 | 250 | 253 | 248 | 0.6% |  |
| hive-gateway | 2.5.25 | 240 | 244 | 236 | 1.1% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,504 | 2,626 | 2,466 | 2.1% |  |
| hotchocolate | 16.1.3-p.1 | 1,996 | 2,046 | 1,746 | 4.5% |  |
| grafbase | 0.53.3 | 1,545 | 1,570 | 1,525 | 0.9% |  |
| cosmo | 0.307.0 | 1,213 | 1,236 | 1,207 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 528 | 540 | 522 | 1.1% |  |
| apollo-router | v2.13.1 | 396 | 403 | 392 | 0.8% |  |
| hive-gateway | 2.5.25 | 239 | 244 | 236 | 1.1% |  |
| apollo-gateway | 2.13.3 | 237 | 240 | 236 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1115115     ✗ 0     
     data_received..................: 33 GB   271 MB/s
     data_sent......................: 447 MB  3.7 MB/s
     http_req_blocked...............: avg=2.72µs   min=972ns   med=2.05µs  max=27.8ms   p(90)=3.22µs   p(95)=3.89µs   p(99.9)=32.25µs
     http_req_connecting............: avg=98ns     min=0s      med=0s      max=1.71ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.9ms   min=1.63ms  med=15.06ms max=325.38ms p(90)=23.23ms  p(95)=26.77ms  p(99.9)=49.36ms
       { expected_response:true }...: avg=15.9ms   min=1.63ms  med=15.06ms max=325.38ms p(90)=23.23ms  p(95)=26.77ms  p(99.9)=49.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 371805
     http_req_receiving.............: avg=135.88µs min=27.31µs med=49.74µs max=217.99ms p(90)=101.05µs p(95)=275.28µs p(99.9)=11.83ms
     http_req_sending...............: avg=59.03µs  min=4.43µs  med=8.93µs  max=269.09ms p(90)=15.73µs  p(95)=121.42µs p(99.9)=7.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.71ms  min=1.58ms  med=14.91ms max=138.51ms p(90)=22.98ms  p(95)=26.38ms  p(99.9)=48.01ms
     http_reqs......................: 371805  3093.095142/s
     iteration_duration.............: avg=16.13ms  min=2.04ms  med=15.26ms max=359.29ms p(90)=23.45ms  p(95)=27.01ms  p(99.9)=50.54ms
     iterations.....................: 371705  3092.263228/s
     success_rate...................: 100.00% ✓ 371705      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 786063      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 315 MB  2.6 MB/s
     http_req_blocked...............: avg=2.63µs   min=972ns   med=2.04µs   max=3.33ms   p(90)=3.17µs   p(95)=3.76µs   p(99.9)=30.65µs 
     http_req_connecting............: avg=253ns    min=0s      med=0s       max=3.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.66ms  min=2.47ms  med=14.41ms  max=315.88ms p(90)=50.75ms  p(95)=68.91ms  p(99.9)=163.11ms
       { expected_response:true }...: avg=22.66ms  min=2.47ms  med=14.41ms  max=315.88ms p(90)=50.75ms  p(95)=68.91ms  p(99.9)=163.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262121
     http_req_receiving.............: avg=628.33µs min=50.39µs med=107.44µs max=195.23ms p(90)=934.35µs p(95)=1.44ms   p(99.9)=58.77ms 
     http_req_sending...............: avg=41.66µs  min=5.02µs  med=9.11µs   max=177ms    p(90)=15.5µs   p(95)=108.45µs p(99.9)=2.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.99ms  min=2.35ms  med=13.92ms  max=315.61ms p(90)=49.39ms  p(95)=67.57ms  p(99.9)=160.8ms 
     http_reqs......................: 262121  2178.779121/s
     iteration_duration.............: avg=22.89ms  min=3.22ms  med=14.63ms  max=344.33ms p(90)=50.99ms  p(95)=69.14ms  p(99.9)=164.24ms
     iterations.....................: 262021  2177.94791/s
     success_rate...................: 100.00% ✓ 262021      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 749679      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 300 MB  2.5 MB/s
     http_req_blocked...............: avg=3.32µs   min=982ns   med=2.21µs  max=15.11ms  p(90)=3.72µs   p(95)=4.52µs   p(99.9)=44.25µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.76ms  min=1.91ms  med=23.52ms max=317.89ms p(90)=28.5ms   p(95)=30.78ms  p(99.9)=52.75ms
       { expected_response:true }...: avg=23.76ms  min=1.91ms  med=23.52ms max=317.89ms p(90)=28.5ms   p(95)=30.78ms  p(99.9)=52.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 249993
     http_req_receiving.............: avg=116.07µs min=29.61µs med=56.9µs  max=159.58ms p(90)=100.16µs p(95)=195.16µs p(99.9)=9.08ms 
     http_req_sending...............: avg=48.8µs   min=4.66µs  med=9.86µs  max=225.94ms p(90)=17.61µs  p(95)=115.59µs p(99.9)=4ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.6ms   min=1.81ms  med=23.41ms max=197.79ms p(90)=28.33ms  p(95)=30.53ms  p(99.9)=51.93ms
     http_reqs......................: 249993  2078.786578/s
     iteration_duration.............: avg=24ms     min=3.12ms  med=23.73ms max=375.55ms p(90)=28.72ms  p(95)=31.02ms  p(99.9)=53.41ms
     iterations.....................: 249893  2077.95504/s
     success_rate...................: 100.00% ✓ 249893      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 459423      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.8µs   min=1.04µs  med=2.46µs  max=20.74ms  p(90)=3.87µs  p(95)=4.51µs   p(99.9)=36.47µs
     http_req_connecting............: avg=1.01µs  min=0s      med=0s      max=20.7ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.93ms min=2.16ms  med=38.38ms max=325.34ms p(90)=55ms    p(95)=60.05ms  p(99.9)=84.42ms
       { expected_response:true }...: avg=38.93ms min=2.16ms  med=38.38ms max=325.34ms p(90)=55ms    p(95)=60.05ms  p(99.9)=84.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153241
     http_req_receiving.............: avg=85.89µs min=28.26µs med=61.6µs  max=151.07ms p(90)=98.82µs p(95)=117.59µs p(99.9)=2.01ms 
     http_req_sending...............: avg=26.87µs min=5.39µs  med=10.76µs max=123.19ms p(90)=16.86µs p(95)=21.06µs  p(99.9)=1.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.81ms min=2.08ms  med=38.27ms max=271.09ms p(90)=54.89ms p(95)=59.93ms  p(99.9)=84.13ms
     http_reqs......................: 153241  1274.086096/s
     iteration_duration.............: avg=39.17ms min=4.1ms   med=38.58ms max=335.42ms p(90)=55.21ms p(95)=60.27ms  p(99.9)=85.15ms
     iterations.....................: 153141  1273.25467/s
     success_rate...................: 100.00% ✓ 153141      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 198624     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   661 kB/s
     http_req_blocked...............: avg=4.18µs  min=1.13µs  med=2.95µs  max=3.29ms   p(90)=4.53µs   p(95)=5.17µs   p(99.9)=60.22µs 
     http_req_connecting............: avg=923ns   min=0s      med=0s      max=3.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.25ms min=4.05ms  med=87.58ms max=334.87ms p(90)=108.94ms p(95)=120.37ms p(99.9)=215.26ms
       { expected_response:true }...: avg=90.25ms min=4.05ms  med=87.58ms max=334.87ms p(90)=108.94ms p(95)=120.37ms p(99.9)=215.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66308
     http_req_receiving.............: avg=85.27µs min=31.82µs med=77.67µs max=5.82ms   p(90)=112.41µs p(95)=125.64µs p(99.9)=894.22µs
     http_req_sending...............: avg=31.07µs min=5.79µs  med=13.3µs  max=200.35ms p(90)=20.31µs  p(95)=22.73µs  p(99.9)=814.14µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.13ms min=3.99ms  med=87.47ms max=333.97ms p(90)=108.82ms p(95)=120.25ms p(99.9)=214.65ms
     http_reqs......................: 66308   550.121273/s
     iteration_duration.............: avg=90.63ms min=19.73ms med=87.81ms max=371.22ms p(90)=109.19ms p(95)=120.71ms p(99.9)=219.79ms
     iterations.....................: 66208   549.291627/s
     success_rate...................: 100.00% ✓ 66208      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 150879     ✗ 0    
     data_received..................: 4.4 GB  37 MB/s
     data_sent......................: 61 MB   501 kB/s
     http_req_blocked...............: avg=5.45µs   min=1.21µs  med=3.21µs   max=4.12ms   p(90)=4.65µs   p(95)=5.21µs   p(99.9)=177.08µs
     http_req_connecting............: avg=2.02µs   min=0s      med=0s       max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=32.43µs 
     http_req_duration..............: avg=118.84ms min=5.56ms  med=118.66ms max=325.05ms p(90)=143.98ms p(95)=151.33ms p(99.9)=186.99ms
       { expected_response:true }...: avg=118.84ms min=5.56ms  med=118.66ms max=325.05ms p(90)=143.98ms p(95)=151.33ms p(99.9)=186.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50393
     http_req_receiving.............: avg=88.75µs  min=29.93µs med=82.72µs  max=52.27ms  p(90)=114.02µs p(95)=126.02µs p(99.9)=667.68µs
     http_req_sending...............: avg=26.07µs  min=5.94µs  med=15.37µs  max=109.26ms p(90)=21µs     p(95)=22.78µs  p(99.9)=512.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.72ms min=5.45ms  med=118.55ms max=324.5ms  p(90)=143.88ms p(95)=151.22ms p(99.9)=185.46ms
     http_reqs......................: 50393   417.502809/s
     iteration_duration.............: avg=119.32ms min=32.78ms med=118.94ms max=340.07ms p(90)=144.24ms p(95)=151.6ms  p(99.9)=190.21ms
     iterations.....................: 50293   416.674316/s
     success_rate...................: 100.00% ✓ 50293      ✗ 0    
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

     checks.........................: 100.00% ✓ 90513      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   300 kB/s
     http_req_blocked...............: avg=7.14µs   min=1.23µs  med=3.21µs   max=4.63ms   p(90)=4.48µs   p(95)=5µs      p(99.9)=1.71ms  
     http_req_connecting............: avg=3.72µs   min=0s      med=0s       max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=198.05ms min=8.33ms  med=199.46ms max=453.33ms p(90)=206.52ms p(95)=211.71ms p(99.9)=274.67ms
       { expected_response:true }...: avg=198.05ms min=8.33ms  med=199.46ms max=453.33ms p(90)=206.52ms p(95)=211.71ms p(99.9)=274.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30271
     http_req_receiving.............: avg=94.14µs  min=34.01µs med=90.24µs  max=4.64ms   p(90)=120.68µs p(95)=132.8µs  p(99.9)=546.13µs
     http_req_sending...............: avg=42.61µs  min=5.94µs  med=16.33µs  max=185.62ms p(90)=21µs     p(95)=22.81µs  p(99.9)=498.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.92ms min=8.2ms   med=199.34ms max=453.05ms p(90)=206.39ms p(95)=211.57ms p(99.9)=274.55ms
     http_reqs......................: 30271   250.075626/s
     iteration_duration.............: avg=198.98ms min=64.2ms  med=199.8ms  max=467.54ms p(90)=206.78ms p(95)=212ms    p(99.9)=297.74ms
     iterations.....................: 30171   249.249503/s
     success_rate...................: 100.00% ✓ 30171      ✗ 0    
     vus............................: 27      min=27       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87036      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=6.01µs   min=1.32µs  med=3.45µs   max=3.87ms   p(90)=4.86µs   p(95)=5.51µs   p(99.9)=650.76µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=506.23µs
     http_req_duration..............: avg=206ms    min=6.56ms  med=186.23ms max=648.43ms p(90)=244.12ms p(95)=454.14ms p(99.9)=577.3ms 
       { expected_response:true }...: avg=206ms    min=6.56ms  med=186.23ms max=648.43ms p(90)=244.12ms p(95)=454.14ms p(99.9)=577.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29112
     http_req_receiving.............: avg=151.36µs min=34.16µs med=95.58µs  max=111.25ms p(90)=127.73µs p(95)=141.36µs p(99.9)=1.36ms  
     http_req_sending...............: avg=28.63µs  min=6.36µs  med=17.45µs  max=117.56ms p(90)=22.79µs  p(95)=24.74µs  p(99.9)=691.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.82ms min=6.42ms  med=186.08ms max=648.3ms  p(90)=243.94ms p(95)=454.03ms p(99.9)=577.19ms
     http_reqs......................: 29112   240.521179/s
     iteration_duration.............: avg=207ms    min=40.5ms  med=186.61ms max=648.68ms p(90)=244.78ms p(95)=455.1ms  p(99.9)=577.54ms
     iterations.....................: 29012   239.694986/s
     success_rate...................: 100.00% ✓ 29012      ✗ 0    
     vus............................: 9       min=9        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 902961      ✗ 0     
     data_received..................: 26 GB   219 MB/s
     data_sent......................: 362 MB  3.0 MB/s
     http_req_blocked...............: avg=4.12µs   min=1µs     med=2.5µs   max=23.68ms  p(90)=4.08µs   p(95)=4.93µs   p(99.9)=39.82µs
     http_req_connecting............: avg=945ns    min=0s      med=0s      max=11.81ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.68ms  min=1.81ms  med=19.06ms max=288.95ms p(90)=27.32ms  p(95)=30.64ms  p(99.9)=53.93ms
       { expected_response:true }...: avg=19.68ms  min=1.81ms  med=19.06ms max=288.95ms p(90)=27.32ms  p(95)=30.64ms  p(99.9)=53.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 301087
     http_req_receiving.............: avg=124.06µs min=27.61µs med=54.29µs max=57.94ms  p(90)=110.19µs p(95)=283.05µs p(99.9)=9.7ms  
     http_req_sending...............: avg=57.62µs  min=5.33µs  med=10.16µs max=189.68ms p(90)=19.59µs  p(95)=130.58µs p(99.9)=7.22ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.5ms   min=1.73ms  med=18.91ms max=286.9ms  p(90)=27.1ms   p(95)=30.3ms   p(99.9)=52.87ms
     http_reqs......................: 301087  2504.104992/s
     iteration_duration.............: avg=19.92ms  min=3.17ms  med=19.28ms max=379.39ms p(90)=27.55ms  p(95)=30.9ms   p(99.9)=54.6ms 
     iterations.....................: 300987  2503.273304/s
     success_rate...................: 100.00% ✓ 300987      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 719778      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.17µs   min=952ns   med=2.23µs   max=7.68ms   p(90)=3.75µs  p(95)=4.49µs   p(99.9)=38.06µs 
     http_req_connecting............: avg=437ns    min=0s      med=0s       max=4.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.76ms  min=1.9ms   med=17.28ms  max=593.38ms p(90)=51.6ms  p(95)=68.26ms  p(99.9)=186.37ms
       { expected_response:true }...: avg=24.76ms  min=1.9ms   med=17.28ms  max=593.38ms p(90)=51.6ms  p(95)=68.26ms  p(99.9)=186.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 240026
     http_req_receiving.............: avg=659.25µs min=51.67µs med=103.61µs max=272.24ms p(90)=1.12ms  p(95)=1.83ms   p(99.9)=54.33ms 
     http_req_sending...............: avg=42.85µs  min=5.24µs  med=9.68µs   max=135.4ms  p(90)=18.59µs p(95)=111.36µs p(99.9)=2.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.06ms  min=1.78ms  med=16.72ms  max=593.27ms p(90)=50.43ms p(95)=66.77ms  p(99.9)=183.84ms
     http_reqs......................: 240026  1996.246285/s
     iteration_duration.............: avg=24.99ms  min=2.93ms  med=17.5ms   max=593.54ms p(90)=51.85ms p(95)=68.49ms  p(99.9)=188.13ms
     iterations.....................: 239926  1995.414606/s
     success_rate...................: 100.00% ✓ 239926      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 557673      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 224 MB  1.9 MB/s
     http_req_blocked...............: avg=3.24µs   min=1.01µs  med=2.4µs   max=2.44ms   p(90)=4.76µs   p(95)=5.9µs    p(99.9)=46.1µs 
     http_req_connecting............: avg=231ns    min=0s      med=0s      max=2.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32ms     min=2.48ms  med=31.1ms  max=344.69ms p(90)=42.43ms  p(95)=46.87ms  p(99.9)=88.01ms
       { expected_response:true }...: avg=32ms     min=2.48ms  med=31.1ms  max=344.69ms p(90)=42.43ms  p(95)=46.87ms  p(99.9)=88.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185991
     http_req_receiving.............: avg=112.04µs min=30.49µs med=61.87µs max=120.54ms p(90)=134.87µs p(95)=277.54µs p(99.9)=5.59ms 
     http_req_sending...............: avg=47.25µs  min=5.5µs   med=10.56µs max=168.27ms p(90)=24.58µs  p(95)=136.82µs p(99.9)=3.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.84ms  min=2.35ms  med=30.97ms max=332.22ms p(90)=42.25ms  p(95)=46.66ms  p(99.9)=87.54ms
     http_reqs......................: 185991  1545.858868/s
     iteration_duration.............: avg=32.26ms  min=4.18ms  med=31.34ms max=353.77ms p(90)=42.68ms  p(95)=47.12ms  p(99.9)=88.52ms
     iterations.....................: 185891  1545.027721/s
     success_rate...................: 100.00% ✓ 185891      ✗ 0     
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

     checks.........................: 100.00% ✓ 437661     ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.1µs   min=1.05µs  med=2.43µs  max=5.25ms   p(90)=4.05µs   p(95)=4.72µs   p(99.9)=32.67µs
     http_req_connecting............: avg=284ns   min=0s      med=0s      max=2.17ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.87ms min=2.16ms  med=40.33ms max=320.07ms p(90)=57.33ms  p(95)=62.53ms  p(99.9)=87.83ms
       { expected_response:true }...: avg=40.87ms min=2.16ms  med=40.33ms max=320.07ms p(90)=57.33ms  p(95)=62.53ms  p(99.9)=87.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 145987
     http_req_receiving.............: avg=87.2µs  min=29.21µs med=66.07µs max=257ms    p(90)=105.21µs p(95)=123.91µs p(99.9)=1.79ms 
     http_req_sending...............: avg=29.99µs min=5.36µs  med=11.6µs  max=158.82ms p(90)=19µs     p(95)=22.79µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.75ms min=2.03ms  med=40.22ms max=319.51ms p(90)=57.22ms  p(95)=62.41ms  p(99.9)=87.08ms
     http_reqs......................: 145987  1213.66242/s
     iteration_duration.............: avg=41.12ms min=4.31ms  med=40.54ms max=329.21ms p(90)=57.54ms  p(95)=62.75ms  p(99.9)=88.54ms
     iterations.....................: 145887  1212.83107/s
     success_rate...................: 100.00% ✓ 145887     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 190794     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   634 kB/s
     http_req_blocked...............: avg=4.11µs   min=1.14µs  med=3.09µs  max=4.86ms   p(90)=4.61µs   p(95)=5.2µs    p(99.9)=52.34µs 
     http_req_connecting............: avg=728ns    min=0s      med=0s      max=2.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.98ms  min=4.2ms   med=90.82ms max=383.57ms p(90)=117.8ms  p(95)=132.84ms p(99.9)=225.31ms
       { expected_response:true }...: avg=93.98ms  min=4.2ms   med=90.82ms max=383.57ms p(90)=117.8ms  p(95)=132.84ms p(99.9)=225.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63698
     http_req_receiving.............: avg=146.69µs min=32.91µs med=81.42µs max=245.44ms p(90)=115.27µs p(95)=128.2µs  p(99.9)=978.82µs
     http_req_sending...............: avg=27.69µs  min=5.58µs  med=14.54µs max=235.48ms p(90)=21.31µs  p(95)=23.52µs  p(99.9)=623.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.8ms   min=4.08ms  med=90.71ms max=265.56ms p(90)=117.64ms p(95)=132.55ms p(99.9)=221.21ms
     http_reqs......................: 63698   528.192541/s
     iteration_duration.............: avg=94.36ms  min=13.96ms med=91.1ms  max=383.95ms p(90)=118.07ms p(95)=133.15ms p(99.9)=227.09ms
     iterations.....................: 63598   527.363327/s
     success_rate...................: 100.00% ✓ 63598      ✗ 0    
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

     checks.........................: 100.00% ✓ 143175     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   476 kB/s
     http_req_blocked...............: avg=5.65µs   min=1.21µs  med=3.53µs   max=8.04ms   p(90)=5.09µs   p(95)=5.68µs   p(99.9)=232.29µs
     http_req_connecting............: avg=1.68µs   min=0s      med=0s       max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=137.24µs
     http_req_duration..............: avg=125.22ms min=6.05ms  med=122.82ms max=351.32ms p(90)=166.05ms p(95)=178.07ms p(99.9)=225.4ms 
       { expected_response:true }...: avg=125.22ms min=6.05ms  med=122.82ms max=351.32ms p(90)=166.05ms p(95)=178.07ms p(99.9)=225.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 47825
     http_req_receiving.............: avg=99.13µs  min=33.05µs med=90.19µs  max=200.87ms p(90)=121.38µs p(95)=134.8µs  p(99.9)=689.5µs 
     http_req_sending...............: avg=31.17µs  min=6.05µs  med=17.4µs   max=144.45ms p(90)=22.7µs   p(95)=24.56µs  p(99.9)=856.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.09ms min=5.92ms  med=122.7ms  max=342.94ms p(90)=165.93ms p(95)=177.95ms p(99.9)=224.8ms 
     http_reqs......................: 47825   396.028713/s
     iteration_duration.............: avg=125.75ms min=39.33ms med=123.15ms max=370.85ms p(90)=166.35ms p(95)=178.43ms p(99.9)=227.4ms 
     iterations.....................: 47725   395.200634/s
     success_rate...................: 100.00% ✓ 47725      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 86577      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.49µs   min=1.19µs  med=3.56µs   max=4.85ms   p(90)=5.03µs   p(95)=5.65µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.68µs   min=0s      med=0s       max=4.81ms   p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=207.03ms min=6.53ms  med=187.87ms max=729.94ms p(90)=243.42ms p(95)=444.79ms p(99.9)=587.61ms
       { expected_response:true }...: avg=207.03ms min=6.53ms  med=187.87ms max=729.94ms p(90)=243.42ms p(95)=444.79ms p(99.9)=587.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28959
     http_req_receiving.............: avg=106.69µs min=33.18µs med=99.67µs  max=44.56ms  p(90)=131.4µs  p(95)=145.03µs p(99.9)=613.25µs
     http_req_sending...............: avg=37.23µs  min=6.56µs  med=18.76µs  max=148.95ms p(90)=23.68µs  p(95)=25.42µs  p(99.9)=573.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.88ms min=6.39ms  med=187.73ms max=729.81ms p(90)=243.29ms p(95)=444.67ms p(99.9)=587.48ms
     http_reqs......................: 28959   239.246547/s
     iteration_duration.............: avg=208.04ms min=36.65ms med=188.25ms max=730.16ms p(90)=244.01ms p(95)=445.3ms  p(99.9)=587.87ms
     iterations.....................: 28859   238.420391/s
     success_rate...................: 100.00% ✓ 28859      ✗ 0    
     vus............................: 19      min=19       max=50 
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

     checks.........................: 100.00% ✓ 85956      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=5.87µs   min=1.28µs  med=3.31µs   max=3.06ms   p(90)=4.63µs   p(95)=5.15µs   p(99.9)=956.24µs
     http_req_connecting............: avg=2.35µs   min=0s      med=0s       max=3.04ms   p(90)=0s       p(95)=0s       p(99.9)=844.09µs
     http_req_duration..............: avg=208.58ms min=8.72ms  med=206.88ms max=379.69ms p(90)=221.4ms  p(95)=227.14ms p(99.9)=298.25ms
       { expected_response:true }...: avg=208.58ms min=8.72ms  med=206.88ms max=379.69ms p(90)=221.4ms  p(95)=227.14ms p(99.9)=298.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28752
     http_req_receiving.............: avg=97.53µs  min=32.45µs med=93.47µs  max=2.99ms   p(90)=124.28µs p(95)=137.24µs p(99.9)=679.33µs
     http_req_sending...............: avg=22.43µs  min=5.92µs  med=17.32µs  max=31.29ms  p(90)=21.86µs  p(95)=23.61µs  p(99.9)=592.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.46ms min=8.58ms  med=206.77ms max=379.21ms p(90)=221.29ms p(95)=227.05ms p(99.9)=298.17ms
     http_reqs......................: 28752   237.348945/s
     iteration_duration.............: avg=209.54ms min=49.39ms med=207.17ms max=385.16ms p(90)=221.66ms p(95)=227.43ms p(99.9)=298.47ms
     iterations.....................: 28652   236.523441/s
     success_rate...................: 100.00% ✓ 28652      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

