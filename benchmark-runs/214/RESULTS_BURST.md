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
| hive-router | v0.0.65 | 2,807 | 2,906 | 2,778 | 1.6% |  |
| hotchocolate | 16.1.3 | 2,045 | 2,085 | 2,026 | 1.0% |  |
| cosmo | 0.321.1 | 1,062 | 1,062 | 1,062 | 0.0% | non-compatible response (19 across 8/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 520 | 527 | 517 | 0.7% |  |
| hive-gateway | 2.8.2 | 224 | 226 | 221 | 0.8% |  |
| apollo-gateway | 2.14.1 | 203 | 208 | 200 | 1.1% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (14434 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (491833 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,317 | 2,422 | 2,277 | 2.0% |  |
| hotchocolate | 16.1.3 | 1,896 | 1,936 | 1,864 | 1.2% |  |
| cosmo | 0.321.1 | 1,100 | 1,100 | 1,100 | 0.0% | non-compatible response (18 across 8/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 491 | 500 | 486 | 1.1% |  |
| hive-gateway | 2.8.2 | 222 | 226 | 219 | 1.1% |  |
| apollo-gateway | 2.14.1 | 207 | 211 | 205 | 0.8% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (30769 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (221062 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 518178      ✗ 0     
     data_received..................: 15 GB   246 MB/s
     data_sent......................: 209 MB  3.4 MB/s
     http_req_blocked...............: avg=41.04µs  min=1.02µs  med=2.33µs  max=106.72ms p(90)=3.88µs   p(95)=5.09µs   p(99.9)=10.1ms  
     http_req_connecting............: avg=37.79µs  min=0s      med=0s      max=106.57ms p(90)=0s       p(95)=0s       p(99.9)=9.38ms  
     http_req_duration..............: avg=81.69ms  min=1.51ms  med=74.44ms max=290.53ms p(90)=159.23ms p(95)=177.96ms p(99.9)=238.19ms
       { expected_response:true }...: avg=81.69ms  min=1.51ms  med=74.44ms max=290.53ms p(90)=159.23ms p(95)=177.96ms p(99.9)=238.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 173726
     http_req_receiving.............: avg=517.75µs min=27.23µs med=55.01µs max=77.36ms  p(90)=271.66µs p(95)=434.84µs p(99.9)=52.94ms 
     http_req_sending...............: avg=102.8µs  min=5.37µs  med=10µs    max=133.93ms p(90)=19.57µs  p(95)=134.59µs p(99.9)=16.97ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.07ms  min=1.46ms  med=74.13ms max=268.27ms p(90)=158.08ms p(95)=175.37ms p(99.9)=233.6ms 
     http_reqs......................: 173726  2807.66978/s
     iteration_duration.............: avg=82.52ms  min=2.37ms  med=75.32ms max=367.58ms p(90)=159.9ms  p(95)=178.79ms p(99.9)=242.1ms 
     iterations.....................: 172726  2791.508297/s
     success_rate...................: 100.00% ✓ 172726      ✗ 0     
     vus............................: 51      min=0         max=499 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 382413      ✗ 0     
     data_received..................: 11 GB   179 MB/s
     data_sent......................: 154 MB  2.5 MB/s
     http_req_blocked...............: avg=17.99µs  min=1.04µs  med=2.26µs   max=74.88ms  p(90)=3.57µs   p(95)=4.52µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=15µs     min=0s      med=0s       max=74.81ms  p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=110.77ms min=2.37ms  med=100.19ms max=778.17ms p(90)=215.29ms p(95)=253.33ms p(99.9)=512.35ms
       { expected_response:true }...: avg=110.77ms min=2.37ms  med=100.19ms max=778.17ms p(90)=215.29ms p(95)=253.33ms p(99.9)=512.35ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128471
     http_req_receiving.............: avg=2.48ms   min=50.88µs med=110.15µs max=398.32ms p(90)=1.25ms   p(95)=4.13ms   p(99.9)=207.78ms
     http_req_sending...............: avg=64.41µs  min=5.25µs  med=9.64µs   max=181.16ms p(90)=17.61µs  p(95)=117.87µs p(99.9)=8.75ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=108.22ms min=2.29ms  med=99.17ms  max=728.67ms p(90)=211.49ms p(95)=244.01ms p(99.9)=429.82ms
     http_reqs......................: 128471  2045.018345/s
     iteration_duration.............: avg=111.93ms min=3.57ms  med=101.4ms  max=778.41ms p(90)=216.11ms p(95)=254.22ms p(99.9)=514.37ms
     iterations.....................: 127471  2029.100213/s
     success_rate...................: 100.00% ✓ 127471      ✗ 0     
     vus............................: 94      min=0         max=500 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 212133      ✗ 0    
     data_received..................: 6.3 GB  93 MB/s
     data_sent......................: 86 MB   1.3 MB/s
     http_req_blocked...............: avg=5.96µs   min=1.12µs  med=2.32µs   max=13.81ms  p(90)=3.87µs   p(95)=4.78µs   p(99.9)=511.45µs
     http_req_connecting............: avg=2.94µs   min=0s      med=0s       max=13.74ms  p(90)=0s       p(95)=0s       p(99.9)=464.56µs
     http_req_duration..............: avg=198.38ms min=2.04ms  med=199.12ms max=555.94ms p(90)=367.29ms p(95)=394ms    p(99.9)=482.81ms
       { expected_response:true }...: avg=198.38ms min=2.04ms  med=199.12ms max=555.94ms p(90)=367.29ms p(95)=394ms    p(99.9)=482.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71711
     http_req_receiving.............: avg=82.71µs  min=28.13µs med=60.98µs  max=150.38ms p(90)=97.28µs  p(95)=112.14µs p(99.9)=1.45ms  
     http_req_sending...............: avg=35.27µs  min=5.36µs  med=10.69µs  max=155.26ms p(90)=17.13µs  p(95)=20.98µs  p(99.9)=3.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.26ms min=1.98ms  med=199ms    max=555.87ms p(90)=367.17ms p(95)=393.91ms p(99.9)=482.61ms
     http_reqs......................: 71711   1062.448322/s
     iteration_duration.............: avg=201.43ms min=4.43ms  med=202.99ms max=556.15ms p(90)=368.15ms p(95)=394.62ms p(99.9)=483.13ms
     iterations.....................: 70711   1047.632627/s
     success_rate...................: 100.00% ✓ 70711       ✗ 0    
     vus............................: 1       min=0         max=493
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 98187      ✗ 0    
     data_received..................: 3.0 GB  46 MB/s
     data_sent......................: 41 MB   625 kB/s
     http_req_blocked...............: avg=10.39µs  min=1.14µs  med=2.82µs   max=26.9ms   p(90)=4.67µs   p(95)=5.73µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=6.55µs   min=0s      med=0s       max=26.75ms  p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=425.54ms min=3.87ms  med=399.14ms max=1.79s    p(90)=831.62ms p(95)=902.22ms p(99.9)=1.37s   
       { expected_response:true }...: avg=425.54ms min=3.87ms  med=399.14ms max=1.79s    p(90)=831.62ms p(95)=902.22ms p(99.9)=1.37s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 33729
     http_req_receiving.............: avg=93.1µs   min=31.06µs med=75.31µs  max=151.18ms p(90)=112.99µs p(95)=127.1µs  p(99.9)=847.06µs
     http_req_sending...............: avg=29.09µs  min=5.56µs  med=13.07µs  max=77.87ms  p(90)=20.72µs  p(95)=24.24µs  p(99.9)=3.01ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=425.42ms min=3.8ms   med=399.02ms max=1.79s    p(90)=831.53ms p(95)=901.92ms p(99.9)=1.37s   
     http_reqs......................: 33729   520.921351/s
     iteration_duration.............: avg=438.76ms min=19.53ms med=415.68ms max=1.79s    p(90)=835.91ms p(95)=905.11ms p(99.9)=1.37s   
     iterations.....................: 32729   505.477035/s
     success_rate...................: 100.00% ✓ 32729      ✗ 0    
     vus............................: 94      min=0        max=500
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 43038      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 19 MB   270 kB/s
     http_req_blocked...............: avg=13.39µs  min=1.23µs  med=3.75µs   max=5.17ms   p(90)=5.67µs  p(95)=7.51µs   p(99.9)=1.66ms
     http_req_connecting............: avg=7.91µs   min=0s      med=0s       max=5.11ms   p(90)=0s      p(95)=0s       p(99.9)=1.64ms
     http_req_duration..............: avg=935.44ms min=6.21ms  med=797.68ms max=20.65s   p(90)=1.63s   p(95)=1.78s    p(99.9)=19.07s
       { expected_response:true }...: avg=935.44ms min=6.21ms  med=797.68ms max=20.65s   p(90)=1.63s   p(95)=1.78s    p(99.9)=19.07s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15346
     http_req_receiving.............: avg=132.02µs min=34.42µs med=101.09µs max=173.13ms p(90)=140.4µs p(95)=154.07µs p(99.9)=1.05ms
     http_req_sending...............: avg=41.96µs  min=5.99µs  med=18.14µs  max=175.37ms p(90)=24.46µs p(95)=29.97µs  p(99.9)=2.71ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=935.27ms min=6.11ms  med=797.54ms max=20.65s   p(90)=1.63s   p(95)=1.78s    p(99.9)=19.07s
     http_reqs......................: 15346   224.645613/s
     iteration_duration.............: avg=1s       min=48.79ms med=874.93ms max=20.65s   p(90)=1.65s   p(95)=1.8s     p(99.9)=19.08s
     iterations.....................: 14346   210.006905/s
     success_rate...................: 100.00% ✓ 14346      ✗ 0    
     vus............................: 69      min=0        max=499
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

     checks.........................: 100.00% ✓ 42351      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=16.34µs  min=1.2µs   med=3.5µs    max=5.4ms   p(90)=5.15µs   p(95)=6.68µs   p(99.9)=2.72ms
     http_req_connecting............: avg=10.99µs  min=0s      med=0s       max=5.35ms  p(90)=0s       p(95)=0s       p(99.9)=2.56ms
     http_req_duration..............: avg=511.61ms min=8.34ms  med=589.97ms max=1.35s   p(90)=857.23ms p(95)=909.98ms p(99.9)=1.26s 
       { expected_response:true }...: avg=511.61ms min=8.34ms  med=589.97ms max=1.35s   p(90)=857.23ms p(95)=909.98ms p(99.9)=1.26s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15117
     http_req_receiving.............: avg=101.03µs min=32.34µs med=93.1µs   max=21.74ms p(90)=132.69µs p(95)=145.56µs p(99.9)=1.17ms
     http_req_sending...............: avg=34.06µs  min=6.04µs  med=16.62µs  max=89.75ms p(90)=22.47µs  p(95)=27.85µs  p(99.9)=1.92ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=511.48ms min=8.25ms  med=589.87ms max=1.35s   p(90)=857.1ms  p(95)=909.86ms p(99.9)=1.26s 
     http_reqs......................: 15117   203.197539/s
     iteration_duration.............: avg=547.76ms min=9.42ms  med=632.03ms max=1.35s   p(90)=861.96ms p(95)=916.71ms p(99.9)=1.26s 
     iterations.....................: 14117   189.755882/s
     success_rate...................: 100.00% ✓ 14117      ✗ 0    
     vus............................: 60      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 429129      ✗ 0     
     data_received..................: 13 GB   203 MB/s
     data_sent......................: 173 MB  2.8 MB/s
     http_req_blocked...............: avg=24.21µs  min=1.04µs  med=2.64µs  max=76.94ms  p(90)=4.53µs   p(95)=5.84µs   p(99.9)=1.62ms  
     http_req_connecting............: avg=20.67µs  min=0s      med=0s      max=76.86ms  p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=98.71ms  min=1.63ms  med=92.84ms max=305.05ms p(90)=191.46ms p(95)=207.8ms  p(99.9)=254.91ms
       { expected_response:true }...: avg=98.71ms  min=1.63ms  med=92.84ms max=305.05ms p(90)=191.46ms p(95)=207.8ms  p(99.9)=254.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144043
     http_req_receiving.............: avg=219.62µs min=29.01µs med=59.21µs max=99.63ms  p(90)=191.2µs  p(95)=418.92µs p(99.9)=25.27ms 
     http_req_sending...............: avg=80.27µs  min=5.46µs  med=10.98µs max=167.68ms p(90)=21.68µs  p(95)=140.12µs p(99.9)=12.01ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.41ms  min=1.58ms  med=92.57ms max=304.71ms p(90)=190.99ms p(95)=207.19ms p(99.9)=253.86ms
     http_reqs......................: 144043  2317.209136/s
     iteration_duration.............: avg=99.69ms  min=3.62ms  med=93.92ms max=353.55ms p(90)=191.99ms p(95)=208.27ms p(99.9)=256.07ms
     iterations.....................: 143043  2301.122209/s
     success_rate...................: 100.00% ✓ 143043      ✗ 0     
     vus............................: 65      min=0         max=496 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 351090      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=15.06µs  min=1µs    med=2.34µs   max=59.76ms  p(90)=3.95µs   p(95)=5.05µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=12µs     min=0s     med=0s       max=59.6ms   p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=120.63ms min=1.78ms med=109.56ms max=942.87ms p(90)=230.63ms p(95)=265.96ms p(99.9)=670.34ms
       { expected_response:true }...: avg=120.63ms min=1.78ms med=109.56ms max=942.87ms p(90)=230.63ms p(95)=265.96ms p(99.9)=670.34ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118030
     http_req_receiving.............: avg=1.97ms   min=51.4µs med=115.54µs max=466.09ms p(90)=1.75ms   p(95)=4.92ms   p(99.9)=145.77ms
     http_req_sending...............: avg=63.02µs  min=5.23µs med=10µs     max=201.47ms p(90)=19.83µs  p(95)=118.86µs p(99.9)=8.14ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.59ms min=1.69ms med=108.24ms max=942.76ms p(90)=227.33ms p(95)=258.66ms p(99.9)=656.55ms
     http_reqs......................: 118030  1896.653639/s
     iteration_duration.............: avg=121.93ms min=2.6ms  med=110.98ms max=943.08ms p(90)=231.26ms p(95)=266.75ms p(99.9)=671.62ms
     iterations.....................: 117030  1880.584388/s
     success_rate...................: 100.00% ✓ 117030      ✗ 0     
     vus............................: 69      min=0         max=495 
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 204084      ✗ 0    
     data_received..................: 6.0 GB  96 MB/s
     data_sent......................: 83 MB   1.3 MB/s
     http_req_blocked...............: avg=6.27µs   min=1.07µs  med=2.52µs   max=15.25ms  p(90)=4.27µs   p(95)=5.25µs   p(99.9)=521.27µs
     http_req_connecting............: avg=3.03µs   min=0s      med=0s       max=15.2ms   p(90)=0s       p(95)=0s       p(99.9)=470.54µs
     http_req_duration..............: avg=206.83ms min=2.15ms  med=208.56ms max=635.68ms p(90)=381.03ms p(95)=409.44ms p(99.9)=557.75ms
       { expected_response:true }...: avg=206.83ms min=2.15ms  med=208.56ms max=635.68ms p(90)=381.03ms p(95)=409.44ms p(99.9)=557.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 69028
     http_req_receiving.............: avg=84.89µs  min=29.95µs med=64.62µs  max=163.04ms p(90)=103.21µs p(95)=119.36µs p(99.9)=1.41ms  
     http_req_sending...............: avg=29.32µs  min=5.64µs  med=11.53µs  max=78.03ms  p(90)=18.75µs  p(95)=22.2µs   p(99.9)=3.66ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.71ms min=2.08ms  med=208.42ms max=635.61ms p(90)=380.92ms p(95)=409.33ms p(99.9)=557.64ms
     http_reqs......................: 69028   1100.378785/s
     iteration_duration.............: avg=210.12ms min=5.04ms  med=212.37ms max=635.84ms p(90)=382.05ms p(95)=410.17ms p(99.9)=558.14ms
     iterations.....................: 68028   1084.437735/s
     success_rate...................: 100.00% ✓ 68028       ✗ 0    
     vus............................: 93      min=0         max=500
     vus_max........................: 500     min=500       max=500
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

     checks.........................: 100.00% ✓ 92964      ✗ 0    
     data_received..................: 2.8 GB  43 MB/s
     data_sent......................: 38 MB   590 kB/s
     http_req_blocked...............: avg=9.19µs   min=1.15µs  med=2.99µs   max=8.77ms   p(90)=4.78µs   p(95)=5.78µs   p(99.9)=1.58ms  
     http_req_connecting............: avg=5.05µs   min=0s      med=0s       max=8.72ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=448.84ms min=4.05ms  med=423.98ms max=1.99s    p(90)=876.87ms p(95)=955.76ms p(99.9)=1.43s   
       { expected_response:true }...: avg=448.84ms min=4.05ms  med=423.98ms max=1.99s    p(90)=876.87ms p(95)=955.76ms p(99.9)=1.43s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 31988
     http_req_receiving.............: avg=86.73µs  min=30.99µs med=78.92µs  max=6.86ms   p(90)=116.59µs p(95)=129.73µs p(99.9)=883.37µs
     http_req_sending...............: avg=37.15µs  min=5.87µs  med=13.88µs  max=199.29ms p(90)=21.06µs  p(95)=24.38µs  p(99.9)=3.04ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=448.72ms min=3.97ms  med=423.85ms max=1.99s    p(90)=876.76ms p(95)=955.66ms p(99.9)=1.43s   
     http_reqs......................: 31988   491.33467/s
     iteration_duration.............: avg=463.55ms min=23.71ms med=439.95ms max=2s       p(90)=881.24ms p(95)=959.8ms  p(99.9)=1.44s   
     iterations.....................: 30988   475.974702/s
     success_rate...................: 100.00% ✓ 30988      ✗ 0    
     vus............................: 62      min=0        max=497
     vus_max........................: 500     min=500      max=500
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

     checks.........................: 100.00% ✓ 42663      ✗ 0    
     data_received..................: 1.3 GB  20 MB/s
     data_sent......................: 18 MB   267 kB/s
     http_req_blocked...............: avg=14.25µs  min=1.24µs  med=3.8µs    max=5.61ms  p(90)=5.75µs   p(95)=7.67µs   p(99.9)=1.86ms
     http_req_connecting............: avg=8.61µs   min=0s      med=0s       max=5.45ms  p(90)=0s       p(95)=0s       p(99.9)=1.84ms
     http_req_duration..............: avg=958.54ms min=6.35ms  med=857.25ms max=5.35s   p(90)=1.93s    p(95)=2.18s    p(99.9)=4.93s 
       { expected_response:true }...: avg=958.54ms min=6.35ms  med=857.25ms max=5.35s   p(90)=1.93s    p(95)=2.18s    p(99.9)=4.93s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15221
     http_req_receiving.............: avg=124.51µs min=33.42µs med=102.14µs max=48.38ms p(90)=140.88µs p(95)=154.04µs p(99.9)=1.9ms 
     http_req_sending...............: avg=37.83µs  min=6.03µs  med=18.69µs  max=59.8ms  p(90)=24.9µs   p(95)=30.11µs  p(99.9)=3.71ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=958.37ms min=6.25ms  med=857.14ms max=5.35s   p(90)=1.93s    p(95)=2.18s    p(99.9)=4.93s 
     http_reqs......................: 15221   222.252957/s
     iteration_duration.............: avg=1.02s    min=37.84ms med=960.89ms max=5.35s   p(90)=1.97s    p(95)=2.2s     p(99.9)=4.96s 
     iterations.....................: 14221   207.651225/s
     success_rate...................: 100.00% ✓ 14221      ✗ 0    
     vus............................: 78      min=0        max=500
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

     checks.........................: 100.00% ✓ 40482      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   249 kB/s
     http_req_blocked...............: avg=19.09µs  min=1.31µs  med=3.6µs    max=38.77ms  p(90)=5.36µs   p(95)=7.02µs   p(99.9)=2.67ms 
     http_req_connecting............: avg=13.75µs  min=0s      med=0s       max=38.7ms   p(90)=0s       p(95)=0s       p(99.9)=2.63ms 
     http_req_duration..............: avg=1s       min=8.61ms  med=904.35ms max=4.33s    p(90)=2.05s    p(95)=2.18s    p(99.9)=3.69s  
       { expected_response:true }...: avg=1s       min=8.61ms  med=904.35ms max=4.33s    p(90)=2.05s    p(95)=2.18s    p(99.9)=3.69s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 14494
     http_req_receiving.............: avg=225.12µs min=37.69µs med=97.88µs  max=137.92ms p(90)=138.49µs p(95)=151.52µs p(99.9)=47.21ms
     http_req_sending...............: avg=28.73µs  min=6.25µs  med=17.49µs  max=16.67ms  p(90)=23.53µs  p(95)=28.7µs   p(99.9)=2.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=1s       min=8.5ms   med=904.24ms max=4.33s    p(90)=2.05s    p(95)=2.18s    p(99.9)=3.69s  
     http_reqs......................: 14494   207.347798/s
     iteration_duration.............: avg=1.08s    min=24.65ms med=1.01s    max=4.33s    p(90)=2.07s    p(95)=2.2s     p(99.9)=3.72s  
     iterations.....................: 13494   193.04203/s
     success_rate...................: 100.00% ✓ 13494      ✗ 0    
     vus............................: 24      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

