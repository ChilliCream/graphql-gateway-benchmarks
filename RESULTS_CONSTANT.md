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
| hive-router | v0.0.49 | 2,889 | 3,082 | 2,866 | 2.6% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,140 | 2,175 | 2,127 | 0.8% |  |
| grafbase | 0.53.3 | 2,061 | 2,101 | 2,024 | 1.2% |  |
| cosmo | 0.307.0 | 1,255 | 1,273 | 1,246 | 0.7% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 541 | 553 | 535 | 1.0% |  |
| apollo-router | v2.13.1 | 424 | 433 | 411 | 1.6% |  |
| hive-gateway | 2.5.25 | 252 | 257 | 250 | 0.9% |  |
| apollo-gateway | 2.13.3 | 238 | 240 | 236 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,362 | 2,499 | 2,322 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,968 | 2,011 | 1,756 | 3.9% |  |
| grafbase | 0.53.3 | 1,538 | 1,582 | 1,527 | 1.2% |  |
| cosmo | 0.307.0 | 1,172 | 1,197 | 1,165 | 1.1% | non-compatible response (4 across 4/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 521 | 533 | 516 | 1.2% |  |
| apollo-router | v2.13.1 | 385 | 396 | 382 | 1.3% |  |
| hive-gateway | 2.5.25 | 244 | 250 | 242 | 1.1% |  |
| apollo-gateway | 2.13.3 | 233 | 235 | 231 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1041594     ✗ 0     
     data_received..................: 31 GB   253 MB/s
     data_sent......................: 417 MB  3.5 MB/s
     http_req_blocked...............: avg=2.95µs   min=1µs     med=2.05µs  max=24.9ms   p(90)=3.14µs  p(95)=3.77µs   p(99.9)=31.59µs
     http_req_connecting............: avg=320ns    min=0s      med=0s      max=4.92ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.04ms  min=1.63ms  med=16.19ms max=327.02ms p(90)=25.11ms p(95)=28.64ms  p(99.9)=50.87ms
       { expected_response:true }...: avg=17.04ms  min=1.63ms  med=16.19ms max=327.02ms p(90)=25.11ms p(95)=28.64ms  p(99.9)=50.87ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 347298
     http_req_receiving.............: avg=128.79µs min=27.88µs med=51.41µs max=148.4ms  p(90)=98.59µs p(95)=272.16µs p(99.9)=13.49ms
     http_req_sending...............: avg=56.8µs   min=5.2µs   med=9.12µs  max=150.51ms p(90)=15.45µs p(95)=122.66µs p(99.9)=6.36ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.85ms  min=1.57ms  med=16.04ms max=326.41ms p(90)=24.86ms p(95)=28.3ms   p(99.9)=49.1ms 
     http_reqs......................: 347298  2889.299104/s
     iteration_duration.............: avg=17.27ms  min=2.14ms  med=16.4ms  max=365.09ms p(90)=25.34ms p(95)=28.91ms  p(99.9)=52.18ms
     iterations.....................: 347198  2888.467167/s
     success_rate...................: 100.00% ✓ 347198      ✗ 0     
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

     checks.........................: 100.00% ✓ 771948      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 309 MB  2.6 MB/s
     http_req_blocked...............: avg=3.05µs   min=1.05µs  med=2.24µs   max=13.44ms  p(90)=3.45µs   p(95)=4.06µs   p(99.9)=35.03µs 
     http_req_connecting............: avg=357ns    min=0s      med=0s       max=3.81ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.07ms  min=2.44ms  med=14.6ms   max=345.17ms p(90)=51.68ms  p(95)=69.99ms  p(99.9)=168.44ms
       { expected_response:true }...: avg=23.07ms  min=2.44ms  med=14.6ms   max=345.17ms p(90)=51.68ms  p(95)=69.99ms  p(99.9)=168.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 257416
     http_req_receiving.............: avg=679.81µs min=51.43µs med=111.08µs max=170ms    p(90)=968.79µs p(95)=1.5ms    p(99.9)=62.77ms 
     http_req_sending...............: avg=45.16µs  min=5.24µs  med=9.36µs   max=189.92ms p(90)=15.85µs  p(95)=111.21µs p(99.9)=3.3ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.35ms  min=2.3ms   med=14.1ms   max=344.75ms p(90)=50.26ms  p(95)=68.5ms   p(99.9)=165.28ms
     http_reqs......................: 257416  2140.052246/s
     iteration_duration.............: avg=23.3ms   min=3.2ms   med=14.82ms  max=345.41ms p(90)=51.92ms  p(95)=70.24ms  p(99.9)=169.66ms
     iterations.....................: 257316  2139.220887/s
     success_rate...................: 100.00% ✓ 257316      ✗ 0     
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

     checks.........................: 100.00% ✓ 743400      ✗ 0     
     data_received..................: 22 GB   181 MB/s
     data_sent......................: 298 MB  2.5 MB/s
     http_req_blocked...............: avg=3.55µs   min=1.01µs  med=2.51µs  max=15.03ms  p(90)=4µs      p(95)=4.78µs   p(99.9)=43.97µs
     http_req_connecting............: avg=389ns    min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.96ms  min=1.99ms  med=23.7ms  max=320.86ms p(90)=28.91ms  p(95)=31.35ms  p(99.9)=55.04ms
       { expected_response:true }...: avg=23.96ms  min=1.99ms  med=23.7ms  max=320.86ms p(90)=28.91ms  p(95)=31.35ms  p(99.9)=55.04ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 247900
     http_req_receiving.............: avg=119.79µs min=26.64µs med=59.65µs max=134ms    p(90)=105.24µs p(95)=213.86µs p(99.9)=11.03ms
     http_req_sending...............: avg=50.03µs  min=5.33µs  med=10.36µs max=193.3ms  p(90)=18.11µs  p(95)=120.66µs p(99.9)=4.13ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.79ms  min=1.88ms  med=23.58ms max=320.25ms p(90)=28.72ms  p(95)=31.09ms  p(99.9)=54.02ms
     http_reqs......................: 247900  2061.236848/s
     iteration_duration.............: avg=24.2ms   min=3.52ms  med=23.92ms max=333.22ms p(90)=29.14ms  p(95)=31.6ms   p(99.9)=55.94ms
     iterations.....................: 247800  2060.405369/s
     success_rate...................: 100.00% ✓ 247800      ✗ 0     
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

     checks.........................: 100.00% ✓ 452907      ✗ 0     
     data_received..................: 13 GB   110 MB/s
     data_sent......................: 182 MB  1.5 MB/s
     http_req_blocked...............: avg=3.06µs   min=1.01µs  med=2.37µs  max=2.89ms   p(90)=3.7µs   p(95)=4.31µs  p(99.9)=35.37µs
     http_req_connecting............: avg=371ns    min=0s      med=0s      max=2.85ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=39.51ms  min=2.11ms  med=38.95ms max=352.91ms p(90)=55.83ms p(95)=60.78ms p(99.9)=83.57ms
       { expected_response:true }...: avg=39.51ms  min=2.11ms  med=38.95ms max=352.91ms p(90)=55.83ms p(95)=60.78ms p(99.9)=83.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151069
     http_req_receiving.............: avg=114.13µs min=29.28µs med=61.23µs max=264.76ms p(90)=96.11µs p(95)=113.7µs p(99.9)=2.14ms 
     http_req_sending...............: avg=26.96µs  min=5.3µs   med=10.48µs max=240.1ms  p(90)=15.66µs p(95)=19.64µs p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=39.37ms  min=2.05ms  med=38.85ms max=105.84ms p(90)=55.72ms p(95)=60.66ms p(99.9)=83.33ms
     http_reqs......................: 151069  1255.973981/s
     iteration_duration.............: avg=39.74ms  min=3.79ms  med=39.16ms max=368.82ms p(90)=56.04ms p(95)=60.99ms p(99.9)=83.87ms
     iterations.....................: 150969  1255.14259/s
     success_rate...................: 100.00% ✓ 150969      ✗ 0     
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

     checks.........................: 100.00% ✓ 195624     ✗ 0    
     data_received..................: 5.7 GB  48 MB/s
     data_sent......................: 78 MB   651 kB/s
     http_req_blocked...............: avg=4.33µs   min=1.18µs  med=2.89µs  max=3.73ms   p(90)=4.42µs   p(95)=5.07µs   p(99.9)=45.7µs  
     http_req_connecting............: avg=1.1µs    min=0s      med=0s      max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.64ms  min=4.07ms  med=88.9ms  max=309.88ms p(90)=110.7ms  p(95)=122ms    p(99.9)=213.42ms
       { expected_response:true }...: avg=91.64ms  min=4.07ms  med=88.9ms  max=309.88ms p(90)=110.7ms  p(95)=122ms    p(99.9)=213.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65308
     http_req_receiving.............: avg=135.21µs min=31.47µs med=77.11µs max=208.54ms p(90)=112.12µs p(95)=124.99µs p(99.9)=1.67ms  
     http_req_sending...............: avg=21.58µs  min=5.51µs  med=13.28µs max=68.53ms  p(90)=20.07µs  p(95)=22.49µs  p(99.9)=732.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.49ms  min=4.01ms  med=88.78ms max=289.05ms p(90)=110.54ms p(95)=121.71ms p(99.9)=211.68ms
     http_reqs......................: 65308   541.715198/s
     iteration_duration.............: avg=92.03ms  min=10.67ms med=89.13ms max=329.49ms p(90)=110.96ms p(95)=122.3ms  p(99.9)=216.19ms
     iterations.....................: 65208   540.88572/s
     success_rate...................: 100.00% ✓ 65208      ✗ 0    
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

     checks.........................: 100.00% ✓ 153270     ✗ 0    
     data_received..................: 4.5 GB  37 MB/s
     data_sent......................: 62 MB   509 kB/s
     http_req_blocked...............: avg=5.83µs   min=1.27µs  med=3.56µs   max=4.55ms   p(90)=5µs      p(95)=5.57µs   p(99.9)=134.67µs
     http_req_connecting............: avg=2.05µs   min=0s      med=0s       max=4.52ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=116.98ms min=5.52ms  med=116.63ms max=381.18ms p(90)=141.17ms p(95)=148.68ms p(99.9)=185.75ms
       { expected_response:true }...: avg=116.98ms min=5.52ms  med=116.63ms max=381.18ms p(90)=141.17ms p(95)=148.68ms p(99.9)=185.75ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51190
     http_req_receiving.............: avg=175.13µs min=32.73µs med=86.78µs  max=210.51ms p(90)=118.13µs p(95)=130.28µs p(99.9)=1.31ms  
     http_req_sending...............: avg=29.89µs  min=5.96µs  med=16.23µs  max=217.02ms p(90)=21.66µs  p(95)=23.44µs  p(99.9)=623.27µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=116.77ms min=5.33ms  med=116.5ms  max=199.74ms p(90)=141.04ms p(95)=148.52ms p(99.9)=177.47ms
     http_reqs......................: 51190   424.078698/s
     iteration_duration.............: avg=117.47ms min=8.54ms  med=116.92ms max=391.52ms p(90)=141.45ms p(95)=148.94ms p(99.9)=190.82ms
     iterations.....................: 51090   423.250258/s
     success_rate...................: 100.00% ✓ 51090      ✗ 0    
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

     checks.........................: 100.00% ✓ 91395      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   303 kB/s
     http_req_blocked...............: avg=6.52µs   min=1.19µs  med=3.52µs   max=4.09ms   p(90)=4.93µs   p(95)=5.56µs   p(99.9)=1.09ms  
     http_req_connecting............: avg=2.83µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=1.07ms  
     http_req_duration..............: avg=196.17ms min=6.15ms  med=179.56ms max=635.8ms  p(90)=233.03ms p(95)=390.97ms p(99.9)=544.61ms
       { expected_response:true }...: avg=196.17ms min=6.15ms  med=179.56ms max=635.8ms  p(90)=233.03ms p(95)=390.97ms p(99.9)=544.61ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30565
     http_req_receiving.............: avg=99.53µs  min=33.76µs med=94.4µs   max=38.31ms  p(90)=125.96µs p(95)=139.61µs p(99.9)=567µs   
     http_req_sending...............: avg=29.87µs  min=6.22µs  med=17.45µs  max=92.36ms  p(90)=22.84µs  p(95)=24.82µs  p(99.9)=600.67µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.04ms min=6.06ms  med=179.43ms max=635.69ms p(90)=232.93ms p(95)=390.65ms p(99.9)=544.53ms
     http_reqs......................: 30565   252.604078/s
     iteration_duration.............: avg=197.06ms min=28.61ms med=179.91ms max=636.06ms p(90)=233.45ms p(95)=391.8ms  p(99.9)=544.91ms
     iterations.....................: 30465   251.777629/s
     success_rate...................: 100.00% ✓ 30465      ✗ 0    
     vus............................: 6       min=6        max=50 
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

     checks.........................: 100.00% ✓ 86436      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=7.02µs   min=1.31µs  med=3.32µs   max=4.13ms   p(90)=4.57µs   p(95)=5.1µs    p(99.9)=1.85ms  
     http_req_connecting............: avg=3.53µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.71ms  
     http_req_duration..............: avg=207.41ms min=8.41ms  med=204.89ms max=411.85ms p(90)=221.95ms p(95)=237.76ms p(99.9)=303.2ms 
       { expected_response:true }...: avg=207.41ms min=8.41ms  med=204.89ms max=411.85ms p(90)=221.95ms p(95)=237.76ms p(99.9)=303.2ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 28912
     http_req_receiving.............: avg=103.1µs  min=34.9µs  med=89.67µs  max=176.7ms  p(90)=120.42µs p(95)=132.32µs p(99.9)=572.23µs
     http_req_sending...............: avg=30.62µs  min=6.1µs   med=16.34µs  max=155.96ms p(90)=21.2µs   p(95)=23.01µs  p(99.9)=614.64µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=207.28ms min=8.32ms  med=204.78ms max=396.74ms p(90)=221.84ms p(95)=237.61ms p(99.9)=302.46ms
     http_reqs......................: 28912   238.758985/s
     iteration_duration.............: avg=208.38ms min=30.65ms med=205.18ms max=428.67ms p(90)=222.26ms p(95)=238.31ms p(99.9)=304.71ms
     iterations.....................: 28812   237.933173/s
     success_rate...................: 100.00% ✓ 28812      ✗ 0    
     vus............................: 41      min=41       max=50 
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

     checks.........................: 100.00% ✓ 851817      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 341 MB  2.8 MB/s
     http_req_blocked...............: avg=3.11µs   min=982ns   med=2.17µs  max=9.64ms   p(90)=3.61µs   p(95)=4.43µs   p(99.9)=33.07µs
     http_req_connecting............: avg=434ns    min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.89ms  min=1.84ms  med=20.4ms  max=326.1ms  p(90)=28.9ms   p(95)=31.93ms  p(99.9)=54.07ms
       { expected_response:true }...: avg=20.89ms  min=1.84ms  med=20.4ms  max=326.1ms  p(90)=28.9ms   p(95)=31.93ms  p(99.9)=54.07ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284039
     http_req_receiving.............: avg=114.89µs min=28.11µs med=55.53µs max=43.96ms  p(90)=104.17µs p(95)=256.16µs p(99.9)=9.31ms 
     http_req_sending...............: avg=51.62µs  min=5.13µs  med=9.68µs  max=106.86ms p(90)=17.62µs  p(95)=123.7µs  p(99.9)=5.47ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.72ms  min=1.75ms  med=20.26ms max=306.92ms p(90)=28.7ms   p(95)=31.67ms  p(99.9)=53.33ms
     http_reqs......................: 284039  2362.304138/s
     iteration_duration.............: avg=21.12ms  min=3.14ms  med=20.62ms max=339.37ms p(90)=29.13ms  p(95)=32.17ms  p(99.9)=54.51ms
     iterations.....................: 283939  2361.472455/s
     success_rate...................: 100.00% ✓ 283939      ✗ 0     
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

     checks.........................: 100.00% ✓ 709827      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 284 MB  2.4 MB/s
     http_req_blocked...............: avg=3.94µs   min=992ns   med=2.21µs   max=11.21ms  p(90)=3.76µs  p(95)=4.55µs   p(99.9)=34.52µs 
     http_req_connecting............: avg=1.18µs   min=0s      med=0s       max=11.14ms  p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.11ms  min=1.9ms   med=17.27ms  max=574.76ms p(90)=52.98ms p(95)=70.17ms  p(99.9)=192.81ms
       { expected_response:true }...: avg=25.11ms  min=1.9ms   med=17.27ms  max=574.76ms p(90)=52.98ms p(95)=70.17ms  p(99.9)=192.81ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236709
     http_req_receiving.............: avg=693.54µs min=50.89µs med=106.76µs max=488.5ms  p(90)=1.13ms  p(95)=1.81ms   p(99.9)=60.1ms  
     http_req_sending...............: avg=42.26µs  min=5.19µs  med=9.55µs   max=147.83ms p(90)=18.24µs p(95)=103.56µs p(99.9)=2.44ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.37ms  min=1.78ms  med=16.71ms  max=574.66ms p(90)=51.58ms p(95)=68.65ms  p(99.9)=189.66ms
     http_reqs......................: 236709  1968.056018/s
     iteration_duration.............: avg=25.34ms  min=2.85ms  med=17.49ms  max=574.93ms p(90)=53.22ms p(95)=70.41ms  p(99.9)=195.1ms 
     iterations.....................: 236609  1967.224593/s
     success_rate...................: 100.00% ✓ 236609      ✗ 0     
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

     checks.........................: 100.00% ✓ 554838      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 222 MB  1.8 MB/s
     http_req_blocked...............: avg=3.68µs   min=1µs     med=2.36µs  max=4.74ms   p(90)=4.69µs   p(95)=5.85µs   p(99.9)=42.56µs
     http_req_connecting............: avg=694ns    min=0s      med=0s      max=4.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.16ms  min=2.39ms  med=31.19ms max=323.29ms p(90)=42.79ms  p(95)=47.7ms   p(99.9)=88.91ms
       { expected_response:true }...: avg=32.16ms  min=2.39ms  med=31.19ms max=323.29ms p(90)=42.79ms  p(95)=47.7ms   p(99.9)=88.91ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185046
     http_req_receiving.............: avg=113.91µs min=28.58µs med=61.5µs  max=104.87ms p(90)=134.74µs p(95)=284.7µs  p(99.9)=6.09ms 
     http_req_sending...............: avg=48.25µs  min=5.24µs  med=10.31µs max=149.43ms p(90)=24.4µs   p(95)=134.04µs p(99.9)=3.93ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32ms     min=2.28ms  med=31.06ms max=302.03ms p(90)=42.6ms   p(95)=47.46ms  p(99.9)=88.34ms
     http_reqs......................: 185046  1538.19915/s
     iteration_duration.............: avg=32.43ms  min=3.8ms   med=31.43ms max=363.45ms p(90)=43.03ms  p(95)=47.95ms  p(99.9)=90.45ms
     iterations.....................: 184946  1537.367897/s
     success_rate...................: 100.00% ✓ 184946      ✗ 0     
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

     checks.........................: 100.00% ✓ 422808      ✗ 0     
     data_received..................: 12 GB   103 MB/s
     data_sent......................: 169 MB  1.4 MB/s
     http_req_blocked...............: avg=3.23µs  min=1µs     med=2.6µs   max=2.53ms   p(90)=4.16µs   p(95)=4.81µs   p(99.9)=35.36µs
     http_req_connecting............: avg=303ns   min=0s      med=0s      max=2.49ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.31ms min=2.28ms  med=41.75ms max=331.93ms p(90)=59.57ms  p(95)=65.01ms  p(99.9)=91.85ms
       { expected_response:true }...: avg=42.31ms min=2.28ms  med=41.75ms max=331.93ms p(90)=59.57ms  p(95)=65.01ms  p(99.9)=91.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 141036
     http_req_receiving.............: avg=83.45µs min=28.91µs med=66.67µs max=45.36ms  p(90)=104.55µs p(95)=122.09µs p(99.9)=1.42ms 
     http_req_sending...............: avg=28.71µs min=5.41µs  med=11.59µs max=169.22ms p(90)=17.89µs  p(95)=21.58µs  p(99.9)=1.22ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.2ms  min=2.18ms  med=41.64ms max=331.68ms p(90)=59.46ms  p(95)=64.89ms  p(99.9)=91.12ms
     http_reqs......................: 141036  1172.418035/s
     iteration_duration.............: avg=42.56ms min=4.75ms  med=41.97ms max=354.02ms p(90)=59.79ms  p(95)=65.23ms  p(99.9)=92.53ms
     iterations.....................: 140936  1171.586745/s
     success_rate...................: 100.00% ✓ 140936      ✗ 0     
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

     checks.........................: 100.00% ✓ 188517     ✗ 0    
     data_received..................: 5.5 GB  46 MB/s
     data_sent......................: 76 MB   627 kB/s
     http_req_blocked...............: avg=5.04µs  min=1.2µs   med=3.2µs   max=3.93ms   p(90)=4.71µs   p(95)=5.33µs   p(99.9)=59.95µs 
     http_req_connecting............: avg=1.6µs   min=0s      med=0s      max=3.89ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.09ms min=4.33ms  med=92.58ms max=386.14ms p(90)=115.62ms p(95)=128.65ms p(99.9)=226.81ms
       { expected_response:true }...: avg=95.09ms min=4.33ms  med=92.58ms max=386.14ms p(90)=115.62ms p(95)=128.65ms p(99.9)=226.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62939
     http_req_receiving.............: avg=91.73µs min=32.5µs  med=81.62µs max=100.99ms p(90)=115.87µs p(95)=128.95µs p(99.9)=832.86µs
     http_req_sending...............: avg=28.95µs min=5.81µs  med=14.12µs max=106.38ms p(90)=20.9µs   p(95)=23.04µs  p(99.9)=680.88µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.97ms min=4.2ms   med=92.47ms max=385.37ms p(90)=115.49ms p(95)=128.47ms p(99.9)=226.69ms
     http_reqs......................: 62939   521.961149/s
     iteration_duration.............: avg=95.49ms min=16.92ms med=92.83ms max=396.62ms p(90)=115.86ms p(95)=128.96ms p(99.9)=231.3ms 
     iterations.....................: 62839   521.131836/s
     success_rate...................: 100.00% ✓ 62839      ✗ 0    
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

     checks.........................: 100.00% ✓ 139440     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 56 MB   463 kB/s
     http_req_blocked...............: avg=6.13µs   min=1.21µs  med=3.62µs   max=4.17ms   p(90)=5.11µs   p(95)=5.72µs   p(99.9)=250.36µs
     http_req_connecting............: avg=2.33µs   min=0s      med=0s       max=4.13ms   p(90)=0s       p(95)=0s       p(99.9)=204.63µs
     http_req_duration..............: avg=128.57ms min=5.87ms  med=125.9ms  max=337.45ms p(90)=170.24ms p(95)=182.79ms p(99.9)=234.89ms
       { expected_response:true }...: avg=128.57ms min=5.87ms  med=125.9ms  max=337.45ms p(90)=170.24ms p(95)=182.79ms p(99.9)=234.89ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46580
     http_req_receiving.............: avg=96.82µs  min=34.05µs med=90.1µs   max=123.71ms p(90)=121µs    p(95)=133.79µs p(99.9)=701.3µs 
     http_req_sending...............: avg=30.66µs  min=6µs     med=17.04µs  max=127.21ms p(90)=22.25µs  p(95)=24.15µs  p(99.9)=627.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.44ms min=5.74ms  med=125.78ms max=336.93ms p(90)=170.12ms p(95)=182.66ms p(99.9)=234.64ms
     http_reqs......................: 46580   385.760899/s
     iteration_duration.............: avg=129.11ms min=37.47ms med=126.21ms max=375.36ms p(90)=170.55ms p(95)=183.09ms p(99.9)=238.13ms
     iterations.....................: 46480   384.932731/s
     success_rate...................: 100.00% ✓ 46480      ✗ 0    
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

     checks.........................: 100.00% ✓ 88317      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=5.26µs   min=1.2µs   med=3.64µs   max=2.32ms   p(90)=5.07µs   p(95)=5.64µs   p(99.9)=594.61µs
     http_req_connecting............: avg=1.42µs   min=0s      med=0s       max=2.28ms   p(90)=0s       p(95)=0s       p(99.9)=562.89µs
     http_req_duration..............: avg=202.99ms min=6.56ms  med=185.92ms max=703.16ms p(90)=242.66ms p(95)=394.11ms p(99.9)=547.23ms
       { expected_response:true }...: avg=202.99ms min=6.56ms  med=185.92ms max=703.16ms p(90)=242.66ms p(95)=394.11ms p(99.9)=547.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29539
     http_req_receiving.............: avg=103.01µs min=33.3µs  med=98.62µs  max=22.51ms  p(90)=130.18µs p(95)=143.67µs p(99.9)=583.64µs
     http_req_sending...............: avg=26.13µs  min=6.15µs  med=18.1µs   max=31.47ms  p(90)=23.16µs  p(95)=24.86µs  p(99.9)=556.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.86ms min=6.35ms  med=185.77ms max=703.04ms p(90)=242.55ms p(95)=393.99ms p(99.9)=547.11ms
     http_reqs......................: 29539   244.040204/s
     iteration_duration.............: avg=203.94ms min=39.34ms med=186.28ms max=703.42ms p(90)=243.11ms p(95)=394.8ms  p(99.9)=547.5ms 
     iterations.....................: 29439   243.214041/s
     success_rate...................: 100.00% ✓ 29439      ✗ 0    
     vus............................: 20      min=20       max=50 
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

     checks.........................: 100.00% ✓ 84678      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=6.03µs   min=1.26µs  med=3.54µs   max=3.16ms   p(90)=4.88µs   p(95)=5.44µs   p(99.9)=1.02ms  
     http_req_connecting............: avg=2.29µs   min=0s      med=0s       max=3.13ms   p(90)=0s       p(95)=0s       p(99.9)=999.64µs
     http_req_duration..............: avg=211.69ms min=8.83ms  med=200.35ms max=428.55ms p(90)=248.13ms p(95)=256.16ms p(99.9)=327.74ms
       { expected_response:true }...: avg=211.69ms min=8.83ms  med=200.35ms max=428.55ms p(90)=248.13ms p(95)=256.16ms p(99.9)=327.74ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28326
     http_req_receiving.............: avg=104.94µs min=36.48µs med=95.52µs  max=75.55ms  p(90)=127.39µs p(95)=141.04µs p(99.9)=757.33µs
     http_req_sending...............: avg=28.17µs  min=6.02µs  med=17.66µs  max=69.1ms   p(90)=22.45µs  p(95)=24.26µs  p(99.9)=930.28µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.55ms min=8.67ms  med=200.16ms max=428.19ms p(90)=248.02ms p(95)=256.05ms p(99.9)=326.9ms 
     http_reqs......................: 28326   233.888276/s
     iteration_duration.............: avg=212.71ms min=43.08ms med=204.24ms max=437.62ms p(90)=248.47ms p(95)=256.51ms p(99.9)=341.21ms
     iterations.....................: 28226   233.062574/s
     success_rate...................: 100.00% ✓ 28226      ✗ 0    
     vus............................: 44      min=44       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

