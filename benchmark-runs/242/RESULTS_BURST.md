## Overview for: `burst-vus`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario is a burst stress test with peaks up to **500 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,798 | 2,883 | 2,767 | 1.3% |  |
| fusion-nightly | 16.4.0-p.5 | 2,152 | 2,191 | 2,141 | 0.8% |  |
| fusion | 16.3.0 | 2,077 | 2,114 | 2,057 | 0.9% |  |
| cosmo | 0.326.0 | 1,093 | 1,115 | 1,085 | 0.9% |  |
| hive-gateway-router-runtime | 2.9.0 | 507 | 516 | 503 | 0.8% |  |
| hive-gateway | 2.9.0 | 215 | 218 | 201 | 3.0% |  |
| apollo-gateway | 2.14.1 | 200 | 205 | 198 | 1.0% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (13937 across 9/9 runs) |
| feddi | 77271dc84a06 | — | — | — | — | non-compatible response (5441601 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (496561 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,281 | 2,377 | 2,252 | 1.7% |  |
| fusion-nightly | 16.4.0-p.5 | 2,036 | 2,066 | 2,024 | 0.7% |  |
| fusion | 16.3.0 | 1,984 | 2,026 | 1,962 | 1.2% |  |
| cosmo | 0.326.0 | 1,066 | 1,087 | 1,061 | 0.8% |  |
| hive-gateway-router-runtime | 2.9.0 | 491 | 500 | 486 | 0.9% |  |
| hive-gateway | 2.9.0 | 222 | 225 | 220 | 0.7% |  |
| apollo-gateway | 2.14.1 | 205 | 210 | 203 | 1.0% |  |
| feddi | 77271dc84a06 | 7 | 7 | 7 | 0.0% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (22705 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (253533 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 516378      ✗ 0     
     data_received..................: 15 GB   245 MB/s
     data_sent......................: 208 MB  3.4 MB/s
     http_req_blocked...............: avg=29.79µs  min=1µs     med=2.28µs  max=95.8ms   p(90)=3.73µs   p(95)=4.83µs   p(99.9)=4.24ms  
     http_req_connecting............: avg=26.61µs  min=0s      med=0s      max=95.74ms  p(90)=0s       p(95)=0s       p(99.9)=3.96ms  
     http_req_duration..............: avg=82ms     min=1.62ms  med=75.31ms max=287.65ms p(90)=159.69ms p(95)=178.28ms p(99.9)=243.93ms
       { expected_response:true }...: avg=82ms     min=1.62ms  med=75.31ms max=287.65ms p(90)=159.69ms p(95)=178.28ms p(99.9)=243.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173126
     http_req_receiving.............: avg=447.65µs min=28.18µs med=55.61µs max=80.59ms  p(90)=257.98µs p(95)=428.03µs p(99.9)=52.58ms 
     http_req_sending...............: avg=92.06µs  min=5.32µs  med=10.01µs max=125.47ms p(90)=18.45µs  p(95)=133.8µs  p(99.9)=14.59ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.46ms  min=1.57ms  med=74.98ms max=281.16ms p(90)=158.88ms p(95)=176.4ms  p(99.9)=235.08ms
     http_reqs......................: 173126  2798.022956/s
     iteration_duration.............: avg=82.82ms  min=2.11ms  med=76.12ms max=328.68ms p(90)=160.33ms p(95)=179.08ms p(99.9)=245.56ms
     iterations.....................: 172126  2781.861184/s
     success_rate...................: 100.00% ✓ 172126      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 401472      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 162 MB  2.6 MB/s
     http_req_blocked...............: avg=18.91µs  min=981ns   med=2.39µs   max=81.92ms  p(90)=3.94µs   p(95)=5.06µs   p(99.9)=1.97ms  
     http_req_connecting............: avg=15.72µs  min=0s      med=0s       max=81.59ms  p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=105.49ms min=2.28ms  med=97.86ms  max=516.16ms p(90)=205.09ms p(95)=229.58ms p(99.9)=362.17ms
       { expected_response:true }...: avg=105.49ms min=2.28ms  med=97.86ms  max=516.16ms p(90)=205.09ms p(95)=229.58ms p(99.9)=362.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134824
     http_req_receiving.............: avg=1.79ms   min=52.32µs med=257.35µs max=257.29ms p(90)=2.78ms   p(95)=6.13ms   p(99.9)=99.42ms 
     http_req_sending...............: avg=67.02µs  min=5.26µs  med=9.84µs   max=69.66ms  p(90)=19.07µs  p(95)=122.55µs p(99.9)=9.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.63ms min=2.19ms  med=96.19ms  max=516.03ms p(90)=202.32ms p(95)=225.73ms p(99.9)=356.13ms
     http_reqs......................: 134824  2152.992304/s
     iteration_duration.............: avg=106.57ms min=3.88ms  med=99.1ms   max=516.39ms p(90)=205.71ms p(95)=230.26ms p(99.9)=363.52ms
     iterations.....................: 133824  2137.023394/s
     success_rate...................: 100.00% ✓ 133824      ✗ 0     
     vus............................: 86      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 388050      ✗ 0     
     data_received..................: 11 GB   182 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=19.56µs  min=992ns  med=2.45µs   max=70.9ms   p(90)=3.93µs   p(95)=4.95µs   p(99.9)=2.15ms  
     http_req_connecting............: avg=16.24µs  min=0s     med=0s       max=70.82ms  p(90)=0s       p(95)=0s       p(99.9)=2.08ms  
     http_req_duration..............: avg=109.12ms min=2.37ms med=99.19ms  max=781.14ms p(90)=219.2ms  p(95)=261.95ms p(99.9)=507.61ms
       { expected_response:true }...: avg=109.12ms min=2.37ms med=99.19ms  max=781.14ms p(90)=219.2ms  p(95)=261.95ms p(99.9)=507.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130350
     http_req_receiving.............: avg=3.42ms   min=52.5µs med=138.82µs max=484.31ms p(90)=3.86ms   p(95)=12.01ms  p(99.9)=154.69ms
     http_req_sending...............: avg=71.99µs  min=5.61µs med=9.92µs   max=155.86ms p(90)=18.37µs  p(95)=119.9µs  p(99.9)=10.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.63ms min=2.28ms med=96.97ms  max=729.78ms p(90)=211.84ms p(95)=249.94ms p(99.9)=468.66ms
     http_reqs......................: 130350  2077.035604/s
     iteration_duration.............: avg=110.31ms min=3.38ms med=100.55ms max=781.38ms p(90)=220.06ms p(95)=263.14ms p(99.9)=508.16ms
     iterations.....................: 129350  2061.101307/s
     success_rate...................: 100.00% ✓ 129350      ✗ 0     
     vus............................: 93      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 202146      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 82 MB   1.3 MB/s
     http_req_blocked...............: avg=5.92µs   min=1.1µs   med=2.62µs   max=24.06ms  p(90)=4.22µs   p(95)=5.14µs   p(99.9)=481.9µs 
     http_req_connecting............: avg=2.61µs   min=0s      med=0s       max=24.02ms  p(90)=0s       p(95)=0s       p(99.9)=424.64µs
     http_req_duration..............: avg=208.74ms min=2.1ms   med=209.78ms max=657.62ms p(90)=387.21ms p(95)=418.41ms p(99.9)=549.25ms
       { expected_response:true }...: avg=208.74ms min=2.1ms   med=209.78ms max=657.62ms p(90)=387.21ms p(95)=418.41ms p(99.9)=549.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68382
     http_req_receiving.............: avg=83.43µs  min=31.74µs med=65.05µs  max=233.76ms p(90)=100.27µs p(95)=114.59µs p(99.9)=1.61ms  
     http_req_sending...............: avg=30.9µs   min=5.55µs  med=11.1µs   max=134.61ms p(90)=16.95µs  p(95)=20.49µs  p(99.9)=3.68ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.62ms min=1.99ms  med=209.66ms max=657.54ms p(90)=387.11ms p(95)=418.3ms  p(99.9)=549.19ms
     http_reqs......................: 68382   1093.784533/s
     iteration_duration.............: avg=212.08ms min=5.83ms  med=213.66ms max=657.81ms p(90)=388.06ms p(95)=419.21ms p(99.9)=549.51ms
     iterations.....................: 67382   1077.789321/s
     success_rate...................: 100.00% ✓ 67382       ✗ 0    
     vus............................: 82      min=0         max=494
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 95670      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   610 kB/s
     http_req_blocked...............: avg=11.25µs  min=1.11µs  med=3.06µs   max=37.6ms  p(90)=4.87µs   p(95)=5.93µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=7.01µs   min=0s      med=0s       max=37.53ms p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=436.63ms min=3.91ms  med=405.42ms max=1.7s    p(90)=866.78ms p(95)=940.94ms p(99.9)=1.39s   
       { expected_response:true }...: avg=436.63ms min=3.91ms  med=405.42ms max=1.7s    p(90)=866.78ms p(95)=940.94ms p(99.9)=1.39s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32890
     http_req_receiving.............: avg=86µs     min=33.06µs med=75.77µs  max=30.31ms p(90)=112.87µs p(95)=126.22µs p(99.9)=974.91µs
     http_req_sending...............: avg=30.58µs  min=5.7µs   med=13.57µs  max=92.11ms p(90)=21µs     p(95)=24.51µs  p(99.9)=3.21ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=436.51ms min=3.86ms  med=405.29ms max=1.7s    p(90)=866.67ms p(95)=940.85ms p(99.9)=1.39s   
     http_reqs......................: 32890   507.805827/s
     iteration_duration.............: avg=450.55ms min=17.95ms med=420.91ms max=1.7s    p(90)=870.82ms p(95)=944.56ms p(99.9)=1.39s   
     iterations.....................: 31890   492.366307/s
     success_rate...................: 100.00% ✓ 31890      ✗ 0    
     vus............................: 95      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 41409      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   259 kB/s
     http_req_blocked...............: avg=15.55µs  min=1.34µs  med=3.55µs   max=3.85ms  p(90)=5.43µs   p(95)=7.24µs  p(99.9)=2.8ms 
     http_req_connecting............: avg=10.24µs  min=0s      med=0s       max=3.81ms  p(90)=0s       p(95)=0s      p(99.9)=2.77ms
     http_req_duration..............: avg=972.78ms min=6.47ms  med=865.44ms max=16.85s  p(90)=1.78s    p(95)=1.96s   p(99.9)=16.08s
       { expected_response:true }...: avg=972.78ms min=6.47ms  med=865.44ms max=16.85s  p(90)=1.78s    p(95)=1.96s   p(99.9)=16.08s
     http_req_failed................: 0.00%   ✓ 0          ✗ 14803
     http_req_receiving.............: avg=131.35µs min=35.27µs med=95.65µs  max=80.06ms p(90)=134.97µs p(95)=148.6µs p(99.9)=1.68ms
     http_req_sending...............: avg=29µs     min=6.25µs  med=17.02µs  max=49.96ms p(90)=23.53µs  p(95)=28.47µs p(99.9)=2.06ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=972.62ms min=6.34ms  med=865.33ms max=16.85s  p(90)=1.78s    p(95)=1.95s   p(99.9)=16.08s
     http_reqs......................: 14803   215.234889/s
     iteration_duration.............: avg=1.04s    min=39.05ms med=958.86ms max=16.85s  p(90)=1.8s     p(95)=1.97s   p(99.9)=16.1s 
     iterations.....................: 13803   200.694938/s
     success_rate...................: 100.00% ✓ 13803      ✗ 0    
     vus............................: 96      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 41757      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   247 kB/s
     http_req_blocked...............: avg=14.8µs   min=1.32µs  med=3.34µs   max=17.2ms   p(90)=4.91µs   p(95)=6.52µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=9.68µs   min=0s      med=0s       max=17.14ms  p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=480.79ms min=8.5ms   med=548.73ms max=1.38s    p(90)=845.63ms p(95)=898.23ms p(99.9)=1.24s   
       { expected_response:true }...: avg=480.79ms min=8.5ms   med=548.73ms max=1.38s    p(90)=845.63ms p(95)=898.23ms p(99.9)=1.24s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14919
     http_req_receiving.............: avg=107.84µs min=34.44µs med=87.59µs  max=88ms     p(90)=126.32µs p(95)=138.8µs  p(99.9)=849.24µs
     http_req_sending...............: avg=59.49µs  min=6.16µs  med=15.91µs  max=145.93ms p(90)=21.81µs  p(95)=26.66µs  p(99.9)=4.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=480.63ms min=8.33ms  med=548.58ms max=1.38s    p(90)=845.48ms p(95)=898.09ms p(99.9)=1.24s   
     http_reqs......................: 14919   200.831001/s
     iteration_duration.............: avg=515.28ms min=13.51ms med=581.46ms max=1.39s    p(90)=851.74ms p(95)=905.63ms p(99.9)=1.25s   
     iterations.....................: 13919   187.369576/s
     success_rate...................: 100.00% ✓ 13919      ✗ 0    
     vus............................: 65      min=0        max=494
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 421269      ✗ 0     
     data_received..................: 12 GB   200 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=22.9µs   min=1µs     med=2.44µs  max=73.71ms  p(90)=4.16µs   p(95)=5.4µs    p(99.9)=1.77ms  
     http_req_connecting............: avg=19.58µs  min=0s      med=0s      max=73.62ms  p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=100.54ms min=1.62ms  med=95.26ms max=384.23ms p(90)=194.92ms p(95)=210.98ms p(99.9)=261.07ms
       { expected_response:true }...: avg=100.54ms min=1.62ms  med=95.26ms max=384.23ms p(90)=194.92ms p(95)=210.98ms p(99.9)=261.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141423
     http_req_receiving.............: avg=221.37µs min=29.71µs med=60.22µs max=63.8ms   p(90)=193.21µs p(95)=421.2µs  p(99.9)=24.13ms 
     http_req_sending...............: avg=76.77µs  min=5.38µs  med=10.83µs max=159.85ms p(90)=21.67µs  p(95)=137.41µs p(99.9)=11.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=100.24ms min=1.57ms  med=94.99ms max=383.45ms p(90)=194.5ms  p(95)=210.6ms  p(99.9)=259.68ms
     http_reqs......................: 141423  2281.211784/s
     iteration_duration.............: avg=101.54ms min=5.2ms   med=96.41ms max=395.56ms p(90)=195.45ms p(95)=211.48ms p(99.9)=263.13ms
     iterations.....................: 140423  2265.081368/s
     success_rate...................: 100.00% ✓ 140423      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 376401      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 152 MB  2.4 MB/s
     http_req_blocked...............: avg=16.39µs  min=1.01µs  med=2.84µs   max=38.45ms  p(90)=4.61µs   p(95)=5.92µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=12.75µs  min=0s      med=0s       max=38.29ms  p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=112.51ms min=1.71ms  med=105.98ms max=539.88ms p(90)=216.12ms p(95)=237.49ms p(99.9)=353.65ms
       { expected_response:true }...: avg=112.51ms min=1.71ms  med=105.98ms max=539.88ms p(90)=216.12ms p(95)=237.49ms p(99.9)=353.65ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 126467
     http_req_receiving.............: avg=1.67ms   min=53.17µs med=303.37µs max=224.88ms p(90)=3.04ms   p(95)=6.01ms   p(99.9)=71.39ms 
     http_req_sending...............: avg=68.81µs  min=5.69µs  med=11.13µs  max=158.53ms p(90)=22.06µs  p(95)=130.39µs p(99.9)=9.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.77ms min=1.63ms  med=104.14ms max=502.63ms p(90)=213.72ms p(95)=234.75ms p(99.9)=345ms   
     http_reqs......................: 126467  2036.161558/s
     iteration_duration.............: avg=113.69ms min=2.36ms  med=107.44ms max=540.14ms p(90)=216.72ms p(95)=238.02ms p(99.9)=354.7ms 
     iterations.....................: 125467  2020.061219/s
     success_rate...................: 100.00% ✓ 125467      ✗ 0     
     vus............................: 62      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.3.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 367041      ✗ 0     
     data_received..................: 11 GB   174 MB/s
     data_sent......................: 148 MB  2.4 MB/s
     http_req_blocked...............: avg=18.74µs  min=1µs     med=2.38µs   max=82.39ms  p(90)=4.23µs   p(95)=5.41µs   p(99.9)=1.76ms  
     http_req_connecting............: avg=15.59µs  min=0s      med=0s       max=82.35ms  p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=115.36ms min=1.77ms  med=105.47ms max=693.13ms p(90)=221.74ms p(95)=262.04ms p(99.9)=479.18ms
       { expected_response:true }...: avg=115.36ms min=1.77ms  med=105.47ms max=693.13ms p(90)=221.74ms p(95)=262.04ms p(99.9)=479.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 123347
     http_req_receiving.............: avg=2.89ms   min=53.32µs med=140.22µs max=332.09ms p(90)=3.75ms   p(95)=9.84ms   p(99.9)=155.57ms
     http_req_sending...............: avg=65.32µs  min=5.3µs   med=10.12µs  max=55.97ms  p(90)=20.86µs  p(95)=125.64µs p(99.9)=9.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.39ms min=1.67ms  med=103.4ms  max=594.41ms p(90)=217.22ms p(95)=251.11ms p(99.9)=430.16ms
     http_reqs......................: 123347  1984.29385/s
     iteration_duration.............: avg=116.61ms min=3.1ms   med=107ms    max=718.08ms p(90)=222.54ms p(95)=263.24ms p(99.9)=483.75ms
     iterations.....................: 122347  1968.206764/s
     success_rate...................: 100.00% ✓ 122347      ✗ 0     
     vus............................: 66      min=0         max=496 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 197691      ✗ 0    
     data_received..................: 5.9 GB  93 MB/s
     data_sent......................: 80 MB   1.3 MB/s
     http_req_blocked...............: avg=6.23µs   min=1.1µs   med=2.51µs   max=36.06ms  p(90)=4.29µs   p(95)=5.28µs   p(99.9)=567.92µs
     http_req_connecting............: avg=2.99µs   min=0s      med=0s       max=36.01ms  p(90)=0s       p(95)=0s       p(99.9)=503.23µs
     http_req_duration..............: avg=213.42ms min=2.18ms  med=215.92ms max=570.78ms p(90)=393.23ms p(95)=423.29ms p(99.9)=508.68ms
       { expected_response:true }...: avg=213.42ms min=2.18ms  med=215.92ms max=570.78ms p(90)=393.23ms p(95)=423.29ms p(99.9)=508.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 66897
     http_req_receiving.............: avg=90.2µs   min=30.08µs med=68.63µs  max=190.16ms p(90)=107.02µs p(95)=122.81µs p(99.9)=1.79ms  
     http_req_sending...............: avg=28.11µs  min=5.36µs  med=11.27µs  max=32.13ms  p(90)=18.12µs  p(95)=21.69µs  p(99.9)=3.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=213.3ms  min=2.11ms  med=215.73ms max=570.69ms p(90)=393.12ms p(95)=423.14ms p(99.9)=508.61ms
     http_reqs......................: 66897   1066.385194/s
     iteration_duration.............: avg=216.91ms min=6.01ms  med=219.61ms max=570.98ms p(90)=394.47ms p(95)=424.05ms p(99.9)=509.07ms
     iterations.....................: 65897   1050.444491/s
     success_rate...................: 100.00% ✓ 65897       ✗ 0    
     vus............................: 91      min=0         max=499
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 93087      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   590 kB/s
     http_req_blocked...............: avg=9.81µs   min=1.2µs   med=3.36µs   max=31.25ms p(90)=5.19µs   p(95)=6.21µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=5.44µs   min=0s      med=0s       max=31.19ms p(90)=0s       p(95)=0s       p(99.9)=1.26ms  
     http_req_duration..............: avg=448.36ms min=4.07ms  med=420.67ms max=1.98s   p(90)=881.65ms p(95)=956.85ms p(99.9)=1.45s   
       { expected_response:true }...: avg=448.36ms min=4.07ms  med=420.67ms max=1.98s   p(90)=881.65ms p(95)=956.85ms p(99.9)=1.45s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32029
     http_req_receiving.............: avg=94.75µs  min=32.26µs med=83.11µs  max=94.18ms p(90)=119.25µs p(95)=133.39µs p(99.9)=795.51µs
     http_req_sending...............: avg=31.01µs  min=5.64µs  med=14.72µs  max=93.8ms  p(90)=22.09µs  p(95)=25.47µs  p(99.9)=2.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.23ms min=3.97ms  med=420.58ms max=1.98s   p(90)=881.54ms p(95)=956.74ms p(99.9)=1.45s   
     http_reqs......................: 32029   491.430342/s
     iteration_duration.............: avg=463.05ms min=23.71ms med=436.33ms max=2s      p(90)=885.88ms p(95)=960ms    p(99.9)=1.47s   
     iterations.....................: 31029   476.087048/s
     success_rate...................: 100.00% ✓ 31029      ✗ 0    
     vus............................: 65      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 42762      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   267 kB/s
     http_req_blocked...............: avg=20.89µs  min=1.3µs   med=3.87µs   max=53.42ms p(90)=5.77µs   p(95)=7.44µs   p(99.9)=2.41ms
     http_req_connecting............: avg=15µs     min=0s      med=0s       max=53.35ms p(90)=0s       p(95)=0s       p(99.9)=2.27ms
     http_req_duration..............: avg=957.59ms min=6.35ms  med=868.26ms max=5.71s   p(90)=1.93s    p(95)=2.17s    p(99.9)=5.23s 
       { expected_response:true }...: avg=957.59ms min=6.35ms  med=868.26ms max=5.71s   p(90)=1.93s    p(95)=2.17s    p(99.9)=5.23s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15254
     http_req_receiving.............: avg=112.63µs min=37.44µs med=101.42µs max=47.98ms p(90)=141.34µs p(95)=155.63µs p(99.9)=1.1ms 
     http_req_sending...............: avg=34.74µs  min=6.43µs  med=18.65µs  max=23.55ms p(90)=25.03µs  p(95)=30.75µs  p(99.9)=4.03ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=957.44ms min=6.25ms  med=868.14ms max=5.71s   p(90)=1.93s    p(95)=2.17s    p(99.9)=5.23s 
     http_reqs......................: 15254   222.574203/s
     iteration_duration.............: avg=1.02s    min=24.54ms med=950.75ms max=5.72s   p(90)=1.97s    p(95)=2.19s    p(99.9)=5.25s 
     iterations.....................: 14254   207.983001/s
     success_rate...................: 100.00% ✓ 14254      ✗ 0    
     vus............................: 80      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 40092      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=14.66µs  min=1.19µs  med=3.59µs   max=3.44ms  p(90)=5.32µs   p(95)=6.9µs    p(99.9)=2.17ms  
     http_req_connecting............: avg=9.2µs    min=0s      med=0s       max=3.42ms  p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=1.01s    min=8.83ms  med=932.79ms max=4.32s   p(90)=2.05s    p(95)=2.17s    p(99.9)=3.75s   
       { expected_response:true }...: avg=1.01s    min=8.83ms  med=932.79ms max=4.32s   p(90)=2.05s    p(95)=2.17s    p(99.9)=3.75s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14364
     http_req_receiving.............: avg=102.81µs min=33.92µs med=95.22µs  max=21.83ms p(90)=134.83µs p(95)=146.09µs p(99.9)=986.36µs
     http_req_sending...............: avg=30.3µs   min=6.28µs  med=17.51µs  max=17.54ms p(90)=23.33µs  p(95)=28.82µs  p(99.9)=3.93ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.01s    min=8.69ms  med=932.69ms max=4.32s   p(90)=2.05s    p(95)=2.17s    p(99.9)=3.75s   
     http_reqs......................: 14364   205.357102/s
     iteration_duration.............: avg=1.09s    min=32.96ms med=1.02s    max=4.32s   p(90)=2.06s    p(95)=2.18s    p(99.9)=3.78s   
     iterations.....................: 13364   191.060451/s
     success_rate...................: 100.00% ✓ 13364      ✗ 0    
     vus............................: 44      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (.net subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
data_received..................: 44 MB  732 kB/s
     data_sent......................: 552 kB 9.2 kB/s
     http_req_blocked...............: avg=4.62µs   min=2.86µs  med=3.82µs   max=210.65µs p(90)=5.05µs   p(95)=5.48µs   p(99.9)=141.53µs
     http_req_connecting............: avg=275ns    min=0s      med=0s       max=126.57µs p(90)=0s       p(95)=0s       p(99.9)=68.6µs  
     http_req_duration..............: avg=130.57ms min=34.34ms med=50.94ms  max=36.64s   p(90)=56.1ms   p(95)=61.42ms  p(99.9)=19.93s  
       { expected_response:true }...: avg=130.57ms min=34.34ms med=50.94ms  max=36.64s   p(90)=56.1ms   p(95)=61.42ms  p(99.9)=19.93s  
     http_req_failed................: 0.00%  ✓ 0       ✗ 459  
     http_req_receiving.............: avg=148.68µs min=80.79µs med=148.92µs max=454.62µs p(90)=187.78µs p(95)=196.41µs p(99.9)=432.29µs
     http_req_sending...............: avg=22.51µs  min=15.01µs med=21.09µs  max=285.7µs  p(90)=23.54µs  p(95)=25.21µs  p(99.9)=259.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=130.4ms  min=34.16ms med=50.77ms  max=36.64s   p(90)=55.92ms  p(95)=61.29ms  p(99.9)=19.93s  
     http_reqs......................: 459    7.64993/s
     vus............................: 0      min=0     max=0  
     vus_max........................: 500    min=500   max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-185-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

