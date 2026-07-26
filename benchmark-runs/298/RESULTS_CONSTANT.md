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
| hive-router | v0.0.83 | 3,089 | 3,325 | 3,046 | 3.1% |  |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,715 | 2,858 | 2,693 | 2.1% |  |
| fusion-nightly | 16.6.0-p.3 | 2,618 | 2,722 | 2,601 | 1.6% |  |
| fusion | 16.5.1 | 2,595 | 2,686 | 2,582 | 1.4% |  |
| grafbase | 0.53.5 | 2,132 | 2,253 | 2,119 | 2.1% |  |
| cosmo | 0.331.1 | 1,337 | 1,377 | 1,332 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.4 | 623 | 641 | 622 | 1.0% |  |
| apollo-router | v2.16.0 | 484 | 499 | 474 | 1.8% |  |
| hive-gateway | 2.10.4 | 286 | 294 | 286 | 1.0% |  |
| apollo-gateway | 2.14.2 | 285 | 288 | 284 | 0.5% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1274 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| fusion-nightly-net11 | 16.6.0-p.3 | 2,533 | 2,634 | 2,522 | 1.5% |  |
| fusion-nightly | 16.6.0-p.3 | 2,486 | 2,600 | 2,479 | 1.8% |  |
| hive-router | v0.0.83 | 2,432 | 2,600 | 2,394 | 2.8% |  |
| fusion | 16.5.1 | 2,397 | 2,496 | 2,389 | 1.6% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 2,191 | 2,272 | 2,167 | 1.6% |  |
| grafbase | 0.53.5 | 1,628 | 1,686 | 1,623 | 1.4% |  |
| cosmo | 0.331.1 | 1,234 | 1,273 | 1,230 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.4 | 572 | 595 | 567 | 1.6% |  |
| apollo-router | v2.16.0 | 414 | 433 | 409 | 2.2% |  |
| hive-gateway | 2.10.4 | 270 | 278 | 269 | 1.1% |  |
| apollo-gateway | 2.14.2 | 266 | 271 | 264 | 0.8% |  |
| feddi | 5ff8b6165878 | 20 | 22 | 20 | 3.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1113567     ✗ 0     
     data_received..................: 33 GB   271 MB/s
     data_sent......................: 446 MB  3.7 MB/s
     http_req_blocked...............: avg=2.81µs  min=882ns   med=2.1µs   max=15.03ms  p(90)=3.59µs  p(95)=4.28µs   p(99.9)=34.62µs
     http_req_connecting............: avg=214ns   min=0s      med=0s      max=3.2ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.95ms min=1.45ms  med=15.22ms max=273.4ms  p(90)=23.32ms p(95)=26.56ms  p(99.9)=46.44ms
       { expected_response:true }...: avg=15.95ms min=1.45ms  med=15.22ms max=273.4ms  p(90)=23.32ms p(95)=26.56ms  p(99.9)=46.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 371289
     http_req_receiving.............: avg=89.63µs min=23.99µs med=45.83µs max=195.73ms p(90)=86.62µs p(95)=163.19µs p(99.9)=7.06ms 
     http_req_sending...............: avg=49.46µs min=4.54µs  med=8.55µs  max=153.92ms p(90)=15.78µs p(95)=97.14µs  p(99.9)=6.64ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.81ms min=1.41ms  med=15.11ms max=272.51ms p(90)=23.14ms p(95)=26.29ms  p(99.9)=45.31ms
     http_reqs......................: 371289  3089.145822/s
     iteration_duration.............: avg=16.15ms min=2.11ms  med=15.41ms max=282.01ms p(90)=23.52ms p(95)=26.79ms  p(99.9)=47.44ms
     iterations.....................: 371189  3088.313816/s
     success_rate...................: 100.00% ✓ 371189      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 979464      ✗ 0     
     data_received..................: 29 GB   238 MB/s
     data_sent......................: 392 MB  3.3 MB/s
     http_req_blocked...............: avg=2.59µs  min=852ns   med=1.89µs  max=17.8ms   p(90)=3.15µs  p(95)=3.77µs  p(99.9)=27.76µs
     http_req_connecting............: avg=281ns   min=0s      med=0s      max=3.78ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=18.15ms min=1.99ms  med=17.28ms max=285.39ms p(90)=26ms    p(95)=29.51ms p(99.9)=49.89ms
       { expected_response:true }...: avg=18.15ms min=1.99ms  med=17.28ms max=285.39ms p(90)=26ms    p(95)=29.51ms p(99.9)=49.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 326588
     http_req_receiving.............: avg=649.4µs min=51.87µs med=99.81µs max=163.17ms p(90)=1.66ms  p(95)=2.47ms  p(99.9)=19.08ms
     http_req_sending...............: avg=44.95µs min=4.63µs  med=8.04µs  max=191.82ms p(90)=15.04µs p(95)=85.08µs p(99.9)=5.57ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=17.46ms min=1.88ms  med=16.59ms max=284.77ms p(90)=25.18ms p(95)=28.63ms p(99.9)=48.22ms
     http_reqs......................: 326588  2715.908845/s
     iteration_duration.............: avg=18.36ms min=3.15ms  med=17.48ms max=295.91ms p(90)=26.21ms p(95)=29.75ms p(99.9)=50.62ms
     iterations.....................: 326488  2715.077244/s
     success_rate...................: 100.00% ✓ 326488      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 944469      ✗ 0     
     data_received..................: 28 GB   230 MB/s
     data_sent......................: 378 MB  3.1 MB/s
     http_req_blocked...............: avg=2.65µs   min=862ns   med=1.9µs   max=17.11ms  p(90)=3.08µs  p(95)=3.67µs  p(99.9)=30.08µs 
     http_req_connecting............: avg=264ns    min=0s      med=0s      max=3.31ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=18.84ms  min=2.04ms  med=16.29ms max=286.51ms p(90)=30.48ms p(95)=36.97ms p(99.9)=110.66ms
       { expected_response:true }...: avg=18.84ms  min=2.04ms  med=16.29ms max=286.51ms p(90)=30.48ms p(95)=36.97ms p(99.9)=110.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 314923
     http_req_receiving.............: avg=552.38µs min=50.62µs med=88.95µs max=227.64ms p(90)=1.04ms  p(95)=1.87ms  p(99.9)=25.93ms 
     http_req_sending...............: avg=42.7µs   min=4.35µs  med=7.95µs  max=154.79ms p(90)=14.03µs p(95)=79.08µs p(99.9)=4.31ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.25ms  min=1.93ms  med=15.78ms max=285.66ms p(90)=29.51ms p(95)=35.88ms p(99.9)=108.53ms
     http_reqs......................: 314923  2618.691099/s
     iteration_duration.............: avg=19.05ms  min=2.97ms  med=16.48ms max=309.63ms p(90)=30.69ms p(95)=37.2ms  p(99.9)=111.25ms
     iterations.....................: 314823  2617.859565/s
     success_rate...................: 100.00% ✓ 314823      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 936030      ✗ 0     
     data_received..................: 27 GB   228 MB/s
     data_sent......................: 375 MB  3.1 MB/s
     http_req_blocked...............: avg=2.84µs   min=862ns   med=2.07µs  max=15.25ms  p(90)=3.36µs  p(95)=3.92µs  p(99.9)=29.34µs 
     http_req_connecting............: avg=291ns    min=0s      med=0s      max=4.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.01ms  min=2.06ms  med=16.36ms max=287.82ms p(90)=30.92ms p(95)=37.5ms  p(99.9)=116.29ms
       { expected_response:true }...: avg=19.01ms  min=2.06ms  med=16.36ms max=287.82ms p(90)=30.92ms p(95)=37.5ms  p(99.9)=116.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 312110
     http_req_receiving.............: avg=559.84µs min=51.87µs med=89.54µs max=277.71ms p(90)=1.05ms  p(95)=1.91ms  p(99.9)=24.95ms 
     http_req_sending...............: avg=42.33µs  min=4.46µs  med=8.22µs  max=167.82ms p(90)=14.5µs  p(95)=82.93µs p(99.9)=3.74ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.41ms  min=1.92ms  med=15.85ms max=282.23ms p(90)=29.96ms p(95)=36.34ms p(99.9)=114.3ms 
     http_reqs......................: 312110  2595.308619/s
     iteration_duration.............: avg=19.22ms  min=3.17ms  med=16.55ms max=306.77ms p(90)=31.13ms p(95)=37.75ms p(99.9)=117.85ms
     iterations.....................: 312010  2594.477083/s
     success_rate...................: 100.00% ✓ 312010      ✗ 0     
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

     checks.........................: 100.00% ✓ 768852      ✗ 0     
     data_received..................: 23 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=3.22µs  min=852ns   med=2.42µs  max=12.08ms  p(90)=3.89µs  p(95)=4.61µs  p(99.9)=38.01µs
     http_req_connecting............: avg=329ns   min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=23.18ms min=1.68ms  med=22.95ms max=291.35ms p(90)=27.48ms p(95)=29.22ms p(99.9)=47.5ms 
       { expected_response:true }...: avg=23.18ms min=1.68ms  med=22.95ms max=291.35ms p(90)=27.48ms p(95)=29.22ms p(99.9)=47.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 256384
     http_req_receiving.............: avg=86.51µs min=26.24µs med=56.48µs max=225.77ms p(90)=94.67µs p(95)=120µs   p(99.9)=4.69ms 
     http_req_sending...............: avg=36.03µs min=4.64µs  med=10.23µs max=119.83ms p(90)=16.63µs p(95)=26.35µs p(99.9)=1.73ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=23.06ms min=1.6ms   med=22.85ms max=272.92ms p(90)=27.36ms p(95)=29.05ms p(99.9)=46.56ms
     http_reqs......................: 256384  2132.566/s
     iteration_duration.............: avg=23.4ms  min=4.59ms  med=23.15ms max=318.18ms p(90)=27.68ms p(95)=29.43ms p(99.9)=48ms   
     iterations.....................: 256284  2131.734214/s
     success_rate...................: 100.00% ✓ 256284      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 482388      ✗ 0     
     data_received..................: 14 GB   117 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=2.88µs  min=902ns   med=2.04µs  max=3.51ms   p(90)=3.46µs  p(95)=4.1µs    p(99.9)=26.38µs 
     http_req_connecting............: avg=526ns   min=0s      med=0s      max=3.47ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.08ms min=2.04ms  med=36.7ms  max=301.55ms p(90)=51.72ms p(95)=56.26ms  p(99.9)=77.12ms 
       { expected_response:true }...: avg=37.08ms min=2.04ms  med=36.7ms  max=301.55ms p(90)=51.72ms p(95)=56.26ms  p(99.9)=77.12ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 160896
     http_req_receiving.............: avg=70.93µs min=25.86µs med=55.67µs max=196.47ms p(90)=89.85µs p(95)=104.56µs p(99.9)=869.82µs
     http_req_sending...............: avg=22.59µs min=4.66µs  med=9.35µs  max=130.67ms p(90)=15.75µs p(95)=19.59µs  p(99.9)=925.32µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=36.99ms min=1.99ms  med=36.61ms max=300.94ms p(90)=51.62ms p(95)=56.16ms  p(99.9)=76.69ms 
     http_reqs......................: 160896  1337.712146/s
     iteration_duration.............: avg=37.3ms  min=3.17ms  med=36.9ms  max=311.22ms p(90)=51.9ms  p(95)=56.44ms  p(99.9)=77.54ms 
     iterations.....................: 160796  1336.880732/s
     success_rate...................: 100.00% ✓ 160796      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 225234     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   750 kB/s
     http_req_blocked...............: avg=5.46µs  min=1.07µs  med=2.84µs  max=11.78ms  p(90)=4.31µs  p(95)=4.96µs   p(99.9)=40.89µs 
     http_req_connecting............: avg=2.29µs  min=0s      med=0s      max=11.73ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=79.58ms min=3.54ms  med=77.68ms max=295.81ms p(90)=99.4ms  p(95)=109.32ms p(99.9)=186.12ms
       { expected_response:true }...: avg=79.58ms min=3.54ms  med=77.68ms max=295.81ms p(90)=99.4ms  p(95)=109.32ms p(99.9)=186.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 75178
     http_req_receiving.............: avg=75.14µs min=30.2µs  med=66.57µs max=8.47ms   p(90)=100.9µs p(95)=113.42µs p(99.9)=657.04µs
     http_req_sending...............: avg=20.26µs min=5.23µs  med=12.54µs max=95.69ms  p(90)=18.79µs p(95)=21.12µs  p(99.9)=649.73µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.49ms min=3.48ms  med=77.58ms max=295.56ms p(90)=99.31ms p(95)=109.22ms p(99.9)=186.04ms
     http_reqs......................: 75178   623.988425/s
     iteration_duration.............: avg=79.92ms min=16.86ms med=77.91ms max=316.69ms p(90)=99.64ms p(95)=109.59ms p(99.9)=188.13ms
     iterations.....................: 75078   623.15841/s
     success_rate...................: 100.00% ✓ 75078      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 175008     ✗ 0    
     data_received..................: 5.1 GB  43 MB/s
     data_sent......................: 70 MB   582 kB/s
     http_req_blocked...............: avg=4.57µs   min=1.1µs   med=2.92µs   max=3.47ms   p(90)=4.36µs   p(95)=4.9µs    p(99.9)=66.28µs 
     http_req_connecting............: avg=1.44µs   min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=102.44ms min=4.65ms  med=102.24ms max=310.74ms p(90)=123.35ms p(95)=129.51ms p(99.9)=157.93ms
       { expected_response:true }...: avg=102.44ms min=4.65ms  med=102.24ms max=310.74ms p(90)=123.35ms p(95)=129.51ms p(99.9)=157.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58436
     http_req_receiving.............: avg=83.46µs  min=27.43µs med=77.97µs  max=64.07ms  p(90)=109.62µs p(95)=122.82µs p(99.9)=545.41µs
     http_req_sending...............: avg=24.32µs  min=5.27µs  med=15.56µs  max=153.29ms p(90)=20.87µs  p(95)=22.73µs  p(99.9)=604.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=102.33ms min=4.54ms  med=102.13ms max=310.22ms p(90)=123.25ms p(95)=129.4ms  p(99.9)=157.57ms
     http_reqs......................: 58436   484.553308/s
     iteration_duration.............: avg=102.87ms min=16.69ms med=102.51ms max=344.81ms p(90)=123.62ms p(95)=129.78ms p(99.9)=159.37ms
     iterations.....................: 58336   483.724105/s
     success_rate...................: 100.00% ✓ 58336      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 103692     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   344 kB/s
     http_req_blocked...............: avg=5.93µs   min=1.09µs  med=3.18µs   max=3.55ms   p(90)=4.63µs   p(95)=5.24µs   p(99.9)=1.15ms  
     http_req_connecting............: avg=2.53µs   min=0s      med=0s       max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=172.9ms  min=5.43ms  med=153.79ms max=810.11ms p(90)=220.54ms p(95)=264.55ms p(99.9)=611.19ms
       { expected_response:true }...: avg=172.9ms  min=5.43ms  med=153.79ms max=810.11ms p(90)=220.54ms p(95)=264.55ms p(99.9)=611.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34664
     http_req_receiving.............: avg=93.41µs  min=30.88µs med=88.78µs  max=40.15ms  p(90)=118.07µs p(95)=129.92µs p(99.9)=782.3µs 
     http_req_sending...............: avg=31.36µs  min=5.34µs  med=17.72µs  max=182.9ms  p(90)=22.18µs  p(95)=23.98µs  p(99.9)=553.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=172.78ms min=5.29ms  med=153.67ms max=810.06ms p(90)=220.44ms p(95)=264.19ms p(99.9)=611.09ms
     http_reqs......................: 34664   286.802365/s
     iteration_duration.............: avg=173.66ms min=55.15ms med=154.19ms max=810.31ms p(90)=221.04ms p(95)=265.55ms p(99.9)=611.53ms
     iterations.....................: 34564   285.974986/s
     success_rate...................: 100.00% ✓ 34564      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 103326     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 42 MB   343 kB/s
     http_req_blocked...............: avg=5.17µs   min=1.36µs  med=3.53µs   max=2.91ms   p(90)=4.9µs    p(95)=5.48µs   p(99.9)=371.65µs
     http_req_connecting............: avg=1.41µs   min=0s      med=0s       max=2.89ms   p(90)=0s       p(95)=0s       p(99.9)=348.66µs
     http_req_duration..............: avg=173.51ms min=7.41ms  med=174.14ms max=354.54ms p(90)=181.72ms p(95)=185.59ms p(99.9)=254.91ms
       { expected_response:true }...: avg=173.51ms min=7.41ms  med=174.14ms max=354.54ms p(90)=181.72ms p(95)=185.59ms p(99.9)=254.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34542
     http_req_receiving.............: avg=89.74µs  min=33.58µs med=83.76µs  max=40.27ms  p(90)=113.79µs p(95)=124.42µs p(99.9)=608.61µs
     http_req_sending...............: avg=34.8µs   min=6.03µs  med=17.53µs  max=160.86ms p(90)=22.15µs  p(95)=23.98µs  p(99.9)=585.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=173.39ms min=7.28ms  med=174.03ms max=354.36ms p(90)=181.61ms p(95)=185.48ms p(99.9)=254.16ms
     http_reqs......................: 34542   285.675772/s
     iteration_duration.............: avg=174.29ms min=40.44ms med=174.46ms max=368.64ms p(90)=182ms    p(95)=185.86ms p(99.9)=258.38ms
     iterations.....................: 34442   284.848733/s
     success_rate...................: 100.00% ✓ 34442      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 913281      ✗ 0     
     data_received..................: 27 GB   222 MB/s
     data_sent......................: 366 MB  3.0 MB/s
     http_req_blocked...............: avg=3.06µs   min=882ns   med=2µs      max=19.81ms  p(90)=3.6µs   p(95)=4.36µs  p(99.9)=32.43µs
     http_req_connecting............: avg=324ns    min=0s      med=0s       max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.48ms  min=1.54ms  med=18.65ms  max=291.82ms p(90)=28.02ms p(95)=31.51ms p(99.9)=51.57ms
       { expected_response:true }...: avg=19.48ms  min=1.54ms  med=18.65ms  max=291.82ms p(90)=28.02ms p(95)=31.51ms p(99.9)=51.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 304527
     http_req_receiving.............: avg=747.65µs min=50.42µs med=109.79µs max=45.33ms  p(90)=1.94ms  p(95)=2.9ms   p(99.9)=20.21ms
     http_req_sending...............: avg=45.35µs  min=4.46µs  med=8.43µs   max=176.32ms p(90)=18.18µs p(95)=84.64µs p(99.9)=4.54ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.69ms  min=1.41ms  med=17.83ms  max=291.42ms p(90)=27.07ms p(95)=30.5ms  p(99.9)=49.75ms
     http_reqs......................: 304527  2533.520003/s
     iteration_duration.............: avg=19.7ms   min=2.47ms  med=18.85ms  max=322.96ms p(90)=28.24ms p(95)=31.74ms p(99.9)=52.05ms
     iterations.....................: 304427  2532.688051/s
     success_rate...................: 100.00% ✓ 304427      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 896253      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 359 MB  3.0 MB/s
     http_req_blocked...............: avg=3.47µs  min=851ns   med=2.58µs  max=17.81ms  p(90)=4.16µs  p(95)=4.89µs  p(99.9)=38.37µs 
     http_req_connecting............: avg=280ns   min=0s      med=0s      max=3.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.84ms min=1.6ms   med=16.78ms max=372.24ms p(90)=32.33ms p(95)=39.45ms p(99.9)=138.98ms
       { expected_response:true }...: avg=19.84ms min=1.6ms   med=16.78ms max=372.24ms p(90)=32.33ms p(95)=39.45ms p(99.9)=138.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 298851
     http_req_receiving.............: avg=566.7µs min=49.52µs med=95.83µs max=214.31ms p(90)=1.08ms  p(95)=1.95ms  p(99.9)=26.99ms 
     http_req_sending...............: avg=43.81µs min=4.86µs  med=9.65µs  max=53.6ms   p(90)=18.14µs p(95)=91.61µs p(99.9)=3.59ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.23ms min=1.48ms  med=16.26ms max=371.72ms p(90)=31.39ms p(95)=38.3ms  p(99.9)=137.51ms
     http_reqs......................: 298851  2486.21237/s
     iteration_duration.............: avg=20.07ms min=2.62ms  med=16.98ms max=372.41ms p(90)=32.56ms p(95)=39.71ms p(99.9)=140.11ms
     iterations.....................: 298751  2485.380446/s
     success_rate...................: 100.00% ✓ 298751      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 876957      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 351 MB  2.9 MB/s
     http_req_blocked...............: avg=3.29µs  min=982ns   med=2.55µs  max=10.1ms   p(90)=4.05µs  p(95)=4.75µs   p(99.9)=36.07µs
     http_req_connecting............: avg=314ns   min=0s      med=0s      max=3.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.3ms  min=1.56ms  med=20.1ms  max=290.61ms p(90)=28.29ms p(95)=30.66ms  p(99.9)=49.02ms
       { expected_response:true }...: avg=20.3ms  min=1.56ms  med=20.1ms  max=290.61ms p(90)=28.29ms p(95)=30.66ms  p(99.9)=49.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292419
     http_req_receiving.............: avg=88.19µs min=25.14µs med=51.58µs max=205.42ms p(90)=89.45µs p(95)=121.83µs p(99.9)=6.01ms 
     http_req_sending...............: avg=41.11µs min=4.84µs  med=10.22µs max=248.61ms p(90)=16.63µs p(95)=55.51µs  p(99.9)=2.5ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.17ms min=1.47ms  med=19.99ms max=277.73ms p(90)=28.15ms p(95)=30.48ms  p(99.9)=48.03ms
     http_reqs......................: 292419  2432.802944/s
     iteration_duration.............: avg=20.51ms min=2.84ms  med=20.3ms  max=298.5ms  p(90)=28.49ms p(95)=30.87ms  p(99.9)=49.75ms
     iterations.....................: 292319  2431.970986/s
     success_rate...................: 100.00% ✓ 292319      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 864327      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.14µs   min=852ns   med=2.07µs  max=32.04ms  p(90)=3.71µs  p(95)=4.44µs  p(99.9)=30.77µs 
     http_req_connecting............: avg=310ns    min=0s      med=0s      max=3.84ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.6ms   min=1.62ms  med=17.06ms max=416.39ms p(90)=34.06ms p(95)=41.93ms p(99.9)=153.69ms
       { expected_response:true }...: avg=20.6ms   min=1.62ms  med=17.06ms max=416.39ms p(90)=34.06ms p(95)=41.93ms p(99.9)=153.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288209
     http_req_receiving.............: avg=566.04µs min=50.66µs med=93.82µs max=217.7ms  p(90)=1.08ms  p(95)=1.83ms  p(99.9)=27.75ms 
     http_req_sending...............: avg=40.95µs  min=4.46µs  med=8.66µs  max=105.52ms p(90)=17.15µs p(95)=50.67µs p(99.9)=3.32ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.99ms  min=1.49ms  med=16.55ms max=416.31ms p(90)=33.08ms p(95)=40.81ms p(99.9)=153.01ms
     http_reqs......................: 288209  2397.624146/s
     iteration_duration.............: avg=20.81ms  min=2.72ms  med=17.26ms max=416.59ms p(90)=34.29ms p(95)=42.16ms p(99.9)=155.12ms
     iterations.....................: 288109  2396.792242/s
     success_rate...................: 100.00% ✓ 288109      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 790191      ✗ 0     
     data_received..................: 23 GB   192 MB/s
     data_sent......................: 317 MB  2.6 MB/s
     http_req_blocked...............: avg=2.8µs    min=882ns   med=2.08µs   max=5.03ms   p(90)=3.59µs  p(95)=4.28µs  p(99.9)=34.52µs 
     http_req_connecting............: avg=319ns    min=0s      med=0s       max=3.27ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.55ms  min=1.97ms  med=18.84ms  max=341.74ms p(90)=36.49ms p(95)=45.12ms p(99.9)=164.33ms
       { expected_response:true }...: avg=22.55ms  min=1.97ms  med=18.84ms  max=341.74ms p(90)=36.49ms p(95)=45.12ms p(99.9)=164.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 263497
     http_req_receiving.............: avg=623.41µs min=49.16µs med=101.96µs max=224.3ms  p(90)=1.15ms  p(95)=1.92ms  p(99.9)=30.02ms 
     http_req_sending...............: avg=37.52µs  min=4.47µs  med=8.96µs   max=164.66ms p(90)=18.04µs p(95)=32.52µs p(99.9)=2.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.89ms  min=1.83ms  med=18.29ms  max=340.7ms  p(90)=35.47ms p(95)=43.87ms p(99.9)=161.29ms
     http_reqs......................: 263497  2191.16973/s
     iteration_duration.............: avg=22.77ms  min=3.28ms  med=19.05ms  max=341.92ms p(90)=36.71ms p(95)=45.34ms p(99.9)=166.27ms
     iterations.....................: 263397  2190.338158/s
     success_rate...................: 100.00% ✓ 263397      ✗ 0     
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

     checks.........................: 100.00% ✓ 587172      ✗ 0     
     data_received..................: 17 GB   143 MB/s
     data_sent......................: 235 MB  2.0 MB/s
     http_req_blocked...............: avg=3.99µs   min=912ns  med=2.88µs  max=12.37ms  p(90)=5.08µs   p(95)=6.13µs   p(99.9)=46.09µs
     http_req_connecting............: avg=528ns    min=0s     med=0s      max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.39ms  min=2.17ms med=29.89ms max=327.14ms p(90)=40.2ms   p(95)=43.62ms  p(99.9)=65.96ms
       { expected_response:true }...: avg=30.39ms  min=2.17ms med=29.89ms max=327.14ms p(90)=40.2ms   p(95)=43.62ms  p(99.9)=65.96ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 195824
     http_req_receiving.............: avg=114.36µs min=28.2µs med=58.72µs max=176.79ms p(90)=130.27µs p(95)=218.75µs p(99.9)=4.78ms 
     http_req_sending...............: avg=43.91µs  min=4.65µs med=10.83µs max=128.88ms p(90)=24.95µs  p(95)=115.72µs p(99.9)=3.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.23ms  min=2.11ms med=29.76ms max=205.89ms p(90)=40.03ms  p(95)=43.42ms  p(99.9)=65.09ms
     http_reqs......................: 195824  1628.061518/s
     iteration_duration.............: avg=30.64ms  min=4.55ms med=30.12ms max=348.72ms p(90)=40.43ms  p(95)=43.85ms  p(99.9)=66.38ms
     iterations.....................: 195724  1627.230128/s
     success_rate...................: 100.00% ✓ 195724      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.331.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 445140      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.97µs  min=1.16µs  med=3.02µs  max=4.08ms   p(90)=4.62µs   p(95)=5.31µs   p(99.9)=37.83µs 
     http_req_connecting............: avg=641ns   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.17ms min=2.17ms  med=39.78ms max=319.12ms p(90)=55.93ms  p(95)=60.88ms  p(99.9)=84.36ms 
       { expected_response:true }...: avg=40.17ms min=2.17ms  med=39.78ms max=319.12ms p(90)=55.93ms  p(95)=60.88ms  p(99.9)=84.36ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148480
     http_req_receiving.............: avg=80.16µs min=26.19µs med=66.31µs max=147.85ms p(90)=105.19µs p(95)=121.97µs p(99.9)=930.75µs
     http_req_sending...............: avg=28.88µs min=4.98µs  med=12.75µs max=132.87ms p(90)=20.02µs  p(95)=24.08µs  p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.06ms min=2.06ms  med=39.68ms max=307.09ms p(90)=55.82ms  p(95)=60.77ms  p(99.9)=84ms    
     http_reqs......................: 148480  1234.448467/s
     iteration_duration.............: avg=40.42ms min=3.85ms  med=40.01ms max=330.24ms p(90)=56.14ms  p(95)=61.1ms   p(99.9)=85.12ms 
     iterations.....................: 148380  1233.617077/s
     success_rate...................: 100.00% ✓ 148380      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 206700     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 83 MB   688 kB/s
     http_req_blocked...............: avg=4.1µs   min=1.01µs  med=2.65µs  max=3.37ms   p(90)=4.19µs   p(95)=4.83µs   p(99.9)=41.7µs  
     http_req_connecting............: avg=1.19µs  min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.74ms min=3.91ms  med=84.82ms max=315.93ms p(90)=105.83ms p(95)=116.31ms p(99.9)=201.88ms
       { expected_response:true }...: avg=86.74ms min=3.91ms  med=84.82ms max=315.93ms p(90)=105.83ms p(95)=116.31ms p(99.9)=201.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69000
     http_req_receiving.............: avg=83.89µs min=28.71µs med=70.43µs max=160.32ms p(90)=106.43µs p(95)=119.02µs p(99.9)=609.18µs
     http_req_sending...............: avg=23.58µs min=4.93µs  med=12.84µs max=249.06ms p(90)=19.59µs  p(95)=21.69µs  p(99.9)=617.76µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.63ms min=3.8ms   med=84.73ms max=306.29ms p(90)=105.72ms p(95)=116.23ms p(99.9)=201.13ms
     http_reqs......................: 69000   572.519699/s
     iteration_duration.............: avg=87.09ms min=15.82ms med=85.07ms max=328.43ms p(90)=106.09ms p(95)=116.63ms p(99.9)=204.16ms
     iterations.....................: 68900   571.68996/s
     success_rate...................: 100.00% ✓ 68900      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 149598     ✗ 0    
     data_received..................: 4.4 GB  36 MB/s
     data_sent......................: 60 MB   497 kB/s
     http_req_blocked...............: avg=5.92µs   min=1.48µs  med=3.79µs   max=3.67ms   p(90)=5.29µs   p(95)=5.9µs    p(99.9)=139.17µs
     http_req_connecting............: avg=1.79µs   min=0s      med=0s       max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=54.97µs 
     http_req_duration..............: avg=119.83ms min=5.28ms  med=117.49ms max=324.23ms p(90)=158.73ms p(95)=170.61ms p(99.9)=219.2ms 
       { expected_response:true }...: avg=119.83ms min=5.28ms  med=117.49ms max=324.23ms p(90)=158.73ms p(95)=170.61ms p(99.9)=219.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 49966
     http_req_receiving.............: avg=90.62µs  min=34.21µs med=86.42µs  max=16.16ms  p(90)=118.55µs p(95)=131.39µs p(99.9)=600.26µs
     http_req_sending...............: avg=29.16µs  min=6.36µs  med=17.48µs  max=174.01ms p(90)=22.71µs  p(95)=24.62µs  p(99.9)=619.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=119.71ms min=5.15ms  med=117.37ms max=323.65ms p(90)=158.59ms p(95)=170.47ms p(99.9)=218.36ms
     http_reqs......................: 49966   414.102523/s
     iteration_duration.............: avg=120.34ms min=14.75ms med=117.84ms max=340.2ms  p(90)=159.08ms p(95)=170.95ms p(99.9)=220.77ms
     iterations.....................: 49866   413.273754/s
     success_rate...................: 100.00% ✓ 49866      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97923      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=6.45µs   min=1.17µs  med=3.27µs   max=3.95ms   p(90)=4.65µs   p(95)=5.22µs   p(99.9)=1.53ms  
     http_req_connecting............: avg=2.95µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.5ms   
     http_req_duration..............: avg=183.14ms min=6.1ms   med=169.37ms max=623.72ms p(90)=212.35ms p(95)=259.24ms p(99.9)=530.36ms
       { expected_response:true }...: avg=183.14ms min=6.1ms   med=169.37ms max=623.72ms p(90)=212.35ms p(95)=259.24ms p(99.9)=530.36ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32741
     http_req_receiving.............: avg=167.95µs min=30.54µs med=90.87µs  max=182.62ms p(90)=121.16µs p(95)=132.86µs p(99.9)=2.85ms  
     http_req_sending...............: avg=38.19µs  min=5.4µs   med=18.19µs  max=222.19ms p(90)=22.51µs  p(95)=24.31µs  p(99.9)=515.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.93ms min=5.98ms  med=169.27ms max=623.54ms p(90)=212.02ms p(95)=257.74ms p(99.9)=530.12ms
     http_reqs......................: 32741   270.799451/s
     iteration_duration.............: avg=183.96ms min=18.15ms med=169.73ms max=624.01ms p(90)=212.76ms p(95)=260.66ms p(99.9)=530.67ms
     iterations.....................: 32641   269.972355/s
     success_rate...................: 100.00% ✓ 32641      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 96240      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.98µs   min=1.31µs  med=3.67µs   max=3.75ms   p(90)=5.05µs   p(95)=5.64µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=3.72ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=186.26ms min=7.72ms  med=187.63ms max=384.09ms p(90)=209.8ms  p(95)=216.67ms p(99.9)=278.45ms
       { expected_response:true }...: avg=186.26ms min=7.72ms  med=187.63ms max=384.09ms p(90)=209.8ms  p(95)=216.67ms p(99.9)=278.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32180
     http_req_receiving.............: avg=97.69µs  min=31.93µs med=87.97µs  max=92.26ms  p(90)=119.04µs p(95)=131.43µs p(99.9)=687.89µs
     http_req_sending...............: avg=32.94µs  min=5.79µs  med=17.43µs  max=95.89ms  p(90)=22.08µs  p(95)=23.91µs  p(99.9)=531.9µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.13ms min=7.62ms  med=187.48ms max=378.44ms p(90)=209.69ms p(95)=216.56ms p(99.9)=278.12ms
     http_reqs......................: 32180   266.034765/s
     iteration_duration.............: avg=187.12ms min=50.08ms med=188.15ms max=391.1ms  p(90)=210.1ms  p(95)=216.97ms p(99.9)=280.95ms
     iterations.....................: 32080   265.208057/s
     success_rate...................: 100.00% ✓ 32080      ✗ 0    
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

     checks.........................: 100.00% ✓ 7542      ✗ 0   
     data_received..................: 250 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=43µs     min=1.15µs   med=3.39µs  max=3.71ms  p(90)=5.19µs   p(95)=6.1µs    p(99.9)=3.37ms
     http_req_connecting............: avg=36.49µs  min=0s       med=0s      max=3.67ms  p(90)=0s       p(95)=0s       p(99.9)=3.34ms
     http_req_duration..............: avg=2.33s    min=26.52ms  med=2.41s   max=4.63s   p(90)=3.21s    p(95)=3.43s    p(99.9)=4.16s 
       { expected_response:true }...: avg=2.33s    min=26.52ms  med=2.41s   max=4.63s   p(90)=3.21s    p(95)=3.43s    p(99.9)=4.16s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2614
     http_req_receiving.............: avg=102.63µs min=33.13µs  med=95.63µs max=3.9ms   p(90)=135.01µs p(95)=150.19µs p(99.9)=1.23ms
     http_req_sending...............: avg=40.51µs  min=5.76µs   med=18.94µs max=12.84ms p(90)=24.69µs  p(95)=28.37µs  p(99.9)=2.77ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.33s    min=26.42ms  med=2.41s   max=4.63s   p(90)=3.21s    p(95)=3.43s    p(99.9)=4.16s 
     http_reqs......................: 2614    20.704629/s
     iteration_duration.............: avg=2.42s    min=334.38ms med=2.44s   max=4.63s   p(90)=3.23s    p(95)=3.44s    p(99.9)=4.17s 
     iterations.....................: 2514    19.912562/s
     success_rate...................: 100.00% ✓ 2514      ✗ 0   
     vus............................: 18      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

