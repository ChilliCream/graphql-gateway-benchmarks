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
| hive-router | v0.0.49 | 2,943 | 3,146 | 2,890 | 2.8% |  |
| hotchocolate | 16.1.2-p.2 | 2,111 | 2,165 | 2,099 | 1.0% |  |
| grafbase | 0.53.3 | 2,090 | 2,127 | 2,072 | 0.8% |  |
| cosmo | 0.307.0 | 1,287 | 1,301 | 1,275 | 0.9% | non-compatible response (4 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 538 | 552 | 536 | 1.1% |  |
| apollo-router | v2.13.1 | 418 | 432 | 413 | 1.8% |  |
| apollo-gateway | 2.13.3 | 252 | 254 | 251 | 0.4% |  |
| hive-gateway | 2.5.25 | 241 | 244 | 237 | 1.1% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,476 | 2,578 | 2,440 | 1.7% |  |
| hotchocolate | 16.1.2-p.2 | 1,963 | 2,006 | 1,946 | 1.0% |  |
| grafbase | 0.53.3 | 1,529 | 1,560 | 1,512 | 1.1% |  |
| cosmo | 0.307.0 | 1,204 | 1,224 | 1,195 | 0.9% | non-compatible response (3 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 510 | 524 | 507 | 1.2% |  |
| apollo-router | v2.13.1 | 372 | 384 | 368 | 1.6% |  |
| hive-gateway | 2.5.25 | 230 | 234 | 228 | 0.8% |  |
| apollo-gateway | — | — | — | — | — | benchmark run failed |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1061091     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 425 MB  3.5 MB/s
     http_req_blocked...............: avg=2.8µs    min=1.01µs  med=2.02µs  max=17.89ms  p(90)=3.07µs  p(95)=3.69µs   p(99.9)=30.16µs
     http_req_connecting............: avg=293ns    min=0s      med=0s      max=3.88ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.73ms  min=1.64ms  med=15.84ms max=298.71ms p(90)=24.74ms p(95)=28.37ms  p(99.9)=50.45ms
       { expected_response:true }...: avg=16.73ms  min=1.64ms  med=15.84ms max=298.71ms p(90)=24.74ms p(95)=28.37ms  p(99.9)=50.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 353797
     http_req_receiving.............: avg=120.86µs min=27.47µs med=49.58µs max=62.23ms  p(90)=94.94µs p(95)=263.17µs p(99.9)=11.43ms
     http_req_sending...............: avg=56.58µs  min=5.07µs  med=8.82µs  max=82.4ms   p(90)=14.86µs p(95)=119.87µs p(99.9)=8.42ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.55ms  min=1.58ms  med=15.7ms  max=297.99ms p(90)=24.49ms p(95)=28.03ms  p(99.9)=49.15ms
     http_reqs......................: 353797  2943.337061/s
     iteration_duration.............: avg=16.95ms  min=2.11ms  med=16.05ms max=330.8ms  p(90)=24.96ms p(95)=28.61ms  p(99.9)=52.01ms
     iterations.....................: 353697  2942.505132/s
     success_rate...................: 100.00% ✓ 353697      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.2-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 761691      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=2.64µs   min=1.01µs  med=2.11µs   max=6.01ms   p(90)=3.2µs    p(95)=3.74µs   p(99.9)=30.4µs  
     http_req_connecting............: avg=168ns    min=0s      med=0s       max=3.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.39ms  min=2.48ms  med=15.01ms  max=368.57ms p(90)=52.26ms  p(95)=70.32ms  p(99.9)=169.15ms
       { expected_response:true }...: avg=23.39ms  min=2.48ms  med=15.01ms  max=368.57ms p(90)=52.26ms  p(95)=70.32ms  p(99.9)=169.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253997
     http_req_receiving.............: avg=680.04µs min=51.57µs med=106.26µs max=297.7ms  p(90)=974.48µs p(95)=1.51ms   p(99.9)=59.89ms 
     http_req_sending...............: avg=42.84µs  min=5.06µs  med=9.05µs   max=159.85ms p(90)=14.67µs  p(95)=103.72µs p(99.9)=3.42ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.67ms  min=2.35ms  med=14.48ms  max=368.42ms p(90)=50.86ms  p(95)=68.9ms   p(99.9)=164.16ms
     http_reqs......................: 253997  2111.214227/s
     iteration_duration.............: avg=23.62ms  min=3.38ms  med=15.22ms  max=368.77ms p(90)=52.51ms  p(95)=70.56ms  p(99.9)=170.05ms
     iterations.....................: 253897  2110.383031/s
     success_rate...................: 100.00% ✓ 253897      ✗ 0     
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

     checks.........................: 100.00% ✓ 753729      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 302 MB  2.5 MB/s
     http_req_blocked...............: avg=3.15µs   min=972ns   med=2.42µs  max=9.05ms   p(90)=4.04µs   p(95)=4.86µs   p(99.9)=44.79µs
     http_req_connecting............: avg=213ns    min=0s      med=0s      max=2.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.63ms  min=1.98ms  med=23.39ms max=317.49ms p(90)=28.33ms  p(95)=30.68ms  p(99.9)=52.5ms 
       { expected_response:true }...: avg=23.63ms  min=1.98ms  med=23.39ms max=317.49ms p(90)=28.33ms  p(95)=30.68ms  p(99.9)=52.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 251343
     http_req_receiving.............: avg=112.73µs min=30.08µs med=58.82µs max=250.04ms p(90)=104.95µs p(95)=228.01µs p(99.9)=8.52ms 
     http_req_sending...............: avg=49.53µs  min=4.91µs  med=10.59µs max=242.82ms p(90)=18.98µs  p(95)=123.94µs p(99.9)=3.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.46ms  min=1.87ms  med=23.27ms max=317.08ms p(90)=28.16ms  p(95)=30.4ms   p(99.9)=50.96ms
     http_reqs......................: 251343  2090.027591/s
     iteration_duration.............: avg=23.87ms  min=3.91ms  med=23.6ms  max=326.7ms  p(90)=28.56ms  p(95)=30.93ms  p(99.9)=53.07ms
     iterations.....................: 251243  2089.196047/s
     success_rate...................: 100.00% ✓ 251243      ✗ 0     
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

     checks.........................: 100.00% ✓ 464322      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=3.3µs    min=1.04µs  med=2.3µs   max=4.3ms    p(90)=3.71µs  p(95)=4.36µs   p(99.9)=33.77µs
     http_req_connecting............: avg=678ns    min=0s      med=0s      max=4.27ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.52ms  min=2.12ms  med=37.99ms max=343.59ms p(90)=54.34ms p(95)=59.26ms  p(99.9)=82.53ms
       { expected_response:true }...: avg=38.52ms  min=2.12ms  med=37.99ms max=343.59ms p(90)=54.34ms p(95)=59.26ms  p(99.9)=82.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154874
     http_req_receiving.............: avg=105.82µs min=28.99µs med=59.36µs max=253.98ms p(90)=94.91µs p(95)=112.74µs p(99.9)=2.33ms 
     http_req_sending...............: avg=24.44µs  min=5.03µs  med=10.44µs max=64.55ms  p(90)=16.14µs p(95)=20.11µs  p(99.9)=1.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.39ms  min=2.01ms  med=37.89ms max=232.4ms  p(90)=54.23ms p(95)=59.13ms  p(99.9)=82.14ms
     http_reqs......................: 154874  1287.720504/s
     iteration_duration.............: avg=38.75ms  min=4ms     med=38.2ms  max=361.98ms p(90)=54.55ms p(95)=59.46ms  p(99.9)=82.96ms
     iterations.....................: 154774  1286.88904/s
     success_rate...................: 100.00% ✓ 154774      ✗ 0     
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

     checks.........................: 100.00% ✓ 194589     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   647 kB/s
     http_req_blocked...............: avg=4.65µs  min=1.16µs  med=2.81µs  max=4.2ms    p(90)=4.33µs   p(95)=4.93µs   p(99.9)=46.23µs 
     http_req_connecting............: avg=1.55µs  min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.13ms min=4.16ms  med=89.47ms max=351.64ms p(90)=110.98ms p(95)=122.9ms  p(99.9)=218.77ms
       { expected_response:true }...: avg=92.13ms min=4.16ms  med=89.47ms max=351.64ms p(90)=110.98ms p(95)=122.9ms  p(99.9)=218.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64963
     http_req_receiving.............: avg=83.24µs min=32.56µs med=74.78µs max=41.19ms  p(90)=108.52µs p(95)=120.95µs p(99.9)=826.17µs
     http_req_sending...............: avg=24.23µs min=5.83µs  med=12.76µs max=174.47ms p(90)=19.11µs  p(95)=21.47µs  p(99.9)=655.06µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.03ms min=4.07ms  med=89.37ms max=350.92ms p(90)=110.87ms p(95)=122.72ms p(99.9)=218.46ms
     http_reqs......................: 64963   538.901669/s
     iteration_duration.............: avg=92.52ms min=22.65ms med=89.7ms  max=382.95ms p(90)=111.22ms p(95)=123.2ms  p(99.9)=221.34ms
     iterations.....................: 64863   538.072117/s
     success_rate...................: 100.00% ✓ 64863      ✗ 0    
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

     checks.........................: 100.00% ✓ 151086     ✗ 0    
     data_received..................: 4.4 GB  37 MB/s
     data_sent......................: 61 MB   502 kB/s
     http_req_blocked...............: avg=5.42µs   min=1.06µs  med=3.21µs   max=4.14ms   p(90)=4.61µs   p(95)=5.15µs   p(99.9)=114.26µs
     http_req_connecting............: avg=2.03µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=47.86µs 
     http_req_duration..............: avg=118.68ms min=5.52ms  med=118.38ms max=372.15ms p(90)=143.42ms p(95)=150.93ms p(99.9)=187.07ms
       { expected_response:true }...: avg=118.68ms min=5.52ms  med=118.38ms max=372.15ms p(90)=143.42ms p(95)=150.93ms p(99.9)=187.07ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 50462
     http_req_receiving.............: avg=181.92µs min=28.99µs med=80.57µs  max=211.36ms p(90)=112.67µs p(95)=124.86µs p(99.9)=1.97ms  
     http_req_sending...............: avg=24.86µs  min=5.82µs  med=14.6µs   max=199ms    p(90)=20.33µs  p(95)=22.18µs  p(99.9)=580.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.47ms min=5.41ms  med=118.27ms max=206.67ms p(90)=143.29ms p(95)=150.77ms p(99.9)=180.43ms
     http_reqs......................: 50462   418.122023/s
     iteration_duration.............: avg=119.16ms min=6.87ms  med=118.65ms max=381.85ms p(90)=143.67ms p(95)=151.23ms p(99.9)=188.51ms
     iterations.....................: 50362   417.293435/s
     success_rate...................: 100.00% ✓ 50362      ✗ 0    
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

     checks.........................: 100.00% ✓ 91524      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=6.76µs   min=1.31µs  med=3.32µs   max=3.97ms   p(90)=4.64µs   p(95)=5.17µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=3.27µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=195.85ms min=8.5ms   med=201.97ms max=420ms    p(90)=221.03ms p(95)=229.39ms p(99.9)=300.14ms
       { expected_response:true }...: avg=195.85ms min=8.5ms   med=201.97ms max=420ms    p(90)=221.03ms p(95)=229.39ms p(99.9)=300.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30608
     http_req_receiving.............: avg=94.98µs  min=32.96µs med=90.23µs  max=17.72ms  p(90)=121.85µs p(95)=134.94µs p(99.9)=634.51µs
     http_req_sending...............: avg=25.54µs  min=5.94µs  med=16.62µs  max=127.54ms p(90)=21.24µs  p(95)=23.01µs  p(99.9)=559.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.73ms min=8.36ms  med=201.85ms max=419.35ms p(90)=220.94ms p(95)=229.28ms p(99.9)=300.02ms
     http_reqs......................: 30608   252.79824/s
     iteration_duration.............: avg=196.78ms min=68.15ms med=202.23ms max=437.33ms p(90)=221.31ms p(95)=229.67ms p(99.9)=304.03ms
     iterations.....................: 30508   251.972317/s
     success_rate...................: 100.00% ✓ 30508      ✗ 0    
     vus............................: 35      min=35       max=50 
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

     checks.........................: 100.00% ✓ 87360      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=5.15µs   min=1.32µs  med=3.46µs   max=1.94ms   p(90)=4.93µs   p(95)=5.57µs   p(99.9)=698.27µs
     http_req_connecting............: avg=1.45µs   min=0s      med=0s       max=1.91ms   p(90)=0s       p(95)=0s       p(99.9)=653.52µs
     http_req_duration..............: avg=205.22ms min=6.3ms   med=185.8ms  max=713.31ms p(90)=242.6ms  p(95)=445.19ms p(99.9)=595.2ms 
       { expected_response:true }...: avg=205.22ms min=6.3ms   med=185.8ms  max=713.31ms p(90)=242.6ms  p(95)=445.19ms p(99.9)=595.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29220
     http_req_receiving.............: avg=135.02µs min=36.53µs med=95.39µs  max=148.51ms p(90)=127.87µs p(95)=141.62µs p(99.9)=847.09µs
     http_req_sending...............: avg=26.68µs  min=6.29µs  med=17.3µs   max=97.26ms  p(90)=22.63µs  p(95)=24.61µs  p(99.9)=582.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.06ms min=6.22ms  med=185.67ms max=713.2ms  p(90)=242.48ms p(95)=445.08ms p(99.9)=595.06ms
     http_reqs......................: 29220   241.48123/s
     iteration_duration.............: avg=206.2ms  min=45.81ms med=186.18ms max=713.53ms p(90)=243.2ms  p(95)=445.91ms p(99.9)=595.45ms
     iterations.....................: 29120   240.654805/s
     success_rate...................: 100.00% ✓ 29120      ✗ 0    
     vus............................: 5       min=5        max=50 
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

     checks.........................: 100.00% ✓ 892746      ✗ 0     
     data_received..................: 26 GB   217 MB/s
     data_sent......................: 358 MB  3.0 MB/s
     http_req_blocked...............: avg=3.25µs   min=1.03µs  med=2.21µs  max=20.33ms  p(90)=3.72µs   p(95)=4.57µs   p(99.9)=38.52µs
     http_req_connecting............: avg=332ns    min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.91ms  min=1.64ms  med=19.29ms max=343.45ms p(90)=27.7ms   p(95)=30.97ms  p(99.9)=53.68ms
       { expected_response:true }...: avg=19.91ms  min=1.64ms  med=19.29ms max=343.45ms p(90)=27.7ms   p(95)=30.97ms  p(99.9)=53.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 297682
     http_req_receiving.............: avg=122.88µs min=27.86µs med=52.89µs max=238.45ms p(90)=105.55µs p(95)=276.8µs  p(99.9)=9.91ms 
     http_req_sending...............: avg=58.78µs  min=5.28µs  med=9.56µs  max=128.74ms p(90)=18.23µs  p(95)=126.97µs p(99.9)=8.19ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.73ms  min=1.58ms  med=19.14ms max=333.59ms p(90)=27.48ms  p(95)=30.65ms  p(99.9)=52.37ms
     http_reqs......................: 297682  2476.361736/s
     iteration_duration.............: avg=20.15ms  min=3.64ms  med=19.51ms max=355.62ms p(90)=27.93ms  p(95)=31.22ms  p(99.9)=54.21ms
     iterations.....................: 297582  2475.529855/s
     success_rate...................: 100.00% ✓ 297582      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.2-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 707868      ✗ 0     
     data_received..................: 21 GB   172 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=3.35µs   min=982ns   med=2.15µs   max=16.36ms  p(90)=3.53µs  p(95)=4.24µs   p(99.9)=31.51µs 
     http_req_connecting............: avg=750ns    min=0s      med=0s       max=6.55ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.18ms  min=1.84ms  med=17.02ms  max=588.41ms p(90)=53.69ms p(95)=70.72ms  p(99.9)=188.34ms
       { expected_response:true }...: avg=25.18ms  min=1.84ms  med=17.02ms  max=588.41ms p(90)=53.69ms p(95)=70.72ms  p(99.9)=188.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236056
     http_req_receiving.............: avg=695.71µs min=51.66µs med=109.11µs max=191.27ms p(90)=1.13ms  p(95)=1.78ms   p(99.9)=57.76ms 
     http_req_sending...............: avg=44.54µs  min=5.15µs  med=9.4µs    max=147.37ms p(90)=17.28µs p(95)=111.15µs p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.44ms  min=1.73ms  med=16.47ms  max=588.33ms p(90)=52.4ms  p(95)=69.27ms  p(99.9)=184.23ms
     http_reqs......................: 236056  1963.240569/s
     iteration_duration.............: avg=25.42ms  min=2.53ms  med=17.23ms  max=588.6ms  p(90)=53.93ms p(95)=70.98ms  p(99.9)=191.41ms
     iterations.....................: 235956  1962.408885/s
     success_rate...................: 100.00% ✓ 235956      ✗ 0     
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

     checks.........................: 100.00% ✓ 551649      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.37µs   min=982ns   med=2.25µs  max=3.9ms    p(90)=4.43µs   p(95)=5.62µs   p(99.9)=47.85µs
     http_req_connecting............: avg=542ns    min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.35ms  min=2.22ms  med=31.5ms  max=321.7ms  p(90)=43.16ms  p(95)=48.05ms  p(99.9)=87.6ms 
       { expected_response:true }...: avg=32.35ms  min=2.22ms  med=31.5ms  max=321.7ms  p(90)=43.16ms  p(95)=48.05ms  p(99.9)=87.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 183983
     http_req_receiving.............: avg=112.52µs min=30.24µs med=59.49µs max=177.45ms p(90)=131.75µs p(95)=277.27µs p(99.9)=6.11ms 
     http_req_sending...............: avg=45.68µs  min=5.3µs   med=9.95µs  max=177.03ms p(90)=23.5µs   p(95)=131.67µs p(99.9)=3.38ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.19ms  min=2.16ms  med=31.37ms max=320.92ms p(90)=42.97ms  p(95)=47.81ms  p(99.9)=87.31ms
     http_reqs......................: 183983  1529.474702/s
     iteration_duration.............: avg=32.62ms  min=4.57ms  med=31.74ms max=351.32ms p(90)=43.4ms   p(95)=48.28ms  p(99.9)=89.26ms
     iterations.....................: 183883  1528.643389/s
     success_rate...................: 100.00% ✓ 183883      ✗ 0     
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

     checks.........................: 100.00% ✓ 434346      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.19µs  min=1.07µs  med=2.32µs  max=3.18ms   p(90)=3.88µs   p(95)=4.55µs   p(99.9)=31.38µs
     http_req_connecting............: avg=504ns   min=0s      med=0s      max=3.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.18ms min=2.17ms  med=40.67ms max=320.13ms p(90)=57.86ms  p(95)=63.08ms  p(99.9)=88.4ms 
       { expected_response:true }...: avg=41.18ms min=2.17ms  med=40.67ms max=320.13ms p(90)=57.86ms  p(95)=63.08ms  p(99.9)=88.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144882
     http_req_receiving.............: avg=83.48µs min=28.43µs med=63.78µs max=23.33ms  p(90)=101.96µs p(95)=121.78µs p(99.9)=1.97ms 
     http_req_sending...............: avg=29.42µs min=5.43µs  med=10.86µs max=271.93ms p(90)=17.46µs  p(95)=21.31µs  p(99.9)=1.37ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.07ms min=2.11ms  med=40.56ms max=319.02ms p(90)=57.74ms  p(95)=62.95ms  p(99.9)=87.98ms
     http_reqs......................: 144882  1204.458895/s
     iteration_duration.............: avg=41.43ms min=4.05ms  med=40.88ms max=340.5ms  p(90)=58.07ms  p(95)=63.29ms  p(99.9)=89.19ms
     iterations.....................: 144782  1203.627557/s
     success_rate...................: 100.00% ✓ 144782      ✗ 0     
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

     checks.........................: 100.00% ✓ 184485     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 74 MB   613 kB/s
     http_req_blocked...............: avg=5.95µs  min=1.09µs  med=2.72µs  max=8.41ms   p(90)=4.26µs   p(95)=4.81µs   p(99.9)=62.28µs 
     http_req_connecting............: avg=2.82µs  min=0s      med=0s      max=8.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.2ms  min=4.23ms  med=95.82ms max=326.42ms p(90)=121.5ms  p(95)=135.07ms p(99.9)=229.66ms
       { expected_response:true }...: avg=97.2ms  min=4.23ms  med=95.82ms max=326.42ms p(90)=121.5ms  p(95)=135.07ms p(99.9)=229.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61595
     http_req_receiving.............: avg=96.25µs min=31.41µs med=77.96µs max=155.16ms p(90)=112.23µs p(95)=124.59µs p(99.9)=844.6µs 
     http_req_sending...............: avg=23.91µs min=5.42µs  med=12.82µs max=160.84ms p(90)=19.31µs  p(95)=21.4µs   p(99.9)=984.53µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.07ms min=4.11ms  med=95.71ms max=324.93ms p(90)=121.38ms p(95)=134.89ms p(99.9)=229.56ms
     http_reqs......................: 61595   510.705668/s
     iteration_duration.............: avg=97.59ms min=25.77ms med=96.06ms max=335.94ms p(90)=121.75ms p(95)=135.38ms p(99.9)=231.53ms
     iterations.....................: 61495   509.876534/s
     success_rate...................: 100.00% ✓ 61495      ✗ 0    
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

     checks.........................: 100.00% ✓ 134748     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   448 kB/s
     http_req_blocked...............: avg=5.97µs   min=1.16µs  med=3.39µs   max=4.21ms   p(90)=4.84µs   p(95)=5.39µs   p(99.9)=476.46µs
     http_req_connecting............: avg=2.36µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=438.15µs
     http_req_duration..............: avg=133.07ms min=5.9ms   med=130.41ms max=351.52ms p(90)=176.39ms p(95)=189.75ms p(99.9)=247.85ms
       { expected_response:true }...: avg=133.07ms min=5.9ms   med=130.41ms max=351.52ms p(90)=176.39ms p(95)=189.75ms p(99.9)=247.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45016
     http_req_receiving.............: avg=92.23µs  min=32.5µs  med=84.7µs   max=84.23ms  p(90)=116.11µs p(95)=127.6µs  p(99.9)=724.37µs
     http_req_sending...............: avg=31.29µs  min=5.64µs  med=15.71µs  max=202.41ms p(90)=21µs     p(95)=22.82µs  p(99.9)=560.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=132.95ms min=5.77ms  med=130.3ms  max=350.89ms p(90)=176.25ms p(95)=189.61ms p(99.9)=247.09ms
     http_reqs......................: 45016   372.750556/s
     iteration_duration.............: avg=133.63ms min=33.69ms med=130.75ms max=362.61ms p(90)=176.67ms p(95)=190.08ms p(99.9)=252.29ms
     iterations.....................: 44916   371.922516/s
     success_rate...................: 100.00% ✓ 44916      ✗ 0    
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

     checks.........................: 100.00% ✓ 83478      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 34 MB   277 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.29µs  med=3.45µs   max=4.18ms   p(90)=4.82µs   p(95)=5.41µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=3.73µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.88ms  
     http_req_duration..............: avg=214.71ms min=6.65ms  med=195.84ms max=788.88ms p(90)=248.91ms p(95)=463.42ms p(99.9)=592.94ms
       { expected_response:true }...: avg=214.71ms min=6.65ms  med=195.84ms max=788.88ms p(90)=248.91ms p(95)=463.42ms p(99.9)=592.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27926
     http_req_receiving.............: avg=133.47µs min=34.92µs med=95.44µs  max=131.61ms p(90)=126.58µs p(95)=139.54µs p(99.9)=935.2µs 
     http_req_sending...............: avg=37.95µs  min=6.15µs  med=17.45µs  max=124.29ms p(90)=22.18µs  p(95)=23.88µs  p(99.9)=640.46µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=214.53ms min=6.53ms  med=195.7ms  max=788.73ms p(90)=248.8ms  p(95)=463.31ms p(99.9)=592.81ms
     http_reqs......................: 27926   230.871365/s
     iteration_duration.............: avg=215.77ms min=40.61ms med=196.26ms max=789.12ms p(90)=249.47ms p(95)=463.78ms p(99.9)=593.39ms
     iterations.....................: 27826   230.044639/s
     success_rate...................: 100.00% ✓ 27826      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

