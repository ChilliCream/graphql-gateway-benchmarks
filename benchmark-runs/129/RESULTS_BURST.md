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
| hive-router | v0.0.43 | 2,664 | 2,792 | 2,633 | 2.1% |  |
| hotchocolate | 16.0.0-rc.1.23 | 2,046 | 2,096 | 2,029 | 1.0% |  |
| cosmo | 0.298.0 | 1,165 | 1,186 | 1,157 | 1.0% | non-compatible response (5 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 556 | 564 | 550 | 0.7% |  |
| hive-gateway | 2.5.14 | 243 | 246 | 241 | 0.9% |  |
| apollo-gateway | 2.13.3 | 200 | 204 | 196 | 1.2% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (37724 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (537887 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,199 | 2,312 | 2,162 | 2.4% |  |
| hotchocolate | 16.0.0-rc.1.23 | 1,890 | 1,920 | 1,869 | 0.9% |  |
| cosmo | 0.298.0 | 1,160 | 1,165 | 1,156 | 0.3% | non-compatible response (9 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 526 | 536 | 522 | 1.1% |  |
| hive-gateway | 2.5.14 | 248 | 251 | 245 | 1.0% |  |
| apollo-gateway | 2.13.3 | 204 | 207 | 203 | 0.6% |  |
| apollo-router | — | — | — | — | — | benchmark run failed |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (376888 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 492021      ✗ 0     
     data_received..................: 15 GB   234 MB/s
     data_sent......................: 198 MB  3.2 MB/s
     http_req_blocked...............: avg=24.86µs  min=952ns   med=2.31µs  max=91.74ms  p(90)=3.78µs   p(95)=4.87µs   p(99.9)=3.11ms  
     http_req_connecting............: avg=21.81µs  min=0s      med=0s      max=91.57ms  p(90)=0s       p(95)=0s       p(99.9)=2.99ms  
     http_req_duration..............: avg=86.11ms  min=1.58ms  med=81.57ms max=322.07ms p(90)=164.36ms p(95)=179.62ms p(99.9)=244.93ms
       { expected_response:true }...: avg=86.11ms  min=1.58ms  med=81.57ms max=322.07ms p(90)=164.36ms p(95)=179.62ms p(99.9)=244.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165007
     http_req_receiving.............: avg=379.36µs min=27.26µs med=56.52µs max=61.87ms  p(90)=249.36µs p(95)=413.25µs p(99.9)=35.96ms 
     http_req_sending...............: avg=82.72µs  min=5.21µs  med=9.8µs   max=194.85ms p(90)=18.51µs  p(95)=130.62µs p(99.9)=11.8ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.64ms  min=1.52ms  med=81.29ms max=318ms    p(90)=163.71ms p(95)=178.3ms  p(99.9)=242.02ms
     http_reqs......................: 165007  2664.377379/s
     iteration_duration.............: avg=86.92ms  min=2.22ms  med=82.5ms  max=392.83ms p(90)=164.86ms p(95)=180.16ms p(99.9)=248.05ms
     iterations.....................: 164007  2648.230323/s
     success_rate...................: 100.00% ✓ 164007      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.23)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 382749      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=15.45µs  min=1.06µs  med=2.61µs   max=43.05ms  p(90)=4.1µs    p(95)=5.07µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=12.18µs  min=0s      med=0s       max=42.98ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=110.67ms min=2.42ms  med=106.22ms max=524.11ms p(90)=210.02ms p(95)=232.89ms p(99.9)=366.46ms
       { expected_response:true }...: avg=110.67ms min=2.42ms  med=106.22ms max=524.11ms p(90)=210.02ms p(95)=232.89ms p(99.9)=366.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128583
     http_req_receiving.............: avg=1.29ms   min=52.07µs med=149.65µs max=197.65ms p(90)=1.33ms   p(95)=3.24ms   p(99.9)=112.83ms
     http_req_sending...............: avg=66.49µs  min=5.36µs  med=10.3µs   max=168.98ms p(90)=19.37µs  p(95)=129.57µs p(99.9)=8.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=109.31ms min=2.33ms  med=104.88ms max=524.02ms p(90)=208.25ms p(95)=229.85ms p(99.9)=355.77ms
     http_reqs......................: 128583  2046.793752/s
     iteration_duration.............: avg=111.81ms min=3.6ms   med=107.54ms max=524.34ms p(90)=210.62ms p(95)=233.59ms p(99.9)=367.21ms
     iterations.....................: 127583  2030.875678/s
     success_rate...................: 100.00% ✓ 127583      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 215547      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=7.17µs   min=1.12µs  med=2.5µs    max=11.24ms  p(90)=3.97µs   p(95)=4.8µs    p(99.9)=627.52µs
     http_req_connecting............: avg=3.99µs   min=0s      med=0s       max=11.18ms  p(90)=0s       p(95)=0s       p(99.9)=536.43µs
     http_req_duration..............: avg=195.85ms min=2.08ms  med=196.32ms max=630.11ms p(90)=361.34ms p(95)=388.45ms p(99.9)=553.15ms
       { expected_response:true }...: avg=195.85ms min=2.08ms  med=196.32ms max=630.11ms p(90)=361.34ms p(95)=388.45ms p(99.9)=553.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72849
     http_req_receiving.............: avg=77.95µs  min=29.95µs med=62.4µs   max=25.36ms  p(90)=97.07µs  p(95)=112.34µs p(99.9)=1.56ms  
     http_req_sending...............: avg=32.06µs  min=5.51µs  med=10.88µs  max=183.53ms p(90)=16.76µs  p(95)=20.32µs  p(99.9)=4.1ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.74ms min=2ms     med=196.22ms max=630.05ms p(90)=361.24ms p(95)=388.36ms p(99.9)=553.08ms
     http_reqs......................: 72849   1165.488138/s
     iteration_duration.............: avg=198.81ms min=4.17ms  med=199.54ms max=630.35ms p(90)=362.31ms p(95)=389.39ms p(99.9)=553.47ms
     iterations.....................: 71849   1149.489454/s
     success_rate...................: 100.00% ✓ 71849       ✗ 0    
     vus............................: 81      min=0         max=494
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 104436     ✗ 0    
     data_received..................: 3.1 GB  49 MB/s
     data_sent......................: 43 MB   668 kB/s
     http_req_blocked...............: avg=9.51µs   min=1.15µs  med=3.02µs   max=19.11ms  p(90)=4.78µs   p(95)=5.8µs    p(99.9)=1.64ms 
     http_req_connecting............: avg=5.34µs   min=0s      med=0s       max=19.04ms  p(90)=0s       p(95)=0s       p(99.9)=1.57ms 
     http_req_duration..............: avg=400.55ms min=3.62ms  med=369.33ms max=1.84s    p(90)=795.44ms p(95)=866.72ms p(99.9)=1.29s  
       { expected_response:true }...: avg=400.55ms min=3.62ms  med=369.33ms max=1.84s    p(90)=795.44ms p(95)=866.72ms p(99.9)=1.29s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 35812
     http_req_receiving.............: avg=160.2µs  min=30.71µs med=76.2µs   max=176.12ms p(90)=112.4µs  p(95)=125.4µs  p(99.9)=14.13ms
     http_req_sending...............: avg=27.05µs  min=5.74µs  med=13.29µs  max=25.34ms  p(90)=20.39µs  p(95)=23.67µs  p(99.9)=3ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=400.36ms min=3.54ms  med=369.21ms max=1.84s    p(90)=795.34ms p(95)=866.58ms p(99.9)=1.29s  
     http_reqs......................: 35812   556.21122/s
     iteration_duration.............: avg=412.29ms min=8.83ms  med=384.69ms max=1.84s    p(90)=799.79ms p(95)=868.99ms p(99.9)=1.3s   
     iterations.....................: 34812   540.679799/s
     success_rate...................: 100.00% ✓ 34812      ✗ 0    
     vus............................: 75      min=0        max=496
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 46389      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   293 kB/s
     http_req_blocked...............: avg=16.82µs  min=1.16µs  med=3.57µs   max=29.79ms  p(90)=5.39µs   p(95)=6.76µs   p(99.9)=2.5ms  
     http_req_connecting............: avg=11.68µs  min=0s      med=0s       max=29.73ms  p(90)=0s       p(95)=0s       p(99.9)=2.47ms 
     http_req_duration..............: avg=861.9ms  min=5.99ms  med=745.75ms max=20.35s   p(90)=1.44s    p(95)=1.63s    p(99.9)=19.26s 
       { expected_response:true }...: avg=861.9ms  min=5.99ms  med=745.75ms max=20.35s   p(90)=1.44s    p(95)=1.63s    p(99.9)=19.26s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16463
     http_req_receiving.............: avg=255.29µs min=33.8µs  med=93.76µs  max=142.45ms p(90)=132.35µs p(95)=145.22µs p(99.9)=85.25ms
     http_req_sending...............: avg=26.5µs   min=6.04µs  med=16.8µs   max=8.14ms   p(90)=23.06µs  p(95)=27.53µs  p(99.9)=3.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=861.62ms min=5.86ms  med=745.63ms max=20.35s   p(90)=1.44s    p(95)=1.63s    p(99.9)=19.26s 
     http_reqs......................: 16463   243.028682/s
     iteration_duration.............: avg=917.72ms min=11.23ms med=812.51ms max=20.35s   p(90)=1.46s    p(95)=1.64s    p(99.9)=19.28s 
     iterations.....................: 15463   228.266568/s
     success_rate...................: 100.00% ✓ 15463      ✗ 0    
     vus............................: 94      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 41766      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   246 kB/s
     http_req_blocked...............: avg=15.95µs  min=1.28µs  med=3.4µs    max=34.59ms p(90)=5.04µs   p(95)=6.78µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=10.63µs  min=0s      med=0s       max=34.52ms p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=456.75ms min=8.42ms  med=522.65ms max=1.32s   p(90)=764.81ms p(95)=820.15ms p(99.9)=1.13s   
       { expected_response:true }...: avg=456.75ms min=8.42ms  med=522.65ms max=1.32s   p(90)=764.81ms p(95)=820.15ms p(99.9)=1.13s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14922
     http_req_receiving.............: avg=97.34µs  min=33.02µs med=90.55µs  max=2.04ms  p(90)=131.63µs p(95)=145.02µs p(99.9)=904.51µs
     http_req_sending...............: avg=36.49µs  min=6.01µs  med=16.22µs  max=72.64ms p(90)=22.5µs   p(95)=27.54µs  p(99.9)=3.11ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=456.62ms min=8.33ms  med=522.51ms max=1.32s   p(90)=764.71ms p(95)=820.01ms p(99.9)=1.13s   
     http_reqs......................: 14922   200.589146/s
     iteration_duration.............: avg=489.46ms min=14.54ms med=553.67ms max=1.33s   p(90)=769.7ms  p(95)=829.29ms p(99.9)=1.14s   
     iterations.....................: 13922   187.146635/s
     success_rate...................: 100.00% ✓ 13922      ✗ 0    
     vus............................: 68      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 405969      ✗ 0     
     data_received..................: 12 GB   192 MB/s
     data_sent......................: 164 MB  2.6 MB/s
     http_req_blocked...............: avg=20.42µs  min=1.04µs  med=2.46µs   max=64.45ms  p(90)=4.18µs   p(95)=5.41µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=17.16µs  min=0s      med=0s       max=64.39ms  p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=104.34ms min=1.57ms  med=99.2ms   max=331.48ms p(90)=199.57ms p(95)=215.5ms  p(99.9)=263.45ms
       { expected_response:true }...: avg=104.34ms min=1.57ms  med=99.2ms   max=331.48ms p(90)=199.57ms p(95)=215.5ms  p(99.9)=263.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136323
     http_req_receiving.............: avg=174.53µs min=29.06µs med=61.04µs  max=159ms    p(90)=166.11µs p(95)=406.15µs p(99.9)=16.75ms 
     http_req_sending...............: avg=77.28µs  min=5.18µs  med=10.72µs  max=277.25ms p(90)=20.64µs  p(95)=135.96µs p(99.9)=10.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.08ms min=1.52ms  med=98.96ms  max=331.41ms p(90)=199.22ms p(95)=215.05ms p(99.9)=262.55ms
     http_reqs......................: 136323  2199.990997/s
     iteration_duration.............: avg=105.38ms min=3.45ms  med=100.37ms max=374.59ms p(90)=200.07ms p(95)=215.99ms p(99.9)=264.71ms
     iterations.....................: 135323  2183.85292/s
     success_rate...................: 100.00% ✓ 135323      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.23)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 350187      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 141 MB  2.3 MB/s
     http_req_blocked...............: avg=12.01µs  min=1.01µs  med=2.47µs   max=55.69ms  p(90)=4.19µs   p(95)=5.28µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=8.73µs   min=0s      med=0s       max=55.64ms  p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=120.93ms min=1.84ms  med=114.15ms max=815.86ms p(90)=226.89ms p(95)=252.11ms p(99.9)=646.93ms
       { expected_response:true }...: avg=120.93ms min=1.84ms  med=114.15ms max=815.86ms p(90)=226.89ms p(95)=252.11ms p(99.9)=646.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 117729
     http_req_receiving.............: avg=1.3ms    min=52.95µs med=140.81µs max=299.73ms p(90)=1.59ms   p(95)=3.35ms   p(99.9)=98.99ms 
     http_req_sending...............: avg=53.76µs  min=5.29µs  med=10.35µs  max=46.54ms  p(90)=19.66µs  p(95)=118.46µs p(99.9)=7.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.57ms min=1.76ms  med=112.82ms max=815.38ms p(90)=225.03ms p(95)=249.18ms p(99.9)=644.86ms
     http_reqs......................: 117729  1890.991957/s
     iteration_duration.............: avg=122.23ms min=2.96ms  med=115.71ms max=816.05ms p(90)=227.55ms p(95)=252.92ms p(99.9)=647.36ms
     iterations.....................: 116729  1874.929713/s
     success_rate...................: 100.00% ✓ 116729      ✗ 0     
     vus............................: 71      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 215124      ✗ 0    
     data_received..................: 6.4 GB  102 MB/s
     data_sent......................: 87 MB   1.4 MB/s
     http_req_blocked...............: avg=8.23µs   min=1.12µs  med=3.02µs   max=46.44ms  p(90)=4.83µs   p(95)=5.84µs   p(99.9)=750.98µs
     http_req_connecting............: avg=4.37µs   min=0s      med=0s       max=46.34ms  p(90)=0s       p(95)=0s       p(99.9)=636.14µs
     http_req_duration..............: avg=196.26ms min=2.12ms  med=198.57ms max=516.23ms p(90)=361.07ms p(95)=387.52ms p(99.9)=466.08ms
       { expected_response:true }...: avg=196.26ms min=2.12ms  med=198.57ms max=516.23ms p(90)=361.07ms p(95)=387.52ms p(99.9)=466.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 72708
     http_req_receiving.............: avg=89.1µs   min=28.54µs med=69.84µs  max=103.56ms p(90)=110µs    p(95)=128.49µs p(99.9)=2.06ms  
     http_req_sending...............: avg=40.43µs  min=5.41µs  med=12.69µs  max=115.34ms p(90)=20.34µs  p(95)=24.69µs  p(99.9)=4.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.13ms min=2.04ms  med=198.46ms max=516.14ms p(90)=360.95ms p(95)=387.4ms  p(99.9)=466.01ms
     http_reqs......................: 72708   1160.79506/s
     iteration_duration.............: avg=199.25ms min=4.81ms  med=202.1ms  max=516.4ms  p(90)=362.01ms p(95)=388.17ms p(99.9)=466.42ms
     iterations.....................: 71708   1144.829898/s
     success_rate...................: 100.00% ✓ 71708       ✗ 0    
     vus............................: 87      min=0         max=499
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 99393      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   632 kB/s
     http_req_blocked...............: avg=10.05µs  min=1.14µs  med=3.14µs   max=35.59ms p(90)=4.85µs   p(95)=5.81µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=5.85µs   min=0s      med=0s       max=35.53ms p(90)=0s       p(95)=0s       p(99.9)=1.34ms  
     http_req_duration..............: avg=420.47ms min=3.87ms  med=386.38ms max=1.88s   p(90)=833.22ms p(95)=912.03ms p(99.9)=1.31s   
       { expected_response:true }...: avg=420.47ms min=3.87ms  med=386.38ms max=1.88s   p(90)=833.22ms p(95)=912.03ms p(99.9)=1.31s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34131
     http_req_receiving.............: avg=89.73µs  min=31.84µs med=80.5µs   max=88.86ms p(90)=116µs    p(95)=128.51µs p(99.9)=800.09µs
     http_req_sending...............: avg=30.67µs  min=5.65µs  med=13.98µs  max=54.09ms p(90)=20.98µs  p(95)=24.31µs  p(99.9)=3.47ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=420.35ms min=3.76ms  med=386.24ms max=1.88s   p(90)=833.12ms p(95)=911.9ms  p(99.9)=1.31s   
     http_reqs......................: 34131   526.155364/s
     iteration_duration.............: avg=433.4ms  min=13ms    med=405.5ms  max=1.88s   p(90)=837.38ms p(95)=915.06ms p(99.9)=1.32s   
     iterations.....................: 33131   510.739603/s
     success_rate...................: 100.00% ✓ 33131      ✗ 0    
     vus............................: 18      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 47445      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   299 kB/s
     http_req_blocked...............: avg=15.72µs  min=1.22µs  med=3.68µs   max=42.2ms  p(90)=5.52µs   p(95)=7µs     p(99.9)=1.86ms
     http_req_connecting............: avg=10.34µs  min=0s      med=0s       max=42.13ms p(90)=0s       p(95)=0s      p(99.9)=1.84ms
     http_req_duration..............: avg=864.2ms  min=5.89ms  med=785.83ms max=5.11s   p(90)=1.74s    p(95)=1.91s   p(99.9)=3.83s 
       { expected_response:true }...: avg=864.2ms  min=5.89ms  med=785.83ms max=5.11s   p(90)=1.74s    p(95)=1.91s   p(99.9)=3.83s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16815
     http_req_receiving.............: avg=111.44µs min=34.1µs  med=99.29µs  max=58.78ms p(90)=140.12µs p(95)=153.7µs p(99.9)=1.14ms
     http_req_sending...............: avg=28.31µs  min=6.23µs  med=17.71µs  max=20.27ms p(90)=23.84µs  p(95)=28.69µs p(99.9)=1.86ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=864.06ms min=5.75ms  med=785.72ms max=5.11s   p(90)=1.74s    p(95)=1.91s   p(99.9)=3.83s 
     http_reqs......................: 16815   248.714466/s
     iteration_duration.............: avg=918.88ms min=36.79ms med=853.27ms max=5.12s   p(90)=1.77s    p(95)=1.93s   p(99.9)=3.85s 
     iterations.....................: 15815   233.92324/s
     success_rate...................: 100.00% ✓ 15815      ✗ 0    
     vus............................: 86      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 39987      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=15.87µs  min=1.3µs   med=3.69µs   max=3.7ms   p(90)=5.54µs   p(95)=7.61µs   p(99.9)=2.73ms  
     http_req_connecting............: avg=10.32µs  min=0s      med=0s       max=3.63ms  p(90)=0s       p(95)=0s       p(99.9)=2.7ms   
     http_req_duration..............: avg=1.01s    min=8.77ms  med=929.66ms max=4.28s   p(90)=2.09s    p(95)=2.2s     p(99.9)=3.9s    
       { expected_response:true }...: avg=1.01s    min=8.77ms  med=929.66ms max=4.28s   p(90)=2.09s    p(95)=2.2s     p(99.9)=3.9s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 14329
     http_req_receiving.............: avg=107.38µs min=36.9µs  med=100.27µs max=18.91ms p(90)=141.03µs p(95)=154.19µs p(99.9)=901.32µs
     http_req_sending...............: avg=33.14µs  min=6.55µs  med=18.47µs  max=17.43ms p(90)=24.54µs  p(95)=30.27µs  p(99.9)=5.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.01s    min=8.62ms  med=929.53ms max=4.28s   p(90)=2.09s    p(95)=2.2s     p(99.9)=3.9s    
     http_reqs......................: 14329   204.547599/s
     iteration_duration.............: avg=1.09s    min=26.55ms med=1.01s    max=4.29s   p(90)=2.11s    p(95)=2.21s    p(99.9)=3.95s   
     iterations.....................: 13329   190.27252/s
     success_rate...................: 100.00% ✓ 13329      ✗ 0    
     vus............................: 57      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

