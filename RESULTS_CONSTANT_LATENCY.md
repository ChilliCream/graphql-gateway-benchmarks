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
| fusion-nightly-net11 | 16.7.0-p.2 | 1,885 | 1,921 | 1,874 | 0.8% |  |
| fusion-nightly | 16.7.0-p.2 | 1,879 | 1,925 | 1,868 | 1.0% |  |
| fusion | 16.6.3 | 1,867 | 1,919 | 1,857 | 1.1% |  |
| hive-router | v0.0.84 | 1,850 | 1,917 | 1,831 | 1.4% |  |
| fusion-nightly-fed | 16.7.0-p.2 | 1,807 | 1,845 | 1,793 | 0.9% |  |
| grafbase | 0.53.5 | 1,303 | 1,336 | 1,292 | 1.2% |  |
| cosmo | 0.334.0 | 1,161 | 1,212 | 1,156 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 549 | 573 | 546 | 1.6% |  |
| apollo-router | v2.16.1 | 393 | 413 | 390 | 2.2% |  |
| apollo-gateway | 2.14.3 | 267 | 270 | 234 | 4.2% |  |
| hive-gateway | 2.10.8 | 264 | 271 | 262 | 1.1% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.0% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689304      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.82µs   min=851ns   med=1.98µs  max=4.51ms   p(90)=3.74µs   p(95)=4.45µs  p(99.9)=31.64µs
     http_req_connecting............: avg=368ns    min=0s      med=0s      max=3.36ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.89ms  min=17.07ms med=25.35ms max=317.86ms p(90)=30.11ms  p(95)=31.87ms p(99.9)=47.95ms
       { expected_response:true }...: avg=25.89ms  min=17.07ms med=25.35ms max=317.86ms p(90)=30.11ms  p(95)=31.87ms p(99.9)=47.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229868
     http_req_receiving.............: avg=278.45µs min=48.67µs med=85.91µs max=269.87ms p(90)=599.21µs p(95)=1.11ms  p(99.9)=7.7ms  
     http_req_sending...............: avg=29.83µs  min=4.58µs  med=8.34µs  max=36.26ms  p(90)=18.09µs  p(95)=29.52µs p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.58ms  min=16.89ms med=25.08ms max=113.02ms p(90)=29.78ms  p(95)=31.47ms p(99.9)=46.92ms
     http_reqs......................: 229868  1885.612483/s
     iteration_duration.............: avg=26.1ms   min=17.25ms med=25.55ms max=325.61ms p(90)=30.31ms  p(95)=32.07ms p(99.9)=48.44ms
     iterations.....................: 229768  1884.79218/s
     success_rate...................: 100.00% ✓ 229768      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687345      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=831ns   med=1.98µs  max=3.8ms    p(90)=3.75µs   p(95)=4.47µs  p(99.9)=36.29µs
     http_req_connecting............: avg=409ns    min=0s      med=0s      max=3.77ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.96ms  min=17.23ms med=25.38ms max=287.45ms p(90)=30.31ms  p(95)=32.11ms p(99.9)=49.29ms
       { expected_response:true }...: avg=25.96ms  min=17.23ms med=25.38ms max=287.45ms p(90)=30.31ms  p(95)=32.11ms p(99.9)=49.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229215
     http_req_receiving.............: avg=309.44µs min=49.13µs med=91.42µs max=125.56ms p(90)=779.13µs p(95)=1.3ms   p(99.9)=8.88ms 
     http_req_sending...............: avg=31.22µs  min=4.37µs  med=8.4µs   max=175.81ms p(90)=18.84µs  p(95)=31.6µs  p(99.9)=1.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.62ms  min=17.13ms med=25.06ms max=286.9ms  p(90)=29.9ms   p(95)=31.65ms p(99.9)=47.53ms
     http_reqs......................: 229215  1879.753354/s
     iteration_duration.............: avg=26.17ms  min=17.46ms med=25.59ms max=301.22ms p(90)=30.52ms  p(95)=32.32ms p(99.9)=49.68ms
     iterations.....................: 229115  1878.933271/s
     success_rate...................: 100.00% ✓ 229115      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682815      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.36µs   min=931ns   med=2.57µs  max=3.85ms   p(90)=4.2µs    p(95)=4.93µs  p(99.9)=37.27µs
     http_req_connecting............: avg=409ns    min=0s      med=0s      max=3.81ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.13ms  min=16.83ms med=25.52ms max=291.06ms p(90)=30.6ms   p(95)=32.49ms p(99.9)=50.93ms
       { expected_response:true }...: avg=26.13ms  min=16.83ms med=25.52ms max=291.06ms p(90)=30.6ms   p(95)=32.49ms p(99.9)=50.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227705
     http_req_receiving.............: avg=318.68µs min=51.01µs med=99.47µs max=146.23ms p(90)=794.18µs p(95)=1.27ms  p(99.9)=8.64ms 
     http_req_sending...............: avg=34µs     min=4.68µs  med=9.77µs  max=157.34ms p(90)=18.98µs  p(95)=47.13µs p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.77ms  min=16.42ms med=25.18ms max=290.16ms p(90)=30.18ms  p(95)=32.03ms p(99.9)=49.35ms
     http_reqs......................: 227705  1867.422427/s
     iteration_duration.............: avg=26.35ms  min=17.03ms med=25.73ms max=329.1ms  p(90)=30.81ms  p(95)=32.7ms  p(99.9)=51.26ms
     iterations.....................: 227605  1866.602321/s
     success_rate...................: 100.00% ✓ 227605      ✗ 0     
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

     checks.........................: 100.00% ✓ 676680      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3.27µs  min=992ns   med=2.71µs  max=2.52ms   p(90)=4.36µs  p(95)=5.1µs    p(99.9)=36.05µs
     http_req_connecting............: avg=219ns   min=0s      med=0s      max=2.49ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.36ms min=18.07ms med=25.9ms  max=297.32ms p(90)=30.13ms p(95)=31.59ms  p(99.9)=47.88ms
       { expected_response:true }...: avg=26.36ms min=18.07ms med=25.9ms  max=297.32ms p(90)=30.13ms p(95)=31.59ms  p(99.9)=47.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225660
     http_req_receiving.............: avg=77.51µs min=25.19µs med=52.22µs max=147.21ms p(90)=96.51µs p(95)=125.19µs p(99.9)=2.01ms 
     http_req_sending...............: avg=33.36µs min=4.73µs  med=10.52µs max=95.51ms  p(90)=19.04µs p(95)=27.71µs  p(99.9)=1.49ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.25ms min=17.93ms med=25.8ms  max=297ms    p(90)=30.01ms p(95)=31.46ms  p(99.9)=46.59ms
     http_reqs......................: 225660  1850.31951/s
     iteration_duration.............: avg=26.59ms min=18.81ms med=26.11ms max=310.81ms p(90)=30.34ms p(95)=31.8ms   p(99.9)=48.34ms
     iterations.....................: 225560  1849.499551/s
     success_rate...................: 100.00% ✓ 225560      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 661224      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=2.9µs    min=812ns   med=2.03µs  max=3.49ms   p(90)=3.84µs   p(95)=4.56µs  p(99.9)=31.55µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=3.47ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.99ms  min=17.86ms med=26.43ms max=305.13ms p(90)=31.5ms   p(95)=33.34ms p(99.9)=49.43ms
       { expected_response:true }...: avg=26.99ms  min=17.86ms med=26.43ms max=305.13ms p(90)=31.5ms   p(95)=33.34ms p(99.9)=49.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220508
     http_req_receiving.............: avg=326.16µs min=50.95µs med=100.1µs max=192.5ms  p(90)=832.73µs p(95)=1.31ms  p(99.9)=7.85ms 
     http_req_sending...............: avg=31.44µs  min=4.44µs  med=8.69µs  max=170.98ms p(90)=19.27µs  p(95)=28.33µs p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.63ms  min=17.75ms med=26.08ms max=304.53ms p(90)=31.07ms  p(95)=32.88ms p(99.9)=48.11ms
     http_reqs......................: 220508  1807.576324/s
     iteration_duration.............: avg=27.21ms  min=18.05ms med=26.63ms max=314.77ms p(90)=31.7ms   p(95)=33.54ms p(99.9)=49.78ms
     iterations.....................: 220408  1806.756592/s
     success_rate...................: 100.00% ✓ 220408      ✗ 0     
     vus............................: 6       min=0         max=50  
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

     checks.........................: 100.00% ✓ 476748      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3.87µs  min=822ns   med=2.74µs  max=3.53ms   p(90)=5.12µs   p(95)=6.1µs    p(99.9)=43.45µs
     http_req_connecting............: avg=637ns   min=0s      med=0s      max=3.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.48ms min=18.59ms med=37.2ms  max=309.18ms p(90)=44.06ms  p(95)=46.15ms  p(99.9)=63.97ms
       { expected_response:true }...: avg=37.48ms min=18.59ms med=37.2ms  max=309.18ms p(90)=44.06ms  p(95)=46.15ms  p(99.9)=63.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159016
     http_req_receiving.............: avg=91.4µs  min=26.23µs med=59.45µs max=162.64ms p(90)=128.34µs p(95)=174.88µs p(99.9)=1.83ms 
     http_req_sending...............: avg=35.59µs min=4.73µs  med=10.73µs max=170.65ms p(90)=24.59µs  p(95)=49.28µs  p(99.9)=1.88ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.35ms min=18.44ms med=37.08ms max=308.55ms p(90)=43.94ms  p(95)=46.03ms  p(99.9)=62.66ms
     http_reqs......................: 159016  1303.37755/s
     iteration_duration.............: avg=37.74ms min=21.68ms med=37.44ms max=324.11ms p(90)=44.28ms  p(95)=46.38ms  p(99.9)=64.61ms
     iterations.....................: 158916  1302.557898/s
     success_rate...................: 100.00% ✓ 158916      ✗ 0     
     vus............................: 21      min=0         max=50  
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

     checks.........................: 100.00% ✓ 424920      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.7µs   min=1.09µs  med=2.78µs  max=3.46ms   p(90)=4.35µs  p(95)=5.07µs   p(99.9)=39.94µs 
     http_req_connecting............: avg=603ns   min=0s      med=0s      max=3.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.11ms min=18.53ms med=41.48ms max=302.47ms p(90)=50.9ms  p(95)=53.88ms  p(99.9)=69.97ms 
       { expected_response:true }...: avg=42.11ms min=18.53ms med=41.48ms max=302.47ms p(90)=50.9ms  p(95)=53.88ms  p(99.9)=69.97ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 141740
     http_req_receiving.............: avg=82.72µs min=29.39µs med=68.52µs max=71.04ms  p(90)=110.1µs p(95)=129.31µs p(99.9)=812.62µs
     http_req_sending...............: avg=26.53µs min=5.09µs  med=12.22µs max=152.05ms p(90)=19.08µs p(95)=22.95µs  p(99.9)=981.96µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42ms    min=18.42ms med=41.37ms max=301.91ms p(90)=50.79ms p(95)=53.76ms  p(99.9)=69.52ms 
     http_reqs......................: 141740  1161.768571/s
     iteration_duration.............: avg=42.35ms min=21.77ms med=41.69ms max=319.75ms p(90)=51.11ms p(95)=54.09ms  p(99.9)=70.35ms 
     iterations.....................: 141640  1160.948923/s
     success_rate...................: 100.00% ✓ 141640      ✗ 0     
     vus............................: 40      min=0         max=50  
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

     checks.........................: 100.00% ✓ 201117     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   660 kB/s
     http_req_blocked...............: avg=4.95µs  min=1.17µs  med=3.33µs  max=4.11ms   p(90)=4.85µs   p(95)=5.54µs   p(99.9)=49.94µs 
     http_req_connecting............: avg=1.36µs  min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.16ms min=21.03ms med=93.35ms max=302.21ms p(90)=118.21ms p(95)=127.09ms p(99.9)=209.52ms
       { expected_response:true }...: avg=89.16ms min=21.03ms med=93.35ms max=302.21ms p(90)=118.21ms p(95)=127.09ms p(99.9)=209.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67139
     http_req_receiving.............: avg=90µs    min=29.63µs med=78.82µs max=124.78ms p(90)=115.28µs p(95)=129.08µs p(99.9)=688.75µs
     http_req_sending...............: avg=26.41µs min=5.35µs  med=15.46µs max=138.74ms p(90)=22.12µs  p(95)=24.41µs  p(99.9)=661.24µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.04ms min=20.88ms med=93.24ms max=301.62ms p(90)=118.11ms p(95)=126.96ms p(99.9)=209.09ms
     http_reqs......................: 67139   549.105571/s
     iteration_duration.............: avg=89.51ms min=29.07ms med=93.64ms max=326.71ms p(90)=118.48ms p(95)=127.36ms p(99.9)=210.74ms
     iterations.....................: 67039   548.287707/s
     success_rate...................: 100.00% ✓ 67039      ✗ 0    
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

     checks.........................: 100.00% ✓ 144054     ✗ 0    
     data_received..................: 4.2 GB  34 MB/s
     data_sent......................: 58 MB   472 kB/s
     http_req_blocked...............: avg=6µs      min=1.47µs  med=3.67µs   max=3.83ms   p(90)=5.14µs   p(95)=5.77µs   p(99.9)=756.39µs
     http_req_connecting............: avg=2.07µs   min=0s      med=0s       max=3.78ms   p(90)=0s       p(95)=0s       p(99.9)=734.91µs
     http_req_duration..............: avg=124.48ms min=21.09ms med=122.42ms max=344.1ms  p(90)=155.63ms p(95)=166.06ms p(99.9)=210.75ms
       { expected_response:true }...: avg=124.48ms min=21.09ms med=122.42ms max=344.1ms  p(90)=155.63ms p(95)=166.06ms p(99.9)=210.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48118
     http_req_receiving.............: avg=127.07µs min=33.54µs med=85.86µs  max=221.34ms p(90)=118.11µs p(95)=130.6µs  p(99.9)=739.58µs
     http_req_sending...............: avg=27.35µs  min=6.37µs  med=17.79µs  max=74.96ms  p(90)=22.99µs  p(95)=25.02µs  p(99.9)=569.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.33ms min=20.94ms med=122.29ms max=343.78ms p(90)=155.46ms p(95)=165.83ms p(99.9)=209.22ms
     http_reqs......................: 48118   393.272495/s
     iteration_duration.............: avg=124.98ms min=36.08ms med=122.75ms max=352.08ms p(90)=155.93ms p(95)=166.39ms p(99.9)=213.16ms
     iterations.....................: 48018   392.455187/s
     success_rate...................: 100.00% ✓ 48018      ✗ 0    
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

     checks.........................: 100.00% ✓ 98295      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 40 MB   322 kB/s
     http_req_blocked...............: avg=7µs      min=1.12µs  med=3.78µs   max=4.11ms   p(90)=5.36µs   p(95)=6.03µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.94µs   min=0s      med=0s       max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=1.37ms  
     http_req_duration..............: avg=182.4ms  min=23.43ms med=187.72ms max=364.64ms p(90)=196.65ms p(95)=201.44ms p(99.9)=272.44ms
       { expected_response:true }...: avg=182.4ms  min=23.43ms med=187.72ms max=364.64ms p(90)=196.65ms p(95)=201.44ms p(99.9)=272.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32865
     http_req_receiving.............: avg=100.62µs min=35.8µs  med=92.53µs  max=83.56ms  p(90)=125.47µs p(95)=139.04µs p(99.9)=591.7µs 
     http_req_sending...............: avg=33.49µs  min=6.37µs  med=18.65µs  max=134.44ms p(90)=23.97µs  p(95)=26.09µs  p(99.9)=558.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.27ms min=23.14ms med=187.6ms  max=363.97ms p(90)=196.5ms  p(95)=201.31ms p(99.9)=272.33ms
     http_reqs......................: 32865   267.943137/s
     iteration_duration.............: avg=183.21ms min=61.18ms med=188.02ms max=381.09ms p(90)=196.98ms p(95)=201.8ms  p(99.9)=273.95ms
     iterations.....................: 32765   267.127853/s
     success_rate...................: 100.00% ✓ 32765      ✗ 0    
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

     checks.........................: 100.00% ✓ 96522      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   317 kB/s
     http_req_blocked...............: avg=6.41µs   min=1.12µs  med=3.27µs   max=4.02ms   p(90)=4.71µs   p(95)=5.35µs   p(99.9)=1.25ms  
     http_req_connecting............: avg=2.88µs   min=0s      med=0s       max=3.98ms   p(90)=0s       p(95)=0s       p(99.9)=1.23ms  
     http_req_duration..............: avg=185.77ms min=17.96ms med=173.65ms max=645.21ms p(90)=220.78ms p(95)=254.81ms p(99.9)=572.64ms
       { expected_response:true }...: avg=185.77ms min=17.96ms med=173.65ms max=645.21ms p(90)=220.78ms p(95)=254.81ms p(99.9)=572.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32274
     http_req_receiving.............: avg=95.68µs  min=31.43µs med=92.08µs  max=24.69ms  p(90)=123.53µs p(95)=136.35µs p(99.9)=580.89µs
     http_req_sending...............: avg=29.76µs  min=5.26µs  med=18.35µs  max=78.93ms  p(90)=23.05µs  p(95)=24.97µs  p(99.9)=576.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.64ms min=17.8ms  med=173.53ms max=645.1ms  p(90)=220.67ms p(95)=254.7ms  p(99.9)=572.53ms
     http_reqs......................: 32274   264.395165/s
     iteration_duration.............: avg=186.57ms min=49.21ms med=174.07ms max=645.52ms p(90)=221.15ms p(95)=256.02ms p(99.9)=573.01ms
     iterations.....................: 32174   263.575944/s
     success_rate...................: 100.00% ✓ 32174      ✗ 0    
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

     checks.........................: 100.00% ✓ 6537      ✗ 0   
     data_received..................: 218 MB  1.7 MB/s
     data_sent......................: 2.7 MB  22 kB/s
     http_req_blocked...............: avg=43.62µs min=1.45µs   med=3.55µs  max=3.69ms p(90)=5.12µs   p(95)=6.01µs   p(99.9)=3.42ms
     http_req_connecting............: avg=39.46µs min=0s       med=0s      max=3.65ms p(90)=0s       p(95)=0s       p(99.9)=3.4ms 
     http_req_duration..............: avg=2.66s   min=38.48ms  med=2.78s   max=4.61s  p(90)=3.38s    p(95)=3.57s    p(99.9)=4.53s 
       { expected_response:true }...: avg=2.66s   min=38.48ms  med=2.78s   max=4.61s  p(90)=3.38s    p(95)=3.57s    p(99.9)=4.53s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2279
     http_req_receiving.............: avg=97.05µs min=35.88µs  med=88.95µs max=4.55ms p(90)=129.81µs p(95)=145.79µs p(99.9)=1.41ms
     http_req_sending...............: avg=33.97µs min=6.52µs   med=17.88µs max=2.79ms p(90)=23.52µs  p(95)=27.31µs  p(99.9)=2.19ms
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.66s   min=38.33ms  med=2.78s   max=4.61s  p(90)=3.38s    p(95)=3.57s    p(99.9)=4.53s 
     http_reqs......................: 2279    17.902339/s
     iteration_duration.............: avg=2.78s   min=268.72ms med=2.81s   max=4.61s  p(90)=3.4s     p(95)=3.58s    p(99.9)=4.54s 
     iterations.....................: 2179    17.116804/s
     success_rate...................: 100.00% ✓ 2179      ✗ 0   
     vus............................: 25      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

