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
| hive-router | v0.0.49 | 3,043 | 3,211 | 3,015 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,119 | 2,178 | 2,111 | 1.0% |  |
| grafbase | 0.53.3 | 2,054 | 2,123 | 2,040 | 1.4% |  |
| cosmo | 0.307.0 | 1,286 | 1,301 | 1,278 | 0.8% | non-compatible response (8 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 542 | 554 | 537 | 1.1% |  |
| apollo-router | v2.13.1 | 434 | 442 | 430 | 0.9% |  |
| hive-gateway | 2.5.25 | 249 | 253 | 246 | 0.9% |  |
| apollo-gateway | 2.13.3 | 247 | 249 | 246 | 0.4% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,381 | 2,505 | 2,359 | 2.0% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,941 | 1,992 | 1,919 | 1.2% |  |
| grafbase | 0.53.3 | 1,503 | 1,543 | 1,500 | 1.1% |  |
| cosmo | 0.307.0 | 1,191 | 1,210 | 1,175 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 505 | 518 | 501 | 1.2% |  |
| apollo-router | v2.13.1 | 400 | 409 | 398 | 1.0% |  |
| hive-gateway | 2.5.25 | 247 | 252 | 244 | 1.1% |  |
| apollo-gateway | 2.13.3 | 233 | 236 | 231 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1097424     ✗ 0     
     data_received..................: 32 GB   267 MB/s
     data_sent......................: 440 MB  3.7 MB/s
     http_req_blocked...............: avg=3.15µs  min=962ns   med=2.25µs  max=25.24ms  p(90)=3.59µs   p(95)=4.28µs   p(99.9)=34.02µs
     http_req_connecting............: avg=272ns   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.16ms min=1.66ms  med=15.11ms max=314.51ms p(90)=23.97ms  p(95)=28.24ms  p(99.9)=51.92ms
       { expected_response:true }...: avg=16.16ms min=1.66ms  med=15.11ms max=314.51ms p(90)=23.97ms  p(95)=28.24ms  p(99.9)=51.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 365908
     http_req_receiving.............: avg=149.5µs min=27.36µs med=48.59µs max=86.8ms   p(90)=100.55µs p(95)=284.89µs p(99.9)=16.23ms
     http_req_sending...............: avg=60.99µs min=5.21µs  med=9.24µs  max=140.16ms p(90)=16.22µs  p(95)=122.67µs p(99.9)=9.52ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.95ms min=1.59ms  med=14.96ms max=227.38ms p(90)=23.64ms  p(95)=27.74ms  p(99.9)=49.93ms
     http_reqs......................: 365908  3043.535289/s
     iteration_duration.............: avg=16.39ms min=2.14ms  med=15.32ms max=383.46ms p(90)=24.2ms   p(95)=28.51ms  p(99.9)=53.49ms
     iterations.....................: 365808  3042.703513/s
     success_rate...................: 100.00% ✓ 365808      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 764772      ✗ 0     
     data_received..................: 22 GB   186 MB/s
     data_sent......................: 306 MB  2.5 MB/s
     http_req_blocked...............: avg=3.23µs   min=1.02µs  med=2.36µs   max=11.12ms  p(90)=3.49µs   p(95)=4.05µs   p(99.9)=32.9µs  
     http_req_connecting............: avg=411ns    min=0s      med=0s       max=4.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.29ms  min=2.44ms  med=14.75ms  max=358.15ms p(90)=52.13ms  p(95)=70.45ms  p(99.9)=171.03ms
       { expected_response:true }...: avg=23.29ms  min=2.44ms  med=14.75ms  max=358.15ms p(90)=52.13ms  p(95)=70.45ms  p(99.9)=171.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 255024
     http_req_receiving.............: avg=686.89µs min=52.77µs med=111.63µs max=320.61ms p(90)=959.04µs p(95)=1.48ms   p(99.9)=64.67ms 
     http_req_sending...............: avg=41.3µs   min=5.18µs  med=9.64µs   max=30.88ms  p(90)=15.44µs  p(95)=109.55µs p(99.9)=2.86ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.56ms  min=2.3ms   med=14.22ms  max=352.53ms p(90)=50.77ms  p(95)=68.97ms  p(99.9)=166.19ms
     http_reqs......................: 255024  2119.88438/s
     iteration_duration.............: avg=23.52ms  min=3.28ms  med=14.96ms  max=366.2ms  p(90)=52.36ms  p(95)=70.71ms  p(99.9)=172.21ms
     iterations.....................: 254924  2119.053131/s
     success_rate...................: 100.00% ✓ 254924      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 740958      ✗ 0     
     data_received..................: 22 GB   181 MB/s
     data_sent......................: 297 MB  2.5 MB/s
     http_req_blocked...............: avg=2.83µs   min=962ns   med=2.12µs  max=8.2ms    p(90)=3.47µs  p(95)=4.21µs   p(99.9)=38.62µs
     http_req_connecting............: avg=212ns    min=0s      med=0s      max=2.6ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.05ms  min=1.94ms  med=23.81ms max=347.02ms p(90)=28.76ms p(95)=30.88ms  p(99.9)=51.95ms
       { expected_response:true }...: avg=24.05ms  min=1.94ms  med=23.81ms max=347.02ms p(90)=28.76ms p(95)=30.88ms  p(99.9)=51.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 247086
     http_req_receiving.............: avg=129.95µs min=29.68µs med=57.88µs max=310.74ms p(90)=98.71µs p(95)=169.76µs p(99.9)=8.05ms 
     http_req_sending...............: avg=42.38µs  min=5.15µs  med=9.84µs  max=283.17ms p(90)=16.51µs p(95)=105.93µs p(99.9)=2.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.88ms  min=1.85ms  med=23.7ms  max=94.77ms  p(90)=28.6ms  p(95)=30.65ms  p(99.9)=49.94ms
     http_reqs......................: 247086  2054.711197/s
     iteration_duration.............: avg=24.28ms  min=4.14ms  med=24.02ms max=356.51ms p(90)=28.98ms p(95)=31.11ms  p(99.9)=52.28ms
     iterations.....................: 246986  2053.87962/s
     success_rate...................: 100.00% ✓ 246986      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 464028      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=3.27µs  min=1.05µs  med=2.27µs  max=4.06ms   p(90)=3.64µs  p(95)=4.26µs   p(99.9)=34.5µs 
     http_req_connecting............: avg=656ns   min=0s      med=0s      max=4.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.54ms min=2.13ms  med=37.97ms max=324.14ms p(90)=54.37ms p(95)=59.46ms  p(99.9)=84.61ms
       { expected_response:true }...: avg=38.54ms min=2.13ms  med=37.97ms max=324.14ms p(90)=54.37ms p(95)=59.46ms  p(99.9)=84.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154776
     http_req_receiving.............: avg=79.91µs min=28.31µs med=59.39µs max=26.74ms  p(90)=95.93µs p(95)=114.61µs p(99.9)=1.96ms 
     http_req_sending...............: avg=27.1µs  min=5.27µs  med=10.34µs max=165.86ms p(90)=16µs    p(95)=20.07µs  p(99.9)=1.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.44ms min=2.04ms  med=37.88ms max=323.55ms p(90)=54.26ms p(95)=59.34ms  p(99.9)=84.3ms 
     http_reqs......................: 154776  1286.899841/s
     iteration_duration.............: avg=38.78ms min=4.41ms  med=38.18ms max=335.95ms p(90)=54.58ms p(95)=59.66ms  p(99.9)=85.46ms
     iterations.....................: 154676  1286.068382/s
     success_rate...................: 100.00% ✓ 154676      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 196035     ✗ 0    
     data_received..................: 5.7 GB  48 MB/s
     data_sent......................: 79 MB   652 kB/s
     http_req_blocked...............: avg=4.84µs  min=1.14µs  med=2.86µs  max=4.7ms    p(90)=4.37µs   p(95)=4.97µs   p(99.9)=45.5µs  
     http_req_connecting............: avg=1.65µs  min=0s      med=0s      max=4.65ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.47ms min=3.93ms  med=90.28ms max=338.19ms p(90)=118.22ms p(95)=132.41ms p(99.9)=227.72ms
       { expected_response:true }...: avg=91.47ms min=3.93ms  med=90.28ms max=338.19ms p(90)=118.22ms p(95)=132.41ms p(99.9)=227.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65445
     http_req_receiving.............: avg=83.56µs min=31.24µs med=76.28µs max=12.25ms  p(90)=110.43µs p(95)=123.38µs p(99.9)=818.08µs
     http_req_sending...............: avg=26.22µs min=5.6µs   med=12.87µs max=126.03ms p(90)=19.19µs  p(95)=21.52µs  p(99.9)=673.86µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.36ms min=3.85ms  med=90.18ms max=337.84ms p(90)=118.12ms p(95)=132.28ms p(99.9)=227.55ms
     http_reqs......................: 65445   542.882619/s
     iteration_duration.............: avg=91.85ms min=25.53ms med=90.52ms max=374.25ms p(90)=118.47ms p(95)=132.72ms p(99.9)=229.02ms
     iterations.....................: 65345   542.053094/s
     success_rate...................: 100.00% ✓ 65345      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 157113     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   522 kB/s
     http_req_blocked...............: avg=5.61µs   min=1.22µs  med=3.34µs   max=4.44ms   p(90)=4.77µs   p(95)=5.32µs   p(99.9)=117.55µs
     http_req_connecting............: avg=2.08µs   min=0s      med=0s       max=4.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.11ms min=5.35ms  med=113.83ms max=350.37ms p(90)=137.75ms p(95)=144.95ms p(99.9)=177.8ms 
       { expected_response:true }...: avg=114.11ms min=5.35ms  med=113.83ms max=350.37ms p(90)=137.75ms p(95)=144.95ms p(99.9)=177.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 52471
     http_req_receiving.............: avg=91.09µs  min=32.85µs med=83.17µs  max=83.04ms  p(90)=114.99µs p(95)=126.55µs p(99.9)=857.12µs
     http_req_sending...............: avg=28µs     min=6.11µs  med=15.37µs  max=159.1ms  p(90)=20.69µs  p(95)=22.39µs  p(99.9)=684.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.99ms min=5.29ms  med=113.72ms max=349.7ms  p(90)=137.63ms p(95)=144.85ms p(99.9)=177.08ms
     http_reqs......................: 52471   434.77099/s
     iteration_duration.............: avg=114.6ms  min=22.85ms med=114.11ms max=378.78ms p(90)=138.03ms p(95)=145.24ms p(99.9)=180.17ms
     iterations.....................: 52371   433.942397/s
     success_rate...................: 100.00% ✓ 52371      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 90186      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   299 kB/s
     http_req_blocked...............: avg=7.5µs    min=1.29µs  med=3.67µs   max=4.67ms   p(90)=5.15µs   p(95)=5.8µs    p(99.9)=1.61ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=4.63ms   p(90)=0s       p(95)=0s       p(99.9)=1.58ms  
     http_req_duration..............: avg=198.85ms min=6.37ms  med=200.74ms max=670.98ms p(90)=254.23ms p(95)=395.49ms p(99.9)=566.62ms
       { expected_response:true }...: avg=198.85ms min=6.37ms  med=200.74ms max=670.98ms p(90)=254.23ms p(95)=395.49ms p(99.9)=566.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30162
     http_req_receiving.............: avg=102.77µs min=33.8µs  med=96.33µs  max=36.44ms  p(90)=128.88µs p(95)=142.7µs  p(99.9)=699.61µs
     http_req_sending...............: avg=23.46µs  min=6.18µs  med=17.72µs  max=43.57ms  p(90)=22.99µs  p(95)=24.88µs  p(99.9)=581.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=198.72ms min=6.24ms  med=200.62ms max=670.86ms p(90)=254.1ms  p(95)=395.37ms p(99.9)=566.48ms
     http_reqs......................: 30162   249.241747/s
     iteration_duration.............: avg=199.77ms min=55.15ms med=201.13ms max=671.23ms p(90)=254.61ms p(95)=396.65ms p(99.9)=567.06ms
     iterations.....................: 30062   248.415404/s
     success_rate...................: 100.00% ✓ 30062      ✗ 0    
     vus............................: 9       min=9        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 89475      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=6.17µs   min=1.22µs  med=3.42µs   max=3.37ms   p(90)=4.69µs   p(95)=5.23µs   p(99.9)=1.1ms   
     http_req_connecting............: avg=2.53µs   min=0s      med=0s       max=3.34ms   p(90)=0s       p(95)=0s       p(99.9)=933.17µs
     http_req_duration..............: avg=200.4ms  min=8.35ms  med=199.98ms max=332.35ms p(90)=210.04ms p(95)=215.35ms p(99.9)=279.48ms
       { expected_response:true }...: avg=200.4ms  min=8.35ms  med=199.98ms max=332.35ms p(90)=210.04ms p(95)=215.35ms p(99.9)=279.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29925
     http_req_receiving.............: avg=96.85µs  min=34.99µs med=91.99µs  max=18.2ms   p(90)=123.68µs p(95)=136.3µs  p(99.9)=497.05µs
     http_req_sending...............: avg=25.68µs  min=5.67µs  med=16.87µs  max=64.14ms  p(90)=21.64µs  p(95)=23.37µs  p(99.9)=503.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.28ms min=8.26ms  med=199.87ms max=331.97ms p(90)=209.92ms p(95)=215.25ms p(99.9)=279.39ms
     http_reqs......................: 29925   247.204031/s
     iteration_duration.............: avg=201.31ms min=31.02ms med=200.25ms max=347.13ms p(90)=210.3ms  p(95)=215.66ms p(99.9)=280.18ms
     iterations.....................: 29825   246.377953/s
     success_rate...................: 100.00% ✓ 29825      ✗ 0    
     vus............................: 31      min=31       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 858591      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 344 MB  2.9 MB/s
     http_req_blocked...............: avg=2.91µs  min=962ns   med=2.12µs  max=4.27ms   p(90)=3.52µs  p(95)=4.32µs   p(99.9)=35.15µs
     http_req_connecting............: avg=355ns   min=0s      med=0s      max=3.96ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.72ms min=1.75ms  med=20.21ms max=334.02ms p(90)=28.74ms p(95)=31.91ms  p(99.9)=54.8ms 
       { expected_response:true }...: avg=20.72ms min=1.75ms  med=20.21ms max=334.02ms p(90)=28.74ms p(95)=31.91ms  p(99.9)=54.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 286297
     http_req_receiving.............: avg=114.2µs min=27.94µs med=52.49µs max=251ms    p(90)=98.78µs p(95)=241.19µs p(99.9)=9.67ms 
     http_req_sending...............: avg=52.51µs min=5.26µs  med=9.67µs  max=254.31ms p(90)=17.37µs p(95)=119.54µs p(99.9)=5.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.55ms min=1.69ms  med=20.07ms max=333.26ms p(90)=28.53ms p(95)=31.59ms  p(99.9)=53.76ms
     http_reqs......................: 286297  2381.575272/s
     iteration_duration.............: avg=20.95ms min=3.44ms  med=20.41ms max=344.64ms p(90)=28.96ms p(95)=32.16ms  p(99.9)=55.34ms
     iterations.....................: 286197  2380.743417/s
     success_rate...................: 100.00% ✓ 286197      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 700143      ✗ 0     
     data_received..................: 21 GB   170 MB/s
     data_sent......................: 281 MB  2.3 MB/s
     http_req_blocked...............: avg=3.42µs   min=982ns   med=2.45µs   max=15.69ms  p(90)=3.84µs  p(95)=4.55µs  p(99.9)=38.6µs  
     http_req_connecting............: avg=413ns    min=0s      med=0s       max=3.87ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.46ms  min=1.89ms  med=17.39ms  max=523.14ms p(90)=53.95ms p(95)=71.39ms p(99.9)=190.74ms
       { expected_response:true }...: avg=25.46ms  min=1.89ms  med=17.39ms  max=523.14ms p(90)=53.95ms p(95)=71.39ms p(99.9)=190.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 233481
     http_req_receiving.............: avg=685.34µs min=52.61µs med=111.33µs max=178.86ms p(90)=1.13ms  p(95)=1.81ms  p(99.9)=56.66ms 
     http_req_sending...............: avg=44.94µs  min=5.31µs  med=9.99µs   max=72.37ms  p(90)=17.57µs p(95)=113.7µs p(99.9)=3.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.73ms  min=1.76ms  med=16.82ms  max=523.04ms p(90)=52.76ms p(95)=70.04ms p(99.9)=185.99ms
     http_reqs......................: 233481  1941.761529/s
     iteration_duration.............: avg=25.7ms   min=2.85ms  med=17.61ms  max=523.29ms p(90)=54.17ms p(95)=71.64ms p(99.9)=192.46ms
     iterations.....................: 233381  1940.929872/s
     success_rate...................: 100.00% ✓ 233381      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 542457      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 217 MB  1.8 MB/s
     http_req_blocked...............: avg=3.53µs   min=962ns   med=2.4µs   max=4.88ms   p(90)=4.69µs   p(95)=5.85µs   p(99.9)=46.37µs
     http_req_connecting............: avg=529ns    min=0s      med=0s      max=4.85ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.9ms   min=2.4ms   med=31.97ms max=334.37ms p(90)=43.95ms  p(95)=48.79ms  p(99.9)=87.94ms
       { expected_response:true }...: avg=32.9ms   min=2.4ms   med=31.97ms max=334.37ms p(90)=43.95ms  p(95)=48.79ms  p(99.9)=87.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180919
     http_req_receiving.............: avg=113.84µs min=29.98µs med=62.47µs max=179.38ms p(90)=135.84µs p(95)=280.89µs p(99.9)=5.38ms 
     http_req_sending...............: avg=46.83µs  min=5.32µs  med=10.25µs max=162.89ms p(90)=23.74µs  p(95)=135.45µs p(99.9)=3.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.74ms  min=2.27ms  med=31.84ms max=329.46ms p(90)=43.75ms  p(95)=48.56ms  p(99.9)=87.75ms
     http_reqs......................: 180919  1503.86169/s
     iteration_duration.............: avg=33.17ms  min=3.82ms  med=32.22ms max=364.11ms p(90)=44.19ms  p(95)=49.05ms  p(99.9)=88.72ms
     iterations.....................: 180819  1503.030455/s
     success_rate...................: 100.00% ✓ 180819      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 429678      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.73µs  min=1.04µs  med=2.61µs  max=4.31ms   p(90)=4.09µs   p(95)=4.75µs   p(99.9)=37.68µs
     http_req_connecting............: avg=765ns   min=0s      med=0s      max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.63ms min=2.22ms  med=41.1ms  max=327.98ms p(90)=58.45ms  p(95)=63.91ms  p(99.9)=91.68ms
       { expected_response:true }...: avg=41.63ms min=2.22ms  med=41.1ms  max=327.98ms p(90)=58.45ms  p(95)=63.91ms  p(99.9)=91.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 143326
     http_req_receiving.............: avg=86.57µs min=29.26µs med=67.64µs max=111.17ms p(90)=105.53µs p(95)=123.93µs p(99.9)=1.67ms 
     http_req_sending...............: avg=26.56µs min=5.63µs  med=11.71µs max=146.46ms p(90)=17.89µs  p(95)=21.77µs  p(99.9)=1.24ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.52ms min=2.12ms  med=40.99ms max=327.58ms p(90)=58.33ms  p(95)=63.75ms  p(99.9)=90.87ms
     http_reqs......................: 143326  1191.601407/s
     iteration_duration.............: avg=41.88ms min=3.95ms  med=41.31ms max=342.54ms p(90)=58.67ms  p(95)=64.11ms  p(99.9)=92.42ms
     iterations.....................: 143226  1190.770015/s
     success_rate...................: 100.00% ✓ 143226      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 182625     ✗ 0    
     data_received..................: 5.3 GB  44 MB/s
     data_sent......................: 73 MB   607 kB/s
     http_req_blocked...............: avg=7.18µs  min=1.16µs  med=3.06µs  max=188.1ms  p(90)=4.53µs   p(95)=5.12µs   p(99.9)=47.25µs 
     http_req_connecting............: avg=757ns   min=0s      med=0s      max=2.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=98.16ms min=4.29ms  med=95.42ms max=345.45ms p(90)=118.56ms p(95)=131.06ms p(99.9)=231.65ms
       { expected_response:true }...: avg=98.16ms min=4.29ms  med=95.42ms max=345.45ms p(90)=118.56ms p(95)=131.06ms p(99.9)=231.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 60975
     http_req_receiving.............: avg=90.14µs min=31.1µs  med=80.19µs max=118.15ms p(90)=113.61µs p(95)=125.98µs p(99.9)=766.95µs
     http_req_sending...............: avg=24.41µs min=5.68µs  med=13.48µs max=141.49ms p(90)=19.73µs  p(95)=21.76µs  p(99.9)=671.49µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=98.05ms min=4.23ms  med=95.32ms max=345.14ms p(90)=118.45ms p(95)=130.92ms p(99.9)=231.36ms
     http_reqs......................: 60975   505.597602/s
     iteration_duration.............: avg=98.57ms min=26.42ms med=95.66ms max=359.83ms p(90)=118.83ms p(95)=131.44ms p(99.9)=234.07ms
     iterations.....................: 60875   504.768413/s
     success_rate...................: 100.00% ✓ 60875      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 144846     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   481 kB/s
     http_req_blocked...............: avg=6.05µs   min=1.21µs  med=3.73µs   max=4.05ms   p(90)=5.23µs   p(95)=5.81µs   p(99.9)=213.17µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=91.99µs 
     http_req_duration..............: avg=123.77ms min=5.78ms  med=121.49ms max=361.2ms  p(90)=163.56ms p(95)=175.91ms p(99.9)=224.9ms 
       { expected_response:true }...: avg=123.77ms min=5.78ms  med=121.49ms max=361.2ms  p(90)=163.56ms p(95)=175.91ms p(99.9)=224.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48382
     http_req_receiving.............: avg=118.8µs  min=31.84µs med=87.91µs  max=95.33ms  p(90)=119.35µs p(95)=131.11µs p(99.9)=1.66ms  
     http_req_sending...............: avg=32.03µs  min=6.04µs  med=17.24µs  max=174.98ms p(90)=22.29µs  p(95)=24.15µs  p(99.9)=612.87µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.62ms min=5.66ms  med=121.36ms max=290.81ms p(90)=163.41ms p(95)=175.75ms p(99.9)=224ms   
     http_reqs......................: 48382   400.766705/s
     iteration_duration.............: avg=124.3ms  min=16.71ms med=121.81ms max=373.28ms p(90)=163.88ms p(95)=176.23ms p(99.9)=227.28ms
     iterations.....................: 48282   399.938367/s
     success_rate...................: 100.00% ✓ 48282      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 89688      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   298 kB/s
     http_req_blocked...............: avg=5.41µs   min=1.24µs  med=3.77µs   max=1.95ms   p(90)=5.24µs   p(95)=5.86µs   p(99.9)=602.64µs
     http_req_connecting............: avg=1.4µs    min=0s      med=0s       max=1.92ms   p(90)=0s       p(95)=0s       p(99.9)=559.89µs
     http_req_duration..............: avg=199.92ms min=6.46ms  med=183.05ms max=615.32ms p(90)=235.46ms p(95)=400.21ms p(99.9)=524.41ms
       { expected_response:true }...: avg=199.92ms min=6.46ms  med=183.05ms max=615.32ms p(90)=235.46ms p(95)=400.21ms p(99.9)=524.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29996
     http_req_receiving.............: avg=103.97µs min=36.15µs med=99.59µs  max=16.06ms  p(90)=131.1µs  p(95)=144.29µs p(99.9)=611.28µs
     http_req_sending...............: avg=26.55µs  min=6.49µs  med=18.45µs  max=60.76ms  p(90)=23.35µs  p(95)=25.1µs   p(99.9)=542.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=199.79ms min=6.33ms  med=182.92ms max=615.15ms p(90)=235.31ms p(95)=400.1ms  p(99.9)=524.29ms
     http_reqs......................: 29996   247.92065/s
     iteration_duration.............: avg=200.85ms min=40.17ms med=183.4ms  max=615.6ms  p(90)=236.04ms p(95)=400.92ms p(99.9)=524.87ms
     iterations.....................: 29896   247.094137/s
     success_rate...................: 100.00% ✓ 29896      ✗ 0    
     vus............................: 3       min=3        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 84648      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=7.28µs   min=1.21µs  med=3.47µs   max=4.54ms   p(90)=4.77µs   p(95)=5.36µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.58µs   min=0s      med=0s       max=4.49ms   p(90)=0s       p(95)=0s       p(99.9)=1.74ms  
     http_req_duration..............: avg=211.76ms min=8.75ms  med=217.84ms max=428.77ms p(90)=234.04ms p(95)=243.02ms p(99.9)=310.34ms
       { expected_response:true }...: avg=211.76ms min=8.75ms  med=217.84ms max=428.77ms p(90)=234.04ms p(95)=243.02ms p(99.9)=310.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28316
     http_req_receiving.............: avg=101.54µs min=34.92µs med=94.74µs  max=37.32ms  p(90)=126.47µs p(95)=139.09µs p(99.9)=541.18µs
     http_req_sending...............: avg=35.34µs  min=6.22µs  med=17.53µs  max=168.23ms p(90)=22.27µs  p(95)=24.07µs  p(99.9)=570.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.62ms min=8.59ms  med=217.71ms max=428.21ms p(90)=233.91ms p(95)=242.92ms p(99.9)=310.19ms
     http_reqs......................: 28316   233.753866/s
     iteration_duration.............: avg=212.78ms min=39.83ms med=218.36ms max=445.88ms p(90)=234.36ms p(95)=243.44ms p(99.9)=314.33ms
     iterations.....................: 28216   232.928347/s
     success_rate...................: 100.00% ✓ 28216      ✗ 0    
     vus............................: 47      min=47       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

