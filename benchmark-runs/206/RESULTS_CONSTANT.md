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
| hive-router | v0.0.49 | 2,877 | 3,083 | 2,828 | 3.0% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,173 | 2,229 | 2,163 | 1.0% |  |
| grafbase | 0.53.3 | 2,030 | 2,092 | 2,008 | 1.4% |  |
| cosmo | 0.307.0 | 1,263 | 1,285 | 1,250 | 0.8% |  |
| hive-gateway-router-runtime | 2.5.25 | 559 | 570 | 557 | 0.8% |  |
| apollo-router | v2.13.1 | 432 | 441 | 428 | 1.0% |  |
| apollo-gateway | 2.13.3 | 245 | 247 | 245 | 0.3% |  |
| hive-gateway | 2.5.25 | 239 | 244 | 237 | 1.0% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,368 | 2,505 | 2,322 | 2.5% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,995 | 2,037 | 1,965 | 1.0% |  |
| grafbase | 0.53.3 | 1,541 | 1,571 | 1,529 | 0.9% |  |
| cosmo | 0.307.0 | 1,208 | 1,227 | 1,202 | 0.9% | non-compatible response (6 across 5/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 514 | 524 | 507 | 1.1% |  |
| apollo-router | v2.13.1 | 401 | 410 | 398 | 1.1% |  |
| apollo-gateway | 2.13.3 | 236 | 239 | 234 | 0.7% |  |
| hive-gateway | 2.5.25 | 233 | 236 | 232 | 0.7% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1037262     ✗ 0     
     data_received..................: 30 GB   252 MB/s
     data_sent......................: 416 MB  3.5 MB/s
     http_req_blocked...............: avg=3.12µs   min=990ns   med=2.26µs  max=25.22ms  p(90)=3.48µs   p(95)=4.12µs   p(99.9)=35.73µs
     http_req_connecting............: avg=288ns    min=0s      med=0s      max=4ms      p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=17.1ms   min=1.61ms  med=16.09ms max=302.5ms  p(90)=25.41ms  p(95)=29.52ms  p(99.9)=52.18ms
       { expected_response:true }...: avg=17.1ms   min=1.61ms  med=16.09ms max=302.5ms  p(90)=25.41ms  p(95)=29.52ms  p(99.9)=52.18ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 345854
     http_req_receiving.............: avg=136.65µs min=28.52µs med=50.67µs max=90.5ms   p(90)=101.26µs p(95)=291.44µs p(99.9)=13.17ms
     http_req_sending...............: avg=64.2µs   min=5.32µs  med=9.4µs   max=233.36ms p(90)=16.36µs  p(95)=128.72µs p(99.9)=12.72ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.9ms   min=1.55ms  med=15.94ms max=301.95ms p(90)=25.11ms  p(95)=29.08ms  p(99.9)=50.9ms 
     http_reqs......................: 345854  2877.390047/s
     iteration_duration.............: avg=17.34ms  min=2.16ms  med=16.3ms  max=361.65ms p(90)=25.64ms  p(95)=29.79ms  p(99.9)=53.68ms
     iterations.....................: 345754  2876.558081/s
     success_rate...................: 100.00% ✓ 345754      ✗ 0     
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

     checks.........................: 100.00% ✓ 783978      ✗ 0     
     data_received..................: 23 GB   191 MB/s
     data_sent......................: 314 MB  2.6 MB/s
     http_req_blocked...............: avg=2.86µs  min=1.02µs med=2.33µs   max=4.59ms   p(90)=3.55µs   p(95)=4.19µs   p(99.9)=31.92µs 
     http_req_connecting............: avg=179ns   min=0s     med=0s       max=2.46ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.71ms min=2.42ms med=14.86ms  max=317.69ms p(90)=49.48ms  p(95)=67.8ms   p(99.9)=168.05ms
       { expected_response:true }...: avg=22.71ms min=2.42ms med=14.86ms  max=317.69ms p(90)=49.48ms  p(95)=67.8ms   p(99.9)=168.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 261426
     http_req_receiving.............: avg=657.5µs min=51µs   med=105.66µs max=195.89ms p(90)=974.46µs p(95)=1.55ms   p(99.9)=57.1ms  
     http_req_sending...............: avg=49.66µs min=5.33µs med=9.73µs   max=240.87ms p(90)=16.43µs  p(95)=117.38µs p(99.9)=4.25ms  
     http_req_tls_handshaking.......: avg=0s      min=0s     med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22ms    min=2.34ms med=14.34ms  max=292.09ms p(90)=48.05ms  p(95)=66.36ms  p(99.9)=166.25ms
     http_reqs......................: 261426  2173.174669/s
     iteration_duration.............: avg=22.95ms min=3.32ms med=15.08ms  max=354.24ms p(90)=49.72ms  p(95)=68.06ms  p(99.9)=169.63ms
     iterations.....................: 261326  2172.343392/s
     success_rate...................: 100.00% ✓ 261326      ✗ 0     
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

     checks.........................: 100.00% ✓ 732114      ✗ 0     
     data_received..................: 22 GB   178 MB/s
     data_sent......................: 293 MB  2.4 MB/s
     http_req_blocked...............: avg=3.79µs   min=1.05µs  med=2.71µs  max=13.67ms  p(90)=4.31µs   p(95)=5.12µs   p(99.9)=41.52µs
     http_req_connecting............: avg=494ns    min=0s      med=0s      max=5.05ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.33ms  min=1.96ms  med=24.08ms max=299.68ms p(90)=29.34ms  p(95)=31.81ms  p(99.9)=53.2ms 
       { expected_response:true }...: avg=24.33ms  min=1.96ms  med=24.08ms max=299.68ms p(90)=29.34ms  p(95)=31.81ms  p(99.9)=53.2ms 
     http_req_failed................: 0.00%   ✓ 0           ✗ 244138
     http_req_receiving.............: avg=116.09µs min=29.69µs med=60.85µs max=32.9ms   p(90)=105.34µs p(95)=206.12µs p(99.9)=9.47ms 
     http_req_sending...............: avg=53.73µs  min=5.13µs  med=11.15µs max=269.75ms p(90)=19.04µs  p(95)=125.49µs p(99.9)=4.72ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.16ms  min=1.85ms  med=23.96ms max=299.44ms p(90)=29.15ms  p(95)=31.5ms   p(99.9)=52.19ms
     http_reqs......................: 244138  2030.187852/s
     iteration_duration.............: avg=24.57ms  min=3.81ms  med=24.3ms  max=379.15ms p(90)=29.57ms  p(95)=32.07ms  p(99.9)=53.9ms 
     iterations.....................: 244038  2029.356278/s
     success_rate...................: 100.00% ✓ 244038      ✗ 0     
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

     checks.........................: 100.00% ✓ 455628      ✗ 0     
     data_received..................: 13 GB   111 MB/s
     data_sent......................: 183 MB  1.5 MB/s
     http_req_blocked...............: avg=3.39µs  min=1.04µs  med=2.39µs  max=4.68ms   p(90)=3.69µs  p(95)=4.29µs   p(99.9)=35.47µs
     http_req_connecting............: avg=702ns   min=0s      med=0s      max=4.64ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.26ms min=2.16ms  med=38.71ms max=351.93ms p(90)=55.38ms p(95)=60.43ms  p(99.9)=85.02ms
       { expected_response:true }...: avg=39.26ms min=2.16ms  med=38.71ms max=351.93ms p(90)=55.38ms p(95)=60.43ms  p(99.9)=85.02ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 151976
     http_req_receiving.............: avg=80.17µs min=29.27µs med=60.08µs max=25.86ms  p(90)=95.65µs p(95)=114.12µs p(99.9)=2.03ms 
     http_req_sending...............: avg=26.52µs min=5.36µs  med=10.57µs max=207.44ms p(90)=15.89µs p(95)=19.93µs  p(99.9)=1.23ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.15ms min=2.04ms  med=38.61ms max=345.85ms p(90)=55.27ms p(95)=60.31ms  p(99.9)=84.75ms
     http_reqs......................: 151976  1263.663187/s
     iteration_duration.............: avg=39.49ms min=4.21ms  med=38.92ms max=362.13ms p(90)=55.58ms p(95)=60.63ms  p(99.9)=85.32ms
     iterations.....................: 151876  1262.831698/s
     success_rate...................: 100.00% ✓ 151876      ✗ 0     
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

     checks.........................: 100.00% ✓ 201897     ✗ 0    
     data_received..................: 5.9 GB  49 MB/s
     data_sent......................: 81 MB   672 kB/s
     http_req_blocked...............: avg=4.93µs  min=1.14µs  med=3.03µs  max=4.29ms   p(90)=4.63µs   p(95)=5.26µs   p(99.9)=50.77µs 
     http_req_connecting............: avg=1.6µs   min=0s      med=0s      max=4.25ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=88.79ms min=3.99ms  med=86.02ms max=368.73ms p(90)=108.02ms p(95)=119.52ms p(99.9)=214.33ms
       { expected_response:true }...: avg=88.79ms min=3.99ms  med=86.02ms max=368.73ms p(90)=108.02ms p(95)=119.52ms p(99.9)=214.33ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 67399
     http_req_receiving.............: avg=89.28µs min=32.29µs med=78.8µs  max=89.21ms  p(90)=114.23µs p(95)=127.45µs p(99.9)=1.04ms  
     http_req_sending...............: avg=29.67µs min=5.84µs  med=13.85µs max=187.18ms p(90)=20.82µs  p(95)=23.06µs  p(99.9)=710.25µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=88.68ms min=3.88ms  med=85.91ms max=367.88ms p(90)=107.88ms p(95)=119.38ms p(99.9)=213.81ms
     http_reqs......................: 67399   559.183473/s
     iteration_duration.............: avg=89.17ms min=18.55ms med=86.27ms max=386.98ms p(90)=108.27ms p(95)=119.85ms p(99.9)=216.54ms
     iterations.....................: 67299   558.353811/s
     success_rate...................: 100.00% ✓ 67299      ✗ 0    
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

     checks.........................: 100.00% ✓ 156285     ✗ 0    
     data_received..................: 4.6 GB  38 MB/s
     data_sent......................: 63 MB   519 kB/s
     http_req_blocked...............: avg=4.57µs   min=1.18µs  med=3.38µs   max=3.06ms   p(90)=4.79µs   p(95)=5.33µs   p(99.9)=66.47µs 
     http_req_connecting............: avg=1µs      min=0s      med=0s       max=3.02ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=114.72ms min=5.59ms  med=114.53ms max=357.16ms p(90)=138.44ms p(95)=145.45ms p(99.9)=179.67ms
       { expected_response:true }...: avg=114.72ms min=5.59ms  med=114.53ms max=357.16ms p(90)=138.44ms p(95)=145.45ms p(99.9)=179.67ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 52195
     http_req_receiving.............: avg=90.11µs  min=33.43µs med=83.39µs  max=37.03ms  p(90)=115.38µs p(95)=128.1µs  p(99.9)=741.52µs
     http_req_sending...............: avg=27.45µs  min=5.69µs  med=15.92µs  max=112.23ms p(90)=21.39µs  p(95)=23.17µs  p(99.9)=735.97µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=114.61ms min=5.47ms  med=114.42ms max=356.64ms p(90)=138.32ms p(95)=145.32ms p(99.9)=179.34ms
     http_reqs......................: 52195   432.447545/s
     iteration_duration.............: avg=115.2ms  min=40ms    med=114.81ms max=368ms    p(90)=138.71ms p(95)=145.69ms p(99.9)=183.1ms 
     iterations.....................: 52095   431.619022/s
     success_rate...................: 100.00% ✓ 52095      ✗ 0    
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

     checks.........................: 100.00% ✓ 88872      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   295 kB/s
     http_req_blocked...............: avg=7.33µs   min=1.26µs  med=3.54µs   max=4.82ms   p(90)=4.83µs   p(95)=5.37µs   p(99.9)=1.7ms   
     http_req_connecting............: avg=3.64µs   min=0s      med=0s       max=4.78ms   p(90)=0s       p(95)=0s       p(99.9)=1.68ms  
     http_req_duration..............: avg=201.7ms  min=8.62ms  med=200.68ms max=447.28ms p(90)=209.66ms p(95)=218.05ms p(99.9)=280.65ms
       { expected_response:true }...: avg=201.7ms  min=8.62ms  med=200.68ms max=447.28ms p(90)=209.66ms p(95)=218.05ms p(99.9)=280.65ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29724
     http_req_receiving.............: avg=101.81µs min=35.42µs med=92.68µs  max=51.33ms  p(90)=124.51µs p(95)=138.22µs p(99.9)=734.53µs
     http_req_sending...............: avg=25.9µs   min=6.29µs  med=17.45µs  max=61.45ms  p(90)=22.26µs  p(95)=23.98µs  p(99.9)=567.98µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=201.57ms min=8.48ms  med=200.56ms max=428.05ms p(90)=209.55ms p(95)=217.93ms p(99.9)=280.53ms
     http_reqs......................: 29724   245.437757/s
     iteration_duration.............: avg=202.67ms min=38.55ms med=200.94ms max=468.39ms p(90)=209.92ms p(95)=218.41ms p(99.9)=306.25ms
     iterations.....................: 29624   244.612035/s
     success_rate...................: 100.00% ✓ 29624      ✗ 0    
     vus............................: 44      min=44       max=50 
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

     checks.........................: 100.00% ✓ 86826      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 35 MB   288 kB/s
     http_req_blocked...............: avg=7.26µs   min=1.23µs  med=3.52µs   max=4.22ms   p(90)=4.89µs   p(95)=5.51µs   p(99.9)=1.8ms   
     http_req_connecting............: avg=3.46µs   min=0s      med=0s       max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=1.67ms  
     http_req_duration..............: avg=206.51ms min=6.24ms  med=187.47ms max=707.42ms p(90)=241.2ms  p(95)=456.24ms p(99.9)=598.73ms
       { expected_response:true }...: avg=206.51ms min=6.24ms  med=187.47ms max=707.42ms p(90)=241.2ms  p(95)=456.24ms p(99.9)=598.73ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29042
     http_req_receiving.............: avg=182.26µs min=35.57µs med=93.9µs   max=151.66ms p(90)=126.67µs p(95)=140.41µs p(99.9)=4.72ms  
     http_req_sending...............: avg=35.32µs  min=5.83µs  med=17.28µs  max=231.66ms p(90)=22.33µs  p(95)=24.13µs  p(99.9)=747.44µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=206.29ms min=6.16ms  med=187.32ms max=707.31ms p(90)=240.93ms p(95)=456.13ms p(99.9)=598.59ms
     http_reqs......................: 29042   239.765623/s
     iteration_duration.............: avg=207.49ms min=26.41ms med=187.84ms max=707.7ms  p(90)=241.8ms  p(95)=457.69ms p(99.9)=599.01ms
     iterations.....................: 28942   238.940041/s
     success_rate...................: 100.00% ✓ 28942      ✗ 0    
     vus............................: 14      min=14       max=50 
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

     checks.........................: 100.00% ✓ 854007      ✗ 0     
     data_received..................: 25 GB   207 MB/s
     data_sent......................: 342 MB  2.8 MB/s
     http_req_blocked...............: avg=3.39µs   min=1.03µs  med=2.59µs  max=6.86ms   p(90)=4.12µs   p(95)=4.92µs   p(99.9)=40.14µs
     http_req_connecting............: avg=389ns    min=0s      med=0s      max=4.69ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.82ms  min=1.86ms  med=20.3ms  max=312.45ms p(90)=28.88ms  p(95)=32.06ms  p(99.9)=54.16ms
       { expected_response:true }...: avg=20.82ms  min=1.86ms  med=20.3ms  max=312.45ms p(90)=28.88ms  p(95)=32.06ms  p(99.9)=54.16ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 284769
     http_req_receiving.............: avg=123.53µs min=28.46µs med=57.44µs max=125.6ms  p(90)=110.41µs p(95)=281.67µs p(99.9)=9.36ms 
     http_req_sending...............: avg=53.77µs  min=5.32µs  med=10.71µs max=112.24ms p(90)=19.04µs  p(95)=133.54µs p(99.9)=4.76ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.65ms  min=1.76ms  med=20.15ms max=312.2ms  p(90)=28.66ms  p(95)=31.75ms  p(99.9)=53.18ms
     http_reqs......................: 284769  2368.547459/s
     iteration_duration.............: avg=21.06ms  min=3.48ms  med=20.52ms max=340.2ms  p(90)=29.1ms   p(95)=32.31ms  p(99.9)=54.75ms
     iterations.....................: 284669  2367.715716/s
     success_rate...................: 100.00% ✓ 284669      ✗ 0     
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

     checks.........................: 100.00% ✓ 719571      ✗ 0     
     data_received..................: 21 GB   175 MB/s
     data_sent......................: 288 MB  2.4 MB/s
     http_req_blocked...............: avg=3.35µs   min=1µs    med=2.5µs    max=11.84ms  p(90)=4.03µs  p(95)=4.8µs    p(99.9)=39.82µs 
     http_req_connecting............: avg=316ns    min=0s     med=0s       max=3.94ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=24.76ms  min=1.92ms med=17.03ms  max=606.63ms p(90)=52.22ms p(95)=68.97ms  p(99.9)=187.12ms
       { expected_response:true }...: avg=24.76ms  min=1.92ms med=17.03ms  max=606.63ms p(90)=52.22ms p(95)=68.97ms  p(99.9)=187.12ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 239957
     http_req_receiving.............: avg=671.23µs min=50.7µs med=108.91µs max=179.71ms p(90)=1.12ms  p(95)=1.8ms    p(99.9)=54.91ms 
     http_req_sending...............: avg=44.42µs  min=5.46µs med=10.38µs  max=160.07ms p(90)=19.12µs p(95)=121.73µs p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s     med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.04ms  min=1.79ms med=16.48ms  max=606.5ms  p(90)=50.95ms p(95)=67.61ms  p(99.9)=185.35ms
     http_reqs......................: 239957  1995.542842/s
     iteration_duration.............: avg=25ms     min=2.63ms med=17.26ms  max=606.92ms p(90)=52.46ms p(95)=69.22ms  p(99.9)=189.45ms
     iterations.....................: 239857  1994.711217/s
     success_rate...................: 100.00% ✓ 239857      ✗ 0     
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

     checks.........................: 100.00% ✓ 555897      ✗ 0     
     data_received..................: 16 GB   135 MB/s
     data_sent......................: 223 MB  1.9 MB/s
     http_req_blocked...............: avg=3.98µs   min=972ns   med=2.64µs  max=10.52ms  p(90)=5.08µs   p(95)=6.23µs   p(99.9)=45.08µs
     http_req_connecting............: avg=554ns    min=0s      med=0s      max=4.51ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.1ms   min=2.38ms  med=31.13ms max=351.45ms p(90)=42.91ms  p(95)=47.74ms  p(99.9)=90.01ms
       { expected_response:true }...: avg=32.1ms   min=2.38ms  med=31.13ms max=351.45ms p(90)=42.91ms  p(95)=47.74ms  p(99.9)=90.01ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 185399
     http_req_receiving.............: avg=155.14µs min=30.93µs med=64.08µs max=253.07ms p(90)=140.89µs p(95)=306.62µs p(99.9)=7.31ms 
     http_req_sending...............: avg=50.03µs  min=5.08µs  med=11.01µs max=247.47ms p(90)=25.43µs  p(95)=142.99µs p(99.9)=3.69ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=31.89ms  min=2.26ms  med=30.98ms max=137.8ms  p(90)=42.7ms   p(95)=47.48ms  p(99.9)=88.93ms
     http_reqs......................: 185399  1541.150323/s
     iteration_duration.............: avg=32.36ms  min=4.48ms  med=31.37ms max=392.43ms p(90)=43.16ms  p(95)=47.99ms  p(99.9)=91.76ms
     iterations.....................: 185299  1540.319062/s
     success_rate...................: 100.00% ✓ 185299      ✗ 0     
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

     checks.........................: 100.00% ✓ 435795      ✗ 0     
     data_received..................: 13 GB   106 MB/s
     data_sent......................: 175 MB  1.5 MB/s
     http_req_blocked...............: avg=4.03µs  min=1µs     med=2.85µs  max=4.37ms   p(90)=4.41µs   p(95)=5.1µs    p(99.9)=39.46µs
     http_req_connecting............: avg=831ns   min=0s      med=0s      max=4.32ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.03ms min=2.26ms  med=40.47ms max=338.77ms p(90)=57.63ms  p(95)=62.89ms  p(99.9)=88.93ms
       { expected_response:true }...: avg=41.03ms min=2.26ms  med=40.47ms max=338.77ms p(90)=57.63ms  p(95)=62.89ms  p(99.9)=88.93ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 145365
     http_req_receiving.............: avg=87.93µs min=29.37µs med=69.11µs max=27.06ms  p(90)=108.63µs p(95)=128.13µs p(99.9)=1.75ms 
     http_req_sending...............: avg=30.79µs min=5.53µs  med=12.68µs max=118.99ms p(90)=19.7µs   p(95)=23.66µs  p(99.9)=1.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=40.91ms min=2.18ms  med=40.36ms max=338.18ms p(90)=57.51ms  p(95)=62.76ms  p(99.9)=88.67ms
     http_reqs......................: 145365  1208.386686/s
     iteration_duration.............: avg=41.29ms min=4.54ms  med=40.69ms max=354.5ms  p(90)=57.86ms  p(95)=63.12ms  p(99.9)=89.36ms
     iterations.....................: 145265  1207.555409/s
     success_rate...................: 100.00% ✓ 145265      ✗ 0     
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

     checks.........................: 100.00% ✓ 185772     ✗ 0    
     data_received..................: 5.4 GB  45 MB/s
     data_sent......................: 75 MB   618 kB/s
     http_req_blocked...............: avg=4.59µs  min=1.06µs  med=3.1µs   max=3.36ms   p(90)=4.65µs   p(95)=5.24µs   p(99.9)=55.77µs 
     http_req_connecting............: avg=1.22µs  min=0s      med=0s      max=3.33ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=96.5ms  min=4.49ms  med=93.53ms max=343.55ms p(90)=116.92ms p(95)=130.06ms p(99.9)=228.82ms
       { expected_response:true }...: avg=96.5ms  min=4.49ms  med=93.53ms max=343.55ms p(90)=116.92ms p(95)=130.06ms p(99.9)=228.82ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62024
     http_req_receiving.............: avg=92.38µs min=32.33µs med=80.86µs max=73.86ms  p(90)=114.95µs p(95)=127.99µs p(99.9)=1.01ms  
     http_req_sending...............: avg=28.86µs min=5.73µs  med=14.22µs max=257.14ms p(90)=20.69µs  p(95)=22.85µs  p(99.9)=693.5µs 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=96.38ms min=4.32ms  med=93.41ms max=324.3ms  p(90)=116.78ms p(95)=129.91ms p(99.9)=228.69ms
     http_reqs......................: 62024   514.41961/s
     iteration_duration.............: avg=96.9ms  min=20.9ms  med=93.78ms max=351.87ms p(90)=117.19ms p(95)=130.39ms p(99.9)=231.04ms
     iterations.....................: 61924   513.590222/s
     success_rate...................: 100.00% ✓ 61924      ✗ 0    
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

     checks.........................: 100.00% ✓ 145017     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   482 kB/s
     http_req_blocked...............: avg=6.15µs   min=1.14µs  med=3.72µs   max=4.28ms   p(90)=5.23µs   p(95)=5.81µs   p(99.9)=131.64µs
     http_req_connecting............: avg=2.24µs   min=0s      med=0s       max=4.23ms   p(90)=0s       p(95)=0s       p(99.9)=104.98µs
     http_req_duration..............: avg=123.63ms min=5.89ms  med=121.1ms  max=354.31ms p(90)=163.88ms p(95)=176.02ms p(99.9)=230.53ms
       { expected_response:true }...: avg=123.63ms min=5.89ms  med=121.1ms  max=354.31ms p(90)=163.88ms p(95)=176.02ms p(99.9)=230.53ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48439
     http_req_receiving.............: avg=113.83µs min=31.76µs med=88.9µs   max=55.02ms  p(90)=120.97µs p(95)=134.2µs  p(99.9)=853.52µs
     http_req_sending...............: avg=25.37µs  min=5.81µs  med=17.34µs  max=56.67ms  p(90)=22.51µs  p(95)=24.44µs  p(99.9)=698.41µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.49ms min=5.79ms  med=120.98ms max=335.26ms p(90)=163.74ms p(95)=175.91ms p(99.9)=230.44ms
     http_reqs......................: 48439   401.172727/s
     iteration_duration.............: avg=124.15ms min=15.9ms  med=121.44ms max=371.92ms p(90)=164.18ms p(95)=176.38ms p(99.9)=233.83ms
     iterations.....................: 48339   400.344525/s
     success_rate...................: 100.00% ✓ 48339      ✗ 0    
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

     checks.........................: 100.00% ✓ 85497      ✗ 0    
     data_received..................: 2.5 GB  21 MB/s
     data_sent......................: 34 MB   284 kB/s
     http_req_blocked...............: avg=5.04µs   min=1.23µs  med=3.59µs   max=1.94ms   p(90)=4.89µs   p(95)=5.43µs   p(99.9)=550.9µs 
     http_req_connecting............: avg=1.3µs    min=0s      med=0s       max=1.9ms    p(90)=0s       p(95)=0s       p(99.9)=526.52µs
     http_req_duration..............: avg=209.68ms min=8.6ms   med=208.36ms max=352.35ms p(90)=218.26ms p(95)=225.18ms p(99.9)=288.85ms
       { expected_response:true }...: avg=209.68ms min=8.6ms   med=208.36ms max=352.35ms p(90)=218.26ms p(95)=225.18ms p(99.9)=288.85ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 28599
     http_req_receiving.............: avg=104.99µs min=34.13µs med=95.21µs  max=36.54ms  p(90)=126.55µs p(95)=140.09µs p(99.9)=855.91µs
     http_req_sending...............: avg=23.37µs  min=6.08µs  med=17.72µs  max=21.51ms  p(90)=22.2µs   p(95)=24.01µs  p(99.9)=644.22µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=209.55ms min=8.46ms  med=208.24ms max=352.2ms  p(90)=218.14ms p(95)=225.08ms p(99.9)=288.74ms
     http_reqs......................: 28599   236.1912/s
     iteration_duration.............: avg=210.66ms min=51.92ms med=208.64ms max=364.29ms p(90)=218.54ms p(95)=225.51ms p(99.9)=290.87ms
     iterations.....................: 28499   235.365328/s
     success_rate...................: 100.00% ✓ 28499      ✗ 0    
     vus............................: 36      min=36       max=50 
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

     checks.........................: 100.00% ✓ 84420     ✗ 0    
     data_received..................: 2.5 GB  20 MB/s
     data_sent......................: 34 MB   280 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.28µs  med=3.81µs   max=3.02ms   p(90)=5.24µs   p(95)=5.8µs    p(99.9)=665.31µs
     http_req_connecting............: avg=1.91µs   min=0s      med=0s       max=3ms      p(90)=0s       p(95)=0s       p(99.9)=638.89µs
     http_req_duration..............: avg=212.36ms min=6.63ms  med=194.54ms max=726.59ms p(90)=249.65ms p(95)=440.11ms p(99.9)=617.26ms
       { expected_response:true }...: avg=212.36ms min=6.63ms  med=194.54ms max=726.59ms p(90)=249.65ms p(95)=440.11ms p(99.9)=617.26ms
     http_req_failed................: 0.00%   ✓ 0         ✗ 28240
     http_req_receiving.............: avg=104.5µs  min=35.63µs med=99.52µs  max=10.94ms  p(90)=131.43µs p(95)=144.71µs p(99.9)=651.51µs
     http_req_sending...............: avg=23.26µs  min=5.98µs  med=18.6µs   max=31ms     p(90)=23.27µs  p(95)=24.87µs  p(99.9)=597.35µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=212.23ms min=6.45ms  med=194.42ms max=726.48ms p(90)=249.54ms p(95)=439.98ms p(99.9)=617.14ms
     http_reqs......................: 28240   233.06763/s
     iteration_duration.............: avg=213.36ms min=30.04ms med=194.96ms max=726.8ms  p(90)=249.99ms p(95)=440.98ms p(99.9)=617.66ms
     iterations.....................: 28140   232.24232/s
     success_rate...................: 100.00% ✓ 28140     ✗ 0    
     vus............................: 24      min=24      max=50 
     vus_max........................: 50      min=50      max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

