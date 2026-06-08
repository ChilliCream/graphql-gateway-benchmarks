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
| hive-router | v0.0.65 | 2,596 | 2,747 | 2,553 | 2.5% |  |
| hotchocolate | 16.1.3 | 2,050 | 2,100 | 2,013 | 1.3% |  |
| cosmo | 0.321.1 | 1,151 | 1,151 | 1,146 | 0.3% | non-compatible response (18 across 7/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 508 | 513 | 501 | 0.9% |  |
| hive-gateway | 2.8.2 | 212 | 216 | 210 | 0.9% |  |
| apollo-gateway | 2.14.1 | 203 | 208 | 202 | 0.9% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (6938 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (506163 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,254 | 2,334 | 2,223 | 1.6% |  |
| hotchocolate | 16.1.3 | 1,870 | 1,904 | 1,848 | 1.1% |  |
| cosmo | 0.321.1 | 1,074 | 1,090 | 1,058 | 1.1% | non-compatible response (11 across 3/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 481 | 493 | 478 | 1.2% |  |
| hive-gateway | 2.8.2 | 216 | 219 | 215 | 0.6% |  |
| apollo-gateway | 2.14.1 | 205 | 208 | 203 | 0.7% |  |
| apollo-router | v2.15.0 | — | — | — | — | non-compatible response (39710 across 9/9 runs) |
| grafbase | 0.53.5 | — | — | — | — | non-compatible response (248376 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 479052      ✗ 0     
     data_received..................: 14 GB   228 MB/s
     data_sent......................: 193 MB  3.1 MB/s
     http_req_blocked...............: avg=29.06µs  min=1.07µs  med=2.67µs  max=151.09ms p(90)=4.22µs   p(95)=5.31µs   p(99.9)=7.99ms  
     http_req_connecting............: avg=25.33µs  min=0s      med=0s      max=150.9ms  p(90)=0s       p(95)=0s       p(99.9)=7.78ms  
     http_req_duration..............: avg=88.42ms  min=1.51ms  med=81.81ms max=364.97ms p(90)=170.91ms p(95)=187.44ms p(99.9)=261.39ms
       { expected_response:true }...: avg=88.42ms  min=1.51ms  med=81.81ms max=364.97ms p(90)=170.91ms p(95)=187.44ms p(99.9)=261.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160684
     http_req_receiving.............: avg=469.87µs min=29.06µs med=58.7µs  max=245.86ms p(90)=236.33µs p(95)=432.49µs p(99.9)=46.02ms 
     http_req_sending...............: avg=89.7µs   min=5.35µs  med=10.27µs max=103.09ms p(90)=19.15µs  p(95)=136.09µs p(99.9)=14.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.86ms  min=1.46ms  med=81.49ms max=311.69ms p(90)=169.97ms p(95)=185.82ms p(99.9)=255.56ms
     http_reqs......................: 160684  2596.970727/s
     iteration_duration.............: avg=89.3ms   min=2.6ms   med=82.84ms max=417.59ms p(90)=171.44ms p(95)=188.12ms p(99.9)=263.75ms
     iterations.....................: 159684  2580.808752/s
     success_rate...................: 100.00% ✓ 159684      ✗ 0     
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

     checks.........................: 100.00% ✓ 383415      ✗ 0     
     data_received..................: 11 GB   180 MB/s
     data_sent......................: 155 MB  2.5 MB/s
     http_req_blocked...............: avg=20.07µs  min=1.08µs  med=2.66µs   max=84.74ms  p(90)=4.07µs   p(95)=5.01µs   p(99.9)=2.07ms  
     http_req_connecting............: avg=16.46µs  min=0s      med=0s       max=84.69ms  p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=110.47ms min=2.41ms  med=100.27ms max=606.03ms p(90)=213.85ms p(95)=252.64ms p(99.9)=433.24ms
       { expected_response:true }...: avg=110.47ms min=2.41ms  med=100.27ms max=606.03ms p(90)=213.85ms p(95)=252.64ms p(99.9)=433.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 128805
     http_req_receiving.............: avg=2.66ms   min=51.95µs med=118.12µs max=274.62ms p(90)=1.56ms   p(95)=6.19ms   p(99.9)=174.49ms
     http_req_sending...............: avg=70.45µs  min=5.56µs  med=10.3µs   max=156.04ms p(90)=18.62µs  p(95)=124.8µs  p(99.9)=9.55ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=107.73ms min=2.31ms  med=99.11ms  max=594.9ms  p(90)=208.81ms p(95)=239.68ms p(99.9)=402.73ms
     http_reqs......................: 128805  2050.905591/s
     iteration_duration.............: avg=111.61ms min=3.61ms  med=101.61ms max=606.23ms p(90)=214.62ms p(95)=253.45ms p(99.9)=433.67ms
     iterations.....................: 127805  2034.98303/s
     success_rate...................: 100.00% ✓ 127805      ✗ 0     
     vus............................: 95      min=0         max=500 
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

     checks.........................: 100.00% ✓ 212922      ✗ 0    
     data_received..................: 6.3 GB  101 MB/s
     data_sent......................: 86 MB   1.4 MB/s
     http_req_blocked...............: avg=7.05µs   min=1.15µs  med=2.62µs   max=42.38ms  p(90)=4.21µs   p(95)=5.14µs   p(99.9)=494.32µs
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=42.32ms  p(90)=0s       p(95)=0s       p(99.9)=448.86µs
     http_req_duration..............: avg=198.3ms  min=2.07ms  med=196.94ms max=537.56ms p(90)=367.86ms p(95)=394.12ms p(99.9)=477.14ms
       { expected_response:true }...: avg=198.3ms  min=2.07ms  med=196.94ms max=537.56ms p(90)=367.86ms p(95)=394.12ms p(99.9)=477.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 71974
     http_req_receiving.............: avg=81.45µs  min=29.87µs med=62.74µs  max=137.8ms  p(90)=98.27µs  p(95)=112.61µs p(99.9)=1.56ms  
     http_req_sending...............: avg=31.3µs   min=5.48µs  med=11.08µs  max=84.95ms  p(90)=17.49µs  p(95)=21.23µs  p(99.9)=3.87ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.19ms min=2.01ms  med=196.84ms max=537.49ms p(90)=367.75ms p(95)=394ms    p(99.9)=476.99ms
     http_reqs......................: 71974   1151.137088/s
     iteration_duration.............: avg=201.34ms min=5.17ms  med=200.32ms max=537.72ms p(90)=368.79ms p(95)=394.78ms p(99.9)=478.15ms
     iterations.....................: 70974   1135.143298/s
     success_rate...................: 100.00% ✓ 70974       ✗ 0    
     vus............................: 81      min=0         max=493
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

     checks.........................: 100.00% ✓ 95997      ✗ 0    
     data_received..................: 2.9 GB  45 MB/s
     data_sent......................: 40 MB   611 kB/s
     http_req_blocked...............: avg=9.07µs   min=1.26µs  med=3.27µs   max=8.99ms  p(90)=5.11µs   p(95)=6.22µs   p(99.9)=1.29ms  
     http_req_connecting............: avg=4.74µs   min=0s      med=0s       max=8.92ms  p(90)=0s       p(95)=0s       p(99.9)=1.15ms  
     http_req_duration..............: avg=435.19ms min=3.97ms  med=402.01ms max=1.92s   p(90)=865.93ms p(95)=935.59ms p(99.9)=1.38s   
       { expected_response:true }...: avg=435.19ms min=3.97ms  med=402.01ms max=1.92s   p(90)=865.93ms p(95)=935.59ms p(99.9)=1.38s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 32999
     http_req_receiving.............: avg=90.37µs  min=33.35µs med=78.62µs  max=43.28ms p(90)=115.1µs  p(95)=128.75µs p(99.9)=871.88µs
     http_req_sending...............: avg=27.36µs  min=5.82µs  med=14.08µs  max=87.23ms p(90)=21.34µs  p(95)=24.65µs  p(99.9)=2.72ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=435.08ms min=3.92ms  med=401.94ms max=1.92s   p(90)=865.85ms p(95)=935.4ms  p(99.9)=1.38s   
     http_reqs......................: 32999   508.948932/s
     iteration_duration.............: avg=449.01ms min=21.41ms med=418.25ms max=1.92s   p(90)=869.67ms p(95)=937.81ms p(99.9)=1.39s   
     iterations.....................: 31999   493.52577/s
     success_rate...................: 100.00% ✓ 31999      ✗ 0    
     vus............................: 97      min=0        max=500
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

     checks.........................: 100.00% ✓ 40716      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   256 kB/s
     http_req_blocked...............: avg=16.32µs  min=1.24µs  med=3.73µs   max=3.91ms  p(90)=5.56µs   p(95)=7.55µs   p(99.9)=2.92ms 
     http_req_connecting............: avg=10.4µs   min=0s      med=0s       max=3.84ms  p(90)=0s       p(95)=0s       p(99.9)=2.82ms 
     http_req_duration..............: avg=974.37ms min=6.51ms  med=826.41ms max=18.74s  p(90)=1.64s    p(95)=1.91s    p(99.9)=17.61s 
       { expected_response:true }...: avg=974.37ms min=6.51ms  med=826.41ms max=18.74s  p(90)=1.64s    p(95)=1.91s    p(99.9)=17.61s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14572
     http_req_receiving.............: avg=106.72µs min=40.31µs med=95.41µs  max=86.43ms p(90)=133.29µs p(95)=146.32µs p(99.9)=656.8µs
     http_req_sending...............: avg=43.88µs  min=6.6µs   med=17.52µs  max=90.17ms p(90)=23.85µs  p(95)=29.45µs  p(99.9)=2.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=974.22ms min=6.37ms  med=826.29ms max=18.74s  p(90)=1.64s    p(95)=1.91s    p(99.9)=17.61s 
     http_reqs......................: 14572   212.641482/s
     iteration_duration.............: avg=1.04s    min=59.8ms  med=907.62ms max=18.74s  p(90)=1.67s    p(95)=1.92s    p(99.9)=17.74s 
     iterations.....................: 13572   198.049011/s
     success_rate...................: 100.00% ✓ 13572      ✗ 0    
     vus............................: 82      min=0        max=500
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

     checks.........................: 100.00% ✓ 42384      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   249 kB/s
     http_req_blocked...............: avg=17.91µs  min=1.3µs   med=3.7µs    max=22.4ms   p(90)=5.43µs   p(95)=7.05µs   p(99.9)=2.73ms  
     http_req_connecting............: avg=12.35µs  min=0s      med=0s       max=22.34ms  p(90)=0s       p(95)=0s       p(99.9)=2.64ms  
     http_req_duration..............: avg=496.48ms min=8.58ms  med=566.87ms max=1.45s    p(90)=890.92ms p(95)=955.74ms p(99.9)=1.32s   
       { expected_response:true }...: avg=496.48ms min=8.58ms  med=566.87ms max=1.45s    p(90)=890.92ms p(95)=955.74ms p(99.9)=1.32s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 15128
     http_req_receiving.............: avg=115.48µs min=37.33µs med=93.39µs  max=112.71ms p(90)=132.65µs p(95)=145.64µs p(99.9)=693.36µs
     http_req_sending...............: avg=37.94µs  min=5.97µs  med=17.45µs  max=67.18ms  p(90)=23.45µs  p(95)=28.82µs  p(99.9)=3.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=496.33ms min=8.5ms   med=566.76ms max=1.45s    p(90)=890.81ms p(95)=955.63ms p(99.9)=1.32s   
     http_reqs......................: 15128   203.273443/s
     iteration_duration.............: avg=531.57ms min=27.53ms med=596.06ms max=1.45s    p(90)=899.48ms p(95)=960.14ms p(99.9)=1.33s   
     iterations.....................: 14128   189.836541/s
     success_rate...................: 100.00% ✓ 14128      ✗ 0    
     vus............................: 61      min=0        max=497
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

     checks.........................: 100.00% ✓ 416670      ✗ 0     
     data_received..................: 12 GB   197 MB/s
     data_sent......................: 168 MB  2.7 MB/s
     http_req_blocked...............: avg=28.04µs  min=1.04µs  med=3.03µs  max=54.43ms  p(90)=4.92µs   p(95)=6.25µs   p(99.9)=8.18ms  
     http_req_connecting............: avg=23.84µs  min=0s      med=0s      max=54.37ms  p(90)=0s       p(95)=0s       p(99.9)=7.88ms  
     http_req_duration..............: avg=101.63ms min=1.61ms  med=96.23ms max=324.92ms p(90)=194.91ms p(95)=212.42ms p(99.9)=265.69ms
       { expected_response:true }...: avg=101.63ms min=1.61ms  med=96.23ms max=324.92ms p(90)=194.91ms p(95)=212.42ms p(99.9)=265.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139890
     http_req_receiving.............: avg=243.83µs min=28.44µs med=64.22µs max=66.76ms  p(90)=198.84µs p(95)=441.03µs p(99.9)=24.79ms 
     http_req_sending...............: avg=90.1µs   min=5.26µs  med=11.7µs  max=233.79ms p(90)=22.91µs  p(95)=146.32µs p(99.9)=14.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=101.3ms  min=1.55ms  med=95.94ms max=304.17ms p(90)=194.33ms p(95)=211.84ms p(99.9)=263.68ms
     http_reqs......................: 139890  2254.731684/s
     iteration_duration.............: avg=102.66ms min=4.1ms   med=97.47ms max=334.2ms  p(90)=195.46ms p(95)=212.95ms p(99.9)=266.67ms
     iterations.....................: 138890  2238.613794/s
     success_rate...................: 100.00% ✓ 138890      ✗ 0     
     vus............................: 59      min=0         max=498 
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

     checks.........................: 100.00% ✓ 346467      ✗ 0     
     data_received..................: 10 GB   164 MB/s
     data_sent......................: 140 MB  2.2 MB/s
     http_req_blocked...............: avg=16.45µs  min=1.06µs  med=2.83µs   max=62.28ms  p(90)=4.42µs   p(95)=5.48µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=13µs     min=0s      med=0s       max=62.18ms  p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=122.23ms min=1.78ms  med=110.81ms max=791.85ms p(90)=236.43ms p(95)=271.61ms p(99.9)=661.72ms
       { expected_response:true }...: avg=122.23ms min=1.78ms  med=110.81ms max=791.85ms p(90)=236.43ms p(95)=271.61ms p(99.9)=661.72ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 116489
     http_req_receiving.............: avg=1.87ms   min=51.82µs med=118.09µs max=345.33ms p(90)=1.74ms   p(95)=4.84ms   p(99.9)=148.67ms
     http_req_sending...............: avg=64.89µs  min=5.54µs  med=10.81µs  max=124.97ms p(90)=20.11µs  p(95)=124.13µs p(99.9)=8.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.29ms min=1.7ms   med=109.69ms max=790.34ms p(90)=232.76ms p(95)=265.77ms p(99.9)=657.15ms
     http_reqs......................: 116489  1870.730655/s
     iteration_duration.............: avg=123.57ms min=2.86ms  med=112.36ms max=792.09ms p(90)=237.31ms p(95)=272.35ms p(99.9)=661.93ms
     iterations.....................: 115489  1854.671364/s
     success_rate...................: 100.00% ✓ 115489      ✗ 0     
     vus............................: 71      min=0         max=495 
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

     checks.........................: 100.00% ✓ 199242      ✗ 0    
     data_received..................: 5.9 GB  94 MB/s
     data_sent......................: 81 MB   1.3 MB/s
     http_req_blocked...............: avg=7.12µs   min=1.15µs  med=2.79µs   max=19.05ms  p(90)=4.53µs   p(95)=5.5µs    p(99.9)=544.39µs
     http_req_connecting............: avg=3.58µs   min=0s      med=0s       max=18.97ms  p(90)=0s       p(95)=0s       p(99.9)=473.66µs
     http_req_duration..............: avg=211.79ms min=2.2ms   med=212.96ms max=651.81ms p(90)=391.95ms p(95)=421.83ms p(99.9)=542.56ms
       { expected_response:true }...: avg=211.79ms min=2.2ms   med=212.96ms max=651.81ms p(90)=391.95ms p(95)=421.83ms p(99.9)=542.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 67414
     http_req_receiving.............: avg=91.4µs   min=31.65µs med=67.85µs  max=174.73ms p(90)=105.81µs p(95)=121.82µs p(99.9)=1.85ms  
     http_req_sending...............: avg=29.99µs  min=5.44µs  med=11.66µs  max=16.27ms  p(90)=18.37µs  p(95)=22.19µs  p(99.9)=3.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.67ms min=2.13ms  med=212.81ms max=651.74ms p(90)=391.84ms p(95)=421.71ms p(99.9)=542.45ms
     http_reqs......................: 67414   1074.94543/s
     iteration_duration.............: avg=215.24ms min=5.49ms  med=216.54ms max=652.04ms p(90)=393.01ms p(95)=422.56ms p(99.9)=543.72ms
     iterations.....................: 66414   1058.999997/s
     success_rate...................: 100.00% ✓ 66414       ✗ 0    
     vus............................: 92      min=0         max=500
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

     checks.........................: 100.00% ✓ 91068      ✗ 0    
     data_received..................: 2.7 GB  42 MB/s
     data_sent......................: 38 MB   578 kB/s
     http_req_blocked...............: avg=10.81µs  min=1.18µs  med=3.39µs   max=24.26ms  p(90)=5.19µs   p(95)=6.24µs   p(99.9)=1.91ms
     http_req_connecting............: avg=6.2µs    min=0s      med=0s       max=24.2ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms
     http_req_duration..............: avg=457.74ms min=4ms     med=423.1ms  max=1.71s    p(90)=904.88ms p(95)=983.25ms p(99.9)=1.48s 
       { expected_response:true }...: avg=457.74ms min=4ms     med=423.1ms  max=1.71s    p(90)=904.88ms p(95)=983.25ms p(99.9)=1.48s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31356
     http_req_receiving.............: avg=99.14µs  min=33.05µs med=82.75µs  max=122.32ms p(90)=119.21µs p(95)=133.34µs p(99.9)=1.18ms
     http_req_sending...............: avg=33.94µs  min=5.93µs  med=14.64µs  max=100.48ms p(90)=21.68µs  p(95)=25.06µs  p(99.9)=3.12ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=457.6ms  min=3.93ms  med=422.99ms max=1.71s    p(90)=904.78ms p(95)=983.12ms p(99.9)=1.48s 
     http_reqs......................: 31356   481.278982/s
     iteration_duration.............: avg=473.05ms min=29.84ms med=441.3ms  max=1.72s    p(90)=909ms    p(95)=986.1ms  p(99.9)=1.49s 
     iterations.....................: 30356   465.930118/s
     success_rate...................: 100.00% ✓ 30356      ✗ 0    
     vus............................: 61      min=0        max=497
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

     checks.........................: 100.00% ✓ 41748      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   260 kB/s
     http_req_blocked...............: avg=16.76µs  min=1.29µs  med=4.12µs   max=4.47ms   p(90)=6.06µs   p(95)=7.89µs   p(99.9)=2.39ms  
     http_req_connecting............: avg=10.77µs  min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=2.36ms  
     http_req_duration..............: avg=979.31ms min=6.71ms  med=882.31ms max=5.8s     p(90)=1.95s    p(95)=2.18s    p(99.9)=5.42s   
       { expected_response:true }...: avg=979.31ms min=6.71ms  med=882.31ms max=5.8s     p(90)=1.95s    p(95)=2.18s    p(99.9)=5.42s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14916
     http_req_receiving.............: avg=114.78µs min=36.31µs med=103.04µs max=91.44ms  p(90)=142.95µs p(95)=156.95µs p(99.9)=740.32µs
     http_req_sending...............: avg=38.45µs  min=6.39µs  med=19.05µs  max=101.48ms p(90)=25.1µs   p(95)=30.72µs  p(99.9)=3.77ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=979.16ms min=6.61ms  med=882.18ms max=5.8s     p(90)=1.95s    p(95)=2.18s    p(99.9)=5.42s   
     http_reqs......................: 14916   216.645503/s
     iteration_duration.............: avg=1.04s    min=11.62ms med=980.93ms max=5.81s    p(90)=1.98s    p(95)=2.21s    p(99.9)=5.44s   
     iterations.....................: 13916   202.121133/s
     success_rate...................: 100.00% ✓ 13916      ✗ 0    
     vus............................: 6       min=0        max=500
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

     checks.........................: 100.00% ✓ 40011      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 17 MB   246 kB/s
     http_req_blocked...............: avg=15.37µs  min=1.36µs  med=3.87µs   max=3.37ms  p(90)=5.77µs   p(95)=7.47µs   p(99.9)=2.1ms   
     http_req_connecting............: avg=9.68µs   min=0s      med=0s       max=3.34ms  p(90)=0s       p(95)=0s       p(99.9)=2.07ms  
     http_req_duration..............: avg=1.01s    min=8.67ms  med=920.15ms max=4.3s    p(90)=2.08s    p(95)=2.22s    p(99.9)=3.78s   
       { expected_response:true }...: avg=1.01s    min=8.67ms  med=920.15ms max=4.3s    p(90)=2.08s    p(95)=2.22s    p(99.9)=3.78s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 14337
     http_req_receiving.............: avg=114.23µs min=36.7µs  med=99.21µs  max=61.08ms p(90)=140.16µs p(95)=153.11µs p(99.9)=994.04µs
     http_req_sending...............: avg=40.86µs  min=5.96µs  med=18.37µs  max=72.35ms p(90)=24.56µs  p(95)=30.6µs   p(99.9)=3.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=1.01s    min=8.55ms  med=920ms    max=4.3s    p(90)=2.08s    p(95)=2.21s    p(99.9)=3.78s   
     http_reqs......................: 14337   205.157362/s
     iteration_duration.............: avg=1.09s    min=38.84ms med=1.02s    max=4.31s   p(90)=2.09s    p(95)=2.22s    p(99.9)=3.79s   
     iterations.....................: 13337   190.847718/s
     success_rate...................: 100.00% ✓ 13337      ✗ 0    
     vus............................: 20      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

