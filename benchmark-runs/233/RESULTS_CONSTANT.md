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
| hive-router | v0.0.72 | 2,974 | 3,141 | 2,843 | 3.3% |  |
| fusion-nightly | 16.3.0-p.1 | 2,160 | 2,213 | 2,145 | 1.1% |  |
| fusion | 16.2.1 | 2,134 | 2,191 | 2,117 | 1.0% |  |
| grafbase | 0.53.5 | 2,017 | 2,076 | 1,990 | 1.6% |  |
| cosmo | 0.324.0 | 1,200 | 1,221 | 1,191 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 566 | 579 | 563 | 1.0% |  |
| apollo-gateway | 2.14.1 | 246 | 249 | 244 | 0.6% |  |
| hive-gateway | 2.9.0 | 243 | 247 | 240 | 1.1% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,295 | 2,417 | 2,256 | 2.2% |  |
| fusion-nightly | 16.3.0-p.1 | 2,029 | 2,083 | 2,014 | 1.1% |  |
| fusion | 16.2.1 | 1,971 | 2,022 | 1,949 | 1.1% |  |
| grafbase | 0.53.5 | 1,505 | 1,534 | 1,480 | 1.1% |  |
| cosmo | 0.324.0 | 1,096 | 1,120 | 1,090 | 1.0% |  |
| hive-gateway-router-runtime | 2.9.0 | 539 | 552 | 533 | 1.1% |  |
| apollo-router | v2.15.1 | 383 | 396 | 377 | 1.7% |  |
| hive-gateway | 2.9.0 | 246 | 251 | 244 | 1.1% |  |
| apollo-gateway | 2.14.1 | 237 | 240 | 236 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1072347     ✗ 0     
     data_received..................: 31 GB   261 MB/s
     data_sent......................: 430 MB  3.6 MB/s
     http_req_blocked...............: avg=3.38µs   min=1.02µs  med=2.36µs  max=26.03ms  p(90)=3.58µs  p(95)=4.23µs   p(99.9)=36.85µs
     http_req_connecting............: avg=284ns    min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.54ms  min=1.67ms  med=15.54ms max=337.29ms p(90)=24.7ms  p(95)=28.91ms  p(99.9)=51.64ms
       { expected_response:true }...: avg=16.54ms  min=1.67ms  med=15.54ms max=337.29ms p(90)=24.7ms  p(95)=28.91ms  p(99.9)=51.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 357549
     http_req_receiving.............: avg=140.42µs min=27.25µs med=48.93µs max=239.63ms p(90)=98.54µs p(95)=282.95µs p(99.9)=13.28ms
     http_req_sending...............: avg=63.03µs  min=5.31µs  med=9.35µs  max=115.34ms p(90)=15.8µs  p(95)=122.18µs p(99.9)=15.84ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.33ms  min=1.57ms  med=15.38ms max=282.32ms p(90)=24.4ms  p(95)=28.45ms  p(99.9)=50.21ms
     http_reqs......................: 357549  2974.487742/s
     iteration_duration.............: avg=16.77ms  min=2.11ms  med=15.75ms max=350.35ms p(90)=24.94ms p(95)=29.2ms   p(99.9)=53.45ms
     iterations.....................: 357449  2973.655832/s
     success_rate...................: 100.00% ✓ 357449      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 779259      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=3.04µs  min=992ns   med=2.23µs  max=7.59ms   p(90)=3.46µs  p(95)=4.1µs    p(99.9)=30.86µs 
     http_req_connecting............: avg=400ns   min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.85ms min=2.34ms  med=19.32ms max=342.16ms p(90)=39.65ms p(95)=49.51ms  p(99.9)=117.52ms
       { expected_response:true }...: avg=22.85ms min=2.34ms  med=19.32ms max=342.16ms p(90)=39.65ms p(95)=49.51ms  p(99.9)=117.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259853
     http_req_receiving.............: avg=1.05ms  min=51.85µs med=329.6µs max=260.15ms p(90)=2.17ms  p(95)=3.25ms   p(99.9)=40.78ms 
     http_req_sending...............: avg=46µs    min=5.22µs  med=9.27µs  max=216.36ms p(90)=16.74µs p(95)=112.86µs p(99.9)=3.76ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.75ms min=2.21ms  med=18.24ms max=341.55ms p(90)=38.04ms p(95)=47.74ms  p(99.9)=115.48ms
     http_reqs......................: 259853  2160.40334/s
     iteration_duration.............: avg=23.09ms min=3.54ms  med=19.55ms max=351.42ms p(90)=39.89ms p(95)=49.76ms  p(99.9)=118.92ms
     iterations.....................: 259753  2159.571946/s
     success_rate...................: 100.00% ✓ 259753      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 769839      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=4µs      min=1.04µs  med=2.48µs   max=12.12ms  p(90)=3.71µs  p(95)=4.33µs   p(99.9)=35.39µs 
     http_req_connecting............: avg=1.08µs   min=0s      med=0s       max=11.39ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.14ms  min=2.52ms  med=15.02ms  max=362.19ms p(90)=51.26ms p(95)=68.71ms  p(99.9)=163.47ms
       { expected_response:true }...: avg=23.14ms  min=2.52ms  med=15.02ms  max=362.19ms p(90)=51.26ms p(95)=68.71ms  p(99.9)=163.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256713
     http_req_receiving.............: avg=956.14µs min=52.92µs med=137.62µs max=153.58ms p(90)=1.36ms  p(95)=2.25ms   p(99.9)=61.86ms 
     http_req_sending...............: avg=45.75µs  min=5.05µs  med=9.59µs   max=191.33ms p(90)=15.85µs p(95)=107.23µs p(99.9)=4.13ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.13ms  min=2.38ms  med=14.24ms  max=278.09ms p(90)=49.45ms p(95)=66.86ms  p(99.9)=161.39ms
     http_reqs......................: 256713  2134.037001/s
     iteration_duration.............: avg=23.37ms  min=3.12ms  med=15.24ms  max=382.21ms p(90)=51.5ms  p(95)=68.96ms  p(99.9)=163.92ms
     iterations.....................: 256613  2133.205708/s
     success_rate...................: 100.00% ✓ 256613      ✗ 0     
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

     checks.........................: 100.00% ✓ 727440      ✗ 0     
     data_received..................: 21 GB   177 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.7µs    min=1.09µs med=2.61µs  max=15.3ms   p(90)=3.99µs   p(95)=4.7µs    p(99.9)=40.99µs
     http_req_connecting............: avg=468ns    min=0s     med=0s      max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.48ms  min=1.95ms med=24.23ms max=328.62ms p(90)=29.53ms  p(95)=31.93ms  p(99.9)=55.14ms
       { expected_response:true }...: avg=24.48ms  min=1.95ms med=24.23ms max=328.62ms p(90)=29.53ms  p(95)=31.93ms  p(99.9)=55.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 242580
     http_req_receiving.............: avg=127.32µs min=28.9µs med=60.78µs max=199.29ms p(90)=103.72µs p(95)=211.54µs p(99.9)=9.9ms  
     http_req_sending...............: avg=47.12µs  min=5.53µs med=10.83µs max=109.86ms p(90)=17.92µs  p(95)=120.87µs p(99.9)=3.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.31ms  min=1.89ms med=24.11ms max=176.64ms p(90)=29.34ms  p(95)=31.66ms  p(99.9)=53.87ms
     http_reqs......................: 242580  2017.245289/s
     iteration_duration.............: avg=24.73ms  min=3.05ms med=24.45ms max=363.35ms p(90)=29.76ms  p(95)=32.19ms  p(99.9)=55.81ms
     iterations.....................: 242480  2016.41371/s
     success_rate...................: 100.00% ✓ 242480      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 432798      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=4.16µs  min=1.1µs   med=2.55µs  max=8.62ms   p(90)=3.96µs   p(95)=4.62µs   p(99.9)=36.47µs
     http_req_connecting............: avg=1.19µs  min=0s      med=0s      max=7.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.34ms min=2.17ms  med=40.77ms max=323.84ms p(90)=58.37ms  p(95)=63.7ms   p(99.9)=88.88ms
       { expected_response:true }...: avg=41.34ms min=2.17ms  med=40.77ms max=323.84ms p(90)=58.37ms  p(95)=63.7ms   p(99.9)=88.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144366
     http_req_receiving.............: avg=85.61µs min=30.14µs med=65.35µs max=103.39ms p(90)=102.19µs p(95)=120.57µs p(99.9)=1.81ms 
     http_req_sending...............: avg=27.97µs min=5.3µs   med=11.08µs max=132.53ms p(90)=16.8µs   p(95)=20.65µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.22ms min=2.1ms   med=40.66ms max=317.95ms p(90)=58.25ms  p(95)=63.57ms  p(99.9)=88.45ms
     http_reqs......................: 144366  1200.269539/s
     iteration_duration.............: avg=41.58ms min=3.79ms  med=40.98ms max=336.44ms p(90)=58.57ms  p(95)=63.91ms  p(99.9)=89.36ms
     iterations.....................: 144266  1199.438132/s
     success_rate...................: 100.00% ✓ 144266      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 204621     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   681 kB/s
     http_req_blocked...............: avg=4.85µs  min=1.17µs  med=3.01µs  max=4.07ms   p(90)=4.66µs   p(95)=5.33µs   p(99.9)=48.13µs 
     http_req_connecting............: avg=1.5µs   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.62ms min=4.09ms  med=78.68ms max=337.82ms p(90)=129.4ms  p(95)=142.67ms p(99.9)=240ms   
       { expected_response:true }...: avg=87.62ms min=4.09ms  med=78.68ms max=337.82ms p(90)=129.4ms  p(95)=142.67ms p(99.9)=240ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 68307
     http_req_receiving.............: avg=89.87µs min=31.18µs med=78.08µs max=102.74ms p(90)=113.34µs p(95)=126.46µs p(99.9)=792.33µs
     http_req_sending...............: avg=22.71µs min=5.59µs  med=13.42µs max=86.53ms  p(90)=20.34µs  p(95)=22.7µs   p(99.9)=661.54µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.51ms min=3.98ms  med=78.57ms max=337.37ms p(90)=129.28ms p(95)=142.56ms p(99.9)=239.26ms
     http_reqs......................: 68307   566.654188/s
     iteration_duration.............: avg=87.98ms min=14.71ms med=78.94ms max=350.91ms p(90)=129.66ms p(95)=142.94ms p(99.9)=241.16ms
     iterations.....................: 68207   565.824619/s
     success_rate...................: 100.00% ✓ 68207      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89379      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=7.44µs   min=1.33µs  med=3.47µs   max=4.4ms    p(90)=4.8µs    p(95)=5.37µs   p(99.9)=2.01ms  
     http_req_connecting............: avg=3.68µs   min=0s      med=0s       max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=1.97ms  
     http_req_duration..............: avg=200.58ms min=8.66ms  med=204.02ms max=421.83ms p(90)=226.05ms p(95)=233.64ms p(99.9)=305.6ms 
       { expected_response:true }...: avg=200.58ms min=8.66ms  med=204.02ms max=421.83ms p(90)=226.05ms p(95)=233.64ms p(99.9)=305.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29893
     http_req_receiving.............: avg=100.85µs min=32.82µs med=91.35µs  max=63.95ms  p(90)=122.41µs p(95)=136.51µs p(99.9)=746.97µs
     http_req_sending...............: avg=31.36µs  min=6.27µs  med=16.48µs  max=99.07ms  p(90)=21.21µs  p(95)=23.03µs  p(99.9)=492.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.44ms min=8.53ms  med=203.91ms max=421.45ms p(90)=225.91ms p(95)=233.49ms p(99.9)=305.51ms
     http_reqs......................: 29893   246.834531/s
     iteration_duration.............: avg=201.53ms min=20.3ms  med=204.29ms max=430.57ms p(90)=226.39ms p(95)=233.97ms p(99.9)=307.16ms
     iterations.....................: 29793   246.008804/s
     success_rate...................: 100.00% ✓ 29793      ✗ 0    
     vus............................: 44      min=44       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88053      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=6.84µs   min=1.33µs  med=3.73µs   max=5.02ms   p(90)=5.26µs   p(95)=5.92µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=2.67µs   min=0s      med=0s       max=3.66ms   p(90)=0s       p(95)=0s       p(99.9)=1.18ms  
     http_req_duration..............: avg=203.64ms min=6.56ms  med=205.7ms  max=872.09ms p(90)=290.9ms  p(95)=409.01ms p(99.9)=737.13ms
       { expected_response:true }...: avg=203.64ms min=6.56ms  med=205.7ms  max=872.09ms p(90)=290.9ms  p(95)=409.01ms p(99.9)=737.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29451
     http_req_receiving.............: avg=142.41µs min=35.08µs med=98.3µs   max=176.79ms p(90)=129.86µs p(95)=143.03µs p(99.9)=839.38µs
     http_req_sending...............: avg=27.99µs  min=6.14µs  med=18.25µs  max=145.41ms p(90)=23.37µs  p(95)=25.29µs  p(99.9)=954.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.47ms min=6.41ms  med=205.51ms max=871.97ms p(90)=290.64ms p(95)=408.89ms p(99.9)=736.95ms
     http_reqs......................: 29451   243.403655/s
     iteration_duration.............: avg=204.61ms min=19.18ms med=206.15ms max=872.35ms p(90)=291.56ms p(95)=409.73ms p(99.9)=737.78ms
     iterations.....................: 29351   242.577185/s
     success_rate...................: 100.00% ✓ 29351      ✗ 0    
     vus............................: 5       min=5        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 827559      ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 332 MB  2.8 MB/s
     http_req_blocked...............: avg=3.57µs   min=1µs     med=2.69µs  max=14.82ms  p(90)=4.27µs   p(95)=5.12µs   p(99.9)=39.27µs
     http_req_connecting............: avg=354ns    min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.5ms   min=1.81ms  med=21ms    max=327.41ms p(90)=29.88ms  p(95)=33ms     p(99.9)=54.28ms
       { expected_response:true }...: avg=21.5ms   min=1.81ms  med=21ms    max=327.41ms p(90)=29.88ms  p(95)=33ms     p(99.9)=54.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 275953
     http_req_receiving.............: avg=139.68µs min=27.97µs med=58.57µs max=288.38ms p(90)=109.27µs p(95)=265.82µs p(99.9)=9.52ms 
     http_req_sending...............: avg=55.3µs   min=5.56µs  med=10.88µs max=98.74ms  p(90)=19.54µs  p(95)=131.22µs p(99.9)=5.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.3ms   min=1.73ms  med=20.85ms max=145.07ms p(90)=29.68ms  p(95)=32.72ms  p(99.9)=52.52ms
     http_reqs......................: 275953  2295.057481/s
     iteration_duration.............: avg=21.74ms  min=3.02ms  med=21.22ms max=352.32ms p(90)=30.11ms  p(95)=33.25ms  p(99.9)=54.95ms
     iterations.....................: 275853  2294.225797/s
     success_rate...................: 100.00% ✓ 275853      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 731652      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 293 MB  2.4 MB/s
     http_req_blocked...............: avg=3.63µs  min=1.01µs  med=2.6µs   max=15.3ms   p(90)=4.07µs  p(95)=4.84µs   p(99.9)=35.62µs 
     http_req_connecting............: avg=498ns   min=0s      med=0s      max=4.59ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.34ms min=1.81ms  med=21.53ms max=322.15ms p(90)=40.7ms  p(95)=49.49ms  p(99.9)=108.84ms
       { expected_response:true }...: avg=24.34ms min=1.81ms  med=21.53ms max=322.15ms p(90)=40.7ms  p(95)=49.49ms  p(99.9)=108.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 243984
     http_req_receiving.............: avg=1.15ms  min=53.33µs med=337.6µs max=288.71ms p(90)=2.52ms  p(95)=3.8ms    p(99.9)=37.98ms 
     http_req_sending...............: avg=47.55µs min=5.2µs   med=10.22µs max=148.42ms p(90)=19.22µs p(95)=118.81µs p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.14ms min=1.68ms  med=20.31ms max=311.97ms p(90)=39.09ms p(95)=47.7ms   p(99.9)=106.55ms
     http_reqs......................: 243984  2029.275615/s
     iteration_duration.............: avg=24.59ms min=2.18ms  med=21.76ms max=345.52ms p(90)=40.95ms p(95)=49.73ms  p(99.9)=109.5ms 
     iterations.....................: 243884  2028.44389/s
     success_rate...................: 100.00% ✓ 243884      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 710793      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=3.56µs   min=1.05µs  med=2.65µs  max=11.35ms  p(90)=4.09µs  p(95)=4.82µs  p(99.9)=38.32µs 
     http_req_connecting............: avg=424ns    min=0s      med=0s      max=4.03ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.06ms  min=1.9ms   med=18.25ms max=346.57ms p(90)=50.93ms p(95)=68.05ms p(99.9)=166.34ms
       { expected_response:true }...: avg=25.06ms  min=1.9ms   med=18.25ms max=346.57ms p(90)=50.93ms p(95)=68.05ms p(99.9)=166.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 237031
     http_req_receiving.............: avg=987.75µs min=53.33µs med=134.8µs max=263.34ms p(90)=1.63ms  p(95)=2.63ms  p(99.9)=61.91ms 
     http_req_sending...............: avg=45.55µs  min=5.45µs  med=10.48µs max=156.24ms p(90)=18.58µs p(95)=113.8µs p(99.9)=3.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.03ms  min=1.8ms   med=17.4ms  max=345.85ms p(90)=49.07ms p(95)=65.85ms p(99.9)=164.17ms
     http_reqs......................: 237031  1971.234825/s
     iteration_duration.............: avg=25.31ms  min=2.7ms   med=18.48ms max=356.6ms  p(90)=51.17ms p(95)=68.3ms  p(99.9)=168.04ms
     iterations.....................: 236931  1970.403189/s
     success_rate...................: 100.00% ✓ 236931      ✗ 0     
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

     checks.........................: 100.00% ✓ 542880      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 218 MB  1.8 MB/s
     http_req_blocked...............: avg=3.76µs   min=992ns   med=2.53µs  max=8.17ms   p(90)=4.96µs  p(95)=6.13µs   p(99.9)=44.37µs
     http_req_connecting............: avg=507ns    min=0s      med=0s      max=4.33ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.88ms  min=2.49ms  med=32.13ms max=344.63ms p(90)=43.41ms p(95)=47.99ms  p(99.9)=84.29ms
       { expected_response:true }...: avg=32.88ms  min=2.49ms  med=32.13ms max=344.63ms p(90)=43.41ms p(95)=47.99ms  p(99.9)=84.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181060
     http_req_receiving.............: avg=144.79µs min=30.37µs med=62.62µs max=266.71ms p(90)=138.8µs p(95)=300.67µs p(99.9)=5.9ms  
     http_req_sending...............: avg=48.04µs  min=5.25µs  med=10.69µs max=82.17ms  p(90)=24.99µs p(95)=139.54µs p(99.9)=3.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.68ms  min=2.38ms  med=31.99ms max=132.74ms p(90)=43.22ms p(95)=47.75ms  p(99.9)=81.74ms
     http_reqs......................: 181060  1505.033427/s
     iteration_duration.............: avg=33.14ms  min=3.96ms  med=32.37ms max=355.16ms p(90)=43.66ms p(95)=48.24ms  p(99.9)=84.92ms
     iterations.....................: 180960  1504.202192/s
     success_rate...................: 100.00% ✓ 180960      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.324.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 395322      ✗ 0     
     data_received..................: 12 GB   96 MB/s
     data_sent......................: 158 MB  1.3 MB/s
     http_req_blocked...............: avg=4.21µs  min=1.08µs  med=3.01µs  max=4.76ms   p(90)=4.68µs   p(95)=5.41µs   p(99.9)=38.61µs
     http_req_connecting............: avg=864ns   min=0s      med=0s      max=4.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=45.26ms min=2.39ms  med=44.71ms max=332.86ms p(90)=63.66ms  p(95)=69.44ms  p(99.9)=98.3ms 
       { expected_response:true }...: avg=45.26ms min=2.39ms  med=44.71ms max=332.86ms p(90)=63.66ms  p(95)=69.44ms  p(99.9)=98.3ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 131874
     http_req_receiving.............: avg=91.53µs min=28.49µs med=73.45µs max=166.95ms p(90)=113.33µs p(95)=131.75µs p(99.9)=1.72ms 
     http_req_sending...............: avg=30.21µs min=5.54µs  med=12.55µs max=191.56ms p(90)=18.97µs  p(95)=22.73µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45.14ms min=2.3ms   med=44.6ms  max=332.65ms p(90)=63.53ms  p(95)=69.3ms   p(99.9)=97.96ms
     http_reqs......................: 131874  1096.141082/s
     iteration_duration.............: avg=45.52ms min=4.25ms  med=44.93ms max=350.67ms p(90)=63.89ms  p(95)=69.65ms  p(99.9)=98.94ms
     iterations.....................: 131774  1095.309878/s
     success_rate...................: 100.00% ✓ 131774      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 194715     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   647 kB/s
     http_req_blocked...............: avg=5.09µs  min=1.21µs  med=3.36µs  max=4.39ms   p(90)=4.99µs   p(95)=5.63µs   p(99.9)=55.64µs 
     http_req_connecting............: avg=1.48µs  min=0s      med=0s      max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.06ms min=4.15ms  med=96.47ms max=297.04ms p(90)=130.89ms p(95)=143.65ms p(99.9)=245.31ms
       { expected_response:true }...: avg=92.06ms min=4.15ms  med=96.47ms max=297.04ms p(90)=130.89ms p(95)=143.65ms p(99.9)=245.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65005
     http_req_receiving.............: avg=90.3µs  min=32.95µs med=82.3µs  max=30.94ms  p(90)=117.13µs p(95)=130.85µs p(99.9)=823.37µs
     http_req_sending...............: avg=26.24µs min=5.81µs  med=14.41µs max=181.09ms p(90)=21.11µs  p(95)=23.41µs  p(99.9)=758.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.94ms min=4.04ms  med=96.37ms max=296.91ms p(90)=130.76ms p(95)=143.51ms p(99.9)=245.18ms
     http_reqs......................: 65005   539.044437/s
     iteration_duration.............: avg=92.46ms min=19.21ms med=96.76ms max=360.86ms p(90)=131.17ms p(95)=144ms    p(99.9)=247.69ms
     iterations.....................: 64905   538.215201/s
     success_rate...................: 100.00% ✓ 64905      ✗ 0    
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

     checks.........................: 100.00% ✓ 138525     ✗ 0    
     data_received..................: 4.0 GB  34 MB/s
     data_sent......................: 56 MB   460 kB/s
     http_req_blocked...............: avg=5.93µs   min=1.24µs  med=3.51µs   max=4.13ms   p(90)=4.93µs   p(95)=5.52µs   p(99.9)=344.35µs
     http_req_connecting............: avg=2.2µs    min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=264.4µs 
     http_req_duration..............: avg=129.44ms min=5.62ms  med=126.72ms max=368.72ms p(90)=171.05ms p(95)=184.79ms p(99.9)=237.98ms
       { expected_response:true }...: avg=129.44ms min=5.62ms  med=126.72ms max=368.72ms p(90)=171.05ms p(95)=184.79ms p(99.9)=237.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46275
     http_req_receiving.............: avg=92.33µs  min=32.11µs med=84.75µs  max=32.22ms  p(90)=116.89µs p(95)=128.8µs  p(99.9)=750.37µs
     http_req_sending...............: avg=27.42µs  min=6.08µs  med=15.42µs  max=128.73ms p(90)=20.59µs  p(95)=22.5µs   p(99.9)=594.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.32ms min=5.5ms   med=126.61ms max=368.17ms p(90)=170.95ms p(95)=184.68ms p(99.9)=237.76ms
     http_reqs......................: 46275   383.317112/s
     iteration_duration.............: avg=129.97ms min=24.59ms med=127.04ms max=376.06ms p(90)=171.37ms p(95)=185.11ms p(99.9)=240.05ms
     iterations.....................: 46175   382.488766/s
     success_rate...................: 100.00% ✓ 46175      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.9.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 89340      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=7.51µs   min=1.27µs  med=3.87µs   max=4.05ms   p(90)=5.43µs   p(95)=6.03µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.3µs    min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=200.69ms min=6.51ms  med=185.16ms max=737.38ms p(90)=232.83ms p(95)=290.77ms p(99.9)=616.03ms
       { expected_response:true }...: avg=200.69ms min=6.51ms  med=185.16ms max=737.38ms p(90)=232.83ms p(95)=290.77ms p(99.9)=616.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29880
     http_req_receiving.............: avg=118.35µs min=36.86µs med=100.12µs max=144.58ms p(90)=131.31µs p(95)=144.49µs p(99.9)=687.11µs
     http_req_sending...............: avg=28.2µs   min=6.27µs  med=18.38µs  max=92.74ms  p(90)=23.31µs  p(95)=25.02µs  p(99.9)=693.91µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.54ms min=6.37ms  med=185.03ms max=737.25ms p(90)=232.68ms p(95)=290.28ms p(99.9)=615.93ms
     http_reqs......................: 29880   246.881999/s
     iteration_duration.............: avg=201.66ms min=51.04ms med=185.6ms  max=737.63ms p(90)=233.27ms p(95)=294.95ms p(99.9)=616.54ms
     iterations.....................: 29780   246.055754/s
     success_rate...................: 100.00% ✓ 29780      ✗ 0    
     vus............................: 8       min=8        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85908      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.25µs   min=1.17µs  med=3.6µs    max=3.87ms   p(90)=5.02µs   p(95)=5.6µs    p(99.9)=1.73ms  
     http_req_connecting............: avg=3.41µs   min=0s      med=0s       max=3.82ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=208.67ms min=8.79ms  med=215.53ms max=436.13ms p(90)=234.75ms p(95)=241.5ms  p(99.9)=323.58ms
       { expected_response:true }...: avg=208.67ms min=8.79ms  med=215.53ms max=436.13ms p(90)=234.75ms p(95)=241.5ms  p(99.9)=323.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28736
     http_req_receiving.............: avg=212.25µs min=35.04µs med=94.95µs  max=159.35ms p(90)=126.84µs p(95)=139.51µs p(99.9)=74.55ms 
     http_req_sending...............: avg=29.42µs  min=6.1µs   med=17.49µs  max=146.45ms p(90)=22.35µs  p(95)=24.25µs  p(99.9)=591.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.42ms min=8.67ms  med=215.4ms  max=340.12ms p(90)=234.63ms p(95)=241.39ms p(99.9)=320.13ms
     http_reqs......................: 28736   237.221255/s
     iteration_duration.............: avg=209.67ms min=13.17ms med=215.84ms max=446.78ms p(90)=235.04ms p(95)=241.85ms p(99.9)=327.49ms
     iterations.....................: 28636   236.395735/s
     success_rate...................: 100.00% ✓ 28636      ✗ 0    
     vus............................: 49      min=49       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

