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
| hive-router | v0.0.65 | 1,592 | 1,616 | 1,579 | 0.7% |  |
| fusion-nightly | 16.2.0-p.1 | 1,448 | 1,460 | 1,429 | 0.8% |  |
| fusion | 16.1.4 | 1,442 | 1,468 | 1,436 | 0.7% |  |
| cosmo | 0.321.1 | 1,140 | 1,140 | 1,131 | 0.6% | non-compatible response (7 across 7/9 runs) |
| grafbase | 0.53.5 | 1,132 | 1,143 | 1,117 | 0.7% |  |
| hive-gateway-router-runtime | 2.8.2 | 524 | 534 | 499 | 1.9% |  |
| apollo-router | v2.15.0 | 372 | 383 | 367 | 1.4% |  |
| hive-gateway | 2.8.2 | 239 | 242 | 236 | 0.8% |  |
| apollo-gateway | 2.14.1 | 237 | 239 | 236 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 582504      ✗ 0     
     data_received..................: 17 GB   139 MB/s
     data_sent......................: 233 MB  1.9 MB/s
     http_req_blocked...............: avg=3.08µs  min=992ns   med=2.09µs  max=20.18ms  p(90)=3.85µs  p(95)=4.77µs   p(99.9)=33.2µs 
     http_req_connecting............: avg=390ns   min=0s      med=0s      max=3.61ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=30.65ms min=13.05ms med=30.41ms max=334.71ms p(90)=36.33ms p(95)=38.26ms  p(99.9)=56.94ms
       { expected_response:true }...: avg=30.65ms min=13.05ms med=30.41ms max=334.71ms p(90)=36.33ms p(95)=38.26ms  p(99.9)=56.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 194268
     http_req_receiving.............: avg=88.07µs min=27.19µs med=51.63µs max=255.96ms p(90)=103.3µs p(95)=151.39µs p(99.9)=2.44ms 
     http_req_sending...............: avg=35.12µs min=5.01µs  med=9.24µs  max=138.61ms p(90)=19.86µs p(95)=60.2µs   p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=30.53ms min=12.99ms med=30.31ms max=333.68ms p(90)=36.21ms p(95)=38.11ms  p(99.9)=55.72ms
     http_reqs......................: 194268  1592.37175/s
     iteration_duration.............: avg=30.89ms min=13.33ms med=30.63ms max=344.61ms p(90)=36.55ms p(95)=38.48ms  p(99.9)=57.3ms 
     iterations.....................: 194168  1591.552072/s
     success_rate...................: 100.00% ✓ 194168      ✗ 0     
     vus............................: 24      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.2.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 529950      ✗ 0     
     data_received..................: 16 GB   127 MB/s
     data_sent......................: 212 MB  1.7 MB/s
     http_req_blocked...............: avg=3.12µs   min=982ns   med=2.07µs   max=4.33ms   p(90)=3.89µs  p(95)=4.78µs  p(99.9)=31.07µs
     http_req_connecting............: avg=572ns    min=0s      med=0s       max=4.29ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=33.71ms  min=14.74ms med=32.91ms  max=318.26ms p(90)=41.36ms p(95)=44.2ms  p(99.9)=93.54ms
       { expected_response:true }...: avg=33.71ms  min=14.74ms med=32.91ms  max=318.26ms p(90)=41.36ms p(95)=44.2ms  p(99.9)=93.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 176750
     http_req_receiving.............: avg=782.66µs min=51.08µs med=113.55µs max=212.07ms p(90)=2.19ms  p(95)=3.28ms  p(99.9)=18.27ms
     http_req_sending...............: avg=35.66µs  min=5.17µs  med=9.02µs   max=242.34ms p(90)=20.06µs p(95)=83.89µs p(99.9)=1.99ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=32.89ms  min=14.59ms med=32.13ms  max=173.09ms p(90)=40.31ms p(95)=43.08ms p(99.9)=92.47ms
     http_reqs......................: 176750  1448.672979/s
     iteration_duration.............: avg=33.95ms  min=15ms    med=33.13ms  max=360.75ms p(90)=41.58ms p(95)=44.42ms p(99.9)=94.21ms
     iterations.....................: 176650  1447.853362/s
     success_rate...................: 100.00% ✓ 176650      ✗ 0     
     vus............................: 43      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 527448      ✗ 0     
     data_received..................: 15 GB   126 MB/s
     data_sent......................: 211 MB  1.7 MB/s
     http_req_blocked...............: avg=3.01µs   min=1µs     med=1.99µs   max=4.08ms   p(90)=3.59µs  p(95)=4.48µs  p(99.9)=26.99µs
     http_req_connecting............: avg=563ns    min=0s      med=0s       max=4.03ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=33.87ms  min=13.51ms med=32.67ms  max=479.98ms p(90)=41.59ms p(95)=45.16ms p(99.9)=87.57ms
       { expected_response:true }...: avg=33.87ms  min=13.51ms med=32.67ms  max=479.98ms p(90)=41.59ms p(95)=45.16ms p(99.9)=87.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 175916
     http_req_receiving.............: avg=831.43µs min=50.84µs med=113.28µs max=207.65ms p(90)=2.39ms  p(95)=3.61ms  p(99.9)=15.8ms 
     http_req_sending...............: avg=37.01µs  min=4.98µs  med=8.77µs   max=160.54ms p(90)=19.28µs p(95)=99.76µs p(99.9)=2.34ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=33ms     min=13.17ms med=31.84ms  max=479.89ms p(90)=40.44ms p(95)=43.89ms p(99.9)=85.97ms
     http_reqs......................: 175916  1442.041173/s
     iteration_duration.............: avg=34.12ms  min=13.83ms med=32.89ms  max=480.16ms p(90)=41.81ms p(95)=45.38ms p(99.9)=88.8ms 
     iterations.....................: 175816  1441.221441/s
     success_rate...................: 100.00% ✓ 175816      ✗ 0     
     vus............................: 15      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 417255      ✗ 0     
     data_received..................: 12 GB   100 MB/s
     data_sent......................: 167 MB  1.4 MB/s
     http_req_blocked...............: avg=3.38µs  min=1.03µs  med=2.27µs  max=4.14ms   p(90)=3.84µs   p(95)=4.57µs   p(99.9)=34.17µs
     http_req_connecting............: avg=699ns   min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.9ms  min=19ms    med=42.31ms max=338.8ms  p(90)=52.06ms  p(95)=55.13ms  p(99.9)=72.41ms
       { expected_response:true }...: avg=42.9ms  min=19ms    med=42.31ms max=338.8ms  p(90)=52.06ms  p(95)=55.13ms  p(99.9)=72.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139185
     http_req_receiving.............: avg=84.05µs min=27.49µs med=61.48µs max=287.01ms p(90)=104.07µs p(95)=127.92µs p(99.9)=1.71ms 
     http_req_sending...............: avg=26.08µs min=5.38µs  med=10.51µs max=198.42ms p(90)=18.15µs  p(95)=22.48µs  p(99.9)=1ms    
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.79ms min=18.91ms med=42.21ms max=334.04ms p(90)=51.95ms  p(95)=55.02ms  p(99.9)=71.89ms
     http_reqs......................: 139185  1140.742422/s
     iteration_duration.............: avg=43.13ms min=19.72ms med=42.51ms max=352.67ms p(90)=52.26ms  p(95)=55.33ms  p(99.9)=72.84ms
     iterations.....................: 139085  1139.922835/s
     success_rate...................: 100.00% ✓ 139085      ✗ 0     
     vus............................: 46      min=0         max=50  
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

     checks.........................: 100.00% ✓ 414360      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 166 MB  1.4 MB/s
     http_req_blocked...............: avg=3.65µs  min=992ns   med=2.23µs  max=8.33ms   p(90)=4.63µs   p(95)=5.79µs   p(99.9)=48.44µs
     http_req_connecting............: avg=726ns   min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.16ms min=17.76ms med=42.6ms  max=359.32ms p(90)=52.59ms  p(95)=56.04ms  p(99.9)=81.56ms
       { expected_response:true }...: avg=43.16ms min=17.76ms med=42.6ms  max=359.32ms p(90)=52.59ms  p(95)=56.04ms  p(99.9)=81.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 138220
     http_req_receiving.............: avg=96.94µs min=29.42µs med=60.29µs max=148.55ms p(90)=131.39µs p(95)=210.37µs p(99.9)=2.86ms 
     http_req_sending...............: avg=37.15µs min=5.25µs  med=9.87µs  max=86.91ms  p(90)=24.05µs  p(95)=111.06µs p(99.9)=2.16ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.02ms min=17.6ms  med=42.47ms max=346.3ms  p(90)=52.46ms  p(95)=55.86ms  p(99.9)=81.21ms
     http_reqs......................: 138220  1132.750614/s
     iteration_duration.............: avg=43.43ms min=19.34ms med=42.84ms max=367.44ms p(90)=52.83ms  p(95)=56.27ms  p(99.9)=82.08ms
     iterations.....................: 138120  1131.931087/s
     success_rate...................: 100.00% ✓ 138120      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
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

     checks.........................: 100.00% ✓ 192534     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 77 MB   630 kB/s
     http_req_blocked...............: avg=5µs     min=1.17µs  med=3.31µs  max=4.14ms   p(90)=5µs      p(95)=5.69µs   p(99.9)=53.07µs 
     http_req_connecting............: avg=1.44µs  min=0s      med=0s      max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.13ms min=19.04ms med=83.44ms max=370.86ms p(90)=142.8ms  p(95)=155.17ms p(99.9)=266.92ms
       { expected_response:true }...: avg=93.13ms min=19.04ms med=83.44ms max=370.86ms p(90)=142.8ms  p(95)=155.17ms p(99.9)=266.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64278
     http_req_receiving.............: avg=93.34µs min=32.26µs med=80.76µs max=274.94ms p(90)=117.76µs p(95)=132.52µs p(99.9)=911.48µs
     http_req_sending...............: avg=34.49µs min=5.96µs  med=14.91µs max=189.64ms p(90)=22.07µs  p(95)=24.76µs  p(99.9)=862.08µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93ms    min=18.87ms med=83.33ms max=361.52ms p(90)=142.67ms p(95)=155ms    p(99.9)=266.19ms
     http_reqs......................: 64278   524.817951/s
     iteration_duration.............: avg=93.5ms  min=36.73ms med=83.7ms  max=386.71ms p(90)=143.07ms p(95)=155.46ms p(99.9)=271.83ms
     iterations.....................: 64178   524.00147/s
     success_rate...................: 100.00% ✓ 64178      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 136632     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   448 kB/s
     http_req_blocked...............: avg=5.64µs   min=1.19µs  med=3.09µs   max=7.03ms   p(90)=4.61µs   p(95)=5.21µs   p(99.9)=449.63µs
     http_req_connecting............: avg=2.2µs    min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=311.36µs
     http_req_duration..............: avg=131.27ms min=21.98ms med=129.28ms max=365.02ms p(90)=164.28ms p(95)=174.77ms p(99.9)=223.34ms
       { expected_response:true }...: avg=131.27ms min=21.98ms med=129.28ms max=365.02ms p(90)=164.28ms p(95)=174.77ms p(99.9)=223.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45644
     http_req_receiving.............: avg=87.28µs  min=32.32µs med=80.82µs  max=30.06ms  p(90)=114.77µs p(95)=126.75µs p(99.9)=683.87µs
     http_req_sending...............: avg=22.64µs  min=5.81µs  med=15.19µs  max=81.88ms  p(90)=21.41µs  p(95)=23.52µs  p(99.9)=556.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=131.16ms min=21.88ms med=129.17ms max=364.44ms p(90)=164.18ms p(95)=174.64ms p(99.9)=223.21ms
     http_reqs......................: 45644   372.720192/s
     iteration_duration.............: avg=131.77ms min=52.31ms med=129.57ms max=382.63ms p(90)=164.56ms p(95)=175.06ms p(99.9)=230.28ms
     iterations.....................: 45544   371.903611/s
     success_rate...................: 100.00% ✓ 45544      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 87765      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.33µs   min=1.27µs  med=3.59µs   max=3.87ms   p(90)=5.14µs   p(95)=5.77µs   p(99.9)=1.81ms  
     http_req_connecting............: avg=3.51µs   min=0s      med=0s       max=3.85ms   p(90)=0s       p(95)=0s       p(99.9)=1.79ms  
     http_req_duration..............: avg=204.26ms min=18.85ms med=194.81ms max=700.39ms p(90)=260.92ms p(95)=300.03ms p(99.9)=641.67ms
       { expected_response:true }...: avg=204.26ms min=18.85ms med=194.81ms max=700.39ms p(90)=260.92ms p(95)=300.03ms p(99.9)=641.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29355
     http_req_receiving.............: avg=107.66µs min=36.35µs med=96.6µs   max=73.49ms  p(90)=130.47µs p(95)=144.65µs p(99.9)=722.36µs
     http_req_sending...............: avg=26.96µs  min=6.54µs  med=18.35µs  max=49.85ms  p(90)=23.67µs  p(95)=25.6µs   p(99.9)=588.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.12ms min=18.69ms med=194.67ms max=700.29ms p(90)=260.78ms p(95)=299.9ms  p(99.9)=641.56ms
     http_reqs......................: 29355   239.837806/s
     iteration_duration.............: avg=205.21ms min=60.45ms med=195.28ms max=700.64ms p(90)=261.41ms p(95)=302.1ms  p(99.9)=641.9ms 
     iterations.....................: 29255   239.02078/s
     success_rate...................: 100.00% ✓ 29255      ✗ 0    
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

     checks.........................: 100.00% ✓ 87288      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   285 kB/s
     http_req_blocked...............: avg=7.26µs   min=1.19µs  med=3.53µs   max=4ms      p(90)=5µs      p(95)=5.62µs   p(99.9)=1.82ms  
     http_req_connecting............: avg=3.5µs    min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=205.45ms min=21.06ms med=205.39ms max=449.47ms p(90)=233.09ms p(95)=238.68ms p(99.9)=319.14ms
       { expected_response:true }...: avg=205.45ms min=21.06ms med=205.39ms max=449.47ms p(90)=233.09ms p(95)=238.68ms p(99.9)=319.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29196
     http_req_receiving.............: avg=133.93µs min=35.13µs med=93.63µs  max=140.73ms p(90)=128.12µs p(95)=141.48µs p(99.9)=1.09ms  
     http_req_sending...............: avg=35.25µs  min=6.09µs  med=17.92µs  max=92.07ms  p(90)=23.45µs  p(95)=25.44µs  p(99.9)=686.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.28ms min=20.9ms  med=205.22ms max=448.77ms p(90)=232.96ms p(95)=238.51ms p(99.9)=318.68ms
     http_reqs......................: 29196   237.669637/s
     iteration_duration.............: avg=206.38ms min=61.78ms med=205.9ms  max=456.98ms p(90)=233.4ms  p(95)=238.99ms p(99.9)=322.51ms
     iterations.....................: 29096   236.855588/s
     success_rate...................: 100.00% ✓ 29096      ✗ 0    
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

