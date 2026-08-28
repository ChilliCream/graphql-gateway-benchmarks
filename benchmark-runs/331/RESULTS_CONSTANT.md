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
| hive-router | v0.0.84 | 2,933 | 3,171 | 2,870 | 3.5% |  |
| fusion-nightly-net11 | 16.6.2-p.8 | 2,730 | 2,868 | 2,708 | 2.0% |  |
| fusion | 16.6.1 | 2,643 | 2,757 | 2,635 | 1.6% |  |
| fusion-nightly | 16.6.2-p.8 | 2,567 | 2,692 | 2,545 | 1.9% |  |
| fusion-nightly-fed | 16.6.2-p.8 | 2,428 | 2,522 | 2,405 | 1.5% |  |
| grafbase | 0.53.5 | 2,171 | 2,300 | 2,158 | 2.3% |  |
| cosmo | 0.334.0 | 1,327 | 1,369 | 1,322 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 629 | 646 | 626 | 1.2% |  |
| apollo-router | v2.16.1 | 483 | 501 | 480 | 1.6% |  |
| apollo-gateway | 2.14.3 | 285 | 288 | 284 | 0.6% |  |
| hive-gateway | 2.10.8 | 278 | 287 | 276 | 1.3% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1156 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.2-p.8 | 2,571 | 2,693 | 2,561 | 1.8% |  |
| fusion-nightly | 16.6.2-p.8 | 2,457 | 2,578 | 2,449 | 1.8% |  |
| hive-router | v0.0.84 | 2,395 | 2,562 | 2,372 | 2.6% |  |
| fusion | 16.6.1 | 2,376 | 2,491 | 2,355 | 1.9% |  |
| fusion-nightly-fed | 16.6.2-p.8 | 2,214 | 2,311 | 2,199 | 1.8% |  |
| grafbase | 0.53.5 | 1,606 | 1,675 | 1,605 | 1.6% |  |
| cosmo | 0.334.0 | 1,224 | 1,263 | 1,209 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 587 | 607 | 584 | 1.2% |  |
| apollo-router | v2.16.1 | 414 | 430 | 405 | 2.3% |  |
| hive-gateway | 2.10.8 | 271 | 279 | 271 | 1.1% |  |
| apollo-gateway | 2.14.3 | 268 | 273 | 267 | 0.8% |  |
| feddi | 5ff8b6165878 | 20 | 20 | 19 | 2.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1057353     ✗ 0     
     data_received..................: 31 GB   257 MB/s
     data_sent......................: 424 MB  3.5 MB/s
     http_req_blocked...............: avg=2.6µs   min=861ns   med=1.85µs  max=14.75ms  p(90)=2.98µs  p(95)=3.55µs   p(99.9)=29.26µs
     http_req_connecting............: avg=260ns   min=0s      med=0s      max=3.76ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.81ms min=1.42ms  med=16.14ms max=280.03ms p(90)=24.75ms p(95)=27.83ms  p(99.9)=46.37ms
       { expected_response:true }...: avg=16.81ms min=1.42ms  med=16.14ms max=280.03ms p(90)=24.75ms p(95)=27.83ms  p(99.9)=46.37ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 352551
     http_req_receiving.............: avg=85.12µs min=26.22µs med=45.37µs max=38.83ms  p(90)=79.32µs p(95)=127.54µs p(99.9)=7.44ms 
     http_req_sending...............: avg=42.49µs min=4.4µs   med=8.04µs  max=162.33ms p(90)=13.46µs p(95)=79.88µs  p(99.9)=4.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.68ms min=1.34ms  med=16.04ms max=279.48ms p(90)=24.58ms p(95)=27.6ms   p(99.9)=45.58ms
     http_reqs......................: 352551  2933.394577/s
     iteration_duration.............: avg=17.01ms min=2.05ms  med=16.33ms max=298.66ms p(90)=24.95ms p(95)=28.05ms  p(99.9)=47.04ms
     iterations.....................: 352451  2932.562529/s
     success_rate...................: 100.00% ✓ 352451      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 984876      ✗ 0     
     data_received..................: 29 GB   239 MB/s
     data_sent......................: 395 MB  3.3 MB/s
     http_req_blocked...............: avg=2.69µs   min=832ns   med=1.93µs  max=17.83ms  p(90)=3.35µs  p(95)=4.01µs  p(99.9)=26.72µs
     http_req_connecting............: avg=270ns    min=0s      med=0s      max=3.8ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.05ms  min=1.94ms  med=17.15ms max=286.93ms p(90)=26.11ms p(95)=29.72ms p(99.9)=50.48ms
       { expected_response:true }...: avg=18.05ms  min=1.94ms  med=17.15ms max=286.93ms p(90)=26.11ms p(95)=29.72ms p(99.9)=50.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 328392
     http_req_receiving.............: avg=467.45µs min=51.16µs med=89.71µs max=194.36ms p(90)=1.15ms  p(95)=1.81ms  p(99.9)=18.29ms
     http_req_sending...............: avg=45.9µs   min=4.42µs  med=8.05µs  max=198.81ms p(90)=15.57µs p(95)=86.71µs p(99.9)=5.71ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.54ms  min=1.82ms  med=16.66ms max=286.52ms p(90)=25.48ms p(95)=28.99ms p(99.9)=48.79ms
     http_reqs......................: 328392  2730.839728/s
     iteration_duration.............: avg=18.26ms  min=3.21ms  med=17.35ms max=300.03ms p(90)=26.32ms p(95)=29.95ms p(99.9)=51.21ms
     iterations.....................: 328292  2730.008148/s
     success_rate...................: 100.00% ✓ 328292      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 953298      ✗ 0     
     data_received..................: 28 GB   232 MB/s
     data_sent......................: 382 MB  3.2 MB/s
     http_req_blocked...............: avg=3.23µs   min=1.06µs  med=2.4µs   max=15.11ms  p(90)=3.74µs  p(95)=4.36µs  p(99.9)=34.35µs 
     http_req_connecting............: avg=312ns    min=0s      med=0s      max=4.14ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.65ms  min=1.93ms  med=16.19ms max=221.43ms p(90)=30.34ms p(95)=36.55ms p(99.9)=110.33ms
       { expected_response:true }...: avg=18.65ms  min=1.93ms  med=16.19ms max=221.43ms p(90)=30.34ms p(95)=36.55ms p(99.9)=110.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 317866
     http_req_receiving.............: avg=545.16µs min=49.48µs med=89.14µs max=205.84ms p(90)=1.07ms  p(95)=1.93ms  p(99.9)=24.83ms 
     http_req_sending...............: avg=44.74µs  min=4.82µs  med=8.87µs  max=41.66ms  p(90)=15.44µs p(95)=95.65µs p(99.9)=4.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.06ms  min=1.85ms  med=15.66ms max=221.06ms p(90)=29.46ms p(95)=35.54ms p(99.9)=109.16ms
     http_reqs......................: 317866  2643.38619/s
     iteration_duration.............: avg=18.87ms  min=3.05ms  med=16.39ms max=355.41ms p(90)=30.57ms p(95)=36.82ms p(99.9)=110.7ms 
     iterations.....................: 317766  2642.554586/s
     success_rate...................: 100.00% ✓ 317766      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 926193      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=2.98µs   min=851ns   med=1.83µs  max=12.83ms  p(90)=2.88µs  p(95)=3.38µs  p(99.9)=25.9µs  
     http_req_connecting............: avg=780ns    min=0s      med=0s      max=8.77ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.22ms  min=1.98ms  med=16.46ms max=323.4ms  p(90)=31.23ms p(95)=37.87ms p(99.9)=122.75ms
       { expected_response:true }...: avg=19.22ms  min=1.98ms  med=16.46ms max=323.4ms  p(90)=31.23ms p(95)=37.87ms p(99.9)=122.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 308831
     http_req_receiving.............: avg=567.72µs min=49.21µs med=88.76µs max=145.02ms p(90)=1.07ms  p(95)=1.91ms  p(99.9)=24.56ms 
     http_req_sending...............: avg=39.04µs  min=4.31µs  med=7.75µs  max=125.12ms p(90)=12.87µs p(95)=69.45µs p(99.9)=3.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.61ms  min=1.88ms  med=15.93ms max=322.67ms p(90)=30.32ms p(95)=36.77ms p(99.9)=121.85ms
     http_reqs......................: 308831  2567.971772/s
     iteration_duration.............: avg=19.42ms  min=2.89ms  med=16.64ms max=323.55ms p(90)=31.44ms p(95)=38.09ms p(99.9)=123.76ms
     iterations.....................: 308731  2567.140259/s
     success_rate...................: 100.00% ✓ 308731      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (rust subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 875508      ✗ 0     
     data_received..................: 26 GB   214 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=2.95µs   min=902ns   med=2.24µs  max=9.98ms   p(90)=3.57µs  p(95)=4.17µs  p(99.9)=32.07µs 
     http_req_connecting............: avg=309ns    min=0s      med=0s      max=4.11ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.34ms  min=1.7ms   med=16.6ms  max=301.66ms p(90)=34.95ms p(95)=43.82ms p(99.9)=151.27ms
       { expected_response:true }...: avg=20.34ms  min=1.7ms   med=16.6ms  max=301.66ms p(90)=34.95ms p(95)=43.82ms p(99.9)=151.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 291936
     http_req_receiving.............: avg=599.37µs min=52.07µs med=95.07µs max=147.85ms p(90)=1.06ms  p(95)=1.91ms  p(99.9)=32.15ms 
     http_req_sending...............: avg=39.96µs  min=4.52µs  med=8.72µs  max=109.38ms p(90)=15.11µs p(95)=73.8µs  p(99.9)=3.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.7ms   min=1.61ms  med=16.07ms max=301.52ms p(90)=33.96ms p(95)=42.62ms p(99.9)=150.18ms
     http_reqs......................: 291936  2428.238886/s
     iteration_duration.............: avg=20.55ms  min=2.57ms  med=16.8ms  max=313.25ms p(90)=35.18ms p(95)=44.07ms p(99.9)=152.3ms 
     iterations.....................: 291836  2427.407115/s
     success_rate...................: 100.00% ✓ 291836      ✗ 0     
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

     checks.........................: 100.00% ✓ 783036      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=3.42µs  min=952ns  med=2.59µs  max=13.47ms  p(90)=4.15µs  p(95)=4.92µs   p(99.9)=38.84µs
     http_req_connecting............: avg=327ns   min=0s     med=0s      max=3.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.76ms min=1.73ms med=22.52ms max=321.45ms p(90)=27.05ms p(95)=28.86ms  p(99.9)=48.71ms
       { expected_response:true }...: avg=22.76ms min=1.73ms med=22.52ms max=321.45ms p(90)=27.05ms p(95)=28.86ms  p(99.9)=48.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261112
     http_req_receiving.............: avg=92.07µs min=27.9µs med=56.87µs max=188.37ms p(90)=95.77µs p(95)=125.06µs p(99.9)=6.43ms 
     http_req_sending...............: avg=37.31µs min=4.91µs med=10.75µs max=92.22ms  p(90)=17.72µs p(95)=35.56µs  p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.63ms min=1.61ms med=22.42ms max=320.93ms p(90)=26.92ms p(95)=28.69ms  p(99.9)=47.58ms
     http_reqs......................: 261112  2171.943666/s
     iteration_duration.............: avg=22.97ms min=2.96ms med=22.72ms max=333.32ms p(90)=27.25ms p(95)=29.09ms  p(99.9)=49.27ms
     iterations.....................: 261012  2171.11186/s
     success_rate...................: 100.00% ✓ 261012      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 478677      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3µs     min=951ns  med=2.12µs  max=3.41ms   p(90)=3.66µs  p(95)=4.32µs   p(99.9)=28.91µs 
     http_req_connecting............: avg=537ns   min=0s     med=0s      max=3.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.37ms min=2.06ms med=36.96ms max=287.84ms p(90)=52.11ms p(95)=56.77ms  p(99.9)=78.66ms 
       { expected_response:true }...: avg=37.37ms min=2.06ms med=36.96ms max=287.84ms p(90)=52.11ms p(95)=56.77ms  p(99.9)=78.66ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159659
     http_req_receiving.............: avg=68.39µs min=25.9µs med=55.98µs max=99.69ms  p(90)=91.35µs p(95)=105.62µs p(99.9)=769.47µs
     http_req_sending...............: avg=21.04µs min=4.21µs med=9.76µs  max=67.31ms  p(90)=16.44µs p(95)=20.05µs  p(99.9)=959.3µs 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.28ms min=1.92ms med=36.87ms max=287.36ms p(90)=52.01ms p(95)=56.68ms  p(99.9)=78.29ms 
     http_reqs......................: 159659  1327.55164/s
     iteration_duration.............: avg=37.59ms min=3.64ms med=37.16ms max=301.3ms  p(90)=52.3ms  p(95)=56.97ms  p(99.9)=79.36ms 
     iterations.....................: 159559  1326.720148/s
     success_rate...................: 100.00% ✓ 159559      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 227322     ✗ 0    
     data_received..................: 6.7 GB  55 MB/s
     data_sent......................: 91 MB   757 kB/s
     http_req_blocked...............: avg=4.4µs   min=1.11µs  med=3.06µs  max=3.34ms   p(90)=4.6µs    p(95)=5.26µs   p(99.9)=46.61µs 
     http_req_connecting............: avg=1.07µs  min=0s      med=0s      max=3.3ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=78.83ms min=3.56ms  med=77.85ms max=307.59ms p(90)=100.23ms p(95)=110.42ms p(99.9)=187.26ms
       { expected_response:true }...: avg=78.83ms min=3.56ms  med=77.85ms max=307.59ms p(90)=100.23ms p(95)=110.42ms p(99.9)=187.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75874
     http_req_receiving.............: avg=78.65µs min=28µs    med=69.06µs max=33.48ms  p(90)=107.15µs p(95)=121.2µs  p(99.9)=695.12µs
     http_req_sending...............: avg=27.5µs  min=5.44µs  med=13.54µs max=136.8ms  p(90)=20.74µs  p(95)=23.13µs  p(99.9)=654.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.73ms min=3.46ms  med=77.76ms max=306.64ms p(90)=100.12ms p(95)=110.29ms p(99.9)=186.43ms
     http_reqs......................: 75874   629.832197/s
     iteration_duration.............: avg=79.18ms min=17.59ms med=78.1ms  max=320.49ms p(90)=100.48ms p(95)=110.69ms p(99.9)=189.19ms
     iterations.....................: 75774   629.002094/s
     success_rate...................: 100.00% ✓ 75774      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 174507     ✗ 0    
     data_received..................: 5.1 GB  42 MB/s
     data_sent......................: 70 MB   580 kB/s
     http_req_blocked...............: avg=4.75µs   min=1.11µs  med=3.01µs   max=3.84ms   p(90)=4.43µs   p(95)=4.96µs   p(99.9)=47.53µs 
     http_req_connecting............: avg=1.54µs   min=0s      med=0s       max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.74ms min=4.49ms  med=102.55ms max=306.03ms p(90)=123.92ms p(95)=130.17ms p(99.9)=158.7ms 
       { expected_response:true }...: avg=102.74ms min=4.49ms  med=102.55ms max=306.03ms p(90)=123.92ms p(95)=130.17ms p(99.9)=158.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 58269
     http_req_receiving.............: avg=79.78µs  min=28.22µs med=74.01µs  max=74.64ms  p(90)=105.97µs p(95)=119.73µs p(99.9)=541.98µs
     http_req_sending...............: avg=28.49µs  min=4.89µs  med=14.98µs  max=156.51ms p(90)=20.62µs  p(95)=22.44µs  p(99.9)=577.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.63ms min=4.38ms  med=102.46ms max=302.47ms p(90)=123.81ms p(95)=130.08ms p(99.9)=158.23ms
     http_reqs......................: 58269   483.174228/s
     iteration_duration.............: avg=103.17ms min=26.87ms med=102.83ms max=341.16ms p(90)=124.18ms p(95)=130.44ms p(99.9)=159.7ms 
     iterations.....................: 58169   482.345015/s
     success_rate...................: 100.00% ✓ 58169      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103167     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   343 kB/s
     http_req_blocked...............: avg=5.72µs   min=1.11µs  med=2.97µs   max=3.71ms   p(90)=4.22µs   p(95)=4.7µs    p(99.9)=1.22ms  
     http_req_connecting............: avg=2.54µs   min=0s      med=0s       max=3.67ms   p(90)=0s       p(95)=0s       p(99.9)=1.2ms   
     http_req_duration..............: avg=173.79ms min=7.31ms  med=178.98ms max=368.6ms  p(90)=196.93ms p(95)=202.87ms p(99.9)=263.41ms
       { expected_response:true }...: avg=173.79ms min=7.31ms  med=178.98ms max=368.6ms  p(90)=196.93ms p(95)=202.87ms p(99.9)=263.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34489
     http_req_receiving.............: avg=88.83µs  min=29.93µs med=84.8µs   max=97.96ms  p(90)=113.18µs p(95)=123.17µs p(99.9)=518.79µs
     http_req_sending...............: avg=30.44µs  min=4.78µs  med=16.66µs  max=139.35ms p(90)=20.54µs  p(95)=22.13µs  p(99.9)=436.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.67ms min=7.18ms  med=178.88ms max=368.07ms p(90)=196.82ms p(95)=202.76ms p(99.9)=263.07ms
     http_reqs......................: 34489   285.234614/s
     iteration_duration.............: avg=174.56ms min=27.76ms med=179.25ms max=378.13ms p(90)=197.2ms  p(95)=203.15ms p(99.9)=266.61ms
     iterations.....................: 34389   284.407583/s
     success_rate...................: 100.00% ✓ 34389      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100617     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 40 MB   334 kB/s
     http_req_blocked...............: avg=6.63µs   min=1.54µs  med=3.63µs   max=4.27ms   p(90)=5.06µs   p(95)=5.68µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=2.74µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=178.17ms min=5.95ms  med=162.05ms max=704.56ms p(90)=208.05ms p(95)=242.4ms  p(99.9)=609.09ms
       { expected_response:true }...: avg=178.17ms min=5.95ms  med=162.05ms max=704.56ms p(90)=208.05ms p(95)=242.4ms  p(99.9)=609.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33639
     http_req_receiving.............: avg=93.56µs  min=36.01µs med=89.87µs  max=5.09ms   p(90)=120.44µs p(95)=132.12µs p(99.9)=607.74µs
     http_req_sending...............: avg=24.22µs  min=6.36µs  med=18.58µs  max=38.68ms  p(90)=23.35µs  p(95)=25.16µs  p(99.9)=570.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=178.06ms min=5.82ms  med=161.94ms max=704.45ms p(90)=207.93ms p(95)=242.28ms p(99.9)=608.95ms
     http_reqs......................: 33639   278.425658/s
     iteration_duration.............: avg=178.99ms min=42.28ms med=162.42ms max=704.91ms p(90)=208.5ms  p(95)=243.1ms  p(99.9)=609.39ms
     iterations.....................: 33539   277.59797/s
     success_rate...................: 100.00% ✓ 33539      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 926973      ✗ 0     
     data_received..................: 27 GB   225 MB/s
     data_sent......................: 371 MB  3.1 MB/s
     http_req_blocked...............: avg=3.25µs   min=851ns   med=2.45µs  max=14.82ms  p(90)=4.1µs   p(95)=4.85µs  p(99.9)=36.82µs
     http_req_connecting............: avg=274ns    min=0s      med=0s      max=3.49ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.18ms  min=1.46ms  med=18.31ms max=282.15ms p(90)=27.76ms p(95)=31.45ms p(99.9)=52.95ms
       { expected_response:true }...: avg=19.18ms  min=1.46ms  med=18.31ms max=282.15ms p(90)=27.76ms p(95)=31.45ms p(99.9)=52.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 309091
     http_req_receiving.............: avg=531.22µs min=51.92µs med=98.48µs max=147.62ms p(90)=1.34ms  p(95)=2.14ms  p(99.9)=19.6ms 
     http_req_sending...............: avg=45.32µs  min=4.74µs  med=9.41µs  max=174.46ms p(90)=18.86µs p(95)=93.24µs p(99.9)=3.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.6ms   min=1.37ms  med=17.74ms max=281.54ms p(90)=27.09ms p(95)=30.69ms p(99.9)=51.44ms
     http_reqs......................: 309091  2571.36529/s
     iteration_duration.............: avg=19.4ms   min=2.61ms  med=18.52ms max=290.7ms  p(90)=27.98ms p(95)=31.69ms p(99.9)=53.66ms
     iterations.....................: 308991  2570.533378/s
     success_rate...................: 100.00% ✓ 308991      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 885957      ✗ 0     
     data_received..................: 26 GB   215 MB/s
     data_sent......................: 355 MB  3.0 MB/s
     http_req_blocked...............: avg=3.97µs   min=902ns   med=2.21µs  max=27.13ms  p(90)=3.97µs  p(95)=4.7µs   p(99.9)=37.96µs 
     http_req_connecting............: avg=929ns    min=0s      med=0s      max=27.06ms  p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.08ms  min=1.58ms  med=16.84ms max=407.79ms p(90)=32.99ms p(95)=40.44ms p(99.9)=138.73ms
       { expected_response:true }...: avg=20.08ms  min=1.58ms  med=16.84ms max=407.79ms p(90)=32.99ms p(95)=40.44ms p(99.9)=138.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 295419
     http_req_receiving.............: avg=571.79µs min=50.03µs med=94.49µs max=163.45ms p(90)=1.08ms  p(95)=1.88ms  p(99.9)=28.13ms 
     http_req_sending...............: avg=44.86µs  min=4.55µs  med=8.98µs  max=219.27ms p(90)=18.94µs p(95)=85.63µs p(99.9)=3.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.47ms  min=1.49ms  med=16.32ms max=407.69ms p(90)=31.99ms p(95)=39.29ms p(99.9)=137.31ms
     http_reqs......................: 295419  2457.479482/s
     iteration_duration.............: avg=20.3ms   min=2.8ms   med=17.05ms max=408ms    p(90)=33.22ms p(95)=40.67ms p(99.9)=139.98ms
     iterations.....................: 295319  2456.64762/s
     success_rate...................: 100.00% ✓ 295319      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 863721      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=2.93µs  min=881ns  med=2.09µs  max=12.28ms  p(90)=3.53µs  p(95)=4.24µs   p(99.9)=33.08µs
     http_req_connecting............: avg=346ns   min=0s     med=0s      max=3.7ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.62ms min=1.61ms med=20.44ms max=300.85ms p(90)=28.75ms p(95)=31.07ms  p(99.9)=47.31ms
       { expected_response:true }...: avg=20.62ms min=1.61ms med=20.44ms max=300.85ms p(90)=28.75ms p(95)=31.07ms  p(99.9)=47.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288007
     http_req_receiving.............: avg=79.91µs min=25.6µs med=48.91µs max=108.12ms p(90)=86.96µs p(95)=112.74µs p(99.9)=4.93ms 
     http_req_sending...............: avg=38.32µs min=4.69µs med=9.02µs  max=119.1ms  p(90)=15.62µs p(95)=27.03µs  p(99.9)=2.69ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.5ms  min=1.56ms med=20.33ms max=288.5ms  p(90)=28.62ms p(95)=30.91ms  p(99.9)=46.33ms
     http_reqs......................: 288007  2395.906764/s
     iteration_duration.............: avg=20.83ms min=3.16ms med=20.63ms max=311.63ms p(90)=28.95ms p(95)=31.27ms  p(99.9)=47.89ms
     iterations.....................: 287907  2395.074872/s
     success_rate...................: 100.00% ✓ 287907      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 856887      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=2.86µs   min=902ns   med=2µs     max=14.7ms   p(90)=3.36µs  p(95)=4.01µs  p(99.9)=31.78µs 
     http_req_connecting............: avg=352ns    min=0s      med=0s      max=3.86ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.78ms  min=1.57ms  med=17.28ms max=373.06ms p(90)=34.17ms p(95)=42.2ms  p(99.9)=156.26ms
       { expected_response:true }...: avg=20.78ms  min=1.57ms  med=17.28ms max=373.06ms p(90)=34.17ms p(95)=42.2ms  p(99.9)=156.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 285729
     http_req_receiving.............: avg=609.98µs min=51.68µs med=96.67µs max=280.02ms p(90)=1.13ms  p(95)=1.92ms  p(99.9)=28.47ms 
     http_req_sending...............: avg=40.14µs  min=4.62µs  med=8.61µs  max=193ms    p(90)=15.94µs p(95)=50.22µs p(99.9)=3.29ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=20.13ms  min=1.49ms  med=16.72ms max=372.97ms p(90)=33.13ms p(95)=40.9ms  p(99.9)=154.03ms
     http_reqs......................: 285729  2376.821069/s
     iteration_duration.............: avg=20.99ms  min=2.16ms  med=17.48ms max=373.23ms p(90)=34.4ms  p(95)=42.43ms p(99.9)=157.55ms
     iterations.....................: 285629  2375.989225/s
     success_rate...................: 100.00% ✓ 285629      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 798333      ✗ 0     
     data_received..................: 23 GB   194 MB/s
     data_sent......................: 320 MB  2.7 MB/s
     http_req_blocked...............: avg=3.13µs   min=921ns   med=2.38µs   max=7.43ms   p(90)=3.98µs  p(95)=4.7µs   p(99.9)=40.27µs 
     http_req_connecting............: avg=332ns    min=0s      med=0s       max=3.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.31ms  min=1.87ms  med=18.44ms  max=483ms    p(90)=36.53ms p(95)=45.54ms p(99.9)=179.47ms
       { expected_response:true }...: avg=22.31ms  min=1.87ms  med=18.44ms  max=483ms    p(90)=36.53ms p(95)=45.54ms p(99.9)=179.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266211
     http_req_receiving.............: avg=623.14µs min=52.88µs med=103.88µs max=270.38ms p(90)=1.14ms  p(95)=1.97ms  p(99.9)=29.82ms 
     http_req_sending...............: avg=40.12µs  min=4.59µs  med=9.57µs   max=230.83ms p(90)=18.39µs p(95)=61.46µs p(99.9)=2.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.65ms  min=1.76ms  med=17.86ms  max=482.85ms p(90)=35.49ms p(95)=44.3ms  p(99.9)=177.8ms 
     http_reqs......................: 266211  2214.03341/s
     iteration_duration.............: avg=22.53ms  min=3.09ms  med=18.65ms  max=483.17ms p(90)=36.76ms p(95)=45.79ms p(99.9)=180.2ms 
     iterations.....................: 266111  2213.201727/s
     success_rate...................: 100.00% ✓ 266111      ✗ 0     
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

     checks.........................: 100.00% ✓ 579390      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.31µs  min=871ns  med=2.22µs  max=4.83ms   p(90)=4.42µs  p(95)=5.45µs   p(99.9)=42.77µs
     http_req_connecting............: avg=437ns   min=0s     med=0s      max=3.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.81ms min=2.29ms med=30.32ms max=286.63ms p(90)=40.59ms p(95)=44.06ms  p(99.9)=65.38ms
       { expected_response:true }...: avg=30.81ms min=2.29ms med=30.32ms max=286.63ms p(90)=40.59ms p(95)=44.06ms  p(99.9)=65.38ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193230
     http_req_receiving.............: avg=94.63µs min=27.5µs med=55.08µs max=160.2ms  p(90)=125.7µs p(95)=198.93µs p(99.9)=3.82ms 
     http_req_sending...............: avg=42.01µs min=4.69µs med=9.34µs  max=172.34ms p(90)=24.01µs p(95)=103.45µs p(99.9)=3.11ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.67ms min=2.16ms med=30.21ms max=285.79ms p(90)=40.43ms p(95)=43.88ms  p(99.9)=64.83ms
     http_reqs......................: 193230  1606.33724/s
     iteration_duration.............: avg=31.05ms min=6.81ms med=30.54ms max=317.87ms p(90)=40.81ms p(95)=44.27ms  p(99.9)=65.64ms
     iterations.....................: 193130  1605.505932/s
     success_rate...................: 100.00% ✓ 193130      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 441528      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 177 MB  1.5 MB/s
     http_req_blocked...............: avg=3.3µs   min=952ns   med=2.39µs  max=3.42ms   p(90)=4.04µs   p(95)=4.74µs   p(99.9)=34.58µs 
     http_req_connecting............: avg=576ns   min=0s      med=0s      max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.51ms min=2.07ms  med=40.11ms max=294.31ms p(90)=56.32ms  p(95)=61.21ms  p(99.9)=84.64ms 
       { expected_response:true }...: avg=40.51ms min=2.07ms  med=40.11ms max=294.31ms p(90)=56.32ms  p(95)=61.21ms  p(99.9)=84.64ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147276
     http_req_receiving.............: avg=77.67µs min=26.56µs med=65.06µs max=85.53ms  p(90)=104.77µs p(95)=121.91µs p(99.9)=808.46µs
     http_req_sending...............: avg=26.72µs min=4.82µs  med=11.31µs max=165.07ms p(90)=18.73µs  p(95)=22.5µs   p(99.9)=933.94µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.4ms  min=1.98ms  med=40.01ms max=293.77ms p(90)=56.21ms  p(95)=61.1ms   p(99.9)=84.15ms 
     http_reqs......................: 147276  1224.380771/s
     iteration_duration.............: avg=40.76ms min=3.5ms   med=40.32ms max=302.21ms p(90)=56.54ms  p(95)=61.42ms  p(99.9)=85.25ms 
     iterations.....................: 147176  1223.54942/s
     success_rate...................: 100.00% ✓ 147176      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 212151     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   706 kB/s
     http_req_blocked...............: avg=4.81µs  min=1.27µs  med=3.24µs  max=4.08ms   p(90)=4.8µs    p(95)=5.51µs   p(99.9)=46.51µs 
     http_req_connecting............: avg=1.28µs  min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.48ms min=4.05ms  med=82.18ms max=313.3ms  p(90)=105.23ms p(95)=116.57ms p(99.9)=197.4ms 
       { expected_response:true }...: avg=84.48ms min=4.05ms  med=82.18ms max=313.3ms  p(90)=105.23ms p(95)=116.57ms p(99.9)=197.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 70817
     http_req_receiving.............: avg=86.38µs min=29.69µs med=76.38µs max=140.58ms p(90)=113.3µs  p(95)=127.28µs p(99.9)=703.15µs
     http_req_sending...............: avg=30.07µs min=5.1µs   med=14.97µs max=155.56ms p(90)=21.62µs  p(95)=23.97µs  p(99.9)=633.71µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.36ms min=3.92ms  med=82.07ms max=313.1ms  p(90)=105.11ms p(95)=116.45ms p(99.9)=196.49ms
     http_reqs......................: 70817   587.497182/s
     iteration_duration.............: avg=84.85ms min=22.95ms med=82.44ms max=338.36ms p(90)=105.49ms p(95)=116.89ms p(99.9)=199.18ms
     iterations.....................: 70717   586.667583/s
     success_rate...................: 100.00% ✓ 70717      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 149604     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   497 kB/s
     http_req_blocked...............: avg=5.67µs   min=1.35µs  med=3.53µs   max=3.77ms   p(90)=4.98µs   p(95)=5.58µs   p(99.9)=384.18µs
     http_req_connecting............: avg=1.89µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=80.28µs 
     http_req_duration..............: avg=119.85ms min=5.33ms  med=117.67ms max=330.8ms  p(90)=158.12ms p(95)=170.45ms p(99.9)=222.32ms
       { expected_response:true }...: avg=119.85ms min=5.33ms  med=117.67ms max=330.8ms  p(90)=158.12ms p(95)=170.45ms p(99.9)=222.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49968
     http_req_receiving.............: avg=89.7µs   min=32.46µs med=81.09µs  max=93.71ms  p(90)=113.95µs p(95)=126.65µs p(99.9)=629.93µs
     http_req_sending...............: avg=25.2µs   min=5.88µs  med=16.31µs  max=96.36ms  p(90)=22.04µs  p(95)=23.96µs  p(99.9)=581.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.74ms min=5.19ms  med=117.56ms max=307.62ms p(90)=158.01ms p(95)=170.34ms p(99.9)=222.01ms
     http_reqs......................: 49968   414.079696/s
     iteration_duration.............: avg=120.35ms min=35.46ms med=118.02ms max=344.45ms p(90)=158.42ms p(95)=170.74ms p(99.9)=225.89ms
     iterations.....................: 49868   413.251007/s
     success_rate...................: 100.00% ✓ 49868      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98151      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   326 kB/s
     http_req_blocked...............: avg=6.21µs   min=1.16µs  med=3.16µs   max=3.47ms   p(90)=4.53µs   p(95)=5.12µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=2.78µs   min=0s      med=0s       max=3.42ms   p(90)=0s       p(95)=0s       p(99.9)=1.43ms  
     http_req_duration..............: avg=182.68ms min=6.11ms  med=168.89ms max=635.4ms  p(90)=216.83ms p(95)=261.77ms p(99.9)=552.74ms
       { expected_response:true }...: avg=182.68ms min=6.11ms  med=168.89ms max=635.4ms  p(90)=216.83ms p(95)=261.77ms p(99.9)=552.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32817
     http_req_receiving.............: avg=96.24µs  min=30.73µs med=90.66µs  max=67.06ms  p(90)=121.22µs p(95)=134.14µs p(99.9)=690.41µs
     http_req_sending...............: avg=24.82µs  min=5.21µs  med=18.34µs  max=79ms     p(90)=22.79µs  p(95)=24.57µs  p(99.9)=446.76µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.56ms min=6.02ms  med=168.77ms max=635.31ms p(90)=216.68ms p(95)=261.69ms p(99.9)=552.64ms
     http_reqs......................: 32817   271.323493/s
     iteration_duration.............: avg=183.49ms min=44.91ms med=169.23ms max=635.6ms  p(90)=217.22ms p(95)=263.2ms  p(99.9)=553.05ms
     iterations.....................: 32717   270.496715/s
     success_rate...................: 100.00% ✓ 32717      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97158      ✗ 0    
     data_received..................: 2.8 GB  24 MB/s
     data_sent......................: 39 MB   322 kB/s
     http_req_blocked...............: avg=6.51µs   min=1.51µs  med=3.68µs   max=3.45ms   p(90)=5.06µs   p(95)=5.61µs   p(99.9)=1.26ms  
     http_req_connecting............: avg=2.59µs   min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=184.49ms min=7.91ms  med=184.42ms max=400.08ms p(90)=211.48ms p(95)=217.31ms p(99.9)=293.42ms
       { expected_response:true }...: avg=184.49ms min=7.91ms  med=184.42ms max=400.08ms p(90)=211.48ms p(95)=217.31ms p(99.9)=293.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32486
     http_req_receiving.............: avg=99.52µs  min=34.81µs med=87.97µs  max=98.5ms   p(90)=118.51µs p(95)=130.73µs p(99.9)=572.43µs
     http_req_sending...............: avg=34.69µs  min=6.34µs  med=18.17µs  max=130.45ms p(90)=22.97µs  p(95)=24.96µs  p(99.9)=508.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.36ms min=7.76ms  med=184.31ms max=399.99ms p(90)=211.36ms p(95)=217.17ms p(99.9)=293.24ms
     http_reqs......................: 32486   268.522357/s
     iteration_duration.............: avg=185.34ms min=22.51ms med=184.72ms max=412.82ms p(90)=211.79ms p(95)=217.64ms p(99.9)=294.25ms
     iterations.....................: 32386   267.695779/s
     success_rate...................: 100.00% ✓ 32386      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (5ff8b6165878)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 7302      ✗ 0   
     data_received..................: 243 MB  1.9 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=23.91µs  min=1.46µs   med=3.64µs  max=2.85ms p(90)=5.2µs   p(95)=6.02µs   p(99.9)=2.51ms
     http_req_connecting............: avg=19.45µs  min=0s       med=0s      max=2.8ms  p(90)=0s      p(95)=0s       p(99.9)=2.49ms
     http_req_duration..............: avg=2.39s    min=29.02ms  med=2.4s    max=11.13s p(90)=3.27s   p(95)=3.6s     p(99.9)=9.25s 
       { expected_response:true }...: avg=2.39s    min=29.02ms  med=2.4s    max=11.13s p(90)=3.27s   p(95)=3.6s     p(99.9)=9.25s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2534
     http_req_receiving.............: avg=102.75µs min=34.9µs   med=95.57µs max=4.6ms  p(90)=134.4µs p(95)=151.23µs p(99.9)=1.16ms
     http_req_sending...............: avg=30.51µs  min=6.01µs   med=19.18µs max=2.41ms p(90)=24.71µs p(95)=29.7µs   p(99.9)=1.98ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.39s    min=28.74ms  med=2.4s    max=11.13s p(90)=3.27s   p(95)=3.6s     p(99.9)=9.25s 
     http_reqs......................: 2534    20.100289/s
     iteration_duration.............: avg=2.48s    min=399.09ms med=2.43s   max=11.13s p(90)=3.28s   p(95)=3.62s    p(99.9)=9.3s  
     iterations.....................: 2434    19.307065/s
     success_rate...................: 100.00% ✓ 2434      ✗ 0   
     vus............................: 6       min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

