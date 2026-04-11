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
| hive-router | v0.0.43 | 2,975 | 3,172 | 2,943 | 2.5% |  |
| hotchocolate | 16.0.0-rc.1.29 | 2,140 | 2,190 | 2,132 | 0.9% |  |
| grafbase | 0.53.2 | 2,039 | 2,096 | 2,021 | 1.3% |  |
| cosmo | 0.298.0 | 1,268 | 1,277 | 1,258 | 0.5% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 620 | 636 | 615 | 1.1% |  |
| apollo-router | v2.12.1 | 398 | 412 | 391 | 2.1% |  |
| hive-gateway | 2.5.14 | 265 | 270 | 262 | 0.9% |  |
| apollo-gateway | 2.13.3 | 247 | 250 | 245 | 0.7% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,375 | 2,504 | 2,346 | 2.2% |  |
| hotchocolate | 16.0.0-rc.1.29 | 1,973 | 2,017 | 1,948 | 1.1% |  |
| grafbase | 0.53.2 | 1,502 | 1,531 | 1,489 | 0.9% |  |
| cosmo | 0.298.0 | 1,170 | 1,189 | 1,162 | 0.9% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 580 | 598 | 572 | 1.5% |  |
| apollo-router | v2.12.1 | 382 | 392 | 378 | 1.2% |  |
| hive-gateway | 2.5.14 | 264 | 269 | 261 | 0.9% |  |
| apollo-gateway | 2.13.3 | 235 | 240 | 234 | 1.1% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1072599     ✗ 0     
     data_received..................: 31 GB   261 MB/s
     data_sent......................: 430 MB  3.6 MB/s
     http_req_blocked...............: avg=2.82µs   min=942ns  med=2.05µs  max=24.81ms  p(90)=3.22µs  p(95)=3.82µs   p(99.9)=31.99µs
     http_req_connecting............: avg=269ns    min=0s     med=0s      max=3.77ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.54ms  min=1.61ms med=15.6ms  max=296.25ms p(90)=24.56ms p(95)=28.78ms  p(99.9)=51.79ms
       { expected_response:true }...: avg=16.54ms  min=1.61ms med=15.6ms  max=296.25ms p(90)=24.56ms p(95)=28.78ms  p(99.9)=51.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 357633
     http_req_receiving.............: avg=141.07µs min=27.8µs med=46.91µs max=261.68ms p(90)=93.2µs  p(95)=270.39µs p(99.9)=16.34ms
     http_req_sending...............: avg=60.18µs  min=5.26µs med=8.81µs  max=230.16ms p(90)=14.88µs p(95)=119.25µs p(99.9)=12.38ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.34ms  min=1.55ms med=15.45ms max=293.41ms p(90)=24.24ms p(95)=28.3ms   p(99.9)=50.1ms 
     http_reqs......................: 357633  2975.258003/s
     iteration_duration.............: avg=16.77ms  min=2.05ms med=15.81ms max=339.71ms p(90)=24.79ms p(95)=29.06ms  p(99.9)=53.43ms
     iterations.....................: 357533  2974.426073/s
     success_rate...................: 100.00% ✓ 357533      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 772377      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=2.66µs   min=972ns   med=2.12µs   max=8.89ms   p(90)=3.26µs   p(95)=3.86µs   p(99.9)=32.79µs 
     http_req_connecting............: avg=172ns    min=0s      med=0s       max=1.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.06ms  min=2.49ms  med=14.69ms  max=330.03ms p(90)=51.61ms  p(95)=69.84ms  p(99.9)=166.05ms
       { expected_response:true }...: avg=23.06ms  min=2.49ms  med=14.69ms  max=330.03ms p(90)=51.61ms  p(95)=69.84ms  p(99.9)=166.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257559
     http_req_receiving.............: avg=672.26µs min=50.95µs med=104.94µs max=180.26ms p(90)=980.44µs p(95)=1.53ms   p(99.9)=61.02ms 
     http_req_sending...............: avg=43.18µs  min=4.87µs  med=9.27µs   max=73.66ms  p(90)=15.74µs  p(95)=105.18µs p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.35ms  min=2.39ms  med=14.18ms  max=329.59ms p(90)=50.27ms  p(95)=68.39ms  p(99.9)=164.22ms
     http_reqs......................: 257559  2140.904923/s
     iteration_duration.............: avg=23.29ms  min=3.45ms  med=14.9ms   max=358.89ms p(90)=51.85ms  p(95)=70.09ms  p(99.9)=167.09ms
     iterations.....................: 257459  2140.073694/s
     success_rate...................: 100.00% ✓ 257459      ✗ 0     
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

     checks.........................: 100.00% ✓ 735492      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 295 MB  2.5 MB/s
     http_req_blocked...............: avg=3.11µs   min=821ns   med=2.15µs  max=14.98ms  p(90)=3.45µs  p(95)=4.19µs   p(99.9)=38.73µs
     http_req_connecting............: avg=311ns    min=0s      med=0s      max=3.79ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.22ms  min=1.99ms  med=23.98ms max=302.76ms p(90)=29.11ms p(95)=31.4ms   p(99.9)=53.43ms
       { expected_response:true }...: avg=24.22ms  min=1.99ms  med=23.98ms max=302.76ms p(90)=29.11ms p(95)=31.4ms   p(99.9)=53.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245264
     http_req_receiving.............: avg=111.31µs min=28.84µs med=57.2µs  max=38.98ms  p(90)=99.39µs p(95)=192.19µs p(99.9)=9.31ms 
     http_req_sending...............: avg=43.58µs  min=5.11µs  med=9.99µs  max=122.78ms p(90)=16.98µs p(95)=115.07µs p(99.9)=3ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.07ms  min=1.89ms  med=23.86ms max=281.64ms p(90)=28.94ms p(95)=31.15ms  p(99.9)=52.47ms
     http_reqs......................: 245264  2039.427909/s
     iteration_duration.............: avg=24.46ms  min=4.11ms  med=24.18ms max=316.91ms p(90)=29.33ms p(95)=31.64ms  p(99.9)=54.01ms
     iterations.....................: 245164  2038.596385/s
     success_rate...................: 100.00% ✓ 245164      ✗ 0     
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

     checks.........................: 100.00% ✓ 457224      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.1µs   min=1.05µs  med=2.09µs  max=4.33ms   p(90)=3.31µs  p(95)=3.92µs   p(99.9)=33.94µs
     http_req_connecting............: avg=687ns   min=0s      med=0s      max=4.28ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.13ms min=2.15ms  med=38.57ms max=330.35ms p(90)=55.08ms p(95)=60.29ms  p(99.9)=85.3ms 
       { expected_response:true }...: avg=39.13ms min=2.15ms  med=38.57ms max=330.35ms p(90)=55.08ms p(95)=60.29ms  p(99.9)=85.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 152508
     http_req_receiving.............: avg=88.78µs min=28.03µs med=58.07µs max=118.71ms p(90)=92.28µs p(95)=108.85µs p(99.9)=1.86ms 
     http_req_sending...............: avg=25.09µs min=4.46µs  med=9.89µs  max=180.05ms p(90)=15.22µs p(95)=19.08µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.01ms min=2.04ms  med=38.47ms max=237.64ms p(90)=54.98ms p(95)=60.16ms  p(99.9)=84.56ms
     http_reqs......................: 152508  1268.073222/s
     iteration_duration.............: avg=39.36ms min=3.79ms  med=38.76ms max=340.13ms p(90)=55.28ms p(95)=60.49ms  p(99.9)=86.07ms
     iterations.....................: 152408  1267.241742/s
     success_rate...................: 100.00% ✓ 152408      ✗ 0     
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

     checks.........................: 100.00% ✓ 224010     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   745 kB/s
     http_req_blocked...............: avg=4.72µs  min=1.08µs  med=2.97µs  max=4.42ms   p(90)=4.52µs   p(95)=5.15µs   p(99.9)=44.79µs 
     http_req_connecting............: avg=1.47µs  min=0s      med=0s      max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.01ms min=3.84ms  med=76.52ms max=353.92ms p(90)=101.73ms p(95)=113.04ms p(99.9)=207.08ms
       { expected_response:true }...: avg=80.01ms min=3.84ms  med=76.52ms max=353.92ms p(90)=101.73ms p(95)=113.04ms p(99.9)=207.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74770
     http_req_receiving.............: avg=89.36µs min=32.57µs med=76.61µs max=157.36ms p(90)=110.65µs p(95)=123.61µs p(99.9)=855.95µs
     http_req_sending...............: avg=26.87µs min=5.79µs  med=13.26µs max=239.18ms p(90)=19.87µs  p(95)=22.25µs  p(99.9)=766.85µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.89ms min=3.77ms  med=76.41ms max=353.24ms p(90)=101.63ms p(95)=112.91ms p(99.9)=205.8ms 
     http_reqs......................: 74770   620.496088/s
     iteration_duration.............: avg=80.36ms min=21.18ms med=76.74ms max=367.66ms p(90)=101.96ms p(95)=113.35ms p(99.9)=210.3ms 
     iterations.....................: 74670   619.666215/s
     success_rate...................: 100.00% ✓ 74670      ✗ 0    
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

     checks.........................: 100.00% ✓ 143841     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   478 kB/s
     http_req_blocked...............: avg=5.42µs   min=1.11µs  med=3.03µs   max=4.6ms    p(90)=4.4µs    p(95)=4.96µs   p(99.9)=287.13µs
     http_req_connecting............: avg=2.18µs   min=0s      med=0s       max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=226.27µs
     http_req_duration..............: avg=124.67ms min=5.47ms  med=124.39ms max=361.21ms p(90)=150.84ms p(95)=158.6ms  p(99.9)=193.45ms
       { expected_response:true }...: avg=124.67ms min=5.47ms  med=124.39ms max=361.21ms p(90)=150.84ms p(95)=158.6ms  p(99.9)=193.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48047
     http_req_receiving.............: avg=90.15µs  min=31.53µs med=80.04µs  max=119.97ms p(90)=111.39µs p(95)=122.66µs p(99.9)=882.61µs
     http_req_sending...............: avg=28.19µs  min=6.03µs  med=14.41µs  max=211.76ms p(90)=19.88µs  p(95)=21.84µs  p(99.9)=655.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.55ms min=5.35ms  med=124.29ms max=360.67ms p(90)=150.72ms p(95)=158.5ms  p(99.9)=192.62ms
     http_reqs......................: 48047   398.043853/s
     iteration_duration.............: avg=125.17ms min=34.04ms med=124.66ms max=368.69ms p(90)=151.08ms p(95)=158.87ms p(99.9)=196.37ms
     iterations.....................: 47947   397.215406/s
     success_rate...................: 100.00% ✓ 47947      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96111      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.79µs   min=1.29µs  med=3.36µs   max=4.24ms   p(90)=4.75µs   p(95)=5.38µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=3.24µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=186.6ms  min=5.71ms  med=169.62ms max=594.5ms  p(90)=216.64ms p(95)=347.93ms p(99.9)=538.85ms
       { expected_response:true }...: avg=186.6ms  min=5.71ms  med=169.62ms max=594.5ms  p(90)=216.64ms p(95)=347.93ms p(99.9)=538.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32137
     http_req_receiving.............: avg=97.59µs  min=37.58µs med=90.96µs  max=27.55ms  p(90)=123.44µs p(95)=136.71µs p(99.9)=726.61µs
     http_req_sending...............: avg=29.93µs  min=6.31µs  med=16.24µs  max=201.55ms p(90)=21.93µs  p(95)=23.92µs  p(99.9)=571.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.48ms min=5.58ms  med=169.51ms max=594.38ms p(90)=216.53ms p(95)=347.81ms p(99.9)=538.73ms
     http_reqs......................: 32137   265.744784/s
     iteration_duration.............: avg=187.46ms min=58.04ms med=169.98ms max=594.69ms p(90)=217.03ms p(95)=358.04ms p(99.9)=539.1ms 
     iterations.....................: 32037   264.917872/s
     success_rate...................: 100.00% ✓ 32037      ✗ 0    
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

     checks.........................: 100.00% ✓ 89544      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=6.93µs   min=1.25µs  med=3.08µs   max=4.32ms   p(90)=4.3µs    p(95)=4.79µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=3.67µs   min=0s      med=0s       max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.95ms  
     http_req_duration..............: avg=200.21ms min=8.42ms  med=226.2ms  max=396.18ms p(90)=243.71ms p(95)=247.36ms p(99.9)=316.45ms
       { expected_response:true }...: avg=200.21ms min=8.42ms  med=226.2ms  max=396.18ms p(90)=243.71ms p(95)=247.36ms p(99.9)=316.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29948
     http_req_receiving.............: avg=94.41µs  min=33.3µs  med=86.99µs  max=40.59ms  p(90)=118.21µs p(95)=130.42µs p(99.9)=553.3µs 
     http_req_sending...............: avg=25.83µs  min=6.11µs  med=15.44µs  max=60.64ms  p(90)=20.34µs  p(95)=22.04µs  p(99.9)=539.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.09ms min=8.29ms  med=225.97ms max=395.76ms p(90)=243.59ms p(95)=247.24ms p(99.9)=316.37ms
     http_reqs......................: 29948   247.377934/s
     iteration_duration.............: avg=201.13ms min=46.95ms med=227.77ms max=411.29ms p(90)=243.98ms p(95)=247.62ms p(99.9)=320.34ms
     iterations.....................: 29848   246.551909/s
     success_rate...................: 100.00% ✓ 29848      ✗ 0    
     vus............................: 29      min=29       max=50 
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

     checks.........................: 100.00% ✓ 856341      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=3.28µs   min=1.05µs  med=2.27µs  max=14.13ms  p(90)=3.7µs    p(95)=4.52µs   p(99.9)=36.89µs
     http_req_connecting............: avg=357ns    min=0s      med=0s      max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.78ms  min=1.82ms  med=20.37ms max=359.56ms p(90)=28.72ms  p(95)=31.77ms  p(99.9)=52.52ms
       { expected_response:true }...: avg=20.78ms  min=1.82ms  med=20.37ms max=359.56ms p(90)=28.72ms  p(95)=31.77ms  p(99.9)=52.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285547
     http_req_receiving.............: avg=133.43µs min=27.36µs med=54.32µs max=331.23ms p(90)=101.66µs p(95)=257.97µs p(99.9)=8.81ms 
     http_req_sending...............: avg=52.8µs   min=5.19µs  med=9.87µs  max=74.2ms   p(90)=18.13µs  p(95)=124.94µs p(99.9)=5.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.59ms  min=1.72ms  med=20.23ms max=102.96ms p(90)=28.52ms  p(95)=31.5ms   p(99.9)=50.91ms
     http_reqs......................: 285547  2375.114623/s
     iteration_duration.............: avg=21ms     min=3.46ms  med=20.58ms max=396.71ms p(90)=28.94ms  p(95)=32.01ms  p(99.9)=53ms   
     iterations.....................: 285447  2374.282846/s
     success_rate...................: 100.00% ✓ 285447      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 711789      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=2.72µs   min=1µs     med=2.13µs   max=10.59ms  p(90)=3.5µs   p(95)=4.22µs   p(99.9)=35.38µs 
     http_req_connecting............: avg=168ns    min=0s      med=0s       max=1.75ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.04ms  min=1.91ms  med=17.28ms  max=578.51ms p(90)=52.28ms p(95)=69.14ms  p(99.9)=193.33ms
       { expected_response:true }...: avg=25.04ms  min=1.91ms  med=17.28ms  max=578.51ms p(90)=52.28ms p(95)=69.14ms  p(99.9)=193.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237363
     http_req_receiving.............: avg=698.12µs min=51.47µs med=105.67µs max=164.18ms p(90)=1.15ms  p(95)=1.85ms   p(99.9)=59.24ms 
     http_req_sending...............: avg=40.9µs   min=5.16µs  med=9.45µs   max=103.82ms p(90)=18.25µs p(95)=108.11µs p(99.9)=2.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.3ms   min=1.78ms  med=16.72ms  max=578.16ms p(90)=51.01ms p(95)=67.65ms  p(99.9)=190.43ms
     http_reqs......................: 237363  1973.649544/s
     iteration_duration.............: avg=25.28ms  min=2.85ms  med=17.5ms   max=578.66ms p(90)=52.52ms p(95)=69.38ms  p(99.9)=198.75ms
     iterations.....................: 237263  1972.818054/s
     success_rate...................: 100.00% ✓ 237263      ✗ 0     
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

     checks.........................: 100.00% ✓ 542052      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 217 MB  1.8 MB/s
     http_req_blocked...............: avg=7.02µs  min=992ns   med=2.3µs   max=128.94ms p(90)=4.46µs   p(95)=5.65µs   p(99.9)=39.96µs
     http_req_connecting............: avg=4.14µs  min=0s      med=0s      max=128.9ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.93ms min=2.44ms  med=31.97ms max=288.19ms p(90)=43.71ms  p(95)=48.61ms  p(99.9)=90.77ms
       { expected_response:true }...: avg=32.93ms min=2.44ms  med=31.97ms max=288.19ms p(90)=43.71ms  p(95)=48.61ms  p(99.9)=90.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180784
     http_req_receiving.............: avg=112.6µs min=31.17µs med=62.27µs max=214.37ms p(90)=132.92µs p(95)=277.72µs p(99.9)=5.64ms 
     http_req_sending...............: avg=46.55µs min=5.58µs  med=10.46µs max=215.56ms p(90)=24.31µs  p(95)=134.76µs p(99.9)=3.13ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.77ms min=2.31ms  med=31.83ms max=274.88ms p(90)=43.53ms  p(95)=48.37ms  p(99.9)=89.87ms
     http_reqs......................: 180784  1502.657517/s
     iteration_duration.............: avg=33.19ms min=4.71ms  med=32.2ms  max=348.41ms p(90)=43.94ms  p(95)=48.85ms  p(99.9)=91.22ms
     iterations.....................: 180684  1501.826328/s
     success_rate...................: 100.00% ✓ 180684      ✗ 0     
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

     checks.........................: 100.00% ✓ 422049      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.47µs   min=962ns   med=2.41µs  max=4.17ms   p(90)=3.86µs   p(95)=4.5µs    p(99.9)=36.23µs
     http_req_connecting............: avg=731ns    min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.4ms   min=2.25ms  med=41.9ms  max=344.49ms p(90)=59.5ms   p(95)=64.81ms  p(99.9)=91.1ms 
       { expected_response:true }...: avg=42.4ms   min=2.25ms  med=41.9ms  max=344.49ms p(90)=59.5ms   p(95)=64.81ms  p(99.9)=91.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 140783
     http_req_receiving.............: avg=108.31µs min=29.81µs med=65.36µs max=177.23ms p(90)=102.69µs p(95)=121.14µs p(99.9)=2.02ms 
     http_req_sending...............: avg=26.58µs  min=5.27µs  med=11.34µs max=127.96ms p(90)=17.7µs   p(95)=21.27µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.27ms  min=2.17ms  med=41.8ms  max=181.15ms p(90)=59.38ms  p(95)=64.68ms  p(99.9)=89.53ms
     http_reqs......................: 140783  1170.282627/s
     iteration_duration.............: avg=42.64ms  min=3.87ms  med=42.11ms max=372.16ms p(90)=59.7ms   p(95)=65.02ms  p(99.9)=91.76ms
     iterations.....................: 140683  1169.45136/s
     success_rate...................: 100.00% ✓ 140683      ✗ 0     
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

     checks.........................: 100.00% ✓ 209790     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   698 kB/s
     http_req_blocked...............: avg=4.42µs  min=1.14µs  med=2.68µs  max=4.17ms   p(90)=4.23µs   p(95)=4.81µs   p(99.9)=43.81µs 
     http_req_connecting............: avg=1.44µs  min=0s      med=0s      max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.45ms min=3.85ms  med=83.31ms max=349.79ms p(90)=104.19ms p(95)=114.97ms p(99.9)=213.78ms
       { expected_response:true }...: avg=85.45ms min=3.85ms  med=83.31ms max=349.79ms p(90)=104.19ms p(95)=114.97ms p(99.9)=213.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70030
     http_req_receiving.............: avg=87.53µs min=31.01µs med=77.05µs max=101.23ms p(90)=110.93µs p(95)=123.5µs  p(99.9)=909.21µs
     http_req_sending...............: avg=25µs    min=5.46µs  med=12.93µs max=215.9ms  p(90)=19.45µs  p(95)=21.59µs  p(99.9)=637.15µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.34ms min=3.74ms  med=83.21ms max=345.63ms p(90)=104.08ms p(95)=114.83ms p(99.9)=212.89ms
     http_reqs......................: 70030   580.738004/s
     iteration_duration.............: avg=85.82ms min=22.15ms med=83.55ms max=361.4ms  p(90)=104.43ms p(95)=115.24ms p(99.9)=217.7ms 
     iterations.....................: 69930   579.908734/s
     success_rate...................: 100.00% ✓ 69930      ✗ 0    
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

     checks.........................: 100.00% ✓ 138402     ✗ 0    
     data_received..................: 4.0 GB  34 MB/s
     data_sent......................: 56 MB   460 kB/s
     http_req_blocked...............: avg=6.14µs   min=1.18µs  med=3.57µs   max=4.79ms   p(90)=5.06µs   p(95)=5.65µs   p(99.9)=571.48µs
     http_req_connecting............: avg=2.37µs   min=0s      med=0s       max=4.75ms   p(90)=0s       p(95)=0s       p(99.9)=547.22µs
     http_req_duration..............: avg=129.54ms min=6.04ms  med=127.14ms max=320.58ms p(90)=171.2ms  p(95)=183.86ms p(99.9)=237.24ms
       { expected_response:true }...: avg=129.54ms min=6.04ms  med=127.14ms max=320.58ms p(90)=171.2ms  p(95)=183.86ms p(99.9)=237.24ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46234
     http_req_receiving.............: avg=95.45µs  min=33.15µs med=89.08µs  max=82.6ms   p(90)=120.32µs p(95)=133.14µs p(99.9)=740.39µs
     http_req_sending...............: avg=31.3µs   min=5.85µs  med=17.07µs  max=163.3ms  p(90)=22.21µs  p(95)=24.13µs  p(99.9)=633.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.41ms min=5.91ms  med=127.02ms max=320.38ms p(90)=171.09ms p(95)=183.75ms p(99.9)=235.25ms
     http_reqs......................: 46234   382.857334/s
     iteration_duration.............: avg=130.09ms min=22.87ms med=127.46ms max=364.93ms p(90)=171.51ms p(95)=184.17ms p(99.9)=240.17ms
     iterations.....................: 46134   382.029248/s
     success_rate...................: 100.00% ✓ 46134      ✗ 0    
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

     checks.........................: 100.00% ✓ 95787      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=7.04µs   min=1.24µs  med=3.71µs   max=4.05ms   p(90)=5.21µs   p(95)=5.83µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=187.17ms min=5.99ms  med=179.69ms max=656.27ms p(90)=227.28ms p(95)=384.05ms p(99.9)=531.78ms
       { expected_response:true }...: avg=187.17ms min=5.99ms  med=179.69ms max=656.27ms p(90)=227.28ms p(95)=384.05ms p(99.9)=531.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32029
     http_req_receiving.............: avg=104.55µs min=34.78µs med=98.26µs  max=33.69ms  p(90)=130.74µs p(95)=144.31µs p(99.9)=690.83µs
     http_req_sending...............: avg=34.55µs  min=6.37µs  med=18.43µs  max=84.12ms  p(90)=23.4µs   p(95)=25.12µs  p(99.9)=677.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.03ms min=5.89ms  med=179.55ms max=656.18ms p(90)=227.16ms p(95)=383.94ms p(99.9)=531.67ms
     http_reqs......................: 32029   264.925101/s
     iteration_duration.............: avg=188.04ms min=48.86ms med=180.1ms  max=656.54ms p(90)=227.72ms p(95)=385.08ms p(99.9)=532.1ms 
     iterations.....................: 31929   264.09796/s
     success_rate...................: 100.00% ✓ 31929      ✗ 0    
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

     checks.........................: 100.00% ✓ 85371      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=6.05µs   min=1.28µs  med=3.37µs   max=3.21ms   p(90)=4.65µs   p(95)=5.18µs   p(99.9)=1.13ms  
     http_req_connecting............: avg=2.48µs   min=0s      med=0s       max=3.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.09ms  
     http_req_duration..............: avg=209.92ms min=8.55ms  med=206.81ms max=392.18ms p(90)=223.91ms p(95)=230.73ms p(99.9)=298.12ms
       { expected_response:true }...: avg=209.92ms min=8.55ms  med=206.81ms max=392.18ms p(90)=223.91ms p(95)=230.73ms p(99.9)=298.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28557
     http_req_receiving.............: avg=100.66µs min=34.3µs  med=92.93µs  max=74.63ms  p(90)=124.47µs p(95)=137.61µs p(99.9)=617.27µs
     http_req_sending...............: avg=40.18µs  min=6.11µs  med=16.69µs  max=149.03ms p(90)=21.37µs  p(95)=23.19µs  p(99.9)=825.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.78ms min=8.4ms   med=206.68ms max=391.84ms p(90)=223.79ms p(95)=230.6ms  p(99.9)=297.91ms
     http_reqs......................: 28557   235.822302/s
     iteration_duration.............: avg=210.96ms min=33.39ms med=207.18ms max=420.41ms p(90)=224.18ms p(95)=231.19ms p(99.9)=300.81ms
     iterations.....................: 28457   234.996507/s
     success_rate...................: 100.00% ✓ 28457      ✗ 0    
     vus............................: 38      min=38       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

