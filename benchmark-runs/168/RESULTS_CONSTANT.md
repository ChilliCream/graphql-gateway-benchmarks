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
| hive-router | v0.0.49 | 2,914 | 3,133 | 2,875 | 3.0% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,125 | 2,183 | 2,109 | 1.1% |  |
| grafbase | 0.53.3 | 2,098 | 2,149 | 2,082 | 1.1% |  |
| cosmo | 0.307.0 | 1,247 | 1,264 | 1,239 | 0.8% | non-compatible response (4 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 546 | 558 | 544 | 0.9% |  |
| apollo-router | v2.13.1 | 401 | 412 | 396 | 1.4% |  |
| hive-gateway | 2.5.25 | 250 | 253 | 249 | 0.6% |  |
| apollo-gateway | 2.13.3 | 244 | 247 | 243 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,409 | 2,541 | 2,376 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,963 | 2,015 | 1,942 | 1.1% |  |
| grafbase | 0.53.3 | 1,516 | 1,549 | 1,501 | 1.1% |  |
| cosmo | 0.307.0 | 1,178 | 1,201 | 1,171 | 1.0% | non-compatible response (6 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 505 | 518 | 500 | 1.2% |  |
| apollo-router | v2.13.1 | 382 | 388 | 373 | 1.3% |  |
| hive-gateway | 2.5.25 | 244 | 249 | 241 | 1.2% |  |
| apollo-gateway | 2.13.3 | 234 | 236 | 233 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1050930     ✗ 0     
     data_received..................: 31 GB   256 MB/s
     data_sent......................: 421 MB  3.5 MB/s
     http_req_blocked...............: avg=3.39µs   min=1.02µs  med=2.44µs  max=25.63ms  p(90)=3.68µs   p(95)=4.34µs   p(99.9)=36.18µs
     http_req_connecting............: avg=304ns    min=0s      med=0s      max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.88ms  min=1.64ms  med=15.91ms max=317.96ms p(90)=24.83ms  p(95)=28.92ms  p(99.9)=53.56ms
       { expected_response:true }...: avg=16.88ms  min=1.64ms  med=15.91ms max=317.96ms p(90)=24.83ms  p(95)=28.92ms  p(99.9)=53.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 350410
     http_req_receiving.............: avg=141.57µs min=28.01µs med=51.29µs max=81.96ms  p(90)=101.78µs p(95)=284.55µs p(99.9)=15.67ms
     http_req_sending...............: avg=63.85µs  min=5.12µs  med=9.48µs  max=200.33ms p(90)=15.97µs  p(95)=124.08µs p(99.9)=14.02ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.68ms  min=1.58ms  med=15.76ms max=294.75ms p(90)=24.54ms  p(95)=28.46ms  p(99.9)=51.71ms
     http_reqs......................: 350410  2914.937293/s
     iteration_duration.............: avg=17.12ms  min=2.12ms  med=16.12ms max=345.65ms p(90)=25.06ms  p(95)=29.19ms  p(99.9)=54.97ms
     iterations.....................: 350310  2914.105428/s
     success_rate...................: 100.00% ✓ 350310      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 766551      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 307 MB  2.6 MB/s
     http_req_blocked...............: avg=3.37µs   min=1.06µs  med=2.35µs   max=15.51ms  p(90)=3.45µs   p(95)=4.03µs   p(99.9)=33.69µs 
     http_req_connecting............: avg=406ns    min=0s      med=0s       max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.24ms  min=2.41ms  med=14.78ms  max=315.38ms p(90)=52.39ms  p(95)=70.65ms  p(99.9)=168.24ms
       { expected_response:true }...: avg=23.24ms  min=2.41ms  med=14.78ms  max=315.38ms p(90)=52.39ms  p(95)=70.65ms  p(99.9)=168.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 255617
     http_req_receiving.............: avg=684.18µs min=51.55µs med=109.43µs max=153.6ms  p(90)=977.36µs p(95)=1.52ms   p(99.9)=60.37ms 
     http_req_sending...............: avg=46.82µs  min=5.27µs  med=9.53µs   max=34.73ms  p(90)=15.45µs  p(95)=111.51µs p(99.9)=4.5ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.51ms  min=2.28ms  med=14.24ms  max=314.13ms p(90)=50.9ms   p(95)=69.16ms  p(99.9)=166.77ms
     http_reqs......................: 255617  2125.152466/s
     iteration_duration.............: avg=23.47ms  min=3.41ms  med=14.99ms  max=346.96ms p(90)=52.64ms  p(95)=70.88ms  p(99.9)=169ms   
     iterations.....................: 255517  2124.321084/s
     success_rate...................: 100.00% ✓ 255517      ✗ 0     
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

     checks.........................: 100.00% ✓ 756870      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.93µs   min=1.09µs  med=2.7µs   max=13.94ms  p(90)=4.26µs   p(95)=5.06µs   p(99.9)=47.44µs
     http_req_connecting............: avg=400ns    min=0s      med=0s      max=4.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.52ms  min=1.91ms  med=23.26ms max=314.28ms p(90)=28.5ms   p(95)=31.25ms  p(99.9)=55.02ms
       { expected_response:true }...: avg=23.52ms  min=1.91ms  med=23.26ms max=314.28ms p(90)=28.5ms   p(95)=31.25ms  p(99.9)=55.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252390
     http_req_receiving.............: avg=126.35µs min=30.01µs med=58.58µs max=142.77ms p(90)=105.54µs p(95)=246.77µs p(99.9)=11.54ms
     http_req_sending...............: avg=52.83µs  min=4.86µs  med=10.64µs max=256.29ms p(90)=18.85µs  p(95)=128.44µs p(99.9)=4.11ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.35ms  min=1.85ms  med=23.13ms max=313.73ms p(90)=28.31ms  p(95)=30.91ms  p(99.9)=53.63ms
     http_reqs......................: 252390  2098.745512/s
     iteration_duration.............: avg=23.77ms  min=3.82ms  med=23.47ms max=345.96ms p(90)=28.74ms  p(95)=31.52ms  p(99.9)=55.59ms
     iterations.....................: 252290  2097.913964/s
     success_rate...................: 100.00% ✓ 252290      ✗ 0     
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

     checks.........................: 100.00% ✓ 449718      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.4µs   min=1.05µs  med=2.41µs  max=3.93ms   p(90)=3.67µs  p(95)=4.26µs   p(99.9)=36.07µs
     http_req_connecting............: avg=670ns   min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.78ms min=2.1ms   med=39.19ms max=327.34ms p(90)=56.21ms p(95)=61.4ms   p(99.9)=86.85ms
       { expected_response:true }...: avg=39.78ms min=2.1ms   med=39.19ms max=327.34ms p(90)=56.21ms p(95)=61.4ms   p(99.9)=86.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150006
     http_req_receiving.............: avg=86.25µs min=29.34µs med=61.24µs max=229.42ms p(90)=95.01µs p(95)=112.02µs p(99.9)=2.05ms 
     http_req_sending...............: avg=25.29µs min=5.23µs  med=10.38µs max=137.85ms p(90)=15.2µs  p(95)=19.06µs  p(99.9)=1.2ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.67ms min=2.04ms  med=39.09ms max=278.31ms p(90)=56.1ms  p(95)=61.28ms  p(99.9)=85.52ms
     http_reqs......................: 150006  1247.235433/s
     iteration_duration.............: avg=40.01ms min=3.57ms  med=39.39ms max=354ms    p(90)=56.41ms p(95)=61.61ms  p(99.9)=87.29ms
     iterations.....................: 149906  1246.403976/s
     success_rate...................: 100.00% ✓ 149906      ✗ 0     
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

     checks.........................: 100.00% ✓ 197271     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   656 kB/s
     http_req_blocked...............: avg=4.02µs  min=1.16µs  med=2.83µs  max=2.99ms   p(90)=4.32µs   p(95)=4.92µs   p(99.9)=48.73µs 
     http_req_connecting............: avg=911ns   min=0s      med=0s      max=2.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.89ms min=4.06ms  med=87.88ms max=310.48ms p(90)=110.53ms p(95)=123.01ms p(99.9)=212.97ms
       { expected_response:true }...: avg=90.89ms min=4.06ms  med=87.88ms max=310.48ms p(90)=110.53ms p(95)=123.01ms p(99.9)=212.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65857
     http_req_receiving.............: avg=85.19µs min=32.63µs med=76.03µs max=28.37ms  p(90)=110.15µs p(95)=122.93µs p(99.9)=955.84µs
     http_req_sending...............: avg=22.17µs min=5.93µs  med=12.91µs max=94.82ms  p(90)=19.24µs  p(95)=21.63µs  p(99.9)=657.83µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.78ms min=3.96ms  med=87.78ms max=308.91ms p(90)=110.42ms p(95)=122.87ms p(99.9)=212.86ms
     http_reqs......................: 65857   546.39964/s
     iteration_duration.............: avg=91.25ms min=19.17ms med=88.11ms max=345.59ms p(90)=110.77ms p(95)=123.25ms p(99.9)=214.33ms
     iterations.....................: 65757   545.569964/s
     success_rate...................: 100.00% ✓ 65757      ✗ 0    
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

     checks.........................: 100.00% ✓ 145140     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 58 MB   482 kB/s
     http_req_blocked...............: avg=5.55µs   min=1.24µs  med=3.23µs   max=4.04ms   p(90)=4.6µs    p(95)=5.14µs   p(99.9)=297.63µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=150.35µs
     http_req_duration..............: avg=123.55ms min=5.52ms  med=123.39ms max=366.19ms p(90)=149.28ms p(95)=156.84ms p(99.9)=192.71ms
       { expected_response:true }...: avg=123.55ms min=5.52ms  med=123.39ms max=366.19ms p(90)=149.28ms p(95)=156.84ms p(99.9)=192.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48480
     http_req_receiving.............: avg=88.48µs  min=30.74µs med=80.32µs  max=69.07ms  p(90)=111.92µs p(95)=123.15µs p(99.9)=716.21µs
     http_req_sending...............: avg=25.67µs  min=5.79µs  med=14.78µs  max=162.46ms p(90)=20.61µs  p(95)=22.34µs  p(99.9)=596.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.43ms min=5.42ms  med=123.28ms max=365.57ms p(90)=149.18ms p(95)=156.72ms p(99.9)=192.42ms
     http_reqs......................: 48480   401.704835/s
     iteration_duration.............: avg=124.05ms min=33.16ms med=123.67ms max=372.9ms  p(90)=149.56ms p(95)=157.12ms p(99.9)=194.18ms
     iterations.....................: 48380   400.876236/s
     success_rate...................: 100.00% ✓ 48380      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 90408      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   300 kB/s
     http_req_blocked...............: avg=7.64µs   min=1.29µs  med=3.62µs   max=4.72ms   p(90)=5.05µs   p(95)=5.65µs   p(99.9)=1.65ms  
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=198.26ms min=6.29ms  med=170.69ms max=711.52ms p(90)=271.59ms p(95)=391.44ms p(99.9)=567.18ms
       { expected_response:true }...: avg=198.26ms min=6.29ms  med=170.69ms max=711.52ms p(90)=271.59ms p(95)=391.44ms p(99.9)=567.18ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30236
     http_req_receiving.............: avg=102.74µs min=34.87µs med=94.51µs  max=40.19ms  p(90)=126.95µs p(95)=140.33µs p(99.9)=720.2µs 
     http_req_sending...............: avg=34.27µs  min=6.02µs  med=18.02µs  max=89.75ms  p(90)=23.26µs  p(95)=25.24µs  p(99.9)=664.03µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.12ms min=6.15ms  med=170.56ms max=711.38ms p(90)=271.46ms p(95)=391.33ms p(99.9)=567.08ms
     http_reqs......................: 30236   250.11441/s
     iteration_duration.............: avg=199.21ms min=43.83ms med=171.19ms max=711.86ms p(90)=272.2ms  p(95)=392.7ms  p(99.9)=567.39ms
     iterations.....................: 30136   249.287202/s
     success_rate...................: 100.00% ✓ 30136      ✗ 0    
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

     checks.........................: 100.00% ✓ 88608      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=6.96µs   min=1.27µs  med=3.2µs    max=4.25ms   p(90)=4.42µs   p(95)=4.93µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.59µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=202.28ms min=8.33ms  med=203.1ms  max=464.1ms  p(90)=211.76ms p(95)=216.74ms p(99.9)=282.68ms
       { expected_response:true }...: avg=202.28ms min=8.33ms  med=203.1ms  max=464.1ms  p(90)=211.76ms p(95)=216.74ms p(99.9)=282.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29636
     http_req_receiving.............: avg=98.08µs  min=33.03µs med=86.83µs  max=82.56ms  p(90)=117.61µs p(95)=128.51µs p(99.9)=547.12µs
     http_req_sending...............: avg=30.35µs  min=6.25µs  med=15.67µs  max=139.27ms p(90)=20.67µs  p(95)=22.32µs  p(99.9)=538.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.15ms min=8.21ms  med=202.99ms max=418.41ms p(90)=211.64ms p(95)=216.6ms  p(99.9)=282.56ms
     http_reqs......................: 29636   244.79253/s
     iteration_duration.............: avg=203.25ms min=28.97ms med=203.39ms max=473.98ms p(90)=212.01ms p(95)=217.03ms p(99.9)=321.73ms
     iterations.....................: 29536   243.966533/s
     success_rate...................: 100.00% ✓ 29536      ✗ 0    
     vus............................: 32      min=32       max=50 
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

     checks.........................: 100.00% ✓ 868494      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=5.9µs    min=1.03µs  med=2.73µs  max=89.77ms  p(90)=4.29µs   p(95)=5.12µs   p(99.9)=37.93µs
     http_req_connecting............: avg=2.56µs   min=0s      med=0s      max=89.72ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.47ms  min=1.72ms  med=19.91ms max=305.78ms p(90)=28.43ms  p(95)=31.86ms  p(99.9)=56.28ms
       { expected_response:true }...: avg=20.47ms  min=1.72ms  med=19.91ms max=305.78ms p(90)=28.43ms  p(95)=31.86ms  p(99.9)=56.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289598
     http_req_receiving.............: avg=141.64µs min=27.79µs med=55.84µs max=257.83ms p(90)=107.39µs p(95)=280.36µs p(99.9)=10.51ms
     http_req_sending...............: avg=58.84µs  min=5.11µs  med=10.51µs max=33.53ms  p(90)=18.88µs  p(95)=130.8µs  p(99.9)=9.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.27ms  min=1.63ms  med=19.76ms max=147.37ms p(90)=28.21ms  p(95)=31.5ms   p(99.9)=54.76ms
     http_reqs......................: 289598  2409.050847/s
     iteration_duration.............: avg=20.71ms  min=3.37ms  med=20.13ms max=362.95ms p(90)=28.66ms  p(95)=32.12ms  p(99.9)=56.86ms
     iterations.....................: 289498  2408.218987/s
     success_rate...................: 100.00% ✓ 289498      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 707934      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=3.42µs   min=992ns   med=2.6µs    max=3.97ms   p(90)=4.03µs  p(95)=4.74µs   p(99.9)=39.83µs 
     http_req_connecting............: avg=427ns    min=0s      med=0s       max=3.93ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.17ms  min=1.9ms   med=17.4ms   max=645.81ms p(90)=52.76ms p(95)=69.52ms  p(99.9)=193.48ms
       { expected_response:true }...: avg=25.17ms  min=1.9ms   med=17.4ms   max=645.81ms p(90)=52.76ms p(95)=69.52ms  p(99.9)=193.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236078
     http_req_receiving.............: avg=700.14µs min=51.27µs med=111.59µs max=182.33ms p(90)=1.15ms  p(95)=1.84ms   p(99.9)=56.79ms 
     http_req_sending...............: avg=44.13µs  min=5.32µs  med=10.52µs  max=118.69ms p(90)=18.48µs p(95)=114.67µs p(99.9)=2.76ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.43ms  min=1.82ms  med=16.82ms  max=644.07ms p(90)=51.4ms  p(95)=68.02ms  p(99.9)=191.58ms
     http_reqs......................: 236078  1963.329814/s
     iteration_duration.............: avg=25.41ms  min=2.66ms  med=17.63ms  max=646.01ms p(90)=52.99ms p(95)=69.77ms  p(99.9)=195.73ms
     iterations.....................: 235978  1962.49817/s
     success_rate...................: 100.00% ✓ 235978      ✗ 0     
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

     checks.........................: 100.00% ✓ 546966      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=4.05µs   min=1µs     med=2.91µs  max=4.4ms    p(90)=5.27µs   p(95)=6.37µs   p(99.9)=46.76µs
     http_req_connecting............: avg=546ns    min=0s      med=0s      max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.62ms  min=2.44ms  med=31.76ms max=313.04ms p(90)=43.25ms  p(95)=48.05ms  p(99.9)=85.13ms
       { expected_response:true }...: avg=32.62ms  min=2.44ms  med=31.76ms max=313.04ms p(90)=43.25ms  p(95)=48.05ms  p(99.9)=85.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182422
     http_req_receiving.............: avg=121.46µs min=30.91µs med=65.89µs max=74.63ms  p(90)=140.73µs p(95)=299.61µs p(99.9)=6.55ms 
     http_req_sending...............: avg=51.24µs  min=5.39µs  med=11.52µs max=114.46ms p(90)=25.54µs  p(95)=141.96µs p(99.9)=3.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.45ms  min=2.34ms  med=31.62ms max=311.92ms p(90)=43.04ms  p(95)=47.8ms   p(99.9)=84.78ms
     http_reqs......................: 182422  1516.27655/s
     iteration_duration.............: avg=32.89ms  min=4.08ms  med=32.01ms max=346.93ms p(90)=43.5ms   p(95)=48.3ms   p(99.9)=85.97ms
     iterations.....................: 182322  1515.445358/s
     success_rate...................: 100.00% ✓ 182322      ✗ 0     
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

     checks.........................: 100.00% ✓ 425019      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.48µs   min=1.17µs  med=2.67µs  max=3.17ms   p(90)=4.1µs   p(95)=4.76µs   p(99.9)=37.98µs
     http_req_connecting............: avg=489ns    min=0s      med=0s      max=3.14ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.09ms  min=2.23ms  med=41.63ms max=356.03ms p(90)=59.16ms p(95)=64.41ms  p(99.9)=88.1ms 
       { expected_response:true }...: avg=42.09ms  min=2.23ms  med=41.63ms max=356.03ms p(90)=59.16ms p(95)=64.41ms  p(99.9)=88.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141773
     http_req_receiving.............: avg=124.35µs min=29.33µs med=67.46µs max=318.19ms p(90)=104.3µs p(95)=122.26µs p(99.9)=1.97ms 
     http_req_sending...............: avg=24.19µs  min=5.46µs  med=11.83µs max=27ms     p(90)=17.95µs p(95)=21.68µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.95ms  min=2.13ms  med=41.52ms max=146ms    p(90)=59.02ms p(95)=64.27ms  p(99.9)=86.83ms
     http_reqs......................: 141773  1178.783667/s
     iteration_duration.............: avg=42.34ms  min=4.13ms  med=41.84ms max=371.45ms p(90)=59.38ms p(95)=64.64ms  p(99.9)=88.56ms
     iterations.....................: 141673  1177.952209/s
     success_rate...................: 100.00% ✓ 141673      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 182457     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   607 kB/s
     http_req_blocked...............: avg=4.59µs  min=1.22µs  med=3.16µs  max=3.69ms   p(90)=4.67µs   p(95)=5.26µs   p(99.9)=50.85µs 
     http_req_connecting............: avg=1.18µs  min=0s      med=0s      max=3.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.26ms min=4.31ms  med=95.43ms max=345.83ms p(90)=120.49ms p(95)=134.59ms p(99.9)=229.11ms
       { expected_response:true }...: avg=98.26ms min=4.31ms  med=95.43ms max=345.83ms p(90)=120.49ms p(95)=134.59ms p(99.9)=229.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60919
     http_req_receiving.............: avg=89.13µs min=32.18µs med=81.46µs max=26.09ms  p(90)=114.51µs p(95)=126.87µs p(99.9)=886.21µs
     http_req_sending...............: avg=23.65µs min=5.89µs  med=14.2µs  max=153.03ms p(90)=20.56µs  p(95)=22.67µs  p(99.9)=696.45µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.14ms min=4.24ms  med=95.33ms max=344.79ms p(90)=120.39ms p(95)=134.46ms p(99.9)=228.6ms 
     http_reqs......................: 60919   505.222357/s
     iteration_duration.............: avg=98.66ms min=23.72ms med=95.68ms max=355.49ms p(90)=120.75ms p(95)=134.92ms p(99.9)=231.8ms 
     iterations.....................: 60819   504.393023/s
     success_rate...................: 100.00% ✓ 60819      ✗ 0    
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

     checks.........................: 100.00% ✓ 138153     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   459 kB/s
     http_req_blocked...............: avg=5.99µs   min=1.14µs  med=3.55µs   max=4.17ms   p(90)=5.05µs   p(95)=5.62µs   p(99.9)=296.87µs
     http_req_connecting............: avg=2.23µs   min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=268.21µs
     http_req_duration..............: avg=129.78ms min=5.89ms  med=127.11ms max=337.89ms p(90)=172.1ms  p(95)=185.64ms p(99.9)=236.27ms
       { expected_response:true }...: avg=129.78ms min=5.89ms  med=127.11ms max=337.89ms p(90)=172.1ms  p(95)=185.64ms p(99.9)=236.27ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46151
     http_req_receiving.............: avg=95.02µs  min=31.28µs med=86.91µs  max=83.08ms  p(90)=118.34µs p(95)=130.41µs p(99.9)=735.66µs
     http_req_sending...............: avg=28.82µs  min=5.84µs  med=16.87µs  max=131.05ms p(90)=22.17µs  p(95)=23.99µs  p(99.9)=599.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.65ms min=5.74ms  med=127ms    max=337.24ms p(90)=171.94ms p(95)=185.51ms p(99.9)=236.1ms 
     http_reqs......................: 46151   382.222686/s
     iteration_duration.............: avg=130.32ms min=19.67ms med=127.46ms max=357.79ms p(90)=172.42ms p(95)=185.96ms p(99.9)=240.05ms
     iterations.....................: 46051   381.394486/s
     success_rate...................: 100.00% ✓ 46051      ✗ 0    
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

     checks.........................: 100.00% ✓ 88335      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.39µs  med=3.58µs   max=4.61ms   p(90)=4.96µs   p(95)=5.53µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.74µs   min=0s      med=0s       max=4.57ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=202.91ms min=6.48ms  med=191.04ms max=640.24ms p(90)=244.46ms p(95)=374.21ms p(99.9)=561.08ms
       { expected_response:true }...: avg=202.91ms min=6.48ms  med=191.04ms max=640.24ms p(90)=244.46ms p(95)=374.21ms p(99.9)=561.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29545
     http_req_receiving.............: avg=101.14µs min=36.38µs med=93.91µs  max=76.58ms  p(90)=125.45µs p(95)=138.2µs  p(99.9)=565.39µs
     http_req_sending...............: avg=36.92µs  min=6.43µs  med=17.77µs  max=99.77ms  p(90)=22.69µs  p(95)=24.4µs   p(99.9)=576.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.78ms min=6.34ms  med=190.92ms max=640.11ms p(90)=244.32ms p(95)=374.04ms p(99.9)=560.95ms
     http_reqs......................: 29545   244.345324/s
     iteration_duration.............: avg=203.89ms min=32.93ms med=191.43ms max=640.51ms p(90)=245.03ms p(95)=376.51ms p(99.9)=561.71ms
     iterations.....................: 29445   243.518296/s
     success_rate...................: 100.00% ✓ 29445      ✗ 0    
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

     checks.........................: 100.00% ✓ 84762      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.31µs  med=3.47µs   max=4.19ms   p(90)=4.78µs   p(95)=5.31µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=3.75µs   min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.82ms  
     http_req_duration..............: avg=211.45ms min=8.7ms   med=212.36ms max=459.89ms p(90)=226.29ms p(95)=233.94ms p(99.9)=298.65ms
       { expected_response:true }...: avg=211.45ms min=8.7ms   med=212.36ms max=459.89ms p(90)=226.29ms p(95)=233.94ms p(99.9)=298.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28354
     http_req_receiving.............: avg=101.39µs min=36.18µs med=91.82µs  max=123.74ms p(90)=122.96µs p(95)=135.72µs p(99.9)=544.96µs
     http_req_sending...............: avg=28.74µs  min=6µs     med=17.33µs  max=55.23ms  p(90)=22.03µs  p(95)=23.79µs  p(99.9)=567.09µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.32ms min=8.51ms  med=212.23ms max=458.93ms p(90)=226.17ms p(95)=233.8ms  p(99.9)=298.45ms
     http_reqs......................: 28354   234.115897/s
     iteration_duration.............: avg=212.5ms  min=52.78ms med=212.88ms max=471.96ms p(90)=226.57ms p(95)=234.26ms p(99.9)=340.18ms
     iterations.....................: 28254   233.290208/s
     success_rate...................: 100.00% ✓ 28254      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

