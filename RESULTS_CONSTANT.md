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
| hive-router | v0.0.43 | 2,957 | 3,101 | 2,949 | 1.7% |  |
| hotchocolate | 16.1.0-p.1.2 | 2,152 | 2,184 | 2,141 | 0.6% |  |
| grafbase | 0.53.2 | 1,993 | 2,074 | 1,983 | 1.6% |  |
| cosmo | 0.298.0 | 1,263 | 1,278 | 1,250 | 0.8% | non-compatible response (5 across 3/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 618 | 630 | 612 | 0.8% |  |
| apollo-router | v2.12.1 | 423 | 432 | 421 | 0.9% |  |
| hive-gateway | 2.5.14 | 270 | 274 | 268 | 0.9% |  |
| apollo-gateway | 2.13.3 | 254 | 255 | 252 | 0.4% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,514 | 2,623 | 2,489 | 1.8% |  |
| hotchocolate | 16.1.0-p.1.2 | 1,987 | 2,032 | 1,975 | 0.9% |  |
| grafbase | 0.53.2 | 1,514 | 1,548 | 1,503 | 0.9% |  |
| cosmo | 0.298.0 | 1,212 | 1,232 | 1,204 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.14 | 597 | 610 | 592 | 0.9% |  |
| apollo-router | v2.12.1 | 398 | 407 | 395 | 1.1% |  |
| hive-gateway | 2.5.14 | 276 | 278 | 272 | 0.7% |  |
| apollo-gateway | 2.13.3 | 239 | 240 | 235 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1066317     ✗ 0     
     data_received..................: 31 GB   259 MB/s
     data_sent......................: 427 MB  3.6 MB/s
     http_req_blocked...............: avg=2.75µs  min=992ns   med=2.03µs  max=10.2ms   p(90)=3.1µs   p(95)=3.72µs   p(99.9)=26.96µs
     http_req_connecting............: avg=329ns   min=0s      med=0s      max=4.12ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.64ms min=1.62ms  med=15.69ms max=328.83ms p(90)=24.77ms p(95)=28.6ms   p(99.9)=51.87ms
       { expected_response:true }...: avg=16.64ms min=1.62ms  med=15.69ms max=328.83ms p(90)=24.77ms p(95)=28.6ms   p(99.9)=51.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 355539
     http_req_receiving.............: avg=127.9µs min=27.99µs med=49.55µs max=150.67ms p(90)=95.54µs p(95)=269.43µs p(99.9)=12.21ms
     http_req_sending...............: avg=61.05µs min=5.13µs  med=9.04µs  max=150.36ms p(90)=15.1µs  p(95)=119.67µs p(99.9)=11.99ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.45ms min=1.58ms  med=15.54ms max=328.28ms p(90)=24.5ms  p(95)=28.22ms  p(99.9)=50.49ms
     http_reqs......................: 355539  2957.880326/s
     iteration_duration.............: avg=16.87ms min=2.22ms  med=15.89ms max=340.4ms  p(90)=25ms    p(95)=28.86ms  p(99.9)=52.91ms
     iterations.....................: 355439  2957.048384/s
     success_rate...................: 100.00% ✓ 355439      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 776382      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=2.75µs  min=1.01µs  med=2µs      max=42.75ms  p(90)=3.01µs   p(95)=3.56µs   p(99.9)=28.7µs  
     http_req_connecting............: avg=213ns   min=0s      med=0s       max=2.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.95ms min=2.48ms  med=14.46ms  max=333.58ms p(90)=51.86ms  p(95)=70.21ms  p(99.9)=163.55ms
       { expected_response:true }...: avg=22.95ms min=2.48ms  med=14.46ms  max=333.58ms p(90)=51.86ms  p(95)=70.21ms  p(99.9)=163.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258894
     http_req_receiving.............: avg=662.3µs min=51.59µs med=103.01µs max=301.29ms p(90)=957.69µs p(95)=1.48ms   p(99.9)=65.08ms 
     http_req_sending...............: avg=41.15µs min=5.03µs  med=8.96µs   max=127.3ms  p(90)=14.68µs  p(95)=104.64µs p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.24ms min=2.35ms  med=13.96ms  max=323.51ms p(90)=50.49ms  p(95)=68.76ms  p(99.9)=161.01ms
     http_reqs......................: 258894  2152.116948/s
     iteration_duration.............: avg=23.17ms min=3.41ms  med=14.67ms  max=343.22ms p(90)=52.1ms   p(95)=70.45ms  p(99.9)=164.73ms
     iterations.....................: 258794  2151.285675/s
     success_rate...................: 100.00% ✓ 258794      ✗ 0     
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

     checks.........................: 100.00% ✓ 718926      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.18µs   min=1.02µs  med=2.17µs  max=13.19ms  p(90)=3.44µs  p(95)=4.13µs  p(99.9)=36.83µs
     http_req_connecting............: avg=449ns    min=0s      med=0s      max=4.4ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=24.79ms  min=1.96ms  med=24.53ms max=324.79ms p(90)=29.7ms  p(95)=31.9ms  p(99.9)=54.2ms 
       { expected_response:true }...: avg=24.79ms  min=1.96ms  med=24.53ms max=324.79ms p(90)=29.7ms  p(95)=31.9ms  p(99.9)=54.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 239742
     http_req_receiving.............: avg=107.16µs min=29.09µs med=58.74µs max=80.4ms   p(90)=98.77µs p(95)=170.3µs p(99.9)=7.94ms 
     http_req_sending...............: avg=43.53µs  min=4.84µs  med=9.88µs  max=155.54ms p(90)=15.95µs p(95)=97.58µs p(99.9)=3.2ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=24.64ms  min=1.86ms  med=24.41ms max=301.49ms p(90)=29.54ms p(95)=31.67ms p(99.9)=52.93ms
     http_reqs......................: 239742  1993.735788/s
     iteration_duration.............: avg=25.02ms  min=4.18ms  med=24.73ms max=350.81ms p(90)=29.92ms p(95)=32.13ms p(99.9)=54.77ms
     iterations.....................: 239642  1992.904171/s
     success_rate...................: 100.00% ✓ 239642      ✗ 0     
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

     checks.........................: 100.00% ✓ 455562      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.12µs  min=1.02µs  med=2.05µs  max=4.88ms   p(90)=3.22µs  p(95)=3.82µs   p(99.9)=30.58µs
     http_req_connecting............: avg=735ns   min=0s      med=0s      max=4.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.27ms min=2.02ms  med=38.73ms max=324.89ms p(90)=55.56ms p(95)=60.63ms  p(99.9)=84.34ms
       { expected_response:true }...: avg=39.27ms min=2.02ms  med=38.73ms max=324.89ms p(90)=55.56ms p(95)=60.63ms  p(99.9)=84.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151954
     http_req_receiving.............: avg=79.73µs min=28.37µs med=57.61µs max=141.67ms p(90)=91.86µs p(95)=109.65µs p(99.9)=1.95ms 
     http_req_sending...............: avg=28.69µs min=5.23µs  med=9.72µs  max=271.61ms p(90)=14.52µs p(95)=18.62µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.16ms min=1.96ms  med=38.63ms max=324.58ms p(90)=55.44ms p(95)=60.49ms  p(99.9)=83.59ms
     http_reqs......................: 151954  1263.512923/s
     iteration_duration.............: avg=39.5ms  min=3.99ms  med=38.94ms max=337.77ms p(90)=55.75ms p(95)=60.83ms  p(99.9)=84.76ms
     iterations.....................: 151854  1262.681413/s
     success_rate...................: 100.00% ✓ 151854      ✗ 0     
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

     checks.........................: 100.00% ✓ 223341     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 90 MB   743 kB/s
     http_req_blocked...............: avg=4.41µs  min=1.16µs  med=2.66µs  max=4.67ms   p(90)=4.15µs   p(95)=4.76µs   p(99.9)=43.17µs 
     http_req_connecting............: avg=1.41µs  min=0s      med=0s      max=4.62ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.26ms min=3.65ms  med=77.88ms max=332.15ms p(90)=97.21ms  p(95)=106.42ms p(99.9)=201.31ms
       { expected_response:true }...: avg=80.26ms min=3.65ms  med=77.88ms max=332.15ms p(90)=97.21ms  p(95)=106.42ms p(99.9)=201.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74547
     http_req_receiving.............: avg=82.93µs min=30.94µs med=73.8µs  max=38.82ms  p(90)=109.09µs p(95)=122.55µs p(99.9)=894.35µs
     http_req_sending...............: avg=23.56µs min=5.79µs  med=12.25µs max=166.99ms p(90)=18.7µs   p(95)=21.09µs  p(99.9)=651.64µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.15ms min=3.59ms  med=77.78ms max=315.32ms p(90)=97.11ms  p(95)=106.32ms p(99.9)=200.92ms
     http_reqs......................: 74547   618.683428/s
     iteration_duration.............: avg=80.6ms  min=17.37ms med=78.11ms max=369.05ms p(90)=97.44ms  p(95)=106.68ms p(99.9)=202.89ms
     iterations.....................: 74447   617.853504/s
     success_rate...................: 100.00% ✓ 74447      ✗ 0    
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

     checks.........................: 100.00% ✓ 153204     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 61 MB   509 kB/s
     http_req_blocked...............: avg=4.77µs   min=1.19µs  med=3.37µs   max=3.44ms   p(90)=4.8µs    p(95)=5.37µs   p(99.9)=159.99µs
     http_req_connecting............: avg=1.19µs   min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=117.03ms min=5.58ms  med=116.83ms max=330.88ms p(90)=141.22ms p(95)=148.51ms p(99.9)=182.19ms
       { expected_response:true }...: avg=117.03ms min=5.58ms  med=116.83ms max=330.88ms p(90)=141.22ms p(95)=148.51ms p(99.9)=182.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51168
     http_req_receiving.............: avg=89.97µs  min=32.22µs med=85.32µs  max=8.84ms   p(90)=116.23µs p(95)=128.07µs p(99.9)=688.91µs
     http_req_sending...............: avg=25.65µs  min=5.57µs  med=15.76µs  max=133.68ms p(90)=20.97µs  p(95)=22.85µs  p(99.9)=611.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.92ms min=5.44ms  med=116.72ms max=330.67ms p(90)=141.11ms p(95)=148.37ms p(99.9)=181.68ms
     http_reqs......................: 51168   423.885557/s
     iteration_duration.............: avg=117.52ms min=19.41ms med=117.11ms max=339.68ms p(90)=141.49ms p(95)=148.78ms p(99.9)=184.15ms
     iterations.....................: 51068   423.057138/s
     success_rate...................: 100.00% ✓ 51068      ✗ 0    
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

     checks.........................: 100.00% ✓ 97791      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.91µs   min=1.28µs  med=3.41µs   max=4.54ms   p(90)=4.8µs    p(95)=5.39µs   p(99.9)=1.43ms  
     http_req_connecting............: avg=3.28µs   min=0s      med=0s       max=4.49ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=183.34ms min=5.87ms  med=172.34ms max=626.78ms p(90)=220.03ms p(95)=375.48ms p(99.9)=539.58ms
       { expected_response:true }...: avg=183.34ms min=5.87ms  med=172.34ms max=626.78ms p(90)=220.03ms p(95)=375.48ms p(99.9)=539.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32697
     http_req_receiving.............: avg=98.91µs  min=33.86µs med=92.49µs  max=39.93ms  p(90)=124.84µs p(95)=137.8µs  p(99.9)=859.44µs
     http_req_sending...............: avg=27.72µs  min=6.09µs  med=16.66µs  max=127.6ms  p(90)=21.91µs  p(95)=23.81µs  p(99.9)=647.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.22ms min=5.74ms  med=172.22ms max=626.67ms p(90)=219.91ms p(95)=375.34ms p(99.9)=539.43ms
     http_reqs......................: 32697   270.286375/s
     iteration_duration.............: avg=184.18ms min=32.7ms  med=172.72ms max=627ms    p(90)=220.51ms p(95)=376.82ms p(99.9)=539.79ms
     iterations.....................: 32597   269.459736/s
     success_rate...................: 100.00% ✓ 32597      ✗ 0    
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

     checks.........................: 100.00% ✓ 92049      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=11.86µs  min=1.28µs  med=3.21µs   max=8.62ms   p(90)=4.44µs   p(95)=4.94µs   p(99.9)=4.93ms  
     http_req_connecting............: avg=8.37µs   min=0s      med=0s       max=8.59ms   p(90)=0s       p(95)=0s       p(99.9)=4.73ms  
     http_req_duration..............: avg=194.74ms min=8.36ms  med=201.21ms max=400.7ms  p(90)=218.08ms p(95)=224.73ms p(99.9)=291.83ms
       { expected_response:true }...: avg=194.74ms min=8.36ms  med=201.21ms max=400.7ms  p(90)=218.08ms p(95)=224.73ms p(99.9)=291.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30783
     http_req_receiving.............: avg=101.85µs min=32.05µs med=89.22µs  max=177.62ms p(90)=119.98µs p(95)=131.67µs p(99.9)=816.52µs
     http_req_sending...............: avg=35.86µs  min=5.82µs  med=15.7µs   max=199.5ms  p(90)=20.47µs  p(95)=22.21µs  p(99.9)=3.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.6ms  min=8.22ms  med=201.1ms  max=395.29ms p(90)=217.96ms p(95)=224.62ms p(99.9)=291ms   
     http_reqs......................: 30783   254.284786/s
     iteration_duration.............: avg=195.66ms min=30.56ms med=201.47ms max=416.99ms p(90)=218.35ms p(95)=225.01ms p(99.9)=297.6ms 
     iterations.....................: 30683   253.45873/s
     success_rate...................: 100.00% ✓ 30683      ✗ 0    
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

     checks.........................: 100.00% ✓ 906621      ✗ 0     
     data_received..................: 26 GB   220 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=5.23µs  min=1.03µs  med=2.21µs  max=158.98ms p(90)=3.71µs   p(95)=4.54µs   p(99.9)=34.79µs
     http_req_connecting............: avg=2.36µs  min=0s      med=0s      max=158.94ms p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.6ms  min=1.78ms  med=18.98ms max=307.51ms p(90)=27.29ms  p(95)=30.74ms  p(99.9)=53.6ms 
       { expected_response:true }...: avg=19.6ms  min=1.78ms  med=18.98ms max=307.51ms p(90)=27.29ms  p(95)=30.74ms  p(99.9)=53.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 302307
     http_req_receiving.............: avg=117.5µs min=28.26µs med=52.59µs max=79.53ms  p(90)=105.37µs p(95)=271.07µs p(99.9)=9.08ms 
     http_req_sending...............: avg=59.87µs min=5.1µs   med=9.7µs   max=141.33ms p(90)=18.38µs  p(95)=126.32µs p(99.9)=8.86ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.42ms min=1.67ms  med=18.83ms max=248.99ms p(90)=27.08ms  p(95)=30.42ms  p(99.9)=52.39ms
     http_reqs......................: 302307  2514.599215/s
     iteration_duration.............: avg=19.84ms min=3.51ms  med=19.19ms max=335.84ms p(90)=27.52ms  p(95)=30.99ms  p(99.9)=54.35ms
     iterations.....................: 302207  2513.767411/s
     success_rate...................: 100.00% ✓ 302207      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 716685      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 287 MB  2.4 MB/s
     http_req_blocked...............: avg=5.36µs   min=1.02µs  med=2.12µs   max=31.73ms  p(90)=3.48µs  p(95)=4.23µs   p(99.9)=36.18µs 
     http_req_connecting............: avg=2.63µs   min=0s      med=0s       max=31.7ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.86ms  min=1.91ms  med=17.19ms  max=658.79ms p(90)=51.88ms p(95)=68.53ms  p(99.9)=192.97ms
       { expected_response:true }...: avg=24.86ms  min=1.91ms  med=17.19ms  max=658.79ms p(90)=51.88ms p(95)=68.53ms  p(99.9)=192.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 238995
     http_req_receiving.............: avg=671.65µs min=51.17µs med=103.05µs max=166.8ms  p(90)=1.13ms  p(95)=1.84ms   p(99.9)=58.66ms 
     http_req_sending...............: avg=45.21µs  min=5.24µs  med=9.33µs   max=123.16ms p(90)=17.64µs p(95)=110.18µs p(99.9)=3.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.15ms  min=1.78ms  med=16.65ms  max=658.39ms p(90)=50.62ms p(95)=67.06ms  p(99.9)=190.51ms
     http_reqs......................: 238995  1987.575693/s
     iteration_duration.............: avg=25.1ms   min=2.72ms  med=17.42ms  max=658.93ms p(90)=52.11ms p(95)=68.77ms  p(99.9)=200.76ms
     iterations.....................: 238895  1986.744054/s
     success_rate...................: 100.00% ✓ 238895      ✗ 0     
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

     checks.........................: 100.00% ✓ 546237      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 219 MB  1.8 MB/s
     http_req_blocked...............: avg=3.61µs   min=982ns   med=2.33µs  max=9.76ms   p(90)=4.58µs   p(95)=5.71µs   p(99.9)=46.32µs
     http_req_connecting............: avg=594ns    min=0s      med=0s      max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.67ms  min=2.3ms   med=31.64ms max=309.25ms p(90)=43.58ms  p(95)=48.67ms  p(99.9)=89.68ms
       { expected_response:true }...: avg=32.67ms  min=2.3ms   med=31.64ms max=309.25ms p(90)=43.58ms  p(95)=48.67ms  p(99.9)=89.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 182179
     http_req_receiving.............: avg=111.95µs min=30.65µs med=60.75µs max=134.37ms p(90)=132.21µs p(95)=274.71µs p(99.9)=5.47ms 
     http_req_sending...............: avg=46.34µs  min=5.39µs  med=10.39µs max=253.73ms p(90)=23.77µs  p(95)=131.99µs p(99.9)=3.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.52ms  min=2.19ms  med=31.5ms  max=308.64ms p(90)=43.4ms   p(95)=48.44ms  p(99.9)=89.24ms
     http_reqs......................: 182179  1514.500105/s
     iteration_duration.............: avg=32.94ms  min=5.37ms  med=31.87ms max=360.95ms p(90)=43.82ms  p(95)=48.91ms  p(99.9)=91.13ms
     iterations.....................: 182079  1513.66878/s
     success_rate...................: 100.00% ✓ 182079      ✗ 0     
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

     checks.........................: 100.00% ✓ 437388      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.36µs  min=1.04µs  med=2.3µs   max=4.21ms   p(90)=3.84µs   p(95)=4.53µs   p(99.9)=35.42µs
     http_req_connecting............: avg=691ns   min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.9ms  min=2.24ms  med=40.36ms max=332.97ms p(90)=57.44ms  p(95)=62.65ms  p(99.9)=88.42ms
       { expected_response:true }...: avg=40.9ms  min=2.24ms  med=40.36ms max=332.97ms p(90)=57.44ms  p(95)=62.65ms  p(99.9)=88.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145896
     http_req_receiving.............: avg=85.61µs min=28.71µs med=65.79µs max=133.67ms p(90)=104.87µs p(95)=123.08µs p(99.9)=1.7ms  
     http_req_sending...............: avg=26.54µs min=5.3µs   med=11.06µs max=128.29ms p(90)=17.86µs  p(95)=21.68µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.79ms min=2.15ms  med=40.26ms max=312.46ms p(90)=57.33ms  p(95)=62.55ms  p(99.9)=88.07ms
     http_reqs......................: 145896  1212.833536/s
     iteration_duration.............: avg=41.14ms min=4.32ms  med=40.58ms max=342.15ms p(90)=57.66ms  p(95)=62.87ms  p(99.9)=89.22ms
     iterations.....................: 145796  1212.002236/s
     success_rate...................: 100.00% ✓ 145796      ✗ 0     
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

     checks.........................: 100.00% ✓ 215586     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   717 kB/s
     http_req_blocked...............: avg=4.6µs    min=1.15µs  med=2.96µs  max=4.14ms   p(90)=4.53µs   p(95)=5.13µs   p(99.9)=50.54µs 
     http_req_connecting............: avg=1.3µs    min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.14ms  min=3.78ms  med=80.54ms max=343.26ms p(90)=101.94ms p(95)=112.95ms p(99.9)=213.05ms
       { expected_response:true }...: avg=83.14ms  min=3.78ms  med=80.54ms max=343.26ms p(90)=101.94ms p(95)=112.95ms p(99.9)=213.05ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71962
     http_req_receiving.............: avg=157.12µs min=31.47µs med=78.33µs max=255.31ms p(90)=112.81µs p(95)=126.19µs p(99.9)=1.09ms  
     http_req_sending...............: avg=23.07µs  min=5.29µs  med=13.39µs max=106.1ms  p(90)=19.91µs  p(95)=22.17µs  p(99.9)=799.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.96ms  min=3.71ms  med=80.44ms max=245.85ms p(90)=101.78ms p(95)=112.67ms p(99.9)=207.19ms
     http_reqs......................: 71962   597.125057/s
     iteration_duration.............: avg=83.5ms   min=12.91ms med=80.79ms max=370.41ms p(90)=102.18ms p(95)=113.22ms p(99.9)=215.64ms
     iterations.....................: 71862   596.295279/s
     success_rate...................: 100.00% ✓ 71862      ✗ 0    
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

     checks.........................: 100.00% ✓ 143925     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   478 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.2µs   med=3.55µs   max=4.09ms   p(90)=5.02µs   p(95)=5.62µs   p(99.9)=312.51µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=108.22µs
     http_req_duration..............: avg=124.55ms min=6.02ms  med=122.07ms max=358.57ms p(90)=165.11ms p(95)=177.12ms p(99.9)=227.43ms
       { expected_response:true }...: avg=124.55ms min=6.02ms  med=122.07ms max=358.57ms p(90)=165.11ms p(95)=177.12ms p(99.9)=227.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48075
     http_req_receiving.............: avg=96.6µs   min=33.52µs med=88.96µs  max=50.26ms  p(90)=121.24µs p(95)=134.43µs p(99.9)=862.88µs
     http_req_sending...............: avg=29.77µs  min=5.21µs  med=17.03µs  max=119.09ms p(90)=22.12µs  p(95)=24µs     p(99.9)=673.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.42ms min=5.93ms  med=121.95ms max=357.92ms p(90)=164.97ms p(95)=176.98ms p(99.9)=227.32ms
     http_reqs......................: 48075   398.184008/s
     iteration_duration.............: avg=125.09ms min=39.26ms med=122.4ms  max=376.06ms p(90)=165.42ms p(95)=177.42ms p(99.9)=232.16ms
     iterations.....................: 47975   397.355753/s
     success_rate...................: 100.00% ✓ 47975      ✗ 0    
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

     checks.........................: 100.00% ✓ 99861      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   331 kB/s
     http_req_blocked...............: avg=7.17µs   min=1.25µs  med=3.6µs    max=4.42ms   p(90)=5.07µs   p(95)=5.69µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=3.35µs   min=0s      med=0s       max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=179.52ms min=6.14ms  med=164.16ms max=626.31ms p(90)=211.73ms p(95)=278.06ms p(99.9)=526.49ms
       { expected_response:true }...: avg=179.52ms min=6.14ms  med=164.16ms max=626.31ms p(90)=211.73ms p(95)=278.06ms p(99.9)=526.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33387
     http_req_receiving.............: avg=107.11µs min=33.84µs med=97.19µs  max=127.49ms p(90)=129.13µs p(95)=142.67µs p(99.9)=750.48µs
     http_req_sending...............: avg=28.14µs  min=6.19µs  med=17.56µs  max=69.84ms  p(90)=22.6µs   p(95)=24.35µs  p(99.9)=602.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.38ms min=6ms     med=164.04ms max=626.1ms  p(90)=211.6ms  p(95)=277.95ms p(99.9)=526.38ms
     http_reqs......................: 33387   276.042297/s
     iteration_duration.............: avg=180.36ms min=39.92ms med=164.5ms  max=626.66ms p(90)=212.16ms p(95)=283.25ms p(99.9)=526.76ms
     iterations.....................: 33287   275.215502/s
     success_rate...................: 100.00% ✓ 33287      ✗ 0    
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

     checks.........................: 100.00% ✓ 86691      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=6.77µs   min=1.2µs   med=3.33µs   max=4.14ms   p(90)=4.59µs   p(95)=5.12µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=3.2µs    min=0s      med=0s       max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=206.79ms min=8.55ms  med=206.7ms  max=373.31ms p(90)=233.63ms p(95)=241.95ms p(99.9)=310.46ms
       { expected_response:true }...: avg=206.79ms min=8.55ms  med=206.7ms  max=373.31ms p(90)=233.63ms p(95)=241.95ms p(99.9)=310.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28997
     http_req_receiving.............: avg=117.35µs min=34.39µs med=93.47µs  max=90.16ms  p(90)=124.48µs p(95)=137.26µs p(99.9)=911.4µs 
     http_req_sending...............: avg=22.04µs  min=6.24µs  med=17.07µs  max=35.48ms  p(90)=21.39µs  p(95)=23.14µs  p(99.9)=664.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.65ms min=8.41ms  med=206.58ms max=355.61ms p(90)=233.51ms p(95)=241.84ms p(99.9)=308.72ms
     http_reqs......................: 28997   239.502603/s
     iteration_duration.............: avg=207.76ms min=33.14ms med=207.02ms max=384.33ms p(90)=233.9ms  p(95)=242.28ms p(99.9)=312.93ms
     iterations.....................: 28897   238.676647/s
     success_rate...................: 100.00% ✓ 28897      ✗ 0    
     vus............................: 36      min=36       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

