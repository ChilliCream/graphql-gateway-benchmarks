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
| fusion-nightly | 16.6.0-p.7 | 1,886 | 1,938 | 1,875 | 1.2% |  |
| fusion | 16.5.1 | 1,862 | 1,914 | 1,855 | 1.1% |  |
| hive-router | v0.0.84 | 1,858 | 1,915 | 1,849 | 1.2% |  |
| fusion-nightly-net11 | 16.6.0-p.7 | 1,852 | 1,907 | 1,841 | 1.2% |  |
| fusion-nightly-fed | 16.6.0-p.7 | 1,762 | 1,802 | 1,750 | 0.9% |  |
| grafbase | 0.53.5 | 1,288 | 1,323 | 1,274 | 1.3% |  |
| cosmo | 0.334.0 | 1,230 | 1,271 | 1,226 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 558 | 575 | 552 | 1.3% |  |
| apollo-router | v2.16.1 | 433 | 449 | 431 | 1.4% |  |
| apollo-gateway | 2.14.3 | 265 | 271 | 263 | 1.0% |  |
| hive-gateway | 2.10.8 | 254 | 262 | 253 | 1.2% |  |
| feddi | 5ff8b6165878 | 19 | 19 | 18 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689679      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.89µs   min=902ns   med=2.08µs  max=4.76ms   p(90)=3.52µs   p(95)=4.19µs  p(99.9)=27.4µs 
     http_req_connecting............: avg=437ns    min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.87ms  min=17.66ms med=25.3ms  max=299.96ms p(90)=30.26ms  p(95)=32.09ms p(99.9)=48.11ms
       { expected_response:true }...: avg=25.87ms  min=17.66ms med=25.3ms  max=299.96ms p(90)=30.26ms  p(95)=32.09ms p(99.9)=48.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229993
     http_req_receiving.............: avg=316.03µs min=50.87µs med=95.96µs max=107.59ms p(90)=795.25µs p(95)=1.26ms  p(99.9)=8.2ms  
     http_req_sending...............: avg=30.83µs  min=4.58µs  med=8.66µs  max=229.96ms p(90)=17.15µs  p(95)=28.26µs p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.53ms  min=17.49ms med=24.96ms max=299.5ms  p(90)=29.84ms  p(95)=31.63ms p(99.9)=46.62ms
     http_reqs......................: 229993  1886.513517/s
     iteration_duration.............: avg=26.09ms  min=17.87ms med=25.5ms  max=309.42ms p(90)=30.47ms  p(95)=32.29ms p(99.9)=48.41ms
     iterations.....................: 229893  1885.693269/s
     success_rate...................: 100.00% ✓ 229893      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.5.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681204      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.94µs   min=851ns   med=2.01µs  max=7.83ms   p(90)=3.65µs  p(95)=4.37µs  p(99.9)=30.86µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=3.28ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.2ms   min=17.39ms med=25.63ms max=305.07ms p(90)=30.57ms p(95)=32.41ms p(99.9)=49.2ms 
       { expected_response:true }...: avg=26.2ms   min=17.39ms med=25.63ms max=305.07ms p(90)=30.57ms p(95)=32.41ms p(99.9)=49.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 227168
     http_req_receiving.............: avg=328.87µs min=49.78µs med=97.51µs max=218.81ms p(90)=839.2µs p(95)=1.32ms  p(99.9)=8.49ms 
     http_req_sending...............: avg=30.24µs  min=4.64µs  med=8.54µs  max=113.61ms p(90)=18.28µs p(95)=27.9µs  p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.84ms  min=17.22ms med=25.28ms max=304.53ms p(90)=30.14ms p(95)=31.93ms p(99.9)=47.6ms 
     http_reqs......................: 227168  1862.965913/s
     iteration_duration.............: avg=26.41ms  min=17.57ms med=25.83ms max=314.09ms p(90)=30.77ms p(95)=32.62ms p(99.9)=49.54ms
     iterations.....................: 227068  1862.14583/s
     success_rate...................: 100.00% ✓ 227068      ✗ 0     
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

     checks.........................: 100.00% ✓ 679509      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.19µs  min=822ns   med=2.08µs  max=7.77ms   p(90)=3.78µs  p(95)=4.48µs   p(99.9)=28.07µs
     http_req_connecting............: avg=634ns   min=0s      med=0s      max=6.17ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.27ms min=17.51ms med=25.85ms max=293ms    p(90)=29.96ms p(95)=31.34ms  p(99.9)=47.31ms
       { expected_response:true }...: avg=26.27ms min=17.51ms med=25.85ms max=293ms    p(90)=29.96ms p(95)=31.34ms  p(99.9)=47.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226603
     http_req_receiving.............: avg=70.49µs min=24.66µs med=47.6µs  max=24.75ms  p(90)=91.59µs p(95)=118.33µs p(99.9)=1.72ms 
     http_req_sending...............: avg=29.85µs min=4.48µs  med=8.92µs  max=195.23ms p(90)=18.28µs p(95)=25.32µs  p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.17ms min=17.45ms med=25.76ms max=292.73ms p(90)=29.85ms p(95)=31.22ms  p(99.9)=46.02ms
     http_reqs......................: 226603  1858.157929/s
     iteration_duration.............: avg=26.48ms min=18.15ms med=26.05ms max=303.83ms p(90)=30.16ms p(95)=31.54ms  p(99.9)=47.79ms
     iterations.....................: 226503  1857.337923/s
     success_rate...................: 100.00% ✓ 226503      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 677232      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=2.66µs   min=812ns   med=1.89µs  max=3.42ms   p(90)=3.52µs   p(95)=4.24µs  p(99.9)=29.71µs
     http_req_connecting............: avg=364ns    min=0s      med=0s      max=3.36ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.36ms  min=17.45ms med=25.81ms max=298.3ms  p(90)=30.66ms  p(95)=32.41ms p(99.9)=48.2ms 
       { expected_response:true }...: avg=26.36ms  min=17.45ms med=25.81ms max=298.3ms  p(90)=30.66ms  p(95)=32.41ms p(99.9)=48.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 225844
     http_req_receiving.............: avg=336.25µs min=51.29µs med=94.72µs max=105.69ms p(90)=900.33µs p(95)=1.43ms  p(99.9)=8.07ms 
     http_req_sending...............: avg=30.77µs  min=4.17µs  med=8.14µs  max=148.95ms p(90)=18.11µs  p(95)=29.38µs p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.99ms  min=17.27ms med=25.47ms max=297.69ms p(90)=30.2ms   p(95)=31.94ms p(99.9)=46.65ms
     http_reqs......................: 225844  1852.186376/s
     iteration_duration.............: avg=26.57ms  min=17.75ms med=26.02ms max=309.5ms  p(90)=30.85ms  p(95)=32.61ms p(99.9)=48.7ms 
     iterations.....................: 225744  1851.366259/s
     success_rate...................: 100.00% ✓ 225744      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 644553      ✗ 0     
     data_received..................: 19 GB   155 MB/s
     data_sent......................: 258 MB  2.1 MB/s
     http_req_blocked...............: avg=2.86µs   min=871ns   med=2.01µs  max=3.92ms   p(90)=3.77µs   p(95)=4.52µs  p(99.9)=32.03µs
     http_req_connecting............: avg=400ns    min=0s      med=0s      max=3.35ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.69ms  min=18.13ms med=27.13ms max=303.28ms p(90)=32.49ms  p(95)=34.29ms p(99.9)=50.07ms
       { expected_response:true }...: avg=27.69ms  min=18.13ms med=27.13ms max=303.28ms p(90)=32.49ms  p(95)=34.29ms p(99.9)=50.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 214951
     http_req_receiving.............: avg=316.59µs min=50.86µs med=96.46µs max=171.25ms p(90)=800.05µs p(95)=1.33ms  p(99.9)=8.26ms 
     http_req_sending...............: avg=32.48µs  min=4.55µs  med=8.74µs  max=162.18ms p(90)=19.32µs  p(95)=30.01µs p(99.9)=1.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.34ms  min=17.91ms med=26.8ms  max=302.74ms p(90)=32.06ms  p(95)=33.84ms p(99.9)=48.27ms
     http_reqs......................: 214951  1762.179258/s
     iteration_duration.............: avg=27.91ms  min=18.32ms med=27.34ms max=312.12ms p(90)=32.7ms   p(95)=34.49ms p(99.9)=50.78ms
     iterations.....................: 214851  1761.359452/s
     success_rate...................: 100.00% ✓ 214851      ✗ 0     
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

     checks.........................: 100.00% ✓ 471180      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=3.46µs   min=882ns   med=2.18µs  max=6.82ms   p(90)=4.56µs   p(95)=5.53µs   p(99.9)=39.33µs
     http_req_connecting............: avg=642ns    min=0s      med=0s      max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.94ms  min=18.38ms med=37.68ms max=309.54ms p(90)=44.71ms  p(95)=46.8ms   p(99.9)=62.53ms
       { expected_response:true }...: avg=37.94ms  min=18.38ms med=37.68ms max=309.54ms p(90)=44.71ms  p(95)=46.8ms   p(99.9)=62.53ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157160
     http_req_receiving.............: avg=121.77µs min=26.66µs med=53.78µs max=261.28ms p(90)=121.26µs p(95)=165.63µs p(99.9)=3.07ms 
     http_req_sending...............: avg=32.03µs  min=4.7µs   med=9.19µs  max=33.07ms  p(90)=23.52µs  p(95)=41.21µs  p(99.9)=1.98ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.79ms  min=18.22ms med=37.57ms max=200.21ms p(90)=44.59ms  p(95)=46.66ms  p(99.9)=60.72ms
     http_reqs......................: 157160  1288.057666/s
     iteration_duration.............: avg=38.19ms  min=20.95ms med=37.92ms max=342.72ms p(90)=44.93ms  p(95)=47.01ms  p(99.9)=63.19ms
     iterations.....................: 157060  1287.238083/s
     success_rate...................: 100.00% ✓ 157060      ✗ 0     
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

     checks.........................: 100.00% ✓ 449970      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.02µs  min=912ns   med=2.28µs  max=3.32ms   p(90)=3.9µs    p(95)=4.62µs   p(99.9)=32.42µs 
     http_req_connecting............: avg=374ns   min=0s      med=0s      max=2.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.77ms min=18.73ms med=39.16ms max=315.74ms p(90)=47.67ms  p(95)=50.45ms  p(99.9)=64.57ms 
       { expected_response:true }...: avg=39.77ms min=18.73ms med=39.16ms max=315.74ms p(90)=47.67ms  p(95)=50.45ms  p(99.9)=64.57ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 150090
     http_req_receiving.............: avg=75.69µs min=25.78µs med=61.98µs max=47.09ms  p(90)=102.88µs p(95)=120.52µs p(99.9)=930.03µs
     http_req_sending...............: avg=23.68µs min=4.81µs  med=10.95µs max=182.83ms p(90)=18.81µs  p(95)=22.6µs   p(99.9)=880.44µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.67ms min=18.54ms med=39.06ms max=314.98ms p(90)=47.57ms  p(95)=50.35ms  p(99.9)=64.38ms 
     http_reqs......................: 150090  1230.26748/s
     iteration_duration.............: avg=39.99ms min=22.54ms med=39.37ms max=324.69ms p(90)=47.87ms  p(95)=50.66ms  p(99.9)=64.96ms 
     iterations.....................: 149990  1229.447793/s
     success_rate...................: 100.00% ✓ 149990      ✗ 0     
     vus............................: 15      min=0         max=50  
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

     checks.........................: 100.00% ✓ 204633     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   671 kB/s
     http_req_blocked...............: avg=5.12µs  min=1.26µs  med=3.49µs  max=4.09ms   p(90)=5.1µs    p(95)=5.81µs   p(99.9)=48.78µs 
     http_req_connecting............: avg=1.34µs  min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.61ms min=20.77ms med=85.88ms max=326.59ms p(90)=105.62ms p(95)=114.18ms p(99.9)=201.65ms
       { expected_response:true }...: avg=87.61ms min=20.77ms med=85.88ms max=326.59ms p(90)=105.62ms p(95)=114.18ms p(99.9)=201.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68311
     http_req_receiving.............: avg=89.42µs min=32.28µs med=80.06µs max=56.88ms  p(90)=116.09µs p(95)=129.76µs p(99.9)=661.5µs 
     http_req_sending...............: avg=24.64µs min=5.93µs  med=15.71µs max=109.42ms p(90)=22.35µs  p(95)=24.66µs  p(99.9)=630.77µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.5ms  min=20.61ms med=85.77ms max=326.09ms p(90)=105.51ms p(95)=114.06ms p(99.9)=201.43ms
     http_reqs......................: 68311   558.741822/s
     iteration_duration.............: avg=87.97ms min=31.2ms  med=86.15ms max=349.92ms p(90)=105.89ms p(95)=114.47ms p(99.9)=203.06ms
     iterations.....................: 68211   557.923884/s
     success_rate...................: 100.00% ✓ 68211      ✗ 0    
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

     checks.........................: 100.00% ✓ 158673     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   520 kB/s
     http_req_blocked...............: avg=6.01µs   min=1.45µs  med=3.76µs   max=3.99ms   p(90)=5.37µs   p(95)=6.04µs   p(99.9)=134.62µs
     http_req_connecting............: avg=1.85µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.99ms min=21.05ms med=111.16ms max=341.54ms p(90)=140.57ms p(95)=150.05ms p(99.9)=195.01ms
       { expected_response:true }...: avg=112.99ms min=21.05ms med=111.16ms max=341.54ms p(90)=140.57ms p(95)=150.05ms p(99.9)=195.01ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52991
     http_req_receiving.............: avg=94.75µs  min=34.17µs med=86.47µs  max=126.62ms p(90)=119.08µs p(95)=132.01µs p(99.9)=589.33µs
     http_req_sending...............: avg=28.77µs  min=5.81µs  med=18.4µs   max=131.56ms p(90)=24.01µs  p(95)=26.19µs  p(99.9)=629.25µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.87ms min=20.91ms med=111.06ms max=341ms    p(90)=140.45ms p(95)=149.92ms p(99.9)=194.9ms 
     http_reqs......................: 52991   433.240503/s
     iteration_duration.............: avg=113.47ms min=30.41ms med=111.47ms max=351.15ms p(90)=140.88ms p(95)=150.38ms p(99.9)=198.59ms
     iterations.....................: 52891   432.422929/s
     success_rate...................: 100.00% ✓ 52891      ✗ 0    
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

     checks.........................: 100.00% ✓ 97359      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=6.64µs   min=1.49µs  med=3.63µs   max=3.66ms   p(90)=5.11µs   p(95)=5.72µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=2.71µs   min=0s      med=0s       max=3.62ms   p(90)=0s       p(95)=0s       p(99.9)=1.22ms  
     http_req_duration..............: avg=184.21ms min=23.56ms med=184.05ms max=335.58ms p(90)=192.57ms p(95)=197.04ms p(99.9)=263.63ms
       { expected_response:true }...: avg=184.21ms min=23.56ms med=184.05ms max=335.58ms p(90)=192.57ms p(95)=197.04ms p(99.9)=263.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32553
     http_req_receiving.............: avg=95.43µs  min=36.16µs med=90.48µs  max=12.04ms  p(90)=123.94µs p(95)=137.31µs p(99.9)=503.34µs
     http_req_sending...............: avg=24.53µs  min=6.1µs   med=18.36µs  max=39.56ms  p(90)=23.4µs   p(95)=25.39µs  p(99.9)=552.2µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.09ms min=23.41ms med=183.94ms max=335.41ms p(90)=192.46ms p(95)=196.93ms p(99.9)=263.53ms
     http_reqs......................: 32553   265.348179/s
     iteration_duration.............: avg=185ms    min=56.99ms med=184.35ms max=347ms    p(90)=192.88ms p(95)=197.37ms p(99.9)=264.77ms
     iterations.....................: 32453   264.533052/s
     success_rate...................: 100.00% ✓ 32453      ✗ 0    
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

     checks.........................: 100.00% ✓ 92973      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   306 kB/s
     http_req_blocked...............: avg=7.48µs   min=1.51µs  med=3.73µs   max=4.32ms   p(90)=5.23µs   p(95)=5.9µs    p(99.9)=1.72ms  
     http_req_connecting............: avg=3.44µs   min=0s      med=0s       max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=1.69ms  
     http_req_duration..............: avg=192.88ms min=17.6ms  med=180.8ms  max=612.91ms p(90)=226.8ms  p(95)=262.23ms p(99.9)=570.87ms
       { expected_response:true }...: avg=192.88ms min=17.6ms  med=180.8ms  max=612.91ms p(90)=226.8ms  p(95)=262.23ms p(99.9)=570.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31091
     http_req_receiving.............: avg=101.65µs min=34.45µs med=91.03µs  max=120.21ms p(90)=122.72µs p(95)=135.27µs p(99.9)=1ms     
     http_req_sending...............: avg=31.02µs  min=6.61µs  med=18.86µs  max=172.53ms p(90)=23.89µs  p(95)=25.97µs  p(99.9)=519.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.75ms min=17.51ms med=180.68ms max=612.8ms  p(90)=226.67ms p(95)=261.86ms p(99.9)=570.76ms
     http_reqs......................: 31091   254.607485/s
     iteration_duration.............: avg=193.74ms min=41.05ms med=181.21ms max=613.2ms  p(90)=227.16ms p(95)=263.48ms p(99.9)=571.22ms
     iterations.....................: 30991   253.788575/s
     success_rate...................: 100.00% ✓ 30991      ✗ 0    
     vus............................: 36      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6945      ✗ 0   
     data_received..................: 231 MB  1.8 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=118.31µs min=1.4µs    med=3.59µs  max=9.76ms  p(90)=5.03µs   p(95)=5.81µs   p(99.9)=9.27ms  
     http_req_connecting............: avg=111.35µs min=0s       med=0s      max=9.71ms  p(90)=0s       p(95)=0s       p(99.9)=9.24ms  
     http_req_duration..............: avg=2.51s    min=39.68ms  med=2.6s    max=4.49s   p(90)=3.27s    p(95)=3.46s    p(99.9)=4.46s   
       { expected_response:true }...: avg=2.51s    min=39.68ms  med=2.6s    max=4.49s   p(90)=3.27s    p(95)=3.46s    p(99.9)=4.46s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2415
     http_req_receiving.............: avg=103µs    min=36.58µs  med=92.6µs  max=11.68ms p(90)=135.12µs p(95)=151.62µs p(99.9)=959.86µs
     http_req_sending...............: avg=64.93µs  min=5.67µs   med=18.84µs max=17.18ms p(90)=24.41µs  p(95)=28.55µs  p(99.9)=6.28ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.51s    min=39.53ms  med=2.6s    max=4.49s   p(90)=3.27s    p(95)=3.46s    p(99.9)=4.46s   
     http_reqs......................: 2415    19.022796/s
     iteration_duration.............: avg=2.61s    min=180.53ms med=2.64s   max=4.49s   p(90)=3.29s    p(95)=3.46s    p(99.9)=4.46s   
     iterations.....................: 2315    18.235102/s
     success_rate...................: 100.00% ✓ 2315      ✗ 0   
     vus............................: 44      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

