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
| fusion | 16.6.4 | 1,886 | 1,931 | 1,874 | 1.0% |  |
| fusion-nightly | 16.7.0-p.3 | 1,879 | 1,927 | 1,868 | 1.1% |  |
| hive-router | v0.0.84 | 1,878 | 1,929 | 1,856 | 1.3% |  |
| fusion-nightly-net11 | 16.7.0-p.3 | 1,876 | 1,918 | 1,865 | 1.0% |  |
| fusion-nightly-fed | 16.7.0-p.3 | 1,803 | 1,858 | 1,794 | 1.2% |  |
| grafbase | 0.53.5 | 1,266 | 1,299 | 1,261 | 1.0% |  |
| cosmo | 0.334.0 | 1,224 | 1,270 | 1,213 | 1.6% |  |
| hive-gateway-router-runtime | 2.10.8 | 563 | 582 | 560 | 1.4% |  |
| apollo-router | v2.16.1 | 434 | 451 | 433 | 1.5% |  |
| apollo-gateway | 2.14.3 | 264 | 267 | 262 | 0.6% |  |
| hive-gateway | 2.10.8 | 252 | 260 | 250 | 1.3% |  |
| feddi | 5ff8b6165878 | 22 | 23 | 21 | 3.2% |  |


### Details

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 689811      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.59µs   min=821ns   med=1.92µs  max=7.77ms   p(90)=3.42µs   p(95)=4.13µs  p(99.9)=29.74µs
     http_req_connecting............: avg=205ns    min=0s      med=0s      max=2.35ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.88ms  min=16.98ms med=25.3ms  max=305.54ms p(90)=30.25ms  p(95)=32.02ms p(99.9)=49.45ms
       { expected_response:true }...: avg=25.88ms  min=16.98ms med=25.3ms  max=305.54ms p(90)=30.25ms  p(95)=32.02ms p(99.9)=49.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230037
     http_req_receiving.............: avg=304.41µs min=51.61µs med=94.29µs max=52.68ms  p(90)=770.16µs p(95)=1.24ms  p(99.9)=7.77ms 
     http_req_sending...............: avg=30.25µs  min=4.38µs  med=8.07µs  max=161.48ms p(90)=17µs     p(95)=27.18µs p(99.9)=1.48ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.54ms  min=16.87ms med=24.98ms max=305.3ms  p(90)=29.85ms  p(95)=31.6ms  p(99.9)=48.09ms
     http_reqs......................: 230037  1886.953713/s
     iteration_duration.............: avg=26.08ms  min=17.21ms med=25.5ms  max=313.68ms p(90)=30.45ms  p(95)=32.22ms p(99.9)=49.8ms 
     iterations.....................: 229937  1886.133431/s
     success_rate...................: 100.00% ✓ 229937      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 686988      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.41µs   min=1µs     med=2.56µs  max=4.49ms   p(90)=4.14µs  p(95)=4.86µs  p(99.9)=32.57µs
     http_req_connecting............: avg=484ns    min=0s      med=0s      max=4.45ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.97ms  min=17.02ms med=25.34ms max=295.04ms p(90)=30.43ms p(95)=32.31ms p(99.9)=51.04ms
       { expected_response:true }...: avg=25.97ms  min=17.02ms med=25.34ms max=295.04ms p(90)=30.43ms p(95)=32.31ms p(99.9)=51.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229096
     http_req_receiving.............: avg=323.42µs min=51.34µs med=98.42µs max=60.3ms   p(90)=810.8µs p(95)=1.32ms  p(99.9)=8.66ms 
     http_req_sending...............: avg=36.39µs  min=4.89µs  med=9.72µs  max=163.67ms p(90)=18.76µs p(95)=35.15µs p(99.9)=1.78ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.61ms  min=16.93ms med=25ms    max=294.77ms p(90)=30.01ms p(95)=31.86ms p(99.9)=49.69ms
     http_reqs......................: 229096  1879.05768/s
     iteration_duration.............: avg=26.19ms  min=17.21ms med=25.55ms max=312.07ms p(90)=30.63ms p(95)=32.52ms p(99.9)=51.49ms
     iterations.....................: 228996  1878.237475/s
     success_rate...................: 100.00% ✓ 228996      ✗ 0     
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

     checks.........................: 100.00% ✓ 686754      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3µs     min=912ns   med=2.18µs  max=3.81ms   p(90)=3.93µs  p(95)=4.65µs   p(99.9)=33.29µs
     http_req_connecting............: avg=421ns   min=0s      med=0s      max=3.77ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=25.98ms min=17.77ms med=25.54ms max=304.81ms p(90)=29.58ms p(95)=31ms     p(99.9)=46.79ms
       { expected_response:true }...: avg=25.98ms min=17.77ms med=25.54ms max=304.81ms p(90)=29.58ms p(95)=31ms     p(99.9)=46.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229018
     http_req_receiving.............: avg=72.89µs min=24.62µs med=48.34µs max=132.56ms p(90)=91.92µs p(95)=117.07µs p(99.9)=2.03ms 
     http_req_sending...............: avg=31.02µs min=4.59µs  med=9.4µs   max=87.43ms  p(90)=18.6µs  p(95)=25.33µs  p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=25.88ms min=17.67ms med=25.45ms max=295.15ms p(90)=29.48ms p(95)=30.88ms  p(99.9)=45.2ms 
     http_reqs......................: 229018  1878.259779/s
     iteration_duration.............: avg=26.2ms  min=18.29ms med=25.74ms max=314.67ms p(90)=29.79ms p(95)=31.21ms  p(99.9)=47.17ms
     iterations.....................: 228918  1877.439643/s
     success_rate...................: 100.00% ✓ 228918      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 685938      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.73µs   min=852ns   med=1.95µs  max=3.32ms   p(90)=3.59µs  p(95)=4.3µs   p(99.9)=26.67µs
     http_req_connecting............: avg=365ns    min=0s      med=0s      max=3.29ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.01ms  min=16.88ms med=25.45ms max=296.47ms p(90)=30.31ms p(95)=32.14ms p(99.9)=50.94ms
       { expected_response:true }...: avg=26.01ms  min=16.88ms med=25.45ms max=296.47ms p(90)=30.31ms p(95)=32.14ms p(99.9)=50.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228746
     http_req_receiving.............: avg=254.68µs min=49.54µs med=86.34µs max=120.67ms p(90)=580µs   p(95)=1.09ms  p(99.9)=7.27ms 
     http_req_sending...............: avg=32.72µs  min=4.66µs  med=8.41µs  max=186.32ms p(90)=18.71µs p(95)=33.41µs p(99.9)=1.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.73ms  min=16.81ms med=25.18ms max=295.85ms p(90)=29.96ms p(95)=31.75ms p(99.9)=49.52ms
     http_reqs......................: 228746  1876.200626/s
     iteration_duration.............: avg=26.23ms  min=17.07ms med=25.66ms max=316.7ms  p(90)=30.51ms p(95)=32.34ms p(99.9)=51.31ms
     iterations.....................: 228646  1875.380414/s
     success_rate...................: 100.00% ✓ 228646      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.7.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 659547      ✗ 0     
     data_received..................: 19 GB   158 MB/s
     data_sent......................: 264 MB  2.2 MB/s
     http_req_blocked...............: avg=2.97µs   min=871ns   med=2.03µs  max=9.35ms   p(90)=3.75µs   p(95)=4.47µs  p(99.9)=31.33µs
     http_req_connecting............: avg=418ns    min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.06ms  min=17.4ms  med=26.5ms  max=331.32ms p(90)=31.65ms  p(95)=33.44ms p(99.9)=50.43ms
       { expected_response:true }...: avg=27.06ms  min=17.4ms  med=26.5ms  max=331.32ms p(90)=31.65ms  p(95)=33.44ms p(99.9)=50.43ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 219949
     http_req_receiving.............: avg=299.23µs min=49.84µs med=95.12µs max=58.51ms  p(90)=738.84µs p(95)=1.26ms  p(99.9)=7.59ms 
     http_req_sending...............: avg=33.19µs  min=4.44µs  med=8.83µs  max=132.86ms p(90)=19.78µs  p(95)=36.84µs p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.73ms  min=17.29ms med=26.18ms max=331.14ms p(90)=31.24ms  p(95)=33.01ms p(99.9)=49.14ms
     http_reqs......................: 219949  1803.227157/s
     iteration_duration.............: avg=27.28ms  min=17.55ms med=26.71ms max=340.83ms p(90)=31.85ms  p(95)=33.65ms p(99.9)=50.79ms
     iterations.....................: 219849  1802.407318/s
     success_rate...................: 100.00% ✓ 219849      ✗ 0     
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

     checks.........................: 100.00% ✓ 463128      ✗ 0     
     data_received..................: 14 GB   111 MB/s
     data_sent......................: 186 MB  1.5 MB/s
     http_req_blocked...............: avg=3.38µs  min=832ns   med=2.15µs  max=3.63ms   p(90)=4.62µs   p(95)=5.62µs  p(99.9)=36.42µs
     http_req_connecting............: avg=608ns   min=0s      med=0s      max=3.59ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=38.6ms  min=18.1ms  med=38.36ms max=296.4ms  p(90)=45.33ms  p(95)=47.45ms p(99.9)=62.69ms
       { expected_response:true }...: avg=38.6ms  min=18.1ms  med=38.36ms max=296.4ms  p(90)=45.33ms  p(95)=47.45ms p(99.9)=62.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 154476
     http_req_receiving.............: avg=84.98µs min=25.22µs med=54.83µs max=36.72ms  p(90)=123.04µs p(95)=169.2µs p(99.9)=2.25ms 
     http_req_sending...............: avg=36.14µs min=4.07µs  med=9.08µs  max=211.33ms p(90)=23.91µs  p(95)=47.91µs p(99.9)=1.93ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=38.48ms min=18ms    med=38.26ms max=295.91ms p(90)=45.21ms  p(95)=47.31ms p(99.9)=61.88ms
     http_reqs......................: 154476  1266.191197/s
     iteration_duration.............: avg=38.85ms min=22.1ms  med=38.59ms max=327.39ms p(90)=45.55ms  p(95)=47.66ms p(99.9)=63.15ms
     iterations.....................: 154376  1265.371528/s
     success_rate...................: 100.00% ✓ 154376      ✗ 0     
     vus............................: 33      min=0         max=50  
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

     checks.........................: 100.00% ✓ 447861      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.97µs  min=1.07µs  med=3.01µs  max=4.04ms   p(90)=4.65µs   p(95)=5.38µs  p(99.9)=38.48µs
     http_req_connecting............: avg=648ns   min=0s      med=0s      max=3.99ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=39.94ms min=18.55ms med=39.32ms max=306.75ms p(90)=47.95ms  p(95)=50.72ms p(99.9)=66.03ms
       { expected_response:true }...: avg=39.94ms min=18.55ms med=39.32ms max=306.75ms p(90)=47.95ms  p(95)=50.72ms p(99.9)=66.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149387
     http_req_receiving.............: avg=82.13µs min=26.12µs med=65.74µs max=180.25ms p(90)=107.67µs p(95)=126µs   p(99.9)=973.1µs
     http_req_sending...............: avg=27.34µs min=5.15µs  med=12.64µs max=73.02ms  p(90)=20.42µs  p(95)=24.66µs p(99.9)=1.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=39.83ms min=18.43ms med=39.22ms max=305.93ms p(90)=47.84ms  p(95)=50.59ms p(99.9)=65.44ms
     http_reqs......................: 149387  1224.497788/s
     iteration_duration.............: avg=40.18ms min=22.85ms med=39.54ms max=334ms    p(90)=48.16ms  p(95)=50.93ms p(99.9)=66.52ms
     iterations.....................: 149287  1223.678107/s
     success_rate...................: 100.00% ✓ 149287      ✗ 0     
     vus............................: 33      min=0         max=50  
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

     checks.........................: 100.00% ✓ 206448     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 83 MB   677 kB/s
     http_req_blocked...............: avg=5.16µs  min=1.34µs  med=3.49µs  max=4.14ms   p(90)=5.11µs   p(95)=5.81µs   p(99.9)=48.65µs 
     http_req_connecting............: avg=1.38µs  min=0s      med=0s      max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.83ms min=20.65ms med=85.15ms max=332.26ms p(90)=105.36ms p(95)=114.08ms p(99.9)=199.12ms
       { expected_response:true }...: avg=86.83ms min=20.65ms med=85.15ms max=332.26ms p(90)=105.36ms p(95)=114.08ms p(99.9)=199.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68916
     http_req_receiving.............: avg=85.2µs  min=29.42µs med=76.82µs max=88.23ms  p(90)=111.95µs p(95)=125.44µs p(99.9)=640.87µs
     http_req_sending...............: avg=26.43µs min=5.15µs  med=15.35µs max=139.33ms p(90)=22.04µs  p(95)=24.35µs  p(99.9)=655.08µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.71ms min=20.51ms med=85.05ms max=332.06ms p(90)=105.25ms p(95)=113.97ms p(99.9)=198.96ms
     http_reqs......................: 68916   563.868167/s
     iteration_duration.............: avg=87.19ms min=36.77ms med=85.41ms max=348.29ms p(90)=105.62ms p(95)=114.39ms p(99.9)=200.35ms
     iterations.....................: 68816   563.04997/s
     success_rate...................: 100.00% ✓ 68816      ✗ 0    
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

     checks.........................: 100.00% ✓ 159162     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   522 kB/s
     http_req_blocked...............: avg=5.27µs   min=1.17µs  med=3.31µs   max=3.98ms   p(90)=4.78µs   p(95)=5.36µs   p(99.9)=76.58µs 
     http_req_connecting............: avg=1.75µs   min=0s      med=0s       max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.66ms min=19.91ms med=110.77ms max=337.3ms  p(90)=140.33ms p(95)=149.7ms  p(99.9)=190.64ms
       { expected_response:true }...: avg=112.66ms min=19.91ms med=110.77ms max=337.3ms  p(90)=140.33ms p(95)=149.7ms  p(99.9)=190.64ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53154
     http_req_receiving.............: avg=96.26µs  min=30.24µs med=84.33µs  max=200.32ms p(90)=116.32µs p(95)=129.48µs p(99.9)=582.72µs
     http_req_sending...............: avg=20.72µs  min=5.21µs  med=16.58µs  max=40.76ms  p(90)=22.32µs  p(95)=24.31µs  p(99.9)=495.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.55ms min=19.77ms med=110.65ms max=336.62ms p(90)=140.21ms p(95)=149.59ms p(99.9)=190.27ms
     http_reqs......................: 53154   434.563555/s
     iteration_duration.............: avg=113.12ms min=41.66ms med=111.08ms max=362.49ms p(90)=140.63ms p(95)=150.02ms p(99.9)=195.85ms
     iterations.....................: 53054   433.746/s
     success_rate...................: 100.00% ✓ 53054      ✗ 0    
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

     checks.........................: 100.00% ✓ 96996      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   318 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.4µs   med=3.62µs   max=3.01ms   p(90)=5.1µs    p(95)=5.7µs    p(99.9)=437.61µs
     http_req_connecting............: avg=1.49µs   min=0s      med=0s       max=2.98ms   p(90)=0s       p(95)=0s       p(99.9)=417.81µs
     http_req_duration..............: avg=184.86ms min=23ms    med=184.29ms max=365.93ms p(90)=192.04ms p(95)=196.27ms p(99.9)=261.2ms 
       { expected_response:true }...: avg=184.86ms min=23ms    med=184.29ms max=365.93ms p(90)=192.04ms p(95)=196.27ms p(99.9)=261.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 32432
     http_req_receiving.............: avg=100.26µs min=34.93µs med=90.08µs  max=116.76ms p(90)=121.62µs p(95)=134.26µs p(99.9)=586.84µs
     http_req_sending...............: avg=30.94µs  min=6.35µs  med=18.01µs  max=92.1ms   p(90)=23.1µs   p(95)=24.94µs  p(99.9)=485.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.73ms min=22.9ms  med=184.18ms max=365.69ms p(90)=191.91ms p(95)=196.12ms p(99.9)=259.85ms
     http_reqs......................: 32432   264.480396/s
     iteration_duration.............: avg=185.66ms min=53.31ms med=184.58ms max=376.81ms p(90)=192.32ms p(95)=196.57ms p(99.9)=262.27ms
     iterations.....................: 32332   263.664904/s
     success_rate...................: 100.00% ✓ 32332      ✗ 0    
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

     checks.........................: 100.00% ✓ 92145      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   303 kB/s
     http_req_blocked...............: avg=7.01µs   min=1.57µs  med=3.66µs   max=3.49ms   p(90)=5.07µs   p(95)=5.7µs    p(99.9)=1.69ms  
     http_req_connecting............: avg=3.05µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=194.62ms min=18.44ms med=181.2ms  max=621.05ms p(90)=235.36ms p(95)=274.53ms p(99.9)=579.73ms
       { expected_response:true }...: avg=194.62ms min=18.44ms med=181.2ms  max=621.05ms p(90)=235.36ms p(95)=274.53ms p(99.9)=579.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30815
     http_req_receiving.............: avg=99.86µs  min=36.46µs med=89.7µs   max=73.29ms  p(90)=120.64µs p(95)=132.07µs p(99.9)=602.75µs
     http_req_sending...............: avg=28.78µs  min=6.74µs  med=18.31µs  max=62.1ms   p(90)=23.06µs  p(95)=25µs     p(99.9)=511.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.49ms min=18.34ms med=181.06ms max=620.94ms p(90)=235.26ms p(95)=274.39ms p(99.9)=579.63ms
     http_reqs......................: 30815   252.218654/s
     iteration_duration.............: avg=195.48ms min=52.07ms med=181.6ms  max=621.23ms p(90)=235.75ms p(95)=275.81ms p(99.9)=580ms   
     iterations.....................: 30715   251.400161/s
     success_rate...................: 100.00% ✓ 30715      ✗ 0    
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

     checks.........................: 100.00% ✓ 8193      ✗ 0   
     data_received..................: 271 MB  2.1 MB/s
     data_sent......................: 3.4 MB  27 kB/s
     http_req_blocked...............: avg=56.34µs  min=1.48µs  med=3.87µs  max=8.81ms p(90)=5.53µs   p(95)=6.39µs  p(99.9)=6.14ms
     http_req_connecting............: avg=47.29µs  min=0s      med=0s      max=6.51ms p(90)=0s       p(95)=0s      p(99.9)=5.88ms
     http_req_duration..............: avg=2.13s    min=38.4ms  med=2.15s   max=4.28s  p(90)=2.77s    p(95)=3.1s    p(99.9)=4.02s 
       { expected_response:true }...: avg=2.13s    min=38.4ms  med=2.15s   max=4.28s  p(90)=2.77s    p(95)=3.1s    p(99.9)=4.02s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2831
     http_req_receiving.............: avg=107.22µs min=33.64µs med=99.3µs  max=2.37ms p(90)=140.58µs p(95)=160.8µs p(99.9)=1.24ms
     http_req_sending...............: avg=48.77µs  min=6.56µs  med=20.12µs max=13.9ms p(90)=25.35µs  p(95)=28.7µs  p(99.9)=4.26ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s     p(90)=0s       p(95)=0s      p(99.9)=0s    
     http_req_waiting...............: avg=2.13s    min=38.29ms med=2.15s   max=4.28s  p(90)=2.77s    p(95)=3.1s    p(99.9)=4.02s 
     http_reqs......................: 2831    22.405937/s
     iteration_duration.............: avg=2.2s     min=604.4ms med=2.17s   max=4.28s  p(90)=2.79s    p(95)=3.12s   p(99.9)=4.02s 
     iterations.....................: 2731    21.614488/s
     success_rate...................: 100.00% ✓ 2731      ✗ 0   
     vus............................: 23      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

