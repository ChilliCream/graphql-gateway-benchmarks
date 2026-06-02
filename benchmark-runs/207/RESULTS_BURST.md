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
| hive-router | v0.0.49 | 2,712 | 2,814 | 2,651 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,103 | 2,154 | 2,093 | 1.0% |  |
| cosmo | 0.307.0 | 1,200 | 1,200 | 1,200 | 0.0% | non-compatible response (18 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 492 | 499 | 486 | 0.8% |  |
| hive-gateway | 2.5.25 | 222 | 224 | 218 | 1.0% |  |
| apollo-gateway | 2.13.3 | 202 | 206 | 200 | 0.8% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (13871 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (484179 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,223 | 2,324 | 2,169 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,901 | 1,945 | 1,721 | 3.4% |  |
| cosmo | 0.307.0 | 1,140 | 1,140 | 1,129 | 0.7% | non-compatible response (16 across 7/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 482 | 488 | 478 | 0.8% |  |
| hive-gateway | 2.5.25 | 214 | 215 | 210 | 0.8% |  |
| apollo-gateway | 2.13.3 | 209 | 212 | 208 | 0.7% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (14470 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (260767 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 500553      ✗ 0     
     data_received..................: 15 GB   238 MB/s
     data_sent......................: 202 MB  3.3 MB/s
     http_req_blocked...............: avg=30.44µs  min=1.12µs  med=2.75µs  max=96.84ms  p(90)=4.36µs   p(95)=5.54µs   p(99.9)=5.88ms  
     http_req_connecting............: avg=26.59µs  min=0s      med=0s      max=96.75ms  p(90)=0s       p(95)=0s       p(99.9)=5.63ms  
     http_req_duration..............: avg=84.55ms  min=1.62ms  med=78.47ms max=301.7ms  p(90)=163.93ms p(95)=182.5ms  p(99.9)=251.06ms
       { expected_response:true }...: avg=84.55ms  min=1.62ms  med=78.47ms max=301.7ms  p(90)=163.93ms p(95)=182.5ms  p(99.9)=251.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 167851
     http_req_receiving.............: avg=326.73µs min=28.64µs med=57.54µs max=70.38ms  p(90)=251.46µs p(95)=432.01µs p(99.9)=37.11ms 
     http_req_sending...............: avg=94.64µs  min=5.4µs   med=10.71µs max=144.38ms p(90)=19.75µs  p(95)=139.68µs p(99.9)=14.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.13ms  min=1.57ms  med=78.17ms max=289.93ms p(90)=163.36ms p(95)=181.31ms p(99.9)=244.67ms
     http_reqs......................: 167851  2712.731671/s
     iteration_duration.............: avg=85.44ms  min=2.61ms  med=79.39ms max=408.18ms p(90)=164.69ms p(95)=183.51ms p(99.9)=256.58ms
     iterations.....................: 166851  2696.570125/s
     success_rate...................: 100.00% ✓ 166851      ✗ 0     
     vus............................: 53      min=0         max=499 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 392532      ✗ 0     
     data_received..................: 12 GB   184 MB/s
     data_sent......................: 158 MB  2.5 MB/s
     http_req_blocked...............: avg=20.28µs  min=982ns   med=2.64µs   max=104.5ms  p(90)=4.1µs    p(95)=5.1µs    p(99.9)=2.28ms  
     http_req_connecting............: avg=16.81µs  min=0s      med=0s       max=104.32ms p(90)=0s       p(95)=0s       p(99.9)=2.03ms  
     http_req_duration..............: avg=107.95ms min=2.36ms  med=101.16ms max=956.03ms p(90)=208.7ms  p(95)=244.22ms p(99.9)=427.16ms
       { expected_response:true }...: avg=107.95ms min=2.36ms  med=101.16ms max=956.03ms p(90)=208.7ms  p(95)=244.22ms p(99.9)=427.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 131844
     http_req_receiving.............: avg=1.73ms   min=51.74µs med=113.73µs max=357.03ms p(90)=1.29ms   p(95)=3.98ms   p(99.9)=141.75ms
     http_req_sending...............: avg=74.26µs  min=5.61µs  med=10.43µs  max=142.6ms  p(90)=19.13µs  p(95)=127.61µs p(99.9)=10.11ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=106.13ms min=2.28ms  med=100.09ms max=955.96ms p(90)=205.68ms p(95)=237.72ms p(99.9)=396.93ms
     http_reqs......................: 131844  2103.651564/s
     iteration_duration.............: avg=109.05ms min=3.76ms  med=102.45ms max=956.17ms p(90)=209.5ms  p(95)=245.17ms p(99.9)=427.45ms
     iterations.....................: 130844  2087.695953/s
     success_rate...................: 100.00% ✓ 130844      ✗ 0     
     vus............................: 87      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 222048      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.93µs   min=1.1µs   med=2.49µs   max=35.6ms   p(90)=4µs      p(95)=4.86µs   p(99.9)=382.43µs
     http_req_connecting............: avg=3.78µs   min=0s      med=0s       max=35.52ms  p(90)=0s       p(95)=0s       p(99.9)=320.52µs
     http_req_duration..............: avg=190.19ms min=2.05ms  med=192.96ms max=567.41ms p(90)=351.41ms p(95)=377.32ms p(99.9)=499.7ms 
       { expected_response:true }...: avg=190.19ms min=2.05ms  med=192.96ms max=567.41ms p(90)=351.41ms p(95)=377.32ms p(99.9)=499.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 75016
     http_req_receiving.............: avg=149.83µs min=30.03µs med=62µs     max=294.22ms p(90)=95.97µs  p(95)=110.39µs p(99.9)=3.02ms  
     http_req_sending...............: avg=29.89µs  min=5.66µs  med=10.9µs   max=16.82ms  p(90)=16.86µs  p(95)=20.52µs  p(99.9)=4.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190.01ms min=1.96ms  med=192.71ms max=567.32ms p(90)=351.25ms p(95)=377.2ms  p(99.9)=499.64ms
     http_reqs......................: 75016   1200.662033/s
     iteration_duration.............: avg=192.99ms min=4.89ms  med=196.02ms max=567.56ms p(90)=352.4ms  p(95)=378.15ms p(99.9)=500.65ms
     iterations.....................: 74016   1184.656621/s
     success_rate...................: 100.00% ✓ 74016       ✗ 0    
     vus............................: 79      min=0         max=493
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 92973      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   591 kB/s
     http_req_blocked...............: avg=11.2µs   min=1.19µs  med=2.98µs   max=49.06ms  p(90)=4.79µs   p(95)=5.92µs   p(99.9)=1.68ms 
     http_req_connecting............: avg=7.04µs   min=0s      med=0s       max=49ms     p(90)=0s       p(95)=0s       p(99.9)=1.56ms 
     http_req_duration..............: avg=449.01ms min=4.17ms  med=416.56ms max=1.92s    p(90)=881.65ms p(95)=954.92ms p(99.9)=1.44s  
       { expected_response:true }...: avg=449.01ms min=4.17ms  med=416.56ms max=1.92s    p(90)=881.65ms p(95)=954.92ms p(99.9)=1.44s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31991
     http_req_receiving.............: avg=89.72µs  min=32.54µs med=76.97µs  max=126.19ms p(90)=113.7µs  p(95)=127.34µs p(99.9)=851.9µs
     http_req_sending...............: avg=34.14µs  min=5.9µs   med=13.76µs  max=95.4ms   p(90)=21.24µs  p(95)=24.69µs  p(99.9)=2.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=448.88ms min=4.05ms  med=416.48ms max=1.92s    p(90)=881.54ms p(95)=954.8ms  p(99.9)=1.44s  
     http_reqs......................: 31991   492.167087/s
     iteration_duration.............: avg=463.74ms min=17.01ms med=433.73ms max=1.93s    p(90)=886.41ms p(95)=958.36ms p(99.9)=1.44s  
     iterations.....................: 30991   476.782539/s
     success_rate...................: 100.00% ✓ 30991      ✗ 0    
     vus............................: 58      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 42480      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   268 kB/s
     http_req_blocked...............: avg=15.85µs  min=1.39µs  med=3.59µs   max=4.47ms  p(90)=5.44µs   p(95)=7.39µs   p(99.9)=2.69ms
     http_req_connecting............: avg=10.22µs  min=0s      med=0s       max=4.44ms  p(90)=0s       p(95)=0s       p(99.9)=2.64ms
     http_req_duration..............: avg=952.44ms min=6.31ms  med=843.17ms max=15.89s  p(90)=1.75s    p(95)=1.91s    p(99.9)=13.45s
       { expected_response:true }...: avg=952.44ms min=6.31ms  med=843.17ms max=15.89s  p(90)=1.75s    p(95)=1.91s    p(99.9)=13.45s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15160
     http_req_receiving.............: avg=102.51µs min=38.92µs med=95.97µs  max=5.14ms  p(90)=135.74µs p(95)=149.19µs p(99.9)=1.01ms
     http_req_sending...............: avg=30.57µs  min=6.43µs  med=17.82µs  max=17.79ms p(90)=23.96µs  p(95)=29.12µs  p(99.9)=2.51ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=952.31ms min=6.2ms   med=843.09ms max=15.89s  p(90)=1.75s    p(95)=1.91s    p(99.9)=13.45s
     http_reqs......................: 15160   222.470433/s
     iteration_duration.............: avg=1.01s    min=31.11ms med=932.96ms max=15.89s  p(90)=1.78s    p(95)=1.92s    p(99.9)=13.53s
     iterations.....................: 14160   207.795603/s
     success_rate...................: 100.00% ✓ 14160      ✗ 0    
     vus............................: 64      min=0        max=499
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

     checks.........................: 100.00% ✓ 42171      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   248 kB/s
     http_req_blocked...............: avg=15.53µs  min=1.31µs  med=3.3µs    max=38.83ms p(90)=4.97µs   p(95)=6.56µs   p(99.9)=1.81ms
     http_req_connecting............: avg=10.41µs  min=0s      med=0s       max=38.76ms p(90)=0s       p(95)=0s       p(99.9)=1.76ms
     http_req_duration..............: avg=474.96ms min=8.38ms  med=546.34ms max=1.37s   p(90)=797.51ms p(95)=891.42ms p(99.9)=1.23s 
       { expected_response:true }...: avg=474.96ms min=8.38ms  med=546.34ms max=1.37s   p(90)=797.51ms p(95)=891.42ms p(99.9)=1.23s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15057
     http_req_receiving.............: avg=99.21µs  min=34.14µs med=88.77µs  max=22.33ms p(90)=129.18µs p(95)=143.72µs p(99.9)=1.08ms
     http_req_sending...............: avg=41.19µs  min=6.28µs  med=16.02µs  max=77.07ms p(90)=22.3µs   p(95)=27.35µs  p(99.9)=2.57ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=474.82ms min=8.29ms  med=546.22ms max=1.37s   p(90)=797.33ms p(95)=891.29ms p(99.9)=1.23s 
     http_reqs......................: 15057   202.535182/s
     iteration_duration.............: avg=508.64ms min=9.82ms  med=575.39ms max=1.37s   p(90)=807.41ms p(95)=898.13ms p(99.9)=1.24s 
     iterations.....................: 14057   189.083951/s
     success_rate...................: 100.00% ✓ 14057      ✗ 0    
     vus............................: 63      min=0        max=499
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 410346      ✗ 0     
     data_received..................: 12 GB   194 MB/s
     data_sent......................: 166 MB  2.7 MB/s
     http_req_blocked...............: avg=24.75µs  min=1.08µs  med=2.95µs  max=58.3ms   p(90)=4.74µs   p(95)=6.04µs   p(99.9)=4.17ms  
     http_req_connecting............: avg=20.92µs  min=0s      med=0s      max=58.24ms  p(90)=0s       p(95)=0s       p(99.9)=4.1ms   
     http_req_duration..............: avg=103.22ms min=1.6ms   med=97.1ms  max=342.19ms p(90)=199.3ms  p(95)=216.01ms p(99.9)=268.98ms
       { expected_response:true }...: avg=103.22ms min=1.6ms   med=97.1ms  max=342.19ms p(90)=199.3ms  p(95)=216.01ms p(99.9)=268.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 137782
     http_req_receiving.............: avg=252.96µs min=29.13µs med=63.52µs max=56.95ms  p(90)=185.98µs p(95)=434.3µs  p(99.9)=28.98ms 
     http_req_sending...............: avg=80.89µs  min=5.54µs  med=11.89µs max=94.58ms  p(90)=22.27µs  p(95)=143.42µs p(99.9)=11.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.89ms min=1.54ms  med=96.81ms max=341.77ms p(90)=198.81ms p(95)=215.52ms p(99.9)=267.56ms
     http_reqs......................: 137782  2223.311524/s
     iteration_duration.............: avg=104.26ms min=3.17ms  med=98.35ms max=393.32ms p(90)=199.9ms  p(95)=216.58ms p(99.9)=270ms   
     iterations.....................: 136782  2207.17508/s
     success_rate...................: 100.00% ✓ 136782      ✗ 0     
     vus............................: 57      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 351954      ✗ 0     
     data_received..................: 10 GB   167 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=17.37µs  min=1.07µs med=2.81µs   max=50.8ms   p(90)=4.41µs   p(95)=5.48µs   p(99.9)=2.07ms  
     http_req_connecting............: avg=13.92µs  min=0s     med=0s       max=50.74ms  p(90)=0s       p(95)=0s       p(99.9)=2.01ms  
     http_req_duration..............: avg=120.3ms  min=1.75ms med=110.11ms max=1.05s    p(90)=230.27ms p(95)=263.56ms p(99.9)=625.21ms
       { expected_response:true }...: avg=120.3ms  min=1.75ms med=110.11ms max=1.05s    p(90)=230.27ms p(95)=263.56ms p(99.9)=625.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118318
     http_req_receiving.............: avg=1.85ms   min=53.8µs med=120.65µs max=312.92ms p(90)=1.72ms   p(95)=4.85ms   p(99.9)=123.08ms
     http_req_sending...............: avg=70.75µs  min=5.34µs med=11.08µs  max=126.5ms  p(90)=20µs     p(95)=124.79µs p(99.9)=9.95ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.37ms min=1.65ms med=108.85ms max=977.45ms p(90)=227.27ms p(95)=257.5ms  p(99.9)=624.72ms
     http_reqs......................: 118318  1901.817347/s
     iteration_duration.............: avg=121.61ms min=3.11ms med=111.57ms max=1.05s    p(90)=230.99ms p(95)=264.33ms p(99.9)=625.51ms
     iterations.....................: 117318  1885.743569/s
     success_rate...................: 100.00% ✓ 117318      ✗ 0     
     vus............................: 67      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 211122      ✗ 0    
     data_received..................: 6.2 GB  100 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=6.91µs   min=1.08µs med=2.75µs   max=25.54ms  p(90)=4.44µs   p(95)=5.43µs   p(99.9)=570.74µs
     http_req_connecting............: avg=3.43µs   min=0s     med=0s       max=25.49ms  p(90)=0s       p(95)=0s       p(99.9)=518.12µs
     http_req_duration..............: avg=199.92ms min=2.12ms med=201.75ms max=636.15ms p(90)=369.58ms p(95)=399.39ms p(99.9)=522.28ms
       { expected_response:true }...: avg=199.92ms min=2.12ms med=201.75ms max=636.15ms p(90)=369.58ms p(95)=399.39ms p(99.9)=522.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71374
     http_req_receiving.............: avg=116.69µs min=30µs   med=65.01µs  max=193.11ms p(90)=101.52µs p(95)=116.61µs p(99.9)=3.9ms   
     http_req_sending...............: avg=30.16µs  min=5.72µs med=12.08µs  max=79.26ms  p(90)=18.76µs  p(95)=22.48µs  p(99.9)=3.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.77ms min=2.04ms med=201.55ms max=636.04ms p(90)=369.46ms p(95)=399.23ms p(99.9)=522.21ms
     http_reqs......................: 71374   1140.50786/s
     iteration_duration.............: avg=203.02ms min=4.81ms med=204.82ms max=636.34ms p(90)=370.52ms p(95)=400.26ms p(99.9)=523.47ms
     iterations.....................: 70374   1124.528541/s
     success_rate...................: 100.00% ✓ 70374       ✗ 0    
     vus............................: 84      min=0         max=497
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 91398      ✗ 0    
     data_received..................: 2.8 GB  42 MB/s
     data_sent......................: 38 MB   580 kB/s
     http_req_blocked...............: avg=8.2µs    min=1.12µs  med=2.9µs    max=3.82ms   p(90)=4.69µs   p(95)=5.7µs    p(99.9)=1.02ms 
     http_req_connecting............: avg=4.09µs   min=0s      med=0s       max=2.96ms   p(90)=0s       p(95)=0s       p(99.9)=881.8µs
     http_req_duration..............: avg=456.58ms min=4.08ms  med=425.47ms max=2.18s    p(90)=897.77ms p(95)=971.02ms p(99.9)=1.48s  
       { expected_response:true }...: avg=456.58ms min=4.08ms  med=425.47ms max=2.18s    p(90)=897.77ms p(95)=971.02ms p(99.9)=1.48s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 31466
     http_req_receiving.............: avg=244.95µs min=32.13µs med=80.24µs  max=270.46ms p(90)=117.62µs p(95)=131µs    p(99.9)=42.08ms
     http_req_sending...............: avg=24.72µs  min=5.7µs   med=13.94µs  max=13.32ms  p(90)=21.17µs  p(95)=24.37µs  p(99.9)=2.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=456.31ms min=4.01ms  med=425.38ms max=2.18s    p(90)=897.68ms p(95)=970.89ms p(99.9)=1.48s  
     http_reqs......................: 31466   482.894563/s
     iteration_duration.............: avg=471.79ms min=8.75ms  med=445.4ms  max=2.19s    p(90)=901.59ms p(95)=973.51ms p(99.9)=1.49s  
     iterations.....................: 30466   467.548012/s
     success_rate...................: 100.00% ✓ 30466      ✗ 0    
     vus............................: 64      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 41211      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   258 kB/s
     http_req_blocked...............: avg=15.56µs  min=1.16µs  med=3.64µs   max=29.24ms  p(90)=5.65µs   p(95)=7.72µs   p(99.9)=1.62ms 
     http_req_connecting............: avg=9.86µs   min=0s      med=0s       max=29.17ms  p(90)=0s       p(95)=0s       p(99.9)=1.47ms 
     http_req_duration..............: avg=990.56ms min=6.56ms  med=905.4ms  max=6.23s    p(90)=1.97s    p(95)=2.16s    p(99.9)=5.61s  
       { expected_response:true }...: avg=990.56ms min=6.56ms  med=905.4ms  max=6.23s    p(90)=1.97s    p(95)=2.16s    p(99.9)=5.61s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14737
     http_req_receiving.............: avg=263.26µs min=36.9µs  med=99.63µs  max=187.25ms p(90)=139.04µs p(95)=152.26µs p(99.9)=70.94ms
     http_req_sending...............: avg=38.01µs  min=6.58µs  med=18.14µs  max=66.14ms  p(90)=24.25µs  p(95)=29.9µs   p(99.9)=3.87ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=990.26ms min=6.45ms  med=905.28ms max=6.23s    p(90)=1.97s    p(95)=2.16s    p(99.9)=5.61s  
     http_reqs......................: 14737   214.868351/s
     iteration_duration.............: avg=1.06s    min=16.02ms med=990.65ms max=6.24s    p(90)=1.99s    p(95)=2.18s    p(99.9)=5.62s  
     iterations.....................: 13737   200.288155/s
     success_rate...................: 100.00% ✓ 13737      ✗ 0    
     vus............................: 87      min=0        max=500
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

     checks.........................: 100.00% ✓ 40821      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 18 MB   251 kB/s
     http_req_blocked...............: avg=19.74µs  min=1.3µs   med=3.7µs    max=43.5ms  p(90)=5.61µs   p(95)=7.4µs   p(99.9)=2.7ms   
     http_req_connecting............: avg=14.08µs  min=0s      med=0s       max=43.43ms p(90)=0s       p(95)=0s      p(99.9)=2.67ms  
     http_req_duration..............: avg=997.79ms min=8.64ms  med=920.12ms max=3.91s   p(90)=2.04s    p(95)=2.14s   p(99.9)=3.6s    
       { expected_response:true }...: avg=997.79ms min=8.64ms  med=920.12ms max=3.91s   p(90)=2.04s    p(95)=2.14s   p(99.9)=3.6s    
     http_req_failed................: 0.00%   ✓ 0          ✗ 14607
     http_req_receiving.............: avg=104.78µs min=34.88µs med=99.1µs   max=5.15ms  p(90)=139.79µs p(95)=152.9µs p(99.9)=764.61µs
     http_req_sending...............: avg=40.76µs  min=6.06µs  med=18.2µs   max=107.6ms p(90)=24.6µs   p(95)=30.27µs p(99.9)=2.94ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=997.65ms min=8.53ms  med=919.92ms max=3.91s   p(90)=2.04s    p(95)=2.14s   p(99.9)=3.6s    
     http_reqs......................: 14607   209.196735/s
     iteration_duration.............: avg=1.07s    min=33.15ms med=1s       max=3.92s   p(90)=2.05s    p(95)=2.15s   p(99.9)=3.62s   
     iterations.....................: 13607   194.875058/s
     success_rate...................: 100.00% ✓ 13607      ✗ 0    
     vus............................: 99      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

