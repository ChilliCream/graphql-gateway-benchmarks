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
| fusion-nightly | 16.5.0-p.18 | 1,865 | 1,912 | 1,856 | 1.0% |  |
| fusion-nightly-net11 | 16.5.0-p.18 | 1,854 | 1,916 | 1,845 | 1.3% |  |
| hive-router | v0.0.78 | 1,853 | 1,921 | 1,845 | 1.4% |  |
| fusion | 16.4.0 | 1,836 | 1,889 | 1,826 | 1.1% |  |
| fusion-nightly-fed | 16.5.0-p.18 | 1,760 | 1,803 | 1,754 | 1.0% |  |
| grafbase | 0.53.5 | 1,296 | 1,337 | 1,291 | 1.2% |  |
| cosmo | 0.329.0 | 1,153 | 1,199 | 1,149 | 1.5% |  |
| hive-gateway-router-runtime | 2.10.2 | 553 | 573 | 547 | 1.5% |  |
| apollo-router | v2.16.0 | 438 | 455 | 436 | 1.5% |  |
| hive-gateway | 2.10.2 | 265 | 272 | 264 | 1.0% |  |
| apollo-gateway | 2.14.2 | 257 | 262 | 256 | 0.8% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.0% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 681966      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=2.79µs   min=911ns   med=1.98µs  max=4ms      p(90)=3.52µs   p(95)=4.24µs  p(99.9)=27.67µs
     http_req_connecting............: avg=428ns    min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.17ms  min=17.34ms med=25.6ms  max=311.23ms p(90)=30.53ms  p(95)=32.3ms  p(99.9)=48.8ms 
       { expected_response:true }...: avg=26.17ms  min=17.34ms med=25.6ms  max=311.23ms p(90)=30.53ms  p(95)=32.3ms  p(99.9)=48.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 227422
     http_req_receiving.............: avg=318.28µs min=50.54µs med=96.9µs  max=185.9ms  p(90)=797.86µs p(95)=1.26ms  p(99.9)=8.03ms 
     http_req_sending...............: avg=29.15µs  min=4.55µs  med=8.4µs   max=129.27ms p(90)=17.33µs  p(95)=27.74µs p(99.9)=1.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.82ms  min=17.04ms med=25.27ms max=311.01ms p(90)=30.12ms  p(95)=31.85ms p(99.9)=47.57ms
     http_reqs......................: 227422  1865.16288/s
     iteration_duration.............: avg=26.38ms  min=17.53ms med=25.8ms  max=320.45ms p(90)=30.74ms  p(95)=32.51ms p(99.9)=49.17ms
     iterations.....................: 227322  1864.342747/s
     success_rate...................: 100.00% ✓ 227322      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 678174      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.76µs   min=832ns   med=1.94µs  max=4.01ms   p(90)=3.58µs   p(95)=4.3µs   p(99.9)=28.24µs
     http_req_connecting............: avg=385ns    min=0s      med=0s      max=3.48ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.31ms  min=17.33ms med=25.74ms max=306.43ms p(90)=30.63ms  p(95)=32.48ms p(99.9)=50.43ms
       { expected_response:true }...: avg=26.31ms  min=17.33ms med=25.74ms max=306.43ms p(90)=30.63ms  p(95)=32.48ms p(99.9)=50.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226158
     http_req_receiving.............: avg=327.48µs min=50.27µs med=92.98µs max=53.61ms  p(90)=872.86µs p(95)=1.43ms  p(99.9)=8.22ms 
     http_req_sending...............: avg=33.39µs  min=4.56µs  med=8.45µs  max=175.84ms p(90)=19.19µs  p(95)=30.36µs p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.95ms  min=17.25ms med=25.4ms  max=305.82ms p(90)=30.18ms  p(95)=31.97ms p(99.9)=48.42ms
     http_reqs......................: 226158  1854.981417/s
     iteration_duration.............: avg=26.53ms  min=17.57ms med=25.95ms max=315.09ms p(90)=30.83ms  p(95)=32.68ms p(99.9)=50.76ms
     iterations.....................: 226058  1854.161202/s
     success_rate...................: 100.00% ✓ 226058      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.78)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 677817      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=2.96µs  min=922ns   med=2.14µs  max=5.22ms   p(90)=3.88µs  p(95)=4.6µs    p(99.9)=32.34µs
     http_req_connecting............: avg=406ns   min=0s      med=0s      max=3.54ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.33ms min=17.74ms med=25.88ms max=300.57ms p(90)=30.04ms p(95)=31.45ms  p(99.9)=48.64ms
       { expected_response:true }...: avg=26.33ms min=17.74ms med=25.88ms max=300.57ms p(90)=30.04ms p(95)=31.45ms  p(99.9)=48.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226039
     http_req_receiving.............: avg=71.73µs min=24.53µs med=47.45µs max=122.96ms p(90)=90.81µs p(95)=116.63µs p(99.9)=1.73ms 
     http_req_sending...............: avg=29.71µs min=4.66µs  med=9.06µs  max=150.15ms p(90)=18.4µs  p(95)=25.52µs  p(99.9)=1.4ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.23ms min=17.63ms med=25.79ms max=299.86ms p(90)=29.93ms p(95)=31.33ms  p(99.9)=47.79ms
     http_reqs......................: 226039  1853.690855/s
     iteration_duration.............: avg=26.54ms min=17.91ms med=26.09ms max=310.29ms p(90)=30.24ms p(95)=31.65ms  p(99.9)=48.97ms
     iterations.....................: 225939  1852.87078/s
     success_rate...................: 100.00% ✓ 225939      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.4.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 671421      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=2.83µs   min=901ns   med=1.92µs   max=9.48ms   p(90)=3.56µs   p(95)=4.3µs   p(99.9)=28.8µs 
     http_req_connecting............: avg=463ns    min=0s      med=0s       max=4.37ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.59ms  min=17.11ms med=26.02ms  max=304.35ms p(90)=31.09ms  p(95)=32.96ms p(99.9)=48.83ms
       { expected_response:true }...: avg=26.59ms  min=17.11ms med=26.02ms  max=304.35ms p(90)=31.09ms  p(95)=32.96ms p(99.9)=48.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223907
     http_req_receiving.............: avg=350.14µs min=50.94µs med=101.57µs max=106.77ms p(90)=904.39µs p(95)=1.38ms  p(99.9)=8.17ms 
     http_req_sending...............: avg=28.54µs  min=4.48µs  med=8.18µs   max=185.73ms p(90)=16.79µs  p(95)=25.52µs p(99.9)=1.45ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.21ms  min=17.01ms med=25.65ms  max=303.67ms p(90)=30.64ms  p(95)=32.49ms p(99.9)=46.79ms
     http_reqs......................: 223907  1836.193134/s
     iteration_duration.............: avg=26.8ms   min=17.31ms med=26.22ms  max=312.06ms p(90)=31.29ms  p(95)=33.16ms p(99.9)=49.12ms
     iterations.....................: 223807  1835.373065/s
     success_rate...................: 100.00% ✓ 223807      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.5.0-p.18)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 643929      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 258 MB  2.1 MB/s
     http_req_blocked...............: avg=3.04µs   min=902ns   med=2.41µs  max=6.73ms   p(90)=4.2µs    p(95)=4.93µs  p(99.9)=34.52µs
     http_req_connecting............: avg=193ns    min=0s      med=0s      max=2.15ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.71ms  min=18.19ms med=27.15ms max=300.94ms p(90)=32.47ms  p(95)=34.32ms p(99.9)=52.18ms
       { expected_response:true }...: avg=27.71ms  min=18.19ms med=27.15ms max=300.94ms p(90)=32.47ms  p(95)=34.32ms p(99.9)=52.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 214743
     http_req_receiving.............: avg=324.34µs min=51.56µs med=98.77µs max=112.97ms p(90)=822.31µs p(95)=1.37ms  p(99.9)=8.3ms  
     http_req_sending...............: avg=33.63µs  min=4.8µs   med=9.92µs  max=230.06ms p(90)=20.47µs  p(95)=34.59µs p(99.9)=1.75ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.35ms  min=17.99ms med=26.81ms max=300.76ms p(90)=32.04ms  p(95)=33.85ms p(99.9)=50.34ms
     http_reqs......................: 214743  1760.689603/s
     iteration_duration.............: avg=27.94ms  min=18.36ms med=27.37ms max=317.6ms  p(90)=32.68ms  p(95)=34.54ms p(99.9)=52.77ms
     iterations.....................: 214643  1759.869697/s
     success_rate...................: 100.00% ✓ 214643      ✗ 0     
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

     checks.........................: 100.00% ✓ 473982      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 190 MB  1.6 MB/s
     http_req_blocked...............: avg=3.39µs  min=881ns   med=2.16µs  max=3.59ms   p(90)=4.56µs   p(95)=5.52µs   p(99.9)=39.79µs
     http_req_connecting............: avg=602ns   min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.72ms min=18.2ms  med=37.42ms max=314.33ms p(90)=44.25ms  p(95)=46.31ms  p(99.9)=64.74ms
       { expected_response:true }...: avg=37.72ms min=18.2ms  med=37.42ms max=314.33ms p(90)=44.25ms  p(95)=46.31ms  p(99.9)=64.74ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 158094
     http_req_receiving.............: avg=82.78µs min=26.15µs med=54.96µs max=77.69ms  p(90)=121.57µs p(95)=165.34µs p(99.9)=1.71ms 
     http_req_sending...............: avg=37.36µs min=4.72µs  med=9.19µs  max=170.03ms p(90)=23.3µs   p(95)=48.63µs  p(99.9)=1.89ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.6ms  min=18.06ms med=37.31ms max=313.99ms p(90)=44.13ms  p(95)=46.19ms  p(99.9)=64.06ms
     http_reqs......................: 158094  1296.061577/s
     iteration_duration.............: avg=37.96ms min=21.55ms med=37.65ms max=327.35ms p(90)=44.46ms  p(95)=46.53ms  p(99.9)=65ms   
     iterations.....................: 157994  1295.241772/s
     success_rate...................: 100.00% ✓ 157994      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.329.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 421833      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs  min=972ns   med=2.8µs   max=3.78ms   p(90)=4.39µs   p(95)=5.09µs   p(99.9)=39.16µs 
     http_req_connecting............: avg=602ns   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.42ms min=18.57ms med=41.8ms  max=315.14ms p(90)=51.31ms  p(95)=54.37ms  p(99.9)=70.52ms 
       { expected_response:true }...: avg=42.42ms min=18.57ms med=41.8ms  max=315.14ms p(90)=51.31ms  p(95)=54.37ms  p(99.9)=70.52ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 140711
     http_req_receiving.............: avg=86.92µs min=28.51µs med=71.49µs max=117.15ms p(90)=114.03µs p(95)=133.08µs p(99.9)=858.67µs
     http_req_sending...............: avg=26.75µs min=5.05µs  med=12.27µs max=170ms    p(90)=19.25µs  p(95)=23.11µs  p(99.9)=1.01ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=42.31ms min=18.42ms med=41.69ms max=314.43ms p(90)=51.19ms  p(95)=54.25ms  p(99.9)=70.13ms 
     http_reqs......................: 140711  1153.373586/s
     iteration_duration.............: avg=42.66ms min=22.8ms  med=42.01ms max=340.24ms p(90)=51.53ms  p(95)=54.58ms  p(99.9)=70.88ms 
     iterations.....................: 140611  1152.55391/s
     success_rate...................: 100.00% ✓ 140611      ✗ 0     
     vus............................: 31      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 202920     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   665 kB/s
     http_req_blocked...............: avg=4.17µs  min=1.04µs  med=2.69µs  max=3.38ms   p(90)=4.21µs   p(95)=4.81µs   p(99.9)=49.26µs 
     http_req_connecting............: avg=1.23µs  min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.38ms min=20.69ms med=86.8ms  max=333.54ms p(90)=105.29ms p(95)=113.68ms p(99.9)=205.71ms
       { expected_response:true }...: avg=88.38ms min=20.69ms med=86.8ms  max=333.54ms p(90)=105.29ms p(95)=113.68ms p(99.9)=205.71ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67740
     http_req_receiving.............: avg=85.11µs min=28.26µs med=72.21µs max=215.01ms p(90)=107.89µs p(95)=120.56µs p(99.9)=597.94µs
     http_req_sending...............: avg=20.3µs  min=4.8µs   med=13.1µs  max=104.32ms p(90)=19.55µs  p(95)=21.69µs  p(99.9)=561.97µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.27ms min=20.59ms med=86.7ms  max=332.91ms p(90)=105.18ms p(95)=113.57ms p(99.9)=204.83ms
     http_reqs......................: 67740   553.962665/s
     iteration_duration.............: avg=88.71ms min=36.25ms med=87.05ms max=342.37ms p(90)=105.52ms p(95)=113.95ms p(99.9)=208.05ms
     iterations.....................: 67640   553.144887/s
     success_rate...................: 100.00% ✓ 67640      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.16.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 160464     ✗ 0    
     data_received..................: 4.7 GB  38 MB/s
     data_sent......................: 64 MB   526 kB/s
     http_req_blocked...............: avg=5.54µs   min=1.27µs  med=3.69µs   max=3.43ms   p(90)=5.26µs   p(95)=5.9µs    p(99.9)=94.16µs 
     http_req_connecting............: avg=1.58µs   min=0s      med=0s       max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=111.72ms min=21.13ms med=109.9ms  max=351.55ms p(90)=139.03ms p(95)=148.11ms p(99.9)=190.84ms
       { expected_response:true }...: avg=111.72ms min=21.13ms med=109.9ms  max=351.55ms p(90)=139.03ms p(95)=148.11ms p(99.9)=190.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53588
     http_req_receiving.............: avg=88.91µs  min=28.89µs med=83.84µs  max=38.95ms  p(90)=116.65µs p(95)=129.33µs p(99.9)=590.88µs
     http_req_sending...............: avg=30.01µs  min=5.97µs  med=18.12µs  max=113.75ms p(90)=23.75µs  p(95)=25.83µs  p(99.9)=612.69µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=111.61ms min=20.95ms med=109.79ms max=350.95ms p(90)=138.92ms p(95)=147.99ms p(99.9)=190.74ms
     http_reqs......................: 53588   438.153349/s
     iteration_duration.............: avg=112.18ms min=36.85ms med=110.21ms max=362.88ms p(90)=139.32ms p(95)=148.4ms  p(99.9)=192.84ms
     iterations.....................: 53488   437.335716/s
     success_rate...................: 100.00% ✓ 53488      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.10.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97002      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=7.03µs   min=1.46µs  med=3.95µs   max=3.64ms   p(90)=5.55µs   p(95)=6.22µs   p(99.9)=1.33ms  
     http_req_connecting............: avg=2.76µs   min=0s      med=0s       max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=1.29ms  
     http_req_duration..............: avg=184.82ms min=17.33ms med=173ms    max=664.9ms  p(90)=218.9ms  p(95)=246.7ms  p(99.9)=622.89ms
       { expected_response:true }...: avg=184.82ms min=17.33ms med=173ms    max=664.9ms  p(90)=218.9ms  p(95)=246.7ms  p(99.9)=622.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32434
     http_req_receiving.............: avg=102.73µs min=36.36µs med=94.3µs   max=100.6ms  p(90)=126.41µs p(95)=140.05µs p(99.9)=592.32µs
     http_req_sending...............: avg=31.27µs  min=6.07µs  med=19.53µs  max=146.04ms p(90)=24.61µs  p(95)=26.78µs  p(99.9)=614.01µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.69ms min=17.23ms med=172.87ms max=664.78ms p(90)=218.76ms p(95)=246.5ms  p(99.9)=622.7ms 
     http_reqs......................: 32434   265.756295/s
     iteration_duration.............: avg=185.66ms min=34.94ms med=173.4ms  max=665.11ms p(90)=219.32ms p(95)=247.9ms  p(99.9)=623.27ms
     iterations.....................: 32334   264.936919/s
     success_rate...................: 100.00% ✓ 32334      ✗ 0    
     vus............................: 27      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 94521      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   309 kB/s
     http_req_blocked...............: avg=6.23µs   min=1.55µs  med=3.68µs   max=3.41ms   p(90)=5.15µs   p(95)=5.74µs   p(99.9)=767.55µs
     http_req_connecting............: avg=2.23µs   min=0s      med=0s       max=3.39ms   p(90)=0s       p(95)=0s       p(99.9)=743.68µs
     http_req_duration..............: avg=189.73ms min=23.32ms med=190.18ms max=366.31ms p(90)=233.09ms p(95)=239.55ms p(99.9)=308.91ms
       { expected_response:true }...: avg=189.73ms min=23.32ms med=190.18ms max=366.31ms p(90)=233.09ms p(95)=239.55ms p(99.9)=308.91ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31607
     http_req_receiving.............: avg=93.34µs  min=38.84µs med=88.29µs  max=12.33ms  p(90)=120.05µs p(95)=132.77µs p(99.9)=673.84µs
     http_req_sending...............: avg=26.54µs  min=6.65µs  med=18.22µs  max=47.02ms  p(90)=23.34µs  p(95)=25.37µs  p(99.9)=790.93µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.61ms min=23.18ms med=190.07ms max=365.1ms  p(90)=232.97ms p(95)=239.44ms p(99.9)=308.78ms
     http_reqs......................: 31607   257.597591/s
     iteration_duration.............: avg=190.56ms min=45.08ms med=190.62ms max=383.89ms p(90)=233.44ms p(95)=239.91ms p(99.9)=311.45ms
     iterations.....................: 31507   256.78259/s
     success_rate...................: 100.00% ✓ 31507      ✗ 0    
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

     checks.........................: 100.00% ✓ 6369      ✗ 0   
     data_received..................: 213 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=45.41µs min=1.23µs   med=3.17µs  max=4.05ms p(90)=4.64µs   p(95)=5.71µs   p(99.9)=3.7ms   
     http_req_connecting............: avg=41.48µs min=0s       med=0s      max=4.02ms p(90)=0s       p(95)=0s       p(99.9)=3.67ms  
     http_req_duration..............: avg=2.73s   min=42.09ms  med=2.85s   max=4.52s  p(90)=3.53s    p(95)=3.77s    p(99.9)=4.32s   
       { expected_response:true }...: avg=2.73s   min=42.09ms  med=2.85s   max=4.52s  p(90)=3.53s    p(95)=3.77s    p(99.9)=4.32s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2223
     http_req_receiving.............: avg=97.05µs min=34.33µs  med=92µs    max=1.81ms p(90)=134.02µs p(95)=153.17µs p(99.9)=338.17µs
     http_req_sending...............: avg=72.63µs min=5.89µs   med=18.08µs max=34.7ms p(90)=23.34µs  p(95)=29.07µs  p(99.9)=14.57ms 
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.73s   min=41.98ms  med=2.85s   max=4.52s  p(90)=3.53s    p(95)=3.77s    p(99.9)=4.32s   
     http_reqs......................: 2223    17.408374/s
     iteration_duration.............: avg=2.85s   min=892.57ms med=2.87s   max=4.52s  p(90)=3.55s    p(95)=3.77s    p(99.9)=4.33s   
     iterations.....................: 2123    16.625271/s
     success_rate...................: 100.00% ✓ 2123      ✗ 0   
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

