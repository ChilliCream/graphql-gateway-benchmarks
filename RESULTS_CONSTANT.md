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
| hive-router | v0.0.49 | 2,968 | 3,137 | 2,933 | 2.3% |  |
| hotchocolate | 16.1.0-p.1.7 | 2,221 | 2,275 | 2,214 | 0.9% |  |
| grafbase | 0.53.3 | 1,982 | 2,064 | 1,969 | 1.7% |  |
| cosmo | 0.307.0 | 1,233 | 1,243 | 1,229 | 0.5% | non-compatible response (5 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 540 | 550 | 534 | 1.0% |  |
| apollo-router | v2.13.1 | 432 | 442 | 429 | 1.0% |  |
| apollo-gateway | 2.13.3 | 251 | 252 | 248 | 0.6% |  |
| hive-gateway | 2.5.25 | 250 | 253 | 246 | 0.9% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,405 | 2,525 | 2,373 | 2.1% |  |
| hotchocolate | 16.1.0-p.1.7 | 1,971 | 2,022 | 1,950 | 1.2% |  |
| grafbase | 0.53.3 | 1,507 | 1,535 | 1,493 | 0.9% |  |
| cosmo | 0.307.0 | 1,207 | 1,221 | 1,198 | 0.7% | non-compatible response (1 across 1/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 510 | 522 | 503 | 1.3% |  |
| apollo-router | v2.13.1 | 371 | 383 | 367 | 1.5% |  |
| hive-gateway | 2.5.25 | 246 | 252 | 243 | 1.1% |  |
| apollo-gateway | 2.13.3 | 237 | 238 | 235 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1070013     ✗ 0     
     data_received..................: 31 GB   260 MB/s
     data_sent......................: 429 MB  3.6 MB/s
     http_req_blocked...............: avg=3.31µs  min=1.05µs  med=2.41µs  max=25.23ms  p(90)=3.7µs    p(95)=4.39µs   p(99.9)=35.4µs 
     http_req_connecting............: avg=257ns   min=0s      med=0s      max=3.96ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.58ms min=1.61ms  med=15.58ms max=318.76ms p(90)=24.69ms  p(95)=28.73ms  p(99.9)=52.5ms 
       { expected_response:true }...: avg=16.58ms min=1.61ms  med=15.58ms max=318.76ms p(90)=24.69ms  p(95)=28.73ms  p(99.9)=52.5ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 356771
     http_req_receiving.............: avg=137.7µs min=28.29µs med=51.67µs max=71.2ms   p(90)=103.01µs p(95)=287.23µs p(99.9)=13.51ms
     http_req_sending...............: avg=63.58µs min=5.28µs  med=9.47µs  max=277.95ms p(90)=16.27µs  p(95)=126.41µs p(99.9)=11.92ms
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.38ms min=1.53ms  med=15.43ms max=305.86ms p(90)=24.41ms  p(95)=28.28ms  p(99.9)=50.63ms
     http_reqs......................: 356771  2968.168177/s
     iteration_duration.............: avg=16.81ms min=2.08ms  med=15.79ms max=333.26ms p(90)=24.93ms  p(95)=28.99ms  p(99.9)=54.06ms
     iterations.....................: 356671  2967.336224/s
     success_rate...................: 100.00% ✓ 356671      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 801234      ✗ 0     
     data_received..................: 23 GB   195 MB/s
     data_sent......................: 321 MB  2.7 MB/s
     http_req_blocked...............: avg=3.02µs   min=1µs     med=2.38µs   max=11.52ms  p(90)=3.55µs   p(95)=4.15µs   p(99.9)=36.1µs  
     http_req_connecting............: avg=195ns    min=0s      med=0s       max=2.61ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.22ms  min=2.39ms  med=14.41ms  max=308.86ms p(90)=48.89ms  p(95)=66.76ms  p(99.9)=164.66ms
       { expected_response:true }...: avg=22.22ms  min=2.39ms  med=14.41ms  max=308.86ms p(90)=48.89ms  p(95)=66.76ms  p(99.9)=164.66ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 267178
     http_req_receiving.............: avg=640.32µs min=50.67µs med=105.75µs max=275.58ms p(90)=968.27µs p(95)=1.51ms   p(99.9)=56.39ms 
     http_req_sending...............: avg=45.99µs  min=5.23µs  med=9.46µs   max=73.55ms  p(90)=15.61µs  p(95)=112.38µs p(99.9)=3.51ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=21.53ms  min=2.29ms  med=13.9ms   max=303.77ms p(90)=47.51ms  p(95)=65.39ms  p(99.9)=163.75ms
     http_reqs......................: 267178  2221.234752/s
     iteration_duration.............: avg=22.45ms  min=3.13ms  med=14.63ms  max=332.7ms  p(90)=49.13ms  p(95)=67.03ms  p(99.9)=167.32ms
     iterations.....................: 267078  2220.403383/s
     success_rate...................: 100.00% ✓ 267078      ✗ 0     
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

     checks.........................: 100.00% ✓ 714849      ✗ 0     
     data_received..................: 21 GB   174 MB/s
     data_sent......................: 286 MB  2.4 MB/s
     http_req_blocked...............: avg=3.74µs  min=1.05µs  med=2.69µs  max=21.1ms   p(90)=4.17µs   p(95)=4.93µs   p(99.9)=41.25µs
     http_req_connecting............: avg=442ns   min=0s      med=0s      max=4.11ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.93ms min=1.99ms  med=24.69ms max=384.49ms p(90)=29.99ms  p(95)=32.38ms  p(99.9)=53.82ms
       { expected_response:true }...: avg=24.93ms min=1.99ms  med=24.69ms max=384.49ms p(90)=29.99ms  p(95)=32.38ms  p(99.9)=53.82ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 238383
     http_req_receiving.............: avg=135.8µs min=30.87µs med=62.13µs max=290.19ms p(90)=105.02µs p(95)=211.38µs p(99.9)=10.17ms
     http_req_sending...............: avg=48.07µs min=5.27µs  med=11µs    max=157.67ms p(90)=18.01µs  p(95)=122.69µs p(99.9)=3.71ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.74ms min=1.9ms   med=24.56ms max=144.42ms p(90)=29.8ms   p(95)=32.08ms  p(99.9)=52.54ms
     http_reqs......................: 238383  1982.116682/s
     iteration_duration.............: avg=25.17ms min=3.97ms  med=24.9ms  max=394.36ms p(90)=30.22ms  p(95)=32.63ms  p(99.9)=54.55ms
     iterations.....................: 238283  1981.285198/s
     success_rate...................: 100.00% ✓ 238283      ✗ 0     
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

     checks.........................: 100.00% ✓ 444633      ✗ 0     
     data_received..................: 13 GB   108 MB/s
     data_sent......................: 178 MB  1.5 MB/s
     http_req_blocked...............: avg=3.08µs  min=1.06µs  med=2.37µs  max=3.08ms   p(90)=3.6µs   p(95)=4.18µs   p(99.9)=35.19µs
     http_req_connecting............: avg=403ns   min=0s      med=0s      max=3.05ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=40.24ms min=2.14ms  med=39.73ms max=321.36ms p(90)=56.69ms p(95)=61.98ms  p(99.9)=87.12ms
       { expected_response:true }...: avg=40.24ms min=2.14ms  med=39.73ms max=321.36ms p(90)=56.69ms p(95)=61.98ms  p(99.9)=87.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 148311
     http_req_receiving.............: avg=76.76µs min=29.67µs med=59.49µs max=143.13ms p(90)=92.49µs p(95)=108.06µs p(99.9)=1.53ms 
     http_req_sending...............: avg=22.62µs min=5.46µs  med=10.27µs max=52.49ms  p(90)=14.92µs p(95)=18.68µs  p(99.9)=1.15ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.14ms min=2.05ms  med=39.64ms max=321.22ms p(90)=56.6ms  p(95)=61.86ms  p(99.9)=86.89ms
     http_reqs......................: 148311  1233.00956/s
     iteration_duration.............: avg=40.48ms min=3.9ms   med=39.93ms max=337.85ms p(90)=56.89ms p(95)=62.17ms  p(99.9)=87.87ms
     iterations.....................: 148211  1232.178193/s
     success_rate...................: 100.00% ✓ 148211      ✗ 0     
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

     checks.........................: 100.00% ✓ 195069     ✗ 0    
     data_received..................: 5.7 GB  48 MB/s
     data_sent......................: 78 MB   649 kB/s
     http_req_blocked...............: avg=4.6µs   min=1.19µs  med=2.88µs  max=4.08ms   p(90)=4.43µs   p(95)=5.04µs   p(99.9)=49.24µs 
     http_req_connecting............: avg=1.43µs  min=0s      med=0s      max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.9ms  min=4.01ms  med=90.74ms max=319.4ms  p(90)=115.94ms p(95)=128.75ms p(99.9)=218.8ms 
       { expected_response:true }...: avg=91.9ms  min=4.01ms  med=90.74ms max=319.4ms  p(90)=115.94ms p(95)=128.75ms p(99.9)=218.8ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 65123
     http_req_receiving.............: avg=95.47µs min=31.54µs med=76.4µs  max=105.73ms p(90)=110.73µs p(95)=123.93µs p(99.9)=1.13ms  
     http_req_sending...............: avg=22.78µs min=5.37µs  med=13.02µs max=188.3ms  p(90)=19.73µs  p(95)=22.1µs   p(99.9)=688.03µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=91.78ms min=3.95ms  med=90.64ms max=307.85ms p(90)=115.82ms p(95)=128.65ms p(99.9)=218.55ms
     http_reqs......................: 65123   540.325963/s
     iteration_duration.............: avg=92.28ms min=10.74ms med=90.98ms max=342.88ms p(90)=116.21ms p(95)=129.03ms p(99.9)=220.81ms
     iterations.....................: 65023   539.496262/s
     success_rate...................: 100.00% ✓ 65023      ✗ 0    
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

     checks.........................: 100.00% ✓ 156462     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   520 kB/s
     http_req_blocked...............: avg=5.59µs   min=1.24µs  med=3.39µs   max=4.08ms   p(90)=4.83µs   p(95)=5.42µs   p(99.9)=95.23µs 
     http_req_connecting............: avg=1.96µs   min=0s      med=0s       max=4.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.6ms  min=5.33ms  med=114.27ms max=357.72ms p(90)=138.35ms p(95)=145.57ms p(99.9)=181.53ms
       { expected_response:true }...: avg=114.6ms  min=5.33ms  med=114.27ms max=357.72ms p(90)=138.35ms p(95)=145.57ms p(99.9)=181.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52254
     http_req_receiving.............: avg=90.2µs   min=31.14µs med=83.16µs  max=60.04ms  p(90)=114.59µs p(95)=126.31µs p(99.9)=750.81µs
     http_req_sending...............: avg=24.47µs  min=5.52µs  med=15.54µs  max=116.46ms p(90)=21.22µs  p(95)=23.11µs  p(99.9)=629.39µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.49ms min=5.21ms  med=114.17ms max=338.03ms p(90)=138.25ms p(95)=145.46ms p(99.9)=180.25ms
     http_reqs......................: 52254   432.936796/s
     iteration_duration.............: avg=115.08ms min=12.05ms med=114.54ms max=369.47ms p(90)=138.61ms p(95)=145.83ms p(99.9)=188.14ms
     iterations.....................: 52154   432.108272/s
     success_rate...................: 100.00% ✓ 52154      ✗ 0    
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

     checks.........................: 100.00% ✓ 90999      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   302 kB/s
     http_req_blocked...............: avg=6.8µs    min=1.28µs  med=3.42µs   max=3.98ms   p(90)=4.75µs   p(95)=5.28µs   p(99.9)=1.51ms  
     http_req_connecting............: avg=3.16µs   min=0s      med=0s       max=3.95ms   p(90)=0s       p(95)=0s       p(99.9)=1.48ms  
     http_req_duration..............: avg=197ms    min=8.32ms  med=227.75ms max=424.44ms p(90)=270.48ms p(95)=275.24ms p(99.9)=348.12ms
       { expected_response:true }...: avg=197ms    min=8.32ms  med=227.75ms max=424.44ms p(90)=270.48ms p(95)=275.24ms p(99.9)=348.12ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30433
     http_req_receiving.............: avg=192.16µs min=33.8µs  med=92.12µs  max=190.74ms p(90)=123.94µs p(95)=137.3µs  p(99.9)=1.64ms  
     http_req_sending...............: avg=23.12µs  min=6.21µs  med=17.14µs  max=40.14ms  p(90)=21.82µs  p(95)=23.6µs   p(99.9)=581.81µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=196.79ms min=8.23ms  med=227.63ms max=374.88ms p(90)=270.33ms p(95)=274.91ms p(99.9)=343.95ms
     http_reqs......................: 30433   251.394928/s
     iteration_duration.............: avg=197.91ms min=28.55ms med=228.16ms max=445.44ms p(90)=270.75ms p(95)=275.57ms p(99.9)=352.94ms
     iterations.....................: 30333   250.568867/s
     success_rate...................: 100.00% ✓ 30333      ✗ 0    
     vus............................: 25      min=25       max=50 
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

     checks.........................: 100.00% ✓ 90528      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   300 kB/s
     http_req_blocked...............: avg=5.08µs   min=1.31µs  med=3.58µs   max=2.02ms  p(90)=5.02µs   p(95)=5.69µs   p(99.9)=510.94µs
     http_req_connecting............: avg=1.3µs    min=0s      med=0s       max=1.98ms  p(90)=0s       p(95)=0s       p(99.9)=482.67µs
     http_req_duration..............: avg=198.07ms min=6.25ms  med=180.68ms max=1.05s   p(90)=237.11ms p(95)=386.66ms p(99.9)=570.52ms
       { expected_response:true }...: avg=198.07ms min=6.25ms  med=180.68ms max=1.05s   p(90)=237.11ms p(95)=386.66ms p(99.9)=570.52ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30276
     http_req_receiving.............: avg=101.29µs min=35.24µs med=95.26µs  max=30.95ms p(90)=128.05µs p(95)=141.82µs p(99.9)=673.19µs
     http_req_sending...............: avg=26.5µs   min=6.13µs  med=17.9µs   max=78.32ms p(90)=23.05µs  p(95)=24.89µs  p(99.9)=659.13µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s      p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.94ms min=6.08ms  med=180.56ms max=1.05s   p(90)=237ms    p(95)=386.56ms p(99.9)=570.41ms
     http_reqs......................: 30276   250.220763/s
     iteration_duration.............: avg=198.99ms min=40.38ms med=181.05ms max=1.05s   p(90)=237.64ms p(95)=387.6ms  p(99.9)=570.74ms
     iterations.....................: 30176   249.394298/s
     success_rate...................: 100.00% ✓ 30176      ✗ 0    
     vus............................: 5       min=5        max=50 
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

     checks.........................: 100.00% ✓ 867381      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 348 MB  2.9 MB/s
     http_req_blocked...............: avg=3.31µs   min=1.04µs  med=2.67µs  max=12.5ms   p(90)=4.22µs   p(95)=5.05µs   p(99.9)=38.53µs
     http_req_connecting............: avg=162ns    min=0s      med=0s      max=2.74ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.5ms   min=1.82ms  med=19.97ms max=312.83ms p(90)=28.49ms  p(95)=31.73ms  p(99.9)=54.06ms
       { expected_response:true }...: avg=20.5ms   min=1.82ms  med=19.97ms max=312.83ms p(90)=28.49ms  p(95)=31.73ms  p(99.9)=54.06ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 289227
     http_req_receiving.............: avg=121.59µs min=28.68µs med=56.72µs max=153.41ms p(90)=108.54µs p(95)=277.92µs p(99.9)=9.48ms 
     http_req_sending...............: avg=56.29µs  min=5.34µs  med=10.39µs max=142.47ms p(90)=18.65µs  p(95)=131.14µs p(99.9)=5.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.32ms  min=1.77ms  med=19.82ms max=312.51ms p(90)=28.27ms  p(95)=31.41ms  p(99.9)=53.19ms
     http_reqs......................: 289227  2405.394316/s
     iteration_duration.............: avg=20.74ms  min=3.23ms  med=20.19ms max=348.03ms p(90)=28.72ms  p(95)=31.98ms  p(99.9)=54.62ms
     iterations.....................: 289127  2404.562653/s
     success_rate...................: 100.00% ✓ 289127      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.7)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 710697      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=3.15µs   min=1.01µs  med=2.54µs   max=2.69ms   p(90)=3.92µs  p(95)=4.64µs  p(99.9)=37.45µs 
     http_req_connecting............: avg=235ns    min=0s      med=0s       max=2.66ms   p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=25.08ms  min=1.86ms  med=17.09ms  max=632.28ms p(90)=52.94ms p(95)=70.16ms p(99.9)=199.03ms
       { expected_response:true }...: avg=25.08ms  min=1.86ms  med=17.09ms  max=632.28ms p(90)=52.94ms p(95)=70.16ms p(99.9)=199.03ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236999
     http_req_receiving.............: avg=714.34µs min=52.24µs med=110.91µs max=269.93ms p(90)=1.14ms  p(95)=1.82ms  p(99.9)=60.08ms 
     http_req_sending...............: avg=42.22µs  min=5.17µs  med=10.09µs  max=143.89ms p(90)=17.86µs p(95)=111.1µs p(99.9)=2.9ms   
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=24.32ms  min=1.73ms  med=16.53ms  max=631.23ms p(90)=51.59ms p(95)=68.54ms p(99.9)=190.47ms
     http_reqs......................: 236999  1971.094033/s
     iteration_duration.............: avg=25.31ms  min=2.46ms  med=17.3ms   max=632.43ms p(90)=53.18ms p(95)=70.4ms  p(99.9)=203.38ms
     iterations.....................: 236899  1970.262344/s
     success_rate...................: 100.00% ✓ 236899      ✗ 0     
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

     checks.........................: 100.00% ✓ 543801      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 218 MB  1.8 MB/s
     http_req_blocked...............: avg=5µs      min=981ns   med=2.48µs  max=21.87ms  p(90)=4.76µs   p(95)=5.91µs   p(99.9)=46.65µs
     http_req_connecting............: avg=1.87µs   min=0s      med=0s      max=21.7ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.81ms  min=2.44ms  med=31.91ms max=316.95ms p(90)=43.66ms  p(95)=48.56ms  p(99.9)=88.22ms
       { expected_response:true }...: avg=32.81ms  min=2.44ms  med=31.91ms max=316.95ms p(90)=43.66ms  p(95)=48.56ms  p(99.9)=88.22ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 181367
     http_req_receiving.............: avg=109.56µs min=30.44µs med=62.52µs max=97.39ms  p(90)=134.38µs p(95)=273.25µs p(99.9)=4.86ms 
     http_req_sending...............: avg=48.27µs  min=5.15µs  med=10.43µs max=82.29ms  p(90)=23.94µs  p(95)=133.15µs p(99.9)=4.1ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.65ms  min=2.31ms  med=31.77ms max=315.32ms p(90)=43.47ms  p(95)=48.33ms  p(99.9)=88ms   
     http_reqs......................: 181367  1507.665479/s
     iteration_duration.............: avg=33.09ms  min=4.52ms  med=32.15ms max=339.32ms p(90)=43.91ms  p(95)=48.81ms  p(99.9)=89.14ms
     iterations.....................: 181267  1506.8342/s
     success_rate...................: 100.00% ✓ 181267      ✗ 0     
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

     checks.........................: 100.00% ✓ 435306      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=3.59µs   min=1.08µs  med=2.68µs  max=4.1ms    p(90)=4.24µs   p(95)=4.94µs   p(99.9)=37.11µs
     http_req_connecting............: avg=571ns    min=0s      med=0s      max=4.06ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.09ms  min=2.25ms  med=40.56ms max=334.04ms p(90)=57.68ms  p(95)=62.95ms  p(99.9)=88.69ms
       { expected_response:true }...: avg=41.09ms  min=2.25ms  med=40.56ms max=334.04ms p(90)=57.68ms  p(95)=62.95ms  p(99.9)=88.69ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145202
     http_req_receiving.............: avg=116.92µs min=29.23µs med=67.19µs max=249.84ms p(90)=105.14µs p(95)=123.64µs p(99.9)=1.88ms 
     http_req_sending...............: avg=25.93µs  min=5.32µs  med=11.76µs max=29.46ms  p(90)=18.23µs  p(95)=21.93µs  p(99.9)=1.26ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.95ms  min=2.16ms  med=40.46ms max=155.68ms p(90)=57.56ms  p(95)=62.82ms  p(99.9)=86.76ms
     http_reqs......................: 145202  1207.051533/s
     iteration_duration.............: avg=41.34ms  min=4.13ms  med=40.79ms max=343.68ms p(90)=57.89ms  p(95)=63.15ms  p(99.9)=89.43ms
     iterations.....................: 145102  1206.220242/s
     success_rate...................: 100.00% ✓ 145102      ✗ 0     
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

     checks.........................: 100.00% ✓ 184371     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 74 MB   613 kB/s
     http_req_blocked...............: avg=4.36µs   min=1.16µs  med=3.09µs  max=3.05ms   p(90)=4.62µs   p(95)=5.21µs   p(99.9)=48.93µs 
     http_req_connecting............: avg=1.04µs   min=0s      med=0s      max=3.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.23ms  min=4.23ms  med=95.66ms max=304.76ms p(90)=121.31ms p(95)=134.88ms p(99.9)=233.22ms
       { expected_response:true }...: avg=97.23ms  min=4.23ms  med=95.66ms max=304.76ms p(90)=121.31ms p(95)=134.88ms p(99.9)=233.22ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61557
     http_req_receiving.............: avg=100.31µs min=30.31µs med=80.25µs max=181.99ms p(90)=114.16µs p(95)=127.1µs  p(99.9)=1.01ms  
     http_req_sending...............: avg=26.85µs  min=5.65µs  med=14.1µs  max=195.75ms p(90)=20.65µs  p(95)=22.82µs  p(99.9)=725.16µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.1ms   min=4.12ms  med=95.55ms max=304.28ms p(90)=121.18ms p(95)=134.7ms  p(99.9)=232.75ms
     http_reqs......................: 61557   510.532008/s
     iteration_duration.............: avg=97.64ms  min=20.4ms  med=95.91ms max=342.65ms p(90)=121.59ms p(95)=135.26ms p(99.9)=235.43ms
     iterations.....................: 61457   509.702644/s
     success_rate...................: 100.00% ✓ 61457      ✗ 0    
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

     checks.........................: 100.00% ✓ 134352     ✗ 0    
     data_received..................: 3.9 GB  33 MB/s
     data_sent......................: 54 MB   446 kB/s
     http_req_blocked...............: avg=5.63µs   min=1.2µs   med=3.38µs   max=3.76ms   p(90)=4.81µs   p(95)=5.37µs   p(99.9)=427.39µs
     http_req_connecting............: avg=2.06µs   min=0s      med=0s       max=3.71ms   p(90)=0s       p(95)=0s       p(99.9)=398.95µs
     http_req_duration..............: avg=133.48ms min=6ms     med=131.07ms max=356.28ms p(90)=176.67ms p(95)=189.71ms p(99.9)=245.41ms
       { expected_response:true }...: avg=133.48ms min=6ms     med=131.07ms max=356.28ms p(90)=176.67ms p(95)=189.71ms p(99.9)=245.41ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 44884
     http_req_receiving.............: avg=93.3µs   min=30.83µs med=85.68µs  max=68.26ms  p(90)=117.79µs p(95)=129.74µs p(99.9)=666.58µs
     http_req_sending...............: avg=30.11µs  min=5.69µs  med=16.39µs  max=193.08ms p(90)=21.83µs  p(95)=23.65µs  p(99.9)=716.04µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=133.36ms min=5.87ms  med=130.95ms max=355.49ms p(90)=176.55ms p(95)=189.59ms p(99.9)=245.09ms
     http_reqs......................: 44884   371.644315/s
     iteration_duration.............: avg=134.02ms min=39.06ms med=131.39ms max=364.21ms p(90)=176.97ms p(95)=190.02ms p(99.9)=248.23ms
     iterations.....................: 44784   370.816304/s
     success_rate...................: 100.00% ✓ 44784      ✗ 0    
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

     checks.........................: 100.00% ✓ 89181      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   296 kB/s
     http_req_blocked...............: avg=5.12µs   min=1.3µs   med=3.62µs   max=2.24ms   p(90)=5.06µs   p(95)=5.65µs   p(99.9)=536.95µs
     http_req_connecting............: avg=1.3µs    min=0s      med=0s       max=2.2ms    p(90)=0s       p(95)=0s       p(99.9)=480.82µs
     http_req_duration..............: avg=201.01ms min=6.36ms  med=186.25ms max=610.35ms p(90)=241.78ms p(95)=398.67ms p(99.9)=525.97ms
       { expected_response:true }...: avg=201.01ms min=6.36ms  med=186.25ms max=610.35ms p(90)=241.78ms p(95)=398.67ms p(99.9)=525.97ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29827
     http_req_receiving.............: avg=105.31µs min=38.12µs med=95.94µs  max=69.61ms  p(90)=127.65µs p(95)=141.44µs p(99.9)=615.78µs
     http_req_sending...............: avg=29.51µs  min=6.24µs  med=17.73µs  max=63.74ms  p(90)=22.73µs  p(95)=24.39µs  p(99.9)=592.8µs 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=200.88ms min=6.25ms  med=186.11ms max=610.25ms p(90)=241.67ms p(95)=398.55ms p(99.9)=525.71ms
     http_reqs......................: 29827   246.509663/s
     iteration_duration.............: avg=201.96ms min=43.41ms med=186.63ms max=610.67ms p(90)=242.26ms p(95)=399.15ms p(99.9)=526.35ms
     iterations.....................: 29727   245.683198/s
     success_rate...................: 100.00% ✓ 29727      ✗ 0    
     vus............................: 9       min=9        max=50 
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

     checks.........................: 100.00% ✓ 86088      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 35 MB   286 kB/s
     http_req_blocked...............: avg=7.31µs   min=1.13µs  med=3.35µs   max=4.35ms   p(90)=4.7µs    p(95)=5.24µs   p(99.9)=1.68ms  
     http_req_connecting............: avg=3.76µs   min=0s      med=0s       max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=1.62ms  
     http_req_duration..............: avg=208.19ms min=8.59ms  med=212.8ms  max=438.6ms  p(90)=228.15ms p(95)=238.82ms p(99.9)=317ms   
       { expected_response:true }...: avg=208.19ms min=8.59ms  med=212.8ms  max=438.6ms  p(90)=228.15ms p(95)=238.82ms p(99.9)=317ms   
     http_req_failed................: 0.00%   ✓ 0          ✗ 28796
     http_req_receiving.............: avg=98.54µs  min=32.88µs med=93.12µs  max=33.73ms  p(90)=124.21µs p(95)=136.92µs p(99.9)=541.34µs
     http_req_sending...............: avg=30.04µs  min=6.08µs  med=17.3µs   max=92.87ms  p(90)=22.01µs  p(95)=23.72µs  p(99.9)=554.77µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=208.06ms min=8.45ms  med=212.68ms max=438.36ms p(90)=228.02ms p(95)=238.66ms p(99.9)=316.78ms
     http_reqs......................: 28796   237.824256/s
     iteration_duration.............: avg=209.21ms min=28.15ms med=213.09ms max=447.4ms  p(90)=228.42ms p(95)=239.23ms p(99.9)=325.72ms
     iterations.....................: 28696   236.998362/s
     success_rate...................: 100.00% ✓ 28696      ✗ 0    
     vus............................: 39      min=39       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

