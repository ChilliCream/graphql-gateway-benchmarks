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
| fusion-nightly | 16.6.0-p.13 | 1,881 | 1,925 | 1,872 | 0.9% |  |
| fusion-nightly-net11 | 16.6.0-p.13 | 1,872 | 1,914 | 1,865 | 0.9% |  |
| fusion | 16.5.1 | 1,869 | 1,919 | 1,863 | 1.0% |  |
| hive-router | v0.0.84 | 1,845 | 1,904 | 1,834 | 1.3% |  |
| fusion-nightly-fed | 16.6.0-p.13 | 1,760 | 1,802 | 1,750 | 1.0% |  |
| grafbase | 0.53.5 | 1,284 | 1,319 | 1,280 | 1.0% |  |
| cosmo | 0.334.0 | 1,230 | 1,268 | 1,225 | 1.2% |  |
| hive-gateway-router-runtime | 2.10.8 | 552 | 574 | 549 | 1.5% |  |
| apollo-router | v2.16.1 | 433 | 451 | 431 | 1.6% |  |
| apollo-gateway | 2.14.3 | 260 | 263 | 258 | 0.7% |  |
| hive-gateway | 2.10.8 | 256 | 264 | 254 | 1.2% |  |
| feddi | 5ff8b6165878 | 23 | 23 | 22 | 1.9% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687882      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=2.78µs   min=822ns   med=1.93µs  max=8.63ms   p(90)=3.64µs  p(95)=4.41µs  p(99.9)=29.25µs
     http_req_connecting............: avg=381ns    min=0s      med=0s      max=3.95ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.95ms  min=17.53ms med=25.39ms max=313.11ms p(90)=30.3ms  p(95)=32.08ms p(99.9)=49.1ms 
       { expected_response:true }...: avg=25.95ms  min=17.53ms med=25.39ms max=313.11ms p(90)=30.3ms  p(95)=32.08ms p(99.9)=49.1ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 229394
     http_req_receiving.............: avg=302.41µs min=50.02µs med=92.05µs max=82.46ms  p(90)=765µs   p(95)=1.26ms  p(99.9)=7.97ms 
     http_req_sending...............: avg=31.85µs  min=4.33µs  med=8.17µs  max=228.25ms p(90)=18.14µs p(95)=31.54µs p(99.9)=1.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.61ms  min=17.41ms med=25.08ms max=312.56ms p(90)=29.9ms  p(95)=31.63ms p(99.9)=47.18ms
     http_reqs......................: 229394  1881.401734/s
     iteration_duration.............: avg=26.15ms  min=17.71ms med=25.59ms max=320.43ms p(90)=30.5ms  p(95)=32.27ms p(99.9)=49.4ms 
     iterations.....................: 229294  1880.581573/s
     success_rate...................: 100.00% ✓ 229294      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 684432      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.4µs    min=1µs     med=2.55µs  max=4.18ms   p(90)=4.27µs   p(95)=5.02µs  p(99.9)=36.7µs 
     http_req_connecting............: avg=421ns    min=0s      med=0s      max=4.14ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.06ms  min=17.33ms med=25.48ms max=306.52ms p(90)=30.38ms  p(95)=32.25ms p(99.9)=49.16ms
       { expected_response:true }...: avg=26.06ms  min=17.33ms med=25.48ms max=306.52ms p(90)=30.38ms  p(95)=32.25ms p(99.9)=49.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228244
     http_req_receiving.............: avg=330.97µs min=50.79µs med=96.42µs max=201.67ms p(90)=857.61µs p(95)=1.44ms  p(99.9)=8.64ms 
     http_req_sending...............: avg=36.28µs  min=4.71µs  med=9.55µs  max=196.33ms p(90)=19.78µs  p(95)=49.23µs p(99.9)=1.82ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.69ms  min=17.05ms med=25.14ms max=294.38ms p(90)=29.93ms  p(95)=31.74ms p(99.9)=47.24ms
     http_reqs......................: 228244  1872.09557/s
     iteration_duration.............: avg=26.29ms  min=17.54ms med=25.7ms  max=316.31ms p(90)=30.59ms  p(95)=32.46ms p(99.9)=49.55ms
     iterations.....................: 228144  1871.275353/s
     success_rate...................: 100.00% ✓ 228144      ✗ 0     
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

     checks.........................: 100.00% ✓ 683556      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.77µs   min=861ns   med=1.98µs  max=4.23ms   p(90)=3.48µs   p(95)=4.19µs  p(99.9)=27.12µs
     http_req_connecting............: avg=416ns    min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.11ms  min=17.39ms med=25.52ms max=292.76ms p(90)=30.52ms  p(95)=32.33ms p(99.9)=49.88ms
       { expected_response:true }...: avg=26.11ms  min=17.39ms med=25.52ms max=292.76ms p(90)=30.52ms  p(95)=32.33ms p(99.9)=49.88ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227952
     http_req_receiving.............: avg=315.54µs min=50.37µs med=94.04µs max=153.87ms p(90)=789.82µs p(95)=1.27ms  p(99.9)=8.48ms 
     http_req_sending...............: avg=29.06µs  min=4.5µs   med=8.35µs  max=36.92ms  p(90)=17.79µs  p(95)=28.59µs p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.76ms  min=17.29ms med=25.2ms  max=292.22ms p(90)=30.1ms   p(95)=31.89ms p(99.9)=47.93ms
     http_reqs......................: 227952  1869.726437/s
     iteration_duration.............: avg=26.32ms  min=17.55ms med=25.72ms max=310.08ms p(90)=30.71ms  p(95)=32.53ms p(99.9)=50.21ms
     iterations.....................: 227852  1868.906209/s
     success_rate...................: 100.00% ✓ 227852      ✗ 0     
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

     checks.........................: 100.00% ✓ 675072      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 271 MB  2.2 MB/s
     http_req_blocked...............: avg=3.03µs  min=862ns   med=2.13µs  max=8.13ms   p(90)=3.96µs  p(95)=4.71µs  p(99.9)=34.84µs
     http_req_connecting............: avg=428ns   min=0s      med=0s      max=3.54ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.44ms min=18.21ms med=26ms    max=303.92ms p(90)=30.16ms p(95)=31.59ms p(99.9)=46.85ms
       { expected_response:true }...: avg=26.44ms min=18.21ms med=26ms    max=303.92ms p(90)=30.16ms p(95)=31.59ms p(99.9)=46.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 225124
     http_req_receiving.............: avg=73.85µs min=25.7µs  med=50.86µs max=23.66ms  p(90)=96.35µs p(95)=123.2µs p(99.9)=1.75ms 
     http_req_sending...............: avg=30.33µs min=4.29µs  med=9.32µs  max=177.62ms p(90)=19.37µs p(95)=26.29µs p(99.9)=1.35ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.33ms min=18.08ms med=25.9ms  max=303.44ms p(90)=30.06ms p(95)=31.47ms p(99.9)=45.75ms
     http_reqs......................: 225124  1845.786797/s
     iteration_duration.............: avg=26.65ms min=18.49ms med=26.2ms  max=310.78ms p(90)=30.36ms p(95)=31.79ms p(99.9)=47.29ms
     iterations.....................: 225024  1844.966899/s
     success_rate...................: 100.00% ✓ 225024      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.13)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 644109      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 258 MB  2.1 MB/s
     http_req_blocked...............: avg=2.97µs   min=851ns   med=2.05µs  max=3.38ms   p(90)=3.91µs   p(95)=4.68µs  p(99.9)=33.66µs
     http_req_connecting............: avg=441ns    min=0s      med=0s      max=3.36ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.71ms  min=18ms    med=27.16ms max=302.35ms p(90)=32.48ms  p(95)=34.32ms p(99.9)=50.56ms
       { expected_response:true }...: avg=27.71ms  min=18ms    med=27.16ms max=302.35ms p(90)=32.48ms  p(95)=34.32ms p(99.9)=50.56ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 214803
     http_req_receiving.............: avg=325.27µs min=51.96µs med=97.7µs  max=89.79ms  p(90)=835.08µs p(95)=1.38ms  p(99.9)=7.58ms 
     http_req_sending...............: avg=32.16µs  min=4.62µs  med=8.7µs   max=103.16ms p(90)=19.64µs  p(95)=30.55µs p(99.9)=1.57ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.35ms  min=17.87ms med=26.82ms max=301.58ms p(90)=32.05ms  p(95)=33.85ms p(99.9)=48.83ms
     http_reqs......................: 214803  1760.90051/s
     iteration_duration.............: avg=27.93ms  min=18.23ms med=27.37ms max=320.58ms p(90)=32.69ms  p(95)=34.52ms p(99.9)=50.89ms
     iterations.....................: 214703  1760.080735/s
     success_rate...................: 100.00% ✓ 214703      ✗ 0     
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

     checks.........................: 100.00% ✓ 469674      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=3.77µs  min=882ns   med=2.2µs   max=48.8ms   p(90)=4.54µs  p(95)=5.51µs   p(99.9)=38.72µs
     http_req_connecting............: avg=656ns   min=0s      med=0s      max=4.36ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.06ms min=17.96ms med=37.75ms max=321.17ms p(90)=44.87ms p(95)=47ms     p(99.9)=64.94ms
       { expected_response:true }...: avg=38.06ms min=17.96ms med=37.75ms max=321.17ms p(90)=44.87ms p(95)=47ms     p(99.9)=64.94ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156658
     http_req_receiving.............: avg=89.42µs min=27.33µs med=55.43µs max=173.39ms p(90)=123.8µs p(95)=170.05µs p(99.9)=2.25ms 
     http_req_sending...............: avg=36.62µs min=4.57µs  med=9.3µs   max=196.34ms p(90)=23.78µs p(95)=60.87µs  p(99.9)=1.79ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.93ms min=17.86ms med=37.65ms max=320.64ms p(90)=44.74ms p(95)=46.86ms  p(99.9)=62.68ms
     http_reqs......................: 156658  1284.076932/s
     iteration_duration.............: avg=38.31ms min=20.74ms med=37.99ms max=328.44ms p(90)=45.08ms p(95)=47.21ms  p(99.9)=65.33ms
     iterations.....................: 156558  1283.257263/s
     success_rate...................: 100.00% ✓ 156558      ✗ 0     
     vus............................: 20      min=0         max=50  
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

     checks.........................: 100.00% ✓ 450111      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.99µs  min=1.13µs  med=3µs     max=3.88ms   p(90)=4.66µs   p(95)=5.4µs    p(99.9)=36.89µs
     http_req_connecting............: avg=659ns   min=0s      med=0s      max=3.84ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.74ms min=18.5ms  med=39.13ms max=297.73ms p(90)=47.63ms  p(95)=50.39ms  p(99.9)=65.64ms
       { expected_response:true }...: avg=39.74ms min=18.5ms  med=39.13ms max=297.73ms p(90)=47.63ms  p(95)=50.39ms  p(99.9)=65.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 150137
     http_req_receiving.............: avg=83.32µs min=26.94µs med=68µs    max=34.28ms  p(90)=111.05µs p(95)=130.01µs p(99.9)=1.07ms 
     http_req_sending...............: avg=26.06µs min=5.26µs  med=12.69µs max=63.75ms  p(90)=20.34µs  p(95)=24.52µs  p(99.9)=1.04ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.63ms min=18.39ms med=39.03ms max=294.37ms p(90)=47.52ms  p(95)=50.27ms  p(99.9)=65.18ms
     http_reqs......................: 150137  1230.695749/s
     iteration_duration.............: avg=39.98ms min=22.13ms med=39.35ms max=331.18ms p(90)=47.84ms  p(95)=50.6ms   p(99.9)=65.9ms 
     iterations.....................: 150037  1229.876034/s
     success_rate...................: 100.00% ✓ 150037      ✗ 0     
     vus............................: 6       min=0         max=50  
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

     checks.........................: 100.00% ✓ 202458     ✗ 0    
     data_received..................: 5.9 GB  48 MB/s
     data_sent......................: 81 MB   664 kB/s
     http_req_blocked...............: avg=4.4µs   min=1µs     med=2.69µs  max=4.2ms    p(90)=4.24µs   p(95)=4.88µs   p(99.9)=47.21µs 
     http_req_connecting............: avg=1.43µs  min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.58ms min=20.45ms med=87.5ms  max=310.71ms p(90)=104.7ms  p(95)=112.96ms p(99.9)=198.87ms
       { expected_response:true }...: avg=88.58ms min=20.45ms med=87.5ms  max=310.71ms p(90)=104.7ms  p(95)=112.96ms p(99.9)=198.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67586
     http_req_receiving.............: avg=81.61µs min=29.86µs med=73.19µs max=79.19ms  p(90)=108.51µs p(95)=121.41µs p(99.9)=645.97µs
     http_req_sending...............: avg=20.75µs min=5.07µs  med=12.94µs max=73.22ms  p(90)=19.46µs  p(95)=21.64µs  p(99.9)=578.78µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.48ms min=20.31ms med=87.4ms  max=310.33ms p(90)=104.61ms p(95)=112.85ms p(99.9)=198.4ms 
     http_reqs......................: 67586   552.940906/s
     iteration_duration.............: avg=88.91ms min=34.93ms med=87.75ms max=324.16ms p(90)=104.94ms p(95)=113.24ms p(99.9)=199.95ms
     iterations.....................: 67486   552.122777/s
     success_rate...................: 100.00% ✓ 67486      ✗ 0    
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

     checks.........................: 100.00% ✓ 158706     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 64 MB   520 kB/s
     http_req_blocked...............: avg=5.71µs   min=1.16µs  med=3.56µs   max=4.25ms   p(90)=5.18µs   p(95)=5.83µs   p(99.9)=67.04µs 
     http_req_connecting............: avg=1.89µs   min=0s      med=0s       max=4.21ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=112.98ms min=21.22ms med=111.15ms max=336.52ms p(90)=140.94ms p(95)=150.06ms p(99.9)=189.55ms
       { expected_response:true }...: avg=112.98ms min=21.22ms med=111.15ms max=336.52ms p(90)=140.94ms p(95)=150.06ms p(99.9)=189.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 53002
     http_req_receiving.............: avg=90.14µs  min=30.52µs med=86.24µs  max=27.66ms  p(90)=118.72µs p(95)=132.01µs p(99.9)=597.03µs
     http_req_sending...............: avg=29.14µs  min=5.36µs  med=17.38µs  max=102.83ms p(90)=23.07µs  p(95)=25.11µs  p(99.9)=653.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=112.86ms min=21.1ms  med=111.04ms max=335.7ms  p(90)=140.83ms p(95)=149.93ms p(99.9)=189.15ms
     http_reqs......................: 53002   433.26562/s
     iteration_duration.............: avg=113.44ms min=37.63ms med=111.47ms max=352.25ms p(90)=141.25ms p(95)=150.36ms p(99.9)=191.85ms
     iterations.....................: 52902   432.448169/s
     success_rate...................: 100.00% ✓ 52902      ✗ 0    
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

     checks.........................: 100.00% ✓ 95574      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=7.34µs   min=1.36µs  med=3.85µs   max=4.2ms    p(90)=5.46µs   p(95)=6.11µs   p(99.9)=1.59ms  
     http_req_connecting............: avg=3.17µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.55ms  
     http_req_duration..............: avg=187.59ms min=23.23ms med=196.1ms  max=400.28ms p(90)=211.63ms p(95)=217.28ms p(99.9)=283.84ms
       { expected_response:true }...: avg=187.59ms min=23.23ms med=196.1ms  max=400.28ms p(90)=211.63ms p(95)=217.28ms p(99.9)=283.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31958
     http_req_receiving.............: avg=100.36µs min=37.01µs med=92.63µs  max=71.56ms  p(90)=125.36µs p(95)=139.67µs p(99.9)=669.54µs
     http_req_sending...............: avg=28.91µs  min=5.58µs  med=18.68µs  max=74.67ms  p(90)=23.93µs  p(95)=26.03µs  p(99.9)=576.02µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.46ms min=23.04ms med=195.99ms max=399.8ms  p(90)=211.5ms  p(95)=217.13ms p(99.9)=283.74ms
     http_reqs......................: 31958   260.541632/s
     iteration_duration.............: avg=188.43ms min=47.02ms med=196.43ms max=409.42ms p(90)=211.96ms p(95)=217.6ms  p(99.9)=285.41ms
     iterations.....................: 31858   259.726369/s
     success_rate...................: 100.00% ✓ 31858      ✗ 0    
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

     checks.........................: 100.00% ✓ 93798      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 38 MB   308 kB/s
     http_req_blocked...............: avg=7µs      min=1.3µs   med=3.83µs   max=4.03ms   p(90)=5.4µs    p(95)=6.05µs   p(99.9)=1.3ms   
     http_req_connecting............: avg=2.9µs    min=0s      med=0s       max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=1.28ms  
     http_req_duration..............: avg=191.14ms min=17.53ms med=178.53ms max=649.69ms p(90)=229.04ms p(95)=263.4ms  p(99.9)=574.62ms
       { expected_response:true }...: avg=191.14ms min=17.53ms med=178.53ms max=649.69ms p(90)=229.04ms p(95)=263.4ms  p(99.9)=574.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31366
     http_req_receiving.............: avg=101.28µs min=37.13µs med=91.99µs  max=118.3ms  p(90)=124.89µs p(95)=138.68µs p(99.9)=742.66µs
     http_req_sending...............: avg=27.01µs  min=5.62µs  med=19.12µs  max=59.29ms  p(90)=24.24µs  p(95)=26.22µs  p(99.9)=561.49µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=191.02ms min=17.39ms med=178.41ms max=649.6ms  p(90)=228.9ms  p(95)=263.23ms p(99.9)=574.49ms
     http_reqs......................: 31366   256.748906/s
     iteration_duration.............: avg=192ms    min=46.91ms med=178.93ms max=649.95ms p(90)=229.4ms  p(95)=265.45ms p(99.9)=575.07ms
     iterations.....................: 31266   255.930348/s
     success_rate...................: 100.00% ✓ 31266      ✗ 0    
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

     checks.........................: 100.00% ✓ 8667      ✗ 0   
     data_received..................: 286 MB  2.3 MB/s
     data_sent......................: 3.6 MB  28 kB/s
     http_req_blocked...............: avg=46.14µs  min=1.57µs   med=3.94µs   max=6.32ms p(90)=5.62µs   p(95)=6.48µs   p(99.9)=5.92ms
     http_req_connecting............: avg=38.76µs  min=0s       med=0s       max=6.28ms p(90)=0s       p(95)=0s       p(99.9)=5.82ms
     http_req_duration..............: avg=2.02s    min=35.77ms  med=2.06s    max=8.98s  p(90)=2.65s    p(95)=2.84s    p(99.9)=7.58s 
       { expected_response:true }...: avg=2.02s    min=35.77ms  med=2.06s    max=8.98s  p(90)=2.65s    p(95)=2.84s    p(99.9)=7.58s 
     http_req_failed................: 0.00%   ✓ 0         ✗ 2989
     http_req_receiving.............: avg=111.71µs min=33.06µs  med=102.57µs max=4.75ms p(90)=142.95µs p(95)=159.48µs p(99.9)=2.75ms
     http_req_sending...............: avg=42.85µs  min=6.94µs   med=20.03µs  max=8.37ms p(90)=25.69µs  p(95)=29.8µs   p(99.9)=2.33ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s       max=0s     p(90)=0s       p(95)=0s       p(99.9)=0s    
     http_req_waiting...............: avg=2.02s    min=35.63ms  med=2.06s    max=8.98s  p(90)=2.65s    p(95)=2.84s    p(99.9)=7.58s 
     http_reqs......................: 2989    23.673791/s
     iteration_duration.............: avg=2.09s    min=332.76ms med=2.07s    max=8.99s  p(90)=2.67s    p(95)=2.85s    p(99.9)=7.69s 
     iterations.....................: 2889    22.881761/s
     success_rate...................: 100.00% ✓ 2889      ✗ 0   
     vus............................: 19      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

