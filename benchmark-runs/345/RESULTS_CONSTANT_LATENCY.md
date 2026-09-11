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
| fusion-nightly-net11 | 16.7.0-p.5 | 1,872 | 1,923 | 1,865 | 1.1% |  |
| fusion-nightly | 16.7.0-p.5 | 1,871 | 1,925 | 1,862 | 1.2% |  |
| fusion | 16.6.4 | 1,870 | 1,920 | 1,858 | 1.1% |  |
| hive-router | v0.0.84 | 1,815 | 1,886 | 1,802 | 1.6% |  |
| fusion-nightly-fed | 16.7.0-p.5 | 1,798 | 1,854 | 1,788 | 1.2% |  |
| grafbase | 0.53.5 | 1,323 | 1,343 | 1,314 | 0.7% |  |
| cosmo | 0.334.0 | 1,219 | 1,263 | 1,213 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 552 | 569 | 552 | 1.2% |  |
| apollo-router | v2.16.1 | 394 | 413 | 392 | 2.1% |  |
| apollo-gateway | 2.14.3 | 262 | 267 | 261 | 1.0% |  |
| hive-gateway | 2.10.8 | 255 | 262 | 253 | 1.2% |  |
| feddi | 5ff8b6165878 | 13 | 14 | 13 | 2.9% | non-compatible response (4 across 2/9 runs) |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684762      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.3 MB/s
     http_req_blocked...............: avg=2.57µs   min=842ns   med=1.91µs  max=10.05ms  p(90)=3.58µs  p(95)=4.31µs  p(99.9)=32.01µs
     http_req_connecting............: avg=170ns    min=0s      med=0s      max=1.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.06ms  min=17.41ms med=25.51ms max=309.8ms  p(90)=30.22ms p(95)=32.01ms p(99.9)=49.77ms
       { expected_response:true }...: avg=26.06ms  min=17.41ms med=25.51ms max=309.8ms  p(90)=30.22ms p(95)=32.01ms p(99.9)=49.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228354
     http_req_receiving.............: avg=399.17µs min=50.98µs med=91.68µs max=163.33ms p(90)=1.16ms  p(95)=1.89ms  p(99.9)=10.41ms
     http_req_sending...............: avg=32.5µs   min=4.41µs  med=8.15µs  max=155.78ms p(90)=18.56µs p(95)=28.2µs  p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.62ms  min=17.32ms med=25.11ms max=292.28ms p(90)=29.63ms p(95)=31.33ms p(99.9)=47.57ms
     http_reqs......................: 228354  1872.91168/s
     iteration_duration.............: avg=26.27ms  min=17.59ms med=25.72ms max=316.09ms p(90)=30.42ms p(95)=32.21ms p(99.9)=50.24ms
     iterations.....................: 228254  1872.091501/s
     success_rate...................: 100.00% ✓ 228254      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684264      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.21µs   min=942ns   med=2.36µs  max=9.67ms   p(90)=3.98µs   p(95)=4.7µs   p(99.9)=34.37µs
     http_req_connecting............: avg=384ns    min=0s      med=0s      max=3.43ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.08ms  min=17.14ms med=25.45ms max=310.94ms p(90)=30.56ms  p(95)=32.47ms p(99.9)=50.53ms
       { expected_response:true }...: avg=26.08ms  min=17.14ms med=25.45ms max=310.94ms p(90)=30.56ms  p(95)=32.47ms p(99.9)=50.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228188
     http_req_receiving.............: avg=322.89µs min=50.71µs med=98.39µs max=74.1ms   p(90)=810.69µs p(95)=1.31ms  p(99.9)=8.5ms  
     http_req_sending...............: avg=32.48µs  min=4.81µs  med=9.43µs  max=114.61ms p(90)=19.02µs  p(95)=36.2µs  p(99.9)=1.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.72ms  min=17.06ms med=25.11ms max=310.16ms p(90)=30.13ms  p(95)=32.02ms p(99.9)=48.83ms
     http_reqs......................: 228188  1871.384302/s
     iteration_duration.............: avg=26.29ms  min=17.32ms med=25.65ms max=333.61ms p(90)=30.77ms  p(95)=32.68ms p(99.9)=51.11ms
     iterations.....................: 228088  1870.564196/s
     success_rate...................: 100.00% ✓ 228088      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 683985      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.44µs   min=1.03µs  med=2.57µs   max=8.01ms   p(90)=4.17µs   p(95)=4.9µs   p(99.9)=36.8µs 
     http_req_connecting............: avg=383ns    min=0s      med=0s       max=3.46ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.08ms  min=17.69ms med=25.49ms  max=309.65ms p(90)=30.54ms  p(95)=32.37ms p(99.9)=49.93ms
       { expected_response:true }...: avg=26.08ms  min=17.69ms med=25.49ms  max=309.65ms p(90)=30.54ms  p(95)=32.37ms p(99.9)=49.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228095
     http_req_receiving.............: avg=322.54µs min=50.92µs med=100.48µs max=121.59ms p(90)=806.89µs p(95)=1.3ms   p(99.9)=8.33ms 
     http_req_sending...............: avg=32.25µs  min=4.78µs  med=9.97µs   max=123.2ms  p(90)=19.24µs  p(95)=34.85µs p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.73ms  min=17.28ms med=25.15ms  max=308.88ms p(90)=30.11ms  p(95)=31.92ms p(99.9)=47.62ms
     http_reqs......................: 228095  1870.492718/s
     iteration_duration.............: avg=26.3ms   min=17.84ms med=25.7ms   max=319.55ms p(90)=30.74ms  p(95)=32.57ms p(99.9)=50.26ms
     iterations.....................: 227995  1869.672668/s
     success_rate...................: 100.00% ✓ 227995      ✗ 0     
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

     checks.........................: 100.00% ✓ 663792      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=2.86µs  min=942ns   med=2.08µs  max=4.01ms   p(90)=3.51µs  p(95)=4.2µs    p(99.9)=27.87µs
     http_req_connecting............: avg=447ns   min=0s      med=0s      max=3.98ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.9ms  min=18.31ms med=26.49ms max=303.14ms p(90)=30.65ms p(95)=32.09ms  p(99.9)=47.95ms
       { expected_response:true }...: avg=26.9ms  min=18.31ms med=26.49ms max=303.14ms p(90)=30.65ms p(95)=32.09ms  p(99.9)=47.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 221364
     http_req_receiving.............: avg=71.94µs min=25.22µs med=49.56µs max=73.26ms  p(90)=89.98µs p(95)=112.79µs p(99.9)=1.62ms 
     http_req_sending...............: avg=27.02µs min=4.59µs  med=9.26µs  max=112.04ms p(90)=16.72µs p(95)=22.74µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.8ms  min=18.14ms med=26.4ms  max=276.35ms p(90)=30.56ms p(95)=31.98ms  p(99.9)=46.28ms
     http_reqs......................: 221364  1815.083636/s
     iteration_duration.............: avg=27.1ms  min=18.89ms med=26.69ms max=313.47ms p(90)=30.85ms p(95)=32.29ms  p(99.9)=48.38ms
     iterations.....................: 221264  1814.263682/s
     success_rate...................: 100.00% ✓ 221264      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 657936      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=3.2µs    min=912ns   med=2.26µs  max=5.49ms   p(90)=4.09µs   p(95)=4.85µs  p(99.9)=33.85µs
     http_req_connecting............: avg=481ns    min=0s      med=0s      max=4.27ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.12ms  min=17.39ms med=26.53ms max=298.05ms p(90)=31.74ms  p(95)=33.62ms p(99.9)=51.66ms
       { expected_response:true }...: avg=27.12ms  min=17.39ms med=26.53ms max=298.05ms p(90)=31.74ms  p(95)=33.62ms p(99.9)=51.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219412
     http_req_receiving.............: avg=318.04µs min=51.58µs med=97.26µs max=235.02ms p(90)=799.55µs p(95)=1.34ms  p(99.9)=8.53ms 
     http_req_sending...............: avg=33.47µs  min=4.7µs   med=9.23µs  max=140.31ms p(90)=19.71µs  p(95)=33.83µs p(99.9)=1.64ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.77ms  min=17.29ms med=26.19ms max=297.44ms p(90)=31.32ms  p(95)=33.18ms p(99.9)=50.09ms
     http_reqs......................: 219412  1798.762623/s
     iteration_duration.............: avg=27.34ms  min=17.61ms med=26.74ms max=317.38ms p(90)=31.94ms  p(95)=33.83ms p(99.9)=52.1ms 
     iterations.....................: 219312  1797.942813/s
     success_rate...................: 100.00% ✓ 219312      ✗ 0     
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

     checks.........................: 100.00% ✓ 484095      ✗ 0     
     data_received..................: 14 GB   116 MB/s
     data_sent......................: 194 MB  1.6 MB/s
     http_req_blocked...............: avg=4.24µs  min=942ns   med=3.01µs  max=5.54ms   p(90)=5.41µs   p(95)=6.41µs   p(99.9)=48.32µs
     http_req_connecting............: avg=647ns   min=0s      med=0s      max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=36.9ms  min=18.11ms med=36.6ms  max=318.45ms p(90)=43.32ms  p(95)=45.35ms  p(99.9)=62.7ms 
       { expected_response:true }...: avg=36.9ms  min=18.11ms med=36.6ms  max=318.45ms p(90)=43.32ms  p(95)=45.35ms  p(99.9)=62.7ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 161465
     http_req_receiving.............: avg=92.7µs  min=25.48µs med=61.44µs max=128.81ms p(90)=130.21µs p(95)=178.35µs p(99.9)=2.29ms 
     http_req_sending...............: avg=36.04µs min=4.91µs  med=11.35µs max=114.22ms p(90)=25.34µs  p(95)=52.57µs  p(99.9)=2.3ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=36.77ms min=17.96ms med=36.48ms max=304.21ms p(90)=43.19ms  p(95)=45.21ms  p(99.9)=61.33ms
     http_reqs......................: 161465  1323.763172/s
     iteration_duration.............: avg=37.17ms min=20.36ms med=36.84ms max=325.96ms p(90)=43.55ms  p(95)=45.58ms  p(99.9)=63.12ms
     iterations.....................: 161365  1322.943327/s
     success_rate...................: 100.00% ✓ 161365      ✗ 0     
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

     checks.........................: 100.00% ✓ 446052      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.6µs   min=990ns   med=2.64µs  max=3.82ms   p(90)=4.32µs   p(95)=5.03µs  p(99.9)=39.56µs 
     http_req_connecting............: avg=648ns   min=0s      med=0s      max=3.78ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=40.11ms min=18.88ms med=39.45ms max=308.02ms p(90)=48.24ms  p(95)=51.08ms p(99.9)=65.32ms 
       { expected_response:true }...: avg=40.11ms min=18.88ms med=39.45ms max=308.02ms p(90)=48.24ms  p(95)=51.08ms p(99.9)=65.32ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 148784
     http_req_receiving.............: avg=79.06µs min=25.6µs  med=63.5µs  max=254.26ms p(90)=105.19µs p(95)=123.1µs p(99.9)=860.21µs
     http_req_sending...............: avg=27.26µs min=4.93µs  med=11.88µs max=113.49ms p(90)=19.65µs  p(95)=23.64µs p(99.9)=994.63µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=40ms    min=18.76ms med=39.35ms max=301.5ms  p(90)=48.13ms  p(95)=50.96ms p(99.9)=64.92ms 
     http_reqs......................: 148784  1219.589564/s
     iteration_duration.............: avg=40.34ms min=22.18ms med=39.67ms max=315.99ms p(90)=48.44ms  p(95)=51.28ms p(99.9)=65.68ms 
     iterations.....................: 148684  1218.769859/s
     success_rate...................: 100.00% ✓ 148684      ✗ 0     
     vus............................: 11      min=0         max=50  
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

     checks.........................: 100.00% ✓ 202347     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   664 kB/s
     http_req_blocked...............: avg=3.96µs  min=1.05µs  med=2.65µs  max=3.01ms   p(90)=4.14µs   p(95)=4.77µs   p(99.9)=44.39µs 
     http_req_connecting............: avg=1.06µs  min=0s      med=0s      max=2.98ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.62ms min=20.61ms med=86.71ms max=330.79ms p(90)=107.63ms p(95)=116.62ms p(99.9)=205.66ms
       { expected_response:true }...: avg=88.62ms min=20.61ms med=86.71ms max=330.79ms p(90)=107.63ms p(95)=116.62ms p(99.9)=205.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67549
     http_req_receiving.............: avg=83.98µs min=28.77µs med=72.96µs max=106.69ms p(90)=109.26µs p(95)=123.01µs p(99.9)=646.44µs
     http_req_sending...............: avg=21.45µs min=5.04µs  med=14.05µs max=86.16ms  p(90)=20.9µs   p(95)=23.08µs  p(99.9)=686.32µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.51ms min=20.52ms med=86.61ms max=316.92ms p(90)=107.53ms p(95)=116.51ms p(99.9)=205.26ms
     http_reqs......................: 67549   552.564477/s
     iteration_duration.............: avg=88.97ms min=34.5ms  med=86.97ms max=340.53ms p(90)=107.87ms p(95)=116.9ms  p(99.9)=206.5ms 
     iterations.....................: 67449   551.746457/s
     success_rate...................: 100.00% ✓ 67449      ✗ 0    
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

     checks.........................: 100.00% ✓ 144627     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   474 kB/s
     http_req_blocked...............: avg=5.94µs   min=1.36µs  med=3.73µs   max=3.98ms   p(90)=5.26µs   p(95)=5.88µs   p(99.9)=770.21µs
     http_req_connecting............: avg=1.94µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=745.29µs
     http_req_duration..............: avg=123.97ms min=21.31ms med=122.06ms max=341.92ms p(90)=155.1ms  p(95)=165.47ms p(99.9)=212.65ms
       { expected_response:true }...: avg=123.97ms min=21.31ms med=122.06ms max=341.92ms p(90)=155.1ms  p(95)=165.47ms p(99.9)=212.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48309
     http_req_receiving.............: avg=103.77µs min=32.96µs med=86.94µs  max=172.95ms p(90)=120µs    p(95)=132.67µs p(99.9)=599.81µs
     http_req_sending...............: avg=30.18µs  min=6.14µs  med=18.54µs  max=82.05ms  p(90)=24.04µs  p(95)=26.17µs  p(99.9)=556.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.84ms min=21.21ms med=121.95ms max=341.38ms p(90)=154.98ms p(95)=165.27ms p(99.9)=210.79ms
     http_reqs......................: 48309   394.883225/s
     iteration_duration.............: avg=124.48ms min=38.01ms med=122.39ms max=357.98ms p(90)=155.41ms p(95)=165.78ms p(99.9)=214.79ms
     iterations.....................: 48209   394.065813/s
     success_rate...................: 100.00% ✓ 48209      ✗ 0    
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

     checks.........................: 100.00% ✓ 96393      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   316 kB/s
     http_req_blocked...............: avg=6.5µs    min=1.2µs   med=3.28µs   max=4.16ms   p(90)=4.66µs   p(95)=5.2µs    p(99.9)=1.28ms  
     http_req_connecting............: avg=2.96µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=1.25ms  
     http_req_duration..............: avg=186.03ms min=23.46ms med=188.44ms max=382.09ms p(90)=216.57ms p(95)=222.19ms p(99.9)=300.67ms
       { expected_response:true }...: avg=186.03ms min=23.46ms med=188.44ms max=382.09ms p(90)=216.57ms p(95)=222.19ms p(99.9)=300.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32231
     http_req_receiving.............: avg=94.87µs  min=29.66µs med=89.15µs  max=112.74ms p(90)=119.09µs p(95)=130.97µs p(99.9)=421.54µs
     http_req_sending...............: avg=27.16µs  min=5.12µs  med=17.72µs  max=119.93ms p(90)=22.33µs  p(95)=24.16µs  p(99.9)=605.48µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.91ms min=23.32ms med=188.33ms max=381.04ms p(90)=216.44ms p(95)=222.03ms p(99.9)=300.52ms
     http_reqs......................: 32231   262.83241/s
     iteration_duration.............: avg=186.84ms min=47.13ms med=188.74ms max=402.42ms p(90)=216.85ms p(95)=222.51ms p(99.9)=304.98ms
     iterations.....................: 32131   262.016945/s
     success_rate...................: 100.00% ✓ 32131      ✗ 0    
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

     checks.........................: 100.00% ✓ 93219      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   306 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.1µs   med=2.99µs   max=3.48ms   p(90)=4.32µs   p(95)=4.87µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.73µs   min=0s      med=0s       max=3.43ms   p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=192.37ms min=18.2ms  med=181.48ms max=616.14ms p(90)=225.22ms p(95)=259.92ms p(99.9)=559.02ms
       { expected_response:true }...: avg=192.37ms min=18.2ms  med=181.48ms max=616.14ms p(90)=225.22ms p(95)=259.92ms p(99.9)=559.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31173
     http_req_receiving.............: avg=91.02µs  min=30.32µs med=87.8µs   max=6.85ms   p(90)=118.3µs  p(95)=130.1µs  p(99.9)=593.26µs
     http_req_sending...............: avg=24.14µs  min=5.28µs  med=16.7µs   max=82.93ms  p(90)=21.21µs  p(95)=23.06µs  p(99.9)=569.21µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.25ms min=18.06ms med=181.36ms max=616.06ms p(90)=225.12ms p(95)=259.81ms p(99.9)=558.92ms
     http_reqs......................: 31173   255.059413/s
     iteration_duration.............: avg=193.21ms min=59.6ms  med=181.9ms  max=616.34ms p(90)=225.64ms p(95)=261.34ms p(99.9)=559.31ms
     iterations.....................: 31073   254.241207/s
     success_rate...................: 100.00% ✓ 31073      ✗ 0    
     vus............................: 47      min=0        max=50 
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

     checks.........................: 100.00% ✓ 4746      ✗ 0   
     data_received..................: 161 MB  1.3 MB/s
     data_sent......................: 2.0 MB  16 kB/s
     http_req_blocked...............: avg=36.42µs  min=1.51µs  med=3.58µs  max=2.73ms  p(90)=5.15µs   p(95)=6.5µs    p(99.9)=2.28ms  
     http_req_connecting............: avg=20.35µs  min=0s      med=0s      max=2.25ms  p(90)=0s       p(95)=0s       p(99.9)=2.09ms  
     http_req_duration..............: avg=3.62s    min=48.4ms  med=3.77s   max=5.5s    p(90)=4.61s    p(95)=4.9s     p(99.9)=5.45s   
       { expected_response:true }...: avg=3.62s    min=48.4ms  med=3.77s   max=5.5s    p(90)=4.61s    p(95)=4.9s     p(99.9)=5.45s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 1682
     http_req_receiving.............: avg=105.19µs min=44.73µs med=90.94µs max=14.28ms p(90)=136.44µs p(95)=153.94µs p(99.9)=497.88µs
     http_req_sending...............: avg=39.81µs  min=8.23µs  med=17.84µs max=4.95ms  p(90)=23.54µs  p(95)=31.25µs  p(99.9)=4.16ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=3.62s    min=48.23ms med=3.77s   max=5.5s    p(90)=4.61s    p(95)=4.9s     p(99.9)=5.45s   
     http_reqs......................: 1682    13.12568/s
     iteration_duration.............: avg=3.84s    min=1.06s   med=3.81s   max=5.5s    p(90)=4.63s    p(95)=4.92s    p(99.9)=5.46s   
     iterations.....................: 1582    12.345319/s
     success_rate...................: 100.00% ✓ 1582      ✗ 0   
     vus............................: 15      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

