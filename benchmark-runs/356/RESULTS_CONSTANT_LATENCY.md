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
| fusion-nightly-net11 | 16.7.0-p.9 | 1,894 | 1,946 | 1,875 | 1.2% |  |
| fusion-nightly | 16.7.0-p.9 | 1,891 | 1,938 | 1,881 | 1.0% |  |
| fusion | 16.6.6 | 1,875 | 1,927 | 1,861 | 1.2% |  |
| hive-router | v0.0.84 | 1,809 | 1,888 | 1,798 | 1.7% |  |
| fusion-nightly-fed | 16.7.0-p.9 | 1,802 | 1,850 | 1,797 | 1.0% |  |
| grafbase | 0.53.5 | 1,305 | 1,332 | 1,300 | 0.8% |  |
| cosmo | 0.334.0 | 1,221 | 1,262 | 1,219 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 553 | 573 | 549 | 1.4% |  |
| apollo-router | v2.16.1 | 433 | 452 | 430 | 1.7% |  |
| hive-gateway | 2.10.8 | 262 | 270 | 260 | 1.2% |  |
| apollo-gateway | 2.14.3 | 260 | 264 | 258 | 0.9% |  |
| feddi | 5ff8b6165878 | 21 | 22 | 20 | 2.9% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 692466      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=2.83µs   min=861ns   med=1.98µs  max=3.95ms   p(90)=3.77µs  p(95)=4.49µs  p(99.9)=31.68µs
     http_req_connecting............: avg=391ns    min=0s      med=0s      max=3.91ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.77ms  min=17.14ms med=25.21ms max=315.07ms p(90)=29.81ms p(95)=31.56ms p(99.9)=50.42ms
       { expected_response:true }...: avg=25.77ms  min=17.14ms med=25.21ms max=315.07ms p(90)=29.81ms p(95)=31.56ms p(99.9)=50.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230922
     http_req_receiving.............: avg=408.89µs min=49.64µs med=90.62µs max=238.63ms p(90)=1.11ms  p(95)=1.82ms  p(99.9)=11.83ms
     http_req_sending...............: avg=33.99µs  min=4.39µs  med=8.39µs  max=288.33ms p(90)=18.94µs p(95)=37.17µs p(99.9)=1.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.32ms  min=17.06ms med=24.82ms max=98.46ms  p(90)=29.23ms p(95)=30.93ms p(99.9)=49.01ms
     http_reqs......................: 230922  1894.073263/s
     iteration_duration.............: avg=25.98ms  min=17.3ms  med=25.42ms max=326.46ms p(90)=30.01ms p(95)=31.77ms p(99.9)=50.87ms
     iterations.....................: 230822  1893.253041/s
     success_rate...................: 100.00% ✓ 230822      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 691455      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=2.6µs    min=842ns   med=1.96µs  max=5.82ms   p(90)=3.68µs   p(95)=4.4µs   p(99.9)=27.22µs
     http_req_connecting............: avg=180ns    min=0s      med=0s      max=2.03ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.81ms  min=17.46ms med=25.21ms max=298.46ms p(90)=30.17ms  p(95)=31.98ms p(99.9)=49.25ms
       { expected_response:true }...: avg=25.81ms  min=17.46ms med=25.21ms max=298.46ms p(90)=30.17ms  p(95)=31.98ms p(99.9)=49.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230585
     http_req_receiving.............: avg=293.18µs min=49.08µs med=91.84µs max=64.34ms  p(90)=723.39µs p(95)=1.21ms  p(99.9)=8.02ms 
     http_req_sending...............: avg=32µs     min=4.38µs  med=8.45µs  max=139.71ms p(90)=19.02µs  p(95)=34.32µs p(99.9)=1.65ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.48ms  min=17.14ms med=24.9ms  max=288.14ms p(90)=29.78ms  p(95)=31.57ms p(99.9)=47.78ms
     http_reqs......................: 230585  1891.007013/s
     iteration_duration.............: avg=26.02ms  min=17.67ms med=25.41ms max=307.56ms p(90)=30.37ms  p(95)=32.18ms p(99.9)=49.72ms
     iterations.....................: 230485  1890.186922/s
     success_rate...................: 100.00% ✓ 230485      ✗ 0     
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

     checks.........................: 100.00% ✓ 685770      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.82µs   min=862ns   med=1.93µs  max=5.64ms   p(90)=3.67µs   p(95)=4.4µs   p(99.9)=34.85µs
     http_req_connecting............: avg=416ns    min=0s      med=0s      max=3.57ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.02ms  min=17.05ms med=25.45ms max=312.15ms p(90)=30.44ms  p(95)=32.27ms p(99.9)=49.2ms 
       { expected_response:true }...: avg=26.02ms  min=17.05ms med=25.45ms max=312.15ms p(90)=30.44ms  p(95)=32.27ms p(99.9)=49.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 228690
     http_req_receiving.............: avg=291.01µs min=50.11µs med=90.98µs max=32.76ms  p(90)=724.38µs p(95)=1.22ms  p(99.9)=7.71ms 
     http_req_sending...............: avg=31.69µs  min=4.47µs  med=8.36µs  max=264.03ms p(90)=19µs     p(95)=31.37µs p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.7ms   min=16.9ms  med=25.15ms max=311.4ms  p(90)=30.05ms  p(95)=31.84ms p(99.9)=47.46ms
     http_reqs......................: 228690  1875.322895/s
     iteration_duration.............: avg=26.24ms  min=17.33ms med=25.65ms max=331.53ms p(90)=30.64ms  p(95)=32.47ms p(99.9)=49.62ms
     iterations.....................: 228590  1874.502866/s
     success_rate...................: 100.00% ✓ 228590      ✗ 0     
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

     checks.........................: 100.00% ✓ 661929      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 265 MB  2.2 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.02µs  med=2.64µs  max=4.32ms   p(90)=4.19µs  p(95)=4.89µs   p(99.9)=36.5µs 
     http_req_connecting............: avg=435ns   min=0s      med=0s      max=4.28ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.97ms min=18.16ms med=26.54ms max=300.66ms p(90)=30.79ms p(95)=32.28ms  p(99.9)=49.2ms 
       { expected_response:true }...: avg=26.97ms min=18.16ms med=26.54ms max=300.66ms p(90)=30.79ms p(95)=32.28ms  p(99.9)=49.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 220743
     http_req_receiving.............: avg=76.42µs min=25.05µs med=53.62µs max=60.82ms  p(90)=94.19µs p(95)=117.52µs p(99.9)=1.71ms 
     http_req_sending...............: avg=32.13µs min=4.9µs   med=10.59µs max=196.77ms p(90)=18.13µs p(95)=24.77µs  p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.86ms min=18.03ms med=26.44ms max=299.79ms p(90)=30.68ms p(95)=32.15ms  p(99.9)=47.77ms
     http_reqs......................: 220743  1809.924265/s
     iteration_duration.............: avg=27.18ms min=18.42ms med=26.74ms max=312.7ms  p(90)=30.99ms p(95)=32.49ms  p(99.9)=49.55ms
     iterations.....................: 220643  1809.104341/s
     success_rate...................: 100.00% ✓ 220643      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 659277      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=3.4µs    min=872ns   med=2.07µs  max=7.81ms   p(90)=3.83µs   p(95)=4.57µs  p(99.9)=30.98µs
     http_req_connecting............: avg=867ns    min=0s      med=0s      max=7.66ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.07ms  min=17.85ms med=26.5ms  max=300.38ms p(90)=31.62ms  p(95)=33.45ms p(99.9)=49.97ms
       { expected_response:true }...: avg=27.07ms  min=17.85ms med=26.5ms  max=300.38ms p(90)=31.62ms  p(95)=33.45ms p(99.9)=49.97ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219859
     http_req_receiving.............: avg=296.03µs min=50.52µs med=94.77µs max=97.59ms  p(90)=732.78µs p(95)=1.23ms  p(99.9)=7.47ms 
     http_req_sending...............: avg=31.41µs  min=4.67µs  med=8.79µs  max=171.79ms p(90)=19.39µs  p(95)=30.03µs p(99.9)=1.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.74ms  min=17.76ms med=26.19ms max=287.77ms p(90)=31.23ms  p(95)=33.03ms p(99.9)=48.51ms
     http_reqs......................: 219859  1802.540001/s
     iteration_duration.............: avg=27.29ms  min=17.99ms med=26.71ms max=310.13ms p(90)=31.83ms  p(95)=33.65ms p(99.9)=50.29ms
     iterations.....................: 219759  1801.720139/s
     success_rate...................: 100.00% ✓ 219759      ✗ 0     
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

     checks.........................: 100.00% ✓ 477570      ✗ 0     
     data_received..................: 14 GB   114 MB/s
     data_sent......................: 191 MB  1.6 MB/s
     http_req_blocked...............: avg=3.44µs  min=872ns   med=2.22µs  max=3.64ms   p(90)=4.67µs   p(95)=5.7µs    p(99.9)=42.03µs
     http_req_connecting............: avg=608ns   min=0s      med=0s      max=3.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.43ms min=18.04ms med=37.14ms max=298.95ms p(90)=43.93ms  p(95)=46.01ms  p(99.9)=60.29ms
       { expected_response:true }...: avg=37.43ms min=18.04ms med=37.14ms max=298.95ms p(90)=43.93ms  p(95)=46.01ms  p(99.9)=60.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159290
     http_req_receiving.............: avg=85.39µs min=27.83µs med=55.89µs max=71.5ms   p(90)=125.37µs p(95)=168.06µs p(99.9)=1.9ms  
     http_req_sending...............: avg=31.19µs min=4.68µs  med=9.41µs  max=54.99ms  p(90)=23.94µs  p(95)=38.13µs  p(99.9)=1.63ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.31ms min=17.95ms med=37.03ms max=298.65ms p(90)=43.83ms  p(95)=45.87ms  p(99.9)=59.4ms 
     http_reqs......................: 159290  1305.731294/s
     iteration_duration.............: avg=37.68ms min=21.69ms med=37.38ms max=336.93ms p(90)=44.15ms  p(95)=46.22ms  p(99.9)=60.81ms
     iterations.....................: 159190  1304.911574/s
     success_rate...................: 100.00% ✓ 159190      ✗ 0     
     vus............................: 26      min=0         max=50  
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

     checks.........................: 100.00% ✓ 446700      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.19µs  min=931ns   med=2.2µs   max=3.42ms   p(90)=3.82µs  p(95)=4.53µs  p(99.9)=30.31µs 
     http_req_connecting............: avg=641ns   min=0s      med=0s      max=3.37ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=40.06ms min=18.82ms med=39.44ms max=307.75ms p(90)=48.12ms p(95)=50.89ms p(99.9)=65.59ms 
       { expected_response:true }...: avg=40.06ms min=18.82ms med=39.44ms max=307.75ms p(90)=48.12ms p(95)=50.89ms p(99.9)=65.59ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149000
     http_req_receiving.............: avg=75.08µs min=25.03µs med=60.29µs max=126.37ms p(90)=100.8µs p(95)=118.5µs p(99.9)=949.72µs
     http_req_sending...............: avg=25.06µs min=4.79µs  med=10.57µs max=130.89ms p(90)=18.32µs p(95)=22.08µs p(99.9)=941.1µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=39.96ms min=18.7ms  med=39.35ms max=307.24ms p(90)=48.03ms p(95)=50.78ms p(99.9)=65.19ms 
     http_reqs......................: 149000  1221.547905/s
     iteration_duration.............: avg=40.28ms min=22.51ms med=39.65ms max=317.67ms p(90)=48.32ms p(95)=51.1ms  p(99.9)=65.82ms 
     iterations.....................: 148900  1220.728074/s
     success_rate...................: 100.00% ✓ 148900      ✗ 0     
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

     checks.........................: 100.00% ✓ 202602     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   664 kB/s
     http_req_blocked...............: avg=5.17µs  min=1.09µs  med=3.51µs  max=3.98ms   p(90)=5.14µs   p(95)=5.85µs   p(99.9)=50.09µs 
     http_req_connecting............: avg=1.38µs  min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.51ms min=21.32ms med=86.89ms max=355.13ms p(90)=112.24ms p(95)=121.89ms p(99.9)=208.81ms
       { expected_response:true }...: avg=88.51ms min=21.32ms med=86.89ms max=355.13ms p(90)=112.24ms p(95)=121.89ms p(99.9)=208.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67634
     http_req_receiving.............: avg=92.84µs min=31.1µs  med=79.24µs max=109.23ms p(90)=114.72µs p(95)=128.18µs p(99.9)=677.11µs
     http_req_sending...............: avg=27.72µs min=5.83µs  med=15.37µs max=179.8ms  p(90)=22.1µs   p(95)=24.43µs  p(99.9)=637.74µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.39ms min=21.22ms med=86.78ms max=353.47ms p(90)=112.13ms p(95)=121.73ms p(99.9)=208ms   
     http_reqs......................: 67634   553.011521/s
     iteration_duration.............: avg=88.86ms min=33.47ms med=87.16ms max=368.12ms p(90)=112.52ms p(95)=122.21ms p(99.9)=211.28ms
     iterations.....................: 67534   552.193868/s
     success_rate...................: 100.00% ✓ 67534      ✗ 0    
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

     checks.........................: 100.00% ✓ 158793     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   521 kB/s
     http_req_blocked...............: avg=4.74µs   min=1.09µs  med=3.27µs   max=9.52ms   p(90)=4.82µs   p(95)=5.42µs   p(99.9)=112.38µs
     http_req_connecting............: avg=1.01µs   min=0s      med=0s       max=2.78ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.92ms min=21.13ms med=111.1ms  max=327.44ms p(90)=140.56ms p(95)=150.04ms p(99.9)=191.34ms
       { expected_response:true }...: avg=112.92ms min=21.13ms med=111.1ms  max=327.44ms p(90)=140.56ms p(95)=150.04ms p(99.9)=191.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53031
     http_req_receiving.............: avg=90.94µs  min=28.8µs  med=82.8µs   max=162.95ms p(90)=114.81µs p(95)=127.47µs p(99.9)=586.32µs
     http_req_sending...............: avg=28.89µs  min=5.13µs  med=16.45µs  max=122.34ms p(90)=21.93µs  p(95)=23.82µs  p(99.9)=649.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.8ms  min=20.99ms med=110.99ms max=327.24ms p(90)=140.44ms p(95)=149.91ms p(99.9)=190.32ms
     http_reqs......................: 53031   433.565481/s
     iteration_duration.............: avg=113.37ms min=36.24ms med=111.39ms max=343.67ms p(90)=140.86ms p(95)=150.33ms p(99.9)=194.2ms 
     iterations.....................: 52931   432.747911/s
     success_rate...................: 100.00% ✓ 52931      ✗ 0    
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

     checks.........................: 100.00% ✓ 95709      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   315 kB/s
     http_req_blocked...............: avg=7.17µs   min=1.58µs  med=3.71µs   max=4.18ms   p(90)=5.26µs   p(95)=5.91µs   p(99.9)=1.49ms  
     http_req_connecting............: avg=3.14µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.46ms  
     http_req_duration..............: avg=187.35ms min=18.13ms med=173.13ms max=656.39ms p(90)=230.53ms p(95)=262.3ms  p(99.9)=584.84ms
       { expected_response:true }...: avg=187.35ms min=18.13ms med=173.13ms max=656.39ms p(90)=230.53ms p(95)=262.3ms  p(99.9)=584.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32003
     http_req_receiving.............: avg=97.99µs  min=37.16µs med=92.97µs  max=7.81ms   p(90)=125.13µs p(95)=138.1µs  p(99.9)=782.72µs
     http_req_sending...............: avg=27.32µs  min=6.65µs  med=19.37µs  max=51ms     p(90)=24.48µs  p(95)=26.52µs  p(99.9)=510.94µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.22ms min=18.01ms med=173.01ms max=656.3ms  p(90)=230.44ms p(95)=262.19ms p(99.9)=584.74ms
     http_reqs......................: 32003   262.095704/s
     iteration_duration.............: avg=188.17ms min=62.91ms med=173.55ms max=656.6ms  p(90)=231.08ms p(95)=263.07ms p(99.9)=585.14ms
     iterations.....................: 31903   261.276731/s
     success_rate...................: 100.00% ✓ 31903      ✗ 0    
     vus............................: 45      min=0        max=50 
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

     checks.........................: 100.00% ✓ 95382      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   312 kB/s
     http_req_blocked...............: avg=7.22µs   min=1.47µs  med=3.69µs   max=4.5ms    p(90)=5.24µs   p(95)=5.85µs   p(99.9)=1.54ms  
     http_req_connecting............: avg=3.13µs   min=0s      med=0s       max=4.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.45ms  
     http_req_duration..............: avg=187.97ms min=23.16ms med=188.9ms  max=390.43ms p(90)=200.7ms  p(95)=205.96ms p(99.9)=277.28ms
       { expected_response:true }...: avg=187.97ms min=23.16ms med=188.9ms  max=390.43ms p(90)=200.7ms  p(95)=205.96ms p(99.9)=277.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31894
     http_req_receiving.............: avg=96.33µs  min=35.06µs med=90.52µs  max=32.04ms  p(90)=123.1µs  p(95)=135.85µs p(99.9)=516.52µs
     http_req_sending...............: avg=32.54µs  min=6.46µs  med=18.79µs  max=111.59ms p(90)=24.09µs  p(95)=26.13µs  p(99.9)=650.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.84ms min=23.06ms med=188.78ms max=389.59ms p(90)=200.58ms p(95)=205.85ms p(99.9)=277.18ms
     http_reqs......................: 31894   260.026453/s
     iteration_duration.............: avg=188.81ms min=58.54ms med=189.26ms max=408.07ms p(90)=201.01ms p(95)=206.3ms  p(99.9)=281.36ms
     iterations.....................: 31794   259.21117/s
     success_rate...................: 100.00% ✓ 31794      ✗ 0    
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

     checks.........................: 100.00% ✓ 7896      ✗ 0   
     data_received..................: 262 MB  2.1 MB/s
     data_sent......................: 3.3 MB  26 kB/s
     http_req_blocked...............: avg=37.2µs   min=1.15µs   med=3.36µs  max=3.98ms  p(90)=5.02µs   p(95)=5.88µs  p(99.9)=3.55ms
     http_req_connecting............: avg=32.9µs   min=0s       med=0s      max=3.95ms  p(90)=0s       p(95)=0s      p(99.9)=3.52ms
     http_req_duration..............: avg=2.21s    min=38.64ms  med=2.3s    max=4.36s   p(90)=3s       p(95)=3.23s   p(99.9)=4.23s 
       { expected_response:true }...: avg=2.21s    min=38.64ms  med=2.3s    max=4.36s   p(90)=3s       p(95)=3.23s   p(99.9)=4.23s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2732
     http_req_receiving.............: avg=122.39µs min=34.37µs  med=92.65µs max=60.87ms p(90)=134.41µs p(95)=151.8µs p(99.9)=1.41ms
     http_req_sending...............: avg=66.26µs  min=5.53µs   med=18.17µs max=42.41ms p(90)=23.57µs  p(95)=27.04µs p(99.9)=9.75ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=2.21s    min=38.49ms  med=2.3s    max=4.36s   p(90)=3s       p(95)=3.23s   p(99.9)=4.23s 
     http_reqs......................: 2732    21.648198/s
     iteration_duration.............: avg=2.29s    min=336.33ms med=2.33s   max=4.37s   p(90)=3.02s    p(95)=3.23s   p(99.9)=4.23s 
     iterations.....................: 2632    20.855804/s
     success_rate...................: 100.00% ✓ 2632      ✗ 0   
     vus............................: 18      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

