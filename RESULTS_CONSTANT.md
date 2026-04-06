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
| hive-router | v0.0.43 | 2,946 | 3,205 | 2,902 | 3.5% |  |
| hotchocolate | 16.0.0-rc.1.25 | 2,128 | 2,169 | 2,116 | 0.8% |  |
| grafbase | 0.53.2 | 2,078 | 2,135 | 2,069 | 1.0% |  |
| cosmo | 0.298.0 | 1,272 | 1,291 | 1,264 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.14 | 612 | 623 | 607 | 0.8% |  |
| apollo-router | v2.12.1 | 425 | 434 | 422 | 1.0% |  |
| hive-gateway | 2.5.14 | 269 | 273 | 267 | 0.7% |  |
| apollo-gateway | 2.13.3 | 244 | 245 | 242 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.43 | 2,496 | 2,619 | 2,476 | 1.8% |  |
| hotchocolate | 16.0.0-rc.1.25 | 1,892 | 1,945 | 1,879 | 1.2% |  |
| grafbase | 0.53.2 | 1,535 | 1,560 | 1,526 | 0.8% |  |
| cosmo | 0.298.0 | 1,201 | 1,218 | 1,192 | 0.7% | non-compatible response (3 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.14 | 586 | 599 | 581 | 1.0% |  |
| apollo-router | v2.12.1 | 366 | 378 | 362 | 1.6% |  |
| hive-gateway | 2.5.14 | 267 | 273 | 264 | 1.1% |  |
| apollo-gateway | 2.13.3 | 236 | 238 | 234 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1062420     ✗ 0     
     data_received..................: 31 GB   259 MB/s
     data_sent......................: 426 MB  3.5 MB/s
     http_req_blocked...............: avg=2.76µs   min=1.04µs  med=2.01µs  max=26.11ms  p(90)=3.12µs  p(95)=3.75µs   p(99.9)=28.05µs
     http_req_connecting............: avg=274ns    min=0s      med=0s      max=4.17ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.7ms   min=1.62ms  med=15.9ms  max=315.69ms p(90)=24.51ms p(95)=28.58ms  p(99.9)=51.83ms
       { expected_response:true }...: avg=16.7ms   min=1.62ms  med=15.9ms  max=315.69ms p(90)=24.51ms p(95)=28.58ms  p(99.9)=51.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 354240
     http_req_receiving.............: avg=139.09µs min=27.88µs med=47.9µs  max=114.49ms p(90)=95.03µs p(95)=272.88µs p(99.9)=14.3ms 
     http_req_sending...............: avg=61.33µs  min=5.25µs  med=8.94µs  max=212.7ms  p(90)=15.1µs  p(95)=119.87µs p(99.9)=12.78ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.5ms   min=1.52ms  med=15.75ms max=295.56ms p(90)=24.22ms p(95)=28.09ms  p(99.9)=50.49ms
     http_reqs......................: 354240  2946.947984/s
     iteration_duration.............: avg=16.93ms  min=2.06ms  med=16.11ms max=331.65ms p(90)=24.74ms p(95)=28.85ms  p(99.9)=52.94ms
     iterations.....................: 354140  2946.116077/s
     success_rate...................: 100.00% ✓ 354140      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 767880      ✗ 0     
     data_received..................: 22 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=2.88µs   min=992ns   med=2.05µs   max=12.92ms  p(90)=3.14µs   p(95)=3.74µs   p(99.9)=31.33µs 
     http_req_connecting............: avg=326ns    min=0s      med=0s       max=3.54ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.2ms   min=2.49ms  med=14.85ms  max=328.28ms p(90)=51.86ms  p(95)=70.49ms  p(99.9)=168.21ms
       { expected_response:true }...: avg=23.2ms   min=2.49ms  med=14.85ms  max=328.28ms p(90)=51.86ms  p(95)=70.49ms  p(99.9)=168.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 256060
     http_req_receiving.............: avg=661.06µs min=51.35µs med=106.14µs max=157.48ms p(90)=978.15µs p(95)=1.52ms   p(99.9)=60.75ms 
     http_req_sending...............: avg=41.25µs  min=5.37µs  med=8.99µs   max=93.4ms   p(90)=15.11µs  p(95)=103.83µs p(99.9)=3.07ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.5ms   min=2.37ms  med=14.34ms  max=327.09ms p(90)=50.49ms  p(95)=68.99ms  p(99.9)=165.29ms
     http_reqs......................: 256060  2128.417548/s
     iteration_duration.............: avg=23.43ms  min=3.42ms  med=15.07ms  max=339.89ms p(90)=52.1ms   p(95)=70.73ms  p(99.9)=169.57ms
     iterations.....................: 255960  2127.586329/s
     success_rate...................: 100.00% ✓ 255960      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 749472      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 300 MB  2.5 MB/s
     http_req_blocked...............: avg=3.05µs   min=1.06µs  med=2.22µs  max=9.17ms   p(90)=3.56µs  p(95)=4.27µs   p(99.9)=34.27µs
     http_req_connecting............: avg=399ns    min=0s      med=0s      max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.77ms  min=1.87ms  med=23.55ms max=320.69ms p(90)=28.47ms p(95)=30.51ms  p(99.9)=52.15ms
       { expected_response:true }...: avg=23.77ms  min=1.87ms  med=23.55ms max=320.69ms p(90)=28.47ms p(95)=30.51ms  p(99.9)=52.15ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 249924
     http_req_receiving.............: avg=102.73µs min=28.62µs med=56.61µs max=50.71ms  p(90)=97.24µs p(95)=168.81µs p(99.9)=7.72ms 
     http_req_sending...............: avg=47.43µs  min=5.2µs   med=10µs    max=239.07ms p(90)=16.87µs p(95)=109.21µs p(99.9)=3.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.62ms  min=1.78ms  med=23.44ms max=311.01ms p(90)=28.3ms  p(95)=30.28ms  p(99.9)=51.28ms
     http_reqs......................: 249924  2078.420208/s
     iteration_duration.............: avg=24ms     min=4.01ms  med=23.76ms max=337.32ms p(90)=28.68ms p(95)=30.75ms  p(99.9)=52.62ms
     iterations.....................: 249824  2077.588587/s
     success_rate...................: 100.00% ✓ 249824      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 458754      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.05µs  min=1.01µs  med=2.44µs  max=4.49ms   p(90)=3.83µs  p(95)=4.49µs   p(99.9)=36.61µs
     http_req_connecting............: avg=263ns   min=0s      med=0s      max=2ms      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.99ms min=2.12ms  med=38.51ms max=324.32ms p(90)=55.05ms p(95)=60.15ms  p(99.9)=83.99ms
       { expected_response:true }...: avg=38.99ms min=2.12ms  med=38.51ms max=324.32ms p(90)=55.05ms p(95)=60.15ms  p(99.9)=83.99ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153018
     http_req_receiving.............: avg=81.9µs  min=28.32µs med=60.98µs max=25.18ms  p(90)=97.4µs  p(95)=116.51µs p(99.9)=2.07ms 
     http_req_sending...............: avg=26.06µs min=5.29µs  med=10.8µs  max=168.93ms p(90)=16.55µs p(95)=20.84µs  p(99.9)=1.29ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.88ms min=2.05ms  med=38.4ms  max=319.48ms p(90)=54.92ms p(95)=60.02ms  p(99.9)=83.85ms
     http_reqs......................: 153018  1272.216748/s
     iteration_duration.............: avg=39.23ms min=4.05ms  med=38.72ms max=336.45ms p(90)=55.25ms p(95)=60.36ms  p(99.9)=84.46ms
     iterations.....................: 152918  1271.385332/s
     success_rate...................: 100.00% ✓ 152918      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 221073     ✗ 0    
     data_received..................: 6.5 GB  54 MB/s
     data_sent......................: 89 MB   735 kB/s
     http_req_blocked...............: avg=4.98µs   min=1.08µs  med=2.75µs  max=29.28ms  p(90)=4.22µs   p(95)=4.83µs   p(99.9)=53.7µs  
     http_req_connecting............: avg=1.47µs   min=0s      med=0s      max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.09ms  min=3.77ms  med=77.15ms max=347.11ms p(90)=108.96ms p(95)=120.61ms p(99.9)=221.6ms 
       { expected_response:true }...: avg=81.09ms  min=3.77ms  med=77.15ms max=347.11ms p(90)=108.96ms p(95)=120.61ms p(99.9)=221.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 73791
     http_req_receiving.............: avg=139.91µs min=31.73µs med=73.11µs max=190.58ms p(90)=107.31µs p(95)=120.23µs p(99.9)=1.54ms  
     http_req_sending...............: avg=21.73µs  min=5.7µs   med=12.52µs max=170.38ms p(90)=18.57µs  p(95)=20.84µs  p(99.9)=805.52µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=80.93ms  min=3.72ms  med=77.05ms max=249.13ms p(90)=108.84ms p(95)=120.44ms p(99.9)=216.47ms
     http_reqs......................: 73791   612.331404/s
     iteration_duration.............: avg=81.43ms  min=4.65ms  med=77.41ms max=383.04ms p(90)=109.19ms p(95)=120.9ms  p(99.9)=224.46ms
     iterations.....................: 73691   611.501586/s
     success_rate...................: 100.00% ✓ 73691      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 153771     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   511 kB/s
     http_req_blocked...............: avg=5.2µs    min=1.18µs  med=3.34µs   max=3.84ms   p(90)=4.76µs   p(95)=5.3µs    p(99.9)=112.96µs
     http_req_connecting............: avg=1.67µs   min=0s      med=0s       max=3.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.6ms  min=5.41ms  med=116.25ms max=392.13ms p(90)=140.82ms p(95)=148.17ms p(99.9)=184.21ms
       { expected_response:true }...: avg=116.6ms  min=5.41ms  med=116.25ms max=392.13ms p(90)=140.82ms p(95)=148.17ms p(99.9)=184.21ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51357
     http_req_receiving.............: avg=164.77µs min=30.74µs med=83.77µs  max=208.92ms p(90)=115.25µs p(95)=127.44µs p(99.9)=1.25ms  
     http_req_sending...............: avg=39.34µs  min=5.67µs  med=15.81µs  max=254ms    p(90)=21.34µs  p(95)=23.15µs  p(99.9)=915.79µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.4ms  min=5.3ms   med=116.13ms max=214.01ms p(90)=140.68ms p(95)=147.97ms p(99.9)=178.2ms 
     http_reqs......................: 51357   425.528324/s
     iteration_duration.............: avg=117.08ms min=7.97ms  med=116.54ms max=392.45ms p(90)=141.1ms  p(95)=148.44ms p(99.9)=186.98ms
     iterations.....................: 51257   424.699754/s
     success_rate...................: 100.00% ✓ 51257      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 97446      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   324 kB/s
     http_req_blocked...............: avg=6.98µs   min=1.25µs  med=3.54µs   max=4.73ms   p(90)=5.02µs   p(95)=5.63µs   p(99.9)=1.56ms  
     http_req_connecting............: avg=3.18µs   min=0s      med=0s       max=4.69ms   p(90)=0s       p(95)=0s       p(99.9)=1.44ms  
     http_req_duration..............: avg=183.96ms min=5.96ms  med=167.68ms max=620.36ms p(90)=209.4ms  p(95)=385.63ms p(99.9)=521.32ms
       { expected_response:true }...: avg=183.96ms min=5.96ms  med=167.68ms max=620.36ms p(90)=209.4ms  p(95)=385.63ms p(99.9)=521.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32582
     http_req_receiving.............: avg=103.86µs min=34.7µs  med=94.73µs  max=82.96ms  p(90)=127.4µs  p(95)=140.78µs p(99.9)=682.9µs 
     http_req_sending...............: avg=26.52µs  min=6.17µs  med=17.12µs  max=118.76ms p(90)=22.44µs  p(95)=24.52µs  p(99.9)=562.07µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=183.83ms min=5.83ms  med=167.57ms max=620.28ms p(90)=209.24ms p(95)=385.51ms p(99.9)=521.22ms
     http_reqs......................: 32582   269.438934/s
     iteration_duration.............: avg=184.81ms min=35.11ms med=168.01ms max=620.69ms p(90)=209.84ms p(95)=386.66ms p(99.9)=521.54ms
     iterations.....................: 32482   268.611977/s
     success_rate...................: 100.00% ✓ 32482      ✗ 0    
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

     checks.........................: 100.00% ✓ 88656      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=6.72µs   min=1.26µs  med=3.14µs   max=3.91ms   p(90)=4.38µs   p(95)=4.9µs    p(99.9)=1.78ms  
     http_req_connecting............: avg=3.36µs   min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=202.2ms  min=8.41ms  med=200.57ms max=437.99ms p(90)=243.49ms p(95)=250.12ms p(99.9)=313.77ms
       { expected_response:true }...: avg=202.2ms  min=8.41ms  med=200.57ms max=437.99ms p(90)=243.49ms p(95)=250.12ms p(99.9)=313.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29652
     http_req_receiving.............: avg=203.74µs min=31.81µs med=87.3µs   max=201.88ms p(90)=118.6µs  p(95)=130.02µs p(99.9)=31.62ms 
     http_req_sending...............: avg=30.25µs  min=5.83µs  med=15.55µs  max=187.07ms p(90)=20.59µs  p(95)=22.39µs  p(99.9)=591.53µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.97ms min=8.27ms  med=200.45ms max=317.49ms p(90)=243.35ms p(95)=249.87ms p(99.9)=310.08ms
     http_reqs......................: 29652   244.877786/s
     iteration_duration.............: avg=203.14ms min=23.04ms med=200.91ms max=446.76ms p(90)=243.83ms p(95)=250.38ms p(99.9)=317.18ms
     iterations.....................: 29552   244.051947/s
     success_rate...................: 100.00% ✓ 29552      ✗ 0    
     vus............................: 34      min=34       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.43)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 899916      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=3.1µs    min=972ns   med=2.19µs  max=16.2ms   p(90)=3.65µs   p(95)=4.48µs   p(99.9)=34.45µs
     http_req_connecting............: avg=279ns    min=0s      med=0s      max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.75ms  min=1.66ms  med=19.11ms max=318.31ms p(90)=27.45ms  p(95)=30.85ms  p(99.9)=54.19ms
       { expected_response:true }...: avg=19.75ms  min=1.66ms  med=19.11ms max=318.31ms p(90)=27.45ms  p(95)=30.85ms  p(99.9)=54.19ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300072
     http_req_receiving.............: avg=121.43µs min=27.42µs med=51.93µs max=134.73ms p(90)=103.89µs p(95)=272.35µs p(99.9)=10.95ms
     http_req_sending...............: avg=55.81µs  min=5.28µs  med=9.56µs  max=88.91ms  p(90)=18.34µs  p(95)=125.44µs p(99.9)=6.52ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.57ms  min=1.57ms  med=18.97ms max=317.29ms p(90)=27.23ms  p(95)=30.52ms  p(99.9)=53.3ms 
     http_reqs......................: 300072  2496.178004/s
     iteration_duration.............: avg=19.99ms  min=2.93ms  med=19.33ms max=348.12ms p(90)=27.67ms  p(95)=31.11ms  p(99.9)=55.02ms
     iterations.....................: 299972  2495.346144/s
     success_rate...................: 100.00% ✓ 299972      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.25)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 682596      ✗ 0     
     data_received..................: 20 GB   166 MB/s
     data_sent......................: 274 MB  2.3 MB/s
     http_req_blocked...............: avg=2.95µs   min=992ns   med=2.11µs   max=8.16ms   p(90)=3.36µs  p(95)=4.04µs   p(99.9)=34.91µs 
     http_req_connecting............: avg=453ns    min=0s      med=0s       max=3.89ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=26.12ms  min=1.87ms  med=17.73ms  max=596.72ms p(90)=55.53ms p(95)=73.14ms  p(99.9)=198.32ms
       { expected_response:true }...: avg=26.12ms  min=1.87ms  med=17.73ms  max=596.72ms p(90)=55.53ms p(95)=73.14ms  p(99.9)=198.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 227632
     http_req_receiving.............: avg=721.22µs min=52.34µs med=109.79µs max=187.48ms p(90)=1.15ms  p(95)=1.85ms   p(99.9)=60.5ms  
     http_req_sending...............: avg=42.08µs  min=5.3µs   med=9.57µs   max=222.55ms p(90)=17.48µs p(95)=101.24µs p(99.9)=2.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=25.36ms  min=1.74ms  med=17.15ms  max=596.52ms p(90)=54.24ms p(95)=71.69ms  p(99.9)=194.41ms
     http_reqs......................: 227632  1892.944896/s
     iteration_duration.............: avg=26.36ms  min=2.74ms  med=17.95ms  max=596.91ms p(90)=55.77ms p(95)=73.39ms  p(99.9)=200.08ms
     iterations.....................: 227532  1892.113315/s
     success_rate...................: 100.00% ✓ 227532      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (.net subgraphs) (0.53.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 553845      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 222 MB  1.8 MB/s
     http_req_blocked...............: avg=3.59µs   min=1.01µs  med=2.46µs  max=6ms      p(90)=4.88µs   p(95)=6.03µs   p(99.9)=43.41µs
     http_req_connecting............: avg=424ns    min=0s      med=0s      max=3.57ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.22ms  min=2.38ms  med=31.33ms max=323.11ms p(90)=42.68ms  p(95)=47.35ms  p(99.9)=86.21ms
       { expected_response:true }...: avg=32.22ms  min=2.38ms  med=31.33ms max=323.11ms p(90)=42.68ms  p(95)=47.35ms  p(99.9)=86.21ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184715
     http_req_receiving.............: avg=113.53µs min=30.55µs med=62.27µs max=245.78ms p(90)=133.92µs p(95)=271.12µs p(99.9)=5.71ms 
     http_req_sending...............: avg=47.41µs  min=5.45µs  med=10.55µs max=174.85ms p(90)=24.45µs  p(95)=134.94µs p(99.9)=3.06ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.06ms  min=2.22ms  med=31.19ms max=322.91ms p(90)=42.5ms   p(95)=47.12ms  p(99.9)=85.5ms 
     http_reqs......................: 184715  1535.288783/s
     iteration_duration.............: avg=32.49ms  min=5ms     med=31.57ms max=332.68ms p(90)=42.92ms  p(95)=47.6ms   p(99.9)=87.73ms
     iterations.....................: 184615  1534.457617/s
     success_rate...................: 100.00% ✓ 184615      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.298.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 433149      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.2µs   min=990ns   med=2.34µs  max=3.8ms    p(90)=3.9µs    p(95)=4.57µs  p(99.9)=33.95µs
     http_req_connecting............: avg=524ns   min=0s      med=0s      max=3.77ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=41.3ms  min=2.19ms  med=40.75ms max=309.52ms p(90)=58.02ms  p(95)=63.28ms p(99.9)=88.87ms
       { expected_response:true }...: avg=41.3ms  min=2.19ms  med=40.75ms max=309.52ms p(90)=58.02ms  p(95)=63.28ms p(99.9)=88.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144483
     http_req_receiving.............: avg=83.59µs min=28.87µs med=63.73µs max=193.28ms p(90)=102.78µs p(95)=121.9µs p(99.9)=1.78ms 
     http_req_sending...............: avg=26.18µs min=5.51µs  med=11.15µs max=43.26ms  p(90)=18.12µs  p(95)=21.87µs p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.19ms min=2.12ms  med=40.65ms max=309.28ms p(90)=57.91ms  p(95)=63.15ms p(99.9)=88.57ms
     http_reqs......................: 144483  1201.156978/s
     iteration_duration.............: avg=41.55ms min=4.28ms  med=40.97ms max=349.33ms p(90)=58.24ms  p(95)=63.5ms  p(99.9)=89.67ms
     iterations.....................: 144383  1200.325629/s
     success_rate...................: 100.00% ✓ 144383      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 211866     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   705 kB/s
     http_req_blocked...............: avg=4.62µs  min=1.09µs  med=3µs     max=4.39ms   p(90)=4.56µs   p(95)=5.17µs   p(99.9)=43.44µs 
     http_req_connecting............: avg=1.37µs  min=0s      med=0s      max=4.36ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.6ms  min=3.95ms  med=90.41ms max=343.34ms p(90)=113.77ms p(95)=125.05ms p(99.9)=222.95ms
       { expected_response:true }...: avg=84.6ms  min=3.95ms  med=90.41ms max=343.34ms p(90)=113.77ms p(95)=125.05ms p(99.9)=222.95ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70722
     http_req_receiving.............: avg=91.59µs min=31.35µs med=80.97µs max=74.94ms  p(90)=118.68µs p(95)=134.38µs p(99.9)=871.47µs
     http_req_sending...............: avg=26.01µs min=5.7µs   med=13.7µs  max=120.62ms p(90)=20.44µs  p(95)=22.66µs  p(99.9)=779.48µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.49ms min=3.87ms  med=90.3ms  max=343.13ms p(90)=113.64ms p(95)=124.88ms p(99.9)=222.77ms
     http_reqs......................: 70722   586.70648/s
     iteration_duration.............: avg=84.96ms min=20.82ms med=90.66ms max=355.85ms p(90)=114.02ms p(95)=125.36ms p(99.9)=224.52ms
     iterations.....................: 70622   585.876885/s
     success_rate...................: 100.00% ✓ 70622      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 132540     ✗ 0    
     data_received..................: 3.9 GB  32 MB/s
     data_sent......................: 53 MB   440 kB/s
     http_req_blocked...............: avg=6.02µs   min=1.25µs  med=3.34µs   max=4.88ms   p(90)=4.77µs   p(95)=5.33µs   p(99.9)=632.06µs
     http_req_connecting............: avg=2.43µs   min=0s      med=0s       max=4.83ms   p(90)=0s       p(95)=0s       p(99.9)=494.34µs
     http_req_duration..............: avg=135.29ms min=6.08ms  med=132.9ms  max=343.04ms p(90)=179.04ms p(95)=192.95ms p(99.9)=242.62ms
       { expected_response:true }...: avg=135.29ms min=6.08ms  med=132.9ms  max=343.04ms p(90)=179.04ms p(95)=192.95ms p(99.9)=242.62ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44280
     http_req_receiving.............: avg=94.42µs  min=31.66µs med=85.71µs  max=132.72ms p(90)=117.18µs p(95)=129.21µs p(99.9)=685.86µs
     http_req_sending...............: avg=22.5µs   min=5.84µs  med=15.56µs  max=55.58ms  p(90)=21.21µs  p(95)=23.06µs  p(99.9)=557.37µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=135.18ms min=6ms     med=132.79ms max=342.96ms p(90)=178.93ms p(95)=192.85ms p(99.9)=242.31ms
     http_reqs......................: 44280   366.648195/s
     iteration_duration.............: avg=135.86ms min=28.21ms med=133.24ms max=356.21ms p(90)=179.44ms p(95)=193.28ms p(99.9)=249.79ms
     iterations.....................: 44180   365.820172/s
     success_rate...................: 100.00% ✓ 44180      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.14)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 96600      ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 39 MB   321 kB/s
     http_req_blocked...............: avg=7.08µs   min=1.35µs  med=3.54µs   max=3.86ms   p(90)=4.97µs   p(95)=5.57µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.29µs   min=0s      med=0s       max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=1.57ms  
     http_req_duration..............: avg=185.57ms min=6.01ms  med=171.17ms max=629.09ms p(90)=211.7ms  p(95)=381.2ms  p(99.9)=535.97ms
       { expected_response:true }...: avg=185.57ms min=6.01ms  med=171.17ms max=629.09ms p(90)=211.7ms  p(95)=381.2ms  p(99.9)=535.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32300
     http_req_receiving.............: avg=106.42µs min=35.28µs med=95.86µs  max=143.85ms p(90)=127.42µs p(95)=140.52µs p(99.9)=566.56µs
     http_req_sending...............: avg=39.13µs  min=6.28µs  med=17.86µs  max=177.37ms p(90)=22.81µs  p(95)=24.58µs  p(99.9)=597.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=185.42ms min=5.91ms  med=171.03ms max=628.98ms p(90)=211.55ms p(95)=381.09ms p(99.9)=535.87ms
     http_reqs......................: 32300   267.061637/s
     iteration_duration.............: avg=186.43ms min=30.22ms med=171.52ms max=629.32ms p(90)=212.06ms p(95)=382.4ms  p(99.9)=536.27ms
     iterations.....................: 32200   266.234821/s
     success_rate...................: 100.00% ✓ 32200      ✗ 0    
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

     checks.........................: 100.00% ✓ 85644      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=7.25µs   min=1.11µs  med=3.42µs   max=4.28ms   p(90)=4.75µs   p(95)=5.3µs    p(99.9)=1.75ms  
     http_req_connecting............: avg=3.65µs   min=0s      med=0s       max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=209.28ms min=8.6ms   med=215.68ms max=426.48ms p(90)=240.47ms p(95)=250.32ms p(99.9)=316.75ms
       { expected_response:true }...: avg=209.28ms min=8.6ms   med=215.68ms max=426.48ms p(90)=240.47ms p(95)=250.32ms p(99.9)=316.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28648
     http_req_receiving.............: avg=108.44µs min=34.2µs  med=94.23µs  max=123.96ms p(90)=126.54µs p(95)=139.75µs p(99.9)=628.37µs
     http_req_sending...............: avg=29.44µs  min=6.21µs  med=17.35µs  max=83.1ms   p(90)=22.21µs  p(95)=24.11µs  p(99.9)=779.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.15ms min=8.5ms   med=215.55ms max=410.98ms p(90)=240.33ms p(95)=250.19ms p(99.9)=316.1ms 
     http_reqs......................: 28648   236.545563/s
     iteration_duration.............: avg=210.3ms  min=49.07ms med=215.99ms max=437.96ms p(90)=240.77ms p(95)=250.7ms  p(99.9)=319.78ms
     iterations.....................: 28548   235.719866/s
     success_rate...................: 100.00% ✓ 28548      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

