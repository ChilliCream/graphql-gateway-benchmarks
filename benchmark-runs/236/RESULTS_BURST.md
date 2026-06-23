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
| hive-router | v0.0.72 | 2,604 | 2,739 | 2,562 | 2.3% |  |
| fusion | 16.2.3 | 2,090 | 2,133 | 2,081 | 0.9% |  |
| fusion-nightly | 16.3.0-p.1 | 2,089 | 2,127 | 2,071 | 0.9% |  |
| cosmo | 0.324.0 | 1,094 | 1,115 | 1,082 | 1.1% |  |
| hive-gateway-router-runtime | 2.9.0 | 508 | 518 | 504 | 1.0% |  |
| hive-gateway | 2.9.0 | 217 | 222 | 214 | 1.3% |  |
| apollo-gateway | 2.14.1 | 201 | 204 | 199 | 0.7% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (10643 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (500030 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 2,207 | 2,299 | 2,183 | 2.1% |  |
| fusion | 16.2.3 | 1,996 | 2,037 | 1,939 | 1.4% |  |
| fusion-nightly | 16.3.0-p.1 | 1,964 | 2,013 | 1,953 | 1.1% |  |
| cosmo | 0.324.0 | 1,039 | 1,063 | 1,026 | 1.1% |  |
| hive-gateway-router-runtime | 2.9.0 | 476 | 485 | 471 | 1.0% |  |
| hive-gateway | 2.9.0 | 217 | 222 | 213 | 1.2% |  |
| apollo-gateway | 2.14.1 | 204 | 208 | 203 | 0.8% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (16915 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (241192 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 480957      ✗ 0     
     data_received..................: 14 GB   228 MB/s
     data_sent......................: 194 MB  3.1 MB/s
     http_req_blocked...............: avg=29.4µs   min=1.07µs  med=2.66µs  max=85.36ms  p(90)=4.17µs   p(95)=5.25µs   p(99.9)=9.02ms  
     http_req_connecting............: avg=25.72µs  min=0s      med=0s      max=85.13ms  p(90)=0s       p(95)=0s       p(99.9)=8.74ms  
     http_req_duration..............: avg=88.08ms  min=1.58ms  med=82.84ms max=289.18ms p(90)=170.76ms p(95)=185.63ms p(99.9)=240.11ms
       { expected_response:true }...: avg=88.08ms  min=1.58ms  med=82.84ms max=289.18ms p(90)=170.76ms p(95)=185.63ms p(99.9)=240.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 161319
     http_req_receiving.............: avg=331.27µs min=29.69µs med=59.24µs max=177.47ms p(90)=244.54µs p(95)=428.84µs p(99.9)=32.4ms  
     http_req_sending...............: avg=84.94µs  min=5.17µs  med=10.43µs max=51.13ms  p(90)=19.6µs   p(95)=137.01µs p(99.9)=11.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.66ms  min=1.52ms  med=82.5ms  max=289.1ms  p(90)=170.1ms  p(95)=184.65ms p(99.9)=235.93ms
     http_reqs......................: 161319  2604.192996/s
     iteration_duration.............: avg=88.92ms  min=2.39ms  med=83.76ms max=329.45ms p(90)=171.33ms p(95)=186.15ms p(99.9)=241.2ms 
     iterations.....................: 160319  2588.04987/s
     success_rate...................: 100.00% ✓ 160319      ✗ 0     
     vus............................: 54      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 390633      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=20.29µs  min=982ns   med=2.57µs   max=118.41ms p(90)=4.11µs   p(95)=5.21µs   p(99.9)=2.38ms  
     http_req_connecting............: avg=17.08µs  min=0s      med=0s       max=118.3ms  p(90)=0s       p(95)=0s       p(99.9)=2.27ms  
     http_req_duration..............: avg=108.37ms min=2.41ms  med=97.65ms  max=676.54ms p(90)=215.03ms p(95)=257.06ms p(99.9)=485.57ms
       { expected_response:true }...: avg=108.37ms min=2.41ms  med=97.65ms  max=676.54ms p(90)=215.03ms p(95)=257.06ms p(99.9)=485.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131211
     http_req_receiving.............: avg=3.19ms   min=52.79µs med=137.89µs max=368.03ms p(90)=4.05ms   p(95)=10.93ms  p(99.9)=164.54ms
     http_req_sending...............: avg=70.23µs  min=5.27µs  med=10.23µs  max=56.43ms  p(90)=19.18µs  p(95)=120.62µs p(99.9)=10.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.1ms  min=2.27ms  med=95.66ms  max=648.33ms p(90)=208.81ms p(95)=245.98ms p(99.9)=438.67ms
     http_reqs......................: 131211  2090.859548/s
     iteration_duration.............: avg=109.56ms min=3.24ms  med=98.95ms  max=676.78ms p(90)=215.96ms p(95)=258.11ms p(99.9)=490.3ms 
     iterations.....................: 130211  2074.924455/s
     success_rate...................: 100.00% ✓ 130211      ✗ 0     
     vus............................: 93      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 389976      ✗ 0     
     data_received..................: 12 GB   183 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=21.36µs  min=1.03µs  med=2.64µs   max=86.74ms  p(90)=4.15µs   p(95)=5.32µs   p(99.9)=2.26ms  
     http_req_connecting............: avg=17.64µs  min=0s      med=0s       max=86.68ms  p(90)=0s       p(95)=0s       p(99.9)=2.05ms  
     http_req_duration..............: avg=108.62ms min=2.27ms  med=101.83ms max=525.21ms p(90)=208.77ms p(95)=234.85ms p(99.9)=385.8ms 
       { expected_response:true }...: avg=108.62ms min=2.27ms  med=101.83ms max=525.21ms p(90)=208.77ms p(95)=234.85ms p(99.9)=385.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 130992
     http_req_receiving.............: avg=2.12ms   min=53.92µs med=278.55µs max=235.16ms p(90)=3.19ms   p(95)=7.46ms   p(99.9)=98.19ms 
     http_req_sending...............: avg=74.82µs  min=5.49µs  med=10.3µs   max=143.63ms p(90)=19.62µs  p(95)=126.46µs p(99.9)=11.07ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.42ms min=2.19ms  med=99.75ms  max=505.73ms p(90)=205.62ms p(95)=230.34ms p(99.9)=371.84ms
     http_reqs......................: 130992  2089.16354/s
     iteration_duration.............: avg=109.75ms min=3.88ms  med=103.17ms max=534.45ms p(90)=209.41ms p(95)=235.5ms  p(99.9)=386.9ms 
     iterations.....................: 129992  2073.214753/s
     success_rate...................: 100.00% ✓ 129992      ✗ 0     
     vus............................: 89      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 202293      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 82 MB   1.3 MB/s
     http_req_blocked...............: avg=11.64µs  min=1.04µs  med=2.58µs   max=12.93ms  p(90)=4.07µs   p(95)=4.94µs   p(99.9)=716.79µs
     http_req_connecting............: avg=8.35µs   min=0s      med=0s       max=12.79ms  p(90)=0s       p(95)=0s       p(99.9)=600.71µs
     http_req_duration..............: avg=208.6ms  min=2.05ms  med=208.47ms max=695.98ms p(90)=385.55ms p(95)=414.79ms p(99.9)=578.92ms
       { expected_response:true }...: avg=208.6ms  min=2.05ms  med=208.47ms max=695.98ms p(90)=385.55ms p(95)=414.79ms p(99.9)=578.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 68431
     http_req_receiving.............: avg=132.72µs min=30.61µs med=65.78µs  max=237.23ms p(90)=100.56µs p(95)=115.28µs p(99.9)=3.23ms  
     http_req_sending...............: avg=34.9µs   min=5.35µs  med=11.13µs  max=48.31ms  p(90)=16.96µs  p(95)=20.51µs  p(99.9)=5.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.44ms min=1.99ms  med=208.25ms max=695.82ms p(90)=385.46ms p(95)=414.69ms p(99.9)=578.85ms
     http_reqs......................: 68431   1094.824437/s
     iteration_duration.............: avg=211.94ms min=4.83ms  med=211.73ms max=696.27ms p(90)=386.62ms p(95)=415.58ms p(99.9)=579.35ms
     iterations.....................: 67431   1078.825482/s
     success_rate...................: 100.00% ✓ 67431       ✗ 0    
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

     checks.........................: 100.00% ✓ 95922      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   611 kB/s
     http_req_blocked...............: avg=10.75µs  min=1.14µs  med=2.97µs   max=52.68ms  p(90)=4.69µs   p(95)=5.65µs   p(99.9)=1.69ms
     http_req_connecting............: avg=6.78µs   min=0s      med=0s       max=52.62ms  p(90)=0s       p(95)=0s       p(99.9)=1.66ms
     http_req_duration..............: avg=435.29ms min=3.86ms  med=404.57ms max=1.58s    p(90)=859.72ms p(95)=933.26ms p(99.9)=1.36s 
       { expected_response:true }...: avg=435.29ms min=3.86ms  med=404.57ms max=1.58s    p(90)=859.72ms p(95)=933.26ms p(99.9)=1.36s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32974
     http_req_receiving.............: avg=94.39µs  min=30.41µs med=76.92µs  max=109.69ms p(90)=112.94µs p(95)=126.26µs p(99.9)=1ms   
     http_req_sending...............: avg=28.16µs  min=5.88µs  med=13.45µs  max=62.67ms  p(90)=20.94µs  p(95)=24.3µs   p(99.9)=2.66ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=435.17ms min=3.8ms   med=404.42ms max=1.58s    p(90)=859.65ms p(95)=933.19ms p(99.9)=1.36s 
     http_reqs......................: 32974   508.944702/s
     iteration_duration.............: avg=449.13ms min=28.59ms med=421.34ms max=1.58s    p(90)=863.44ms p(95)=936.68ms p(99.9)=1.36s 
     iterations.....................: 31974   493.509974/s
     success_rate...................: 100.00% ✓ 31974      ✗ 0    
     vus............................: 93      min=0        max=500
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

     checks.........................: 100.00% ✓ 41886      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   262 kB/s
     http_req_blocked...............: avg=16.93µs  min=1.19µs  med=3.81µs   max=5.45ms   p(90)=5.75µs   p(95)=7.72µs   p(99.9)=2.63ms  
     http_req_connecting............: avg=11.34µs  min=0s      med=0s       max=5.38ms   p(90)=0s       p(95)=0s       p(99.9)=2.6ms   
     http_req_duration..............: avg=960.01ms min=6.77ms  med=850.56ms max=15.82s   p(90)=1.79s    p(95)=1.95s    p(99.9)=13.83s  
       { expected_response:true }...: avg=960.01ms min=6.77ms  med=850.56ms max=15.82s   p(90)=1.79s    p(95)=1.95s    p(99.9)=13.83s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14962
     http_req_receiving.............: avg=114.23µs min=36.29µs med=103.66µs max=85.66ms  p(90)=143.27µs p(95)=156.19µs p(99.9)=862.45µs
     http_req_sending...............: avg=48.57µs  min=6.47µs  med=19.33µs  max=132.73ms p(90)=25.51µs  p(95)=31.15µs  p(99.9)=2.53ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=959.84ms min=6.67ms  med=850.46ms max=15.82s   p(90)=1.79s    p(95)=1.95s    p(99.9)=13.83s  
     http_reqs......................: 14962   217.344269/s
     iteration_duration.............: avg=1.02s    min=67.68ms med=920.17ms max=15.82s   p(90)=1.81s    p(95)=1.97s    p(99.9)=14.1s   
     iterations.....................: 13962   202.817851/s
     success_rate...................: 100.00% ✓ 13962      ✗ 0    
     vus............................: 98      min=0        max=500
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

     checks.........................: 100.00% ✓ 41919      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   247 kB/s
     http_req_blocked...............: avg=15.43µs  min=1.17µs  med=3.44µs   max=17.13ms p(90)=5.12µs   p(95)=6.66µs   p(99.9)=2.17ms  
     http_req_connecting............: avg=10.31µs  min=0s      med=0s       max=17.07ms p(90)=0s       p(95)=0s       p(99.9)=2.14ms  
     http_req_duration..............: avg=419.35ms min=8.53ms  med=458.29ms max=1.23s   p(90)=731.37ms p(95)=803.28ms p(99.9)=1.14s   
       { expected_response:true }...: avg=419.35ms min=8.53ms  med=458.29ms max=1.23s   p(90)=731.37ms p(95)=803.28ms p(99.9)=1.14s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14973
     http_req_receiving.............: avg=104.59µs min=34.65µs med=93.21µs  max=53.54ms p(90)=132.51µs p(95)=145.58µs p(99.9)=813.06µs
     http_req_sending...............: avg=35.04µs  min=5.93µs  med=17.63µs  max=56.85ms p(90)=23.48µs  p(95)=28.37µs  p(99.9)=2.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=419.21ms min=8.41ms  med=457.97ms max=1.23s   p(90)=731.27ms p(95)=803.19ms p(99.9)=1.14s   
     http_reqs......................: 14973   201.062776/s
     iteration_duration.............: avg=449.22ms min=8.97ms  med=481.81ms max=1.24s   p(90)=740.81ms p(95)=809.63ms p(99.9)=1.15s   
     iterations.....................: 13973   187.63442/s
     success_rate...................: 100.00% ✓ 13973      ✗ 0    
     vus............................: 74      min=0        max=497
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

     checks.........................: 100.00% ✓ 407988      ✗ 0     
     data_received..................: 12 GB   193 MB/s
     data_sent......................: 165 MB  2.7 MB/s
     http_req_blocked...............: avg=33.61µs  min=1.15µs  med=3.03µs  max=83.07ms  p(90)=4.97µs   p(95)=6.26µs   p(99.9)=7.76ms  
     http_req_connecting............: avg=29.5µs   min=0s      med=0s      max=82.98ms  p(90)=0s       p(95)=0s       p(99.9)=7.66ms  
     http_req_duration..............: avg=103.78ms min=1.66ms  med=97.46ms max=381.4ms  p(90)=198.98ms p(95)=217.54ms p(99.9)=280.16ms
       { expected_response:true }...: avg=103.78ms min=1.66ms  med=97.46ms max=381.4ms  p(90)=198.98ms p(95)=217.54ms p(99.9)=280.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136996
     http_req_receiving.............: avg=305.83µs min=30.44µs med=65.3µs  max=65.39ms  p(90)=212.68µs p(95)=465.21µs p(99.9)=34.75ms 
     http_req_sending...............: avg=98.16µs  min=5.56µs  med=11.98µs max=123.76ms p(90)=23.82µs  p(95)=152.82µs p(99.9)=13.76ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=103.38ms min=1.57ms  med=97.17ms max=371.47ms p(90)=198.22ms p(95)=216.48ms p(99.9)=278.06ms
     http_reqs......................: 136996  2207.947341/s
     iteration_duration.............: avg=104.87ms min=4.54ms  med=98.76ms max=399.2ms  p(90)=199.65ms p(95)=218.18ms p(99.9)=283.64ms
     iterations.....................: 135996  2191.830466/s
     success_rate...................: 100.00% ✓ 135996      ✗ 0     
     vus............................: 58      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.2.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 369561      ✗ 0     
     data_received..................: 11 GB   175 MB/s
     data_sent......................: 149 MB  2.4 MB/s
     http_req_blocked...............: avg=19.98µs  min=1.05µs  med=2.86µs   max=60.9ms   p(90)=4.71µs   p(95)=5.97µs   p(99.9)=1.57ms  
     http_req_connecting............: avg=16.04µs  min=0s      med=0s       max=60.82ms  p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=114.59ms min=1.75ms  med=104.13ms max=700.42ms p(90)=223.16ms p(95)=259.88ms p(99.9)=470.91ms
       { expected_response:true }...: avg=114.59ms min=1.75ms  med=104.13ms max=700.42ms p(90)=223.16ms p(95)=259.88ms p(99.9)=470.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 124187
     http_req_receiving.............: avg=2.62ms   min=53.29µs med=134.9µs  max=332.92ms p(90)=3.71ms   p(95)=9.56ms   p(99.9)=126.01ms
     http_req_sending...............: avg=69.55µs  min=5.44µs  med=11.06µs  max=60.46ms  p(90)=22.08µs  p(95)=130.52µs p(99.9)=8.85ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.89ms min=1.66ms  med=102.18ms max=700.33ms p(90)=218.39ms p(95)=251.61ms p(99.9)=425.2ms 
     http_reqs......................: 124187  1996.626556/s
     iteration_duration.............: avg=115.81ms min=2.49ms  med=105.71ms max=700.62ms p(90)=224.04ms p(95)=260.63ms p(99.9)=471.26ms
     iterations.....................: 123187  1980.548975/s
     success_rate...................: 100.00% ✓ 123187      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 363159      ✗ 0     
     data_received..................: 11 GB   172 MB/s
     data_sent......................: 147 MB  2.4 MB/s
     http_req_blocked...............: avg=18.11µs  min=992ns   med=2.8µs    max=72.41ms  p(90)=4.54µs   p(95)=5.82µs   p(99.9)=2.54ms  
     http_req_connecting............: avg=14.28µs  min=0s      med=0s       max=72.25ms  p(90)=0s       p(95)=0s       p(99.9)=2.42ms  
     http_req_duration..............: avg=116.59ms min=1.66ms  med=110.18ms max=567.17ms p(90)=223.54ms p(95)=245.74ms p(99.9)=357.73ms
       { expected_response:true }...: avg=116.59ms min=1.66ms  med=110.18ms max=567.17ms p(90)=223.54ms p(95)=245.74ms p(99.9)=357.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 122053
     http_req_receiving.............: avg=1.65ms   min=53.72µs med=318.64µs max=166.5ms  p(90)=3.02ms   p(95)=5.88ms   p(99.9)=76.98ms 
     http_req_sending...............: avg=69.4µs   min=5.34µs  med=11.02µs  max=128.42ms p(90)=21.76µs  p(95)=129.63µs p(99.9)=9.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.87ms min=1.58ms  med=108.47ms max=520.93ms p(90)=221.46ms p(95)=242.96ms p(99.9)=352.64ms
     http_reqs......................: 122053  1964.544474/s
     iteration_duration.............: avg=117.84ms min=3.22ms  med=111.69ms max=630.43ms p(90)=224.25ms p(95)=246.37ms p(99.9)=359ms   
     iterations.....................: 121053  1948.448643/s
     success_rate...................: 100.00% ✓ 121053      ✗ 0     
     vus............................: 63      min=0         max=497 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 192678      ✗ 0    
     data_received..................: 5.7 GB  91 MB/s
     data_sent......................: 78 MB   1.2 MB/s
     http_req_blocked...............: avg=6.95µs   min=1.14µs med=2.95µs   max=33.7ms   p(90)=4.7µs    p(95)=5.72µs   p(99.9)=488.58µs
     http_req_connecting............: avg=3.25µs   min=0s     med=0s       max=33.65ms  p(90)=0s       p(95)=0s       p(99.9)=430.96µs
     http_req_duration..............: avg=218.88ms min=2.14ms med=220.08ms max=664.26ms p(90)=405.51ms p(95)=438.84ms p(99.9)=583.07ms
       { expected_response:true }...: avg=218.88ms min=2.14ms med=220.08ms max=664.26ms p(90)=405.51ms p(95)=438.84ms p(99.9)=583.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 65226
     http_req_receiving.............: avg=126.95µs min=31.4µs med=75.03µs  max=120.6ms  p(90)=116.46µs p(95)=133.24µs p(99.9)=2.97ms  
     http_req_sending...............: avg=35.4µs   min=5.73µs med=12.47µs  max=188.58ms p(90)=19.74µs  p(95)=23.69µs  p(99.9)=3.62ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=218.72ms min=2.07ms med=219.8ms  max=664.18ms p(90)=405.42ms p(95)=438.74ms p(99.9)=582.99ms
     http_reqs......................: 65226   1039.03679/s
     iteration_duration.............: avg=222.55ms min=3.49ms med=224.57ms max=670.54ms p(90)=406.78ms p(95)=439.84ms p(99.9)=584.19ms
     iterations.....................: 64226   1023.106995/s
     success_rate...................: 100.00% ✓ 64226       ✗ 0    
     vus............................: 92      min=0         max=500
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

     checks.........................: 100.00% ✓ 90333      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 37 MB   573 kB/s
     http_req_blocked...............: avg=11.12µs  min=1.18µs  med=3.25µs   max=28.72ms  p(90)=5.02µs   p(95)=6.05µs   p(99.9)=2ms   
     http_req_connecting............: avg=6.77µs   min=0s      med=0s       max=28.66ms  p(90)=0s       p(95)=0s       p(99.9)=1.95ms
     http_req_duration..............: avg=461.62ms min=4.02ms  med=427.23ms max=1.93s    p(90)=908.8ms  p(95)=988.23ms p(99.9)=1.5s  
       { expected_response:true }...: avg=461.62ms min=4.02ms  med=427.23ms max=1.93s    p(90)=908.8ms  p(95)=988.23ms p(99.9)=1.5s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31111
     http_req_receiving.............: avg=92.03µs  min=32.96µs med=82.88µs  max=24.22ms  p(90)=119.17µs p(95)=133.17µs p(99.9)=1.03ms
     http_req_sending...............: avg=35.91µs  min=5.77µs  med=14.67µs  max=130.98ms p(90)=22.02µs  p(95)=25.33µs  p(99.9)=2.29ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=461.49ms min=3.96ms  med=427.05ms max=1.93s    p(90)=908.71ms p(95)=988.13ms p(99.9)=1.5s  
     http_reqs......................: 31111   476.909425/s
     iteration_duration.............: avg=477.19ms min=29.88ms med=444.75ms max=1.93s    p(90)=913.35ms p(95)=991.48ms p(99.9)=1.51s 
     iterations.....................: 30111   461.580139/s
     success_rate...................: 100.00% ✓ 30111      ✗ 0    
     vus............................: 68      min=0        max=496
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

     checks.........................: 100.00% ✓ 41493      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   261 kB/s
     http_req_blocked...............: avg=18.72µs  min=1.31µs  med=3.74µs   max=47.23ms p(90)=5.62µs   p(95)=7.64µs   p(99.9)=2.46ms
     http_req_connecting............: avg=13.2µs   min=0s      med=0s       max=47.16ms p(90)=0s       p(95)=0s       p(99.9)=2.43ms
     http_req_duration..............: avg=983.64ms min=6.39ms  med=876.27ms max=6.15s   p(90)=1.94s    p(95)=2.22s    p(99.9)=5.51s 
       { expected_response:true }...: avg=983.64ms min=6.39ms  med=876.27ms max=6.15s   p(90)=1.94s    p(95)=2.22s    p(99.9)=5.51s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14831
     http_req_receiving.............: avg=110.71µs min=38.09µs med=100.84µs max=58.22ms p(90)=139.44µs p(95)=151.47µs p(99.9)=1.19ms
     http_req_sending...............: avg=31.5µs   min=6.13µs  med=18.79µs  max=25.65ms p(90)=24.59µs  p(95)=29.54µs  p(99.9)=2.37ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=983.5ms  min=6.28ms  med=876.16ms max=6.15s   p(90)=1.94s    p(95)=2.22s    p(99.9)=5.51s 
     http_reqs......................: 14831   217.201215/s
     iteration_duration.............: avg=1.05s    min=45.93ms med=964.33ms max=6.16s   p(90)=1.96s    p(95)=2.24s    p(99.9)=5.58s 
     iterations.....................: 13831   202.556133/s
     success_rate...................: 100.00% ✓ 13831      ✗ 0    
     vus............................: 68      min=0        max=500
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

     checks.........................: 100.00% ✓ 40032      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=16.97µs  min=1.22µs  med=3.67µs   max=5.12ms   p(90)=5.49µs   p(95)=7.15µs   p(99.9)=2.77ms
     http_req_connecting............: avg=11.3µs   min=0s      med=0s       max=5.06ms   p(90)=0s       p(95)=0s       p(99.9)=2.75ms
     http_req_duration..............: avg=1.01s    min=8.79ms  med=917.51ms max=4.24s    p(90)=2.04s    p(95)=2.21s    p(99.9)=3.73s 
       { expected_response:true }...: avg=1.01s    min=8.79ms  med=917.51ms max=4.24s    p(90)=2.04s    p(95)=2.21s    p(99.9)=3.73s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14344
     http_req_receiving.............: avg=118.08µs min=34.52µs med=99.89µs  max=119.08ms p(90)=140.79µs p(95)=154.74µs p(99.9)=1.02ms
     http_req_sending...............: avg=33.11µs  min=5.81µs  med=18.55µs  max=24.97ms  p(90)=24.58µs  p(95)=30.63µs  p(99.9)=3.66ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=1.01s    min=8.69ms  med=917.39ms max=4.24s    p(90)=2.04s    p(95)=2.21s    p(99.9)=3.73s 
     http_reqs......................: 14344   204.79856/s
     iteration_duration.............: avg=1.09s    min=44.32ms med=1.02s    max=4.24s    p(90)=2.05s    p(95)=2.21s    p(99.9)=3.82s 
     iterations.....................: 13344   190.520914/s
     success_rate...................: 100.00% ✓ 13344      ✗ 0    
     vus............................: 56      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

