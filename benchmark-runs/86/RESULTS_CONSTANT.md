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
| hive-router | v0.0.41 | 2,902 | 3,037 | 2,825 | 2.1% |  |
| grafbase | 0.53.2 | 2,047 | 2,101 | 2,025 | 1.3% |  |
| hotchocolate | 16.0.0-p.11.52 | 1,834 | 1,870 | 1,808 | 0.9% |  |
| cosmo | 0.291.0 | 1,268 | 1,287 | 1,262 | 0.6% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 521 | 533 | 517 | 1.1% |  |
| apollo-router | v2.12.0 | 409 | 414 | 401 | 1.1% |  |
| hive-gateway | 2.5.6 | 270 | 274 | 268 | 0.7% |  |
| apollo-gateway | 2.13.2 | 241 | 244 | 240 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,338 | 2,436 | 2,306 | 1.8% |  |
| hotchocolate | 16.0.0-p.11.52 | 1,644 | 1,677 | 1,636 | 0.8% |  |
| grafbase | 0.53.2 | 1,513 | 1,542 | 1,493 | 1.0% |  |
| cosmo | 0.291.0 | 1,186 | 1,203 | 1,178 | 0.8% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.6 | 500 | 512 | 495 | 1.1% |  |
| apollo-router | v2.12.0 | 373 | 384 | 368 | 1.5% |  |
| hive-gateway | 2.5.6 | 257 | 261 | 254 | 0.9% |  |
| apollo-gateway | 2.13.2 | 233 | 237 | 231 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1046184     ✗ 0     
     data_received..................: 31 GB   255 MB/s
     data_sent......................: 419 MB  3.5 MB/s
     http_req_blocked...............: avg=3.25µs   min=1.01µs  med=2.16µs  max=26.36ms  p(90)=3.4µs   p(95)=4.04µs   p(99.9)=32.9µs 
     http_req_connecting............: avg=354ns    min=0s      med=0s      max=4.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.93ms  min=1.57ms  med=16.02ms max=317.31ms p(90)=25.09ms p(95)=28.99ms  p(99.9)=53.75ms
       { expected_response:true }...: avg=16.93ms  min=1.57ms  med=16.02ms max=317.31ms p(90)=25.09ms p(95)=28.99ms  p(99.9)=53.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 348828
     http_req_receiving.............: avg=144.74µs min=28.72µs med=50.91µs max=60.47ms  p(90)=98.66µs p(95)=275.35µs p(99.9)=17.44ms
     http_req_sending...............: avg=56.94µs  min=5.04µs  med=9.17µs  max=52.13ms  p(90)=15.59µs p(95)=124µs    p(99.9)=6.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.73ms  min=1.48ms  med=15.86ms max=296.76ms p(90)=24.8ms  p(95)=28.57ms  p(99.9)=51.06ms
     http_reqs......................: 348828  2902.329724/s
     iteration_duration.............: avg=17.19ms  min=1.97ms  med=16.26ms max=348.21ms p(90)=25.35ms p(95)=29.28ms  p(99.9)=56.21ms
     iterations.....................: 348728  2901.497701/s
     success_rate...................: 100.00% ✓ 348728      ✗ 0     
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

     checks.........................: 100.00% ✓ 738234      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 296 MB  2.5 MB/s
     http_req_blocked...............: avg=3.32µs   min=1.04µs  med=2.67µs  max=6.51ms   p(90)=4.14µs   p(95)=4.88µs   p(99.9)=39.93µs
     http_req_connecting............: avg=181ns    min=0s      med=0s      max=2.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.13ms  min=2.01ms  med=23.87ms max=342.04ms p(90)=29.21ms  p(95)=31.73ms  p(99.9)=54.99ms
       { expected_response:true }...: avg=24.13ms  min=2.01ms  med=23.87ms max=342.04ms p(90)=29.21ms  p(95)=31.73ms  p(99.9)=54.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 246178
     http_req_receiving.............: avg=149.95µs min=30.81µs med=61.28µs max=308.42ms p(90)=104.83µs p(95)=217.56µs p(99.9)=12.5ms 
     http_req_sending...............: avg=46.51µs  min=5.39µs  med=10.81µs max=127.97ms p(90)=18.01µs  p(95)=122.13µs p(99.9)=3.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.93ms  min=1.9ms   med=23.74ms max=186.6ms  p(90)=29.02ms  p(95)=31.45ms  p(99.9)=52.89ms
     http_reqs......................: 246178  2047.187633/s
     iteration_duration.............: avg=24.37ms  min=3.23ms  med=24.08ms max=356.2ms  p(90)=29.45ms  p(95)=31.99ms  p(99.9)=55.65ms
     iterations.....................: 246078  2046.356045/s
     success_rate...................: 100.00% ✓ 246078      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.52)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 661893      ✗ 0     
     data_received..................: 19 GB   161 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=3.11µs   min=1.05µs  med=2.34µs   max=4.15ms   p(90)=3.44µs   p(95)=3.99µs  p(99.9)=34.54µs 
     http_req_connecting............: avg=467ns    min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=26.95ms  min=2.83ms  med=15.06ms  max=426.47ms p(90)=65.5ms   p(95)=87.23ms p(99.9)=209.15ms
       { expected_response:true }...: avg=26.95ms  min=2.83ms  med=15.06ms  max=426.47ms p(90)=65.5ms   p(95)=87.23ms p(99.9)=209.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220731
     http_req_receiving.............: avg=633.02µs min=51.47µs med=111.45µs max=279.55ms p(90)=761.45µs p(95)=1.16ms  p(99.9)=73.35ms 
     http_req_sending...............: avg=35.04µs  min=5.17µs  med=9.8µs    max=78.86ms  p(90)=15.38µs  p(95)=26.21µs p(99.9)=1.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=26.28ms  min=2.68ms  med=14.56ms  max=401.93ms p(90)=64.2ms   p(95)=85.83ms p(99.9)=205.39ms
     http_reqs......................: 220731  1834.190713/s
     iteration_duration.............: avg=27.18ms  min=3.43ms  med=15.28ms  max=426.78ms p(90)=65.73ms  p(95)=87.48ms p(99.9)=209.97ms
     iterations.....................: 220631  1833.359751/s
     success_rate...................: 100.00% ✓ 220631      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 457515      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.4µs   min=1.03µs  med=2.44µs  max=3.88ms   p(90)=3.76µs  p(95)=4.38µs   p(99.9)=36.96µs
     http_req_connecting............: avg=654ns   min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.09ms min=2.14ms  med=38.51ms max=294.93ms p(90)=55.2ms  p(95)=60.2ms   p(99.9)=85.14ms
       { expected_response:true }...: avg=39.09ms min=2.14ms  med=38.51ms max=294.93ms p(90)=55.2ms  p(95)=60.2ms   p(99.9)=85.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152605
     http_req_receiving.............: avg=83.12µs min=28.79µs med=61.61µs max=115.81ms p(90)=97.51µs p(95)=115.98µs p(99.9)=1.95ms 
     http_req_sending...............: avg=25.93µs min=5.32µs  med=10.51µs max=123.02ms p(90)=15.88µs p(95)=20.21µs  p(99.9)=1.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.99ms min=2.03ms  med=38.41ms max=294.29ms p(90)=55.06ms p(95)=60.08ms  p(99.9)=84.68ms
     http_reqs......................: 152605  1268.878083/s
     iteration_duration.............: avg=39.33ms min=3.68ms  med=38.72ms max=333.98ms p(90)=55.41ms p(95)=60.4ms   p(99.9)=85.79ms
     iterations.....................: 152505  1268.046605/s
     success_rate...................: 100.00% ✓ 152505      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 188217     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   626 kB/s
     http_req_blocked...............: avg=4.73µs  min=1.15µs  med=2.78µs  max=4.27ms   p(90)=4.28µs   p(95)=4.87µs   p(99.9)=47.13µs 
     http_req_connecting............: avg=1.66µs  min=0s      med=0s      max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.25ms min=4.51ms  med=91.39ms max=341.42ms p(90)=115.53ms p(95)=128.15ms p(99.9)=224.18ms
       { expected_response:true }...: avg=95.25ms min=4.51ms  med=91.39ms max=341.42ms p(90)=115.53ms p(95)=128.15ms p(99.9)=224.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62839
     http_req_receiving.............: avg=83.35µs min=31.81µs med=74.95µs max=62.26ms  p(90)=108.15µs p(95)=120.47µs p(99.9)=859.55µs
     http_req_sending...............: avg=23.22µs min=5.66µs  med=12.39µs max=133.8ms  p(90)=18.67µs  p(95)=20.93µs  p(99.9)=642.36µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.14ms min=4.39ms  med=91.3ms  max=340.8ms  p(90)=115.44ms p(95)=128.02ms p(99.9)=224.09ms
     http_reqs......................: 62839   521.155115/s
     iteration_duration.............: avg=95.65ms min=34.26ms med=91.64ms max=382.48ms p(90)=115.76ms p(95)=128.47ms p(99.9)=229.67ms
     iterations.....................: 62739   520.325765/s
     success_rate...................: 100.00% ✓ 62739      ✗ 0    
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

     checks.........................: 100.00% ✓ 148104     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   492 kB/s
     http_req_blocked...............: avg=5.54µs   min=1.2µs   med=3.23µs   max=4.29ms   p(90)=4.63µs   p(95)=5.21µs   p(99.9)=218.93µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=110.35µs
     http_req_duration..............: avg=121.05ms min=5.73ms  med=120.81ms max=365.52ms p(90)=146.51ms p(95)=153.99ms p(99.9)=188.61ms
       { expected_response:true }...: avg=121.05ms min=5.73ms  med=120.81ms max=365.52ms p(90)=146.51ms p(95)=153.99ms p(99.9)=188.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49468
     http_req_receiving.............: avg=92.7µs   min=32.38µs med=84.4µs   max=131.73ms p(90)=116.54µs p(95)=129.27µs p(99.9)=711.35µs
     http_req_sending...............: avg=26.32µs  min=5.91µs  med=15.25µs  max=78.66ms  p(90)=20.83µs  p(95)=22.63µs  p(99.9)=736.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.93ms min=5.59ms  med=120.7ms  max=351.66ms p(90)=146.4ms  p(95)=153.87ms p(99.9)=187.79ms
     http_reqs......................: 49468   409.832012/s
     iteration_duration.............: avg=121.56ms min=43.02ms med=121.09ms max=393.93ms p(90)=146.76ms p(95)=154.25ms p(99.9)=190.32ms
     iterations.....................: 49368   409.003533/s
     success_rate...................: 100.00% ✓ 49368      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97698      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=7.09µs   min=1.13µs  med=3.51µs   max=4.72ms   p(90)=5.01µs   p(95)=5.63µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=3.36µs   min=0s      med=0s       max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=183.57ms min=5.95ms  med=166.73ms max=619.4ms  p(90)=214.66ms p(95)=334.02ms p(99.9)=554.13ms
       { expected_response:true }...: avg=183.57ms min=5.95ms  med=166.73ms max=619.4ms  p(90)=214.66ms p(95)=334.02ms p(99.9)=554.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32666
     http_req_receiving.............: avg=105.48µs min=33.32µs med=94.98µs  max=168.29ms p(90)=127.79µs p(95)=141.05µs p(99.9)=691.87µs
     http_req_sending...............: avg=34.15µs  min=6.07µs  med=17.14µs  max=96.66ms  p(90)=22.55µs  p(95)=24.54µs  p(99.9)=579.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.43ms min=5.85ms  med=166.61ms max=619.27ms p(90)=214.51ms p(95)=331.76ms p(99.9)=554.02ms
     http_reqs......................: 32666   270.063877/s
     iteration_duration.............: avg=184.41ms min=39.57ms med=167.08ms max=619.67ms p(90)=215.16ms p(95)=357.56ms p(99.9)=554.35ms
     iterations.....................: 32566   269.237134/s
     success_rate...................: 100.00% ✓ 32566      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87258      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=6.85µs   min=1.22µs  med=3.2µs    max=3.93ms   p(90)=4.46µs   p(95)=4.95µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.5µs    min=0s      med=0s       max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=205.42ms min=8.32ms  med=201.53ms max=450.2ms  p(90)=236.49ms p(95)=248.25ms p(99.9)=310.47ms
       { expected_response:true }...: avg=205.42ms min=8.32ms  med=201.53ms max=450.2ms  p(90)=236.49ms p(95)=248.25ms p(99.9)=310.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29186
     http_req_receiving.............: avg=97.84µs  min=35.99µs med=89.31µs  max=87.54ms  p(90)=121.13µs p(95)=133.65µs p(99.9)=525.8µs 
     http_req_sending...............: avg=30.39µs  min=6.23µs  med=15.8µs   max=120.87ms p(90)=20.93µs  p(95)=22.89µs  p(99.9)=582.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.29ms min=8.23ms  med=201.41ms max=449.62ms p(90)=236.37ms p(95)=248.13ms p(99.9)=310.37ms
     http_reqs......................: 29186   241.085875/s
     iteration_duration.............: avg=206.42ms min=26.87ms med=203.92ms max=467.03ms p(90)=236.86ms p(95)=248.54ms p(99.9)=325.67ms
     iterations.....................: 29086   240.259843/s
     success_rate...................: 100.00% ✓ 29086      ✗ 0    
     vus............................: 34      min=34       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 843030      ✗ 0     
     data_received..................: 25 GB   205 MB/s
     data_sent......................: 338 MB  2.8 MB/s
     http_req_blocked...............: avg=3.54µs   min=1µs     med=2.61µs  max=12.21ms  p(90)=4.08µs   p(95)=4.85µs   p(99.9)=38.63µs
     http_req_connecting............: avg=416ns    min=0s      med=0s      max=4.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.1ms   min=1.6ms   med=20.56ms max=329.09ms p(90)=28.88ms  p(95)=31.92ms  p(99.9)=54.97ms
       { expected_response:true }...: avg=21.1ms   min=1.6ms   med=20.56ms max=329.09ms p(90)=28.88ms  p(95)=31.92ms  p(99.9)=54.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 281110
     http_req_receiving.............: avg=129.46µs min=28.96µs med=58.03µs max=203.12ms p(90)=108.37µs p(95)=271.67µs p(99.9)=9.41ms 
     http_req_sending...............: avg=53.12µs  min=5.29µs  med=10.46µs max=105.79ms p(90)=18.72µs  p(95)=130.91µs p(99.9)=4.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.92ms  min=1.55ms  med=20.42ms max=148.53ms p(90)=28.68ms  p(95)=31.65ms  p(99.9)=53.7ms 
     http_reqs......................: 281110  2338.59267/s
     iteration_duration.............: avg=21.34ms  min=2.79ms  med=20.78ms max=354.63ms p(90)=29.11ms  p(95)=32.17ms  p(99.9)=55.57ms
     iterations.....................: 281010  2337.760756/s
     success_rate...................: 100.00% ✓ 281010      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.52)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 593070      ✗ 0     
     data_received..................: 17 GB   144 MB/s
     data_sent......................: 238 MB  2.0 MB/s
     http_req_blocked...............: avg=2.95µs   min=1.08µs  med=2.45µs   max=1.99ms   p(90)=3.65µs   p(95)=4.25µs  p(99.9)=35.43µs 
     http_req_connecting............: avg=191ns    min=0s      med=0s       max=1.96ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=30.1ms   min=2.21ms  med=18.62ms  max=1.13s    p(90)=67.83ms  p(95)=90.08ms p(99.9)=300.38ms
       { expected_response:true }...: avg=30.1ms   min=2.21ms  med=18.62ms  max=1.13s    p(90)=67.83ms  p(95)=90.08ms p(99.9)=300.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 197790
     http_req_receiving.............: avg=514.19µs min=52.54µs med=113.23µs max=289.94ms p(90)=744.82µs p(95)=1.14ms  p(99.9)=60.82ms 
     http_req_sending...............: avg=30.94µs  min=5.36µs  med=10.24µs  max=77.61ms  p(90)=16.36µs  p(95)=23.06µs p(99.9)=1.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=29.56ms  min=2.05ms  med=18.18ms  max=1.13s    p(90)=66.92ms  p(95)=89.11ms p(99.9)=293.11ms
     http_reqs......................: 197790  1644.432527/s
     iteration_duration.............: avg=30.34ms  min=2.98ms  med=18.84ms  max=1.13s    p(90)=68.07ms  p(95)=90.4ms  p(99.9)=304.33ms
     iterations.....................: 197690  1643.601124/s
     success_rate...................: 100.00% ✓ 197690      ✗ 0     
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

     checks.........................: 100.00% ✓ 546000      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.43µs   min=962ns   med=2.29µs  max=4.19ms   p(90)=4.53µs   p(95)=5.7µs    p(99.9)=44.05µs
     http_req_connecting............: avg=567ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.69ms  min=2.38ms  med=31.82ms max=342.75ms p(90)=43.32ms  p(95)=48.01ms  p(99.9)=91.37ms
       { expected_response:true }...: avg=32.69ms  min=2.38ms  med=31.82ms max=342.75ms p(90)=43.32ms  p(95)=48.01ms  p(99.9)=91.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182100
     http_req_receiving.............: avg=111.36µs min=30.51µs med=61.43µs max=163.88ms p(90)=134.21µs p(95)=271.27µs p(99.9)=5.62ms 
     http_req_sending...............: avg=46.82µs  min=5.26µs  med=10.27µs max=247.12ms p(90)=23.88µs  p(95)=133.23µs p(99.9)=3.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.53ms  min=2.29ms  med=31.68ms max=342.08ms p(90)=43.11ms  p(95)=47.76ms  p(99.9)=90.58ms
     http_reqs......................: 182100  1513.543011/s
     iteration_duration.............: avg=32.96ms  min=4.57ms  med=32.05ms max=361.95ms p(90)=43.55ms  p(95)=48.25ms  p(99.9)=92.1ms 
     iterations.....................: 182000  1512.711851/s
     success_rate...................: 100.00% ✓ 182000      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.291.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 427842      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.37µs  min=1.09µs  med=2.64µs  max=2.84ms   p(90)=4.06µs   p(95)=4.72µs   p(99.9)=40µs   
     http_req_connecting............: avg=395ns   min=0s      med=0s      max=2.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.81ms min=2.26ms  med=41.3ms  max=334.76ms p(90)=58.87ms  p(95)=64.18ms  p(99.9)=90.16ms
       { expected_response:true }...: avg=41.81ms min=2.26ms  med=41.3ms  max=334.76ms p(90)=58.87ms  p(95)=64.18ms  p(99.9)=90.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142714
     http_req_receiving.............: avg=86.23µs min=30.03µs med=67.84µs max=84.97ms  p(90)=105.75µs p(95)=124.43µs p(99.9)=1.82ms 
     http_req_sending...............: avg=26.79µs min=5.44µs  med=11.49µs max=78.42ms  p(90)=17.56µs  p(95)=21.33µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.69ms min=2.18ms  med=41.2ms  max=328.54ms p(90)=58.76ms  p(95)=64.07ms  p(99.9)=89.83ms
     http_reqs......................: 142714  1186.265733/s
     iteration_duration.............: avg=42.06ms min=3.78ms  med=41.52ms max=346.36ms p(90)=59.09ms  p(95)=64.4ms   p(99.9)=90.97ms
     iterations.....................: 142614  1185.434514/s
     success_rate...................: 100.00% ✓ 142614      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 180693     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   601 kB/s
     http_req_blocked...............: avg=4.84µs  min=1.16µs  med=2.93µs   max=4.01ms   p(90)=4.44µs   p(95)=5.02µs   p(99.9)=96.39µs 
     http_req_connecting............: avg=1.65µs  min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=99.24ms min=4.67ms  med=107.38ms max=354.63ms p(90)=132.56ms p(95)=145.65ms p(99.9)=248.46ms
       { expected_response:true }...: avg=99.24ms min=4.67ms  med=107.38ms max=354.63ms p(90)=132.56ms p(95)=145.65ms p(99.9)=248.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60331
     http_req_receiving.............: avg=94.38µs min=32.76µs med=80.06µs  max=149.73ms p(90)=115.32µs p(95)=128.95µs p(99.9)=1.08ms  
     http_req_sending...............: avg=25.26µs min=5.61µs  med=13.53µs  max=142.27ms p(90)=20.32µs  p(95)=22.49µs  p(99.9)=710.04µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.12ms min=4.5ms   med=107.27ms max=354.11ms p(90)=132.44ms p(95)=145.53ms p(99.9)=248.26ms
     http_reqs......................: 60331   500.215317/s
     iteration_duration.............: avg=99.63ms min=16ms    med=107.63ms max=366.19ms p(90)=132.82ms p(95)=145.93ms p(99.9)=249.67ms
     iterations.....................: 60231   499.386199/s
     success_rate...................: 100.00% ✓ 60231      ✗ 0    
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

     checks.........................: 100.00% ✓ 134943     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   448 kB/s
     http_req_blocked...............: avg=5.77µs   min=1.26µs  med=3.4µs    max=4.26ms   p(90)=4.83µs   p(95)=5.39µs   p(99.9)=289.17µs
     http_req_connecting............: avg=2.18µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=233.65µs
     http_req_duration..............: avg=132.87ms min=5.97ms  med=130.33ms max=366.44ms p(90)=176.33ms p(95)=189.89ms p(99.9)=242.42ms
       { expected_response:true }...: avg=132.87ms min=5.97ms  med=130.33ms max=366.44ms p(90)=176.33ms p(95)=189.89ms p(99.9)=242.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45081
     http_req_receiving.............: avg=95.07µs  min=32.76µs med=85.92µs  max=134.96ms p(90)=117.71µs p(95)=130.25µs p(99.9)=929.89µs
     http_req_sending...............: avg=23.85µs  min=6.11µs  med=15.56µs  max=49.77ms  p(90)=20.98µs  p(95)=22.79µs  p(99.9)=676.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.75ms min=5.83ms  med=130.22ms max=361.1ms  p(90)=176.21ms p(95)=189.79ms p(99.9)=242.11ms
     http_reqs......................: 45081   373.30399/s
     iteration_duration.............: avg=133.43ms min=38.18ms med=130.68ms max=377.06ms p(90)=176.64ms p(95)=190.21ms p(99.9)=247.47ms
     iterations.....................: 44981   372.475916/s
     success_rate...................: 100.00% ✓ 44981      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 93051      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   309 kB/s
     http_req_blocked...............: avg=7.04µs   min=1.12µs  med=3.46µs   max=4.25ms   p(90)=4.83µs   p(95)=5.41µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=3.42µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=192.62ms min=6.08ms  med=174.82ms max=637.03ms p(90)=227.26ms p(95)=389.09ms p(99.9)=538.36ms
       { expected_response:true }...: avg=192.62ms min=6.08ms  med=174.82ms max=637.03ms p(90)=227.26ms p(95)=389.09ms p(99.9)=538.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31117
     http_req_receiving.............: avg=102.37µs min=32.81µs med=93.64µs  max=76.37ms  p(90)=124.37µs p(95)=137.79µs p(99.9)=647.08µs
     http_req_sending...............: avg=29.72µs  min=6.59µs  med=17.18µs  max=59.01ms  p(90)=22.06µs  p(95)=23.82µs  p(99.9)=590.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.49ms min=5.98ms  med=174.71ms max=636.92ms p(90)=227.11ms p(95)=388.98ms p(99.9)=538.25ms
     http_reqs......................: 31117   257.418273/s
     iteration_duration.............: avg=193.54ms min=27.88ms med=175.18ms max=637.24ms p(90)=227.76ms p(95)=390.33ms p(99.9)=538.6ms 
     iterations.....................: 31017   256.591013/s
     success_rate...................: 100.00% ✓ 31017      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 84666      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=5.3µs    min=1.25µs  med=3.5µs    max=2.54ms   p(90)=4.84µs   p(95)=5.36µs   p(99.9)=553.3µs 
     http_req_connecting............: avg=1.62µs   min=0s      med=0s       max=2.5ms    p(90)=0s       p(95)=0s       p(99.9)=527.45µs
     http_req_duration..............: avg=211.69ms min=8.95ms  med=209.69ms max=459.52ms p(90)=220.94ms p(95)=229.65ms p(99.9)=297.65ms
       { expected_response:true }...: avg=211.69ms min=8.95ms  med=209.69ms max=459.52ms p(90)=220.94ms p(95)=229.65ms p(99.9)=297.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28322
     http_req_receiving.............: avg=105.03µs min=35.64µs med=96.17µs  max=69.54ms  p(90)=128.8µs  p(95)=141.55µs p(99.9)=819.46µs
     http_req_sending...............: avg=47.31µs  min=6.35µs  med=17.28µs  max=261.82ms p(90)=22.13µs  p(95)=24.01µs  p(99.9)=773.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.53ms min=8.8ms   med=209.56ms max=400.51ms p(90)=220.8ms  p(95)=229.39ms p(99.9)=297.05ms
     http_reqs......................: 28322   233.776616/s
     iteration_duration.............: avg=212.72ms min=38.87ms med=210.01ms max=459.83ms p(90)=221.24ms p(95)=230.13ms p(99.9)=300.41ms
     iterations.....................: 28222   232.951192/s
     success_rate...................: 100.00% ✓ 28222      ✗ 0    
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

