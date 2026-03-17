## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 11 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 10 runs are measured. Results are ranked by **median RPS** across the 10 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,981 | 2,981 | 2,894 | 2.1% |  |
| grafbase | 0.53.2 | 2,142 | 2,142 | 2,131 | 0.4% |  |
| hotchocolate | 16.0.0-p.11.47 | 1,859 | 1,859 | 1,851 | 0.3% |  |
| cosmo | 0.291.0 | 1,308 | 1,308 | 1,298 | 0.5% | non-compatible response (1 across 1/2 runs) |
| hive-gateway-router-runtime | 2.5.6 | 534 | 534 | 532 | 0.3% |  |
| apollo-router | v2.12.0 | 413 | 413 | 408 | 0.9% |  |
| hive-gateway | 2.5.6 | 272 | 272 | 268 | 1.0% |  |
| apollo-gateway | 2.13.2 | 246 | 246 | 245 | 0.3% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.41 | 2,425 | 2,425 | 2,371 | 1.6% |  |
| hotchocolate | 16.0.0-p.11.47 | 1,730 | 1,730 | 1,719 | 0.4% |  |
| grafbase | 0.53.2 | 1,588 | 1,588 | 1,565 | 1.0% |  |
| cosmo | 0.291.0 | 1,219 | 1,219 | 1,208 | 0.6% |  |
| hive-gateway-router-runtime | 2.5.6 | 515 | 515 | 514 | 0.1% |  |
| apollo-router | v2.12.0 | 411 | 411 | 407 | 0.7% |  |
| hive-gateway | 2.5.6 | 263 | 263 | 259 | 1.1% |  |
| apollo-gateway | 2.13.2 | 243 | 243 | 242 | 0.3% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.41)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1074645     ✗ 0     
     data_received..................: 31 GB   262 MB/s
     data_sent......................: 431 MB  3.6 MB/s
     http_req_blocked...............: avg=3.01µs   min=1.03µs  med=2.32µs  max=21.16ms  p(90)=3.45µs   p(95)=4.07µs   p(99.9)=36.39µs
     http_req_connecting............: avg=292ns    min=0s      med=0s      max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.52ms  min=1.46ms  med=15.95ms max=322.35ms p(90)=23.9ms   p(95)=26.77ms  p(99.9)=47.8ms 
       { expected_response:true }...: avg=16.52ms  min=1.46ms  med=15.95ms max=322.35ms p(90)=23.9ms   p(95)=26.77ms  p(99.9)=47.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 358315
     http_req_receiving.............: avg=108.45µs min=28.58µs med=52.78µs max=303.83ms p(90)=102.25µs p(95)=269.66µs p(99.9)=6.52ms 
     http_req_sending...............: avg=48.61µs  min=5.02µs  med=9.55µs  max=51.9ms   p(90)=16.84µs  p(95)=124.93µs p(99.9)=3.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.37ms  min=1.41ms  med=15.81ms max=310.32ms p(90)=23.72ms  p(95)=26.54ms  p(99.9)=46.81ms
     http_reqs......................: 358315  2981.404699/s
     iteration_duration.............: avg=16.74ms  min=1.94ms  med=16.15ms max=340.65ms p(90)=24.11ms  p(95)=26.99ms  p(99.9)=48.97ms
     iterations.....................: 358215  2980.572637/s
     success_rate...................: 100.00% ✓ 358215      ✗ 0     
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

     checks.........................: 100.00% ✓ 772725      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.09µs  min=1.03µs  med=2.34µs  max=3.98ms   p(90)=3.69µs  p(95)=4.36µs   p(99.9)=36.08µs
     http_req_connecting............: avg=364ns   min=0s      med=0s      max=3.87ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.05ms min=1.85ms  med=22.84ms max=314.57ms p(90)=27.23ms p(95)=28.97ms  p(99.9)=47.59ms
       { expected_response:true }...: avg=23.05ms min=1.85ms  med=22.84ms max=314.57ms p(90)=27.23ms p(95)=28.97ms  p(99.9)=47.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257675
     http_req_receiving.............: avg=93µs    min=29.66µs med=58.62µs max=33.91ms  p(90)=98.6µs  p(95)=168.23µs p(99.9)=4.42ms 
     http_req_sending...............: avg=40.36µs min=4.92µs  med=10.48µs max=199.92ms p(90)=17.48µs p(95)=111.77µs p(99.9)=1.83ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.92ms min=1.78ms  med=22.73ms max=314.31ms p(90)=27.09ms p(95)=28.79ms  p(99.9)=46.36ms
     http_reqs......................: 257675  2142.88077/s
     iteration_duration.............: avg=23.28ms min=3.27ms  med=23.05ms max=336.58ms p(90)=27.44ms p(95)=29.19ms  p(99.9)=48.37ms
     iterations.....................: 257575  2142.049149/s
     success_rate...................: 100.00% ✓ 257575      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 670956      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=3.03µs   min=1.08µs  med=2.29µs  max=4.22ms   p(90)=3.28µs  p(95)=3.79µs  p(99.9)=32.46µs 
     http_req_connecting............: avg=472ns    min=0s      med=0s      max=4.18ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=26.6ms   min=2.77ms  med=14.54ms max=411.13ms p(90)=65.46ms p(95)=86.44ms p(99.9)=196.54ms
       { expected_response:true }...: avg=26.6ms   min=2.77ms  med=14.54ms max=411.13ms p(90)=65.46ms p(95)=86.44ms p(99.9)=196.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223752
     http_req_receiving.............: avg=585.07µs min=52.75µs med=114.1µs max=300.6ms  p(90)=721.2µs p(95)=1.07ms  p(99.9)=70.92ms 
     http_req_sending...............: avg=29.16µs  min=5.32µs  med=9.49µs  max=57.97ms  p(90)=14.16µs p(95)=22.03µs p(99.9)=1.48ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.98ms  min=2.64ms  med=14.06ms max=385.07ms p(90)=64.22ms p(95)=85.24ms p(99.9)=194.01ms
     http_reqs......................: 223752  1859.357413/s
     iteration_duration.............: avg=26.82ms  min=3.34ms  med=14.75ms max=411.33ms p(90)=65.68ms p(95)=86.67ms p(99.9)=197.44ms
     iterations.....................: 223652  1858.526423/s
     success_rate...................: 100.00% ✓ 223652      ✗ 0     
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
     ✗ no graphql errors
      ↳  99% — ✓ 157223 / ✗ 1
     ✓ valid response structure

     checks.........................: 99.99% ✓ 471671      ✗ 1     
     data_received..................: 14 GB  115 MB/s
     data_sent......................: 189 MB 1.6 MB/s
     http_req_blocked...............: avg=3.29µs   min=1.05µs  med=2.36µs  max=4.13ms   p(90)=3.62µs  p(95)=4.2µs    p(99.9)=34.83µs
     http_req_connecting............: avg=618ns    min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.93ms  min=2.07ms  med=37.4ms  max=356.1ms  p(90)=53.43ms p(95)=58.33ms  p(99.9)=81.8ms 
       { expected_response:true }...: avg=37.93ms  min=2.07ms  med=37.4ms  max=356.1ms  p(90)=53.43ms p(95)=58.33ms  p(99.9)=81.8ms 
     http_req_failed................: 0.00%  ✓ 0           ✗ 157324
     http_req_receiving.............: avg=104.01µs min=26.58µs med=58.83µs max=211.65ms p(90)=92.42µs p(95)=108.61µs p(99.9)=2.01ms 
     http_req_sending...............: avg=27.04µs  min=5.13µs  med=10.31µs max=236.51ms p(90)=15.35µs p(95)=19.19µs  p(99.9)=1.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.8ms   min=2ms     med=37.31ms max=144.1ms  p(90)=53.32ms p(95)=58.23ms  p(99.9)=80.61ms
     http_reqs......................: 157324 1308.143827/s
     iteration_duration.............: avg=38.15ms  min=3.61ms  med=37.6ms  max=364.98ms p(90)=53.63ms p(95)=58.53ms  p(99.9)=82.08ms
     iterations.....................: 157224 1307.312331/s
     success_rate...................: 99.99% ✓ 157223      ✗ 1     
     vus............................: 50     min=50        max=50  
     vus_max........................: 50     min=50        max=50
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

     checks.........................: 100.00% ✓ 193035     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 77 MB   642 kB/s
     http_req_blocked...............: avg=4.35µs   min=1.12µs  med=2.55µs  max=4.04ms   p(90)=4.01µs   p(95)=4.54µs   p(99.9)=68.61µs 
     http_req_connecting............: avg=1.5µs    min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.89ms  min=4.35ms  med=91.31ms max=334.11ms p(90)=115.93ms p(95)=129.36ms p(99.9)=222.2ms 
       { expected_response:true }...: avg=92.89ms  min=4.35ms  med=91.31ms max=334.11ms p(90)=115.93ms p(95)=129.36ms p(99.9)=222.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 64445
     http_req_receiving.............: avg=129.62µs min=31.05µs med=71.18µs max=200.82ms p(90)=104.09µs p(95)=115.7µs  p(99.9)=1.18ms  
     http_req_sending...............: avg=23.59µs  min=5.74µs  med=12.59µs max=215.26ms p(90)=18.65µs  p(95)=20.72µs  p(99.9)=798.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.74ms  min=4.29ms  med=91.22ms max=246.78ms p(90)=115.82ms p(95)=129.2ms  p(99.9)=219.81ms
     http_reqs......................: 64445   534.523217/s
     iteration_duration.............: avg=93.25ms  min=14.62ms med=91.55ms max=342.39ms p(90)=116.18ms p(95)=129.63ms p(99.9)=223.68ms
     iterations.....................: 64345   533.693792/s
     success_rate...................: 100.00% ✓ 64345      ✗ 0    
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

     checks.........................: 100.00% ✓ 149325     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   496 kB/s
     http_req_blocked...............: avg=5.64µs   min=1.21µs  med=3.02µs   max=4.97ms   p(90)=4.35µs   p(95)=4.87µs   p(99.9)=366.15µs
     http_req_connecting............: avg=2.43µs   min=0s      med=0s       max=4.92ms   p(90)=0s       p(95)=0s       p(99.9)=186.1µs 
     http_req_duration..............: avg=120.08ms min=5.31ms  med=119.83ms max=339.96ms p(90)=145.3ms  p(95)=152.55ms p(99.9)=188.03ms
       { expected_response:true }...: avg=120.08ms min=5.31ms  med=119.83ms max=339.96ms p(90)=145.3ms  p(95)=152.55ms p(99.9)=188.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49875
     http_req_receiving.............: avg=88.76µs  min=28.51µs med=76.97µs  max=151.59ms p(90)=107µs    p(95)=118.51µs p(99.9)=637.53µs
     http_req_sending...............: avg=21.88µs  min=5.58µs  med=14.27µs  max=96.87ms  p(90)=19.65µs  p(95)=21.35µs  p(99.9)=603.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.97ms min=5.25ms  med=119.72ms max=339.25ms p(90)=145.19ms p(95)=152.44ms p(99.9)=187.06ms
     http_reqs......................: 49875   413.308916/s
     iteration_duration.............: avg=120.57ms min=21.08ms med=120.08ms max=354.81ms p(90)=145.55ms p(95)=152.82ms p(99.9)=190.14ms
     iterations.....................: 49775   412.480227/s
     success_rate...................: 100.00% ✓ 49775      ✗ 0    
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

     checks.........................: 100.00% ✓ 98346      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   327 kB/s
     http_req_blocked...............: avg=6.54µs   min=1.25µs  med=3.25µs   max=4.28ms   p(90)=4.54µs   p(95)=5.09µs   p(99.9)=1.39ms  
     http_req_connecting............: avg=3.01µs   min=0s      med=0s       max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=182.28ms min=6.02ms  med=166.78ms max=626.18ms p(90)=211.41ms p(95)=269.42ms p(99.9)=529.4ms 
       { expected_response:true }...: avg=182.28ms min=6.02ms  med=166.78ms max=626.18ms p(90)=211.41ms p(95)=269.42ms p(99.9)=529.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32882
     http_req_receiving.............: avg=139.74µs min=33.18µs med=87.5µs   max=89.55ms  p(90)=119.88µs p(95)=131.88µs p(99.9)=773.84µs
     http_req_sending...............: avg=29.02µs  min=6µs     med=15.71µs  max=121.69ms p(90)=20.78µs  p(95)=22.75µs  p(99.9)=759.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.11ms min=5.91ms  med=166.67ms max=626.09ms p(90)=211.28ms p(95)=269.32ms p(99.9)=529.28ms
     http_reqs......................: 32882   272.106069/s
     iteration_duration.............: avg=183.12ms min=17.11ms med=167.12ms max=626.37ms p(90)=211.96ms p(95)=273.36ms p(99.9)=529.7ms 
     iterations.....................: 32782   271.278546/s
     success_rate...................: 100.00% ✓ 32782      ✗ 0    
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

     checks.........................: 100.00% ✓ 89124      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=6.74µs   min=1.12µs  med=3.03µs   max=4.61ms   p(90)=4.21µs   p(95)=4.7µs    p(99.9)=1.78ms  
     http_req_connecting............: avg=3.58µs   min=0s      med=0s       max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=201.18ms min=8.5ms   med=199.56ms max=388.35ms p(90)=263.09ms p(95)=273.43ms p(99.9)=351.48ms
       { expected_response:true }...: avg=201.18ms min=8.5ms   med=199.56ms max=388.35ms p(90)=263.09ms p(95)=273.43ms p(99.9)=351.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29808
     http_req_receiving.............: avg=89.66µs  min=31.66µs med=83.75µs  max=26.65ms  p(90)=115.13µs p(95)=125.71µs p(99.9)=794.01µs
     http_req_sending...............: avg=26.58µs  min=5.98µs  med=15.07µs  max=49.91ms  p(90)=20.11µs  p(95)=21.83µs  p(99.9)=589.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.07ms min=8.4ms   med=199.29ms max=388.17ms p(90)=262.99ms p(95)=273.32ms p(99.9)=351.37ms
     http_reqs......................: 29808   246.195097/s
     iteration_duration.............: avg=202.09ms min=86.74ms med=202.4ms  max=397.2ms  p(90)=263.35ms p(95)=273.75ms p(99.9)=352.5ms 
     iterations.....................: 29708   245.36916/s
     success_rate...................: 100.00% ✓ 29708      ✗ 0    
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

     checks.........................: 100.00% ✓ 874560      ✗ 0     
     data_received..................: 26 GB   212 MB/s
     data_sent......................: 350 MB  2.9 MB/s
     http_req_blocked...............: avg=2.87µs  min=992ns   med=2.07µs  max=16.88ms  p(90)=3.27µs  p(95)=4µs      p(99.9)=32.44µs
     http_req_connecting............: avg=362ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.36ms min=1.66ms  med=20.03ms max=302.52ms p(90)=27.24ms p(95)=29.62ms  p(99.9)=48.75ms
       { expected_response:true }...: avg=20.36ms min=1.66ms  med=20.03ms max=302.52ms p(90)=27.24ms p(95)=29.62ms  p(99.9)=48.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291620
     http_req_receiving.............: avg=94.23µs min=27.23µs med=54.52µs max=254.62ms p(90)=96.65µs p(95)=215.43µs p(99.9)=5.34ms 
     http_req_sending...............: avg=41.08µs min=5.19µs  med=9.52µs  max=170.36ms p(90)=16.83µs p(95)=115.96µs p(99.9)=2.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.22ms min=1.61ms  med=19.92ms max=293.91ms p(90)=27.09ms p(95)=29.44ms  p(99.9)=47.62ms
     http_reqs......................: 291620  2425.994109/s
     iteration_duration.............: avg=20.57ms min=2.63ms  med=20.23ms max=323.87ms p(90)=27.44ms p(95)=29.82ms  p(99.9)=49.33ms
     iterations.....................: 291520  2425.162207/s
     success_rate...................: 100.00% ✓ 291520      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-p.11.47)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 624072      ✗ 0     
     data_received..................: 18 GB   152 MB/s
     data_sent......................: 250 MB  2.1 MB/s
     http_req_blocked...............: avg=3.13µs   min=1.08µs  med=2.4µs   max=3.88ms   p(90)=3.64µs   p(95)=4.23µs  p(99.9)=37.39µs 
     http_req_connecting............: avg=393ns    min=0s      med=0s      max=3.84ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=28.6ms   min=2.15ms  med=17.87ms max=772.47ms p(90)=64.5ms   p(95)=85.84ms p(99.9)=228.43ms
       { expected_response:true }...: avg=28.6ms   min=2.15ms  med=17.87ms max=772.47ms p(90)=64.5ms   p(95)=85.84ms p(99.9)=228.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 208124
     http_req_receiving.............: avg=502.54µs min=51.39µs med=111.5µs max=265.06ms p(90)=722.27µs p(95)=1.11ms  p(99.9)=60.4ms  
     http_req_sending...............: avg=30.69µs  min=5.32µs  med=10.42µs max=111.83ms p(90)=16.96µs  p(95)=24.33µs p(99.9)=1.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=28.07ms  min=2.03ms  med=17.43ms max=772.39ms p(90)=63.56ms  p(95)=84.7ms  p(99.9)=226.43ms
     http_reqs......................: 208124  1730.34522/s
     iteration_duration.............: avg=28.83ms  min=3ms     med=18.08ms max=772.68ms p(90)=64.72ms  p(95)=86.08ms p(99.9)=231.37ms
     iterations.....................: 208024  1729.513819/s
     success_rate...................: 100.00% ✓ 208024      ✗ 0     
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

     checks.........................: 100.00% ✓ 572976      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 230 MB  1.9 MB/s
     http_req_blocked...............: avg=3.78µs   min=952ns   med=2.69µs  max=3.91ms   p(90)=4.93µs   p(95)=6.04µs   p(99.9)=45.72µs
     http_req_connecting............: avg=507ns    min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.14ms  min=2.29ms  med=30.36ms max=320.37ms p(90)=41.32ms  p(95)=45.7ms   p(99.9)=81.23ms
       { expected_response:true }...: avg=31.14ms  min=2.29ms  med=30.36ms max=320.37ms p(90)=41.32ms  p(95)=45.7ms   p(99.9)=81.23ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 191092
     http_req_receiving.............: avg=107.73µs min=30.35µs med=62.63µs max=37.69ms  p(90)=135.38µs p(95)=283.81µs p(99.9)=4.33ms 
     http_req_sending...............: avg=45.91µs  min=5.26µs  med=10.95µs max=197.48ms p(90)=24.61µs  p(95)=135.94µs p(99.9)=2.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.98ms  min=2.17ms  med=30.22ms max=310.3ms  p(90)=41.14ms  p(95)=45.49ms  p(99.9)=80.91ms
     http_reqs......................: 191092  1588.53428/s
     iteration_duration.............: avg=31.4ms   min=3.75ms  med=30.6ms  max=357.65ms p(90)=41.56ms  p(95)=45.93ms  p(99.9)=81.97ms
     iterations.....................: 190992  1587.702987/s
     success_rate...................: 100.00% ✓ 190992      ✗ 0     
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

     checks.........................: 100.00% ✓ 439563      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 176 MB  1.5 MB/s
     http_req_blocked...............: avg=3.14µs   min=1.08µs  med=2.51µs  max=2.26ms   p(90)=3.87µs  p(95)=4.47µs   p(99.9)=37.61µs 
     http_req_connecting............: avg=303ns    min=0s      med=0s      max=2.22ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.71ms  min=2.11ms  med=40.19ms max=364.95ms p(90)=57.25ms p(95)=62.36ms  p(99.9)=87.08ms 
       { expected_response:true }...: avg=40.71ms  min=2.11ms  med=40.19ms max=364.95ms p(90)=57.25ms p(95)=62.36ms  p(99.9)=87.08ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 146621
     http_req_receiving.............: avg=108.67µs min=29.53µs med=65µs    max=234.93ms p(90)=99.99µs p(95)=116.62µs p(99.9)=1.74ms  
     http_req_sending...............: avg=25.14µs  min=5.33µs  med=11.44µs max=239.8ms  p(90)=17.04µs p(95)=20.42µs  p(99.9)=993.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.58ms  min=2.02ms  med=40.08ms max=129.81ms p(90)=57.15ms p(95)=62.25ms  p(99.9)=86.8ms  
     http_reqs......................: 146621  1219.061807/s
     iteration_duration.............: avg=40.94ms  min=3.82ms  med=40.39ms max=376.05ms p(90)=57.45ms p(95)=62.57ms  p(99.9)=87.51ms 
     iterations.....................: 146521  1218.230369/s
     success_rate...................: 100.00% ✓ 146521      ✗ 0     
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

     checks.........................: 100.00% ✓ 186213     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   619 kB/s
     http_req_blocked...............: avg=4.96µs  min=1.14µs  med=2.9µs   max=4.47ms   p(90)=4.3µs    p(95)=4.85µs   p(99.9)=54.96µs 
     http_req_connecting............: avg=1.82µs  min=0s      med=0s      max=4.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.26ms min=4.4ms   med=93.2ms  max=361.7ms  p(90)=115.47ms p(95)=127.13ms p(99.9)=221.33ms
       { expected_response:true }...: avg=96.26ms min=4.4ms   med=93.2ms  max=361.7ms  p(90)=115.47ms p(95)=127.13ms p(99.9)=221.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62171
     http_req_receiving.............: avg=92.31µs min=30.98µs med=78.44µs max=107.51ms p(90)=111.07µs p(95)=123.76µs p(99.9)=876.11µs
     http_req_sending...............: avg=24.81µs min=5.55µs  med=13.86µs max=120.32ms p(90)=20.1µs   p(95)=22µs     p(99.9)=622.81µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.15ms min=4.29ms  med=93.1ms  max=361.27ms p(90)=115.37ms p(95)=127.02ms p(99.9)=220.54ms
     http_reqs......................: 62171   515.636016/s
     iteration_duration.............: avg=96.67ms min=25.55ms med=93.43ms max=392.32ms p(90)=115.72ms p(95)=127.46ms p(99.9)=224.58ms
     iterations.....................: 62071   514.806632/s
     success_rate...................: 100.00% ✓ 62071      ✗ 0    
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

     checks.........................: 100.00% ✓ 148749     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   494 kB/s
     http_req_blocked...............: avg=6.6µs    min=1.28µs  med=3.4µs    max=71.83ms  p(90)=4.76µs   p(95)=5.32µs   p(99.9)=170.67µs
     http_req_connecting............: avg=2.99µs   min=0s      med=0s       max=71.78ms  p(90)=0s       p(95)=0s       p(99.9)=108.42µs
     http_req_duration..............: avg=120.55ms min=5.85ms  med=118.12ms max=352.9ms  p(90)=159.67ms p(95)=171.67ms p(99.9)=221.05ms
       { expected_response:true }...: avg=120.55ms min=5.85ms  med=118.12ms max=352.9ms  p(90)=159.67ms p(95)=171.67ms p(99.9)=221.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49683
     http_req_receiving.............: avg=95.08µs  min=31.4µs  med=84.87µs  max=106.95ms p(90)=115.23µs p(95)=126.68µs p(99.9)=789.33µs
     http_req_sending...............: avg=24.06µs  min=5.68µs  med=16.22µs  max=55.49ms  p(90)=21.38µs  p(95)=23.13µs  p(99.9)=969.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.43ms min=5.77ms  med=118.01ms max=344.25ms p(90)=159.57ms p(95)=171.55ms p(99.9)=220.31ms
     http_reqs......................: 49683   411.527184/s
     iteration_duration.............: avg=121.04ms min=21.98ms med=118.43ms max=371.54ms p(90)=159.97ms p(95)=171.93ms p(99.9)=223.05ms
     iterations.....................: 49583   410.698878/s
     success_rate...................: 100.00% ✓ 49583      ✗ 0    
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

     checks.........................: 100.00% ✓ 95145      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=6.77µs   min=1.22µs  med=3.39µs   max=4.14ms   p(90)=4.69µs   p(95)=5.22µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=188.4ms  min=6.08ms  med=173.08ms max=579.01ms p(90)=228.5ms  p(95)=375.55ms p(99.9)=515.65ms
       { expected_response:true }...: avg=188.4ms  min=6.08ms  med=173.08ms max=579.01ms p(90)=228.5ms  p(95)=375.55ms p(99.9)=515.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31815
     http_req_receiving.............: avg=97.98µs  min=34.74µs med=92.31µs  max=41.18ms  p(90)=124.02µs p(95)=137.03µs p(99.9)=726.79µs
     http_req_sending...............: avg=34.95µs  min=6.33µs  med=17.08µs  max=114.11ms p(90)=21.76µs  p(95)=23.48µs  p(99.9)=715.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.27ms min=5.93ms  med=172.95ms max=578.88ms p(90)=228.39ms p(95)=375.38ms p(99.9)=515.51ms
     http_reqs......................: 31815   263.251253/s
     iteration_duration.............: avg=189.29ms min=36.19ms med=173.47ms max=579.28ms p(90)=229.07ms p(95)=376.56ms p(99.9)=515.88ms
     iterations.....................: 31715   262.423809/s
     success_rate...................: 100.00% ✓ 31715      ✗ 0    
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

     checks.........................: 100.00% ✓ 88107      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7.18µs   min=1.23µs  med=3.3µs    max=4.33ms   p(90)=4.55µs   p(95)=5.08µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=3.74µs   min=0s      med=0s       max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=203.46ms min=8.56ms  med=203.4ms  max=419.7ms  p(90)=215.98ms p(95)=222.84ms p(99.9)=294.87ms
       { expected_response:true }...: avg=203.46ms min=8.56ms  med=203.4ms  max=419.7ms  p(90)=215.98ms p(95)=222.84ms p(99.9)=294.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29469
     http_req_receiving.............: avg=181.49µs min=32.19µs med=89.72µs  max=119.89ms p(90)=120.33µs p(95)=132.13µs p(99.9)=32.41ms 
     http_req_sending...............: avg=33.39µs  min=5.93µs  med=16.02µs  max=186.97ms p(90)=20.52µs  p(95)=22.25µs  p(99.9)=489.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.25ms min=8.44ms  med=203.29ms max=300.62ms p(90)=215.85ms p(95)=222.7ms  p(99.9)=292.76ms
     http_reqs......................: 29469   243.389292/s
     iteration_duration.............: avg=204.41ms min=13.76ms med=203.69ms max=450.74ms p(90)=216.26ms p(95)=223.18ms p(99.9)=300.86ms
     iterations.....................: 29369   242.563376/s
     success_rate...................: 100.00% ✓ 29369      ✗ 0    
     vus............................: 38      min=38       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

