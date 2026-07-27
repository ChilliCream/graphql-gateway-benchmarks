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
| fusion-nightly-net11 | 16.6.0-p.3 | 1,882 | 1,914 | 1,868 | 0.8% |  |
| fusion-nightly | 16.6.0-p.3 | 1,879 | 1,921 | 1,866 | 1.0% |  |
| fusion | 16.5.1 | 1,875 | 1,916 | 1,866 | 1.0% |  |
| hive-router | v0.0.84 | 1,835 | 1,905 | 1,827 | 1.5% |  |
| fusion-nightly-fed | 16.6.0-p.3 | 1,756 | 1,802 | 1,737 | 1.2% |  |
| grafbase | 0.53.5 | 1,284 | 1,322 | 1,276 | 1.1% |  |
| cosmo | 0.334.0 | 1,164 | 1,217 | 1,156 | 1.9% |  |
| hive-gateway-router-runtime | 2.10.8 | 554 | 577 | 550 | 1.8% |  |
| apollo-router | v2.16.1 | 394 | 414 | 392 | 1.9% |  |
| apollo-gateway | 2.14.3 | 258 | 266 | 256 | 1.2% |  |
| hive-gateway | 2.10.8 | 258 | 265 | 255 | 1.4% |  |
| feddi | 5ff8b6165878 | 20 | 20 | 19 | 2.2% |  |


### Details

<details>
  <summary>Summary for: fusion-nightly-net11 (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 688263      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 276 MB  2.3 MB/s
     http_req_blocked...............: avg=3.44µs   min=841ns   med=1.94µs  max=8.51ms   p(90)=3.69µs   p(95)=4.46µs  p(99.9)=31.32µs
     http_req_connecting............: avg=1.01µs   min=0s      med=0s      max=8.48ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.93ms  min=17.5ms  med=25.37ms max=316.67ms p(90)=30.13ms  p(95)=31.88ms p(99.9)=50.04ms
       { expected_response:true }...: avg=25.93ms  min=17.5ms  med=25.37ms max=316.67ms p(90)=30.13ms  p(95)=31.88ms p(99.9)=50.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229521
     http_req_receiving.............: avg=324.37µs min=50.5µs  med=92.48µs max=97.21ms  p(90)=855.32µs p(95)=1.4ms   p(99.9)=8.79ms 
     http_req_sending...............: avg=32.68µs  min=4.54µs  med=8.16µs  max=274.7ms  p(90)=18.25µs  p(95)=28.3µs  p(99.9)=1.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.57ms  min=17.36ms med=25.03ms max=314.2ms  p(90)=29.69ms  p(95)=31.41ms p(99.9)=47.97ms
     http_reqs......................: 229521  1882.719643/s
     iteration_duration.............: avg=26.14ms  min=17.73ms med=25.57ms max=330.47ms p(90)=30.32ms  p(95)=32.09ms p(99.9)=50.33ms
     iterations.....................: 229421  1881.899361/s
     success_rate...................: 100.00% ✓ 229421      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687153      ✗ 0     
     data_received..................: 20 GB   165 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.94µs   min=851ns   med=2.15µs  max=3.42ms   p(90)=3.97µs  p(95)=4.72µs  p(99.9)=29.15µs
     http_req_connecting............: avg=370ns    min=0s      med=0s      max=3.38ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=25.97ms  min=17.03ms med=25.41ms max=298.42ms p(90)=30.32ms p(95)=32.1ms  p(99.9)=48.6ms 
       { expected_response:true }...: avg=25.97ms  min=17.03ms med=25.41ms max=298.42ms p(90)=30.32ms p(95)=32.1ms  p(99.9)=48.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 229151
     http_req_receiving.............: avg=300.51µs min=49.98µs med=94.22µs max=255.52ms p(90)=760.2µs p(95)=1.27ms  p(99.9)=7.29ms 
     http_req_sending...............: avg=33.42µs  min=4.59µs  med=8.77µs  max=203.31ms p(90)=18.98µs p(95)=29.93µs p(99.9)=1.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.64ms  min=16.95ms med=25.1ms  max=297.81ms p(90)=29.92ms p(95)=31.67ms p(99.9)=47.5ms 
     http_reqs......................: 229151  1879.127704/s
     iteration_duration.............: avg=26.18ms  min=17.23ms med=25.62ms max=306.99ms p(90)=30.52ms p(95)=32.3ms  p(99.9)=48.89ms
     iterations.....................: 229051  1878.307665/s
     success_rate...................: 100.00% ✓ 229051      ✗ 0     
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

     checks.........................: 100.00% ✓ 685887      ✗ 0     
     data_received..................: 20 GB   164 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=2.88µs   min=902ns   med=2.03µs  max=7.4ms    p(90)=3.72µs  p(95)=4.45µs  p(99.9)=29.8µs 
     http_req_connecting............: avg=403ns    min=0s      med=0s      max=4.09ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.02ms  min=17.17ms med=25.45ms max=303.73ms p(90)=30.4ms  p(95)=32.21ms p(99.9)=48.77ms
       { expected_response:true }...: avg=26.02ms  min=17.17ms med=25.45ms max=303.73ms p(90)=30.4ms  p(95)=32.21ms p(99.9)=48.77ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 228729
     http_req_receiving.............: avg=310.18µs min=49.09µs med=91.26µs max=133.62ms p(90)=795.7µs p(95)=1.31ms  p(99.9)=8.26ms 
     http_req_sending...............: avg=30.86µs  min=4.37µs  med=8.44µs  max=161.16ms p(90)=17.72µs p(95)=29.5µs  p(99.9)=1.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=25.68ms  min=17.08ms med=25.12ms max=303.32ms p(90)=29.99ms p(95)=31.76ms p(99.9)=46.88ms
     http_reqs......................: 228729  1875.964964/s
     iteration_duration.............: avg=26.23ms  min=17.35ms med=25.65ms max=313.89ms p(90)=30.61ms p(95)=32.42ms p(99.9)=49.22ms
     iterations.....................: 228629  1875.144795/s
     success_rate...................: 100.00% ✓ 228629      ✗ 0     
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

     checks.........................: 100.00% ✓ 671214      ✗ 0     
     data_received..................: 20 GB   161 MB/s
     data_sent......................: 269 MB  2.2 MB/s
     http_req_blocked...............: avg=3.28µs  min=972ns   med=2.51µs  max=3.7ms    p(90)=4.01µs  p(95)=4.68µs  p(99.9)=35.97µs
     http_req_connecting............: avg=431ns   min=0s      med=0s      max=3.66ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=26.59ms min=17.94ms med=26.16ms max=312.91ms p(90)=30.36ms p(95)=31.81ms p(99.9)=47.86ms
       { expected_response:true }...: avg=26.59ms min=17.94ms med=26.16ms max=312.91ms p(90)=30.36ms p(95)=31.81ms p(99.9)=47.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 223838
     http_req_receiving.............: avg=77.06µs min=26.05µs med=53.2µs  max=194.11ms p(90)=92.92µs p(95)=117.8µs p(99.9)=1.93ms 
     http_req_sending...............: avg=33.96µs min=5.02µs  med=10.38µs max=214.81ms p(90)=17.31µs p(95)=24.37µs p(99.9)=1.42ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=26.48ms min=17.8ms  med=26.06ms max=295.69ms p(90)=30.24ms p(95)=31.68ms p(99.9)=46.19ms
     http_reqs......................: 223838  1835.802027/s
     iteration_duration.............: avg=26.8ms  min=18.9ms  med=26.36ms max=320.3ms  p(90)=30.56ms p(95)=32.01ms p(99.9)=48.43ms
     iterations.....................: 223738  1834.981879/s
     success_rate...................: 100.00% ✓ 223738      ✗ 0     
     vus............................: 50      min=0         max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly-fed (.net subgraphs) (16.6.0-p.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 642582      ✗ 0     
     data_received..................: 19 GB   154 MB/s
     data_sent......................: 258 MB  2.1 MB/s
     http_req_blocked...............: avg=2.92µs   min=892ns   med=2.04µs  max=3.59ms   p(90)=3.78µs   p(95)=4.51µs  p(99.9)=32.12µs
     http_req_connecting............: avg=438ns    min=0s      med=0s      max=3.55ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=27.78ms  min=18.24ms med=27.19ms max=312.55ms p(90)=32.55ms  p(95)=34.41ms p(99.9)=51.64ms
       { expected_response:true }...: avg=27.78ms  min=18.24ms med=27.19ms max=312.55ms p(90)=32.55ms  p(95)=34.41ms p(99.9)=51.64ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 214294
     http_req_receiving.............: avg=341.69µs min=50.74µs med=100.9µs max=158.41ms p(90)=884.45µs p(95)=1.39ms  p(99.9)=8.48ms 
     http_req_sending...............: avg=32.23µs  min=4.59µs  med=8.66µs  max=205.67ms p(90)=19.13µs  p(95)=29.07µs p(99.9)=1.5ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=27.41ms  min=18.12ms med=26.85ms max=311.85ms p(90)=32.12ms  p(95)=33.91ms p(99.9)=49.78ms
     http_reqs......................: 214294  1756.742927/s
     iteration_duration.............: avg=28ms     min=18.58ms med=27.4ms  max=321.66ms p(90)=32.76ms  p(95)=34.61ms p(99.9)=52.09ms
     iterations.....................: 214194  1755.923145/s
     success_rate...................: 100.00% ✓ 214194      ✗ 0     
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

     checks.........................: 100.00% ✓ 469815      ✗ 0     
     data_received..................: 14 GB   113 MB/s
     data_sent......................: 188 MB  1.5 MB/s
     http_req_blocked...............: avg=3.97µs  min=992ns   med=3µs     max=2.95ms   p(90)=5.29µs   p(95)=6.25µs   p(99.9)=45.73µs
     http_req_connecting............: avg=467ns   min=0s      med=0s      max=2.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.02ms min=18ms    med=37.71ms max=295.05ms p(90)=44.92ms  p(95)=47.07ms  p(99.9)=64.26ms
       { expected_response:true }...: avg=38.02ms min=18ms    med=37.71ms max=295.05ms p(90)=44.92ms  p(95)=47.07ms  p(99.9)=64.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 156705
     http_req_receiving.............: avg=92.76µs min=27.99µs med=61.45µs max=215.76ms p(90)=128.11µs p(95)=175.44µs p(99.9)=2.11ms 
     http_req_sending...............: avg=38.83µs min=4.72µs  med=11.41µs max=143.67ms p(90)=25.2µs   p(95)=61.77µs  p(99.9)=2.07ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=37.89ms min=17.85ms med=37.59ms max=294.22ms p(90)=44.79ms  p(95)=46.92ms  p(99.9)=63.45ms
     http_reqs......................: 156705  1284.583379/s
     iteration_duration.............: avg=38.3ms  min=20.32ms med=37.96ms max=320.32ms p(90)=45.15ms  p(95)=47.31ms  p(99.9)=64.79ms
     iterations.....................: 156605  1283.763633/s
     success_rate...................: 100.00% ✓ 156605      ✗ 0     
     vus............................: 2       min=0         max=50  
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

     checks.........................: 100.00% ✓ 425721      ✗ 0     
     data_received..................: 12 GB   102 MB/s
     data_sent......................: 171 MB  1.4 MB/s
     http_req_blocked...............: avg=3.91µs  min=1.14µs  med=2.97µs  max=3.61ms   p(90)=4.6µs    p(95)=5.33µs   p(99.9)=38.66µs 
     http_req_connecting............: avg=627ns   min=0s      med=0s      max=3.56ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=42.03ms min=18.25ms med=41.43ms max=307.61ms p(90)=50.77ms  p(95)=53.7ms   p(99.9)=69.2ms  
       { expected_response:true }...: avg=42.03ms min=18.25ms med=41.43ms max=307.61ms p(90)=50.77ms  p(95)=53.7ms   p(99.9)=69.2ms  
     http_req_failed................: 0.00%   ✓ 0           ✗ 142007
     http_req_receiving.............: avg=84.12µs min=28.48µs med=71.3µs  max=29.25ms  p(90)=113.41µs p(95)=131.98µs p(99.9)=824.85µs
     http_req_sending...............: avg=26.75µs min=5.38µs  med=12.54µs max=187.31ms p(90)=19.82µs  p(95)=23.8µs   p(99.9)=972.76µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=41.92ms min=18.1ms  med=41.33ms max=306.95ms p(90)=50.66ms  p(95)=53.59ms  p(99.9)=69ms    
     http_reqs......................: 142007  1164.128047/s
     iteration_duration.............: avg=42.27ms min=22.81ms med=41.65ms max=332.9ms  p(90)=50.99ms  p(95)=53.93ms  p(99.9)=69.5ms  
     iterations.....................: 141907  1163.308279/s
     success_rate...................: 100.00% ✓ 141907      ✗ 0     
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

     checks.........................: 100.00% ✓ 202938     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   666 kB/s
     http_req_blocked...............: avg=5µs     min=1.24µs  med=3.31µs  max=3.35ms   p(90)=4.91µs   p(95)=5.6µs    p(99.9)=51.87µs 
     http_req_connecting............: avg=1.4µs   min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.35ms min=20.76ms med=83.96ms max=323.83ms p(90)=117.57ms p(95)=127.6ms  p(99.9)=214.92ms
       { expected_response:true }...: avg=88.35ms min=20.76ms med=83.96ms max=323.83ms p(90)=117.57ms p(95)=127.6ms  p(99.9)=214.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67746
     http_req_receiving.............: avg=87.14µs min=29.92µs med=76.94µs max=113.85ms p(90)=112.91µs p(95)=126.48µs p(99.9)=671.05µs
     http_req_sending...............: avg=25.25µs min=5.52µs  med=15.58µs max=107.78ms p(90)=22.14µs  p(95)=24.53µs  p(99.9)=640.25µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.24ms min=20.59ms med=83.85ms max=323.23ms p(90)=117.46ms p(95)=127.48ms p(99.9)=214.6ms 
     http_reqs......................: 67746   554.095717/s
     iteration_duration.............: avg=88.7ms  min=38.81ms med=84.24ms max=332.24ms p(90)=117.83ms p(95)=127.87ms p(99.9)=216.35ms
     iterations.....................: 67646   553.277815/s
     success_rate...................: 100.00% ✓ 67646      ✗ 0    
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

     checks.........................: 100.00% ✓ 144606     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   474 kB/s
     http_req_blocked...............: avg=5.37µs   min=1.2µs   med=3.19µs   max=3.5ms    p(90)=4.71µs   p(95)=5.26µs   p(99.9)=241.75µs
     http_req_connecting............: avg=1.94µs   min=0s      med=0s       max=3.45ms   p(90)=0s       p(95)=0s       p(99.9)=205.02µs
     http_req_duration..............: avg=124.03ms min=21.39ms med=121.87ms max=324.18ms p(90)=155.7ms  p(95)=165.82ms p(99.9)=209.72ms
       { expected_response:true }...: avg=124.03ms min=21.39ms med=121.87ms max=324.18ms p(90)=155.7ms  p(95)=165.82ms p(99.9)=209.72ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48302
     http_req_receiving.............: avg=86.2µs   min=30.28µs med=83.24µs  max=29.45ms  p(90)=114.01µs p(95)=125.51µs p(99.9)=510.05µs
     http_req_sending...............: avg=29.03µs  min=5.28µs  med=16.13µs  max=164.02ms p(90)=21.47µs  p(95)=23.36µs  p(99.9)=467.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.92ms min=21.29ms med=121.76ms max=323.73ms p(90)=155.59ms p(95)=165.71ms p(99.9)=209.37ms
     http_reqs......................: 48302   394.807075/s
     iteration_duration.............: avg=124.52ms min=38.65ms med=122.18ms max=347.3ms  p(90)=155.98ms p(95)=166.16ms p(99.9)=211.47ms
     iterations.....................: 48202   393.989703/s
     success_rate...................: 100.00% ✓ 48202      ✗ 0    
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

     checks.........................: 100.00% ✓ 94737      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=7.36µs   min=1.5µs   med=3.65µs   max=4.45ms   p(90)=5.13µs   p(95)=5.73µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.42µs   min=0s      med=0s       max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=189.25ms min=23.43ms med=204.2ms  max=404.59ms p(90)=219.63ms p(95)=224.26ms p(99.9)=292.95ms
       { expected_response:true }...: avg=189.25ms min=23.43ms med=204.2ms  max=404.59ms p(90)=219.63ms p(95)=224.26ms p(99.9)=292.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31679
     http_req_receiving.............: avg=95.03µs  min=36.25µs med=90.72µs  max=5.68ms   p(90)=122.15µs p(95)=134.41µs p(99.9)=498.29µs
     http_req_sending...............: avg=30.78µs  min=6.86µs  med=18.37µs  max=82.23ms  p(90)=23.49µs  p(95)=25.46µs  p(99.9)=624.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.12ms min=23.35ms med=204.07ms max=401.07ms p(90)=219.53ms p(95)=224.14ms p(99.9)=292.85ms
     http_reqs......................: 31679   258.290798/s
     iteration_duration.............: avg=190.09ms min=52.69ms med=204.67ms max=411.31ms p(90)=219.93ms p(95)=224.59ms p(99.9)=297.03ms
     iterations.....................: 31579   257.47546/s
     success_rate...................: 100.00% ✓ 31579      ✗ 0    
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

     checks.........................: 100.00% ✓ 94335      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   310 kB/s
     http_req_blocked...............: avg=7.38µs   min=1.29µs  med=3.83µs   max=4.2ms    p(90)=5.4µs    p(95)=6.03µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=3.18µs   min=0s      med=0s       max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=1.49ms  
     http_req_duration..............: avg=190.06ms min=18.66ms med=178.18ms max=607.17ms p(90)=226.14ms p(95)=258.46ms p(99.9)=557.67ms
       { expected_response:true }...: avg=190.06ms min=18.66ms med=178.18ms max=607.17ms p(90)=226.14ms p(95)=258.46ms p(99.9)=557.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31545
     http_req_receiving.............: avg=94.87µs  min=33.58µs med=90.82µs  max=8.3ms    p(90)=122.05µs p(95)=134.72µs p(99.9)=520.12µs
     http_req_sending...............: avg=31.35µs  min=6.06µs  med=18.05µs  max=75.32ms  p(90)=23.22µs  p(95)=25.08µs  p(99.9)=516.42µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=189.94ms min=18.51ms med=178.07ms max=607.07ms p(90)=226.03ms p(95)=258.36ms p(99.9)=557.55ms
     http_reqs......................: 31545   258.21838/s
     iteration_duration.............: avg=190.91ms min=35.31ms med=178.58ms max=607.45ms p(90)=226.51ms p(95)=259.79ms p(99.9)=557.96ms
     iterations.....................: 31445   257.399809/s
     success_rate...................: 100.00% ✓ 31445      ✗ 0    
     vus............................: 31      min=0        max=50 
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

     checks.........................: 100.00% ✓ 7431      ✗ 0   
     data_received..................: 247 MB  1.9 MB/s
     data_sent......................: 3.1 MB  24 kB/s
     http_req_blocked...............: avg=66.33µs  min=1.24µs   med=3.22µs  max=9.12ms  p(90)=4.88µs   p(95)=5.79µs   p(99.9)=8.45ms 
     http_req_connecting............: avg=61.77µs  min=0s       med=0s      max=9.08ms  p(90)=0s       p(95)=0s       p(99.9)=8.42ms 
     http_req_duration..............: avg=2.36s    min=38.26ms  med=2.42s   max=4.21s   p(90)=3.06s    p(95)=3.26s    p(99.9)=3.92s  
       { expected_response:true }...: avg=2.36s    min=38.26ms  med=2.42s   max=4.21s   p(90)=3.06s    p(95)=3.26s    p(99.9)=3.92s  
     http_req_failed................: 0.00%   ✓ 0         ✗ 2577
     http_req_receiving.............: avg=108.96µs min=30.47µs  med=94.18µs max=16.17ms p(90)=134.74µs p(95)=153.61µs p(99.9)=3.6ms  
     http_req_sending...............: avg=106.77µs min=5.73µs   med=18.29µs max=34.65ms p(90)=23.75µs  p(95)=27.82µs  p(99.9)=12.76ms
     http_req_tls_handshaking.......: avg=0s       min=0s       med=0s      max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=2.36s    min=38.11ms  med=2.42s   max=4.2s    p(90)=3.06s    p(95)=3.26s    p(99.9)=3.92s  
     http_reqs......................: 2577    20.165498/s
     iteration_duration.............: avg=2.45s    min=506.83ms med=2.45s   max=4.21s   p(90)=3.08s    p(95)=3.27s    p(99.9)=3.92s  
     iterations.....................: 2477    19.38298/s
     success_rate...................: 100.00% ✓ 2477      ✗ 0   
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

