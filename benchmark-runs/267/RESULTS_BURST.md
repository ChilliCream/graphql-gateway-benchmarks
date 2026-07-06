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
| hive-router | v0.0.74 | 2,932 | 3,060 | 2,900 | 1.8% |  |
| fusion-nightly | 16.4.0-p.14 | 2,263 | 2,335 | 2,224 | 1.8% |  |
| fusion-nightly-net11 | 16.4.0-p.14 | 2,262 | 2,325 | 2,239 | 1.3% |  |
| fusion | 16.3.0 | 2,178 | 2,244 | 2,165 | 1.3% |  |
| cosmo | 0.326.1 | 1,267 | 1,306 | 1,263 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.0 | 564 | 576 | 560 | 1.0% |  |
| hive-gateway | 2.10.0 | 250 | 258 | 248 | 1.2% |  |
| apollo-gateway | 2.14.2 | 237 | 241 | 236 | 0.7% |  |
| feddi | 77271dc84a06 | 0 | 0 | 0 | 0.0% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (4557 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (523409 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.74 | 2,346 | 2,499 | 2,287 | 3.0% |  |
| fusion-nightly | 16.4.0-p.14 | 2,165 | 2,215 | 2,126 | 1.4% |  |
| fusion-nightly-net11 | 16.4.0-p.14 | 2,158 | 2,248 | 2,137 | 2.1% |  |
| fusion | 16.3.0 | 2,103 | 2,191 | 2,093 | 1.6% |  |
| cosmo | 0.326.1 | 1,134 | 1,180 | 1,124 | 1.8% |  |
| hive-gateway-router-runtime | 2.10.0 | 533 | 550 | 531 | 1.3% |  |
| hive-gateway | 2.10.0 | 244 | 250 | 242 | 1.0% |  |
| apollo-gateway | 2.14.2 | 236 | 239 | 235 | 0.5% |  |
| feddi | 77271dc84a06 | 16 | 16 | 16 | 0.0% |  |
| apollo-router | v2.15.1 | — | — | — | — | non-compatible response (34075 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (328766 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 539802      ✗ 0     
     data_received..................: 16 GB   257 MB/s
     data_sent......................: 217 MB  3.5 MB/s
     http_req_blocked...............: avg=25.97µs  min=862ns   med=2.44µs  max=88.02ms  p(90)=4.14µs   p(95)=5.3µs    p(99.9)=2.53ms  
     http_req_connecting............: avg=22.6µs   min=0s      med=0s      max=87.86ms  p(90)=0s       p(95)=0s       p(99.9)=2.4ms   
     http_req_duration..............: avg=78.47ms  min=1.43ms  med=72.57ms max=308.41ms p(90)=151.85ms p(95)=168.6ms  p(99.9)=234.62ms
       { expected_response:true }...: avg=78.47ms  min=1.43ms  med=72.57ms max=308.41ms p(90)=151.85ms p(95)=168.6ms  p(99.9)=234.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180934
     http_req_receiving.............: avg=170.15µs min=25.68µs med=50.57µs max=71.24ms  p(90)=160.88µs p(95)=359.36µs p(99.9)=24.08ms 
     http_req_sending...............: avg=81.39µs  min=4.5µs   med=9.64µs  max=152.19ms p(90)=19.23µs  p(95)=125.55µs p(99.9)=12.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=78.22ms  min=1.38ms  med=72.34ms max=307.71ms p(90)=151.49ms p(95)=168.04ms p(99.9)=233.32ms
     http_reqs......................: 180934  2932.006614/s
     iteration_duration.............: avg=79.21ms  min=2.05ms  med=73.41ms max=322.92ms p(90)=152.42ms p(95)=169.21ms p(99.9)=236.48ms
     iterations.....................: 179934  2915.801773/s
     success_rate...................: 100.00% ✓ 179934      ✗ 0     
     vus............................: 89      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 421749      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 170 MB  2.7 MB/s
     http_req_blocked...............: avg=16.05µs  min=1.03µs  med=2.52µs   max=67.66ms  p(90)=4.02µs   p(95)=5.06µs   p(99.9)=1.32ms  
     http_req_connecting............: avg=12.46µs  min=0s      med=0s       max=67.45ms  p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=100.56ms min=2.06ms  med=87.84ms  max=1.33s    p(90)=191.15ms p(95)=220.88ms p(99.9)=720.55ms
       { expected_response:true }...: avg=100.56ms min=2.06ms  med=87.84ms  max=1.33s    p(90)=191.15ms p(95)=220.88ms p(99.9)=720.55ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141583
     http_req_receiving.............: avg=1.79ms   min=53.78µs med=106.32µs max=1.14s    p(90)=1.86ms   p(95)=5.11ms   p(99.9)=101.41ms
     http_req_sending...............: avg=63.33µs  min=4.83µs  med=9.47µs   max=209.78ms p(90)=17.06µs  p(95)=109.06µs p(99.9)=8.15ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.7ms   min=1.94ms  med=86.58ms  max=1.33s    p(90)=189.23ms p(95)=216.67ms p(99.9)=688.25ms
     http_reqs......................: 141583  2263.953586/s
     iteration_duration.............: avg=101.51ms min=3.33ms  med=89.04ms  max=1.33s    p(90)=191.7ms  p(95)=221.47ms p(99.9)=727.69ms
     iterations.....................: 140583  2247.963293/s
     success_rate...................: 100.00% ✓ 140583      ✗ 0     
     vus............................: 81      min=0         max=492 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 420099      ✗ 0     
     data_received..................: 12 GB   198 MB/s
     data_sent......................: 169 MB  2.7 MB/s
     http_req_blocked...............: avg=13.96µs  min=1.02µs  med=2.57µs   max=34.48ms  p(90)=4.08µs   p(95)=5.11µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=10.73µs  min=0s      med=0s       max=34.42ms  p(90)=0s       p(95)=0s       p(99.9)=1.32ms  
     http_req_duration..............: avg=100.88ms min=1.96ms  med=95.94ms  max=465.61ms p(90)=192.39ms p(95)=208.78ms p(99.9)=274.74ms
       { expected_response:true }...: avg=100.88ms min=1.96ms  med=95.94ms  max=465.61ms p(90)=192.39ms p(95)=208.78ms p(99.9)=274.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141033
     http_req_receiving.............: avg=854.92µs min=54.07µs med=134.44µs max=300.83ms p(90)=1.64ms   p(95)=2.76ms   p(99.9)=29.63ms 
     http_req_sending...............: avg=59.7µs   min=4.87µs  med=9.67µs   max=198.59ms p(90)=17.84µs  p(95)=113.99µs p(99.9)=7.7ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.96ms  min=1.88ms  med=94.93ms  max=465.33ms p(90)=191.43ms p(95)=207.84ms p(99.9)=274.11ms
     http_reqs......................: 141033  2262.126546/s
     iteration_duration.............: avg=101.84ms min=3.81ms  med=97.03ms  max=465.8ms  p(90)=192.9ms  p(95)=209.24ms p(99.9)=278.57ms
     iterations.....................: 140033  2246.086849/s
     success_rate...................: 100.00% ✓ 140033      ✗ 0     
     vus............................: 72      min=0         max=494 
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

     checks.........................: 100.00% ✓ 405057      ✗ 0     
     data_received..................: 12 GB   191 MB/s
     data_sent......................: 163 MB  2.6 MB/s
     http_req_blocked...............: avg=13.56µs  min=1.01µs  med=2.58µs   max=63.74ms  p(90)=4.04µs   p(95)=4.98µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=10.14µs  min=0s      med=0s       max=63.66ms  p(90)=0s       p(95)=0s       p(99.9)=1.41ms  
     http_req_duration..............: avg=104.69ms min=2.06ms  med=88.89ms  max=1.78s    p(90)=197.66ms p(95)=230.07ms p(99.9)=780.46ms
       { expected_response:true }...: avg=104.69ms min=2.06ms  med=88.89ms  max=1.78s    p(90)=197.66ms p(95)=230.07ms p(99.9)=780.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 136019
     http_req_receiving.............: avg=1.8ms    min=52.34µs med=109.97µs max=1.02s    p(90)=2.12ms   p(95)=5.73ms   p(99.9)=88.89ms 
     http_req_sending...............: avg=56.45µs  min=4.85µs  med=9.61µs   max=161.88ms p(90)=16.73µs  p(95)=105.41µs p(99.9)=7.73ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.83ms min=1.97ms  med=87.61ms  max=1.78s    p(90)=195ms    p(95)=225.41ms p(99.9)=768.9ms 
     http_reqs......................: 136019  2178.104413/s
     iteration_duration.............: avg=105.72ms min=3.58ms  med=89.94ms  max=1.78s    p(90)=198.18ms p(95)=230.8ms  p(99.9)=781.64ms
     iterations.....................: 135019  2162.091176/s
     success_rate...................: 100.00% ✓ 135019      ✗ 0     
     vus............................: 77      min=0         max=493 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 233688      ✗ 0    
     data_received..................: 6.9 GB  111 MB/s
     data_sent......................: 95 MB   1.5 MB/s
     http_req_blocked...............: avg=5.67µs   min=982ns   med=2.33µs   max=19.16ms  p(90)=4.1µs    p(95)=5.05µs   p(99.9)=541.79µs
     http_req_connecting............: avg=2.69µs   min=0s      med=0s       max=19.1ms   p(90)=0s       p(95)=0s       p(99.9)=479.27µs
     http_req_duration..............: avg=180.78ms min=1.8ms   med=182.62ms max=537.44ms p(90)=333.1ms  p(95)=355.04ms p(99.9)=421.29ms
       { expected_response:true }...: avg=180.78ms min=1.8ms   med=182.62ms max=537.44ms p(90)=333.1ms  p(95)=355.04ms p(99.9)=421.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 78896
     http_req_receiving.............: avg=71.74µs  min=26.85µs med=57.39µs  max=73.17ms  p(90)=94.86µs  p(95)=110.47µs p(99.9)=1.19ms  
     http_req_sending...............: avg=29.39µs  min=4.94µs  med=10.28µs  max=126.78ms p(90)=17.17µs  p(95)=21.09µs  p(99.9)=3.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.68ms min=1.76ms  med=182.53ms max=537.25ms p(90)=332.99ms p(95)=354.91ms p(99.9)=421.2ms 
     http_reqs......................: 78896   1267.238673/s
     iteration_duration.............: avg=183.33ms min=4.29ms  med=185.56ms max=537.61ms p(90)=333.83ms p(95)=355.63ms p(99.9)=422.14ms
     iterations.....................: 77896   1251.176532/s
     success_rate...................: 100.00% ✓ 77896       ✗ 0    
     vus............................: 68      min=0         max=495
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 106002     ✗ 0    
     data_received..................: 3.2 GB  50 MB/s
     data_sent......................: 44 MB   678 kB/s
     http_req_blocked...............: avg=8.67µs   min=1.18µs  med=3.04µs   max=17.14ms  p(90)=4.76µs   p(95)=5.75µs   p(99.9)=1.31ms  
     http_req_connecting............: avg=4.59µs   min=0s      med=0s       max=16.93ms  p(90)=0s       p(95)=0s       p(99.9)=1.24ms  
     http_req_duration..............: avg=394.69ms min=3.59ms  med=367.18ms max=1.74s    p(90)=781.51ms p(95)=849.56ms p(99.9)=1.25s   
       { expected_response:true }...: avg=394.69ms min=3.59ms  med=367.18ms max=1.74s    p(90)=781.51ms p(95)=849.56ms p(99.9)=1.25s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 36334
     http_req_receiving.............: avg=81.39µs  min=31.34µs med=68.59µs  max=71.88ms  p(90)=107.72µs p(95)=121.54µs p(99.9)=926.59µs
     http_req_sending...............: avg=30.96µs  min=5.48µs  med=13.52µs  max=118.49ms p(90)=20.51µs  p(95)=23.6µs   p(99.9)=2.92ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=394.58ms min=3.53ms  med=367.11ms max=1.74s    p(90)=781.36ms p(95)=849.47ms p(99.9)=1.25s   
     http_reqs......................: 36334   564.830333/s
     iteration_duration.............: avg=406.08ms min=10.44ms med=381.6ms  max=1.74s    p(90)=784.7ms  p(95)=853.1ms  p(99.9)=1.26s   
     iterations.....................: 35334   549.284829/s
     success_rate...................: 100.00% ✓ 35334      ✗ 0    
     vus............................: 70      min=0        max=495
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 47768      ✗ 0    
     data_received..................: 1.5 GB  22 MB/s
     data_sent......................: 20 MB   302 kB/s
     http_req_blocked...............: avg=9.65µs   min=1.16µs  med=3.16µs   max=6.53ms  p(90)=4.81µs   p(95)=6.03µs   p(99.9)=883.78µs
     http_req_connecting............: avg=5.01µs   min=0s      med=0s       max=6.47ms  p(90)=0s       p(95)=0s       p(99.9)=858.96µs
     http_req_duration..............: avg=838.37ms min=5.71ms  med=738.29ms max=20.32s  p(90)=1.39s    p(95)=1.58s    p(99.9)=17.39s  
       { expected_response:true }...: avg=838.37ms min=5.71ms  med=738.29ms max=20.32s  p(90)=1.39s    p(95)=1.58s    p(99.9)=17.39s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 16923
     http_req_receiving.............: avg=95.28µs  min=33.52µs med=88.37µs  max=9.72ms  p(90)=123.97µs p(95)=139.59µs p(99.9)=1.62ms  
     http_req_sending...............: avg=28.03µs  min=5.4µs   med=16.9µs   max=30.49ms p(90)=22µs     p(95)=25.85µs  p(99.9)=2.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=838.25ms min=5.61ms  med=738.18ms max=20.32s  p(90)=1.39s    p(95)=1.58s    p(99.9)=17.39s  
     http_reqs......................: 16923   250.996559/s
     iteration_duration.............: avg=890.22ms min=25.71ms med=786.19ms max=20.32s  p(90)=1.41s    p(95)=1.59s    p(99.9)=17.4s   
     iterations.....................: 15922   236.150045/s
     success_rate...................: 100.00% ✓ 15922      ✗ 0    
     vus............................: 77      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 48993      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 21 MB   291 kB/s
     http_req_blocked...............: avg=12.78µs  min=1.06µs  med=2.99µs   max=3.55ms p(90)=4.58µs   p(95)=5.97µs   p(99.9)=1.94ms  
     http_req_connecting............: avg=8.29µs   min=0s      med=0s       max=3.51ms p(90)=0s       p(95)=0s       p(99.9)=1.92ms  
     http_req_duration..............: avg=358.67ms min=7.26ms  med=398.3ms  max=1.14s  p(90)=614.76ms p(95)=669.79ms p(99.9)=953.11ms
       { expected_response:true }...: avg=358.67ms min=7.26ms  med=398.3ms  max=1.14s  p(90)=614.76ms p(95)=669.79ms p(99.9)=953.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 17331
     http_req_receiving.............: avg=87.29µs  min=31.46µs med=82.23µs  max=3.79ms p(90)=120.76µs p(95)=135.33µs p(99.9)=764.27µs
     http_req_sending...............: avg=33.73µs  min=5.39µs  med=16.52µs  max=47.8ms p(90)=21.59µs  p(95)=25.96µs  p(99.9)=3.41ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=358.54ms min=7.17ms  med=398.2ms  max=1.14s  p(90)=614.55ms p(95)=669.7ms  p(99.9)=952.98ms
     http_reqs......................: 17331   237.761479/s
     iteration_duration.............: avg=380.63ms min=8.02ms  med=416.33ms max=1.15s  p(90)=622.55ms p(95)=673.87ms p(99.9)=960.08ms
     iterations.....................: 16331   224.042624/s
     success_rate...................: 100.00% ✓ 16331      ✗ 0    
     vus............................: 48      min=0        max=499
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: feddi (rust subgraphs) (77271dc84a06)</summary>

  **K6 Output**


```
data_received..................: 109 kB 1.8 kB/s
     data_sent......................: 2.4 kB 40 B/s
     http_req_blocked...............: avg=178.49µs min=178.49µs med=178.49µs max=178.49µs p(90)=178.49µs p(95)=178.49µs p(99.9)=178.49µs
     http_req_connecting............: avg=93.9µs   min=93.9µs   med=93.9µs   max=93.9µs   p(90)=93.9µs   p(95)=93.9µs   p(99.9)=93.9µs  
     http_req_duration..............: avg=48.37s   min=48.37s   med=48.37s   max=48.37s   p(90)=48.37s   p(95)=48.37s   p(99.9)=48.37s  
       { expected_response:true }...: avg=48.37s   min=48.37s   med=48.37s   max=48.37s   p(90)=48.37s   p(95)=48.37s   p(99.9)=48.37s  
     http_req_failed................: 0.00%  ✓ 0        ✗ 1    
     http_req_receiving.............: avg=277.89µs min=277.89µs med=277.89µs max=277.89µs p(90)=277.89µs p(95)=277.89µs p(99.9)=277.89µs
     http_req_sending...............: avg=43.92µs  min=43.92µs  med=43.92µs  max=43.92µs  p(90)=43.92µs  p(95)=43.92µs  p(99.9)=43.92µs 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=48.37s   min=48.37s   med=48.37s   max=48.37s   p(90)=48.37s   p(95)=48.37s   p(99.9)=48.37s  
     http_reqs......................: 1      0.016666/s
     vus............................: 0      min=0      max=0  
     vus_max........................: 500    min=500    max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.74)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433356      ✗ 0     
     data_received..................: 13 GB   205 MB/s
     data_sent......................: 175 MB  2.8 MB/s
     http_req_blocked...............: avg=12.7µs   min=871ns   med=2.28µs  max=59.2ms   p(90)=4.02µs   p(95)=5.23µs   p(99.9)=1.03ms  
     http_req_connecting............: avg=9.76µs   min=0s      med=0s      max=59.14ms  p(90)=0s       p(95)=0s       p(99.9)=914.06µs
     http_req_duration..............: avg=97.78ms  min=1.52ms  med=92.91ms max=316.03ms p(90)=187.49ms p(95)=204.03ms p(99.9)=250.2ms 
       { expected_response:true }...: avg=97.78ms  min=1.52ms  med=92.91ms max=316.03ms p(90)=187.49ms p(95)=204.03ms p(99.9)=250.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 145452
     http_req_receiving.............: avg=109.86µs min=25.77µs med=54.68µs max=207.68ms p(90)=117.86µs p(95)=313.04µs p(99.9)=7.47ms  
     http_req_sending...............: avg=53.81µs  min=4.6µs   med=9.98µs  max=122.79ms p(90)=19.17µs  p(95)=110.2µs  p(99.9)=6.78ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.62ms  min=1.44ms  med=92.76ms max=315.05ms p(90)=187.32ms p(95)=203.83ms p(99.9)=249.75ms
     http_reqs......................: 145452  2346.434361/s
     iteration_duration.............: avg=98.71ms  min=3.16ms  med=93.91ms max=337.34ms p(90)=187.97ms p(95)=204.47ms p(99.9)=251.93ms
     iterations.....................: 144452  2330.302342/s
     success_rate...................: 100.00% ✓ 144452      ✗ 0     
     vus............................: 56      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 399960      ✗ 0     
     data_received..................: 12 GB   190 MB/s
     data_sent......................: 161 MB  2.6 MB/s
     http_req_blocked...............: avg=17.46µs  min=1.04µs  med=2.95µs   max=58.52ms  p(90)=4.71µs   p(95)=5.91µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=13.78µs  min=0s      med=0s       max=58.36ms  p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=105.98ms min=1.67ms  med=89.82ms  max=1.72s    p(90)=202.83ms p(95)=234.4ms  p(99.9)=721.44ms
       { expected_response:true }...: avg=105.98ms min=1.67ms  med=89.82ms  max=1.72s    p(90)=202.83ms p(95)=234.4ms  p(99.9)=721.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 134320
     http_req_receiving.............: avg=1.68ms   min=52.52µs med=113.81µs max=611.18ms p(90)=1.95ms   p(95)=5.26ms   p(99.9)=90.41ms 
     http_req_sending...............: avg=70.77µs  min=5.23µs  med=11.17µs  max=198.44ms p(90)=20.72µs  p(95)=118µs    p(99.9)=9.03ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=104.23ms min=1.56ms  med=88.68ms  max=1.72s    p(90)=200.17ms p(95)=230.29ms p(99.9)=713.59ms
     http_reqs......................: 134320  2165.574934/s
     iteration_duration.............: avg=107.06ms min=2.95ms  med=91.07ms  max=1.72s    p(90)=203.55ms p(95)=235.23ms p(99.9)=722.71ms
     iterations.....................: 133320  2149.452428/s
     success_rate...................: 100.00% ✓ 133320      ✗ 0     
     vus............................: 58      min=0         max=498 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.4.0-p.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 397377      ✗ 0     
     data_received..................: 12 GB   189 MB/s
     data_sent......................: 160 MB  2.6 MB/s
     http_req_blocked...............: avg=10.71µs  min=871ns   med=2.19µs   max=36.23ms  p(90)=3.77µs   p(95)=4.83µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=7.73µs   min=0s      med=0s       max=36.02ms  p(90)=0s       p(95)=0s       p(99.9)=862.19µs
     http_req_duration..............: avg=106.62ms min=1.46ms  med=101.68ms max=473.68ms p(90)=202.93ms p(95)=220.45ms p(99.9)=294.96ms
       { expected_response:true }...: avg=106.62ms min=1.46ms  med=101.68ms max=473.68ms p(90)=202.93ms p(95)=220.45ms p(99.9)=294.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 133459
     http_req_receiving.............: avg=941.4µs  min=53.38µs med=133.53µs max=109.03ms p(90)=1.81ms   p(95)=3.02ms   p(99.9)=34.79ms 
     http_req_sending...............: avg=57.31µs  min=4.74µs  med=9.37µs   max=253.78ms p(90)=18.71µs  p(95)=94.53µs  p(99.9)=6.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=105.62ms min=1.4ms   med=100.62ms max=471.14ms p(90)=201.75ms p(95)=219.23ms p(99.9)=293.56ms
     http_reqs......................: 133459  2158.262418/s
     iteration_duration.............: avg=107.67ms min=3.54ms  med=102.77ms max=473.87ms p(90)=203.49ms p(95)=220.92ms p(99.9)=296.85ms
     iterations.....................: 132459  2142.090692/s
     success_rate...................: 100.00% ✓ 132459      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 388521      ✗ 0     
     data_received..................: 11 GB   184 MB/s
     data_sent......................: 157 MB  2.5 MB/s
     http_req_blocked...............: avg=11.07µs  min=872ns   med=2.28µs   max=41.13ms  p(90)=4.05µs   p(95)=5.18µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=8.02µs   min=0s      med=0s       max=37.25ms  p(90)=0s       p(95)=0s       p(99.9)=1.1ms   
     http_req_duration..............: avg=109.09ms min=1.64ms  med=97.15ms  max=1.49s    p(90)=207.37ms p(95)=234.44ms p(99.9)=692.98ms
       { expected_response:true }...: avg=109.09ms min=1.64ms  med=97.15ms  max=1.49s    p(90)=207.37ms p(95)=234.44ms p(99.9)=692.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 130507
     http_req_receiving.............: avg=1.59ms   min=52.44µs med=114.26µs max=566.29ms p(90)=1.87ms   p(95)=4.73ms   p(99.9)=100.93ms
     http_req_sending...............: avg=52.69µs  min=4.55µs  med=9.53µs   max=158.5ms  p(90)=19.9µs   p(95)=97.01µs  p(99.9)=7.09ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.44ms min=1.56ms  med=95.91ms  max=1.49s    p(90)=205.08ms p(95)=230.56ms p(99.9)=683.05ms
     http_reqs......................: 130507  2103.269998/s
     iteration_duration.............: avg=110.19ms min=2.75ms  med=98.38ms  max=1.49s    p(90)=207.9ms  p(95)=235.12ms p(99.9)=695.14ms
     iterations.....................: 129507  2087.153851/s
     success_rate...................: 100.00% ✓ 129507      ✗ 0     
     vus............................: 60      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 210051      ✗ 0    
     data_received..................: 6.2 GB  99 MB/s
     data_sent......................: 85 MB   1.4 MB/s
     http_req_blocked...............: avg=5.64µs   min=1µs     med=2.61µs   max=5.04ms   p(90)=4.43µs   p(95)=5.41µs   p(99.9)=518.69µs
     http_req_connecting............: avg=2.28µs   min=0s      med=0s       max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=448.53µs
     http_req_duration..............: avg=200.95ms min=2.01ms  med=200.59ms max=554.81ms p(90)=372.52ms p(95)=399.35ms p(99.9)=479.53ms
       { expected_response:true }...: avg=200.95ms min=2.01ms  med=200.59ms max=554.81ms p(90)=372.52ms p(95)=399.35ms p(99.9)=479.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71017
     http_req_receiving.............: avg=82.81µs  min=28.56µs med=69.37µs  max=24.3ms   p(90)=113.9µs  p(95)=130.5µs  p(99.9)=1.09ms  
     http_req_sending...............: avg=28.94µs  min=5.1µs   med=11.93µs  max=176.68ms p(90)=19.73µs  p(95)=23.74µs  p(99.9)=2.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.84ms min=1.93ms  med=200.44ms max=554.73ms p(90)=372.44ms p(95)=399.25ms p(99.9)=479.41ms
     http_reqs......................: 71017   1134.346691/s
     iteration_duration.............: avg=204.07ms min=4.89ms  med=203.66ms max=554.98ms p(90)=373.56ms p(95)=400.08ms p(99.9)=480.21ms
     iterations.....................: 70017   1118.373801/s
     success_rate...................: 100.00% ✓ 70017       ✗ 0    
     vus............................: 83      min=0         max=497
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 100482     ✗ 0    
     data_received..................: 3.0 GB  47 MB/s
     data_sent......................: 41 MB   640 kB/s
     http_req_blocked...............: avg=7.55µs   min=1.05µs  med=2.67µs   max=12.06ms  p(90)=4.31µs   p(95)=5.37µs   p(99.9)=701.81µs
     http_req_connecting............: avg=3.89µs   min=0s      med=0s       max=11.99ms  p(90)=0s       p(95)=0s       p(99.9)=668.94µs
     http_req_duration..............: avg=416.26ms min=3.73ms  med=386.92ms max=1.65s    p(90)=823.43ms p(95)=899.68ms p(99.9)=1.35s   
       { expected_response:true }...: avg=416.26ms min=3.73ms  med=386.92ms max=1.65s    p(90)=823.43ms p(95)=899.68ms p(99.9)=1.35s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 34494
     http_req_receiving.............: avg=88.75µs  min=28.71µs med=73.32µs  max=152.43ms p(90)=113.24µs p(95)=128.22µs p(99.9)=842.88µs
     http_req_sending...............: avg=33.3µs   min=4.96µs  med=13.81µs  max=124.33ms p(90)=21.09µs  p(95)=24.02µs  p(99.9)=2.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=416.14ms min=3.67ms  med=386.8ms  max=1.65s    p(90)=823.31ms p(95)=899.6ms  p(99.9)=1.35s   
     http_reqs......................: 34494   533.292857/s
     iteration_duration.............: avg=428.92ms min=17.41ms med=400.96ms max=1.65s    p(90)=826.49ms p(95)=903.49ms p(99.9)=1.37s   
     iterations.....................: 33494   517.832404/s
     success_rate...................: 100.00% ✓ 33494      ✗ 0    
     vus............................: 88      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 46731      ✗ 0    
     data_received..................: 1.5 GB  21 MB/s
     data_sent......................: 20 MB   293 kB/s
     http_req_blocked...............: avg=15.2µs   min=1.3µs   med=3.96µs   max=5.25ms   p(90)=5.96µs   p(95)=7.8µs   p(99.9)=2.07ms
     http_req_connecting............: avg=9.43µs   min=0s      med=0s       max=5.17ms   p(90)=0s       p(95)=0s      p(99.9)=2.04ms
     http_req_duration..............: avg=877.96ms min=5.95ms  med=775.36ms max=5.14s    p(90)=1.75s    p(95)=1.97s   p(99.9)=4.09s 
       { expected_response:true }...: avg=877.96ms min=5.95ms  med=775.36ms max=5.14s    p(90)=1.75s    p(95)=1.97s   p(99.9)=4.09s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16577
     http_req_receiving.............: avg=118.64µs min=38.19µs med=95.56µs  max=147.29ms p(90)=134.01µs p(95)=150.7µs p(99.9)=1.17ms
     http_req_sending...............: avg=33.43µs  min=6.45µs  med=18.97µs  max=40.5ms   p(90)=25.19µs  p(95)=30.22µs p(99.9)=3.28ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=877.81ms min=5.87ms  med=775.24ms max=5.14s    p(90)=1.75s    p(95)=1.97s   p(99.9)=4.09s 
     http_reqs......................: 16577   244.262249/s
     iteration_duration.............: avg=934.37ms min=30.25ms med=850.99ms max=5.15s    p(90)=1.78s    p(95)=2s      p(99.9)=4.14s 
     iterations.....................: 15577   229.52724/s
     success_rate...................: 100.00% ✓ 15577      ✗ 0    
     vus............................: 101     min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 45702      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 20 MB   284 kB/s
     http_req_blocked...............: avg=15.17µs  min=1.43µs  med=3.52µs   max=13.74ms p(90)=5.35µs   p(95)=6.9µs    p(99.9)=2.25ms
     http_req_connecting............: avg=9.83µs   min=0s      med=0s       max=13.58ms p(90)=0s       p(95)=0s       p(99.9)=2.23ms
     http_req_duration..............: avg=895.11ms min=7.77ms  med=800.27ms max=3.25s   p(90)=1.85s    p(95)=1.95s    p(99.9)=2.91s 
       { expected_response:true }...: avg=895.11ms min=7.77ms  med=800.27ms max=3.25s   p(90)=1.85s    p(95)=1.95s    p(99.9)=2.91s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 16234
     http_req_receiving.............: avg=120.38µs min=34.54µs med=91.5µs   max=99.12ms p(90)=131.61µs p(95)=149.18µs p(99.9)=1.4ms 
     http_req_sending...............: avg=37.8µs   min=6.36µs  med=18.07µs  max=80.36ms p(90)=24.07µs  p(95)=29.31µs  p(99.9)=2.97ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=894.95ms min=7.68ms  med=800.15ms max=3.25s   p(90)=1.85s    p(95)=1.95s    p(99.9)=2.91s 
     http_reqs......................: 16234   236.203719/s
     iteration_duration.............: avg=953.87ms min=34.85ms med=893.6ms  max=3.26s   p(90)=1.86s    p(95)=1.96s    p(99.9)=2.92s 
     iterations.....................: 15234   221.653779/s
     success_rate...................: 100.00% ✓ 15234      ✗ 0    
     vus............................: 91      min=0        max=500
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
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 3144      ✗ 0    
     data_received..................: 196 MB  1.6 MB/s
     data_sent......................: 3.0 MB  24 kB/s
     http_req_blocked...............: avg=50.06µs  min=1.11µs   med=3.52µs  max=3.62ms  p(90)=5.22µs   p(95)=10.46µs  p(99.9)=3.31ms 
     http_req_connecting............: avg=44.56µs  min=0s       med=0s      max=3.58ms  p(90)=0s       p(95)=0s       p(99.9)=3.29ms 
     http_req_duration..............: avg=2.44s    min=24.01ms  med=1.12s   max=48.34s  p(90)=5.92s    p(95)=8.02s    p(99.9)=40.13s 
       { expected_response:true }...: avg=2.44s    min=24.01ms  med=1.12s   max=48.34s  p(90)=5.92s    p(95)=8.02s    p(99.9)=40.13s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2048 
     http_req_receiving.............: avg=486.19µs min=30.37µs  med=102.3µs max=84.15ms p(90)=152.01µs p(95)=171.94µs p(99.9)=75.41ms
     http_req_sending...............: avg=59.37µs  min=6.01µs   med=18.84µs max=26.41ms p(90)=24.76µs  p(95)=35.66µs  p(99.9)=14.02ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.44s    min=23.88ms  med=1.12s   max=48.34s  p(90)=5.92s    p(95)=8.02s    p(99.9)=40.13s 
     http_reqs......................: 2048    16.741216/s
     iteration_duration.............: avg=4.72s    min=755.73ms med=3.77s   max=48.34s  p(90)=7.95s    p(95)=10.09s   p(99.9)=47.16s 
     iterations.....................: 1048    8.566794/s
     success_rate...................: 100.00% ✓ 1048      ✗ 0    
     vus............................: 28      min=0       max=500
     vus_max........................: 500     min=500     max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

