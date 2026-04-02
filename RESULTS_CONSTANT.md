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
| hive-router | v0.0.43 | 3,098 | 3,248 | 3,073 | 1.8% |  |
| grafbase | 0.53.2 | 2,083 | 2,132 | 2,064 | 1.2% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,068 | 2,115 | 2,058 | 0.9% |  |
| cosmo | 0.298.0 | 1,264 | 1,285 | 1,250 | 0.9% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 616 | 628 | 614 | 0.7% |  |
| apollo-router | v2.12.1 | 427 | 435 | 423 | 1.0% |  |
| hive-gateway | 2.5.14 | 273 | 277 | 270 | 0.9% |  |
| apollo-gateway | 2.13.3 | 247 | 249 | 244 | 0.7% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,438 | 2,518 | 2,383 | 1.7% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,909 | 1,956 | 1,889 | 1.2% |  |
| grafbase | 0.53.2 | 1,494 | 1,534 | 1,483 | 1.0% |  |
| cosmo | 0.298.0 | 1,205 | 1,224 | 1,199 | 0.9% | non-compatible response (4 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 595 | 607 | 591 | 0.9% |  |
| apollo-router | v2.12.1 | 396 | 405 | 393 | 1.1% |  |
| hive-gateway | 2.5.14 | 270 | 275 | 267 | 1.0% |  |
| apollo-gateway | 2.13.3 | 236 | 238 | 234 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1116819     ✗ 0     
     data_received..................: 33 GB   272 MB/s
     data_sent......................: 448 MB  3.7 MB/s
     http_req_blocked...............: avg=3.11µs   min=962ns   med=2.1µs   max=26.14ms  p(90)=3.29µs   p(95)=3.93µs   p(99.9)=31.51µs
     http_req_connecting............: avg=316ns    min=0s      med=0s      max=5.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=15.87ms  min=1.66ms  med=14.89ms max=307.14ms p(90)=23.31ms  p(95)=27.35ms  p(99.9)=50.78ms
       { expected_response:true }...: avg=15.87ms  min=1.66ms  med=14.89ms max=307.14ms p(90)=23.31ms  p(95)=27.35ms  p(99.9)=50.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 372373
     http_req_receiving.............: avg=142.08µs min=27.19µs med=49.74µs max=242.78ms p(90)=102.01µs p(95)=284.52µs p(99.9)=13.22ms
     http_req_sending...............: avg=61.03µs  min=4.9µs   med=9.08µs  max=123.72ms p(90)=15.65µs  p(95)=121.55µs p(99.9)=11.15ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=15.67ms  min=1.6ms   med=14.74ms max=306.58ms p(90)=23ms     p(95)=26.88ms  p(99.9)=49.23ms
     http_reqs......................: 372373  3098.079268/s
     iteration_duration.............: avg=16.1ms   min=2.34ms  med=15.09ms max=345.87ms p(90)=23.54ms  p(95)=27.62ms  p(99.9)=52.83ms
     iterations.....................: 372273  3097.247285/s
     success_rate...................: 100.00% ✓ 372273      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 751347      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 301 MB  2.5 MB/s
     http_req_blocked...............: avg=3.01µs  min=941ns   med=2.3µs   max=14.11ms  p(90)=3.8µs    p(95)=4.6µs    p(99.9)=42.57µs
     http_req_connecting............: avg=175ns   min=0s      med=0s      max=2.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.71ms min=1.93ms  med=23.47ms max=319.52ms p(90)=28.34ms  p(95)=30.42ms  p(99.9)=52.49ms
       { expected_response:true }...: avg=23.71ms min=1.93ms  med=23.47ms max=319.52ms p(90)=28.34ms  p(95)=30.42ms  p(99.9)=52.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 250549
     http_req_receiving.............: avg=104.8µs min=29.51µs med=57.81µs max=193.18ms p(90)=100.54µs p(95)=179.36µs p(99.9)=7.54ms 
     http_req_sending...............: avg=44.18µs min=4.94µs  med=9.93µs  max=228.11ms p(90)=17.11µs  p(95)=112.42µs p(99.9)=2.21ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.56ms min=1.81ms  med=23.36ms max=318.85ms p(90)=28.18ms  p(95)=30.2ms   p(99.9)=50.99ms
     http_reqs......................: 250549  2083.534496/s
     iteration_duration.............: avg=23.94ms min=4.19ms  med=23.68ms max=352.03ms p(90)=28.55ms  p(95)=30.65ms  p(99.9)=53.18ms
     iterations.....................: 250449  2082.702908/s
     success_rate...................: 100.00% ✓ 250449      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 746346      ✗ 0     
     data_received..................: 22 GB   181 MB/s
     data_sent......................: 299 MB  2.5 MB/s
     http_req_blocked...............: avg=3.24µs   min=1.05µs  med=2.43µs   max=7.47ms   p(90)=3.6µs   p(95)=4.21µs   p(99.9)=35.5µs  
     http_req_connecting............: avg=407ns    min=0s      med=0s       max=4.04ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.88ms  min=2.47ms  med=15ms     max=329.56ms p(90)=54.41ms p(95)=73ms     p(99.9)=170.9ms 
       { expected_response:true }...: avg=23.88ms  min=2.47ms  med=15ms     max=329.56ms p(90)=54.41ms p(95)=73ms     p(99.9)=170.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 248882
     http_req_receiving.............: avg=673.56µs min=51.49µs med=115.75µs max=256.87ms p(90)=971.9µs p(95)=1.49ms   p(99.9)=62.04ms 
     http_req_sending...............: avg=41.54µs  min=5.36µs  med=9.65µs   max=242ms    p(90)=15.9µs  p(95)=107.76µs p(99.9)=2.37ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.16ms  min=2.37ms  med=14.46ms  max=328.89ms p(90)=52.98ms p(95)=71.57ms  p(99.9)=167.81ms
     http_reqs......................: 248882  2068.741866/s
     iteration_duration.............: avg=24.1ms   min=3.42ms  med=15.22ms  max=342.43ms p(90)=54.66ms p(95)=73.25ms  p(99.9)=172.15ms
     iterations.....................: 248782  2067.910652/s
     success_rate...................: 100.00% ✓ 248782      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 455928      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=2.95µs  min=1.05µs  med=2.32µs  max=2.34ms   p(90)=3.66µs  p(95)=4.3µs    p(99.9)=34.53µs
     http_req_connecting............: avg=309ns   min=0s      med=0s      max=2.31ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.23ms min=2.17ms  med=38.65ms max=334.97ms p(90)=55.44ms p(95)=60.58ms  p(99.9)=85.07ms
       { expected_response:true }...: avg=39.23ms min=2.17ms  med=38.65ms max=334.97ms p(90)=55.44ms p(95)=60.58ms  p(99.9)=85.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152076
     http_req_receiving.............: avg=113.1µs min=28.32µs med=60.27µs max=237.61ms p(90)=96.54µs p(95)=115.76µs p(99.9)=2.36ms 
     http_req_sending...............: avg=25.36µs min=5.22µs  med=10.32µs max=69.44ms  p(90)=15.92µs p(95)=20.2µs   p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.1ms  min=2.06ms  med=38.55ms max=115.93ms p(90)=55.33ms p(95)=60.46ms  p(99.9)=84.51ms
     http_reqs......................: 152076  1264.454386/s
     iteration_duration.............: avg=39.47ms min=3.23ms  med=38.85ms max=383.39ms p(90)=55.65ms p(95)=60.79ms  p(99.9)=85.64ms
     iterations.....................: 151976  1263.622924/s
     success_rate...................: 100.00% ✓ 151976      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 222642     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   741 kB/s
     http_req_blocked...............: avg=4.46µs   min=1.18µs  med=3.02µs  max=3.97ms   p(90)=4.62µs   p(95)=5.27µs   p(99.9)=50.21µs 
     http_req_connecting............: avg=1.12µs   min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=80.51ms  min=3.85ms  med=82.66ms max=345.26ms p(90)=119.2ms  p(95)=129.77ms p(99.9)=226.35ms
       { expected_response:true }...: avg=80.51ms  min=3.85ms  med=82.66ms max=345.26ms p(90)=119.2ms  p(95)=129.77ms p(99.9)=226.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 74314
     http_req_receiving.............: avg=119.12µs min=31.21µs med=76.72µs max=107.82ms p(90)=112.07µs p(95)=125.81µs p(99.9)=1.2ms   
     http_req_sending...............: avg=29.74µs  min=5.63µs  med=13.17µs max=160.16ms p(90)=20.42µs  p(95)=22.93µs  p(99.9)=871.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.36ms  min=3.74ms  med=82.51ms max=264.62ms p(90)=119.06ms p(95)=129.58ms p(99.9)=225.46ms
     http_reqs......................: 74314   616.768482/s
     iteration_duration.............: avg=80.85ms  min=8.4ms   med=82.96ms max=352.89ms p(90)=119.44ms p(95)=130.02ms p(99.9)=227.85ms
     iterations.....................: 74214   615.938532/s
     success_rate...................: 100.00% ✓ 74214      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 154416     ✗ 0    
     data_received..................: 4.5 GB  38 MB/s
     data_sent......................: 62 MB   513 kB/s
     http_req_blocked...............: avg=5.58µs   min=1.13µs  med=3.38µs   max=4.24ms   p(90)=4.85µs   p(95)=5.39µs   p(99.9)=109.07µs
     http_req_connecting............: avg=1.97µs   min=0s      med=0s       max=4.2ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.11ms min=5.43ms  med=115.99ms max=346.16ms p(90)=140.33ms p(95)=147.54ms p(99.9)=182.38ms
       { expected_response:true }...: avg=116.11ms min=5.43ms  med=115.99ms max=346.16ms p(90)=140.33ms p(95)=147.54ms p(99.9)=182.38ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51572
     http_req_receiving.............: avg=174µs    min=31.73µs med=84.45µs  max=183.58ms p(90)=118.3µs  p(95)=131.3µs  p(99.9)=1.22ms  
     http_req_sending...............: avg=21.94µs  min=5.4µs   med=15.53µs  max=30.15ms  p(90)=21.27µs  p(95)=23.15µs  p(99.9)=627.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.92ms min=5.31ms  med=115.87ms max=194.61ms p(90)=140.18ms p(95)=147.38ms p(99.9)=175.78ms
     http_reqs......................: 51572   427.287561/s
     iteration_duration.............: avg=116.59ms min=9.75ms  med=116.28ms max=379.85ms p(90)=140.58ms p(95)=147.8ms  p(99.9)=184.82ms
     iterations.....................: 51472   426.459034/s
     success_rate...................: 100.00% ✓ 51472      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 98853      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   329 kB/s
     http_req_blocked...............: avg=7.11µs   min=1.19µs  med=3.62µs   max=4.85ms   p(90)=5.17µs   p(95)=5.81µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=3.26µs   min=0s      med=0s       max=4.8ms    p(90)=0s       p(95)=0s       p(99.9)=1.47ms  
     http_req_duration..............: avg=181.36ms min=5.88ms  med=164.45ms max=593.52ms p(90)=213.34ms p(95)=367.69ms p(99.9)=525.52ms
       { expected_response:true }...: avg=181.36ms min=5.88ms  med=164.45ms max=593.52ms p(90)=213.34ms p(95)=367.69ms p(99.9)=525.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 33051
     http_req_receiving.............: avg=100.87µs min=33.37µs med=96.62µs  max=3.78ms   p(90)=129.53µs p(95)=143.28µs p(99.9)=574.47µs
     http_req_sending...............: avg=26.84µs  min=5.96µs  med=18.09µs  max=60.14ms  p(90)=23.32µs  p(95)=25.22µs  p(99.9)=586.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=181.23ms min=5.71ms  med=164.33ms max=593.41ms p(90)=213.23ms p(95)=367.59ms p(99.9)=525.41ms
     http_reqs......................: 33051   273.563579/s
     iteration_duration.............: avg=182.18ms min=38.91ms med=164.81ms max=593.75ms p(90)=213.74ms p(95)=368.48ms p(99.9)=525.8ms 
     iterations.....................: 32951   272.735878/s
     success_rate...................: 100.00% ✓ 32951      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 89568      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=6.89µs   min=1.3µs   med=3.35µs   max=4.19ms   p(90)=4.63µs   p(95)=5.15µs   p(99.9)=1.69ms  
     http_req_connecting............: avg=3.4µs    min=0s      med=0s       max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=1.66ms  
     http_req_duration..............: avg=200.16ms min=8.49ms  med=197.9ms  max=430.55ms p(90)=214.37ms p(95)=219.18ms p(99.9)=286.63ms
       { expected_response:true }...: avg=200.16ms min=8.49ms  med=197.9ms  max=430.55ms p(90)=214.37ms p(95)=219.18ms p(99.9)=286.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29956
     http_req_receiving.............: avg=120.01µs min=33.4µs  med=90.09µs  max=268.11ms p(90)=122.48µs p(95)=134.46µs p(99.9)=848.29µs
     http_req_sending...............: avg=41.49µs  min=6.06µs  med=16.84µs  max=217.66ms p(90)=21.76µs  p(95)=23.55µs  p(99.9)=613.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200ms    min=8.35ms  med=197.77ms max=397.89ms p(90)=214.26ms p(95)=219.05ms p(99.9)=285.4ms 
     http_reqs......................: 29956   247.414828/s
     iteration_duration.............: avg=201.12ms min=48.36ms med=198.22ms max=454ms    p(90)=214.64ms p(95)=219.5ms  p(99.9)=302.82ms
     iterations.....................: 29856   246.5889/s
     success_rate...................: 100.00% ✓ 29856      ✗ 0    
     vus............................: 36      min=36       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 879159      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=4.97µs   min=1.02µs  med=2.08µs  max=25.24ms  p(90)=3.38µs  p(95)=4.16µs   p(99.9)=32.14µs
     http_req_connecting............: avg=2.39µs   min=0s      med=0s      max=25.2ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.23ms  min=1.59ms  med=19.71ms max=295.85ms p(90)=28.11ms p(95)=31.21ms  p(99.9)=53.03ms
       { expected_response:true }...: avg=20.23ms  min=1.59ms  med=19.71ms max=295.85ms p(90)=28.11ms p(95)=31.21ms  p(99.9)=53.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 293153
     http_req_receiving.............: avg=110.27µs min=27.76µs med=51.92µs max=196.43ms p(90)=97.91µs p(95)=245.37µs p(99.9)=9.14ms 
     http_req_sending...............: avg=51.31µs  min=5.06µs  med=9.25µs  max=69.68ms  p(90)=16.58µs p(95)=118.84µs p(99.9)=6.15ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.07ms  min=1.5ms   med=19.58ms max=273.66ms p(90)=27.92ms p(95)=30.93ms  p(99.9)=52.3ms 
     http_reqs......................: 293153  2438.819875/s
     iteration_duration.............: avg=20.46ms  min=3.48ms  med=19.92ms max=333.86ms p(90)=28.33ms p(95)=31.44ms  p(99.9)=53.66ms
     iterations.....................: 293053  2437.987948/s
     success_rate...................: 100.00% ✓ 293053      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688464      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=3µs      min=971ns   med=2.14µs   max=5.01ms   p(90)=3.49µs  p(95)=4.2µs   p(99.9)=33.3µs  
     http_req_connecting............: avg=463ns    min=0s      med=0s       max=4.18ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.89ms  min=1.87ms  med=17.73ms  max=511.37ms p(90)=55.04ms p(95)=72.61ms p(99.9)=192.22ms
       { expected_response:true }...: avg=25.89ms  min=1.87ms  med=17.73ms  max=511.37ms p(90)=55.04ms p(95)=72.61ms p(99.9)=192.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229588
     http_req_receiving.............: avg=702.07µs min=51.61µs med=108.56µs max=163.59ms p(90)=1.15ms  p(95)=1.83ms  p(99.9)=58.35ms 
     http_req_sending...............: avg=41.71µs  min=5.14µs  med=9.46µs   max=169.44ms p(90)=17.34µs p(95)=98.52µs p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=25.15ms  min=1.78ms  med=17.15ms  max=509.66ms p(90)=53.67ms p(95)=71.14ms p(99.9)=189.45ms
     http_reqs......................: 229588  1909.427812/s
     iteration_duration.............: avg=26.13ms  min=2.68ms  med=17.95ms  max=511.58ms p(90)=55.28ms p(95)=72.87ms p(99.9)=197.14ms
     iterations.....................: 229488  1908.596136/s
     success_rate...................: 100.00% ✓ 229488      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 539094      ✗ 0     
     data_received..................: 16 GB   131 MB/s
     data_sent......................: 216 MB  1.8 MB/s
     http_req_blocked...............: avg=3.47µs   min=992ns   med=2.29µs  max=3.86ms   p(90)=4.52µs  p(95)=5.71µs   p(99.9)=44.97µs
     http_req_connecting............: avg=587ns    min=0s      med=0s      max=3.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=33.11ms  min=2.28ms  med=32.19ms max=318.15ms p(90)=44.33ms p(95)=49.05ms  p(99.9)=87.6ms 
       { expected_response:true }...: avg=33.11ms  min=2.28ms  med=32.19ms max=318.15ms p(90)=44.33ms p(95)=49.05ms  p(99.9)=87.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 179798
     http_req_receiving.............: avg=111.63µs min=29.36µs med=60.07µs max=112.13ms p(90)=131.4µs p(95)=269.65µs p(99.9)=5.51ms 
     http_req_sending...............: avg=49.49µs  min=5.36µs  med=10.25µs max=217.15ms p(90)=24.19µs p(95)=132.99µs p(99.9)=4.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.95ms  min=2.22ms  med=32.05ms max=317.98ms p(90)=44.15ms p(95)=48.83ms  p(99.9)=86.74ms
     http_reqs......................: 179798  1494.680245/s
     iteration_duration.............: avg=33.37ms  min=4.71ms  med=32.42ms max=356.18ms p(90)=44.57ms p(95)=49.29ms  p(99.9)=88.31ms
     iterations.....................: 179698  1493.848934/s
     success_rate...................: 100.00% ✓ 179698      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 434613      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.02µs  med=2.3µs   max=4.78ms   p(90)=3.85µs   p(95)=4.54µs   p(99.9)=37.38µs
     http_req_connecting............: avg=746ns   min=0s      med=0s      max=4.72ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.16ms min=2.15ms  med=40.6ms  max=330.29ms p(90)=57.68ms  p(95)=62.85ms  p(99.9)=89.48ms
       { expected_response:true }...: avg=41.16ms min=2.15ms  med=40.6ms  max=330.29ms p(90)=57.68ms  p(95)=62.85ms  p(99.9)=89.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144971
     http_req_receiving.............: avg=83.44µs min=28.42µs med=65.25µs max=55.51ms  p(90)=104.62µs p(95)=124.07µs p(99.9)=1.87ms 
     http_req_sending...............: avg=29.9µs  min=5.36µs  med=11.11µs max=130ms    p(90)=18.23µs  p(95)=22.09µs  p(99.9)=1.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.05ms min=2.09ms  med=40.49ms max=328.74ms p(90)=57.55ms  p(95)=62.74ms  p(99.9)=88.82ms
     http_reqs......................: 144971  1205.262041/s
     iteration_duration.............: avg=41.4ms  min=4.33ms  med=40.81ms max=348.26ms p(90)=57.89ms  p(95)=63.05ms  p(99.9)=89.76ms
     iterations.....................: 144871  1204.430659/s
     success_rate...................: 100.00% ✓ 144871      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 215064     ✗ 0    
     data_received..................: 6.3 GB  52 MB/s
     data_sent......................: 86 MB   715 kB/s
     http_req_blocked...............: avg=4.59µs  min=1.12µs  med=3.19µs  max=3.77ms   p(90)=4.85µs   p(95)=5.51µs   p(99.9)=51.09µs 
     http_req_connecting............: avg=1.14µs  min=0s      med=0s      max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=83.34ms min=3.95ms  med=80.59ms max=363.05ms p(90)=101.92ms p(95)=112.52ms p(99.9)=211.67ms
       { expected_response:true }...: avg=83.34ms min=3.95ms  med=80.59ms max=363.05ms p(90)=101.92ms p(95)=112.52ms p(99.9)=211.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 71788
     http_req_receiving.............: avg=91.61µs min=31.34µs med=80.78µs max=191.89ms p(90)=115.26µs p(95)=128.95µs p(99.9)=983.16µs
     http_req_sending...............: avg=30.73µs min=5.55µs  med=14.35µs max=212.16ms p(90)=21.17µs  p(95)=23.42µs  p(99.9)=898.28µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=83.22ms min=3.83ms  med=80.47ms max=361.89ms p(90)=101.8ms  p(95)=112.41ms p(99.9)=211.11ms
     http_reqs......................: 71788   595.638049/s
     iteration_duration.............: avg=83.7ms  min=29.26ms med=80.83ms max=379.03ms p(90)=102.16ms p(95)=112.82ms p(99.9)=214.27ms
     iterations.....................: 71688   594.808331/s
     success_rate...................: 100.00% ✓ 71688      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 143238     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 57 MB   476 kB/s
     http_req_blocked...............: avg=8.89µs   min=1.29µs  med=3.47µs   max=9.62ms   p(90)=5.04µs   p(95)=5.6µs    p(99.9)=466.33µs
     http_req_connecting............: avg=5.04µs   min=0s      med=0s       max=9.56ms   p(90)=0s       p(95)=0s       p(99.9)=302.82µs
     http_req_duration..............: avg=125.16ms min=6.21ms  med=122.95ms max=322.64ms p(90)=165.56ms p(95)=177.75ms p(99.9)=228.8ms 
       { expected_response:true }...: avg=125.16ms min=6.21ms  med=122.95ms max=322.64ms p(90)=165.56ms p(95)=177.75ms p(99.9)=228.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 47846
     http_req_receiving.............: avg=95.82µs  min=33.43µs med=87.25µs  max=100.88ms p(90)=119.7µs  p(95)=132.02µs p(99.9)=735.11µs
     http_req_sending...............: avg=31.63µs  min=6.05µs  med=17.31µs  max=91.31ms  p(90)=22.79µs  p(95)=24.66µs  p(99.9)=2.17ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.04ms min=6.09ms  med=122.83ms max=320.45ms p(90)=165.43ms p(95)=177.62ms p(99.9)=228.2ms 
     http_reqs......................: 47846   396.222373/s
     iteration_duration.............: avg=125.69ms min=19.72ms med=123.28ms max=337.66ms p(90)=165.86ms p(95)=178.06ms p(99.9)=230.74ms
     iterations.....................: 47746   395.394253/s
     success_rate...................: 100.00% ✓ 47746      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 98028      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   325 kB/s
     http_req_blocked...............: avg=7.01µs   min=1.29µs  med=3.68µs   max=4.09ms   p(90)=5.27µs   p(95)=5.86µs   p(99.9)=1.5ms   
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=182.86ms min=6ms     med=167.33ms max=620.74ms p(90)=212.45ms p(95)=264.15ms p(99.9)=542.09ms
       { expected_response:true }...: avg=182.86ms min=6ms     med=167.33ms max=620.74ms p(90)=212.45ms p(95)=264.15ms p(99.9)=542.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32776
     http_req_receiving.............: avg=110.03µs min=35.26µs med=97.77µs  max=153.49ms p(90)=130.18µs p(95)=143.96µs p(99.9)=630.18µs
     http_req_sending...............: avg=30.74µs  min=6.23µs  med=18.67µs  max=127.57ms p(90)=23.7µs   p(95)=25.43µs  p(99.9)=620.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.72ms min=5.9ms   med=167.2ms  max=620.61ms p(90)=212.34ms p(95)=263.78ms p(99.9)=541.97ms
     http_reqs......................: 32776   270.98603/s
     iteration_duration.............: avg=183.72ms min=56.31ms med=167.71ms max=621.02ms p(90)=212.84ms p(95)=267.77ms p(99.9)=542.4ms 
     iterations.....................: 32676   270.159248/s
     success_rate...................: 100.00% ✓ 32676      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 85800      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.18µs   min=1.31µs  med=3.41µs   max=4.3ms    p(90)=4.74µs   p(95)=5.28µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.61µs   min=0s      med=0s       max=4.26ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=208.9ms  min=8.57ms  med=206.34ms max=468.35ms p(90)=234.56ms p(95)=241.53ms p(99.9)=311.17ms
       { expected_response:true }...: avg=208.9ms  min=8.57ms  med=206.34ms max=468.35ms p(90)=234.56ms p(95)=241.53ms p(99.9)=311.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28700
     http_req_receiving.............: avg=110.99µs min=33.19µs med=92.69µs  max=167.94ms p(90)=125.48µs p(95)=138.6µs  p(99.9)=660.01µs
     http_req_sending...............: avg=32.15µs  min=6.03µs  med=17.45µs  max=112.52ms p(90)=22.14µs  p(95)=23.98µs  p(99.9)=778.32µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.75ms min=8.42ms  med=206.22ms max=467.4ms  p(90)=234.42ms p(95)=241.37ms p(99.9)=310.3ms 
     http_reqs......................: 28700   236.950721/s
     iteration_duration.............: avg=209.93ms min=60.04ms med=206.62ms max=480.82ms p(90)=234.84ms p(95)=241.86ms p(99.9)=344.19ms
     iterations.....................: 28600   236.125108/s
     success_rate...................: 100.00% ✓ 28600      ✗ 0    
     vus............................: 37      min=37       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

