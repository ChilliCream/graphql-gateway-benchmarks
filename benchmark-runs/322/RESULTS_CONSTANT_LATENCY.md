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
| fusion-nightly | 16.6.2-p.1 | 1,879 | 1,925 | 1,866 | 1.0% |  |
| fusion | 16.6.1 | 1,872 | 1,913 | 1,861 | 0.9% |  |
| fusion-nightly-net11 | 16.6.2-p.1 | 1,862 | 1,924 | 1,855 | 1.3% |  |
| hive-router | v0.0.84 | 1,828 | 1,899 | 1,821 | 1.6% |  |
| fusion-nightly-fed | 16.6.2-p.1 | 1,816 | 1,868 | 1,807 | 1.1% |  |
| grafbase | 0.53.5 | 1,288 | 1,321 | 1,279 | 1.1% |  |
| cosmo | 0.334.0 | 1,187 | 1,225 | 1,176 | 1.4% |  |
| hive-gateway-router-runtime | 2.10.8 | 566 | 585 | 562 | 1.3% |  |
| apollo-router | v2.16.1 | 398 | 415 | 393 | 2.1% |  |
| apollo-gateway | 2.14.3 | 265 | 268 | 264 | 0.6% |  |
| hive-gateway | 2.10.8 | 260 | 267 | 259 | 1.0% |  |
| feddi | 5ff8b6165878 | 17 | 18 | 17 | 2.0% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687306      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.8µs    min=861ns   med=1.99µs  max=3.32ms   p(90)=3.8µs   p(95)=4.54µs  p(99.9)=27.9µs 
     http_req_connecting............: avg=359ns    min=0s      med=0s      max=3.27ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.96ms  min=17.54ms med=25.37ms max=304.04ms p(90)=30.34ms p(95)=32.12ms p(99.9)=48.93ms
       { expected_response:true }...: avg=25.96ms  min=17.54ms med=25.37ms max=304.04ms p(90)=30.34ms p(95)=32.12ms p(99.9)=48.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229202
     http_req_receiving.............: avg=303.43µs min=51.69µs med=94.2µs  max=99.34ms  p(90)=762.6µs p(95)=1.28ms  p(99.9)=8.09ms 
     http_req_sending...............: avg=31.37µs  min=4.58µs  med=8.44µs  max=125.81ms p(90)=18.96µs p(95)=35.7µs  p(99.9)=1.61ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.62ms  min=17.44ms med=25.05ms max=303.49ms p(90)=29.93ms p(95)=31.7ms  p(99.9)=47.45ms
     http_reqs......................: 229202  1879.775501/s
     iteration_duration.............: avg=26.18ms  min=17.74ms med=25.58ms max=314.79ms p(90)=30.54ms p(95)=32.32ms p(99.9)=49.26ms
     iterations.....................: 229102  1878.955362/s
     success_rate...................: 100.00% ✓ 229102      ✗ 0     
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

     checks.........................: 100.00% ✓ 684675      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 274 MB  2.2 MB/s
     http_req_blocked...............: avg=2.78µs   min=882ns   med=1.98µs  max=3.34ms   p(90)=3.67µs   p(95)=4.43µs  p(99.9)=30.06µs
     http_req_connecting............: avg=366ns    min=0s      med=0s      max=3.3ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.06ms  min=17.41ms med=25.48ms max=302.17ms p(90)=30.45ms  p(95)=32.25ms p(99.9)=49.62ms
       { expected_response:true }...: avg=26.06ms  min=17.41ms med=25.48ms max=302.17ms p(90)=30.45ms  p(95)=32.25ms p(99.9)=49.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228325
     http_req_receiving.............: avg=318.26µs min=48.96µs med=94.73µs max=157.03ms p(90)=817.68µs p(95)=1.32ms  p(99.9)=8.14ms 
     http_req_sending...............: avg=31.74µs  min=4.65µs  med=8.49µs  max=183.74ms p(90)=18.57µs  p(95)=29.04µs p(99.9)=1.6ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.71ms  min=17.28ms med=25.14ms max=301.55ms p(90)=30.04ms  p(95)=31.8ms  p(99.9)=47.98ms
     http_reqs......................: 228325  1872.427619/s
     iteration_duration.............: avg=26.28ms  min=17.58ms med=25.68ms max=312.24ms p(90)=30.66ms  p(95)=32.45ms p(99.9)=50ms   
     iterations.....................: 228225  1871.607547/s
     success_rate...................: 100.00% ✓ 228225      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 680985      ✗ 0     
     data_received..................: 20 GB   163 MB/s
     data_sent......................: 273 MB  2.2 MB/s
     http_req_blocked...............: avg=3.29µs  min=932ns   med=2.47µs  max=3.78ms   p(90)=4.05µs   p(95)=4.75µs  p(99.9)=37.01µs
     http_req_connecting............: avg=437ns   min=0s      med=0s      max=3.74ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.19ms min=17.8ms  med=25.61ms max=309.76ms p(90)=30.56ms  p(95)=32.41ms p(99.9)=50.39ms
       { expected_response:true }...: avg=26.19ms min=17.8ms  med=25.61ms max=309.76ms p(90)=30.56ms  p(95)=32.41ms p(99.9)=50.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227095
     http_req_receiving.............: avg=280.3µs min=51.13µs med=94µs    max=148.56ms p(90)=674.87µs p(95)=1.18ms  p(99.9)=7.97ms 
     http_req_sending...............: avg=33.48µs min=4.73µs  med=9.47µs  max=186.54ms p(90)=18.82µs  p(95)=39.59µs p(99.9)=1.67ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.88ms min=17.69ms med=25.31ms max=294.85ms p(90)=30.19ms  p(95)=32ms    p(99.9)=48.91ms
     http_reqs......................: 227095  1862.683152/s
     iteration_duration.............: avg=26.42ms min=18ms    med=25.82ms max=317.88ms p(90)=30.77ms  p(95)=32.62ms p(99.9)=50.78ms
     iterations.....................: 226995  1861.86293/s
     success_rate...................: 100.00% ✓ 226995      ✗ 0     
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

     checks.........................: 100.00% ✓ 668643      ✗ 0     
     data_received..................: 20 GB   160 MB/s
     data_sent......................: 268 MB  2.2 MB/s
     http_req_blocked...............: avg=2.89µs  min=922ns   med=2.07µs  max=4.07ms   p(90)=3.61µs  p(95)=4.32µs  p(99.9)=34.43µs
     http_req_connecting............: avg=439ns   min=0s      med=0s      max=4ms      p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.7ms  min=18.2ms  med=26.29ms max=323.07ms p(90)=30.42ms p(95)=31.83ms p(99.9)=47.15ms
       { expected_response:true }...: avg=26.7ms  min=18.2ms  med=26.29ms max=323.07ms p(90)=30.42ms p(95)=31.83ms p(99.9)=47.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 222981
     http_req_receiving.............: avg=99.15µs min=25.35µs med=51.72µs max=275.91ms p(90)=91.7µs  p(95)=114.5µs p(99.9)=1.85ms 
     http_req_sending...............: avg=28.87µs min=4.58µs  med=9.34µs  max=52.2ms   p(90)=17.52µs p(95)=23.86µs p(99.9)=1.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.57ms min=18.08ms med=26.2ms  max=90.58ms  p(90)=30.32ms p(95)=31.71ms p(99.9)=45.33ms
     http_reqs......................: 222981  1828.113486/s
     iteration_duration.............: avg=26.91ms min=18.4ms  med=26.48ms max=345.28ms p(90)=30.62ms p(95)=32.02ms p(99.9)=47.58ms
     iterations.....................: 222881  1827.293634/s
     success_rate...................: 100.00% ✓ 222881      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.2-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 664341      ✗ 0     
     data_received..................: 19 GB   159 MB/s
     data_sent......................: 266 MB  2.2 MB/s
     http_req_blocked...............: avg=2.98µs   min=842ns   med=2.03µs  max=11.68ms  p(90)=3.89µs  p(95)=4.65µs  p(99.9)=30.19µs
     http_req_connecting............: avg=410ns    min=0s      med=0s      max=3.53ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.86ms  min=17.45ms med=26.27ms max=301.12ms p(90)=31.4ms  p(95)=33.29ms p(99.9)=50ms   
       { expected_response:true }...: avg=26.86ms  min=17.45ms med=26.27ms max=301.12ms p(90)=31.4ms  p(95)=33.29ms p(99.9)=50ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 221547
     http_req_receiving.............: avg=301.95µs min=49.92µs med=93.42µs max=182.88ms p(90)=758.4µs p(95)=1.25ms  p(99.9)=7.6ms  
     http_req_sending...............: avg=31.56µs  min=4.41µs  med=8.46µs  max=107.28ms p(90)=19.13µs p(95)=32.34µs p(99.9)=1.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.53ms  min=17.09ms med=25.96ms max=300.39ms p(90)=31ms    p(95)=32.84ms p(99.9)=48.65ms
     http_reqs......................: 221547  1816.310138/s
     iteration_duration.............: avg=27.08ms  min=17.75ms med=26.48ms max=318.64ms p(90)=31.6ms  p(95)=33.49ms p(99.9)=50.44ms
     iterations.....................: 221447  1815.490307/s
     success_rate...................: 100.00% ✓ 221447      ✗ 0     
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

     checks.........................: 100.00% ✓ 471435      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 189 MB  1.5 MB/s
     http_req_blocked...............: avg=3.3µs   min=841ns   med=2.09µs  max=4.34ms   p(90)=4.47µs   p(95)=5.48µs   p(99.9)=43.95µs
     http_req_connecting............: avg=602ns   min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=37.93ms min=18.1ms  med=37.69ms max=300.5ms  p(90)=44.52ms  p(95)=46.58ms  p(99.9)=60.81ms
       { expected_response:true }...: avg=37.93ms min=18.1ms  med=37.69ms max=300.5ms  p(90)=44.52ms  p(95)=46.58ms  p(99.9)=60.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 157245
     http_req_receiving.............: avg=85.98µs min=27.82µs med=54.41µs max=214.77ms p(90)=122.56µs p(95)=169.04µs p(99.9)=2ms    
     http_req_sending...............: avg=34.98µs min=4.24µs  med=8.95µs  max=218.48ms p(90)=23.23µs  p(95)=46.81µs  p(99.9)=1.81ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.81ms min=17.99ms med=37.58ms max=299.45ms p(90)=44.4ms   p(95)=46.46ms  p(99.9)=59.9ms 
     http_reqs......................: 157245  1288.90415/s
     iteration_duration.............: avg=38.17ms min=21.23ms med=37.92ms max=327.34ms p(90)=44.74ms  p(95)=46.79ms  p(99.9)=61.42ms
     iterations.....................: 157145  1288.084471/s
     success_rate...................: 100.00% ✓ 157145      ✗ 0     
     vus............................: 29      min=0         max=50  
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

     checks.........................: 100.00% ✓ 434178      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.97µs  min=962ns   med=2.98µs  max=4.22ms   p(90)=4.68µs   p(95)=5.44µs   p(99.9)=39.18µs 
     http_req_connecting............: avg=676ns   min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=41.2ms  min=18.86ms med=40.59ms max=321.09ms p(90)=49.67ms  p(95)=52.61ms  p(99.9)=67.41ms 
       { expected_response:true }...: avg=41.2ms  min=18.86ms med=40.59ms max=321.09ms p(90)=49.67ms  p(95)=52.61ms  p(99.9)=67.41ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144826
     http_req_receiving.............: avg=82.69µs min=26.06µs med=67.72µs max=182.81ms p(90)=110.24µs p(95)=128.59µs p(99.9)=883.15µs
     http_req_sending...............: avg=27.25µs min=5.21µs  med=12.67µs max=163.41ms p(90)=20.22µs  p(95)=24.38µs  p(99.9)=1.05ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.09ms min=18.69ms med=40.49ms max=308.25ms p(90)=49.56ms  p(95)=52.5ms   p(99.9)=67.31ms 
     http_reqs......................: 144826  1187.088856/s
     iteration_duration.............: avg=41.45ms min=23.81ms med=40.81ms max=330.73ms p(90)=49.89ms  p(95)=52.83ms  p(99.9)=67.78ms 
     iterations.....................: 144726  1186.26919/s
     success_rate...................: 100.00% ✓ 144726      ✗ 0     
     vus............................: 35      min=0         max=50  
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

     checks.........................: 100.00% ✓ 207675     ✗ 0    
     data_received..................: 6.1 GB  50 MB/s
     data_sent......................: 83 MB   681 kB/s
     http_req_blocked...............: avg=4.65µs  min=1.26µs  med=3.47µs  max=3.14ms   p(90)=5.12µs   p(95)=5.82µs   p(99.9)=50.21µs 
     http_req_connecting............: avg=904ns   min=0s      med=0s      max=3.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=86.33ms min=20.98ms med=84.66ms max=344.03ms p(90)=104.93ms p(95)=113.6ms  p(99.9)=197.02ms
       { expected_response:true }...: avg=86.33ms min=20.98ms med=84.66ms max=344.03ms p(90)=104.93ms p(95)=113.6ms  p(99.9)=197.02ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 69325
     http_req_receiving.............: avg=88.16µs min=30.41µs med=81.03µs max=43.27ms  p(90)=116.18µs p(95)=130.11µs p(99.9)=645.04µs
     http_req_sending...............: avg=24.63µs min=5.55µs  med=16.44µs max=91.13ms  p(90)=23.32µs  p(95)=25.78µs  p(99.9)=652.85µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=86.22ms min=20.87ms med=84.55ms max=343.73ms p(90)=104.83ms p(95)=113.47ms p(99.9)=196.78ms
     http_reqs......................: 69325   566.927087/s
     iteration_duration.............: avg=86.69ms min=31.73ms med=84.93ms max=353.15ms p(90)=105.21ms p(95)=113.9ms  p(99.9)=198.21ms
     iterations.....................: 69225   566.109306/s
     success_rate...................: 100.00% ✓ 69225      ✗ 0    
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

     checks.........................: 100.00% ✓ 145785     ✗ 0    
     data_received..................: 4.3 GB  35 MB/s
     data_sent......................: 59 MB   478 kB/s
     http_req_blocked...............: avg=5.44µs   min=1.13µs  med=3.12µs  max=4.2ms    p(90)=4.58µs   p(95)=5.14µs   p(99.9)=853.97µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=831.95µs
     http_req_duration..............: avg=123.03ms min=21.16ms med=120.9ms max=307.71ms p(90)=154.15ms p(95)=164.92ms p(99.9)=210.9ms 
       { expected_response:true }...: avg=123.03ms min=21.16ms med=120.9ms max=307.71ms p(90)=154.15ms p(95)=164.92ms p(99.9)=210.9ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48695
     http_req_receiving.............: avg=89.55µs  min=30.19µs med=82.6µs  max=92.91ms  p(90)=117.95µs p(95)=133.12µs p(99.9)=545.89µs
     http_req_sending...............: avg=24.15µs  min=5.38µs  med=16.32µs max=72.36ms  p(90)=21.76µs  p(95)=23.79µs  p(99.9)=528.61µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=122.92ms min=21.02ms med=120.8ms max=307.25ms p(90)=154.04ms p(95)=164.8ms  p(99.9)=210.55ms
     http_reqs......................: 48695   398.016842/s
     iteration_duration.............: avg=123.51ms min=33.61ms med=121.2ms max=335.16ms p(90)=154.44ms p(95)=165.2ms  p(99.9)=212.96ms
     iterations.....................: 48595   397.199475/s
     success_rate...................: 100.00% ✓ 48595      ✗ 0    
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

     checks.........................: 100.00% ✓ 97356      ✗ 0    
     data_received..................: 2.9 GB  23 MB/s
     data_sent......................: 39 MB   319 kB/s
     http_req_blocked...............: avg=11.77µs  min=1.13µs  med=3.22µs   max=9.47ms   p(90)=4.65µs   p(95)=5.19µs   p(99.9)=4.69ms  
     http_req_connecting............: avg=8.11µs   min=0s      med=0s       max=9.42ms   p(90)=0s       p(95)=0s       p(99.9)=4.36ms  
     http_req_duration..............: avg=184.17ms min=23.47ms med=185.93ms max=385.27ms p(90)=207.17ms p(95)=212.24ms p(99.9)=285.49ms
       { expected_response:true }...: avg=184.17ms min=23.47ms med=185.93ms max=385.27ms p(90)=207.17ms p(95)=212.24ms p(99.9)=285.49ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32552
     http_req_receiving.............: avg=101.5µs  min=31.12µs med=89.8µs   max=100.3ms  p(90)=120.48µs p(95)=132.23µs p(99.9)=787.19µs
     http_req_sending...............: avg=28.06µs  min=5.43µs  med=17.74µs  max=47.56ms  p(90)=22.43µs  p(95)=24.26µs  p(99.9)=1.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=184.04ms min=23.33ms med=185.81ms max=384.49ms p(90)=207.05ms p(95)=212.12ms p(99.9)=285.38ms
     http_reqs......................: 32552   265.364382/s
     iteration_duration.............: avg=184.99ms min=44.67ms med=186.43ms max=405.41ms p(90)=207.5ms  p(95)=212.55ms p(99.9)=288.19ms
     iterations.....................: 32452   264.549181/s
     success_rate...................: 100.00% ✓ 32452      ✗ 0    
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

     checks.........................: 100.00% ✓ 95226      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   313 kB/s
     http_req_blocked...............: avg=11.43µs  min=1.32µs  med=3.87µs   max=8.76ms   p(90)=5.44µs   p(95)=6.07µs   p(99.9)=3.88ms  
     http_req_connecting............: avg=6.92µs   min=0s      med=0s       max=8.57ms   p(90)=0s       p(95)=0s       p(99.9)=3.46ms  
     http_req_duration..............: avg=188.32ms min=17.14ms med=161.6ms  max=734.12ms p(90)=288.12ms p(95)=343.15ms p(99.9)=631.23ms
       { expected_response:true }...: avg=188.32ms min=17.14ms med=161.6ms  max=734.12ms p(90)=288.12ms p(95)=343.15ms p(99.9)=631.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31842
     http_req_receiving.............: avg=109.42µs min=33.46µs med=91.32µs  max=116.63ms p(90)=123.66µs p(95)=137.28µs p(99.9)=924.35µs
     http_req_sending...............: avg=29.43µs  min=6.11µs  med=19.18µs  max=44.94ms  p(90)=24.26µs  p(95)=26.27µs  p(99.9)=688.86µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.18ms min=17ms    med=161.47ms max=734ms    p(90)=287.98ms p(95)=343.02ms p(99.9)=631.11ms
     http_reqs......................: 31842   260.61366/s
     iteration_duration.............: avg=189.16ms min=50.69ms med=162.08ms max=734.43ms p(90)=288.79ms p(95)=344.13ms p(99.9)=631.53ms
     iterations.....................: 31742   259.795201/s
     success_rate...................: 100.00% ✓ 31742      ✗ 0    
     vus............................: 39      min=0        max=50 
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

     checks.........................: 100.00% ✓ 6498      ✗ 0   
     data_received..................: 217 MB  1.7 MB/s
     data_sent......................: 2.7 MB  21 kB/s
     http_req_blocked...............: avg=44.33µs min=1.19µs   med=3.57µs  max=4.03ms   p(90)=5.32µs   p(95)=6.24µs   p(99.9)=3.74ms  
     http_req_connecting............: avg=39.74µs min=0s       med=0s      max=3.99ms   p(90)=0s       p(95)=0s       p(99.9)=3.71ms  
     http_req_duration..............: avg=2.67s   min=42.3ms   med=2.76s   max=4.49s    p(90)=3.39s    p(95)=3.57s    p(99.9)=4.45s   
       { expected_response:true }...: avg=2.67s   min=42.3ms   med=2.76s   max=4.49s    p(90)=3.39s    p(95)=3.57s    p(99.9)=4.45s   
     http_req_failed................: 0.00%   ✓ 0         ✗ 2266
     http_req_receiving.............: avg=94.03µs min=37.69µs  med=89.16µs max=388.61µs p(90)=132.68µs p(95)=151.79µs p(99.9)=336.55µs
     http_req_sending...............: avg=47.03µs min=5.96µs   med=18.54µs max=10.55ms  p(90)=24.62µs  p(95)=30.23µs  p(99.9)=6.64ms  
     http_req_tls_handshaking.......: avg=0s      min=0s       med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=2.67s   min=42.15ms  med=2.76s   max=4.49s    p(90)=3.39s    p(95)=3.57s    p(99.9)=4.45s   
     http_reqs......................: 2266    17.766346/s
     iteration_duration.............: avg=2.8s    min=932.74ms med=2.8s    max=4.49s    p(90)=3.4s     p(95)=3.58s    p(99.9)=4.46s   
     iterations.....................: 2166    16.982306/s
     success_rate...................: 100.00% ✓ 2166      ✗ 0   
     vus............................: 20      min=0       max=50
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=bench-001, os=Linux 6.8.0-134-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=32 logical (16 CPUs), ram=122 GB

