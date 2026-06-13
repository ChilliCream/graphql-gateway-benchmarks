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
| hive-router | v0.0.65 | 2,921 | 3,121 | 2,861 | 2.9% |  |
| hotchocolate | 16.1.3 | 2,145 | 2,198 | 2,120 | 1.3% |  |
| grafbase | 0.53.5 | 2,034 | 2,083 | 1,998 | 1.4% |  |
| cosmo | 0.321.1 | 1,202 | 1,225 | 1,187 | 1.1% | non-compatible response (4 across 3/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 568 | 581 | 565 | 1.0% |  |
| apollo-router | v2.15.0 | 410 | 422 | 404 | 1.5% |  |
| apollo-gateway | 2.14.1 | 245 | 248 | 243 | 0.7% |  |
| hive-gateway | 2.8.2 | 244 | 248 | 241 | 1.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.65 | 2,303 | 2,448 | 2,267 | 2.7% |  |
| hotchocolate | 16.1.3 | 1,938 | 2,005 | 1,911 | 1.5% |  |
| grafbase | 0.53.5 | 1,531 | 1,556 | 1,516 | 1.0% |  |
| cosmo | 0.321.1 | 1,133 | 1,146 | 1,121 | 0.6% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.8.2 | 542 | 557 | 537 | 1.2% |  |
| apollo-router | v2.15.0 | 381 | 393 | 377 | 1.5% |  |
| hive-gateway | 2.8.2 | 241 | 246 | 239 | 1.1% |  |
| apollo-gateway | 2.14.1 | 233 | 236 | 232 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.65)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1053078     ✗ 0     
     data_received..................: 31 GB   256 MB/s
     data_sent......................: 422 MB  3.5 MB/s
     http_req_blocked...............: avg=2.79µs   min=982ns   med=2µs     max=11.73ms  p(90)=3.07µs  p(95)=3.68µs   p(99.9)=30.91µs
     http_req_connecting............: avg=248ns    min=0s      med=0s      max=4.14ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.85ms  min=1.67ms  med=15.91ms max=306.74ms p(90)=25.08ms p(95)=29ms     p(99.9)=52.49ms
       { expected_response:true }...: avg=16.85ms  min=1.67ms  med=15.91ms max=306.74ms p(90)=25.08ms p(95)=29ms     p(99.9)=52.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 351126
     http_req_receiving.............: avg=127.75µs min=27.89µs med=48.26µs max=171.61ms p(90)=94.22µs p(95)=265.46µs p(99.9)=13.13ms
     http_req_sending...............: avg=61.01µs  min=5.28µs  med=8.79µs  max=287.05ms p(90)=14.81µs p(95)=118.77µs p(99.9)=11.91ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.66ms  min=1.6ms   med=15.76ms max=306.5ms  p(90)=24.82ms p(95)=28.6ms   p(99.9)=51.08ms
     http_reqs......................: 351126  2921.191815/s
     iteration_duration.............: avg=17.08ms  min=2.01ms  med=16.12ms max=318.77ms p(90)=25.3ms  p(95)=29.27ms  p(99.9)=53.56ms
     iterations.....................: 351026  2920.359866/s
     success_rate...................: 100.00% ✓ 351026      ✗ 0     
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

     checks.........................: 100.00% ✓ 774162      ✗ 0     
     data_received..................: 23 GB   188 MB/s
     data_sent......................: 310 MB  2.6 MB/s
     http_req_blocked...............: avg=2.73µs   min=942ns   med=2.02µs   max=13.65ms  p(90)=3.1µs    p(95)=3.7µs    p(99.9)=33.6µs  
     http_req_connecting............: avg=321ns    min=0s      med=0s       max=3.87ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.01ms  min=2.43ms  med=14.64ms  max=417.67ms p(90)=51.62ms  p(95)=69.89ms  p(99.9)=171.5ms 
       { expected_response:true }...: avg=23.01ms  min=2.43ms  med=14.64ms  max=417.67ms p(90)=51.62ms  p(95)=69.89ms  p(99.9)=171.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 258154
     http_req_receiving.............: avg=657.05µs min=50.52µs med=104.68µs max=245.99ms p(90)=964.89µs p(95)=1.49ms   p(99.9)=60.54ms 
     http_req_sending...............: avg=45.1µs   min=5.33µs  med=9.23µs   max=293.36ms p(90)=15.87µs  p(95)=106.95µs p(99.9)=3.24ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.31ms  min=2.34ms  med=14.12ms  max=311.22ms p(90)=50.22ms  p(95)=68.42ms  p(99.9)=168.33ms
     http_reqs......................: 258154  2145.878509/s
     iteration_duration.............: avg=23.24ms  min=3.16ms  med=14.86ms  max=417.9ms  p(90)=51.88ms  p(95)=70.14ms  p(99.9)=172.45ms
     iterations.....................: 258054  2145.047269/s
     success_rate...................: 100.00% ✓ 258054      ✗ 0     
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

     checks.........................: 100.00% ✓ 733656      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=3.13µs   min=932ns   med=2.2µs   max=7.99ms   p(90)=3.53µs  p(95)=4.23µs  p(99.9)=38.39µs
     http_req_connecting............: avg=478ns    min=0s      med=0s      max=4.61ms   p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=24.29ms  min=1.93ms  med=24.04ms max=310.57ms p(90)=29.12ms p(95)=31.27ms p(99.9)=52.78ms
       { expected_response:true }...: avg=24.29ms  min=1.93ms  med=24.04ms max=310.57ms p(90)=29.12ms p(95)=31.27ms p(99.9)=52.78ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244652
     http_req_receiving.............: avg=106.28µs min=30.67µs med=58.09µs max=99.38ms  p(90)=98.31µs p(95)=165.1µs p(99.9)=8.2ms  
     http_req_sending...............: avg=41.25µs  min=5.02µs  med=9.84µs  max=137.54ms p(90)=16.45µs p(95)=93.35µs p(99.9)=2.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=24.14ms  min=1.86ms  med=23.93ms max=310.36ms p(90)=28.96ms p(95)=31.03ms p(99.9)=51.6ms 
     http_reqs......................: 244652  2034.487739/s
     iteration_duration.............: avg=24.52ms  min=3.42ms  med=24.24ms max=351.27ms p(90)=29.35ms p(95)=31.5ms  p(99.9)=53.26ms
     iterations.....................: 244552  2033.656155/s
     success_rate...................: 100.00% ✓ 244552      ✗ 0     
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

     checks.........................: 100.00% ✓ 433599      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.35µs  min=952ns   med=2.35µs  max=3.94ms   p(90)=3.7µs   p(95)=4.3µs    p(99.9)=33.11µs
     http_req_connecting............: avg=698ns   min=0s      med=0s      max=3.9ms    p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.27ms min=2.17ms  med=40.78ms max=339.74ms p(90)=58.14ms p(95)=63.4ms   p(99.9)=88.98ms
       { expected_response:true }...: avg=41.27ms min=2.17ms  med=40.78ms max=339.74ms p(90)=58.14ms p(95)=63.4ms   p(99.9)=88.98ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144633
     http_req_receiving.............: avg=78.98µs min=29.69µs med=60.02µs max=125.46ms p(90)=94.8µs  p(95)=111.44µs p(99.9)=1.77ms 
     http_req_sending...............: avg=24.14µs min=5.25µs  med=10.25µs max=58.81ms  p(90)=15.54µs p(95)=19.27µs  p(99.9)=1.17ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.16ms min=2.05ms  med=40.68ms max=339.02ms p(90)=58.02ms p(95)=63.29ms  p(99.9)=88.81ms
     http_reqs......................: 144633  1202.461532/s
     iteration_duration.............: avg=41.5ms  min=4.07ms  med=40.98ms max=354.99ms p(90)=58.34ms p(95)=63.6ms   p(99.9)=89.31ms
     iterations.....................: 144533  1201.630144/s
     success_rate...................: 100.00% ✓ 144533      ✗ 0     
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

     checks.........................: 100.00% ✓ 205398     ✗ 0    
     data_received..................: 6.0 GB  50 MB/s
     data_sent......................: 82 MB   683 kB/s
     http_req_blocked...............: avg=5µs     min=1.05µs  med=2.99µs  max=4.87ms   p(90)=4.68µs   p(95)=5.32µs   p(99.9)=41.19µs 
     http_req_connecting............: avg=1.65µs  min=0s      med=0s      max=4.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=87.28ms min=4.15ms  med=85.08ms max=308.06ms p(90)=107.43ms p(95)=118.96ms p(99.9)=210.7ms 
       { expected_response:true }...: avg=87.28ms min=4.15ms  med=85.08ms max=308.06ms p(90)=107.43ms p(95)=118.96ms p(99.9)=210.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 68566
     http_req_receiving.............: avg=89.06µs min=31.49µs med=78.61µs max=45.11ms  p(90)=114.07µs p(95)=128.27µs p(99.9)=937.59µs
     http_req_sending...............: avg=23.4µs  min=5.72µs  med=13.41µs max=83.78ms  p(90)=19.95µs  p(95)=22.22µs  p(99.9)=753.54µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=87.17ms min=4.04ms  med=84.97ms max=307.63ms p(90)=107.3ms  p(95)=118.81ms p(99.9)=210.5ms 
     http_reqs......................: 68566   568.806311/s
     iteration_duration.............: avg=87.65ms min=26.88ms med=85.33ms max=345.04ms p(90)=107.68ms p(95)=119.26ms p(99.9)=212.15ms
     iterations.....................: 68466   567.976736/s
     success_rate...................: 100.00% ✓ 68466      ✗ 0    
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

     checks.........................: 100.00% ✓ 148197     ✗ 0    
     data_received..................: 4.3 GB  36 MB/s
     data_sent......................: 59 MB   493 kB/s
     http_req_blocked...............: avg=5.33µs   min=1.2µs   med=3.07µs   max=4.07ms   p(90)=4.49µs   p(95)=5.02µs   p(99.9)=137.96µs
     http_req_connecting............: avg=2.04µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=78.04µs 
     http_req_duration..............: avg=121ms    min=5.25ms  med=120.68ms max=357.34ms p(90)=146.19ms p(95)=153.84ms p(99.9)=192.7ms 
       { expected_response:true }...: avg=121ms    min=5.25ms  med=120.68ms max=357.34ms p(90)=146.19ms p(95)=153.84ms p(99.9)=192.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 49499
     http_req_receiving.............: avg=86.87µs  min=31.4µs  med=78.75µs  max=114.83ms p(90)=110.3µs  p(95)=122.02µs p(99.9)=706.73µs
     http_req_sending...............: avg=23.44µs  min=5.91µs  med=14.12µs  max=164.44ms p(90)=19.62µs  p(95)=21.46µs  p(99.9)=568.08µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=120.89ms min=5.18ms  med=120.57ms max=356.64ms p(90)=146.08ms p(95)=153.73ms p(99.9)=190.11ms
     http_reqs......................: 49499   410.174889/s
     iteration_duration.............: avg=121.49ms min=15.21ms med=120.95ms max=366.85ms p(90)=146.45ms p(95)=154.08ms p(99.9)=194.58ms
     iterations.....................: 49399   409.346236/s
     success_rate...................: 100.00% ✓ 49399      ✗ 0    
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

     checks.........................: 100.00% ✓ 88722      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=6.47µs   min=1.26µs  med=3.29µs   max=4.17ms   p(90)=4.51µs   p(95)=4.99µs   p(99.9)=1.16ms  
     http_req_connecting............: avg=3.04µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.14ms  
     http_req_duration..............: avg=202.1ms  min=8.4ms   med=208.11ms max=385.19ms p(90)=215.07ms p(95)=219.66ms p(99.9)=292.7ms 
       { expected_response:true }...: avg=202.1ms  min=8.4ms   med=208.11ms max=385.19ms p(90)=215.07ms p(95)=219.66ms p(99.9)=292.7ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 29674
     http_req_receiving.............: avg=92.73µs  min=35.38µs med=89.39µs  max=1.41ms   p(90)=119.35µs p(95)=130.76µs p(99.9)=478.67µs
     http_req_sending...............: avg=22.7µs   min=5.92µs  med=15.72µs  max=30.19ms  p(90)=20.43µs  p(95)=22.27µs  p(99.9)=544.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.99ms min=8.3ms   med=208ms    max=384.98ms p(90)=214.95ms p(95)=219.55ms p(99.9)=292.63ms
     http_reqs......................: 29674   245.123061/s
     iteration_duration.............: avg=203.01ms min=60.92ms med=208.37ms max=390.93ms p(90)=215.33ms p(95)=219.91ms p(99.9)=292.91ms
     iterations.....................: 29574   244.297008/s
     success_rate...................: 100.00% ✓ 29574      ✗ 0    
     vus............................: 34      min=34       max=50 
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

     checks.........................: 100.00% ✓ 88584      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=7.09µs   min=1.26µs  med=3.55µs   max=4ms      p(90)=5.02µs   p(95)=5.66µs   p(99.9)=1.73ms  
     http_req_connecting............: avg=3.31µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.7ms   
     http_req_duration..............: avg=202.34ms min=6.64ms  med=185.76ms max=719.6ms  p(90)=243.29ms p(95)=407.98ms p(99.9)=600.44ms
       { expected_response:true }...: avg=202.34ms min=6.64ms  med=185.76ms max=719.6ms  p(90)=243.29ms p(95)=407.98ms p(99.9)=600.44ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29628
     http_req_receiving.............: avg=107.08µs min=36.32µs med=96.78µs  max=91.82ms  p(90)=129.37µs p(95)=143.38µs p(99.9)=503.35µs
     http_req_sending...............: avg=25.23µs  min=6.24µs  med=17.58µs  max=33.52ms  p(90)=22.71µs  p(95)=24.65µs  p(99.9)=597.5µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.21ms min=6.51ms  med=185.62ms max=719.51ms p(90)=243.17ms p(95)=407.86ms p(99.9)=600.34ms
     http_reqs......................: 29628   244.811421/s
     iteration_duration.............: avg=203.31ms min=41.46ms med=186.12ms max=719.78ms p(90)=244ms    p(95)=409.44ms p(99.9)=600.72ms
     iterations.....................: 29528   243.985137/s
     success_rate...................: 100.00% ✓ 29528      ✗ 0    
     vus............................: 17      min=17       max=50 
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

     checks.........................: 100.00% ✓ 830748     ✗ 0     
     data_received..................: 24 GB   201 MB/s
     data_sent......................: 333 MB  2.8 MB/s
     http_req_blocked...............: avg=2.78µs   min=942ns   med=2.16µs  max=9.5ms    p(90)=3.58µs  p(95)=4.4µs    p(99.9)=35.22µs
     http_req_connecting............: avg=138ns    min=0s      med=0s      max=1.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=21.42ms  min=1.92ms  med=20.98ms max=306.56ms p(90)=29.72ms p(95)=32.68ms  p(99.9)=54.86ms
       { expected_response:true }...: avg=21.42ms  min=1.92ms  med=20.98ms max=306.56ms p(90)=29.72ms p(95)=32.68ms  p(99.9)=54.86ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 277016
     http_req_receiving.............: avg=110.54µs min=28.51µs med=54.3µs  max=126.73ms p(90)=99.15µs p(95)=232.39µs p(99.9)=9.61ms 
     http_req_sending...............: avg=51.78µs  min=5.11µs  med=9.54µs  max=181.63ms p(90)=16.88µs p(95)=118.57µs p(99.9)=5.89ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=21.26ms  min=1.8ms   med=20.84ms max=303.2ms  p(90)=29.52ms p(95)=32.42ms  p(99.9)=54.36ms
     http_reqs......................: 277016  2303.83017/s
     iteration_duration.............: avg=21.65ms  min=3.1ms   med=21.19ms max=324.27ms p(90)=29.94ms p(95)=32.92ms  p(99.9)=55.43ms
     iterations.....................: 276916  2302.99851/s
     success_rate...................: 100.00% ✓ 276916     ✗ 0     
     vus............................: 50      min=50       max=50  
     vus_max........................: 50      min=50       max=50
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

     checks.........................: 100.00% ✓ 698871      ✗ 0     
     data_received..................: 20 GB   170 MB/s
     data_sent......................: 280 MB  2.3 MB/s
     http_req_blocked...............: avg=2.94µs  min=992ns   med=2.17µs   max=14.42ms  p(90)=3.6µs   p(95)=4.35µs  p(99.9)=34.46µs 
     http_req_connecting............: avg=286ns   min=0s      med=0s       max=3.16ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.51ms min=1.95ms  med=17.29ms  max=557.84ms p(90)=54.35ms p(95)=71.71ms p(99.9)=191.02ms
       { expected_response:true }...: avg=25.51ms min=1.95ms  med=17.29ms  max=557.84ms p(90)=54.35ms p(95)=71.71ms p(99.9)=191.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 233057
     http_req_receiving.............: avg=714.8µs min=51.66µs med=107.92µs max=173.25ms p(90)=1.12ms  p(95)=1.79ms  p(99.9)=63.78ms 
     http_req_sending...............: avg=42.26µs min=5.09µs  med=9.5µs    max=229.24ms p(90)=17.71µs p(95)=96.98µs p(99.9)=2.48ms  
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.75ms min=1.84ms  med=16.73ms  max=552.59ms p(90)=52.91ms p(95)=70.11ms p(99.9)=188.54ms
     http_reqs......................: 233057  1938.205039/s
     iteration_duration.............: avg=25.74ms min=2.8ms   med=17.51ms  max=558.07ms p(90)=54.58ms p(95)=71.97ms p(99.9)=193.67ms
     iterations.....................: 232957  1937.373394/s
     success_rate...................: 100.00% ✓ 232957      ✗ 0     
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

     checks.........................: 100.00% ✓ 552504      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.49µs   min=982ns   med=2.32µs  max=4.06ms   p(90)=4.64µs   p(95)=5.84µs   p(99.9)=46.74µs
     http_req_connecting............: avg=502ns    min=0s      med=0s      max=4.03ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.3ms   min=2.3ms   med=31.44ms max=340.18ms p(90)=42.97ms  p(95)=47.61ms  p(99.9)=87.82ms
       { expected_response:true }...: avg=32.3ms   min=2.3ms   med=31.44ms max=340.18ms p(90)=42.97ms  p(95)=47.61ms  p(99.9)=87.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184268
     http_req_receiving.............: avg=113.33µs min=30.74µs med=60.13µs max=180.21ms p(90)=131.79µs p(95)=273.83µs p(99.9)=5.85ms 
     http_req_sending...............: avg=46.22µs  min=5.38µs  med=10.18µs max=145.58ms p(90)=24.01µs  p(95)=132.76µs p(99.9)=3.37ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.14ms  min=2.19ms  med=31.31ms max=339.53ms p(90)=42.79ms  p(95)=47.35ms  p(99.9)=86.93ms
     http_reqs......................: 184268  1531.524949/s
     iteration_duration.............: avg=32.57ms  min=3.91ms  med=31.68ms max=352.77ms p(90)=43.2ms   p(95)=47.85ms  p(99.9)=89.09ms
     iterations.....................: 184168  1530.693809/s
     success_rate...................: 100.00% ✓ 184168      ✗ 0     
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

     checks.........................: 100.00% ✓ 408699      ✗ 0     
     data_received..................: 12 GB   99 MB/s
     data_sent......................: 164 MB  1.4 MB/s
     http_req_blocked...............: avg=3.02µs   min=1.05µs med=2.17µs  max=3.73ms   p(90)=3.47µs   p(95)=4.07µs   p(99.9)=35.98µs
     http_req_connecting............: avg=534ns    min=0s     med=0s      max=3.7ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=43.79ms  min=2.22ms med=43.24ms max=324.97ms p(90)=61.58ms  p(95)=67.18ms  p(99.9)=92.8ms 
       { expected_response:true }...: avg=43.79ms  min=2.22ms med=43.24ms max=324.97ms p(90)=61.58ms  p(95)=67.18ms  p(99.9)=92.8ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 136333
     http_req_receiving.............: avg=106.76µs min=29.2µs med=63.81µs max=194.32ms p(90)=100.37µs p(95)=117.38µs p(99.9)=1.81ms 
     http_req_sending...............: avg=23.21µs  min=5.25µs med=10.6µs  max=40.67ms  p(90)=16.61µs  p(95)=19.83µs  p(99.9)=1.08ms 
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=43.66ms  min=2.15ms med=43.14ms max=145.08ms p(90)=61.47ms  p(95)=67.06ms  p(99.9)=92.22ms
     http_reqs......................: 136333  1133.317056/s
     iteration_duration.............: avg=44.03ms  min=4.23ms med=43.45ms max=351.11ms p(90)=61.78ms  p(95)=67.38ms  p(99.9)=93.14ms
     iterations.....................: 136233  1132.48577/s
     success_rate...................: 100.00% ✓ 136233      ✗ 0     
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

     checks.........................: 100.00% ✓ 195867     ✗ 0    
     data_received..................: 5.7 GB  48 MB/s
     data_sent......................: 79 MB   651 kB/s
     http_req_blocked...............: avg=5.1µs   min=1.21µs  med=3.2µs   max=4.52ms   p(90)=4.86µs   p(95)=5.52µs   p(99.9)=71.6µs  
     http_req_connecting............: avg=1.61µs  min=0s      med=0s      max=4.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.51ms min=4.21ms  med=88.93ms max=344.96ms p(90)=112.37ms p(95)=124.28ms p(99.9)=226.35ms
       { expected_response:true }...: avg=91.51ms min=4.21ms  med=88.93ms max=344.96ms p(90)=112.37ms p(95)=124.28ms p(99.9)=226.35ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65389
     http_req_receiving.............: avg=93µs    min=31.64µs med=82.8µs  max=113.8ms  p(90)=117.22µs p(95)=130.97µs p(99.9)=884.64µs
     http_req_sending...............: avg=26.04µs min=5.66µs  med=14.31µs max=218.76ms p(90)=20.9µs   p(95)=23.13µs  p(99.9)=746.9µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.39ms min=4.09ms  med=88.81ms max=343.65ms p(90)=112.27ms p(95)=124.14ms p(99.9)=225.99ms
     http_reqs......................: 65389   542.328964/s
     iteration_duration.............: avg=91.91ms min=23.99ms med=89.19ms max=357.5ms  p(90)=112.64ms p(95)=124.6ms  p(99.9)=229.05ms
     iterations.....................: 65289   541.499575/s
     success_rate...................: 100.00% ✓ 65289      ✗ 0    
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

     checks.........................: 100.00% ✓ 138015     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   459 kB/s
     http_req_blocked...............: avg=5.78µs   min=1.22µs  med=3.37µs   max=4.06ms   p(90)=4.82µs   p(95)=5.41µs   p(99.9)=250.9µs 
     http_req_connecting............: avg=2.23µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=211.13µs
     http_req_duration..............: avg=129.9ms  min=5.7ms   med=127.27ms max=343.08ms p(90)=172.4ms  p(95)=185.72ms p(99.9)=238.26ms
       { expected_response:true }...: avg=129.9ms  min=5.7ms   med=127.27ms max=343.08ms p(90)=172.4ms  p(95)=185.72ms p(99.9)=238.26ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46105
     http_req_receiving.............: avg=90.05µs  min=31.93µs med=85.14µs  max=21.84ms  p(90)=116.41µs p(95)=127.66µs p(99.9)=658.18µs
     http_req_sending...............: avg=31.1µs   min=6.16µs  med=15.5µs   max=140.66ms p(90)=20.93µs  p(95)=22.71µs  p(99.9)=571.83µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=129.78ms min=5.52ms  med=127.15ms max=341.19ms p(90)=172.25ms p(95)=185.62ms p(99.9)=238.15ms
     http_reqs......................: 46105   381.947568/s
     iteration_duration.............: avg=130.44ms min=30.59ms med=127.58ms max=353.14ms p(90)=172.71ms p(95)=186.11ms p(99.9)=240.86ms
     iterations.....................: 46005   381.119138/s
     success_rate...................: 100.00% ✓ 46005      ✗ 0    
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

     checks.........................: 100.00% ✓ 87435      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   290 kB/s
     http_req_blocked...............: avg=7.2µs    min=1.24µs  med=3.48µs   max=4ms      p(90)=4.87µs   p(95)=5.47µs   p(99.9)=1.83ms  
     http_req_connecting............: avg=3.53µs   min=0s      med=0s       max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=1.8ms   
     http_req_duration..............: avg=205.05ms min=6.39ms  med=207.33ms max=742.56ms p(90)=272.58ms p(95)=342.59ms p(99.9)=649.39ms
       { expected_response:true }...: avg=205.05ms min=6.39ms  med=207.33ms max=742.56ms p(90)=272.58ms p(95)=342.59ms p(99.9)=649.39ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29245
     http_req_receiving.............: avg=113.72µs min=35.08µs med=95.09µs  max=116.68ms p(90)=126.88µs p(95)=139.92µs p(99.9)=840.46µs
     http_req_sending...............: avg=31.28µs  min=5.93µs  med=17.06µs  max=117.12ms p(90)=21.9µs   p(95)=23.73µs  p(99.9)=611.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=204.9ms  min=6.25ms  med=207.2ms  max=742.44ms p(90)=272.43ms p(95)=342.47ms p(99.9)=649.27ms
     http_reqs......................: 29245   241.831891/s
     iteration_duration.............: avg=206ms    min=29.56ms med=207.74ms max=742.8ms  p(90)=273.07ms p(95)=345.13ms p(99.9)=649.61ms
     iterations.....................: 29145   241.004974/s
     success_rate...................: 100.00% ✓ 29145      ✗ 0    
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

     checks.........................: 100.00% ✓ 84696      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   281 kB/s
     http_req_blocked...............: avg=6.75µs   min=1.3µs   med=3.33µs   max=3.68ms   p(90)=4.58µs   p(95)=5.11µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.14µs   min=0s      med=0s       max=3.65ms   p(90)=0s       p(95)=0s       p(99.9)=1.6ms   
     http_req_duration..............: avg=211.63ms min=8.68ms  med=196.77ms max=417.09ms p(90)=272.12ms p(95)=278.59ms p(99.9)=357.48ms
       { expected_response:true }...: avg=211.63ms min=8.68ms  med=196.77ms max=417.09ms p(90)=272.12ms p(95)=278.59ms p(99.9)=357.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28332
     http_req_receiving.............: avg=101.21µs min=35.59µs med=91.91µs  max=89.69ms  p(90)=122.9µs  p(95)=134.98µs p(99.9)=409.83µs
     http_req_sending...............: avg=25.17µs  min=6.34µs  med=16.36µs  max=63.22ms  p(90)=21.09µs  p(95)=22.98µs  p(99.9)=515.05µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=211.5ms  min=8.49ms  med=196.67ms max=416.53ms p(90)=271.98ms p(95)=278.47ms p(99.9)=357.4ms 
     http_reqs......................: 28332   233.949198/s
     iteration_duration.............: avg=212.64ms min=39.57ms med=197.17ms max=428.43ms p(90)=272.43ms p(95)=278.94ms p(99.9)=360.83ms
     iterations.....................: 28232   233.123456/s
     success_rate...................: 100.00% ✓ 28232      ✗ 0    
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

