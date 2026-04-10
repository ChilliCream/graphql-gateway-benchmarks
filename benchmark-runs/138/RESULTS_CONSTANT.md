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
| hive-router | v0.0.43 | 3,073 | 3,275 | 3,035 | 2.6% |  |
| hotchocolate | 16.0.0-rc.1.27 | 2,131 | 2,166 | 2,089 | 1.2% |  |
| grafbase | 0.53.2 | 1,996 | 2,072 | 1,967 | 1.6% |  |
| cosmo | 0.298.0 | 1,244 | 1,273 | 1,233 | 1.4% | non-compatible response (5 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 601 | 615 | 596 | 1.1% |  |
| apollo-router | v2.12.1 | 432 | 435 | 429 | 0.7% |  |
| apollo-gateway | 2.13.3 | 245 | 247 | 243 | 0.5% |  |
| hive-gateway | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,490 | 2,599 | 2,454 | 1.8% |  |
| hotchocolate | 16.0.0-rc.1.27 | 1,907 | 1,958 | 1,886 | 1.3% |  |
| grafbase | 0.53.2 | 1,531 | 1,550 | 1,518 | 0.8% |  |
| cosmo | 0.298.0 | 1,195 | 1,214 | 1,181 | 1.0% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 571 | 588 | 565 | 1.5% |  |
| apollo-router | v2.12.1 | 377 | 391 | 365 | 2.1% |  |
| hive-gateway | 2.5.14 | 260 | 267 | 258 | 1.2% |  |
| apollo-gateway | 2.13.3 | 237 | 240 | 235 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1107789     ✗ 0     
     data_received..................: 32 GB   270 MB/s
     data_sent......................: 444 MB  3.7 MB/s
     http_req_blocked...............: avg=2.99µs   min=992ns   med=1.98µs  max=24.27ms  p(90)=3.13µs  p(95)=3.75µs   p(99.9)=31.67µs
     http_req_connecting............: avg=291ns    min=0s      med=0s      max=4.33ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16ms     min=1.59ms  med=14.85ms max=312.59ms p(90)=24.02ms p(95)=28.73ms  p(99.9)=52ms   
       { expected_response:true }...: avg=16ms     min=1.59ms  med=14.85ms max=312.59ms p(90)=24.02ms p(95)=28.73ms  p(99.9)=52ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 369363
     http_req_receiving.............: avg=155.65µs min=27.82µs med=46.07µs max=169.07ms p(90)=92.98µs p(95)=278.41µs p(99.9)=17.84ms
     http_req_sending...............: avg=63.12µs  min=4.98µs  med=8.55µs  max=141.62ms p(90)=14.4µs  p(95)=116.79µs p(99.9)=16.3ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.78ms  min=1.53ms  med=14.71ms max=300.93ms p(90)=23.65ms p(95)=28.13ms  p(99.9)=50.17ms
     http_reqs......................: 369363  3073.010863/s
     iteration_duration.............: avg=16.23ms  min=1.93ms  med=15.06ms max=327.68ms p(90)=24.26ms p(95)=29.02ms  p(99.9)=53.59ms
     iterations.....................: 369263  3072.178887/s
     success_rate...................: 100.00% ✓ 369263      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.27)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 768996      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=3.01µs   min=1.01µs  med=2.36µs   max=15.15ms  p(90)=3.52µs   p(95)=4.1µs    p(99.9)=35.41µs 
     http_req_connecting............: avg=199ns    min=0s      med=0s       max=2.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.16ms  min=2.49ms  med=14.62ms  max=340.52ms p(90)=52.28ms  p(95)=70.69ms  p(99.9)=167.19ms
       { expected_response:true }...: avg=23.16ms  min=2.49ms  med=14.62ms  max=340.52ms p(90)=52.28ms  p(95)=70.69ms  p(99.9)=167.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256432
     http_req_receiving.............: avg=624.26µs min=53.08µs med=104.92µs max=217.03ms p(90)=958.39µs p(95)=1.5ms    p(99.9)=56.88ms 
     http_req_sending...............: avg=45.02µs  min=5.18µs  med=9.37µs   max=129.31ms p(90)=15.25µs  p(95)=109.53µs p(99.9)=3.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.49ms  min=2.35ms  med=14.11ms  max=340.18ms p(90)=51.01ms  p(95)=69.31ms  p(99.9)=165.33ms
     http_reqs......................: 256432  2131.609755/s
     iteration_duration.............: avg=23.39ms  min=3.52ms  med=14.84ms  max=358.75ms p(90)=52.52ms  p(95)=70.94ms  p(99.9)=168.46ms
     iterations.....................: 256332  2130.778498/s
     success_rate...................: 100.00% ✓ 256332      ✗ 0     
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

     checks.........................: 100.00% ✓ 719784      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.55µs   min=992ns  med=2.62µs  max=9.25ms   p(90)=4.11µs   p(95)=4.87µs   p(99.9)=44.34µs
     http_req_connecting............: avg=414ns    min=0s     med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.75ms  min=2ms    med=24.5ms  max=351.69ms p(90)=29.77ms  p(95)=32.1ms   p(99.9)=55.91ms
       { expected_response:true }...: avg=24.75ms  min=2ms    med=24.5ms  max=351.69ms p(90)=29.77ms  p(95)=32.1ms   p(99.9)=55.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 240028
     http_req_receiving.............: avg=140.26µs min=29.8µs med=61.19µs max=310.04ms p(90)=104.64µs p(95)=189.3µs  p(99.9)=10.16ms
     http_req_sending...............: avg=46.42µs  min=5.17µs med=10.75µs max=56.25ms  p(90)=18.19µs  p(95)=119.62µs p(99.9)=3.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.57ms  min=1.92ms med=24.38ms max=85.87ms  p(90)=29.59ms  p(95)=31.85ms  p(99.9)=52.82ms
     http_reqs......................: 240028  1996.014553/s
     iteration_duration.............: avg=24.99ms  min=4.55ms med=24.71ms max=389.14ms p(90)=30ms     p(95)=32.36ms  p(99.9)=56.47ms
     iterations.....................: 239928  1995.182977/s
     success_rate...................: 100.00% ✓ 239928      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 448878      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.43µs  min=1.09µs  med=2.43µs  max=4.76ms   p(90)=3.69µs  p(95)=4.29µs   p(99.9)=36.75µs
     http_req_connecting............: avg=689ns   min=0s      med=0s      max=4.72ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.86ms min=2.16ms  med=39.34ms max=310.65ms p(90)=56.17ms p(95)=61.31ms  p(99.9)=86.65ms
       { expected_response:true }...: avg=39.86ms min=2.16ms  med=39.34ms max=310.65ms p(90)=56.17ms p(95)=61.31ms  p(99.9)=86.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149726
     http_req_receiving.............: avg=83.35µs min=29.16µs med=61.71µs max=153.36ms p(90)=96.94µs p(95)=114.58µs p(99.9)=2ms    
     http_req_sending...............: avg=24.34µs min=5.37µs  med=10.41µs max=96.08ms  p(90)=15.53µs p(95)=19.48µs  p(99.9)=1.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.75ms min=2.09ms  med=39.24ms max=310.01ms p(90)=56.03ms p(95)=61.19ms  p(99.9)=86.3ms 
     http_reqs......................: 149726  1244.809016/s
     iteration_duration.............: avg=40.09ms min=3.75ms  med=39.54ms max=351.65ms p(90)=56.38ms p(95)=61.51ms  p(99.9)=87.08ms
     iterations.....................: 149626  1243.977624/s
     success_rate...................: 100.00% ✓ 149626      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 217143     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 87 MB   722 kB/s
     http_req_blocked...............: avg=4.37µs  min=1.19µs  med=2.83µs  max=4.03ms   p(90)=4.28µs   p(95)=4.88µs   p(99.9)=43.28µs 
     http_req_connecting............: avg=1.25µs  min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=82.56ms min=3.83ms  med=79.57ms max=338.29ms p(90)=101.17ms p(95)=112.43ms p(99.9)=210.1ms 
       { expected_response:true }...: avg=82.56ms min=3.83ms  med=79.57ms max=338.29ms p(90)=101.17ms p(95)=112.43ms p(99.9)=210.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 72481
     http_req_receiving.............: avg=82.97µs min=31.95µs med=74.73µs max=16.04ms  p(90)=108.16µs p(95)=120.77µs p(99.9)=891.09µs
     http_req_sending...............: avg=27.32µs min=5.87µs  med=12.92µs max=151.13ms p(90)=19.15µs  p(95)=21.48µs  p(99.9)=685.45µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.45ms min=3.76ms  med=79.46ms max=328.52ms p(90)=101.06ms p(95)=112.32ms p(99.9)=209.73ms
     http_reqs......................: 72481   601.374687/s
     iteration_duration.............: avg=82.91ms min=20.46ms med=79.8ms  max=351.49ms p(90)=101.39ms p(95)=112.68ms p(99.9)=211.73ms
     iterations.....................: 72381   600.544987/s
     success_rate...................: 100.00% ✓ 72381      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 156174     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   519 kB/s
     http_req_blocked...............: avg=5.56µs   min=1.21µs  med=3.32µs   max=4.73ms   p(90)=4.69µs   p(95)=5.23µs   p(99.9)=113.83µs
     http_req_connecting............: avg=1.98µs   min=0s      med=0s       max=4.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.81ms min=5.44ms  med=114.45ms max=357.75ms p(90)=138.48ms p(95)=145.67ms p(99.9)=181.24ms
       { expected_response:true }...: avg=114.81ms min=5.44ms  med=114.45ms max=357.75ms p(90)=138.48ms p(95)=145.67ms p(99.9)=181.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52158
     http_req_receiving.............: avg=96.3µs   min=31.37µs med=82.69µs  max=262.52ms p(90)=113.12µs p(95)=124.68µs p(99.9)=829.63µs
     http_req_sending...............: avg=27.63µs  min=6.05µs  med=15.71µs  max=155.68ms p(90)=21.15µs  p(95)=22.88µs  p(99.9)=610.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.68ms min=5.33ms  med=114.33ms max=346.06ms p(90)=138.35ms p(95)=145.55ms p(99.9)=179.89ms
     http_reqs......................: 52158   432.189287/s
     iteration_duration.............: avg=115.28ms min=29.54ms med=114.73ms max=377.62ms p(90)=138.74ms p(95)=145.93ms p(99.9)=185.34ms
     iterations.....................: 52058   431.360672/s
     success_rate...................: 100.00% ✓ 52058      ✗ 0    
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

     checks.........................: 100.00% ✓ 88710      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=7.76µs   min=1.27µs  med=3.35µs   max=4.54ms   p(90)=4.65µs   p(95)=5.18µs   p(99.9)=2.25ms  
     http_req_connecting............: avg=4.21µs   min=0s      med=0s       max=4.49ms   p(90)=0s       p(95)=0s       p(99.9)=2.2ms   
     http_req_duration..............: avg=202.06ms min=8.37ms  med=203.98ms max=426.71ms p(90)=227.09ms p(95)=233.3ms  p(99.9)=304.88ms
       { expected_response:true }...: avg=202.06ms min=8.37ms  med=203.98ms max=426.71ms p(90)=227.09ms p(95)=233.3ms  p(99.9)=304.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29670
     http_req_receiving.............: avg=97.28µs  min=32.61µs med=91.12µs  max=61.1ms   p(90)=122.87µs p(95)=135.62µs p(99.9)=536.27µs
     http_req_sending...............: avg=47.12µs  min=6.15µs  med=16.61µs  max=223.12ms p(90)=21.47µs  p(95)=23.16µs  p(99.9)=536.3µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.92ms min=8.28ms  med=203.87ms max=426.24ms p(90)=226.98ms p(95)=233.08ms p(99.9)=302.97ms
     http_reqs......................: 29670   245.124078/s
     iteration_duration.............: avg=203.02ms min=54.4ms  med=204.26ms max=455.84ms p(90)=227.4ms  p(95)=233.65ms p(99.9)=311.76ms
     iterations.....................: 29570   244.297909/s
     success_rate...................: 100.00% ✓ 29570      ✗ 0    
     vus............................: 22      min=22       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 897936      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 360 MB  3.0 MB/s
     http_req_blocked...............: avg=2.8µs   min=1µs     med=2.13µs  max=8.83ms   p(90)=3.53µs   p(95)=4.35µs   p(99.9)=32.29µs
     http_req_connecting............: avg=129ns   min=0s      med=0s      max=1.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.8ms  min=1.85ms  med=19.22ms max=329.32ms p(90)=27.37ms  p(95)=30.59ms  p(99.9)=53.36ms
       { expected_response:true }...: avg=19.8ms  min=1.85ms  med=19.22ms max=329.32ms p(90)=27.37ms  p(95)=30.59ms  p(99.9)=53.36ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 299412
     http_req_receiving.............: avg=114.6µs min=27.65µs med=52.4µs  max=100.13ms p(90)=102.74µs p(95)=261.63µs p(99.9)=8.65ms 
     http_req_sending...............: avg=54.27µs min=5.21µs  med=9.42µs  max=222.03ms p(90)=18.02µs  p(95)=122.95µs p(99.9)=6.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.63ms min=1.75ms  med=19.08ms max=328.63ms p(90)=27.17ms  p(95)=30.31ms  p(99.9)=52.21ms
     http_reqs......................: 299412  2490.285796/s
     iteration_duration.............: avg=20.03ms min=2.8ms   med=19.43ms max=339.39ms p(90)=27.59ms  p(95)=30.83ms  p(99.9)=54.03ms
     iterations.....................: 299312  2489.454071/s
     success_rate...................: 100.00% ✓ 299312      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.27)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687903      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=3.46µs   min=1.03µs  med=2.56µs   max=5.69ms   p(90)=3.92µs  p(95)=4.61µs   p(99.9)=36.33µs 
     http_req_connecting............: avg=507ns    min=0s      med=0s       max=4.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.91ms  min=1.96ms  med=17.52ms  max=532.16ms p(90)=55.21ms p(95)=73.16ms  p(99.9)=196.44ms
       { expected_response:true }...: avg=25.91ms  min=1.96ms  med=17.52ms  max=532.16ms p(90)=55.21ms p(95)=73.16ms  p(99.9)=196.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229401
     http_req_receiving.............: avg=702.99µs min=52.65µs med=113.76µs max=211.69ms p(90)=1.13ms  p(95)=1.8ms    p(99.9)=60.14ms 
     http_req_sending...............: avg=42.17µs  min=5.38µs  med=10.34µs  max=217.99ms p(90)=18µs    p(95)=109.51µs p(99.9)=2.59ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=25.17ms  min=1.84ms  med=16.95ms  max=531.23ms p(90)=53.88ms p(95)=71.68ms  p(99.9)=192.17ms
     http_reqs......................: 229401  1907.710425/s
     iteration_duration.............: avg=26.15ms  min=2.66ms  med=17.74ms  max=532.38ms p(90)=55.45ms p(95)=73.41ms  p(99.9)=201.3ms 
     iterations.....................: 229301  1906.87882/s
     success_rate...................: 100.00% ✓ 229301      ✗ 0     
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

     checks.........................: 100.00% ✓ 552558      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.71µs   min=942ns   med=2.41µs  max=12.61ms  p(90)=4.71µs   p(95)=5.86µs   p(99.9)=40.24µs
     http_req_connecting............: avg=592ns    min=0s      med=0s      max=4.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.3ms   min=2.4ms   med=31.28ms max=342ms    p(90)=43.27ms  p(95)=48.05ms  p(99.9)=86.76ms
       { expected_response:true }...: avg=32.3ms   min=2.4ms   med=31.28ms max=342ms    p(90)=43.27ms  p(95)=48.05ms  p(99.9)=86.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184286
     http_req_receiving.............: avg=114.42µs min=30.38µs med=62.19µs max=143.39ms p(90)=134.54µs p(95)=277.5µs  p(99.9)=5.61ms 
     http_req_sending...............: avg=47.82µs  min=5.34µs  med=10.58µs max=153.57ms p(90)=24.39µs  p(95)=133.83µs p(99.9)=3.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.14ms  min=2.33ms  med=31.15ms max=341.4ms  p(90)=43.08ms  p(95)=47.82ms  p(99.9)=85.77ms
     http_reqs......................: 184286  1531.831/s
     iteration_duration.............: avg=32.56ms  min=4.5ms   med=31.52ms max=368.56ms p(90)=43.5ms   p(95)=48.31ms  p(99.9)=87.83ms
     iterations.....................: 184186  1530.999775/s
     success_rate...................: 100.00% ✓ 184186      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 431097      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.82µs  min=1.11µs  med=2.75µs  max=3.93ms   p(90)=4.29µs   p(95)=4.96µs   p(99.9)=38.05µs
     http_req_connecting............: avg=734ns   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.49ms min=2.16ms  med=40.96ms max=321.18ms p(90)=58.27ms  p(95)=63.61ms  p(99.9)=89.74ms
       { expected_response:true }...: avg=41.49ms min=2.16ms  med=40.96ms max=321.18ms p(90)=58.27ms  p(95)=63.61ms  p(99.9)=89.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143799
     http_req_receiving.............: avg=88.12µs min=30.25µs med=66.3µs  max=107.66ms p(90)=105.45µs p(95)=125.52µs p(99.9)=2.03ms 
     http_req_sending...............: avg=28.6µs  min=5.36µs  med=11.68µs max=150.54ms p(90)=18.19µs  p(95)=22.35µs  p(99.9)=1.47ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.37ms min=2.04ms  med=40.85ms max=306.55ms p(90)=58.15ms  p(95)=63.47ms  p(99.9)=89.44ms
     http_reqs......................: 143799  1195.481964/s
     iteration_duration.............: avg=41.74ms min=4.58ms  med=41.18ms max=348.65ms p(90)=58.49ms  p(95)=63.83ms  p(99.9)=90.73ms
     iterations.....................: 143699  1194.650607/s
     success_rate...................: 100.00% ✓ 143699      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 206286     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   686 kB/s
     http_req_blocked...............: avg=4.85µs  min=1.16µs  med=3.1µs   max=4.27ms   p(90)=4.6µs    p(95)=5.22µs   p(99.9)=45.22µs 
     http_req_connecting............: avg=1.45µs  min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.9ms  min=3.86ms  med=84.28ms max=342.33ms p(90)=106.88ms p(95)=118.66ms p(99.9)=215.78ms
       { expected_response:true }...: avg=86.9ms  min=3.86ms  med=84.28ms max=342.33ms p(90)=106.88ms p(95)=118.66ms p(99.9)=215.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68862
     http_req_receiving.............: avg=91.34µs min=32.93µs med=80.52µs max=82.05ms  p(90)=114.07µs p(95)=126.74µs p(99.9)=929.94µs
     http_req_sending...............: avg=24.41µs min=6.09µs  med=13.74µs max=135.88ms p(90)=20.18µs  p(95)=22.28µs  p(99.9)=792.45µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.78ms min=3.79ms  med=84.17ms max=321.8ms  p(90)=106.77ms p(95)=118.52ms p(99.9)=215.29ms
     http_reqs......................: 68862   571.299981/s
     iteration_duration.............: avg=87.26ms min=21.95ms med=84.52ms max=373.56ms p(90)=107.11ms p(95)=118.95ms p(99.9)=218.45ms
     iterations.....................: 68762   570.470351/s
     success_rate...................: 100.00% ✓ 68762      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 136575     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   454 kB/s
     http_req_blocked...............: avg=6.31µs   min=1.2µs   med=3.52µs   max=4.52ms   p(90)=4.98µs   p(95)=5.53µs   p(99.9)=1.22ms  
     http_req_connecting............: avg=2.48µs   min=0s      med=0s       max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=1ms     
     http_req_duration..............: avg=131.27ms min=6.11ms  med=128.57ms max=358.52ms p(90)=174.11ms p(95)=187.37ms p(99.9)=238.31ms
       { expected_response:true }...: avg=131.27ms min=6.11ms  med=128.57ms max=358.52ms p(90)=174.11ms p(95)=187.37ms p(99.9)=238.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45625
     http_req_receiving.............: avg=93.67µs  min=34.1µs  med=89.06µs  max=8.15ms   p(90)=120.66µs p(95)=133.25µs p(99.9)=652.16µs
     http_req_sending...............: avg=27.54µs  min=5.98µs  med=16.91µs  max=79.79ms  p(90)=22.08µs  p(95)=23.93µs  p(99.9)=581.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=131.14ms min=5.95ms  med=128.45ms max=358.17ms p(90)=174ms    p(95)=187.27ms p(99.9)=237.98ms
     http_reqs......................: 45625   377.794247/s
     iteration_duration.............: avg=131.83ms min=22.57ms med=128.89ms max=368.61ms p(90)=174.46ms p(95)=187.72ms p(99.9)=241.21ms
     iterations.....................: 45525   376.966205/s
     success_rate...................: 100.00% ✓ 45525      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94056      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=7.14µs   min=1.33µs  med=3.43µs   max=4.35ms   p(90)=4.84µs   p(95)=5.39µs   p(99.9)=1.9ms   
     http_req_connecting............: avg=3.55µs   min=0s      med=0s       max=4.31ms   p(90)=0s       p(95)=0s       p(99.9)=1.87ms  
     http_req_duration..............: avg=190.58ms min=5.99ms  med=172.74ms max=633.67ms p(90)=224.82ms p(95)=385.77ms p(99.9)=555.59ms
       { expected_response:true }...: avg=190.58ms min=5.99ms  med=172.74ms max=633.67ms p(90)=224.82ms p(95)=385.77ms p(99.9)=555.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31452
     http_req_receiving.............: avg=100.61µs min=35.2µs  med=93.26µs  max=47.38ms  p(90)=124.9µs  p(95)=138.17µs p(99.9)=685.11µs
     http_req_sending...............: avg=33.8µs   min=6.33µs  med=17.12µs  max=109.73ms p(90)=22.2µs   p(95)=23.92µs  p(99.9)=482.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.45ms min=5.85ms  med=172.63ms max=633.57ms p(90)=224.67ms p(95)=385.63ms p(99.9)=555.48ms
     http_reqs......................: 31452   260.2392/s
     iteration_duration.............: avg=191.48ms min=43.78ms med=173.08ms max=633.91ms p(90)=225.41ms p(95)=388.54ms p(99.9)=555.93ms
     iterations.....................: 31352   259.411783/s
     success_rate...................: 100.00% ✓ 31352      ✗ 0    
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

     checks.........................: 100.00% ✓ 85827      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=4.84µs   min=1.15µs  med=3.37µs   max=1.91ms   p(90)=4.69µs   p(95)=5.22µs   p(99.9)=544.38µs
     http_req_connecting............: avg=1.31µs   min=0s      med=0s       max=1.88ms   p(90)=0s       p(95)=0s       p(99.9)=513.79µs
     http_req_duration..............: avg=208.84ms min=8.63ms  med=207.91ms max=376.16ms p(90)=220.01ms p(95)=225.23ms p(99.9)=291.01ms
       { expected_response:true }...: avg=208.84ms min=8.63ms  med=207.91ms max=376.16ms p(90)=220.01ms p(95)=225.23ms p(99.9)=291.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28709
     http_req_receiving.............: avg=129.05µs min=33.42µs med=91.94µs  max=158.71ms p(90)=123.12µs p(95)=135.65µs p(99.9)=881.46µs
     http_req_sending...............: avg=22.42µs  min=6.17µs  med=16.31µs  max=49.99ms  p(90)=21.19µs  p(95)=22.94µs  p(99.9)=590.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.68ms min=8.48ms  med=207.78ms max=375.89ms p(90)=219.87ms p(95)=225.06ms p(99.9)=290.4ms 
     http_reqs......................: 28709   237.101761/s
     iteration_duration.............: avg=209.83ms min=82.36ms med=208.3ms  max=389.8ms  p(90)=220.3ms  p(95)=225.54ms p(99.9)=293.81ms
     iterations.....................: 28609   236.275881/s
     success_rate...................: 100.00% ✓ 28609      ✗ 0    
     vus............................: 37      min=37       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

