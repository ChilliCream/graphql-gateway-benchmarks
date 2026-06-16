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
| hive-router | v0.0.65 | 2,991 | 3,168 | 2,926 | 2.6% |  |
| fusion | 16.1.4 | 2,127 | 2,173 | 2,096 | 1.1% |  |
| hive-gateway-router-runtime | 2.8.2 | 550 | 561 | 545 | 1.0% |  |
| apollo-router | v2.15.0 | 409 | 421 | 404 | 1.4% |  |
| apollo-gateway | 2.14.1 | 247 | 248 | 245 | 0.4% |  |
| hive-gateway | 2.8.2 | 241 | 245 | 239 | 1.0% |  |
| cosmo | 0.321.1 | — | — | — | — | non-compatible response (11510646 across 9/9 runs) |
| fusion-nightly | — | — | — | — | — | benchmark run failed |
| grafbase | — | — | — | — | — | benchmark run failed |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,337 | 2,471 | 2,307 | 2.3% |  |
| fusion | 16.1.4 | 1,930 | 1,989 | 1,919 | 1.2% |  |
| fusion-nightly | 16.2.0-p.1 | 1,905 | 1,956 | 1,896 | 1.0% |  |
| grafbase | 0.53.5 | 1,503 | 1,538 | 1,479 | 1.2% |  |
| cosmo | 0.321.1 | 1,159 | 1,179 | 1,155 | 0.7% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 531 | 545 | 524 | 1.2% |  |
| apollo-router | v2.15.0 | 411 | 421 | 407 | 1.2% |  |
| hive-gateway | 2.8.2 | 240 | 247 | 239 | 1.2% |  |
| apollo-gateway | 2.14.1 | 239 | 242 | 238 | 0.5% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1078560     ✗ 0     
     data_received..................: 32 GB   262 MB/s
     data_sent......................: 432 MB  3.6 MB/s
     http_req_blocked...............: avg=2.8µs    min=1.01µs  med=2.05µs  max=14.88ms  p(90)=3.2µs   p(95)=3.85µs   p(99.9)=31.44µs
     http_req_connecting............: avg=279ns    min=0s      med=0s      max=3.97ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.44ms  min=1.68ms  med=15.44ms max=300.97ms p(90)=24.4ms  p(95)=28.7ms   p(99.9)=52.4ms 
       { expected_response:true }...: avg=16.44ms  min=1.68ms  med=15.44ms max=300.97ms p(90)=24.4ms  p(95)=28.7ms   p(99.9)=52.4ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 359620
     http_req_receiving.............: avg=143.43µs min=27.84µs med=48.31µs max=105.98ms p(90)=96.72µs p(95)=281.63µs p(99.9)=15.8ms 
     http_req_sending...............: avg=61.85µs  min=5.35µs  med=8.96µs  max=214.3ms  p(90)=15.22µs p(95)=121.06µs p(99.9)=14.37ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.24ms  min=1.62ms  med=15.29ms max=300.43ms p(90)=24.11ms p(95)=28.22ms  p(99.9)=50.62ms
     http_reqs......................: 359620  2991.671057/s
     iteration_duration.............: avg=16.67ms  min=2.11ms  med=15.65ms max=328.16ms p(90)=24.64ms p(95)=28.96ms  p(99.9)=53.91ms
     iterations.....................: 359520  2990.839159/s
     success_rate...................: 100.00% ✓ 359520      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (rust subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 767544      ✗ 0     
     data_received..................: 22 GB   187 MB/s
     data_sent......................: 308 MB  2.6 MB/s
     http_req_blocked...............: avg=2.69µs   min=1µs     med=2.08µs   max=8.72ms   p(90)=3.2µs    p(95)=3.82µs   p(99.9)=29.22µs 
     http_req_connecting............: avg=231ns    min=0s      med=0s       max=3ms      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.21ms  min=2.41ms  med=14.72ms  max=328.65ms p(90)=52.1ms   p(95)=70.44ms  p(99.9)=170.57ms
       { expected_response:true }...: avg=23.21ms  min=2.41ms  med=14.72ms  max=328.65ms p(90)=52.1ms   p(95)=70.44ms  p(99.9)=170.57ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 255948
     http_req_receiving.............: avg=661.62µs min=50.99µs med=107.55µs max=168.12ms p(90)=959.52µs p(95)=1.5ms    p(99.9)=59.46ms 
     http_req_sending...............: avg=40.68µs  min=5.05µs  med=9.19µs   max=217.81ms p(90)=15.52µs  p(95)=109.67µs p(99.9)=2.33ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.51ms  min=2.31ms  med=14.19ms  max=328.15ms p(90)=50.68ms  p(95)=68.96ms  p(99.9)=168.78ms
     http_reqs......................: 255948  2127.860366/s
     iteration_duration.............: avg=23.44ms  min=3.49ms  med=14.93ms  max=359.63ms p(90)=52.33ms  p(95)=70.68ms  p(99.9)=171.25ms
     iterations.....................: 255848  2127.029002/s
     success_rate...................: 100.00% ✓ 255848      ✗ 0     
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

     checks.........................: 100.00% ✓ 198780     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   661 kB/s
     http_req_blocked...............: avg=4.18µs  min=1.16µs  med=2.84µs  max=3.32ms   p(90)=4.41µs   p(95)=5.01µs   p(99.9)=52.92µs 
     http_req_connecting............: avg=1.05µs  min=0s      med=0s      max=3.28ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.2ms  min=3.92ms  med=87.42ms max=357.9ms  p(90)=111.74ms p(95)=123.85ms p(99.9)=214.48ms
       { expected_response:true }...: avg=90.2ms  min=3.92ms  med=87.42ms max=357.9ms  p(90)=111.74ms p(95)=123.85ms p(99.9)=214.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66360
     http_req_receiving.............: avg=86.01µs min=31.57µs med=75.75µs max=111.32ms p(90)=110.11µs p(95)=122.52µs p(99.9)=795.6µs 
     http_req_sending...............: avg=25.45µs min=5.38µs  med=13.19µs max=110.53ms p(90)=20.24µs  p(95)=22.66µs  p(99.9)=822.61µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.08ms min=3.86ms  med=87.31ms max=356.93ms p(90)=111.64ms p(95)=123.72ms p(99.9)=214.24ms
     http_reqs......................: 66360   550.520261/s
     iteration_duration.............: avg=90.56ms min=20.58ms med=87.66ms max=366.11ms p(90)=112ms    p(95)=124.16ms p(99.9)=217.59ms
     iterations.....................: 66260   549.690665/s
     success_rate...................: 100.00% ✓ 66260      ✗ 0    
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

     checks.........................: 100.00% ✓ 147927     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   492 kB/s
     http_req_blocked...............: avg=5.57µs   min=1.22µs  med=3.06µs   max=4.86ms   p(90)=4.41µs   p(95)=4.98µs   p(99.9)=395.22µs
     http_req_connecting............: avg=2.22µs   min=0s      med=0s       max=4.65ms   p(90)=0s       p(95)=0s       p(99.9)=298.74µs
     http_req_duration..............: avg=121.22ms min=5.1ms   med=121.01ms max=388.19ms p(90)=146.36ms p(95)=153.87ms p(99.9)=189.37ms
       { expected_response:true }...: avg=121.22ms min=5.1ms   med=121.01ms max=388.19ms p(90)=146.36ms p(95)=153.87ms p(99.9)=189.37ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49409
     http_req_receiving.............: avg=87.43µs  min=32.77µs med=78.72µs  max=146.46ms p(90)=110µs    p(95)=121.95µs p(99.9)=766.72µs
     http_req_sending...............: avg=28.47µs  min=5.87µs  med=14.16µs  max=118.16ms p(90)=20.16µs  p(95)=22.05µs  p(99.9)=586.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=121.1ms  min=4.99ms  med=120.91ms max=378.02ms p(90)=146.25ms p(95)=153.74ms p(99.9)=188.96ms
     http_reqs......................: 49409   409.488336/s
     iteration_duration.............: avg=121.71ms min=37.65ms med=121.29ms max=397.69ms p(90)=146.6ms  p(95)=154.13ms p(99.9)=191.56ms
     iterations.....................: 49309   408.659563/s
     success_rate...................: 100.00% ✓ 49309      ✗ 0    
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

     checks.........................: 100.00% ✓ 89484      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   297 kB/s
     http_req_blocked...............: avg=6.54µs   min=1.19µs  med=3.06µs   max=4.02ms   p(90)=4.25µs   p(95)=4.71µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.34µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=1.63ms  
     http_req_duration..............: avg=200.32ms min=8.34ms  med=206.14ms max=426.15ms p(90)=213.92ms p(95)=220.02ms p(99.9)=300.78ms
       { expected_response:true }...: avg=200.32ms min=8.34ms  med=206.14ms max=426.15ms p(90)=213.92ms p(95)=220.02ms p(99.9)=300.78ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29928
     http_req_receiving.............: avg=89.79µs  min=32.78µs med=84.09µs  max=24.92ms  p(90)=114.68µs p(95)=125.03µs p(99.9)=490.54µs
     http_req_sending...............: avg=27.3µs   min=5.86µs  med=14.64µs  max=139.6ms  p(90)=19.65µs  p(95)=21.24µs  p(99.9)=504.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.2ms  min=8.21ms  med=206.03ms max=422.48ms p(90)=213.8ms  p(95)=219.89ms p(99.9)=300.3ms 
     http_reqs......................: 29928   247.2879/s
     iteration_duration.............: avg=201.25ms min=45.87ms med=206.38ms max=437.45ms p(90)=214.17ms p(95)=220.32ms p(99.9)=304.17ms
     iterations.....................: 29828   246.461624/s
     success_rate...................: 100.00% ✓ 29828      ✗ 0    
     vus............................: 23      min=23       max=50 
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

     checks.........................: 100.00% ✓ 87390      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.32µs   min=1.27µs  med=3.55µs   max=4.14ms   p(90)=4.99µs   p(95)=5.62µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.57µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=205.13ms min=6.38ms  med=189.73ms max=761.95ms p(90)=253.12ms p(95)=415.49ms p(99.9)=622.43ms
       { expected_response:true }...: avg=205.13ms min=6.38ms  med=189.73ms max=761.95ms p(90)=253.12ms p(95)=415.49ms p(99.9)=622.43ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29230
     http_req_receiving.............: avg=107.56µs min=31.73µs med=95.9µs   max=67.8ms   p(90)=127.92µs p(95)=141.09µs p(99.9)=685.56µs
     http_req_sending...............: avg=26.63µs  min=6.04µs  med=18.24µs  max=51.6ms   p(90)=23.57µs  p(95)=25.45µs  p(99.9)=534.17µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205ms    min=6.22ms  med=189.61ms max=761.84ms p(90)=252.96ms p(95)=415.29ms p(99.9)=622.34ms
     http_reqs......................: 29230   241.485851/s
     iteration_duration.............: avg=206.11ms min=37.59ms med=190.14ms max=762.2ms  p(90)=253.64ms p(95)=416.59ms p(99.9)=622.66ms
     iterations.....................: 29130   240.659693/s
     success_rate...................: 100.00% ✓ 29130      ✗ 0    
     vus............................: 21      min=21       max=50 
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

     checks.........................: 100.00% ✓ 842682      ✗ 0     
     data_received..................: 25 GB   204 MB/s
     data_sent......................: 338 MB  2.8 MB/s
     http_req_blocked...............: avg=3.09µs   min=1.03µs  med=2.29µs  max=13.23ms  p(90)=3.74µs   p(95)=4.53µs   p(99.9)=38.12µs
     http_req_connecting............: avg=359ns    min=0s      med=0s      max=3.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.12ms  min=1.63ms  med=20.71ms max=334.97ms p(90)=29.15ms  p(95)=32.05ms  p(99.9)=53.89ms
       { expected_response:true }...: avg=21.12ms  min=1.63ms  med=20.71ms max=334.97ms p(90)=29.15ms  p(95)=32.05ms  p(99.9)=53.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 280994
     http_req_receiving.............: avg=112.41µs min=26.48µs med=56.88µs max=140.47ms p(90)=105.55µs p(95)=258.52µs p(99.9)=8.07ms 
     http_req_sending...............: avg=49.11µs  min=5.19µs  med=9.97µs  max=142.88ms p(90)=17.73µs  p(95)=125.13µs p(99.9)=3.91ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.95ms  min=1.54ms  med=20.57ms max=334.11ms p(90)=28.96ms  p(95)=31.82ms  p(99.9)=52.79ms
     http_reqs......................: 280994  2337.524246/s
     iteration_duration.............: avg=21.35ms  min=3.75ms  med=20.92ms max=356.8ms  p(90)=29.37ms  p(95)=32.29ms  p(99.9)=54.4ms 
     iterations.....................: 280894  2336.692369/s
     success_rate...................: 100.00% ✓ 280894      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion (.net subgraphs) (16.1.4)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 696240      ✗ 0     
     data_received..................: 20 GB   169 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=2.96µs  min=1.02µs  med=2.15µs   max=11.77ms  p(90)=3.4µs   p(95)=4.08µs   p(99.9)=32.74µs 
     http_req_connecting............: avg=426ns   min=0s      med=0s       max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.6ms  min=1.94ms  med=17.33ms  max=552.02ms p(90)=54.59ms p(95)=71.79ms  p(99.9)=192.17ms
       { expected_response:true }...: avg=25.6ms  min=1.94ms  med=17.33ms  max=552.02ms p(90)=54.59ms p(95)=71.79ms  p(99.9)=192.17ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232180
     http_req_receiving.............: avg=688.3µs min=51.85µs med=106.24µs max=172.55ms p(90)=1.12ms  p(95)=1.79ms   p(99.9)=59.95ms 
     http_req_sending...............: avg=42.51µs min=5.18µs  med=9.45µs   max=183.49ms p(90)=17.07µs p(95)=103.17µs p(99.9)=2.82ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.87ms min=1.83ms  med=16.76ms  max=551.7ms  p(90)=53.33ms p(95)=70.31ms  p(99.9)=190.56ms
     http_reqs......................: 232180  1930.94212/s
     iteration_duration.............: avg=25.84ms min=2.41ms  med=17.55ms  max=552.28ms p(90)=54.82ms p(95)=72.02ms  p(99.9)=195.7ms 
     iterations.....................: 232080  1930.110463/s
     success_rate...................: 100.00% ✓ 232080      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: fusion-nightly (.net subgraphs) (16.2.0-p.1)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 687090      ✗ 0     
     data_received..................: 20 GB   167 MB/s
     data_sent......................: 275 MB  2.3 MB/s
     http_req_blocked...............: avg=3.45µs   min=982ns   med=2.43µs   max=14.77ms  p(90)=3.87µs  p(95)=4.61µs   p(99.9)=36.88µs 
     http_req_connecting............: avg=484ns    min=0s      med=0s       max=4.15ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.94ms  min=1.87ms  med=17.61ms  max=563.75ms p(90)=55.29ms p(95)=72.83ms  p(99.9)=188.03ms
       { expected_response:true }...: avg=25.94ms  min=1.87ms  med=17.61ms  max=563.75ms p(90)=55.29ms p(95)=72.83ms  p(99.9)=188.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 229130
     http_req_receiving.............: avg=653.12µs min=52.35µs med=108.61µs max=143.71ms p(90)=1.13ms  p(95)=1.8ms    p(99.9)=55.36ms 
     http_req_sending...............: avg=45.24µs  min=5.31µs  med=9.88µs   max=133.8ms  p(90)=18.05µs p(95)=110.23µs p(99.9)=3.02ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=25.24ms  min=1.75ms  med=17.05ms  max=563.66ms p(90)=54.04ms p(95)=71.52ms  p(99.9)=186.37ms
     http_reqs......................: 229130  1905.625628/s
     iteration_duration.............: avg=26.18ms  min=2.63ms  med=17.84ms  max=563.97ms p(90)=55.53ms p(95)=73.1ms   p(99.9)=191.45ms
     iterations.....................: 229030  1904.793949/s
     success_rate...................: 100.00% ✓ 229030      ✗ 0     
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

     checks.........................: 100.00% ✓ 542271      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 217 MB  1.8 MB/s
     http_req_blocked...............: avg=3.6µs    min=1.03µs  med=2.36µs  max=6.55ms   p(90)=4.57µs   p(95)=5.77µs   p(99.9)=44.42µs
     http_req_connecting............: avg=611ns    min=0s      med=0s      max=4.47ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.91ms  min=2.45ms  med=32.03ms max=323.81ms p(90)=43.55ms  p(95)=48.25ms  p(99.9)=89.03ms
       { expected_response:true }...: avg=32.91ms  min=2.45ms  med=32.03ms max=323.81ms p(90)=43.55ms  p(95)=48.25ms  p(99.9)=89.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180857
     http_req_receiving.............: avg=113.08µs min=30.39µs med=62.29µs max=144.24ms p(90)=134.91µs p(95)=282.77µs p(99.9)=5.38ms 
     http_req_sending...............: avg=46.68µs  min=5.53µs  med=10.41µs max=124.16ms p(90)=23.92µs  p(95)=133.89µs p(99.9)=3.3ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.75ms  min=2.33ms  med=31.89ms max=323.4ms  p(90)=43.37ms  p(95)=48.02ms  p(99.9)=88.87ms
     http_reqs......................: 180857  1503.248459/s
     iteration_duration.............: avg=33.18ms  min=3.91ms  med=32.26ms max=336.37ms p(90)=43.79ms  p(95)=48.5ms   p(99.9)=90.03ms
     iterations.....................: 180757  1502.417278/s
     success_rate...................: 100.00% ✓ 180757      ✗ 0     
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

     checks.........................: 100.00% ✓ 418155      ✗ 0     
     data_received..................: 12 GB   101 MB/s
     data_sent......................: 168 MB  1.4 MB/s
     http_req_blocked...............: avg=3.71µs  min=1.05µs  med=2.77µs  max=3.92ms   p(90)=4.35µs   p(95)=5.05µs   p(99.9)=38.22µs
     http_req_connecting............: avg=606ns   min=0s      med=0s      max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=42.78ms min=2.3ms   med=42.24ms max=328.98ms p(90)=59.89ms  p(95)=65.24ms  p(99.9)=91.73ms
       { expected_response:true }...: avg=42.78ms min=2.3ms   med=42.24ms max=328.98ms p(90)=59.89ms  p(95)=65.24ms  p(99.9)=91.73ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 139485
     http_req_receiving.............: avg=87.51µs min=28.33µs med=68.36µs max=50.69ms  p(90)=106.82µs p(95)=126.02µs p(99.9)=1.85ms 
     http_req_sending...............: avg=32.19µs min=5.46µs  med=12.03µs max=180.64ms p(90)=19.06µs  p(95)=23.05µs  p(99.9)=1.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=42.66ms min=2.18ms  med=42.13ms max=316.37ms p(90)=59.77ms  p(95)=65.1ms   p(99.9)=91.53ms
     http_reqs......................: 139485  1159.534134/s
     iteration_duration.............: avg=43.04ms min=3.99ms  med=42.46ms max=356.68ms p(90)=60.11ms  p(95)=65.46ms  p(99.9)=92.86ms
     iterations.....................: 139385  1158.702838/s
     success_rate...................: 100.00% ✓ 139385      ✗ 0     
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

     checks.........................: 100.00% ✓ 191913     ✗ 0    
     data_received..................: 5.6 GB  47 MB/s
     data_sent......................: 77 MB   638 kB/s
     http_req_blocked...............: avg=4.2µs   min=1.23µs  med=3.14µs  max=2.61ms   p(90)=4.72µs   p(95)=5.34µs   p(99.9)=50.93µs 
     http_req_connecting............: avg=770ns   min=0s      med=0s      max=2.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=93.4ms  min=4.12ms  med=90.87ms max=351.76ms p(90)=113.42ms p(95)=124.65ms p(99.9)=231.28ms
       { expected_response:true }...: avg=93.4ms  min=4.12ms  med=90.87ms max=351.76ms p(90)=113.42ms p(95)=124.65ms p(99.9)=231.28ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 64071
     http_req_receiving.............: avg=88.79µs min=32.87µs med=80.74µs max=25.86ms  p(90)=115.26µs p(95)=128.22µs p(99.9)=904.58µs
     http_req_sending...............: avg=21.92µs min=5.75µs  med=13.85µs max=83.37ms  p(90)=20.41µs  p(95)=22.61µs  p(99.9)=739.82µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=93.29ms min=4.05ms  med=90.76ms max=332.03ms p(90)=113.3ms  p(95)=124.52ms p(99.9)=231.19ms
     http_reqs......................: 64071   531.408938/s
     iteration_duration.............: avg=93.8ms  min=27.83ms med=91.12ms max=360.69ms p(90)=113.67ms p(95)=124.95ms p(99.9)=235ms   
     iterations.....................: 63971   530.579531/s
     success_rate...................: 100.00% ✓ 63971      ✗ 0    
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

     checks.........................: 100.00% ✓ 148680     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 60 MB   494 kB/s
     http_req_blocked...............: avg=5.57µs   min=1.19µs  med=3.64µs   max=3.91ms   p(90)=5.19µs   p(95)=5.79µs   p(99.9)=148.69µs
     http_req_connecting............: avg=1.64µs   min=0s      med=0s       max=3.88ms   p(90)=0s       p(95)=0s       p(99.9)=64.98µs 
     http_req_duration..............: avg=120.59ms min=5.72ms  med=118.3ms  max=367.05ms p(90)=159.35ms p(95)=170.84ms p(99.9)=215.66ms
       { expected_response:true }...: avg=120.59ms min=5.72ms  med=118.3ms  max=367.05ms p(90)=159.35ms p(95)=170.84ms p(99.9)=215.66ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 49660
     http_req_receiving.............: avg=125.75µs min=31.56µs med=87.89µs  max=112.97ms p(90)=119.99µs p(95)=132.49µs p(99.9)=1.18ms  
     http_req_sending...............: avg=28.54µs  min=5.65µs  med=16.27µs  max=188.48ms p(90)=21.82µs  p(95)=23.79µs  p(99.9)=704.39µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.43ms min=5.56ms  med=118.18ms max=253.65ms p(90)=159.23ms p(95)=170.68ms p(99.9)=214.54ms
     http_reqs......................: 49660   411.320861/s
     iteration_duration.............: avg=121.1ms  min=7.22ms  med=118.62ms max=367.4ms  p(90)=159.65ms p(95)=171.17ms p(99.9)=219.87ms
     iterations.....................: 49560   410.492587/s
     success_rate...................: 100.00% ✓ 49560      ✗ 0    
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

     checks.........................: 100.00% ✓ 87165      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   289 kB/s
     http_req_blocked...............: avg=5.39µs   min=1.23µs  med=3.55µs   max=2.36ms   p(90)=5.04µs   p(95)=5.65µs   p(99.9)=736.82µs
     http_req_connecting............: avg=1.53µs   min=0s      med=0s       max=2.33ms   p(90)=0s       p(95)=0s       p(99.9)=641.17µs
     http_req_duration..............: avg=205.65ms min=6.63ms  med=187.68ms max=757.51ms p(90)=239.33ms p(95)=277.71ms p(99.9)=672.58ms
       { expected_response:true }...: avg=205.65ms min=6.63ms  med=187.68ms max=757.51ms p(90)=239.33ms p(95)=277.71ms p(99.9)=672.58ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29155
     http_req_receiving.............: avg=107.26µs min=36.26µs med=99.16µs  max=75.54ms  p(90)=130.44µs p(95)=144.01µs p(99.9)=637.78µs
     http_req_sending...............: avg=29.15µs  min=6.24µs  med=17.8µs   max=135.91ms p(90)=22.99µs  p(95)=24.71µs  p(99.9)=543.85µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=205.52ms min=6.47ms  med=187.55ms max=757.42ms p(90)=239.18ms p(95)=277.43ms p(99.9)=672.47ms
     http_reqs......................: 29155   240.880083/s
     iteration_duration.............: avg=206.62ms min=37.56ms med=188.09ms max=757.7ms  p(90)=239.75ms p(95)=279.42ms p(99.9)=672.84ms
     iterations.....................: 29055   240.053878/s
     success_rate...................: 100.00% ✓ 29055      ✗ 0    
     vus............................: 25      min=25       max=50 
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

     checks.........................: 100.00% ✓ 86616      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   287 kB/s
     http_req_blocked...............: avg=6.27µs   min=1.32µs  med=3.49µs   max=3.66ms   p(90)=4.87µs   p(95)=5.46µs   p(99.9)=914.87µs
     http_req_connecting............: avg=2.57µs   min=0s      med=0s       max=3.63ms   p(90)=0s       p(95)=0s       p(99.9)=889.67µs
     http_req_duration..............: avg=206.99ms min=8.72ms  med=209.1ms  max=400.2ms  p(90)=217.52ms p(95)=224.23ms p(99.9)=298.33ms
       { expected_response:true }...: avg=206.99ms min=8.72ms  med=209.1ms  max=400.2ms  p(90)=217.52ms p(95)=224.23ms p(99.9)=298.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28972
     http_req_receiving.............: avg=100.01µs min=35.19µs med=95.37µs  max=7.04ms   p(90)=127.32µs p(95)=140.46µs p(99.9)=658.69µs
     http_req_sending...............: avg=21.38µs  min=6.07µs  med=17.33µs  max=13.2ms   p(90)=22.29µs  p(95)=24.11µs  p(99.9)=760.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.86ms min=8.53ms  med=208.98ms max=400.01ms p(90)=217.4ms  p(95)=224.1ms  p(99.9)=298.25ms
     http_reqs......................: 28972   239.230494/s
     iteration_duration.............: avg=207.94ms min=45.7ms  med=209.59ms max=406.33ms p(90)=217.79ms p(95)=224.49ms p(99.9)=299.13ms
     iterations.....................: 28872   238.404764/s
     success_rate...................: 100.00% ✓ 28872      ✗ 0    
     vus............................: 46      min=46       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-181-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

