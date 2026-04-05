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
| hive-router | v0.0.43 | 3,027 | 3,190 | 2,944 | 2.6% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,115 | 2,166 | 2,104 | 1.0% |  |
| grafbase | 0.53.2 | 2,066 | 2,130 | 2,042 | 1.4% |  |
| cosmo | 0.298.0 | 1,301 | 1,304 | 1,293 | 0.4% | non-compatible response (6023660 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 627 | 640 | 621 | 1.0% |  |
| apollo-router | v2.12.1 | 393 | 406 | 387 | 1.7% |  |
| hive-gateway | 2.5.14 | 270 | 275 | 266 | 1.2% |  |
| apollo-gateway | 2.13.3 | 244 | 247 | 242 | 0.7% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,363 | 2,519 | 2,328 | 2.7% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,960 | 2,007 | 1,948 | 1.0% |  |
| grafbase | 0.53.2 | 1,536 | 1,584 | 1,523 | 1.2% |  |
| cosmo | 0.298.0 | 1,215 | 1,223 | 1,203 | 0.7% | non-compatible response (6 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 580 | 597 | 575 | 1.2% |  |
| apollo-router | v2.12.1 | 397 | 407 | 393 | 1.2% |  |
| hive-gateway | 2.5.14 | 256 | 261 | 252 | 1.3% |  |
| apollo-gateway | 2.13.3 | 232 | 236 | 231 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1091310     ✗ 0     
     data_received..................: 32 GB   266 MB/s
     data_sent......................: 437 MB  3.6 MB/s
     http_req_blocked...............: avg=2.9µs    min=981ns  med=2.15µs  max=7.67ms   p(90)=3.41µs   p(95)=4.07µs   p(99.9)=32.39µs
     http_req_connecting............: avg=307ns    min=0s     med=0s      max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.25ms  min=1.61ms med=15.28ms max=319.41ms p(90)=24.34ms  p(95)=28.35ms  p(99.9)=51.71ms
       { expected_response:true }...: avg=16.25ms  min=1.61ms med=15.28ms max=319.41ms p(90)=24.34ms  p(95)=28.35ms  p(99.9)=51.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 363870
     http_req_receiving.............: avg=143.26µs min=27.4µs med=49.06µs max=92.14ms  p(90)=100.17µs p(95)=281.24µs p(99.9)=16.89ms
     http_req_sending...............: avg=62.21µs  min=5.04µs med=9.14µs  max=272.12ms p(90)=15.56µs  p(95)=122.68µs p(99.9)=9.7ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.05ms  min=1.54ms med=15.12ms max=282.21ms p(90)=24.03ms  p(95)=27.89ms  p(99.9)=49.79ms
     http_reqs......................: 363870  3027.297213/s
     iteration_duration.............: avg=16.48ms  min=2.03ms med=15.48ms max=342.58ms p(90)=24.57ms  p(95)=28.6ms   p(99.9)=52.8ms 
     iterations.....................: 363770  3026.46524/s
     success_rate...................: 100.00% ✓ 363770      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 763353      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=3.02µs   min=1.03µs  med=2.25µs   max=12.57ms  p(90)=3.44µs   p(95)=4.05µs   p(99.9)=31.72µs 
     http_req_connecting............: avg=407ns    min=0s      med=0s       max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.34ms  min=2.52ms  med=15.02ms  max=297.42ms p(90)=51.88ms  p(95)=70.65ms  p(99.9)=167.43ms
       { expected_response:true }...: avg=23.34ms  min=2.52ms  med=15.02ms  max=297.42ms p(90)=51.88ms  p(95)=70.65ms  p(99.9)=167.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 254551
     http_req_receiving.............: avg=685.64µs min=51.61µs med=105.86µs max=182.91ms p(90)=989.11µs p(95)=1.57ms   p(99.9)=64.64ms 
     http_req_sending...............: avg=44.28µs  min=5.29µs  med=9.47µs   max=152.52ms p(90)=15.99µs  p(95)=108.35µs p(99.9)=3.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.61ms  min=2.39ms  med=14.48ms  max=283.5ms  p(90)=50.45ms  p(95)=69.19ms  p(99.9)=164.86ms
     http_reqs......................: 254551  2115.512086/s
     iteration_duration.............: avg=23.57ms  min=3.29ms  med=15.24ms  max=333.82ms p(90)=52.12ms  p(95)=70.9ms   p(99.9)=168.48ms
     iterations.....................: 254451  2114.68101/s
     success_rate...................: 100.00% ✓ 254451      ✗ 0     
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

     checks.........................: 100.00% ✓ 745302      ✗ 0     
     data_received..................: 22 GB   182 MB/s
     data_sent......................: 299 MB  2.5 MB/s
     http_req_blocked...............: avg=3.66µs   min=1µs     med=2.58µs  max=12.62ms  p(90)=4.19µs   p(95)=5.01µs   p(99.9)=45.67µs
     http_req_connecting............: avg=442ns    min=0s      med=0s      max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.9ms   min=1.9ms   med=23.64ms max=310.75ms p(90)=28.64ms  p(95)=30.97ms  p(99.9)=53.59ms
       { expected_response:true }...: avg=23.9ms   min=1.9ms   med=23.64ms max=310.75ms p(90)=28.64ms  p(95)=30.97ms  p(99.9)=53.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 248534
     http_req_receiving.............: avg=111.43µs min=29.75µs med=59.19µs max=66.11ms  p(90)=104.19µs p(95)=205.61µs p(99.9)=9.25ms 
     http_req_sending...............: avg=45.89µs  min=4.7µs   med=10.61µs max=157.08ms p(90)=18.6µs   p(95)=121.04µs p(99.9)=2.99ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.74ms  min=1.84ms  med=23.53ms max=309.93ms p(90)=28.48ms  p(95)=30.71ms  p(99.9)=51.98ms
     http_reqs......................: 248534  2066.695207/s
     iteration_duration.............: avg=24.14ms  min=3.1ms   med=23.85ms max=334.89ms p(90)=28.87ms  p(95)=31.21ms  p(99.9)=54.21ms
     iterations.....................: 248434  2065.863652/s
     success_rate...................: 100.00% ✓ 248434      ✗ 0     
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

     checks.........................: 100.00% ✓ 469146      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 188 MB  1.6 MB/s
     http_req_blocked...............: avg=3.21µs  min=1.04µs  med=2.12µs  max=6.17ms   p(90)=3.4µs   p(95)=3.99µs   p(99.9)=36.01µs
     http_req_connecting............: avg=703ns   min=0s      med=0s      max=4.46ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.13ms min=2.13ms  med=37.59ms max=310.98ms p(90)=53.69ms p(95)=58.61ms  p(99.9)=82.67ms
       { expected_response:true }...: avg=38.13ms min=2.13ms  med=37.59ms max=310.98ms p(90)=53.69ms p(95)=58.61ms  p(99.9)=82.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156482
     http_req_receiving.............: avg=77.21µs min=27.97µs med=58.42µs max=25.8ms   p(90)=92.89µs p(95)=109.37µs p(99.9)=1.89ms 
     http_req_sending...............: avg=27.99µs min=5.14µs  med=10µs    max=197.92ms p(90)=15.36µs p(95)=19.13µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.03ms min=2.05ms  med=37.49ms max=310.77ms p(90)=53.58ms p(95)=58.48ms  p(99.9)=82.07ms
     http_reqs......................: 156482  1301.15404/s
     iteration_duration.............: avg=38.36ms min=4.41ms  med=37.78ms max=334.01ms p(90)=53.89ms p(95)=58.8ms   p(99.9)=83.1ms 
     iterations.....................: 156382  1300.322536/s
     success_rate...................: 100.00% ✓ 156382      ✗ 0     
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

     checks.........................: 100.00% ✓ 226554     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 91 MB   754 kB/s
     http_req_blocked...............: avg=4.62µs  min=1.2µs   med=2.93µs  max=4.55ms   p(90)=4.45µs   p(95)=5.07µs   p(99.9)=39.79µs 
     http_req_connecting............: avg=1.36µs  min=0s      med=0s      max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.12ms min=3.73ms  med=76.74ms max=350.67ms p(90)=95.51ms  p(95)=104.83ms p(99.9)=198.13ms
       { expected_response:true }...: avg=79.12ms min=3.73ms  med=76.74ms max=350.67ms p(90)=95.51ms  p(95)=104.83ms p(99.9)=198.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75618
     http_req_receiving.............: avg=87.63µs min=31.83µs med=76.57µs max=180.64ms p(90)=110.22µs p(95)=123.31µs p(99.9)=934.34µs
     http_req_sending...............: avg=21.59µs min=5.73µs  med=13.28µs max=55.58ms  p(90)=19.93µs  p(95)=22.28µs  p(99.9)=775.26µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.01ms min=3.67ms  med=76.63ms max=350.2ms  p(90)=95.4ms   p(95)=104.71ms p(99.9)=197.57ms
     http_reqs......................: 75618   627.48213/s
     iteration_duration.............: avg=79.45ms min=11.87ms med=76.97ms max=365.01ms p(90)=95.74ms  p(95)=105.11ms p(99.9)=200.36ms
     iterations.....................: 75518   626.652324/s
     success_rate...................: 100.00% ✓ 75518      ✗ 0    
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

     checks.........................: 100.00% ✓ 142347     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   473 kB/s
     http_req_blocked...............: avg=4.26µs   min=1.15µs  med=3.12µs   max=4.11ms   p(90)=4.51µs   p(95)=5.07µs   p(99.9)=137.47µs
     http_req_connecting............: avg=939ns    min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=88.85µs 
     http_req_duration..............: avg=125.98ms min=5.38ms  med=125.75ms max=353.88ms p(90)=152.56ms p(95)=160.5ms  p(99.9)=199.71ms
       { expected_response:true }...: avg=125.98ms min=5.38ms  med=125.75ms max=353.88ms p(90)=152.56ms p(95)=160.5ms  p(99.9)=199.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47549
     http_req_receiving.............: avg=167.63µs min=31.39µs med=79.75µs  max=213.11ms p(90)=110.96µs p(95)=122.57µs p(99.9)=1.99ms  
     http_req_sending...............: avg=32.72µs  min=5.91µs  med=14.06µs  max=226.74ms p(90)=19.51µs  p(95)=21.38µs  p(99.9)=607.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.78ms min=5.32ms  med=125.63ms max=233.93ms p(90)=152.34ms p(95)=160.24ms p(99.9)=192.54ms
     http_reqs......................: 47549   393.929048/s
     iteration_duration.............: avg=126.48ms min=9.61ms  med=126.02ms max=360.96ms p(90)=152.82ms p(95)=160.76ms p(99.9)=202.66ms
     iterations.....................: 47449   393.100578/s
     success_rate...................: 100.00% ✓ 47449      ✗ 0    
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

     checks.........................: 100.00% ✓ 97758      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.61µs   min=1.26µs  med=3.59µs   max=4.24ms   p(90)=5.05µs   p(95)=5.65µs   p(99.9)=986.68µs
     http_req_connecting............: avg=2.8µs    min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=961.93µs
     http_req_duration..............: avg=183.44ms min=5.93ms  med=160.8ms  max=709.26ms p(90)=238.69ms p(95)=320.54ms p(99.9)=598.79ms
       { expected_response:true }...: avg=183.44ms min=5.93ms  med=160.8ms  max=709.26ms p(90)=238.69ms p(95)=320.54ms p(99.9)=598.79ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32686
     http_req_receiving.............: avg=103.97µs min=37.53µs med=95.47µs  max=45.56ms  p(90)=127.7µs  p(95)=141.05µs p(99.9)=791.39µs
     http_req_sending...............: avg=24.66µs  min=6.56µs  med=17.36µs  max=60.01ms  p(90)=22.43µs  p(95)=24.3µs   p(99.9)=597.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.31ms min=5.8ms   med=160.68ms max=709.16ms p(90)=238.55ms p(95)=320.46ms p(99.9)=598.68ms
     http_reqs......................: 32686   270.280737/s
     iteration_duration.............: avg=184.26ms min=29.12ms med=161.25ms max=709.48ms p(90)=239.27ms p(95)=322.21ms p(99.9)=599.07ms
     iterations.....................: 32586   269.453836/s
     success_rate...................: 100.00% ✓ 32586      ✗ 0    
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

     checks.........................: 100.00% ✓ 88398      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=7.22µs   min=1.09µs  med=3.37µs   max=4.69ms   p(90)=4.67µs   p(95)=5.21µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=3.61µs   min=0s      med=0s       max=4.64ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=202.77ms min=8.46ms  med=200.31ms max=441.51ms p(90)=216.8ms  p(95)=228.92ms p(99.9)=301.99ms
       { expected_response:true }...: avg=202.77ms min=8.46ms  med=200.31ms max=441.51ms p(90)=216.8ms  p(95)=228.92ms p(99.9)=301.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29566
     http_req_receiving.............: avg=103.33µs min=35.48µs med=91.13µs  max=162.46ms p(90)=121.95µs p(95)=134.6µs  p(99.9)=619.33µs
     http_req_sending...............: avg=22.75µs  min=5.85µs  med=16.27µs  max=44.65ms  p(90)=21.19µs  p(95)=22.93µs  p(99.9)=563.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.64ms min=8.38ms  med=200.2ms  max=419.66ms p(90)=216.67ms p(95)=228.77ms p(99.9)=299.13ms
     http_reqs......................: 29566   244.217473/s
     iteration_duration.............: avg=203.74ms min=53.89ms med=200.58ms max=463.24ms p(90)=217.08ms p(95)=229.45ms p(99.9)=310.95ms
     iterations.....................: 29466   243.391465/s
     success_rate...................: 100.00% ✓ 29466      ✗ 0    
     vus............................: 32      min=32       max=50 
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

     checks.........................: 100.00% ✓ 852249      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=3.2µs    min=962ns   med=2.41µs  max=12.12ms  p(90)=3.88µs   p(95)=4.64µs   p(99.9)=36.07µs
     http_req_connecting............: avg=207ns    min=0s      med=0s      max=3.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.88ms  min=1.88ms  med=20.34ms max=346.81ms p(90)=29.19ms  p(95)=32.36ms  p(99.9)=55.19ms
       { expected_response:true }...: avg=20.88ms  min=1.88ms  med=20.34ms max=346.81ms p(90)=29.19ms  p(95)=32.36ms  p(99.9)=55.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284183
     http_req_receiving.............: avg=142.53µs min=28.85µs med=55.15µs max=312.11ms p(90)=104.27µs p(95)=264.01µs p(99.9)=10.26ms
     http_req_sending...............: avg=53.94µs  min=5.35µs  med=10.04µs max=35.87ms  p(90)=17.94µs  p(95)=124.77µs p(99.9)=6.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.68ms  min=1.79ms  med=20.2ms  max=117.5ms  p(90)=28.98ms  p(95)=32.05ms  p(99.9)=53.47ms
     http_reqs......................: 284183  2363.542773/s
     iteration_duration.............: avg=21.1ms   min=3.34ms  med=20.55ms max=359.95ms p(90)=29.41ms  p(95)=32.61ms  p(99.9)=55.66ms
     iterations.....................: 284083  2362.711075/s
     success_rate...................: 100.00% ✓ 284083      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 707145      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 283 MB  2.4 MB/s
     http_req_blocked...............: avg=3.31µs   min=990ns   med=2.4µs    max=11.71ms  p(90)=3.9µs   p(95)=4.64µs   p(99.9)=38.25µs 
     http_req_connecting............: avg=425ns    min=0s      med=0s       max=4.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.2ms   min=1.93ms  med=17.55ms  max=488.26ms p(90)=52.47ms p(95)=69.57ms  p(99.9)=190.85ms
       { expected_response:true }...: avg=25.2ms   min=1.93ms  med=17.55ms  max=488.26ms p(90)=52.47ms p(95)=69.57ms  p(99.9)=190.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 235815
     http_req_receiving.............: avg=684.98µs min=51.74µs med=106.23µs max=182.9ms  p(90)=1.15ms  p(95)=1.87ms   p(99.9)=57.25ms 
     http_req_sending...............: avg=47.43µs  min=5.24µs  med=10.09µs  max=242.3ms  p(90)=18.87µs p(95)=114.14µs p(99.9)=2.84ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.47ms  min=1.83ms  med=16.98ms  max=488.14ms p(90)=51.19ms p(95)=68.02ms  p(99.9)=187.72ms
     http_reqs......................: 235815  1960.962488/s
     iteration_duration.............: avg=25.44ms  min=2.74ms  med=17.77ms  max=488.53ms p(90)=52.71ms p(95)=69.81ms  p(99.9)=193.45ms
     iterations.....................: 235715  1960.13092/s
     success_rate...................: 100.00% ✓ 235715      ✗ 0     
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

     checks.........................: 100.00% ✓ 554187      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 222 MB  1.8 MB/s
     http_req_blocked...............: avg=4.24µs   min=952ns  med=2.36µs  max=13.1ms   p(90)=4.68µs   p(95)=5.81µs   p(99.9)=45.46µs
     http_req_connecting............: avg=1.09µs   min=0s     med=0s      max=8.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.2ms   min=2.42ms med=31.36ms max=314.84ms p(90)=42.93ms  p(95)=47.7ms   p(99.9)=85.9ms 
       { expected_response:true }...: avg=32.2ms   min=2.42ms med=31.36ms max=314.84ms p(90)=42.93ms  p(95)=47.7ms   p(99.9)=85.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 184829
     http_req_receiving.............: avg=118.75µs min=30.4µs med=61.27µs max=239.43ms p(90)=134.87µs p(95)=285.79µs p(99.9)=6.45ms 
     http_req_sending...............: avg=47.22µs  min=5.17µs med=10.42µs max=83.25ms  p(90)=24.4µs   p(95)=135.89µs p(99.9)=3.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.03ms  min=2.31ms med=31.22ms max=300.6ms  p(90)=42.73ms  p(95)=47.46ms  p(99.9)=85.14ms
     http_reqs......................: 184829  1536.107194/s
     iteration_duration.............: avg=32.47ms  min=5.29ms med=31.6ms  max=339.43ms p(90)=43.17ms  p(95)=47.95ms  p(99.9)=87.04ms
     iterations.....................: 184729  1535.276097/s
     success_rate...................: 100.00% ✓ 184729      ✗ 0     
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

     checks.........................: 100.00% ✓ 438171      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 176 MB  1.5 MB/s
     http_req_blocked...............: avg=3.83µs  min=1.03µs  med=2.64µs  max=4.85ms   p(90)=4.18µs   p(95)=4.86µs   p(99.9)=34.16µs
     http_req_connecting............: avg=855ns   min=0s      med=0s      max=4.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.82ms min=2.19ms  med=40.29ms max=331.77ms p(90)=57.34ms  p(95)=62.57ms  p(99.9)=87.85ms
       { expected_response:true }...: avg=40.82ms min=2.19ms  med=40.29ms max=331.77ms p(90)=57.34ms  p(95)=62.57ms  p(99.9)=87.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146157
     http_req_receiving.............: avg=108µs   min=29.91µs med=67.79µs max=162.72ms p(90)=105.89µs p(95)=124.04µs p(99.9)=2.24ms 
     http_req_sending...............: avg=28.07µs min=5.36µs  med=11.65µs max=147.07ms p(90)=18.07µs  p(95)=21.9µs   p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.68ms min=2.08ms  med=40.18ms max=169.77ms p(90)=57.23ms  p(95)=62.44ms  p(99.9)=87.27ms
     http_reqs......................: 146157  1215.157021/s
     iteration_duration.............: avg=41.07ms min=4.1ms   med=40.51ms max=345.74ms p(90)=57.55ms  p(95)=62.78ms  p(99.9)=88.2ms 
     iterations.....................: 146057  1214.325615/s
     success_rate...................: 100.00% ✓ 146057      ✗ 0     
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

     checks.........................: 100.00% ✓ 209712     ✗ 0    
     data_received..................: 6.1 GB  51 MB/s
     data_sent......................: 84 MB   698 kB/s
     http_req_blocked...............: avg=4.75µs   min=1.08µs  med=2.92µs  max=4.49ms   p(90)=4.4µs    p(95)=5.01µs   p(99.9)=41.87µs 
     http_req_connecting............: avg=1.58µs   min=0s      med=0s      max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=85.47ms  min=4.1ms   med=82.97ms max=366.14ms p(90)=104.19ms p(95)=114.74ms p(99.9)=217.91ms
       { expected_response:true }...: avg=85.47ms  min=4.1ms   med=82.97ms max=366.14ms p(90)=104.19ms p(95)=114.74ms p(99.9)=217.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70004
     http_req_receiving.............: avg=102.52µs min=32.73µs med=79.75µs max=93.11ms  p(90)=113.45µs p(95)=126.2µs  p(99.9)=1.04ms  
     http_req_sending...............: avg=25.71µs  min=5.83µs  med=13.72µs max=174.09ms p(90)=20.14µs  p(95)=22.28µs  p(99.9)=660.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.34ms  min=3.98ms  med=82.85ms max=282.01ms p(90)=104.07ms p(95)=114.59ms p(99.9)=216.61ms
     http_reqs......................: 70004   580.799153/s
     iteration_duration.............: avg=85.84ms  min=11.46ms med=83.21ms max=378.88ms p(90)=104.44ms p(95)=115.03ms p(99.9)=223.84ms
     iterations.....................: 69904   579.969487/s
     success_rate...................: 100.00% ✓ 69904      ✗ 0    
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

     checks.........................: 100.00% ✓ 143556     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   477 kB/s
     http_req_blocked...............: avg=5.84µs   min=1.16µs  med=3.52µs   max=4.05ms   p(90)=5.02µs   p(95)=5.61µs   p(99.9)=267.42µs
     http_req_connecting............: avg=2.11µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=140.12µs
     http_req_duration..............: avg=124.89ms min=5.97ms  med=122.37ms max=333.54ms p(90)=165.53ms p(95)=178ms    p(99.9)=229.72ms
       { expected_response:true }...: avg=124.89ms min=5.97ms  med=122.37ms max=333.54ms p(90)=165.53ms p(95)=178ms    p(99.9)=229.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47952
     http_req_receiving.............: avg=122.59µs min=29.31µs med=87.48µs  max=223.7ms  p(90)=118.35µs p(95)=129.92µs p(99.9)=880.61µs
     http_req_sending...............: avg=33.66µs  min=6.12µs  med=16.49µs  max=205.5ms  p(90)=21.76µs  p(95)=23.64µs  p(99.9)=619.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.73ms min=5.84ms  med=122.22ms max=332.9ms  p(90)=165.4ms  p(95)=177.8ms  p(99.9)=226.34ms
     http_reqs......................: 47952   397.127496/s
     iteration_duration.............: avg=125.41ms min=31.85ms med=122.72ms max=348.47ms p(90)=165.84ms p(95)=178.28ms p(99.9)=231.7ms 
     iterations.....................: 47852   396.299319/s
     success_rate...................: 100.00% ✓ 47852      ✗ 0    
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

     checks.........................: 100.00% ✓ 92823      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   308 kB/s
     http_req_blocked...............: avg=7.15µs   min=1.19µs  med=3.48µs   max=4.31ms   p(90)=4.83µs   p(95)=5.38µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=3.48µs   min=0s      med=0s       max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=193.16ms min=5.95ms  med=146.58ms max=810.14ms p(90)=324.17ms p(95)=372.94ms p(99.9)=627.75ms
       { expected_response:true }...: avg=193.16ms min=5.95ms  med=146.58ms max=810.14ms p(90)=324.17ms p(95)=372.94ms p(99.9)=627.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31041
     http_req_receiving.............: avg=100.53µs min=35.37µs med=93.26µs  max=64.63ms  p(90)=124.43µs p(95)=136.9µs  p(99.9)=579.94µs
     http_req_sending...............: avg=29.37µs  min=6.37µs  med=16.63µs  max=75.41ms  p(90)=21.5µs   p(95)=23.14µs  p(99.9)=623.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.03ms min=5.81ms  med=146.3ms  max=810.04ms p(90)=324.06ms p(95)=372.83ms p(99.9)=627.65ms
     http_reqs......................: 31041   256.655529/s
     iteration_duration.............: avg=194.04ms min=41.46ms med=160.66ms max=810.44ms p(90)=324.65ms p(95)=373.79ms p(99.9)=628.02ms
     iterations.....................: 30941   255.828701/s
     success_rate...................: 100.00% ✓ 30941      ✗ 0    
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

     checks.........................: 100.00% ✓ 84012      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   279 kB/s
     http_req_blocked...............: avg=5.74µs   min=1.09µs  med=3.47µs   max=2.88ms   p(90)=4.76µs   p(95)=5.31µs   p(99.9)=926.17µs
     http_req_connecting............: avg=2.03µs   min=0s      med=0s       max=2.85ms   p(90)=0s       p(95)=0s       p(99.9)=841.34µs
     http_req_duration..............: avg=213.34ms min=8.8ms   med=210.74ms max=414.94ms p(90)=238.17ms p(95)=247.59ms p(99.9)=313.01ms
       { expected_response:true }...: avg=213.34ms min=8.8ms   med=210.74ms max=414.94ms p(90)=238.17ms p(95)=247.59ms p(99.9)=313.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28104
     http_req_receiving.............: avg=104.03µs min=35.41µs med=93.37µs  max=68.92ms  p(90)=124.96µs p(95)=137.99µs p(99.9)=775.17µs
     http_req_sending...............: avg=34.61µs  min=6.15µs  med=17.12µs  max=114.37ms p(90)=21.76µs  p(95)=23.46µs  p(99.9)=815.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.2ms  min=8.69ms  med=210.63ms max=414.61ms p(90)=238.04ms p(95)=247.41ms p(99.9)=312.89ms
     http_reqs......................: 28104   232.060246/s
     iteration_duration.............: avg=214.37ms min=33.39ms med=211.02ms max=437.73ms p(90)=238.53ms p(95)=247.97ms p(99.9)=314.34ms
     iterations.....................: 28004   231.234526/s
     success_rate...................: 100.00% ✓ 28004      ✗ 0    
     vus............................: 48      min=48       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

