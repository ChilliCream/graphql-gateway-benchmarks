## Overview for: `constant-vus-over-time`

Each benchmark runs a GraphQL gateway with 4 subgraphs and executes a heavy nested query that exercises federation/composition capabilities.

Results are split by subgraph technology:
- **Rust Subgraphs** = [async-graphql](https://github.com/async-graphql/async-graphql) + axum
- **.NET Subgraphs** = [HotChocolate](https://github.com/ChilliCream/graphql-platform)

**Methodology:** Each gateway executes 10 runs of 120s each. The first run is a full-duration warmup (discarded). The remaining 9 runs are measured. Results are ranked by **median RPS** across the 9 measured runs, with best/worst/CV% reported for transparency.

This scenario executes a constant load of **50 VUs** over **120s**.


### Rust Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,879 | 3,086 | 2,822 | 3.0% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,144 | 2,191 | 2,104 | 1.2% |  |
| grafbase | 0.53.3 | 2,039 | 2,109 | 2,021 | 1.4% |  |
| cosmo | 0.307.0 | 1,240 | 1,259 | 1,227 | 0.9% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 538 | 549 | 527 | 1.3% |  |
| apollo-router | v2.13.1 | 397 | 409 | 392 | 1.4% |  |
| apollo-gateway | 2.13.3 | 251 | 253 | 250 | 0.4% |  |
| hive-gateway | 2.5.25 | 250 | 253 | 247 | 0.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,397 | 2,538 | 2,365 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,949 | 1,996 | 1,915 | 1.3% |  |
| grafbase | 0.53.3 | 1,572 | 1,572 | 1,572 | 0.0% |  |
| cosmo | 0.307.0 | 1,175 | 1,197 | 1,166 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 509 | 523 | 503 | 1.2% |  |
| apollo-router | v2.13.1 | 371 | 382 | 366 | 1.4% |  |
| hive-gateway | 2.5.25 | 246 | 249 | 242 | 1.0% |  |
| apollo-gateway | 2.13.3 | 236 | 240 | 234 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1037952     ✗ 0     
     data_received..................: 30 GB   253 MB/s
     data_sent......................: 416 MB  3.5 MB/s
     http_req_blocked...............: avg=3.14µs   min=1.06µs med=2.21µs  max=26.23ms  p(90)=3.44µs  p(95)=4.07µs   p(99.9)=32.4µs 
     http_req_connecting............: avg=301ns    min=0s     med=0s      max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.09ms  min=1.66ms med=16.15ms max=325.25ms p(90)=25.41ms p(95)=29.35ms  p(99.9)=52.29ms
       { expected_response:true }...: avg=17.09ms  min=1.66ms med=16.15ms max=325.25ms p(90)=25.41ms p(95)=29.35ms  p(99.9)=52.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 346084
     http_req_receiving.............: avg=140.79µs min=27.5µs med=49.6µs  max=131.16ms p(90)=98.24µs p(95)=278.52µs p(99.9)=14.64ms
     http_req_sending...............: avg=61.87µs  min=5.18µs med=9.12µs  max=275.6ms  p(90)=15.51µs p(95)=122.71µs p(99.9)=13.15ms
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.89ms  min=1.59ms med=15.99ms max=202.91ms p(90)=25.12ms p(95)=28.93ms  p(99.9)=51.15ms
     http_reqs......................: 346084  2879.163414/s
     iteration_duration.............: avg=17.33ms  min=2.23ms med=16.36ms max=360.38ms p(90)=25.64ms p(95)=29.62ms  p(99.9)=53.35ms
     iterations.....................: 345984  2878.331488/s
     success_rate...................: 100.00% ✓ 345984      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 773640      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=3.14µs  min=1.02µs  med=2.07µs   max=32.19ms  p(90)=3.19µs   p(95)=3.81µs   p(99.9)=32.69µs 
     http_req_connecting............: avg=381ns   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.02ms min=2.43ms  med=14.91ms  max=316.63ms p(90)=50.58ms  p(95)=69.03ms  p(99.9)=168.92ms
       { expected_response:true }...: avg=23.02ms min=2.43ms  med=14.91ms  max=316.63ms p(90)=50.58ms  p(95)=69.03ms  p(99.9)=168.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257980
     http_req_receiving.............: avg=652.6µs min=51.11µs med=102.87µs max=175.85ms p(90)=970.85µs p(95)=1.5ms    p(99.9)=57.57ms 
     http_req_sending...............: avg=45.57µs min=5.41µs  med=9.3µs    max=172.34ms p(90)=15.59µs  p(95)=110.56µs p(99.9)=3.86ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.32ms min=2.3ms   med=14.39ms  max=316.01ms p(90)=49.23ms  p(95)=67.69ms  p(99.9)=166.24ms
     http_reqs......................: 257980  2144.678071/s
     iteration_duration.............: avg=23.25ms min=3.22ms  med=15.13ms  max=331.69ms p(90)=50.84ms  p(95)=69.3ms   p(99.9)=169.86ms
     iterations.....................: 257880  2143.846736/s
     success_rate...................: 100.00% ✓ 257880      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 735492      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 295 MB  2.5 MB/s
     http_req_blocked...............: avg=3.28µs   min=1.03µs  med=2.37µs  max=11.53ms  p(90)=3.83µs   p(95)=4.57µs   p(99.9)=38.6µs 
     http_req_connecting............: avg=404ns    min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.23ms  min=1.98ms  med=23.97ms max=318.46ms p(90)=29.19ms  p(95)=31.53ms  p(99.9)=54.11ms
       { expected_response:true }...: avg=24.23ms  min=1.98ms  med=23.97ms max=318.46ms p(90)=29.19ms  p(95)=31.53ms  p(99.9)=54.11ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 245264
     http_req_receiving.............: avg=113.61µs min=29.74µs med=58.47µs max=158.86ms p(90)=101.04µs p(95)=202.92µs p(99.9)=9.68ms 
     http_req_sending...............: avg=47.47µs  min=5.13µs  med=10.01µs max=166.82ms p(90)=16.92µs  p(95)=117.38µs p(99.9)=3.85ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.06ms  min=1.88ms  med=23.85ms max=301.72ms p(90)=29.01ms  p(95)=31.26ms  p(99.9)=52.73ms
     http_reqs......................: 245264  2039.535563/s
     iteration_duration.............: avg=24.46ms  min=3.05ms  med=24.18ms max=343.27ms p(90)=29.42ms  p(95)=31.78ms  p(99.9)=54.53ms
     iterations.....................: 245164  2038.703996/s
     success_rate...................: 100.00% ✓ 245164      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 447294      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3µs      min=1.08µs  med=2.26µs  max=4.51ms   p(90)=3.44µs  p(95)=3.99µs   p(99.9)=33.38µs
     http_req_connecting............: avg=385ns    min=0s      med=0s      max=2.75ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40ms     min=2.12ms  med=39.47ms max=339.55ms p(90)=56.57ms p(95)=61.68ms  p(99.9)=86.33ms
       { expected_response:true }...: avg=40ms     min=2.12ms  med=39.47ms max=339.55ms p(90)=56.57ms p(95)=61.68ms  p(99.9)=86.33ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149198
     http_req_receiving.............: avg=117.31µs min=29.63µs med=59.54µs max=262.03ms p(90)=92.38µs p(95)=109.03µs p(99.9)=2.36ms 
     http_req_sending...............: avg=25.4µs   min=5.3µs   med=10.22µs max=258.29ms p(90)=14.82µs p(95)=18.81µs  p(99.9)=1.28ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.86ms  min=2.01ms  med=39.37ms max=129.27ms p(90)=56.46ms p(95)=61.55ms  p(99.9)=84.77ms
     http_reqs......................: 149198  1240.530844/s
     iteration_duration.............: avg=40.23ms  min=3.33ms  med=39.68ms max=351.71ms p(90)=56.77ms p(95)=61.88ms  p(99.9)=86.81ms
     iterations.....................: 149098  1239.699378/s
     success_rate...................: 100.00% ✓ 149098      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 194322     ✗ 0    
     data_received..................: 5.7 GB  47 MB/s
     data_sent......................: 78 MB   646 kB/s
     http_req_blocked...............: avg=4.9µs   min=1.17µs  med=2.99µs  max=4.37ms   p(90)=4.53µs   p(95)=5.13µs   p(99.9)=47.07µs 
     http_req_connecting............: avg=1.62µs  min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=92.26ms min=4.05ms  med=90.45ms max=401.24ms p(90)=115.46ms p(95)=128.28ms p(99.9)=222.87ms
       { expected_response:true }...: avg=92.26ms min=4.05ms  med=90.45ms max=401.24ms p(90)=115.46ms p(95)=128.28ms p(99.9)=222.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64874
     http_req_receiving.............: avg=91.73µs min=31.95µs med=77.87µs max=192.25ms p(90)=111.88µs p(95)=124.36µs p(99.9)=874.12µs
     http_req_sending...............: avg=25.12µs min=5.83µs  med=13.66µs max=215.45ms p(90)=20.33µs  p(95)=22.57µs  p(99.9)=672.59µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.14ms min=3.96ms  med=90.34ms max=400.7ms  p(90)=115.33ms p(95)=128.13ms p(99.9)=222.37ms
     http_reqs......................: 64874   538.140064/s
     iteration_duration.............: avg=92.64ms min=15.18ms med=90.69ms max=410.11ms p(90)=115.7ms  p(95)=128.57ms p(99.9)=225.09ms
     iterations.....................: 64774   537.310549/s
     success_rate...................: 100.00% ✓ 64774      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 143733     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   478 kB/s
     http_req_blocked...............: avg=5.9µs    min=1.18µs  med=3.42µs   max=4.48ms   p(90)=4.85µs   p(95)=5.4µs    p(99.9)=923.64µs
     http_req_connecting............: avg=2.25µs   min=0s      med=0s       max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=876.65µs
     http_req_duration..............: avg=124.73ms min=5.5ms   med=124.56ms max=366.11ms p(90)=150.86ms p(95)=158.55ms p(99.9)=192.84ms
       { expected_response:true }...: avg=124.73ms min=5.5ms   med=124.56ms max=366.11ms p(90)=150.86ms p(95)=158.55ms p(99.9)=192.84ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48011
     http_req_receiving.............: avg=91.05µs  min=32.09µs med=83.72µs  max=94.65ms  p(90)=115.29µs p(95)=126.97µs p(99.9)=705.03µs
     http_req_sending...............: avg=21.47µs  min=6.21µs  med=15.6µs   max=68.33ms  p(90)=21.12µs  p(95)=22.91µs  p(99.9)=595.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.62ms min=5.43ms  med=124.45ms max=365.97ms p(90)=150.75ms p(95)=158.43ms p(99.9)=192.73ms
     http_reqs......................: 48011   397.772765/s
     iteration_duration.............: avg=125.25ms min=25.35ms med=124.84ms max=378.44ms p(90)=151.13ms p(95)=158.85ms p(99.9)=196.53ms
     iterations.....................: 47911   396.944261/s
     success_rate...................: 100.00% ✓ 47911      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 91068      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   302 kB/s
     http_req_blocked...............: avg=6.83µs   min=1.2µs   med=3.37µs   max=4.06ms   p(90)=4.65µs   p(95)=5.19µs   p(99.9)=1.64ms  
     http_req_connecting............: avg=3.31µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.61ms  
     http_req_duration..............: avg=196.84ms min=8.52ms  med=196.51ms max=425.63ms p(90)=207.65ms p(95)=213.35ms p(99.9)=277.98ms
       { expected_response:true }...: avg=196.84ms min=8.52ms  med=196.51ms max=425.63ms p(90)=207.65ms p(95)=213.35ms p(99.9)=277.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30456
     http_req_receiving.............: avg=100.29µs min=34µs    med=92.27µs  max=72.33ms  p(90)=123.94µs p(95)=136.34µs p(99.9)=541.38µs
     http_req_sending...............: avg=24.33µs  min=6.09µs  med=16.86µs  max=71.21ms  p(90)=21.57µs  p(95)=23.35µs  p(99.9)=525.84µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.71ms min=8.41ms  med=196.4ms  max=425.04ms p(90)=207.53ms p(95)=213.24ms p(99.9)=277.65ms
     http_reqs......................: 30456   251.539332/s
     iteration_duration.............: avg=197.77ms min=19.59ms med=197.89ms max=463.83ms p(90)=207.93ms p(95)=213.63ms p(99.9)=282.74ms
     iterations.....................: 30356   250.713421/s
     success_rate...................: 100.00% ✓ 30356      ✗ 0    
     vus............................: 37      min=37       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 90513      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   301 kB/s
     http_req_blocked...............: avg=6.88µs   min=1.24µs  med=3.44µs   max=3.72ms   p(90)=4.88µs   p(95)=5.5µs    p(99.9)=1.55ms  
     http_req_connecting............: avg=3.21µs   min=0s      med=0s       max=3.68ms   p(90)=0s       p(95)=0s       p(99.9)=1.52ms  
     http_req_duration..............: avg=198.02ms min=6.25ms  med=181.52ms max=584.47ms p(90)=236.55ms p(95)=407.84ms p(99.9)=532.31ms
       { expected_response:true }...: avg=198.02ms min=6.25ms  med=181.52ms max=584.47ms p(90)=236.55ms p(95)=407.84ms p(99.9)=532.31ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30271
     http_req_receiving.............: avg=101.31µs min=34.38µs med=94.46µs  max=54.83ms  p(90)=126.56µs p(95)=139.5µs  p(99.9)=682.3µs 
     http_req_sending...............: avg=34.71µs  min=6.42µs  med=17.47µs  max=171.88ms p(90)=22.57µs  p(95)=24.46µs  p(99.9)=623.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.89ms min=6.16ms  med=181.39ms max=584.32ms p(90)=236.43ms p(95)=407.55ms p(99.9)=532.07ms
     http_reqs......................: 30271   250.40739/s
     iteration_duration.............: avg=198.98ms min=51.18ms med=181.88ms max=584.73ms p(90)=237.07ms p(95)=408.59ms p(99.9)=532.67ms
     iterations.....................: 30171   249.580172/s
     success_rate...................: 100.00% ✓ 30171      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 864351      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 346 MB  2.9 MB/s
     http_req_blocked...............: avg=3.25µs   min=1µs    med=2.18µs  max=14.02ms  p(90)=3.57µs   p(95)=4.4µs    p(99.9)=35.56µs
     http_req_connecting............: avg=356ns    min=0s     med=0s      max=4.16ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.58ms  min=1.7ms  med=20.03ms max=312.2ms  p(90)=28.57ms  p(95)=31.76ms  p(99.9)=54.83ms
       { expected_response:true }...: avg=20.58ms  min=1.7ms  med=20.03ms max=312.2ms  p(90)=28.57ms  p(95)=31.76ms  p(99.9)=54.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288217
     http_req_receiving.............: avg=116.26µs min=28.2µs med=53.1µs  max=111.74ms p(90)=101.15µs p(95)=253.95µs p(99.9)=9.87ms 
     http_req_sending...............: avg=52.56µs  min=5.25µs med=9.55µs  max=132.95ms p(90)=17.5µs   p(95)=122.84µs p(99.9)=5.22ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.41ms  min=1.62ms med=19.9ms  max=311.56ms p(90)=28.36ms  p(95)=31.45ms  p(99.9)=54.3ms 
     http_reqs......................: 288217  2397.468006/s
     iteration_duration.............: avg=20.81ms  min=3.02ms med=20.25ms max=345.24ms p(90)=28.8ms   p(95)=32.01ms  p(99.9)=55.38ms
     iterations.....................: 288117  2396.636178/s
     success_rate...................: 100.00% ✓ 288117      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.10)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 703074      ✗ 0     
     data_received..................: 21 GB   171 MB/s
     data_sent......................: 282 MB  2.3 MB/s
     http_req_blocked...............: avg=3.23µs   min=981ns   med=2.41µs   max=7.69ms   p(90)=3.77µs  p(95)=4.48µs   p(99.9)=37.01µs 
     http_req_connecting............: avg=409ns    min=0s      med=0s       max=4.17ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.35ms  min=1.87ms  med=17.08ms  max=473.24ms p(90)=54.56ms p(95)=71.94ms  p(99.9)=190.42ms
       { expected_response:true }...: avg=25.35ms  min=1.87ms  med=17.08ms  max=473.24ms p(90)=54.56ms p(95)=71.94ms  p(99.9)=190.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 234458
     http_req_receiving.............: avg=688.65µs min=52.76µs med=111.23µs max=237.2ms  p(90)=1.12ms  p(95)=1.77ms   p(99.9)=59.45ms 
     http_req_sending...............: avg=44.21µs  min=5.24µs  med=10.07µs  max=174.07ms p(90)=17.91µs p(95)=108.36µs p(99.9)=2.63ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.62ms  min=1.74ms  med=16.53ms  max=471.1ms  p(90)=53.33ms p(95)=70.47ms  p(99.9)=184.51ms
     http_reqs......................: 234458  1949.758397/s
     iteration_duration.............: avg=25.59ms  min=2.52ms  med=17.3ms   max=473.42ms p(90)=54.8ms  p(95)=72.18ms  p(99.9)=192.04ms
     iterations.....................: 234358  1948.926794/s
     success_rate...................: 100.00% ✓ 234358      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 567165      ✗ 0     
     data_received..................: 17 GB   138 MB/s
     data_sent......................: 227 MB  1.9 MB/s
     http_req_blocked...............: avg=3.49µs   min=932ns  med=2.44µs  max=3.72ms   p(90)=4.64µs   p(95)=5.78µs   p(99.9)=43.59µs
     http_req_connecting............: avg=476ns    min=0s     med=0s      max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.46ms  min=2.26ms med=30.7ms  max=316.34ms p(90)=41.69ms  p(95)=46.06ms  p(99.9)=81.92ms
       { expected_response:true }...: avg=31.46ms  min=2.26ms med=30.7ms  max=316.34ms p(90)=41.69ms  p(95)=46.06ms  p(99.9)=81.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 189155
     http_req_receiving.............: avg=105.31µs min=29.3µs med=61.91µs max=154.76ms p(90)=133.69µs p(95)=274.55µs p(99.9)=3.86ms 
     http_req_sending...............: avg=44µs     min=5.38µs med=10.4µs  max=166.78ms p(90)=23.99µs  p(95)=133.2µs  p(99.9)=2.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.31ms  min=2.13ms med=30.57ms max=315.49ms p(90)=41.52ms  p(95)=45.88ms  p(99.9)=81.54ms
     http_reqs......................: 189155  1572.389683/s
     iteration_duration.............: avg=31.73ms  min=3.88ms med=30.94ms max=352.3ms  p(90)=41.93ms  p(95)=46.3ms   p(99.9)=82.58ms
     iterations.....................: 189055  1571.558413/s
     success_rate...................: 100.00% ✓ 189055      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.307.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 423936      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 170 MB  1.4 MB/s
     http_req_blocked...............: avg=3.74µs   min=1.05µs  med=2.67µs  max=3.96ms   p(90)=4.16µs   p(95)=4.81µs   p(99.9)=34.62µs
     http_req_connecting............: avg=722ns    min=0s      med=0s      max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.2ms   min=2.26ms  med=41.69ms max=383.48ms p(90)=59.37ms  p(95)=64.66ms  p(99.9)=89.92ms
       { expected_response:true }...: avg=42.2ms   min=2.26ms  med=41.69ms max=383.48ms p(90)=59.37ms  p(95)=64.66ms  p(99.9)=89.92ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141412
     http_req_receiving.............: avg=123.35µs min=28.51µs med=67.64µs max=266.85ms p(90)=105.09µs p(95)=122.94µs p(99.9)=2.03ms 
     http_req_sending...............: avg=25.06µs  min=5.36µs  med=11.95µs max=38.95ms  p(90)=18.29µs  p(95)=21.89µs  p(99.9)=1.16ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.05ms  min=2.14ms  med=41.58ms max=122.44ms p(90)=59.25ms  p(95)=64.55ms  p(99.9)=89.3ms 
     http_reqs......................: 141412  1175.526778/s
     iteration_duration.............: avg=42.45ms  min=3.57ms  med=41.91ms max=390.5ms  p(90)=59.58ms  p(95)=64.89ms  p(99.9)=90.82ms
     iterations.....................: 141312  1174.695501/s
     success_rate...................: 100.00% ✓ 141312      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 184047     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 74 MB   612 kB/s
     http_req_blocked...............: avg=4.93µs   min=1.15µs  med=2.98µs  max=3.93ms   p(90)=4.49µs   p(95)=5.05µs   p(99.9)=50.57µs 
     http_req_connecting............: avg=1.66µs   min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.41ms  min=4.26ms  med=95.63ms max=371.78ms p(90)=122.46ms p(95)=137.25ms p(99.9)=236.04ms
       { expected_response:true }...: avg=97.41ms  min=4.26ms  med=95.63ms max=371.78ms p(90)=122.46ms p(95)=137.25ms p(99.9)=236.04ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61449
     http_req_receiving.............: avg=113.18µs min=32.55µs med=79.78µs max=188.77ms p(90)=113.75µs p(95)=125.82µs p(99.9)=978.12µs
     http_req_sending...............: avg=26.17µs  min=5.74µs  med=13.88µs max=135.42ms p(90)=20.1µs   p(95)=22.24µs  p(99.9)=673.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.27ms  min=4.19ms  med=95.51ms max=281.11ms p(90)=122.32ms p(95)=137ms    p(99.9)=235.6ms 
     http_reqs......................: 61449   509.534072/s
     iteration_duration.............: avg=97.82ms  min=7.73ms  med=95.88ms max=384.57ms p(90)=122.71ms p(95)=137.62ms p(99.9)=239.92ms
     iterations.....................: 61349   508.704874/s
     success_rate...................: 100.00% ✓ 61349      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.13.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 134244     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   446 kB/s
     http_req_blocked...............: avg=5.9µs    min=1.25µs  med=3.42µs   max=4.17ms   p(90)=4.87µs   p(95)=5.45µs   p(99.9)=459.05µs
     http_req_connecting............: avg=2.29µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=427.16µs
     http_req_duration..............: avg=133.55ms min=5.87ms  med=130.83ms max=327.22ms p(90)=176.63ms p(95)=190.32ms p(99.9)=243.06ms
       { expected_response:true }...: avg=133.55ms min=5.87ms  med=130.83ms max=327.22ms p(90)=176.63ms p(95)=190.32ms p(99.9)=243.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44848
     http_req_receiving.............: avg=94.81µs  min=32.15µs med=87.39µs  max=86.88ms  p(90)=118.71µs p(95)=130.4µs  p(99.9)=725.4µs 
     http_req_sending...............: avg=24.58µs  min=6.16µs  med=16.59µs  max=70.53ms  p(90)=21.75µs  p(95)=23.51µs  p(99.9)=591.72µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.43ms min=5.78ms  med=130.73ms max=326.61ms p(90)=176.53ms p(95)=190.21ms p(99.9)=242.43ms
     http_reqs......................: 44848   371.419376/s
     iteration_duration.............: avg=134.12ms min=34.72ms med=131.17ms max=369.41ms p(90)=176.94ms p(95)=190.64ms p(99.9)=246.7ms 
     iterations.....................: 44748   370.591202/s
     success_rate...................: 100.00% ✓ 44748      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88962      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=7.35µs   min=1.25µs  med=3.55µs   max=3.99ms   p(90)=4.98µs   p(95)=5.55µs   p(99.9)=1.99ms  
     http_req_connecting............: avg=3.42µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.96ms  
     http_req_duration..............: avg=201.48ms min=6.51ms  med=185.62ms max=600.55ms p(90)=231.13ms p(95)=403.16ms p(99.9)=539.55ms
       { expected_response:true }...: avg=201.48ms min=6.51ms  med=185.62ms max=600.55ms p(90)=231.13ms p(95)=403.16ms p(99.9)=539.55ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29754
     http_req_receiving.............: avg=100.46µs min=34.19µs med=96.26µs  max=5.78ms   p(90)=127.58µs p(95)=140.7µs  p(99.9)=637.51µs
     http_req_sending...............: avg=38.17µs  min=6.08µs  med=17.83µs  max=141.19ms p(90)=22.67µs  p(95)=24.3µs   p(99.9)=675.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.34ms min=6.36ms  med=185.49ms max=600.45ms p(90)=230.97ms p(95)=403.06ms p(99.9)=539.43ms
     http_reqs......................: 29754   246.029096/s
     iteration_duration.............: avg=202.46ms min=57.47ms med=185.98ms max=600.79ms p(90)=231.56ms p(95)=404.44ms p(99.9)=539.82ms
     iterations.....................: 29654   245.202218/s
     success_rate...................: 100.00% ✓ 29654      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.13.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85578      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=7.35µs   min=1.34µs  med=3.55µs   max=3.98ms   p(90)=4.91µs   p(95)=5.46µs   p(99.9)=1.79ms  
     http_req_connecting............: avg=3.61µs   min=0s      med=0s       max=3.93ms   p(90)=0s       p(95)=0s       p(99.9)=1.76ms  
     http_req_duration..............: avg=209.46ms min=8.79ms  med=212.54ms max=437.64ms p(90)=227.53ms p(95)=237.69ms p(99.9)=312.5ms 
       { expected_response:true }...: avg=209.46ms min=8.79ms  med=212.54ms max=437.64ms p(90)=227.53ms p(95)=237.69ms p(99.9)=312.5ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28626
     http_req_receiving.............: avg=227.77µs min=30.98µs med=95.08µs  max=238.52ms p(90)=126.8µs  p(95)=139.86µs p(99.9)=5.57ms  
     http_req_sending...............: avg=33.72µs  min=6.33µs  med=17.75µs  max=62.9ms   p(90)=22.55µs  p(95)=24.4µs   p(99.9)=601.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.19ms min=8.64ms  med=212.4ms  max=316.54ms p(90)=227.33ms p(95)=237.3ms  p(99.9)=299.25ms
     http_reqs......................: 28626   236.354133/s
     iteration_duration.............: avg=210.46ms min=31.12ms med=212.85ms max=455.86ms p(90)=227.82ms p(95)=238.06ms p(99.9)=315.79ms
     iterations.....................: 28526   235.52847/s
     success_rate...................: 100.00% ✓ 28526      ✗ 0    
     vus............................: 45      min=45       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

