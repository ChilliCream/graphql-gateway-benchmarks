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
| hive-router | v0.0.65 | 2,864 | 3,033 | 2,798 | 2.5% |  |
| hotchocolate | 16.1.3 | 2,101 | 2,153 | 2,084 | 1.1% |  |
| grafbase | 0.53.5 | 2,079 | 2,139 | 2,055 | 1.3% |  |
| cosmo | 0.321.1 | 1,190 | 1,209 | 1,180 | 0.9% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 550 | 564 | 546 | 1.1% |  |
| apollo-router | v2.15.0 | 408 | 420 | 401 | 1.6% |  |
| apollo-gateway | 2.14.1 | 245 | 248 | 243 | 0.7% |  |
| hive-gateway | 2.8.2 | 237 | 242 | 235 | 1.1% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,328 | 2,462 | 2,304 | 2.3% |  |
| hotchocolate | 16.1.3 | 1,930 | 1,994 | 1,925 | 1.2% |  |
| grafbase | 0.53.5 | 1,550 | 1,570 | 1,524 | 0.9% |  |
| cosmo | 0.321.1 | 1,126 | 1,144 | 1,115 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 533 | 548 | 526 | 1.4% |  |
| apollo-router | v2.15.0 | 381 | 392 | 374 | 1.6% |  |
| hive-gateway | 2.8.2 | 238 | 243 | 235 | 1.2% |  |
| apollo-gateway | 2.14.1 | 235 | 238 | 234 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1032573     ✗ 0     
     data_received..................: 30 GB   251 MB/s
     data_sent......................: 414 MB  3.4 MB/s
     http_req_blocked...............: avg=2.66µs   min=982ns   med=1.95µs  max=12.62ms  p(90)=3.03µs  p(95)=3.62µs   p(99.9)=28.34µs
     http_req_connecting............: avg=285ns    min=0s      med=0s      max=4.13ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.19ms  min=1.55ms  med=16.16ms max=306.61ms p(90)=25.85ms p(95)=29.95ms  p(99.9)=52.54ms
       { expected_response:true }...: avg=17.19ms  min=1.55ms  med=16.16ms max=306.61ms p(90)=25.85ms p(95)=29.95ms  p(99.9)=52.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 344291
     http_req_receiving.............: avg=132.75µs min=27.44µs med=47.31µs max=144.15ms p(90)=90.73µs p(95)=262.78µs p(99.9)=15.64ms
     http_req_sending...............: avg=56.41µs  min=5.02µs  med=8.66µs  max=167.4ms  p(90)=14.42µs p(95)=117.28µs p(99.9)=8.74ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=17ms     min=1.5ms   med=16.02ms max=305.97ms p(90)=25.58ms p(95)=29.53ms  p(99.9)=51.14ms
     http_reqs......................: 344291  2864.184682/s
     iteration_duration.............: avg=17.42ms  min=2.05ms  med=16.37ms max=327.7ms  p(90)=26.07ms p(95)=30.22ms  p(99.9)=53.63ms
     iterations.....................: 344191  2863.352774/s
     success_rate...................: 100.00% ✓ 344191      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 758157      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 304 MB  2.5 MB/s
     http_req_blocked...............: avg=2.77µs   min=981ns   med=1.99µs   max=4.98ms   p(90)=2.96µs   p(95)=3.5µs   p(99.9)=31.51µs 
     http_req_connecting............: avg=402ns    min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.5ms   min=2.5ms   med=14.72ms  max=321.74ms p(90)=53.37ms  p(95)=71.67ms p(99.9)=171.16ms
       { expected_response:true }...: avg=23.5ms   min=2.5ms   med=14.72ms  max=321.74ms p(90)=53.37ms  p(95)=71.67ms p(99.9)=171.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252819
     http_req_receiving.............: avg=663.67µs min=50.17µs med=110.02µs max=164.16ms p(90)=962.95µs p(95)=1.46ms  p(99.9)=61.58ms 
     http_req_sending...............: avg=41.97µs  min=5.02µs  med=8.85µs   max=191.58ms p(90)=14.4µs   p(95)=96.67µs p(99.9)=2.69ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.8ms   min=2.37ms  med=14.2ms   max=312.48ms p(90)=51.99ms  p(95)=70.29ms p(99.9)=169.06ms
     http_reqs......................: 252819  2101.499589/s
     iteration_duration.............: avg=23.73ms  min=3.41ms  med=14.93ms  max=332.85ms p(90)=53.6ms   p(95)=71.93ms p(99.9)=172.69ms
     iterations.....................: 252719  2100.668362/s
     success_rate...................: 100.00% ✓ 252719      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: grafbase (rust subgraphs) (0.53.5)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 749988      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 301 MB  2.5 MB/s
     http_req_blocked...............: avg=4.8µs    min=982ns   med=2.16µs  max=23.79ms  p(90)=3.57µs   p(95)=4.34µs   p(99.9)=40.79µs
     http_req_connecting............: avg=2.03µs   min=0s      med=0s      max=23.75ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.75ms  min=1.93ms  med=23.51ms max=300.17ms p(90)=28.49ms  p(95)=30.76ms  p(99.9)=53.04ms
       { expected_response:true }...: avg=23.75ms  min=1.93ms  med=23.51ms max=300.17ms p(90)=28.49ms  p(95)=30.76ms  p(99.9)=53.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 250096
     http_req_receiving.............: avg=111.02µs min=29.69µs med=56.92µs max=111.62ms p(90)=100.25µs p(95)=190.25µs p(99.9)=8.74ms 
     http_req_sending...............: avg=48.32µs  min=4.75µs  med=9.9µs   max=145.32ms p(90)=17.63µs  p(95)=114.65µs p(99.9)=3.46ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.59ms  min=1.86ms  med=23.4ms  max=297.24ms p(90)=28.32ms  p(95)=30.52ms  p(99.9)=51.4ms 
     http_reqs......................: 250096  2079.823897/s
     iteration_duration.............: avg=23.99ms  min=3.91ms  med=23.72ms max=333.06ms p(90)=28.7ms   p(95)=31ms     p(99.9)=53.64ms
     iterations.....................: 249996  2078.992287/s
     success_rate...................: 100.00% ✓ 249996      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 429105      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=3.07µs  min=1.02µs med=2.03µs  max=4.21ms   p(90)=3.18µs  p(95)=3.73µs   p(99.9)=29.85µs
     http_req_connecting............: avg=694ns   min=0s     med=0s      max=4.01ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.71ms min=2.06ms med=41.13ms max=330.14ms p(90)=58.85ms p(95)=64.19ms  p(99.9)=90.6ms 
       { expected_response:true }...: avg=41.71ms min=2.06ms med=41.13ms max=330.14ms p(90)=58.85ms p(95)=64.19ms  p(99.9)=90.6ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 143135
     http_req_receiving.............: avg=75.79µs min=28.9µs med=57.52µs max=81.79ms  p(90)=90.41µs p(95)=106.49µs p(99.9)=1.65ms 
     http_req_sending...............: avg=25.8µs  min=5µs    med=9.66µs  max=126.51ms p(90)=14.32µs p(95)=18.13µs  p(99.9)=1.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.61ms min=2ms    med=41.03ms max=329.53ms p(90)=58.74ms p(95)=64.08ms  p(99.9)=90.06ms
     http_reqs......................: 143135  1190.001794/s
     iteration_duration.............: avg=41.94ms min=4.62ms med=41.33ms max=340.37ms p(90)=59.05ms p(95)=64.38ms  p(99.9)=91.39ms
     iterations.....................: 143035  1189.17041/s
     success_rate...................: 100.00% ✓ 143035      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 198891     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   662 kB/s
     http_req_blocked...............: avg=4.6µs   min=962ns   med=2.77µs  max=4.08ms   p(90)=4.39µs   p(95)=5.02µs   p(99.9)=51.03µs 
     http_req_connecting............: avg=1.5µs   min=0s      med=0s      max=4.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.13ms min=4.05ms  med=87.84ms max=367.98ms p(90)=109.72ms p(95)=120.19ms p(99.9)=219.19ms
       { expected_response:true }...: avg=90.13ms min=4.05ms  med=87.84ms max=367.98ms p(90)=109.72ms p(95)=120.19ms p(99.9)=219.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66397
     http_req_receiving.............: avg=84.44µs min=32.19µs med=76.66µs max=14.76ms  p(90)=112.25µs p(95)=125.8µs  p(99.9)=812.22µs
     http_req_sending...............: avg=26.35µs min=5.36µs  med=12.61µs max=182.96ms p(90)=19.45µs  p(95)=21.77µs  p(99.9)=652.46µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.02ms min=3.96ms  med=87.75ms max=367.84ms p(90)=109.61ms p(95)=120.06ms p(99.9)=218.86ms
     http_reqs......................: 66397   550.818049/s
     iteration_duration.............: avg=90.51ms min=18.46ms med=88.07ms max=399.49ms p(90)=109.95ms p(95)=120.46ms p(99.9)=221.62ms
     iterations.....................: 66297   549.988467/s
     success_rate...................: 100.00% ✓ 66297      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 147477     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   490 kB/s
     http_req_blocked...............: avg=4µs      min=1.14µs  med=2.85µs   max=3.47ms   p(90)=4.27µs   p(95)=4.82µs   p(99.9)=156.03µs
     http_req_connecting............: avg=870ns    min=0s      med=0s       max=2.26ms   p(90)=0s       p(95)=0s       p(99.9)=74.67µs 
     http_req_duration..............: avg=121.6ms  min=5.17ms  med=121.3ms  max=352.05ms p(90)=147.21ms p(95)=154.97ms p(99.9)=194.37ms
       { expected_response:true }...: avg=121.6ms  min=5.17ms  med=121.3ms  max=352.05ms p(90)=147.21ms p(95)=154.97ms p(99.9)=194.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49259
     http_req_receiving.............: avg=89.59µs  min=30.52µs med=78.16µs  max=87.89ms  p(90)=110.82µs p(95)=123.17µs p(99.9)=742.64µs
     http_req_sending...............: avg=29.48µs  min=5.48µs  med=13.84µs  max=170.4ms  p(90)=19.87µs  p(95)=21.74µs  p(99.9)=602.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.48ms min=5.06ms  med=121.19ms max=348.55ms p(90)=147.09ms p(95)=154.86ms p(99.9)=193.77ms
     http_reqs......................: 49259   408.164744/s
     iteration_duration.............: avg=122.09ms min=15.7ms  med=121.58ms max=373.47ms p(90)=147.45ms p(95)=155.23ms p(99.9)=195.66ms
     iterations.....................: 49159   407.336135/s
     success_rate...................: 100.00% ✓ 49159      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (rust subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 88875      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=6.99µs   min=1.28µs  med=3.29µs   max=4.17ms   p(90)=4.58µs   p(95)=5.13µs   p(99.9)=1.74ms  
     http_req_connecting............: avg=3.52µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=1.72ms  
     http_req_duration..............: avg=201.72ms min=8.64ms  med=204.09ms max=449.26ms p(90)=213.77ms p(95)=217.76ms p(99.9)=292.77ms
       { expected_response:true }...: avg=201.72ms min=8.64ms  med=204.09ms max=449.26ms p(90)=213.77ms p(95)=217.76ms p(99.9)=292.77ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29725
     http_req_receiving.............: avg=98.94µs  min=34.34µs med=91.55µs  max=55.69ms  p(90)=123.15µs p(95)=135.58µs p(99.9)=632.96µs
     http_req_sending...............: avg=37.03µs  min=5.87µs  med=16.77µs  max=124.37ms p(90)=21.67µs  p(95)=23.57µs  p(99.9)=599.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.58ms min=8.48ms  med=203.94ms max=448.62ms p(90)=213.64ms p(95)=217.63ms p(99.9)=292.67ms
     http_reqs......................: 29725   245.448215/s
     iteration_duration.............: avg=202.68ms min=50.8ms  med=204.69ms max=474.05ms p(90)=214.04ms p(95)=218.04ms p(99.9)=306.87ms
     iterations.....................: 29625   244.622485/s
     success_rate...................: 100.00% ✓ 29625      ✗ 0    
     vus............................: 46      min=46       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86037      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.3µs    min=1.23µs  med=3.47µs   max=4.14ms   p(90)=4.89µs   p(95)=5.49µs   p(99.9)=1.84ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=4.1ms    p(90)=0s       p(95)=0s       p(99.9)=1.81ms  
     http_req_duration..............: avg=208.31ms min=6.79ms  med=188.36ms max=716.56ms p(90)=247.34ms p(95)=392.83ms p(99.9)=628.66ms
       { expected_response:true }...: avg=208.31ms min=6.79ms  med=188.36ms max=716.56ms p(90)=247.34ms p(95)=392.83ms p(99.9)=628.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28779
     http_req_receiving.............: avg=102.51µs min=33.96µs med=95.28µs  max=51.59ms  p(90)=127.68µs p(95)=141.54µs p(99.9)=871.52µs
     http_req_sending...............: avg=31.9µs   min=5.75µs  med=17.66µs  max=176.14ms p(90)=22.86µs  p(95)=24.82µs  p(99.9)=583.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.17ms min=6.65ms  med=188.24ms max=716.43ms p(90)=247.21ms p(95)=392.61ms p(99.9)=628.56ms
     http_reqs......................: 28779   237.787807/s
     iteration_duration.............: avg=209.32ms min=33.82ms med=188.75ms max=716.81ms p(90)=247.96ms p(95)=393.81ms p(99.9)=629.09ms
     iterations.....................: 28679   236.961552/s
     success_rate...................: 100.00% ✓ 28679      ✗ 0    
     vus............................: 19      min=19       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 839637      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 336 MB  2.8 MB/s
     http_req_blocked...............: avg=3µs      min=951ns   med=2.13µs  max=12.33ms  p(90)=3.56µs   p(95)=4.38µs   p(99.9)=34.81µs
     http_req_connecting............: avg=344ns    min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.19ms  min=1.78ms  med=20.72ms max=311.89ms p(90)=29.57ms  p(95)=32.71ms  p(99.9)=55.32ms
       { expected_response:true }...: avg=21.19ms  min=1.78ms  med=20.72ms max=311.89ms p(90)=29.57ms  p(95)=32.71ms  p(99.9)=55.32ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 279979
     http_req_receiving.............: avg=114.53µs min=28.63µs med=54.37µs max=90.91ms  p(90)=101.86µs p(95)=248.08µs p(99.9)=9.16ms 
     http_req_sending...............: avg=52.79µs  min=5.21µs  med=9.58µs  max=90.72ms  p(90)=17.66µs  p(95)=123.87µs p(99.9)=5.66ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.02ms  min=1.68ms  med=20.58ms max=310.69ms p(90)=29.36ms  p(95)=32.42ms  p(99.9)=54.46ms
     http_reqs......................: 279979  2328.63625/s
     iteration_duration.............: avg=21.42ms  min=2.98ms  med=20.93ms max=344.55ms p(90)=29.79ms  p(95)=32.95ms  p(99.9)=55.92ms
     iterations.....................: 279879  2327.804531/s
     success_rate...................: 100.00% ✓ 279879      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.3)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 696000      ✗ 0     
     data_received..................: 20 GB   169 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=2.75µs   min=962ns   med=2.14µs   max=2.95ms   p(90)=3.49µs  p(95)=4.23µs   p(99.9)=34.27µs 
     http_req_connecting............: avg=238ns    min=0s      med=0s       max=2.92ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.61ms  min=1.85ms  med=17.43ms  max=587.91ms p(90)=54.67ms p(95)=71.77ms  p(99.9)=192.26ms
       { expected_response:true }...: avg=25.61ms  min=1.85ms  med=17.43ms  max=587.91ms p(90)=54.67ms p(95)=71.77ms  p(99.9)=192.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232100
     http_req_receiving.............: avg=691.45µs min=50.99µs med=110.79µs max=163.89ms p(90)=1.13ms  p(95)=1.79ms   p(99.9)=56.6ms  
     http_req_sending...............: avg=41.2µs   min=5.23µs  med=9.38µs   max=163.53ms p(90)=17.67µs p(95)=110.26µs p(99.9)=2.27ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.88ms  min=1.75ms  med=16.86ms  max=587.8ms  p(90)=53.32ms p(95)=70.31ms  p(99.9)=188.98ms
     http_reqs......................: 232100  1930.324632/s
     iteration_duration.............: avg=25.85ms  min=2.69ms  med=17.65ms  max=588.14ms p(90)=54.89ms p(95)=72.02ms  p(99.9)=197.57ms
     iterations.....................: 232000  1929.492954/s
     success_rate...................: 100.00% ✓ 232000      ✗ 0     
     vus............................: 50      min=50        max=50  
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

     checks.........................: 100.00% ✓ 559458      ✗ 0     
     data_received..................: 16 GB   136 MB/s
     data_sent......................: 224 MB  1.9 MB/s
     http_req_blocked...............: avg=3.55µs   min=952ns   med=2.36µs  max=4.12ms   p(90)=4.76µs   p(95)=5.95µs   p(99.9)=48.28µs
     http_req_connecting............: avg=550ns    min=0s      med=0s      max=4.07ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=31.89ms  min=2.37ms  med=31ms    max=320.84ms p(90)=42.41ms  p(95)=47.09ms  p(99.9)=86.29ms
       { expected_response:true }...: avg=31.89ms  min=2.37ms  med=31ms    max=320.84ms p(90)=42.41ms  p(95)=47.09ms  p(99.9)=86.29ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 186586
     http_req_receiving.............: avg=114.76µs min=30.74µs med=62.09µs max=98.42ms  p(90)=135.09µs p(95)=284.81µs p(99.9)=5.99ms 
     http_req_sending...............: avg=51.37µs  min=5.31µs  med=10.43µs max=255.75ms p(90)=24.38µs  p(95)=137.78µs p(99.9)=3.9ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.73ms  min=2.28ms  med=30.87ms max=320.24ms p(90)=42.22ms  p(95)=46.85ms  p(99.9)=85.33ms
     http_reqs......................: 186586  1550.995563/s
     iteration_duration.............: avg=32.16ms  min=5.1ms   med=31.24ms max=338.89ms p(90)=42.65ms  p(95)=47.34ms  p(99.9)=87.05ms
     iterations.....................: 186486  1550.164314/s
     success_rate...................: 100.00% ✓ 186486      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.321.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 406461      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 163 MB  1.4 MB/s
     http_req_blocked...............: avg=3.31µs  min=1.06µs  med=2.22µs  max=3.98ms   p(90)=3.67µs   p(95)=4.33µs   p(99.9)=37.76µs
     http_req_connecting............: avg=726ns   min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=44.03ms min=2.17ms  med=43.49ms max=351.02ms p(90)=61.98ms  p(95)=67.65ms  p(99.9)=95.09ms
       { expected_response:true }...: avg=44.03ms min=2.17ms  med=43.49ms max=351.02ms p(90)=61.98ms  p(95)=67.65ms  p(99.9)=95.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 135587
     http_req_receiving.............: avg=80.66µs min=28.28µs med=64.44µs max=85.29ms  p(90)=101.49µs p(95)=118.39µs p(99.9)=1.5ms  
     http_req_sending...............: avg=23.24µs min=5.2µs   med=10.84µs max=129.37ms p(90)=17.49µs  p(95)=20.77µs  p(99.9)=1.12ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.93ms min=2.1ms   med=43.39ms max=302.19ms p(90)=61.88ms  p(95)=67.54ms  p(99.9)=94.69ms
     http_reqs......................: 135587  1126.966834/s
     iteration_duration.............: avg=44.28ms min=4.65ms  med=43.7ms  max=359.96ms p(90)=62.18ms  p(95)=67.85ms  p(99.9)=95.58ms
     iterations.....................: 135487  1126.135658/s
     success_rate...................: 100.00% ✓ 135487      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 192663     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   641 kB/s
     http_req_blocked...............: avg=4.92µs  min=1.09µs  med=3.14µs  max=3.92ms   p(90)=4.72µs   p(95)=5.36µs   p(99.9)=57.73µs 
     http_req_connecting............: avg=1.53µs  min=0s      med=0s      max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.04ms min=4.08ms  med=90.96ms max=363.19ms p(90)=117.85ms p(95)=129.98ms p(99.9)=233.94ms
       { expected_response:true }...: avg=93.04ms min=4.08ms  med=90.96ms max=363.19ms p(90)=117.85ms p(95)=129.98ms p(99.9)=233.94ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64321
     http_req_receiving.............: avg=91.36µs min=32.34µs med=81.5µs  max=65.21ms  p(90)=115.93µs p(95)=128.7µs  p(99.9)=924.1µs 
     http_req_sending...............: avg=24.98µs min=5.33µs  med=14.44µs max=109.73ms p(90)=21.14µs  p(95)=23.38µs  p(99.9)=664.45µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=92.92ms min=3.99ms  med=90.85ms max=358.11ms p(90)=117.72ms p(95)=129.87ms p(99.9)=233.55ms
     http_reqs......................: 64321   533.455055/s
     iteration_duration.............: avg=93.44ms min=25.62ms med=91.23ms max=375.34ms p(90)=118.1ms  p(95)=130.31ms p(99.9)=236.11ms
     iterations.....................: 64221   532.625691/s
     success_rate...................: 100.00% ✓ 64221      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.15.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 137739     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   458 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.19µs  med=3.15µs   max=4.15ms   p(90)=4.6µs    p(95)=5.16µs   p(99.9)=423.48µs
     http_req_connecting............: avg=2.25µs   min=0s      med=0s       max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=251.83µs
     http_req_duration..............: avg=130.18ms min=5.64ms  med=127.69ms max=361.38ms p(90)=172.81ms p(95)=185.76ms p(99.9)=236.98ms
       { expected_response:true }...: avg=130.18ms min=5.64ms  med=127.69ms max=361.38ms p(90)=172.81ms p(95)=185.76ms p(99.9)=236.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46013
     http_req_receiving.............: avg=161.24µs min=32.16µs med=83.56µs  max=241.69ms p(90)=115.8µs  p(95)=127.55µs p(99.9)=1.06ms  
     http_req_sending...............: avg=23.19µs  min=5.62µs  med=15.11µs  max=55.95ms  p(90)=20.7µs   p(95)=22.61µs  p(99.9)=575.23µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.99ms min=5.52ms  med=127.54ms max=272.24ms p(90)=172.61ms p(95)=185.53ms p(99.9)=233.82ms
     http_reqs......................: 46013   381.117939/s
     iteration_duration.............: avg=130.71ms min=14.65ms med=128ms    max=370.82ms p(90)=173.1ms  p(95)=186.1ms  p(99.9)=239.52ms
     iterations.....................: 45913   380.289656/s
     success_rate...................: 100.00% ✓ 45913      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.8.2)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 86061      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.45µs   min=1.26µs  med=3.34µs   max=4.48ms   p(90)=4.65µs   p(95)=5.21µs   p(99.9)=1.88ms  
     http_req_connecting............: avg=3.94µs   min=0s      med=0s       max=4.42ms   p(90)=0s       p(95)=0s       p(99.9)=1.85ms  
     http_req_duration..............: avg=208.3ms  min=6.41ms  med=198.29ms max=788.73ms p(90)=259.4ms  p(95)=326.53ms p(99.9)=646.1ms 
       { expected_response:true }...: avg=208.3ms  min=6.41ms  med=198.29ms max=788.73ms p(90)=259.4ms  p(95)=326.53ms p(99.9)=646.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28787
     http_req_receiving.............: avg=108.9µs  min=35.69µs med=94.09µs  max=165.72ms p(90)=125.25µs p(95)=138.15µs p(99.9)=510.1µs 
     http_req_sending...............: avg=25.89µs  min=5.94µs  med=17.1µs   max=59.77ms  p(90)=21.95µs  p(95)=23.68µs  p(99.9)=555.29µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.17ms min=6.31ms  med=198.17ms max=788.63ms p(90)=259.28ms p(95)=326.44ms p(99.9)=646ms   
     http_reqs......................: 28787   238.007657/s
     iteration_duration.............: avg=209.29ms min=35.82ms med=198.75ms max=789.01ms p(90)=259.85ms p(95)=329.65ms p(99.9)=646.35ms
     iterations.....................: 28687   237.180868/s
     success_rate...................: 100.00% ✓ 28687      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-gateway (.net subgraphs) (2.14.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 85185      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   282 kB/s
     http_req_blocked...............: avg=7.51µs   min=1.29µs  med=3.31µs   max=4.34ms   p(90)=4.59µs   p(95)=5.14µs   p(99.9)=1.98ms  
     http_req_connecting............: avg=3.97µs   min=0s      med=0s       max=4.3ms    p(90)=0s       p(95)=0s       p(99.9)=1.93ms  
     http_req_duration..............: avg=210.38ms min=8.78ms  med=225.73ms max=338.35ms p(90)=241.15ms p(95)=246.19ms p(99.9)=324.61ms
       { expected_response:true }...: avg=210.38ms min=8.78ms  med=225.73ms max=338.35ms p(90)=241.15ms p(95)=246.19ms p(99.9)=324.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28495
     http_req_receiving.............: avg=118.28µs min=33.58µs med=93.29µs  max=65.62ms  p(90)=124.01µs p(95)=136.38µs p(99.9)=1.08ms  
     http_req_sending...............: avg=23.21µs  min=6.11µs  med=17.04µs  max=51.29ms  p(90)=21.57µs  p(95)=23.4µs   p(99.9)=467.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.24ms min=8.61ms  med=225.62ms max=338.21ms p(90)=241.01ms p(95)=246.05ms p(99.9)=324.48ms
     http_reqs......................: 28495   235.211258/s
     iteration_duration.............: avg=211.44ms min=39.21ms med=226.12ms max=434.45ms p(90)=241.41ms p(95)=246.49ms p(99.9)=330.02ms
     iterations.....................: 28395   234.38581/s
     success_rate...................: 100.00% ✓ 28395      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

