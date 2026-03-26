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
| hive-router | v0.0.42 | 2,922 | 3,199 | 2,859 | 3.8% |  |
| hotchocolate | 16.0.0-rc.1.15 | 2,092 | 2,142 | 2,079 | 1.0% |  |
| grafbase | 0.53.2 | 2,032 | 2,103 | 2,010 | 1.5% |  |
| cosmo | 0.295.0 | 1,245 | 1,263 | 1,233 | 0.8% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 606 | 619 | 602 | 1.0% |  |
| apollo-router | v2.12.0 | 432 | 442 | 428 | 1.1% |  |
| hive-gateway | 2.5.11 | 271 | 276 | 267 | 1.1% |  |
| apollo-gateway | 2.13.3 | 243 | 245 | 241 | 0.6% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.42 | 2,433 | 2,571 | 2,406 | 2.2% |  |
| hotchocolate | 16.0.0-rc.1.15 | 1,926 | 1,971 | 1,898 | 1.2% |  |
| grafbase | 0.53.2 | 1,536 | 1,558 | 1,520 | 0.8% |  |
| cosmo | 0.295.0 | 1,217 | 1,234 | 1,211 | 0.7% | non-compatible response (2 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.11 | 585 | 593 | 578 | 0.7% |  |
| apollo-router | v2.12.0 | 376 | 385 | 368 | 1.5% | non-compatible response (1 across 1/9 runs) |
| hive-gateway | 2.5.11 | 262 | 268 | 259 | 1.2% |  |
| apollo-gateway | 2.13.3 | 234 | 238 | 233 | 0.8% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1053657     ✗ 0     
     data_received..................: 31 GB   256 MB/s
     data_sent......................: 422 MB  3.5 MB/s
     http_req_blocked...............: avg=2.9µs    min=992ns   med=2.16µs  max=6.68ms   p(90)=3.38µs   p(95)=4.06µs   p(99.9)=30.49µs
     http_req_connecting............: avg=312ns    min=0s      med=0s      max=4.6ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.85ms  min=1.57ms  med=16.13ms max=333.49ms p(90)=24.41ms  p(95)=27.96ms  p(99.9)=51.47ms
       { expected_response:true }...: avg=16.85ms  min=1.57ms  med=16.13ms max=333.49ms p(90)=24.41ms  p(95)=27.96ms  p(99.9)=51.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 351319
     http_req_receiving.............: avg=125.77µs min=27.81µs med=50.75µs max=295.39ms p(90)=100.53µs p(95)=275.6µs  p(99.9)=10.76ms
     http_req_sending...............: avg=58.3µs   min=5.18µs  med=9.2µs   max=312.83ms p(90)=15.88µs  p(95)=122.99µs p(99.9)=7.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.66ms  min=1.51ms  med=15.99ms max=325.04ms p(90)=24.15ms  p(95)=27.61ms  p(99.9)=50.03ms
     http_reqs......................: 351319  2922.648983/s
     iteration_duration.............: avg=17.07ms  min=1.99ms  med=16.34ms max=365.87ms p(90)=24.63ms  p(95)=28.21ms  p(99.9)=52.69ms
     iterations.....................: 351219  2921.817075/s
     success_rate...................: 100.00% ✓ 351219      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.0.0-rc.1.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 754962      ✗ 0     
     data_received..................: 22 GB   183 MB/s
     data_sent......................: 303 MB  2.5 MB/s
     http_req_blocked...............: avg=3.03µs   min=992ns   med=2.28µs   max=9.16ms   p(90)=3.47µs  p(95)=4.08µs   p(99.9)=35.4µs  
     http_req_connecting............: avg=347ns    min=0s      med=0s       max=3.7ms    p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=23.6ms   min=2.54ms  med=15.2ms   max=326.14ms p(90)=52.68ms p(95)=71.4ms   p(99.9)=166.25ms
       { expected_response:true }...: avg=23.6ms   min=2.54ms  med=15.2ms   max=326.14ms p(90)=52.68ms p(95)=71.4ms   p(99.9)=166.25ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 251754
     http_req_receiving.............: avg=701.25µs min=52.02µs med=107.99µs max=149.94ms p(90)=1.02ms  p(95)=1.61ms   p(99.9)=63.15ms 
     http_req_sending...............: avg=45.36µs  min=5.25µs  med=9.4µs    max=207.78ms p(90)=15.87µs p(95)=108.74µs p(99.9)=3.22ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.85ms  min=2.44ms  med=14.65ms  max=325.54ms p(90)=51.15ms p(95)=69.86ms  p(99.9)=163.94ms
     http_reqs......................: 251754  2092.618038/s
     iteration_duration.............: avg=23.83ms  min=3.21ms  med=15.41ms  max=336.99ms p(90)=52.92ms p(95)=71.65ms  p(99.9)=167.78ms
     iterations.....................: 251654  2091.786823/s
     success_rate...................: 100.00% ✓ 251654      ✗ 0     
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

     checks.........................: 100.00% ✓ 733053      ✗ 0     
     data_received..................: 22 GB   179 MB/s
     data_sent......................: 294 MB  2.4 MB/s
     http_req_blocked...............: avg=3.4µs    min=872ns   med=2.49µs  max=14.75ms  p(90)=3.98µs   p(95)=4.73µs   p(99.9)=43.42µs
     http_req_connecting............: avg=327ns    min=0s      med=0s      max=3.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.3ms   min=2.02ms  med=24.05ms max=328.08ms p(90)=29.13ms  p(95)=31.38ms  p(99.9)=53.67ms
       { expected_response:true }...: avg=24.3ms   min=2.02ms  med=24.05ms max=328.08ms p(90)=29.13ms  p(95)=31.38ms  p(99.9)=53.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 244451
     http_req_receiving.............: avg=110.45µs min=30.15µs med=59.88µs max=43.43ms  p(90)=103.31µs p(95)=204µs    p(99.9)=8.74ms 
     http_req_sending...............: avg=45.35µs  min=5.13µs  med=10.12µs max=146.49ms p(90)=17.44µs  p(95)=118.83µs p(99.9)=3.12ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.15ms  min=1.91ms  med=23.93ms max=312.13ms p(90)=28.96ms  p(95)=31.12ms  p(99.9)=52.84ms
     http_reqs......................: 244451  2032.759839/s
     iteration_duration.............: avg=24.54ms  min=3.98ms  med=24.26ms max=350.7ms  p(90)=29.36ms  p(95)=31.61ms  p(99.9)=54.23ms
     iterations.....................: 244351  2031.928278/s
     success_rate...................: 100.00% ✓ 244351      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (rust subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 449085      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 180 MB  1.5 MB/s
     http_req_blocked...............: avg=2.96µs  min=1.12µs  med=2.38µs  max=2.59ms   p(90)=3.57µs  p(95)=4.15µs   p(99.9)=35.72µs
     http_req_connecting............: avg=308ns   min=0s      med=0s      max=2.56ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.84ms min=2.18ms  med=39.2ms  max=359.79ms p(90)=56.28ms p(95)=61.4ms   p(99.9)=86.76ms
       { expected_response:true }...: avg=39.84ms min=2.18ms  med=39.2ms  max=359.79ms p(90)=56.28ms p(95)=61.4ms   p(99.9)=86.76ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149795
     http_req_receiving.............: avg=80.29µs min=29.59µs med=61.07µs max=138.83ms p(90)=95.33µs p(95)=113.06µs p(99.9)=1.81ms 
     http_req_sending...............: avg=26.61µs min=5.23µs  med=10.19µs max=247.65ms p(90)=14.75µs p(95)=18.65µs  p(99.9)=1.19ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.73ms min=2.06ms  med=39.1ms  max=359.1ms  p(90)=56.17ms p(95)=61.3ms   p(99.9)=86.42ms
     http_reqs......................: 149795  1245.394284/s
     iteration_duration.............: avg=40.07ms min=3.77ms  med=39.39ms max=369.76ms p(90)=56.48ms p(95)=61.61ms  p(99.9)=87.2ms 
     iterations.....................: 149695  1244.562885/s
     success_rate...................: 100.00% ✓ 149695      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (rust subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 219054     ✗ 0    
     data_received..................: 6.4 GB  53 MB/s
     data_sent......................: 88 MB   729 kB/s
     http_req_blocked...............: avg=5.45µs  min=1.11µs  med=2.78µs  max=62.18ms  p(90)=4.26µs   p(95)=4.86µs   p(99.9)=47.3µs  
     http_req_connecting............: avg=1.5µs   min=0s      med=0s      max=4.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=81.83ms min=3.73ms  med=79.69ms max=373.42ms p(90)=103.33ms p(95)=114.77ms p(99.9)=211.17ms
       { expected_response:true }...: avg=81.83ms min=3.73ms  med=79.69ms max=373.42ms p(90)=103.33ms p(95)=114.77ms p(99.9)=211.17ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 73118
     http_req_receiving.............: avg=90.06µs min=30.37µs med=74.41µs max=174.68ms p(90)=108.41µs p(95)=121.14µs p(99.9)=912.32µs
     http_req_sending...............: avg=20.7µs  min=5.52µs  med=12.51µs max=99.98ms  p(90)=18.56µs  p(95)=20.93µs  p(99.9)=654.67µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=81.72ms min=3.67ms  med=79.59ms max=327.3ms  p(90)=103.21ms p(95)=114.64ms p(99.9)=211.05ms
     http_reqs......................: 73118   606.777237/s
     iteration_duration.............: avg=82.17ms min=16.55ms med=79.93ms max=384.65ms p(90)=103.56ms p(95)=115.02ms p(99.9)=214.13ms
     iterations.....................: 73018   605.947376/s
     success_rate...................: 100.00% ✓ 73018      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (rust subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 156171     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   519 kB/s
     http_req_blocked...............: avg=5.55µs   min=1.18µs  med=3.24µs   max=4ms      p(90)=4.7µs    p(95)=5.25µs   p(99.9)=197.65µs
     http_req_connecting............: avg=2.1µs    min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.82ms min=5.38ms  med=114.72ms max=382.01ms p(90)=138.6ms  p(95)=145.74ms p(99.9)=178.13ms
       { expected_response:true }...: avg=114.82ms min=5.38ms  med=114.72ms max=382.01ms p(90)=138.6ms  p(95)=145.74ms p(99.9)=178.13ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52157
     http_req_receiving.............: avg=119.21µs min=31.58µs med=82.8µs   max=115.04ms p(90)=114.79µs p(95)=127.26µs p(99.9)=1.32ms  
     http_req_sending...............: avg=26.22µs  min=5.83µs  med=15.12µs  max=117.82ms p(90)=20.74µs  p(95)=22.59µs  p(99.9)=580.55µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.68ms min=5.25ms  med=114.61ms max=313.27ms p(90)=138.48ms p(95)=145.62ms p(99.9)=177.71ms
     http_reqs......................: 52157   432.132769/s
     iteration_duration.............: avg=115.3ms  min=7.72ms  med=114.99ms max=391.62ms p(90)=138.86ms p(95)=145.99ms p(99.9)=181.66ms
     iterations.....................: 52057   431.304246/s
     success_rate...................: 100.00% ✓ 52057      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (rust subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 98082      ✗ 0    
     data_received..................: 2.9 GB  24 MB/s
     data_sent......................: 39 MB   326 kB/s
     http_req_blocked...............: avg=5.18µs   min=1.31µs  med=3.45µs   max=4.29ms   p(90)=4.95µs   p(95)=5.58µs   p(99.9)=524.68µs
     http_req_connecting............: avg=1.4µs    min=0s      med=0s       max=2.41ms   p(90)=0s       p(95)=0s       p(99.9)=488.09µs
     http_req_duration..............: avg=182.77ms min=5.91ms  med=166.04ms max=654.96ms p(90)=215.7ms  p(95)=372.34ms p(99.9)=527.81ms
       { expected_response:true }...: avg=182.77ms min=5.91ms  med=166.04ms max=654.96ms p(90)=215.7ms  p(95)=372.34ms p(99.9)=527.81ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 32794
     http_req_receiving.............: avg=123.69µs min=34.79µs med=94.56µs  max=180.82ms p(90)=127.12µs p(95)=140.68µs p(99.9)=994.5µs 
     http_req_sending...............: avg=28.55µs  min=6.25µs  med=16.95µs  max=183.16ms p(90)=22.33µs  p(95)=24.16µs  p(99.9)=523.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=182.62ms min=5.81ms  med=165.91ms max=654.81ms p(90)=215.55ms p(95)=372.24ms p(99.9)=527.66ms
     http_reqs......................: 32794   271.203148/s
     iteration_duration.............: avg=183.61ms min=48.57ms med=166.4ms  max=655.2ms  p(90)=216.14ms p(95)=373.66ms p(99.9)=528.05ms
     iterations.....................: 32694   270.376158/s
     success_rate...................: 100.00% ✓ 32694      ✗ 0    
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

     checks.........................: 100.00% ✓ 88266      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   293 kB/s
     http_req_blocked...............: avg=7.18µs   min=1.17µs  med=3.16µs   max=9.52ms   p(90)=4.4µs    p(95)=4.87µs   p(99.9)=1.85ms  
     http_req_connecting............: avg=3.86µs   min=0s      med=0s       max=9.46ms   p(90)=0s       p(95)=0s       p(99.9)=1.83ms  
     http_req_duration..............: avg=203.1ms  min=8.55ms  med=208.69ms max=430.91ms p(90)=220.18ms p(95)=228.86ms p(99.9)=289.46ms
       { expected_response:true }...: avg=203.1ms  min=8.55ms  med=208.69ms max=430.91ms p(90)=220.18ms p(95)=228.86ms p(99.9)=289.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29522
     http_req_receiving.............: avg=93.39µs  min=35.34µs med=86.89µs  max=69.56ms  p(90)=117.93µs p(95)=129.82µs p(99.9)=489.52µs
     http_req_sending...............: avg=33.41µs  min=6.17µs  med=15.33µs  max=199.53ms p(90)=20.17µs  p(95)=21.84µs  p(99.9)=577.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.98ms min=8.41ms  med=208.57ms max=430.34ms p(90)=220.05ms p(95)=228.76ms p(99.9)=289.08ms
     http_reqs......................: 29522   243.873423/s
     iteration_duration.............: avg=204.07ms min=62.15ms med=208.94ms max=452.84ms p(90)=220.49ms p(95)=229.18ms p(99.9)=306.83ms
     iterations.....................: 29422   243.04735/s
     success_rate...................: 100.00% ✓ 29422      ✗ 0    
     vus............................: 36      min=36       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-router (.net subgraphs) (v0.0.42)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 877308      ✗ 0     
     data_received..................: 26 GB   213 MB/s
     data_sent......................: 352 MB  2.9 MB/s
     http_req_blocked...............: avg=3.37µs   min=1.01µs  med=2.59µs  max=4.94ms   p(90)=4.08µs   p(95)=4.86µs   p(99.9)=37.75µs
     http_req_connecting............: avg=363ns    min=0s      med=0s      max=3.83ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.27ms  min=1.86ms  med=19.73ms max=329.2ms  p(90)=28.13ms  p(95)=31.44ms  p(99.9)=54.54ms
       { expected_response:true }...: avg=20.27ms  min=1.86ms  med=19.73ms max=329.2ms  p(90)=28.13ms  p(95)=31.44ms  p(99.9)=54.54ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 292536
     http_req_receiving.............: avg=124.78µs min=28.41µs med=55.5µs  max=297.18ms p(90)=107.51µs p(95)=275.11µs p(99.9)=9.76ms 
     http_req_sending...............: avg=56.95µs  min=5.33µs  med=10.02µs max=226ms    p(90)=18.12µs  p(95)=127.4µs  p(99.9)=6.83ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.08ms  min=1.76ms  med=19.58ms max=324.38ms p(90)=27.92ms  p(95)=31.1ms   p(99.9)=53.69ms
     http_reqs......................: 292536  2433.015615/s
     iteration_duration.............: avg=20.5ms   min=2.7ms   med=19.94ms max=358.25ms p(90)=28.36ms  p(95)=31.69ms  p(99.9)=55.31ms
     iterations.....................: 292436  2432.183918/s
     success_rate...................: 100.00% ✓ 292436      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.0.0-rc.1.15)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 696687      ✗ 0     
     data_received..................: 20 GB   169 MB/s
     data_sent......................: 279 MB  2.3 MB/s
     http_req_blocked...............: avg=3.09µs   min=1.01µs  med=2.29µs   max=4.3ms    p(90)=3.66µs  p(95)=4.36µs   p(99.9)=37.52µs 
     http_req_connecting............: avg=421ns    min=0s      med=0s       max=4.26ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.59ms  min=2.01ms  med=17.32ms  max=619.58ms p(90)=54.8ms  p(95)=72.59ms  p(99.9)=194.71ms
       { expected_response:true }...: avg=25.59ms  min=2.01ms  med=17.32ms  max=619.58ms p(90)=54.8ms  p(95)=72.59ms  p(99.9)=194.71ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 232329
     http_req_receiving.............: avg=717.45µs min=51.32µs med=108.16µs max=287.81ms p(90)=1.15ms  p(95)=1.84ms   p(99.9)=62.81ms 
     http_req_sending...............: avg=40.55µs  min=5.27µs  med=9.67µs   max=37.54ms  p(90)=17.76µs p(95)=107.32µs p(99.9)=2.65ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.83ms  min=1.87ms  med=16.76ms  max=619.17ms p(90)=53.43ms p(95)=71.01ms  p(99.9)=188.01ms
     http_reqs......................: 232329  1926.100824/s
     iteration_duration.............: avg=25.82ms  min=2.41ms  med=17.54ms  max=619.73ms p(90)=55.03ms p(95)=72.83ms  p(99.9)=195.41ms
     iterations.....................: 232229  1925.271784/s
     success_rate...................: 100.00% ✓ 232229      ✗ 0     
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

     checks.........................: 100.00% ✓ 554202      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 222 MB  1.8 MB/s
     http_req_blocked...............: avg=3.54µs   min=932ns   med=2.33µs  max=6.53ms   p(90)=4.51µs   p(95)=5.7µs    p(99.9)=43.55µs
     http_req_connecting............: avg=611ns    min=0s      med=0s      max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.2ms   min=2.42ms  med=31.36ms max=324.11ms p(90)=42.64ms  p(95)=47.38ms  p(99.9)=89.49ms
       { expected_response:true }...: avg=32.2ms   min=2.42ms  med=31.36ms max=324.11ms p(90)=42.64ms  p(95)=47.38ms  p(99.9)=89.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 184834
     http_req_receiving.............: avg=110.24µs min=30.13µs med=60.6µs  max=29.9ms   p(90)=132.91µs p(95)=278.9µs  p(99.9)=5.7ms  
     http_req_sending...............: avg=48.4µs   min=5.28µs  med=10.21µs max=279.71ms p(90)=23.73µs  p(95)=132.91µs p(99.9)=3.79ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.04ms  min=2.25ms  med=31.22ms max=323.56ms p(90)=42.45ms  p(95)=47.15ms  p(99.9)=89.02ms
     http_reqs......................: 184834  1536.203733/s
     iteration_duration.............: avg=32.47ms  min=4.53ms  med=31.6ms  max=335ms    p(90)=42.88ms  p(95)=47.63ms  p(99.9)=90.45ms
     iterations.....................: 184734  1535.372606/s
     success_rate...................: 100.00% ✓ 184734      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: cosmo (.net subgraphs) (0.295.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 439023      ✗ 0     
     data_received..................: 13 GB   107 MB/s
     data_sent......................: 176 MB  1.5 MB/s
     http_req_blocked...............: avg=3.71µs  min=1.09µs  med=2.86µs  max=4.3ms    p(90)=4.48µs   p(95)=5.21µs  p(99.9)=38.89µs
     http_req_connecting............: avg=492ns   min=0s      med=0s      max=4.25ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=40.74ms min=2.3ms   med=40.17ms max=329.23ms p(90)=57.23ms  p(95)=62.43ms p(99.9)=88.01ms
       { expected_response:true }...: avg=40.74ms min=2.3ms   med=40.17ms max=329.23ms p(90)=57.23ms  p(95)=62.43ms p(99.9)=88.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 146441
     http_req_receiving.............: avg=91.18µs min=28.85µs med=69.35µs max=172.72ms p(90)=110.12µs p(95)=131µs   p(99.9)=1.82ms 
     http_req_sending...............: avg=28.39µs min=4.93µs  med=11.69µs max=80.94ms  p(90)=18.2µs   p(95)=22.36µs p(99.9)=1.41ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=40.62ms min=2.13ms  med=40.05ms max=307.52ms p(90)=57.1ms   p(95)=62.28ms p(99.9)=87.53ms
     http_reqs......................: 146441  1217.441845/s
     iteration_duration.............: avg=40.99ms min=3.54ms  med=40.39ms max=341.49ms p(90)=57.44ms  p(95)=62.64ms p(99.9)=88.59ms
     iterations.....................: 146341  1216.610492/s
     success_rate...................: 100.00% ✓ 146341      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway-router-runtime (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 211527     ✗ 0    
     data_received..................: 6.2 GB  51 MB/s
     data_sent......................: 85 MB   704 kB/s
     http_req_blocked...............: avg=5.03µs   min=1.24µs  med=3.2µs   max=4.64ms   p(90)=4.77µs   p(95)=5.38µs   p(99.9)=56.84µs 
     http_req_connecting............: avg=1.57µs   min=0s      med=0s      max=4.59ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=84.72ms  min=3.87ms  med=81.38ms max=355.69ms p(90)=106.5ms  p(95)=118.47ms p(99.9)=217.14ms
       { expected_response:true }...: avg=84.72ms  min=3.87ms  med=81.38ms max=355.69ms p(90)=106.5ms  p(95)=118.47ms p(99.9)=217.14ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 70609
     http_req_receiving.............: avg=122.39µs min=31.67µs med=80.8µs  max=176.74ms p(90)=114.5µs  p(95)=127.4µs  p(99.9)=1.02ms  
     http_req_sending...............: avg=27.27µs  min=5.6µs   med=13.89µs max=172.3ms  p(90)=20.21µs  p(95)=22.5µs   p(99.9)=757.92µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=84.57ms  min=3.79ms  med=81.27ms max=332.24ms p(90)=106.36ms p(95)=118.28ms p(99.9)=214.76ms
     http_reqs......................: 70609   585.804228/s
     iteration_duration.............: avg=85.1ms   min=19.54ms med=81.65ms max=367.48ms p(90)=106.75ms p(95)=118.76ms p(99.9)=219.98ms
     iterations.....................: 70509   584.974583/s
     success_rate...................: 100.00% ✓ 70509      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: apollo-router (.net subgraphs) (v2.12.0)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 135993     ✗ 0    
     data_received..................: 4.0 GB  33 MB/s
     data_sent......................: 55 MB   452 kB/s
     http_req_blocked...............: avg=6.01µs   min=1.31µs  med=3.55µs   max=4.11ms   p(90)=5.02µs   p(95)=5.58µs   p(99.9)=379.83µs
     http_req_connecting............: avg=2.27µs   min=0s      med=0s       max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=354.17µs
     http_req_duration..............: avg=131.86ms min=5.9ms   med=129.11ms max=356.14ms p(90)=175.18ms p(95)=188.65ms p(99.9)=240.03ms
       { expected_response:true }...: avg=131.86ms min=5.9ms   med=129.11ms max=356.14ms p(90)=175.18ms p(95)=188.65ms p(99.9)=240.03ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 45431
     http_req_receiving.............: avg=97.06µs  min=33.37µs med=87.98µs  max=158.86ms p(90)=119.55µs p(95)=131.84µs p(99.9)=619.42µs
     http_req_sending...............: avg=22.72µs  min=6.22µs  med=16.38µs  max=48.15ms  p(90)=21.67µs  p(95)=23.55µs  p(99.9)=613.6µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=131.74ms min=5.77ms  med=128.99ms max=355.55ms p(90)=175.07ms p(95)=188.54ms p(99.9)=239.38ms
     http_reqs......................: 45431   376.19378/s
     iteration_duration.............: avg=132.4ms  min=24.11ms med=129.46ms max=376.23ms p(90)=175.46ms p(95)=188.96ms p(99.9)=243.74ms
     iterations.....................: 45331   375.365725/s
     success_rate...................: 100.00% ✓ 45331      ✗ 0    
     vus............................: 50      min=50       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hive-gateway (.net subgraphs) (2.5.11)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 95046    ✗ 0    
     data_received..................: 2.8 GB  23 MB/s
     data_sent......................: 38 MB   316 kB/s
     http_req_blocked...............: avg=7.24µs   min=1.23µs  med=3.58µs   max=4.43ms   p(90)=5.12µs   p(95)=5.75µs   p(99.9)=1.71ms  
     http_req_connecting............: avg=3.41µs   min=0s      med=0s       max=4.37ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=188.57ms min=5.96ms  med=172.01ms max=623.3ms  p(90)=223.55ms p(95)=390.57ms p(99.9)=524.88ms
       { expected_response:true }...: avg=188.57ms min=5.96ms  med=172.01ms max=623.3ms  p(90)=223.55ms p(95)=390.57ms p(99.9)=524.88ms
     http_req_failed................: 0.00%   ✓ 0        ✗ 31782
     http_req_receiving.............: avg=112.62µs min=35.86µs med=97.24µs  max=123.71ms p(90)=130.56µs p(95)=145µs    p(99.9)=720.99µs
     http_req_sending...............: avg=25.08µs  min=6.12µs  med=17.95µs  max=44.23ms  p(90)=23.39µs  p(95)=25.4µs   p(99.9)=659.15µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=188.43ms min=5.85ms  med=171.89ms max=623.19ms p(90)=223.38ms p(95)=390.31ms p(99.9)=524.76ms
     http_reqs......................: 31782   262.8373/s
     iteration_duration.............: avg=189.46ms min=37.12ms med=172.37ms max=623.61ms p(90)=224.01ms p(95)=391.66ms p(99.9)=525.19ms
     iterations.....................: 31682   262.0103/s
     success_rate...................: 100.00% ✓ 31682    ✗ 0    
     vus............................: 50      min=50     max=50 
     vus_max........................: 50      min=50     max=50
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

     checks.........................: 100.00% ✓ 85011      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   282 kB/s
     http_req_blocked...............: avg=7.4µs    min=1.19µs  med=3.48µs   max=3.77ms   p(90)=4.82µs   p(95)=5.36µs   p(99.9)=1.89ms  
     http_req_connecting............: avg=3.71µs   min=0s      med=0s       max=3.73ms   p(90)=0s       p(95)=0s       p(99.9)=1.87ms  
     http_req_duration..............: avg=210.75ms min=8.61ms  med=214.69ms max=318.35ms p(90)=237.83ms p(95)=245.56ms p(99.9)=306.46ms
       { expected_response:true }...: avg=210.75ms min=8.61ms  med=214.69ms max=318.35ms p(90)=237.83ms p(95)=245.56ms p(99.9)=306.46ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28437
     http_req_receiving.............: avg=98.94µs  min=33.24µs med=94.42µs  max=8.99ms   p(90)=125.33µs p(95)=137.76µs p(99.9)=768.96µs
     http_req_sending...............: avg=24.44µs  min=5.75µs  med=16.8µs   max=52.86ms  p(90)=21.64µs  p(95)=23.47µs  p(99.9)=599.74µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=210.62ms min=8.48ms  med=214.58ms max=318.24ms p(90)=237.71ms p(95)=245.43ms p(99.9)=306.38ms
     http_reqs......................: 28437   234.838542/s
     iteration_duration.............: avg=211.86ms min=39.91ms med=216.15ms max=467.41ms p(90)=238.16ms p(95)=246.02ms p(99.9)=314.04ms
     iterations.....................: 28337   234.012722/s
     success_rate...................: 100.00% ✓ 28337      ✗ 0    
     vus............................: 43      min=43       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-173-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

