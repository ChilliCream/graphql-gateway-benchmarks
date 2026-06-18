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
| hive-router | v0.0.65 | 2,977 | 3,150 | 2,930 | 2.3% |  |
| fusion-nightly | 16.2.0-p.4 | 2,185 | 2,230 | 2,179 | 0.8% |  |
| fusion | 16.1.4 | 2,163 | 2,212 | 2,154 | 0.8% |  |
| grafbase | 0.53.5 | 2,044 | 2,134 | 2,026 | 1.8% |  |
| cosmo | 0.321.1 | 1,214 | 1,236 | 1,208 | 0.8% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 553 | 565 | 548 | 1.0% |  |
| apollo-router | v2.15.0 | 410 | 423 | 406 | 1.3% |  |
| apollo-gateway | 2.14.1 | 243 | 245 | 241 | 0.7% |  |
| hive-gateway | 2.8.2 | 228 | 231 | 226 | 0.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,313 | 2,462 | 2,274 | 2.6% |  |
| fusion-nightly | 16.2.0-p.4 | 1,964 | 2,025 | 1,951 | 1.2% |  |
| fusion | 16.1.4 | 1,933 | 1,987 | 1,914 | 1.1% |  |
| grafbase | 0.53.5 | 1,559 | 1,571 | 1,544 | 0.7% |  |
| cosmo | 0.321.1 | 1,161 | 1,176 | 1,155 | 0.8% | non-compatible response (6 across 4/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 522 | 536 | 517 | 1.1% |  |
| apollo-router | v2.15.0 | 381 | 393 | 377 | 1.4% |  |
| hive-gateway | 2.8.2 | 238 | 243 | 235 | 1.1% |  |
| apollo-gateway | 2.14.1 | 236 | 239 | 235 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1073469     ✗ 0     
     data_received..................: 31 GB   261 MB/s
     data_sent......................: 430 MB  3.6 MB/s
     http_req_blocked...............: avg=3.34µs   min=1µs     med=2.5µs   max=25.84ms  p(90)=3.76µs   p(95)=4.44µs   p(99.9)=35.72µs
     http_req_connecting............: avg=232ns    min=0s      med=0s      max=3.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.52ms  min=1.6ms   med=15.6ms  max=315.86ms p(90)=24.22ms  p(95)=28.09ms  p(99.9)=51.86ms
       { expected_response:true }...: avg=16.52ms  min=1.6ms   med=15.6ms  max=315.86ms p(90)=24.22ms  p(95)=28.09ms  p(99.9)=51.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 357923
     http_req_receiving.............: avg=138.99µs min=27.19µs med=52.42µs max=192.39ms p(90)=108.09µs p(95)=298.19µs p(99.9)=10.18ms
     http_req_sending...............: avg=62.12µs  min=5.37µs  med=9.79µs  max=165.09ms p(90)=16.89µs  p(95)=129.37µs p(99.9)=8.33ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.32ms  min=1.55ms  med=15.45ms max=315.55ms p(90)=23.95ms  p(95)=27.7ms   p(99.9)=50.26ms
     http_reqs......................: 357923  2977.791855/s
     iteration_duration.............: avg=16.75ms  min=2.2ms   med=15.81ms max=359.38ms p(90)=24.45ms  p(95)=28.35ms  p(99.9)=53.1ms 
     iterations.....................: 357823  2976.95989/s
     success_rate...................: 100.00% ✓ 357823      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.2.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 788292      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 316 MB  2.6 MB/s
     http_req_blocked...............: avg=3.32µs   min=1.05µs  med=2.45µs   max=14.15ms  p(90)=3.68µs  p(95)=4.32µs   p(99.9)=35.65µs 
     http_req_connecting............: avg=387ns    min=0s      med=0s       max=4.38ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.59ms  min=2.39ms  med=15.16ms  max=313.82ms p(90)=48.51ms p(95)=66.05ms  p(99.9)=160.52ms
       { expected_response:true }...: avg=22.59ms  min=2.39ms  med=15.16ms  max=313.82ms p(90)=48.51ms p(95)=66.05ms  p(99.9)=160.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 262864
     http_req_receiving.............: avg=961.36µs min=52.07µs med=128.01µs max=284.23ms p(90)=1.39ms  p(95)=2.3ms    p(99.9)=65.01ms 
     http_req_sending...............: avg=47.71µs  min=5.34µs  med=9.81µs   max=80.67ms  p(90)=16.98µs p(95)=113.36µs p(99.9)=4.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.58ms  min=2.27ms  med=14.38ms  max=277.57ms p(90)=46.61ms p(95)=63.94ms  p(99.9)=155.9ms 
     http_reqs......................: 262864  2185.299059/s
     iteration_duration.............: avg=22.82ms  min=2.96ms  med=15.38ms  max=370.58ms p(90)=48.77ms p(95)=66.32ms  p(99.9)=160.94ms
     iterations.....................: 262764  2184.467717/s
     success_rate...................: 100.00% ✓ 262764      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 780528      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 313 MB  2.6 MB/s
     http_req_blocked...............: avg=3.23µs   min=1µs     med=2.44µs   max=12.83ms  p(90)=3.63µs   p(95)=4.24µs   p(99.9)=36.94µs 
     http_req_connecting............: avg=381ns    min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.81ms  min=2.39ms  med=14.54ms  max=306.1ms  p(90)=50.92ms  p(95)=69.07ms  p(99.9)=162.1ms 
       { expected_response:true }...: avg=22.81ms  min=2.39ms  med=14.54ms  max=306.1ms  p(90)=50.92ms  p(95)=69.07ms  p(99.9)=162.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 260276
     http_req_receiving.............: avg=646.92µs min=50.36µs med=108.28µs max=257.75ms p(90)=953.95µs p(95)=1.48ms   p(99.9)=59.99ms 
     http_req_sending...............: avg=44.83µs  min=5.23µs  med=9.81µs   max=181.56ms p(90)=16.41µs  p(95)=113.94µs p(99.9)=2.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.12ms  min=2.29ms  med=14.03ms  max=297.59ms p(90)=49.61ms  p(95)=67.75ms  p(99.9)=159.41ms
     http_reqs......................: 260276  2163.848619/s
     iteration_duration.............: avg=23.05ms  min=3.24ms  med=14.76ms  max=335.58ms p(90)=51.15ms  p(95)=69.34ms  p(99.9)=163.36ms
     iterations.....................: 260176  2163.017252/s
     success_rate...................: 100.00% ✓ 260176      ✗ 0     
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

     checks.........................: 100.00% ✓ 737394      ✗ 0     
     data_received..................: 22 GB   180 MB/s
     data_sent......................: 296 MB  2.5 MB/s
     http_req_blocked...............: avg=3.89µs   min=1.04µs  med=2.78µs  max=13.22ms  p(90)=4.36µs   p(95)=5.17µs   p(99.9)=42.1µs 
     http_req_connecting............: avg=420ns    min=0s      med=0s      max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.15ms  min=2.02ms  med=23.91ms max=336.46ms p(90)=28.99ms  p(95)=31.22ms  p(99.9)=53.5ms 
       { expected_response:true }...: avg=24.15ms  min=2.02ms  med=23.91ms max=336.46ms p(90)=28.99ms  p(95)=31.22ms  p(99.9)=53.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 245898
     http_req_receiving.............: avg=112.38µs min=29.74µs med=62.67µs max=62.59ms  p(90)=106.49µs p(95)=197.41µs p(99.9)=8.52ms 
     http_req_sending...............: avg=46.23µs  min=4.82µs  med=11.09µs max=80.83ms  p(90)=18.88µs  p(95)=117.72µs p(99.9)=3.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24ms     min=1.92ms  med=23.78ms max=316.68ms p(90)=28.82ms  p(95)=30.98ms  p(99.9)=52.47ms
     http_reqs......................: 245898  2044.700136/s
     iteration_duration.............: avg=24.39ms  min=3.47ms  med=24.12ms max=349.56ms p(90)=29.22ms  p(95)=31.46ms  p(99.9)=54.07ms
     iterations.....................: 245798  2043.868612/s
     success_rate...................: 100.00% ✓ 245798      ✗ 0     
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

     checks.........................: 100.00% ✓ 437820      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 176 MB  1.5 MB/s
     http_req_blocked...............: avg=3.5µs    min=1.01µs  med=2.43µs  max=5.08ms   p(90)=3.7µs   p(95)=4.3µs    p(99.9)=36.46µs
     http_req_connecting............: avg=723ns    min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.86ms  min=2.1ms   med=40.32ms max=349.62ms p(90)=57.68ms p(95)=62.87ms  p(99.9)=88.16ms
       { expected_response:true }...: avg=40.86ms  min=2.1ms   med=40.32ms max=349.62ms p(90)=57.68ms p(95)=62.87ms  p(99.9)=88.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146040
     http_req_receiving.............: avg=110.28µs min=28.52µs med=61.96µs max=223.92ms p(90)=97.75µs p(95)=115.82µs p(99.9)=2.25ms 
     http_req_sending...............: avg=27.43µs  min=5.34µs  med=10.68µs max=215.81ms p(90)=16.39µs p(95)=20.45µs  p(99.9)=1.31ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.72ms  min=2.03ms  med=40.21ms max=134.73ms p(90)=57.56ms p(95)=62.75ms  p(99.9)=87.42ms
     http_reqs......................: 146040  1214.205218/s
     iteration_duration.............: avg=41.1ms   min=4.02ms  med=40.53ms max=367.19ms p(90)=57.9ms  p(95)=63.09ms  p(99.9)=88.68ms
     iterations.....................: 145940  1213.373798/s
     success_rate...................: 100.00% ✓ 145940      ✗ 0     
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

     checks.........................: 100.00% ✓ 199653     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 80 MB   664 kB/s
     http_req_blocked...............: avg=3.91µs  min=1.18µs  med=2.92µs  max=4.1ms    p(90)=4.41µs   p(95)=5.04µs   p(99.9)=48.24µs 
     http_req_connecting............: avg=649ns   min=0s      med=0s      max=2.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.8ms  min=3.88ms  med=88.51ms max=343.37ms p(90)=112.34ms p(95)=124.87ms p(99.9)=224.04ms
       { expected_response:true }...: avg=89.8ms  min=3.88ms  med=88.51ms max=343.37ms p(90)=112.34ms p(95)=124.87ms p(99.9)=224.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66651
     http_req_receiving.............: avg=87.3µs  min=32.05µs med=76.74µs max=102.36ms p(90)=111.57µs p(95)=124.58µs p(99.9)=878.08µs
     http_req_sending...............: avg=21.13µs min=5.32µs  med=12.88µs max=56.62ms  p(90)=19.43µs  p(95)=21.72µs  p(99.9)=698.14µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.69ms min=3.78ms  med=88.4ms  max=342.93ms p(90)=112.22ms p(95)=124.76ms p(99.9)=223.86ms
     http_reqs......................: 66651   553.021018/s
     iteration_duration.............: avg=90.17ms min=17.78ms med=88.76ms max=363.07ms p(90)=112.58ms p(95)=125.15ms p(99.9)=226.11ms
     iterations.....................: 66551   552.191292/s
     success_rate...................: 100.00% ✓ 66551      ✗ 0    
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

     checks.........................: 100.00% ✓ 148299     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   493 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.23µs  med=3.3µs    max=4.27ms   p(90)=4.67µs   p(95)=5.21µs   p(99.9)=191.14µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=70.27µs 
     http_req_duration..............: avg=120.91ms min=5.28ms  med=120.71ms max=343.11ms p(90)=146.11ms p(95)=153.83ms p(99.9)=192.52ms
       { expected_response:true }...: avg=120.91ms min=5.28ms  med=120.71ms max=343.11ms p(90)=146.11ms p(95)=153.83ms p(99.9)=192.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49533
     http_req_receiving.............: avg=90.16µs  min=31.92µs med=80.84µs  max=92.04ms  p(90)=112.55µs p(95)=124.51µs p(99.9)=758.08µs
     http_req_sending...............: avg=26.32µs  min=5.54µs  med=14.84µs  max=102.53ms p(90)=20.59µs  p(95)=22.42µs  p(99.9)=583.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.8ms  min=5.21ms  med=120.59ms max=342.41ms p(90)=146ms    p(95)=153.71ms p(99.9)=191.88ms
     http_reqs......................: 49533   410.461187/s
     iteration_duration.............: avg=121.4ms  min=26.05ms med=120.98ms max=360.12ms p(90)=146.36ms p(95)=154.09ms p(99.9)=194.19ms
     iterations.....................: 49433   409.632525/s
     success_rate...................: 100.00% ✓ 49433      ✗ 0    
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

     checks.........................: 100.00% ✓ 88227      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   293 kB/s
     http_req_blocked...............: avg=6.76µs   min=1.19µs  med=3.15µs   max=4.06ms   p(90)=4.35µs   p(95)=4.85µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.43µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=203.22ms min=8.6ms   med=211.73ms max=417.2ms  p(90)=242.9ms  p(95)=249.53ms p(99.9)=322.9ms 
       { expected_response:true }...: avg=203.22ms min=8.6ms   med=211.73ms max=417.2ms  p(90)=242.9ms  p(95)=249.53ms p(99.9)=322.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29509
     http_req_receiving.............: avg=95.96µs  min=32.51µs med=86.62µs  max=90.13ms  p(90)=118.31µs p(95)=129.4µs  p(99.9)=724.6µs 
     http_req_sending...............: avg=35.05µs  min=5.97µs  med=15.77µs  max=108.15ms p(90)=20.87µs  p(95)=22.65µs  p(99.9)=576.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.09ms min=8.46ms  med=211.58ms max=416.53ms p(90)=242.8ms  p(95)=249.41ms p(99.9)=322.65ms
     http_reqs......................: 29509   243.666287/s
     iteration_duration.............: avg=204.16ms min=37.31ms med=213.05ms max=427.23ms p(90)=243.2ms  p(95)=249.83ms p(99.9)=327.07ms
     iterations.....................: 29409   242.840551/s
     success_rate...................: 100.00% ✓ 29409      ✗ 0    
     vus............................: 42      min=42       max=50 
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

     checks.........................: 100.00% ✓ 82458     ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 33 MB   274 kB/s
     http_req_blocked...............: avg=5.61µs   min=1.3µs   med=3.52µs   max=2.34ms   p(90)=4.88µs   p(95)=5.48µs   p(99.9)=827.33µs
     http_req_connecting............: avg=1.88µs   min=0s      med=0s       max=2.31ms   p(90)=0s       p(95)=0s       p(99.9)=806.29µs
     http_req_duration..............: avg=217.39ms min=6.72ms  med=197.78ms max=750.81ms p(90)=258.11ms p(95)=432.28ms p(99.9)=641.82ms
       { expected_response:true }...: avg=217.39ms min=6.72ms  med=197.78ms max=750.81ms p(90)=258.11ms p(95)=432.28ms p(99.9)=641.82ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 27586
     http_req_receiving.............: avg=100.4µs  min=31.53µs med=95.22µs  max=16.59ms  p(90)=126.88µs p(95)=139.53µs p(99.9)=658.15µs
     http_req_sending...............: avg=37.55µs  min=6µs     med=17.65µs  max=120.03ms p(90)=22.63µs  p(95)=24.56µs  p(99.9)=523.39µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=217.25ms min=6.57ms  med=197.65ms max=750.7ms  p(90)=257.96ms p(95)=432.15ms p(99.9)=641.71ms
     http_reqs......................: 27586   228.07261/s
     iteration_duration.............: avg=218.44ms min=38.63ms med=198.14ms max=751.06ms p(90)=258.59ms p(95)=435.5ms  p(99.9)=642.19ms
     iterations.....................: 27486   227.24584/s
     success_rate...................: 100.00% ✓ 27486     ✗ 0    
     vus............................: 50      min=50      max=50 
     vus_max........................: 50      min=50      max=50
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

     checks.........................: 100.00% ✓ 834096      ✗ 0     
     data_received..................: 24 GB   202 MB/s
     data_sent......................: 334 MB  2.8 MB/s
     http_req_blocked...............: avg=5.86µs   min=1.01µs  med=2.65µs  max=244.32ms p(90)=4.08µs  p(95)=4.86µs   p(99.9)=39.47µs
     http_req_connecting............: avg=2.61µs   min=0s      med=0s      max=244.28ms p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.33ms  min=1.92ms  med=20.93ms max=330.71ms p(90)=29.51ms p(95)=32.58ms  p(99.9)=54.88ms
       { expected_response:true }...: avg=21.33ms  min=1.92ms  med=20.93ms max=330.71ms p(90)=29.51ms p(95)=32.58ms  p(99.9)=54.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 278132
     http_req_receiving.............: avg=113.23µs min=27.95µs med=57.62µs max=129.82ms p(90)=106.2µs p(95)=252.93µs p(99.9)=8.65ms 
     http_req_sending...............: avg=56.36µs  min=5.47µs  med=10.73µs max=254.34ms p(90)=18.89µs p(95)=126.75µs p(99.9)=6.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.16ms  min=1.81ms  med=20.79ms max=329.85ms p(90)=29.31ms p(95)=32.3ms   p(99.9)=53.99ms
     http_reqs......................: 278132  2313.029638/s
     iteration_duration.............: avg=21.57ms  min=3.05ms  med=21.15ms max=339.72ms p(90)=29.74ms p(95)=32.82ms  p(99.9)=55.51ms
     iterations.....................: 278032  2312.198007/s
     success_rate...................: 100.00% ✓ 278032      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.2.0-p.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 708384      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=3.47µs   min=1.04µs  med=2.57µs   max=9.04ms   p(90)=3.93µs  p(95)=4.66µs   p(99.9)=38.95µs 
     http_req_connecting............: avg=452ns    min=0s      med=0s       max=4.65ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.15ms  min=1.88ms  med=17.97ms  max=557.77ms p(90)=51.65ms p(95)=67.73ms  p(99.9)=178.83ms
       { expected_response:true }...: avg=25.15ms  min=1.88ms  med=17.97ms  max=557.77ms p(90)=51.65ms p(95)=67.73ms  p(99.9)=178.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236228
     http_req_receiving.............: avg=990.92µs min=52.74µs med=130.61µs max=262.27ms p(90)=1.63ms  p(95)=2.62ms   p(99.9)=62.95ms 
     http_req_sending...............: avg=44.47µs  min=4.88µs  med=10.23µs  max=133.86ms p(90)=18.45µs p(95)=114.77µs p(99.9)=3.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.12ms  min=1.76ms  med=17.15ms  max=555.16ms p(90)=49.9ms  p(95)=65.82ms  p(99.9)=173.15ms
     http_reqs......................: 236228  1964.674451/s
     iteration_duration.............: avg=25.4ms   min=2.36ms  med=18.2ms   max=557.97ms p(90)=51.88ms p(95)=67.97ms  p(99.9)=179.77ms
     iterations.....................: 236128  1963.842766/s
     success_rate...................: 100.00% ✓ 236128      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 697323      ✗ 0     
     data_received..................: 20 GB   170 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=3.22µs   min=992ns   med=2.54µs   max=6.09ms   p(90)=3.88µs  p(95)=4.58µs   p(99.9)=36.02µs 
     http_req_connecting............: avg=239ns    min=0s      med=0s       max=3.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.56ms  min=1.98ms  med=17.1ms   max=557.34ms p(90)=54.84ms p(95)=72.45ms  p(99.9)=192.82ms
       { expected_response:true }...: avg=25.56ms  min=1.98ms  med=17.1ms   max=557.34ms p(90)=54.84ms p(95)=72.45ms  p(99.9)=192.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232541
     http_req_receiving.............: avg=680.02µs min=52.07µs med=110.42µs max=180.25ms p(90)=1.11ms  p(95)=1.75ms   p(99.9)=57.85ms 
     http_req_sending...............: avg=43.68µs  min=5.13µs  med=10.06µs  max=185.64ms p(90)=17.36µs p(95)=103.87µs p(99.9)=2.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.83ms  min=1.86ms  med=16.55ms  max=557.23ms p(90)=53.63ms p(95)=70.93ms  p(99.9)=190.33ms
     http_reqs......................: 232541  1933.823021/s
     iteration_duration.............: avg=25.8ms   min=2.34ms  med=17.32ms  max=557.5ms  p(90)=55.08ms p(95)=72.7ms   p(99.9)=195.15ms
     iterations.....................: 232441  1932.991416/s
     success_rate...................: 100.00% ✓ 232441      ✗ 0     
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

     checks.........................: 100.00% ✓ 562623      ✗ 0     
     data_received..................: 16 GB   137 MB/s
     data_sent......................: 226 MB  1.9 MB/s
     http_req_blocked...............: avg=4.09µs   min=982ns   med=2.87µs  max=12.64ms  p(90)=5.25µs   p(95)=6.38µs   p(99.9)=47.43µs
     http_req_connecting............: avg=523ns    min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.71ms  min=2.25ms  med=30.8ms  max=301ms    p(90)=42.22ms  p(95)=46.8ms   p(99.9)=81.86ms
       { expected_response:true }...: avg=31.71ms  min=2.25ms  med=30.8ms  max=301ms    p(90)=42.22ms  p(95)=46.8ms   p(99.9)=81.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 187641
     http_req_receiving.............: avg=156.36µs min=30.74µs med=64.03µs max=236.09ms p(90)=138.42µs p(95)=293.58µs p(99.9)=7.32ms 
     http_req_sending...............: avg=48.92µs  min=5.55µs  med=11.53µs max=113.92ms p(90)=25.85µs  p(95)=141.24µs p(99.9)=3.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.51ms  min=2.18ms  med=30.66ms max=130.65ms p(90)=42.02ms  p(95)=46.53ms  p(99.9)=77.74ms
     http_reqs......................: 187641  1559.808026/s
     iteration_duration.............: avg=31.98ms  min=3.33ms  med=31.05ms max=385.46ms p(90)=42.45ms  p(95)=47.05ms  p(99.9)=82.37ms
     iterations.....................: 187541  1558.976754/s
     success_rate...................: 100.00% ✓ 187541      ✗ 0     
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

     checks.........................: 100.00% ✓ 418812      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.36µs  min=1.06µs  med=2.73µs  max=2.39ms   p(90)=4.26µs   p(95)=4.93µs   p(99.9)=37.75µs
     http_req_connecting............: avg=304ns   min=0s      med=0s      max=2.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.71ms min=2.32ms  med=42.21ms max=294.54ms p(90)=59.84ms  p(95)=65.2ms   p(99.9)=90.81ms
       { expected_response:true }...: avg=42.71ms min=2.32ms  med=42.21ms max=294.54ms p(90)=59.84ms  p(95)=65.2ms   p(99.9)=90.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139704
     http_req_receiving.............: avg=87.9µs  min=28.59µs med=67.97µs max=73.9ms   p(90)=106.74µs p(95)=125.98µs p(99.9)=1.76ms 
     http_req_sending...............: avg=28.88µs min=5.31µs  med=11.67µs max=148.92ms p(90)=18.38µs  p(95)=22.17µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.6ms  min=2.2ms   med=42.1ms  max=294ms    p(90)=59.72ms  p(95)=65.09ms  p(99.9)=90.45ms
     http_reqs......................: 139704  1161.313174/s
     iteration_duration.............: avg=42.97ms min=4.24ms  med=42.43ms max=349.64ms p(90)=60.06ms  p(95)=65.42ms  p(99.9)=91.34ms
     iterations.....................: 139604  1160.481907/s
     success_rate...................: 100.00% ✓ 139604      ✗ 0     
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

     checks.........................: 100.00% ✓ 188841     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   628 kB/s
     http_req_blocked...............: avg=4.33µs  min=1.23µs  med=3.17µs  max=3.11ms   p(90)=4.7µs    p(95)=5.31µs   p(99.9)=52.07µs 
     http_req_connecting............: avg=916ns   min=0s      med=0s      max=3.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.93ms min=4.07ms  med=92.28ms max=306.12ms p(90)=117.05ms p(95)=130.02ms p(99.9)=232.08ms
       { expected_response:true }...: avg=94.93ms min=4.07ms  med=92.28ms max=306.12ms p(90)=117.05ms p(95)=130.02ms p(99.9)=232.08ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63047
     http_req_receiving.............: avg=89.91µs min=32.28µs med=81.71µs max=33.41ms  p(90)=115.81µs p(95)=128.61µs p(99.9)=933.71µs
     http_req_sending...............: avg=23.35µs min=5.7µs   med=14.32µs max=121.22ms p(90)=20.89µs  p(95)=23.03µs  p(99.9)=769.41µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.82ms min=3.95ms  med=92.17ms max=305.43ms p(90)=116.93ms p(95)=129.91ms p(99.9)=231.78ms
     http_reqs......................: 63047   522.974722/s
     iteration_duration.............: avg=95.33ms min=15.51ms med=92.54ms max=335.47ms p(90)=117.31ms p(95)=130.34ms p(99.9)=234.19ms
     iterations.....................: 62947   522.145222/s
     success_rate...................: 100.00% ✓ 62947      ✗ 0    
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

     checks.........................: 100.00% ✓ 137895     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   458 kB/s
     http_req_blocked...............: avg=6.26µs   min=1.08µs  med=3.63µs   max=4.27ms   p(90)=5.06µs   p(95)=5.61µs   p(99.9)=423.95µs
     http_req_connecting............: avg=2.42µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=258.38µs
     http_req_duration..............: avg=130.02ms min=5.7ms   med=127.67ms max=350.5ms  p(90)=172.17ms p(95)=184.92ms p(99.9)=237.74ms
       { expected_response:true }...: avg=130.02ms min=5.7ms   med=127.67ms max=350.5ms  p(90)=172.17ms p(95)=184.92ms p(99.9)=237.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46065
     http_req_receiving.............: avg=94.96µs  min=27.58µs med=87.36µs  max=81.57ms  p(90)=118.74µs p(95)=131.23µs p(99.9)=637.86µs
     http_req_sending...............: avg=26.43µs  min=5.77µs  med=17.16µs  max=98.9ms   p(90)=22.49µs  p(95)=24.25µs  p(99.9)=618.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.9ms  min=5.58ms  med=127.56ms max=340.67ms p(90)=172.06ms p(95)=184.79ms p(99.9)=237.65ms
     http_reqs......................: 46065   381.545582/s
     iteration_duration.............: avg=130.57ms min=23.99ms med=128.02ms max=358.46ms p(90)=172.48ms p(95)=185.27ms p(99.9)=240.37ms
     iterations.....................: 45965   380.717305/s
     success_rate...................: 100.00% ✓ 45965      ✗ 0    
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

     checks.........................: 100.00% ✓ 86460      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=5.4µs    min=1.27µs  med=3.57µs   max=2.2ms    p(90)=4.97µs   p(95)=5.57µs   p(99.9)=764.63µs
     http_req_connecting............: avg=1.63µs   min=0s      med=0s       max=2.16ms   p(90)=0s       p(95)=0s       p(99.9)=658.22µs
     http_req_duration..............: avg=207.32ms min=6.59ms  med=190.1ms  max=698.71ms p(90)=238.37ms p(95)=293.39ms p(99.9)=624.41ms
       { expected_response:true }...: avg=207.32ms min=6.59ms  med=190.1ms  max=698.71ms p(90)=238.37ms p(95)=293.39ms p(99.9)=624.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28920
     http_req_receiving.............: avg=106.14µs min=32.94µs med=97.01µs  max=67.55ms  p(90)=128.67µs p(95)=142.16µs p(99.9)=572.44µs
     http_req_sending...............: avg=29.18µs  min=5.9µs   med=18µs     max=58.65ms  p(90)=22.78µs  p(95)=24.46µs  p(99.9)=596.14µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.19ms min=6.49ms  med=189.96ms max=698.61ms p(90)=238.27ms p(95)=293.29ms p(99.9)=624.28ms
     http_reqs......................: 28920   238.893198/s
     iteration_duration.............: avg=208.31ms min=39.28ms med=190.44ms max=698.94ms p(90)=238.83ms p(95)=296.91ms p(99.9)=624.8ms 
     iterations.....................: 28820   238.067149/s
     success_rate...................: 100.00% ✓ 28820      ✗ 0    
     vus............................: 29      min=29       max=50 
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

     checks.........................: 100.00% ✓ 85788      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   284 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.24µs  med=3.47µs   max=4.54ms   p(90)=4.72µs   p(95)=5.22µs   p(99.9)=1.86ms  
     http_req_connecting............: avg=3.85µs   min=0s      med=0s       max=4.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=208.97ms min=8.62ms  med=213.11ms max=458.59ms p(90)=232.44ms p(95)=237.5ms  p(99.9)=320.59ms
       { expected_response:true }...: avg=208.97ms min=8.62ms  med=213.11ms max=458.59ms p(90)=232.44ms p(95)=237.5ms  p(99.9)=320.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28696
     http_req_receiving.............: avg=97.18µs  min=31.86µs med=93.13µs  max=8.91ms   p(90)=124.99µs p(95)=137.63µs p(99.9)=491.96µs
     http_req_sending...............: avg=39.2µs   min=5.99µs  med=17µs     max=158.57ms p(90)=21.7µs   p(95)=23.47µs  p(99.9)=834.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.83ms min=8.45ms  med=212.98ms max=457.66ms p(90)=232.32ms p(95)=237.36ms p(99.9)=320.49ms
     http_reqs......................: 28696   236.893552/s
     iteration_duration.............: avg=209.98ms min=48.79ms med=213.57ms max=470.53ms p(90)=232.72ms p(95)=237.78ms p(99.9)=323.38ms
     iterations.....................: 28596   236.068024/s
     success_rate...................: 100.00% ✓ 28596      ✗ 0    
     vus............................: 44      min=44       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

