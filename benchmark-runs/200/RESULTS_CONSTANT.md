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
| hive-router | v0.0.49 | 2,944 | 3,133 | 2,907 | 2.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,171 | 2,228 | 2,158 | 1.0% |  |
| grafbase | 0.53.3 | 2,082 | 2,108 | 2,066 | 1.0% |  |
| cosmo | 0.307.0 | 1,239 | 1,260 | 1,226 | 1.0% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 525 | 538 | 521 | 1.1% |  |
| apollo-router | v2.13.1 | 430 | 440 | 426 | 1.1% |  |
| hive-gateway | 2.5.25 | 256 | 262 | 253 | 1.2% |  |
| apollo-gateway | 2.13.3 | 244 | 247 | 243 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,384 | 2,517 | 2,334 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,007 | 2,062 | 1,790 | 3.9% |  |
| grafbase | 0.53.3 | 1,529 | 1,564 | 1,509 | 1.1% |  |
| cosmo | 0.307.0 | 1,206 | 1,219 | 1,201 | 0.6% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 512 | 525 | 508 | 1.1% |  |
| apollo-router | v2.13.1 | 399 | 409 | 395 | 1.2% |  |
| hive-gateway | 2.5.25 | 246 | 250 | 243 | 1.1% |  |
| apollo-gateway | 2.13.3 | 239 | 242 | 237 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1061553     ✗ 0     
     data_received..................: 31 GB   258 MB/s
     data_sent......................: 425 MB  3.5 MB/s
     http_req_blocked...............: avg=2.67µs   min=990ns  med=1.97µs  max=24.63ms  p(90)=3.02µs  p(95)=3.64µs   p(99.9)=27.99µs
     http_req_connecting............: avg=138ns    min=0s     med=0s      max=2.69ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.72ms  min=1.57ms med=15.89ms max=310.11ms p(90)=24.55ms p(95)=28.1ms   p(99.9)=51.62ms
       { expected_response:true }...: avg=16.72ms  min=1.57ms med=15.89ms max=310.11ms p(90)=24.55ms p(95)=28.1ms   p(99.9)=51.62ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 353951
     http_req_receiving.............: avg=120.75µs min=28.1µs med=49.85µs max=214.32ms p(90)=94.5µs  p(95)=258.62µs p(99.9)=12.94ms
     http_req_sending...............: avg=54.2µs   min=5.08µs med=8.94µs  max=79.11ms  p(90)=14.94µs p(95)=118.67µs p(99.9)=7.18ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.55ms  min=1.51ms med=15.75ms max=285.55ms p(90)=24.31ms p(95)=27.75ms  p(99.9)=50.26ms
     http_reqs......................: 353951  2944.889592/s
     iteration_duration.............: avg=16.94ms  min=2.08ms med=16.09ms max=328.31ms p(90)=24.77ms p(95)=28.34ms  p(99.9)=52.8ms 
     iterations.....................: 353851  2944.057587/s
     success_rate...................: 100.00% ✓ 353851      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 783303      ✗ 0     
     data_received..................: 23 GB   190 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=2.61µs   min=971ns   med=2.02µs   max=5.4ms    p(90)=3.15µs   p(95)=3.75µs   p(99.9)=31.01µs 
     http_req_connecting............: avg=234ns    min=0s      med=0s       max=3.04ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.74ms  min=2.44ms  med=14.63ms  max=331.4ms  p(90)=50.45ms  p(95)=68.45ms  p(99.9)=165.42ms
       { expected_response:true }...: avg=22.74ms  min=2.44ms  med=14.63ms  max=331.4ms  p(90)=50.45ms  p(95)=68.45ms  p(99.9)=165.42ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261201
     http_req_receiving.............: avg=638.78µs min=50.68µs med=103.73µs max=273.72ms p(90)=943.97µs p(95)=1.47ms   p(99.9)=58.08ms 
     http_req_sending...............: avg=43.59µs  min=4.97µs  med=9.12µs   max=268.63ms p(90)=15.32µs  p(95)=108.52µs p(99.9)=2.98ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.06ms  min=2.29ms  med=14.12ms  max=297.1ms  p(90)=49.14ms  p(95)=67.21ms  p(99.9)=161.15ms
     http_reqs......................: 261201  2171.152971/s
     iteration_duration.............: avg=22.97ms  min=3.34ms  med=14.84ms  max=343.25ms p(90)=50.7ms   p(95)=68.69ms  p(99.9)=166.86ms
     iterations.....................: 261101  2170.321751/s
     success_rate...................: 100.00% ✓ 261101      ✗ 0     
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

     checks.........................: 100.00% ✓ 751113      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 301 MB  2.5 MB/s
     http_req_blocked...............: avg=2.97µs   min=951ns   med=2.05µs  max=13.35ms  p(90)=3.26µs  p(95)=3.93µs   p(99.9)=37.55µs
     http_req_connecting............: avg=407ns    min=0s      med=0s      max=4.53ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=23.73ms  min=1.94ms  med=23.51ms max=324.46ms p(90)=28.43ms p(95)=30.52ms  p(99.9)=53.39ms
       { expected_response:true }...: avg=23.73ms  min=1.94ms  med=23.51ms max=324.46ms p(90)=28.43ms p(95)=30.52ms  p(99.9)=53.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 250471
     http_req_receiving.............: avg=102.87µs min=29.56µs med=56.73µs max=52.77ms  p(90)=94.57µs p(95)=162.36µs p(99.9)=7.98ms 
     http_req_sending...............: avg=42.26µs  min=5.13µs  med=9.58µs  max=181.5ms  p(90)=15.57µs p(95)=104.37µs p(99.9)=3.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=23.58ms  min=1.83ms  med=23.4ms  max=323.91ms p(90)=28.28ms p(95)=30.29ms  p(99.9)=52.65ms
     http_reqs......................: 250471  2082.886636/s
     iteration_duration.............: avg=23.95ms  min=3.97ms  med=23.71ms max=336.96ms p(90)=28.65ms p(95)=30.75ms  p(99.9)=54.03ms
     iterations.....................: 250371  2082.055048/s
     success_rate...................: 100.00% ✓ 250371      ✗ 0     
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

     checks.........................: 100.00% ✓ 447018      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=2.82µs  min=992ns   med=1.97µs  max=3.52ms   p(90)=3.07µs  p(95)=3.61µs   p(99.9)=27.73µs
     http_req_connecting............: avg=552ns   min=0s      med=0s      max=3.48ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.03ms min=2.12ms  med=39.52ms max=333.8ms  p(90)=56.45ms p(95)=61.66ms  p(99.9)=87.86ms
       { expected_response:true }...: avg=40.03ms min=2.12ms  med=39.52ms max=333.8ms  p(90)=56.45ms p(95)=61.66ms  p(99.9)=87.86ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149106
     http_req_receiving.............: avg=75.26µs min=27.44µs med=57.96µs max=132.37ms p(90)=89.02µs p(95)=105.05µs p(99.9)=1.62ms 
     http_req_sending...............: avg=26.05µs min=5.12µs  med=9.63µs  max=196.27ms p(90)=14.1µs  p(95)=17.93µs  p(99.9)=1.18ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.93ms min=2.06ms  med=39.42ms max=287.42ms p(90)=56.36ms p(95)=61.55ms  p(99.9)=87.34ms
     http_reqs......................: 149106  1239.721455/s
     iteration_duration.............: avg=40.26ms min=4.08ms  med=39.71ms max=342.68ms p(90)=56.64ms p(95)=61.86ms  p(99.9)=88.47ms
     iterations.....................: 149006  1238.890018/s
     success_rate...................: 100.00% ✓ 149006      ✗ 0     
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

     checks.........................: 100.00% ✓ 189912     ✗ 0    
     data_received..................: 5.6 GB  46 MB/s
     data_sent......................: 76 MB   632 kB/s
     http_req_blocked...............: avg=4.85µs  min=1.07µs  med=2.58µs  max=4.43ms   p(90)=4.11µs   p(95)=4.7µs    p(99.9)=51.86µs 
     http_req_connecting............: avg=1.91µs  min=0s      med=0s      max=4.38ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=94.4ms  min=4.15ms  med=92.22ms max=354.45ms p(90)=115.12ms p(95)=127.32ms p(99.9)=221.19ms
       { expected_response:true }...: avg=94.4ms  min=4.15ms  med=92.22ms max=354.45ms p(90)=115.12ms p(95)=127.32ms p(99.9)=221.19ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 63404
     http_req_receiving.............: avg=89.24µs min=31.08µs med=74.8µs  max=180.49ms p(90)=109.13µs p(95)=121.68µs p(99.9)=946.71µs
     http_req_sending...............: avg=21.01µs min=5.4µs   med=12.55µs max=112.24ms p(90)=18.98µs  p(95)=21.1µs   p(99.9)=687.68µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=94.29ms min=4.02ms  med=92.12ms max=353.98ms p(90)=115ms    p(95)=127.22ms p(99.9)=220.71ms
     http_reqs......................: 63404   525.907163/s
     iteration_duration.............: avg=94.79ms min=16.94ms med=92.45ms max=375.46ms p(90)=115.36ms p(95)=127.62ms p(99.9)=224.24ms
     iterations.....................: 63304   525.077708/s
     success_rate...................: 100.00% ✓ 63304      ✗ 0    
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

     checks.........................: 100.00% ✓ 155460     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 62 MB   517 kB/s
     http_req_blocked...............: avg=4.31µs   min=1.18µs  med=3.25µs   max=2.29ms   p(90)=4.7µs    p(95)=5.25µs   p(99.9)=92.05µs 
     http_req_connecting............: avg=878ns    min=0s      med=0s       max=2.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.33ms min=5.46ms  med=115.08ms max=346.78ms p(90)=139.41ms p(95)=146.47ms p(99.9)=176.98ms
       { expected_response:true }...: avg=115.33ms min=5.46ms  med=115.08ms max=346.78ms p(90)=139.41ms p(95)=146.47ms p(99.9)=176.98ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51920
     http_req_receiving.............: avg=93.33µs  min=32.48µs med=83.2µs   max=116.35ms p(90)=114.13µs p(95)=126.01µs p(99.9)=886.11µs
     http_req_sending...............: avg=26.9µs   min=5.53µs  med=15.65µs  max=96.64ms  p(90)=21.28µs  p(95)=23.14µs  p(99.9)=642.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.21ms min=5.35ms  med=114.96ms max=346.39ms p(90)=139.3ms  p(95)=146.34ms p(99.9)=176.81ms
     http_reqs......................: 51920   430.206183/s
     iteration_duration.............: avg=115.8ms  min=40.88ms med=115.36ms max=360.75ms p(90)=139.67ms p(95)=146.72ms p(99.9)=177.98ms
     iterations.....................: 51820   429.377588/s
     success_rate...................: 100.00% ✓ 51820      ✗ 0    
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

     checks.........................: 100.00% ✓ 92997      ✗ 0    
     data_received..................: 2.7 GB  23 MB/s
     data_sent......................: 37 MB   308 kB/s
     http_req_blocked...............: avg=6.68µs   min=1.24µs  med=3.54µs   max=4.68ms   p(90)=5.04µs   p(95)=5.68µs   p(99.9)=1.19ms  
     http_req_connecting............: avg=2.58µs   min=0s      med=0s       max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=999.69µs
     http_req_duration..............: avg=192.78ms min=6.2ms   med=177.09ms max=631.78ms p(90)=233.38ms p(95)=399.47ms p(99.9)=532.33ms
       { expected_response:true }...: avg=192.78ms min=6.2ms   med=177.09ms max=631.78ms p(90)=233.38ms p(95)=399.47ms p(99.9)=532.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 31099
     http_req_receiving.............: avg=107.59µs min=32.72µs med=98.35µs  max=142.5ms  p(90)=130.73µs p(95)=143.92µs p(99.9)=584.28µs
     http_req_sending...............: avg=37.84µs  min=6.34µs  med=18.09µs  max=181.35ms p(90)=23.22µs  p(95)=25.06µs  p(99.9)=994.73µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=192.64ms min=6.06ms  med=176.95ms max=631.67ms p(90)=233.2ms  p(95)=399.39ms p(99.9)=532.21ms
     http_reqs......................: 31099   256.895554/s
     iteration_duration.............: avg=193.7ms  min=34.34ms med=177.49ms max=632.02ms p(90)=233.88ms p(95)=402.39ms p(99.9)=532.67ms
     iterations.....................: 30999   256.069496/s
     success_rate...................: 100.00% ✓ 30999      ✗ 0    
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

     checks.........................: 100.00% ✓ 88542      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=6.9µs    min=1.2µs   med=3.02µs   max=4.34ms   p(90)=4.29µs   p(95)=4.8µs    p(99.9)=2ms     
     http_req_connecting............: avg=3.67µs   min=0s      med=0s       max=4.28ms   p(90)=0s       p(95)=0s       p(99.9)=1.84ms  
     http_req_duration..............: avg=202.48ms min=8.51ms  med=185.45ms max=515.76ms p(90)=364.82ms p(95)=386.42ms p(99.9)=472.92ms
       { expected_response:true }...: avg=202.48ms min=8.51ms  med=185.45ms max=515.76ms p(90)=364.82ms p(95)=386.42ms p(99.9)=472.92ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29614
     http_req_receiving.............: avg=91.38µs  min=32.36µs med=87.15µs  max=12.04ms  p(90)=119.03µs p(95)=131µs    p(99.9)=380.6µs 
     http_req_sending...............: avg=25.97µs  min=5.65µs  med=15.74µs  max=39.46ms  p(90)=20.71µs  p(95)=22.55µs  p(99.9)=631.47µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.36ms min=8.38ms  med=185.34ms max=515.63ms p(90)=364.7ms  p(95)=386.3ms  p(99.9)=472.81ms
     http_reqs......................: 29614   244.616711/s
     iteration_duration.............: avg=203.4ms  min=40.92ms med=185.88ms max=515.99ms p(90)=365.35ms p(95)=386.76ms p(99.9)=473.17ms
     iterations.....................: 29514   243.790694/s
     success_rate...................: 100.00% ✓ 29514      ✗ 0    
     vus............................: 34      min=34       max=50 
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

     checks.........................: 100.00% ✓ 859662      ✗ 0     
     data_received..................: 25 GB   209 MB/s
     data_sent......................: 345 MB  2.9 MB/s
     http_req_blocked...............: avg=2.89µs   min=992ns   med=2.14µs  max=29.12ms  p(90)=3.49µs   p(95)=4.29µs   p(99.9)=34.98µs
     http_req_connecting............: avg=189ns    min=0s      med=0s      max=2.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.7ms   min=1.64ms  med=20.27ms max=360.26ms p(90)=28.62ms  p(95)=31.64ms  p(99.9)=53.02ms
       { expected_response:true }...: avg=20.7ms   min=1.64ms  med=20.27ms max=360.26ms p(90)=28.62ms  p(95)=31.64ms  p(99.9)=53.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 286654
     http_req_receiving.............: avg=129.59µs min=27.98µs med=55.31µs max=280.61ms p(90)=102.06µs p(95)=251.31µs p(99.9)=8.85ms 
     http_req_sending...............: avg=48.91µs  min=5.23µs  med=9.87µs  max=89.54ms  p(90)=17.42µs  p(95)=122.35µs p(99.9)=4ms    
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.52ms  min=1.57ms  med=20.13ms max=82.64ms  p(90)=28.43ms  p(95)=31.38ms  p(99.9)=51.61ms
     http_reqs......................: 286654  2384.23157/s
     iteration_duration.............: avg=20.92ms  min=3.37ms  med=20.48ms max=393.92ms p(90)=28.84ms  p(95)=31.89ms  p(99.9)=53.57ms
     iterations.....................: 286554  2383.399824/s
     success_rate...................: 100.00% ✓ 286554      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.12)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 723669      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 290 MB  2.4 MB/s
     http_req_blocked...............: avg=3.02µs   min=982ns   med=2.13µs   max=18.06ms  p(90)=3.56µs  p(95)=4.32µs   p(99.9)=36.37µs 
     http_req_connecting............: avg=381ns    min=0s      med=0s       max=4.18ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.62ms  min=1.82ms  med=16.8ms   max=519.82ms p(90)=52.06ms p(95)=68.62ms  p(99.9)=184.79ms
       { expected_response:true }...: avg=24.62ms  min=1.82ms  med=16.8ms   max=519.82ms p(90)=52.06ms p(95)=68.62ms  p(99.9)=184.79ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 241323
     http_req_receiving.............: avg=647.14µs min=51.74µs med=106.01µs max=168.22ms p(90)=1.1ms   p(95)=1.76ms   p(99.9)=53.61ms 
     http_req_sending...............: avg=43.3µs   min=4.98µs  med=9.54µs   max=136.3ms  p(90)=18.13µs p(95)=110.04µs p(99.9)=2.79ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=23.93ms  min=1.74ms  med=16.28ms  max=519.71ms p(90)=50.82ms p(95)=67.22ms  p(99.9)=182.14ms
     http_reqs......................: 241323  2007.084524/s
     iteration_duration.............: avg=24.86ms  min=2.71ms  med=17.02ms  max=519.97ms p(90)=52.3ms  p(95)=68.87ms  p(99.9)=187.89ms
     iterations.....................: 241223  2006.252824/s
     success_rate...................: 100.00% ✓ 241223      ✗ 0     
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

     checks.........................: 100.00% ✓ 551739      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.54µs   min=932ns   med=2.32µs  max=4.29ms   p(90)=4.61µs   p(95)=5.72µs   p(99.9)=40.67µs
     http_req_connecting............: avg=571ns    min=0s      med=0s      max=4.22ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.34ms  min=2.34ms  med=31.46ms max=329.57ms p(90)=42.84ms  p(95)=47.37ms  p(99.9)=87.85ms
       { expected_response:true }...: avg=32.34ms  min=2.34ms  med=31.46ms max=329.57ms p(90)=42.84ms  p(95)=47.37ms  p(99.9)=87.85ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184013
     http_req_receiving.............: avg=112.84µs min=30.07µs med=62.68µs max=47.47ms  p(90)=134.04µs p(95)=272.67µs p(99.9)=5.45ms 
     http_req_sending...............: avg=44.29µs  min=4.85µs  med=10.43µs max=137.36ms p(90)=24.12µs  p(95)=131.84µs p(99.9)=3.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.19ms  min=2.27ms  med=31.32ms max=328.83ms p(90)=42.65ms  p(95)=47.14ms  p(99.9)=87.63ms
     http_reqs......................: 184013  1529.490976/s
     iteration_duration.............: avg=32.61ms  min=3.86ms  med=31.7ms  max=343.07ms p(90)=43.08ms  p(95)=47.63ms  p(99.9)=88.91ms
     iterations.....................: 183913  1528.65979/s
     success_rate...................: 100.00% ✓ 183913      ✗ 0     
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

     checks.........................: 100.00% ✓ 435174      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.13µs  min=1.06µs  med=2.22µs  max=4.04ms   p(90)=3.77µs   p(95)=4.46µs   p(99.9)=34.62µs
     http_req_connecting............: avg=556ns   min=0s      med=0s      max=4.01ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.11ms min=2.27ms  med=40.56ms max=304.61ms p(90)=57.74ms  p(95)=63.03ms  p(99.9)=87.61ms
       { expected_response:true }...: avg=41.11ms min=2.27ms  med=40.56ms max=304.61ms p(90)=57.74ms  p(95)=63.03ms  p(99.9)=87.61ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145158
     http_req_receiving.............: avg=86.66µs min=29.36µs med=65.21µs max=215.34ms p(90)=104.17µs p(95)=122.69µs p(99.9)=1.75ms 
     http_req_sending...............: avg=27.41µs min=5.3µs   med=10.97µs max=171.97ms p(90)=18.03µs  p(95)=21.81µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.99ms min=2.17ms  med=40.46ms max=303.41ms p(90)=57.62ms  p(95)=62.9ms   p(99.9)=86.62ms
     http_reqs......................: 145158  1206.772349/s
     iteration_duration.............: avg=41.35ms min=4.74ms  med=40.78ms max=345.04ms p(90)=57.94ms  p(95)=63.24ms  p(99.9)=87.97ms
     iterations.....................: 145058  1205.940998/s
     success_rate...................: 100.00% ✓ 145058      ✗ 0     
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

     checks.........................: 100.00% ✓ 185055     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 74 MB   615 kB/s
     http_req_blocked...............: avg=3.97µs  min=1.1µs   med=2.92µs  max=2.73ms   p(90)=4.44µs   p(95)=5.05µs   p(99.9)=91.65µs 
     http_req_connecting............: avg=804ns   min=0s      med=0s      max=2.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.89ms min=4.23ms  med=93.93ms max=343.78ms p(90)=117.1ms  p(95)=129.47ms p(99.9)=227.99ms
       { expected_response:true }...: avg=96.89ms min=4.23ms  med=93.93ms max=343.78ms p(90)=117.1ms  p(95)=129.47ms p(99.9)=227.99ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61785
     http_req_receiving.............: avg=91.14µs min=31.28µs med=81.3µs  max=118.88ms p(90)=115.34µs p(95)=127.97µs p(99.9)=801.24µs
     http_req_sending...............: avg=26.17µs min=5.65µs  med=14.21µs max=196.16ms p(90)=20.83µs  p(95)=23.02µs  p(99.9)=656.75µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.77ms min=4.15ms  med=93.82ms max=343.58ms p(90)=116.97ms p(95)=129.34ms p(99.9)=227.77ms
     http_reqs......................: 61785   512.412528/s
     iteration_duration.............: avg=97.28ms min=31.98ms med=94.18ms max=358ms    p(90)=117.37ms p(95)=129.77ms p(99.9)=228.85ms
     iterations.....................: 61685   511.58318/s
     success_rate...................: 100.00% ✓ 61685      ✗ 0    
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

     checks.........................: 100.00% ✓ 144579     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   480 kB/s
     http_req_blocked...............: avg=5.79µs   min=1.17µs  med=3.5µs    max=4.02ms   p(90)=4.95µs   p(95)=5.52µs   p(99.9)=276.16µs
     http_req_connecting............: avg=2.09µs   min=0s      med=0s       max=3.97ms   p(90)=0s       p(95)=0s       p(99.9)=98.67µs 
     http_req_duration..............: avg=124ms    min=5.83ms  med=121.57ms max=369.91ms p(90)=164.37ms p(95)=177.04ms p(99.9)=225.53ms
       { expected_response:true }...: avg=124ms    min=5.83ms  med=121.57ms max=369.91ms p(90)=164.37ms p(95)=177.04ms p(99.9)=225.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48293
     http_req_receiving.............: avg=95.94µs  min=32.58µs med=88.53µs  max=98.31ms  p(90)=120.16µs p(95)=132.72µs p(99.9)=684.42µs
     http_req_sending...............: avg=26.58µs  min=6.19µs  med=17.28µs  max=144.44ms p(90)=22.68µs  p(95)=24.62µs  p(99.9)=587.1µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.87ms min=5.69ms  med=121.45ms max=369.25ms p(90)=164.24ms p(95)=176.91ms p(99.9)=225.25ms
     http_reqs......................: 48293   399.991302/s
     iteration_duration.............: avg=124.53ms min=34.94ms med=121.9ms  max=392.6ms  p(90)=164.67ms p(95)=177.38ms p(99.9)=229.58ms
     iterations.....................: 48193   399.163043/s
     success_rate...................: 100.00% ✓ 48193      ✗ 0    
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

     checks.........................: 100.00% ✓ 89085      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=6.86µs   min=1.21µs  med=3.39µs   max=4.04ms   p(90)=4.76µs   p(95)=5.31µs   p(99.9)=1.66ms  
     http_req_connecting............: avg=3.28µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.64ms  
     http_req_duration..............: avg=201.21ms min=6.44ms  med=183.86ms max=576.79ms p(90)=244.24ms p(95)=395.63ms p(99.9)=522.06ms
       { expected_response:true }...: avg=201.21ms min=6.44ms  med=183.86ms max=576.79ms p(90)=244.24ms p(95)=395.63ms p(99.9)=522.06ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29795
     http_req_receiving.............: avg=104.88µs min=32.12µs med=95.85µs  max=141.11ms p(90)=127.93µs p(95)=141.63µs p(99.9)=608µs   
     http_req_sending...............: avg=34.93µs  min=6.2µs   med=17.69µs  max=181.71ms p(90)=22.55µs  p(95)=24.2µs   p(99.9)=580.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.07ms min=6.29ms  med=183.74ms max=576.67ms p(90)=244.11ms p(95)=395.52ms p(99.9)=521.95ms
     http_reqs......................: 29795   246.246621/s
     iteration_duration.............: avg=202.17ms min=56.04ms med=184.27ms max=577.12ms p(90)=244.7ms  p(95)=396.37ms p(99.9)=522.39ms
     iterations.....................: 29695   245.420151/s
     success_rate...................: 100.00% ✓ 29695      ✗ 0    
     vus............................: 7       min=7        max=50 
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

     checks.........................: 100.00% ✓ 86772      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=6.98µs   min=1.21µs  med=3.38µs   max=4.2ms    p(90)=4.72µs   p(95)=5.29µs   p(99.9)=1.6ms   
     http_req_connecting............: avg=3.33µs   min=0s      med=0s       max=4.17ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=206.51ms min=8.64ms  med=205.57ms max=437.3ms  p(90)=221.15ms p(95)=226.46ms p(99.9)=307.88ms
       { expected_response:true }...: avg=206.51ms min=8.64ms  med=205.57ms max=437.3ms  p(90)=221.15ms p(95)=226.46ms p(99.9)=307.88ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29024
     http_req_receiving.............: avg=106.11µs min=32.37µs med=94.38µs  max=112ms    p(90)=126.58µs p(95)=139.34µs p(99.9)=638.43µs
     http_req_sending...............: avg=32.25µs  min=6.25µs  med=17.58µs  max=217.11ms p(90)=22.32µs  p(95)=24.11µs  p(99.9)=588.82µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.37ms min=8.54ms  med=205.45ms max=431.2ms  p(90)=221.03ms p(95)=226.34ms p(99.9)=306.36ms
     http_reqs......................: 29024   239.711182/s
     iteration_duration.............: avg=207.53ms min=51.82ms med=206.09ms max=453.48ms p(90)=221.41ms p(95)=226.79ms p(99.9)=316.52ms
     iterations.....................: 28924   238.885275/s
     success_rate...................: 100.00% ✓ 28924      ✗ 0    
     vus............................: 42      min=42       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

