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
| hive-router | v0.0.49 | 2,678 | 2,792 | 2,641 | 1.8% |  |
| hotchocolate | 16.1.0-p.1.7 | 2,031 | 2,082 | 2,016 | 1.1% |  |
| cosmo | 0.307.0 | 1,201 | 1,228 | 1,194 | 1.5% | non-compatible response (17 across 6/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 499 | 503 | 493 | 0.7% |  |
| hive-gateway | 2.5.25 | 235 | 238 | 232 | 0.9% |  |
| apollo-gateway | 2.13.3 | 206 | 210 | 202 | 1.0% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (32572 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (453406 across 9/9 runs) |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,295 | 2,392 | 2,279 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.7 | 1,898 | 1,945 | 1,882 | 1.1% |  |
| cosmo | 0.307.0 | 1,036 | 1,036 | 1,036 | 0.0% | non-compatible response (15 across 8/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 464 | 469 | 461 | 0.6% |  |
| hive-gateway | 2.5.25 | 230 | 234 | 229 | 0.8% |  |
| apollo-gateway | 2.13.3 | 211 | 212 | 209 | 0.4% |  |
| apollo-router | v2.13.1 | — | — | — | — | non-compatible response (9750 across 9/9 runs) |
| grafbase | 0.53.3 | — | — | — | — | non-compatible response (210559 across 9/9 runs) |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 494025      ✗ 0     
     data_received..................: 15 GB   235 MB/s
     data_sent......................: 199 MB  3.2 MB/s
     http_req_blocked...............: avg=30.46µs min=1.07µs  med=2.75µs  max=74.99ms  p(90)=4.36µs   p(95)=5.5µs    p(99.9)=6.41ms  
     http_req_connecting............: avg=26.66µs min=0s      med=0s      max=69.12ms  p(90)=0s       p(95)=0s       p(99.9)=5.81ms  
     http_req_duration..............: avg=85.66ms min=1.63ms  med=80.59ms max=342.9ms  p(90)=166.08ms p(95)=187.37ms p(99.9)=259.43ms
       { expected_response:true }...: avg=85.66ms min=1.63ms  med=80.59ms max=342.9ms  p(90)=166.08ms p(95)=187.37ms p(99.9)=259.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 165675
     http_req_receiving.............: avg=415.1µs min=28.78µs med=58.43µs max=164.01ms p(90)=234.36µs p(95)=430.81µs p(99.9)=54.17ms 
     http_req_sending...............: avg=95.49µs min=5.38µs  med=10.52µs max=190.26ms p(90)=19.88µs  p(95)=139.3µs  p(99.9)=14.34ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=85.15ms min=1.58ms  med=80.29ms max=342.73ms p(90)=165.16ms p(95)=185.79ms p(99.9)=252.95ms
     http_reqs......................: 165675  2678.959409/s
     iteration_duration.............: avg=86.58ms min=2.15ms  med=81.52ms max=377.12ms p(90)=166.93ms p(95)=188.29ms p(99.9)=262.36ms
     iterations.....................: 164675  2662.789441/s
     success_rate...................: 100.00% ✓ 164675      ✗ 0     
     vus............................: 14      min=0         max=500 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 379668      ✗ 0     
     data_received..................: 11 GB   178 MB/s
     data_sent......................: 153 MB  2.4 MB/s
     http_req_blocked...............: avg=15.28µs  min=1.08µs  med=2.62µs   max=43.78ms  p(90)=4.03µs   p(95)=4.99µs   p(99.9)=1.55ms  
     http_req_connecting............: avg=11.8µs   min=0s      med=0s       max=43.55ms  p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=111.58ms min=2.39ms  med=107.05ms max=551.61ms p(90)=210.21ms p(95)=232.72ms p(99.9)=386.28ms
       { expected_response:true }...: avg=111.58ms min=2.39ms  med=107.05ms max=551.61ms p(90)=210.21ms p(95)=232.72ms p(99.9)=386.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 127556
     http_req_receiving.............: avg=1.14ms   min=52.35µs med=159.53µs max=384.35ms p(90)=1.32ms   p(95)=3.21ms   p(99.9)=101.52ms
     http_req_sending...............: avg=60.24µs  min=5.39µs  med=10.1µs   max=179.3ms  p(90)=18.2µs   p(95)=127.4µs  p(99.9)=7.46ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=110.37ms min=2.31ms  med=105.77ms max=551.45ms p(90)=208.44ms p(95)=230.28ms p(99.9)=380.92ms
     http_reqs......................: 127556  2031.935192/s
     iteration_duration.............: avg=112.71ms min=3.44ms  med=108.35ms max=551.77ms p(90)=210.83ms p(95)=233.27ms p(99.9)=386.81ms
     iterations.....................: 126556  2016.005442/s
     success_rate...................: 100.00% ✓ 126556      ✗ 0     
     vus............................: 94      min=0         max=500 
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

     checks.........................: 100.00% ✓ 222141      ✗ 0    
     data_received..................: 6.6 GB  105 MB/s
     data_sent......................: 90 MB   1.4 MB/s
     http_req_blocked...............: avg=6.81µs   min=1.07µs  med=2.62µs   max=29.77ms  p(90)=4.22µs   p(95)=5.15µs   p(99.9)=503.53µs
     http_req_connecting............: avg=3.47µs   min=0s      med=0s       max=29.72ms  p(90)=0s       p(95)=0s       p(99.9)=453.03µs
     http_req_duration..............: avg=190.12ms min=2.04ms  med=189.82ms max=507.61ms p(90)=352.59ms p(95)=379.61ms p(99.9)=458.16ms
       { expected_response:true }...: avg=190.12ms min=2.04ms  med=189.82ms max=507.61ms p(90)=352.59ms p(95)=379.61ms p(99.9)=458.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 75047
     http_req_receiving.............: avg=83.63µs  min=30.17µs med=63.54µs  max=103.72ms p(90)=99.41µs  p(95)=115.32µs p(99.9)=1.88ms  
     http_req_sending...............: avg=31.07µs  min=5.31µs  med=10.99µs  max=75.88ms  p(90)=17.4µs   p(95)=21.42µs  p(99.9)=3.99ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=190ms    min=1.97ms  med=189.69ms max=507.55ms p(90)=352.5ms  p(95)=379.54ms p(99.9)=458.08ms
     http_reqs......................: 75047   1201.085573/s
     iteration_duration.............: avg=192.93ms min=4.55ms  med=192.55ms max=507.82ms p(90)=353.41ms p(95)=380.25ms p(99.9)=458.4ms 
     iterations.....................: 74047   1185.081128/s
     success_rate...................: 100.00% ✓ 74047       ✗ 0    
     vus............................: 80      min=0         max=494
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

     checks.........................: 100.00% ✓ 94341      ✗ 0    
     data_received..................: 2.8 GB  44 MB/s
     data_sent......................: 39 MB   600 kB/s
     http_req_blocked...............: avg=9.44µs   min=1.16µs  med=2.97µs   max=8.1ms    p(90)=4.82µs   p(95)=5.92µs   p(99.9)=1.43ms 
     http_req_connecting............: avg=5.4µs    min=0s      med=0s       max=8.04ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms  
     http_req_duration..............: avg=442.47ms min=4.02ms  med=410.31ms max=1.64s    p(90)=874.2ms  p(95)=952.96ms p(99.9)=1.36s  
       { expected_response:true }...: avg=442.47ms min=4.02ms  med=410.31ms max=1.64s    p(90)=874.2ms  p(95)=952.96ms p(99.9)=1.36s  
     http_req_failed................: 0.00%   ✓ 0          ✗ 32447
     http_req_receiving.............: avg=165.7µs  min=32.27µs med=76.41µs  max=170.47ms p(90)=112.72µs p(95)=126.47µs p(99.9)=13.42ms
     http_req_sending...............: avg=22.34µs  min=5.52µs  med=13.47µs  max=24.54ms  p(90)=21.01µs  p(95)=24.3µs   p(99.9)=2.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=442.28ms min=3.97ms  med=410.12ms max=1.64s    p(90)=874.07ms p(95)=952.85ms p(99.9)=1.36s  
     http_reqs......................: 32447   499.963867/s
     iteration_duration.............: avg=456.77ms min=8.27ms  med=429.53ms max=1.64s    p(90)=878.63ms p(95)=956.83ms p(99.9)=1.36s  
     iterations.....................: 31447   484.555235/s
     success_rate...................: 100.00% ✓ 31447      ✗ 0    
     vus............................: 39      min=0        max=500
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

     checks.........................: 100.00% ✓ 44922      ✗ 0    
     data_received..................: 1.4 GB  21 MB/s
     data_sent......................: 19 MB   283 kB/s
     http_req_blocked...............: avg=16.34µs  min=1.32µs  med=3.7µs    max=21.93ms p(90)=5.64µs   p(95)=7.47µs   p(99.9)=2.53ms
     http_req_connecting............: avg=10.9µs   min=0s      med=0s       max=21.87ms p(90)=0s       p(95)=0s       p(99.9)=2.47ms
     http_req_duration..............: avg=891.61ms min=6.07ms  med=783.75ms max=20.07s  p(90)=1.49s    p(95)=1.67s    p(99.9)=18.33s
       { expected_response:true }...: avg=891.61ms min=6.07ms  med=783.75ms max=20.07s  p(90)=1.49s    p(95)=1.67s    p(99.9)=18.33s
     http_req_failed................: 0.00%   ✓ 0          ✗ 15974
     http_req_receiving.............: avg=109.54µs min=35.75µs med=97.98µs  max=60.96ms p(90)=138.66µs p(95)=152.43µs p(99.9)=1.24ms
     http_req_sending...............: avg=29.17µs  min=6.47µs  med=18.3µs   max=11.5ms  p(90)=24.75µs  p(95)=30.15µs  p(99.9)=2.75ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=891.48ms min=5.94ms  med=783.64ms max=20.07s  p(90)=1.49s    p(95)=1.67s    p(99.9)=18.33s
     http_reqs......................: 15974   235.046463/s
     iteration_duration.............: avg=951.19ms min=37.22ms med=843.79ms max=20.07s  p(90)=1.53s    p(95)=1.68s    p(99.9)=18.53s
     iterations.....................: 14974   220.332149/s
     success_rate...................: 100.00% ✓ 14974      ✗ 0    
     vus............................: 39      min=0        max=500
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

     checks.........................: 100.00% ✓ 43017      ✗ 0    
     data_received..................: 1.3 GB  18 MB/s
     data_sent......................: 19 MB   254 kB/s
     http_req_blocked...............: avg=14.58µs  min=1.29µs  med=3.58µs   max=11.57ms  p(90)=5.33µs   p(95)=7.03µs   p(99.9)=2.06ms
     http_req_connecting............: avg=9.21µs   min=0s      med=0s       max=11.51ms  p(90)=0s       p(95)=0s       p(99.9)=1.93ms
     http_req_duration..............: avg=454.1ms  min=8.39ms  med=533.04ms max=1.27s    p(90)=772.43ms p(95)=817.79ms p(99.9)=1.14s 
       { expected_response:true }...: avg=454.1ms  min=8.39ms  med=533.04ms max=1.27s    p(90)=772.43ms p(95)=817.79ms p(99.9)=1.14s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15339
     http_req_receiving.............: avg=103.39µs min=35.17µs med=91.71µs  max=36.86ms  p(90)=131.13µs p(95)=144.97µs p(99.9)=1.1ms 
     http_req_sending...............: avg=40.29µs  min=6.02µs  med=17.03µs  max=102.84ms p(90)=23µs     p(95)=28.19µs  p(99.9)=5.1ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=453.96ms min=8.3ms   med=532.95ms max=1.27s    p(90)=772.31ms p(95)=817.49ms p(99.9)=1.14s 
     http_reqs......................: 15339   206.510632/s
     iteration_duration.............: avg=485.65ms min=14.5ms  med=563.82ms max=1.28s    p(90)=776.67ms p(95)=823.35ms p(99.9)=1.15s 
     iterations.....................: 14339   193.047523/s
     success_rate...................: 100.00% ✓ 14339      ✗ 0    
     vus............................: 61      min=0        max=495
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

     checks.........................: 100.00% ✓ 424212      ✗ 0     
     data_received..................: 13 GB   201 MB/s
     data_sent......................: 171 MB  2.8 MB/s
     http_req_blocked...............: avg=25.94µs  min=1.04µs  med=2.96µs  max=85.61ms  p(90)=4.85µs   p(95)=6.14µs   p(99.9)=3.43ms  
     http_req_connecting............: avg=21.89µs  min=0s      med=0s      max=85.55ms  p(90)=0s       p(95)=0s       p(99.9)=3.29ms  
     http_req_duration..............: avg=99.86ms  min=1.61ms  med=93.75ms max=345.19ms p(90)=194.18ms p(95)=214.12ms p(99.9)=281.2ms 
       { expected_response:true }...: avg=99.86ms  min=1.61ms  med=93.75ms max=345.19ms p(90)=194.18ms p(95)=214.12ms p(99.9)=281.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 142404
     http_req_receiving.............: avg=237.32µs min=29.06µs med=62.5µs  max=192.79ms p(90)=183.64µs p(95)=429.06µs p(99.9)=29.91ms 
     http_req_sending...............: avg=87.92µs  min=5.42µs  med=11.61µs max=185.76ms p(90)=22.39µs  p(95)=145.06µs p(99.9)=12.77ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=99.54ms  min=1.54ms  med=93.48ms max=344.43ms p(90)=193.7ms  p(95)=213.61ms p(99.9)=279.82ms
     http_reqs......................: 142404  2295.693393/s
     iteration_duration.............: avg=100.86ms min=4.11ms  med=94.85ms max=381.49ms p(90)=194.72ms p(95)=214.7ms  p(99.9)=282.57ms
     iterations.....................: 141404  2279.572403/s
     success_rate...................: 100.00% ✓ 141404      ✗ 0     
     vus............................: 59      min=0         max=497 
     vus_max........................: 500     min=500       max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 352215      ✗ 0     
     data_received..................: 10 GB   166 MB/s
     data_sent......................: 142 MB  2.3 MB/s
     http_req_blocked...............: avg=14.42µs  min=1.07µs  med=2.73µs   max=50.95ms  p(90)=4.35µs   p(95)=5.39µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=10.83µs  min=0s      med=0s       max=50.88ms  p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=120.22ms min=1.79ms  med=113.8ms  max=884.47ms p(90)=229.49ms p(95)=253.8ms  p(99.9)=562.24ms
       { expected_response:true }...: avg=120.22ms min=1.79ms  med=113.8ms  max=884.47ms p(90)=229.49ms p(95)=253.8ms  p(99.9)=562.24ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 118405
     http_req_receiving.............: avg=1.32ms   min=53.21µs med=157.01µs max=204.63ms p(90)=1.64ms   p(95)=3.52ms   p(99.9)=98.53ms 
     http_req_sending...............: avg=59µs     min=5.27µs  med=10.66µs  max=254.39ms p(90)=19.83µs  p(95)=125.49µs p(99.9)=7.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=118.84ms min=1.67ms  med=112.33ms max=884.35ms p(90)=227.86ms p(95)=251.59ms p(99.9)=560.15ms
     http_reqs......................: 118405  1898.161552/s
     iteration_duration.............: avg=121.52ms min=3.1ms   med=115.31ms max=884.69ms p(90)=230.15ms p(95)=254.54ms p(99.9)=564.07ms
     iterations.....................: 117405  1882.13046/s
     success_rate...................: 100.00% ✓ 117405      ✗ 0     
     vus............................: 76      min=0         max=494 
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

     checks.........................: 100.00% ✓ 207270      ✗ 0    
     data_received..................: 6.1 GB  91 MB/s
     data_sent......................: 84 MB   1.2 MB/s
     http_req_blocked...............: avg=6.18µs   min=1.11µs med=2.76µs   max=9.97ms   p(90)=4.46µs   p(95)=5.44µs   p(99.9)=546.74µs
     http_req_connecting............: avg=2.68µs   min=0s     med=0s       max=9.9ms    p(90)=0s       p(95)=0s       p(99.9)=477.07µs
     http_req_duration..............: avg=203.06ms min=2.07ms med=202.05ms max=692.21ms p(90)=376.63ms p(95)=403.94ms p(99.9)=561.04ms
       { expected_response:true }...: avg=203.06ms min=2.07ms med=202.05ms max=692.21ms p(90)=376.63ms p(95)=403.94ms p(99.9)=561.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 70090
     http_req_receiving.............: avg=83.07µs  min=30.2µs med=67.15µs  max=156.5ms  p(90)=103.37µs p(95)=118.01µs p(99.9)=1.37ms  
     http_req_sending...............: avg=29.85µs  min=5.32µs med=11.71µs  max=48.86ms  p(90)=18.28µs  p(95)=21.86µs  p(99.9)=3.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.95ms min=2.01ms med=201.96ms max=692.1ms  p(90)=376.55ms p(95)=403.84ms p(99.9)=560.89ms
     http_reqs......................: 70090   1036.767616/s
     iteration_duration.............: avg=206.25ms min=6.08ms med=205.49ms max=692.36ms p(90)=377.62ms p(95)=404.76ms p(99.9)=563.07ms
     iterations.....................: 69090   1021.975668/s
     success_rate...................: 100.00% ✓ 69090       ✗ 0    
     vus............................: 1       min=0         max=499
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

     checks.........................: 100.00% ✓ 88038      ✗ 0    
     data_received..................: 2.7 GB  41 MB/s
     data_sent......................: 36 MB   557 kB/s
     http_req_blocked...............: avg=12.17µs  min=1.27µs  med=3.43µs   max=38.82ms p(90)=5.25µs   p(95)=6.27µs   p(99.9)=2.02ms  
     http_req_connecting............: avg=7.62µs   min=0s      med=0s       max=38.76ms p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=473.2ms  min=4.27ms  med=437.86ms max=1.95s   p(90)=941.18ms p(95)=1.01s    p(99.9)=1.52s   
       { expected_response:true }...: avg=473.2ms  min=4.27ms  med=437.86ms max=1.95s   p(90)=941.18ms p(95)=1.01s    p(99.9)=1.52s   
     http_req_failed................: 0.00%   ✓ 0          ✗ 30346
     http_req_receiving.............: avg=92.43µs  min=33.46µs med=83.67µs  max=8.87ms  p(90)=120.02µs p(95)=135.68µs p(99.9)=916.25µs
     http_req_sending...............: avg=27.98µs  min=5.75µs  med=14.95µs  max=34.29ms p(90)=22.2µs   p(95)=25.6µs   p(99.9)=3.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=473.08ms min=4.2ms   med=437.64ms max=1.95s   p(90)=941.07ms p(95)=1.01s    p(99.9)=1.52s   
     http_reqs......................: 30346   464.311549/s
     iteration_duration.............: avg=489.57ms min=28.87ms med=455.3ms  max=1.95s   p(90)=945.25ms p(95)=1.01s    p(99.9)=1.53s   
     iterations.....................: 29346   449.010964/s
     success_rate...................: 100.00% ✓ 29346      ✗ 0    
     vus............................: 74      min=0        max=498
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

     checks.........................: 100.00% ✓ 44055      ✗ 0    
     data_received..................: 1.4 GB  20 MB/s
     data_sent......................: 19 MB   276 kB/s
     http_req_blocked...............: avg=14.4µs   min=1.19µs  med=3.9µs    max=3.39ms  p(90)=5.95µs   p(95)=7.84µs   p(99.9)=2.2ms 
     http_req_connecting............: avg=8.72µs   min=0s      med=0s       max=3.36ms  p(90)=0s       p(95)=0s       p(99.9)=2.17ms
     http_req_duration..............: avg=929.27ms min=6.29ms  med=839.65ms max=5s      p(90)=1.81s    p(95)=2.04s    p(99.9)=4.53s 
       { expected_response:true }...: avg=929.27ms min=6.29ms  med=839.65ms max=5s      p(90)=1.81s    p(95)=2.04s    p(99.9)=4.53s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 15685
     http_req_receiving.............: avg=125.9µs  min=33.38µs med=102.76µs max=82.13ms p(90)=141.97µs p(95)=156.04µs p(99.9)=1.21ms
     http_req_sending...............: avg=34.71µs  min=5.85µs  med=18.82µs  max=48.48ms p(90)=25.19µs  p(95)=30.28µs  p(99.9)=3.1ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=929.11ms min=6.19ms  med=839.56ms max=5s      p(90)=1.81s    p(95)=2.04s    p(99.9)=4.53s 
     http_reqs......................: 15685   230.133809/s
     iteration_duration.............: avg=992.58ms min=42.91ms med=913.81ms max=5.01s   p(90)=1.83s    p(95)=2.05s    p(99.9)=4.55s 
     iterations.....................: 14685   215.461586/s
     success_rate...................: 100.00% ✓ 14685      ✗ 0    
     vus............................: 64      min=0        max=500
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

     checks.........................: 100.00% ✓ 41193      ✗ 0    
     data_received..................: 1.3 GB  19 MB/s
     data_sent......................: 18 MB   253 kB/s
     http_req_blocked...............: avg=16.24µs  min=1.26µs  med=3.55µs   max=31.94ms  p(90)=5.43µs   p(95)=7.32µs   p(99.9)=1.59ms
     http_req_connecting............: avg=10.8µs   min=0s      med=0s       max=31.89ms  p(90)=0s       p(95)=0s       p(99.9)=1.56ms
     http_req_duration..............: avg=989.52ms min=8.73ms  med=900.44ms max=4s       p(90)=2.01s    p(95)=2.13s    p(99.9)=3.49s 
       { expected_response:true }...: avg=989.52ms min=8.73ms  med=900.44ms max=4s       p(90)=2.01s    p(95)=2.13s    p(99.9)=3.49s 
     http_req_failed................: 0.00%   ✓ 0          ✗ 14731
     http_req_receiving.............: avg=113.8µs  min=37.96µs med=96.38µs  max=68.39ms  p(90)=136.49µs p(95)=149.55µs p(99.9)=1.39ms
     http_req_sending...............: avg=55.07µs  min=6.33µs  med=17.99µs  max=133.72ms p(90)=24.1µs   p(95)=29.62µs  p(99.9)=3.76ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=989.35ms min=8.62ms  med=900.31ms max=4s       p(90)=2.01s    p(95)=2.13s    p(99.9)=3.49s 
     http_reqs......................: 14731   211.129094/s
     iteration_duration.............: avg=1.06s    min=77.11ms med=997.39ms max=4.01s    p(90)=2.03s    p(95)=2.14s    p(99.9)=3.5s  
     iterations.....................: 13731   196.796796/s
     success_rate...................: 100.00% ✓ 13731      ✗ 0    
     vus............................: 98      min=0        max=500
     vus_max........................: 500     min=500      max=500
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

