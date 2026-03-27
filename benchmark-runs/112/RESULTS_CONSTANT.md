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
| hive-router | v0.0.42 | 2,994 | 3,152 | 2,966 | 2.1% |  |
| grafbase | 0.53.2 | 2,096 | 2,159 | 2,082 | 1.2% |  |
| hotchocolate | 16.0.0-rc.1.19 | 2,004 | 2,046 | 1,992 | 0.9% |  |
| cosmo | 0.295.0 | 1,246 | 1,267 | 1,232 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 625 | 635 | 617 | 0.9% |  |
| apollo-router | v2.12.0 | 432 | 441 | 429 | 1.0% |  |
| hive-gateway | 2.5.11 | 268 | 272 | 267 | 0.7% |  |
| apollo-gateway | 2.13.3 | 246 | 247 | 245 | 0.3% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.42 | 2,447 | 2,567 | 2,419 | 2.0% |  |
| hotchocolate | 16.0.0-rc.1.19 | 1,866 | 1,903 | 1,843 | 1.0% |  |
| grafbase | 0.53.2 | 1,525 | 1,567 | 1,515 | 1.2% |  |
| cosmo | 0.295.0 | 1,210 | 1,225 | 1,208 | 0.5% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 591 | 603 | 588 | 0.9% |  |
| apollo-router | v2.12.0 | 373 | 384 | 369 | 1.3% |  |
| hive-gateway | 2.5.11 | 261 | 264 | 257 | 0.8% |  |
| apollo-gateway | 2.13.3 | 237 | 240 | 235 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1079652     ✗ 0     
     data_received..................: 32 GB   263 MB/s
     data_sent......................: 433 MB  3.6 MB/s
     http_req_blocked...............: avg=2.7µs    min=990ns   med=2.03µs  max=12.6ms   p(90)=3.08µs  p(95)=3.68µs   p(99.9)=30.89µs
     http_req_connecting............: avg=300ns    min=0s      med=0s      max=3.8ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.43ms  min=1.61ms  med=15.5ms  max=370.27ms p(90)=24.33ms p(95)=28.13ms  p(99.9)=50.32ms
       { expected_response:true }...: avg=16.43ms  min=1.61ms  med=15.5ms  max=370.27ms p(90)=24.33ms p(95)=28.13ms  p(99.9)=50.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 359984
     http_req_receiving.............: avg=133.65µs min=27.86µs med=49.23µs max=167.87ms p(90)=95.88µs p(95)=267.82µs p(99.9)=12.9ms 
     http_req_sending...............: avg=59µs     min=5.04µs  med=8.83µs  max=192.77ms p(90)=14.91µs p(95)=120.08µs p(99.9)=9.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.24ms  min=1.54ms  med=15.35ms max=202.92ms p(90)=24.05ms p(95)=27.73ms  p(99.9)=49.01ms
     http_reqs......................: 359984  2994.690796/s
     iteration_duration.............: avg=16.66ms  min=2.17ms  med=15.7ms  max=381.55ms p(90)=24.55ms p(95)=28.38ms  p(99.9)=51.6ms 
     iterations.....................: 359884  2993.858901/s
     success_rate...................: 100.00% ✓ 359884      ✗ 0     
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

     checks.........................: 100.00% ✓ 755928      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=11.83µs  min=1.01µs  med=2.28µs  max=170.62ms p(90)=3.79µs   p(95)=4.56µs   p(99.9)=44.62µs
     http_req_connecting............: avg=9µs      min=0s      med=0s      max=170.59ms p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.55ms  min=1.99ms  med=23.31ms max=231.14ms p(90)=28.35ms  p(95)=30.69ms  p(99.9)=53.18ms
       { expected_response:true }...: avg=23.55ms  min=1.99ms  med=23.31ms max=231.14ms p(90)=28.35ms  p(95)=30.69ms  p(99.9)=53.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252076
     http_req_receiving.............: avg=113.93µs min=29.34µs med=57.22µs max=50.59ms  p(90)=102.54µs p(95)=219.27µs p(99.9)=9.75ms 
     http_req_sending...............: avg=48.17µs  min=4.78µs  med=10.04µs max=105.41ms p(90)=18.14µs  p(95)=119.13µs p(99.9)=3.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.39ms  min=1.89ms  med=23.2ms  max=230.03ms p(90)=28.17ms  p(95)=30.42ms  p(99.9)=52.03ms
     http_reqs......................: 252076  2096.272057/s
     iteration_duration.............: avg=23.8ms   min=3.8ms   med=23.52ms max=331.32ms p(90)=28.57ms  p(95)=30.93ms  p(99.9)=53.93ms
     iterations.....................: 251976  2095.440454/s
     success_rate...................: 100.00% ✓ 251976      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.19)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 722982      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=3.27µs  min=1.05µs  med=2.4µs    max=14ms     p(90)=3.59µs  p(95)=4.2µs    p(99.9)=35.73µs 
     http_req_connecting............: avg=430ns   min=0s      med=0s       max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.65ms min=2.45ms  med=15.22ms  max=357.13ms p(90)=56.62ms p(95)=75.54ms  p(99.9)=174.77ms
       { expected_response:true }...: avg=24.65ms min=2.45ms  med=15.22ms  max=357.13ms p(90)=56.62ms p(95)=75.54ms  p(99.9)=174.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241094
     http_req_receiving.............: avg=706.5µs min=51.86µs med=117.32µs max=312.37ms p(90)=1ms     p(95)=1.53ms   p(99.9)=63.65ms 
     http_req_sending...............: avg=40.44µs min=5.34µs  med=9.89µs   max=31.29ms  p(90)=16.2µs  p(95)=106.45µs p(99.9)=2.38ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.9ms  min=2.36ms  med=14.68ms  max=338.12ms p(90)=55.21ms p(95)=74.08ms  p(99.9)=171.42ms
     http_reqs......................: 241094  2004.276122/s
     iteration_duration.............: avg=24.88ms min=3.58ms  med=15.44ms  max=369.78ms p(90)=56.86ms p(95)=75.79ms  p(99.9)=175.5ms 
     iterations.....................: 240994  2003.444796/s
     success_rate...................: 100.00% ✓ 240994      ✗ 0     
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

     checks.........................: 100.00% ✓ 449601     ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.32µs  min=1.02µs  med=2.31µs  max=4.52ms   p(90)=3.5µs   p(95)=4.06µs   p(99.9)=34.31µs
     http_req_connecting............: avg=734ns   min=0s      med=0s      max=4.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.79ms min=2.13ms  med=39.2ms  max=305.79ms p(90)=56.2ms  p(95)=61.37ms  p(99.9)=85.69ms
       { expected_response:true }...: avg=39.79ms min=2.13ms  med=39.2ms  max=305.79ms p(90)=56.2ms  p(95)=61.37ms  p(99.9)=85.69ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 149967
     http_req_receiving.............: avg=79.72µs min=29.74µs med=59.66µs max=175.62ms p(90)=93.6µs  p(95)=110.59µs p(99.9)=1.97ms 
     http_req_sending...............: avg=24.66µs min=5.26µs  med=10.19µs max=111.76ms p(90)=14.88µs p(95)=18.69µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.69ms min=2.01ms  med=39.11ms max=305.42ms p(90)=56.08ms p(95)=61.25ms  p(99.9)=85.45ms
     http_reqs......................: 149967  1246.90067/s
     iteration_duration.............: avg=40.02ms min=3.88ms  med=39.4ms  max=345.86ms p(90)=56.39ms p(95)=61.56ms  p(99.9)=85.93ms
     iterations.....................: 149867  1246.06922/s
     success_rate...................: 100.00% ✓ 149867     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 225795     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   751 kB/s
     http_req_blocked...............: avg=4.42µs  min=1.13µs  med=2.68µs  max=4.18ms   p(90)=4.3µs    p(95)=4.92µs   p(99.9)=42.17µs 
     http_req_connecting............: avg=1.42µs  min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.38ms min=3.86ms  med=76.95ms max=349.12ms p(90)=95.71ms  p(95)=104.65ms p(99.9)=196.57ms
       { expected_response:true }...: avg=79.38ms min=3.86ms  med=76.95ms max=349.12ms p(90)=95.71ms  p(95)=104.65ms p(99.9)=196.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75365
     http_req_receiving.............: avg=86.38µs min=31.64µs med=74.06µs max=188.72ms p(90)=108.69µs p(95)=121.13µs p(99.9)=898.2µs 
     http_req_sending...............: avg=19.29µs min=5.38µs  med=12.41µs max=65.23ms  p(90)=19.02µs  p(95)=21.26µs  p(99.9)=656.45µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.27ms min=3.78ms  med=76.85ms max=331.43ms p(90)=95.61ms  p(95)=104.53ms p(99.9)=196.32ms
     http_reqs......................: 75365   625.460567/s
     iteration_duration.............: avg=79.72ms min=30.71ms med=77.18ms max=360.8ms  p(90)=95.95ms  p(95)=104.92ms p(99.9)=197.87ms
     iterations.....................: 75265   624.630659/s
     success_rate...................: 100.00% ✓ 75265      ✗ 0    
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

     checks.........................: 100.00% ✓ 156414     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   520 kB/s
     http_req_blocked...............: avg=5.27µs   min=1.09µs  med=3.25µs   max=4.32ms   p(90)=4.69µs   p(95)=5.25µs   p(99.9)=128.36µs
     http_req_connecting............: avg=1.79µs   min=0s      med=0s       max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.64ms min=5.53ms  med=114.4ms  max=338.32ms p(90)=138.43ms p(95)=145.48ms p(99.9)=177.25ms
       { expected_response:true }...: avg=114.64ms min=5.53ms  med=114.4ms  max=338.32ms p(90)=138.43ms p(95)=145.48ms p(99.9)=177.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52238
     http_req_receiving.............: avg=89.81µs  min=30.38µs med=82.98µs  max=94.54ms  p(90)=114.15µs p(95)=126.25µs p(99.9)=788.9µs 
     http_req_sending...............: avg=25.63µs  min=5.48µs  med=15.3µs   max=81.82ms  p(90)=20.89µs  p(95)=22.82µs  p(99.9)=743.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.52ms min=5.42ms  med=114.28ms max=337.76ms p(90)=138.32ms p(95)=145.37ms p(99.9)=177.15ms
     http_reqs......................: 52238   432.808914/s
     iteration_duration.............: avg=115.11ms min=14.93ms med=114.67ms max=373.45ms p(90)=138.7ms  p(95)=145.76ms p(99.9)=178.71ms
     iterations.....................: 52138   431.980381/s
     success_rate...................: 100.00% ✓ 52138      ✗ 0    
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

     checks.........................: 100.00% ✓ 96906      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   322 kB/s
     http_req_blocked...............: avg=7.17µs   min=1.28µs  med=3.52µs   max=4ms      p(90)=4.96µs   p(95)=5.59µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.44µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=185ms    min=6.09ms  med=168.82ms max=606.83ms p(90)=219.36ms p(95)=385.06ms p(99.9)=542.88ms
       { expected_response:true }...: avg=185ms    min=6.09ms  med=168.82ms max=606.83ms p(90)=219.36ms p(95)=385.06ms p(99.9)=542.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32402
     http_req_receiving.............: avg=145.5µs  min=35.78µs med=96.51µs  max=94.81ms  p(90)=129.03µs p(95)=143.09µs p(99.9)=14.56ms 
     http_req_sending...............: avg=30.3µs   min=6.09µs  med=17.37µs  max=121.33ms p(90)=22.46µs  p(95)=24.28µs  p(99.9)=618.75µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.82ms min=5.94ms  med=168.69ms max=606.72ms p(90)=219.21ms p(95)=384.67ms p(99.9)=542.75ms
     http_reqs......................: 32402   268.132097/s
     iteration_duration.............: avg=185.85ms min=11.18ms med=169.17ms max=607.13ms p(90)=219.83ms p(95)=387ms    p(99.9)=543.17ms
     iterations.....................: 32302   267.30458/s
     success_rate...................: 100.00% ✓ 32302      ✗ 0    
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

     checks.........................: 100.00% ✓ 89181      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=5.2µs    min=1.2µs   med=3.31µs   max=2.81ms   p(90)=4.59µs   p(95)=5.12µs   p(99.9)=618.47µs
     http_req_connecting............: avg=1.72µs   min=0s      med=0s       max=2.78ms   p(90)=0s       p(95)=0s       p(99.9)=564.09µs
     http_req_duration..............: avg=201.03ms min=8.37ms  med=200.68ms max=351.96ms p(90)=209.29ms p(95)=217.32ms p(99.9)=279.58ms
       { expected_response:true }...: avg=201.03ms min=8.37ms  med=200.68ms max=351.96ms p(90)=209.29ms p(95)=217.32ms p(99.9)=279.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29827
     http_req_receiving.............: avg=99.11µs  min=31.72µs med=91.1µs   max=98.23ms  p(90)=121.88µs p(95)=134.85µs p(99.9)=679.37µs
     http_req_sending...............: avg=29.43µs  min=5.71µs  med=16.53µs  max=74.67ms  p(90)=21.31µs  p(95)=23.22µs  p(99.9)=590.33µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.9ms  min=8.23ms  med=200.57ms max=351.17ms p(90)=209.17ms p(95)=217.2ms  p(99.9)=279.48ms
     http_reqs......................: 29827   246.403693/s
     iteration_duration.............: avg=201.97ms min=33.13ms med=200.94ms max=371.06ms p(90)=209.56ms p(95)=217.63ms p(99.9)=280.57ms
     iterations.....................: 29727   245.577584/s
     success_rate...................: 100.00% ✓ 29727      ✗ 0    
     vus............................: 30      min=30       max=50 
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

     checks.........................: 100.00% ✓ 882486      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 354 MB  2.9 MB/s
     http_req_blocked...............: avg=3.01µs   min=971ns   med=2.12µs  max=12.35ms  p(90)=3.49µs  p(95)=4.26µs   p(99.9)=33.26µs
     http_req_connecting............: avg=351ns    min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.15ms  min=1.66ms  med=19.62ms max=318.24ms p(90)=27.99ms p(95)=31.2ms   p(99.9)=53.2ms 
       { expected_response:true }...: avg=20.15ms  min=1.66ms  med=19.62ms max=318.24ms p(90)=27.99ms p(95)=31.2ms   p(99.9)=53.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 294262
     http_req_receiving.............: avg=115.26µs min=27.16µs med=51.64µs max=194.64ms p(90)=99.86µs p(95)=257.29µs p(99.9)=9.52ms 
     http_req_sending...............: avg=52.03µs  min=5.11µs  med=9.43µs  max=87.74ms  p(90)=17.64µs p(95)=122.93µs p(99.9)=5.73ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.99ms  min=1.57ms  med=19.49ms max=290.23ms p(90)=27.78ms p(95)=30.9ms   p(99.9)=52.14ms
     http_reqs......................: 294262  2447.756533/s
     iteration_duration.............: avg=20.38ms  min=3.15ms  med=19.83ms max=349.62ms p(90)=28.22ms p(95)=31.45ms  p(99.9)=54ms   
     iterations.....................: 294162  2446.924704/s
     success_rate...................: 100.00% ✓ 294162      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 673281      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 270 MB  2.2 MB/s
     http_req_blocked...............: avg=3.07µs   min=1.01µs  med=2.24µs   max=4.01ms   p(90)=3.6µs   p(95)=4.27µs  p(99.9)=38.3µs  
     http_req_connecting............: avg=446ns    min=0s      med=0s       max=3.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=26.48ms  min=1.85ms  med=17.61ms  max=655.75ms p(90)=57.13ms p(95)=75.43ms p(99.9)=222.45ms
       { expected_response:true }...: avg=26.48ms  min=1.85ms  med=17.61ms  max=655.75ms p(90)=57.13ms p(95)=75.43ms p(99.9)=222.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 224527
     http_req_receiving.............: avg=779.48µs min=52.58µs med=109.63µs max=592.92ms p(90)=1.16ms  p(95)=1.86ms  p(99.9)=63.36ms 
     http_req_sending...............: avg=42.07µs  min=5.11µs  med=9.65µs   max=177.74ms p(90)=17.06µs p(95)=82.16µs p(99.9)=2.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.66ms  min=1.77ms  med=17.03ms  max=568.16ms p(90)=55.67ms p(95)=73.91ms p(99.9)=207.34ms
     http_reqs......................: 224527  1866.741244/s
     iteration_duration.............: avg=26.72ms  min=2.72ms  med=17.83ms  max=655.94ms p(90)=57.38ms p(95)=75.68ms p(99.9)=224.16ms
     iterations.....................: 224427  1865.909833/s
     success_rate...................: 100.00% ✓ 224427      ✗ 0     
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

     checks.........................: 100.00% ✓ 550104      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.94µs   min=972ns  med=2.35µs  max=78.07ms  p(90)=4.67µs   p(95)=5.86µs   p(99.9)=46.16µs
     http_req_connecting............: avg=556ns    min=0s     med=0s      max=4.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.44ms  min=2.35ms med=31.6ms  max=337.65ms p(90)=42.94ms  p(95)=47.53ms  p(99.9)=90.28ms
       { expected_response:true }...: avg=32.44ms  min=2.35ms med=31.6ms  max=337.65ms p(90)=42.94ms  p(95)=47.53ms  p(99.9)=90.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183468
     http_req_receiving.............: avg=112.39µs min=30.1µs med=62.28µs max=216.69ms p(90)=135.65µs p(95)=281.62µs p(99.9)=5.31ms 
     http_req_sending...............: avg=46.05µs  min=5.26µs med=10.38µs max=144.1ms  p(90)=24.25µs  p(95)=135.39µs p(99.9)=3.17ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.28ms  min=2.22ms med=31.47ms max=337.22ms p(90)=42.75ms  p(95)=47.31ms  p(99.9)=89.86ms
     http_reqs......................: 183468  1525.109658/s
     iteration_duration.............: avg=32.71ms  min=5.32ms med=31.84ms max=356.77ms p(90)=43.18ms  p(95)=47.77ms  p(99.9)=91.01ms
     iterations.....................: 183368  1524.278391/s
     success_rate...................: 100.00% ✓ 183368      ✗ 0     
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

     checks.........................: 100.00% ✓ 436359      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.6µs   min=1.08µs  med=2.57µs  max=4.21ms   p(90)=4.14µs   p(95)=4.81µs   p(99.9)=34.46µs
     http_req_connecting............: avg=710ns   min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.99ms min=2.22ms  med=40.44ms max=334.95ms p(90)=57.62ms  p(95)=62.86ms  p(99.9)=88.66ms
       { expected_response:true }...: avg=40.99ms min=2.22ms  med=40.44ms max=334.95ms p(90)=57.62ms  p(95)=62.86ms  p(99.9)=88.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145553
     http_req_receiving.............: avg=86.36µs min=28.83µs med=67.16µs max=48.73ms  p(90)=106.08µs p(95)=125.63µs p(99.9)=1.88ms 
     http_req_sending...............: avg=25.26µs min=5.35µs  med=11.37µs max=60.96ms  p(90)=17.82µs  p(95)=21.72µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.88ms min=2.09ms  med=40.33ms max=318.87ms p(90)=57.5ms   p(95)=62.74ms  p(99.9)=88.26ms
     http_reqs......................: 145553  1210.134719/s
     iteration_duration.............: avg=41.24ms min=4.1ms   med=40.65ms max=362.61ms p(90)=57.84ms  p(95)=63.08ms  p(99.9)=89.14ms
     iterations.....................: 145453  1209.303314/s
     success_rate...................: 100.00% ✓ 145453      ✗ 0     
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

     checks.........................: 100.00% ✓ 213726     ✗ 0    
     data_received..................: 6.2 GB  52 MB/s
     data_sent......................: 86 MB   711 kB/s
     http_req_blocked...............: avg=4.3µs   min=1.13µs  med=3.17µs  max=6.02ms   p(90)=4.73µs   p(95)=5.36µs   p(99.9)=44.79µs 
     http_req_connecting............: avg=893ns   min=0s      med=0s      max=5.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.86ms min=3.91ms  med=80.24ms max=340.24ms p(90)=105.79ms p(95)=118.53ms p(99.9)=209.2ms 
       { expected_response:true }...: avg=83.86ms min=3.91ms  med=80.24ms max=340.24ms p(90)=105.79ms p(95)=118.53ms p(99.9)=209.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 71342
     http_req_receiving.............: avg=93.12µs min=31.67µs med=81.36µs max=131.09ms p(90)=115.02µs p(95)=127.92µs p(99.9)=958.39µs
     http_req_sending...............: avg=24.41µs min=5.09µs  med=14.14µs max=186.28ms p(90)=20.66µs  p(95)=22.85µs  p(99.9)=673.33µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.74ms min=3.83ms  med=80.13ms max=339.93ms p(90)=105.68ms p(95)=118.39ms p(99.9)=208.54ms
     http_reqs......................: 71342   591.947028/s
     iteration_duration.............: avg=84.22ms min=19.73ms med=80.48ms max=349.66ms p(90)=106.04ms p(95)=118.82ms p(99.9)=210.55ms
     iterations.....................: 71242   591.117296/s
     success_rate...................: 100.00% ✓ 71242      ✗ 0    
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

     checks.........................: 100.00% ✓ 134871     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   448 kB/s
     http_req_blocked...............: avg=5.94µs   min=1.04µs  med=3.31µs   max=4.1ms    p(90)=4.73µs   p(95)=5.28µs   p(99.9)=784.29µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=554.99µs
     http_req_duration..............: avg=132.94ms min=6.05ms  med=130.4ms  max=360.02ms p(90)=176.03ms p(95)=189.58ms p(99.9)=245.13ms
       { expected_response:true }...: avg=132.94ms min=6.05ms  med=130.4ms  max=360.02ms p(90)=176.03ms p(95)=189.58ms p(99.9)=245.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45057
     http_req_receiving.............: avg=95.11µs  min=32.62µs med=85.65µs  max=101.02ms p(90)=117.28µs p(95)=129.55µs p(99.9)=796.3µs 
     http_req_sending...............: avg=22.55µs  min=6µs     med=15.85µs  max=52.34ms  p(90)=21.17µs  p(95)=22.96µs  p(99.9)=613.12µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.83ms min=5.92ms  med=130.29ms max=359.61ms p(90)=175.93ms p(95)=189.45ms p(99.9)=244.86ms
     http_reqs......................: 45057   373.101821/s
     iteration_duration.............: avg=133.5ms  min=40.61ms med=130.73ms max=379.84ms p(90)=176.34ms p(95)=189.9ms  p(99.9)=249.48ms
     iterations.....................: 44957   372.273755/s
     success_rate...................: 100.00% ✓ 44957      ✗ 0    
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

     checks.........................: 100.00% ✓ 94506      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   314 kB/s
     http_req_blocked...............: avg=5.73µs   min=1.23µs  med=3.35µs   max=3.35ms   p(90)=4.73µs   p(95)=5.26µs   p(99.9)=766.27µs
     http_req_connecting............: avg=2.22µs   min=0s      med=0s       max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=687.11µs
     http_req_duration..............: avg=189.69ms min=6.02ms  med=173.51ms max=617.86ms p(90)=218.4ms  p(95)=398.05ms p(99.9)=523.92ms
       { expected_response:true }...: avg=189.69ms min=6.02ms  med=173.51ms max=617.86ms p(90)=218.4ms  p(95)=398.05ms p(99.9)=523.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31602
     http_req_receiving.............: avg=114.33µs min=34µs    med=92.87µs  max=83.9ms   p(90)=125.22µs p(95)=138.38µs p(99.9)=654.61µs
     http_req_sending...............: avg=27.58µs  min=6.19µs  med=16.83µs  max=68.88ms  p(90)=21.76µs  p(95)=23.48µs  p(99.9)=568.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.55ms min=5.87ms  med=173.39ms max=617.79ms p(90)=218.28ms p(95)=397.94ms p(99.9)=523.8ms 
     http_reqs......................: 31602   261.50856/s
     iteration_duration.............: avg=190.55ms min=30.35ms med=173.85ms max=618.02ms p(90)=218.84ms p(95)=398.65ms p(99.9)=524.19ms
     iterations.....................: 31502   260.681054/s
     success_rate...................: 100.00% ✓ 31502      ✗ 0    
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

     checks.........................: 100.00% ✓ 85929      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=5.12µs   min=1.27µs  med=3.42µs   max=2.08ms   p(90)=4.68µs   p(95)=5.22µs   p(99.9)=735.56µs
     http_req_connecting............: avg=1.48µs   min=0s      med=0s       max=2.05ms   p(90)=0s       p(95)=0s       p(99.9)=658.37µs
     http_req_duration..............: avg=208.61ms min=8.86ms  med=205.74ms max=369.75ms p(90)=221.33ms p(95)=229.83ms p(99.9)=301.43ms
       { expected_response:true }...: avg=208.61ms min=8.86ms  med=205.74ms max=369.75ms p(90)=221.33ms p(95)=229.83ms p(99.9)=301.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28743
     http_req_receiving.............: avg=103.56µs min=35.2µs  med=94.37µs  max=70.75ms  p(90)=126.56µs p(95)=139.99µs p(99.9)=536.9µs 
     http_req_sending...............: avg=28.31µs  min=5.87µs  med=17.08µs  max=61.48ms  p(90)=21.84µs  p(95)=23.69µs  p(99.9)=596.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.48ms min=8.69ms  med=205.61ms max=369.47ms p(90)=221.2ms  p(95)=229.71ms p(99.9)=301.32ms
     http_reqs......................: 28743   237.307928/s
     iteration_duration.............: avg=209.59ms min=73.14ms med=206.06ms max=385.85ms p(90)=221.59ms p(95)=230.21ms p(99.9)=306.56ms
     iterations.....................: 28643   236.482309/s
     success_rate...................: 100.00% ✓ 28643      ✗ 0    
     vus............................: 49      min=49       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

