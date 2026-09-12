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
| fusion | 16.6.6 | 1,897 | 1,937 | 1,889 | 0.8% |  |
| fusion-nightly | 16.7.0-p.6 | 1,881 | 1,928 | 1,874 | 0.9% |  |
| fusion-nightly-net11 | 16.7.0-p.6 | 1,865 | 1,915 | 1,856 | 1.1% |  |
| hive-router | v0.0.84 | 1,857 | 1,916 | 1,845 | 1.3% |  |
| fusion-nightly-fed | 16.7.0-p.6 | 1,797 | 1,853 | 1,789 | 1.2% |  |
| grafbase | 0.53.5 | 1,273 | 1,312 | 1,267 | 1.3% |  |
| cosmo | 0.334.0 | 1,222 | 1,266 | 1,220 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 544 | 568 | 542 | 1.7% |  |
| apollo-router | v2.16.1 | 429 | 448 | 427 | 1.6% |  |
| hive-gateway | 2.10.8 | 262 | 268 | 260 | 1.1% |  |
| apollo-gateway | 2.14.3 | 258 | 262 | 257 | 0.6% |  |
| feddi | 5ff8b6165878 | 20 | 20 | 19 | 2.5% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 693729      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.78µs   min=821ns   med=1.91µs  max=8.23ms   p(90)=3.57µs   p(95)=4.37µs  p(99.9)=28.13µs
     http_req_connecting............: avg=414ns    min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.73ms  min=17.4ms  med=25.13ms max=297.25ms p(90)=30.05ms  p(95)=31.85ms p(99.9)=48.58ms
       { expected_response:true }...: avg=25.73ms  min=17.4ms  med=25.13ms max=297.25ms p(90)=30.05ms  p(95)=31.85ms p(99.9)=48.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231343
     http_req_receiving.............: avg=293.49µs min=49.06µs med=90.36µs max=182.2ms  p(90)=734.09µs p(95)=1.23ms  p(99.9)=7.48ms 
     http_req_sending...............: avg=30.93µs  min=4.34µs  med=8.17µs  max=154.77ms p(90)=17.8µs   p(95)=29.38µs p(99.9)=1.53ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.4ms   min=17.22ms med=24.83ms max=297.05ms p(90)=29.66ms  p(95)=31.42ms p(99.9)=46.74ms
     http_reqs......................: 231343  1897.123211/s
     iteration_duration.............: avg=25.94ms  min=17.7ms  med=25.33ms max=328.04ms p(90)=30.25ms  p(95)=32.05ms p(99.9)=49.11ms
     iterations.....................: 231243  1896.303163/s
     success_rate...................: 100.00% ✓ 231243      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688101      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.82µs   min=841ns   med=1.98µs  max=3.63ms   p(90)=3.63µs   p(95)=4.39µs  p(99.9)=30.58µs
     http_req_connecting............: avg=418ns    min=0s      med=0s      max=3.59ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.93ms  min=16.62ms med=25.35ms max=291.83ms p(90)=30.32ms  p(95)=32.15ms p(99.9)=49.27ms
       { expected_response:true }...: avg=25.93ms  min=16.62ms med=25.35ms max=291.83ms p(90)=30.32ms  p(95)=32.15ms p(99.9)=49.27ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229467
     http_req_receiving.............: avg=309.83µs min=48.85µs med=93.11µs max=226.62ms p(90)=784.41µs p(95)=1.3ms   p(99.9)=7.72ms 
     http_req_sending...............: avg=32.73µs  min=4.65µs  med=8.5µs   max=123.41ms p(90)=18.87µs  p(95)=33.73µs p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.59ms  min=16.54ms med=25.03ms max=291.43ms p(90)=29.88ms  p(95)=31.67ms p(99.9)=47.88ms
     http_reqs......................: 229467  1881.837068/s
     iteration_duration.............: avg=26.15ms  min=16.77ms med=25.56ms max=307.85ms p(90)=30.52ms  p(95)=32.35ms p(99.9)=49.74ms
     iterations.....................: 229367  1881.016978/s
     success_rate...................: 100.00% ✓ 229367      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681915      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.77µs   min=911ns   med=1.93µs  max=4.15ms   p(90)=3.58µs  p(95)=4.29µs  p(99.9)=28.49µs
     http_req_connecting............: avg=402ns    min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.17ms  min=16.23ms med=25.62ms max=288.06ms p(90)=30.33ms p(95)=32.15ms p(99.9)=50.59ms
       { expected_response:true }...: avg=26.17ms  min=16.23ms med=25.62ms max=288.06ms p(90)=30.33ms p(95)=32.15ms p(99.9)=50.59ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227405
     http_req_receiving.............: avg=413.23µs min=49.62µs med=93.39µs max=201.02ms p(90)=1.18ms  p(95)=1.88ms  p(99.9)=11.37ms
     http_req_sending...............: avg=33.93µs  min=4.27µs  med=8.09µs  max=125.45ms p(90)=18.12µs p(95)=33.8µs  p(99.9)=2.21ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.72ms  min=16.13ms med=25.2ms  max=287.44ms p(90)=29.73ms p(95)=31.43ms p(99.9)=48.25ms
     http_reqs......................: 227405  1865.123597/s
     iteration_duration.............: avg=26.38ms  min=16.45ms med=25.82ms max=305.14ms p(90)=30.53ms p(95)=32.35ms p(99.9)=51.06ms
     iterations.....................: 227305  1864.30342/s
     success_rate...................: 100.00% ✓ 227305      ✗ 0     
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

     checks.........................: 100.00% ✓ 679128      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.12µs  min=971ns   med=2.43µs  max=3.73ms   p(90)=4.1µs   p(95)=4.83µs   p(99.9)=35.07µs
     http_req_connecting............: avg=313ns   min=0s      med=0s      max=3.7ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.27ms min=18.08ms med=25.83ms max=299.63ms p(90)=29.99ms p(95)=31.41ms  p(99.9)=46.6ms 
       { expected_response:true }...: avg=26.27ms min=18.08ms med=25.83ms max=299.63ms p(90)=29.99ms p(95)=31.41ms  p(99.9)=46.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 226476
     http_req_receiving.............: avg=73.41µs min=24.83µs med=50.16µs max=115.54ms p(90)=94.16µs p(95)=120.48µs p(99.9)=1.77ms 
     http_req_sending...............: avg=32.24µs min=4.72µs  med=10.33µs max=200.17ms p(90)=19.39µs p(95)=27.01µs  p(99.9)=1.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.17ms min=17.99ms med=25.74ms max=299.04ms p(90)=29.87ms p(95)=31.28ms  p(99.9)=45.28ms
     http_reqs......................: 226476  1857.285313/s
     iteration_duration.............: avg=26.49ms min=18.31ms med=26.04ms max=308.33ms p(90)=30.2ms  p(95)=31.61ms  p(99.9)=46.93ms
     iterations.....................: 226376  1856.465233/s
     success_rate...................: 100.00% ✓ 226376      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 657540      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=3.67µs   min=862ns   med=2µs     max=166.54ms p(90)=3.7µs    p(95)=4.47µs  p(99.9)=28.47µs
     http_req_connecting............: avg=438ns    min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.15ms  min=18.06ms med=26.55ms max=278.78ms p(90)=31.79ms  p(95)=33.68ms p(99.9)=50.6ms 
       { expected_response:true }...: avg=27.15ms  min=18.06ms med=26.55ms max=278.78ms p(90)=31.79ms  p(95)=33.68ms p(99.9)=50.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 219280
     http_req_receiving.............: avg=315.89µs min=50.16µs med=98.59µs max=167.34ms p(90)=791.08µs p(95)=1.27ms  p(99.9)=7.69ms 
     http_req_sending...............: avg=31.57µs  min=4.44µs  med=8.42µs  max=241.36ms p(90)=17.43µs  p(95)=29.82µs p(99.9)=1.58ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.8ms   min=17.85ms med=26.23ms max=274.95ms p(90)=31.38ms  p(95)=33.24ms p(99.9)=49.26ms
     http_reqs......................: 219280  1797.410639/s
     iteration_duration.............: avg=27.36ms  min=18.24ms med=26.76ms max=308.09ms p(90)=31.99ms  p(95)=33.88ms p(99.9)=51.03ms
     iterations.....................: 219180  1796.590952/s
     success_rate...................: 100.00% ✓ 219180      ✗ 0     
     vus............................: 37      min=0         max=50  
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

     checks.........................: 100.00% ✓ 465786      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 187 MB  1.5 MB/s
     http_req_blocked...............: avg=3.29µs  min=882ns   med=2.19µs  max=6.12ms   p(90)=4.52µs   p(95)=5.5µs    p(99.9)=44.6µs 
     http_req_connecting............: avg=469ns   min=0s      med=0s      max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.38ms min=18.21ms med=38.14ms max=309.13ms p(90)=45.19ms  p(95)=47.32ms  p(99.9)=63.81ms
       { expected_response:true }...: avg=38.38ms min=18.21ms med=38.14ms max=309.13ms p(90)=45.19ms  p(95)=47.32ms  p(99.9)=63.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 155362
     http_req_receiving.............: avg=85.92µs min=26.59µs med=54.07µs max=148.21ms p(90)=122.28µs p(95)=169.87µs p(99.9)=2.28ms 
     http_req_sending...............: avg=32.03µs min=4.66µs  med=9.41µs  max=116.82ms p(90)=23.62µs  p(95)=59.37µs  p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.26ms min=18.09ms med=38.04ms max=308.14ms p(90)=45.07ms  p(95)=47.17ms  p(99.9)=63.22ms
     http_reqs......................: 155362  1273.422771/s
     iteration_duration.............: avg=38.64ms min=20.76ms med=38.38ms max=324.82ms p(90)=45.41ms  p(95)=47.53ms  p(99.9)=64.37ms
     iterations.....................: 155262  1272.603123/s
     success_rate...................: 100.00% ✓ 155262      ✗ 0     
     vus............................: 36      min=0         max=50  
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

     checks.........................: 100.00% ✓ 447093      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.9µs   min=1.07µs  med=2.96µs  max=3.24ms   p(90)=4.65µs   p(95)=5.39µs  p(99.9)=39.47µs
     http_req_connecting............: avg=620ns   min=0s      med=0s      max=3.21ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=40.01ms min=18.4ms  med=39.42ms max=297.91ms p(90)=48.06ms  p(95)=50.81ms p(99.9)=65.76ms
       { expected_response:true }...: avg=40.01ms min=18.4ms  med=39.42ms max=297.91ms p(90)=48.06ms  p(95)=50.81ms p(99.9)=65.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149131
     http_req_receiving.............: avg=82.47µs min=25.58µs med=65.33µs max=66.37ms  p(90)=107.99µs p(95)=127.7µs p(99.9)=1.17ms 
     http_req_sending...............: avg=31.04µs min=5.21µs  med=12.39µs max=141.77ms p(90)=19.9µs   p(95)=24.45µs p(99.9)=1.14ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=39.89ms min=18.25ms med=39.31ms max=297.33ms p(90)=47.94ms  p(95)=50.68ms p(99.9)=65.14ms
     http_reqs......................: 149131  1222.407525/s
     iteration_duration.............: avg=40.25ms min=20.89ms med=39.63ms max=315.16ms p(90)=48.28ms  p(95)=51.02ms p(99.9)=66.1ms 
     iterations.....................: 149031  1221.587838/s
     success_rate...................: 100.00% ✓ 149031      ✗ 0     
     vus............................: 38      min=0         max=50  
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

     checks.........................: 100.00% ✓ 199329     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   654 kB/s
     http_req_blocked...............: avg=5.15µs  min=1.33µs  med=3.44µs  max=4.14ms   p(90)=5µs      p(95)=5.68µs   p(99.9)=50.89µs 
     http_req_connecting............: avg=1.42µs  min=0s      med=0s      max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=89.93ms min=20.6ms  med=87.74ms max=321.69ms p(90)=111.43ms p(95)=121.1ms  p(99.9)=217.67ms
       { expected_response:true }...: avg=89.93ms min=20.6ms  med=87.74ms max=321.69ms p(90)=111.43ms p(95)=121.1ms  p(99.9)=217.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66543
     http_req_receiving.............: avg=89.25µs min=31.32µs med=77.83µs max=153.5ms  p(90)=113.32µs p(95)=126.66µs p(99.9)=669.76µs
     http_req_sending...............: avg=23.3µs  min=5.61µs  med=15.44µs max=50.1ms   p(90)=21.92µs  p(95)=24.21µs  p(99.9)=597.64µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=89.82ms min=20.46ms med=87.63ms max=321.3ms  p(90)=111.32ms p(95)=120.96ms p(99.9)=217.11ms
     http_reqs......................: 66543   544.349306/s
     iteration_duration.............: avg=90.3ms  min=29.68ms med=88.01ms max=340.05ms p(90)=111.67ms p(95)=121.38ms p(99.9)=219.45ms
     iterations.....................: 66443   543.531265/s
     success_rate...................: 100.00% ✓ 66443      ✗ 0    
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

     checks.........................: 100.00% ✓ 157191     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   515 kB/s
     http_req_blocked...............: avg=5.76µs   min=1.32µs  med=3.68µs   max=3.98ms   p(90)=5.22µs   p(95)=5.86µs   p(99.9)=118.53µs
     http_req_connecting............: avg=1.79µs   min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.04ms min=21.53ms med=112.27ms max=339.3ms  p(90)=141.97ms p(95)=151.47ms p(99.9)=189.67ms
       { expected_response:true }...: avg=114.04ms min=21.53ms med=112.27ms max=339.3ms  p(90)=141.97ms p(95)=151.47ms p(99.9)=189.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52497
     http_req_receiving.............: avg=96.7µs   min=32.86µs med=89.46µs  max=73.02ms  p(90)=121.55µs p(95)=134.3µs  p(99.9)=625.35µs
     http_req_sending...............: avg=25.93µs  min=6.45µs  med=18.61µs  max=91.45ms  p(90)=24.04µs  p(95)=26.18µs  p(99.9)=568.65µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.92ms min=21.39ms med=112.15ms max=339.05ms p(90)=141.84ms p(95)=151.35ms p(99.9)=188.87ms
     http_reqs......................: 52497   429.13747/s
     iteration_duration.............: avg=114.53ms min=35.62ms med=112.59ms max=356.48ms p(90)=142.29ms p(95)=151.8ms  p(99.9)=193.7ms 
     iterations.....................: 52397   428.320018/s
     success_rate...................: 100.00% ✓ 52397      ✗ 0    
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

     checks.........................: 100.00% ✓ 95754      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=6.95µs   min=1.48µs  med=3.85µs   max=3.56ms   p(90)=5.4µs    p(95)=6.02µs   p(99.9)=1.4ms   
     http_req_connecting............: avg=2.82µs   min=0s      med=0s       max=3.53ms   p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=187.23ms min=18.56ms med=174.39ms max=643.2ms  p(90)=236.67ms p(95)=272.26ms p(99.9)=560.45ms
       { expected_response:true }...: avg=187.23ms min=18.56ms med=174.39ms max=643.2ms  p(90)=236.67ms p(95)=272.26ms p(99.9)=560.45ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32018
     http_req_receiving.............: avg=100.9µs  min=35.84µs med=92.77µs  max=94.78ms  p(90)=124.9µs  p(95)=138.03µs p(99.9)=610.97µs
     http_req_sending...............: avg=27.06µs  min=6.73µs  med=19.31µs  max=62.99ms  p(90)=24.41µs  p(95)=26.47µs  p(99.9)=525.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.11ms min=18.4ms  med=174.27ms max=643.04ms p(90)=236.55ms p(95)=272.12ms p(99.9)=560.36ms
     http_reqs......................: 32018   262.249887/s
     iteration_duration.............: avg=188.07ms min=37.05ms med=174.85ms max=643.52ms p(90)=237.09ms p(95)=273.99ms p(99.9)=560.82ms
     iterations.....................: 31918   261.430817/s
     success_rate...................: 100.00% ✓ 31918      ✗ 0    
     vus............................: 40      min=0        max=50 
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

     checks.........................: 100.00% ✓ 94935      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   311 kB/s
     http_req_blocked...............: avg=6.77µs   min=1.25µs  med=3.52µs   max=3.41ms   p(90)=4.95µs   p(95)=5.55µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=2.77µs   min=0s      med=0s       max=3.37ms   p(90)=0s       p(95)=0s       p(99.9)=1.4ms   
     http_req_duration..............: avg=188.88ms min=23.81ms med=191.19ms max=385.77ms p(90)=210.79ms p(95)=215.82ms p(99.9)=292.73ms
       { expected_response:true }...: avg=188.88ms min=23.81ms med=191.19ms max=385.77ms p(90)=210.79ms p(95)=215.82ms p(99.9)=292.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31745
     http_req_receiving.............: avg=97.19µs  min=37.06µs med=89.49µs  max=63.88ms  p(90)=121.61µs p(95)=134.89µs p(99.9)=644.19µs
     http_req_sending...............: avg=35.82µs  min=5.51µs  med=18.67µs  max=173.24ms p(90)=23.66µs  p(95)=25.59µs  p(99.9)=550.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.75ms min=23.67ms med=191.07ms max=385.29ms p(90)=210.67ms p(95)=215.71ms p(99.9)=292.25ms
     http_reqs......................: 31745   258.783893/s
     iteration_duration.............: avg=189.71ms min=56.37ms med=191.65ms max=408.73ms p(90)=211.09ms p(95)=216.14ms p(99.9)=294.74ms
     iterations.....................: 31645   257.968697/s
     success_rate...................: 100.00% ✓ 31645      ✗ 0    
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

     checks.........................: 100.00% ✓ 7671      ✗ 0   
     data_received..................: 254 MB  2.0 MB/s
     data_sent......................: 3.2 MB  25 kB/s
     http_req_blocked...............: avg=70.28µs  min=1.47µs   med=3.78µs  max=9.64ms  p(90)=5.52µs   p(95)=6.42µs   p(99.9)=8.73ms  
     http_req_connecting............: avg=63.42µs  min=0s       med=0s      max=9.6ms   p(90)=0s       p(95)=0s       p(99.9)=8.69ms  
     http_req_duration..............: avg=2.28s    min=37.3ms   med=2.3s    max=4.55s   p(90)=3.05s    p(95)=3.31s    p(99.9)=4.36s   
       { expected_response:true }...: avg=2.28s    min=37.3ms   med=2.3s    max=4.55s   p(90)=3.05s    p(95)=3.31s    p(99.9)=4.36s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2657
     http_req_receiving.............: avg=107.69µs min=32.78µs  med=98.84µs max=7.05ms  p(90)=142.77µs p(95)=163.82µs p(99.9)=991.69µs
     http_req_sending...............: avg=97.09µs  min=6.85µs   med=19.77µs max=22.43ms p(90)=25.56µs  p(95)=29.04µs  p(99.9)=8.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.28s    min=37.2ms   med=2.3s    max=4.55s   p(90)=3.04s    p(95)=3.31s    p(99.9)=4.36s   
     http_reqs......................: 2657    20.915685/s
     iteration_duration.............: avg=2.37s    min=761.95ms med=2.32s   max=4.55s   p(90)=3.06s    p(95)=3.34s    p(99.9)=4.36s   
     iterations.....................: 2557    20.128493/s
     success_rate...................: 100.00% ✓ 2557      ✗ 0   
     vus............................: 13      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

