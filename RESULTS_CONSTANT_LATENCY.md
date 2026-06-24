## Overview for: `constant-vus-with-latency`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s** with a simulated **4ms IO delay** on each subgraph request. Only .NET subgraphs are used.


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.72 | 1,579 | 1,597 | 1,566 | 0.6% |  |
| fusion-nightly | 16.3.0-p.2 | 1,550 | 1,567 | 1,541 | 0.5% |  |
| fusion | 16.2.3 | 1,539 | 1,560 | 1,534 | 0.6% |  |
| grafbase | 0.53.5 | 1,109 | 1,133 | 1,103 | 0.9% |  |
| cosmo | 0.326.0 | 1,060 | 1,081 | 1,051 | 1.0% |  |
| hive-gateway-router-runtime | 2.9.0 | 523 | 537 | 513 | 1.5% |  |
| apollo-router | v2.15.1 | 390 | 401 | 386 | 1.3% |  |
| hive-gateway | 2.9.0 | 239 | 245 | 237 | 1.1% |  |
| apollo-gateway | 2.14.1 | 229 | 233 | 220 | 1.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.72)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 578100      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 232 MB  1.9 MB/s
     http_req_blocked...............: avg=3.17µs  min=922ns   med=2.11µs  max=4.7ms    p(90)=4.01µs   p(95)=4.89µs   p(99.9)=37.32µs
     http_req_connecting............: avg=545ns   min=0s      med=0s      max=4.66ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.88ms min=14.43ms med=30.62ms max=330.06ms p(90)=36.69ms  p(95)=38.64ms  p(99.9)=57.82ms
       { expected_response:true }...: avg=30.88ms min=14.43ms med=30.62ms max=330.06ms p(90)=36.69ms  p(95)=38.64ms  p(99.9)=57.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 192800
     http_req_receiving.............: avg=81.93µs min=27.39µs med=51.29µs max=133.46ms p(90)=104.18µs p(95)=147.33µs p(99.9)=2.39ms 
     http_req_sending...............: avg=34.96µs min=4.96µs  med=9.29µs  max=123.97ms p(90)=20.2µs   p(95)=41.12µs  p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.77ms min=14.28ms med=30.52ms max=313.47ms p(90)=36.57ms  p(95)=38.51ms  p(99.9)=56.74ms
     http_reqs......................: 192800  1579.888836/s
     iteration_duration.............: avg=31.13ms min=14.65ms med=30.84ms max=359.25ms p(90)=36.91ms  p(95)=38.86ms  p(99.9)=58.31ms
     iterations.....................: 192700  1579.069392/s
     success_rate...................: 100.00% ✓ 192700      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.3.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 567216      ✗ 0     
     data_received..................: 17 GB   136 MB/s
     data_sent......................: 227 MB  1.9 MB/s
     http_req_blocked...............: avg=3.42µs   min=932ns   med=2.08µs   max=13.4ms   p(90)=3.76µs  p(95)=4.61µs   p(99.9)=32.98µs
     http_req_connecting............: avg=821ns    min=0s      med=0s       max=6.2ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.48ms  min=13.8ms  med=30.92ms  max=338.77ms p(90)=38.68ms p(95)=41.34ms  p(99.9)=60.82ms
       { expected_response:true }...: avg=31.48ms  min=13.8ms  med=30.92ms  max=338.77ms p(90)=38.68ms p(95)=41.34ms  p(99.9)=60.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189172
     http_req_receiving.............: avg=620.32µs min=50.6µs  med=114.78µs max=203.18ms p(90)=1.72ms  p(95)=2.68ms   p(99.9)=13.15ms
     http_req_sending...............: avg=37.36µs  min=5.15µs  med=9.22µs   max=143.01ms p(90)=19.66µs p(95)=104.26µs p(99.9)=2.23ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.83ms  min=13.63ms med=30.29ms  max=337.85ms p(90)=37.84ms p(95)=40.42ms  p(99.9)=59.46ms
     http_reqs......................: 189172  1550.502877/s
     iteration_duration.............: avg=31.72ms  min=14.18ms med=31.14ms  max=360.75ms p(90)=38.9ms  p(95)=41.56ms  p(99.9)=61.24ms
     iterations.....................: 189072  1549.683251/s
     success_rate...................: 100.00% ✓ 189072      ✗ 0     
     vus............................: 43      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 563151      ✗ 0     
     data_received..................: 17 GB   135 MB/s
     data_sent......................: 226 MB  1.8 MB/s
     http_req_blocked...............: avg=3.21µs   min=992ns   med=2.21µs  max=4.19ms   p(90)=3.93µs  p(95)=4.75µs  p(99.9)=28.55µs
     http_req_connecting............: avg=560ns    min=0s      med=0s      max=4.15ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=31.71ms  min=13.82ms med=31.13ms max=349.34ms p(90)=39.08ms p(95)=41.8ms  p(99.9)=59.89ms
       { expected_response:true }...: avg=31.71ms  min=13.82ms med=31.13ms max=349.34ms p(90)=39.08ms p(95)=41.8ms  p(99.9)=59.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 187817
     http_req_receiving.............: avg=608.15µs min=51.18µs med=112.2µs max=225.24ms p(90)=1.63ms  p(95)=2.55ms  p(99.9)=14.22ms
     http_req_sending...............: avg=34.67µs  min=4.92µs  med=9.38µs  max=25.77ms  p(90)=19.8µs  p(95)=104.6µs p(99.9)=2.03ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=31.07ms  min=13.73ms med=30.53ms max=123.87ms p(90)=38.31ms p(95)=40.96ms p(99.9)=57.55ms
     http_reqs......................: 187817  1539.078766/s
     iteration_duration.............: avg=31.95ms  min=14.03ms med=31.35ms max=361.96ms p(90)=39.3ms  p(95)=42.02ms p(99.9)=60.38ms
     iterations.....................: 187717  1538.25931/s
     success_rate...................: 100.00% ✓ 187717      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 405798      ✗ 0     
     data_received..................: 12 GB   97 MB/s
     data_sent......................: 163 MB  1.3 MB/s
     http_req_blocked...............: avg=3.59µs  min=972ns   med=2.18µs  max=4.59ms   p(90)=4.5µs    p(95)=5.64µs   p(99.9)=41.88µs
     http_req_connecting............: avg=828ns   min=0s      med=0s      max=4.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.07ms min=17.08ms med=43.55ms max=339.22ms p(90)=53.53ms  p(95)=56.87ms  p(99.9)=80.67ms
       { expected_response:true }...: avg=44.07ms min=17.08ms med=43.55ms max=339.22ms p(90)=53.53ms  p(95)=56.87ms  p(99.9)=80.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135366
     http_req_receiving.............: avg=94.64µs min=30.47µs med=60.01µs max=28.89ms  p(90)=130.54µs p(95)=198.69µs p(99.9)=2.92ms 
     http_req_sending...............: avg=39.14µs min=5.09µs  med=9.91µs  max=224.92ms p(90)=23.56µs  p(95)=107.5µs  p(99.9)=2.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.93ms min=16.87ms med=43.44ms max=338.95ms p(90)=53.37ms  p(95)=56.71ms  p(99.9)=80.41ms
     http_reqs......................: 135366  1109.241105/s
     iteration_duration.............: avg=44.35ms min=17.92ms med=43.79ms max=373.36ms p(90)=53.77ms  p(95)=57.1ms   p(99.9)=81.35ms
     iterations.....................: 135266  1108.421666/s
     success_rate...................: 100.00% ✓ 135266      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.326.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 387840      ✗ 0     
     data_received..................: 11 GB   93 MB/s
     data_sent......................: 155 MB  1.3 MB/s
     http_req_blocked...............: avg=2.84µs  min=1.03µs  med=2.19µs  max=1.82ms   p(90)=3.73µs   p(95)=4.48µs   p(99.9)=37.09µs
     http_req_connecting............: avg=281ns   min=0s      med=0s      max=1.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=46.16ms min=19.35ms med=45.51ms max=351.34ms p(90)=56.19ms  p(95)=59.61ms  p(99.9)=77.63ms
       { expected_response:true }...: avg=46.16ms min=19.35ms med=45.51ms max=351.34ms p(90)=56.19ms  p(95)=59.61ms  p(99.9)=77.63ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 129380
     http_req_receiving.............: avg=86.79µs min=29.2µs  med=66.72µs max=201.57ms p(90)=112.68µs p(95)=137.17µs p(99.9)=1.56ms 
     http_req_sending...............: avg=25.11µs min=5.22µs  med=10.64µs max=148.49ms p(90)=17.73µs  p(95)=21.81µs  p(99.9)=1.08ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=46.05ms min=19.22ms med=45.41ms max=343.77ms p(90)=56.08ms  p(95)=59.51ms  p(99.9)=77.25ms
     http_reqs......................: 129380  1060.041724/s
     iteration_duration.............: avg=46.4ms  min=21.84ms med=45.71ms max=357.71ms p(90)=56.39ms  p(95)=59.81ms  p(99.9)=78.28ms
     iterations.....................: 129280  1059.2224/s
     success_rate...................: 100.00% ✓ 129280      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 191928     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   628 kB/s
     http_req_blocked...............: avg=4.91µs  min=1.17µs  med=3.05µs   max=4.41ms   p(90)=4.64µs   p(95)=5.27µs   p(99.9)=45.9µs  
     http_req_connecting............: avg=1.62µs  min=0s      med=0s       max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.45ms min=19.48ms med=99.99ms  max=345.02ms p(90)=124.39ms p(95)=133.51ms p(99.9)=225.5ms 
       { expected_response:true }...: avg=93.45ms min=19.48ms med=99.99ms  max=345.02ms p(90)=124.39ms p(95)=133.51ms p(99.9)=225.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 64076
     http_req_receiving.............: avg=87.11µs min=31.42µs med=77.55µs  max=48.74ms  p(90)=114.53µs p(95)=128.27µs p(99.9)=922.15µs
     http_req_sending...............: avg=25.46µs min=5.45µs  med=14.18µs  max=148.83ms p(90)=20.99µs  p(95)=23.43µs  p(99.9)=785.18µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.33ms min=19.32ms med=99.89ms  max=344.29ms p(90)=124.28ms p(95)=133.39ms p(99.9)=225.31ms
     http_reqs......................: 64076   523.189704/s
     iteration_duration.............: avg=93.8ms  min=24.69ms med=100.26ms max=365.53ms p(90)=124.63ms p(95)=133.8ms  p(99.9)=227.12ms
     iterations.....................: 63976   522.37319/s
     success_rate...................: 100.00% ✓ 63976      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 143106     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 57 MB   469 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.22µs  med=3.39µs   max=4.4ms    p(90)=4.92µs   p(95)=5.53µs   p(99.9)=794.97µs
     http_req_connecting............: avg=2.32µs   min=0s      med=0s       max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=769.7µs 
     http_req_duration..............: avg=125.3ms  min=21.28ms med=123.39ms max=383.87ms p(90)=156.17ms p(95)=166.85ms p(99.9)=215.25ms
       { expected_response:true }...: avg=125.3ms  min=21.28ms med=123.39ms max=383.87ms p(90)=156.17ms p(95)=166.85ms p(99.9)=215.25ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47802
     http_req_receiving.............: avg=95.87µs  min=32.29µs med=84.92µs  max=105.37ms p(90)=118.55µs p(95)=131.3µs  p(99.9)=731.05µs
     http_req_sending...............: avg=24.41µs  min=5.52µs  med=16.46µs  max=152.6ms  p(90)=22.47µs  p(95)=24.55µs  p(99.9)=548.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.18ms min=21.14ms med=123.28ms max=383.7ms  p(90)=156.05ms p(95)=166.73ms p(99.9)=214.51ms
     http_reqs......................: 47802   390.326841/s
     iteration_duration.............: avg=125.8ms  min=33.97ms med=123.71ms max=403.24ms p(90)=156.44ms p(95)=167.14ms p(99.9)=219.26ms
     iterations.....................: 47702   389.510292/s
     success_rate...................: 100.00% ✓ 47702      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 87627      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.81µs   min=1.26µs  med=3.7µs    max=4.68ms  p(90)=5.28µs   p(95)=5.9µs    p(99.9)=1.73ms  
     http_req_connecting............: avg=3.86µs   min=0s      med=0s       max=4.62ms  p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=204.6ms  min=18.91ms med=164.25ms max=1s      p(90)=330.06ms p(95)=393.7ms  p(99.9)=731.54ms
       { expected_response:true }...: avg=204.6ms  min=18.91ms med=164.25ms max=1s      p(90)=330.06ms p(95)=393.7ms  p(99.9)=731.54ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29309
     http_req_receiving.............: avg=108.25µs min=34.94µs med=98.38µs  max=67.47ms p(90)=132.07µs p(95)=145.93µs p(99.9)=814.86µs
     http_req_sending...............: avg=27.01µs  min=6.06µs  med=18.69µs  max=40.39ms p(90)=24.09µs  p(95)=26.18µs  p(99.9)=574.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.46ms min=18.73ms med=164.12ms max=1s      p(90)=329.91ms p(95)=393.59ms p(99.9)=731.43ms
     http_reqs......................: 29309   239.701695/s
     iteration_duration.............: avg=205.52ms min=51.27ms med=164.67ms max=1s      p(90)=330.69ms p(95)=394.11ms p(99.9)=731.78ms
     iterations.....................: 29209   238.883851/s
     success_rate...................: 100.00% ✓ 29209      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 84471      ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   276 kB/s
     http_req_blocked...............: avg=7.21µs   min=1.24µs  med=3.39µs   max=4.52ms   p(90)=4.77µs   p(95)=5.32µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=3.59µs   min=0s      med=0s       max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=1.77ms  
     http_req_duration..............: avg=212.25ms min=20.96ms med=220.38ms max=419ms    p(90)=239.54ms p(95)=244.66ms p(99.9)=323.14ms
       { expected_response:true }...: avg=212.25ms min=20.96ms med=220.38ms max=419ms    p(90)=239.54ms p(95)=244.66ms p(99.9)=323.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28257
     http_req_receiving.............: avg=99.92µs  min=33.12µs med=90.82µs  max=70.85ms  p(90)=123.83µs p(95)=136.81µs p(99.9)=650.86µs
     http_req_sending...............: avg=30.44µs  min=6.19µs  med=16.67µs  max=80.84ms  p(90)=22.11µs  p(95)=24.11µs  p(99.9)=560.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=212.12ms min=20.78ms med=220.26ms max=418.37ms p(90)=239.4ms  p(95)=244.54ms p(99.9)=323.05ms
     http_reqs......................: 28257   229.973728/s
     iteration_duration.............: avg=213.22ms min=58.24ms med=220.68ms max=437.59ms p(90)=239.82ms p(95)=244.94ms p(99.9)=328.17ms
     iterations.....................: 28157   229.159864/s
     success_rate...................: 100.00% ✓ 28157      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

