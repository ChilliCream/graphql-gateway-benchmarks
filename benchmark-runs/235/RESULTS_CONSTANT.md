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
| hive-router | v0.0.72 | 2,818 | 3,026 | 2,777 | 2.9% |  |
| fusion-nightly | 16.3.0-p.1 | 2,194 | 2,247 | 2,190 | 0.9% |  |
| fusion | 16.2.2 | 2,155 | 2,211 | 2,147 | 1.0% |  |
| grafbase | 0.53.5 | 2,096 | 2,151 | 2,069 | 1.2% |  |
| cosmo | 0.324.0 | 1,186 | 1,205 | 1,176 | 0.7% |  |
| hive-gateway-router-runtime | 2.9.0 | 550 | 561 | 545 | 1.0% |  |
| apollo-router | v2.15.1 | 414 | 426 | 407 | 1.8% |  |
| apollo-gateway | 2.14.1 | 243 | 245 | 240 | 0.7% |  |
| hive-gateway | 2.9.0 | 241 | 243 | 239 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,399 | 2,526 | 2,360 | 2.2% |  |
| fusion-nightly | 16.3.0-p.1 | 2,094 | 2,139 | 2,086 | 0.9% |  |
| fusion | 16.2.2 | 1,987 | 2,041 | 1,978 | 1.1% |  |
| grafbase | 0.53.5 | 1,490 | 1,520 | 1,474 | 1.1% |  |
| cosmo | 0.324.0 | 1,090 | 1,115 | 1,084 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 524 | 538 | 519 | 1.1% |  |
| apollo-router | v2.15.1 | 382 | 394 | 377 | 1.4% |  |
| hive-gateway | 2.9.0 | 241 | 244 | 239 | 0.8% |  |
| apollo-gateway | 2.14.1 | 235 | 240 | 233 | 1.2% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1016208     ✗ 0     
     data_received..................: 30 GB   247 MB/s
     data_sent......................: 407 MB  3.4 MB/s
     http_req_blocked...............: avg=3.12µs   min=1.08µs  med=2.38µs  max=25.57ms  p(90)=3.52µs  p(95)=4.14µs   p(99.9)=32.94µs
     http_req_connecting............: avg=301ns    min=0s      med=0s      max=4.06ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.47ms  min=1.65ms  med=16.56ms max=323.24ms p(90)=26.01ms p(95)=29.75ms  p(99.9)=52.2ms 
       { expected_response:true }...: avg=17.47ms  min=1.65ms  med=16.56ms max=323.24ms p(90)=26.01ms p(95)=29.75ms  p(99.9)=52.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 338836
     http_req_receiving.............: avg=127.97µs min=28.73µs med=52.29µs max=139.65ms p(90)=99.35µs p(95)=275.96µs p(99.9)=11.92ms
     http_req_sending...............: avg=59.75µs  min=5.13µs  med=9.44µs  max=143.08ms p(90)=15.96µs p(95)=124.97µs p(99.9)=10.97ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17.28ms  min=1.59ms  med=16.4ms  max=320.13ms p(90)=25.74ms p(95)=29.38ms  p(99.9)=51.05ms
     http_reqs......................: 338836  2818.867727/s
     iteration_duration.............: avg=17.7ms   min=2.1ms   med=16.77ms max=389.68ms p(90)=26.25ms p(95)=30.02ms  p(99.9)=53.09ms
     iterations.....................: 338736  2818.0358/s
     success_rate...................: 100.00% ✓ 338736      ✗ 0     
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

     checks.........................: 100.00% ✓ 791481      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 317 MB  2.6 MB/s
     http_req_blocked...............: avg=3.26µs  min=1.08µs med=2.41µs   max=17.07ms  p(90)=3.61µs  p(95)=4.23µs   p(99.9)=33.4µs  
     http_req_connecting............: avg=391ns   min=0s     med=0s       max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.49ms min=2.36ms med=19.03ms  max=325.68ms p(90)=38.92ms p(95)=48.59ms  p(99.9)=117.38ms
       { expected_response:true }...: avg=22.49ms min=2.36ms med=19.03ms  max=325.68ms p(90)=38.92ms p(95)=48.59ms  p(99.9)=117.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263927
     http_req_receiving.............: avg=1.04ms  min=50.9µs med=314.46µs max=130.67ms p(90)=2.17ms  p(95)=3.27ms   p(99.9)=38.03ms 
     http_req_sending...............: avg=49.11µs min=5.31µs med=9.49µs   max=167.97ms p(90)=16.94µs p(95)=116.86µs p(99.9)=4.24ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.39ms min=2.25ms med=17.97ms  max=322.61ms p(90)=37.33ms p(95)=46.88ms  p(99.9)=114.86ms
     http_reqs......................: 263927  2194.164591/s
     iteration_duration.............: avg=22.73ms min=3.28ms med=19.26ms  max=346.38ms p(90)=39.17ms p(95)=48.85ms  p(99.9)=118.25ms
     iterations.....................: 263827  2193.333239/s
     success_rate...................: 100.00% ✓ 263827      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 777420      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 312 MB  2.6 MB/s
     http_req_blocked...............: avg=3.31µs   min=1.06µs  med=2.42µs   max=12.74ms  p(90)=3.6µs   p(95)=4.23µs   p(99.9)=36.76µs 
     http_req_connecting............: avg=478ns    min=0s      med=0s       max=4.52ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.91ms  min=2.47ms  med=15.2ms   max=343.81ms p(90)=50.01ms p(95)=67.18ms  p(99.9)=166.32ms
       { expected_response:true }...: avg=22.91ms  min=2.47ms  med=15.2ms   max=343.81ms p(90)=50.01ms p(95)=67.18ms  p(99.9)=166.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 259240
     http_req_receiving.............: avg=976.09µs min=51.48µs med=141.78µs max=306.95ms p(90)=1.37ms  p(95)=2.23ms   p(99.9)=65.51ms 
     http_req_sending...............: avg=43.7µs   min=5.23µs  med=9.8µs    max=77.51ms  p(90)=16.63µs p(95)=111.07µs p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.89ms  min=2.37ms  med=14.41ms  max=331.04ms p(90)=48.06ms p(95)=65.07ms  p(99.9)=160.89ms
     http_reqs......................: 259240  2155.118751/s
     iteration_duration.............: avg=23.14ms  min=3.02ms  med=15.42ms  max=362.15ms p(90)=50.25ms p(95)=67.44ms  p(99.9)=167.12ms
     iterations.....................: 259140  2154.287429/s
     success_rate...................: 100.00% ✓ 259140      ✗ 0     
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

     checks.........................: 100.00% ✓ 755877      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.57µs  min=982ns   med=2.56µs  max=16.89ms  p(90)=4.07µs   p(95)=4.87µs   p(99.9)=45.6µs 
     http_req_connecting............: avg=410ns   min=0s      med=0s      max=4.63ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.56ms min=2.06ms  med=23.31ms max=283.63ms p(90)=28.35ms  p(95)=30.75ms  p(99.9)=53.32ms
       { expected_response:true }...: avg=23.56ms min=2.06ms  med=23.31ms max=283.63ms p(90)=28.35ms  p(95)=30.75ms  p(99.9)=53.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252059
     http_req_receiving.............: avg=116µs   min=29.93µs med=58.82µs max=108.88ms p(90)=105.09µs p(95)=225.04µs p(99.9)=9.52ms 
     http_req_sending...............: avg=51.27µs min=4.72µs  med=10.51µs max=137.55ms p(90)=18.46µs  p(95)=122.94µs p(99.9)=4.76ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.39ms min=1.95ms  med=23.19ms max=282.82ms p(90)=28.16ms  p(95)=30.46ms  p(99.9)=52.39ms
     http_reqs......................: 252059  2096.040576/s
     iteration_duration.............: avg=23.8ms  min=3.38ms  med=23.52ms max=337.36ms p(90)=28.57ms  p(95)=30.99ms  p(99.9)=54.21ms
     iterations.....................: 251959  2095.209008/s
     success_rate...................: 100.00% ✓ 251959      ✗ 0     
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

     checks.........................: 100.00% ✓ 427866      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.08µs  min=1.04µs  med=2.48µs  max=2.26ms   p(90)=3.8µs    p(95)=4.43µs   p(99.9)=36.07µs
     http_req_connecting............: avg=303ns   min=0s      med=0s      max=2.23ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.82ms min=2.11ms  med=41.24ms max=327.03ms p(90)=59.11ms  p(95)=64.5ms   p(99.9)=90.34ms
       { expected_response:true }...: avg=41.82ms min=2.11ms  med=41.24ms max=327.03ms p(90)=59.11ms  p(95)=64.5ms   p(99.9)=90.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142722
     http_req_receiving.............: avg=83.48µs min=28.84µs med=65.32µs max=52.86ms  p(90)=101.54µs p(95)=119.93µs p(99.9)=1.69ms 
     http_req_sending...............: avg=26.94µs min=5.36µs  med=10.63µs max=165.2ms  p(90)=15.79µs  p(95)=19.94µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.71ms min=2.04ms  med=41.14ms max=316.58ms p(90)=59ms     p(95)=64.39ms  p(99.9)=89.94ms
     http_reqs......................: 142722  1186.572441/s
     iteration_duration.............: avg=42.06ms min=3.65ms  med=41.45ms max=335.75ms p(90)=59.32ms  p(95)=64.7ms   p(99.9)=91.02ms
     iterations.....................: 142622  1185.741053/s
     success_rate...................: 100.00% ✓ 142622      ✗ 0     
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

     checks.........................: 100.00% ✓ 198789     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   661 kB/s
     http_req_blocked...............: avg=5.8µs   min=1.21µs  med=2.96µs  max=7.48ms   p(90)=4.47µs   p(95)=5.11µs   p(99.9)=45.34µs 
     http_req_connecting............: avg=2.55µs  min=0s      med=0s      max=7.45ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.18ms min=4.15ms  med=88.31ms max=359.07ms p(90)=109.6ms  p(95)=120.07ms p(99.9)=214.95ms
       { expected_response:true }...: avg=90.18ms min=4.15ms  med=88.31ms max=359.07ms p(90)=109.6ms  p(95)=120.07ms p(99.9)=214.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66363
     http_req_receiving.............: avg=89.06µs min=31.84µs med=77.48µs max=155.79ms p(90)=111.56µs p(95)=124.28µs p(99.9)=905.95µs
     http_req_sending...............: avg=30.52µs min=5.82µs  med=13.16µs max=163.75ms p(90)=19.75µs  p(95)=22.09µs  p(99.9)=779.55µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.06ms min=3.99ms  med=88.2ms  max=358.59ms p(90)=109.46ms p(95)=119.92ms p(99.9)=214.51ms
     http_reqs......................: 66363   550.460579/s
     iteration_duration.............: avg=90.56ms min=20.5ms  med=88.54ms max=376.4ms  p(90)=109.85ms p(95)=120.38ms p(99.9)=216.86ms
     iterations.....................: 66263   549.63111/s
     success_rate...................: 100.00% ✓ 66263      ✗ 0    
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

     checks.........................: 100.00% ✓ 149799     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   498 kB/s
     http_req_blocked...............: avg=5.75µs   min=1.26µs  med=3.42µs   max=4.71ms   p(90)=4.83µs   p(95)=5.4µs    p(99.9)=224.59µs
     http_req_connecting............: avg=2.14µs   min=0s      med=0s       max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=104.69µs
     http_req_duration..............: avg=119.69ms min=5.27ms  med=119.42ms max=356.39ms p(90)=144.53ms p(95)=151.88ms p(99.9)=189.33ms
       { expected_response:true }...: avg=119.69ms min=5.27ms  med=119.42ms max=356.39ms p(90)=144.53ms p(95)=151.88ms p(99.9)=189.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50033
     http_req_receiving.............: avg=94.69µs  min=31.42µs med=84.25µs  max=175.09ms p(90)=115.88µs p(95)=128.19µs p(99.9)=800.28µs
     http_req_sending...............: avg=34.03µs  min=6.04µs  med=15.84µs  max=220.85ms p(90)=21.51µs  p(95)=23.36µs  p(99.9)=617.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.57ms min=5.17ms  med=119.32ms max=355.69ms p(90)=144.39ms p(95)=151.75ms p(99.9)=187.97ms
     http_reqs......................: 50033   414.559111/s
     iteration_duration.............: avg=120.2ms  min=39.96ms med=119.7ms  max=394.55ms p(90)=144.81ms p(95)=152.18ms p(99.9)=193.16ms
     iterations.....................: 49933   413.730539/s
     success_rate...................: 100.00% ✓ 49933      ✗ 0    
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

     checks.........................: 100.00% ✓ 88113      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=7.07µs   min=1.29µs  med=3.38µs   max=4.23ms   p(90)=4.66µs   p(95)=5.19µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.53µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=203.43ms min=8.48ms  med=203.37ms max=450.91ms p(90)=215.13ms p(95)=218.44ms p(99.9)=300.11ms
       { expected_response:true }...: avg=203.43ms min=8.48ms  med=203.37ms max=450.91ms p(90)=215.13ms p(95)=218.44ms p(99.9)=300.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29471
     http_req_receiving.............: avg=99.78µs  min=33.8µs  med=90.7µs   max=90.24ms  p(90)=123.11µs p(95)=135.17µs p(99.9)=615.91µs
     http_req_sending...............: avg=26.45µs  min=6µs     med=16.54µs  max=108.12ms p(90)=21.55µs  p(95)=23.29µs  p(99.9)=587.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.31ms min=8.34ms  med=203.26ms max=436.7ms  p(90)=215ms    p(95)=218.32ms p(99.9)=299.9ms 
     http_reqs......................: 29471   243.420753/s
     iteration_duration.............: avg=204.42ms min=46.58ms med=203.69ms max=469ms    p(90)=215.38ms p(95)=218.82ms p(99.9)=307.89ms
     iterations.....................: 29371   242.594786/s
     success_rate...................: 100.00% ✓ 29371      ✗ 0    
     vus............................: 39      min=39       max=50 
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

     checks.........................: 100.00% ✓ 87447      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.33µs  med=3.6µs    max=4.03ms   p(90)=5.14µs   p(95)=5.8µs    p(99.9)=1.83ms  
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=205.01ms min=6.62ms  med=186.83ms max=714.79ms p(90)=235.5ms  p(95)=403.8ms  p(99.9)=606.58ms
       { expected_response:true }...: avg=205.01ms min=6.62ms  med=186.83ms max=714.79ms p(90)=235.5ms  p(95)=403.8ms  p(99.9)=606.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29249
     http_req_receiving.............: avg=107.87µs min=36.48µs med=97.11µs  max=77.99ms  p(90)=130.37µs p(95)=143.67µs p(99.9)=618.68µs
     http_req_sending...............: avg=31.59µs  min=6.05µs  med=18.06µs  max=108.91ms p(90)=23.16µs  p(95)=25.06µs  p(99.9)=658.06µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.87ms min=6.46ms  med=186.7ms  max=714.67ms p(90)=235.39ms p(95)=403.68ms p(99.9)=606.49ms
     http_reqs......................: 29249   241.654357/s
     iteration_duration.............: avg=206ms    min=37.05ms med=187.18ms max=715.07ms p(90)=236.16ms p(95)=407.67ms p(99.9)=606.79ms
     iterations.....................: 29149   240.82816/s
     success_rate...................: 100.00% ✓ 29149      ✗ 0    
     vus............................: 11      min=11       max=50 
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

     checks.........................: 100.00% ✓ 865011      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=3.3µs    min=1µs     med=2.48µs  max=14.66ms  p(90)=4.07µs   p(95)=4.89µs   p(99.9)=39.75µs
     http_req_connecting............: avg=264ns    min=0s      med=0s      max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.56ms  min=1.82ms  med=19.94ms max=313.83ms p(90)=28.6ms   p(95)=31.87ms  p(99.9)=54.57ms
       { expected_response:true }...: avg=20.56ms  min=1.82ms  med=19.94ms max=313.83ms p(90)=28.6ms   p(95)=31.87ms  p(99.9)=54.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288437
     http_req_receiving.............: avg=138.01µs min=28.28µs med=55.96µs max=275.45ms p(90)=109.72µs p(95)=276.41µs p(99.9)=9.89ms 
     http_req_sending...............: avg=57.02µs  min=5.26µs  med=10.16µs max=131.88ms p(90)=19.1µs   p(95)=129.51µs p(99.9)=6.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.36ms  min=1.71ms  med=19.79ms max=224.72ms p(90)=28.38ms  p(95)=31.57ms  p(99.9)=52.7ms 
     http_reqs......................: 288437  2399.185711/s
     iteration_duration.............: avg=20.79ms  min=3.41ms  med=20.16ms max=326.35ms p(90)=28.83ms  p(95)=32.12ms  p(99.9)=55.26ms
     iterations.....................: 288337  2398.353922/s
     success_rate...................: 100.00% ✓ 288337      ✗ 0     
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

     checks.........................: 100.00% ✓ 755136      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.42µs  min=1µs     med=2.57µs  max=9.29ms   p(90)=4.05µs  p(95)=4.85µs   p(99.9)=37.41µs 
     http_req_connecting............: avg=409ns   min=0s      med=0s      max=4.44ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.58ms min=1.8ms   med=20.83ms max=315.25ms p(90)=39.27ms p(95)=47.66ms  p(99.9)=106.1ms 
       { expected_response:true }...: avg=23.58ms min=1.8ms   med=20.83ms max=315.25ms p(90)=39.27ms p(95)=47.66ms  p(99.9)=106.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 251812
     http_req_receiving.............: avg=1.13ms  min=51.65µs med=291.6µs max=163.89ms p(90)=2.49ms  p(95)=3.8ms    p(99.9)=37.65ms 
     http_req_sending...............: avg=47.2µs  min=5.46µs  med=10.04µs max=169.98ms p(90)=19.21µs p(95)=119.75µs p(99.9)=3.61ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.4ms  min=1.7ms   med=19.66ms max=284.29ms p(90)=37.69ms p(95)=45.87ms  p(99.9)=103.23ms
     http_reqs......................: 251812  2094.441443/s
     iteration_duration.............: avg=23.82ms min=2.3ms   med=21.06ms max=337.53ms p(90)=39.52ms p(95)=47.92ms  p(99.9)=106.82ms
     iterations.....................: 251712  2093.609695/s
     success_rate...................: 100.00% ✓ 251712      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 716766      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 287 MB  2.4 MB/s
     http_req_blocked...............: avg=3.15µs   min=1.02µs  med=2.56µs   max=3.12ms   p(90)=3.92µs  p(95)=4.61µs   p(99.9)=36.95µs 
     http_req_connecting............: avg=234ns    min=0s      med=0s       max=3.08ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.85ms  min=1.84ms  med=18.05ms  max=647.1ms  p(90)=50.16ms p(95)=67.12ms  p(99.9)=171.57ms
       { expected_response:true }...: avg=24.85ms  min=1.84ms  med=18.05ms  max=647.1ms  p(90)=50.16ms p(95)=67.12ms  p(99.9)=171.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239022
     http_req_receiving.............: avg=983.22µs min=52.41µs med=127.27µs max=433.02ms p(90)=1.62ms  p(95)=2.63ms   p(99.9)=59.04ms 
     http_req_sending...............: avg=45.03µs  min=5.23µs  med=10.02µs  max=70.47ms  p(90)=17.91µs p(95)=112.63µs p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.83ms  min=1.71ms  med=17.22ms  max=646.46ms p(90)=48.3ms  p(95)=65.2ms   p(99.9)=168.43ms
     http_reqs......................: 239022  1987.883081/s
     iteration_duration.............: avg=25.1ms   min=2.47ms  med=18.28ms  max=647.33ms p(90)=50.41ms p(95)=67.37ms  p(99.9)=175.23ms
     iterations.....................: 238922  1987.051408/s
     success_rate...................: 100.00% ✓ 238922      ✗ 0     
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

     checks.........................: 100.00% ✓ 537768      ✗ 0     
     data_received..................: 16 GB   131 MB/s
     data_sent......................: 216 MB  1.8 MB/s
     http_req_blocked...............: avg=3.8µs    min=962ns   med=2.67µs  max=6.45ms   p(90)=4.87µs   p(95)=6.05µs   p(99.9)=45.98µs
     http_req_connecting............: avg=512ns    min=0s      med=0s      max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.18ms  min=2.49ms  med=32.37ms max=340.27ms p(90)=43.78ms  p(95)=48.41ms  p(99.9)=86.49ms
       { expected_response:true }...: avg=33.18ms  min=2.49ms  med=32.37ms max=340.27ms p(90)=43.78ms  p(95)=48.41ms  p(99.9)=86.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 179356
     http_req_receiving.............: avg=116.32µs min=30.53µs med=64.9µs  max=151.3ms  p(90)=140.65µs p(95)=295.98µs p(99.9)=5.74ms 
     http_req_sending...............: avg=49.48µs  min=5.43µs  med=11.04µs max=192.01ms p(90)=25.24µs  p(95)=144.93µs p(99.9)=3.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=33.02ms  min=2.35ms  med=32.23ms max=337.95ms p(90)=43.59ms  p(95)=48.17ms  p(99.9)=85.87ms
     http_reqs......................: 179356  1490.822984/s
     iteration_duration.............: avg=33.46ms  min=3.53ms  med=32.61ms max=350.82ms p(90)=44.02ms  p(95)=48.67ms  p(99.9)=87.12ms
     iterations.....................: 179256  1489.991775/s
     success_rate...................: 100.00% ✓ 179256      ✗ 0     
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

     checks.........................: 100.00% ✓ 393429      ✗ 0     
     data_received..................: 12 GB   95 MB/s
     data_sent......................: 158 MB  1.3 MB/s
     http_req_blocked...............: avg=4.14µs  min=1.04µs  med=2.83µs  max=6.39ms   p(90)=4.4µs    p(95)=5.11µs   p(99.9)=39.19µs
     http_req_connecting............: avg=891ns   min=0s      med=0s      max=5.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=45.48ms min=2.4ms   med=44.89ms max=318.7ms  p(90)=64ms     p(95)=69.81ms  p(99.9)=98.34ms
       { expected_response:true }...: avg=45.48ms min=2.4ms   med=44.89ms max=318.7ms  p(90)=64ms     p(95)=69.81ms  p(99.9)=98.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131243
     http_req_receiving.............: avg=93.77µs min=29.45µs med=74.29µs max=44.94ms  p(90)=114.45µs p(95)=132.78µs p(99.9)=2.08ms 
     http_req_sending...............: avg=31.04µs min=5.42µs  med=12.27µs max=259.38ms p(90)=18.68µs  p(95)=22.33µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=45.36ms min=2.3ms   med=44.78ms max=318.02ms p(90)=63.87ms  p(95)=69.68ms  p(99.9)=97.68ms
     http_reqs......................: 131243  1090.825746/s
     iteration_duration.............: avg=45.74ms min=4.05ms  med=45.11ms max=354.91ms p(90)=64.21ms  p(95)=70.03ms  p(99.9)=99.08ms
     iterations.....................: 131143  1089.994597/s
     success_rate...................: 100.00% ✓ 131143      ✗ 0     
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

     checks.........................: 100.00% ✓ 189459     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   630 kB/s
     http_req_blocked...............: avg=5.13µs  min=1.26µs  med=3.23µs  max=4.12ms   p(90)=4.86µs   p(95)=5.52µs   p(99.9)=52.65µs 
     http_req_connecting............: avg=1.61µs  min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.63ms min=4.4ms   med=92.88ms max=379.22ms p(90)=115.82ms p(95)=127.21ms p(99.9)=224.3ms 
       { expected_response:true }...: avg=94.63ms min=4.4ms   med=92.88ms max=379.22ms p(90)=115.82ms p(95)=127.21ms p(99.9)=224.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 63253
     http_req_receiving.............: avg=125µs   min=32.63µs med=83.84µs max=130.41ms p(90)=118.54µs p(95)=132.44µs p(99.9)=1.16ms  
     http_req_sending...............: avg=27.24µs min=5.85µs  med=14.71µs max=147.74ms p(90)=21.49µs  p(95)=23.65µs  p(99.9)=750.74µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.47ms min=4.27ms  med=92.77ms max=253.2ms  p(90)=115.66ms p(95)=127.01ms p(99.9)=224.05ms
     http_reqs......................: 63253   524.555324/s
     iteration_duration.............: avg=95.03ms min=10.03ms med=93.14ms max=395.46ms p(90)=116.09ms p(95)=127.5ms  p(99.9)=226.4ms 
     iterations.....................: 63153   523.726027/s
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

     checks.........................: 100.00% ✓ 138090     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   459 kB/s
     http_req_blocked...............: avg=6.01µs   min=1.18µs  med=3.56µs   max=4.19ms   p(90)=5.01µs   p(95)=5.59µs   p(99.9)=280.38µs
     http_req_connecting............: avg=2.27µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=249.38µs
     http_req_duration..............: avg=129.83ms min=5.53ms  med=127.2ms  max=352.15ms p(90)=172.29ms p(95)=186.08ms p(99.9)=238ms   
       { expected_response:true }...: avg=129.83ms min=5.53ms  med=127.2ms  max=352.15ms p(90)=172.29ms p(95)=186.08ms p(99.9)=238ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 46130
     http_req_receiving.............: avg=93.99µs  min=32µs    med=87.69µs  max=56.04ms  p(90)=119.51µs p(95)=132.28µs p(99.9)=692.69µs
     http_req_sending...............: avg=26.36µs  min=6.07µs  med=16.97µs  max=133.96ms p(90)=22.12µs  p(95)=23.86µs  p(99.9)=629.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.71ms min=5.45ms  med=127.09ms max=351.35ms p(90)=172.16ms p(95)=185.93ms p(99.9)=237.92ms
     http_reqs......................: 46130   382.079545/s
     iteration_duration.............: avg=130.39ms min=32.45ms med=127.55ms max=370.6ms  p(90)=172.59ms p(95)=186.44ms p(99.9)=240.59ms
     iterations.....................: 46030   381.251278/s
     success_rate...................: 100.00% ✓ 46030      ✗ 0    
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

     checks.........................: 100.00% ✓ 87243      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.36µs   min=1.27µs  med=3.71µs   max=4.08ms   p(90)=5.24µs   p(95)=5.89µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=3.45µs   min=0s      med=0s       max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=205.43ms min=6.74ms  med=187.32ms max=698.64ms p(90)=236.15ms p(95)=295.25ms p(99.9)=609.74ms
       { expected_response:true }...: avg=205.43ms min=6.74ms  med=187.32ms max=698.64ms p(90)=236.15ms p(95)=295.25ms p(99.9)=609.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29181
     http_req_receiving.............: avg=106.31µs min=36.69µs med=98.87µs  max=44.27ms  p(90)=131.41µs p(95)=144.79µs p(99.9)=900.82µs
     http_req_sending...............: avg=42.78µs  min=6.33µs  med=18.45µs  max=172.63ms p(90)=23.48µs  p(95)=25.19µs  p(99.9)=644.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.28ms min=6.6ms   med=187.17ms max=698.54ms p(90)=236.02ms p(95)=295ms    p(99.9)=609.63ms
     http_reqs......................: 29181   241.344165/s
     iteration_duration.............: avg=206.43ms min=45.4ms  med=187.69ms max=698.82ms p(90)=236.59ms p(95)=299.87ms p(99.9)=610.18ms
     iterations.....................: 29081   240.517106/s
     success_rate...................: 100.00% ✓ 29081      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 85314      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   283 kB/s
     http_req_blocked...............: avg=7.07µs   min=1.34µs  med=3.55µs   max=4.2ms    p(90)=4.91µs   p(95)=5.45µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=3.25µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=210.07ms min=8.85ms  med=207.09ms max=452.52ms p(90)=241.78ms p(95)=249.42ms p(99.9)=326.65ms
       { expected_response:true }...: avg=210.07ms min=8.85ms  med=207.09ms max=452.52ms p(90)=241.78ms p(95)=249.42ms p(99.9)=326.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28538
     http_req_receiving.............: avg=128.54µs min=36.86µs med=95.94µs  max=137.24ms p(90)=128.14µs p(95)=141.98µs p(99.9)=902.15µs
     http_req_sending...............: avg=36.01µs  min=6.07µs  med=17.91µs  max=121.24ms p(90)=22.79µs  p(95)=24.53µs  p(99.9)=855.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.91ms min=8.73ms  med=206.84ms max=451.93ms p(90)=241.65ms p(95)=249.26ms p(99.9)=319.94ms
     http_reqs......................: 28538   235.619576/s
     iteration_duration.............: avg=211.11ms min=33.81ms med=208.01ms max=462.64ms p(90)=242.06ms p(95)=249.74ms p(99.9)=337.3ms 
     iterations.....................: 28438   234.793941/s
     success_rate...................: 100.00% ✓ 28438      ✗ 0    
     vus............................: 47      min=47       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

