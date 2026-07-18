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
| hive-router | v0.0.83 | 2,975 | 3,221 | 2,949 | 3.2% |  |
| fusion-nightly | 16.5.1-p.2 | 2,583 | 2,689 | 2,571 | 1.5% |  |
| fusion | 16.5.0 | 2,550 | 2,668 | 2,540 | 1.8% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,513 | 2,655 | 2,501 | 2.2% |  |
| grafbase | 0.53.5 | 2,213 | 2,316 | 2,196 | 1.8% |  |
| cosmo | 0.331.1 | 1,324 | 1,368 | 1,318 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.4 | 620 | 637 | 619 | 1.1% |  |
| apollo-router | v2.16.0 | 488 | 507 | 480 | 1.7% |  |
| apollo-gateway | 2.14.2 | 283 | 287 | 281 | 0.7% |  |
| hive-gateway | 2.10.4 | 275 | 284 | 273 | 1.2% |  |
| feddi | 5ff8b6165878 | — | — | — | — | non-compatible response (1079 across 9/9 runs) |
| fusion-nightly-fed | — | — | — | — | — | not run |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.83 | 2,603 | 2,772 | 2,573 | 2.7% |  |
| fusion | 16.5.0 | 2,402 | 2,511 | 2,396 | 1.6% |  |
| fusion-nightly | 16.5.1-p.2 | 2,401 | 2,511 | 2,394 | 1.6% |  |
| fusion-nightly-net11 | 16.5.1-p.2 | 2,366 | 2,477 | 2,353 | 1.9% |  |
| fusion-nightly-fed | 16.5.1-p.2 | 2,233 | 2,329 | 2,226 | 1.6% |  |
| grafbase | 0.53.5 | 1,610 | 1,672 | 1,596 | 1.6% |  |
| cosmo | 0.331.1 | 1,198 | 1,244 | 1,192 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.4 | 585 | 605 | 582 | 1.2% |  |
| apollo-router | v2.16.0 | 448 | 467 | 446 | 1.6% |  |
| apollo-gateway | 2.14.2 | 274 | 276 | 273 | 0.4% |  |
| hive-gateway | 2.10.4 | 266 | 273 | 264 | 1.1% |  |
| feddi | 5ff8b6165878 | 20 | 21 | 20 | 2.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.83)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1072524     ✗ 0     
     data_received..................: 31 GB   261 MB/s
     data_sent......................: 430 MB  3.6 MB/s
     http_req_blocked...............: avg=2.55µs  min=841ns   med=1.9µs   max=18.7ms   p(90)=3.05µs  p(95)=3.62µs   p(99.9)=27.15µs
     http_req_connecting............: avg=260ns   min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.57ms min=1.46ms  med=15.97ms max=282.98ms p(90)=23.81ms p(95)=26.82ms  p(99.9)=46.42ms
       { expected_response:true }...: avg=16.57ms min=1.46ms  med=15.97ms max=282.98ms p(90)=23.81ms p(95)=26.82ms  p(99.9)=46.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 357608
     http_req_receiving.............: avg=85.37µs min=25.52µs med=46.51µs max=231.6ms  p(90)=81.2µs  p(95)=136.78µs p(99.9)=6.71ms 
     http_req_sending...............: avg=47.57µs min=4.65µs  med=8.25µs  max=121.85ms p(90)=14.04µs p(95)=86.39µs  p(99.9)=8.49ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.44ms min=1.41ms  med=15.86ms max=282.46ms p(90)=23.65ms p(95)=26.57ms  p(99.9)=45.21ms
     http_reqs......................: 357608  2975.572965/s
     iteration_duration.............: avg=16.77ms min=2.02ms  med=16.15ms max=302.6ms  p(90)=24.01ms p(95)=27.04ms  p(99.9)=47.08ms
     iterations.....................: 357508  2974.740889/s
     success_rate...................: 100.00% ✓ 357508      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 931647      ✗ 0     
     data_received..................: 27 GB   226 MB/s
     data_sent......................: 373 MB  3.1 MB/s
     http_req_blocked...............: avg=3.66µs   min=1µs    med=2.38µs  max=16.57ms  p(90)=3.69µs  p(95)=4.3µs   p(99.9)=34.95µs 
     http_req_connecting............: avg=834ns    min=0s     med=0s      max=8.3ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.09ms  min=2.02ms med=16.42ms max=294.41ms p(90)=31.15ms p(95)=37.79ms p(99.9)=112.31ms
       { expected_response:true }...: avg=19.09ms  min=2.02ms med=16.42ms max=294.41ms p(90)=31.15ms p(95)=37.79ms p(99.9)=112.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 310649
     http_req_receiving.............: avg=546.96µs min=50.4µs med=90.73µs max=142.79ms p(90)=1.06ms  p(95)=1.92ms  p(99.9)=25.18ms 
     http_req_sending...............: avg=45.33µs  min=4.76µs med=9.03µs  max=177.26ms p(90)=15.42µs p(95)=87.05µs p(99.9)=4.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.5ms   min=1.92ms med=15.89ms max=294.32ms p(90)=30.26ms p(95)=36.74ms p(99.9)=111.28ms
     http_reqs......................: 310649  2583.218838/s
     iteration_duration.............: avg=19.31ms  min=3.15ms med=16.61ms max=299.09ms p(90)=31.38ms p(95)=38.05ms p(99.9)=113.35ms
     iterations.....................: 310549  2582.387283/s
     success_rate...................: 100.00% ✓ 310549      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 919578      ✗ 0     
     data_received..................: 27 GB   224 MB/s
     data_sent......................: 369 MB  3.1 MB/s
     http_req_blocked...............: avg=2.58µs   min=851ns  med=1.91µs  max=14.48ms  p(90)=3.16µs  p(95)=3.77µs  p(99.9)=28.98µs 
     http_req_connecting............: avg=177ns    min=0s     med=0s      max=3.06ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=19.35ms  min=1.99ms med=16.63ms max=279.83ms p(90)=31.32ms p(95)=37.93ms p(99.9)=127.02ms
       { expected_response:true }...: avg=19.35ms  min=1.99ms med=16.63ms max=279.83ms p(90)=31.32ms p(95)=37.93ms p(99.9)=127.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 306626
     http_req_receiving.............: avg=536.76µs min=49.1µs med=89.53µs max=162.82ms p(90)=1.04ms  p(95)=1.85ms  p(99.9)=23.49ms 
     http_req_sending...............: avg=41.07µs  min=4.52µs med=8.19µs  max=203.7ms  p(90)=14.51µs p(95)=80.49µs p(99.9)=3.39ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=18.78ms  min=1.89ms med=16.12ms max=279.49ms p(90)=30.42ms p(95)=36.95ms p(99.9)=126.3ms 
     http_reqs......................: 306626  2550.047188/s
     iteration_duration.............: avg=19.56ms  min=2.93ms med=16.82ms max=293.62ms p(90)=31.54ms p(95)=38.17ms p(99.9)=128.76ms
     iterations.....................: 306526  2549.215541/s
     success_rate...................: 100.00% ✓ 306526      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (rust subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 906333      ✗ 0     
     data_received..................: 27 GB   220 MB/s
     data_sent......................: 363 MB  3.0 MB/s
     http_req_blocked...............: avg=2.67µs   min=912ns   med=1.93µs   max=18.04ms  p(90)=3.14µs  p(95)=3.71µs  p(99.9)=27.21µs
     http_req_connecting............: avg=307ns    min=0s      med=0s       max=4.04ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=19.63ms  min=1.93ms  med=18.77ms  max=302.52ms p(90)=28.29ms p(95)=31.87ms p(99.9)=52.8ms 
       { expected_response:true }...: avg=19.63ms  min=1.93ms  med=18.77ms  max=302.52ms p(90)=28.29ms p(95)=31.87ms p(99.9)=52.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 302211
     http_req_receiving.............: avg=697.26µs min=52.45µs med=116.21µs max=152.47ms p(90)=1.73ms  p(95)=2.55ms  p(99.9)=18.59ms
     http_req_sending...............: avg=40.03µs  min=4.54µs  med=8.19µs   max=216.85ms p(90)=15.19µs p(95)=76.09µs p(99.9)=3.43ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=18.9ms   min=1.83ms  med=18.03ms  max=269.4ms  p(90)=27.44ms p(95)=30.94ms p(99.9)=51.26ms
     http_reqs......................: 302211  2513.454586/s
     iteration_duration.............: avg=19.85ms  min=3.62ms  med=18.97ms  max=313.4ms  p(90)=28.5ms  p(95)=32.1ms  p(99.9)=53.29ms
     iterations.....................: 302111  2512.622897/s
     success_rate...................: 100.00% ✓ 302111      ✗ 0     
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

     checks.........................: 100.00% ✓ 797904      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 320 MB  2.7 MB/s
     http_req_blocked...............: avg=5.7µs   min=1.04µs  med=2.73µs  max=55.11ms  p(90)=4.31µs  p(95)=5.09µs   p(99.9)=39.49µs
     http_req_connecting............: avg=2.53µs  min=0s      med=0s      max=54.95ms  p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=22.32ms min=1.66ms  med=22.09ms max=283.09ms p(90)=26.64ms p(95)=28.58ms  p(99.9)=48.83ms
       { expected_response:true }...: avg=22.32ms min=1.66ms  med=22.09ms max=283.09ms p(90)=26.64ms p(95)=28.58ms  p(99.9)=48.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 266068
     http_req_receiving.............: avg=94.26µs min=27.56µs med=58.14µs max=155.76ms p(90)=98.05µs p(95)=131.41µs p(99.9)=6.85ms 
     http_req_sending...............: avg=42.95µs min=5.14µs  med=10.8µs  max=71.93ms  p(90)=17.57µs p(95)=53.3µs   p(99.9)=3.06ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=22.19ms min=1.6ms   med=21.98ms max=277.5ms  p(90)=26.5ms  p(95)=28.38ms  p(99.9)=47.72ms
     http_reqs......................: 266068  2213.245096/s
     iteration_duration.............: avg=22.54ms min=3.13ms  med=22.29ms max=300.24ms p(90)=26.85ms p(95)=28.8ms   p(99.9)=49.38ms
     iterations.....................: 265968  2212.413262/s
     success_rate...................: 100.00% ✓ 265968      ✗ 0     
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

     checks.........................: 100.00% ✓ 477636      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=2.88µs  min=932ns   med=2.01µs  max=3.56ms   p(90)=3.4µs   p(95)=4.02µs   p(99.9)=30.19µs 
     http_req_connecting............: avg=544ns   min=0s      med=0s      max=3.5ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=37.45ms min=1.99ms  med=37.07ms max=290.76ms p(90)=52.36ms p(95)=57.01ms  p(99.9)=78.67ms 
       { expected_response:true }...: avg=37.45ms min=1.99ms  med=37.07ms max=290.76ms p(90)=52.36ms p(95)=57.01ms  p(99.9)=78.67ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 159312
     http_req_receiving.............: avg=68.53µs min=24.44µs med=55.91µs max=81.31ms  p(90)=90.96µs p(95)=106.15µs p(99.9)=889.97µs
     http_req_sending...............: avg=22.48µs min=4.66µs  med=9.46µs  max=122.66ms p(90)=16.03µs p(95)=20µs     p(99.9)=961.11µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=37.36ms min=1.89ms  med=36.98ms max=290.23ms p(90)=52.26ms p(95)=56.92ms  p(99.9)=78.52ms 
     http_reqs......................: 159312  1324.641378/s
     iteration_duration.............: avg=37.67ms min=3.62ms  med=37.27ms max=306.51ms p(90)=52.55ms p(95)=57.2ms   p(99.9)=79.06ms 
     iterations.....................: 159212  1323.809902/s
     success_rate...................: 100.00% ✓ 159212      ✗ 0     
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

     checks.........................: 100.00% ✓ 223818     ✗ 0    
     data_received..................: 6.6 GB  55 MB/s
     data_sent......................: 90 MB   745 kB/s
     http_req_blocked...............: avg=4.57µs  min=1.07µs  med=3.01µs  max=4.14ms   p(90)=4.59µs   p(95)=5.27µs   p(99.9)=45.07µs 
     http_req_connecting............: avg=1.27µs  min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.09ms min=3.52ms  med=78.18ms max=322.41ms p(90)=97.8ms   p(95)=106.78ms p(99.9)=193.38ms
       { expected_response:true }...: avg=80.09ms min=3.52ms  med=78.18ms max=322.41ms p(90)=97.8ms   p(95)=106.78ms p(99.9)=193.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74706
     http_req_receiving.............: avg=81.03µs min=29.02µs med=71.69µs max=68.15ms  p(90)=108.45µs p(95)=122.09µs p(99.9)=656.91µs
     http_req_sending...............: avg=27.65µs min=5.47µs  med=13.65µs max=214.44ms p(90)=20.66µs  p(95)=23.09µs  p(99.9)=630.32µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=79.98ms min=3.46ms  med=78.08ms max=322.08ms p(90)=97.68ms  p(95)=106.66ms p(99.9)=193.11ms
     http_reqs......................: 74706   620.032931/s
     iteration_duration.............: avg=80.43ms min=15.06ms med=78.42ms max=335.29ms p(90)=98.05ms  p(95)=107.04ms p(99.9)=194.15ms
     iterations.....................: 74606   619.202967/s
     success_rate...................: 100.00% ✓ 74606      ✗ 0    
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

     checks.........................: 100.00% ✓ 176460     ✗ 0    
     data_received..................: 5.2 GB  43 MB/s
     data_sent......................: 71 MB   587 kB/s
     http_req_blocked...............: avg=4.88µs   min=1.06µs  med=3.13µs   max=3.22ms   p(90)=4.54µs   p(95)=5.08µs   p(99.9)=55.84µs 
     http_req_connecting............: avg=1.55µs   min=0s      med=0s       max=3.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=101.6ms  min=4.65ms  med=101.26ms max=319.27ms p(90)=122.6ms  p(95)=129.09ms p(99.9)=160.42ms
       { expected_response:true }...: avg=101.6ms  min=4.65ms  med=101.26ms max=319.27ms p(90)=122.6ms  p(95)=129.09ms p(99.9)=160.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 58920
     http_req_receiving.............: avg=84µs     min=29.32µs med=77.47µs  max=83.14ms  p(90)=109.06µs p(95)=121.94µs p(99.9)=559.93µs
     http_req_sending...............: avg=27.09µs  min=5.38µs  med=16.15µs  max=107.91ms p(90)=21.25µs  p(95)=23.12µs  p(99.9)=577.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.49ms min=4.54ms  med=101.16ms max=292.12ms p(90)=122.49ms p(95)=128.96ms p(99.9)=159.67ms
     http_reqs......................: 58920   488.628952/s
     iteration_duration.............: avg=102.03ms min=32.64ms med=101.53ms max=340.3ms  p(90)=122.85ms p(95)=129.35ms p(99.9)=163.03ms
     iterations.....................: 58820   487.799643/s
     success_rate...................: 100.00% ✓ 58820      ✗ 0    
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

     checks.........................: 100.00% ✓ 102438     ✗ 0    
     data_received..................: 3.0 GB  25 MB/s
     data_sent......................: 41 MB   340 kB/s
     http_req_blocked...............: avg=5.59µs   min=1.12µs  med=2.99µs   max=3.4ms    p(90)=4.26µs   p(95)=4.74µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=2.45µs   min=0s      med=0s       max=3.36ms   p(90)=0s       p(95)=0s       p(99.9)=1.08ms  
     http_req_duration..............: avg=175.04ms min=7.48ms  med=166.46ms max=386.24ms p(90)=209.8ms  p(95)=215.9ms  p(99.9)=277.56ms
       { expected_response:true }...: avg=175.04ms min=7.48ms  med=166.46ms max=386.24ms p(90)=209.8ms  p(95)=215.9ms  p(99.9)=277.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 34246
     http_req_receiving.............: avg=94.24µs  min=32.22µs med=84.34µs  max=139.75ms p(90)=114.55µs p(95)=126.21µs p(99.9)=435.85µs
     http_req_sending...............: avg=27.69µs  min=5.27µs  med=16.11µs  max=91.06ms  p(90)=20.44µs  p(95)=22.14µs  p(99.9)=493.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=174.91ms min=7.39ms  med=166.35ms max=385.6ms  p(90)=209.7ms  p(95)=215.8ms  p(99.9)=277.39ms
     http_reqs......................: 34246   283.154342/s
     iteration_duration.............: avg=175.82ms min=42.23ms med=166.73ms max=395.52ms p(90)=210.1ms  p(95)=216.18ms p(99.9)=285.38ms
     iterations.....................: 34146   282.327517/s
     success_rate...................: 100.00% ✓ 34146      ✗ 0    
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

     checks.........................: 100.00% ✓ 99690      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   331 kB/s
     http_req_blocked...............: avg=6.38µs   min=1.61µs  med=3.6µs    max=3.41ms   p(90)=5.01µs   p(95)=5.62µs   p(99.9)=1.19ms  
     http_req_connecting............: avg=2.51µs   min=0s      med=0s       max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=1.17ms  
     http_req_duration..............: avg=179.88ms min=5.92ms  med=165.69ms max=611.87ms p(90)=211.05ms p(95)=254.01ms p(99.9)=557.3ms 
       { expected_response:true }...: avg=179.88ms min=5.92ms  med=165.69ms max=611.87ms p(90)=211.05ms p(95)=254.01ms p(99.9)=557.3ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 33330
     http_req_receiving.............: avg=98.15µs  min=34.87µs med=85.76µs  max=113.34ms p(90)=116.16µs p(95)=127.64µs p(99.9)=646.26µs
     http_req_sending...............: avg=28.47µs  min=6.73µs  med=17.28µs  max=107.59ms p(90)=22.28µs  p(95)=24.16µs  p(99.9)=551.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=179.76ms min=5.78ms  med=165.57ms max=611.75ms p(90)=210.94ms p(95)=253.71ms p(99.9)=557.19ms
     http_reqs......................: 33330   275.588569/s
     iteration_duration.............: avg=180.7ms  min=28.89ms med=166.05ms max=612.08ms p(90)=211.46ms p(95)=255.46ms p(99.9)=557.71ms
     iterations.....................: 33230   274.761721/s
     success_rate...................: 100.00% ✓ 33230      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 938649      ✗ 0     
     data_received..................: 27 GB   228 MB/s
     data_sent......................: 376 MB  3.1 MB/s
     http_req_blocked...............: avg=3.11µs  min=881ns   med=2.36µs  max=18.77ms  p(90)=4.04µs  p(95)=4.79µs   p(99.9)=35.77µs
     http_req_connecting............: avg=267ns   min=0s      med=0s      max=3.4ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=18.95ms min=1.65ms  med=18.57ms max=281.71ms p(90)=26.29ms p(95)=28.82ms  p(99.9)=48.68ms
       { expected_response:true }...: avg=18.95ms min=1.65ms  med=18.57ms max=281.71ms p(90)=26.29ms p(95)=28.82ms  p(99.9)=48.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 312983
     http_req_receiving.............: avg=90.73µs min=23.62µs med=48.13µs max=44.65ms  p(90)=90.74µs p(95)=148.69µs p(99.9)=7.39ms 
     http_req_sending...............: avg=46.42µs min=4.32µs  med=9.56µs  max=140.09ms p(90)=17.64µs p(95)=95.38µs  p(99.9)=4.55ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=18.81ms min=1.52ms  med=18.45ms max=281.07ms p(90)=26.14ms p(95)=28.6ms   p(99.9)=47.7ms 
     http_reqs......................: 312983  2603.654505/s
     iteration_duration.............: avg=19.16ms min=3.28ms  med=18.77ms max=303.17ms p(90)=26.5ms  p(95)=29.04ms  p(99.9)=49.14ms
     iterations.....................: 312883  2602.822621/s
     success_rate...................: 100.00% ✓ 312883      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 866034      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=2.87µs  min=872ns   med=2.01µs  max=14.39ms  p(90)=3.56µs  p(95)=4.31µs  p(99.9)=32.19µs 
     http_req_connecting............: avg=330ns   min=0s      med=0s      max=3.54ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.55ms min=1.64ms  med=17.42ms max=447.43ms p(90)=33.37ms p(95)=40.59ms p(99.9)=144.75ms
       { expected_response:true }...: avg=20.55ms min=1.64ms  med=17.42ms max=447.43ms p(90)=33.37ms p(95)=40.59ms p(99.9)=144.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288778
     http_req_receiving.............: avg=565.1µs min=49.67µs med=93.13µs max=165.81ms p(90)=1.09ms  p(95)=1.87ms  p(99.9)=27.03ms 
     http_req_sending...............: avg=41.92µs min=4.44µs  med=8.66µs  max=156.9ms  p(90)=17.84µs p(95)=79.93µs p(99.9)=3.57ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.95ms min=1.52ms  med=16.9ms  max=447.34ms p(90)=32.41ms p(95)=39.51ms p(99.9)=142.88ms
     http_reqs......................: 288778  2402.194511/s
     iteration_duration.............: avg=20.77ms min=2.54ms  med=17.62ms max=447.62ms p(90)=33.59ms p(95)=40.83ms p(99.9)=146.23ms
     iterations.....................: 288678  2401.362663/s
     success_rate...................: 100.00% ✓ 288678      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 865608      ✗ 0     
     data_received..................: 25 GB   211 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=2.76µs   min=831ns   med=2.09µs  max=16.7ms   p(90)=3.59µs  p(95)=4.3µs   p(99.9)=32.81µs 
     http_req_connecting............: avg=170ns    min=0s      med=0s      max=2.46ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=20.56ms  min=1.59ms  med=17.1ms  max=382.18ms p(90)=33.88ms p(95)=41.61ms p(99.9)=148.45ms
       { expected_response:true }...: avg=20.56ms  min=1.59ms  med=17.1ms  max=382.18ms p(90)=33.88ms p(95)=41.61ms p(99.9)=148.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288636
     http_req_receiving.............: avg=576.36µs min=51.89µs med=95.54µs max=218.05ms p(90)=1.09ms  p(95)=1.87ms  p(99.9)=27.5ms  
     http_req_sending...............: avg=43.39µs  min=4.46µs  med=8.96µs  max=213.7ms  p(90)=17.73µs p(95)=80.12µs p(99.9)=3.26ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=19.94ms  min=1.48ms  med=16.58ms max=382.08ms p(90)=32.88ms p(95)=40.47ms p(99.9)=147.22ms
     http_reqs......................: 288636  2401.127897/s
     iteration_duration.............: avg=20.78ms  min=2.66ms  med=17.3ms  max=382.4ms  p(90)=34.11ms p(95)=41.85ms p(99.9)=149.09ms
     iterations.....................: 288536  2400.296009/s
     success_rate...................: 100.00% ✓ 288536      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 852897      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=3.47µs   min=1.02µs  med=2.59µs   max=16.21ms  p(90)=4.19µs  p(95)=4.91µs  p(99.9)=35.61µs
     http_req_connecting............: avg=333ns    min=0s      med=0s       max=3.55ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=20.87ms  min=1.51ms  med=19.97ms  max=329.19ms p(90)=30.33ms p(95)=34.19ms p(99.9)=54.56ms
       { expected_response:true }...: avg=20.87ms  min=1.51ms  med=19.97ms  max=329.19ms p(90)=30.33ms p(95)=34.19ms p(99.9)=54.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284399
     http_req_receiving.............: avg=803.03µs min=52.25µs med=124.98µs max=158.14ms p(90)=2.02ms  p(95)=3.02ms  p(99.9)=21.76ms
     http_req_sending...............: avg=45.05µs  min=4.45µs  med=9.63µs   max=174.55ms p(90)=18.88µs p(95)=91.08µs p(99.9)=4.35ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=20.02ms  min=1.39ms  med=19.1ms   max=320.03ms p(90)=29.33ms p(95)=33.15ms p(99.9)=53.12ms
     http_reqs......................: 284399  2366.106024/s
     iteration_duration.............: avg=21.09ms  min=2.62ms  med=20.18ms  max=346.44ms p(90)=30.55ms p(95)=34.43ms p(99.9)=55.08ms
     iterations.....................: 284299  2365.274057/s
     success_rate...................: 100.00% ✓ 284299      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.1-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 805461      ✗ 0     
     data_received..................: 24 GB   196 MB/s
     data_sent......................: 323 MB  2.7 MB/s
     http_req_blocked...............: avg=3.48µs   min=932ns   med=2.68µs   max=15.03ms  p(90)=4.36µs  p(95)=5.11µs  p(99.9)=38µs    
     http_req_connecting............: avg=333ns    min=0s      med=0s       max=4.05ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=22.1ms   min=1.95ms  med=19.01ms  max=434.66ms p(90)=35.27ms p(95)=42.76ms p(99.9)=143.31ms
       { expected_response:true }...: avg=22.1ms   min=1.95ms  med=19.01ms  max=434.66ms p(90)=35.27ms p(95)=42.76ms p(99.9)=143.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 268587
     http_req_receiving.............: avg=569.44µs min=51.33µs med=102.55µs max=264.95ms p(90)=1.12ms  p(95)=1.92ms  p(99.9)=26.55ms 
     http_req_sending...............: avg=44.22µs  min=4.74µs  med=10.34µs  max=166.65ms p(90)=19.55µs p(95)=92.16µs p(99.9)=3.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=21.49ms  min=1.85ms  med=18.46ms  max=434.57ms p(90)=34.33ms p(95)=41.69ms p(99.9)=141.9ms 
     http_reqs......................: 268587  2233.536547/s
     iteration_duration.............: avg=22.33ms  min=3.23ms  med=19.22ms  max=434.87ms p(90)=35.51ms p(95)=42.99ms p(99.9)=144.29ms
     iterations.....................: 268487  2232.704959/s
     success_rate...................: 100.00% ✓ 268487      ✗ 0     
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

     checks.........................: 100.00% ✓ 580692      ✗ 0     
     data_received..................: 17 GB   141 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.36µs  min=921ns   med=2.25µs  max=11.7ms   p(90)=4.38µs   p(95)=5.5µs    p(99.9)=42.39µs
     http_req_connecting............: avg=498ns   min=0s      med=0s      max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.73ms min=2.27ms  med=30.21ms max=294.74ms p(90)=40.47ms  p(95)=43.92ms  p(99.9)=65.46ms
       { expected_response:true }...: avg=30.73ms min=2.27ms  med=30.21ms max=294.74ms p(90)=40.47ms  p(95)=43.92ms  p(99.9)=65.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 193664
     http_req_receiving.............: avg=94.11µs min=29.03µs med=56.03µs max=49.31ms  p(90)=125.41µs p(95)=202.95µs p(99.9)=3.72ms 
     http_req_sending...............: avg=39.1µs  min=4.83µs  med=9.67µs  max=84.28ms  p(90)=24.18µs  p(95)=102.94µs p(99.9)=2.78ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.6ms  min=2.2ms   med=30.09ms max=294.54ms p(90)=40.33ms  p(95)=43.75ms  p(99.9)=64.48ms
     http_reqs......................: 193664  1610.09391/s
     iteration_duration.............: avg=30.98ms min=6.29ms  med=30.43ms max=313.35ms p(90)=40.69ms  p(95)=44.15ms  p(99.9)=66.02ms
     iterations.....................: 193564  1609.262525/s
     success_rate...................: 100.00% ✓ 193564      ✗ 0     
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

     checks.........................: 100.00% ✓ 432372      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 173 MB  1.4 MB/s
     http_req_blocked...............: avg=3.8µs   min=1.13µs  med=2.88µs  max=3.59ms   p(90)=4.4µs    p(95)=5.08µs   p(99.9)=38.54µs 
     http_req_connecting............: avg=618ns   min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.37ms min=2.04ms  med=40.98ms max=343.77ms p(90)=57.42ms  p(95)=62.44ms  p(99.9)=85.79ms 
       { expected_response:true }...: avg=41.37ms min=2.04ms  med=40.98ms max=343.77ms p(90)=57.42ms  p(95)=62.44ms  p(99.9)=85.79ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144224
     http_req_receiving.............: avg=81.67µs min=28.46µs med=67.52µs max=99.59ms  p(90)=107.31µs p(95)=124.47µs p(99.9)=874.56µs
     http_req_sending...............: avg=24.56µs min=4.98µs  med=12.24µs max=46.96ms  p(90)=18.54µs  p(95)=22.24µs  p(99.9)=893.1µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.26ms min=1.98ms  med=40.88ms max=343.15ms p(90)=57.3ms   p(95)=62.32ms  p(99.9)=85.55ms 
     http_reqs......................: 144224  1198.994445/s
     iteration_duration.............: avg=41.62ms min=3.85ms  med=41.2ms  max=351.23ms p(90)=57.64ms  p(95)=62.65ms  p(99.9)=86.33ms 
     iterations.....................: 144124  1198.163103/s
     success_rate...................: 100.00% ✓ 144124      ✗ 0     
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

     checks.........................: 100.00% ✓ 211572     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   704 kB/s
     http_req_blocked...............: avg=4.06µs  min=952ns   med=2.63µs  max=3.28ms   p(90)=4.19µs   p(95)=4.79µs   p(99.9)=44.78µs 
     http_req_connecting............: avg=1.17µs  min=0s      med=0s      max=3.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.74ms min=3.92ms  med=82.41ms max=312.37ms p(90)=106.05ms p(95)=117.4ms  p(99.9)=202.93ms
       { expected_response:true }...: avg=84.74ms min=3.92ms  med=82.41ms max=312.37ms p(90)=106.05ms p(95)=117.4ms  p(99.9)=202.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70624
     http_req_receiving.............: avg=85.25µs min=28.17µs med=71.9µs  max=95.25ms  p(90)=108.32µs p(95)=121.27µs p(99.9)=718.21µs
     http_req_sending...............: avg=22.42µs min=4.9µs   med=13.12µs max=114.3ms  p(90)=20.16µs  p(95)=22.25µs  p(99.9)=597.02µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.63ms min=3.85ms  med=82.31ms max=311.87ms p(90)=105.93ms p(95)=117.28ms p(99.9)=202.11ms
     http_reqs......................: 70624   585.994364/s
     iteration_duration.............: avg=85.09ms min=18.88ms med=82.66ms max=329.12ms p(90)=106.3ms  p(95)=117.68ms p(99.9)=204.1ms 
     iterations.....................: 70524   585.164625/s
     success_rate...................: 100.00% ✓ 70524      ✗ 0    
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

     checks.........................: 100.00% ✓ 162186     ✗ 0    
     data_received..................: 4.7 GB  39 MB/s
     data_sent......................: 65 MB   539 kB/s
     http_req_blocked...............: avg=5.81µs   min=1.07µs  med=3.71µs   max=3.92ms   p(90)=5.27µs   p(95)=5.88µs   p(99.9)=107.19µs
     http_req_connecting............: avg=1.77µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=110.53ms min=4.97ms  med=108.35ms max=321.2ms  p(90)=145.95ms p(95)=156.88ms p(99.9)=201.66ms
       { expected_response:true }...: avg=110.53ms min=4.97ms  med=108.35ms max=321.2ms  p(90)=145.95ms p(95)=156.88ms p(99.9)=201.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 54162
     http_req_receiving.............: avg=88.47µs  min=31.04µs med=84.64µs  max=16.5ms   p(90)=116.21µs p(95)=128.72µs p(99.9)=594.35µs
     http_req_sending...............: avg=31.87µs  min=5.53µs  med=18.49µs  max=112.93ms p(90)=23.79µs  p(95)=25.83µs  p(99.9)=582.95µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.41ms min=4.89ms  med=108.24ms max=320.74ms p(90)=145.84ms p(95)=156.74ms p(99.9)=200.72ms
     http_reqs......................: 54162   448.881573/s
     iteration_duration.............: avg=111.01ms min=8.85ms  med=108.67ms max=330.23ms p(90)=146.24ms p(95)=157.19ms p(99.9)=203.06ms
     iterations.....................: 54062   448.052797/s
     success_rate...................: 100.00% ✓ 54062      ✗ 0    
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

     checks.........................: 100.00% ✓ 99282      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   330 kB/s
     http_req_blocked...............: avg=5.81µs   min=1.1µs   med=3.11µs   max=3.37ms   p(90)=4.45µs   p(95)=5µs      p(99.9)=1.18ms  
     http_req_connecting............: avg=2.5µs    min=0s      med=0s       max=3.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.16ms  
     http_req_duration..............: avg=180.56ms min=7.7ms   med=181.83ms max=397.49ms p(90)=192.01ms p(95)=196.62ms p(99.9)=266.39ms
       { expected_response:true }...: avg=180.56ms min=7.7ms   med=181.83ms max=397.49ms p(90)=192.01ms p(95)=196.62ms p(99.9)=266.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33194
     http_req_receiving.............: avg=92.82µs  min=31.45µs med=87.14µs  max=71.06ms  p(90)=117.29µs p(95)=128.77µs p(99.9)=404.25µs
     http_req_sending...............: avg=24.36µs  min=5.55µs  med=17.54µs  max=58.74ms  p(90)=22.4µs   p(95)=24.2µs   p(99.9)=512.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=180.44ms min=7.61ms  med=181.73ms max=396.9ms  p(90)=191.9ms  p(95)=196.5ms  p(99.9)=266.26ms
     http_reqs......................: 33194   274.430369/s
     iteration_duration.............: avg=181.38ms min=41.1ms  med=182.22ms max=407.49ms p(90)=192.3ms  p(95)=196.91ms p(99.9)=272.46ms
     iterations.....................: 33094   273.603622/s
     success_rate...................: 100.00% ✓ 33094      ✗ 0    
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

     checks.........................: 100.00% ✓ 96276      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   320 kB/s
     http_req_blocked...............: avg=7.15µs   min=1.5µs   med=3.73µs   max=3.91ms   p(90)=5.24µs   p(95)=5.87µs   p(99.9)=1.67ms  
     http_req_connecting............: avg=3.11µs   min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=1.65ms  
     http_req_duration..............: avg=186.18ms min=5.72ms  med=171.33ms max=621.02ms p(90)=215ms    p(95)=267.73ms p(99.9)=554.84ms
       { expected_response:true }...: avg=186.18ms min=5.72ms  med=171.33ms max=621.02ms p(90)=215ms    p(95)=267.73ms p(99.9)=554.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32192
     http_req_receiving.............: avg=97.54µs  min=38.13µs med=92.51µs  max=24.09ms  p(90)=123.54µs p(95)=136.2µs  p(99.9)=632.49µs
     http_req_sending...............: avg=28.28µs  min=6.69µs  med=19.04µs  max=88.45ms  p(90)=23.86µs  p(95)=25.75µs  p(99.9)=469.78µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.06ms min=5.62ms  med=171.21ms max=620.85ms p(90)=214.85ms p(95)=267.53ms p(99.9)=554.73ms
     http_reqs......................: 32192   266.44809/s
     iteration_duration.............: avg=187.05ms min=20.6ms  med=171.7ms  max=621.28ms p(90)=215.46ms p(95)=269.78ms p(99.9)=555.04ms
     iterations.....................: 32092   265.620406/s
     success_rate...................: 100.00% ✓ 32092      ✗ 0    
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

     checks.........................: 100.00% ✓ 7425      ✗ 0   
     data_received..................: 247 MB  2.0 MB/s
     data_sent......................: 3.1 MB  25 kB/s
     http_req_blocked...............: avg=41.55µs  min=1.37µs   med=3.76µs  max=3.45ms  p(90)=5.51µs   p(95)=6.49µs   p(99.9)=3.06ms  
     http_req_connecting............: avg=36.86µs  min=0s       med=0s      max=3.4ms   p(90)=0s       p(95)=0s       p(99.9)=3.03ms  
     http_req_duration..............: avg=2.35s    min=25.88ms  med=2.41s   max=4.18s   p(90)=3.18s    p(95)=3.39s    p(99.9)=3.94s   
       { expected_response:true }...: avg=2.35s    min=25.88ms  med=2.41s   max=4.18s   p(90)=3.18s    p(95)=3.39s    p(99.9)=3.94s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2575
     http_req_receiving.............: avg=113.97µs min=32.99µs  med=93.5µs  max=41.9ms  p(90)=136.32µs p(95)=156.73µs p(99.9)=415.76µs
     http_req_sending...............: avg=47.68µs  min=6.92µs   med=19.55µs max=17.44ms p(90)=24.92µs  p(95)=28.8µs   p(99.9)=4.05ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.35s    min=25.77ms  med=2.41s   max=4.18s   p(90)=3.18s    p(95)=3.39s    p(99.9)=3.94s   
     http_reqs......................: 2575    20.426868/s
     iteration_duration.............: avg=2.44s    min=221.48ms med=2.44s   max=4.18s   p(90)=3.19s    p(95)=3.4s     p(99.9)=3.96s   
     iterations.....................: 2475    19.633591/s
     success_rate...................: 100.00% ✓ 2475      ✗ 0   
     vus............................: 5       min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

