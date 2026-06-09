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
| hive-router | v0.0.65 | 2,987 | 3,187 | 2,952 | 2.6% |  |
| hotchocolate | 16.1.3 | 2,165 | 2,227 | 2,156 | 1.1% |  |
| grafbase | 0.53.5 | 2,080 | 2,139 | 2,062 | 1.3% |  |
| cosmo | 0.321.1 | 1,221 | 1,237 | 1,214 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 565 | 580 | 563 | 1.1% |  |
| apollo-router | v2.15.0 | 441 | 452 | 436 | 1.2% |  |
| apollo-gateway | 2.14.1 | 246 | 248 | 243 | 0.7% |  |
| hive-gateway | 2.8.2 | 241 | 247 | 238 | 1.3% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,373 | 2,475 | 2,320 | 2.1% |  |
| hotchocolate | 16.1.3 | 1,997 | 2,050 | 1,980 | 1.2% |  |
| grafbase | 0.53.5 | 1,539 | 1,569 | 1,509 | 1.2% |  |
| cosmo | 0.321.1 | 1,147 | 1,165 | 1,137 | 0.9% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 529 | 542 | 522 | 1.3% |  |
| apollo-router | v2.15.0 | 380 | 392 | 374 | 1.6% |  |
| hive-gateway | 2.8.2 | 244 | 249 | 241 | 1.2% |  |
| apollo-gateway | 2.14.1 | 240 | 242 | 238 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1077057     ✗ 0     
     data_received..................: 32 GB   262 MB/s
     data_sent......................: 432 MB  3.6 MB/s
     http_req_blocked...............: avg=2.94µs   min=982ns   med=2.09µs  max=18.08ms  p(90)=3.27µs   p(95)=3.95µs   p(99.9)=31.75µs
     http_req_connecting............: avg=338ns    min=0s      med=0s      max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.47ms  min=1.64ms  med=15.54ms max=297.52ms p(90)=24.26ms  p(95)=28.09ms  p(99.9)=50.92ms
       { expected_response:true }...: avg=16.47ms  min=1.64ms  med=15.54ms max=297.52ms p(90)=24.26ms  p(95)=28.09ms  p(99.9)=50.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 359119
     http_req_receiving.............: avg=137.17µs min=26.22µs med=49.2µs  max=132.05ms p(90)=100.84µs p(95)=279.18µs p(99.9)=15ms   
     http_req_sending...............: avg=59.75µs  min=5.23µs  med=9.2µs   max=140.7ms  p(90)=15.82µs  p(95)=123.56µs p(99.9)=9.11ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.27ms  min=1.59ms  med=15.39ms max=297.16ms p(90)=23.98ms  p(95)=27.66ms  p(99.9)=49.29ms
     http_reqs......................: 359119  2987.65303/s
     iteration_duration.............: avg=16.7ms   min=2.11ms  med=15.75ms max=343.04ms p(90)=24.49ms  p(95)=28.36ms  p(99.9)=52.26ms
     iterations.....................: 359019  2986.821091/s
     success_rate...................: 100.00% ✓ 359019      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 781056      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=2.59µs   min=1.02µs  med=2.08µs   max=5.56ms   p(90)=3.2µs   p(95)=3.81µs   p(99.9)=33µs    
     http_req_connecting............: avg=163ns    min=0s      med=0s       max=1.86ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.8ms   min=2.38ms  med=14.76ms  max=345.12ms p(90)=50.32ms p(95)=68.54ms  p(99.9)=166.59ms
       { expected_response:true }...: avg=22.8ms   min=2.38ms  med=14.76ms  max=345.12ms p(90)=50.32ms p(95)=68.54ms  p(99.9)=166.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 260452
     http_req_receiving.............: avg=651.63µs min=50.04µs med=103.43µs max=257.47ms p(90)=966.9µs p(95)=1.5ms    p(99.9)=58.82ms 
     http_req_sending...............: avg=43.56µs  min=5.24µs  med=9.16µs   max=205.62ms p(90)=15.71µs p(95)=108.53µs p(99.9)=3.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.11ms  min=2.25ms  med=14.24ms  max=304.17ms p(90)=48.98ms p(95)=67.19ms  p(99.9)=162.34ms
     http_reqs......................: 260452  2165.372036/s
     iteration_duration.............: avg=23.03ms  min=3.34ms  med=14.97ms  max=358.75ms p(90)=50.56ms p(95)=68.79ms  p(99.9)=167.61ms
     iterations.....................: 260352  2164.540645/s
     success_rate...................: 100.00% ✓ 260352      ✗ 0     
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

     checks.........................: 100.00% ✓ 750330      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 301 MB  2.5 MB/s
     http_req_blocked...............: avg=3.56µs   min=992ns   med=2.33µs  max=15.18ms  p(90)=3.82µs   p(95)=4.65µs   p(99.9)=42.35µs
     http_req_connecting............: avg=429ns    min=0s      med=0s      max=4.67ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.74ms  min=1.96ms  med=23.49ms max=326.54ms p(90)=28.51ms  p(95)=30.82ms  p(99.9)=52.6ms 
       { expected_response:true }...: avg=23.74ms  min=1.96ms  med=23.49ms max=326.54ms p(90)=28.51ms  p(95)=30.82ms  p(99.9)=52.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 250210
     http_req_receiving.............: avg=107.44µs min=29.54µs med=56.43µs max=72.64ms  p(90)=100.32µs p(95)=192.76µs p(99.9)=8.24ms 
     http_req_sending...............: avg=44.68µs  min=4.54µs  med=10.13µs max=182.85ms p(90)=17.95µs  p(95)=114.28µs p(99.9)=2.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.59ms  min=1.88ms  med=23.38ms max=325.84ms p(90)=28.34ms  p(95)=30.56ms  p(99.9)=51.56ms
     http_reqs......................: 250210  2080.622372/s
     iteration_duration.............: avg=23.98ms  min=4.02ms  med=23.7ms  max=362.48ms p(90)=28.74ms  p(95)=31.08ms  p(99.9)=53.34ms
     iterations.....................: 250110  2079.790821/s
     success_rate...................: 100.00% ✓ 250110      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 440466      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=2.82µs  min=1.04µs  med=2.2µs   max=2.17ms   p(90)=3.57µs  p(95)=4.22µs   p(99.9)=35.95µs
     http_req_connecting............: avg=291ns   min=0s      med=0s      max=2.12ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.62ms min=2.2ms   med=40.09ms max=303.63ms p(90)=57.33ms p(95)=62.53ms  p(99.9)=87.07ms
       { expected_response:true }...: avg=40.62ms min=2.2ms   med=40.09ms max=303.63ms p(90)=57.33ms p(95)=62.53ms  p(99.9)=87.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146922
     http_req_receiving.............: avg=78.05µs min=28.13µs med=59.35µs max=42.89ms  p(90)=95.61µs p(95)=113.54µs p(99.9)=1.7ms  
     http_req_sending...............: avg=23.39µs min=5.2µs   med=10.23µs max=114.3ms  p(90)=16.09µs p(95)=19.75µs  p(99.9)=1.1ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.52ms min=2.08ms  med=39.99ms max=292.26ms p(90)=57.23ms p(95)=62.42ms  p(99.9)=86.9ms 
     http_reqs......................: 146922  1221.447887/s
     iteration_duration.............: avg=40.86ms min=3.41ms  med=40.3ms  max=342.75ms p(90)=57.53ms p(95)=62.73ms  p(99.9)=87.62ms
     iterations.....................: 146822  1220.616529/s
     success_rate...................: 100.00% ✓ 146822      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 204216     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   679 kB/s
     http_req_blocked...............: avg=3.61µs  min=1.11µs  med=2.64µs  max=4.63ms   p(90)=4.2µs    p(95)=4.79µs   p(99.9)=42.98µs 
     http_req_connecting............: avg=594ns   min=0s      med=0s      max=2.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.78ms min=3.87ms  med=85.66ms max=322.76ms p(90)=106.16ms p(95)=116.23ms p(99.9)=214.42ms
       { expected_response:true }...: avg=87.78ms min=3.87ms  med=85.66ms max=322.76ms p(90)=106.16ms p(95)=116.23ms p(99.9)=214.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68172
     http_req_receiving.............: avg=82.74µs min=30.43µs med=75.23µs max=13.41ms  p(90)=110.12µs p(95)=123.03µs p(99.9)=924.66µs
     http_req_sending...............: avg=20.8µs  min=5.59µs  med=12.53µs max=56.77ms  p(90)=19.04µs  p(95)=21.14µs  p(99.9)=650.66µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.67ms min=3.81ms  med=85.56ms max=322.17ms p(90)=106.06ms p(95)=116.11ms p(99.9)=214.3ms 
     http_reqs......................: 68172   565.587567/s
     iteration_duration.............: avg=88.15ms min=12.47ms med=85.89ms max=351.75ms p(90)=106.43ms p(95)=116.56ms p(99.9)=216.07ms
     iterations.....................: 68072   564.757919/s
     success_rate...................: 100.00% ✓ 68072      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 159477     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 64 MB   530 kB/s
     http_req_blocked...............: avg=5.15µs   min=1.09µs  med=3.26µs   max=4.22ms   p(90)=4.66µs   p(95)=5.2µs    p(99.9)=107.55µs
     http_req_connecting............: avg=1.71µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.42ms min=5.15ms  med=112.35ms max=343.55ms p(90)=135.49ms p(95)=142.53ms p(99.9)=174.73ms
       { expected_response:true }...: avg=112.42ms min=5.15ms  med=112.35ms max=343.55ms p(90)=135.49ms p(95)=142.53ms p(99.9)=174.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53259
     http_req_receiving.............: avg=89.53µs  min=30.73µs med=82.66µs  max=68.21ms  p(90)=112.98µs p(95)=124.92µs p(99.9)=711.54µs
     http_req_sending...............: avg=22.14µs  min=5.74µs  med=15.25µs  max=107.15ms p(90)=20.24µs  p(95)=22.08µs  p(99.9)=612.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.31ms min=5.08ms  med=112.24ms max=342.77ms p(90)=135.39ms p(95)=142.41ms p(99.9)=174.24ms
     http_reqs......................: 53259   441.368708/s
     iteration_duration.............: avg=112.89ms min=33.39ms med=112.61ms max=355.84ms p(90)=135.75ms p(95)=142.81ms p(99.9)=176.35ms
     iterations.....................: 53159   440.539987/s
     success_rate...................: 100.00% ✓ 53159      ✗ 0    
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

     checks.........................: 100.00% ✓ 89238      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=6.99µs   min=1.31µs  med=3.3µs    max=4.76ms   p(90)=4.48µs   p(95)=4.98µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.5µs    min=0s      med=0s       max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=200.88ms min=8.58ms  med=230.72ms max=425.14ms p(90)=250.11ms p(95)=253.64ms p(99.9)=329.82ms
       { expected_response:true }...: avg=200.88ms min=8.58ms  med=230.72ms max=425.14ms p(90)=250.11ms p(95)=253.64ms p(99.9)=329.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29846
     http_req_receiving.............: avg=96.53µs  min=33.79µs med=88.26µs  max=91.35ms  p(90)=119.84µs p(95)=131.59µs p(99.9)=602.24µs
     http_req_sending...............: avg=24.67µs  min=6.01µs  med=15.89µs  max=81.89ms  p(90)=20.61µs  p(95)=22.4µs   p(99.9)=541.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.76ms min=8.43ms  med=230.6ms  max=425.05ms p(90)=250ms    p(95)=253.53ms p(99.9)=329.71ms
     http_reqs......................: 29846   246.478717/s
     iteration_duration.............: avg=201.83ms min=41.96ms med=231.19ms max=434.24ms p(90)=250.37ms p(95)=253.94ms p(99.9)=336.2ms 
     iterations.....................: 29746   245.652882/s
     success_rate...................: 100.00% ✓ 29746      ✗ 0    
     vus............................: 35      min=35       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 87249      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=7.23µs   min=1.08µs  med=3.47µs   max=4.04ms   p(90)=4.88µs   p(95)=5.49µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.54µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=205.44ms min=6.89ms  med=187.56ms max=697.02ms p(90)=242.28ms p(95)=372ms    p(99.9)=623.22ms
       { expected_response:true }...: avg=205.44ms min=6.89ms  med=187.56ms max=697.02ms p(90)=242.28ms p(95)=372ms    p(99.9)=623.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29183
     http_req_receiving.............: avg=106.79µs min=32.08µs med=94.08µs  max=114.41ms p(90)=126.08µs p(95)=140.01µs p(99.9)=784.63µs
     http_req_sending...............: avg=29.46µs  min=5.94µs  med=16.84µs  max=66.78ms  p(90)=22.12µs  p(95)=24.13µs  p(99.9)=591µs   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.31ms min=6.74ms  med=187.42ms max=696.92ms p(90)=242.09ms p(95)=371.88ms p(99.9)=623.09ms
     http_reqs......................: 29183   241.080317/s
     iteration_duration.............: avg=206.43ms min=30.43ms med=187.96ms max=697.25ms p(90)=242.8ms  p(95)=374.48ms p(99.9)=623.81ms
     iterations.....................: 29083   240.254218/s
     success_rate...................: 100.00% ✓ 29083      ✗ 0    
     vus............................: 22      min=22       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 855750      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=3.18µs   min=1.03µs  med=2.27µs  max=6.04ms   p(90)=3.75µs   p(95)=4.56µs   p(99.9)=31.7µs 
     http_req_connecting............: avg=492ns    min=0s      med=0s      max=6.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.79ms  min=1.98ms  med=20.35ms max=313.84ms p(90)=28.9ms   p(95)=31.86ms  p(99.9)=51.12ms
       { expected_response:true }...: avg=20.79ms  min=1.98ms  med=20.35ms max=313.84ms p(90)=28.9ms   p(95)=31.86ms  p(99.9)=51.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285350
     http_req_receiving.............: avg=103.51µs min=27.59µs med=53.35µs max=143.46ms p(90)=100.39µs p(95)=247.84µs p(99.9)=7.15ms 
     http_req_sending...............: avg=53.52µs  min=5.17µs  med=9.8µs   max=107.99ms p(90)=17.78µs  p(95)=123.42µs p(99.9)=6.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.63ms  min=1.88ms  med=20.21ms max=312.97ms p(90)=28.7ms   p(95)=31.62ms  p(99.9)=50.08ms
     http_reqs......................: 285350  2373.028661/s
     iteration_duration.............: avg=21.02ms  min=3.51ms  med=20.56ms max=325.48ms p(90)=29.12ms  p(95)=32.1ms   p(99.9)=51.55ms
     iterations.....................: 285250  2372.19704/s
     success_rate...................: 100.00% ✓ 285250      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 720414      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 289 MB  2.4 MB/s
     http_req_blocked...............: avg=3.05µs   min=1.02µs  med=2.17µs  max=10.26ms  p(90)=3.58µs  p(95)=4.34µs   p(99.9)=34.41µs 
     http_req_connecting............: avg=442ns    min=0s      med=0s      max=4.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.73ms  min=1.95ms  med=16.93ms max=533.81ms p(90)=51.9ms  p(95)=68.7ms   p(99.9)=193.38ms
       { expected_response:true }...: avg=24.73ms  min=1.95ms  med=16.93ms max=533.81ms p(90)=51.9ms  p(95)=68.7ms   p(99.9)=193.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 240238
     http_req_receiving.............: avg=679.03µs min=50.52µs med=104.9µs max=191.94ms p(90)=1.12ms  p(95)=1.78ms   p(99.9)=56.71ms 
     http_req_sending...............: avg=44.68µs  min=4.85µs  med=9.54µs  max=205.77ms p(90)=18.3µs  p(95)=111.06µs p(99.9)=2.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.01ms  min=1.85ms  med=16.37ms max=533.1ms  p(90)=50.67ms p(95)=67.23ms  p(99.9)=191.14ms
     http_reqs......................: 240238  1997.912856/s
     iteration_duration.............: avg=24.97ms  min=2.81ms  med=17.14ms max=533.97ms p(90)=52.13ms p(95)=68.93ms  p(99.9)=199.75ms
     iterations.....................: 240138  1997.081217/s
     success_rate...................: 100.00% ✓ 240138      ✗ 0     
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

     checks.........................: 100.00% ✓ 555444      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.8 MB/s
     http_req_blocked...............: avg=3.49µs   min=1.01µs  med=2.41µs  max=4.11ms   p(90)=4.76µs   p(95)=5.93µs   p(99.9)=45.68µs
     http_req_connecting............: avg=439ns    min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.13ms  min=2.43ms  med=31.22ms max=315.08ms p(90)=42.57ms  p(95)=47.29ms  p(99.9)=87.7ms 
       { expected_response:true }...: avg=32.13ms  min=2.43ms  med=31.22ms max=315.08ms p(90)=42.57ms  p(95)=47.29ms  p(99.9)=87.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 185248
     http_req_receiving.............: avg=112.17µs min=29.88µs med=61.06µs max=86.4ms   p(90)=133.68µs p(95)=281.12µs p(99.9)=6.21ms 
     http_req_sending...............: avg=50.75µs  min=5.38µs  med=10.33µs max=174.81ms p(90)=24µs     p(95)=135.83µs p(99.9)=3.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.97ms  min=2.3ms   med=31.07ms max=314.77ms p(90)=42.38ms  p(95)=47.06ms  p(99.9)=87.39ms
     http_reqs......................: 185248  1539.713141/s
     iteration_duration.............: avg=32.39ms  min=4.53ms  med=31.45ms max=340.78ms p(90)=42.81ms  p(95)=47.54ms  p(99.9)=89.09ms
     iterations.....................: 185148  1538.881978/s
     success_rate...................: 100.00% ✓ 185148      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 413838      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.43µs  min=1.04µs  med=2.36µs  max=4.06ms   p(90)=3.87µs   p(95)=4.53µs   p(99.9)=34.97µs
     http_req_connecting............: avg=701ns   min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.24ms min=2.23ms  med=42.7ms  max=335.17ms p(90)=60.68ms  p(95)=66.24ms  p(99.9)=92.83ms
       { expected_response:true }...: avg=43.24ms min=2.23ms  med=42.7ms  max=335.17ms p(90)=60.68ms  p(95)=66.24ms  p(99.9)=92.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138046
     http_req_receiving.............: avg=83.17µs min=27.97µs med=63.92µs max=123.06ms p(90)=101.84µs p(95)=119.57µs p(99.9)=1.8ms  
     http_req_sending...............: avg=24.35µs min=5.42µs  med=11.01µs max=116.01ms p(90)=17.63µs  p(95)=20.96µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.13ms min=2.16ms  med=42.6ms  max=334.57ms p(90)=60.58ms  p(95)=66.13ms  p(99.9)=92.72ms
     http_reqs......................: 138046  1147.388926/s
     iteration_duration.............: avg=43.49ms min=4.38ms  med=42.91ms max=353.8ms  p(90)=60.9ms   p(95)=66.46ms  p(99.9)=93.21ms
     iterations.....................: 137946  1146.557762/s
     success_rate...................: 100.00% ✓ 137946      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 191109     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   636 kB/s
     http_req_blocked...............: avg=4.73µs  min=1.21µs  med=3.01µs  max=4.32ms   p(90)=4.57µs   p(95)=5.19µs   p(99.9)=43.18µs 
     http_req_connecting............: avg=1.48µs  min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.81ms min=4.11ms  med=91.41ms max=322.05ms p(90)=113.49ms p(95)=124.62ms p(99.9)=226.59ms
       { expected_response:true }...: avg=93.81ms min=4.11ms  med=91.41ms max=322.05ms p(90)=113.49ms p(95)=124.62ms p(99.9)=226.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63803
     http_req_receiving.............: avg=151.2µs min=30.96µs med=80.28µs max=202.67ms p(90)=114.42µs p(95)=127.66µs p(99.9)=1.37ms  
     http_req_sending...............: avg=20.98µs min=5.53µs  med=13.73µs max=43.51ms  p(90)=20.16µs  p(95)=22.34µs  p(99.9)=668.79µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.64ms min=4.04ms  med=91.3ms  max=248.75ms p(90)=113.36ms p(95)=124.4ms  p(99.9)=223.52ms
     http_reqs......................: 63803   529.163573/s
     iteration_duration.............: avg=94.2ms  min=8.59ms  med=91.66ms max=348.6ms  p(90)=113.74ms p(95)=124.92ms p(99.9)=228.25ms
     iterations.....................: 63703   528.334202/s
     success_rate...................: 100.00% ✓ 63703      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 137535     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   457 kB/s
     http_req_blocked...............: avg=4.74µs   min=1.2µs   med=3.24µs   max=2.94ms   p(90)=4.64µs   p(95)=5.17µs   p(99.9)=198.38µs
     http_req_connecting............: avg=1.33µs   min=0s      med=0s       max=2.91ms   p(90)=0s       p(95)=0s       p(99.9)=110.31µs
     http_req_duration..............: avg=130.4ms  min=5.62ms  med=127.67ms max=343.71ms p(90)=173.41ms p(95)=186.94ms p(99.9)=235.12ms
       { expected_response:true }...: avg=130.4ms  min=5.62ms  med=127.67ms max=343.71ms p(90)=173.41ms p(95)=186.94ms p(99.9)=235.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45945
     http_req_receiving.............: avg=156.54µs min=31.56µs med=85.49µs  max=197.55ms p(90)=116.41µs p(95)=128.49µs p(99.9)=1.1ms   
     http_req_sending...............: avg=26.06µs  min=5.88µs  med=15.46µs  max=215.92ms p(90)=20.41µs  p(95)=22.29µs  p(99.9)=586.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.21ms min=5.49ms  med=127.55ms max=273.09ms p(90)=173.17ms p(95)=186.64ms p(99.9)=232ms   
     http_reqs......................: 45945   380.519296/s
     iteration_duration.............: avg=130.92ms min=38.32ms med=127.99ms max=352.26ms p(90)=173.71ms p(95)=187.26ms p(99.9)=236.28ms
     iterations.....................: 45845   379.69109/s
     success_rate...................: 100.00% ✓ 45845      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88329      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=7.18µs   min=1.31µs  med=3.65µs   max=3.9ms    p(90)=5.13µs   p(95)=5.75µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.32µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=202.92ms min=6.61ms  med=197.35ms max=738.53ms p(90)=255.96ms p(95)=320.05ms p(99.9)=628.44ms
       { expected_response:true }...: avg=202.92ms min=6.61ms  med=197.35ms max=738.53ms p(90)=255.96ms p(95)=320.05ms p(99.9)=628.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29543
     http_req_receiving.............: avg=111.08µs min=34.61µs med=98.01µs  max=178.99ms p(90)=129.78µs p(95)=143.18µs p(99.9)=865.9µs 
     http_req_sending...............: avg=36.19µs  min=6.45µs  med=18.28µs  max=170.43ms p(90)=23.3µs   p(95)=25.06µs  p(99.9)=628.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.78ms min=6.46ms  med=197.2ms  max=738.43ms p(90)=255.76ms p(95)=319.92ms p(99.9)=628.34ms
     http_reqs......................: 29543   244.30831/s
     iteration_duration.............: avg=203.9ms  min=41.69ms med=197.77ms max=738.77ms p(90)=256.41ms p(95)=323.83ms p(99.9)=628.77ms
     iterations.....................: 29443   243.481352/s
     success_rate...................: 100.00% ✓ 29443      ✗ 0    
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

     checks.........................: 100.00% ✓ 87237      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=7.21µs   min=1.3µs   med=3.36µs   max=4.76ms   p(90)=4.65µs   p(95)=5.19µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.59µs   min=0s      med=0s       max=4.71ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=205.5ms  min=8.65ms  med=223.43ms max=424.75ms p(90)=290.63ms p(95)=299.21ms p(99.9)=377.88ms
       { expected_response:true }...: avg=205.5ms  min=8.65ms  med=223.43ms max=424.75ms p(90)=290.63ms p(95)=299.21ms p(99.9)=377.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29179
     http_req_receiving.............: avg=155.37µs min=34.96µs med=91.73µs  max=103.14ms p(90)=123.74µs p(95)=136.82µs p(99.9)=8.54ms  
     http_req_sending...............: avg=27.66µs  min=6.13µs  med=16.84µs  max=108.12ms p(90)=21.27µs  p(95)=23.18µs  p(99.9)=526.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.32ms min=8.51ms  med=223.18ms max=424.59ms p(90)=290.52ms p(95)=299.08ms p(99.9)=373.23ms
     http_reqs......................: 29179   240.968909/s
     iteration_duration.............: avg=206.45ms min=26.22ms med=226.4ms  max=432.04ms p(90)=290.93ms p(95)=299.55ms p(99.9)=379.71ms
     iterations.....................: 29079   240.143079/s
     success_rate...................: 100.00% ✓ 29079      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

