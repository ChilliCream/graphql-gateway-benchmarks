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
| fusion | 16.6.0 | 1,876 | 1,928 | 1,871 | 1.0% |  |
| hive-router | v0.0.84 | 1,822 | 1,900 | 1,813 | 1.7% |  |
| grafbase | 0.53.5 | 1,281 | 1,309 | 1,268 | 1.1% |  |
| cosmo | 0.334.0 | 1,212 | 1,246 | 1,201 | 1.1% |  |
| hive-gateway-router-runtime | 2.10.8 | 554 | 574 | 546 | 1.8% |  |
| apollo-router | v2.16.1 | 400 | 414 | 392 | 1.9% |  |
| apollo-gateway | 2.14.3 | 259 | 264 | 259 | 0.6% |  |
| hive-gateway | 2.10.8 | 253 | 262 | 252 | 1.3% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 22 | 2.0% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686064      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.82µs   min=892ns   med=1.97µs  max=8.64ms   p(90)=3.56µs   p(95)=4.28µs  p(99.9)=29.59µs
     http_req_connecting............: avg=383ns    min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.01ms  min=17.18ms med=25.44ms max=292.74ms p(90)=30.38ms  p(95)=32.2ms  p(99.9)=48.2ms 
       { expected_response:true }...: avg=26.01ms  min=17.18ms med=25.44ms max=292.74ms p(90)=30.38ms  p(95)=32.2ms  p(99.9)=48.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 228788
     http_req_receiving.............: avg=322.93µs min=49.39µs med=95.42µs max=221.51ms p(90)=831.16µs p(95)=1.32ms  p(99.9)=7.67ms 
     http_req_sending...............: avg=29.98µs  min=4.53µs  med=8.27µs  max=132.16ms p(90)=17.8µs   p(95)=31.57µs p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.66ms  min=17.09ms med=25.11ms max=292.02ms p(90)=29.97ms  p(95)=31.73ms p(99.9)=46.85ms
     http_reqs......................: 228788  1876.333164/s
     iteration_duration.............: avg=26.22ms  min=17.33ms med=25.64ms max=309.86ms p(90)=30.58ms  p(95)=32.4ms  p(99.9)=48.48ms
     iterations.....................: 228688  1875.513045/s
     success_rate...................: 100.00% ✓ 228688      ✗ 0     
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

     checks.........................: 100.00% ✓ 666276      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 267 MB  2.2 MB/s
     http_req_blocked...............: avg=2.92µs  min=911ns   med=2.14µs  max=5.47ms   p(90)=3.78µs  p(95)=4.51µs   p(99.9)=31.78µs
     http_req_connecting............: avg=376ns   min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.79ms min=17.4ms  med=26.37ms max=299.02ms p(90)=30.56ms p(95)=31.98ms  p(99.9)=47.71ms
       { expected_response:true }...: avg=26.79ms min=17.4ms  med=26.37ms max=299.02ms p(90)=30.56ms p(95)=31.98ms  p(99.9)=47.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222192
     http_req_receiving.............: avg=73.41µs min=26.11µs med=50.95µs max=100ms    p(90)=90.97µs p(95)=113.29µs p(99.9)=2.12ms 
     http_req_sending...............: avg=30.08µs min=4.73µs  med=9.2µs   max=226.88ms p(90)=17.1µs  p(95)=23.29µs  p(99.9)=1.36ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.69ms min=17.25ms med=26.28ms max=298.46ms p(90)=30.46ms p(95)=31.86ms  p(99.9)=45.82ms
     http_reqs......................: 222192  1822.03261/s
     iteration_duration.............: avg=27ms    min=18.5ms  med=26.57ms max=312.12ms p(90)=30.76ms p(95)=32.18ms  p(99.9)=48.09ms
     iterations.....................: 222092  1821.212584/s
     success_rate...................: 100.00% ✓ 222092      ✗ 0     
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

     checks.........................: 100.00% ✓ 468786      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=3.06µs  min=841ns   med=2.12µs  max=4.74ms   p(90)=4.55µs   p(95)=5.52µs   p(99.9)=38.88µs
     http_req_connecting............: avg=304ns   min=0s      med=0s      max=2.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.13ms min=18.53ms med=37.89ms max=312.99ms p(90)=44.88ms  p(95)=46.93ms  p(99.9)=62.66ms
       { expected_response:true }...: avg=38.13ms min=18.53ms med=37.89ms max=312.99ms p(90)=44.88ms  p(95)=46.93ms  p(99.9)=62.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156362
     http_req_receiving.............: avg=83.02µs min=27.58µs med=54.87µs max=23.92ms  p(90)=122.84µs p(95)=167.32µs p(99.9)=1.9ms  
     http_req_sending...............: avg=32.33µs min=4.32µs  med=9.08µs  max=108.35ms p(90)=23.16µs  p(95)=36.2µs   p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.02ms min=18.36ms med=37.78ms max=312.43ms p(90)=44.76ms  p(95)=46.79ms  p(99.9)=61.61ms
     http_reqs......................: 156362  1281.783144/s
     iteration_duration.............: avg=38.38ms min=21.49ms med=38.12ms max=322.44ms p(90)=45.1ms   p(95)=47.14ms  p(99.9)=63.03ms
     iterations.....................: 156262  1280.96339/s
     success_rate...................: 100.00% ✓ 156262      ✗ 0     
     vus............................: 50      min=0         max=50  
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

     checks.........................: 100.00% ✓ 443310      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.3µs   min=942ns   med=2.4µs   max=3.34ms   p(90)=4.03µs   p(95)=4.74µs   p(99.9)=36.37µs 
     http_req_connecting............: avg=564ns   min=0s      med=0s      max=3.31ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=40.37ms min=18.75ms med=39.76ms max=313.06ms p(90)=48.57ms  p(95)=51.39ms  p(99.9)=66.05ms 
       { expected_response:true }...: avg=40.37ms min=18.75ms med=39.76ms max=313.06ms p(90)=48.57ms  p(95)=51.39ms  p(99.9)=66.05ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 147870
     http_req_receiving.............: avg=80.96µs min=24.67µs med=65.41µs max=137.73ms p(90)=107.35µs p(95)=125.22µs p(99.9)=909.14µs
     http_req_sending...............: avg=24.43µs min=4.8µs   med=11.09µs max=135.51ms p(90)=18.81µs  p(95)=22.41µs  p(99.9)=883.96µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=40.26ms min=18.64ms med=39.67ms max=304.19ms p(90)=48.47ms  p(95)=51.29ms  p(99.9)=65.66ms 
     http_reqs......................: 147870  1212.169085/s
     iteration_duration.............: avg=40.6ms  min=21.12ms med=39.97ms max=321.42ms p(90)=48.78ms  p(95)=51.6ms   p(99.9)=66.47ms 
     iterations.....................: 147770  1211.349332/s
     success_rate...................: 100.00% ✓ 147770      ✗ 0     
     vus............................: 5       min=0         max=50  
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

     checks.........................: 100.00% ✓ 202929     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   665 kB/s
     http_req_blocked...............: avg=4.58µs  min=1.05µs  med=2.82µs  max=3.64ms   p(90)=4.45µs   p(95)=5.1µs    p(99.9)=49.52µs 
     http_req_connecting............: avg=1.5µs   min=0s      med=0s      max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.37ms min=20.58ms med=86.1ms  max=329.78ms p(90)=123.38ms p(95)=133.85ms p(99.9)=224.49ms
       { expected_response:true }...: avg=88.37ms min=20.58ms med=86.1ms  max=329.78ms p(90)=123.38ms p(95)=133.85ms p(99.9)=224.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67743
     http_req_receiving.............: avg=86.25µs min=30.01µs med=74.64µs max=100.94ms p(90)=111.26µs p(95)=124.65µs p(99.9)=676.44µs
     http_req_sending...............: avg=22.62µs min=4.55µs  med=13.73µs max=113.35ms p(90)=20.51µs  p(95)=22.75µs  p(99.9)=580.89µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.26ms min=20.49ms med=86ms    max=329.23ms p(90)=123.28ms p(95)=133.75ms p(99.9)=223.99ms
     http_reqs......................: 67743   554.024824/s
     iteration_duration.............: avg=88.71ms min=34.88ms med=86.38ms max=338.09ms p(90)=123.63ms p(95)=134.1ms  p(99.9)=227.56ms
     iterations.....................: 67643   553.20699/s
     success_rate...................: 100.00% ✓ 67643      ✗ 0    
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

     checks.........................: 100.00% ✓ 146790     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   481 kB/s
     http_req_blocked...............: avg=5.13µs   min=1.08µs  med=3.2µs    max=3.4ms    p(90)=4.68µs   p(95)=5.24µs   p(99.9)=178.02µs
     http_req_connecting............: avg=1.71µs   min=0s      med=0s       max=3.36ms   p(90)=0s       p(95)=0s       p(99.9)=75.89µs 
     http_req_duration..............: avg=122.18ms min=21.9ms  med=120.13ms max=345.93ms p(90)=153.2ms  p(95)=163.76ms p(99.9)=210.62ms
       { expected_response:true }...: avg=122.18ms min=21.9ms  med=120.13ms max=345.93ms p(90)=153.2ms  p(95)=163.76ms p(99.9)=210.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49030
     http_req_receiving.............: avg=87.22µs  min=31.23µs med=84.37µs  max=14.69ms  p(90)=115.71µs p(95)=127.53µs p(99.9)=557.42µs
     http_req_sending...............: avg=27.73µs  min=4.83µs  med=16.61µs  max=121.64ms p(90)=22.22µs  p(95)=24.2µs   p(99.9)=522.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.06ms min=21.74ms med=120.02ms max=345.36ms p(90)=153.1ms  p(95)=163.65ms p(99.9)=210.49ms
     http_reqs......................: 49030   400.630655/s
     iteration_duration.............: avg=122.66ms min=39.33ms med=120.43ms max=353.58ms p(90)=153.52ms p(95)=164.06ms p(99.9)=214.71ms
     iterations.....................: 48930   399.813541/s
     success_rate...................: 100.00% ✓ 48930      ✗ 0    
     vus............................: 50      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95244      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=6.41µs   min=1.13µs  med=3.25µs   max=3.65ms   p(90)=4.64µs   p(95)=5.18µs   p(99.9)=1.46ms  
     http_req_connecting............: avg=2.91µs   min=0s      med=0s       max=3.61ms   p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=188.25ms min=23.37ms med=187.16ms max=398.04ms p(90)=200.38ms p(95)=205.61ms p(99.9)=269.74ms
       { expected_response:true }...: avg=188.25ms min=23.37ms med=187.16ms max=398.04ms p(90)=200.38ms p(95)=205.61ms p(99.9)=269.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31848
     http_req_receiving.............: avg=97.48µs  min=32.41µs med=89.4µs   max=122.52ms p(90)=120.54µs p(95)=133.28µs p(99.9)=586.43µs
     http_req_sending...............: avg=30.13µs  min=5.11µs  med=18µs     max=116.83ms p(90)=22.86µs  p(95)=24.72µs  p(99.9)=665.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.13ms min=23.26ms med=187.06ms max=397.17ms p(90)=200.27ms p(95)=205.48ms p(99.9)=269.5ms 
     http_reqs......................: 31848   259.65241/s
     iteration_duration.............: avg=189.09ms min=52.81ms med=187.47ms max=405.4ms  p(90)=200.66ms p(95)=205.95ms p(99.9)=274.34ms
     iterations.....................: 31748   258.837124/s
     success_rate...................: 100.00% ✓ 31748      ✗ 0    
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

     checks.........................: 100.00% ✓ 92535      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=6.3µs    min=1.08µs  med=3.08µs   max=3.96ms   p(90)=4.39µs   p(95)=4.95µs   p(99.9)=1.38ms  
     http_req_connecting............: avg=3.02µs   min=0s      med=0s       max=3.92ms   p(90)=0s       p(95)=0s       p(99.9)=1.36ms  
     http_req_duration..............: avg=193.78ms min=17.46ms med=182.9ms  max=593.09ms p(90)=226.23ms p(95)=259.81ms p(99.9)=559.65ms
       { expected_response:true }...: avg=193.78ms min=17.46ms med=182.9ms  max=593.09ms p(90)=226.23ms p(95)=259.81ms p(99.9)=559.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30945
     http_req_receiving.............: avg=97.08µs  min=33.11µs med=88.97µs  max=67.09ms  p(90)=119.5µs  p(95)=131.31µs p(99.9)=801.7µs 
     http_req_sending...............: avg=26.65µs  min=5.42µs  med=17.47µs  max=75.75ms  p(90)=21.93µs  p(95)=23.68µs  p(99.9)=505.24µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.66ms min=17.37ms med=182.77ms max=592.99ms p(90)=226.09ms p(95)=259.63ms p(99.9)=559.57ms
     http_reqs......................: 30945   253.50488/s
     iteration_duration.............: avg=194.64ms min=35.91ms med=183.32ms max=593.33ms p(90)=226.56ms p(95)=261.09ms p(99.9)=559.94ms
     iterations.....................: 30845   252.685669/s
     success_rate...................: 100.00% ✓ 30845      ✗ 0    
     vus............................: 34      min=0        max=50 
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

     checks.........................: 100.00% ✓ 8166      ✗ 0   
     data_received..................: 270 MB  2.1 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=52.44µs  min=1.12µs   med=3.32µs  max=5.75ms  p(90)=4.88µs   p(95)=5.64µs   p(99.9)=5.46ms 
     http_req_connecting............: avg=48.01µs  min=0s       med=0s      max=5.73ms  p(90)=0s       p(95)=0s       p(99.9)=5.43ms 
     http_req_duration..............: avg=2.13s    min=37.52ms  med=2.19s   max=3.82s   p(90)=2.77s    p(95)=2.95s    p(99.9)=3.74s  
       { expected_response:true }...: avg=2.13s    min=37.52ms  med=2.19s   max=3.82s   p(90)=2.77s    p(95)=2.95s    p(99.9)=3.74s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2822
     http_req_receiving.............: avg=113.45µs min=30.72µs  med=95.84µs max=35.46ms p(90)=134.49µs p(95)=150.49µs p(99.9)=1.08ms 
     http_req_sending...............: avg=134.31µs min=5.45µs   med=18.82µs max=37.95ms p(90)=24.56µs  p(95)=29.12µs  p(99.9)=26.65ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.13s    min=37.33ms  med=2.19s   max=3.82s   p(90)=2.77s    p(95)=2.95s    p(99.9)=3.74s  
     http_reqs......................: 2822    22.394801/s
     iteration_duration.............: avg=2.21s    min=558.29ms med=2.21s   max=3.82s   p(90)=2.78s    p(95)=2.96s    p(99.9)=3.75s  
     iterations.....................: 2722    21.601222/s
     success_rate...................: 100.00% ✓ 2722      ✗ 0   
     vus............................: 4       min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

