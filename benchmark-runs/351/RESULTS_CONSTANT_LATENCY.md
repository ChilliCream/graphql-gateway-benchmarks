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
| fusion-nightly | 16.7.0-p.7 | 1,882 | 1,940 | 1,876 | 1.2% |  |
| fusion | 16.6.6 | 1,880 | 1,929 | 1,871 | 1.0% |  |
| fusion-nightly-net11 | 16.7.0-p.7 | 1,878 | 1,928 | 1,874 | 1.0% |  |
| hive-router | v0.0.84 | 1,853 | 1,921 | 1,841 | 1.5% |  |
| fusion-nightly-fed | 16.7.0-p.7 | 1,808 | 1,866 | 1,802 | 1.2% |  |
| grafbase | 0.53.5 | 1,317 | 1,333 | 1,311 | 0.6% |  |
| cosmo | 0.334.0 | 1,231 | 1,269 | 1,224 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 557 | 576 | 554 | 1.3% |  |
| apollo-router | v2.16.1 | 390 | 411 | 387 | 2.1% |  |
| hive-gateway | 2.10.8 | 263 | 270 | 263 | 1.0% |  |
| apollo-gateway | 2.14.3 | 259 | 261 | 255 | 1.0% |  |
| feddi | 5ff8b6165878 | 21 | 22 | 21 | 2.5% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688350      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.84µs  min=892ns   med=2µs     max=11.67ms  p(90)=3.39µs   p(95)=4.13µs  p(99.9)=28.94µs
     http_req_connecting............: avg=402ns   min=0s      med=0s      max=3.76ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.93ms min=17.54ms med=25.33ms max=303.62ms p(90)=30.31ms  p(95)=32.16ms p(99.9)=49.01ms
       { expected_response:true }...: avg=25.93ms min=17.54ms med=25.33ms max=303.62ms p(90)=30.31ms  p(95)=32.16ms p(99.9)=49.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229550
     http_req_receiving.............: avg=315.9µs min=51.69µs med=97.4µs  max=29.19ms  p(90)=806.04µs p(95)=1.26ms  p(99.9)=7.65ms 
     http_req_sending...............: avg=30.14µs min=4.13µs  med=8.39µs  max=161.52ms p(90)=17.14µs  p(95)=26.93µs p(99.9)=1.45ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.58ms min=16.94ms med=25ms    max=303.08ms p(90)=29.88ms  p(95)=31.71ms p(99.9)=47.92ms
     http_reqs......................: 229550  1882.546698/s
     iteration_duration.............: avg=26.14ms min=17.72ms med=25.53ms max=313.15ms p(90)=30.51ms  p(95)=32.37ms p(99.9)=49.37ms
     iterations.....................: 229450  1881.726595/s
     success_rate...................: 100.00% ✓ 229450      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687714      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.91µs   min=832ns   med=2.1µs   max=3.94ms   p(90)=3.82µs   p(95)=4.54µs  p(99.9)=30.51µs
     http_req_connecting............: avg=407ns    min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.95ms  min=17.1ms  med=25.38ms max=297.45ms p(90)=30.3ms   p(95)=32.04ms p(99.9)=48.1ms 
       { expected_response:true }...: avg=25.95ms  min=17.1ms  med=25.38ms max=297.45ms p(90)=30.3ms   p(95)=32.04ms p(99.9)=48.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 229338
     http_req_receiving.............: avg=312.37µs min=49.37µs med=93.48µs max=171.36ms p(90)=785.47µs p(95)=1.28ms  p(99.9)=7.68ms 
     http_req_sending...............: avg=31.98µs  min=4.55µs  med=8.65µs  max=162.49ms p(90)=18.43µs  p(95)=31.13µs p(99.9)=1.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.6ms   min=17.01ms med=25.06ms max=297.17ms p(90)=29.91ms  p(95)=31.6ms  p(99.9)=45.71ms
     http_reqs......................: 229338  1880.647867/s
     iteration_duration.............: avg=26.16ms  min=17.27ms med=25.58ms max=313.35ms p(90)=30.5ms   p(95)=32.25ms p(99.9)=48.45ms
     iterations.....................: 229238  1879.827834/s
     success_rate...................: 100.00% ✓ 229238      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686790      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.22µs   min=952ns   med=2.58µs  max=7.86ms   p(90)=4.27µs  p(95)=5.03µs  p(99.9)=38.27µs
     http_req_connecting............: avg=194ns    min=0s      med=0s      max=2.16ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.97ms  min=16.79ms med=25.38ms max=305.75ms p(90)=30.22ms p(95)=32.07ms p(99.9)=50.84ms
       { expected_response:true }...: avg=25.97ms  min=16.79ms med=25.38ms max=305.75ms p(90)=30.22ms p(95)=32.07ms p(99.9)=50.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229030
     http_req_receiving.............: avg=409.58µs min=51.25µs med=96.03µs max=118.55ms p(90)=1.15ms  p(95)=1.92ms  p(99.9)=12.87ms
     http_req_sending...............: avg=36.09µs  min=4.76µs  med=9.83µs  max=160.52ms p(90)=19.77µs p(95)=55.98µs p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.52ms  min=16.69ms med=24.96ms max=305.62ms p(90)=29.6ms  p(95)=31.4ms  p(99.9)=48.77ms
     http_reqs......................: 229030  1878.571264/s
     iteration_duration.............: avg=26.19ms  min=17.05ms med=25.59ms max=313.44ms p(90)=30.44ms p(95)=32.28ms p(99.9)=51.24ms
     iterations.....................: 228930  1877.751035/s
     success_rate...................: 100.00% ✓ 228930      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.84)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 677772      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.13µs  min=871ns   med=2.27µs  max=4.27ms   p(90)=4.01µs  p(95)=4.75µs   p(99.9)=34.83µs
     http_req_connecting............: avg=473ns   min=0s      med=0s      max=4.22ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.33ms min=18.35ms med=25.88ms max=299.54ms p(90)=30.05ms p(95)=31.47ms  p(99.9)=48.53ms
       { expected_response:true }...: avg=26.33ms min=18.35ms med=25.88ms max=299.54ms p(90)=30.05ms p(95)=31.47ms  p(99.9)=48.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226024
     http_req_receiving.............: avg=74.38µs min=25.71µs med=51.33µs max=23.1ms   p(90)=94.58µs p(95)=120.52µs p(99.9)=2.02ms 
     http_req_sending...............: avg=30.68µs min=4.8µs   med=9.65µs  max=186.48ms p(90)=18.45µs p(95)=25.7µs   p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.22ms min=18.3ms  med=25.79ms max=298.88ms p(90)=29.94ms p(95)=31.35ms  p(99.9)=47.15ms
     http_reqs......................: 226024  1853.442999/s
     iteration_duration.............: avg=26.54ms min=18.52ms med=26.08ms max=316.9ms  p(90)=30.25ms p(95)=31.67ms  p(99.9)=48.83ms
     iterations.....................: 225924  1852.622978/s
     success_rate...................: 100.00% ✓ 225924      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 661374      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=3.01µs   min=882ns   med=2µs     max=33.66ms  p(90)=3.66µs   p(95)=4.38µs  p(99.9)=31.87µs
     http_req_connecting............: avg=595ns    min=0s      med=0s      max=33.59ms  p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.99ms  min=17.29ms med=26.41ms max=296.43ms p(90)=31.53ms  p(95)=33.41ms p(99.9)=50.48ms
       { expected_response:true }...: avg=26.99ms  min=17.29ms med=26.41ms max=296.43ms p(90)=31.53ms  p(95)=33.41ms p(99.9)=50.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220558
     http_req_receiving.............: avg=296.42µs min=50.82µs med=94.13µs max=250.69ms p(90)=726.36µs p(95)=1.22ms  p(99.9)=7.25ms 
     http_req_sending...............: avg=31.14µs  min=4.74µs  med=8.59µs  max=118.34ms p(90)=19.22µs  p(95)=31.09µs p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.66ms  min=17.15ms med=26.11ms max=295.8ms  p(90)=31.14ms  p(95)=32.98ms p(99.9)=48.71ms
     http_reqs......................: 220558  1808.046855/s
     iteration_duration.............: avg=27.2ms   min=17.51ms med=26.62ms max=313.15ms p(90)=31.73ms  p(95)=33.61ms p(99.9)=50.95ms
     iterations.....................: 220458  1807.227094/s
     success_rate...................: 100.00% ✓ 220458      ✗ 0     
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

     checks.........................: 100.00% ✓ 481857      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 193 MB  1.6 MB/s
     http_req_blocked...............: avg=3.34µs  min=822ns   med=2.2µs   max=3.48ms   p(90)=4.64µs   p(95)=5.6µs    p(99.9)=42.92µs
     http_req_connecting............: avg=537ns   min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.08ms min=18.11ms med=36.79ms max=325.88ms p(90)=43.49ms  p(95)=45.52ms  p(99.9)=60.86ms
       { expected_response:true }...: avg=37.08ms min=18.11ms med=36.79ms max=325.88ms p(90)=43.49ms  p(95)=45.52ms  p(99.9)=60.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 160719
     http_req_receiving.............: avg=83.91µs min=27.33µs med=55.07µs max=130.6ms  p(90)=122.28µs p(95)=163.98µs p(99.9)=1.79ms 
     http_req_sending...............: avg=33.58µs min=4.26µs  med=9.25µs  max=153.71ms p(90)=24.1µs   p(95)=36.46µs  p(99.9)=1.74ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.97ms min=18ms    med=36.68ms max=325.1ms  p(90)=43.37ms  p(95)=45.39ms  p(99.9)=59.32ms
     http_reqs......................: 160719  1317.478015/s
     iteration_duration.............: avg=37.34ms min=21.63ms med=37.02ms max=335.61ms p(90)=43.7ms   p(95)=45.74ms  p(99.9)=61.57ms
     iterations.....................: 160619  1316.658275/s
     success_rate...................: 100.00% ✓ 160619      ✗ 0     
     vus............................: 2       min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.334.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 450213      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.39µs  min=972ns   med=2.38µs  max=3.51ms   p(90)=4.07µs   p(95)=4.77µs   p(99.9)=32.75µs
     http_req_connecting............: avg=651ns   min=0s      med=0s      max=3.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.74ms min=18.35ms med=39.15ms max=307.69ms p(90)=47.68ms  p(95)=50.35ms  p(99.9)=64.16ms
       { expected_response:true }...: avg=39.74ms min=18.35ms med=39.15ms max=307.69ms p(90)=47.68ms  p(95)=50.35ms  p(99.9)=64.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150171
     http_req_receiving.............: avg=95.4µs  min=24.75µs med=63.13µs max=258.77ms p(90)=106.41µs p(95)=123.99µs p(99.9)=1.02ms 
     http_req_sending...............: avg=25.38µs min=4.84µs  med=11.41µs max=180.63ms p(90)=19.41µs  p(95)=23.11µs  p(99.9)=1.01ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.62ms min=18.22ms med=39.06ms max=159.04ms p(90)=47.58ms  p(95)=50.24ms  p(99.9)=63.8ms 
     http_reqs......................: 150171  1231.102602/s
     iteration_duration.............: avg=39.97ms min=20.12ms med=39.36ms max=344.61ms p(90)=47.89ms  p(95)=50.56ms  p(99.9)=64.39ms
     iterations.....................: 150071  1230.282801/s
     success_rate...................: 100.00% ✓ 150071      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 204096     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   669 kB/s
     http_req_blocked...............: avg=5.2µs   min=1.26µs  med=3.47µs  max=4.28ms   p(90)=5.1µs    p(95)=5.82µs   p(99.9)=47.81µs 
     http_req_connecting............: avg=1.44µs  min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.85ms min=21.05ms med=86.66ms max=328.92ms p(90)=105.2ms  p(95)=114.57ms p(99.9)=201.42ms
       { expected_response:true }...: avg=87.85ms min=21.05ms med=86.66ms max=328.92ms p(90)=105.2ms  p(95)=114.57ms p(99.9)=201.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68132
     http_req_receiving.............: avg=93.69µs min=29.52µs med=78.99µs max=176.11ms p(90)=116.06µs p(95)=130.16µs p(99.9)=727.87µs
     http_req_sending...............: avg=26.98µs min=5.75µs  med=16.11µs max=132.7ms  p(90)=22.7µs   p(95)=25.09µs  p(99.9)=647.79µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.73ms min=20.89ms med=86.55ms max=328.7ms  p(90)=105.08ms p(95)=114.42ms p(99.9)=200.75ms
     http_reqs......................: 68132   557.170898/s
     iteration_duration.............: avg=88.2ms  min=28.28ms med=86.92ms max=340.13ms p(90)=105.45ms p(95)=114.88ms p(99.9)=202.57ms
     iterations.....................: 68032   556.353116/s
     success_rate...................: 100.00% ✓ 68032      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 143064     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 57 MB   469 kB/s
     http_req_blocked...............: avg=5.2µs    min=1.06µs  med=3.02µs   max=3.46ms   p(90)=4.44µs   p(95)=4.99µs   p(99.9)=428.98µs
     http_req_connecting............: avg=1.95µs   min=0s      med=0s       max=3.41ms   p(90)=0s       p(95)=0s       p(99.9)=262.57µs
     http_req_duration..............: avg=125.36ms min=20.86ms med=123.24ms max=352.17ms p(90)=157.1ms  p(95)=167.54ms p(99.9)=214.39ms
       { expected_response:true }...: avg=125.36ms min=20.86ms med=123.24ms max=352.17ms p(90)=157.1ms  p(95)=167.54ms p(99.9)=214.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 47788
     http_req_receiving.............: avg=87.56µs  min=30.27µs med=80.71µs  max=80.75ms  p(90)=112.97µs p(95)=125.05µs p(99.9)=464.66µs
     http_req_sending...............: avg=23.37µs  min=4.59µs  med=16.38µs  max=74.56ms  p(90)=21.95µs  p(95)=23.88µs  p(99.9)=451.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=125.25ms min=20.73ms med=123.13ms max=351.7ms  p(90)=156.98ms p(95)=167.42ms p(99.9)=214.19ms
     http_reqs......................: 47788   390.578177/s
     iteration_duration.............: avg=125.85ms min=31.64ms med=123.55ms max=362.27ms p(90)=157.4ms  p(95)=167.85ms p(99.9)=217.23ms
     iterations.....................: 47688   389.760863/s
     success_rate...................: 100.00% ✓ 47688      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.8)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96291      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=7.34µs   min=1.65µs  med=3.88µs   max=3.75ms   p(90)=5.5µs    p(95)=6.16µs   p(99.9)=1.78ms  
     http_req_connecting............: avg=3.12µs   min=0s      med=0s       max=3.69ms   p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=186.21ms min=17.8ms  med=174.9ms  max=615.83ms p(90)=219.51ms p(95)=252.18ms p(99.9)=552.74ms
       { expected_response:true }...: avg=186.21ms min=17.8ms  med=174.9ms  max=615.83ms p(90)=219.51ms p(95)=252.18ms p(99.9)=552.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32197
     http_req_receiving.............: avg=99.15µs  min=34.54µs med=93.53µs  max=11.74ms  p(90)=126.5µs  p(95)=140.34µs p(99.9)=737.23µs
     http_req_sending...............: avg=25.37µs  min=6.44µs  med=19.04µs  max=32.81ms  p(90)=24.25µs  p(95)=26.31µs  p(99.9)=521.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=186.08ms min=17.59ms med=174.77ms max=615.66ms p(90)=219.38ms p(95)=252.06ms p(99.9)=552.65ms
     http_reqs......................: 32197   263.773679/s
     iteration_duration.............: avg=187.02ms min=30.06ms med=175.28ms max=616.16ms p(90)=219.85ms p(95)=252.74ms p(99.9)=552.95ms
     iterations.....................: 32097   262.95443/s
     success_rate...................: 100.00% ✓ 32097      ✗ 0    
     vus............................: 30      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95163      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.95µs   min=1.12µs  med=3.34µs   max=4.11ms   p(90)=4.68µs   p(95)=5.25µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=188.43ms min=23.39ms med=197.58ms max=381.85ms p(90)=216.88ms p(95)=222.05ms p(99.9)=299.11ms
       { expected_response:true }...: avg=188.43ms min=23.39ms med=197.58ms max=381.85ms p(90)=216.88ms p(95)=222.05ms p(99.9)=299.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31821
     http_req_receiving.............: avg=97.78µs  min=29.95µs med=89.39µs  max=168.66ms p(90)=119.98µs p(95)=132.14µs p(99.9)=507.6µs 
     http_req_sending...............: avg=47.05µs  min=5.61µs  med=17.76µs  max=144.61ms p(90)=22.34µs  p(95)=24.2µs   p(99.9)=613.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.28ms min=23.24ms med=197.45ms max=381.38ms p(90)=216.75ms p(95)=221.92ms p(99.9)=298.73ms
     http_reqs......................: 31821   259.446988/s
     iteration_duration.............: avg=189.25ms min=60.76ms med=198.11ms max=390.36ms p(90)=217.17ms p(95)=222.35ms p(99.9)=300.6ms 
     iterations.....................: 31721   258.631656/s
     success_rate...................: 100.00% ✓ 31721      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7929      ✗ 0   
     data_received..................: 263 MB  2.1 MB/s
     data_sent......................: 3.3 MB  26 kB/s
     http_req_blocked...............: avg=74.97µs  min=1.7µs    med=4.06µs  max=9.6ms   p(90)=5.64µs   p(95)=6.45µs   p(99.9)=8.1ms   
     http_req_connecting............: avg=68.97µs  min=0s       med=0s      max=9.55ms  p(90)=0s       p(95)=0s       p(99.9)=8.07ms  
     http_req_duration..............: avg=2.2s     min=38.15ms  med=2.23s   max=4.51s   p(90)=2.91s    p(95)=3.14s    p(99.9)=4.35s   
       { expected_response:true }...: avg=2.2s     min=38.15ms  med=2.23s   max=4.51s   p(90)=2.91s    p(95)=3.14s    p(99.9)=4.35s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2743
     http_req_receiving.............: avg=106.68µs min=35.86µs  med=98.97µs max=1.61ms  p(90)=145.53µs p(95)=164.97µs p(99.9)=958.09µs
     http_req_sending...............: avg=136.83µs min=7µs      med=20.61µs max=70.27ms p(90)=26.12µs  p(95)=30.13µs  p(99.9)=18.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.2s     min=38.06ms  med=2.23s   max=4.51s   p(90)=2.91s    p(95)=3.14s    p(99.9)=4.33s   
     http_reqs......................: 2743    21.71696/s
     iteration_duration.............: avg=2.28s    min=684.52ms med=2.26s   max=4.51s   p(90)=2.93s    p(95)=3.16s    p(99.9)=4.35s   
     iterations.....................: 2643    20.925237/s
     success_rate...................: 100.00% ✓ 2643      ✗ 0   
     vus............................: 28      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

