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
| hive-router | v0.0.49 | 2,870 | 3,062 | 2,755 | 3.5% |  |
| hotchocolate | 16.1.0-p.1.10 | 2,150 | 2,197 | 2,135 | 0.9% |  |
| grafbase | 0.53.3 | 2,019 | 2,083 | 2,001 | 1.5% |  |
| cosmo | 0.307.0 | 1,267 | 1,284 | 1,257 | 0.7% |  |
| hive-gateway-router-runtime | 2.5.25 | 548 | 559 | 544 | 0.9% |  |
| apollo-router | v2.13.1 | 397 | 410 | 392 | 1.6% |  |
| hive-gateway | 2.5.25 | 255 | 261 | 254 | 1.1% |  |
| apollo-gateway | 2.13.3 | 250 | 253 | 249 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,372 | 2,492 | 2,335 | 2.2% |  |
| hotchocolate | 16.1.0-p.1.10 | 1,970 | 2,013 | 1,950 | 1.1% |  |
| grafbase | 0.53.3 | 1,507 | 1,532 | 1,481 | 1.0% |  |
| cosmo | 0.307.0 | 1,205 | 1,228 | 1,198 | 0.9% |  |
| hive-gateway-router-runtime | 2.5.25 | 526 | 538 | 521 | 1.2% |  |
| apollo-router | v2.13.1 | 377 | 382 | 374 | 0.7% |  |
| hive-gateway | 2.5.25 | 253 | 258 | 250 | 1.1% |  |
| apollo-gateway | 2.13.3 | 242 | 243 | 240 | 0.4% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1034610     ✗ 0     
     data_received..................: 30 GB   252 MB/s
     data_sent......................: 415 MB  3.4 MB/s
     http_req_blocked...............: avg=2.8µs    min=952ns   med=2.05µs  max=9.87ms   p(90)=3.17µs  p(95)=3.79µs   p(99.9)=31.48µs
     http_req_connecting............: avg=338ns    min=0s      med=0s      max=4.66ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.16ms  min=1.69ms  med=16.29ms max=321.58ms p(90)=25.15ms p(95)=29.06ms  p(99.9)=52.05ms
       { expected_response:true }...: avg=17.16ms  min=1.69ms  med=16.29ms max=321.58ms p(90)=25.15ms p(95)=29.06ms  p(99.9)=52.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 344970
     http_req_receiving.............: avg=130.74µs min=26.94µs med=48.4µs  max=189.35ms p(90)=92.77µs p(95)=262.3µs  p(99.9)=14.88ms
     http_req_sending...............: avg=56.66µs  min=5.24µs  med=8.89µs  max=274.85ms p(90)=14.87µs p(95)=119.32µs p(99.9)=8.09ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.97ms  min=1.6ms   med=16.15ms max=320.74ms p(90)=24.89ms p(95)=28.67ms  p(99.9)=50.1ms 
     http_reqs......................: 344970  2870.003621/s
     iteration_duration.............: avg=17.38ms  min=1.97ms  med=16.49ms max=331.67ms p(90)=25.38ms p(95)=29.33ms  p(99.9)=53.11ms
     iterations.....................: 344870  2869.171664/s
     success_rate...................: 100.00% ✓ 344870      ✗ 0     
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

     checks.........................: 100.00% ✓ 775761      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=2.9µs    min=961ns   med=2.07µs   max=15.51ms  p(90)=3.22µs   p(95)=3.83µs   p(99.9)=32.72µs 
     http_req_connecting............: avg=381ns    min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.96ms  min=2.48ms  med=14.58ms  max=352.91ms p(90)=51.51ms  p(95)=69.71ms  p(99.9)=168.46ms
       { expected_response:true }...: avg=22.96ms  min=2.48ms  med=14.58ms  max=352.91ms p(90)=51.51ms  p(95)=69.71ms  p(99.9)=168.46ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258687
     http_req_receiving.............: avg=638.21µs min=50.45µs med=108.86µs max=275.09ms p(90)=937.97µs p(95)=1.44ms   p(99.9)=58.01ms 
     http_req_sending...............: avg=41.19µs  min=5.17µs  med=9.09µs   max=160.39ms p(90)=15.31µs  p(95)=106.32µs p(99.9)=2.52ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.28ms  min=2.37ms  med=14.08ms  max=350.57ms p(90)=50.16ms  p(95)=68.31ms  p(99.9)=165.77ms
     http_reqs......................: 258687  2150.317873/s
     iteration_duration.............: avg=23.19ms  min=3.4ms   med=14.79ms  max=353.13ms p(90)=51.74ms  p(95)=69.95ms  p(99.9)=170.05ms
     iterations.....................: 258587  2149.486629/s
     success_rate...................: 100.00% ✓ 258587      ✗ 0     
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

     checks.........................: 100.00% ✓ 728391      ✗ 0     
     data_received..................: 21 GB   178 MB/s
     data_sent......................: 292 MB  2.4 MB/s
     http_req_blocked...............: avg=3.07µs   min=992ns   med=2.2µs   max=21.94ms  p(90)=3.61µs  p(95)=4.37µs   p(99.9)=39.51µs
     http_req_connecting............: avg=197ns    min=0s      med=0s      max=2.43ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.46ms  min=1.92ms  med=24.21ms max=337.77ms p(90)=29.27ms p(95)=31.41ms  p(99.9)=53.28ms
       { expected_response:true }...: avg=24.46ms  min=1.92ms  med=24.21ms max=337.77ms p(90)=29.27ms p(95)=31.41ms  p(99.9)=53.28ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 242897
     http_req_receiving.............: avg=131.34µs min=28.94µs med=58.21µs max=319.31ms p(90)=99.77µs p(95)=173.04µs p(99.9)=9.4ms  
     http_req_sending...............: avg=43.96µs  min=4.7µs   med=9.89µs  max=209.05ms p(90)=16.85µs p(95)=97.12µs  p(99.9)=3.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.29ms  min=1.79ms  med=24.09ms max=97.44ms  p(90)=29.1ms  p(95)=31.15ms  p(99.9)=52.12ms
     http_reqs......................: 242897  2019.844236/s
     iteration_duration.............: avg=24.7ms   min=2.91ms  med=24.41ms max=347.05ms p(90)=29.49ms p(95)=31.65ms  p(99.9)=53.89ms
     iterations.....................: 242797  2019.012672/s
     success_rate...................: 100.00% ✓ 242797      ✗ 0     
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

     checks.........................: 100.00% ✓ 457152      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.44µs  min=1.06µs  med=2.41µs  max=4.88ms   p(90)=3.8µs   p(95)=4.42µs   p(99.9)=35.22µs
     http_req_connecting............: avg=700ns   min=0s      med=0s      max=4.83ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.13ms min=2.12ms  med=38.57ms max=316.22ms p(90)=55.13ms p(95)=60.22ms  p(99.9)=85.14ms
       { expected_response:true }...: avg=39.13ms min=2.12ms  med=38.57ms max=316.22ms p(90)=55.13ms p(95)=60.22ms  p(99.9)=85.14ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 152484
     http_req_receiving.............: avg=79.42µs min=27.88µs med=61.86µs max=29.05ms  p(90)=97.92µs p(95)=115.61µs p(99.9)=1.74ms 
     http_req_sending...............: avg=26.12µs min=5.24µs  med=10.48µs max=191.91ms p(90)=15.88µs p(95)=19.79µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.02ms min=2.06ms  med=38.46ms max=315.5ms  p(90)=55.02ms p(95)=60.1ms   p(99.9)=84.8ms 
     http_reqs......................: 152484  1267.738953/s
     iteration_duration.............: avg=39.37ms min=4.27ms  med=38.77ms max=346.97ms p(90)=55.33ms p(95)=60.43ms  p(99.9)=85.91ms
     iterations.....................: 152384  1266.907562/s
     success_rate...................: 100.00% ✓ 152384      ✗ 0     
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

     checks.........................: 100.00% ✓ 198087     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   659 kB/s
     http_req_blocked...............: avg=4.62µs  min=1.04µs  med=2.94µs  max=4.39ms   p(90)=4.49µs   p(95)=5.1µs    p(99.9)=48.68µs 
     http_req_connecting............: avg=1.4µs   min=0s      med=0s      max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.49ms min=4.11ms  med=87.73ms max=329.5ms  p(90)=109.33ms p(95)=120.69ms p(99.9)=211.06ms
       { expected_response:true }...: avg=90.49ms min=4.11ms  med=87.73ms max=329.5ms  p(90)=109.33ms p(95)=120.69ms p(99.9)=211.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66129
     http_req_receiving.............: avg=87.64µs min=31.77µs med=78.07µs max=62.33ms  p(90)=112.93µs p(95)=126.25µs p(99.9)=1.03ms  
     http_req_sending...............: avg=23.52µs min=5.49µs  med=13.39µs max=142.75ms p(90)=20.02µs  p(95)=22.25µs  p(99.9)=702.73µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.38ms min=4.01ms  med=87.63ms max=328.44ms p(90)=109.22ms p(95)=120.57ms p(99.9)=210.69ms
     http_reqs......................: 66129   548.580828/s
     iteration_duration.............: avg=90.88ms min=14.05ms med=87.96ms max=338.7ms  p(90)=109.59ms p(95)=120.98ms p(99.9)=212.7ms 
     iterations.....................: 66029   547.751266/s
     success_rate...................: 100.00% ✓ 66029      ✗ 0    
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

     checks.........................: 100.00% ✓ 143805     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   478 kB/s
     http_req_blocked...............: avg=5.7µs    min=1.22µs  med=3.13µs   max=4.37ms   p(90)=4.53µs   p(95)=5.1µs    p(99.9)=864.51µs
     http_req_connecting............: avg=2.3µs    min=0s      med=0s       max=4.33ms   p(90)=0s       p(95)=0s       p(99.9)=551.78µs
     http_req_duration..............: avg=124.69ms min=5.47ms  med=124.38ms max=339.73ms p(90)=150.85ms p(95)=158.96ms p(99.9)=194.1ms 
       { expected_response:true }...: avg=124.69ms min=5.47ms  med=124.38ms max=339.73ms p(90)=150.85ms p(95)=158.96ms p(99.9)=194.1ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 48035
     http_req_receiving.............: avg=86.59µs  min=31.91µs med=79.94µs  max=33.3ms   p(90)=111.29µs p(95)=123.3µs  p(99.9)=733.08µs
     http_req_sending...............: avg=26.66µs  min=5.76µs  med=14.4µs   max=130.78ms p(90)=19.79µs  p(95)=21.65µs  p(99.9)=522.26µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=124.58ms min=5.36ms  med=124.27ms max=339.38ms p(90)=150.74ms p(95)=158.82ms p(99.9)=194.01ms
     http_reqs......................: 48035   397.920412/s
     iteration_duration.............: avg=125.21ms min=17.07ms med=124.65ms max=368.08ms p(90)=151.11ms p(95)=159.21ms p(99.9)=196.1ms 
     iterations.....................: 47935   397.092015/s
     success_rate...................: 100.00% ✓ 47935      ✗ 0    
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

     checks.........................: 100.00% ✓ 92637      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   307 kB/s
     http_req_blocked...............: avg=7.46µs   min=1.24µs  med=3.6µs    max=4.27ms   p(90)=5.15µs   p(95)=5.83µs   p(99.9)=1.91ms  
     http_req_connecting............: avg=3.56µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=1.86ms  
     http_req_duration..............: avg=193.54ms min=6.25ms  med=176.61ms max=591.2ms  p(90)=227.87ms p(95)=395.5ms  p(99.9)=536.42ms
       { expected_response:true }...: avg=193.54ms min=6.25ms  med=176.61ms max=591.2ms  p(90)=227.87ms p(95)=395.5ms  p(99.9)=536.42ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30979
     http_req_receiving.............: avg=103.87µs min=34.72µs med=99.03µs  max=35.86ms  p(90)=131.95µs p(95)=146.17µs p(99.9)=591.84µs
     http_req_sending...............: avg=30.45µs  min=6.12µs  med=18.37µs  max=74.19ms  p(90)=23.53µs  p(95)=25.54µs  p(99.9)=549.54µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.41ms min=6.12ms  med=176.48ms max=591.09ms p(90)=227.75ms p(95)=395.38ms p(99.9)=536.26ms
     http_reqs......................: 30979   255.995167/s
     iteration_duration.............: avg=194.47ms min=53.44ms med=176.96ms max=591.43ms p(90)=228.3ms  p(95)=396.68ms p(99.9)=536.72ms
     iterations.....................: 30879   255.168817/s
     success_rate...................: 100.00% ✓ 30879      ✗ 0    
     vus............................: 5       min=5        max=50 
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

     checks.........................: 100.00% ✓ 90522      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   300 kB/s
     http_req_blocked...............: avg=7.07µs   min=1.22µs  med=3.39µs   max=4.32ms   p(90)=4.71µs   p(95)=5.25µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=4.27ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=198ms    min=8.36ms  med=213.83ms max=417.95ms p(90)=237.4ms  p(95)=245.21ms p(99.9)=313.19ms
       { expected_response:true }...: avg=198ms    min=8.36ms  med=213.83ms max=417.95ms p(90)=237.4ms  p(95)=245.21ms p(99.9)=313.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30274
     http_req_receiving.............: avg=105.39µs min=35.74µs med=93.67µs  max=125.2ms  p(90)=124.56µs p(95)=137.62µs p(99.9)=718.18µs
     http_req_sending...............: avg=23.58µs  min=6.3µs   med=17.19µs  max=39.62ms  p(90)=21.84µs  p(95)=23.66µs  p(99.9)=632.17µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.87ms min=8.23ms  med=213.69ms max=417.42ms p(90)=237.28ms p(95)=245.09ms p(99.9)=312.62ms
     http_reqs......................: 30274   250.114409/s
     iteration_duration.............: avg=198.95ms min=43.62ms med=214.62ms max=428.84ms p(90)=237.7ms  p(95)=245.47ms p(99.9)=315.1ms 
     iterations.....................: 30174   249.28824/s
     success_rate...................: 100.00% ✓ 30174      ✗ 0    
     vus............................: 27      min=27       max=50 
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

     checks.........................: 100.00% ✓ 855441      ✗ 0     
     data_received..................: 25 GB   208 MB/s
     data_sent......................: 343 MB  2.9 MB/s
     http_req_blocked...............: avg=3.05µs   min=982ns  med=2.24µs  max=11.2ms   p(90)=3.7µs    p(95)=4.49µs   p(99.9)=34.56µs
     http_req_connecting............: avg=355ns    min=0s     med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.8ms   min=1.73ms med=20.33ms max=310.74ms p(90)=28.81ms  p(95)=31.86ms  p(99.9)=53ms   
       { expected_response:true }...: avg=20.8ms   min=1.73ms med=20.33ms max=310.74ms p(90)=28.81ms  p(95)=31.86ms  p(99.9)=53ms   
     http_req_failed................: 0.00%   ✓ 0           ✗ 285247
     http_req_receiving.............: avg=114.09µs min=28µs   med=54.43µs max=253.31ms p(90)=102.87µs p(95)=251.81µs p(99.9)=9.17ms 
     http_req_sending...............: avg=51.39µs  min=5.15µs med=9.84µs  max=160.56ms p(90)=17.84µs  p(95)=121.95µs p(99.9)=5.44ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.63ms  min=1.64ms med=20.19ms max=302.15ms p(90)=28.61ms  p(95)=31.58ms  p(99.9)=52ms   
     http_reqs......................: 285247  2372.556401/s
     iteration_duration.............: avg=21.03ms  min=3.17ms med=20.54ms max=351.08ms p(90)=29.03ms  p(95)=32.09ms  p(99.9)=53.53ms
     iterations.....................: 285147  2371.724646/s
     success_rate...................: 100.00% ✓ 285147      ✗ 0     
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

     checks.........................: 100.00% ✓ 710379      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=2.98µs   min=962ns   med=2.18µs   max=5.97ms   p(90)=3.67µs  p(95)=4.45µs  p(99.9)=34.11µs 
     http_req_connecting............: avg=382ns    min=0s      med=0s       max=4.1ms    p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.09ms  min=1.88ms  med=17.33ms  max=641.61ms p(90)=52.64ms p(95)=69.34ms p(99.9)=189.89ms
       { expected_response:true }...: avg=25.09ms  min=1.88ms  med=17.33ms  max=641.61ms p(90)=52.64ms p(95)=69.34ms p(99.9)=189.89ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236893
     http_req_receiving.............: avg=679.25µs min=50.71µs med=106.02µs max=249.88ms p(90)=1.14ms  p(95)=1.8ms   p(99.9)=56.85ms 
     http_req_sending...............: avg=42.61µs  min=5.12µs  med=9.53µs   max=179ms    p(90)=18.33µs p(95)=109.4µs p(99.9)=2.4ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.37ms  min=1.76ms  med=16.77ms  max=641.48ms p(90)=51.44ms p(95)=67.91ms p(99.9)=182.59ms
     http_reqs......................: 236893  1970.127722/s
     iteration_duration.............: avg=25.32ms  min=2.28ms  med=17.55ms  max=641.84ms p(90)=52.89ms p(95)=69.58ms p(99.9)=190.24ms
     iterations.....................: 236793  1969.296069/s
     success_rate...................: 100.00% ✓ 236793      ✗ 0     
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

     checks.........................: 100.00% ✓ 543651      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 218 MB  1.8 MB/s
     http_req_blocked...............: avg=3.69µs   min=932ns   med=2.33µs  max=10.48ms  p(90)=4.57µs   p(95)=5.71µs   p(99.9)=43.02µs
     http_req_connecting............: avg=564ns    min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.84ms  min=2.39ms  med=31.91ms max=347.72ms p(90)=43.65ms  p(95)=48.38ms  p(99.9)=90.13ms
       { expected_response:true }...: avg=32.84ms  min=2.39ms  med=31.91ms max=347.72ms p(90)=43.65ms  p(95)=48.38ms  p(99.9)=90.13ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181317
     http_req_receiving.............: avg=152.56µs min=29.54µs med=61.55µs max=294.72ms p(90)=134.02µs p(95)=281.21µs p(99.9)=7.4ms  
     http_req_sending...............: avg=46.41µs  min=5.22µs  med=10.24µs max=91.12ms  p(90)=23.6µs   p(95)=133.64µs p(99.9)=3.62ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.64ms  min=2.28ms  med=31.77ms max=128.15ms p(90)=43.46ms  p(95)=48.13ms  p(99.9)=86.62ms
     http_reqs......................: 181317  1507.028905/s
     iteration_duration.............: avg=33.1ms   min=4.39ms  med=32.15ms max=379.71ms p(90)=43.9ms   p(95)=48.63ms  p(99.9)=90.56ms
     iterations.....................: 181217  1506.197748/s
     success_rate...................: 100.00% ✓ 181217      ✗ 0     
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

     checks.........................: 100.00% ✓ 434613      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.54µs  min=1.01µs  med=2.43µs  max=4.16ms   p(90)=3.97µs   p(95)=4.61µs   p(99.9)=37.28µs
     http_req_connecting............: avg=757ns   min=0s      med=0s      max=4.12ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.16ms min=2.28ms  med=40.6ms  max=318.74ms p(90)=57.75ms  p(95)=62.94ms  p(99.9)=88.9ms 
       { expected_response:true }...: avg=41.16ms min=2.28ms  med=40.6ms  max=318.74ms p(90)=57.75ms  p(95)=62.94ms  p(99.9)=88.9ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 144971
     http_req_receiving.............: avg=85.69µs min=28.96µs med=66.38µs max=192.49ms p(90)=106.01µs p(95)=124.76µs p(99.9)=1.71ms 
     http_req_sending...............: avg=28.13µs min=5.07µs  med=10.99µs max=175.8ms  p(90)=17.6µs   p(95)=21.31µs  p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.04ms min=2.18ms  med=40.5ms  max=318.18ms p(90)=57.63ms  p(95)=62.82ms  p(99.9)=88.03ms
     http_reqs......................: 144971  1205.093221/s
     iteration_duration.............: avg=41.4ms  min=4.2ms   med=40.81ms max=361.96ms p(90)=57.97ms  p(95)=63.16ms  p(99.9)=89.79ms
     iterations.....................: 144871  1204.261956/s
     success_rate...................: 100.00% ✓ 144871      ✗ 0     
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

     checks.........................: 100.00% ✓ 190143     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 76 MB   632 kB/s
     http_req_blocked...............: avg=5.13µs  min=1.21µs  med=3.05µs  max=5ms      p(90)=4.58µs   p(95)=5.19µs   p(99.9)=51.08µs 
     http_req_connecting............: avg=1.8µs   min=0s      med=0s      max=4.94ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.28ms min=4.4ms   med=91.36ms max=378.63ms p(90)=113.31ms p(95)=125.08ms p(99.9)=223.09ms
       { expected_response:true }...: avg=94.28ms min=4.4ms   med=91.36ms max=378.63ms p(90)=113.31ms p(95)=125.08ms p(99.9)=223.09ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63481
     http_req_receiving.............: avg=90.38µs min=31.87µs med=81.83µs max=51.7ms   p(90)=115.43µs p(95)=128.43µs p(99.9)=870.27µs
     http_req_sending...............: avg=26.83µs min=5.69µs  med=14.15µs max=213.17ms p(90)=20.51µs  p(95)=22.69µs  p(99.9)=651.85µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.17ms min=4.27ms  med=91.26ms max=378.41ms p(90)=113.18ms p(95)=124.93ms p(99.9)=222.91ms
     http_reqs......................: 63481   526.223333/s
     iteration_duration.............: avg=94.69ms min=20.04ms med=91.6ms  max=392.07ms p(90)=113.57ms p(95)=125.45ms p(99.9)=225.25ms
     iterations.....................: 63381   525.394387/s
     success_rate...................: 100.00% ✓ 63381      ✗ 0    
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

     checks.........................: 100.00% ✓ 136401     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   453 kB/s
     http_req_blocked...............: avg=6.11µs   min=1.21µs  med=3.6µs    max=4.28ms   p(90)=5.14µs   p(95)=5.7µs    p(99.9)=301.66µs
     http_req_connecting............: avg=2.29µs   min=0s      med=0s       max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=268.76µs
     http_req_duration..............: avg=131.45ms min=5.97ms  med=129.07ms max=339.17ms p(90)=174.08ms p(95)=187.01ms p(99.9)=244.11ms
       { expected_response:true }...: avg=131.45ms min=5.97ms  med=129.07ms max=339.17ms p(90)=174.08ms p(95)=187.01ms p(99.9)=244.11ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45567
     http_req_receiving.............: avg=97.63µs  min=33.69µs med=89.98µs  max=88.67ms  p(90)=121.91µs p(95)=134.44µs p(99.9)=736.07µs
     http_req_sending...............: avg=31.2µs   min=5.71µs  med=17.18µs  max=175.74ms p(90)=22.37µs  p(95)=24.2µs   p(99.9)=711.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=131.32ms min=5.89ms  med=128.95ms max=337ms    p(90)=173.97ms p(95)=186.88ms p(99.9)=243.67ms
     http_reqs......................: 45567   377.28527/s
     iteration_duration.............: avg=132.01ms min=28.02ms med=129.42ms max=375.46ms p(90)=174.44ms p(95)=187.34ms p(99.9)=247.22ms
     iterations.....................: 45467   376.457291/s
     success_rate...................: 100.00% ✓ 45467      ✗ 0    
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

     checks.........................: 100.00% ✓ 91911      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=6.77µs   min=1.2µs   med=3.56µs   max=4.2ms    p(90)=5.05µs   p(95)=5.65µs   p(99.9)=1.21ms  
     http_req_connecting............: avg=2.93µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.13ms  
     http_req_duration..............: avg=195.03ms min=6.3ms   med=204.57ms max=726.44ms p(90)=286.38ms p(95)=373.67ms p(99.9)=593.56ms
       { expected_response:true }...: avg=195.03ms min=6.3ms   med=204.57ms max=726.44ms p(90)=286.38ms p(95)=373.67ms p(99.9)=593.56ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30737
     http_req_receiving.............: avg=101.68µs min=33.56µs med=98.34µs  max=1.67ms   p(90)=130.17µs p(95)=143.39µs p(99.9)=467.81µs
     http_req_sending...............: avg=28.37µs  min=6.09µs  med=18.41µs  max=47.24ms  p(90)=23.29µs  p(95)=25.04µs  p(99.9)=936.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.9ms  min=6.15ms  med=204.42ms max=726.32ms p(90)=286.26ms p(95)=373.55ms p(99.9)=593.45ms
     http_reqs......................: 30737   253.993028/s
     iteration_duration.............: avg=195.95ms min=30.71ms med=205.75ms max=726.76ms p(90)=286.99ms p(95)=376.1ms  p(99.9)=593.8ms 
     iterations.....................: 30637   253.166685/s
     success_rate...................: 100.00% ✓ 30637      ✗ 0    
     vus............................: 11      min=11       max=50 
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

     checks.........................: 100.00% ✓ 87813      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   291 kB/s
     http_req_blocked...............: avg=7.2µs    min=1.17µs  med=3.35µs   max=4.62ms   p(90)=4.68µs   p(95)=5.24µs   p(99.9)=1.77ms  
     http_req_connecting............: avg=3.59µs   min=0s      med=0s       max=4.58ms   p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=204.12ms min=8.6ms   med=191.77ms max=408.12ms p(90)=302.45ms p(95)=312.43ms p(99.9)=387.34ms
       { expected_response:true }...: avg=204.12ms min=8.6ms   med=191.77ms max=408.12ms p(90)=302.45ms p(95)=312.43ms p(99.9)=387.34ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29371
     http_req_receiving.............: avg=105.23µs min=34.19µs med=93.08µs  max=151.76ms p(90)=124.74µs p(95)=137.55µs p(99.9)=616.59µs
     http_req_sending...............: avg=27.48µs  min=6.15µs  med=17.18µs  max=56.57ms  p(90)=21.95µs  p(95)=23.86µs  p(99.9)=520.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=203.98ms min=8.43ms  med=191.62ms max=408ms    p(90)=302.3ms  p(95)=312.28ms p(99.9)=386.51ms
     http_reqs......................: 29371   242.570725/s
     iteration_duration.............: avg=205.09ms min=55.67ms med=192.61ms max=411.7ms  p(90)=302.78ms p(95)=312.83ms p(99.9)=388.59ms
     iterations.....................: 29271   241.744839/s
     success_rate...................: 100.00% ✓ 29271      ✗ 0    
     vus............................: 41      min=41       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-177-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

