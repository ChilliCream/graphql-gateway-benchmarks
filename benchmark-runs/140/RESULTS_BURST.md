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
| hive-router | v0.0.43 | 2,761 | 2,873 | 2,683 | 2.3% |  |
| hotchocolate | 16.0.0-rc.1.29 | 2,025 | 2,078 | 2,011 | 1.0% |  |
| cosmo | 0.298.0 | 1,175 | 1,185 | 1,159 | 1.1% | non-compatible response (13 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 565 | 571 | 559 | 0.8% |  |
| hive-gateway | 2.5.14 | 249 | 251 | 246 | 0.7% |  |
| apollo-gateway | 2.13.3 | 204 | 209 | 202 | 1.2% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (27982 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (504678 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,375 | 2,476 | 2,340 | 1.9% |  |
| hotchocolate | 16.0.0-rc.1.29 | 1,922 | 1,970 | 1,898 | 1.2% |  |
| cosmo | 0.298.0 | 1,114 | 1,114 | 1,102 | 0.8% | non-compatible response (10 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 540 | 548 | 532 | 1.0% |  |
| hive-gateway | 2.5.14 | 247 | 251 | 243 | 0.9% |  |
| apollo-gateway | 2.13.3 | 205 | 207 | 202 | 0.9% |  |
| apollo-router | v2.12.1 | — | — | — | — | non-compatible response (43386 across 9/9 runs) |
| grafbase | 0.53.2 | — | — | — | — | non-compatible response (273814 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 509175      ✗ 0     
     data_received..................: 15 GB   242 MB/s
     data_sent......................: 205 MB  3.3 MB/s
     http_req_blocked...............: avg=36.79µs  min=1.03µs med=2.65µs  max=99.24ms  p(90)=4.25µs   p(95)=5.39µs   p(99.9)=8.9ms   
     http_req_connecting............: avg=33.01µs  min=0s     med=0s      max=99.09ms  p(90)=0s       p(95)=0s       p(99.9)=8.54ms  
     http_req_duration..............: avg=83.15ms  min=1.6ms  med=76.19ms max=354.4ms  p(90)=163.17ms p(95)=184.01ms p(99.9)=246.93ms
       { expected_response:true }...: avg=83.15ms  min=1.6ms  med=76.19ms max=354.4ms  p(90)=163.17ms p(95)=184.01ms p(99.9)=246.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 170725
     http_req_receiving.............: avg=479.29µs min=28.3µs med=56.85µs max=123.12ms p(90)=247.46µs p(95)=434.97µs p(99.9)=51.55ms 
     http_req_sending...............: avg=99.2µs   min=5.35µs med=10.27µs max=291.4ms  p(90)=19.68µs  p(95)=138.36µs p(99.9)=16.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=82.57ms  min=1.53ms med=75.7ms  max=304.62ms p(90)=162.4ms  p(95)=182.08ms p(99.9)=238.86ms
     http_reqs......................: 170725  2761.795623/s
     iteration_duration.............: avg=83.99ms  min=2.27ms med=77.09ms max=436.34ms p(90)=163.76ms p(95)=184.71ms p(99.9)=249.8ms 
     iterations.....................: 169725  2745.618756/s
     success_rate...................: 100.00% ✓ 169725      ✗ 0     
     vus............................: 96      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 378000      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=17.54µs  min=1.03µs  med=2.45µs   max=68.2ms   p(90)=3.9µs    p(95)=4.83µs   p(99.9)=2.05ms  
     http_req_connecting............: avg=14.49µs  min=0s      med=0s       max=68.13ms  p(90)=0s       p(95)=0s       p(99.9)=2.03ms  
     http_req_duration..............: avg=112.05ms min=2.39ms  med=107.78ms max=632.52ms p(90)=213.33ms p(95)=235.54ms p(99.9)=371.9ms 
       { expected_response:true }...: avg=112.05ms min=2.39ms  med=107.78ms max=632.52ms p(90)=213.33ms p(95)=235.54ms p(99.9)=371.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 127000
     http_req_receiving.............: avg=1.23ms   min=52.73µs med=150.23µs max=223.23ms p(90)=1.34ms   p(95)=3.21ms   p(99.9)=99.28ms 
     http_req_sending...............: avg=65µs     min=5.22µs  med=10.06µs  max=166.9ms  p(90)=18.65µs  p(95)=124.08µs p(99.9)=8.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.75ms min=2.28ms  med=106.61ms max=632.44ms p(90)=211.46ms p(95)=232.72ms p(99.9)=364.89ms
     http_reqs......................: 127000  2025.786153/s
     iteration_duration.............: avg=113.23ms min=3.73ms  med=109.14ms max=632.7ms  p(90)=213.9ms  p(95)=236.22ms p(99.9)=373.63ms
     iterations.....................: 126000  2009.835081/s
     success_rate...................: 100.00% ✓ 126000      ✗ 0     
     vus............................: 91      min=0         max=498 
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

     checks.........................: 100.00% ✓ 217320      ✗ 0    
     data_received..................: 6.4 GB  103 MB/s
     data_sent......................: 88 MB   1.4 MB/s
     http_req_blocked...............: avg=6.46µs   min=1.11µs  med=2.46µs   max=17.31ms  p(90)=3.88µs   p(95)=4.67µs   p(99.9)=618.73µs
     http_req_connecting............: avg=3.35µs   min=0s      med=0s       max=17.15ms  p(90)=0s       p(95)=0s       p(99.9)=531.63µs
     http_req_duration..............: avg=194.28ms min=2.07ms  med=195.11ms max=588.06ms p(90)=360.62ms p(95)=388.06ms p(99.9)=475.28ms
       { expected_response:true }...: avg=194.28ms min=2.07ms  med=195.11ms max=588.06ms p(90)=360.62ms p(95)=388.06ms p(99.9)=475.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 73440
     http_req_receiving.............: avg=78.81µs  min=28.31µs med=60.5µs   max=108.59ms p(90)=94.08µs  p(95)=108.29µs p(99.9)=1.66ms  
     http_req_sending...............: avg=33.22µs  min=5.49µs  med=10.8µs   max=188.03ms p(90)=16.51µs  p(95)=20.17µs  p(99.9)=4.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.17ms min=1.97ms  med=194.96ms max=587.99ms p(90)=360.52ms p(95)=387.89ms p(99.9)=475.15ms
     http_reqs......................: 73440   1175.537232/s
     iteration_duration.............: avg=197.2ms  min=4.55ms  med=198.43ms max=588.22ms p(90)=361.53ms p(95)=388.7ms  p(99.9)=476.27ms
     iterations.....................: 72440   1159.530462/s
     success_rate...................: 100.00% ✓ 72440       ✗ 0    
     vus............................: 82      min=0         max=493
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

     checks.........................: 100.00% ✓ 106320     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   679 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.08µs  med=2.79µs   max=3.15ms   p(90)=4.54µs   p(95)=5.53µs   p(99.9)=682.18µs
     http_req_connecting............: avg=3.28µs   min=0s      med=0s       max=2.74ms   p(90)=0s       p(95)=0s       p(99.9)=624.32µs
     http_req_duration..............: avg=393.63ms min=3.55ms  med=362.55ms max=1.55s    p(90)=779.95ms p(95)=845.79ms p(99.9)=1.23s   
       { expected_response:true }...: avg=393.63ms min=3.55ms  med=362.55ms max=1.55s    p(90)=779.95ms p(95)=845.79ms p(99.9)=1.23s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36440
     http_req_receiving.............: avg=87.7µs   min=30.44µs med=73.88µs  max=191.54ms p(90)=109.23µs p(95)=121.87µs p(99.9)=825.33µs
     http_req_sending...............: avg=26.61µs  min=5.64µs  med=12.64µs  max=84.1ms   p(90)=19.72µs  p(95)=23.23µs  p(99.9)=2.35ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=393.51ms min=3.49ms  med=362.33ms max=1.55s    p(90)=779.83ms p(95)=845.69ms p(99.9)=1.23s   
     http_reqs......................: 36440   565.860082/s
     iteration_duration.............: avg=404.98ms min=9.94ms  med=376.59ms max=1.56s    p(90)=783.28ms p(95)=848.56ms p(99.9)=1.23s   
     iterations.....................: 35440   550.331539/s
     success_rate...................: 100.00% ✓ 35440      ✗ 0    
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

     checks.........................: 100.00% ✓ 47958      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   301 kB/s
     http_req_blocked...............: avg=15.62µs  min=1.28µs  med=3.51µs   max=28.21ms p(90)=5.4µs   p(95)=7.1µs   p(99.9)=2.65ms
     http_req_connecting............: avg=10.52µs  min=0s      med=0s       max=28.14ms p(90)=0s      p(95)=0s      p(99.9)=2.62ms
     http_req_duration..............: avg=847.64ms min=5.83ms  med=726.91ms max=21.23s  p(90)=1.41s   p(95)=1.58s   p(99.9)=17.77s
       { expected_response:true }...: avg=847.64ms min=5.83ms  med=726.91ms max=21.23s  p(90)=1.41s   p(95)=1.58s   p(99.9)=17.77s
     http_req_failed................: 0.00%   ✓ 0          ✗ 16986
     http_req_receiving.............: avg=118.54µs min=34.78µs med=95.21µs  max=67.51ms p(90)=134.7µs p(95)=148.2µs p(99.9)=1.71ms
     http_req_sending...............: avg=34.59µs  min=5.84µs  med=17.44µs  max=42.32ms p(90)=23.95µs p(95)=28.71µs p(99.9)=3.91ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s      p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=847.49ms min=5.7ms   med=726.82ms max=21.23s  p(90)=1.41s   p(95)=1.57s   p(99.9)=17.77s
     http_reqs......................: 16986   249.952388/s
     iteration_duration.............: avg=900.68ms min=45.82ms med=792.59ms max=21.23s  p(90)=1.43s   p(95)=1.59s   p(99.9)=17.78s
     iterations.....................: 15986   235.237188/s
     success_rate...................: 100.00% ✓ 15986      ✗ 0    
     vus............................: 17      min=0        max=500
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

     checks.........................: 100.00% ✓ 42804      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   251 kB/s
     http_req_blocked...............: avg=19.9µs   min=1.21µs  med=3.38µs   max=44.74ms p(90)=5.02µs   p(95)=6.63µs   p(99.9)=3.41ms
     http_req_connecting............: avg=14.41µs  min=0s      med=0s       max=44.67ms p(90)=0s       p(95)=0s       p(99.9)=3.29ms
     http_req_duration..............: avg=467.59ms min=8.56ms  med=536.16ms max=1.39s   p(90)=765.91ms p(95)=839.19ms p(99.9)=1.14s 
       { expected_response:true }...: avg=467.59ms min=8.56ms  med=536.16ms max=1.39s   p(90)=765.91ms p(95)=839.19ms p(99.9)=1.14s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15268
     http_req_receiving.............: avg=103.57µs min=30.48µs med=93.12µs  max=27.74ms p(90)=133.05µs p(95)=146.48µs p(99.9)=1.13ms
     http_req_sending...............: avg=35.72µs  min=6.04µs  med=16.87µs  max=44.27ms p(90)=22.79µs  p(95)=27.89µs  p(99.9)=3.02ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=467.46ms min=8.41ms  med=536.04ms max=1.39s   p(90)=765.78ms p(95)=839.07ms p(99.9)=1.14s 
     http_reqs......................: 15268   204.92172/s
     iteration_duration.............: avg=500.23ms min=14.78ms med=566.61ms max=1.4s    p(90)=771.92ms p(95)=847.12ms p(99.9)=1.15s 
     iterations.....................: 14268   191.500072/s
     success_rate...................: 100.00% ✓ 14268      ✗ 0    
     vus............................: 67      min=0        max=497
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

     checks.........................: 100.00% ✓ 439575      ✗ 0     
     data_received..................: 13 GB   208 MB/s
     data_sent......................: 177 MB  2.9 MB/s
     http_req_blocked...............: avg=30.4µs   min=1.06µs  med=3.01µs  max=83.29ms  p(90)=4.99µs   p(95)=6.38µs   p(99.9)=5.57ms  
     http_req_connecting............: avg=26.4µs   min=0s      med=0s      max=83.09ms  p(90)=0s       p(95)=0s       p(99.9)=5.33ms  
     http_req_duration..............: avg=96.33ms  min=1.67ms  med=89.85ms max=340.25ms p(90)=187.67ms p(95)=206.66ms p(99.9)=258.59ms
       { expected_response:true }...: avg=96.33ms  min=1.67ms  med=89.85ms max=340.25ms p(90)=187.67ms p(95)=206.66ms p(99.9)=258.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 147525
     http_req_receiving.............: avg=372.89µs min=29.23µs med=63.52µs max=69.17ms  p(90)=223.7µs  p(95)=470.26µs p(99.9)=36ms    
     http_req_sending...............: avg=99.7µs   min=5.55µs  med=12.02µs max=216.39ms p(90)=23.49µs  p(95)=151.01µs p(99.9)=15.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.85ms  min=1.62ms  med=89.57ms max=339.64ms p(90)=186.76ms p(95)=205.25ms p(99.9)=256.01ms
     http_reqs......................: 147525  2375.151351/s
     iteration_duration.............: avg=97.31ms  min=5.41ms  med=90.9ms  max=375.82ms p(90)=188.33ms p(95)=207.28ms p(99.9)=260.39ms
     iterations.....................: 146525  2359.051359/s
     success_rate...................: 100.00% ✓ 146525      ✗ 0     
     vus............................: 63      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.29)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 355806      ✗ 0     
     data_received..................: 11 GB   169 MB/s
     data_sent......................: 144 MB  2.3 MB/s
     http_req_blocked...............: avg=15.89µs  min=1µs     med=2.73µs   max=53.68ms  p(90)=4.38µs   p(95)=5.48µs   p(99.9)=2.28ms  
     http_req_connecting............: avg=12.54µs  min=0s      med=0s       max=53.53ms  p(90)=0s       p(95)=0s       p(99.9)=2.2ms   
     http_req_duration..............: avg=119.02ms min=1.78ms  med=112.88ms max=918.97ms p(90)=222.83ms p(95)=249.02ms p(99.9)=685.93ms
       { expected_response:true }...: avg=119.02ms min=1.78ms  med=112.88ms max=918.97ms p(90)=222.83ms p(95)=249.02ms p(99.9)=685.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 119602
     http_req_receiving.............: avg=1.33ms   min=52.24µs med=143.77µs max=296.68ms p(90)=1.6ms    p(95)=3.5ms    p(99.9)=101.65ms
     http_req_sending...............: avg=62.96µs  min=5.31µs  med=10.81µs  max=85.08ms  p(90)=20.6µs   p(95)=128.79µs p(99.9)=8.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=117.63ms min=1.7ms   med=111.56ms max=867.83ms p(90)=221.03ms p(95)=246.24ms p(99.9)=680.08ms
     http_reqs......................: 119602  1922.196539/s
     iteration_duration.............: avg=120.31ms min=3.29ms  med=114.18ms max=919.2ms  p(90)=223.53ms p(95)=249.83ms p(99.9)=686.43ms
     iterations.....................: 118602  1906.12493/s
     success_rate...................: 100.00% ✓ 118602      ✗ 0     
     vus............................: 68      min=0         max=495 
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

     checks.........................: 100.00% ✓ 206349      ✗ 0    
     data_received..................: 6.1 GB  97 MB/s
     data_sent......................: 84 MB   1.3 MB/s
     http_req_blocked...............: avg=7.92µs   min=1.09µs  med=2.63µs   max=20.14ms  p(90)=4.33µs   p(95)=5.26µs   p(99.9)=562.59µs
     http_req_connecting............: avg=4.59µs   min=0s      med=0s       max=20.07ms  p(90)=0s       p(95)=0s       p(99.9)=497.57µs
     http_req_duration..............: avg=204.53ms min=2.11ms  med=205.28ms max=549.95ms p(90)=378.32ms p(95)=404.89ms p(99.9)=486.78ms
       { expected_response:true }...: avg=204.53ms min=2.11ms  med=205.28ms max=549.95ms p(90)=378.32ms p(95)=404.89ms p(99.9)=486.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69783
     http_req_receiving.............: avg=86.86µs  min=29.44µs med=66.98µs  max=98.55ms  p(90)=104.55µs p(95)=121.09µs p(99.9)=1.68ms  
     http_req_sending...............: avg=32.63µs  min=5.57µs  med=11.74µs  max=124.63ms p(90)=18.62µs  p(95)=22.56µs  p(99.9)=3.89ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.41ms min=2.02ms  med=205.15ms max=549.87ms p(90)=378.16ms p(95)=404.79ms p(99.9)=486.69ms
     http_reqs......................: 69783   1114.015923/s
     iteration_duration.............: avg=207.75ms min=4.84ms  med=208.68ms max=550.21ms p(90)=379.17ms p(95)=405.59ms p(99.9)=486.96ms
     iterations.....................: 68783   1098.051922/s
     success_rate...................: 100.00% ✓ 68783       ✗ 0    
     vus............................: 87      min=0         max=498
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

     checks.........................: 100.00% ✓ 102120     ✗ 0    
     data_received..................: 3.1 GB  47 MB/s
     data_sent......................: 42 MB   649 kB/s
     http_req_blocked...............: avg=9.09µs   min=1.17µs  med=3.18µs   max=8.31ms   p(90)=5.02µs   p(95)=6.04µs   p(99.9)=1.35ms 
     http_req_connecting............: avg=4.7µs    min=0s      med=0s       max=8.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.16ms 
     http_req_duration..............: avg=409.28ms min=3.77ms  med=381.59ms max=1.93s    p(90)=810.4ms  p(95)=876.41ms p(99.9)=1.25s  
       { expected_response:true }...: avg=409.28ms min=3.77ms  med=381.59ms max=1.93s    p(90)=810.4ms  p(95)=876.41ms p(99.9)=1.25s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 35040
     http_req_receiving.............: avg=181.9µs  min=32.21µs med=82.45µs  max=219.07ms p(90)=119.56µs p(95)=133.77µs p(99.9)=13.45ms
     http_req_sending...............: avg=38.69µs  min=5.61µs  med=14.98µs  max=204.01ms p(90)=22.47µs  p(95)=25.93µs  p(99.9)=3.04ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=409.06ms min=3.69ms  med=381.46ms max=1.93s    p(90)=810.29ms p(95)=876.33ms p(99.9)=1.25s  
     http_reqs......................: 35040   540.414124/s
     iteration_duration.............: avg=421.53ms min=6.61ms  med=398.48ms max=1.93s    p(90)=815ms    p(95)=879.64ms p(99.9)=1.26s  
     iterations.....................: 34040   524.991346/s
     success_rate...................: 100.00% ✓ 34040      ✗ 0    
     vus............................: 96      min=0        max=500
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

     checks.........................: 100.00% ✓ 47394      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   297 kB/s
     http_req_blocked...............: avg=16.6µs   min=1.28µs  med=3.77µs   max=30.08ms  p(90)=5.73µs   p(95)=7.28µs   p(99.9)=2.67ms
     http_req_connecting............: avg=11.18µs  min=0s      med=0s       max=30.02ms  p(90)=0s       p(95)=0s       p(99.9)=2.64ms
     http_req_duration..............: avg=866.27ms min=5.85ms  med=786.34ms max=4.86s    p(90)=1.73s    p(95)=1.94s    p(99.9)=3.82s 
       { expected_response:true }...: avg=866.27ms min=5.85ms  med=786.34ms max=4.86s    p(90)=1.73s    p(95)=1.94s    p(99.9)=3.82s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16798
     http_req_receiving.............: avg=129.03µs min=37.31µs med=100.62µs max=113.51ms p(90)=140.16µs p(95)=153.61µs p(99.9)=1.67ms
     http_req_sending...............: avg=31.11µs  min=6.52µs  med=18.5µs   max=32.38ms  p(90)=24.84µs  p(95)=29.71µs  p(99.9)=2.6ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=866.11ms min=5.75ms  med=786.22ms max=4.86s    p(90)=1.73s    p(95)=1.94s    p(99.9)=3.82s 
     http_reqs......................: 16798   247.802815/s
     iteration_duration.............: avg=921.19ms min=18.09ms med=858.44ms max=4.88s    p(90)=1.74s    p(95)=1.94s    p(99.9)=3.86s 
     iterations.....................: 15798   233.050892/s
     success_rate...................: 100.00% ✓ 15798      ✗ 0    
     vus............................: 88      min=0        max=500
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

     checks.........................: 100.00% ✓ 40044      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=16.53µs  min=1.21µs  med=3.47µs   max=32.46ms p(90)=5.21µs   p(95)=6.89µs   p(99.9)=2.03ms  
     http_req_connecting............: avg=11.1µs   min=0s      med=0s       max=32.4ms  p(90)=0s       p(95)=0s       p(99.9)=2ms     
     http_req_duration..............: avg=1.01s    min=8.6ms   med=929.83ms max=4.28s   p(90)=2.06s    p(95)=2.22s    p(99.9)=3.65s   
       { expected_response:true }...: avg=1.01s    min=8.6ms   med=929.83ms max=4.28s   p(90)=2.06s    p(95)=2.22s    p(99.9)=3.65s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14348
     http_req_receiving.............: avg=108.61µs min=32.88µs med=94.28µs  max=95.81ms p(90)=135.89µs p(95)=149.11µs p(99.9)=930.93µs
     http_req_sending...............: avg=34.62µs  min=5.88µs  med=17.06µs  max=51.13ms p(90)=23.36µs  p(95)=29.01µs  p(99.9)=3.36ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.01s    min=8.5ms   med=929.69ms max=4.28s   p(90)=2.06s    p(95)=2.22s    p(99.9)=3.65s   
     http_reqs......................: 14348   205.109609/s
     iteration_duration.............: avg=1.09s    min=45.26ms med=1.02s    max=4.29s   p(90)=2.08s    p(95)=2.22s    p(99.9)=3.66s   
     iterations.....................: 13348   190.814264/s
     success_rate...................: 100.00% ✓ 13348      ✗ 0    
     vus............................: 41      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-174-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

