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
| fusion-nightly | 16.6.2-p.6 | 1,900 | 1,949 | 1,896 | 1.0% |  |
| fusion | 16.6.1 | 1,893 | 1,934 | 1,884 | 1.0% |  |
| fusion-nightly-net11 | 16.6.2-p.6 | 1,867 | 1,927 | 1,861 | 1.2% |  |
| hive-router | v0.0.84 | 1,854 | 1,922 | 1,847 | 1.5% |  |
| fusion-nightly-fed | 16.6.2-p.6 | 1,811 | 1,856 | 1,795 | 1.1% |  |
| grafbase | 0.53.5 | 1,308 | 1,338 | 1,300 | 0.9% |  |
| cosmo | 0.334.0 | 1,229 | 1,269 | 1,222 | 1.3% |  |
| hive-gateway-router-runtime | 2.10.8 | 560 | 579 | 559 | 1.2% |  |
| apollo-router | v2.16.1 | 431 | 451 | 431 | 1.6% |  |
| apollo-gateway | 2.14.3 | 260 | 264 | 259 | 0.7% |  |
| hive-gateway | 2.10.8 | 258 | 265 | 256 | 1.1% |  |
| feddi | 5ff8b6165878 | 19 | 20 | 18 | 2.6% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 694932      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=2.84µs   min=862ns   med=1.98µs  max=7.27ms   p(90)=3.78µs   p(95)=4.52µs  p(99.9)=29.31µs
     http_req_connecting............: avg=362ns    min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.68ms  min=17.27ms med=25.08ms max=294.33ms p(90)=29.97ms  p(95)=31.74ms p(99.9)=49.61ms
       { expected_response:true }...: avg=25.68ms  min=17.27ms med=25.08ms max=294.33ms p(90)=29.97ms  p(95)=31.74ms p(99.9)=49.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231744
     http_req_receiving.............: avg=290.83µs min=49.71µs med=91.19µs max=194.68ms p(90)=720.98µs p(95)=1.2ms   p(99.9)=7.99ms 
     http_req_sending...............: avg=31.58µs  min=4.55µs  med=8.32µs  max=74.06ms  p(90)=18.89µs  p(95)=30.6µs  p(99.9)=1.55ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.35ms  min=17.14ms med=24.78ms max=294.02ms p(90)=29.59ms  p(95)=31.33ms p(99.9)=48.12ms
     http_reqs......................: 231744  1900.553996/s
     iteration_duration.............: avg=25.89ms  min=17.51ms med=25.28ms max=304.48ms p(90)=30.17ms  p(95)=31.94ms p(99.9)=50.04ms
     iterations.....................: 231644  1899.733887/s
     success_rate...................: 100.00% ✓ 231644      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.6.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 692196      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 277 MB  2.3 MB/s
     http_req_blocked...............: avg=3.4µs   min=821ns   med=1.98µs  max=8.43ms   p(90)=3.7µs    p(95)=4.48µs  p(99.9)=32.88µs
     http_req_connecting............: avg=966ns   min=0s      med=0s      max=8.38ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.78ms min=16.82ms med=25.21ms max=293.02ms p(90)=30.08ms  p(95)=31.85ms p(99.9)=48.41ms
       { expected_response:true }...: avg=25.78ms min=16.82ms med=25.21ms max=293.02ms p(90)=30.08ms  p(95)=31.85ms p(99.9)=48.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 230832
     http_req_receiving.............: avg=303µs   min=50.01µs med=92.92µs max=158.5ms  p(90)=754.08µs p(95)=1.24ms  p(99.9)=8.25ms 
     http_req_sending...............: avg=31.15µs min=3.98µs  med=8.23µs  max=210.85ms p(90)=18.12µs  p(95)=29.74µs p(99.9)=1.51ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.45ms min=16.7ms  med=24.9ms  max=292.27ms p(90)=29.68ms  p(95)=31.41ms p(99.9)=46.63ms
     http_reqs......................: 230832  1893.350866/s
     iteration_duration.............: avg=25.99ms min=17ms    med=25.41ms max=307.96ms p(90)=30.28ms  p(95)=32.06ms p(99.9)=48.79ms
     iterations.....................: 230732  1892.530637/s
     success_rate...................: 100.00% ✓ 230732      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682599      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=3.18µs   min=891ns   med=2.35µs  max=5.06ms   p(90)=4.04µs   p(95)=4.77µs  p(99.9)=33.79µs
     http_req_connecting............: avg=417ns    min=0s      med=0s      max=3.75ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.13ms  min=17.27ms med=25.53ms max=305.83ms p(90)=30.6ms   p(95)=32.48ms p(99.9)=50.66ms
       { expected_response:true }...: avg=26.13ms  min=17.27ms med=25.53ms max=305.83ms p(90)=30.6ms   p(95)=32.48ms p(99.9)=50.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227633
     http_req_receiving.............: avg=269.95µs min=50.04µs med=90.17µs max=138.63ms p(90)=609.07µs p(95)=1.17ms  p(99.9)=8ms    
     http_req_sending...............: avg=34.74µs  min=4.57µs  med=9.28µs  max=127.07ms p(90)=19.62µs  p(95)=58.93µs p(99.9)=1.86ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.83ms  min=17.14ms med=25.25ms max=305.47ms p(90)=30.24ms  p(95)=32.09ms p(99.9)=49.69ms
     http_reqs......................: 227633  1867.015/s
     iteration_duration.............: avg=26.36ms  min=17.54ms med=25.74ms max=318.62ms p(90)=30.81ms  p(95)=32.7ms  p(99.9)=51.04ms
     iterations.....................: 227533  1866.194814/s
     success_rate...................: 100.00% ✓ 227533      ✗ 0     
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

     checks.........................: 100.00% ✓ 678021      ✗ 0     
     data_received..................: 20 GB   162 MB/s
     data_sent......................: 272 MB  2.2 MB/s
     http_req_blocked...............: avg=3.01µs  min=922ns   med=2.12µs  max=4.58ms   p(90)=3.83µs  p(95)=4.57µs   p(99.9)=34.61µs
     http_req_connecting............: avg=470ns   min=0s      med=0s      max=4.1ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=26.32ms min=18.28ms med=25.89ms max=300.36ms p(90)=30.04ms p(95)=31.43ms  p(99.9)=47.45ms
       { expected_response:true }...: avg=26.32ms min=18.28ms med=25.89ms max=300.36ms p(90)=30.04ms p(95)=31.43ms  p(99.9)=47.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 226107
     http_req_receiving.............: avg=70.63µs min=24.41µs med=47.41µs max=64.95ms  p(90)=90.93µs p(95)=116.69µs p(99.9)=1.7ms  
     http_req_sending...............: avg=29.11µs min=4.59µs  med=9.05µs  max=177.65ms p(90)=17.62µs p(95)=24.41µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=26.22ms min=18.09ms med=25.8ms  max=300.17ms p(90)=29.94ms p(95)=31.31ms  p(99.9)=45.76ms
     http_reqs......................: 226107  1854.049677/s
     iteration_duration.............: avg=26.54ms min=18.58ms med=26.09ms max=312.19ms p(90)=30.24ms p(95)=31.63ms  p(99.9)=48ms   
     iterations.....................: 226007  1853.229689/s
     success_rate...................: 100.00% ✓ 226007      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.6)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 662649      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=2.91µs   min=881ns   med=2.03µs  max=7.66ms   p(90)=3.83µs   p(95)=4.61µs  p(99.9)=29.12µs
     http_req_connecting............: avg=402ns    min=0s      med=0s      max=3.44ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.93ms  min=17.25ms med=26.36ms max=305.21ms p(90)=31.44ms  p(95)=33.24ms p(99.9)=50.69ms
       { expected_response:true }...: avg=26.93ms  min=17.25ms med=26.36ms max=305.21ms p(90)=31.44ms  p(95)=33.24ms p(99.9)=50.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 220983
     http_req_receiving.............: avg=294.06µs min=49.8µs  med=93.53µs max=120.61ms p(90)=730.69µs p(95)=1.22ms  p(99.9)=7.41ms 
     http_req_sending...............: avg=32.78µs  min=4.51µs  med=8.66µs  max=141.73ms p(90)=19.43µs  p(95)=29.83µs p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.61ms  min=17.17ms med=26.05ms max=304.58ms p(90)=31.05ms  p(95)=32.84ms p(99.9)=49.29ms
     http_reqs......................: 220983  1811.73223/s
     iteration_duration.............: avg=27.15ms  min=17.44ms med=26.57ms max=314.33ms p(90)=31.65ms  p(95)=33.45ms p(99.9)=51.15ms
     iterations.....................: 220883  1810.912378/s
     success_rate...................: 100.00% ✓ 220883      ✗ 0     
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

     checks.........................: 100.00% ✓ 478683      ✗ 0     
     data_received..................: 14 GB   115 MB/s
     data_sent......................: 192 MB  1.6 MB/s
     http_req_blocked...............: avg=3.82µs  min=862ns   med=2.61µs  max=4.15ms   p(90)=5.14µs   p(95)=6.13µs   p(99.9)=45.44µs
     http_req_connecting............: avg=637ns   min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.33ms min=18.12ms med=37.02ms max=318.74ms p(90)=43.91ms  p(95)=45.88ms  p(99.9)=60.25ms
       { expected_response:true }...: avg=37.33ms min=18.12ms med=37.02ms max=318.74ms p(90)=43.91ms  p(95)=45.88ms  p(99.9)=60.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 159661
     http_req_receiving.............: avg=88.45µs min=27.15µs med=58.81µs max=123.06ms p(90)=127.96µs p(95)=171.44µs p(99.9)=1.95ms 
     http_req_sending...............: avg=32.62µs min=4.5µs   med=10.13µs max=77.46ms  p(90)=24.25µs  p(95)=43.85µs  p(99.9)=1.92ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.21ms min=17.96ms med=36.9ms  max=318.18ms p(90)=43.79ms  p(95)=45.76ms  p(99.9)=59.5ms 
     http_reqs......................: 159661  1308.843108/s
     iteration_duration.............: avg=37.59ms min=21.71ms med=37.25ms max=327.71ms p(90)=44.13ms  p(95)=46.1ms   p(99.9)=60.76ms
     iterations.....................: 159561  1308.023344/s
     success_rate...................: 100.00% ✓ 159561      ✗ 0     
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

     checks.........................: 100.00% ✓ 449505      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=3.11µs  min=1.03µs  med=2.36µs  max=2.92ms   p(90)=4.01µs   p(95)=4.73µs   p(99.9)=34.62µs 
     http_req_connecting............: avg=392ns   min=0s      med=0s      max=2.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=39.8ms  min=18.45ms med=39.16ms max=301.83ms p(90)=47.77ms  p(95)=50.52ms  p(99.9)=65.35ms 
       { expected_response:true }...: avg=39.8ms  min=18.45ms med=39.16ms max=301.83ms p(90)=47.77ms  p(95)=50.52ms  p(99.9)=65.35ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 149935
     http_req_receiving.............: avg=78.28µs min=26.16µs med=62.21µs max=151.62ms p(90)=104.65µs p(95)=122.81µs p(99.9)=964.97µs
     http_req_sending...............: avg=26.23µs min=4.98µs  med=10.94µs max=163.66ms p(90)=19.08µs  p(95)=23.23µs  p(99.9)=1.04ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=39.7ms  min=18.28ms med=39.06ms max=279.39ms p(90)=47.68ms  p(95)=50.41ms  p(99.9)=64.99ms 
     http_reqs......................: 149935  1229.047882/s
     iteration_duration.............: avg=40.03ms min=22.28ms med=39.37ms max=324.52ms p(90)=47.98ms  p(95)=50.72ms  p(99.9)=65.73ms 
     iterations.....................: 149835  1228.228161/s
     success_rate...................: 100.00% ✓ 149835      ✗ 0     
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

     checks.........................: 100.00% ✓ 205302     ✗ 0    
     data_received..................: 6.0 GB  49 MB/s
     data_sent......................: 82 MB   673 kB/s
     http_req_blocked...............: avg=4.79µs  min=1.1µs   med=3.3µs   max=3.29ms   p(90)=4.93µs   p(95)=5.65µs   p(99.9)=50.69µs 
     http_req_connecting............: avg=1.21µs  min=0s      med=0s      max=3.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.33ms min=20.6ms  med=86ms    max=318.95ms p(90)=103.17ms p(95)=112.13ms p(99.9)=198.59ms
       { expected_response:true }...: avg=87.33ms min=20.6ms  med=86ms    max=318.95ms p(90)=103.17ms p(95)=112.13ms p(99.9)=198.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 68534
     http_req_receiving.............: avg=87.79µs min=30.57µs med=80.99µs max=9.02ms   p(90)=117.39µs p(95)=131.07µs p(99.9)=713.1µs 
     http_req_sending...............: avg=28.9µs  min=5.23µs  med=15.75µs max=218.36ms p(90)=22.28µs  p(95)=24.63µs  p(99.9)=622.87µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.21ms min=20.46ms med=85.89ms max=318.36ms p(90)=103.06ms p(95)=111.99ms p(99.9)=198.29ms
     http_reqs......................: 68534   560.506716/s
     iteration_duration.............: avg=87.68ms min=29.1ms  med=86.26ms max=343.83ms p(90)=103.44ms p(95)=112.42ms p(99.9)=199.92ms
     iterations.....................: 68434   559.688864/s
     success_rate...................: 100.00% ✓ 68434      ✗ 0    
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

     checks.........................: 100.00% ✓ 157983     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   518 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.31µs  med=3.74µs   max=3.81ms   p(90)=5.35µs   p(95)=5.99µs   p(99.9)=148.94µs
     http_req_connecting............: avg=1.9µs    min=0s      med=0s       max=3.76ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=113.49ms min=21.42ms med=111.61ms max=332.41ms p(90)=141.47ms p(95)=151.01ms p(99.9)=192.22ms
       { expected_response:true }...: avg=113.49ms min=21.42ms med=111.61ms max=332.41ms p(90)=141.47ms p(95)=151.01ms p(99.9)=192.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52761
     http_req_receiving.............: avg=89.22µs  min=32.5µs  med=84.82µs  max=51.47ms  p(90)=116.91µs p(95)=129.44µs p(99.9)=539.67µs
     http_req_sending...............: avg=23.87µs  min=5.97µs  med=17.87µs  max=61.93ms  p(90)=23.68µs  p(95)=25.85µs  p(99.9)=537.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=113.37ms min=21.28ms med=111.5ms  max=331.84ms p(90)=141.34ms p(95)=150.89ms p(99.9)=192.11ms
     http_reqs......................: 52761   431.312696/s
     iteration_duration.............: avg=113.95ms min=36.01ms med=111.92ms max=358.04ms p(90)=141.78ms p(95)=151.36ms p(99.9)=195.27ms
     iterations.....................: 52661   430.495212/s
     success_rate...................: 100.00% ✓ 52661      ✗ 0    
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

     checks.........................: 100.00% ✓ 95643      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=9.31µs   min=1.35µs  med=3.58µs   max=8.06ms   p(90)=5.06µs   p(95)=5.66µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=5.34µs   min=0s      med=0s       max=8.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=187.45ms min=23.32ms med=187.08ms max=384.7ms  p(90)=199.09ms p(95)=203.52ms p(99.9)=272.7ms 
       { expected_response:true }...: avg=187.45ms min=23.32ms med=187.08ms max=384.7ms  p(90)=199.09ms p(95)=203.52ms p(99.9)=272.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 31981
     http_req_receiving.............: avg=95.45µs  min=35.01µs med=89.17µs  max=65.93ms  p(90)=120.59µs p(95)=132.43µs p(99.9)=556.68µs
     http_req_sending...............: avg=31.14µs  min=5.94µs  med=17.63µs  max=124.64ms p(90)=22.63µs  p(95)=24.47µs  p(99.9)=697.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=187.33ms min=23.18ms med=186.96ms max=384.49ms p(90)=198.97ms p(95)=203.4ms  p(99.9)=272.57ms
     http_reqs......................: 31981   260.794605/s
     iteration_duration.............: avg=188.28ms min=51.26ms med=187.42ms max=391.62ms p(90)=199.38ms p(95)=203.82ms p(99.9)=274.46ms
     iterations.....................: 31881   259.979137/s
     success_rate...................: 100.00% ✓ 31881      ✗ 0    
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

     checks.........................: 100.00% ✓ 94344      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=7.25µs   min=1.35µs  med=3.71µs   max=3.95ms   p(90)=5.18µs   p(95)=5.77µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=3.26µs   min=0s      med=0s       max=3.91ms   p(90)=0s       p(95)=0s       p(99.9)=1.75ms  
     http_req_duration..............: avg=190.07ms min=18.08ms med=179.13ms max=623.41ms p(90)=222.71ms p(95)=252.69ms p(99.9)=561.62ms
       { expected_response:true }...: avg=190.07ms min=18.08ms med=179.13ms max=623.41ms p(90)=222.71ms p(95)=252.69ms p(99.9)=561.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31548
     http_req_receiving.............: avg=104.99µs min=36.76µs med=90.46µs  max=163.75ms p(90)=122.69µs p(95)=135.96µs p(99.9)=836.45µs
     http_req_sending...............: avg=29.72µs  min=6.26µs  med=18.37µs  max=90.2ms   p(90)=23.2µs   p(95)=25.1µs   p(99.9)=497.11µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.93ms min=17.94ms med=179.01ms max=623.31ms p(90)=222.61ms p(95)=252.3ms  p(99.9)=561.5ms 
     http_reqs......................: 31548   258.206579/s
     iteration_duration.............: avg=190.9ms  min=57.93ms med=179.52ms max=623.64ms p(90)=223.04ms p(95)=253.87ms p(99.9)=561.9ms 
     iterations.....................: 31448   257.388123/s
     success_rate...................: 100.00% ✓ 31448      ✗ 0    
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

     checks.........................: 100.00% ✓ 7005      ✗ 0   
     data_received..................: 233 MB  1.8 MB/s
     data_sent......................: 2.9 MB  23 kB/s
     http_req_blocked...............: avg=41.32µs  min=1.56µs   med=3.61µs  max=4.67ms p(90)=5.25µs   p(95)=6.18µs  p(99.9)=4.08ms  
     http_req_connecting............: avg=35.54µs  min=0s       med=0s      max=4.32ms p(90)=0s       p(95)=0s      p(99.9)=4.01ms  
     http_req_duration..............: avg=2.48s    min=36.87ms  med=2.56s   max=12.96s p(90)=3.28s    p(95)=3.46s   p(99.9)=11.71s  
       { expected_response:true }...: avg=2.48s    min=36.87ms  med=2.56s   max=12.96s p(90)=3.28s    p(95)=3.46s   p(99.9)=11.71s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2435
     http_req_receiving.............: avg=101.09µs min=39.14µs  med=96.81µs max=1.43ms p(90)=136.72µs p(95)=154.2µs p(99.9)=355.14µs
     http_req_sending...............: avg=34.98µs  min=6.98µs   med=19.78µs max=2.62ms p(90)=25.34µs  p(95)=29.68µs p(99.9)=1.43ms  
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s     p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=2.48s    min=36.72ms  med=2.56s   max=12.96s p(90)=3.28s    p(95)=3.46s   p(99.9)=11.71s  
     http_reqs......................: 2435    19.230831/s
     iteration_duration.............: avg=2.59s    min=352.84ms med=2.6s    max=12.96s p(90)=3.29s    p(95)=3.47s   p(99.9)=11.74s  
     iterations.....................: 2335    18.441064/s
     success_rate...................: 100.00% ✓ 2335      ✗ 0   
     vus............................: 30      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

