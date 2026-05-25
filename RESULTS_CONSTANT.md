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
| hive-router | v0.0.49 | 3,021 | 3,234 | 2,981 | 2.7% |  |
| hotchocolate | 16.1.0-p.1.12 | 2,107 | 2,157 | 2,093 | 1.0% |  |
| grafbase | 0.53.3 | 2,001 | 2,053 | 1,962 | 1.2% |  |
| cosmo | 0.307.0 | 1,276 | 1,291 | 1,272 | 0.6% | non-compatible response (5 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 544 | 556 | 537 | 1.1% |  |
| apollo-router | v2.13.1 | 429 | 438 | 427 | 0.9% |  |
| hive-gateway | 2.5.25 | 254 | 257 | 251 | 0.8% |  |
| apollo-gateway | 2.13.3 | 250 | 252 | 249 | 0.4% |  |


### .NET Subgraphs

| Gateway | Version | Median RPS | Best RPS | Worst RPS | CV% | Notes |
| :------ | :------ | ---------: | -------: | --------: | --: | :---- |
| hive-router | v0.0.49 | 2,496 | 2,588 | 2,463 | 1.6% |  |
| hotchocolate | 16.1.0-p.1.12 | 1,942 | 1,987 | 1,920 | 1.0% |  |
| grafbase | 0.53.3 | 1,527 | 1,562 | 1,512 | 1.1% |  |
| cosmo | 0.307.0 | 1,204 | 1,224 | 1,197 | 0.8% | non-compatible response (3 across 2/9 runs) |
| hive-gateway-router-runtime | 2.5.25 | 518 | 529 | 514 | 1.0% |  |
| apollo-router | v2.13.1 | 386 | 396 | 382 | 1.3% |  |
| hive-gateway | 2.5.25 | 252 | 256 | 249 | 0.9% |  |
| apollo-gateway | 2.13.3 | 229 | 231 | 227 | 0.6% |  |


### Details

<details>
  <summary>Summary for: hive-router (rust subgraphs) (v0.0.49)</summary>

  **K6 Output**


```
✓ response code was 200
     ✓ no graphql errors
     ✓ valid response structure

     checks.........................: 100.00% ✓ 1089210     ✗ 0     
     data_received..................: 32 GB   265 MB/s
     data_sent......................: 436 MB  3.6 MB/s
     http_req_blocked...............: avg=2.78µs   min=931ns   med=2.02µs  max=10.8ms   p(90)=3.23µs   p(95)=3.91µs   p(99.9)=32.53µs
     http_req_connecting............: avg=283ns    min=0s      med=0s      max=4.24ms   p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=16.28ms  min=1.66ms  med=15.41ms max=292.11ms p(90)=23.64ms  p(95)=27.42ms  p(99.9)=50.84ms
       { expected_response:true }...: avg=16.28ms  min=1.66ms  med=15.41ms max=292.11ms p(90)=23.64ms  p(95)=27.42ms  p(99.9)=50.84ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 363170
     http_req_receiving.............: avg=129.91µs min=26.64µs med=49.77µs max=88.34ms  p(90)=101.82µs p(95)=277.99µs p(99.9)=11.53ms
     http_req_sending...............: avg=60.4µs   min=5.14µs  med=9.01µs  max=200.06ms p(90)=16.39µs  p(95)=122.85µs p(99.9)=8.51ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=16.09ms  min=1.59ms  med=15.26ms max=291.52ms p(90)=23.37ms  p(95)=27.01ms  p(99.9)=49.63ms
     http_reqs......................: 363170  3021.309113/s
     iteration_duration.............: avg=16.51ms  min=2.03ms  med=15.61ms max=322.06ms p(90)=23.86ms  p(95)=27.67ms  p(99.9)=52.21ms
     iterations.....................: 363070  3020.477186/s
     success_rate...................: 100.00% ✓ 363070      ✗ 0     
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

     checks.........................: 100.00% ✓ 760395      ✗ 0     
     data_received..................: 22 GB   185 MB/s
     data_sent......................: 305 MB  2.5 MB/s
     http_req_blocked...............: avg=2.7µs    min=992ns   med=2.06µs   max=14.75ms  p(90)=3.16µs   p(95)=3.72µs  p(99.9)=34.84µs 
     http_req_connecting............: avg=190ns    min=0s      med=0s       max=2.56ms   p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_duration..............: avg=23.43ms  min=2.45ms  med=14.83ms  max=323.35ms p(90)=52.74ms  p(95)=70.98ms p(99.9)=168.83ms
       { expected_response:true }...: avg=23.43ms  min=2.45ms  med=14.83ms  max=323.35ms p(90)=52.74ms  p(95)=70.98ms p(99.9)=168.83ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 253565
     http_req_receiving.............: avg=678.28µs min=52.32µs med=108.66µs max=198.52ms p(90)=971.26µs p(95)=1.5ms   p(99.9)=60.71ms 
     http_req_sending...............: avg=44.61µs  min=5.3µs   med=8.99µs   max=54.53ms  p(90)=14.58µs  p(95)=102.3µs p(99.9)=3.97ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s      
     http_req_waiting...............: avg=22.71ms  min=2.31ms  med=14.31ms  max=322.56ms p(90)=51.31ms  p(95)=69.52ms p(99.9)=165.74ms
     http_reqs......................: 253565  2107.830782/s
     iteration_duration.............: avg=23.66ms  min=3.24ms  med=15.05ms  max=361.21ms p(90)=52.97ms  p(95)=71.22ms p(99.9)=170.11ms
     iterations.....................: 253465  2106.999504/s
     success_rate...................: 100.00% ✓ 253465      ✗ 0     
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

     checks.........................: 100.00% ✓ 721815      ✗ 0     
     data_received..................: 21 GB   176 MB/s
     data_sent......................: 289 MB  2.4 MB/s
     http_req_blocked...............: avg=3.29µs  min=962ns   med=2.23µs  max=14.84ms  p(90)=3.65µs   p(95)=4.38µs  p(99.9)=34.06µs
     http_req_connecting............: avg=408ns   min=0s      med=0s      max=4.08ms   p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=24.69ms min=2ms     med=24.42ms max=322.13ms p(90)=29.49ms  p(95)=31.63ms p(99.9)=53.58ms
       { expected_response:true }...: avg=24.69ms min=2ms     med=24.42ms max=322.13ms p(90)=29.49ms  p(95)=31.63ms p(99.9)=53.58ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 240705
     http_req_receiving.............: avg=105.9µs min=30.78µs med=60.7µs  max=149.91ms p(90)=102.48µs p(95)=167.5µs p(99.9)=7.28ms 
     http_req_sending...............: avg=42.04µs min=5.2µs   med=9.99µs  max=149.25ms p(90)=16.78µs  p(95)=97.35µs p(99.9)=2.39ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=24.54ms min=1.88ms  med=24.31ms max=289.53ms p(90)=29.34ms  p(95)=31.4ms  p(99.9)=52.47ms
     http_reqs......................: 240705  2001.664104/s
     iteration_duration.............: avg=24.92ms min=4.08ms  med=24.63ms max=346.61ms p(90)=29.72ms  p(95)=31.87ms p(99.9)=54.33ms
     iterations.....................: 240605  2000.832521/s
     success_rate...................: 100.00% ✓ 240605      ✗ 0     
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

     checks.........................: 100.00% ✓ 460446      ✗ 0     
     data_received..................: 14 GB   112 MB/s
     data_sent......................: 185 MB  1.5 MB/s
     http_req_blocked...............: avg=2.74µs  min=981ns   med=2.08µs  max=2.84ms   p(90)=3.39µs  p(95)=4µs      p(99.9)=34.5µs 
     http_req_connecting............: avg=338ns   min=0s      med=0s      max=2.81ms   p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=38.85ms min=2.1ms   med=38.27ms max=315.59ms p(90)=54.75ms p(95)=59.81ms  p(99.9)=85.49ms
       { expected_response:true }...: avg=38.85ms min=2.1ms   med=38.27ms max=315.59ms p(90)=54.75ms p(95)=59.81ms  p(99.9)=85.49ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 153582
     http_req_receiving.............: avg=78.91µs min=28.28µs med=59.52µs max=148.65ms p(90)=95.21µs p(95)=113.25µs p(99.9)=1.79ms 
     http_req_sending...............: avg=32.96µs min=5.18µs  med=9.9µs   max=219.16ms p(90)=15.63µs p(95)=19.57µs  p(99.9)=1.38ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=38.74ms min=1.98ms  med=38.16ms max=315.29ms p(90)=54.62ms p(95)=59.69ms  p(99.9)=84.51ms
     http_reqs......................: 153582  1276.950761/s
     iteration_duration.............: avg=39.08ms min=3.77ms  med=38.47ms max=338.03ms p(90)=54.95ms p(95)=60.01ms  p(99.9)=86.11ms
     iterations.....................: 153482  1276.119316/s
     success_rate...................: 100.00% ✓ 153482      ✗ 0     
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

     checks.........................: 100.00% ✓ 196701     ✗ 0    
     data_received..................: 5.8 GB  48 MB/s
     data_sent......................: 79 MB   654 kB/s
     http_req_blocked...............: avg=4.75µs   min=1.14µs  med=2.88µs  max=4.33ms   p(90)=4.43µs   p(95)=5.05µs   p(99.9)=44.67µs 
     http_req_connecting............: avg=1.53µs   min=0s      med=0s      max=4.29ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=91.15ms  min=4.15ms  med=88.02ms max=364.16ms p(90)=113.25ms p(95)=127.3ms  p(99.9)=219.83ms
       { expected_response:true }...: avg=91.15ms  min=4.15ms  med=88.02ms max=364.16ms p(90)=113.25ms p(95)=127.3ms  p(99.9)=219.83ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 65667
     http_req_receiving.............: avg=190.13µs min=30.95µs med=76.52µs max=249.58ms p(90)=111.57µs p(95)=124.2µs  p(99.9)=2.96ms  
     http_req_sending...............: avg=20.99µs  min=5.68µs  med=13.11µs max=137.48ms p(90)=19.74µs  p(95)=21.99µs  p(99.9)=745.18µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=90.94ms  min=4.05ms  med=87.91ms max=271.63ms p(90)=113.1ms  p(95)=126.76ms p(99.9)=216.55ms
     http_reqs......................: 65667   544.691745/s
     iteration_duration.............: avg=91.52ms  min=7.44ms  med=88.26ms max=383.97ms p(90)=113.52ms p(95)=127.66ms p(99.9)=222.69ms
     iterations.....................: 65567   543.862269/s
     success_rate...................: 100.00% ✓ 65567      ✗ 0    
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

     checks.........................: 100.00% ✓ 155253     ✗ 0    
     data_received..................: 4.5 GB  38 MB/s
     data_sent......................: 62 MB   516 kB/s
     http_req_blocked...............: avg=4.55µs   min=1.27µs  med=3.41µs   max=2.5ms    p(90)=4.83µs   p(95)=5.37µs   p(99.9)=105.82µs
     http_req_connecting............: avg=943ns    min=0s      med=0s       max=2.48ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=115.48ms min=5.44ms  med=115.35ms max=331.87ms p(90)=139.33ms p(95)=146.48ms p(99.9)=181.29ms
       { expected_response:true }...: avg=115.48ms min=5.44ms  med=115.35ms max=331.87ms p(90)=139.33ms p(95)=146.48ms p(99.9)=181.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 51851
     http_req_receiving.............: avg=90.83µs  min=33.94µs med=85.86µs  max=13.32ms  p(90)=117.29µs p(95)=129.23µs p(99.9)=746.4µs 
     http_req_sending...............: avg=25.75µs  min=6.08µs  med=16.48µs  max=86.69ms  p(90)=21.81µs  p(95)=23.57µs  p(99.9)=663.68µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=115.37ms min=5.36ms  med=115.23ms max=331.45ms p(90)=139.2ms  p(95)=146.36ms p(99.9)=181.06ms
     http_reqs......................: 51851   429.585265/s
     iteration_duration.............: avg=115.97ms min=27.12ms med=115.63ms max=351.96ms p(90)=139.6ms  p(95)=146.76ms p(99.9)=182.25ms
     iterations.....................: 51751   428.756766/s
     success_rate...................: 100.00% ✓ 51751      ✗ 0    
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

     checks.........................: 100.00% ✓ 91893      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   305 kB/s
     http_req_blocked...............: avg=5.78µs   min=1.21µs  med=3.37µs   max=3.47ms   p(90)=4.82µs   p(95)=5.45µs   p(99.9)=621.92µs
     http_req_connecting............: avg=2.18µs   min=0s      med=0s       max=3.44ms   p(90)=0s       p(95)=0s       p(99.9)=593.28µs
     http_req_duration..............: avg=195.09ms min=6.32ms  med=177.31ms max=708.66ms p(90)=237.29ms p(95)=390.32ms p(99.9)=553.29ms
       { expected_response:true }...: avg=195.09ms min=6.32ms  med=177.31ms max=708.66ms p(90)=237.29ms p(95)=390.32ms p(99.9)=553.29ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30731
     http_req_receiving.............: avg=100.24µs min=31.21µs med=96.15µs  max=11.78ms  p(90)=128.52µs p(95)=141.82µs p(99.9)=562.14µs
     http_req_sending...............: avg=20.98µs  min=5.92µs  med=17.44µs  max=10.4ms   p(90)=22.71µs  p(95)=24.62µs  p(99.9)=612.71µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=194.97ms min=6.18ms  med=177.19ms max=708.57ms p(90)=237.18ms p(95)=390.19ms p(99.9)=553.18ms
     http_reqs......................: 30731   254.20767/s
     iteration_duration.............: avg=195.98ms min=28.61ms med=177.69ms max=708.81ms p(90)=237.73ms p(95)=391.36ms p(99.9)=553.68ms
     iterations.....................: 30631   253.380468/s
     success_rate...................: 100.00% ✓ 30631      ✗ 0    
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

     checks.........................: 100.00% ✓ 90720      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 36 MB   301 kB/s
     http_req_blocked...............: avg=6.62µs   min=1.36µs  med=3.21µs   max=4.18ms   p(90)=4.49µs   p(95)=4.99µs   p(99.9)=1.45ms  
     http_req_connecting............: avg=3.26µs   min=0s      med=0s       max=4.14ms   p(90)=0s       p(95)=0s       p(99.9)=1.42ms  
     http_req_duration..............: avg=197.6ms  min=8.54ms  med=219.26ms max=419.81ms p(90)=274.43ms p(95)=279.69ms p(99.9)=348.47ms
       { expected_response:true }...: avg=197.6ms  min=8.54ms  med=219.26ms max=419.81ms p(90)=274.43ms p(95)=279.69ms p(99.9)=348.47ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 30340
     http_req_receiving.............: avg=130.93µs min=33.86µs med=90.93µs  max=99.74ms  p(90)=122.75µs p(95)=135.54µs p(99.9)=909.43µs
     http_req_sending...............: avg=23.27µs  min=5.6µs   med=16.38µs  max=27.75ms  p(90)=21.01µs  p(95)=22.91µs  p(99.9)=610.43µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=197.45ms min=8.42ms  med=218.56ms max=411.26ms p(90)=274.31ms p(95)=279.57ms p(99.9)=347.61ms
     http_reqs......................: 30340   250.601078/s
     iteration_duration.............: avg=198.51ms min=32.76ms med=223.35ms max=433.57ms p(90)=274.71ms p(95)=279.99ms p(99.9)=351.83ms
     iterations.....................: 30240   249.775102/s
     success_rate...................: 100.00% ✓ 30240      ✗ 0    
     vus............................: 36      min=36       max=50 
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

     checks.........................: 100.00% ✓ 900024      ✗ 0     
     data_received..................: 26 GB   218 MB/s
     data_sent......................: 361 MB  3.0 MB/s
     http_req_blocked...............: avg=5.32µs   min=962ns   med=2.13µs  max=22.48ms  p(90)=3.61µs   p(95)=4.45µs   p(99.9)=33.96µs
     http_req_connecting............: avg=2.61µs   min=0s      med=0s      max=22.42ms  p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=19.75ms  min=1.76ms  med=19.11ms max=299.57ms p(90)=27.46ms  p(95)=30.81ms  p(99.9)=53.09ms
       { expected_response:true }...: avg=19.75ms  min=1.76ms  med=19.11ms max=299.57ms p(90)=27.46ms  p(95)=30.81ms  p(99.9)=53.09ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 300108
     http_req_receiving.............: avg=122.96µs min=28.27µs med=52.51µs max=144.14ms p(90)=104.98µs p(95)=265.92µs p(99.9)=10.83ms
     http_req_sending...............: avg=53.9µs   min=5.11µs  med=9.38µs  max=221.3ms  p(90)=18.12µs  p(95)=123.7µs  p(99.9)=5.56ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=19.57ms  min=1.7ms   med=18.97ms max=291.99ms p(90)=27.25ms  p(95)=30.5ms   p(99.9)=52.06ms
     http_reqs......................: 300108  2496.204761/s
     iteration_duration.............: avg=19.98ms  min=3.43ms  med=19.33ms max=336.88ms p(90)=27.68ms  p(95)=31.07ms  p(99.9)=53.65ms
     iterations.....................: 300008  2495.372992/s
     success_rate...................: 100.00% ✓ 300008      ✗ 0     
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

     checks.........................: 100.00% ✓ 700689      ✗ 0     
     data_received..................: 21 GB   170 MB/s
     data_sent......................: 281 MB  2.3 MB/s
     http_req_blocked...............: avg=3.12µs   min=992ns   med=2.11µs   max=15.65ms  p(90)=3.47µs  p(95)=4.2µs    p(99.9)=37.57µs 
     http_req_connecting............: avg=495ns    min=0s      med=0s       max=4.54ms   p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=25.44ms  min=1.98ms  med=17.39ms  max=497.32ms p(90)=53.86ms p(95)=71.32ms  p(99.9)=188.45ms
       { expected_response:true }...: avg=25.44ms  min=1.98ms  med=17.39ms  max=497.32ms p(90)=53.86ms p(95)=71.32ms  p(99.9)=188.45ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 233663
     http_req_receiving.............: avg=697.43µs min=51.88µs med=104.56µs max=290.96ms p(90)=1.13ms  p(95)=1.82ms   p(99.9)=60.62ms 
     http_req_sending...............: avg=41.14µs  min=5.21µs  med=9.33µs   max=32.88ms  p(90)=17.46µs p(95)=101.46µs p(99.9)=2.64ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s      p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=24.7ms   min=1.88ms  med=16.81ms  max=497.24ms p(90)=52.61ms p(95)=69.93ms  p(99.9)=183.48ms
     http_reqs......................: 233663  1942.934682/s
     iteration_duration.............: avg=25.68ms  min=2.49ms  med=17.61ms  max=497.52ms p(90)=54.1ms  p(95)=71.58ms  p(99.9)=191.6ms 
     iterations.....................: 233563  1942.103171/s
     success_rate...................: 100.00% ✓ 233563      ✗ 0     
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

     checks.........................: 100.00% ✓ 550872      ✗ 0     
     data_received..................: 16 GB   134 MB/s
     data_sent......................: 221 MB  1.8 MB/s
     http_req_blocked...............: avg=3.6µs    min=912ns   med=2.34µs  max=10.72ms  p(90)=4.56µs   p(95)=5.8µs    p(99.9)=47.59µs
     http_req_connecting............: avg=568ns    min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_duration..............: avg=32.4ms   min=2.38ms  med=31.51ms max=319.52ms p(90)=42.94ms  p(95)=47.75ms  p(99.9)=87.41ms
       { expected_response:true }...: avg=32.4ms   min=2.38ms  med=31.51ms max=319.52ms p(90)=42.94ms  p(95)=47.75ms  p(99.9)=87.41ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 183724
     http_req_receiving.............: avg=111.58µs min=30.32µs med=61.78µs max=47.47ms  p(90)=135.78µs p(95)=287.89µs p(99.9)=5.17ms 
     http_req_sending...............: avg=48.73µs  min=5.25µs  med=10.16µs max=203.45ms p(90)=24.26µs  p(95)=136.48µs p(99.9)=3.84ms 
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s     
     http_req_waiting...............: avg=32.24ms  min=2.25ms  med=31.37ms max=307.12ms p(90)=42.74ms  p(95)=47.51ms  p(99.9)=87.09ms
     http_reqs......................: 183724  1527.052748/s
     iteration_duration.............: avg=32.66ms  min=5.87ms  med=31.74ms max=357.88ms p(90)=43.17ms  p(95)=48ms     p(99.9)=88.57ms
     iterations.....................: 183624  1526.221581/s
     success_rate...................: 100.00% ✓ 183624      ✗ 0     
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

     checks.........................: 100.00% ✓ 434208      ✗ 0     
     data_received..................: 13 GB   105 MB/s
     data_sent......................: 174 MB  1.4 MB/s
     http_req_blocked...............: avg=3.49µs  min=1.07µs  med=2.4µs   max=3.94ms   p(90)=3.99µs   p(95)=4.64µs  p(99.9)=34.43µs
     http_req_connecting............: avg=736ns   min=0s      med=0s      max=3.9ms    p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_duration..............: avg=41.2ms  min=2.21ms  med=40.66ms max=327.82ms p(90)=57.82ms  p(95)=62.98ms p(99.9)=89.05ms
       { expected_response:true }...: avg=41.2ms  min=2.21ms  med=40.66ms max=327.82ms p(90)=57.82ms  p(95)=62.98ms p(99.9)=89.05ms
     http_req_failed................: 0.00%   ✓ 0           ✗ 144836
     http_req_receiving.............: avg=86.72µs min=28.67µs med=65.15µs max=91.73ms  p(90)=104.39µs p(95)=123.1µs p(99.9)=2ms    
     http_req_sending...............: avg=27.92µs min=5.26µs  med=11.06µs max=173.98ms p(90)=18.02µs  p(95)=21.7µs  p(99.9)=1.33ms 
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s      p(99.9)=0s     
     http_req_waiting...............: avg=41.09ms min=2.09ms  med=40.56ms max=294.57ms p(90)=57.72ms  p(95)=62.86ms p(99.9)=88.41ms
     http_reqs......................: 144836  1204.103635/s
     iteration_duration.............: avg=41.44ms min=4ms     med=40.88ms max=339.83ms p(90)=58.04ms  p(95)=63.2ms  p(99.9)=89.7ms 
     iterations.....................: 144736  1203.272278/s
     success_rate...................: 100.00% ✓ 144736      ✗ 0     
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

     checks.........................: 100.00% ✓ 187395     ✗ 0    
     data_received..................: 5.5 GB  45 MB/s
     data_sent......................: 75 MB   623 kB/s
     http_req_blocked...............: avg=5.26µs  min=1.15µs  med=3.23µs  max=4.23ms   p(90)=4.78µs   p(95)=5.41µs   p(99.9)=48.7µs  
     http_req_connecting............: avg=1.76µs  min=0s      med=0s      max=4.18ms   p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_duration..............: avg=95.66ms min=4.46ms  med=92.97ms max=343.05ms p(90)=115.05ms p(95)=127.54ms p(99.9)=217.93ms
       { expected_response:true }...: avg=95.66ms min=4.46ms  med=92.97ms max=343.05ms p(90)=115.05ms p(95)=127.54ms p(99.9)=217.93ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 62565
     http_req_receiving.............: avg=93.16µs min=31.59µs med=83.05µs max=152.36ms p(90)=117.33µs p(95)=130.35µs p(99.9)=884.91µs
     http_req_sending...............: avg=21.41µs min=5.56µs  med=14.97µs max=50.76ms  p(90)=21.48µs  p(95)=23.62µs  p(99.9)=666.11µs
     http_req_tls_handshaking.......: avg=0s      min=0s      med=0s      max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=95.54ms min=4.33ms  med=92.86ms max=342.86ms p(90)=114.94ms p(95)=127.4ms  p(99.9)=217.65ms
     http_reqs......................: 62565   518.771249/s
     iteration_duration.............: avg=96.07ms min=25.01ms med=93.21ms max=379.28ms p(90)=115.32ms p(95)=127.84ms p(99.9)=219.39ms
     iterations.....................: 62465   517.942078/s
     success_rate...................: 100.00% ✓ 62465      ✗ 0    
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

     checks.........................: 100.00% ✓ 139536     ✗ 0    
     data_received..................: 4.1 GB  34 MB/s
     data_sent......................: 56 MB   464 kB/s
     http_req_blocked...............: avg=5.51µs   min=1.13µs  med=3.47µs   max=4.14ms   p(90)=4.91µs   p(95)=5.48µs   p(99.9)=170.05µs
     http_req_connecting............: avg=1.86µs   min=0s      med=0s       max=4.09ms   p(90)=0s       p(95)=0s       p(99.9)=116.62µs
     http_req_duration..............: avg=128.49ms min=5.91ms  med=125.88ms max=328.78ms p(90)=169.74ms p(95)=183.17ms p(99.9)=234.48ms
       { expected_response:true }...: avg=128.49ms min=5.91ms  med=125.88ms max=328.78ms p(90)=169.74ms p(95)=183.17ms p(99.9)=234.48ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 46612
     http_req_receiving.............: avg=93.41µs  min=31.61µs med=87.74µs  max=36.93ms  p(90)=119.18µs p(95)=131.71µs p(99.9)=737.56µs
     http_req_sending...............: avg=25.6µs   min=6.05µs  med=17.06µs  max=158.38ms p(90)=22.34µs  p(95)=24.16µs  p(99.9)=641.36µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=128.38ms min=5.77ms  med=125.77ms max=328.21ms p(90)=169.63ms p(95)=183.04ms p(99.9)=234.36ms
     http_reqs......................: 46612   386.005222/s
     iteration_duration.............: avg=129.04ms min=36.73ms med=126.22ms max=348.29ms p(90)=170.07ms p(95)=183.51ms p(99.9)=237.12ms
     iterations.....................: 46512   385.177098/s
     success_rate...................: 100.00% ✓ 46512      ✗ 0    
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

     checks.........................: 100.00% ✓ 91524      ✗ 0    
     data_received..................: 2.7 GB  22 MB/s
     data_sent......................: 37 MB   304 kB/s
     http_req_blocked...............: avg=12.68µs  min=1.23µs  med=3.58µs   max=11.83ms  p(90)=5.1µs    p(95)=5.7µs    p(99.9)=3.86ms  
     http_req_connecting............: avg=8.7µs    min=0s      med=0s       max=11.68ms  p(90)=0s       p(95)=0s       p(99.9)=3.74ms  
     http_req_duration..............: avg=195.84ms min=6.57ms  med=179.51ms max=850.25ms p(90)=228.66ms p(95)=329.81ms p(99.9)=557.6ms 
       { expected_response:true }...: avg=195.84ms min=6.57ms  med=179.51ms max=850.25ms p(90)=228.66ms p(95)=329.81ms p(99.9)=557.6ms 
     http_req_failed................: 0.00%   ✓ 0          ✗ 30608
     http_req_receiving.............: avg=148.81µs min=33.37µs med=98.87µs  max=220.05ms p(90)=131.78µs p(95)=145.61µs p(99.9)=884.42µs
     http_req_sending...............: avg=30.05µs  min=6.16µs  med=18.5µs   max=91.11ms  p(90)=23.36µs  p(95)=25.07µs  p(99.9)=1.25ms  
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=195.66ms min=6.42ms  med=179.36ms max=850.12ms p(90)=228.44ms p(95)=327.62ms p(99.9)=557.48ms
     http_reqs......................: 30608   252.953568/s
     iteration_duration.............: avg=196.78ms min=53.29ms med=179.86ms max=850.5ms  p(90)=229.13ms p(95)=345.39ms p(99.9)=558.14ms
     iterations.....................: 30508   252.127138/s
     success_rate...................: 100.00% ✓ 30508      ✗ 0    
     vus............................: 10      min=10       max=50 
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

     checks.........................: 100.00% ✓ 83319      ✗ 0    
     data_received..................: 2.4 GB  20 MB/s
     data_sent......................: 34 MB   276 kB/s
     http_req_blocked...............: avg=6.77µs   min=1.26µs  med=3.44µs   max=4.03ms   p(90)=4.81µs   p(95)=5.38µs   p(99.9)=1.41ms  
     http_req_connecting............: avg=3.14µs   min=0s      med=0s       max=4ms      p(90)=0s       p(95)=0s       p(99.9)=1.38ms  
     http_req_duration..............: avg=215.2ms  min=9.01ms  med=167.9ms  max=575.75ms p(90)=400.61ms p(95)=424.32ms p(99.9)=512.76ms
       { expected_response:true }...: avg=215.2ms  min=9.01ms  med=167.9ms  max=575.75ms p(90)=400.61ms p(95)=424.32ms p(99.9)=512.76ms
     http_req_failed................: 0.00%   ✓ 0          ✗ 27873
     http_req_receiving.............: avg=98.13µs  min=34.93µs med=93.55µs  max=8.97ms   p(90)=125.47µs p(95)=138.74µs p(99.9)=533.72µs
     http_req_sending...............: avg=23.44µs  min=6.09µs  med=17.34µs  max=23.81ms  p(90)=22.21µs  p(95)=24.03µs  p(99.9)=574.96µs
     http_req_tls_handshaking.......: avg=0s       min=0s      med=0s       max=0s       p(90)=0s       p(95)=0s       p(99.9)=0s      
     http_req_waiting...............: avg=215.08ms min=8.87ms  med=167.79ms max=575.66ms p(90)=400.42ms p(95)=424.23ms p(99.9)=512.64ms
     http_reqs......................: 27873   229.948759/s
     iteration_duration.............: avg=216.21ms min=51.31ms med=168.25ms max=576ms    p(90)=401.12ms p(95)=424.69ms p(99.9)=513.04ms
     iterations.....................: 27773   229.123771/s
     success_rate...................: 100.00% ✓ 27773      ✗ 0    
     vus............................: 50      min=0        max=50 
     vus_max........................: 50      min=50       max=50
```


  **Performance Overview**


  **no-image-available**



  **HTTP Overview**


  **no-image-available**


</details>

### Footnotes

- Benchmark hardware #1: host=ccbench1, os=Linux 5.15.0-179-generic, cpu=AMD Ryzen 7 5700G with Radeon Graphics, cores=16 logical (16 CPUs), ram=122 GB

