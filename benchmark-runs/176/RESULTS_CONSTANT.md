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
| hive-router | v0.0.49 | 3,015 | 3,223 | 2,976 | 2.6% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,101 | 2,151 | 2,078 | 1.2% |  |
| grafbase | 0.53.3 | 2,034 | 2,082 | 1,982 | 1.7% |  |
| cosmo | 0.307.0 | 1,272 | 1,296 | 1,262 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 530 | 542 | 524 | 1.1% |  |
| apollo-router | v2.13.1 | 398 | 412 | 391 | 1.8% |  |
| hive-gateway | 2.5.25 | 255 | 261 | 253 | 1.1% |  |
| apollo-gateway | 2.13.3 | 244 | 248 | 243 | 0.8% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,388 | 2,511 | 2,349 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,923 | 1,979 | 1,896 | 1.4% |  |
| grafbase | 0.53.3 | 1,522 | 1,569 | 1,498 | 1.4% |  |
| cosmo | 0.307.0 | 1,186 | 1,210 | 1,177 | 1.1% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 516 | 529 | 509 | 1.3% |  |
| apollo-router | v2.13.1 | 400 | 410 | 396 | 1.2% |  |
| hive-gateway | 2.5.25 | 243 | 248 | 240 | 1.2% |  |
| apollo-gateway | 2.13.3 | 236 | 239 | 235 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1087203     ✗ 0     
     data_received..................: 32 GB   265 MB/s
     data_sent......................: 436 MB  3.6 MB/s
     http_req_blocked...............: avg=2.91µs   min=1.01µs  med=2µs     max=25.39ms  p(90)=3.13µs  p(95)=3.77µs   p(99.9)=32.56µs
     http_req_connecting............: avg=272ns    min=0s      med=0s      max=4ms      p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.31ms  min=1.7ms   med=15.2ms  max=313.37ms p(90)=24.47ms p(95)=29.01ms  p(99.9)=52.26ms
       { expected_response:true }...: avg=16.31ms  min=1.7ms   med=15.2ms  max=313.37ms p(90)=24.47ms p(95)=29.01ms  p(99.9)=52.26ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 362501
     http_req_receiving.............: avg=155.21µs min=27.02µs med=45.96µs max=177.64ms p(90)=93.32µs p(95)=273.67µs p(99.9)=17.69ms
     http_req_sending...............: avg=62.93µs  min=5.31µs  med=8.75µs  max=229.44ms p(90)=14.54µs p(95)=117.28µs p(99.9)=15.3ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.09ms  min=1.64ms  med=15.05ms max=312.86ms p(90)=24.11ms p(95)=28.45ms  p(99.9)=50.58ms
     http_reqs......................: 362501  3015.745446/s
     iteration_duration.............: avg=16.54ms  min=1.98ms  med=15.41ms max=339.86ms p(90)=24.71ms p(95)=29.3ms   p(99.9)=53.65ms
     iterations.....................: 362401  3014.913518/s
     success_rate...................: 100.00% ✓ 362401      ✗ 0     
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

     checks.........................: 100.00% ✓ 758022      ✗ 0     
     data_received..................: 22 GB   184 MB/s
     data_sent......................: 304 MB  2.5 MB/s
     http_req_blocked...............: avg=2.69µs   min=1.02µs med=2.01µs   max=16.17ms  p(90)=3.03µs   p(95)=3.58µs   p(99.9)=30.34µs 
     http_req_connecting............: avg=207ns    min=0s     med=0s       max=2.93ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.51ms  min=2.43ms med=14.65ms  max=325.93ms p(90)=53.58ms  p(95)=72.24ms  p(99.9)=169.31ms
       { expected_response:true }...: avg=23.51ms  min=2.43ms med=14.65ms  max=325.93ms p(90)=53.58ms  p(95)=72.24ms  p(99.9)=169.31ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 252774
     http_req_receiving.............: avg=657.34µs min=51.2µs med=107.63µs max=198.78ms p(90)=941.79µs p(95)=1.46ms   p(99.9)=61.6ms  
     http_req_sending...............: avg=39.43µs  min=5.28µs med=9.01µs   max=132.41ms p(90)=14.4µs   p(95)=100.41µs p(99.9)=2.34ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.81ms  min=2.34ms med=14.15ms  max=325.68ms p(90)=52.16ms  p(95)=70.75ms  p(99.9)=167.18ms
     http_reqs......................: 252774  2101.164894/s
     iteration_duration.............: avg=23.73ms  min=3.37ms med=14.86ms  max=353.73ms p(90)=53.81ms  p(95)=72.46ms  p(99.9)=171.06ms
     iterations.....................: 252674  2100.333651/s
     success_rate...................: 100.00% ✓ 252674      ✗ 0     
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

     checks.........................: 100.00% ✓ 733686      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=3.55µs   min=1.02µs  med=2.55µs  max=14.35ms  p(90)=4.06µs   p(95)=4.84µs   p(99.9)=42.54µs
     http_req_connecting............: avg=455ns    min=0s      med=0s      max=4.5ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.28ms  min=1.96ms  med=24.03ms max=336.09ms p(90)=29.17ms  p(95)=31.51ms  p(99.9)=53.62ms
       { expected_response:true }...: avg=24.28ms  min=1.96ms  med=24.03ms max=336.09ms p(90)=29.17ms  p(95)=31.51ms  p(99.9)=53.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244662
     http_req_receiving.............: avg=114.58µs min=29.09µs med=59.64µs max=137.86ms p(90)=104.33µs p(95)=222.72µs p(99.9)=9.1ms  
     http_req_sending...............: avg=47.72µs  min=4.79µs  med=10.6µs  max=136.6ms  p(90)=18.13µs  p(95)=124.03µs p(99.9)=3.37ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.12ms  min=1.88ms  med=23.91ms max=302.16ms p(90)=28.98ms  p(95)=31.22ms  p(99.9)=52.94ms
     http_reqs......................: 244662  2034.597537/s
     iteration_duration.............: avg=24.52ms  min=3.12ms  med=24.24ms max=346.36ms p(90)=29.4ms   p(95)=31.76ms  p(99.9)=54.33ms
     iterations.....................: 244562  2033.765942/s
     success_rate...................: 100.00% ✓ 244562      ✗ 0     
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

     checks.........................: 100.00% ✓ 458718      ✗ 0     
     data_received..................: 13 GB   112 MB/s
     data_sent......................: 184 MB  1.5 MB/s
     http_req_blocked...............: avg=3.45µs  min=1.09µs  med=2.4µs   max=4.73ms   p(90)=3.74µs  p(95)=4.4µs    p(99.9)=35.96µs
     http_req_connecting............: avg=701ns   min=0s      med=0s      max=4.69ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39ms    min=2.16ms  med=38.43ms max=334.92ms p(90)=54.95ms p(95)=60.07ms  p(99.9)=84.25ms
       { expected_response:true }...: avg=39ms    min=2.16ms  med=38.43ms max=334.92ms p(90)=54.95ms p(95)=60.07ms  p(99.9)=84.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153006
     http_req_receiving.............: avg=82.39µs min=28.14µs med=60.88µs max=234.82ms p(90)=96.69µs p(95)=114.73µs p(99.9)=2.15ms 
     http_req_sending...............: avg=28.04µs min=5.5µs   med=10.73µs max=261.44ms p(90)=16.35µs p(95)=20.67µs  p(99.9)=1.32ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.89ms min=2.08ms  med=38.32ms max=334.48ms p(90)=54.83ms p(95)=59.95ms  p(99.9)=83.77ms
     http_reqs......................: 153006  1272.038773/s
     iteration_duration.............: avg=39.23ms min=4.15ms  med=38.63ms max=357.65ms p(90)=55.15ms p(95)=60.27ms  p(99.9)=84.72ms
     iterations.....................: 152906  1271.207408/s
     success_rate...................: 100.00% ✓ 152906      ✗ 0     
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

     checks.........................: 100.00% ✓ 191661     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   637 kB/s
     http_req_blocked...............: avg=4.07µs   min=1.09µs  med=2.87µs  max=2.83ms   p(90)=4.44µs   p(95)=5.04µs   p(99.9)=42.64µs 
     http_req_connecting............: avg=925ns    min=0s      med=0s      max=2.8ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.56ms  min=4.14ms  med=91.59ms max=339.11ms p(90)=114.12ms p(95)=126.24ms p(99.9)=218.63ms
       { expected_response:true }...: avg=93.56ms  min=4.14ms  med=91.59ms max=339.11ms p(90)=114.12ms p(95)=126.24ms p(99.9)=218.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63987
     http_req_receiving.............: avg=154.41µs min=30.63µs med=75.57µs max=224.29ms p(90)=109.88µs p(95)=121.93µs p(99.9)=1.17ms  
     http_req_sending...............: avg=22.73µs  min=5.14µs  med=12.92µs max=185.48ms p(90)=19.2µs   p(95)=21.36µs  p(99.9)=609.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.38ms  min=4.08ms  med=91.49ms max=247.27ms p(90)=113.98ms p(95)=125.93ms p(99.9)=214.97ms
     http_reqs......................: 63987   530.763862/s
     iteration_duration.............: avg=93.93ms  min=11.71ms med=91.83ms max=353.28ms p(90)=114.39ms p(95)=126.54ms p(99.9)=220.42ms
     iterations.....................: 63887   529.934375/s
     success_rate...................: 100.00% ✓ 63887      ✗ 0    
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

     checks.........................: 100.00% ✓ 143946     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   478 kB/s
     http_req_blocked...............: avg=5.49µs   min=1.13µs  med=3.17µs   max=4.11ms   p(90)=4.58µs   p(95)=5.13µs   p(99.9)=222.4µs 
     http_req_connecting............: avg=2.13µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=127.14µs
     http_req_duration..............: avg=124.57ms min=5.47ms  med=124.24ms max=351.54ms p(90)=151.24ms p(95)=158.86ms p(99.9)=195.63ms
       { expected_response:true }...: avg=124.57ms min=5.47ms  med=124.24ms max=351.54ms p(90)=151.24ms p(95)=158.86ms p(99.9)=195.63ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48082
     http_req_receiving.............: avg=96.15µs  min=31.21µs med=79.58µs  max=178.07ms p(90)=111.95µs p(95)=123.88µs p(99.9)=776.41µs
     http_req_sending...............: avg=28.5µs   min=5.77µs  med=14.25µs  max=175.07ms p(90)=20.08µs  p(95)=22µs     p(99.9)=632.19µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.45ms min=5.36ms  med=124.14ms max=316.1ms  p(90)=151.12ms p(95)=158.74ms p(99.9)=194.99ms
     http_reqs......................: 48082   398.36359/s
     iteration_duration.............: avg=125.08ms min=35.16ms med=124.52ms max=372.21ms p(90)=151.5ms  p(95)=159.12ms p(99.9)=198.66ms
     iterations.....................: 47982   397.535081/s
     success_rate...................: 100.00% ✓ 47982      ✗ 0    
     vus............................: 50      min=50       max=50 
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

     checks.........................: 100.00% ✓ 92640      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   307 kB/s
     http_req_blocked...............: avg=7.27µs   min=1.21µs  med=3.61µs   max=4.18ms   p(90)=5.05µs   p(95)=5.66µs   p(99.9)=1.93ms  
     http_req_connecting............: avg=3.4µs    min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=193.55ms min=6.15ms  med=177.67ms max=644.81ms p(90)=227.71ms p(95)=364.57ms p(99.9)=544.97ms
       { expected_response:true }...: avg=193.55ms min=6.15ms  med=177.67ms max=644.81ms p(90)=227.71ms p(95)=364.57ms p(99.9)=544.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30980
     http_req_receiving.............: avg=187.17µs min=34.33µs med=96.36µs  max=169.39ms p(90)=128.39µs p(95)=141.38µs p(99.9)=1.78ms  
     http_req_sending...............: avg=28.09µs  min=6.08µs  med=17.81µs  max=82.9ms   p(90)=22.75µs  p(95)=24.6µs   p(99.9)=705.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.34ms min=6.02ms  med=177.54ms max=644.67ms p(90)=227.27ms p(95)=361.12ms p(99.9)=544.84ms
     http_reqs......................: 30980   255.902265/s
     iteration_duration.............: avg=194.45ms min=31.57ms med=178.03ms max=645.07ms p(90)=228.28ms p(95)=378.19ms p(99.9)=545.23ms
     iterations.....................: 30880   255.076241/s
     success_rate...................: 100.00% ✓ 30880      ✗ 0    
     vus............................: 11      min=11       max=50 
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

     checks.........................: 100.00% ✓ 88503      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=6.28µs   min=1.29µs  med=3.46µs   max=3.75ms   p(90)=4.71µs   p(95)=5.25µs   p(99.9)=967.36µs
     http_req_connecting............: avg=2.67µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=936.43µs
     http_req_duration..............: avg=202.61ms min=8.38ms  med=202.04ms max=331.69ms p(90)=214.6ms  p(95)=222.9ms  p(99.9)=285.32ms
       { expected_response:true }...: avg=202.61ms min=8.38ms  med=202.04ms max=331.69ms p(90)=214.6ms  p(95)=222.9ms  p(99.9)=285.32ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29601
     http_req_receiving.............: avg=96.22µs  min=32.18µs med=91.4µs   max=13.17ms  p(90)=122.48µs p(95)=134.8µs  p(99.9)=615.28µs
     http_req_sending...............: avg=24.85µs  min=6.01µs  med=17.09µs  max=39.33ms  p(90)=21.51µs  p(95)=23.19µs  p(99.9)=515.89µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.49ms min=8.24ms  med=201.93ms max=331.53ms p(90)=214.49ms p(95)=222.79ms p(99.9)=285.2ms 
     http_reqs......................: 29601   244.470224/s
     iteration_duration.............: avg=203.53ms min=38.1ms  med=202.3ms  max=341.92ms p(90)=214.87ms p(95)=223.24ms p(99.9)=286.1ms 
     iterations.....................: 29501   243.644339/s
     success_rate...................: 100.00% ✓ 29501      ✗ 0    
     vus............................: 45      min=45       max=50 
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

     checks.........................: 100.00% ✓ 861222      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=3.16µs   min=1.02µs  med=2.2µs   max=15.67ms  p(90)=3.61µs   p(95)=4.43µs   p(99.9)=37.17µs
     http_req_connecting............: avg=380ns    min=0s      med=0s      max=4.79ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.65ms  min=1.73ms  med=20.18ms max=341.27ms p(90)=28.61ms  p(95)=31.7ms   p(99.9)=53.52ms
       { expected_response:true }...: avg=20.65ms  min=1.73ms  med=20.18ms max=341.27ms p(90)=28.61ms  p(95)=31.7ms   p(99.9)=53.52ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 287174
     http_req_receiving.............: avg=124.13µs min=28.38µs med=54.95µs max=210.8ms  p(90)=102.64µs p(95)=256.53µs p(99.9)=9.99ms 
     http_req_sending...............: avg=52.31µs  min=5.21µs  med=9.84µs  max=101.25ms p(90)=17.94µs  p(95)=124.49µs p(99.9)=5.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.48ms  min=1.65ms  med=20.04ms max=130.56ms p(90)=28.4ms   p(95)=31.41ms  p(99.9)=52.62ms
     http_reqs......................: 287174  2388.590949/s
     iteration_duration.............: avg=20.89ms  min=3.12ms  med=20.39ms max=353.04ms p(90)=28.84ms  p(95)=31.95ms  p(99.9)=54.37ms
     iterations.....................: 287074  2387.759192/s
     success_rate...................: 100.00% ✓ 287074      ✗ 0     
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

     checks.........................: 100.00% ✓ 693690      ✗ 0     
     data_received..................: 20 GB   169 MB/s
     data_sent......................: 278 MB  2.3 MB/s
     http_req_blocked...............: avg=3.48µs   min=1.05µs  med=2.44µs   max=16.9ms   p(90)=3.83µs  p(95)=4.54µs  p(99.9)=37.57µs 
     http_req_connecting............: avg=567ns    min=0s      med=0s       max=5.97ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.69ms  min=1.92ms  med=17.46ms  max=616.2ms  p(90)=54.61ms p(95)=72.07ms p(99.9)=189.95ms
       { expected_response:true }...: avg=25.69ms  min=1.92ms  med=17.46ms  max=616.2ms  p(90)=54.61ms p(95)=72.07ms p(99.9)=189.95ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 231330
     http_req_receiving.............: avg=702.58µs min=51.99µs med=110.29µs max=167.18ms p(90)=1.13ms  p(95)=1.8ms   p(99.9)=60.98ms 
     http_req_sending...............: avg=43.02µs  min=5.05µs  med=10.05µs  max=72.6ms   p(90)=17.88µs p(95)=112.8µs p(99.9)=3.19ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.95ms  min=1.8ms   med=16.89ms  max=614.6ms  p(90)=53.34ms p(95)=70.46ms p(99.9)=187.94ms
     http_reqs......................: 231330  1923.772753/s
     iteration_duration.............: avg=25.93ms  min=2.79ms  med=17.69ms  max=616.41ms p(90)=54.85ms p(95)=72.32ms p(99.9)=193.55ms
     iterations.....................: 231230  1922.941139/s
     success_rate...................: 100.00% ✓ 231230      ✗ 0     
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

     checks.........................: 100.00% ✓ 549276      ✗ 0     
     data_received..................: 16 GB   133 MB/s
     data_sent......................: 220 MB  1.8 MB/s
     http_req_blocked...............: avg=3.61µs   min=962ns   med=2.37µs  max=11.07ms  p(90)=4.7µs    p(95)=5.87µs   p(99.9)=48.92µs
     http_req_connecting............: avg=531ns    min=0s      med=0s      max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.49ms  min=2.42ms  med=31.6ms  max=324.1ms  p(90)=43.11ms  p(95)=47.88ms  p(99.9)=92.06ms
       { expected_response:true }...: avg=32.49ms  min=2.42ms  med=31.6ms  max=324.1ms  p(90)=43.11ms  p(95)=47.88ms  p(99.9)=92.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183192
     http_req_receiving.............: avg=111.54µs min=29.14µs med=61.57µs max=37.29ms  p(90)=135.87µs p(95)=282.05µs p(99.9)=5.3ms  
     http_req_sending...............: avg=49.16µs  min=5.28µs  med=10.34µs max=137.39ms p(90)=24.29µs  p(95)=135.26µs p(99.9)=4.25ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.33ms  min=2.35ms  med=31.46ms max=323.44ms p(90)=42.91ms  p(95)=47.64ms  p(99.9)=91.8ms 
     http_reqs......................: 183192  1522.679787/s
     iteration_duration.............: avg=32.76ms  min=3.76ms  med=31.84ms max=361.27ms p(90)=43.36ms  p(95)=48.12ms  p(99.9)=92.95ms
     iterations.....................: 183092  1521.848594/s
     success_rate...................: 100.00% ✓ 183092      ✗ 0     
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

     checks.........................: 100.00% ✓ 427965      ✗ 0     
     data_received..................: 13 GB   104 MB/s
     data_sent......................: 172 MB  1.4 MB/s
     http_req_blocked...............: avg=4.08µs  min=1.1µs   med=2.87µs  max=20.93ms  p(90)=4.48µs   p(95)=5.19µs   p(99.9)=40.89µs
     http_req_connecting............: avg=692ns   min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.79ms min=2.26ms  med=41.27ms max=317.25ms p(90)=58.84ms  p(95)=64.25ms  p(99.9)=89.84ms
       { expected_response:true }...: avg=41.79ms min=2.26ms  med=41.27ms max=317.25ms p(90)=58.84ms  p(95)=64.25ms  p(99.9)=89.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 142755
     http_req_receiving.............: avg=97.52µs min=30.42µs med=68.55µs max=254.33ms p(90)=108.89µs p(95)=131.08µs p(99.9)=4.18ms 
     http_req_sending...............: avg=32.58µs min=5.28µs  med=12.14µs max=203.75ms p(90)=18.81µs  p(95)=23.26µs  p(99.9)=1.5ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.66ms min=2.15ms  med=41.15ms max=316.66ms p(90)=58.7ms   p(95)=64.09ms  p(99.9)=89.48ms
     http_reqs......................: 142755  1186.689059/s
     iteration_duration.............: avg=42.05ms min=4.09ms  med=41.49ms max=345.89ms p(90)=59.06ms  p(95)=64.47ms  p(99.9)=90.59ms
     iterations.....................: 142655  1185.857782/s
     success_rate...................: 100.00% ✓ 142655      ✗ 0     
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

     checks.........................: 100.00% ✓ 186375     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   620 kB/s
     http_req_blocked...............: avg=5.18µs  min=1.14µs  med=3.27µs  max=4.26ms   p(90)=4.84µs   p(95)=5.44µs   p(99.9)=51.16µs 
     http_req_connecting............: avg=1.69µs  min=0s      med=0s      max=4.19ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.16ms min=4.44ms  med=93.33ms max=366.49ms p(90)=118.25ms p(95)=132.17ms p(99.9)=229.66ms
       { expected_response:true }...: avg=96.16ms min=4.44ms  med=93.33ms max=366.49ms p(90)=118.25ms p(95)=132.17ms p(99.9)=229.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62225
     http_req_receiving.............: avg=92.72µs min=31.83µs med=83.9µs  max=55.81ms  p(90)=119.03µs p(95)=133.7µs  p(99.9)=936.13µs
     http_req_sending...............: avg=32.55µs min=5.5µs   med=15.1µs  max=214.42ms p(90)=21.57µs  p(95)=23.82µs  p(99.9)=675.47µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.04ms min=4.33ms  med=93.22ms max=365.88ms p(90)=118.11ms p(95)=132.05ms p(99.9)=228.9ms 
     http_reqs......................: 62225   516.026716/s
     iteration_duration.............: avg=96.58ms min=23.61ms med=93.6ms  max=377.52ms p(90)=118.51ms p(95)=132.49ms p(99.9)=233.56ms
     iterations.....................: 62125   515.197424/s
     success_rate...................: 100.00% ✓ 62125      ✗ 0    
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

     checks.........................: 100.00% ✓ 144795     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   481 kB/s
     http_req_blocked...............: avg=4.79µs   min=1.16µs  med=3.69µs   max=2.44ms   p(90)=5.2µs    p(95)=5.8µs    p(99.9)=170.58µs
     http_req_connecting............: avg=888ns    min=0s      med=0s       max=2.41ms   p(90)=0s       p(95)=0s       p(99.9)=110.39µs
     http_req_duration..............: avg=123.82ms min=5.89ms  med=121.16ms max=340.84ms p(90)=164.73ms p(95)=177.15ms p(99.9)=227.4ms 
       { expected_response:true }...: avg=123.82ms min=5.89ms  med=121.16ms max=340.84ms p(90)=164.73ms p(95)=177.15ms p(99.9)=227.4ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48365
     http_req_receiving.............: avg=93.42µs  min=32.45µs med=88.95µs  max=3.97ms   p(90)=119.93µs p(95)=132.56µs p(99.9)=737.57µs
     http_req_sending...............: avg=28.37µs  min=6.3µs   med=17.02µs  max=138.22ms p(90)=22.26µs  p(95)=24.12µs  p(99.9)=759.99µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.7ms  min=5.81ms  med=121.04ms max=340.29ms p(90)=164.58ms p(95)=177.05ms p(99.9)=227.3ms 
     http_reqs......................: 48365   400.526991/s
     iteration_duration.............: avg=124.35ms min=29.49ms med=121.48ms max=374.25ms p(90)=165.09ms p(95)=177.49ms p(99.9)=231.51ms
     iterations.....................: 48265   399.698857/s
     success_rate...................: 100.00% ✓ 48265      ✗ 0    
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

     checks.........................: 100.00% ✓ 87900      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   292 kB/s
     http_req_blocked...............: avg=6.36µs   min=1.27µs  med=3.65µs   max=5.09ms   p(90)=5.04µs   p(95)=5.62µs   p(99.9)=1.05ms  
     http_req_connecting............: avg=2.38µs   min=0s      med=0s       max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=960.24µs
     http_req_duration..............: avg=203.95ms min=6.59ms  med=187.38ms max=595ms    p(90)=244.96ms p(95)=379.43ms p(99.9)=520.52ms
       { expected_response:true }...: avg=203.95ms min=6.59ms  med=187.38ms max=595ms    p(90)=244.96ms p(95)=379.43ms p(99.9)=520.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29400
     http_req_receiving.............: avg=100.79µs min=33.99µs med=97.08µs  max=2.2ms    p(90)=128.4µs  p(95)=141.67µs p(99.9)=559.57µs
     http_req_sending...............: avg=25.47µs  min=5.88µs  med=18.12µs  max=29.34ms  p(90)=23.04µs  p(95)=24.7µs   p(99.9)=958.88µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.82ms min=6.41ms  med=187.24ms max=594.87ms p(90)=244.81ms p(95)=379.32ms p(99.9)=520.41ms
     http_reqs......................: 29400   243.10815/s
     iteration_duration.............: avg=204.9ms  min=48.64ms med=187.78ms max=595.26ms p(90)=245.52ms p(95)=379.99ms p(99.9)=520.79ms
     iterations.....................: 29300   242.281252/s
     success_rate...................: 100.00% ✓ 29300      ✗ 0    
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

     checks.........................: 100.00% ✓ 85680      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=7.57µs   min=1.27µs  med=3.58µs   max=4.28ms   p(90)=4.93µs   p(95)=5.5µs    p(99.9)=1.92ms  
     http_req_connecting............: avg=3.8µs    min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=1.9ms   
     http_req_duration..............: avg=209.23ms min=8.68ms  med=216.07ms max=431.61ms p(90)=275.06ms p(95)=281.51ms p(99.9)=348.73ms
       { expected_response:true }...: avg=209.23ms min=8.68ms  med=216.07ms max=431.61ms p(90)=275.06ms p(95)=281.51ms p(99.9)=348.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28660
     http_req_receiving.............: avg=110.19µs min=33.15µs med=96.18µs  max=83.17ms  p(90)=127.82µs p(95)=141.2µs  p(99.9)=967.79µs
     http_req_sending...............: avg=31.81µs  min=5.84µs  med=17.75µs  max=66.72ms  p(90)=22.56µs  p(95)=24.47µs  p(99.9)=603.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.09ms min=8.53ms  med=215.93ms max=399.85ms p(90)=274.93ms p(95)=281.39ms p(99.9)=347.99ms
     http_reqs......................: 28660   236.63106/s
     iteration_duration.............: avg=210.23ms min=30.68ms med=216.45ms max=441.03ms p(90)=275.47ms p(95)=281.82ms p(99.9)=351.14ms
     iterations.....................: 28560   235.805411/s
     success_rate...................: 100.00% ✓ 28560      ✗ 0    
     vus............................: 45      min=45       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

