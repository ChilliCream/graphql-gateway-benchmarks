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
| hive-router | v0.0.49 | 2,987 | 3,176 | 2,959 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.9 | 2,152 | 2,205 | 2,131 | 1.2% |  |
| grafbase | 0.53.3 | 1,997 | 2,078 | 1,965 | 1.9% |  |
| cosmo | 0.307.0 | 1,241 | 1,265 | 1,233 | 0.9% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 549 | 555 | 544 | 0.7% |  |
| apollo-router | v2.13.1 | 400 | 412 | 395 | 1.5% |  |
| hive-gateway | 2.5.25 | 255 | 258 | 251 | 1.0% |  |
| apollo-gateway | 2.13.3 | 244 | 246 | 243 | 0.5% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,401 | 2,533 | 2,357 | 2.4% |  |
| hotchocolate | 16.1.0-p.1.9 | 1,970 | 2,028 | 1,941 | 1.3% |  |
| grafbase | 0.53.3 | 1,504 | 1,541 | 1,487 | 1.0% |  |
| cosmo | 0.307.0 | 1,203 | 1,226 | 1,192 | 0.9% | non-compatible response (2 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 507 | 521 | 502 | 1.3% |  |
| apollo-router | v2.13.1 | 386 | 396 | 381 | 1.4% |  |
| hive-gateway | 2.5.25 | 244 | 249 | 241 | 1.2% |  |
| apollo-gateway | 2.13.3 | 243 | 245 | 241 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1076949     ✗ 0     
     data_received..................: 32 GB   262 MB/s
     data_sent......................: 432 MB  3.6 MB/s
     http_req_blocked...............: avg=3.07µs   min=992ns   med=2.44µs  max=27.11ms  p(90)=3.61µs   p(95)=4.26µs   p(99.9)=34.33µs
     http_req_connecting............: avg=167ns    min=0s      med=0s      max=2.64ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.47ms  min=1.7ms   med=15.46ms max=303.69ms p(90)=24.49ms  p(95)=28.43ms  p(99.9)=52.39ms
       { expected_response:true }...: avg=16.47ms  min=1.7ms   med=15.46ms max=303.69ms p(90)=24.49ms  p(95)=28.43ms  p(99.9)=52.39ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 359083
     http_req_receiving.............: avg=139.69µs min=28.04µs med=51.9µs  max=271.08ms p(90)=103.67µs p(95)=288.82µs p(99.9)=11.11ms
     http_req_sending...............: avg=64.78µs  min=5.14µs  med=9.7µs   max=243.7ms  p(90)=16.29µs  p(95)=127.06µs p(99.9)=12.09ms
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.26ms  min=1.63ms  med=15.3ms  max=302.68ms p(90)=24.2ms   p(95)=28ms     p(99.9)=50.59ms
     http_reqs......................: 359083  2987.337395/s
     iteration_duration.............: avg=16.7ms   min=2.06ms  med=15.67ms max=313.49ms p(90)=24.72ms  p(95)=28.69ms  p(99.9)=54.2ms 
     iterations.....................: 358983  2986.505459/s
     success_rate...................: 100.00% ✓ 358983      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (rust subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 776667      ✗ 0     
     data_received..................: 23 GB   189 MB/s
     data_sent......................: 311 MB  2.6 MB/s
     http_req_blocked...............: avg=2.96µs   min=1.02µs  med=2.32µs   max=15.96ms  p(90)=3.43µs   p(95)=4.01µs   p(99.9)=33.69µs 
     http_req_connecting............: avg=206ns    min=0s      med=0s       max=2.58ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=22.93ms  min=2.42ms  med=14.64ms  max=343.85ms p(90)=51.17ms  p(95)=70.04ms  p(99.9)=167.48ms
       { expected_response:true }...: avg=22.93ms  min=2.42ms  med=14.64ms  max=343.85ms p(90)=51.17ms  p(95)=70.04ms  p(99.9)=167.48ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 258989
     http_req_receiving.............: avg=661.31µs min=50.26µs med=105.52µs max=193.09ms p(90)=966.48µs p(95)=1.5ms    p(99.9)=60.87ms 
     http_req_sending...............: avg=46.4µs   min=5.33µs  med=9.41µs   max=209.77ms p(90)=15.23µs  p(95)=107.66µs p(99.9)=3.38ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=22.22ms  min=2.28ms  med=14.13ms  max=342.3ms  p(90)=49.83ms  p(95)=68.53ms  p(99.9)=165.51ms
     http_reqs......................: 258989  2152.887072/s
     iteration_duration.............: avg=23.16ms  min=3.27ms  med=14.86ms  max=347.72ms p(90)=51.44ms  p(95)=70.31ms  p(99.9)=169.34ms
     iterations.....................: 258889  2152.055806/s
     success_rate...................: 100.00% ✓ 258889      ✗ 0     
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

     checks.........................: 100.00% ✓ 720159      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 289 MB  2.4 MB/s
     http_req_blocked...............: avg=3.71µs  min=1µs     med=2.62µs  max=13ms     p(90)=4.1µs   p(95)=4.88µs   p(99.9)=40.25µs
     http_req_connecting............: avg=447ns   min=0s      med=0s      max=4.03ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=24.74ms min=1.97ms  med=24.48ms max=327.9ms  p(90)=29.82ms p(95)=32.24ms  p(99.9)=54.08ms
       { expected_response:true }...: avg=24.74ms min=1.97ms  med=24.48ms max=327.9ms  p(90)=29.82ms p(95)=32.24ms  p(99.9)=54.08ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 240153
     http_req_receiving.............: avg=115.2µs min=30.38µs med=62.81µs max=113.97ms p(90)=106.1µs p(95)=194.11µs p(99.9)=9.11ms 
     http_req_sending...............: avg=48.38µs min=5.01µs  med=11.22µs max=257.01ms p(90)=18.73µs p(95)=116.17µs p(99.9)=3.72ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=24.58ms min=1.91ms  med=24.36ms max=327.51ms p(90)=29.63ms p(95)=31.96ms  p(99.9)=52.92ms
     http_reqs......................: 240153  1997.062833/s
     iteration_duration.............: avg=24.98ms min=3.13ms  med=24.7ms  max=355.58ms p(90)=30.05ms p(95)=32.49ms  p(99.9)=55.01ms
     iterations.....................: 240053  1996.231254/s
     success_rate...................: 100.00% ✓ 240053      ✗ 0     
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

     checks.........................: 100.00% ✓ 447720      ✗ 0     
     data_received..................: 13 GB   109 MB/s
     data_sent......................: 179 MB  1.5 MB/s
     http_req_blocked...............: avg=3.41µs  min=1.07µs  med=2.42µs  max=5.05ms   p(90)=3.69µs  p(95)=4.28µs   p(99.9)=35.26µs
     http_req_connecting............: avg=683ns   min=0s      med=0s      max=5.02ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=39.96ms min=2.16ms  med=39.41ms max=305.41ms p(90)=56.29ms p(95)=61.42ms  p(99.9)=86.68ms
       { expected_response:true }...: avg=39.96ms min=2.16ms  med=39.41ms max=305.41ms p(90)=56.29ms p(95)=61.42ms  p(99.9)=86.68ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 149340
     http_req_receiving.............: avg=78.76µs min=29.45µs med=60.52µs max=25.75ms  p(90)=95.18µs p(95)=112.63µs p(99.9)=1.76ms 
     http_req_sending...............: avg=29.95µs min=5.52µs  med=10.5µs  max=160.3ms  p(90)=15.44µs p(95)=19.51µs  p(99.9)=1.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=39.85ms min=2.06ms  med=39.3ms  max=304.77ms p(90)=56.17ms p(95)=61.3ms   p(99.9)=86.17ms
     http_reqs......................: 149340  1241.671243/s
     iteration_duration.............: avg=40.19ms min=3.88ms  med=39.61ms max=338.57ms p(90)=56.49ms p(95)=61.63ms  p(99.9)=87.28ms
     iterations.....................: 149240  1240.839804/s
     success_rate...................: 100.00% ✓ 149240      ✗ 0     
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

     checks.........................: 100.00% ✓ 198309     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 80 MB   660 kB/s
     http_req_blocked...............: avg=4.82µs  min=1.11µs  med=3.06µs  max=4.47ms   p(90)=4.63µs   p(95)=5.27µs   p(99.9)=50.54µs 
     http_req_connecting............: avg=1.43µs  min=0s      med=0s      max=4.43ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=90.4ms  min=4.13ms  med=82.64ms max=345.92ms p(90)=145.98ms p(95)=160.17ms p(99.9)=255.76ms
       { expected_response:true }...: avg=90.4ms  min=4.13ms  med=82.64ms max=345.92ms p(90)=145.98ms p(95)=160.17ms p(99.9)=255.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 66203
     http_req_receiving.............: avg=89.82µs min=32.19µs med=78.84µs max=209.77ms p(90)=113.99µs p(95)=127.8µs  p(99.9)=916.86µs
     http_req_sending...............: avg=33.45µs min=6.04µs  med=13.8µs  max=201.18ms p(90)=20.59µs  p(95)=22.85µs  p(99.9)=803.77µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.28ms min=4ms     med=82.51ms max=344.78ms p(90)=145.84ms p(95)=160.04ms p(99.9)=255.36ms
     http_reqs......................: 66203   549.224755/s
     iteration_duration.............: avg=90.77ms min=17.38ms med=83.08ms max=354.66ms p(90)=146.23ms p(95)=160.48ms p(99.9)=259.13ms
     iterations.....................: 66103   548.395148/s
     success_rate...................: 100.00% ✓ 66103      ✗ 0    
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

     checks.........................: 100.00% ✓ 144774     ✗ 0    
     data_received..................: 4.2 GB  35 MB/s
     data_sent......................: 58 MB   481 kB/s
     http_req_blocked...............: avg=5.6µs    min=1.18µs  med=3.1µs    max=4.39ms   p(90)=4.51µs   p(95)=5.06µs   p(99.9)=771.82µs
     http_req_connecting............: avg=2.28µs   min=0s      med=0s       max=4.35ms   p(90)=0s       p(95)=0s       p(99.9)=746.02µs
     http_req_duration..............: avg=123.86ms min=5.34ms  med=123.65ms max=355.87ms p(90)=149.88ms p(95)=157.89ms p(99.9)=191.87ms
       { expected_response:true }...: avg=123.86ms min=5.34ms  med=123.65ms max=355.87ms p(90)=149.88ms p(95)=157.89ms p(99.9)=191.87ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 48358
     http_req_receiving.............: avg=90.03µs  min=31.52µs med=80.63µs  max=123.89ms p(90)=111.95µs p(95)=124.02µs p(99.9)=821.13µs
     http_req_sending...............: avg=22.85µs  min=6.13µs  med=14.47µs  max=56.97ms  p(90)=20.2µs   p(95)=22.13µs  p(99.9)=581.39µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=123.75ms min=5.22ms  med=123.53ms max=332.48ms p(90)=149.78ms p(95)=157.77ms p(99.9)=191.71ms
     http_reqs......................: 48358   400.648143/s
     iteration_duration.............: avg=124.37ms min=23.79ms med=123.91ms max=361.93ms p(90)=150.14ms p(95)=158.18ms p(99.9)=195.73ms
     iterations.....................: 48258   399.819638/s
     success_rate...................: 100.00% ✓ 48258      ✗ 0    
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

     checks.........................: 100.00% ✓ 92469      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   307 kB/s
     http_req_blocked...............: avg=5.85µs   min=1.21µs  med=3.57µs   max=3.03ms   p(90)=5.06µs   p(95)=5.73µs   p(99.9)=729.63µs
     http_req_connecting............: avg=1.97µs   min=0s      med=0s       max=3ms      p(90)=0s       p(95)=0s       p(99.9)=672.87µs
     http_req_duration..............: avg=193.84ms min=6.12ms  med=175.92ms max=602.27ms p(90)=234.06ms p(95)=405.02ms p(99.9)=533.48ms
       { expected_response:true }...: avg=193.84ms min=6.12ms  med=175.92ms max=602.27ms p(90)=234.06ms p(95)=405.02ms p(99.9)=533.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30923
     http_req_receiving.............: avg=104.81µs min=36.4µs  med=96.92µs  max=47.55ms  p(90)=128.52µs p(95)=142.14µs p(99.9)=699.04µs
     http_req_sending...............: avg=41.02µs  min=6.25µs  med=17.92µs  max=183.35ms p(90)=22.93µs  p(95)=24.88µs  p(99.9)=839.34µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=193.7ms  min=5.97ms  med=175.77ms max=602.19ms p(90)=233.9ms  p(95)=404.91ms p(99.9)=533.38ms
     http_reqs......................: 30923   255.606101/s
     iteration_duration.............: avg=194.76ms min=61.08ms med=176.31ms max=602.57ms p(90)=234.62ms p(95)=405.85ms p(99.9)=533.71ms
     iterations.....................: 30823   254.779512/s
     success_rate...................: 100.00% ✓ 30823      ✗ 0    
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

     checks.........................: 100.00% ✓ 88611      ✗ 0    
     data_received..................: 2.6 GB  22 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=5.65µs   min=1.32µs  med=3.38µs   max=4.72ms   p(90)=4.69µs   p(95)=5.23µs   p(99.9)=709.62µs
     http_req_connecting............: avg=1.81µs   min=0s      med=0s       max=3.12ms   p(90)=0s       p(95)=0s       p(99.9)=606.96µs
     http_req_duration..............: avg=202.32ms min=8.44ms  med=201.04ms max=399.46ms p(90)=214.01ms p(95)=227.08ms p(99.9)=286.23ms
       { expected_response:true }...: avg=202.32ms min=8.44ms  med=201.04ms max=399.46ms p(90)=214.01ms p(95)=227.08ms p(99.9)=286.23ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29637
     http_req_receiving.............: avg=95.73µs  min=33.51µs med=91.36µs  max=9.01ms   p(90)=122.69µs p(95)=135.65µs p(99.9)=565.53µs
     http_req_sending...............: avg=34.5µs   min=6.3µs   med=17.07µs  max=163.68ms p(90)=21.71µs  p(95)=23.46µs  p(99.9)=806.66µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.19ms min=8.26ms  med=200.93ms max=395.07ms p(90)=213.88ms p(95)=226.93ms p(99.9)=286.13ms
     http_reqs......................: 29637   244.789814/s
     iteration_duration.............: avg=203.28ms min=35.35ms med=201.34ms max=411.74ms p(90)=214.31ms p(95)=227.53ms p(99.9)=288.7ms 
     iterations.....................: 29537   243.963854/s
     success_rate...................: 100.00% ✓ 29537      ✗ 0    
     vus............................: 35      min=35       max=50 
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

     checks.........................: 100.00% ✓ 865773      ✗ 0     
     data_received..................: 25 GB   210 MB/s
     data_sent......................: 347 MB  2.9 MB/s
     http_req_blocked...............: avg=3.48µs   min=1.04µs  med=2.66µs  max=12.25ms  p(90)=4.13µs  p(95)=4.94µs   p(99.9)=38.39µs
     http_req_connecting............: avg=235ns    min=0s      med=0s      max=3.07ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=20.54ms  min=1.63ms  med=19.94ms max=330.94ms p(90)=28.7ms  p(95)=32.08ms  p(99.9)=55.44ms
       { expected_response:true }...: avg=20.54ms  min=1.63ms  med=19.94ms max=330.94ms p(90)=28.7ms  p(95)=32.08ms  p(99.9)=55.44ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 288691
     http_req_receiving.............: avg=127.23µs min=28.78µs med=56.77µs max=96.82ms  p(90)=108.7µs p(95)=279.59µs p(99.9)=10.88ms
     http_req_sending...............: avg=58.24µs  min=5.36µs  med=10.76µs max=200.93ms p(90)=19.07µs p(95)=130.38µs p(99.9)=7.4ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=20.35ms  min=1.54ms  med=19.8ms  max=330.43ms p(90)=28.47ms p(95)=31.73ms  p(99.9)=54.44ms
     http_reqs......................: 288691  2401.314924/s
     iteration_duration.............: avg=20.78ms  min=3.24ms  med=20.17ms max=344.33ms p(90)=28.93ms p(95)=32.35ms  p(99.9)=55.9ms 
     iterations.....................: 288591  2400.48313/s
     success_rate...................: 100.00% ✓ 288591      ✗ 0     
     vus............................: 50      min=50        max=50  
     vus_max........................: 50      min=50        max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

<details>
  <summary>Summary for: hotchocolate (.net subgraphs) (16.1.0-p.1.9)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 710556      ✗ 0     
     data_received..................: 21 GB   173 MB/s
     data_sent......................: 285 MB  2.4 MB/s
     http_req_blocked...............: avg=3.39µs   min=972ns   med=2.52µs   max=11.5ms   p(90)=3.9µs   p(95)=4.61µs   p(99.9)=35.88µs 
     http_req_connecting............: avg=438ns    min=0s      med=0s       max=4.67ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.08ms  min=1.87ms  med=17.16ms  max=582.93ms p(90)=53.05ms p(95)=70.5ms   p(99.9)=195.67ms
       { expected_response:true }...: avg=25.08ms  min=1.87ms  med=17.16ms  max=582.93ms p(90)=53.05ms p(95)=70.5ms   p(99.9)=195.67ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 236952
     http_req_receiving.............: avg=702.93µs min=51.72µs med=111.12µs max=213.79ms p(90)=1.15ms  p(95)=1.83ms   p(99.9)=58.07ms 
     http_req_sending...............: avg=44.08µs  min=5.37µs  med=10.33µs  max=171.1ms  p(90)=18.36µs p(95)=113.91µs p(99.9)=2.56ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.33ms  min=1.74ms  med=16.6ms   max=581.95ms p(90)=51.74ms p(95)=68.93ms  p(99.9)=192.41ms
     http_reqs......................: 236952  1970.649602/s
     iteration_duration.............: avg=25.32ms  min=2.57ms  med=17.39ms  max=583.16ms p(90)=53.28ms p(95)=70.74ms  p(99.9)=198.34ms
     iterations.....................: 236852  1969.817936/s
     success_rate...................: 100.00% ✓ 236852      ✗ 0     
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

     checks.........................: 100.00% ✓ 542652      ✗ 0     
     data_received..................: 16 GB   132 MB/s
     data_sent......................: 218 MB  1.8 MB/s
     http_req_blocked...............: avg=3.9µs    min=982ns   med=2.73µs  max=6.19ms   p(90)=5.14µs   p(95)=6.23µs   p(99.9)=46.25µs
     http_req_connecting............: avg=503ns    min=0s      med=0s      max=4.4ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.88ms  min=2.41ms  med=31.98ms max=335.3ms  p(90)=43.73ms  p(95)=48.51ms  p(99.9)=96.75ms
       { expected_response:true }...: avg=32.88ms  min=2.41ms  med=31.98ms max=335.3ms  p(90)=43.73ms  p(95)=48.51ms  p(99.9)=96.75ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 180984
     http_req_receiving.............: avg=116.65µs min=30.69µs med=63.71µs max=147.64ms p(90)=136.53µs p(95)=285.26µs p(99.9)=6.2ms  
     http_req_sending...............: avg=47.37µs  min=4.56µs  med=11.02µs max=70.74ms  p(90)=24.71µs  p(95)=137.02µs p(99.9)=3.68ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.72ms  min=2.3ms   med=31.84ms max=324.49ms p(90)=43.53ms  p(95)=48.28ms  p(99.9)=96.3ms 
     http_reqs......................: 180984  1504.403992/s
     iteration_duration.............: avg=33.15ms  min=3.52ms  med=32.23ms max=347.86ms p(90)=43.99ms  p(95)=48.77ms  p(99.9)=97.72ms
     iterations.....................: 180884  1503.572756/s
     success_rate...................: 100.00% ✓ 180884      ✗ 0     
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

     checks.........................: 100.00% ✓ 433842      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.72µs  min=1.05µs  med=2.71µs  max=3.91ms   p(90)=4.29µs   p(95)=4.97µs   p(99.9)=38.39µs
     http_req_connecting............: avg=683ns   min=0s      med=0s      max=3.86ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=41.22ms min=2.29ms  med=40.66ms max=344.94ms p(90)=57.94ms  p(95)=63.32ms  p(99.9)=89.47ms
       { expected_response:true }...: avg=41.22ms min=2.29ms  med=40.66ms max=344.94ms p(90)=57.94ms  p(95)=63.32ms  p(99.9)=89.47ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144714
     http_req_receiving.............: avg=90.6µs  min=29.23µs med=68.06µs max=134.51ms p(90)=107.27µs p(95)=127.39µs p(99.9)=1.93ms 
     http_req_sending...............: avg=27.96µs min=5.46µs  med=11.79µs max=133.92ms p(90)=18.56µs  p(95)=22.85µs  p(99.9)=1.27ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=41.1ms  min=2.16ms  med=40.55ms max=313.06ms p(90)=57.81ms  p(95)=63.18ms  p(99.9)=89.16ms
     http_reqs......................: 144714  1203.012512/s
     iteration_duration.............: avg=41.48ms min=4.07ms  med=40.88ms max=361.03ms p(90)=58.16ms  p(95)=63.55ms  p(99.9)=90.48ms
     iterations.....................: 144614  1202.181208/s
     success_rate...................: 100.00% ✓ 144614      ✗ 0     
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

     checks.........................: 100.00% ✓ 183276     ✗ 0    
     data_received..................: 5.4 GB  44 MB/s
     data_sent......................: 74 MB   609 kB/s
     http_req_blocked...............: avg=5.1µs   min=1.16µs  med=3.2µs   max=4.19ms   p(90)=4.68µs   p(95)=5.26µs   p(99.9)=56.9µs  
     http_req_connecting............: avg=1.68µs  min=0s      med=0s      max=4.15ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=97.83ms min=4.24ms  med=95.19ms max=360.36ms p(90)=118.32ms p(95)=131.68ms p(99.9)=225.57ms
       { expected_response:true }...: avg=97.83ms min=4.24ms  med=95.19ms max=360.36ms p(90)=118.32ms p(95)=131.68ms p(99.9)=225.57ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 61192
     http_req_receiving.............: avg=91.84µs min=33.3µs  med=82µs    max=104.04ms p(90)=114.84µs p(95)=126.78µs p(99.9)=932.29µs
     http_req_sending...............: avg=25.44µs min=5.86µs  med=14.19µs max=205.83ms p(90)=20.33µs  p(95)=22.31µs  p(99.9)=645.44µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=97.71ms min=4.13ms  med=95.08ms max=359.7ms  p(90)=118.19ms p(95)=131.56ms p(99.9)=224.52ms
     http_reqs......................: 61192   507.385157/s
     iteration_duration.............: avg=98.24ms min=27.13ms med=95.44ms max=368.73ms p(90)=118.59ms p(95)=132.05ms p(99.9)=227.84ms
     iterations.....................: 61092   506.555988/s
     success_rate...................: 100.00% ✓ 61092      ✗ 0    
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

     checks.........................: 100.00% ✓ 139572     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 56 MB   464 kB/s
     http_req_blocked...............: avg=5.91µs   min=1.25µs  med=3.55µs   max=4.58ms   p(90)=5.05µs   p(95)=5.63µs   p(99.9)=199.21µs
     http_req_connecting............: avg=2.18µs   min=0s      med=0s       max=4.53ms   p(90)=0s       p(95)=0s       p(99.9)=117.75µs
     http_req_duration..............: avg=128.44ms min=6.05ms  med=125.84ms max=358.83ms p(90)=170.48ms p(95)=183.08ms p(99.9)=238.59ms
       { expected_response:true }...: avg=128.44ms min=6.05ms  med=125.84ms max=358.83ms p(90)=170.48ms p(95)=183.08ms p(99.9)=238.59ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46624
     http_req_receiving.............: avg=95.91µs  min=32.03µs med=88.55µs  max=59.05ms  p(90)=120.27µs p(95)=132.86µs p(99.9)=814.81µs
     http_req_sending...............: avg=34.46µs  min=6.02µs  med=16.86µs  max=213.26ms p(90)=22.11µs  p(95)=23.97µs  p(99.9)=746.63µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.31ms min=5.92ms  med=125.71ms max=358.44ms p(90)=170.34ms p(95)=182.96ms p(99.9)=237.87ms
     http_reqs......................: 46624   386.110181/s
     iteration_duration.............: avg=129ms    min=19.71ms med=126.16ms max=375.64ms p(90)=170.79ms p(95)=183.41ms p(99.9)=242.57ms
     iterations.....................: 46524   385.282045/s
     success_rate...................: 100.00% ✓ 46524      ✗ 0    
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

     checks.........................: 100.00% ✓ 88494      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   294 kB/s
     http_req_blocked...............: avg=5.04µs   min=1.31µs  med=3.42µs   max=2.65ms   p(90)=4.75µs   p(95)=5.31µs   p(99.9)=491.37µs
     http_req_connecting............: avg=1.44µs   min=0s      med=0s       max=2.6ms    p(90)=0s       p(95)=0s       p(99.9)=468.74µs
     http_req_duration..............: avg=202.58ms min=6.43ms  med=187.99ms max=655.33ms p(90)=242.27ms p(95)=400.69ms p(99.9)=544.68ms
       { expected_response:true }...: avg=202.58ms min=6.43ms  med=187.99ms max=655.33ms p(90)=242.27ms p(95)=400.69ms p(99.9)=544.68ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29598
     http_req_receiving.............: avg=102.53µs min=36.35µs med=94µs     max=89.32ms  p(90)=124.75µs p(95)=137.31µs p(99.9)=492.65µs
     http_req_sending...............: avg=25.27µs  min=6.11µs  med=17.08µs  max=55.53ms  p(90)=21.59µs  p(95)=23.31µs  p(99.9)=704.38µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.46ms min=6.27ms  med=187.86ms max=655.21ms p(90)=242.13ms p(95)=400.58ms p(99.9)=544.57ms
     http_reqs......................: 29598   244.801155/s
     iteration_duration.............: avg=203.53ms min=44.18ms med=188.36ms max=655.59ms p(90)=242.68ms p(95)=402.49ms p(99.9)=544.93ms
     iterations.....................: 29498   243.974069/s
     success_rate...................: 100.00% ✓ 29498      ✗ 0    
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

     checks.........................: 100.00% ✓ 88317      ✗ 0    
     data_received..................: 2.6 GB  21 MB/s
     data_sent......................: 36 MB   293 kB/s
     http_req_blocked...............: avg=7.05µs   min=1.21µs  med=3.46µs   max=4.06ms   p(90)=4.77µs   p(95)=5.32µs   p(99.9)=1.75ms  
     http_req_connecting............: avg=3.42µs   min=0s      med=0s       max=4.02ms   p(90)=0s       p(95)=0s       p(99.9)=1.73ms  
     http_req_duration..............: avg=202.98ms min=8.47ms  med=203.1ms  max=461.82ms p(90)=214.79ms p(95)=219.77ms p(99.9)=288.48ms
       { expected_response:true }...: avg=202.98ms min=8.47ms  med=203.1ms  max=461.82ms p(90)=214.79ms p(95)=219.77ms p(99.9)=288.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 29539
     http_req_receiving.............: avg=102.06µs min=33.11µs med=93.21µs  max=85.03ms  p(90)=124.92µs p(95)=137.93µs p(99.9)=685.02µs
     http_req_sending...............: avg=30.06µs  min=6.33µs  med=17.22µs  max=87.3ms   p(90)=21.87µs  p(95)=23.67µs  p(99.9)=594.62µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=202.84ms min=8.35ms  med=202.97ms max=461.21ms p(90)=214.67ms p(95)=219.63ms p(99.9)=288.38ms
     http_reqs......................: 29539   243.930321/s
     iteration_duration.............: avg=203.94ms min=36.92ms med=203.96ms max=471.55ms p(90)=215.09ms p(95)=220.04ms p(99.9)=313.37ms
     iterations.....................: 29439   243.10453/s
     success_rate...................: 100.00% ✓ 29439      ✗ 0    
     vus............................: 43      min=43       max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-176-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

